Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0134.outbound.protection.outlook.com [157.56.111.134])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0367002B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:51:19 +0000 (UTC)
Received: from BLUPR03CA001.namprd03.prod.outlook.com (10.255.124.18) by
	BN3PR0301MB1170.namprd03.prod.outlook.com (10.160.156.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:43 +0000
Received: from BN1AFFO11FD012.protection.gbl (10.255.124.4) by
	BLUPR03CA001.outlook.office365.com (10.255.124.18) with Microsoft SMTP
	Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:42 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD012.mail.protection.outlook.com (10.58.52.72) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:42 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROc015522; Mon, 18 Jan 2016 02:35:41 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:56 +0800
Message-ID: <1453109582-25485-8-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD012;
	1:Dtb/ECVUi6NaHQJqW0C+vHeidbAP8XRHa0F+hyemB5VI/mzl7LeNOwW0CnEmcff2oISczfEPNzNbh7xVC30u1yqZCUsiIdfHzHDqZK1d8FzT0pJ6FoBTUpMxvA6IMuB35dFEDZ06yb8SL215RdmXk6n8NrUK5U1JyAkgCjOGxkb/tQa7VWH65Rno+aXnJfW49RzVtIR08nZFlFVHxJKZfeVgBRZ6qwx8mdp9pdrKXJPR8uUq1Z0qFjNk4djgAzRpgiUrOqpn6nkDcWDsLScYLGmsMxAPAN80bz//zgyrj3n5GVartuMNe7uyZFa3sLFLMLJ5UBfuto6ThGBntlg/w7JnlJtLlomucxjQffz3dLq0g84lLbyCu8D/V0SkmNn6ltbUZyHP5leOPFmnjALY2S0E8H154So3DS1FZnphTZE=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(230783001)(110136002)(85326001)(450100001)(4326007)(586003)(50466002)(1220700001)(5008740100001)(87936001)(106466001)(92566002)(2351001)(229853001)(86362001)(81156007)(19580405001)(19580395003)(76176999)(2950100001)(36756003)(2906002)(97736004)(4001430100002)(77096005)(6806005)(5003940100001)(50226001)(33646002)(48376002)(107886002)(5001960100002)(15975445007)(189998001)(50986999)(575784001)(47776003)(104016004)(1096002)(11100500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1170;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: e697996f-ca3a-4803-7ffb-08d31feabc13
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	2:0/4poBX2cCq3Gyd00Pg2Ln30PCMaKX/EyhgKevPLfRV+hBaLIG2qFaQLSW9SAJr8eGPtX2nGwkedcYqmTv46uu4wqNjAXArzO/lHlTgqI0CG/SPo3J4MoaOXaC4rm/dn9i5k0U8x4BLiTzEDWLFUcoup1HdVVsqgB/i7J2j+sf7JQUOIwIGhfa8UNVNEXQs9;
	3:Yf58cdL3t8NNvkt3FWqScGPY+Fo9EKqZ3vR3iW7URXrGUhMfV4ETKe7if/Cda0bEePxVdOcpEFOpFP+uY8EMQwycpyiOfrK9xLlhvAymeQgzXLGD2LpdUkwxxXmH4wO5rs7IcriyMf0EVMhakDy3mQApPZyQeo4l8xUoIuMfFdU6H1h88XZ3xVLc6g3zzBtBkM629ipIbRrmp/AloKFD0oC56uVx2spTtRI1y/EyYTk=;
	25:3Y1FPdJu1Gh63JY/iRLqilD478+bwXzFoL1bmcrW7vVtCRLF+8tIG59Qe+vWLc/ZD0M8hjr9LSde54A1QG6FQGNKT/LET2uEAXooCUUwsZRs4NEzLPwcDtJ1gm31TC7P/eYn5fgmlDfh4KxGkGxlwxKi9WUlG+O0g1jsZp2fG8es9Yrh+9byCFMdgfW7t1ZAiMYDMymH60610ZjbXJxjRczymIrm+wXSHHC0OnqTgaUOOjkWOl3G7LFJBXAgDWf9
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1170; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	20:5KPdgWavvJMfFp/Wl/v+OSVXu2VCoUF4SceNFdtfxe++gO7h+j41bc2UU/APUqk+rFbX2szDNaSSJsOVOnLu352WbOQ1iLo7f+SZccAYEJTEjoM55MSXaZWdnedTKWdj2sTyQo/xDAsGBHyrqIReL8gYHVIa+NEevEAOgd/18JCrDcNmfEWG0agSmbef7/yf1Lu4mewzK8WzMkRCoJ1DW51ILBK6vGcNbZcyjMjEIdNT2iI+nINyYhP15l4Nu//1nlJMK87yGSgJgR1gHvtmtoG2JSSyEChYQqiFQj0iijKjZmMFwoBYinmbPsHmHGT2Fh3y6HNEA4Y9NRKC7nNNRStfGZsGRDWFLqCtpqMb0LMIPdCc4BGMS4qo80FWX7593hV3W9w7u0yjfcwz0R0IzkGQ5ARjWL0LwsR/JtHBtkizP31lAkj+mTbZOkPUVL2D;
	4:MUCsIUOv/oCgYhIZIhkSnwhfHdkYS0irax5no4lbuexqwRAYXG/H4V033o3D0eju2x/KE8rZ+Yua8AuEnNbvAxGLgzuQ1xzJXtFlqyXGbu8LNHSaEl/95tZHpCVtpq6lGyiVOt37aMRoXL+YCog6H6CFX1MJ1yQWledpyTPSvGMcMbY0fpLA1eL+nRjVoK0GOOYKemKPRwfLhM/XwDz69rN4frNMCKB/LNXu2SKTlU7O31lTpt1/SfdQJfnWAFgEnSUOUtY7HjJyslnTwLKbSN3DWmn8Bxgb/m5oAcH4B2NxPx9SyLhCpuAg/a5wON1u2ZQlzJO5cPmwh88FZXzcHyINoXys/eWzIkqVhw1xDWRqzx4LK8hRazlZvPFnZOg3QySTA1aX283YlDzx+qv7LdiC+vH7h+Py/IWvVbHWyjAVzXfQpQAP5pw287p5aXRh4eYmSJ+hT2L/D+W4IytAsduAr6pte0k3b0JH31PQdB6Uv2LXHIPE87ZimdpYHIRb
X-Microsoft-Antispam-PRVS: <BN3PR0301MB117093DCAAED8B03DD0A625986C00@BN3PR0301MB1170.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13018025)(13017025)(13023023)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BN3PR0301MB1170; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1170; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1170;
	23:JpLkO+5UnUIlJfH/tMWVrEr4Y9NBo09CPakJshJ?=
	=?us-ascii?Q?bizoO8jnrtHZrOrvCcP4rWDF7km96LfL+9yk21mdK4CyPTVSXTZMoVXuqBYc?=
	=?us-ascii?Q?NNsflj5Q1Q/1xI160v4kT6L1WBP7GQ0XifYM4o0UztVjRGO3urmTAf6ZJjxn?=
	=?us-ascii?Q?84CvvVKvj0vqyIsU5VgJSPnOl8qt+d831VeyRjjtmucPDCuAhhUFr7GuONIh?=
	=?us-ascii?Q?n1zXtK/A8N7wWHcE1R+fGPLjttpgFxDOc69wu86/Odsy5fX0uma5BcjUzGEI?=
	=?us-ascii?Q?Dz0Aea/VOq+Viiob3oWkm7CaSREUOfjuxvAXpBo8ry/2+ymDvuZ9+dZNxnvI?=
	=?us-ascii?Q?R/rcRcdkxVTlKlzrnZrN9vsRM/59oXC63Ggskp/0TW+8r9PwBcbBX8qjHcWR?=
	=?us-ascii?Q?h6QFcl56jTjvX4OjOcW8rE4EIaTU5DU1jI+QZ1bTvsyGr0LiPKDOoiCXUbUi?=
	=?us-ascii?Q?MztxU1HgOz6MCtEktXgaTLiHbadHT5vhSZwoTVj0aybYgk2yGXNnFeC4J0dy?=
	=?us-ascii?Q?lZ2YSscM4K3AUfhaAtzqW88Bldt+XK6MwEwZHK1rZ8l58U8eDjfoYOn/pgo6?=
	=?us-ascii?Q?0bOCb5kiydOQ6aRfNo+vZgUTBTxsX43MlMACxXnT1dzJB9zB0y70wIhBR4LV?=
	=?us-ascii?Q?ec1I2fWnkC8shNJFXbFNP+ZStpwnSN3j1qVb6jRI6KyW3wZ2/lMHGN8akEiq?=
	=?us-ascii?Q?5PyBnMls2PiKsudzQNjR4AgPLrHax3l896Bl9LraxkooLJFrtyIgKcJl8PIs?=
	=?us-ascii?Q?2BCi+qtiKIsZmMOf6Arr2G3OoMmbytimEd72pM+rW3dJqGpm4ZmUG2FCFrBz?=
	=?us-ascii?Q?rse4gbbpXujVDDkkYcB16q76GQoP2hNfyRbbMn3AIz2pAJKCeBSGp8V0KCS4?=
	=?us-ascii?Q?fF8aCdDMFPkQxyfl3OjqAISONjQF5EdWHfr7wuisvAp3cPLNyKhbp0uCbNsw?=
	=?us-ascii?Q?gndcHq6RH6s5OU3LlAee5JGkqpZNbKJ2osaD1jQ6/yK+ZIGkIGBJOkmwVGDV?=
	=?us-ascii?Q?PEUh0CDTHwg7uFGu0EHTKmas+n8IEMed4YBekKfvhodB1CpjtI2HFREhHLMI?=
	=?us-ascii?Q?lQr5QRC1S3x+e/fxFq7xlRP+NqI+rRLEk6VIuBgRdQKefBys1czt8M6Jt1Nd?=
	=?us-ascii?Q?5q43m2ZxLMPC4gXpmvAaiQOVq8xOEwVqXolIbyEV9GM7LOfO2XTx2m6z5QQA?=
	=?us-ascii?Q?puZe0yZ4v4sDhm1Q=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	5:BuliVSmgffOPNM+v8EOWrz8n2xRseBqbcLrzaK/A3uVpr8WFRq5uz/Nok+JISPofsU75dPl+p82Xgk7qEQkLYXmKQt/D9b0al91HAFg+RYLL+HaDnQhnMBkDQdrN2Cr4MyLoFrBFDPDt7e6SiahwXA==;
	24:+zFgXFSiO25FBhVod7Qs6XVnoXbe895QXzhcVUkTLAbA+N1nAsa1UodzixGyQxyojt3GkLcZIDNMG9MvIyVVkWUyOUAFWPPnYJNWHTRYcGg=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:42.5858 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1170
Subject: [poky][PATCH 07/13] gstreamer1.0-plugins-bad: Fix mpegtsmux get wrong pid
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
X-List-Received-Date: Mon, 18 Jan 2016 09:51:20 -0000
Content-Type: text/plain

When camerabin use mpegtsmux as muxer to start video recording and then
stop video recording and then start video recording again, mpegtsmux will
get wrong pid.
Need to get pid when create streams.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...pegtsmux-Need-get-pid-when-create-streams.patch | 45 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch
new file mode 100755
index 0000000..f2c063f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch
@@ -0,0 +1,45 @@
+From 3e0bc017ca9b4e093484ee6b3b73917918364e92 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Wed, 22 Apr 2015 18:06:35 +0800
+Subject: [PATCH 02/10] mpegtsmux: Need get pid when create streams.
+
+when camerabin use mpegtsmux as muxer, start video recording and then
+stop video recording and then start video recording, mpegtsmux get wrong
+pid.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=748288
+
+Upstream-Status: Pending
+---
+ gst/mpegtsmux/mpegtsmux.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/gst/mpegtsmux/mpegtsmux.c b/gst/mpegtsmux/mpegtsmux.c
+index c3a0dbb..5a6d9e1 100644
+--- a/gst/mpegtsmux/mpegtsmux.c
++++ b/gst/mpegtsmux/mpegtsmux.c
+@@ -761,6 +761,21 @@ mpegtsmux_create_streams (MpegTsMux * mux)
+       } else {
+         ts_data->prog_id = DEFAULT_PROG_ID;
+       }
++
++      if (!ts_data->pid) {
++        gint pid = -1;
++
++        name = GST_PAD_NAME (c_data->pad);
++        if (name != NULL && sscanf (name, "sink_%d", &pid) == 1) {
++          if (tsmux_find_stream (mux->tsmux, pid)) {
++            GST_WARNING_OBJECT (mux, "Duplicate PID");
++          }
++        } else {
++          pid = tsmux_get_new_pid (mux->tsmux);
++        }
++
++        ts_data->pid = pid;
++      }
+     }
+ 
+     ts_data->prog =
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 284e1f2..3f30f86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
 
-SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch"
+SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
+            file://0002-mpegtsmux-Need-get-pid-when-create-streams.patch \
+"
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
 SRC_URI[sha256sum] = "650855e39ff56a8bb6cb0c192109c5926ce12f536d06e19ebf829de71ef396fe"
-- 
1.9.1


