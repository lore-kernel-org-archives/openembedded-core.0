Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0116.outbound.protection.outlook.com [65.55.169.116])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4D3761E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:27:24 +0000 (UTC)
Received: from BY2PR03CA011.namprd03.prod.outlook.com (10.255.93.28) by
	BY1PR0301MB1173.namprd03.prod.outlook.com (10.160.195.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 27 Jul 2015 03:27:22 +0000
Received: from BY2FFO11FD044.protection.gbl (10.255.93.4) by
	BY2PR03CA011.outlook.office365.com (10.255.93.28) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:22 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD044.mail.protection.outlook.com (10.1.14.229) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:21 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3R3Qi011344; Sun, 26 Jul 2015 20:27:20 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:26:45 +0800
Message-ID: <1437996407-29463-5-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437996407-29463-1-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD044;
	1:KwfD2gpdwkpvkOMgEWQMBy2mvBqeIAVsm9zYeprkUlMRamLk/ZH8ddWnCC+JS+Wt6uHV3Q9aMYZy3D1/zpohz46R5Z5FtluPDzGTaxI40Ru1S6x3c7bRXCAHgdhEOXQU9RBC16G7qU3g6EQAImnLUb5Quy4hWE//7yjHJqi23Yuaivx+57/FjPGi5bW1+fUVm+kScFkHyXocj43Y60nt4SNhYEUyw5JqH7sjtg4yaDQlOwMXwg8PYnc88rSdNRB4Fg3kSY+Pex+EhlHTxsw1Pjani4hz7zQPxB2Xi4YfQoUT7veaEAhSHm/fHEPIYGcKAF1+tfBbyqmLaMViBuSZUQ==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(105606002)(48376002)(6806004)(19580395003)(50466002)(19580405001)(230783001)(47776003)(2351001)(86362001)(104016003)(85426001)(33646002)(229853001)(46102003)(87936001)(575784001)(36756003)(189998001)(50226001)(92566002)(15975445007)(77156002)(62966003)(77096005)(110136002)(5001920100001)(107886002)(76176999)(5001960100002)(50986999)(2950100001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1173;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	2:S7TxH1T3Eb0XTm3LlCR+Aa0pi4el2dJ1i30tSEHzO0yTJd3ttBwQ+GN+OvN6NfJkp6aA+MxcIBcQR+iTvLkP5Ebt6glJppsFGJkaNM9X6s0sfXrbTRQkf0rhRYfeNMlIqvD/qn1vN/AFMchSO1HhgAaZB/1KXqcKi+ylHRwTjc0=;
	3:BsM1Ra56ky0aHQUHp4vAnoCX7dfZLUenkdJ11GQXjXlYtI1gqW5YrUEOOkzVzNrklN7zehdsPhBbgkYPlFk+TvEOdhGvCotMuscnF2Mo+D7oNDgyCHEJuS9Ch7fJcyPqIGAodAQBw8O3rw6IWg1tfjJuYY8EOZoopUASK1E5b0DA+ctMCioTk1HjthSP+KL5Lnc+vZRie4CB45OFGsenXlBOdrYM6sYoc7uIfC7bVRg=;
	25:HoNlqu/Yy5tS5yU4aAgi0Ot8psoe5yghwOSp7d+6GClyX19izpVri9xFxdl3/lQgtox/ajQmyYUbckBi+uK+MHXW9H7aZSEDZ8VE925t22GL8sGALVZZ0yloiONRcedjFg07qMPOvQ/0ze26RNZDx60jLFDnQ3BBa7fdhmOvNFmoTrb9d2imbs4x+AXyM8SQvu/WmLkC3QuU2efwwRTUf1LYc6vXq/3FbBOJTzytSQB4Ae+f2+6Dd6kwP+R4NiGcv/ppnL07jnrlQxhp6A+ZTg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1173;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	20:S/8ku5AksfTBBISP4T4ay2QVcGV8H4MYuwz9042M6u4aYfOZ8QL0qBi/RniSFgjOABH+/FX8wAYYH0XnLdN/ubMWrKuD72Ku/VlgQX9/6bc3XRydr5WMZMeLI2Qp6eUFA8TvHMVP8bZH/0kqozlNwMPl4LNrNVy4suVvgcxjJVDfqrc65+B1WFq0VkuoTSSVUEne2rcT8V0Rm8dE8TDYC+payniPUrf3j3wcpvpEccaMUVjxKBezPGgSQZ3GsHcVLb0mYRs2SO6cKkwdUZu+JXoKMWSfV4hTm7NzJeN+kKbnInsERn9OiyNbIdbM4ZVTXG8f+WwtHS//klp9HZkhrPkFtHRUmb/GO8TeOlkF3a0=;
	4:FFW1I8rQZdYVEoE7Srsw21MbcT+EEtsXOOdzosfRWxLFB8rsDHQ16vfGPeQFnkkRpDr3PKzFLGGxacPof59pthYCBzsxgVEH7mmh4ZLUg5M5PlJA6OBLA4Vl1e1WZVCDkkfSrbNpGFTz9Nk27q1eJ108bdlmihxl7UejEX686xMi/97HKPPhnFz9mEo0jSAAlyKXhArlAt+Xbm6KMDg2ukqBB1SS8ScLUrWb7kFzrcVlrs5aDFBQ6zBLIi90pd++QSkV9lRzjxXUVSKtrOI4YzPggpVCFpeCNsX1hYYK0WI=
BY1PR0301MB1173: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1173F7FAC7691A0E7423DB65868E0@BY1PR0301MB1173.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1173; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1173; 
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1173;
	23:4/a09u0fJwC0BsfiulJgZVqSL92js8BDm/cJa6l?=
	=?us-ascii?Q?m9rfaUPsR57k3l7KayKbW+T/dY8O2YCCSshAKxCM9aV+Sez0Ees2SHatNpS5?=
	=?us-ascii?Q?fjpRy89NHJiHaobxeww83FRpGhaIJAksGzZm4TyYS6inR7IiZdEtFcmBr9nX?=
	=?us-ascii?Q?PUxgMTium3W6rj0MgWPAIDyN7RBwT65JZ74DlcVclY1JcvZUZHjU1zwr/A03?=
	=?us-ascii?Q?oZilsjuLhgGgq/RigelL8HOySLEFfxXYjL8+V/cjWvmcbWy755TxKkAC4vWq?=
	=?us-ascii?Q?FzH8UTolrgoXtOhbEinKquBO7sokeOPToGHdD3bihE4BWqrntGVlIoRI6ubV?=
	=?us-ascii?Q?f8LanjN6VZmDBmSUIxSOIss3HqSzPWeuxbfQd/LKDq3tQoHA5ieoF/AqDS4l?=
	=?us-ascii?Q?NPIbQmBOcnVcinZ6Wmk6RkHKEWhnIPnyFuV51d0v/gBAwOvPgGjiLnRmMoHP?=
	=?us-ascii?Q?TDEYqNG3FDVt0HI64I2/QBD4eXxWJtyMm/rhcrX9E5tVwgQ51J1ri1iFAptw?=
	=?us-ascii?Q?aOk9GP2vRMd8ZwOp3XrpFmOcy6wKSuMhlFNebXEUpKy2/51PnzL/ZJ5vm1cS?=
	=?us-ascii?Q?eCja+kV7WCJHcixnYmeC93wypgR5YG/bxVeV5cUO4BNXAqO9nGb12izMtRbR?=
	=?us-ascii?Q?67H+Hh87Vb3ymu9n8kSnxBS+bgoloPovIDY3pSW8XHoiGnGEZpaaRaXMmXUo?=
	=?us-ascii?Q?V1tvi1R1osp4qoY9mIIVOuWIXA1q63Gh6sJ1KUItA4WkslscmId+Pn/dCEMp?=
	=?us-ascii?Q?N4LaUWp1vRm388tiS4ZVmVvT5HdoEYzw18cTcIrIu320gjHOVwGnFiNOYT9X?=
	=?us-ascii?Q?O41oue4A3MoRAuhr8foG+uTgGdY1nbFrLhHA3fdMTt4szVtbhOGeJC8OxxpW?=
	=?us-ascii?Q?E6ScSAXRC7y5dlbCN4dPNye+rKF9p+btnekdz+5SU4sY0WYfV3/iDxsxIHhM?=
	=?us-ascii?Q?11pQk0QqTjas+HXEw4I6MGYkOKoYUDnTrTXm6+QIQteCGSEUkgxGIwVxY/wE?=
	=?us-ascii?Q?NfB8erfNp3FzsG+BFe5YrXTxD?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	5:8VZ2wjwsGrsGysdtbiJ+cZuEmeQvaZbNhIZe6W5a9tUUOG7okQIEJDcbAxcPcPaazq2+mqhguk0JFfu+R/Uh7mh92QWxOaqdPvUiqwTWIggvEDY/K8ajDoRLAqvIaFRmm9TFEYPRJJ3qV1xQKMxl2w==;
	24:lg2WlrKqZbSjShcaTPBHVbO4O8HnlMPbT8SLM7K7X2cE9SHR++Pf9jtGGl3GN5zEd/Y9RZ3aRDNOFyP2YkomrpizaeqCcIP8wVudRTDCjn4=;
	20:JUHjfCrryd+C9WlnFhJLA7cbfFkKOymQF6rropQGq84fayetfan58Z4+MyOFVk/cYfYucllaGAt5SsBq+uc9vA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:27:21.8341 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1173
Subject: [poky][PATCH v2 4/6] gstreamer1.0-plugins-base: Add video-frame related patch
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
X-List-Received-Date: Mon, 27 Jul 2015 03:27:25 -0000
Content-Type: text/plain

-Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
 This makes sure that the buffer is not reffed another time when
 storing it in the GstVideoFrame, keeping it writable if it was writable.

-Don't ref buffers twice when mapping

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 25 +++++++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch

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
-- 
1.9.1


