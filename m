Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0103.outbound.protection.outlook.com [207.46.100.103])
	by mail.openembedded.org (Postfix) with ESMTP id 08DB1731AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:19:20 +0000 (UTC)
Received: from CH1PR03CA007.namprd03.prod.outlook.com (10.255.156.152) by
	BN3PR03MB1413.namprd03.prod.outlook.com (10.163.34.20) with Microsoft
	SMTP Server (TLS) id 15.1.355.16; Thu, 17 Dec 2015 22:05:01 +0000
Received: from BL2FFO11FD031.protection.gbl (10.255.156.132) by
	CH1PR03CA007.outlook.office365.com (10.255.156.152) with Microsoft SMTP
	Server (TLS) id 15.1.355.16 via Frontend Transport;
	Thu, 17 Dec 2015 22:05:01 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD031.mail.protection.outlook.com (10.173.160.71) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 17 Dec 2015 22:05:00 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	tBHM50Te006842; Thu, 17 Dec 2015 15:05:00 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Dec 2015 16:04:45 -0600
Message-ID: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD031;
	1:AYMuXk7e21ARpHFiD/Ubv0pSlkwa7o9lcMgRfAWmlFqmlahpQFrkIIUwpXxXNpbTy2n1IXkjjA1WY7RFvuq0e0MaELoCh7IxVgF6RR7YJ51XTc7FYmKTABhTCqam29SiD6jtV78jNLpgnj1B1EcuMagqrEKZb7ZQHtWMAvwUT1luMFrIS7GcPLH4dpvwjSLWN2R7jUKvxARk8bJgtRtOoRwf84IMS29Tdjyl1KYA6xe7y4df8zOzcPzAcygSeXW0r2c7Eph9TIq6GRnhfWF/neZPXfMTbrrvrljxeKWy8jhHEd6mZBYdMmj9qnY5em2FhvcN+lDNHGF/maZUUxQHQ4QyNFftxmhN291NJj0kvqD8Uhb+uI7gjxD2BrQmHGIv+lJbyNOBDBShOSdPO70BjAKlOsjW6ShgzRHXszTAWjjsKLP6qLJqfL378+z7auEA
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(199003)(189002)(586003)(50986999)(53416004)(50226001)(48376002)(50466002)(92566002)(19580405001)(1096002)(36756003)(47776003)(106466001)(33646002)(1220700001)(229853001)(2351001)(85326001)(87936001)(19580395003)(107886002)(97736004)(77096005)(5001960100002)(4001430100002)(5008740100001)(11100500001)(81156007)(5003940100001)(189998001)(450100001)(86362001)(104016004)(110136002)(6806005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1413;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1413;
	2:aYASLJrkVeSGT0SGewT1gpXDOwe53F8agsKpLOHjyf7AqGRjj96JlDZ6haOnnTZLT4giypPObOCKyyCfTXuBdDbLlg2/u2kMkXMk1KrCqWC13bppmd9lx+SrCFGoGhsu2MYw8KZltdZO2Cm5qSlayQ==;
	3:tiuiPO146xV04ak0yuv+BGkbLIXMKR5VCNh73ELBW7n2lPQPI2Oi2mpqtSNY7EMZ66ayxnTyYUYU9VAiH7fN8f9Wpu7/wYTo93Sp8ViPSBPAufPKhBQS68LZEY3T0xvkDL3AwvLKyMBpuEo1s5f5kkxiR107VuDx8DCqj+sLcE5pm9UjMMZd3+gKM1+bkHaJ3usC5YCGRXkul4KbyX6PkR23Tt0axVlY11JV6l+PbBQ=;
	25:wM0+VIgNPPSoWLvyPefRRGmM2sTiDFARGERvEneCkKdmLpxc7Y3uAscu+yt02rssPkvYH+xMemOg0ItygOYw4NeTDybkfop3p4lGJW0qBLCpqyFsUYsY2vZZAa3GCc0N9xM8/90tItq3XnxUAS/k4i+J66j7g6J4/MJVgkaZDQTqf3tCJ2M1WlADAz1Su9OcfFx/AsHJEd7Q8XwchrERJNSFH4zklOm7paXSZ+GVrbNP7zAh1h2SyxCBzDIu6k2R
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1413;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1413;
	20:uBRW+QRemDGub8cwZTw/Q6WXnFogtepJLkP4F+nTGM9T5RetvEHHMAyjLFOpyUexXRSoIw362DabnYesVlvHpeAG/LOZYRamm40ZhpievUS16TrsFa4FwyQ11A7hwiG24LJCIPnlPdoZR5+cOiGZUxGI4DwM6G4QmKmRfFtmWJlfBd3ZbGDyYRYEazkoixSDXPxO7CY1ZFnNYJZgH92zYF07JA4x7l2qs7HE7ljNY/+dqJSt0GzbW/KDXogRMpIOrmPr+OBC9wgE3wnP5Fg8154UYqIeadLu/1/+xrP2VgIPZtQbXAwji/R3eEDSSXs0h1fYri6V/obdZvSoA2hFbyBSvrT75I16/kKasN3xH8U=;
	4:L7/2GvQBKYCYnfto6UJmDk2FWecBf9CZlK5qazZZhKE8eky8PCRBe5veS/Uxfr7ar7h4BT9O494eCu6omokk2mxyVLStvCssmOX8oaIspJChPOfoghRhdc7t3bMfSdfwbWjYqd5YIbMhEVv8a5gjkuWwXgh+RSnN8eJjowba8/pSzDQVyVACr162gSqUy7G5ya9uxVnYH3TLPypjl25K08RZAg6qfoXIoftCnTbNQdWsOw8yfkf3SEa6lzjfifIxriHn/Fi00wYUa687OcaMKO2D2T+fJ/XZ/Yjpe7gz0Fz8mrQSaaZiwANBoKjn6Q0EYZ+zMsSpxGMThM3aTmmM3gn4wMDBXcpcaMDhtMnADp7MCFP32WVZ3h3nsr/kK1YkF1qpBpWd6Uui47ua8fnw/EL9ml8CxKCzXSTLYTyW3WQ=
X-Microsoft-Antispam-PRVS: <BN3PR03MB14130BE60C17C54EC5F52758E8E00@BN3PR03MB1413.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BN3PR03MB1413; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1413; 
X-Forefront-PRVS: 07935ACF08
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1413;
	23:y7NAmEjaUOfnJgBmBFYPaudq+441ET78+kt8chvcu?=
	=?us-ascii?Q?k8kDDQdlKLCBcM89mVbn0J2VHMIYUWAhRGn03x79nliGcbayNLaIh2ZtmiQi?=
	=?us-ascii?Q?HSGRmsXr6aMm0XtkZMhLwejmYiqNsghqUYJe5OAp+PwlOek/rJ/Rs3U5CrRK?=
	=?us-ascii?Q?Ts3bZIl8zWOGqfsypBJqS6qg/hLWEs2p6yiwaKyBp1lkMr2Gb5K4xdig8dOP?=
	=?us-ascii?Q?doNIEElypnpZFUKaXdxmgyko1jgOLe547/hspzpMwmfwUdwXKcn/2A5f/N+l?=
	=?us-ascii?Q?KBA8ZvbKYJUXj2YnyJsVnBzptVt8iN9ZCuv7MW/PnLMyGf2DqAN9rkLcC8wM?=
	=?us-ascii?Q?vm0PvleSTCG6VYpYA2ulBBW0YjU8urOqTgbn9hsiy1mMzV1FL3vitDEcEdaY?=
	=?us-ascii?Q?9f7JEqmVLkdZPOynnz4EARw/sq1R7rR1I1ACCwbYr/dIVYTT+g5oLJmhMMaJ?=
	=?us-ascii?Q?7yxFhwlZayy7LrgS4EDRhVm7/kKvyizQp7x6XkhbZ0QcvvRNYZ/BcDqFp4tn?=
	=?us-ascii?Q?tZj2k5sBBzplCDWayRXB0Snz8iiPKRlhyAEIggF/vooOHMksh4rAkpqEN9Vd?=
	=?us-ascii?Q?McF/FU62sg7V8eaVydF473ZBQYi6XoKsbCBN6GcjgMO56NbDp5DPga2JfhNF?=
	=?us-ascii?Q?9YJAST0c0GJxauipYI3ot2WkZTQLLkbcU1r+ToqJDIjly8njp1+hs1q2DyqZ?=
	=?us-ascii?Q?m6Vo+06HRe5VitCYr6eRVLqGA2G0VAiQD/oTdhouaYs5oNeoBvdqcZK787aY?=
	=?us-ascii?Q?KXvvnSAIYsfpvw2PgutP9nbA927C7wujfvlC0duJrRXBDgHE9ANFF1P6WZg7?=
	=?us-ascii?Q?A+AcGAWeW4OODLBSVL1A69mFrhb9AJnhMiR3Mas83EDY4Z1WKF/9DM+DHLRI?=
	=?us-ascii?Q?Fe/Llj/+gtMt66b0SIsy0Yu2JMN0v5sJu19Yf3XIT3iV3m/5sDnWINLTCR0e?=
	=?us-ascii?Q?euZOhmrY1wlxPp9lX9lvTKCs12Tjj1Rm/+Wm2+oLyUx+mq+dMZ1Wnu/9HgOo?=
	=?us-ascii?Q?+qz3oFc1g/CJHQ4DKpOrrUPciwB08yW5sGMg7zQd/zCFsjvBKzSWkaVPdS41?=
	=?us-ascii?Q?JS9RXkYwzOIE1mKWnWARF08At0Y?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1413;
	5:OXYWYDY+KzX1B0rI0WQ1wfFarg3URCmTYLQ1e+EAs6+zU0s4VE6yj+k2CeRhSt3WyVOVztSIqqyPfb97gznYzc2P5H//SS8l3MSrasPsZe+0t8rqPL85L7gBSm8wl0aMMRozMezLdm9bHtR2eOTDlA==;
	24:GDrbW2NBc7ZUBvaeK7RZ8YcnDkLwsq6V8nP/D0kWdoL5L+Str442VSpbnEw2wpGHph8s+Y/cLn7FO2KzT1THB1wiUOKTTnaAEp1zqgPDRUE=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2015 22:05:00.8098 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1413
Subject: [<OE-core][PATCH v2 1/4] weston-init: Handle Weston startup correctly.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Dec 2015 22:19:23 -0000
Content-Type: text/plain

Weston is started in different ways depending on the image
configuration and the runtime scenario. Refer to the weston man
page for more information.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston-init.bb           | 15 ++++++++++++++-
 meta/recipes-graphics/wayland/weston-init/init         |  2 +-
 meta/recipes-graphics/wayland/weston-init/weston-start | 18 ++++++++++++++++++
 .../wayland/weston-init/weston.service                 |  4 ++--
 4 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston-start

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 653541e..0bd3ad8 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -3,7 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 SRC_URI = "file://init \
-           file://weston.service"
+           file://weston.service \
+           file://weston-start"
 
 S = "${WORKDIR}"
 
@@ -13,6 +14,18 @@ do_install() {
 
 	install -d ${D}${systemd_system_unitdir}
 	install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
+
+	install -d ${D}/${bindir}
+	install -m755 ${WORKDIR}/weston-start ${D}/${bindir}
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)}" = "xwayland" ]; then
+		weston_launch_setup="mkdir -p /tmp/.X11-unix"
+		weston_launch_args="--modules=xwayland.so"
+	else
+		weston_launch_setup=""
+		weston_launch_args=""
+	fi
+	sed -i "s#WESTON_LAUNCH_SETUP#${weston_launch_setup}#" ${D}/${bindir}/weston-start
+	sed -i "s#WESTON_LAUNCH_ARGS#${weston_launch_args}#" ${D}/${bindir}/weston-start
 }
 
 inherit allarch update-rc.d distro_features_check systemd
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 2e938f4..8567dfc 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -38,7 +38,7 @@ case "$1" in
                 chmod 0700 $XDG_RUNTIME_DIR
         fi
 
-        openvt -s weston -- $OPTARGS
+        weston-start
   ;;
 
   stop)
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
new file mode 100644
index 0000000..1360dd7
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -0,0 +1,18 @@
+#! /bin/sh
+
+# There are multiple ways to start weston.
+if [ "$WAYLAND_DISPLAY" ]; then
+    echo -e "\aError: Weston is already running."
+    echo "This script does not support launching Weston nested."
+    exit 1
+else
+    if [ "$DISPLAY" ]; then
+        echo "Launching Weston"
+        openvt -s -- sh -c "weston -- $OPTARGS > /var/log/weston.log 2>&1"
+    else
+        echo "Launching Weston"
+        export XDG_CONFIG_HOME=/etc
+        WESTON_LAUNCH_SETUP
+        openvt $OPENVT_ARGS -- sh -c "weston-launch -- WESTON_LAUNCH_ARGS $OPTARGS > /var/log/weston.log 2>&1"
+    fi
+fi
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 4f1f7ff..856f91f 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -5,10 +5,10 @@ RequiresMountsFor=/run
 [Service]
 User=root
 EnvironmentFile=-/etc/default/weston
-Environment="XDG_RUNTIME_DIR=/run/user/root"
+Environment="XDG_RUNTIME_DIR=/run/user/root" "OPENVT_ARGS=-w"
 ExecStartPre=/bin/mkdir -p /run/user/root
 ExecStartPre=/bin/chmod 0700 /run/user/root
-ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
+ExecStart=/usr/bin/weston-start
 
 [Install]
 WantedBy=multi-user.target
-- 
2.1.4


