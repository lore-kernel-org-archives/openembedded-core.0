Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0122.outbound.protection.outlook.com [65.55.169.122])
	by mail.openembedded.org (Postfix) with ESMTP id 93B8D601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:26:10 +0000 (UTC)
Received: from BLUPR0301CA0042.namprd03.prod.outlook.com (10.162.113.180) by
	BN3PR0301MB1171.namprd03.prod.outlook.com (10.160.156.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 10:26:09 +0000
Received: from BL2FFO11FD028.protection.gbl (2a01:111:f400:7c09::162) by
	BLUPR0301CA0042.outlook.office365.com (2a01:111:e400:5259::52) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:08 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD028.mail.protection.outlook.com (10.173.161.107) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:08 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6TAPtZO004765; Wed, 29 Jul 2015 03:26:06 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 02:25:38 +0800
Message-ID: <1438194339-13618-5-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438194339-13618-1-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD028;
	1:ph5YKPjhdmeZ9nwWZwPYcriCL8zKn6omx65dQg5OHAYFIv+tnz2S2Aq58zbDHEoY9KOKNOsGiKBTHHxJgy7TAkOIJWSRIAoq044O4yvWszRVTrbrPn63xkHBup6PpJwqp9tyedIdc4OggqWoXIdp55euqYvY5IMcUkRco2uKun/qb6kbDkTcCDCjN1mHlG/1XR1QPRh79zokk8lqaQz1uEZu8/UKWhLoIqZbc9V2BFSKJ/mfBTWfTjpSmAZcsPhg94IbFgAxMspPHgm3SM8BeVf01XZBHiaR0DQrbZBtHc+cugke02FuifiB9f/f5xBCale68LWAOSGBPxFu0RJLmQ==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(2950100001)(48376002)(5001960100002)(110136002)(19580405001)(85426001)(229853001)(77156002)(230783001)(33646002)(87936001)(2351001)(104016003)(50466002)(76176999)(105606002)(47776003)(107886002)(62966003)(189998001)(92566002)(5001920100001)(50226001)(6806004)(77096005)(575784001)(19580395003)(5890100001)(86362001)(15975445007)(50986999)(36756003)(46102003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1171;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	2:DVU0DGVdkJoHAMz9tbJqNT1y88Xqg1L5KiC7noEbKW7GxLp8g14zIfEB33ygj/6YpTn7QNikcQvKWOM9SugdZrAtnueJKReOuWm04kfp2kSdOcEbgNLRf3VGdNoEoe4ypKN71H21bUQjJh/3UHBvbKds14aOzZiaK50MH/PdikY=;
	3:pHarp2aAr62ecwcDvOBe19xhH8quIXPpCnWEW2FRlVyfxTu1PGFpP8l8kvRb/MqYj11Q4ju3b0BOuqadQRmL17pSRH9xQysexchWn8de1ERcw4pM3v51dZB6eAz1hXDbu3dEin99F8psuwwsPzvVWfCfet19QL//VQh73ozxiJsVQg9IK2ilh+P0EeP90Lob4uHdA+6kUQOvIhdBS9WCqK+k5ObDm8IvLjOUSCqWnms=;
	25:mUJZuicc9KESv8NsBkt8+b8Ar9kzQ1pGAxdiTtPYC5J3rOF72GaeY0KF1a8cYPkSTtOvyEIyZtjmdx+Me4RIp7Y6/hpdJyZd/suwuC5I7zOA4HDW++N9/nRyozRYyuwzjWJSVXUSJbVohUkWUXXDbpqRksByrHp8PnHcY2rTDXY0hoLiPQlOVp3HpzRuoxSMG37BrTRZ52CbA3BXDcIJdBKiArh9Zv3Qoob9L4Wt4pwL+FkU0QkXi75Xiw2YLAIZkUZtgnYy0j06yAjWDiEVxg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1171;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	20:LQwtCcqZC1QmJxglLMx+TbYUX/N+/43QhzaBVdv4VsTUKTp50fdJGKVsshQ9BDq+SSs0yqBGuAZidbn7VYbxQU5NHwZzoRZDdlnKRF7LD+TjL8118688lJemuqxL4TJ1vvCKoX6qXCkOxzOjr1kv6AOF5DqO0zWQ8raytypJLl0Vv5lqvET7X2S1SFuC1v9bMaoI+KjDOsHwF32Zs9pJ8BS3vCnKv2Q9Ps27abxjd+KMRuHzQK9zTz49W9olktrOZLOc1gpB8FN4m23KAhmLvFa/d9uiwSmyAtnxcd/D+Avalnh5csADlv4siUjYBlqKFe6chJTRl6+ThdYMljoritgZxKxl2dDmgxeBw+svb4E=;
	4:RdFQsXBgr3a7H9q4Nen5gFbR2Z630CONzNkHM+BfmjLTlCGLx1Ld8GpBycYf6Un7UN9LtETEP8JH3AzxiQSbuyCcZWp/utIie72dWaQvtRxIO+6j2U3W5jRCHOHS3M9J7URPVxVDEd3diB6kW4tS1Wa+7GQ6XwsD+V/DcbWY93xxCxb5OskKhsROeTfPwNc72Ox4JwZxxcHf/FP+q7WDzhilvMDXHuV6LJ0VdgzTWB4K2enATJcAeTOstbJ4cuvje0dTPK2B4PzdIk7IX4AdxqZA+KgGaAAS2aocf96Q1xg=
BN3PR0301MB1171: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1171EF5266BE4DEB67AFA898868C0@BN3PR0301MB1171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1171; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1171; 
X-Forefront-PRVS: 0652EA5565
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1171;
	23:/K/sGECkP3elz4amBihr8KWL8GUOqSI24gI48X1?=
	=?us-ascii?Q?txdnpS64vU0w8aH2dRcTmeGmMqTp2iQuYTh31NyCRJ2B8w8Eqy1PsvAkIu0M?=
	=?us-ascii?Q?VAaDcCvhrRttGM/ZncQg1cYIhU0gqa5SCytf9bAE+xXXz97ZaTBMzL26PhT3?=
	=?us-ascii?Q?Z9B/oEQYxg9YgVCU7SdI/Xta9KDxWtVzYTNZQqTM3M8FeuDlmHz1v8GbFabc?=
	=?us-ascii?Q?K/hkHcLCUrKPYJ9kCgZk1W866ZUJ5HGOShqEv9c/E5kgyc3qYSFmPG7jtP/e?=
	=?us-ascii?Q?euXBfNLqUSYOmXGKJ/1MJwGjnokzTq9bHb1/WWlQfiyh5P/+igU9RqYtJYJf?=
	=?us-ascii?Q?Ff6TLYfI/1ETooBTCA2Ls1Fj6GOVBPUtcDO9vn/HvtBMi3sEUmLFhDvqon3Z?=
	=?us-ascii?Q?q5t6vYRxUUHDoDeCJiI3fRR5unS2oWpXMwfokpRrDZYYT9dXjicgE4v5Re2r?=
	=?us-ascii?Q?rN8otNR54LTnshODsswOCMGSdzwEiV9mfeuMsO6EpXX50R4SsT5QIebQ8ZRA?=
	=?us-ascii?Q?QeldgHYXtn6oGBewgdFig06JZakE+JikOVtQAbMPrfxFAu9J/D+CeMrh2moC?=
	=?us-ascii?Q?EStYf4aah+b12RllaNlTCPtfdS0DLxYjAzBSwNWfoT2JtWJCIfAO5QLK6+nW?=
	=?us-ascii?Q?5kF9GKvdhtWfuWFXqz0NYGzBpt8XCKZPTKeUhkElkTgzCdQoPHijvzXwVMhZ?=
	=?us-ascii?Q?YD/sJIFXuUHo09F8baX0Yyg3462djJRwDvA2ID1MXmGlENghldY4wYUH7qMZ?=
	=?us-ascii?Q?zTY9dvFj3EEwppqWuesIu9iCnDMKdzEkMiWDoGoWOVKwr4RVkyXdz/OJayaM?=
	=?us-ascii?Q?BIp+UHstad+4Sk8TLFzgFnGxlAe4Cg7I8F881KCzVETp/gDO/ob8VV7eMLw0?=
	=?us-ascii?Q?tPAR14uoBFU8Y0fLvuLGJEJD2BUUte35dkPbAY/vlIFzVgSSXrMEXhEUbXjy?=
	=?us-ascii?Q?wvzBt4p/aQpF2AMTy4ZHaei52t+Q7tUqSJ82JSAJn9v5CVrSGWirtuxfWM07?=
	=?us-ascii?Q?KYFXhxCNHf8iEzEsyKiU0bGh09eE2rVsQO2sPQ+zJ4FFpDQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	5:ye72i0OI5jYWwiXhHmlkOloBlGqV+pg1oeaTCn2rr4ibQPGbFntlIUC9kmTRdnmsqRVkiT7Zbos7J/Qr8vJ4v/xap71NdWE4yqW9Trld27ZcRSCPxxEcbc46L+ZzH0Q9v/tfMjyIiIZ/3JWe1TpaHA==;
	24:clNyQZPGo+vb/zYvEDFs2g0kRh6nb8YTlTTVDABXN5Tu92v/sdhlReLIiH12MLAc2C17PWe5svuci2+tLTJcV9bb0ssehl/rOhvqBwL9vAc=;
	20:YV5T75ij6gLEcVsaONXUq7pOmDguSZyOOrP77NWoWaq6ZFXS8zXHXdhdE8grsEtgvT0mJ1qHuDknAO3HEbgx5Q==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2015 10:26:08.4714 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1171
Subject: [poky][PATCH v4 4/5] gstreamer1.0-plugins-base: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF related patch
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
X-List-Received-Date: Wed, 29 Jul 2015 10:26:11 -0000
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


