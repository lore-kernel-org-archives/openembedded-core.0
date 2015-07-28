Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0142.outbound.protection.outlook.com [157.56.111.142])
	by mail.openembedded.org (Postfix) with ESMTP id 87AB97637A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:58:38 +0000 (UTC)
Received: from BLUPR0301CA0007.namprd03.prod.outlook.com (10.162.113.145) by
	CY1PR0301MB1177.namprd03.prod.outlook.com (10.160.165.20) with
	Microsoft SMTP
	Server (TLS) id 15.1.219.17; Tue, 28 Jul 2015 09:58:37 +0000
Received: from BL2FFO11FD021.protection.gbl (2a01:111:f400:7c09::194) by
	BLUPR0301CA0007.outlook.office365.com (2a01:111:e400:5259::17) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:36 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD021.mail.protection.outlook.com (10.173.161.100) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:36 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6S9wPek017590; Tue, 28 Jul 2015 02:58:34 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 01:58:09 +0800
Message-ID: <1438106291-14986-5-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438106291-14986-1-git-send-email-b54851@freescale.com>
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD021;
	1:LRvpWdWRIemffLH+PFzg95HxmBp3UDJ0FdqnP9X4eMVmBEzcq6xru0OOTVA6PtNEi2OWOmhoXhthT++3wFC/HaHkQDp1ZzpPPeGwji/ToQsJvSFBhd9BeRZi8eQQXN+1zZpbKSSoPWgxqVJnPM6Lsp+LnuubxMcv55R/fBDc3EHw3ZrYcvCVoDVUi8GU1Ep3mrVd27Hy0PnVz3aRx2+rwuFOM6LiN/VUjmRZbYY7USX0fn3m6855xdKbpHQGOlzkl9wZHe3+vBVrJMnW7C+5IQof5vrk2sC/mNH5gCUr+1sZaTUbST+UlLwrinwAkEXuqk2utrTFK0MyRaEpm5EctA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(46102003)(87936001)(110136002)(106466001)(92566002)(230783001)(48376002)(50986999)(77156002)(62966003)(47776003)(104016003)(33646002)(19580405001)(50226001)(189998001)(15975445007)(50466002)(85426001)(107886002)(6806004)(86362001)(229853001)(2950100001)(2351001)(36756003)(5001960100002)(575784001)(19580395003)(77096005)(76176999)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1177;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	2:y4PsUYrfRHyIVHYSgPr11Ca0RSxewdXsVsHLdwJdujzPE54k1TKZKYdCK3VapuiL;
	3:vPWsxCGSfRH/oj57cj7tf3fE9sVyhcHe+7JItvIfn6X/q+Qc3iiJy07zcBJjOtmT/h2hXTwDHEHzA98pqaMufzvYgcdI1YrQVfxaXbwEzIvGsrWWYlqEkeiIjVYuM0l8eVN7zim8QFB5sqZJvcoUbImRa4iBR7yo5Ddpz6iGRsvcN7O5nzyVSxHmVjhs2t75r0P88e07XZL3JHp86XzJw2fxZWCwq34REYcrsntDgUg=;
	25:MWiJTqc0u/U9wA1Havfq9qUAUll1BLWYWyQ7qFBBuWb1jj87SLbxN2HRZYMC6mGS3oG4qhaJfn6shV34QLYS1LkHqCarGvXWOFrS/9HSAPRL8pJxUUxFR9vKWuhdkcsPsz+n07/lPrtuJVYkjOHxo/ihhNyCO7fZyYCGP5OqANCwcLSTGG6fzwBIdAIxkOpidBSQ5vNfChWj9mFtLYlF6DcClNrn2A30RUw0Fc9KOgsxkZFuPBOnKQXIH3PlldE4;
	20:+fUBQI4CTxkL3W9UgY+/2F/dV7zcnU3yGBfu/2J5hmcCLKZXbi0RmM/vGvn8ZFRbNDSBoN4523Nm8NDNML4ND41wDrn2R716NRQ+x3QWSLF1ujZg8OxIUX8f/BI+ToLmdYUfm0y54N/caSqIo3ksvbFGVBX6Vd9gusIwiEEyOSo6bjUsi8ayo2NzwkjT655H/PQyKBW95t7ayWIxdZNqlPkYNOV2dL98kbuNaJhdNA6BRHLwHcP0KNfHIVOY75TmxyHSngqoM1S7kCnmbWdClcHFrITMtdcgFwDhEVWyLi94DqWfn/Z9bWNfX5TDuzVpdAXBhG9OuoSxLrTsiAoFMv3GPTTmuX/KqkdKI8ZUGe8=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1177;
CY1PR0301MB1177: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1177CDA2ECBBF4BCD1BD2A8F868D0@CY1PR0301MB1177.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1177; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1177; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	4:pAVhezeOx9N68deJd9u5CIMG1OGDSFL19pgz4kjNsG6JA8JcoGCN+/oFo8Aph1ufGI0FhylBZJJWcE6hO0lDYyR4TmgwgNdNge9NGrQRIpDrlITzNGlvC8SfktT5Ak9bqrKtDShF3+dGrLhKzFo5EzCgY+DfPT1BaAEUYhgG0KWAVbLKBQiTM9lnkkyW82EAtpnsBbAP9quT4y/Fwcykn/Fngsvo9qzPRgIhef3JKINKwH4fvE21MxRGj+ps2zBRaMDPGhNXzsAcKzTzyFCw+g9fpNmix5SbQMYYh282S7Q=
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1177;
	23:iPKIymyFcRNUcfYVLobMoMzbZ9m7mobIy/Zq/ZJ?=
	=?us-ascii?Q?ACtVbX+ZpGjSpv/Ic3hnEIGY5deNrhh2KkyJFdqjM3167QNe4o1kSFxDKxev?=
	=?us-ascii?Q?Cv7SdRP+g32U56fJiB5KPTJrjd8NIsVtU3m34NQEvmAu2zf7hPrYYLr8cKpc?=
	=?us-ascii?Q?t/1/TXiadL8SLVEiCcGqH5PdpJGUTz2nA/5120qDa8Fjnq1romuuMUkG1Jfq?=
	=?us-ascii?Q?h50ocX27FMIb/qAYiIsE5utAjywTIMuiVeCpK6GBa4tVJ3H4dWdT8kS45SlY?=
	=?us-ascii?Q?+1RmTXIHGg/K4HyUZx0UYoCU4BNcHiFVEY14f/+Kqm3XjOVskXeDloRi0RtE?=
	=?us-ascii?Q?29k8YpOWfNYm8GKsqo/waU3ghSytx/6e9xHdyRA7W66dxcflPRvMLomMEW4/?=
	=?us-ascii?Q?u+fLVfUMEqM6T57hunC5I5mM+Re6GhfVyAb7EQJKyVwM2wEQbQLKcIkstPIl?=
	=?us-ascii?Q?ebsNxt6DtGyWuz0PAlmdDR3mNGdXiDVN4tDKcYNmp0QBrhA1AxivkvveQhkl?=
	=?us-ascii?Q?j9wIryHdymONeP0+AZTyE1R8+ycnCQ14KUT7xy1tksqREyAdr5Vcu/N1aCGj?=
	=?us-ascii?Q?TYmHjzUnMynCq5WbJ2MyM5jhjsNn1lRrm+THhc8+nNlEA5f6uvjLXaFubktr?=
	=?us-ascii?Q?nKN/8ia3r+RM6/8079DqLufUfzxzaS/ywVyHZdgAfF+Av5+LoEeTzWo3wJU2?=
	=?us-ascii?Q?2nEx+mC0sZgK+t2z0zV0UzY0BSDZ5TA29/vOkcWMadifdQijWVVNWkeCCBNn?=
	=?us-ascii?Q?PifEZWD2lpWlhTfWzXDyqAhgAvBfn/uFm3ayFHxrWtCP80ql9+oj8i4dAWk+?=
	=?us-ascii?Q?PR15cdwLja/855aS1sb0yO6khMTyCj/Jij0QMxGVZAxRvGtzMAKuwPBAI6z6?=
	=?us-ascii?Q?nkbXNNujp7DgcEm2FRlk1hV7alS9h0R1dJsC8VR1pbscPEHswYGPRsQESyrL?=
	=?us-ascii?Q?qJ+lONVO9AtsA72vLrkdduFKses9H+px9YEb/Q4ZygoI8CT35giI469AnGKw?=
	=?us-ascii?Q?EeOY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	5:LM6X5A5/Hmc/E7/SY+KceUNys7Xg/zQkFCEPtS4mJDau/yINVdfqZAZnfs7d1ctq5Ukcpl5dMf2GbtSY8f/GOXLyYUiAYRorFX0KwWpo3yYHGxIfEKquqgJwB2s9arQDbm8aX7UejUN7ye1GWqJHbw==;
	24:IVgwzrRa+fHF9WTbt+2hWKDYgHo0fnbUv21QdBcDi7uHTrnxAt0H539PegvPcUCntJp6Vm5X6DOeuDWHm1FL438zYicSVt6Dj2ZPW/bGIoc=;
	20:tRKCI0zfAspq+rgq6+Gc5MR+50DazZjIi8Jt8J0ovPJTeVEN+jSbMtfXmviJxf8Mx4S7ozGPFkvsdyW5orYEHA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 09:58:36.3429 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1177
Subject: [poky v3][PATCH 4/6] gstreamer1.0-plugins-base: Add video-frame related patch
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
X-List-Received-Date: Tue, 28 Jul 2015 09:58:39 -0000
Content-Type: text/plain

-Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
 This makes sure that the buffer is not reffed another time when
 storing it in the GstVideoFrame, keeping it writable if it was writable.

-Don't ref buffers twice when mapping

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 26 +++++++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch

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
index 0000000..f24b33f
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
+Upstream-Status: Accepted
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 88c3254..491bf0d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -11,6 +11,8 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://fix-id3demux-utf16-to-utf8-issue.patch \
             file://handle-audio-video-decoder-error.patch \
             file://videobuffer_updata_alignment_update.patch \
+            file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
+            file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


