with pvs as (
  select
    date(date) as d
    ,page_title
    ,page_location
    ,count(1) as pv
  from
    `analytics_249693159.flat_events_*`
  where
    event_name = 'page_view'
  and
    _table_suffix between
      format_date('%Y%m%d',date_add(current_date("Asia/Tokyo"),interval -30 day))    
    and
      format_date('%Y%m%d',date_add(current_date("Asia/Tokyo"),interval -1 day))
  group by d, page_title, page_location
)

select * from pvs