Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0104.outbound.protection.outlook.com [157.56.111.104])
	by mail.openembedded.org (Postfix) with ESMTP id D2879767FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:48 +0000 (UTC)
Received: from BY2PR03CA007.namprd03.prod.outlook.com (10.255.93.24) by
	CY1PR0301MB1178.namprd03.prod.outlook.com (10.160.165.21) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:47 +0000
Received: from BY2FFO11OLC004.protection.gbl (10.255.93.4) by
	BY2PR03CA007.outlook.office365.com (10.255.93.24) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:46 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11OLC004.mail.protection.outlook.com (10.1.15.184) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:46 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQW000825;
	Sun, 9 Aug 2015 20:41:44 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:36 +0800
Message-ID: <1439178103-17813-5-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC004;
	1:Gm/PNSYSHEJMnIV2DKOpRLZg+tLexQ0tKXZCLAf1wF3qWKCWq1zWOC/5RwK8qyuoAqDrT/SG9uAttsVVKyRa79PNa8y+5LixVT10sNZBRa51zrtC3rVR5xRUE347Gw8OZ/e2pjpIIrbru5OzPhT3tewoCplSNl6eCcDcF+4qlR4KwdLnsN4YuhVLJgSGP9D/ho6jSLSj/QOEKYz19WWZt3OkvWv7jB7a1bnFdzPFygRBwIEV0qNanhMLCwevN1GConWBmfNPnnnlxPBKaLHRgxdE9wnuMJXhhQyQOcdJ5xYK3MzpqTxANFtuGgavhQhJIrZQZ6IyfXkbQBaE+LrVCA==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(6806004)(36756003)(4001540100001)(69596002)(50466002)(450100001)(77156002)(48376002)(50226001)(19580395003)(2950100001)(19580405001)(77096005)(105606002)(15975445007)(85426001)(106466001)(92566002)(50986999)(76176999)(62966003)(68736005)(86362001)(230783001)(33646002)(5001830100001)(97736004)(104016003)(5001860100001)(575784001)(87936001)(81156007)(5003940100001)(46102003)(5001920100001)(107886002)(2351001)(189998001)(47776003)(5001960100002)(64706001)(5890100001)(229853001)(110136002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1178;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	2:YAsgUiOZklvbunPBS38z+I19SW/x8kqWQH+zU6Dvgd1pFLhWfghhhPfcchUTjlURqPz60bI1jpHE6yJbz7s0acmPh+9VdX5FpWE13jbu3hX94ZTuKHWAMwJEHlyuKic/L96oMJHUDelg6YCHD3z78fVzep5/17kCATCGT83AxRc=;
	3:fQli+qjvtrXe7J91fzRnKXz635mbWMPVYsNR8dJI5DktFjQwV4WhtJ1zrZ+MxWXT3EvAZ6EDlwuTx/7PAMl+5SlyNnZJBuOt5n0SWNSpf13edaS26m8FAfYw4zGQYFygvSagaf/t7H+B6AJ97mBtzRBO7zn/oixEFckYRQoWpTWIlYcC9v/LQMYRbn9BYgYzt/lnp55gdXVbhhPqyz/rLloUoumWBBcsRIAKSOhX3ls=;
	25:J/MBqEcbNU/xiq6onED7BrjJ8U/Er8EkhrjYQwVCTkXNriagS29apW4r1X53Wwkjf5sa3XTFYy3MWBE5ZtSOZjKB95Ihz9vjdBTbSn+Q5jWc9xeJC9rbNJSaKdsy57gCwcvhEldnzSLJ+hXDrZ1BOEm5gBiUTU7K7tdY/3xIR7Wyjtz2N9Dv4XfsfBLKv3Aaa8McZsfxL0A3Y/VaWRUflrxDxA4kZDG0hiHq/W8THjs4XtZn5trNldvOPD2EXS4utKf+ZzJgf1Jm+1MO53RHQA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1178;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	20:VUGTdDuWeotg2+TrpTHtgEBgfxjYyHMrSTsDEqoPZd9z6ApPgg5J2NXHu4IdNYfS3xNyD16NnKJGCokKqDE8U7+axO2IVJ2hgP+k2sV0vdNFfoIB5FPl19EWQca7n8/0fgaOBzWC98QmoGuKAt4wns8WFSbiLRtwCo02ekH5Jq7BSQWCd3dmOkea9mqDVv0bN4YkuOsxiqHQ4VikqSkNjPimcyP9QEqH2l7SFUcbe2cNPArOOeHLr9HR4VpUyrKNVYrgHQpKe8Sx2NJOGicQCSg8OkBUKuQYluG58W5r1+C4VYNtK8xxsOWnp4xaMIRzmVZgRos+LJPEJnkHSN8o7phOLyTwhV2ZIDgT3mcyr+A=;
	4:U5Mj6gSpIFjOyy+fJVfMZd24rf7M/CSIjfVhzsUXEXmd/wpBNK+vw3EfM8ynolRCEdcVZjOsAi+mkMzWL6kCAEziiUYm06zE3ZukHK2Lw/2pM+PrRpMiQNSaaEnfEiWBJeplTiNTDmBeEaeWCr8/mUyCeqp8vGJQ6aOMnXRTTLDg1D/fAck02QR+gTomjcLYqpZMPyy8xRwPA7VSACF4pMpdPskrBgvJ3AnS4tWI5OC1kEIGmLWa0LQvi/DLj1MoRyqUhF4sOijRKHXogL3MnnncZYZOOZt4M7amov/At+w=
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1178B3F525FC46F30D1D115F86700@CY1PR0301MB1178.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1178; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1178; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1178;
	23:yxoOPmnqatoMH76bmtqZYCE9BQBjajZRDrpwhHa?=
	=?us-ascii?Q?L7AWNoE/bR0Tlzo4KYFn2jUwOR05uvwOf2pb9qJLDlrVg2h07kXF+ABW+2KM?=
	=?us-ascii?Q?2Q5ZyqGUKdz+G2vxI7KZfZwor3hEBbN5w4yZvSMkpAgXOYeHlcYpM2fO0mCU?=
	=?us-ascii?Q?WAu6d9EIMuKsyLUddBaynnvGRmunoPQWNhoJ1kX2n1Ltrh3z0E/bCvRb6OMv?=
	=?us-ascii?Q?KmoEPSxi/2fIJc8heE5xAab30TMw2yHCgZuQExZ5BM51PNP45WSaz/uoh90s?=
	=?us-ascii?Q?NjYZ4qAF0THcqkBg+ndg74rLtnUScWVESBHHs1TCeCopSbNfwvwWKXdNJ940?=
	=?us-ascii?Q?m4G43View4sBJeoSBT6hQ8GffEw7b7RyRH78l/ZUf37h0zI/I8DNzeGvXchZ?=
	=?us-ascii?Q?HMzz95W1ssag9o2u0Ii8Gof/Z3GL60UTNffvjb3jBMssxD0oev4gsOwVzGoC?=
	=?us-ascii?Q?hcoWo1dxy3KNrCa5VHknL4AYAWYomK2xX5R1zcEUbuGVgxUz3jFtXn8BXLgv?=
	=?us-ascii?Q?dT4V8Wy0KzMjBbSQmjVr4rSFzVd5arNBnkdN9cIKXLYGq1R3RDhgEtbjSV0U?=
	=?us-ascii?Q?kAJ3evo7S4V0Wr6TZthOXBDRkgcore46vPUdD1wnDfKUbe/LtcPnM8wQ+PaI?=
	=?us-ascii?Q?hXLhj06hVDpeoRbyihn2hJ7b9WpBH3GARvhTc7G/ykiaVQ8viF3HV1mrEEe8?=
	=?us-ascii?Q?NReYgRlbd5k7h3SZTdUuM3pwi3JqrTdbRMRBb5/jeAw5d6wKe3wTRRkwfGl1?=
	=?us-ascii?Q?j1w1gAKpMWrNNMKWX+89sQ6fZ1IsZaCJuXRQRfnOTKDDLVdp89oG7G7SwbSx?=
	=?us-ascii?Q?RnoGsYrMY/Ty/Gah6dc4NtORqJrXoMsccvPyxZmmntT4AcfcfXT9CP2zEAyC?=
	=?us-ascii?Q?v6Fh8qh/7UDWa2EIZxuxF6brWpoF2lA4qxLiwUWQItj8XDsIPwbM34uxCZxj?=
	=?us-ascii?Q?KXooxwIyq2mu30fWi9c8M1ul4djwC3FeZcyosJhLLp2lAx3ju07S4q7Cy8CQ?=
	=?us-ascii?Q?HdVpUFzXtgNkULSkoZ2Zw57g6PWQfpI4yRu922lrAVx86mY4ojWmrJ7DMO+o?=
	=?us-ascii?Q?BCfC28el7DmATqFzbLFbXNFu8Dr/cXPC2ffzn2oUllNHjbtlw0QjU6qgTJo0?=
	=?us-ascii?Q?RYh9MqnYt2/I5jpFv17/bP0Gu+QYSXo4ulnbcUmERmaGgLD11qDGUGhc8iVI?=
	=?us-ascii?Q?cT63xrmshcUgRS1HJ3KiI1YG3WJ37nv1vZi0gq+w9bayiMZbb/E9w6D05KWt?=
	=?us-ascii?Q?rsfnFTI4/tXVX4abMF3/oubqqxTTEqx5SyXWp21Cv0l7aqdwJ1jQrpkhesAn?=
	=?us-ascii?Q?qh7JK1k4NLTOgECp+v556KuBBGdxsgU9iJ1Gj7fQaSebU?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	5:T9quoiVHPMPGPGVnzAodfFJACHLDjV7/CR3+HggHMOk6BYcMR3rRU48il6NwjfXg/0LFhFrOGvrLmrR0uRJW788flYttRUraxI8PUIbQmeclN8lhCgcDL6oO+BFqAJzpXrQzrg4cAfDuiLH6gK6IpA==;
	24:Wep7gYksDBVZjVex19ABIyC9J/y1IGiI5F0A1zOcJfoxF4VUIzrGIT7PMc7WdIhoPFYYomNEs4VBccJus93wJ+b1XSfgprhhpOBWo7xx2sE=;
	20:C8HWR00xI3aRhBGIlVAKmjj0wYbkomeycfWQTQz8sV/d+s798T5xVNA+oQExP1x+3NU9v3W0SJMIvVoFjosjnQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:46.2562 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1178
Subject: [poky][PATCH v8 04/11] gstreamer1.0-plugins-base: Fix output buffer can't writable after frame_map() issue
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:49 -0000
Content-Type: text/plain

-Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
 This makes sure that the buffer is not reffed another time when
 storing it in the GstVideoFrame, keeping it writable if it was writable.

-Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF to replace the old one because it's kind of ugly.

-Don't ref buffers twice when mapping

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 26 +++++++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 +++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  3 +
 4 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
new file mode 100644
index 0000000..3db4724
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
@@ -0,0 +1,26 @@
+From 269f642c45d85cfd630ed490478e6bd6b71a767f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 16 Sep 2014 01:07:18 +0300
+Subject: [PATCH] video-frame: Don't ref buffers twice when mapping
+
+Upstream-Status: Backport [1.5.1]
+---
+ gst-libs/gst/video/video-frame.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
+index 01f23c0..8a9ae96 100644
+--- a/gst-libs/gst/video/video-frame.c
++++ b/gst-libs/gst/video/video-frame.c
+@@ -105,7 +105,7 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
+       frame->data[i] = frame->map[0].data + info->offset[i];
+     }
+   }
+-  frame->buffer = gst_buffer_ref (buffer);
++  frame->buffer = buffer;
+   if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
+     gst_buffer_ref (frame->buffer);
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
new file mode 100644
index 0000000..c465b5c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
@@ -0,0 +1,87 @@
+From 40a293d44d1aeccf5eb8e86f23a0b13666111c5c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 12 Sep 2014 14:39:16 +0300
+Subject: [PATCH 2/3] video-frame: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
+
+This makes sure that the buffer is not reffed another time when
+storing it in the GstVideoFrame, keeping it writable if it was
+writable.
+
+Upstream-Status: Backport [1.5.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=736118
+---
+ gst-libs/gst/video/video-frame.c |    9 ++++++++-
+ gst-libs/gst/video/video-frame.h |   18 ++++++++++++++++++
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/video/video-frame.c b/gst-libs/gst/video/video-frame.c
+index 537cf70..01f23c0 100644
+--- a/gst-libs/gst/video/video-frame.c
++++ b/gst-libs/gst/video/video-frame.c
+@@ -106,6 +106,9 @@ gst_video_frame_map_id (GstVideoFrame * frame, GstVideoInfo * info,
+     }
+   }
+   frame->buffer = gst_buffer_ref (buffer);
++  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
++    gst_buffer_ref (frame->buffer);
++
+   frame->meta = meta;
+ 
+   /* buffer flags enhance the frame flags */
+@@ -189,11 +192,13 @@ gst_video_frame_unmap (GstVideoFrame * frame)
+   GstBuffer *buffer;
+   GstVideoMeta *meta;
+   gint i;
++  GstMapFlags flags;
+ 
+   g_return_if_fail (frame != NULL);
+ 
+   buffer = frame->buffer;
+   meta = frame->meta;
++  flags = frame->map[0].flags;
+ 
+   if (meta) {
+     for (i = 0; i < frame->info.finfo->n_planes; i++) {
+@@ -202,7 +207,9 @@ gst_video_frame_unmap (GstVideoFrame * frame)
+   } else {
+     gst_buffer_unmap (buffer, &frame->map[0]);
+   }
+-  gst_buffer_unref (buffer);
++
++  if ((flags & GST_VIDEO_FRAME_MAP_FLAG_NO_REF) == 0)
++    gst_buffer_unref (frame->buffer);
+ }
+ 
+ /**
+diff --git a/gst-libs/gst/video/video-frame.h b/gst-libs/gst/video/video-frame.h
+index 627fab0..f8e6304 100644
+--- a/gst-libs/gst/video/video-frame.h
++++ b/gst-libs/gst/video/video-frame.h
+@@ -149,6 +149,24 @@ typedef enum {
+   GST_VIDEO_BUFFER_FLAG_LAST        = (GST_BUFFER_FLAG_LAST << 8)
+ } GstVideoBufferFlags;
+ 
++/**
++ * GstVideoBufferFlags:
++ * @GST_VIDEO_FRAME_MAP_FLAG_NO_REF:  Don't take another reference of the buffer and store it in
++ *                                    the GstVideoFrame. This makes sure that the buffer stays
++ *                                    writable while the frame is mapped, but requires that the
++ *                                    buffer reference stays valid until the frame is unmapped again.
++ * @GST_VIDEO_FRAME_MAP_FLAG_LAST:    Offset to define more flags
++ *
++ * Additional mapping flags for gst_video_frame_map().
++ *
++ * Since: 1.6
++ */
++typedef enum {
++  GST_VIDEO_FRAME_MAP_FLAG_NO_REF   = (GST_MAP_FLAG_LAST << 0),
++  GST_VIDEO_FRAME_MAP_FLAG_LAST     = (GST_MAP_FLAG_LAST << 8)
++  /* 8 more flags possible afterwards */
++} GstVideoFrameMapFlags;
++
+ G_END_DECLS
+ 
+ #endif /* __GST_VIDEO_FRAME_H__ */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
new file mode 100644
index 0000000..132bf06
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
@@ -0,0 +1,69 @@
+From 3a7cdcdfc9c5b0d20394fe51b3b8cda23931ca6d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 12 Sep 2014 14:41:01 +0300
+Subject: [PATCH 3/3] videofilter: Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
+
+Upstream-Status: Backport [1.5.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=736118
+---
+ gst-libs/gst/video/gstvideofilter.c |   23 ++++-------------------
+ 1 file changed, 4 insertions(+), 19 deletions(-)
+
+diff --git a/gst-libs/gst/video/gstvideofilter.c b/gst-libs/gst/video/gstvideofilter.c
+index e1fa2c1..874b2e8 100644
+--- a/gst-libs/gst/video/gstvideofilter.c
++++ b/gst-libs/gst/video/gstvideofilter.c
+@@ -260,23 +260,15 @@ gst_video_filter_transform (GstBaseTransform * trans, GstBuffer * inbuf,
+   if (fclass->transform_frame) {
+     GstVideoFrame in_frame, out_frame;
+ 
+-    if (!gst_video_frame_map (&in_frame, &filter->in_info, inbuf, GST_MAP_READ))
++    if (!gst_video_frame_map (&in_frame, &filter->in_info, inbuf,
++            GST_MAP_READ | GST_VIDEO_FRAME_MAP_FLAG_NO_REF))
+       goto invalid_buffer;
+ 
+     if (!gst_video_frame_map (&out_frame, &filter->out_info, outbuf,
+-            GST_MAP_WRITE))
++            GST_MAP_WRITE | GST_VIDEO_FRAME_MAP_FLAG_NO_REF))
+       goto invalid_buffer;
+ 
+-    /* GstVideoFrame has another reference, so the buffer looks unwriteable,
+-     * meaning that we can't attach any metas or anything to it. Other
+-     * map() functions like gst_buffer_map() don't get another reference
+-     * of the buffer and expect the buffer reference to be kept until
+-     * the buffer is unmapped again. */
+-    gst_buffer_unref (inbuf);
+-    gst_buffer_unref (outbuf);
+     res = fclass->transform_frame (filter, &in_frame, &out_frame);
+-    gst_buffer_ref (inbuf);
+-    gst_buffer_ref (outbuf);
+ 
+     gst_video_frame_unmap (&out_frame);
+     gst_video_frame_unmap (&in_frame);
+@@ -317,7 +309,7 @@ gst_video_filter_transform_ip (GstBaseTransform * trans, GstBuffer * buf)
+     GstVideoFrame frame;
+     GstMapFlags flags;
+ 
+-    flags = GST_MAP_READ;
++    flags = GST_MAP_READ | GST_VIDEO_FRAME_MAP_FLAG_NO_REF;
+ 
+     if (!gst_base_transform_is_passthrough (trans))
+       flags |= GST_MAP_WRITE;
+@@ -325,14 +317,7 @@ gst_video_filter_transform_ip (GstBaseTransform * trans, GstBuffer * buf)
+     if (!gst_video_frame_map (&frame, &filter->in_info, buf, flags))
+       goto invalid_buffer;
+ 
+-    /* GstVideoFrame has another reference, so the buffer looks unwriteable,
+-     * meaning that we can't attach any metas or anything to it. Other
+-     * map() functions like gst_buffer_map() don't get another reference
+-     * of the buffer and expect the buffer reference to be kept until
+-     * the buffer is unmapped again. */
+-    gst_buffer_unref (buf);
+     res = fclass->transform_frame_ip (filter, &frame);
+-    gst_buffer_ref (buf);
+ 
+     gst_video_frame_unmap (&frame);
+   } else {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 88c3254..9c31391 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -11,6 +11,9 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://fix-id3demux-utf16-to-utf8-issue.patch \
             file://handle-audio-video-decoder-error.patch \
             file://videobuffer_updata_alignment_update.patch \
+            file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
+            file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
+            file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


