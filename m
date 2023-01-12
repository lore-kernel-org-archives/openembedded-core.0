Return-Path: <wonsang.ryu@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7117BC54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 05:01:15 +0000 (UTC)
Subject: Re: [langdale][kirkstone][PATCH] go-mod.bbclass: Allow network in do_compile
To: openembedded-core@lists.openembedded.org
From: wonsang.ryu@lge.com
X-Originating-Location: Suwon, Gyeonggi-do, KR (27.122.242.91)
X-Originating-Platform: Windows Chrome 108
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Jan 2023 21:01:10 -0800
References: <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
In-Reply-To: <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
Message-ID: <2751.1673499670296087422@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="78x2A0prd2nAuR5LsJnz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 05:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175786

--78x2A0prd2nAuR5LsJnz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I also tested using telegraf v1.21.4.
Kirkstone uses go1.17, so I tested this version.
Unfortunately, it failed with the following log.
Did I have something mistakes?

~$ recipetool create -S 583ee20a093acaa0781508b7840deb97a0fda622 -B release=
-1.21 https://github.com/influxdata/telegraf.git

Initialising tasks: 100% |#################################################=
###############################################| Time: 0:00:00
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0%=
 complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun a=
nd all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Resolved download path for import 'cloud.google.com/go/bigquery' =3D>=
 https://github.com/googleapis/google-cloud-go
INFO: Resolved download path for import 'cloud.google.com/go/monitoring' =
=3D> https://github.com/googleapis/google-cloud-go
INFO: Resolved download path for import 'cloud.google.com/go/pubsub' =3D> h=
ttps://github.com/googleapis/google-cloud-go
INFO: Resolved download path for import 'collectd.org' =3D> https://github.=
com/collectd/go-collectd
INFO: Resolved download path for import 'github.com/Azure/azure-event-hubs-=
go/v3' =3D> https://github.com/Azure/azure-event-hubs-go
INFO: Resolved download path for import 'github.com/Azure/azure-kusto-go' =
=3D> https://github.com/Azure/azure-kusto-go
INFO: Resolved download path for import 'github.com/Azure/azure-storage-que=
ue-go' =3D> https://github.com/Azure/azure-storage-queue-go
INFO: Resolved download path for import 'github.com/Azure/go-autorest/autor=
est' =3D> https://github.com/Azure/go-autorest
INFO: Resolved download path for import 'github.com/Azure/go-autorest/autor=
est/adal' =3D> https://github.com/Azure/go-autorest
INFO: Resolved download path for import 'github.com/Azure/go-autorest/autor=
est/azure/auth' =3D> https://github.com/Azure/go-autorest
INFO: Resolved download path for import 'github.com/BurntSushi/toml' =3D> h=
ttps://github.com/BurntSushi/toml
INFO: Resolved download path for import 'github.com/Mellanox/rdmamap' =3D> =
https://github.com/Mellanox/rdmamap
INFO: Resolved download path for import 'github.com/Shopify/sarama' =3D> ht=
tps://github.com/Shopify/sarama
INFO: Resolved download path for import 'github.com/aerospike/aerospike-cli=
ent-go' =3D> https://github.com/aerospike/aerospike-client-go
INFO: Resolved download path for import 'github.com/alecthomas/units' =3D> =
https://github.com/alecthomas/units
INFO: Resolved download path for import 'github.com/aliyun/alibaba-cloud-sd=
k-go' =3D> https://github.com/aliyun/alibaba-cloud-sdk-go
INFO: Resolved download path for import 'github.com/amir/raidman' =3D> http=
s://github.com/amir/raidman
INFO: Resolved download path for import 'github.com/antchfx/jsonquery' =3D>=
 https://github.com/antchfx/jsonquery
INFO: Resolved download path for import 'github.com/antchfx/xmlquery' =3D> =
https://github.com/antchfx/xmlquery
INFO: Resolved download path for import 'github.com/antchfx/xpath' =3D> htt=
ps://github.com/antchfx/xpath
INFO: Resolved download path for import 'github.com/apache/thrift' =3D> htt=
ps://github.com/apache/thrift
INFO: Resolved download path for import 'github.com/aristanetworks/goarista=
' =3D> https://github.com/aristanetworks/goarista
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2' =3D>=
 https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/confi=
g' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/crede=
ntials' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/featu=
re/ec2/imds' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/servi=
ce/cloudwatch' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/servi=
ce/cloudwatchlogs' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/servi=
ce/dynamodb' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/servi=
ce/ec2' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/servi=
ce/kinesis' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/servi=
ce/sts' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/servi=
ce/timestreamwrite' =3D> https://github.com/aws/aws-sdk-go-v2
INFO: Resolved download path for import 'github.com/aws/smithy-go' =3D> htt=
ps://github.com/aws/smithy-go
INFO: Resolved download path for import 'github.com/benbjohnson/clock' =3D>=
 https://github.com/benbjohnson/clock
INFO: Resolved download path for import 'github.com/bmatcuk/doublestar/v3' =
=3D> https://github.com/bmatcuk/doublestar
INFO: Resolved download path for import 'github.com/caio/go-tdigest' =3D> h=
ttps://github.com/caio/go-tdigest
INFO: Resolved download path for import 'github.com/cisco-ie/nx-telemetry-p=
roto' =3D> https://github.com/cisco-ie/nx-telemetry-proto
INFO: Resolved download path for import 'github.com/coreos/go-semver' =3D> =
https://github.com/coreos/go-semver
INFO: Resolved download path for import 'github.com/couchbase/go-couchbase'=
 =3D> https://github.com/couchbase/go-couchbase
INFO: Resolved download path for import 'github.com/denisenkom/go-mssqldb' =
=3D> https://github.com/denisenkom/go-mssqldb
INFO: Resolved download path for import 'github.com/dimchansky/utfbom' =3D>=
 https://github.com/dimchansky/utfbom
INFO: Resolved download path for import 'github.com/djherbis/times' =3D> ht=
tps://github.com/djherbis/times
INFO: Resolved download path for import 'github.com/docker/docker' =3D> htt=
ps://github.com/docker/docker
INFO: Resolved download path for import 'github.com/doclambda/protobufquery=
' =3D> https://github.com/doclambda/protobufquery
INFO: Resolved download path for import 'github.com/dynatrace-oss/dynatrace=
-metric-utils-go' =3D> https://github.com/dynatrace-oss/dynatrace-metric-ut=
ils-go
INFO: Resolved download path for import 'github.com/eclipse/paho.mqtt.golan=
g' =3D> https://github.com/eclipse/paho.mqtt.golang
INFO: Resolved download path for import 'github.com/fatih/color' =3D> https=
://github.com/fatih/color
INFO: Resolved download path for import 'github.com/ghodss/yaml' =3D> https=
://github.com/ghodss/yaml
INFO: Resolved download path for import 'github.com/go-ldap/ldap/v3' =3D> h=
ttps://github.com/go-ldap/ldap
INFO: Resolved download path for import 'github.com/go-logfmt/logfmt' =3D> =
https://github.com/go-logfmt/logfmt
INFO: Resolved download path for import 'github.com/go-ping/ping' =3D> http=
s://github.com/go-ping/ping
INFO: Resolved download path for import 'github.com/go-redis/redis' =3D> ht=
tps://github.com/go-redis/redis
INFO: Resolved download path for import 'github.com/go-sql-driver/mysql' =
=3D> https://github.com/go-sql-driver/mysql
INFO: Resolved download path for import 'github.com/gobwas/glob' =3D> https=
://github.com/gobwas/glob
INFO: Resolved download path for import 'github.com/gofrs/uuid' =3D> https:=
//github.com/gofrs/uuid
INFO: Resolved download path for import 'github.com/golang-jwt/jwt/v4' =3D>=
 https://github.com/golang-jwt/jwt
INFO: Resolved download path for import 'github.com/golang/geo' =3D> https:=
//github.com/golang/geo
INFO: Resolved download path for import 'github.com/golang/snappy' =3D> htt=
ps://github.com/golang/snappy
INFO: Resolved download path for import 'github.com/google/go-cmp' =3D> htt=
ps://github.com/google/go-cmp
INFO: Resolved download path for import 'github.com/google/go-github/v32' =
=3D> https://github.com/google/go-github
INFO: Resolved download path for import 'github.com/gopcua/opcua' =3D> http=
s://github.com/gopcua/opcua
INFO: Resolved download path for import 'github.com/gophercloud/gophercloud=
' =3D> https://github.com/gophercloud/gophercloud
INFO: Resolved download path for import 'github.com/gorilla/mux' =3D> https=
://github.com/gorilla/mux
INFO: Resolved download path for import 'github.com/gorilla/websocket' =3D>=
 https://github.com/gorilla/websocket
INFO: Resolved download path for import 'github.com/gosnmp/gosnmp' =3D> htt=
ps://github.com/gosnmp/gosnmp
INFO: Resolved download path for import 'github.com/grid-x/modbus' =3D> htt=
ps://github.com/grid-x/modbus
INFO: Resolved download path for import 'github.com/gwos/tcg/sdk' =3D> http=
s://github.com/gwos/tcg
INFO: Resolved download path for import 'github.com/harlow/kinesis-consumer=
' =3D> https://github.com/harlow/kinesis-consumer
INFO: Resolved download path for import 'github.com/hashicorp/consul/api' =
=3D> https://github.com/hashicorp/consul
INFO: Resolved download path for import 'github.com/hashicorp/go-uuid' =3D>=
 https://github.com/hashicorp/go-uuid
INFO: Resolved download path for import 'github.com/influxdata/go-syslog/v3=
' =3D> https://github.com/influxdata/go-syslog
INFO: Resolved download path for import 'github.com/influxdata/influxdb-obs=
ervability/common' =3D> https://github.com/influxdata/influxdb-observabilit=
y
INFO: Resolved download path for import 'github.com/influxdata/influxdb-obs=
ervability/influx2otel' =3D> https://github.com/influxdata/influxdb-observa=
bility
INFO: Resolved download path for import 'github.com/influxdata/influxdb-obs=
ervability/otel2influx' =3D> https://github.com/influxdata/influxdb-observa=
bility
INFO: Resolved download path for import 'github.com/influxdata/tail' =3D> h=
ttps://github.com/influxdata/tail
INFO: Resolved download path for import 'github.com/influxdata/toml' =3D> h=
ttps://github.com/influxdata/toml
INFO: Resolved download path for import 'github.com/influxdata/wlog' =3D> h=
ttps://github.com/influxdata/wlog
INFO: Resolved download path for import 'github.com/intel/iaevents' =3D> ht=
tps://github.com/intel/iaevents
INFO: Resolved download path for import 'github.com/jackc/pgx/v4' =3D> http=
s://github.com/jackc/pgx
INFO: Resolved download path for import 'github.com/james4k/rcon' =3D> http=
s://github.com/james4k/rcon
INFO: Resolved download path for import 'github.com/jhump/protoreflect' =3D=
> https://github.com/jhump/protoreflect
INFO: Resolved download path for import 'github.com/jmespath/go-jmespath' =
=3D> https://github.com/jmespath/go-jmespath
INFO: Resolved download path for import 'github.com/kardianos/service' =3D>=
 https://github.com/kardianos/service
INFO: Resolved download path for import 'github.com/karrick/godirwalk' =3D>=
 https://github.com/karrick/godirwalk
INFO: Resolved download path for import 'github.com/kballard/go-shellquote'=
 =3D> https://github.com/kballard/go-shellquote
INFO: Resolved download path for import 'github.com/matttproud/golang_proto=
buf_extensions' =3D> https://github.com/matttproud/golang_protobuf_extensio=
ns
INFO: Resolved download path for import 'github.com/mdlayher/apcupsd' =3D> =
https://github.com/mdlayher/apcupsd
INFO: Resolved download path for import 'github.com/microsoft/ApplicationIn=
sights-Go' =3D> https://github.com/microsoft/ApplicationInsights-Go
INFO: Resolved download path for import 'github.com/miekg/dns' =3D> https:/=
/github.com/miekg/dns
INFO: Resolved download path for import 'github.com/moby/ipvs' =3D> https:/=
/github.com/moby/ipvs
INFO: Resolved download path for import 'github.com/multiplay/go-ts3' =3D> =
https://github.com/multiplay/go-ts3
INFO: Resolved download path for import 'github.com/nats-io/nats-server/v2'=
 =3D> https://github.com/nats-io/nats-server
INFO: Resolved download path for import 'github.com/nats-io/nats.go' =3D> h=
ttps://github.com/nats-io/nats.go
INFO: Resolved download path for import 'github.com/newrelic/newrelic-telem=
etry-sdk-go' =3D> https://github.com/newrelic/newrelic-telemetry-sdk-go
INFO: Resolved download path for import 'github.com/nsqio/go-nsq' =3D> http=
s://github.com/nsqio/go-nsq
INFO: Resolved download path for import 'github.com/olivere/elastic' =3D> h=
ttps://github.com/olivere/elastic
INFO: Resolved download path for import 'github.com/openconfig/gnmi' =3D> h=
ttps://github.com/openconfig/gnmi
INFO: Resolved download path for import 'github.com/opentracing/opentracing=
-go' =3D> https://github.com/opentracing/opentracing-go
INFO: Resolved download path for import 'github.com/openzipkin-contrib/zipk=
in-go-opentracing' =3D> https://github.com/openzipkin-contrib/zipkin-go-ope=
ntracing
INFO: Resolved download path for import 'github.com/openzipkin/zipkin-go' =
=3D> https://github.com/openzipkin/zipkin-go
INFO: Resolved download path for import 'github.com/pion/dtls/v2' =3D> http=
s://github.com/pion/dtls
INFO: Resolved download path for import 'github.com/pkg/errors' =3D> https:=
//github.com/pkg/errors
INFO: Resolved download path for import 'github.com/prometheus/client_golan=
g' =3D> https://github.com/prometheus/client_golang
INFO: Resolved download path for import 'github.com/prometheus/client_model=
' =3D> https://github.com/prometheus/client_model
INFO: Resolved download path for import 'github.com/prometheus/common' =3D>=
 https://github.com/prometheus/common
INFO: Resolved download path for import 'github.com/prometheus/procfs' =3D>=
 https://github.com/prometheus/procfs
INFO: Resolved download path for import 'github.com/prometheus/prometheus' =
=3D> https://github.com/prometheus/prometheus
INFO: Resolved download path for import 'github.com/riemann/riemann-go-clie=
nt' =3D> https://github.com/riemann/riemann-go-client
INFO: Resolved download path for import 'github.com/safchain/ethtool' =3D> =
https://github.com/safchain/ethtool
INFO: Resolved download path for import 'github.com/sensu/sensu-go/api/core=
/v2' =3D> https://github.com/sensu/sensu-go
INFO: Resolved download path for import 'github.com/shirou/gopsutil/v3' =3D=
> https://github.com/shirou/gopsutil
INFO: Resolved download path for import 'github.com/showwin/speedtest-go' =
=3D> https://github.com/showwin/speedtest-go
INFO: Resolved download path for import 'github.com/signalfx/golib/v3' =3D>=
 https://github.com/signalfx/golib
INFO: Resolved download path for import 'github.com/sirupsen/logrus' =3D> h=
ttps://github.com/sirupsen/logrus
INFO: Resolved download path for import 'github.com/sleepinggenius2/gosmi' =
=3D> https://github.com/sleepinggenius2/gosmi
INFO: Resolved download path for import 'github.com/snowflakedb/gosnowflake=
' =3D> https://github.com/snowflakedb/gosnowflake
INFO: Resolved download path for import 'github.com/streadway/amqp' =3D> ht=
tps://github.com/streadway/amqp
INFO: Resolved download path for import 'github.com/stretchr/testify' =3D> =
https://github.com/stretchr/testify
INFO: Resolved download path for import 'github.com/tbrandon/mbserver' =3D>=
 https://github.com/tbrandon/mbserver
INFO: Resolved download path for import 'github.com/testcontainers/testcont=
ainers-go' =3D> https://github.com/testcontainers/testcontainers-go
INFO: Resolved download path for import 'github.com/tidwall/gjson' =3D> htt=
ps://github.com/tidwall/gjson
INFO: Resolved download path for import 'github.com/tinylib/msgp' =3D> http=
s://github.com/tinylib/msgp
INFO: Resolved download path for import 'github.com/vapourismo/knx-go' =3D>=
 https://github.com/vapourismo/knx-go
INFO: Resolved download path for import 'github.com/vjeantet/grok' =3D> htt=
ps://github.com/vjeantet/grok
INFO: Resolved download path for import 'github.com/vmware/govmomi' =3D> ht=
tps://github.com/vmware/govmomi
INFO: Resolved download path for import 'github.com/wavefronthq/wavefront-s=
dk-go' =3D> https://github.com/wavefronthq/wavefront-sdk-go
INFO: Resolved download path for import 'github.com/wvanbergen/kafka' =3D> =
https://github.com/wvanbergen/kafka
INFO: Resolved download path for import 'github.com/xdg/scram' =3D> https:/=
/github.com/xdg/scram
INFO: Resolved download path for import 'go.mongodb.org/mongo-driver' =3D> =
https://github.com/mongodb/mongo-go-driver.git
INFO: Resolved download path for import 'go.opentelemetry.io/collector/mode=
l' =3D> https://github.com/open-telemetry/opentelemetry-collector
INFO: Resolved download path for import 'go.opentelemetry.io/otel/exporters=
/otlp/otlpmetric/otlpmetricgrpc' =3D> https://github.com/open-telemetry/ope=
ntelemetry-go
INFO: Resolved download path for import 'go.opentelemetry.io/otel/metric' =
=3D> https://github.com/open-telemetry/opentelemetry-go
INFO: Resolved download path for import 'go.opentelemetry.io/otel/sdk/metri=
c' =3D> https://github.com/open-telemetry/opentelemetry-go
INFO: Resolved download path for import 'go.starlark.net' =3D> https://gith=
ub.com/google/starlark-go
INFO: Resolved download path for import 'golang.org/x/net' =3D> https://go.=
googlesource.com/net
INFO: Resolved download path for import 'golang.org/x/oauth2' =3D> https://=
go.googlesource.com/oauth2
INFO: Resolved download path for import 'golang.org/x/sync' =3D> https://go=
.googlesource.com/sync
INFO: Resolved download path for import 'golang.org/x/sys' =3D> https://go.=
googlesource.com/sys
INFO: Resolved download path for import 'golang.org/x/text' =3D> https://go=
.googlesource.com/text
INFO: Resolved download path for import 'golang.zx2c4.com/wireguard/wgctrl'=
 =3D> https://github.com/WireGuard/wgctrl-go
INFO: Resolved download path for import 'google.golang.org/api' =3D> https:=
//github.com/googleapis/google-api-go-client
INFO: Resolved download path for import 'google.golang.org/genproto' =3D> h=
ttps://github.com/googleapis/go-genproto
INFO: Resolved download path for import 'google.golang.org/grpc' =3D> https=
://github.com/grpc/grpc-go
INFO: Resolved download path for import 'google.golang.org/protobuf' =3D> h=
ttps://go.googlesource.com/protobuf
INFO: Resolved download path for import 'gopkg.in/gorethink/gorethink.v3' =
=3D> https://gopkg.in/gorethink/gorethink.v3
INFO: Resolved download path for import 'gopkg.in/olivere/elastic.v5' =3D> =
https://gopkg.in/olivere/elastic.v5
INFO: Resolved download path for import 'gopkg.in/tomb.v1' =3D> https://gop=
kg.in/tomb.v1
INFO: Resolved download path for import 'gopkg.in/yaml.v2' =3D> https://gop=
kg.in/yaml.v2
INFO: Resolved download path for import 'k8s.io/api' =3D> https://github.co=
m/kubernetes/api
INFO: Resolved download path for import 'k8s.io/apimachinery' =3D> https://=
github.com/kubernetes/apimachinery
INFO: Resolved download path for import 'k8s.io/client-go' =3D> https://git=
hub.com/kubernetes/client-go
INFO: Resolved download path for import 'modernc.org/sqlite' =3D> https://g=
itlab.com/cznic/sqlite
INFO: Resolved download path for import 'cloud.google.com/go' =3D> https://=
github.com/googleapis/google-cloud-go
INFO: Resolved download path for import 'cloud.google.com/go/compute' =3D> =
https://github.com/googleapis/google-cloud-go
INFO: Resolved download path for import 'cloud.google.com/go/iam' =3D> http=
s://github.com/googleapis/google-cloud-go
Traceback (most recent call last):
File "/oe-core/scripts/recipetool", line 111, in <module>
ret =3D main()
File "/oe-core/scripts/recipetool", line 100, in main
ret =3D args.func(args)
File "/oe-core/scripts/lib/recipetool/create.py", line 746, in create_recip=
e
handler.process(srctree_use, classes, lines_before, lines_after, handled, e=
xtravalues)
File "/oe-core/scripts/lib/recipetool/create_go.py", line 336, in process
dep_src_uris, src_revs =3D self._handle_dependencies(d, srctree, go_mod)
File "/oe-core/scripts/lib/recipetool/create_go.py", line 261, in _handle_d=
ependencies
repodata =3D self._resolve_repository(module_path)
File "/oe-core/scripts/lib/recipetool/create_go.py", line 184, in _resolve_=
repository
repodata =3D self._resolve_repository_dynamic(modulepath)
File "/oe-core/scripts/lib/recipetool/create_go.py", line 176, in _resolve_=
repository_dynamic
return GoImport(parser.rootpath, parser.vcs, parser.repourl, None)
File "/oe-core/scripts/lib/recipetool/create_go.py", line 151, in rootpath
return self.__srv[0]
IndexError: list index out of range

--78x2A0prd2nAuR5LsJnz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>I also tested using telegraf v1.21.4.</div>
<div>Kirkstone uses go1.17, so I tested this version.</div>
<div>Unfortunately, it failed with the following log.</div>
<div>Did I have something mistakes?</div>
</div>
<div><br /><br />
<div>~$ recipetool create -S 583ee20a093acaa0781508b7840deb97a0fda622 -B re=
lease-1.21 https://github.com/influxdata/telegraf.git</div>
<div>&nbsp;</div>
<div>Initialising tasks: 100% |############################################=
####################################################| Time: 0:00:00</div>
<div>Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% matc=
h, 0% complete)</div>
<div>NOTE: No setscene tasks</div>
<div>NOTE: Executing Tasks</div>
<div>NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be re=
run and all succeeded.</div>
<div>NOTE: Writing buildhistory</div>
<div>NOTE: Writing buildhistory took: 4 seconds</div>
<div>INFO: Resolved download path for import 'cloud.google.com/go/bigquery'=
 =3D&gt; https://github.com/googleapis/google-cloud-go</div>
<div>INFO: Resolved download path for import 'cloud.google.com/go/monitorin=
g' =3D&gt; https://github.com/googleapis/google-cloud-go</div>
<div>INFO: Resolved download path for import 'cloud.google.com/go/pubsub' =
=3D&gt; https://github.com/googleapis/google-cloud-go</div>
<div>INFO: Resolved download path for import 'collectd.org' =3D&gt; https:/=
/github.com/collectd/go-collectd</div>
<div>INFO: Resolved download path for import 'github.com/Azure/azure-event-=
hubs-go/v3' =3D&gt; https://github.com/Azure/azure-event-hubs-go</div>
<div>INFO: Resolved download path for import 'github.com/Azure/azure-kusto-=
go' =3D&gt; https://github.com/Azure/azure-kusto-go</div>
<div>INFO: Resolved download path for import 'github.com/Azure/azure-storag=
e-queue-go' =3D&gt; https://github.com/Azure/azure-storage-queue-go</div>
<div>INFO: Resolved download path for import 'github.com/Azure/go-autorest/=
autorest' =3D&gt; https://github.com/Azure/go-autorest</div>
<div>INFO: Resolved download path for import 'github.com/Azure/go-autorest/=
autorest/adal' =3D&gt; https://github.com/Azure/go-autorest</div>
<div>INFO: Resolved download path for import 'github.com/Azure/go-autorest/=
autorest/azure/auth' =3D&gt; https://github.com/Azure/go-autorest</div>
<div>INFO: Resolved download path for import 'github.com/BurntSushi/toml' =
=3D&gt; https://github.com/BurntSushi/toml</div>
<div>INFO: Resolved download path for import 'github.com/Mellanox/rdmamap' =
=3D&gt; https://github.com/Mellanox/rdmamap</div>
<div>INFO: Resolved download path for import 'github.com/Shopify/sarama' =
=3D&gt; https://github.com/Shopify/sarama</div>
<div>INFO: Resolved download path for import 'github.com/aerospike/aerospik=
e-client-go' =3D&gt; https://github.com/aerospike/aerospike-client-go</div>
<div>INFO: Resolved download path for import 'github.com/alecthomas/units' =
=3D&gt; https://github.com/alecthomas/units</div>
<div>INFO: Resolved download path for import 'github.com/aliyun/alibaba-clo=
ud-sdk-go' =3D&gt; https://github.com/aliyun/alibaba-cloud-sdk-go</div>
<div>INFO: Resolved download path for import 'github.com/amir/raidman' =3D&=
gt; https://github.com/amir/raidman</div>
<div>INFO: Resolved download path for import 'github.com/antchfx/jsonquery'=
 =3D&gt; https://github.com/antchfx/jsonquery</div>
<div>INFO: Resolved download path for import 'github.com/antchfx/xmlquery' =
=3D&gt; https://github.com/antchfx/xmlquery</div>
<div>INFO: Resolved download path for import 'github.com/antchfx/xpath' =3D=
&gt; https://github.com/antchfx/xpath</div>
<div>INFO: Resolved download path for import 'github.com/apache/thrift' =3D=
&gt; https://github.com/apache/thrift</div>
<div>INFO: Resolved download path for import 'github.com/aristanetworks/goa=
rista' =3D&gt; https://github.com/aristanetworks/goarista</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2'=
 =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
config' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
credentials' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
feature/ec2/imds' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
service/cloudwatch' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
service/cloudwatchlogs' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
service/dynamodb' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
service/ec2' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
service/kinesis' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
service/sts' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/aws-sdk-go-v2/=
service/timestreamwrite' =3D&gt; https://github.com/aws/aws-sdk-go-v2</div>
<div>INFO: Resolved download path for import 'github.com/aws/smithy-go' =3D=
&gt; https://github.com/aws/smithy-go</div>
<div>INFO: Resolved download path for import 'github.com/benbjohnson/clock'=
 =3D&gt; https://github.com/benbjohnson/clock</div>
<div>INFO: Resolved download path for import 'github.com/bmatcuk/doublestar=
/v3' =3D&gt; https://github.com/bmatcuk/doublestar</div>
<div>INFO: Resolved download path for import 'github.com/caio/go-tdigest' =
=3D&gt; https://github.com/caio/go-tdigest</div>
<div>INFO: Resolved download path for import 'github.com/cisco-ie/nx-teleme=
try-proto' =3D&gt; https://github.com/cisco-ie/nx-telemetry-proto</div>
<div>INFO: Resolved download path for import 'github.com/coreos/go-semver' =
=3D&gt; https://github.com/coreos/go-semver</div>
<div>INFO: Resolved download path for import 'github.com/couchbase/go-couch=
base' =3D&gt; https://github.com/couchbase/go-couchbase</div>
<div>INFO: Resolved download path for import 'github.com/denisenkom/go-mssq=
ldb' =3D&gt; https://github.com/denisenkom/go-mssqldb</div>
<div>INFO: Resolved download path for import 'github.com/dimchansky/utfbom'=
 =3D&gt; https://github.com/dimchansky/utfbom</div>
<div>INFO: Resolved download path for import 'github.com/djherbis/times' =
=3D&gt; https://github.com/djherbis/times</div>
<div>INFO: Resolved download path for import 'github.com/docker/docker' =3D=
&gt; https://github.com/docker/docker</div>
<div>INFO: Resolved download path for import 'github.com/doclambda/protobuf=
query' =3D&gt; https://github.com/doclambda/protobufquery</div>
<div>INFO: Resolved download path for import 'github.com/dynatrace-oss/dyna=
trace-metric-utils-go' =3D&gt; https://github.com/dynatrace-oss/dynatrace-m=
etric-utils-go</div>
<div>INFO: Resolved download path for import 'github.com/eclipse/paho.mqtt.=
golang' =3D&gt; https://github.com/eclipse/paho.mqtt.golang</div>
<div>INFO: Resolved download path for import 'github.com/fatih/color' =3D&g=
t; https://github.com/fatih/color</div>
<div>INFO: Resolved download path for import 'github.com/ghodss/yaml' =3D&g=
t; https://github.com/ghodss/yaml</div>
<div>INFO: Resolved download path for import 'github.com/go-ldap/ldap/v3' =
=3D&gt; https://github.com/go-ldap/ldap</div>
<div>INFO: Resolved download path for import 'github.com/go-logfmt/logfmt' =
=3D&gt; https://github.com/go-logfmt/logfmt</div>
<div>INFO: Resolved download path for import 'github.com/go-ping/ping' =3D&=
gt; https://github.com/go-ping/ping</div>
<div>INFO: Resolved download path for import 'github.com/go-redis/redis' =
=3D&gt; https://github.com/go-redis/redis</div>
<div>INFO: Resolved download path for import 'github.com/go-sql-driver/mysq=
l' =3D&gt; https://github.com/go-sql-driver/mysql</div>
<div>INFO: Resolved download path for import 'github.com/gobwas/glob' =3D&g=
t; https://github.com/gobwas/glob</div>
<div>INFO: Resolved download path for import 'github.com/gofrs/uuid' =3D&gt=
; https://github.com/gofrs/uuid</div>
<div>INFO: Resolved download path for import 'github.com/golang-jwt/jwt/v4'=
 =3D&gt; https://github.com/golang-jwt/jwt</div>
<div>INFO: Resolved download path for import 'github.com/golang/geo' =3D&gt=
; https://github.com/golang/geo</div>
<div>INFO: Resolved download path for import 'github.com/golang/snappy' =3D=
&gt; https://github.com/golang/snappy</div>
<div>INFO: Resolved download path for import 'github.com/google/go-cmp' =3D=
&gt; https://github.com/google/go-cmp</div>
<div>INFO: Resolved download path for import 'github.com/google/go-github/v=
32' =3D&gt; https://github.com/google/go-github</div>
<div>INFO: Resolved download path for import 'github.com/gopcua/opcua' =3D&=
gt; https://github.com/gopcua/opcua</div>
<div>INFO: Resolved download path for import 'github.com/gophercloud/gopher=
cloud' =3D&gt; https://github.com/gophercloud/gophercloud</div>
<div>INFO: Resolved download path for import 'github.com/gorilla/mux' =3D&g=
t; https://github.com/gorilla/mux</div>
<div>INFO: Resolved download path for import 'github.com/gorilla/websocket'=
 =3D&gt; https://github.com/gorilla/websocket</div>
<div>INFO: Resolved download path for import 'github.com/gosnmp/gosnmp' =3D=
&gt; https://github.com/gosnmp/gosnmp</div>
<div>INFO: Resolved download path for import 'github.com/grid-x/modbus' =3D=
&gt; https://github.com/grid-x/modbus</div>
<div>INFO: Resolved download path for import 'github.com/gwos/tcg/sdk' =3D&=
gt; https://github.com/gwos/tcg</div>
<div>INFO: Resolved download path for import 'github.com/harlow/kinesis-con=
sumer' =3D&gt; https://github.com/harlow/kinesis-consumer</div>
<div>INFO: Resolved download path for import 'github.com/hashicorp/consul/a=
pi' =3D&gt; https://github.com/hashicorp/consul</div>
<div>INFO: Resolved download path for import 'github.com/hashicorp/go-uuid'=
 =3D&gt; https://github.com/hashicorp/go-uuid</div>
<div>INFO: Resolved download path for import 'github.com/influxdata/go-sysl=
og/v3' =3D&gt; https://github.com/influxdata/go-syslog</div>
<div>INFO: Resolved download path for import 'github.com/influxdata/influxd=
b-observability/common' =3D&gt; https://github.com/influxdata/influxdb-obse=
rvability</div>
<div>INFO: Resolved download path for import 'github.com/influxdata/influxd=
b-observability/influx2otel' =3D&gt; https://github.com/influxdata/influxdb=
-observability</div>
<div>INFO: Resolved download path for import 'github.com/influxdata/influxd=
b-observability/otel2influx' =3D&gt; https://github.com/influxdata/influxdb=
-observability</div>
<div>INFO: Resolved download path for import 'github.com/influxdata/tail' =
=3D&gt; https://github.com/influxdata/tail</div>
<div>INFO: Resolved download path for import 'github.com/influxdata/toml' =
=3D&gt; https://github.com/influxdata/toml</div>
<div>INFO: Resolved download path for import 'github.com/influxdata/wlog' =
=3D&gt; https://github.com/influxdata/wlog</div>
<div>INFO: Resolved download path for import 'github.com/intel/iaevents' =
=3D&gt; https://github.com/intel/iaevents</div>
<div>INFO: Resolved download path for import 'github.com/jackc/pgx/v4' =3D&=
gt; https://github.com/jackc/pgx</div>
<div>INFO: Resolved download path for import 'github.com/james4k/rcon' =3D&=
gt; https://github.com/james4k/rcon</div>
<div>INFO: Resolved download path for import 'github.com/jhump/protoreflect=
' =3D&gt; https://github.com/jhump/protoreflect</div>
<div>INFO: Resolved download path for import 'github.com/jmespath/go-jmespa=
th' =3D&gt; https://github.com/jmespath/go-jmespath</div>
<div>INFO: Resolved download path for import 'github.com/kardianos/service'=
 =3D&gt; https://github.com/kardianos/service</div>
<div>INFO: Resolved download path for import 'github.com/karrick/godirwalk'=
 =3D&gt; https://github.com/karrick/godirwalk</div>
<div>INFO: Resolved download path for import 'github.com/kballard/go-shellq=
uote' =3D&gt; https://github.com/kballard/go-shellquote</div>
<div>INFO: Resolved download path for import 'github.com/matttproud/golang_=
protobuf_extensions' =3D&gt; https://github.com/matttproud/golang_protobuf_=
extensions</div>
<div>INFO: Resolved download path for import 'github.com/mdlayher/apcupsd' =
=3D&gt; https://github.com/mdlayher/apcupsd</div>
<div>INFO: Resolved download path for import 'github.com/microsoft/Applicat=
ionInsights-Go' =3D&gt; https://github.com/microsoft/ApplicationInsights-Go=
</div>
<div>INFO: Resolved download path for import 'github.com/miekg/dns' =3D&gt;=
 https://github.com/miekg/dns</div>
<div>INFO: Resolved download path for import 'github.com/moby/ipvs' =3D&gt;=
 https://github.com/moby/ipvs</div>
<div>INFO: Resolved download path for import 'github.com/multiplay/go-ts3' =
=3D&gt; https://github.com/multiplay/go-ts3</div>
<div>INFO: Resolved download path for import 'github.com/nats-io/nats-serve=
r/v2' =3D&gt; https://github.com/nats-io/nats-server</div>
<div>INFO: Resolved download path for import 'github.com/nats-io/nats.go' =
=3D&gt; https://github.com/nats-io/nats.go</div>
<div>INFO: Resolved download path for import 'github.com/newrelic/newrelic-=
telemetry-sdk-go' =3D&gt; https://github.com/newrelic/newrelic-telemetry-sd=
k-go</div>
<div>INFO: Resolved download path for import 'github.com/nsqio/go-nsq' =3D&=
gt; https://github.com/nsqio/go-nsq</div>
<div>INFO: Resolved download path for import 'github.com/olivere/elastic' =
=3D&gt; https://github.com/olivere/elastic</div>
<div>INFO: Resolved download path for import 'github.com/openconfig/gnmi' =
=3D&gt; https://github.com/openconfig/gnmi</div>
<div>INFO: Resolved download path for import 'github.com/opentracing/opentr=
acing-go' =3D&gt; https://github.com/opentracing/opentracing-go</div>
<div>INFO: Resolved download path for import 'github.com/openzipkin-contrib=
/zipkin-go-opentracing' =3D&gt; https://github.com/openzipkin-contrib/zipki=
n-go-opentracing</div>
<div>INFO: Resolved download path for import 'github.com/openzipkin/zipkin-=
go' =3D&gt; https://github.com/openzipkin/zipkin-go</div>
<div>INFO: Resolved download path for import 'github.com/pion/dtls/v2' =3D&=
gt; https://github.com/pion/dtls</div>
<div>INFO: Resolved download path for import 'github.com/pkg/errors' =3D&gt=
; https://github.com/pkg/errors</div>
<div>INFO: Resolved download path for import 'github.com/prometheus/client_=
golang' =3D&gt; https://github.com/prometheus/client_golang</div>
<div>INFO: Resolved download path for import 'github.com/prometheus/client_=
model' =3D&gt; https://github.com/prometheus/client_model</div>
<div>INFO: Resolved download path for import 'github.com/prometheus/common'=
 =3D&gt; https://github.com/prometheus/common</div>
<div>INFO: Resolved download path for import 'github.com/prometheus/procfs'=
 =3D&gt; https://github.com/prometheus/procfs</div>
<div>INFO: Resolved download path for import 'github.com/prometheus/prometh=
eus' =3D&gt; https://github.com/prometheus/prometheus</div>
<div>INFO: Resolved download path for import 'github.com/riemann/riemann-go=
-client' =3D&gt; https://github.com/riemann/riemann-go-client</div>
<div>INFO: Resolved download path for import 'github.com/safchain/ethtool' =
=3D&gt; https://github.com/safchain/ethtool</div>
<div>INFO: Resolved download path for import 'github.com/sensu/sensu-go/api=
/core/v2' =3D&gt; https://github.com/sensu/sensu-go</div>
<div>INFO: Resolved download path for import 'github.com/shirou/gopsutil/v3=
' =3D&gt; https://github.com/shirou/gopsutil</div>
<div>INFO: Resolved download path for import 'github.com/showwin/speedtest-=
go' =3D&gt; https://github.com/showwin/speedtest-go</div>
<div>INFO: Resolved download path for import 'github.com/signalfx/golib/v3'=
 =3D&gt; https://github.com/signalfx/golib</div>
<div>INFO: Resolved download path for import 'github.com/sirupsen/logrus' =
=3D&gt; https://github.com/sirupsen/logrus</div>
<div>INFO: Resolved download path for import 'github.com/sleepinggenius2/go=
smi' =3D&gt; https://github.com/sleepinggenius2/gosmi</div>
<div>INFO: Resolved download path for import 'github.com/snowflakedb/gosnow=
flake' =3D&gt; https://github.com/snowflakedb/gosnowflake</div>
<div>INFO: Resolved download path for import 'github.com/streadway/amqp' =
=3D&gt; https://github.com/streadway/amqp</div>
<div>INFO: Resolved download path for import 'github.com/stretchr/testify' =
=3D&gt; https://github.com/stretchr/testify</div>
<div>INFO: Resolved download path for import 'github.com/tbrandon/mbserver'=
 =3D&gt; https://github.com/tbrandon/mbserver</div>
<div>INFO: Resolved download path for import 'github.com/testcontainers/tes=
tcontainers-go' =3D&gt; https://github.com/testcontainers/testcontainers-go=
</div>
<div>INFO: Resolved download path for import 'github.com/tidwall/gjson' =3D=
&gt; https://github.com/tidwall/gjson</div>
<div>INFO: Resolved download path for import 'github.com/tinylib/msgp' =3D&=
gt; https://github.com/tinylib/msgp</div>
<div>INFO: Resolved download path for import 'github.com/vapourismo/knx-go'=
 =3D&gt; https://github.com/vapourismo/knx-go</div>
<div>INFO: Resolved download path for import 'github.com/vjeantet/grok' =3D=
&gt; https://github.com/vjeantet/grok</div>
<div>INFO: Resolved download path for import 'github.com/vmware/govmomi' =
=3D&gt; https://github.com/vmware/govmomi</div>
<div>INFO: Resolved download path for import 'github.com/wavefronthq/wavefr=
ont-sdk-go' =3D&gt; https://github.com/wavefronthq/wavefront-sdk-go</div>
<div>INFO: Resolved download path for import 'github.com/wvanbergen/kafka' =
=3D&gt; https://github.com/wvanbergen/kafka</div>
<div>INFO: Resolved download path for import 'github.com/xdg/scram' =3D&gt;=
 https://github.com/xdg/scram</div>
<div>INFO: Resolved download path for import 'go.mongodb.org/mongo-driver' =
=3D&gt; https://github.com/mongodb/mongo-go-driver.git</div>
<div>INFO: Resolved download path for import 'go.opentelemetry.io/collector=
/model' =3D&gt; https://github.com/open-telemetry/opentelemetry-collector</=
div>
<div>INFO: Resolved download path for import 'go.opentelemetry.io/otel/expo=
rters/otlp/otlpmetric/otlpmetricgrpc' =3D&gt; https://github.com/open-telem=
etry/opentelemetry-go</div>
<div>INFO: Resolved download path for import 'go.opentelemetry.io/otel/metr=
ic' =3D&gt; https://github.com/open-telemetry/opentelemetry-go</div>
<div>INFO: Resolved download path for import 'go.opentelemetry.io/otel/sdk/=
metric' =3D&gt; https://github.com/open-telemetry/opentelemetry-go</div>
<div>INFO: Resolved download path for import 'go.starlark.net' =3D&gt; http=
s://github.com/google/starlark-go</div>
<div>INFO: Resolved download path for import 'golang.org/x/net' =3D&gt; htt=
ps://go.googlesource.com/net</div>
<div>INFO: Resolved download path for import 'golang.org/x/oauth2' =3D&gt; =
https://go.googlesource.com/oauth2</div>
<div>INFO: Resolved download path for import 'golang.org/x/sync' =3D&gt; ht=
tps://go.googlesource.com/sync</div>
<div>INFO: Resolved download path for import 'golang.org/x/sys' =3D&gt; htt=
ps://go.googlesource.com/sys</div>
<div>INFO: Resolved download path for import 'golang.org/x/text' =3D&gt; ht=
tps://go.googlesource.com/text</div>
<div>INFO: Resolved download path for import 'golang.zx2c4.com/wireguard/wg=
ctrl' =3D&gt; https://github.com/WireGuard/wgctrl-go</div>
<div>INFO: Resolved download path for import 'google.golang.org/api' =3D&gt=
; https://github.com/googleapis/google-api-go-client</div>
<div>INFO: Resolved download path for import 'google.golang.org/genproto' =
=3D&gt; https://github.com/googleapis/go-genproto</div>
<div>INFO: Resolved download path for import 'google.golang.org/grpc' =3D&g=
t; https://github.com/grpc/grpc-go</div>
<div>INFO: Resolved download path for import 'google.golang.org/protobuf' =
=3D&gt; https://go.googlesource.com/protobuf</div>
<div>INFO: Resolved download path for import 'gopkg.in/gorethink/gorethink.=
v3' =3D&gt; https://gopkg.in/gorethink/gorethink.v3</div>
<div>INFO: Resolved download path for import 'gopkg.in/olivere/elastic.v5' =
=3D&gt; https://gopkg.in/olivere/elastic.v5</div>
<div>INFO: Resolved download path for import 'gopkg.in/tomb.v1' =3D&gt; htt=
ps://gopkg.in/tomb.v1</div>
<div>INFO: Resolved download path for import 'gopkg.in/yaml.v2' =3D&gt; htt=
ps://gopkg.in/yaml.v2</div>
<div>INFO: Resolved download path for import 'k8s.io/api' =3D&gt; https://g=
ithub.com/kubernetes/api</div>
<div>INFO: Resolved download path for import 'k8s.io/apimachinery' =3D&gt; =
https://github.com/kubernetes/apimachinery</div>
<div>INFO: Resolved download path for import 'k8s.io/client-go' =3D&gt; htt=
ps://github.com/kubernetes/client-go</div>
<div>INFO: Resolved download path for import 'modernc.org/sqlite' =3D&gt; h=
ttps://gitlab.com/cznic/sqlite</div>
<div>INFO: Resolved download path for import 'cloud.google.com/go' =3D&gt; =
https://github.com/googleapis/google-cloud-go</div>
<div>INFO: Resolved download path for import 'cloud.google.com/go/compute' =
=3D&gt; https://github.com/googleapis/google-cloud-go</div>
<div>INFO: Resolved download path for import 'cloud.google.com/go/iam' =3D&=
gt; https://github.com/googleapis/google-cloud-go</div>
<div>Traceback (most recent call last):</div>
<div>&nbsp; File "/oe-core/scripts/recipetool", line 111, in &lt;module&gt;=
</div>
<div>&nbsp; &nbsp; ret =3D main()</div>
<div>&nbsp; File "/oe-core/scripts/recipetool", line 100, in main</div>
<div>&nbsp; &nbsp; ret =3D args.func(args)</div>
<div>&nbsp; File "/oe-core/scripts/lib/recipetool/create.py", line 746, in =
create_recipe</div>
<div>&nbsp; &nbsp; handler.process(srctree_use, classes, lines_before, line=
s_after, handled, extravalues)</div>
<div>&nbsp; File "/oe-core/scripts/lib/recipetool/create_go.py", line 336, =
in process</div>
<div>&nbsp; &nbsp; dep_src_uris, src_revs =3D self._handle_dependencies(d, =
srctree, go_mod)</div>
<div>&nbsp; File "/oe-core/scripts/lib/recipetool/create_go.py", line 261, =
in _handle_dependencies</div>
<div>&nbsp; &nbsp; repodata =3D self._resolve_repository(module_path)</div>
<div>&nbsp; File "/oe-core/scripts/lib/recipetool/create_go.py", line 184, =
in _resolve_repository</div>
<div>&nbsp; &nbsp; repodata =3D self._resolve_repository_dynamic(modulepath=
)</div>
<div>&nbsp; File "/oe-core/scripts/lib/recipetool/create_go.py", line 176, =
in _resolve_repository_dynamic</div>
<div>&nbsp; &nbsp; return GoImport(parser.rootpath, parser.vcs, parser.repo=
url, None)</div>
<div>&nbsp; File "/oe-core/scripts/lib/recipetool/create_go.py", line 151, =
in rootpath</div>
<div>&nbsp; &nbsp; return self.__srv[0]</div>
<div>IndexError: list index out of range</div>
</div>

--78x2A0prd2nAuR5LsJnz--

