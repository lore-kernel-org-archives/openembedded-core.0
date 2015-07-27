Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0123.outbound.protection.outlook.com [65.55.169.123])
	by mail.openembedded.org (Postfix) with ESMTP id 42C7F605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:43:21 +0000 (UTC)
Received: from BLUPR0301CA0008.namprd03.prod.outlook.com (10.162.113.146) by
	DM2PR0301MB1184.namprd03.prod.outlook.com (10.160.217.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 27 Jul 2015 03:27:24 +0000
Received: from BL2FFO11FD012.protection.gbl (2a01:111:f400:7c09::155) by
	BLUPR0301CA0008.outlook.office365.com (2a01:111:e400:5259::18) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:24 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD012.mail.protection.outlook.com (10.173.161.18) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:23 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3R3Qj011344; Sun, 26 Jul 2015 20:27:22 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:26:46 +0800
Message-ID: <1437996407-29463-6-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437996407-29463-1-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD012;
	1:wKPuimhLJTrhsBvNZIGJhPtsrAirEB8SZVvZwfvZ/YCQwf9qq9vwtS+F7WjHytrVjaEWgKl55mR2CIo++SZQAjCe4FHiw/A1ZNwcZulQbaNJ97ZzjA84U+56x7iXiap8uSZsJmj1ut7qzjVaw2nZDQa9m4iAtWsifvhbds4qK4ntC+45eK6xFsJ24vdvWvRk9qtU+5lvM9J7GZ0hXgwzDfSGthrH6FGMBt+4HcCyFhZ6OI3RIiZDvSZkse5A3p6G2T4PL1RCFdxTLrw8Cnp1FdBS+ZwUHWgyCGNT5H9WNXhfwf2YUl+/JGKCDvIY6ku+2jcP3labT3g6yBj5NYQ+Mg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(104016003)(85426001)(105606002)(2950100001)(19580395003)(33646002)(77156002)(77096005)(62966003)(50986999)(229853001)(76176999)(6806004)(87936001)(50466002)(86362001)(48376002)(2351001)(92566002)(230783001)(46102003)(5890100001)(36756003)(47776003)(15975445007)(19580405001)(189998001)(50226001)(575784001)(5001960100002)(5001920100001)(110136002)(107886002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1184;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	2:u/Ess9ulSrD58VnsTYiBkAQTH3aEakaleKx+2DPu4SfWITvcMvpDYCwCjZpNv5rJB67Y7OrAxADHEuGpXwsTvRuOBPjTi0aKivboWdt+V9w2KE9FAtRqFOx4kRFBf9WKNMXOYAD6OYEyvrDebFI1DmJ/Poyxoy0VdpMqFvKMc3A=;
	3:QWGshk3omG9Cre3lTDb/HJUK1+3dQbJQ2amTK5imjgvq+TEaI0GUuFD9bY8t8EnaziFIydADCXr9ILkF4YVleKW+qzri5Sl3SvThRSjbvswre8GGEjvJMCo0ocUzlCshXfGsuf9nf2/J5kQzWxt6oMUKjFFpRbTzITc6TIQq4FPSGuiN3YQswaQ0/vy4U6iafOSDwZnaVGAbnfmq6zpreTRDUMfu2wen80n2Sy04t5M=;
	25:QQfp1R0vUvzM1/77ULPRfJiO5Q+xOY6Xt7eB635fe74hhKm72h9pn2H4Kfz25cGgAaeRYVz9lk37QwQEpK+oE4d3dRtzFLoa4QBbwTdEn/eOBu/1uNXrQ2mNK32OCxAoGWcmrBvdkNXdCdinoYtb+Vsn0y+wlcsmoWDWXiytG9v3jZSgEQsHxzUFDgOoL2/OSPwDrTALyTdtT6fXExIIJIouiBNCfTMMQKrjynanpaigHhKuUeAJRXCZJqLmcHjolNmOQoLfmbm1SonVtI3xjg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1184;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	20:QV9ROk16+dTTkHwn99277yx7O8RJl5OvAY84kl3eP77wPaSFZhme7Nyr6a0q6/Se6/6HZYLYMWN7fvqAlnJD/RUnkE1JP15SHTdA2i7Otwv8ipRiCVGIcp/0l96HZ5Wl6vPLATBSCmByZsha/i6V55niitOkdw8mYxni0BuVcdY+e06ELJZRCBwak3Gh1l2kHXtunzE/YDvacYlKaV8CURdXpJ20Z2cpVj0a9b8x4bu1SqgX7JNbbUT2k4RpOspyx564Sp4Hgxmuj5uZruo6GTVnw7KxAPUU1K9aneLBW2TJPEOMNFmLciH8xcTSAQ3S+JlVmoYJZkCayWRX4UmXsj0BZfZg6JBPb7YQAncGzxc=;
	4:fahGVH2EY06EXdGWqlahzhk8QOpcOflP5mqKYCRFVnM2MP/PgcvRqXfvlaAsYHzO5Y0zj6vJctVWVOL/gBXlnvlvQKi65LoF5JnLbwpIJoGlAjm61CahbB9TZRmt6slWGt4AHnjEB3Dpu/hUN8zME4DIDOgMz2btvYvBAEV/lOW4QTbY0COfbBoL+DPmFWNdIylx2hyKESdEW06LdGa1zYaISpvg9T4uOWP13C5lgGRuVVjxKjQwAEzJI5jRfbEt4kz4Fq0PCO7zx5iQFw3DUfimPLjAa3Vq8HLNDfEWpTw=
DM2PR0301MB1184: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11849CDADFF7B6C0AB92F00E868E0@DM2PR0301MB1184.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1184; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1184; 
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1184;
	23:AAopZ1RhBuj+v95whdFnuGYCRq/imwCbmElci9s?=
	=?us-ascii?Q?LluhJAA35qW6ZYceD6LZZ1uTmZ33CeSqE/D5fRrteIzJKtD7aFoxt4inufek?=
	=?us-ascii?Q?uTMWlUmBQOaCFxKYwyzpGiR5ZxQ601t+CGZWA8XJCodLOIdtPmxhOsP1nIBX?=
	=?us-ascii?Q?lcSEkisIz0TifQorICYEmvm2GartXZ4ppstq39J+1xmPLW5V3rsdYaVWqAtn?=
	=?us-ascii?Q?6Jdr+FubPn2iLh6taNMkHw+kQZr0xrqHEqQQdOobj6/hApib9QIpc0xxah+d?=
	=?us-ascii?Q?YTNRwnVC4D8HGOnupvw4DsV/Pd2r6zomn+ZAb/LxTTfom4Ip5zbvqNOL9FpJ?=
	=?us-ascii?Q?4f58V4Q4X8uTpRWI8wi/WKcb0R0FPYteGJu4ODhkENwL6SL2J4mmRRzriYiH?=
	=?us-ascii?Q?pNdeh9nC5OYrjGUGNL0ZaTrwQ3EaXgPfOMBAw5E4OEHcoGJ9z5KVDBuL2m1e?=
	=?us-ascii?Q?SmUF0qgUphGS4YWiOZxwkMhRJNg/h2gZwFAKa/vhnBTknHNp8TcMIGMa8k35?=
	=?us-ascii?Q?GEj7bMYjaNMZFyoBktD6DG8h7d1L8AVMm7qIOaf7gzUWe/r3OVLD0QzQpUz7?=
	=?us-ascii?Q?4kdoJ3/gdIsqJCOvNLMkfB2ZW+BbDTsqqpybFkU0nZxGWYTEAzYwOkLTuX7R?=
	=?us-ascii?Q?hjQWL6V4xkadmNdYo2T99UG9y7tI/srT29YlK1hNbcDeyfe+z1Fyj8aWYE0e?=
	=?us-ascii?Q?/SrGK0ySwAg2nMef9L73p7SrXAcZXgXKLg8hPghf8GdkXWA2FTE8AsezOI9O?=
	=?us-ascii?Q?CEVUZGykHnu5Gwp+G658cMAu7wPp3zSh0nCX8UWtYinabXJRVOYzuFGOHwA9?=
	=?us-ascii?Q?dGEjbB2q65fiT6mNJ8rhq4h7thEgGsDu6f1NoNxJsyMPHFuec+qCeDLnfVIL?=
	=?us-ascii?Q?0t0x8gjJ91iKcTBM6qnZsJ6aZJvVLYE/hc6Ng3QdDftt5XQ67Pzja/6hTED9?=
	=?us-ascii?Q?ZuZr0BYOZQpg/3X2HWHc+4gXEWQhdQB22YhcMKdHQTgrDW9y8qUb1ckw/bNe?=
	=?us-ascii?Q?7OzFXMpcbuR7TwkAHIcD+2k4woKmBijq4zNs+aVi3dbfRqA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	5:CX8gGHpfN8O7e6jJnSKFyxk8aNLsmiupjSEzUbPzSznlZYwTw7fCRMl9cxupHNX7LiUF9eDAYfmB5cLBKVbjHwIbZ/M5eKbPoZRzPEY9a+fwzDwN6CmIrkm6+Fkg52OF8VQwv9q4ygrXAFCo7mZgzw==;
	24:lO5hEel8a4F1fa73ZccLNE8TRLp4Ede3qXxBoLcXAlxdvMhdoLNds2bUZgpn/DRJvVGuI4aY8f+n29ez9dranPfX6dABEjI+YMgnigY7kwU=;
	20:+3cVMTQ+M2Qe6q1Youwyg497V0FMqF2CWFfdqF71tmZk+xtmfczcmElVu7Kt7K5Qufty60Z1LD8Obwq2UIh0rQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:27:23.9497 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1184
Subject: [poky][PATCH v2 5/6] gstreamer1.0-plugins-base: Add videofilter related patch
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
X-List-Received-Date: Mon, 27 Jul 2015 03:43:22 -0000
Content-Type: text/plain

Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  3 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch

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


