Return-Path: <carol.zhu@nxp.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0083.outbound.protection.outlook.com [104.47.38.83])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD936013D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 07:21:13 +0000 (UTC)
Received: from BLUPR0301CA0042.namprd03.prod.outlook.com (10.162.113.180) by
	BLUPR03MB581.namprd03.prod.outlook.com (10.141.79.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.523.12; Mon, 4 Jul 2016 05:48:15 +0000
Received: from BY2FFO11OLC015.protection.gbl (2a01:111:f400:7c0c::162) by
	BLUPR0301CA0042.outlook.office365.com (2a01:111:e400:5259::52) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Mon, 4 Jul 2016 05:48:15 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11OLC015.mail.protection.outlook.com (10.1.15.59) with Microsoft
	SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Mon, 4 Jul 2016 05:48:14 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u645m6uY030562;
	Sun, 3 Jul 2016 22:48:13 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 13:46:30 +0800
Message-ID: <1467611193-31658-4-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131120848948740413;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(85426001)(4326007)(69596002)(2906002)(86362001)(50986999)(76176999)(47776003)(586003)(77096005)(36756003)(48376002)(6806005)(5003940100001)(50466002)(87936001)(2950100001)(305945005)(105606002)(356003)(229853001)(97736004)(230783001)(106466001)(189998001)(7846002)(8676002)(2351001)(8666005)(81166006)(81156014)(110136002)(19580395003)(92566002)(33646002)(19580405001)(11100500001)(104016004)(50226002)(8936002)(68736007)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB581;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC015;
	1:WP0aHWiWl7vPDoaRO9C1C/Gm4IU+mPHqeeWyz3YQC6SoDnsSyjKDiGPwdYRBZVl5pWICWKLrrWD8sRjoaGVZ+6j+MlOnOKgYg0R1hNZnGujgl+kl2a/9ecNgbG0tQ+TNjmcCYTw2X+aT/hQICAj5ckED7jh0lHV6KF0eRn6cYWHBo2wdOyy/k6ZhB7gg7S4LCoFETzz7bgq3D3k9A9PeFWJTebeV1mWPQpx5Xo8oF2L2BMV4sWy9dwSceVLMEozIyt8h0M1O12Qh19gpLDOQWuIgLKMR04hWWDz+tg0AxEbO+1CshmJ4e3chgIf6Mudx55yIGII4bTXvVCbSk7vozLygAlUGo6X6YhoWciXiwctsp9QFm+gCwKQdJSjVaoStKE+KzeiFo+Wislaz3zrxxhMKUeFETfW0MhAZY+1gllPrkNWKAkD+XkkZBsPB8iqVxqIOPvxbDDvPvpjraQw1IQ1R2E6nsV55L/tcnqiMdvlYuXQFglYbLzbFEohaSwsXmW/7puxSg1l5TkzQmkukkDsyyk3ulgkOF57CaZo+BfSJBJ7wp/Fw/4iT1roLxYKOwb7RsRNW1+E4ORoKYTZazGK/jWJl9ax3vhiyMjONSeQ14dIQKXYk36iGUCPpj+o5uiSotecN9oeGSO5XhsgP2C9lEif/M6Mm26AotXwVYAiMqMldH/AXhVWY8lj8i+iTy5e1YVlAUhzMmaDb28of7oM8vlL/9ypXGIYmDzaGNjc=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: e679d59b-8b2f-4df0-b64d-08d3a3cecaa0
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB581;
	2:YcW/Ow5PbHzH35/LGgiHOcA0rwsw6cEpmRPeSqkCRimf4tvH2EMn2wZl2NBgfZqRufdwA9OMlau/OIPtJpNU2ze1qpKxQlAGhYBd2Xn8JNq53MM1KLnwe7M76K4MEWKnWUjc8qKTx+kMBpJsbKdmeGhVIwvBV1N3qxJ7jtMZqidxpGhejBxlkMmSPJQcbdqC;
	3:DvLK2dsDRznStvHNTTxCLBGtbaBKXNZcuoCK3u7g17k0tetFC3sJPcP5LMD+PxaIWNX2AH8jWgI51z40mhS4a739SBegLP+GxT8AZNNPJV4PraB3f5llAxkdbP6/dnlN6qCbSRI4zF6UIBH1XS7QEI3SZ8YdrcfSlu/q7gkMvrqEC39FdU569jcsrtG5GnZjjWKlqQ6OmXOc9ukj01kduLU0JiIbw7xAaku1b6n31bM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB581;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB581;
	25:HMU1lYVrIL2vCSltTFm4uvdIT9Q+Kk8l8PH/yEmrgix3UZM3YnY3+ijdhBw+qe9Kn+i39IQSUZLFWw16yl2RrhUdonUNoOlo1v5xz40EYm21ZB8LVyvYHYTdOAQC0And/++pew5m1oTGyXVhyvuNmRCZVy6f0FLSzRHAUKOTD/mqm95tmJFIJLQ0IXPKJxWJ1qw6n/Uk3/QtUC//LeTQNH2RtuxtycdLNER7/U+Zbnd3i3pZcgV/LXCy3lxqvfZBdbJ0ImlrfFcoM2a/gSyXTQ0WK5nyekPDi13Mj8bCLknK7BQaqCClBDO2w35Uir/A7f1wey9FxMzilj680752fPk1VkQLa5NTGyb2z3zZD06rfHZbqPuhdGUWnc/ZzgqJJRaH1qf3oR9PClqfOEFb2nREVJ0lZkfdyJVjAPmQLtxPJre2KzjAvuH8Q4lfek94ifwWxexFTK3NqAce83WYVvAuCZOrY4mdDSKzmEUf0+JuCuWvh1ci4jRvb5NXh6kRXaw/BS4HimEQb6MLsyq22hBq/XHM8TJwhRJhe6CVV5h7TfRKk24Xs5ptits7vXGfYRvqHg/wARO/o5aBReyxQ1cEokiLC0abSXtlxQnVVwQDagfwmxG2dApIL0me17YA0AYeMNhjLBWT6aDu0QBXT8U+nJY1c4O60Ozk9+y8pQboAqD9MiZPw0VQjbgDSu0vAUiNeIA7G4e6k3B3b3wEfuCHomGGoU/Ur7Q1eJxIANA=
X-Microsoft-Antispam-PRVS: <BLUPR03MB581611C868EDACCE34F3F89E9380@BLUPR03MB581.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13018025)(13017025)(13024025)(13023025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BLUPR03MB581; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB581; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB581;
	4:vL1utblv/xmfnFAti7A64j4TBrT0qvxjeXSKTY3z2mgYUa8VCqmlM7b4Uyl+uAFD2ue/7JEwJ419wfStnFA/A8v2bWDpxqiqrzZoWclhqgqP2OIR0DWMxzNIlRSu1/jp78KyhB8wifwUV6meRReWEjpizckc8IWnBGc99PsxBo2H0gHKzrmS6skL+PPrSyiR+SjcCkSNWgBXpmDCuDTvvBgJauRriMxl0LWpGddB/blQQFi1TrbnDksbu0X/FCTQxie78H55LxTxZFeWyAVL5HWuOt9z2lNZJ9TfKfkDMiamWV4IQG0BXHblXKv1YrCKMDTuUykiRHgHPCHfqBpR35H8g99+nUPs1Kf56J17vJ0jP4FMtPlgGSjXPbv2x5rI2jyycOMNHgT3d+0usc9QzbP/QKedZpigTITLFa7TtaT6a7iUCMZYpZVQaVleqTM0VcwkesZV01XxWkSO3pkZL9+mhogIrim8XcGX8g9QDrD6oUlCy5jIZuPuRIkaDe6MO11GD265zKCgkUbRHf/YqA==
X-Forefront-PRVS: 0993689CD1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB581;
	23:JwrpDiqRzdewC+tTb9QB5h5wO/FHHP6qWNResbAhf3?=
	=?us-ascii?Q?tS3GrX3mnza81iq6HfrIjOkuPLSu4+ZJUO1/CRXzEh4rV9M8SKWwpcKlqP4h?=
	=?us-ascii?Q?364kGIrOEm+F13E/TkmXVxRRNvVSmEUAHi+2Oav1YBVJqDdkw2lUA7sZt9sv?=
	=?us-ascii?Q?2PpJVOOykUqyx0clFMme5FNbFoBTBvFG2S9awpYq/7qzoDoJYEwMNrhiq5j/?=
	=?us-ascii?Q?qJ0jKCJ4oAFISyOix47Tr9Y5V4H9px/f5afb2rYqsUWcgQuJcUFVrKxPPX9g?=
	=?us-ascii?Q?KX6VrAfb0H00xWqesTyleiLdSgHYcV37fliD3wh2I/LyUWZTXpXzp/yKNk2C?=
	=?us-ascii?Q?VFnaA5T8d4yKAkrKhLYGQKEVwkchN1gPgWaF2VoXiKKOvwnDXDA008zVxh1Z?=
	=?us-ascii?Q?qLinjsgREJwV+eLSVYrlM3hxxkftZlEoHZrZHk1qY6E5aO1t6lPUWlzUxNku?=
	=?us-ascii?Q?gjJFnTF3nZaUVXcyLf5ctIuUKiOY26a8SEl6cstC2Szh6Ut4X78ZwhYT2EwU?=
	=?us-ascii?Q?1NXGbRlVlVge5T60r/s4L2bhbpRXAaY9SJVbVWOyJ7yA06JgD+3IGzH7OtOE?=
	=?us-ascii?Q?HYVpjHri84QC/Iql6vCidfWfusZTz04Z47S6zMSuFfzEmwmwkBxrzrfC/mmd?=
	=?us-ascii?Q?5ddhwlx//D/hd+J2OSw5lqCJuiG68LsXji8UGwYvbPtunovXBFBNH+FLeXOE?=
	=?us-ascii?Q?DMpc3Hii+hCOD4W2TjfUC/YAfOveGH7/eoeSL+bK2pThe1gUjW+Y8+6uRuS6?=
	=?us-ascii?Q?Yn7/k464IY0Ge+Da6wOd5z3753+CHwBf6L5rdApXLNdjGlwWB2hfjb/tB+lt?=
	=?us-ascii?Q?GVmO+tSZCX9Sp5Ut/dWNyu1EUYeP2GP+0EXnb1W0WuS8G05JWXNg09v/Eyla?=
	=?us-ascii?Q?TMt7IaFq8watd9RQC6CM+AsVwJJOvkt5IegHVbo1oavGw4AA2/JsqcRTmH3+?=
	=?us-ascii?Q?yBEkgnjIjsaKteVQDs3CaMebfvZfEJc0uEr1wCjAm7uVJh9E3V/sG6vwRi2V?=
	=?us-ascii?Q?QlSuwRsPzZvokfJVGeLfHxF40Id1kUb9syB3e0/64goeJ9lYMmdpZjLUAkws?=
	=?us-ascii?Q?2nZlwq9AKTRIj6NZtRminvwJA3I+XosRNO6u2QbAqoGIv6lxDSymFTJoTVGE?=
	=?us-ascii?Q?Dn4xZcj+68XEJuusxeuGs7iZlAQe9a/xl8lfjrcdVGjyrDCqHO/xvjBU89Zj?=
	=?us-ascii?Q?OD++qNsRk8vGg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB581;
	6:kwhtUW8Fo7F+keQo/zsfMP8EwqyZ1ZpDgylDQiN/54evK0ooxjKzvrvmMpnRZo/wHC604VPh4M73fZ7yTH3upNQ1CcdjwkW2uVfeI7DEI3F3LCTcipnNwP2S/HD95FJcx23/jXHgHxBCbbVtAP6oJQjnqY0l69m5a+YirgaGJRJRgiY4jTReZtfDeaQpaAGFWFktB9hzzh+qNGQRomfX7l4JrUdg6MJwgOfrta0r2O6XcLdgkYu7OydfZdoyucyMZoGKE8l0trA/cWywlITUpBzdepzREQqO2Mx9VEJ7OF1QmJem4vS6TA4dbrJQKJ8/;
	5:FzMS4IbyzChvJdR0wKfiRsLtUIKea0oJyqZFGHJmZfa42AZgfE5Nz9P64OX7s1Y4YP2gVo7Hg/wxiHUgx/oypVyzbaBFb40U0rzVa2dgzmb5rcRPG6e8myjcf8JQuJJIHq0V7MRtVRmzg4PvttsOdLFkJRUS4oOU5Bt14sWko7A=;
	24:tvmmWxKllTLpRpbgS4WEaOGIM4d4N8tfzKEW7UkW28p44DW6CPkvyffmvnFwRzligXRRE/DpLxdgn3bjjESqpMlTroxompMEsFWylkVwBK4=;
	7:uc6rWLOWH+OQxatWpLoKlYt/iP/PiDZg7dZ99jjvmqwvPt2oKf4R9Pkj9XV+yc66vXmd8Bi0odUiHOkzznXt20DhDrnKXeDEtq6Nh997SFoHPWditziQlcBmDauXLhwuBBj6zLY8rXZziYhVVTigfd3r9r4gIG3tL3bUWbTU6SW9BKopD3oX25S7Cl/7hcCjRgBEMJSNX0JPSgi7N7vMFAQGyVsCvB1kPK5/R8DK8+sJTI2uw5rexxL5SNP2Xzaao/fl7Hbch1t+G0tb0wLB3A==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2016 05:48:14.6400 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB581
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 3/6] gstreamer1.0-plugins-bad: Don't use the predefined variable name in glcolorconvert
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
X-List-Received-Date: Mon, 04 Jul 2016 07:21:14 -0000
Content-Type: text/plain

Using 'sample' as a variable name is an error in GLES3.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...ert-don-t-use-the-predefined-variable-nam.patch | 32 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch
new file mode 100755
index 0000000..b75f402
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch
@@ -0,0 +1,32 @@
+From b069672ace2b762f400ca6d318571cbedf5141f2 Mon Sep 17 00:00:00 2001
+From: Matthew Waters <matthew@centricular.com>
+Date: Thu, 31 Mar 2016 20:00:37 +1100
+Subject: [PATCH 1/3] glcolorconvert: don't use the predefined variable name
+ sample
+
+Using 'sample' as a variable name is an error in GLES3
+
+Upstream-Status: Backport [1.9.1]
+---
+ gst-libs/gst/gl/gstglcolorconvert.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/gst/gl/gstglcolorconvert.c b/gst-libs/gst/gl/gstglcolorconvert.c
+index f478faa..c23624f 100644
+--- a/gst-libs/gst/gl/gstglcolorconvert.c
++++ b/gst-libs/gst/gl/gstglcolorconvert.c
+@@ -261,9 +261,9 @@ static const struct shader_templ templ_RGB_to_PLANAR_YUV =
+     "    for (int j = 0; j < int(chroma_sampling.y); j++) {\n"
+     "      int n = (i+1)*(j+1);\n"
+     "      delta.y = float(j);\n"
+-    "      vec4 sample = texture2D(tex, (chroma_pos + delta) / unnormalization).%c%c%c%c;\n"
++    "      vec4 s = texture2D(tex, (chroma_pos + delta) / unnormalization).%c%c%c%c;\n"
+            /* rolling average */
+-    "      uv_texel = (float(n-1) * uv_texel + sample) / float(n);\n"
++    "      uv_texel = (float(n-1) * uv_texel + s) / float(n);\n"
+     "    }\n"
+     "  }\n"
+     "}\n"
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index 0df1b8e..7f6b918 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
     file://0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch \
     file://0003-glcolorconvert-implement-multiple-render-targets-for.patch \
+    file://0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
-- 
1.9.1


