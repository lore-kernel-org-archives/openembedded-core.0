Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0120.outbound.protection.outlook.com [65.55.169.120])
	by mail.openembedded.org (Postfix) with ESMTP id E65F462136
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 00:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YQ6uD+WX3+oaYDr6+WwBvQUpOUYCYYobL5QCP/QSEcg=;
	b=XoyzJSVu2J9Tvc6PiRlBci79e8akhs0rQbWTtO4lEnBz4b0YFN+OUPS7Vi6qmMCU9WumMbJPUNn0U3U7kQPPigVv/VSsFVGDigzHyj2P8Tymp01O34n5FkLxGGy2g2AUa0r8Ab8jMvhjv0EMJGADmxRUTWjyRkZGAvkb59BClao=
Received: from BLUPR03CA007.namprd03.prod.outlook.com (10.255.124.24) by
	BY1PR03MB1420.namprd03.prod.outlook.com (10.162.127.150) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Mon, 28 Mar 2016 23:02:28 +0000
Received: from BN1AFFO11FD036.protection.gbl (10.255.124.4) by
	BLUPR03CA007.outlook.office365.com (10.255.124.24) with Microsoft SMTP
	Server (TLS) id 15.1.447.15 via Frontend Transport;
	Mon, 28 Mar 2016 23:02:28 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD036.mail.protection.outlook.com (10.58.52.240) with
	Microsoft SMTP Server (TLS) id 15.1.453.6 via Frontend Transport;
	Mon, 28 Mar 2016 23:02:28 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u2SN1iO6022049; Mon, 28 Mar 2016 16:02:27 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 17:59:59 -0500
Message-ID: <1459206002-30154-2-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
References: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(3190300001)(199003)(189002)(87936001)(47776003)(229853001)(2351001)(105606002)(50226001)(106466001)(5003940100001)(33646002)(1220700001)(1096002)(11100500001)(50986999)(586003)(86362001)(76176999)(104016004)(6806005)(19580405001)(450100001)(189998001)(92566002)(19580395003)(2950100001)(36756003)(2906002)(48376002)(81166005)(5008740100001)(50466002)(85426001)(77096005)(4001430100002)(4326007)(110136002)(107886002)(53416004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1420;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD036;
	1:k7uTuWen6P9wi6Uijyspeu+hbKKpy9gvduo6EVzoqwAleug/rKM7heWppy6ezOvJe3p0cVZpqyCgz/wIs77WmWMq2PmIBpw9pl2i+x3u7LhkvlAsRvmNR0GoNhK/rJdTzZTDoAehJAdq1akWO4HnamRMow/jkmqFrD+RUeeuobtNg2O+1LOYVBvFDC+PwN86dn+LG+VzXF8uP15MlSasvEQx04NaBvvnj270JCtaWypf/rwQOFiuy6Y5L4gAj09nLxcZlfi3VnzY1Rasi8rwon1GpHwvoMT0LdMGIFYaIjuQxcVXGnDXy4f3ppGcB4ZoNnHWtvsOB3uni4i/EDUzOGEPYdtF1kDbnPAU6XS/MLt6dRew5l6qOAUilC5hhl14AQzpqVmrhLCZTJC39u4mq/jGPMiuH49z0cUBZ1fUm+FBFfcLy/FD/j8nWLGGa0nX2zeel2iT8g5omn62EF7tsCg6Nrm8/BSHlDddGF5pTOieELyIUhe5ilvOfoQxGsLkjHSbnKPWAFDR2+m4JdQreXiOT49XUJh1xCc77cqR6AA=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: d7a0d4b2-b295-4fe5-4da0-08d3575d08e0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	2:aLbD5Xu3Bc81VRy0vSPIYAXBLc4KIEp7I6Eq2KB8Ozi1Ek+H+eADwiCAwZWoqpUX8xhJPZI8NvLTV+oYt9PVH67dMPlLVmCy5uNHSXgU4WTBfBFS6vdoRbUZHJfcPoOgqmCWrm3oit9ejMhUjKgYkZgugrodtKkMH88LW0B6pB8XJ0/03d7DBNsNrrmwVHaf;
	3:y/EUNVMiW7I8YptzoxvS/I76lxeCxMx4T2sqjMpeUJk0voAol9F6kiZB5Ezhl7Obh5OdunWixQK99RxY+hmQZqksN/7mr3r5Whml/q75N9Y4zRJcTHE+wSzMM/E8oK9lm1y8BSwd3iBMpabilClEbqI3LJPt+COGxr7oe/HI6vHtmNSZoJFeEiTOxJWtL/kY7QMypxte0UrEAKE4a9ME5hlwtemqSPY27oiYGBZqEaM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR03MB1420;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	25:YvjRkIRDLEERJgtrJSq1ewaQQ+e2ahqZZVkPtFmPsLej8AwFsy+kCap9E4UsXLryYibTGgFYflC5EccHbyerlRctMBF9MUbDpjGfSJ22bm0jQw/azVfFudJZJMfJl31gKuOBx+NhQ47Nqm0TX06Mltk9NFsKmxtkwgySovFYBPNc/mZ6RMScOYQuRi6L7VBaip4nMIdEHKN8m6E+eKEK04X65uO5s5uyTeZZx+saVgSG2T+YJHN2tmgRbRxUlOxSXUtTspHJtASgKoWkvWy4p234pGdvAvH+XZJVaF3ebG93FX64uMbevDiV18uy4+lt0dux1XcXJFOn+p1TTj41yu0h4RypGx+wBeZ9rJwNJoFXTM5eV4TKwfeXCPj6lT41XJFFeiIICU5w6G/dBMnR9n13KVKw9kXSoqBmWCuWjwuWoaPir4TdM4CME0LV/XvxxkOh0Tbdh9SsrJgmm8kRYuhfoIJFYA7yrwT5M+IMS7rNUCzDAs5AISSG/fMA8Zu+4eo8Tk/PIm9XT1MPEt3oMmPxZYojt5Ub8oat02vGftaYlcoXpHs5vufBiG5x9pR5NELt46CNlhp/y8Nlx/9ZUg==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	20:GHJvbfnhLhQTMXtZodQpJjdek3NYe5YVOIquZi2uiQozPqHcGCYdBJDGT488Lz3/Zemp5Enyc2d6HVlkhmuAw66YislBDf3XwG3pvNCcFsuU+CxQePBqQFudgPT2YyJ7VdbCmX4cXM6Fcx84CVxAmsxiCrs/a4B8n2Ixx63y5CWGajRNUxMlEoN17zrkReSPi9VQM5FsL8RgNipNVxFtBO//5lc83OsQe2HBvRVVNh4OQVruCf6yj00dB0zTq2EDV4UdcXTh9QZOpxAkuPKXrAf4PygXi2Ixfwrwo3+5JPPyNCHr052wEwB/Fj34T2TmARCMs67RvtEWjrUKu0CfdaoXtEsI9G3GxPrdCQwWOoYofPhmGKE1DisvBi9k/diB885ZQEayaEvDIeiO4MXJioO4XNogzB9ydW0F/4B6GN9oBPcbBTRJpHe5KBB9T9uR;
	4:jnVIanDXAcJtq5z+raG6T9wbNRk+FccG/TEYbbvKnb1geZBcuSELBKvXnOqtPNI1uSXP/oH1qeZkyksZxLAqQmmWlrXXHu3ejitBeeyJ0Xm6jrRLUp9Bn4LmuMpw4MGwftidrXBU/GrYSoUx3YGu9m8GUVW4NgcpUn0LtjwmL+FpfV37WJUYUgDWbGLrC79hL1ETrG7wrNia2WRlWxWAQFic5uPXGMiKab1vlChR6xiEF5aXE7v0jbmuFm2HJqVOiqxH7MjQR8Hx9boMDv7Cj9qnrHGjiIBrNenRup3OzZE2MAapEd7FUlswTXjo8AaED12wsSx+TbWS3ufmexOrWMKUzhI2N3Q9mv1zP5RZMYBpkz9UxC0MHatxtNHIsEhIHKGDUEFP1CXnCDjbkaGJmSOk20acm2dN4CF68lOCwfCzzFLS6vQ+CNsLjCNQU0vrh5fOzLsPXouF5armAtg/Iw==
X-Microsoft-Antispam-PRVS: <BY1PR03MB14200BD9357EACF307030983E8860@BY1PR03MB1420.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13023025)(13015025)(8121501046)(13024025)(13018025)(5005006)(10201501046)(3002001);
	SRVR:BY1PR03MB1420; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1420; 
X-Forefront-PRVS: 0895DF8FFD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1420;
	23:AjpOv7dVnj8I9LPPnFm9zcIkLRiSXkXYjnIfmEYV1?=
	=?us-ascii?Q?/Mb4gVl3WNLFWl7H+D9SK1UtykUHbdy3Ru18bdF+C0oytvB2mfHp6PZ67yDN?=
	=?us-ascii?Q?aFUc3PaJ+Bvr3Fx4aXidh0wOGtJbQYQuO56WCwL3ITTK8kPkZFfUwG4plDDN?=
	=?us-ascii?Q?jLXXjBTr9+h8SrcEKZHYmnq32uOPYPKg/PbOG1uePPyf+CWqWyve6Aba2hhl?=
	=?us-ascii?Q?lRHABFxl4ecO6Qws6rj7j4URckAtifLpsVlmQbewckPCS5CuL31I94JYLgnb?=
	=?us-ascii?Q?W8+6y3sENCstTk43lVXjIWU8/JcvUdiQQ0l9P7HR6u8dEJyI3UkTfak3jOz7?=
	=?us-ascii?Q?lEcQhFIKvO4PnEfLwMTEur6Zdb4OIGY0kXvfRM70xV7FGXBeT542CW7oihoy?=
	=?us-ascii?Q?2tcCunUyE4aZdwjMjPj0eT7dfogVUpHkMxs8WflLTe8rtoV6Cq/FK5hDWPh4?=
	=?us-ascii?Q?agTyprDfAG4/7JsCDUcZBFMmvh8LDwOGKPpLH6okWE2ym5y2t2F6N75klocV?=
	=?us-ascii?Q?bEA8gbRiFkEhgbCC2e0z4eO9rCg3h1WXX/9Z/z3CkqQIMAjCs5FE7PZkDCIp?=
	=?us-ascii?Q?YwnndpQGn0VUd5JVW+Mon+e4RThVZM2QmqTLPCK36VPxQd29TbWA+obis5L1?=
	=?us-ascii?Q?GpN0EQ5WpbjubhM9Ei7xx2V4kvayJpwV5Wc9NEXKyMLdZJrHYN/tqrRu+Nn/?=
	=?us-ascii?Q?eOFwVsz7rdQZqzX3jSt5eopcZos0f0Z7rAv83fESxfn+M2sKWq9jtYcDXyKQ?=
	=?us-ascii?Q?jhWLAFrTEnSOq0xvWeLQdos0YG8UyUhxhmmNgMh8NozD0JAuRES/1f1KQkvX?=
	=?us-ascii?Q?TaI1mjTfAmyxVLMgxU/tPiwvR74C6imW7sojdzZ3Z1uKRp617CXcvWz/5f52?=
	=?us-ascii?Q?Xi6HWw3QkN/xyHbhUfugYuRy9XbyxIFocDb1ImgB2FlKRKjPSUlksaN7M4AO?=
	=?us-ascii?Q?TfwODPPaWzhdfTAX5D7NgXjvPIU8JSYsoRWHxh9qBdhWeXEmjM2/Wbjced5B?=
	=?us-ascii?Q?Usw0icXLiPSNzokb8PF2iEwgsNtEpdBkzCQeVROoO7OMhWNpJ0vPk+PgpdpY?=
	=?us-ascii?Q?5ifSHk/kn8rOmS6RBL7YPyJ5yybkL+FYWJMIWje/CZS9zV4IkCiPEyXg5nnc?=
	=?us-ascii?Q?Td98Wky0OmS3ZLIyY85P1CfoavGwj/SQlAl9JH+urPI33SnbnD5qw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	5:9VZu5a5fMlyNo+wg64fjRPPQCCVJfwiqq+02nYF0SFcjRRkZt+3JC6yM8xvy3V5W5VVe51rtcUORoUDAbgAXRpPbt/UlHgFa2mz+OVOlanWNObjfMNjHFuMs1TzqdHdP/sVe2r+qT+TM1vPAr/1p/Q==;
	24:U7mnYESeUjp0uhwuuioIbLXUJqh4HmcTJvVyws/i7aFdSxVAJ8KXUS4t5O/91WGnMTvJzLbUm6LE9qYphBATWL07NrYArsGG88q4N9lVjlg=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2016 23:02:28.0148 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1420
Subject: [PATCH v4 2/5] weston-init: Handle Weston startup correctly
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
X-List-Received-Date: Tue, 29 Mar 2016 00:36:00 -0000
Content-Type: text/plain

Weston is started in different ways depending on the image
configuration and the runtime scenario. Refer to the weston man
page for more information.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston-init.bb       | 10 +++++++++-
 meta/recipes-graphics/wayland/weston-init/init     |  2 +-
 .../wayland/weston-init/weston-start               | 22 ++++++++++++++++++++++
 .../wayland/weston-init/weston.service             |  4 ++--
 4 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston-start

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 653541e..7b5481a 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -3,7 +3,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 SRC_URI = "file://init \
-           file://weston.service"
+           file://weston.service \
+           file://weston-start \
+           "
 
 S = "${WORKDIR}"
 
@@ -13,6 +15,12 @@ do_install() {
 
 	install -d ${D}${systemd_system_unitdir}
 	install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
+
+	install -d ${D}${bindir}
+	install -m755 ${WORKDIR}/weston-start ${D}${bindir}
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xwayland', 'xwayland', '', d)}" = "xwayland" ]; then
+		sed -i 's|USE_XWAYLAND="0"|USE_XWAYLAND="1"|g' ${D}${bindir}/weston-start
+	fi
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
index 0000000..da20921
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -0,0 +1,22 @@
+#! /bin/sh
+
+# There are multiple ways to start weston.
+if [ "$WAYLAND_DISPLAY" ]; then
+    echo -e "\aError: A Wayland compositor is already running."
+    echo "This script does not support launching a nested Weston instance."
+    exit 1
+else
+    if [ "$DISPLAY" ]; then
+        echo "Launching Weston under X"
+        openvt -s -- sh -c "weston -- $OPTARGS > /var/log/weston.log 2>&1"
+    else
+        echo "Launching Weston as first windowing system"
+        export XDG_CONFIG_HOME=/etc
+        USE_XWAYLAND="0"
+        if [ "$USE_XWAYLAND" = "1" ]; then
+            mkdir -p /tmp/.X11-unix
+            OPTARGS="--modules=xwayland.so $OPTARGS"
+        fi
+        openvt $OPENVT_ARGS -- sh -c "weston-launch -- $OPTARGS > /var/log/weston.log 2>&1"
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


