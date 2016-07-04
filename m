Return-Path: <carol.zhu@nxp.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0062.outbound.protection.outlook.com [104.47.36.62])
	by mail.openembedded.org (Postfix) with ESMTP id 384456013D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:21:41 +0000 (UTC)
Received: from BN3PR0301CA0050.namprd03.prod.outlook.com (10.160.152.146) by
	BL2PR03MB244.namprd03.prod.outlook.com (10.255.231.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.528.16; Mon, 4 Jul 2016 05:48:13 +0000
Received: from BN1BFFO11FD014.protection.gbl (2a01:111:f400:7c10::1:144) by
	BN3PR0301CA0050.outlook.office365.com (2a01:111:e400:401e::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.534.14 via
	Frontend Transport; Mon, 4 Jul 2016 05:48:13 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD014.mail.protection.outlook.com (10.58.144.77) with
	Microsoft SMTP Server (TLS) id 15.1.534.7 via Frontend Transport;
	Mon, 4 Jul 2016 05:48:12 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u645m6uX030562;
	Sun, 3 Jul 2016 22:48:11 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 13:46:29 +0800
Message-ID: <1467611193-31658-3-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131120848930599859;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(2351001)(189998001)(68736007)(11100500001)(230783001)(5003940100001)(229853001)(77096005)(2950100001)(106466001)(8936002)(105606002)(110136002)(47776003)(50226002)(33646002)(92566002)(48376002)(87936001)(81156014)(19580395003)(8666005)(69596002)(19580405001)(586003)(85426001)(8676002)(305945005)(356003)(2906002)(50466002)(36756003)(97736004)(4326007)(86362001)(6806005)(76176999)(104016004)(7846002)(81166006)(50986999)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB244;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD014;
	1:QEHhh0xIUjPBOh+bsWBj9mmBe32zciwlcYXWP8/8noSFw92KE6r2o+oBC2JitLRkvBDWjH4HoL2L+x6RuVcbBJvIMc0zXKMzkPV38LFXlR7FUybnWtNmZBfEwWGjO4Bu9aHMnW26CQcsdDI/tLWz7AkX+aE7UFM7ZMQ0ogZEYevZXI76wIZOfXZTD0ZThSRwvqaugRqFJqbkoUYdkUTtLT00FDu3COpnxW+Uz9t8S69WMDj8OADyjbsaW6QWNnq9d1j40GbaH4LV2/kPmaPClYDftJyeuTuLEt8fgPPdA7UyJFL3HMxJ+MubrBE3XFfEK5hx4n0JOJ+eWZ/aZtYDAvPqAubao+igiNYaEid9PD5LET7TRsTxzdPK7+pTjWkeZenm+J7jCO/UDEIu/rFOs+O8hglvLqfz5UxwdTFzfCkJYJUaPSRdhrvmlSQJzWJNoAcyzwKeaLx6gFozs2xIlxt63RWXQ+SKepeKDsEunracWujJtoEHPI3HUwPU7Ca63JCgeHtTR7B1TpooU3B8Hj3mzxviVj1uuunvgFeqIT+yYcJoFnOsUTVjfGQP55Z4M9KLyVajgYc/sAN31S3uGxPFBqswcMLHBIZP86VKMoj9EEKtzGiJffybFTBGZ0j7dL+tIeB4d8NQJpnMXk1kaIJ6/taM/pW7NH2preFX7e3PlJ7i9o236ikBRPyetat814nIAhwlaFxERW6XL0iltY6nA9XbfIabzEJLsYAdkkk=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: aa04e585-475c-4a33-f3b3-08d3a3cec99e
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB244;
	2:U77MUZ2UbCS5s3uVxMA48YRaNwpmxFmUwISpukG9XcUerkv60p88SS6e2QF+ynlQ2bBDYyK7vyg90OTlFrvA3TgyUZ4Sk39V52VF9f68aiS+2i2OOCyZZdb8asWhl0ym6+IaNpDolSiBpmWSarzsBmflxMDbYjzYrr3urwXtQHjYBsrARxerJptJznHrn3ew;
	3:xw0QMrLt+BiGyHn1366VQisWSbXWjSFWAwW+IpWxn1zExvh6h3LsRTlSzXBr6ckQvuwy0kehMIv2zNVyON/htEdLUTRaDFBkec/s+hVbOYNaafYBn8Z48Pp3j68wHOSr1n6sl9W34+LaPXIFFp5iniueqppjt8r1j/7jxkuoACQcosapyZR0ncgWSig91tZ/VLIIOnwFsbcp0mMuj+O0IMf+Q/VKUjPeRqZsQSCA40A=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB244;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB244;
	25:81y9450nZW5gDco/LAxbmBZPljb5Bw+nqXToBpQG80ZSEgUcZs6IAHCMgP7mOImef33n2hy4Il8NeXPEC875qUQinwUl6SB5h735ba2FgZKnPqG+DtfYgYt3yiz+EyYQ0roQ6Of+bVeN3tUQ7oocEYWPWGlk/5Q8273N8+P7Ls5wHe0FOQbZUGhIBawQUpaW+tJIQpt5RN1hvusI8gzK2PeEXk2sWUe5u2S2mhLZOcTdSBNIYvJwNvKqV76Ni9CTzuHk6pSvjnV305wVDRcHRTtZJtmuofb6+EFg1k+zLGC4hLoXerqBS0ww/DUgrtX9sEeBZwHOrnEM3QyVHPutqcR/C06fO4UGgff+eJzy5DchGFiWwMqCUhMjJuYMtOyn9TpUg/RG9IKvqjnnhWs1BxaH1rSMuLd87U7BfsDZeW/wVDW6cw5UxdEt+He9EvsyeU7Pq/2tE6zBTrqGg4Q7EPRIXrvHr2NMk6t5XzGvwwBmnL5isYr1YN+YldRqSekwM30Hic/M3CyjsFxoQRGUTQNgeHUIacGHJyXAMsByX7F4rHNfu/K6GAnYjG+NgYeD51YziwGbC9W4sV4GPtllGTieQONVulRcwqxuZhvXlQTrU6QOchS8QSjYAuNd7oWAmA9JcysCmr1XaAPvbkaRcJj4JPI8yyWoRi7PHw54j7Bsvo5iR4Sw58cEGPUHX+nfZ9Wwyf2dxipzup9htWeOMqBJPgG6erN0xDqrmlYXE8Fh04ylkspnMybWwbBXyLln
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB244;
	31:1k99A2Qh2kMK4MvrlEo1+SIHgKbSxRV3z2T063E/475ZYjUiz4hRNdt0HCAH2EOhWgON7EJub1kChyRtSIoPV5jUAezKSEUY+e8OHC0wklsIu0FcFaXjDOvP/aYU4uqDtmMeDxXMx42xJA+G5F2L9ym/1hTI5sY0OaZfM0Zhb8qokqiaHliOCQK6eYPnUz7nDyObn2ZhR0IBvzXCpUtNMQ==;
	4:9mH9G1cMwZuEokhFJTXpsOZEfJyQtFTYox0nAycq+01p2Tph7Mhs52I1WR7wnATNqTf/t4+6TW0Vw5znNWKGYVMs3O2SibyPLXgjNObPdK/0dP1MVM6zBnEG6Ac6jF5aqKACycoh5nx+zgQSI8Ihi35DQL0hcUZ3X1eo/QON30FTFa5Bw+75CymDfuQ4h9J172UHJxO4tBIAI1wOkNvlxf4W+nK4zfZ38EKE4ublIdFy9Zd3Pc/aL2COiXasBKmxBI/2fC9jvn+xAgA5t7jqOGlnMghvzpE59UyofDf3rGsSp8NwX5P/8X46lqQoLgOp2H+G1BK//OMZxBywJOrSDIA4kZ0qhglTdv9BOpkKaIwkGNB7RZjVb6VEODwoLfuodL68epLJFUYfCeeOuPVud7S7SyjDCizzzSK0ycnDvwb2w0rXxiymyvbuuftVJ5ADc2dpNsuMNNU1W+bsu1lf86yWwg80FCpLbZHQ2b/gCkrAvCxs30wIvmzdcxq0UdGAiQmAeflw2u3GkSRJ870oBYMoS1MehD8REtQpfvzJsJAcqIFboUUd1zBwrQVkdwvA
X-Microsoft-Antispam-PRVS: <BL2PR03MB2442A10763759CBC97E84E7E9380@BL2PR03MB244.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(13017025)(13015025)(13024025)(13018025)(5005006)(13023025)(3002001)(10201501046)(6055026);
	SRVR:BL2PR03MB244; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BL2PR03MB244; 
X-Forefront-PRVS: 0993689CD1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR03MB244;
	23:Ki41Si3ThroRy/DPi+KrJ9Fc47TRJSGlzl1ycpyJmt?=
	=?us-ascii?Q?N11tKG6lNP71NMaZfL2fQj2Yguvu0auzWzHY6ITUMZXom/4Pc0P4Jm5FRdSt?=
	=?us-ascii?Q?oVz4UFBt+XduDUAtCjpJW1E/7Bk1HpYOcXzXSFwZpZw8zh2B/qYpyS9M67my?=
	=?us-ascii?Q?85cc5KtXCn92/uWC3C2MxjLbH8yOUNoodRQc95z+/ZgeSaMtmHDl7huOTlde?=
	=?us-ascii?Q?UiBiCtVqZKUuEa3wMPNtIu8U/I+gwtYfVRzmKQo7q6XZNooXh49i0hflgrcq?=
	=?us-ascii?Q?mQbRaoF1ONhABXwAEDMnSvGEqMEQmUssGPzlI/Y5aS2MlGR3aDQm5ibuioBV?=
	=?us-ascii?Q?sCOW4+VmKyLsyZ6PFYl3Z5KevjyYb+LzUBshDKDYyMUmRpfLaTbKtmz85+1Y?=
	=?us-ascii?Q?ktDrnWx9UV/STHCcTqi5Hg3qjmuFZfqnD27g62JwDImSjxpjdbGyuqcTAQ0T?=
	=?us-ascii?Q?rVh/Flkje2rED/Vq8oqfp2vPMa+uunTtFZed4s5Eb9Rw5gD9YcFcx41Sl2Oc?=
	=?us-ascii?Q?132qyZxP0g2giItwz/YC+uKGAzX/YNZwyGRFyElNYTxELhpMqZkx7XQp13nF?=
	=?us-ascii?Q?Fs5PcdHschirHoQggyHEhvV0mmTpKkKeK9LuMt46v6ez+FrLmY+HnKFRKSL3?=
	=?us-ascii?Q?U7jYvwYumHrFuQ3xhX/XulIKEQqr0NaZd7MhJXNvqZhQd9rRSl1AU63cSRqL?=
	=?us-ascii?Q?BcdGRhEoKJRuBs5oVQB8src0xft6rtAOTYKsKcZWYZJA1otjd7lGBk0sfw2k?=
	=?us-ascii?Q?6erVdASAKu4srnij2HUV4SIJy0EPyHKCX/yaauW/ukcqkxVbggjuayh+M5Gv?=
	=?us-ascii?Q?HPedwR3gIYSNz/3Zn/uHmsXhUWXgyY+AolW0pzD+EDZOODvMmlQMk43J/Ohr?=
	=?us-ascii?Q?KgOP9A0J2yJReshrA/5hBcfwvOuU0gQZSb6Mr2RiBp8QZJFDUU2IwaFm8f/W?=
	=?us-ascii?Q?vAcU37+bA4zJ4azdmYpMJ+vwPCyZ1bXF3GbiRNCYGrEbOJcwyaLaxvC0qONh?=
	=?us-ascii?Q?DCdZOThJhUyG8GnI882GYYxZEObs5GQPGlRKYYffc3KmRGvJAsoU52w9Sg//?=
	=?us-ascii?Q?HD1Sox4cH2hECVNVlhc/43wVAOKjvmBJVzP3uqanKsqjODGSijO0nsM4RMM6?=
	=?us-ascii?Q?9lPQuNjf1/X86XqNKdOF6OzdYchhvA8M8SsOeYR4yQCEMOBVEWQUwRVI5uhe?=
	=?us-ascii?Q?H/BjxhRmtxeUA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB244;
	6:zb4zKBQMY9XRvW7yOkwBLKcDsUY5v3RGkIg2eImYUDiZoA3x8iK1Ld2a0wQ6CMeMFSBXG34vt1j2wmzqEZLKEdg1crf3rHbKpUKu4/zGM9dFIX8Sv4AY8TjPzD7WgIpNIBzTWC7LtNnkPS2n9cnxOAn4UT0Aopfr4MaDl1ODYOt719UjtXNqcG4DkFwBswHy3to6oyO0fUxpt98EogmzrWdt5zEp8wc+filmUtjDIaWWti87b07YgC96Suiaup3Frd/XqYBp/X2kigS6HKAwWOnep6h5Hi4xZjUXl2kGzGk=;
	5:txVO5SSClCCGa5riFHroFs9OZEgQbyF0tGRhOSJAaHWyPUp5RNKcLgo1hh+3/gzHzbVQtKyU2NZEbgSBG8SQUvC6p74d39yzt+tmObzf4Jhd20FXPKbI2ta/YoQFgKGbgP6Vjkr7ue05JQouhuoxzvgtq+Y2UAIB3VIMl630X6g=;
	24:rXqb+lw6yUGXW6IpTnN52rouy+TQ/amgWyPm0bnUmNypUDg914+fd5zt7w21VTse3uq7EF1/s1GwNyabjtD3R5q+buv9940kwYg1BWpQKcc=;
	7:5zQkIaD5+j5RoyLWVIDeKkL8txDXFGNb1yXbkzxzaAHCeZfbtTgaMhsMTjUO4m5tpDdWPnkSagKf8ADaVUtNMZYOKBOeYeD6lbXT3IZA6KhnjIlD5G04QD0rdf9h5cDdD1P2b7S3lI9j2baP1jzGghq6bGSVLx3BFeE6inbDIWwSGC4qmsv57rE8ls0y4Mg7B1qeykBt9sGU4WoQQl8SXrhAjVfHk0/hUS7osAtzxIsZPKbTctrwy2yeAZ0D82At
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2016 05:48:12.8415 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB244
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 2/6] gstreamer1.0-plugins-bad: Implement multiple render targets for GLES3
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
X-List-Received-Date: Mon, 04 Jul 2016 06:21:42 -0000
Content-Type: text/plain

There are numerous slight differences required between Desktop GL and GLES3 for
multiple render targets. Need to realize it.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...ert-implement-multiple-render-targets-for.patch | 244 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |   1 +
 2 files changed, 245 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch
new file mode 100755
index 0000000..31d8e05
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch
@@ -0,0 +1,244 @@
+From 127e517568490fc147211d8b2fb4da01cecbbeb5 Mon Sep 17 00:00:00 2001
+From: Matthew Waters <matthew@centricular.com>
+Date: Thu, 31 Mar 2016 19:50:28 +1100
+Subject: [PATCH 5/6] glcolorconvert: implement multiple render targets for
+ GLES3
+
+There are numerous slight differences required between Desktop GL and GLES3 for
+multiple render targets.
+
+1. gl_FragData doesn't exist at all and one is required to use
+   'layout (location = ?) out ...' instead.
+2. gl_FragColor doesn't exist, same as 1
+3. texture2D() has been deprecated
+
+Fortunately most of these have been taken care of with GL3 and the shader
+mangling already exists so just expand the conditions they are used in.  The
+gl_FragData issue requires a new mangle pass though.  We also use this new
+pass on desktop GL for consistency.
+
+Upstream-Status: Backport [1.9.1]
+
+---
+ gst-libs/gst/gl/gstglcolorconvert.c | 125 ++++++++++++++++++++++++++++--------
+ 1 file changed, 99 insertions(+), 26 deletions(-)
+
+diff --git a/gst-libs/gst/gl/gstglcolorconvert.c b/gst-libs/gst/gl/gstglcolorconvert.c
+index 490ec54..f478faa 100644
+--- a/gst-libs/gst/gl/gstglcolorconvert.c
++++ b/gst-libs/gst/gl/gstglcolorconvert.c
+@@ -1802,10 +1802,11 @@ _mangle_sampler_type (const gchar * str, GstGLTextureTarget from,
+ 
+ static gchar *
+ _mangle_varying_attribute (const gchar * str, guint shader_type,
+-    GstGLAPI gl_api)
++    GstGLAPI gl_api, guint gl_major, guint gl_minor)
+ {
+-  if (gl_api & GST_GL_API_OPENGL3) {
+-    if (shader_type == GL_VERTEX_SHADER) {
++  if (shader_type == GL_VERTEX_SHADER) {
++    if ((gl_api & GST_GL_API_OPENGL3) || (gl_api & GST_GL_API_GLES2
++            && gl_major >= 3)) {
+       gchar *tmp, *tmp2;
+       GRegex *regex;
+ 
+@@ -1821,7 +1822,10 @@ _mangle_varying_attribute (const gchar * str, guint shader_type,
+ 
+       g_free (tmp);
+       return tmp2;
+-    } else if (shader_type == GL_FRAGMENT_SHADER) {
++    }
++  } else if (shader_type == GL_FRAGMENT_SHADER) {
++    if ((gl_api & GST_GL_API_OPENGL3) || (gl_api & GST_GL_API_GLES2
++            && gl_major > 3)) {
+       gchar *tmp;
+       GRegex *regex;
+ 
+@@ -1837,28 +1841,48 @@ _mangle_varying_attribute (const gchar * str, guint shader_type,
+ }
+ 
+ static gchar *
+-_mangle_frag_color (const gchar * str)
++_mangle_frag_color_data (const gchar * str)
+ {
+   GRegex *regex;
+-  gchar *ret;
++  gchar *ret, *tmp;
+ 
+   regex = g_regex_new ("gl_FragColor", 0, 0, NULL);
+   ret = g_regex_replace_literal (regex, str, -1, 0, "fragColor", 0, NULL);
+   g_regex_unref (regex);
+ 
++  tmp = ret;
++  /* search and replace 'gl_FragData[NUM]' into fragColor_NUM */
++  regex = g_regex_new ("gl_FragData\\[(\\d+)\\]", 0, 0, NULL);
++  ret = g_regex_replace (regex, tmp, -1, 0, "fragColor_\\1", 0, NULL);
++  g_regex_unref (regex);
++  g_free (tmp);
++
+   return ret;
+ }
+ 
+ static void
+-_mangle_version_profile_from_gl_api (GstGLAPI gl_api, GstGLSLVersion * version,
+-    GstGLSLProfile * profile)
++_mangle_version_profile_from_gl_api (GstGLAPI gl_api, gint gl_major,
++    gint gl_minor, GstGLSLVersion * version, GstGLSLProfile * profile)
+ {
++  *version = GST_GLSL_VERSION_NONE;
++  *profile = GST_GLSL_PROFILE_NONE;
++
+   if (gl_api & GST_GL_API_OPENGL3) {
+-    *version = GST_GLSL_VERSION_150;
+-    *profile = GST_GLSL_PROFILE_NONE;
++    if (gl_major > 3 || gl_minor >= 3) {
++      *version = GST_GLSL_VERSION_330;
++      *profile = GST_GLSL_PROFILE_CORE;
++    } else {
++      *version = GST_GLSL_VERSION_150;
++      *profile = GST_GLSL_PROFILE_NONE;
++    }
+   } else if (gl_api & GST_GL_API_GLES2) {
+-    *version = GST_GLSL_VERSION_100;
+-    *profile = GST_GLSL_PROFILE_ES;
++    if (gl_major >= 3) {
++      *version = GST_GLSL_VERSION_300;
++      *profile = GST_GLSL_PROFILE_ES;
++    } else if (gl_major >= 2) {
++      *version = GST_GLSL_VERSION_100;
++      *profile = GST_GLSL_PROFILE_ES;
++    }
+   } else if (gl_api & GST_GL_API_OPENGL) {
+     *version = GST_GLSL_VERSION_110;
+     *profile = GST_GLSL_PROFILE_COMPATIBILITY;
+@@ -1867,22 +1891,28 @@ _mangle_version_profile_from_gl_api (GstGLAPI gl_api, GstGLSLVersion * version,
+ 
+ static gchar *
+ _mangle_shader (const gchar * str, guint shader_type, GstGLTextureTarget from,
+-    GstGLTextureTarget to, GstGLAPI gl_api, GstGLSLVersion * version,
+-    GstGLSLProfile * profile)
++    GstGLTextureTarget to, GstGLAPI gl_api, gint gl_major, gint gl_minor,
++    GstGLSLVersion * version, GstGLSLProfile * profile)
+ {
+   gchar *tmp, *tmp2;
+ 
++  _mangle_version_profile_from_gl_api (gl_api, gl_major, gl_minor, version,
++      profile);
+   tmp = _mangle_texture_access (str, from, to, gl_api);
+   tmp2 = _mangle_sampler_type (tmp, from, to);
+   g_free (tmp);
+-  tmp = _mangle_varying_attribute (tmp2, shader_type, gl_api);
++  tmp =
++      _mangle_varying_attribute (tmp2, shader_type, gl_api, gl_major, gl_minor);
+   g_free (tmp2);
+-  if (shader_type == GL_FRAGMENT_SHADER && gl_api & GST_GL_API_OPENGL3) {
+-    tmp2 = _mangle_frag_color (tmp);
+-    g_free (tmp);
+-    tmp = tmp2;
++  if (shader_type == GL_FRAGMENT_SHADER) {
++    if ((*profile == GST_GLSL_PROFILE_ES && *version >= GST_GLSL_VERSION_300)
++        || (*profile == GST_GLSL_PROFILE_CORE
++            && *version >= GST_GLSL_VERSION_150)) {
++      tmp2 = _mangle_frag_color_data (tmp);
++      g_free (tmp);
++      tmp = tmp2;
++    }
+   }
+-  _mangle_version_profile_from_gl_api (gl_api, version, profile);
+   return tmp;
+ }
+ 
+@@ -1899,15 +1929,18 @@ _create_shader (GstGLColorConvert * convert)
+   const gchar *strings[2];
+   GError *error = NULL;
+   GstGLAPI gl_api;
++  gint gl_major, gl_minor;
+   int i;
+ 
+   gl_api = gst_gl_context_get_gl_api (convert->context);
++  gst_gl_context_get_gl_version (convert->context, &gl_major, &gl_minor);
+ 
+   ret = gst_gl_shader_new (convert->context);
+ 
+   tmp =
+       _mangle_shader (text_vertex_shader, GL_VERTEX_SHADER, info->templ->target,
+-      convert->priv->from_texture_target, gl_api, &version, &profile);
++      convert->priv->from_texture_target, gl_api, gl_major, gl_minor, &version,
++      &profile);
+ 
+   tmp1 = gst_glsl_version_profile_to_string (version, profile);
+   version_str = g_strdup_printf ("#version %s\n", tmp1);
+@@ -1945,9 +1978,37 @@ _create_shader (GstGLColorConvert * convert)
+   if (info->templ->uniforms)
+     g_string_append (str, info->templ->uniforms);
+ 
+-  if (gl_api & GST_GL_API_OPENGL3) {
+-    g_string_append_c (str, '\n');
+-    g_string_append (str, "out vec4 fragColor;\n");
++  g_string_append_c (str, '\n');
++
++  /* GL 3.3+ and GL ES 3.x */
++  if ((profile == GST_GLSL_PROFILE_CORE && version >= GST_GLSL_VERSION_330)
++      || (profile == GST_GLSL_PROFILE_ES && version >= GST_GLSL_VERSION_300)) {
++    if (info->out_n_textures > 1) {
++      gint i;
++
++      for (i = 0; i < info->out_n_textures; i++) {
++        g_string_append_printf (str,
++            "layout(location = %d) out vec4 fragColor_%d;\n", i, i);
++      }
++    } else {
++      g_string_append (str, "layout (location = 0) out vec4 fragColor;\n");
++    }
++  } else if (profile == GST_GLSL_PROFILE_CORE
++      && version >= GST_GLSL_VERSION_150) {
++    /* no layout specifiers, use glBindFragDataLocation instead */
++    if (info->out_n_textures > 1) {
++      gint i;
++
++      for (i = 0; i < info->out_n_textures; i++) {
++        gchar *var_name = g_strdup_printf ("fragColor_%d", i);
++        g_string_append_printf (str, "out vec4 %s;\n", var_name);
++        gst_gl_shader_bind_frag_data_location (ret, i, var_name);
++        g_free (var_name);
++      }
++    } else {
++      g_string_append (str, "out vec4 fragColor;\n");
++      gst_gl_shader_bind_frag_data_location (ret, 0, "fragColor");
++    }
+   }
+ 
+   for (i = 0; i < MAX_FUNCTIONS; i++) {
+@@ -1959,7 +2020,19 @@ _create_shader (GstGLColorConvert * convert)
+     g_string_append_c (str, '\n');
+   }
+ 
+-  g_string_append (str, "\nvarying vec2 v_texcoord;\nvoid main (void) {\n");
++  {
++    const gchar *varying = NULL;
++
++    if ((profile == GST_GLSL_PROFILE_ES && version >= GST_GLSL_VERSION_300)
++        || (profile == GST_GLSL_PROFILE_CORE
++            && version >= GST_GLSL_VERSION_150)) {
++      varying = "in";
++    } else {
++      varying = "varying";
++    }
++    g_string_append_printf (str, "\n%s vec2 v_texcoord;\nvoid main (void) {\n",
++        varying);
++  }
+   if (info->frag_body) {
+     g_string_append (str, "vec2 texcoord;\n");
+     if (convert->priv->from_texture_target == GST_GL_TEXTURE_TARGET_RECTANGLE
+@@ -1975,7 +2048,7 @@ _create_shader (GstGLColorConvert * convert)
+   tmp = g_string_free (str, FALSE);
+   info->frag_prog = _mangle_shader (tmp, GL_FRAGMENT_SHADER,
+       info->templ->target, convert->priv->from_texture_target, gl_api,
+-      &version, &profile);
++      gl_major, gl_minor, &version, &profile);
+   g_free (tmp);
+ 
+   strings[1] = info->frag_prog;
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index 7cd14c7..0df1b8e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
     file://0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch \
+    file://0003-glcolorconvert-implement-multiple-render-targets-for.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
-- 
1.9.1


