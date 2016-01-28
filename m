Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0144.outbound.protection.outlook.com [157.56.110.144])
	by mail.openembedded.org (Postfix) with ESMTP id 62BD177164
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 09:05:35 +0000 (UTC)
Received: from BN3PR0301CA0051.namprd03.prod.outlook.com (10.160.152.147) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Thu, 28 Jan 2016 09:05:35 +0000
Received: from BY2FFO11FD004.protection.gbl (2a01:111:f400:7c0c::165) by
	BN3PR0301CA0051.outlook.office365.com (2a01:111:e400:401e::19) with
	Microsoft SMTP Server (TLS) id 15.1.396.15 via Frontend Transport;
	Thu, 28 Jan 2016 09:05:34 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD004.mail.protection.outlook.com (10.1.14.158) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 28 Jan 2016 09:05:34 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0S95RjD031680; Thu, 28 Jan 2016 02:05:32 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 17:02:48 +0800
Message-ID: <1453971768-27844-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453971768-27844-1-git-send-email-b54851@freescale.com>
References: <1453971768-27844-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD004;
	1:7j3pfOZnxwB/BVj0mrSUwbC1zXNUnkt3qY0IrH7I12XPLpd7HGU1Lk0dy8tMBbzzJ9lAhchUvbCkr5HS6RH7yr8m3Yf8eKdH9BCcBFfozuZWthmsqU6VMwYYynSnUGl0wfL4aIg5UJeRmbLRa9QXkMyPF9ZQEQ6Rvn48nuO5of65DHBKxNG8s1AY/YC/gWzZNYE4+C1A1W6f8WxJjWMuHp3mZdobyow6YesGzP9dOrNC3q706ICfn7CsoZJFwdz3MgTgA9JK1xGH2TnhHyKPeLoY39tM2yVPz5rSpZYoMBSnoiWqsmK7HmdhonlQcSNuNax8lOFKjkIF4UOdITRL2GDQsOb0GMLwZSDThAVXHVb+QQEKmfyIXi9jvyuv1CdYabKOjwVzbfK6wo8XNRiwRmgs8hhsIGBP5ULhuUOShVczwGjRPuRyk/FMIafBvYzm
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(77096005)(450100001)(15975445007)(48376002)(586003)(47776003)(33646002)(86362001)(229853001)(36756003)(5003940100001)(4326007)(19580395003)(5008740100001)(2906002)(81156007)(97736004)(19580405001)(230783001)(575784001)(87936001)(2950100001)(92566002)(6806005)(50986999)(76176999)(85326001)(4001430100002)(50466002)(106466001)(189998001)(104016004)(5001960100002)(50226001)(3470700001)(110136002)(107886002)(11100500001)(1096002)(1220700001)(2351001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: ad23f97e-57d9-4df1-db32-08d327c22e67
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:k8O3S/zJF3vWt9hWv4PolpRoRW8NWOgBSeqQpK0tunT2x//b/d/grRai47yplDsu3aABkfsXiELnPKYjKz9gwt7Y05+LCXz+La8pqZ1xa7DZ4Xkt2+YvNZXlartKCC+CAbzqYQ4p55wTa+q40/nBhYSF2FJM9GHwaiXqVMxQC8iazVZLxeuAbc8H/a7TPvSW;
	3:Q+iWlpWX3eknCw2yTG3qcBFU9r2neDxdDcEW9epC3aKOafT7wr8Gtvh8sf2op/uZIlPl3vho1ZCPZhcABLfUvT8hcQgRnHTL5E3omZ6ygPSHAzyS9E7LBb0wNIWUNmxAmlA4QBa3MPqVlweCBn8jNmtrk56/GPhIBIboVgrXScXah6LtSQOuvcGVszF5HbnmafoLvHbC8FIbvQl5Ah5wfaczDJbXNM7P/JYTmJlflLw=;
	25:zFO+vhIlIm36EDE6oeQo5CdrK7Y02TokcblI4Di6NQXnel07WKiP+Nwv1jeCV43cZMP4Y2cjsDDz97Ma8CelJkN96RDP1iKREQDx9g+eWe5xeyNJRrYd/q0NDCiDZtKAx7mym2lz0Invyw595xGVsHJWYxW7/kyk8qjZyIHDkui+M0GDSYpvDKyQIVgdreG4tHXVmfmrLr0e4tZj2Npo4tYUa0FV3xoy4z41r7yv1gRZOqS/8y/2uniJJ+cLX+Gm
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1169; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:mKnehkrJ+DGkK6gUsSfag0K/sbDaF0V6o+nPVYWM73Qs9Nv8MyfUhpiYZS2qlwPLK1lRMv8Bwb222PBD7JctkAFpSw6hyKkKsk9E5jQK/5g5OyFaJEvfAJlt0J3SRrVr6roSqDI2StyR4GUruuX3MD2Bns/9FfWbGHUnYHidcH0kFjhR4lQYrP1VnPD4zIhOr4O2NUbksNe/M+n3kKDBgV1N5VZF5UvLzDIG6ZtnJFHepN5LgqlkBFdqkdgmAsBtTt9n6F9Fgh+AprjBo4l7snfzSTN85xeg2c4SYiLhmC/TX49gMtxlJxxaJh4AUN/wT42sCmoYaLb43Vf8V7cz6Yal2PV5D8rura0AGtw7DJ/mEGD8D2dz8/dqKnECnXP4CkzJXg1T2+M6W7+G+z16DMfuuZwHY9NxlovHOPE0SLd2neSWo9j7S/uVzGLURt73;
	4:1moUy0QOKHFb/E8SdjU2H2Kq2U/xtDbx9P9vEGGuIKy3+jJUeqHYDwHmSazzLeSMnq2iPCGOq3HZUwE0AUz5Nn7ztWFOr496m8DqqPWJsi5Remxfwdkok6Dql0Yhc+2vp/UQu9pVVin6JVgtEWCsimbbO3oZHRqhZKackcSYj27rDfOjpxnAg/qeB1ArTTcBuMqLeK1wFQYx1frpIYXa/1woUK/w9Dmnxt+yC7vTcCyZlPAzkKoE+bhHOyeN8hVqQ2/1a9hoR7MX7CdKUaXGgAtLJED8NJYcSV/OWWPVY1BDLkv+hypoEaI9rF2x1j1cDNxHoPrFAIpuUgmfjej7Xvqn+GPFzIy5OAZJtR1yUr/H+dVHTPUgRy+xPq66SWE5S4RkaABZnTlKFYHPOmE73y2uARjw+BIwryDGg2gOhN50uF7tt+44NY5JvonNWoS8cpKz64cVmrD078TlDhRfMTUxgHxyVpSqhgbaKauwhZdS6aog86vhwVzJSJZkXeZr
X-Microsoft-Antispam-PRVS: <BN3PR0301MB116900E38AF2C84FE64F06D486DA0@BN3PR0301MB1169.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13023025)(8121501046)(13024025)(13018025)(13017025)(5005006)(3002001)(10201501046);
	SRVR:BN3PR0301MB1169; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1169; 
X-Forefront-PRVS: 083526BF8A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1169;
	23:LQWGuRMOXyDPZt8k4iu/P2X8G7vT+ilvjMuTlk6?=
	=?us-ascii?Q?khhIN+/1zfOSYFIBt0jYXOlP/UL4KOTgQqFZx79FRocgudX5GvUZzbBNQzNG?=
	=?us-ascii?Q?JKki8tzm7G5zHptdjNskwqJ11u/TUJcYpC3NXY2NXsRI2SvjKHsgybRUiOfu?=
	=?us-ascii?Q?acbzFh3k+71HX72wqosRPjzEb6oJgAJ0fnYM2BuTDAncMDIUZACoTJJtoZfy?=
	=?us-ascii?Q?ducrOwTAYZe4HB2YEIQI0n82/ZMxk2XJOQ84N7c7HjJBjwDwp8jkGt92bAeK?=
	=?us-ascii?Q?Y8WzSDkR28BCQP01OTg1nMfA9IFAYMtbT8JoX+GYi3oCli/fwUn4xVDO+C81?=
	=?us-ascii?Q?OH5DJ2SbYQDiroQrLVvT5xkpsKWHHYpOvLl1mAE1uUGHBT60S3n8p1M+/G+v?=
	=?us-ascii?Q?eDZHck+t44b/hfAwFDbcLhIixlTHl5KPHkgjlcpfyNXQ5sdafugeqMXXqC74?=
	=?us-ascii?Q?elCn95Ah4gGocMKnw5PIutYXBM42+kFvJfVz/Bi/qE2yBNGyZxnZ2FlXKb6R?=
	=?us-ascii?Q?iZbQx2hN/7cquPYS64/0gruT5hDx1mt6+ylg7CA+eC1V47m39imaTralYUIp?=
	=?us-ascii?Q?3dN8OwE58AZtMPS6jcH2ID/xQFBmvFZG1C2rzfiAcJKzrVXn9BAGzLELkvNo?=
	=?us-ascii?Q?8cw5Kc2Onh/lmKwfjD+OTMJq5+WLrlgnGpRi1Dq9MY5inAkw96+q+T35uZvc?=
	=?us-ascii?Q?u4jgAmr/UCah79HWUiAR6PW+bDS9xzDH6aCtuIptTBXu+JeE6orjG/qREPQA?=
	=?us-ascii?Q?rud8azp08NnxG07urG+v74WCTXpmWQzzrp4ZOQnXUZqfRL9lC2xNsfZ+L1aK?=
	=?us-ascii?Q?4pdSWrY1XB0mqt7GkGvj4a+E/wCbQPBQtMVRVLvbeJlYLGmg5YjVt9lZOKQi?=
	=?us-ascii?Q?VsiV3xE43Y3IhAH4qU9e3nwm8YHQnYZ/StsFcZ9vM+qAhEcYVy1/8yWHCYV9?=
	=?us-ascii?Q?3GEnld9d4hfVvzJddjuxuuPtAUcjbHUj5bMooxpdm1HfFgvimYVToAKQ6X1h?=
	=?us-ascii?Q?aoedqNtTID0kt3hCx14JbAAeVXs34Y1zLlhP8PFPcH4mTxwLOth91k+iqJIp?=
	=?us-ascii?Q?fCqIByoTEWgFSk1FraGAJjiNjoqby8lFraPQ8AlCJea6PM+zla2OFJfVRtdZ?=
	=?us-ascii?Q?77ZiiLJmOlRekyGJjFBoaNwVkA3v/AMkcHbaNaoZJPSuCdcgODyse5pOH3Bn?=
	=?us-ascii?Q?IlH/gB0PqOFsvW+nMUs6xzgvGArmk1cVym2l7?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	5:/IRdLP4LheHJzfM7XTKx00zp0SxP0+pI8oNB3GD3qAFxnFhe2CSTGthMEI8HUdqS5O/s6XTAhE5BmZqrwQ/uGyYRD6uHcDFM44bzFZKxacxYAcZmtbfWz2AYk427gDqAfSYUgpx0i2yFqqT3SCKzmA==;
	24:+gkZ3w8POgOHvVpviUxQfq6vpRxRxYTTzMGYdTi3D+FIjjpF3dOguiM4EeEQ4wOookCZaEUFwrVMGYFsok1pgOus7R+SsL/822avV3La1aA=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2016 09:05:34.3040 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
Subject: [poky][PATCH 2/2] gstreamer1.0-plugins-base: Add video crop supporting when convert frame
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
X-List-Received-Date: Thu, 28 Jan 2016 09:05:36 -0000
Content-Type: text/plain

Getting thumbnail will use convertframe to convert video frame to
desired video format and size. But haven't process crop meta on
the video buffer. Need to add video crop support.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...ame-Support-video-crop-when-convert-frame.patch | 143 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.3.bb   |   1 +
 2 files changed, 144 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch
new file mode 100755
index 0000000..096a6f4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
index 95a012e..b9ed3f4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
+    file://0005-convertframe-Support-video-crop-when-convert-frame.patch \
 "
 
 SRC_URI[md5sum] = "3ddde0ad598ef69f58d6a2e87f8b460f"
-- 
1.9.1


