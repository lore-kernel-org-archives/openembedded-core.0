Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0111.outbound.protection.outlook.com [207.46.100.111])
	by mail.openembedded.org (Postfix) with ESMTP id 00B6E73212
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 22:48:09 +0000 (UTC)
Received: from BY2PR03CA040.namprd03.prod.outlook.com (10.141.249.13) by
	BY1PR03MB1419.namprd03.prod.outlook.com (10.162.127.149) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Thu, 21 Jan 2016 22:48:09 +0000
Received: from BN1BFFO11FD044.protection.gbl (2a01:111:f400:7c10::1:187) by
	BY2PR03CA040.outlook.office365.com (2a01:111:e400:2c5d::13) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:09 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD044.mail.protection.outlook.com (10.58.144.107) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:08 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0LMm657012064; Thu, 21 Jan 2016 15:48:07 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2016 16:47:36 -0600
Message-ID: <1453416456-27728-5-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
References: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD044;
	1:r4KuooJlVa6TkDnIkbmBgTvDlFr2aSoHSJpYN9X9eDBkUtoLj9UZF5Eyx0Pmma3QzWEtQLNoMMBblSxNt2wSf/nT/miLTKAO9piGUguyIIPubA3Wt3DZ0MO/PvHrf7qeVcoQw33AvKPyxjtSAaVtIl5QyZmkOfY1nS2mp7SAX4gddwWCZ/ttK66lwoY6E+s5imnMoYf4ks4qagBHIRtnLw/fT/DJcbT3QETLESHSAy6ZsW5FGNEs+GRQdscFTGKvELVgAgcGUHIrY4XJClnMuVjQovxqColn308bdarmDE1wPf1Yo5QnXRO9Waw0iSArrm4U4KdVX0zSm/5VEKa+SLyf+QkRMtJWkiQ1zZRUplAOvsG6ykFtzTKn6Y7rELq72516RIhn4mu7xHXxSXAfsta0Q6vxdntPoYw1hoK+TSBeTkCsgx8yTvarotOY1j5RzU53LF7EKtnN+5wPpLoGmqgTpjVEX0whC0Gef3NbP6w=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(189002)(199003)(5008740100001)(50466002)(2906002)(189998001)(450100001)(36756003)(86362001)(81156007)(6806005)(104016004)(11100500001)(5001960100002)(1220700001)(110136002)(586003)(2351001)(4001430100002)(107886002)(48376002)(50226001)(19580395003)(1096002)(19580405001)(92566002)(47776003)(229853001)(5003940100001)(87936001)(97736004)(4326007)(85326001)(76176999)(50986999)(53416004)(2950100001)(77096005)(33646002)(106466001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1419;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 58af9555-99ab-427f-63e9-08d322b4ef0f
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1419;
	2:cNAxItvIVQGfpGAHXOT/dgVauW4wRuP1CmAW/AAFdzJHYAjqbU01eGG+ogRVqQmP86intcrY264ymhr6azWTJJho2vyU70hqDjNA39NW8jCwL4owd5qCz9RSA0CPZzMxsySdz0xEa+x73cI+0M9ewVW5iYRdH+XjBOCSQ2UB74dyRojLA1Qmx6mz6nSDFOuj;
	3:RPMOUaeCxcfnnpJcfseq5I0niw8QFFinHPtf6Oufcwk2sNvNe+Dk0nTDCSlNRYMUIEpIbC052HUojDYot+DHCaVHJnpnio5lnC2GsV51tjg+snE6rwxWFkJ4L7HyYoba5M8jvJzYnW81zw69Ri3VbOIeH4xFNC/XZ8lu/per0DqrXTAlB03Ko/c/iUUqFc5kpqC6NjqPh4F4Hh7xLXQidc+Xe2oQ32GVyhXU8Qiom8g=;
	25:1VJwDwTsp2QeLya1kCi4LbT+sDQ8+kM/hjgm6JtvYjzG5ZFPNLkwFnwm3Mrrj833wjORXXJ8OtrfY6Wb6k1YyyeyQI0OCiOV3uv8ZKbNJaN+C0yqAcnE+gFxYCkEQFYBjoB0I8ybYLY6qO84S/E//cl9ENXBEJK+I7FrTMWV3yJW2Kt8FPU4Xk3HnXcWUwNhN+fpIX1Df6+AbxyQY9KZcadp80DLWjvUlk9KqXGYr2DBTVx6MMe7qwp7sUqXcFpo
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR03MB1419; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1419;
	20:E5YzDr+G70kzNuaBrwnnUtk45d8kBP5KsmszzhbFB8zWVgtFl3t/bbBS0poc8tnIEuORZvOocwRuLjAGPfGav4eC7UvG5TA1WqpNkAndujGjFFtzeDTjju+UDMZZSEEy7cYPKebGUuB+Ht9WAh98AlAySMNoJvf0YyjqCJEP0Y4r5bbGcJlrTLt+FwGXvO4ugZZ2AwKos2SwZTljFnRheZUdAwh9IdJ/fsqrXVyKuMbejzZlFEZTIE7niIc/GhEVYdvd7TdSosGzm+281lDMZS5jfxcxGqv4OXEgBvFi+WOSiOw1az4rySxPSE2NvXJIY1NPwYpGQ81tWXxCHkjsBz7iMRq+Ztr8IpVo/WZzABS0nQ8WKQbZEEbphs0wPPVz8ktJFPzGZpJel5l21aXlpSMx3TJ+nQXhtVEVRqB4IqxppuB5xNZ2hk7G4WPfOpll
X-Microsoft-Antispam-PRVS: <BY1PR03MB1419BFDC4BE22370F70C4CB3E8C30@BY1PR03MB1419.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(520078)(13015025)(13018025)(13017025)(5005006)(8121501046)(13024025)(10201501046)(3002001);
	SRVR:BY1PR03MB1419; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1419; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1419;
	4:wn6rgRKZFPJ9vCygCSGR2YQ9vqvG2fAaupiSW28+ZQekrlOuIY+0IV7i3ztRyllWoKkxkTZz1Y04ofkWt1m9p/xWjOZunh7wH4G/x1AzBJIoV6h8WziqTgHarC7+4kAeqeBuz0Q4iTKB6gPGthENY92L1YCW8v15D4r2amHGPl1cSQRJBFlBu4a1XX4KK9+uScbkQwAZEnKOHzG7rKG7y7pjTXzPqy/6XkHZGWRRf6l+Nt/RPySp5qK/XpVY7QoQts2465LWiDS2UK7H4mP8rOMRjpp3g3W6H9ZRlqnJ0C9Cas8JDhZdy1HUhPaOO8AJ9hgEk/h+O0xiy8KeuHsWrkU3NN4uK8e1xbYgnvTrVHloVqlRrsvKmY6mkrzu7vYKs4zC3ygMS8tyXXY7nJvRulN2zc56ww9tZyybalb34awhQKK62t+dO4CeMS1FIzet7Z0Pflwwl8jUU1PIgHlhGDzjhQfOcQ1/QYzcUCBH7DImv6iTKeCYrp0OuMSCuNR2mwq0vO0l2NKz5YlHwHsEOA==
X-Forefront-PRVS: 08286A0BE2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1419;
	23:uP/7zNLTjhgF48UBTO+DdK10BNEpSB0wwdOAgUZr0?=
	=?us-ascii?Q?FXGgKYeZoZ3R+seH4VuD1VYGc+wCxEuraSYzzaGvtSlME80n95iwSNdg4yEo?=
	=?us-ascii?Q?BehUs6YXKrI57xHSI0KCZVsfQDbJJ8p6GEq4VEFqRqCJ0Evun/Mox5Ibz2xV?=
	=?us-ascii?Q?Xr2GsPnDSmJdO/49cBUwHSYu+vg/DVBlGDw8CWu88IfNjFwB0YPh3MPgY1Qa?=
	=?us-ascii?Q?j/hX4dkAy1gxuapXShizlTOIkasvXk1CKXJ3v3feFh4A/FxL3ZXSOLJI42L8?=
	=?us-ascii?Q?fQTVjL/s4tp9705FcfUMF/R98+hiWwQ2JpET7euUQ4oLrle7iBWH9aF9Jr9A?=
	=?us-ascii?Q?8BjrJBDPHU3D2i9lbY0G6yOeDJ6P/+E/BvWl+tXGBQ096i2PC710BGb6IMlU?=
	=?us-ascii?Q?Vo+1UM7nfqLr4P4xrYvmoeUrVo+HcEqTvHlm+QpfAjzw6oFpQIZLb50vCV4L?=
	=?us-ascii?Q?M+ZkFLkar47i937YuFvxp+IsnWkcWmogJO5c+qLkep4TvcKvALkaHCMWOkmZ?=
	=?us-ascii?Q?Ly+rgxgBkeHQOQ6zPp8C63V9XtCppgsaOyeATVhhPPQrEKHGPAuYApw709Wp?=
	=?us-ascii?Q?j+OK5cZ4WeGoqiwoyWhzPF1+M+68u7U8Fp0Xc9nH3UTVCF41LqtXyW+mxetr?=
	=?us-ascii?Q?YhzgFmpHFgqQQuTd7EXJXyh7nTwI9W/RlNiRaHX54wMDa3fnnKzedjiKeukp?=
	=?us-ascii?Q?Ama9eGhyyKVo5xOjJl8R5y8HxGcPl017cHveqYbdbM+RX7vqx5Tqesmre+RI?=
	=?us-ascii?Q?Bwimfu+QW18ZfswatOIu5BkZUMhSGOBpNgk6seGP4ojH5Nqj+h5tO7hsHZvC?=
	=?us-ascii?Q?3n0lQWWjKaaVf98Sh4uewcZPRxoaoSw9Z8km1c3/JSM7huKolERYNb00wIA5?=
	=?us-ascii?Q?K/EAUNmA/tDokjeuMbJJwm27C+SDC3zwEZiveIEzarbpug6S00HwroXhEI0x?=
	=?us-ascii?Q?oUCKmrI3rAdv02WBCLwvCldC48EtkDnb9kHZsnkgcfn10kcO5S8qfYBSA/4t?=
	=?us-ascii?Q?ONyNwDn8wTHdo2lYAQhlwsHGDl4AA/+Movkt16peaBzqs4tNms0BiZAANtpZ?=
	=?us-ascii?Q?Gg2bM11Jn86htlmRH4r4LB21Yfkcc5eGmG29AHeHZniu0PKzbZffT3lhhIYE?=
	=?us-ascii?Q?VELnxcP6sxdRPyPlmFGKZ0RGMnEjoiIBS/HlIHS08BSXgNn+lG0tw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1419;
	5:Il3IorZbK57SZR+/NPxbZmdxOc0GHpAD2KG+ZCqU4d1ooYH/40VpVu8MzVu2qP5OdYanSnL+2Cbh2Z4rq7Xn8wq3x1cu98XTITeZ3wpIpHVZA2xJzF9WiuzlIwnYifMdIOGiewYIJ8y3u7qjSibeLg==;
	24:sO731aF9gkDrskIZ8NXzn+cqxGXL4pipIlSQhWcVwy8EAKMJOTXbcYj8eZWybsczLmzGwPO7vtpjnPNKX4Zb7tNJ6YbkRXMC9DNQKoH4LfA=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2016 22:48:08.1168 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1419
Subject: [PATCH v3 5/5] weston-init: Handle Weston startup correctly
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
X-List-Received-Date: Thu, 21 Jan 2016 22:48:11 -0000
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


