Return-Path: <B54851@freescale.com>
X-Greylist: delayed 915 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Jul 2015 05:45:23 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0134.outbound.protection.outlook.com [65.55.169.134])
	by mail.openembedded.org (Postfix) with ESMTP id F1B35761A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:45:23 +0000 (UTC)
Received: from BN3PR0301CA0057.namprd03.prod.outlook.com (10.160.152.153) by
	CY1PR0301MB1179.namprd03.prod.outlook.com (10.160.165.22) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Thu, 23 Jul 2015 05:30:11 +0000
Received: from BL2FFO11FD039.protection.gbl (2a01:111:f400:7c09::120) by
	BN3PR0301CA0057.outlook.office365.com (2a01:111:e400:401e::25) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 23 Jul 2015 05:30:11 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD039.mail.protection.outlook.com (10.173.161.135) with
	Microsoft
	SMTP Server (TLS) id 15.1.213.8 via Frontend Transport; Thu, 23 Jul 2015
	05:30:09 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t6N5Twki012178;
	Wed, 22 Jul 2015 22:30:07 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jul 2015 21:29:52 +0800
Message-ID: <1437658192-8322-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437658192-8322-1-git-send-email-b54851@freescale.com>
References: <1437658192-8322-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD039;
	1:WAdaMVa7MizPYAyJ7SJcia8US962Q6zNFJt4VzKraPZ9V7IAeJ3W2H0iJpDGOyK08az4SpIHKYHdfdlJJNbWFvXN3JCV3khZ5w6RsNBHCPLniqWal5jJ84abzoi+sOYLVsXLsjz376tm/ia/yj495KsnJidLFWPzWGGMNjOjd7xYSA4oZDHlBDEZEP/LNF71NpDYp9ojGUR2eSHa5AgEukxcDUUK4MdDoVI/TEy340m9ATuzY9AK6TJaBHYHheuS2yUuTGAtYW4Hw4GV5oVg/kss3xcrBwKSgwQZtjSHaxBAeSGxFAk6KW/MCopT2g3SWYpphn4n5FvdUfvQK/46dG1WgBJaphrZTFWsbFRfQGOAHcVUOYJLNvOimpopRCDgi10rc7ewtKYw5aJXvFvuQmE7jH5THNhq7oT8QFzJEZl/00MR7BZ84E46QFizyXs8
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(33646002)(47776003)(86362001)(85426001)(77156002)(575784001)(19580405001)(105606002)(230783001)(62966003)(87936001)(92566002)(2351001)(77096005)(450100001)(104016003)(110136002)(229853001)(107886002)(189998001)(50986999)(5890100001)(15975445007)(6806004)(19580395003)(50226001)(5003940100001)(36756003)(5001960100002)(50466002)(46102003)(48376002)(76176999)(5001920100001)(106466001)(2950100001)(4001430100001)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1179;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	2:6z5pXPJrNjpvHra5DxV+TviWKeKqdJQSLdJ4Hn9R+34yEnmzmyf0a58RZPnSeAyvpRkJ7IMwqudtzc8hZF5LAI2BzYl9sjJyU7Ck4/8NuHayrhbo3to73MROhoiewPkw86d5F6EeBMdAo02NyFJyMwbqWz4goiYC9PHS1NLbHN8=;
	3:buqUbo6S3oj1hxEIQrajgbKseITSgvf+lcJ2khCvIgm9BNQ2YKwWPp6IDIBTnJG4NhTjRq+1YNmyH1vpHLLRpa+w2Ynaenq1Z8Gyk4mwIdfaTpEfD08CtCi8zdosWEkiZ85glIeRxKO+ceRDIs+IIm3q1LriiHPhPQp6otuG/3RI0oYswfDEAro1SxJzLYNYaOvzCNiaZhNfcisaoHuf6G5JN71NCRqx1GRWVjmQpv0=;
	25:4xPxuAEJvPcHE7aceF6mFa/QFANceVhh4CQqrVRDcr40uVGHc6zirz+WPwzBhEGboFECF+TmcyLubPhgYhAI3P3w6yXVjZ0Dp+Qm9SuVx8Br6phGn0I4V+8eqkvcH2oHVD/FnQV7BCIj6pA1T1e97k1eWMb4e0SEwc9GJ5VXvsBgbvBDrmD0Eue9u2fN2EhOA5LxsR8poeN0RSU3tMu9ndN5P3j4bOedoZwZ8JrmyEM0nf3EkHcfGLs2Mt/pWzMbfKpeQjLomrA2siUHpSKODA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1179;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	20:yexJNXfUIosOUHA58luZgddFJsCnNQ5EADY8MfErCEthSNZEp0c56/4A8aeTPJkQIOXr6t+hjVV04OcWv0iCmYszJH1cce2WBQht1Tym/5U++kh7OUmJ9khbYg0ORPXUBf+yDGPiRKAhLGVOL6YV0oYyasQa2IPezHh/TxJtq8PmlyRY1iBTJKW+ahZxFPs9R/TYxSR+tPRtU6kXwgC7AbC8oMuKMG9lF4zIo2uWMDHLd5Ok5xYKc5Ry4VMBRjRjJh34HqzhobehiDKZDiJOJcBX4hbPM7RtS/sSxqv08BdioAUnaho5YTfQ3KGr8uBUHogVKSmlhbi4qUcOwsogyFVMk+rDvSMwhbbT+3ninWc=;
	4:zhm5xs1jmh/6eY6eyvaJy842fqyRbTJ7MriAS051NGrnJQEyRr0X4bpl4Yy/7n2wsfxzx8YFOoatoagLMrJdJU2TU/E3aqaHnPQjqah2WHMLm4R12bH5QykLYK/ui+RnNszGxq/BDLzRISBf4ZyZ6jmwqO6lKDZTGKvc9UWgWUFO1kBSCYxw9/zuqBFK9Sg1l+z+GmeMzB7uuMkilULn8PJ5ylAj6TH2N22QVqndTorFS4sG160I1UqPCrMCWoTthpLj1XctOyDjkXXnCTLTdI10rYSVVCJnrb3TaUI3Omk=
CY1PR0301MB1179: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1179BB4431B4A8965404FD3486820@CY1PR0301MB1179.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1179; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1179; 
X-Forefront-PRVS: 06469BCC91
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1179;
	23:K+TBD4M86pK/QhV9JBsl5azfqq4JtDxxviSQqJt?=
	=?us-ascii?Q?/wPfj9EahYzdJ9I4Wmn2Td2r4M8OHfSC4PCwZ0WOOTmasEUgyS2LqC3wC+r5?=
	=?us-ascii?Q?F+rfE1ulRF8basQwleoQ0z0HjlNwYqk2WqjYCWoY/+mwYodxALRwlFQ3BfZJ?=
	=?us-ascii?Q?c+vUYlcC+2y33ulA3VYcV74GKpJoO01Kme4GQFL2nENKk3+QoqChn0xT3w//?=
	=?us-ascii?Q?vv1YqBa/SvaL0Q69byj1xuAZuTp5xSMtKXCaCSeyzIWmZTKQ5MwHMtmkJJiR?=
	=?us-ascii?Q?CA3LSgodS5FTe8DZ1W/0HhqGvk/IeAf4B8qXGw21OPkEKVCFRsS+9v7lKho3?=
	=?us-ascii?Q?DiqQS/DlWVFP2OCWtog4yxMp+DUUzS33b3qzCeEEMukXb66rMQ+fbhSXi85z?=
	=?us-ascii?Q?R/BRkPWg7tZYIh6Wq5ta0iRR+sIQottcgVweqjZi1TcdlFrec/gWUWXcqTAn?=
	=?us-ascii?Q?9oaIuwtxhbb1/fzAWDctEs/bmqitsrX1XmzcYqTUpQKOvdd/+yekidkBELho?=
	=?us-ascii?Q?ajJUCkghhssbBBB+oRzY5TBBK8VI7/UY+s5vR2b6Qeij3YjTuxulr/ofkON/?=
	=?us-ascii?Q?s7H5+ExKaSgoW6QR6P4oPNvbdNHpwOA9P7TsRTDudNzs2MOcd0+x7Z3f/8JG?=
	=?us-ascii?Q?GZHj711YRcWwSliPqHi+x34Qa6cyErk9/NgpxzouclaLykMNxbgmc3csV9ax?=
	=?us-ascii?Q?+6PQGtEQODhupwHr21wlWasc+7VP/kba/nreJYAdQH/sxAnqsS/gOGXrUghl?=
	=?us-ascii?Q?e+f95jjP6JubQ4zOjlDE6Au0qip2IkCKW/gv7Nss3L/ZWOQTfMKAEfXzZtou?=
	=?us-ascii?Q?DYG1ZwRsb2p2LIAW6GvxydsRZDP3gh4bqWu1+SlbBmYfknr8vq4aZOfBOvE3?=
	=?us-ascii?Q?D/mnJf1b/Qm6oZuB4vZehyKk8HSrQ/I1RfCEMm99JRwEeVVt3t+luApsQyMe?=
	=?us-ascii?Q?xX2yU6DgNl65GT6YpfcdN2v9KsLNz+4UyZIYLqUMzq5GeFsMVta8KHwtfE2m?=
	=?us-ascii?Q?d4D8mXeeacF3343T7DhBnvZY9kLqSQkILxmZd6OjgKXY+1EGLz/X4PKdZi+M?=
	=?us-ascii?Q?uSNFdlL5YiWxYWQfHJI0neBlBpku8pRPirYwkDoQK24wVRPsnHtl+Rn5XtSM?=
	=?us-ascii?Q?2nu6VdJxmahdhErUTgtPjhcda/hZSzm2t?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	5:hs8gWp0kCUVanS4n0wgsZjyBlaWLoqsiN3YJD06FN6IJcGnUatW9f5c7m8T3iNTNfT9wUpwEBYwqvj6A3u72ifR0lbeXsy6cFOac90+9dZ+ZzpFCSG8UvAlZNEOsLM+6ugI0a1/H36dE25R3LO666g==;
	24:n/9ePB9Zkei8jjMwi4RtPHDfkqsITaeX68qUpR1nQmkJDs/iv6tmVbeDJ2pmf7kfRUEmjHgNXNJIYwkcp6OREpFZ9nmlzYDfGPqOAL3SAT0=;
	20:8CrYBEmb/vh2YLZdRkOjPJX9QK7BY5uqCEmCUw3WhTlkvuT5pcHGDxIakozsQ47RRfcZvZws8UnRMYtNUIXXfA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2015 05:30:09.9175 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1179
Subject: [poky][PATCH 3/3] gstreamer1.0-plugins-base: Add patch for Gstreamer 1.4.5 base
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
X-List-Received-Date: Thu, 23 Jul 2015 05:45:24 -0000
Content-Type: text/plain

Bug fix

-[video-frame] Don't ref buffers twice when mapping

-[video-frame] Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF

-[videofilter] Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF

-[id3demux] Use g_utf16_to_utf8() instead of g_convert

-[gstvideodecoder] Handle audio video decoder error

-[gstvideopool] Update video alignment after video alignment

-[gstvideoencoder] Keep sticky events around when doing a soft reset

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 25 +++++++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 +++++++++++++++++
 .../fix-id3demux-utf16-to-utf8-issue.patch         | 54 ++++++++++++++
 .../handle-audio-video-decoder-error.patch         | 66 ++++++++++++++++
 .../videobuffer_updata_alignment_update.patch      | 53 +++++++++++++
 ...p-sticky-events-around-when-doing-a-soft-.patch | 46 ++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  7 ++
 8 files changed, 407 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
new file mode 100644
index 0000000..c4eef00
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
@@ -0,0 +1,25 @@
+From 269f642c45d85cfd630ed490478e6bd6b71a767f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 16 Sep 2014 01:07:18 +0300
+Subject: [PATCH] video-frame: Don't ref buffers twice when mapping
+
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
index 0000000..554b8ac
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
+Upstream Status: Accepted
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
index 0000000..91beb90
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
@@ -0,0 +1,69 @@
+From 3a7cdcdfc9c5b0d20394fe51b3b8cda23931ca6d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 12 Sep 2014 14:41:01 +0300
+Subject: [PATCH 3/3] videofilter: Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
+
+Upstream Status: Accepted
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
new file mode 100755
index 0000000..458d153
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
@@ -0,0 +1,54 @@
+Author: Lyon Wang <b12696@freescale.com>
+Date:   Thu Oct 9 17:37:43 2014 +0800
+
+[id3v2frames] Bug fix for id3demux issue
+
+Fix the issue that id3 tags utf16 charaters cannot be extreacted in id3demux
+when I tried to get the id3v2 tag such as TIT2, TALB etc. it will return extrac
+failed.
+
+Checked in id3v2frame.c,  When parse the UTF-16 streams, it used g_convert() to
+convert the buffer from UTF-16 to UTF-8, however it will return err that this
+conversion is not supported which cause the extraction failed with these UTF-16
+characters.
+
+In the patch, use g_utf16_to_utf8() instead of g_convert, which can convert the
+character format successfully.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741144
+
+Upstream Status: Pending
+
+Signed-off-by: Lyon Wang <b12696@freescale.com>
+
+diff --git a/gst-libs/gst/tag/id3v2frames.c b/gst-libs/gst/tag/id3v2frames.c
+old mode 100644
+new mode 100755
+index 3785c2a..7b9d8ac
+--- a/gst-libs/gst/tag/id3v2frames.c
++++ b/gst-libs/gst/tag/id3v2frames.c
+@@ -1057,14 +1057,17 @@ parse_insert_string_field (guint8 encoding, gchar * data, gint data_size,
+         data_size -= 2;
+       }
+ 
+-      field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
+-
+-      if (field == NULL || g_utf8_validate (field, -1, NULL) == FALSE) {
+-        /* As a fallback, try interpreting UTF-16 in the other endianness */
+-        if (in_encode == utf16beenc)
+-          field = g_convert (data, data_size, "UTF-8", utf16leenc,
+-              NULL, NULL, NULL);
++      if (in_encode == utf16beenc) {
++           gunichar2 *data_utf16;
++           guint i;
++           data_utf16 =  (gunichar2 *) data;
++          for (i=0; i<(data_size>>1); i++) {
++            data_utf16[i] = GUINT16_TO_LE (data_utf16[i]);
++          }
+       }
++      //field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
++       field = g_utf16_to_utf8((gunichar2 *)data, (glong)(data_size>>1), NULL, NULL, NULL);
++
+     }
+ 
+       break;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
new file mode 100755
index 0000000..4451eaa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
@@ -0,0 +1,66 @@
+From bcb2b8b6f49e7c66124a4f5e07dea829d5ebfe59 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Mon, 15 Dec 2014 16:52:07 +0800
+Subject: [PATCH] handle audio/video decoder error
+
+When there is input data and no output data to the end of the stream, it will
+send GST_ELEMENT_ERROR, So the clips playing will quit.
+However, if only one of the tracks is corrupt, there is no need to quit other
+tracks playing.
+
+The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
+information instead.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741542
+
+Upstream Status: Pending
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ gst-libs/gst/audio/gstaudiodecoder.c |    5 +++--
+ gst-libs/gst/video/gstvideodecoder.c |    5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+ mode change 100644 => 100755 gst-libs/gst/audio/gstaudiodecoder.c
+ mode change 100644 => 100755 gst-libs/gst/video/gstvideodecoder.c
+
+diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
+old mode 100644
+new mode 100755
+index c2e7a28..891df0a
+--- a/gst-libs/gst/audio/gstaudiodecoder.c
++++ b/gst-libs/gst/audio/gstaudiodecoder.c
+@@ -2123,9 +2123,10 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
+       GST_AUDIO_DECODER_STREAM_UNLOCK (dec);
+ 
+       if (dec->priv->ctx.had_input_data && !dec->priv->ctx.had_output_data) {
+-        GST_ELEMENT_ERROR (dec, STREAM, DECODE,
++        /* GST_ELEMENT_ERROR (dec, STREAM, DECODE,
+             ("No valid frames decoded before end of stream"),
+-            ("no valid frames found"));
++            ("no valid frames found")); */
++        GST_ERROR_OBJECT(dec, "No valid frames decoded before end of stream");
+       }
+ 
+       /* send taglist if no valid frame is decoded util EOS */
+diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
+old mode 100644
+new mode 100755
+index ac581e1..4278bcd
+--- a/gst-libs/gst/video/gstvideodecoder.c
++++ b/gst-libs/gst/video/gstvideodecoder.c
+@@ -1068,9 +1068,10 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
+ 
+       /* Error out even if EOS was ok when we had input, but no output */
+       if (ret && priv->had_input_data && !priv->had_output_data) {
+-        GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
++        /* GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
+             ("No valid frames decoded before end of stream"),
+-            ("no valid frames found"));
++            ("no valid frames found")); */
++        GST_ERROR_OBJECT(decoder, "No valid frames decoded before end of stream");
+       }
+ 
+       /* Forward EOS immediately. This is required because no
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
new file mode 100755
index 0000000..57edd8b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
@@ -0,0 +1,53 @@
+commit 88d253ea23b06289df40401160b606323f16c910
+Author: Song Bing <b06498@freescale.com>
+Date:   Mon Dec 15 09:34:35 2014 +0800
+
+videopool: update video alignment after video alignment
+
+Video buffer pool will update video alignment to respect stride alignment
+requirement. But haven't update it to video alignment in configure.
+Which will cause user get wrong video alignment.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741501
+
+Upstream Status: Backport
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+diff --git a/gst-libs/gst/video/gstvideopool.c b/gst-libs/gst/video/gstvideopool.c
+index 4475f45..acef594 100644
+--- a/gst-libs/gst/video/gstvideopool.c
++++ b/gst-libs/gst/video/gstvideopool.c
+@@ -167,6 +167,7 @@ video_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* get an apply the alignment to the info */
+     gst_buffer_pool_config_get_video_alignment (config, &priv->video_align);
+     gst_video_info_align (&info, &priv->video_align);
++    gst_buffer_pool_config_set_video_alignment (config, &priv->video_align);
+   }
+   priv->info = info;
+
+diff --git a/sys/ximage/ximagepool.c b/sys/ximage/ximagepool.c
+index 6cc2cfa..6a1cbc9 100644
+--- a/sys/ximage/ximagepool.c
++++ b/sys/ximage/ximagepool.c
+@@ -597,6 +597,8 @@ ximage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* do padding and alignment */
+     gst_video_info_align (&info, &priv->align);
+
++    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
++
+     /* we need the video metadata too now */
+     priv->add_metavideo = TRUE;
+   } else {
+diff --git a/sys/xvimage/xvimagepool.c b/sys/xvimage/xvimagepool.c
+index 244a51a..34b1ab2 100644
+--- a/sys/xvimage/xvimagepool.c
++++ b/sys/xvimage/xvimagepool.c
+@@ -124,6 +124,8 @@ xvimage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* do padding and alignment */
+     gst_video_info_align (&info, &priv->align);
+
++    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
++
+     /* we need the video metadata too now */
+     priv->add_metavideo = TRUE;
+   } else {
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
new file mode 100644
index 0000000..fc1cbed
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
@@ -0,0 +1,46 @@
+From c3f7d36b992a3cbcee3386dea85720f3cb04e1ff Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Fri, 27 Mar 2015 13:39:43 +0800
+Subject: [PATCH] videoencoder: Keep sticky events around when doing a soft
+ reset
+
+The current code will first discard all frames, and then tries to copy
+all sticky events from the (now discarded) frames. Let's change the order.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=746865
+
+Upstream Status: Accepted 
+
+---
+ gst-libs/gst/video/gstvideoencoder.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gst-libs/gst/video/gstvideoencoder.c b/gst-libs/gst/video/gstvideoencoder.c
+index 614ba2d..4c5b111 100644
+--- a/gst-libs/gst/video/gstvideoencoder.c
++++ b/gst-libs/gst/video/gstvideoencoder.c
+@@ -340,10 +340,6 @@ gst_video_encoder_reset (GstVideoEncoder * encoder, gboolean hard)
+ 
+   priv->drained = TRUE;
+ 
+-  g_list_foreach (priv->frames, (GFunc) gst_video_codec_frame_unref, NULL);
+-  g_list_free (priv->frames);
+-  priv->frames = NULL;
+-
+   priv->bytes = 0;
+   priv->time = 0;
+ 
+@@ -392,6 +388,10 @@ gst_video_encoder_reset (GstVideoEncoder * encoder, gboolean hard)
+         encoder->priv->current_frame_events);
+   }
+ 
++  g_list_foreach (priv->frames, (GFunc) gst_video_codec_frame_unref, NULL);
++  g_list_free (priv->frames);
++  priv->frames = NULL;
++
+   GST_VIDEO_ENCODER_STREAM_UNLOCK (encoder);
+ 
+   return ret;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 11cf8b4..e39c059 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -8,6 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
 SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
+            file://fix-id3demux-utf16-to-utf8-issue.patch \
+            file://handle-audio-video-decoder-error.patch \
+            file://videobuffer_updata_alignment_update.patch \
+            file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
+            file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
+            file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
+            file://videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


