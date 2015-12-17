Return-Path: <Tom.Hochstein@freescale.com>
X-Greylist: delayed 848 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Dec 2015 22:19:10 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0140.outbound.protection.outlook.com [65.55.169.140])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1E773175
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:19:10 +0000 (UTC)
Received: from BY2PR03CA003.namprd03.prod.outlook.com (10.255.93.20) by
	BLUPR03MB1412.namprd03.prod.outlook.com (10.163.81.146) with Microsoft
	SMTP Server (TLS) id 15.1.355.16; Thu, 17 Dec 2015 22:05:01 +0000
Received: from BL2FFO11OLC001.protection.gbl (10.255.93.4) by
	BY2PR03CA003.outlook.office365.com (10.255.93.20) with Microsoft SMTP
	Server (TLS) id 15.1.337.19 via Frontend Transport;
	Thu, 17 Dec 2015 22:05:01 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC001.mail.protection.outlook.com (10.173.161.185) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 17 Dec 2015 22:05:00 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	tBHM50Tf006842; Thu, 17 Dec 2015 15:05:00 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Dec 2015 16:04:46 -0600
Message-ID: <1450389888-24760-2-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC001;
	1:5OYQ21dLf3ewUzY7KqcwBEgqOf1jJ6iyFl9ruNdhVxIrYWrJsxVw3hPX0brvNlDARtAj59y5KUV12LEbq7TvXv33HKRcrTfdwJ1eFxIE+Q2TY8869kLAxljqR0fucBVmRdkaG3sugCvFj8iQB6nV79l0bLkQHRskRio+3Mtg4j5CW1dFnJF8oyZouYgtPVm0X84l5CEsVRJvU4l6Kah3wUvb8yyanr89qFx/50E7nsHrmLKYiSMKbrbohyUcZrhksfd6IpsFgTDRgxViuvGatBFR4n2t78Qy9uhnbCzyOL0trcpFVONS8619YW4TkQ6vP+LtgXtW5UhgcJ1uF3K+NGf9firu+yIGcdTStv4Pn5ci+uXbbm4txjLGlPcnbMS0KuGcOeNpTgFthNKThrOy3TpDCbNGnZ16atEfYso9XrxfgaG0mA27ljcaJvcTz1Bo
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(189002)(199003)(586003)(4001430100002)(47776003)(5003940100001)(2351001)(1220700001)(1096002)(85326001)(87936001)(6806005)(77096005)(5008740100001)(19580405001)(104016004)(48376002)(2950100001)(19580395003)(50466002)(86362001)(97736004)(110136002)(107886002)(189998001)(5001960100002)(50986999)(76176999)(92566002)(106466001)(450100001)(11100500001)(81156007)(50226001)(33646002)(36756003)(53416004)(229853001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB1412;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1412;
	2:aRefC+QiVAMDV+3mXeQdtIk/8hiUoV3hk9sfdrBDbJFeG7UJdzSGvmPkotEiiNtf2Y9m/emjk9LFhMFxMn0JqHrKfSPAWzUxNODFjVC1xF89tDW7r4tAjag5+epXopClc1b43vt5U3rm8A7Dxenl2g==;
	3:cy+6wbKk78jx7Lh6TKbQFjHGA9ZZXuGX68LS60eqL93kgjCateEEnGnyWmGYuFhSVSlkBy69REHc0Hd1qUvQUVdWkMgAytPDRVbmcMwNQStqNpbTbSX0fwxZAeFKvkviWrEvDsXPAtHTSwJ+X26r++RsmEgjkhzKB2w87R6UYhRxo9lGTSxn1qBLLpMcQZpnFIOPxSJyM1CbJT2dxWUiP/u/Z11h/kIo51ZFGcU9ZmA=;
	25:t6MDfYDgF3P7WBHVABYTkcH0PVUXhGWWlV5RPLrcWDtzYDpJiU4snfrcgJu9h87YJUBIo7ZIWgzg5u6Fg5eIa+MMiMAJx7t55gzSSRaq+NwWg6LhZ/Hs6OksjZ1o+dt160vMMZg/lnLJqtTzea9N5oZNYR9Ix4CJyyON2es8OsljRZQZ+Twp8hScTNHcbh6Ti9nlG49thIdd98CCiOkjvEXqAENRYGMVFmo/6GVFYKmj6f8f8jSE2DO7vhIOUs4bCNN93hN/amHRRdbFkyTcCg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB1412;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1412;
	20:8wRZ3MAQDOba/0Afec7ozMAQpBj8aE1eEft68zjeEezcYprX3ZRic2NgWxG6v3UlphsL+KzVsigB+3f5vf4TQkY+vZcUgl5SK47o1LDRu0ldpPXNmqG/6aezJY99d53czcMhDTg8wyypRyh4bCL67wAqHEdL65FJLc5E7ct1d+IMIfH385Gpr39TrVw85kTcbPyM9rD/CI+GjW1Q8z/w8MynvFPm46K06ObqCSvDmaIqwhuOvJYjbdOj30jufIVNOlf2O7OqKTDMlLMsozmxDFIEpWOoePuI+5bEEwIdjoKyO/N0Z7d0o1Vxw4PopVXORWO2VR1muTDZZuaONzCTyoyuAh5QiYxGnlTuPmXHxbA=;
	4:Q4NfGBHpA2ZcLZvIEJD0RJozAur8iXcPvwIZHET5KOLRDL8JTTTdH14dVLoX1okddw8ehNAdHxUVATja532sChk0XE/23fc4HnLkd0dAK66Yw+rofdvOx24u/KwJsWEErkOeflXC7kPxWmbwB1AeEU97z57P7hkGh5drbXHAeysxHPrfTB6VyiaH+6MURDxFGRloM4G8QHANWmrWA8/YyWS7zJb8yjinNHw0ZJL5Z8RHFluV+Fncx1AaEx/avCgJ6vJDP+F4+HiY6mJ99Py03gosMAgFZth5qAbBPKNnM6By8JEWfn78pEIliYUGwjpQgNrsLJBFBm6nxbhMIWuM7SRDEGT10uJMnpvF33hYWHASM2aL6rR10FCNaUxv8HRO8hLdMG/OtUkuY6k1/wgSklCkVNylhh3BcVql76hhPUbKILp4d9KBGqCDgG3goqyb
X-Microsoft-Antispam-PRVS: <BLUPR03MB1412689F31655015AA43F398E8E00@BLUPR03MB1412.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(520078)(10201501046)(3002001);
	SRVR:BLUPR03MB1412; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB1412; 
X-Forefront-PRVS: 07935ACF08
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB1412;
	23:BOaSkFB7Gw5UjzL+RdCEOsXrxHWAWXLQsDethELTO?=
	=?us-ascii?Q?PfkRmG1XlFCPXTFkgWdNNf1zvCYpv/UEsr2ynXp7nySeGZPetimGbzh6pbt6?=
	=?us-ascii?Q?O5vJG52kZatb6fsoYCrE4cs6coPKXa/GIqk26tROa8nNsjCkO86ipb3AIbps?=
	=?us-ascii?Q?kdgeuZ90JYLvXmPBiNA6pf4JKfnLlLF+VHMISyoW+QSNdt7sCNL3s+viKkE5?=
	=?us-ascii?Q?CMvvcsSyNjcZgpVd8Z9U8kwx0kbjMBG3bLWKxKxr47U528X9m5COnA0we5SJ?=
	=?us-ascii?Q?4ovxcNOVVWuOFrSplPombpnjR6vP8YesYbHCsdh0PeUUsXvulbCe3BAPIQgM?=
	=?us-ascii?Q?6ifGgRmqs5bPvnUJLNaBUQnp9ij3w31jbK+CJKbiK1bIBJJbj2YWlPv5edkw?=
	=?us-ascii?Q?rZlghKysSIFBOn9aan2mkcwzxYDzNBIQYbBrA+DUKhxBIbFxrJnPRaxQkxXS?=
	=?us-ascii?Q?xPOmWYVZ63HTJ/xisiZIyDdVFH5lPo26X6GrvbwbuX2+asFVZJvBYNR8id8N?=
	=?us-ascii?Q?S1BXuRXNdacMEzs5DAfrH8GTjjy2iQR2DB8578ZsI2SU9cq+rKXOpJzGXR5z?=
	=?us-ascii?Q?jeV2TmfVQ4/MQxYLYLoNeOV7TAH0HwYfQDjzdB4v7gWa/LSIzhQ2rsHOl90x?=
	=?us-ascii?Q?eN+4mgMjW+Nhuv8c1ivDyvv41gRcVapzvMPOd/SSp1ToqyCJ64EaIxgBOyXT?=
	=?us-ascii?Q?L3Vcrn0PwLpl6cL3bgYnNXunN52DqvgosEKcJU9kTZd/yMG9lKyXzWUtFlxI?=
	=?us-ascii?Q?CpZFnje74LmAFf1IJLWxzBqwFFF/hFQiARzC47esPLMFziewfnRx3SABxpP7?=
	=?us-ascii?Q?ovYlYPKBKyrZOrKy+aJ2euExFBWEKI4Jvhlajf7fhjlO4DXQQOYiVHkU1F/2?=
	=?us-ascii?Q?+cRJ1nMBBSCKe6rEeDJndlsxD+wUVf8DL9c6gJuqTRZo0NDFTF6xdBNJ//1H?=
	=?us-ascii?Q?78+feufcj36et8drxg0KCtVzEBFKeTO6MYVdCpKLA66J1vh88oiRkSxmlk3l?=
	=?us-ascii?Q?QayvCouPdn0zW8VmLF2RCrCLCjk4u/upIHFiEWMPunaQx+9OzSixbHYXEbFZ?=
	=?us-ascii?Q?0H0rRCXlzCzB8X+/Pony2xuAFWu+O0K5kPCLRqjWAmm5DobCGeMAKmvGgWNs?=
	=?us-ascii?Q?JPJocLs0kI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1412;
	5:gQMD8fnK6V3zOFwjAouQkt5jHrYu7UxEJosnYYS+F9gpQbKB79IVEHr5rV4tFDVttPXA/prwDSlWGXbxm8QQocOFMzwk2RCkWNRRCQ8GwW4JrdFOciR/7LotNO5etx/ZI4EkqcO0BkLUh+6ep/Bk4w==;
	24:1NCAw0f4nfIKSfKOD8TfBFly4/rTy6ljWGD0Gy68ZgLIeX5xBl/sAvJ4NMTTay1AdQ8rqBK6ZT1ec2IacMGOTcVNLKpx1GXADYIIfrr0Lz8=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2015 22:05:00.9118 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB1412
Subject: [<OE-core][PATCH v2 2/4] weston: Include weston-launch if Wayland is configured.
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
X-List-Received-Date: Thu, 17 Dec 2015 22:19:12 -0000
Content-Type: text/plain

The weston-launch app is required for Wayland.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston_1.8.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index aff9a12..807e799 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -20,7 +20,8 @@ SRC_URI[sha256sum] = "8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'pam', '', d)}"
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango"
@@ -39,9 +40,8 @@ EXTRA_OECONF_append_qemux86 = "\
 EXTRA_OECONF_append_qemux86-64 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
 		"
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
 #
-- 
2.1.4


