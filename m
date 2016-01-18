Return-Path: <B54851@freescale.com>
X-Greylist: delayed 877 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jan 2016 09:50:12 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0145.outbound.protection.outlook.com [207.46.100.145])
	by mail.openembedded.org (Postfix) with ESMTP id BBB8A7017C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:12 +0000 (UTC)
Received: from BLUPR0301CA0026.namprd03.prod.outlook.com (10.162.113.164) by
	CY1PR0301MB1179.namprd03.prod.outlook.com (10.160.165.22) with
	Microsoft SMTP
	Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:43 +0000
Received: from BN1BFFO11FD027.protection.gbl (2a01:111:f400:7c10::1:122) by
	BLUPR0301CA0026.outlook.office365.com (2a01:111:e400:5259::36) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:42 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD027.mail.protection.outlook.com (10.58.144.90) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:41 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROb015522; Mon, 18 Jan 2016 02:35:39 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:55 +0800
Message-ID: <1453109582-25485-7-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD027;
	1:lROVGAzdNy+QZej2JI7B50rFKdlR/hJMUBZpISsfuS+64UdryXV58OLz2f137TitZ5meApRTclY/yxzmMa8h/BbAIVQD2ChUtYLQAPmeWKpsx032nxcn+Wac3dx5FcbmpwWDofUUS+2sUW4IOz4zwdzhK1JUsL1n5Jz1RKpZODZ3mNnRhCpREY7fAHXP4bqZQknsNP9Kj6f6q3DnZQAVm9Trz46G5mL0IsuNTXS3nnJOqcp+1tRxADfBUAkvpAQcydoyTzlm3hBvl38mEweoNH1r1/5yl0R/1/pILWNPyzvYu0fzjnypjcc5N9p+qBlOMbmmeoZc1bq68kZCBohC3y0Xt5kzx5JLVY2o4DcGVMeT4pUmSOodXIek4PXDUQnqVXUTWpUR474iVH6i2Kk6HL5PW9SCBzg9heVVkwsxFY8=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(5001960100002)(586003)(48376002)(15975445007)(2351001)(19580395003)(76176999)(19580405001)(229853001)(50226001)(4001430100002)(4326007)(5008740100001)(47776003)(50466002)(87936001)(5003940100001)(2950100001)(106466001)(85326001)(50986999)(107886002)(230783001)(110136002)(97736004)(92566002)(77096005)(33646002)(575784001)(189998001)(2906002)(36756003)(450100001)(6806005)(86362001)(1096002)(104016004)(1220700001)(81156007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1179;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8602ef7d-1d1e-4314-8b4a-08d31feabbbc
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	2:btyVfDoQZ0MLYUWVEEaAEYHL7WpWBMd4psyi+8tqGTLwBXwh/2vl8euXaDwTgLt9xLruaJQD/s0m6GnsjOuKsQPQ6R2afnDUzt5mYdUCtTuXx03gjoqrBoLNj7jfCjMFXXkrYj8XSUuhpfM0u4Lo5VnpYydfI/eo321N6159zwfw3k0M0PUca+bBeHqJlDAr;
	3:5AqAO5ZM3/YuK6Sb7KMakz/Qq5ALmvQU7Z5JBckbq6XoxtdxvAAJr4uD1+yHffFrD8BOB26Rku2sbd+7qxoDAvd3Uwy7LH9brUJhOLgsf/Vd8rSFZNXFRb1c2eBhzI4ZrgP2ZsYFm4rNnHtM6ZoV9Xv6eXbZ+aeujPjyU74AppOb8MxmmH8Nj0znyMpWlA3B+RGIcahJkFDfl90hFTslG+9A9W8RGFGrnfg0I5TuHI8=;
	25:w/lHFBqiQb8DRYP+S3kRzGkuWt7YRN2C6xMaWDw90Ur1z1iDzJQP/7U5JstGySF4BAT08tZVFEkzIoIgImSMtd9mOEgRSFSB64rO8n8tS24hGbJkRSD2Xvyt1Qy4fP4btvBtuwtGK27oN5TouLd/WV6DNaRo1Ks3hpX1KTbhzZ4pPaeWm46ulS9FbaU4Wm9NREsyuITvZB4xeCrgU/ET6IR0l8XXCl9Bfe+PDV8LIf4sRvAzOvsafbGlmMuy+A5h
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1179; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	20:qkmEBikOqpMjxD8Mb8vzPjduiaJYS7iRmA1f7qzW1Rj+/nEs+MbjRxHk5hiT24AkYpq80CRuphwV0E2So9DT77paBHOaNkSAsEH8zepftQqA4GpiBuB29kbv1mbvaiyalsxeQtJqfps2cxWJM3cOzmIT+35BbyAkB6vxcymECYouQXatI7usqL06dPgd0/ejL8zTSg2QADjhnPgKEx+mY9t8PiywbGCxp/QnEH0jpVz8sKx0LxP/S6A/XWvV1LEC5BFiIiN59nUybwne2W9hczxCbw23YsPy7FkG9uaBFIgr6t+1DfJrJv7OWZykYqZTw6W01J+w8Aec6EiDGn/nzeeNlI6gQUQGsNhVgjxfwKaugbOq+qs1SvyKqek+8aWHYkvWWSaXF5hl++G0x87RgaTxTBxO7KbF7Wwi3s2ieXMSFkXdROKH776/kYjs2hV6;
	4:tS/9/rDFHyRm1OlIeFPvGz2pKxx7LfLwCgrVMbBA6fZATCx1EXQVwt1qvFfIpwP77VAl3WpjlO2Zf3xXYUfciQPxGoWyqxo84PQqWbzxmNBF3yIbrtG4RphBrLV18SgY0gm8hWo6krBJbGNav5uX3bTO448nmerc6/UcOO6lNmhcceZq8M9IpKSb4lcF5N6koPvg1XQkusKxniae0ehLHixrkHYFpDumxTO+LPmnvbkyz9zddXKfLdv/fxTdnrVvMKdCWaGf1WjTjymb3TNW88KuMNyABFIcr4Gv/HIccEQBBnW3x8FYNWQShY+3tZ7c/h3pLecoQT6SPLpfKkA7SABiTUmpfgA21tEL0X43bnr1dtK3shgJbEx+g5zkVnBB00ek39T6kCdNMaT5aZEv1wlCit/zilyuZSKAUul50snREF6MTgOiQWQxha0A2+U3xomUdYFM1obKoDfp8tMyiMWjIONvPkgKPnW4NfY4u8QpdOCk9qM7QAgYrxe7tXa4
X-Microsoft-Antispam-PRVS: <CY1PR0301MB117911A1A977440F7AAEA6E086C00@CY1PR0301MB1179.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13017025)(13015025)(520078)(10201501046)(3002001);
	SRVR:CY1PR0301MB1179; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1179; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1179;
	23:OvrlcG6Osw7ZdstoHOnbUIOMEtruMeMVwgaDA7S?=
	=?us-ascii?Q?gIuXBloBf8HZQwso2oGLFZxap8PW8NASdaPIuxUC/u5tsCp77yOteLuBSVmy?=
	=?us-ascii?Q?Gj9ipiZ3gZKzqn1d6nJILHSl0AFUj/RKdZFKPwe3NJ7BSuHIpcRr4rTYgTDo?=
	=?us-ascii?Q?G4iwn0T0HkwCkznEg8kw3ggjk1ljI3WH9x76zAu9AWOzdkcro5Kqt1HgON0W?=
	=?us-ascii?Q?oazVKSDIc+sg8ecgKtXWVaZhEDv3VVWCWWxso/0sR8vCfe7NNGziRPs7IqbX?=
	=?us-ascii?Q?crH3hQii+KPNmswkY8+cbjvC4+VG1YIvkxA3P6xQwFzAf3kB4+43ylPba0QY?=
	=?us-ascii?Q?5uhpz74ufJVoDOK52kIoXn7gs+XQa44btMIIdKgUxQOPjVrifdhW1ZeK/rqp?=
	=?us-ascii?Q?Qhgjf+/ajn4OqMOnO1npcDi15k5k8R+CIfbX9gAVu/mcXc2exi7T+JxCs28b?=
	=?us-ascii?Q?yJNBO0TbYKEASK4/xxJs3VartPFmpc8D7n4ualCphgDL8pWMCaLfNVBZMTz1?=
	=?us-ascii?Q?QhuhLDQ/v7O/ati7OHObH2HZPBsc7s6fDpWTFKyVZe0bUxO4JVIF99VnrmlH?=
	=?us-ascii?Q?yh5Qanwun2GihuLj+F+b2OGhQoNOW1Q+GQvY7eK62sXbwkuEtZmH9nNS7A+W?=
	=?us-ascii?Q?Euc/Nu70tUaXnwObuWvsLBZ2V0BRkxM4N099kEqCi2cS3YdDFUkzFm1UyMsf?=
	=?us-ascii?Q?Elwvchm6zgxY3XoVwKzpTFK7KxLRZF4gASGz0ya5o4wNMN30KiLH8uZJx+Om?=
	=?us-ascii?Q?9SwVOVuOE6ZZqh7+jVHG3y6p693N/fjVUl2QpkeewF9LEdNRJ5LAV/Ru/2GB?=
	=?us-ascii?Q?BHp3LWs4rwJ5gdFrEDUeVGNpE0OYDfONvicQ0J7e9tcqn9BhDwk6mGtRclyX?=
	=?us-ascii?Q?thSBQXiyBaXqGePpGg4Km0PDEdw0Cwyn3VW4myiaiilIwX8cC2QPyjssl/gO?=
	=?us-ascii?Q?WIgpH6xdtRpBm1WN7HZVvwAnGa2r/hZTaXXUQMNr14AbtbnKd2sjF0YaIfou?=
	=?us-ascii?Q?ne0/5KPFTWMhnukYkDsL26CiMZKsVnLN73D1uuXpi4AHQtZwpxA4pnd8iWcn?=
	=?us-ascii?Q?cnYdeDKBomnQ4hF8yTwda0YxVCeRmrWLKvhJnHuxR4EuB3JW5arPUwHSMMmF?=
	=?us-ascii?Q?GG8m5ydaPfBsD3X5LXtjysjTNM+hJl1J8B7v16AvEsKzTeAXL0uUylw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	5:7Iw79ckMI3RKEc7/Grsq3MW7AoUZxBwl9VyQV/14FtGnHWTWJIYyw/+RYl4QAV5+Yv1QyaMBlsamyWsvwlVvHkyFWh+3E6qGGAdS5FNftlNiErUI03jRlTp5+2IQpW/+ZE3XaIrLzSoYPSWbSBbXEg==;
	24:VnIaOKscq3f+MAkpSWP1yOTNoSl6mU/ZMlWe4d2oprlb8DrY8NrdQMTq5qLblwuUAVRj8G1dWmOwqga5zDX+FOGZbtDd2SoW/fw+99/6rL4=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:41.0643 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1179
Subject: [poky][PATCH 06/13] gstreamer1.0-plugins-base: Add video crop supporting when convert frame
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:13 -0000
Content-Type: text/plain

Getting thumbnail will use convertframe to convert video frame to
desired video format and size. But haven't process crop meta on
the video buffer. Need to add video crop support.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...ame-Support-video-crop-when-convert-frame.patch | 143 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |   1 +
 2 files changed, 144 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-convertframe-Support-video-crop-when-convert-frame.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-convertframe-Support-video-crop-when-convert-frame.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-convertframe-Support-video-crop-when-convert-frame.patch
new file mode 100755
index 0000000..096a6f4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-convertframe-Support-video-crop-when-convert-frame.patch
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
index c6f5d77..97b1a87 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://0006-handle-audio-video-decoder-error.patch \
             file://0007-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch \
             file://0008-Disable-orc-optimization-for-lib-video-in-plugins-ba.patch \
+            file://0009-convertframe-Support-video-crop-when-convert-frame.patch \
 "
 
 SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
-- 
1.9.1


