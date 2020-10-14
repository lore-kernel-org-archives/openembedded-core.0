Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.71])
 by mx.groups.io with SMTP id smtpd.web12.6652.1602661428783963775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dOcP5jx1;
 spf=pass (domain: arm.com, ip: 40.107.1.71, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsc3WrZEktl/DOGHnt7U556tpNtSbbGqtRmSKyR0AfA=;
 b=dOcP5jx1DqzWRWyqk9U6HCUG7JuaEinBOIV5T9hkFPcm6yFIA8PUBabQDQRWnByaoaEqc9vzXKtCJ4vi2y+c5y+oBQQfMaTgQv7OlJv2xmPmzYWBf16gIpTxbH+MqpDMhLr04mRaXVjtyL3MEMVe6tHN+JHXcmIGQnosXXk4yto=
Received: from DB6PR0201CA0037.eurprd02.prod.outlook.com (2603:10a6:4:3f::47)
 by DB6PR0802MB2166.eurprd08.prod.outlook.com (2603:10a6:4:85::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Wed, 14 Oct
 2020 07:43:45 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::2b) by DB6PR0201CA0037.outlook.office365.com
 (2603:10a6:4:3f::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Wed, 14 Oct 2020 07:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 07:43:45 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Wed, 14 Oct 2020 07:43:45 +0000
X-CR-MTA-TID: 64aa7808
Received: from b5eaeffec7e3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DBEDAE0E-A6D3-494D-BA68-02A55D38CAFB.1;
	Wed, 14 Oct 2020 07:43:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5eaeffec7e3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 07:43:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kvaylc3mCA+rA8hQRFdbBb1UpIsN4gUFZ9PSWdJjhur2UBWhegK+KVxQLu+VMUvz8O2hFmbqIzStSyl+KoBaNcu28eLY2E6NtRfdOc0Lgr2GjxTbrnIYCQaoMI2HWcVGI7Gi5aUa0iYrNjgKRRsbQQ+43fotsejUV+IDULL6ZbQRIkdhMPE1E9LQTwW7Y6xgxF8KLWO2XHqINtfAby7I0+OZm4/NAEQnSidXBUDLa9bZ03b7AoOYtpH8Xaopf4v88xHmHHzVQvmAFo7pH7Iv8qNQoCkZ6z0Misgn9UJg6Q25RSJfoZhOQBxbfvALjT+vRZUIzWFJ4ckkG6r9IDaqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsc3WrZEktl/DOGHnt7U556tpNtSbbGqtRmSKyR0AfA=;
 b=hvWcIaHHRDP/NzOxwuSyiRoKazNkNy55dBZdrzfRHQze9eDGCpBwJ3cWeU9ligUlUSI/ghNd3/42vlKYIFqFKBhAutLoOulX9p3pYnSGAStm/7DdH46WVUG1gIn5+me8Oivq/HHZ3/CbdPeHo+W444u+rgUceLW7RUcc0xE8ubsWeF/7kQF9Gal0K0jiwbGd6VXVC7P8aHGw+xlglk7cpih3y8n8tBHVxPYHYLhyw8fUTe1uZuk83E2aT4V0OSGSSt7gEGR4i5kzbWDxdCDjpoWVQ66pbEWv1wllprVSuAzjxh+GkDD+MJbc/f/kWtQgQgKBoIEatBz92j1buXwSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsc3WrZEktl/DOGHnt7U556tpNtSbbGqtRmSKyR0AfA=;
 b=dOcP5jx1DqzWRWyqk9U6HCUG7JuaEinBOIV5T9hkFPcm6yFIA8PUBabQDQRWnByaoaEqc9vzXKtCJ4vi2y+c5y+oBQQfMaTgQv7OlJv2xmPmzYWBf16gIpTxbH+MqpDMhLr04mRaXVjtyL3MEMVe6tHN+JHXcmIGQnosXXk4yto=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6007.eurprd08.prod.outlook.com (2603:10a6:20b:29e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.31; Wed, 14 Oct
 2020 07:43:38 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3455.032; Wed, 14 Oct 2020
 07:43:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "akuster808@gmail.com" <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>, Diego Sueiro <Diego.Sueiro@arm.com>, Ross Burton
	<Ross.Burton@arm.com>, =?iso-8859-2?Q?Kamil_Dzie=BFyk?=
	<Kamil.Dziezyk@arm.com>
Subject: Re: [OE-core] [PATCH] kea: add init scripts
Thread-Topic: [OE-core] [PATCH] kea: add init scripts
Thread-Index: AQHWoegYWjR0OY4joUuz1tm7SZ9LSKmWtBFA
Date: Wed, 14 Oct 2020 07:43:38 +0000
Message-ID: 
 <AM6PR08MB34615B96808A64EF05A1024B92050@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20201014050821.25233-1-akuster808@gmail.com>
In-Reply-To: <20201014050821.25233-1-akuster808@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 5F299F13590C304B84EE2396DB1AFFB9.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [46.64.226.180]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64370501-507d-4d6c-1c18-08d87014e113
x-ms-traffictypediagnostic: AS8PR08MB6007:|DB6PR0802MB2166:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2166631C25F5B8B8747850BE92050@DB6PR0802MB2166.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:534;OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wjVQQMRAli6JT60lRf+kSlwUXEv0FeVfUpA8D2ZCxNmGYGtGOb57OBbsXo336wmszxKNobu4zxdxoLHHB5NDxoUn38FmVwyV91Ncicrf3vCYwoSckXAbTIEodmnBZU8tNPz5eD+q68KQzOidKNoMk4JDUloBe0EKRxxD2KqcrM09hLBjCvFyGQMYKSBh06vNsi0R45nlRTX37bbSsvsxjlgdMqXl2QzOlAFP6nU0Idgfdvw3Cuy7QbZOO/ZU/kXhoiRZRevzou42o+LuxQMcE+sdNqplX2cFmDkTs8V++2bC+HHTIIvJM3jKRaRbmazWGKgcfaQVYb9vZIiPdoVFajzLv7p8ZXSD++EnFTxWXl0MVFk3gOq5EQEea5ZJUrfR1CLxkVbM3sgaAsT1jDaqCQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(66446008)(7696005)(4326008)(52536014)(76116006)(966005)(26005)(2906002)(478600001)(9686003)(8676002)(83380400001)(5660300002)(6506007)(86362001)(83080400001)(186003)(71200400001)(8936002)(110136005)(316002)(66946007)(66476007)(66556008)(33656002)(64756008)(55016002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 wIipjWpWABiB7c6oVTH6nXGpSn1yCm57pPUmLl4Kx5IzYfm2LGW4nTKgheTd8ZAX7QVIQhDJBC+oscvMpEy0Du4GVXGlXAwde5thFZXZ6FlVzf1Qu3FqE4Y1KPFkG718NzeDR/rHTuzMoHlxmEIMavt6kjG5a4jyTgYrPIiUDmnHJChpb5Vn5igGkfifDQmScOWZ2UQz6eNIAVMuw59ei077a7O7RhUdlpQvYNFPIDrDEgDIYPbJ+i7leEyimRm0QvN7JFSZC4TKDE4k/nFa7s2M0cNeTGPgF9pbAOv8qibKePKvjWBG8rnBebOsSIrLGAviq5BH1iDtntQcWu3tnQ0p8HC7H34UcRiIkfV0ZKszC56iuh2L9FCta8HpLPwvlU1aXKwaNiw/rLwn6CCHEqerQYu8fhaLQtTr9Ust7s6hFqCA07DuJfekx3TJpec5ct8X1zktk+rFHFgbfwWRAXkUGnMcdS7qjan1POxgShmkiWgAGQ2nJ9Fwo5VcgWr9bbgJF8xb6J55+p3DdCqeQJxdythWa99+A9hXXNGLHCYTL3+AMm/UZD3hCVw7X2nmcLBAA7zTRIvis6iNU/mSzpWk+8L8rWKOCe6FOidIHAjKea7pd0yt6AscaVc6AsSedxWi4GO9e6337DGqXTbBDA==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6007
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	77861520-703a-4377-2b0c-08d87014dcfe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D0MV6w+fPFC/a7DAH8eGSYU6Jr0IRM4buZjlYfqMLF7Mt77J+EBV/RxqRtCviENLYGX70rzNW39pn6unZoEHZ4qBvWQspasOI3fr7xHVtJjklG4lq+qx7knipFwFHueq1zHeNEOzzANOjkDdolzj1ejtlafVeKhM256aDq0O1ewULEh2Bc+yMIx2bYJOvys9aI8WztM0VxpFx6XKcQiFEG2bDlrku4GeB6TOg8njWw7nqT0vfKhvttXBjl2SggQgple3WBD93jTs3CCkBYk0gZL3L8NobLhcIOnP1aybCuZh7DaM4dwnAiQTMWkCil1T8UyoLUIOmPceHLyk3EwXaEprYUp8nEkmMLOMpGw5A75HbUbQycrv7QDkF1boE2Z80Ss9+fqszBlz1k2BQUe+zKm4Cmv2TKb2oqQhappN62e203D5Rm5LJ6O80YJvHOehNAoEHrxgvxMQgMpjaosKhMm4It/lIaHDMhIRfXJl7Fk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(316002)(54906003)(9686003)(5660300002)(47076004)(55016002)(110136005)(82740400003)(356005)(33656002)(83080400001)(81166007)(83380400001)(2906002)(82310400003)(26005)(7696005)(336012)(86362001)(6506007)(8676002)(4326008)(52536014)(70206006)(70586007)(186003)(478600001)(966005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 07:43:45.0633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64370501-507d-4d6c-1c18-08d87014e113
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2166
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: openembedded-core@lists.openembedded.org <openembedded-
>core@lists.openembedded.org> On Behalf Of akuster via
>lists.openembedded.org
>Sent: 14 October 2020 06:08
>To: openembedded-core@lists.openembedded.org
>Subject: [OE-core] [PATCH] kea: add init scripts
>
>[ Yocto # 14074 ]
>
>Add init scripts for dhcp4,6 and ddns
>
>Signed-off-by: Armin Kuster <akuster808@gmail.com>

The keactrl is not working as expected in a core-image-minimal. I'm getting=
 the following
output for `keactrl status`:
```
/usr/sbin/keactrl: line 101: rev: not found
/usr/sbin/keactrl: line 101: rev: not found
DHCPv4 server: inactive
/usr/sbin/keactrl: line 101: rev: not found
/usr/sbin/keactrl: line 101: rev: not found
DHCPv6 server: inactive
/usr/sbin/keactrl: line 101: rev: not found
/usr/sbin/keactrl: line 101: rev: not found
DHCP DDNS: inactive
/usr/sbin/keactrl: line 101: rev: not found
/usr/sbin/keactrl: line 101: rev: not found
Control Agent: inactive
Kea DHCPv4 configuration file: /etc/kea/kea-dhcp4.conf
Kea DHCPv6 configuration file: /etc/kea/kea-dhcp6.conf
Kea DHCP DDNS configuration file: /etc/kea/kea-dhcp-ddns.conf
Kea Control Agent configuration file: /etc/kea/kea-ctrl-agent.conf
keactrl configuration file: /etc/kea/keactrl.conf
```

And the dhcp4 server is running ` ps | grep kea-dhcp4`:
```
773 root     51000 S    /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d
```

The problem is that the oe-core busybox does not include the `rev` applet a=
nd
it  doesn't support `ps -p`:
https://github.com/isc-projects/kea/blob/master/src/bin/keactrl/keactrl.in#=
L141

We need to build the busybox `rev` and `pgreg` applets and have something l=
ike:
```
--- kea-1.7.10.original/src/bin/keactrl/keactrl.in
+++ kea-1.7.10/src/bin/keactrl/keactrl.in
@@ -137,8 +137,8 @@
     # Get the PID from the PID file (if it exists)
     get_pid_from_file "${proc_name}"
     if [ ${_pid} -gt 0 ]; then
-        # Use ps to check if PID is alive
-        ps -p ${_pid} 1>/dev/null
+        # Use pgrep and grep to check if PID is alive
+        pgrep -v 1 | grep ${_pid} 1>/dev/null
         retcode=3D$?
         if [ $retcode -eq 0 ]; then
             # No error, so PID IS ALIVE
```

Cheers,

Diego Sueiro

>---
> .../kea/files/kea-dhcp-ddns-server            | 46 ++++++++++++++++++
> .../kea/files/kea-dhcp4-server                | 46 ++++++++++++++++++
> .../kea/files/kea-dhcp6-server                | 47 +++++++++++++++++++
> meta/recipes-connectivity/kea/kea_1.7.10.bb   | 13 ++++-
> 4 files changed, 151 insertions(+), 1 deletion(-)  create mode 100644
>meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
> create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp4-server
> create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp6-server
>
>diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
>b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
>new file mode 100644
>index 00000000000..fe19179f290
>--- /dev/null
>+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
>@@ -0,0 +1,46 @@
>+#!/bin/sh
>+### BEGIN INIT INFO
>+# Provides:          kea-dhcp-ddns-server
>+# Required-Start:    $local_fs $network $remote_fs $syslog
>+# Required-Stop:     $local_fs $network $remote_fs $syslog
>+# Default-Start:     2 3 4 5
>+# Default-Stop:      0 1 6
>+# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
>+
>+PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
>+DESC=3D"kea-dhcp-ddns-server"
>+NAME=3Dkea-dhcp-ddns
>+DAEMON=3D/usr/sbin/keactrl
>+DAEMON_ARGS=3D" -s dhcp_ddns"
>+
>+set -e
>+
>+# Exit if the package is not installed
>+[ -x "$DAEMON" ] || exit 0
>+
>+# Source function library.
>+. /etc/init.d/functions
>+
>+case "$1" in
>+  start)
>+        echo -n "Starting $DESC: "
>+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
>+        echo "done."
>+        ;;
>+  stop)
>+        echo -n "Stopping $DESC: "
>+        kpid=3D`pidof $NAME`
>+        kill $kpid
>+        echo "done."
>+        ;;
>+  restart|force-reload)
>+        #
>+        $0 stop
>+        $0 start
>+        ;;
>+  *)
>+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}=
" >&2

status is not implemented. The same applies to the other init scripts.

>+        exit 1
>+        ;;
>+esac
>diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server
>b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
>new file mode 100644
>index 00000000000..59128e530d6
>--- /dev/null
>+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
>@@ -0,0 +1,46 @@
>+#!/bin/sh
>+### BEGIN INIT INFO
>+# Provides:          kea-dhcp4-server
>+# Required-Start:    $local_fs $network $remote_fs $syslog
>+# Required-Stop:     $local_fs $network $remote_fs $syslog
>+# Default-Start:     2 3 4 5
>+# Default-Stop:      0 1 6
>+# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
>+
>+PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
>+DESC=3D"kea-dhcp4-server"
>+NAME=3Dkea-dhcp4
>+DAEMON=3D/usr/sbin/keactrl
>+DAEMON_ARGS=3D" -s dhcp4"
>+
>+set -e
>+
>+# Exit if the package is not installed
>+[ -x "$DAEMON" ] || exit 0
>+
>+# Source function library.
>+. /etc/init.d/functions
>+
>+case "$1" in
>+  start)
>+        echo -n "Starting $DESC: "
>+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
>+        echo "done."
>+        ;;
>+  stop)
>+        echo -n "Stopping $DESC: "
>+        kpid=3D`pidof $NAME`
>+        kill $kpid
>+        echo "done."
>+        ;;
>+  restart|force-reload)
>+        #
>+        $0 stop
>+        $0 start
>+        ;;
>+  *)
>+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}=
" >&2
>+        exit 1
>+        ;;
>+esac
>diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server
>b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
>new file mode 100644
>index 00000000000..e0119d6eb2e
>--- /dev/null
>+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
>@@ -0,0 +1,47 @@
>+#!/bin/sh
>+### BEGIN INIT INFO
>+# Provides:          kea-dhcp6-server
>+# Required-Start:    $local_fs $network $remote_fs $syslog
>+# Required-Stop:     $local_fs $network $remote_fs $syslog
>+# Default-Start:     2 3 4 5
>+# Default-Stop:      0 1 6
>+# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
>+
>+# PATH should only include /usr/* if it runs after the mountnfs.sh
>+script PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
>+DESC=3D"kea-dhcp6-server"
>+NAME=3Dkea-dhcp6
>+DAEMON=3D/usr/sbin/keactrl
>+DAEMON_ARGS=3D" -s dhcp6"
>+
>+set -e
>+
>+# Exit if the package is not installed
>+[ -x "$DAEMON" ] || exit 0
>+
>+# Source function library.
>+. /etc/init.d/functions
>+
>+case "$1" in
>+  start)
>+        echo -n "Starting $DESC: "
>+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
>+        echo "done."
>+        ;;
>+  stop)
>+        echo -n "Stopping $DESC: "
>+        kpid=3D`pidof $NAME`
>+        kill $kpid
>+        echo "done."
>+        ;;
>+  restart|force-reload)
>+        #
>+        $0 stop
>+        $0 start
>+        ;;
>+  *)
>+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}=
" >&2
>+        exit 1
>+        ;;
>+esac
>diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-
>connectivity/kea/kea_1.7.10.bb
>index 2ea4b12758e..15193aeda38 100644
>--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
>+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
>@@ -13,11 +13,17 @@ SRC_URI =3D "\
>     file://kea-dhcp4.service \
>     file://kea-dhcp6.service \
>     file://kea-dhcp-ddns.service \
>+    file://kea-dhcp4-server \
>+    file://kea-dhcp6-server \
>+    file://kea-dhcp-ddns-server \
>     file://fix-multilib-conflict.patch \  "
> SRC_URI[sha256sum] =3D
>"4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
>
>-inherit autotools systemd
>+inherit autotools systemd update-rc.d
>+
>+INITSCRIPT_NAME =3D "kea-dhcp4-server"
>+INITSCRIPT_PARAMS =3D "defaults 30"
>
> SYSTEMD_SERVICE_${PN} =3D "kea-dhcp4.service kea-dhcp6.service kea-dhcp-
>ddns.service"
> SYSTEMD_AUTO_ENABLE =3D "disable"
>@@ -44,8 +50,11 @@ do_configure_prepend() {  }
>
> do_install_append() {
>+    install -d ${D}${sysconfdir}/init.d
>     install -d ${D}${systemd_system_unitdir}
>+
>     install -m 0644 ${WORKDIR}/kea-dhcp*service
>${D}${systemd_system_unitdir}
>+    install -m 0755 ${WORKDIR}/kea-*-server ${D}${sysconfdir}/init.d
>     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindi=
r},g' \
>            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e
>'s,@SYSCONFDIR@,${sysconfdir},g' \
>            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/=
keactrl
>@@ -55,6 +64,8 @@ do_install_append() {
>     rm -rf "${D}${localstatedir}"
> }
>
>+CONFFILES_${PN} =3D "${sysconfdir}/kea/keactrl.conf"
>+
> FILES_${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
> FILES_${PN} +=3D "${libdir}/hooks/*.so"
>
>--
>2.17.1

