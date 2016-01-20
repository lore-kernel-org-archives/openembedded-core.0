Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0113.outbound.protection.outlook.com [207.46.100.113])
	by mail.openembedded.org (Postfix) with ESMTP id 6AABA71951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:54:34 +0000 (UTC)
Received: from CH1PR03CA002.namprd03.prod.outlook.com (10.255.156.147) by
	CY1PR0301MB1179.namprd03.prod.outlook.com (10.160.165.22) with
	Microsoft SMTP
	Server (TLS) id 15.1.365.19; Wed, 20 Jan 2016 09:54:33 +0000
Received: from BN1AFFO11FD046.protection.gbl (10.255.156.132) by
	CH1PR03CA002.outlook.office365.com (10.255.156.147) with Microsoft SMTP
	Server (TLS) id 15.1.390.13 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:32 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD046.mail.protection.outlook.com (10.58.53.61) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:32 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0K9s9RK004523; Wed, 20 Jan 2016 02:54:31 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:51:37 +0800
Message-ID: <1453283501-3982-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453283501-3982-1-git-send-email-b54851@freescale.com>
References: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD046;
	1:Lq+JyiEZLq/+UQRAc5F5NVQYzCx6pL/quX/2Qw9RgLPRm82ZXuXI04jvzvaPgPHdd8Hlc9sFC8sC1Id+5vKMKo9jYjShCRddtbreWv14oiK5MdECt750RinkT4nblfoPAQICTAZrOOMC9jfddbvFxdM8hm0G0MS3xmq/8fBb2PdqBRkzw9g4Elmw/kiQQT7zZsy011Y3XrXzPJX3KPo+jrZgZ5KXVS6WBEghRc9gVrHzH5qvUbs/i6MIBF/wppp+T2fFKkN1uzUCvqER5ilbtYPY8t1088LZ0Dn+2jH17BXI55QxxwWJpQz4sPKENtdvonsMKSruC9ZWnAR0/C4PvfWQReVhnoocFIvXFO/YLTyXBDav2ZT3Y/Z81rSCK1QRwKB50t3+ylZCmvjKvTIp9Y9X16MPw1W01KTZOVfFzQ4zpvNyJMs9ywbKwEwMSPzU
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(97736004)(92566002)(77096005)(1096002)(450100001)(36756003)(104016004)(86362001)(81156007)(189998001)(1220700001)(2906002)(107886002)(575784001)(6806005)(33646002)(110136002)(230783001)(48376002)(4001430100002)(2351001)(76176999)(5001960100002)(50226001)(2950100001)(19580405001)(229853001)(586003)(19580395003)(5003940100001)(15975445007)(106466001)(85326001)(50986999)(4326007)(47776003)(50466002)(5008740100001)(87936001)(11100500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1179;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9680a9bf-5e6a-412e-8c52-08d3217fb2ab
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	2:Ch3AphoHiL//IlnOLhOYdQQONCdrCUyfnp1Z6mvkNoS4nl0GzgOo7ZFQlfE0dOleuedeDShA00G7RGDYG9fq3iscWjlkQN6wkgTJS8NxCrRI5htbS9XzKbkp6hwH3Fc/68BFspWzIaaY6zXqQOBLn8Iiz+T22te1zNtjDxVCTjmCR8NtYvapgqXYBdZe2bvx;
	3:kUyRN4agnSFIYJpqSeQK059mhjMOpgQz3AgB+YoY623Ki2lnBaQBcML3VloBDa71E6eerPJce5bAJDhtYEETD1QQOQRt8LS8ur+tl/W4zlXsk562n7haLT5I5br+xeeWny7njf3Z0xLmZAVPEZKpncEoHsweB3oA/FJaEfGDLOSrTPEk8Tm8Ufhdkzj21eNe9wEymrJ42/eM2pzqXOIxD4r/xiFKJxEcNj5flwNnHCE=;
	25:iz1gRTux+d1/y0Pu0U0lR1vOASTrvy80vpnuzg+6F2FsIzwiEOf0txfg/4OWnnTpuJlqUdl/+qTe0Uwc4Xr0DJZTMukNifodVGIO9j3EiBRgJzfuYIdFvqgBL+ji0+iQa/DgtE+nmOl2PuHcv0b6X2j2wOc/i7XQrc1vQaLPIr2dbDiXwMcgRGZ5PPFURyMVYlgf9xaU+nEmWmJGXzJ1QQeB71DRl8nD2leeGQHdfzaicaQGu54OmjAJ/WhhKdI0
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1179; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	20:sn/LKiDRCqqNCv0f5YmZ56cdlt+pQ2VGNYs9qZmSnoefeuBLO+gFCi2QMpohSORaTpLYHhtmMx2HXslV76y5JSxR1G0HpQ1B+pZUm3fqA5UwxczMHm9EKkKzyi8Lu2jkVMQdCwvqQKMwy5k2JbUD1ogoOXOU1rSkO+PQGWJAATomXJmC8hlyBDmXZE8Cc/0k4aguFcwQbd2Nq2v589udI+fQ1Dx15886E9CSxF41Y5O6SvwoOVM+XySc5WGLkNUwC0ZsByyHKibGjUgwrhEjEStBlotrue9FdOs3E850W27sNJMuVqCgeJm4dpKVJ82yzTZbc+f3N46+V11Fi1M2RacFTBVDi+U9E0d8qC+sIqAb8UfhopOwRqcBz5PhWWYlGIFL0j1tRJpuWfba99XqgYgrpU8XtyPAQZGsuGQ2cOsG/DVToeaPYBQWjiq4LgmA
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1179C78B1ED561F31E8DA48386C20@CY1PR0301MB1179.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13023025)(13018025)(13015025)(520078)(13024025)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB1179; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1179; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	4:Q6isYzxfHMr4AC06jTUxh4CNK3ie1d8mdo28lhXCoHDsmCsyrbes4bTioIkkx0rZm3J/UQoaWf08bWUJCg5BARGC2Xzw/iCxO8XK2y4GVOA2zEXheHtuJoxTvuaufLmJYz3a94YjemBbx0OvNtCn5psktcrM0qawQR6vnY+lyVCx/Tjst1M2+MPhrJkq5oMj+vWXCHNrRzjCJ9uen6ROodboQ+Dc4sHizhxLA76LKnqA/J1W5wzyUCsp/6xPaK9bj3feGaq5mYtnLx0cB/i8U718EkQ3pQr8G9OJFoVDKmU0QLFT3AQb4wLkgw5ckfcYGfUTTGIfrhzzCblaImcrj1SkFX0qmcK3IJrSosciIH4hC92+IZ0RW8UwlErFvbGPPFbwHe5R7dbGyUcPQZLcRqgixytWNvaSneSH0U83cYqDqFGDb67U2FQXQmSp5Uc5am94Gp4rz2m48DtAhs09wM4G62gc7YzrdKQrM8yFC0pyXQBOf8YgjrIVvoSBOFiX90/lTS+MvOqeGmb6xCZeUA==
X-Forefront-PRVS: 0827D7ACB9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1179;
	23:nsTgM6k/LehmEakC0VEYr9Yw/CoGoF63ZnqtSQs?=
	=?us-ascii?Q?2HdBgVkaZ3k0FEy8+VCisSfyDevs9KjhMf8/gsvOLz+zvkwVSAM0/7ctODi6?=
	=?us-ascii?Q?PBrWIsg9dQO187k0k97S8X+Q4sZ/Ue7iO5h3tVHbKjUyXz/Dsqn6RyjK4abl?=
	=?us-ascii?Q?pgomSwh3Dp/p6NjqDA/ZzKtTAqN6VXHMXkvVfkN/O+aS0qJd4Nr18P2V/IkI?=
	=?us-ascii?Q?TsUQ57lj1wG5g18ogO/JfbnnnoSCPL9dG/Htan3GOXSLT8O2YQ2WnHZOcAlD?=
	=?us-ascii?Q?ewRPvwoAA2sVDFHD9/oL3NymRvk1fKVdT1c3WhT8miW+8471Uutd053U82Mu?=
	=?us-ascii?Q?wGmxtmVpiAE90wxJ1fe2EtWa5hh+a6/vAUrGUL53RGIm+/eShMq+XoNQWEYA?=
	=?us-ascii?Q?26/Jlbf6JJ5xzJLIBQam0YlYPWSqOpD+R/E8kH0jB3d5EwYTFJlsWK9wPhmr?=
	=?us-ascii?Q?7WCdPIM1beiEVaeK4lPjMCwx2s6Zj9ihepZVy9b7pBNXQVRdVa5yaKEIroyj?=
	=?us-ascii?Q?eNTQRUcFrD4cyUnhoDeMIGlfgtaG5iLI5cnJeelT9dVUsEe/LC7cpEUyCZTi?=
	=?us-ascii?Q?6FcT+/BOi3+VATNBjjK8XR0UjN14EmkVON7rZci5XeAiEP78fAqYgtsLC1ig?=
	=?us-ascii?Q?MuDexlF62ayuODL3E77T6BJ8FCriKyGMUjr5EfrBPvv7pnEHi+GzhvL/3kwN?=
	=?us-ascii?Q?O8qcBtsEksPgHXygMy/42SijYjrXTTVaxkdWNuSQmCYn4iImJvWhQGNrbFOB?=
	=?us-ascii?Q?807L3BlutDc7Y5R2ScBWI6gB+UQezrgJPjZMQz/KU1rUUhApsA92sbYDFjn6?=
	=?us-ascii?Q?3ZykAuLy5/NJvCnF9LW/CQBsPhWcWURj8Alx6AGxYNq4KGyBaIA8nE8eappa?=
	=?us-ascii?Q?7DCOhpQIUotgbPnqeBJqB5PJJiiQUqetlr/N9O6hapQ23YnPVG0ivrrZmyzi?=
	=?us-ascii?Q?75E/QYl2rseELeMtasFsryNxcz9yUmCQT50yp0o6aMpUq1Y9mbU2wWDbl8on?=
	=?us-ascii?Q?iZSjiWMMGluG+6wYljGl0UoutfuwkvpD/6sCQaVZO5sSPz36zQNJrQvHa3JQ?=
	=?us-ascii?Q?+b2JJqy5v7fSfsYzqpV+J0uK0jiQA7bZ9C4LL4gSkjwf3H9XoMD1KonNXU3Z?=
	=?us-ascii?Q?+bgTJcE3o9zSWwzinROu5iJ2GqVC5OtcXgOAIFqixpb/ch5bTF1tII8AD93u?=
	=?us-ascii?Q?y9pnm3G/LAlvPjRw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	5:g2tCWaUKulAaEue8wU8YMzZ8KNh5GdZVIqwMVXzaWLri50thLQvlHn+6qReNUGcu28Q+S3h904CWHxr3t5C+sZqJM5wlNFshqsctvghrWFhOq/iYUOXVmRJSKxeHvbDEQcrRUr+t9DlXufgus5FzGw==;
	24:Lt2dS/m+MT2foEPAZBwBkBjs+z2VVggPfxqQf5z2BYP/N4JDBJGvyaYMlsS0oxyBCE5ObirB9F6Dt5uPfHdKBoYmqYfE2Wae8Yd8qJMAauY=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 09:54:32.9494 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1179
Subject: [poky][PATCH v2 3/7] gstreamer1.0-plugins-base: Add video crop supporting when convert frame
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
X-List-Received-Date: Wed, 20 Jan 2016 09:54:34 -0000
Content-Type: text/plain

Getting thumbnail will use convertframe to convert video frame to
desired video format and size. But haven't process crop meta on
the video buffer. Need to add video crop support.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...ame-Support-video-crop-when-convert-frame.patch | 143 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |   1 +
 2 files changed, 144 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-convertframe-Support-video-crop-when-convert-frame.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-convertframe-Support-video-crop-when-convert-frame.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-convertframe-Support-video-crop-when-convert-frame.patch
new file mode 100755
index 0000000..096a6f4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-convertframe-Support-video-crop-when-convert-frame.patch
@@ -0,0 +1,143 @@
+From 5be6ed00aad028d9cbb4e0c63af0be69d335c71e Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Fri, 11 Dec 2015 21:42:00 +0800
+Subject: [PATCH] convertframe: Support video crop when convert frame
+
+Get thumbnail will user convertframe to convert video frame to
+desired video format and size. But haven't process crop meta on
+the video buffer. Add support video crop.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=759329
+
+Upstream-Status: Backport [1.7.1]
+
+---
+ gst-libs/gst/video/convertframe.c | 65 +++++++++++++++++++++++++++++++++------
+ 1 file changed, 56 insertions(+), 9 deletions(-)
+
+diff --git a/gst-libs/gst/video/convertframe.c b/gst-libs/gst/video/convertframe.c
+index aa9c3d3..942a51e 100644
+--- a/gst-libs/gst/video/convertframe.c
++++ b/gst-libs/gst/video/convertframe.c
+@@ -110,12 +110,23 @@ fail:
+ static GstElement *
+ build_convert_frame_pipeline (GstElement ** src_element,
+     GstElement ** sink_element, const GstCaps * from_caps,
+-    const GstCaps * to_caps, GError ** err)
++    GstVideoCropMeta * cmeta, const GstCaps * to_caps, GError ** err)
+ {
+-  GstElement *src = NULL, *csp = NULL, *vscale = NULL;
+-  GstElement *sink = NULL, *encoder = NULL, *pipeline;
++  GstElement *vcrop = NULL, *csp = NULL, *csp2 = NULL, *vscale = NULL;
++  GstElement *src = NULL, *sink = NULL, *encoder = NULL, *pipeline;
++  GstVideoInfo info;
+   GError *error = NULL;
+ 
++  if (cmeta) {
++    if (!create_element ("videocrop", &vcrop, &error)) {
++      g_warning
++          ("build_convert_frame_pipeline: Buffer has crop metadata but videocrop element is not found. Cropping will be disabled");
++    } else {
++      if (!create_element ("videoconvert", &csp2, &error))
++        goto no_elements;
++    }
++  }
++
+   /* videoscale is here to correct for the pixel-aspect-ratio for us */
+   GST_DEBUG ("creating elements");
+   if (!create_element ("appsrc", &src, &error) ||
+@@ -133,15 +144,42 @@ build_convert_frame_pipeline (GstElement ** src_element,
+ 
+   GST_DEBUG ("adding elements");
+   gst_bin_add_many (GST_BIN (pipeline), src, csp, vscale, sink, NULL);
++  if (vcrop)
++    gst_bin_add_many (GST_BIN (pipeline), vcrop, csp2, NULL);
+ 
+   /* set caps */
+   g_object_set (src, "caps", from_caps, NULL);
++  if (vcrop) {
++    gst_video_info_from_caps (&info, from_caps);
++    g_object_set (vcrop, "left", cmeta->x, NULL);
++    g_object_set (vcrop, "top", cmeta->y, NULL);
++    g_object_set (vcrop, "right", GST_VIDEO_INFO_WIDTH (&info) - cmeta->width,
++        NULL);
++    g_object_set (vcrop, "bottom",
++        GST_VIDEO_INFO_HEIGHT (&info) - cmeta->height, NULL);
++    GST_DEBUG ("crop meta [x,y,width,height]: %d %d %d %d", cmeta->x, cmeta->y,
++        cmeta->width, cmeta->height);
++  }
+   g_object_set (sink, "caps", to_caps, NULL);
+ 
+   /* FIXME: linking is still way too expensive, profile this properly */
+-  GST_DEBUG ("linking src->csp");
+-  if (!gst_element_link_pads (src, "src", csp, "sink"))
+-    goto link_failed;
++  if (vcrop) {
++    GST_DEBUG ("linking src->csp2");
++    if (!gst_element_link_pads (src, "src", csp2, "sink"))
++      goto link_failed;
++
++    GST_DEBUG ("linking csp2->vcrop");
++    if (!gst_element_link_pads (csp2, "src", vcrop, "sink"))
++      goto link_failed;
++
++    GST_DEBUG ("linking vcrop->csp");
++    if (!gst_element_link_pads (vcrop, "src", csp, "sink"))
++      goto link_failed;
++  } else {
++    GST_DEBUG ("linking src->csp");
++    if (!gst_element_link_pads (src, "src", csp, "sink"))
++      goto link_failed;
++  }
+ 
+   GST_DEBUG ("linking csp->vscale");
+   if (!gst_element_link_pads_full (csp, "src", vscale, "sink",
+@@ -193,8 +231,12 @@ no_elements:
+   {
+     if (src)
+       gst_object_unref (src);
++    if (vcrop)
++      gst_object_unref (vcrop);
+     if (csp)
+       gst_object_unref (csp);
++    if (csp2)
++      gst_object_unref (csp2);
+     if (vscale)
+       gst_object_unref (vscale);
+     if (sink)
+@@ -209,7 +251,11 @@ no_elements:
+ no_pipeline:
+   {
+     gst_object_unref (src);
++    if (vcrop)
++      gst_object_unref (vcrop);
+     gst_object_unref (csp);
++    if (csp2)
++      gst_object_unref (csp2);
+     gst_object_unref (vscale);
+     gst_object_unref (sink);
+ 
+@@ -282,7 +328,8 @@ gst_video_convert_sample (GstSample * sample, const GstCaps * to_caps,
+   }
+ 
+   pipeline =
+-      build_convert_frame_pipeline (&src, &sink, from_caps, to_caps_copy, &err);
++      build_convert_frame_pipeline (&src, &sink, from_caps,
++      gst_buffer_get_video_crop_meta (buf), to_caps_copy, &err);
+   if (!pipeline)
+     goto no_pipeline;
+ 
+@@ -646,8 +693,8 @@ gst_video_convert_sample_async (GstSample * sample,
+   }
+ 
+   pipeline =
+-      build_convert_frame_pipeline (&src, &sink, from_caps, to_caps_copy,
+-      &error);
++      build_convert_frame_pipeline (&src, &sink, from_caps,
++      gst_buffer_get_video_crop_meta (buf), to_caps_copy, &error);
+   if (!pipeline)
+     goto no_pipeline;
+ 
+-- 
+2.5.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index 3139148..6b2ab0e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
             file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
             file://0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
+            file://0006-convertframe-Support-video-crop-when-convert-frame.patch \
 "
 
 SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
-- 
1.9.1


