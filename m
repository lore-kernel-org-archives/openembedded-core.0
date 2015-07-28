Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0115.outbound.protection.outlook.com [207.46.100.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3C13C76243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:58:39 +0000 (UTC)
Received: from BY2PR03CA002.namprd03.prod.outlook.com (10.255.93.19) by
	BY1PR0301MB1174.namprd03.prod.outlook.com (10.160.195.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Tue, 28 Jul 2015 09:58:39 +0000
Received: from BN1BFFO11FD035.protection.gbl (10.255.93.4) by
	BY2PR03CA002.outlook.office365.com (10.255.93.19) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:39 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD035.mail.protection.outlook.com (10.58.144.98) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:38 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6S9wPel017590; Tue, 28 Jul 2015 02:58:36 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 01:58:10 +0800
Message-ID: <1438106291-14986-6-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438106291-14986-1-git-send-email-b54851@freescale.com>
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD035;
	1:S8Mu9x2M/D519UcAGvvCLwEHtLFRc3wnGFPl3jxFtNuKvA1FNj7lRwGOs6GuSUuhEr0xWNkhAQMIlUVRheaRckxst4i8Wd4SXUKc9edcV1M2G192nKcxf9R/AlkzH/9nXqlzkxDlS1fPe9VuGVvEJFcDkJHd8hgIJJeJw8sGyLAW2cZB4sdShP5+WTXfFnzqiUWbTXnyMGb1tStYiT52bX3O3NPC8b1Yu+1B8OVMl5bpDbr9Sn4d4SH0R0bS1CJVI+JELByLJj7gpDw2SXKxq6yUbIf6qpFdkfhPZJT8yOdYhd3rDyZYErb0xzgNqx8Fp/57vO83L6Smp+Dp88oN8w==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(36756003)(575784001)(46102003)(19580405001)(189998001)(6806004)(19580395003)(5001960100002)(230783001)(15975445007)(110136002)(5890100001)(107886002)(77096005)(106466001)(62966003)(2950100001)(48376002)(77156002)(47776003)(92566002)(86362001)(50226001)(104016003)(85426001)(229853001)(50466002)(76176999)(87936001)(2351001)(33646002)(50986999)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1174;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	2:mhhcG297IXLziigxNGZ7Q1FQHDK3SPUfX2n9tEcYEYF3Cb3+3XGC+gl4+ImKixEsZc7OR5CKuaH6t2G9i7z9jDXrGFYKZEADj4/LuDD1R4EHVAU4OTxVNwpw45rV4sIKMWQHA8e/Fqt7iJ8VNycd5QVxqyHaBn8F1tHWZmxqdJU=;
	3:QFXwDsHU9AxDMB/5x37DxByJgRWuonm7epie7bnwt3qTnoHe4aIsX04N4Zga4z9TsT+zDzb1eLM3rst1DjKzc8xcJsQvyNxvZ+2fp2Nl9IyFs+cqFSLqobJeHyv7nsdX7uZ1JnFh7YlFjUG80DBB9cvpYcjb07Ac8U1qBku6u8gzTODEI05YyD8B8ls4E+59k6bTiR9vMJmZvbNdG+QIUgJJYw/mIxSAx5sQQbYOId4=;
	25:BvvtVRjxhs2AaMokWUO8oGJewZtq4apo3VS7FeGsqu2vYMWbZzyQxO4nYs5zQ1NDbOdLr5TefdJdQiILB7X33/1GHtpQklfMP59pwZlQNanXrwKW3s4/3iZuT7/7h2OYqm+qxLjScm8c0uMghCHkK2OP1N0YDE+De+zUjxCYTc6wUNx9DtbwI60J0LtptAkefDkJgWnRDE74x/hU0D2xKIzDkE7WMwFH6bHAXorLaA/ZDJauHpjx++t1g5Ml4jDwXVRrCEda0mk9WSfyL44BUg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1174;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	20:moHyljq3sl2MiEL9swOZO6rb38JRVvJ/vwRwxUDmce2gJQqj+UmQs/ncvU4HsS3AcX60+UILDkLtn+1AHqVMCGdVKPwxQaNxOgrxdhT7FPvvsOPMciGExgMtDYUxI55kSruAzUZtiHpinQRC1qGSA7xfde/RjvRp9WWZfybiu0AN8XcElXp70X8MpRN5X0rY90Ii1+Sr4goQM6Y2p8XxB0dWPa+C0KlR5agaCUZne/RR/b1PTG826fxq5iZaVs8PJQOfCYZh5GOjmsSAGQJ2jvIf0TilzZCTojcuDc7ILJKvarzheI8a+Hk+OTudXguLvGRXKKf2w+tRlNWPH59+grpE33HkslucoTGnnC36uK4=;
	4:mzYrP4uRq25tohCOBFJpNKSitvPdh5iUt0phTxoNF/YMD4LwJanpK7fY+NJd5xUMa2raysJ9xcSUZYKF63tBp3MkGAC4ISBGGv+2FcYuScqsttS7rn/+hpc4/0m2veufXyH3Mg8ReBySsonlqRWFGmv1mpxsFANE0mHhzlSBRUwxAa5fIQt8XHmpxxHGl7RrVwWG4Tmxj4LlAAnqq8Dp9YtX2HthS1vkNE3+dh3qykZ15ogVl1tOmY6u/NpweriNw8R7yYORV8pGR0kn6NFSTQbOMNcDyWyZ87fFa+pusN0=
BY1PR0301MB1174: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB11749DE859C444B00D03FB28868D0@BY1PR0301MB1174.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1174; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1174; 
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1174;
	23:baSXhBLGJJWC+i9DpGGBg3J0WVLwalv/judQn4x?=
	=?us-ascii?Q?q5D6n1FsGTwStuGtUHh9b9DVqLZ45d8aC2YsHt62tKMooSGU265R5Wh6dsxN?=
	=?us-ascii?Q?Bp+GAmFevv5wPbhq+6crBStlZliIgHRPANWhX85U+43Z8rtGr0dS3Q3/N68+?=
	=?us-ascii?Q?TNxmrqtSj1mHSjJx+AcIz0zJDYoPwJp66XBwPDwjNjgT5vguzbW4J9EWKPL1?=
	=?us-ascii?Q?bEaWQCzOJ5bu9poqxYF4rioA225Ch2+OaK8kSQkD9U7awHYOZagBc5BBIUUy?=
	=?us-ascii?Q?pS9yTb6Kw8btp5K46ej/9cy6Yz6fQ+W3nkVEeEmte+A2sdwPL7XV5ML8uBJF?=
	=?us-ascii?Q?4pzGyE9wNM+Ejq3+oDG/NAOIdnqha5Ig3+DkjYgL8Yq3NXcAKyln2CH0r2uE?=
	=?us-ascii?Q?dH9H6r3+D4gMfvifd5/p2R+oInYeKpKnQMzSios98uwzmFezhVCFwibYwJ5c?=
	=?us-ascii?Q?oLGPwqsK0QlMDVwaw1Er1udLslcfZ7TBNSDT1D8S3LEWIfJ64xdSYKbKdsbL?=
	=?us-ascii?Q?LPn3rYAZAk/2433//a4/ucW8PjnDjejit+AWSbWADKUpAEI2TIWM5bhKhk2O?=
	=?us-ascii?Q?+qTSLQljrGAEoA8uUcLWDf4l+JpT+FZvbn8Rt/GZhqPfWOFIEdBhtrpKPlsr?=
	=?us-ascii?Q?qwAQr1UWJrFd1kRyJogJxCo2/Ap1K5VjfBMkOwVALgeZc31DDETyvdSV7xp6?=
	=?us-ascii?Q?9BbRFtIAo1o3Hpit6u3HWoGQQicvFyDejS9l5O5zw5ctSaR+Zl5PkVUKqP/J?=
	=?us-ascii?Q?CZN79gLgtNEP11PcJdYBcKSg+ymQ0FmEFoc1MLCXfeYHZBK/2FHG2ItHDN4F?=
	=?us-ascii?Q?SJoRTJGhpluN6jKtVB1uLXUl6k6fOwOzdSBPfk/+1TBufoYSK596oiwlxk1q?=
	=?us-ascii?Q?U3jJVzYd0RWe7NMQlLwURRvp/kZL/O2LyISrkvkmuBhpuToBbyhipr4WkEF3?=
	=?us-ascii?Q?hTb6bOJ5ObwpJI7C3zN2eP1Qx9Qg/03jnNqxUuJVDnZBSBnBTsoqX0UrXDIR?=
	=?us-ascii?Q?LFpDJuFwmGYNxdI95v8qlxcOd?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	5:agycaMPfteCbUhBD0g5l74HRNP3colKiuIlRd4CJSh0/7hjteJULIE3N3ABRIDcCejG52syHB9VjJVn391QSZ3F1reulFfdCXY9Kp20kiKoE1iCuAm8fcfInTeAQu4wZhJ4rURxiQgPrMblkACtMYQ==;
	24:4GIQ+mcc2jkf0ZtCBVjpyYerG5wIpvpBsANGOwJQskdVMNPlFKiwf/J8zbv8B3e6wpkbGK2aZbFphx86YAjbegVH8HJVFEzcAT9j6CqzQcc=;
	20:ju7SSuZcVyyQPCOCXz43TiRFuxzws/pNLLcnXf5eQGsU+S3Q99276qW3/7xKNXMUFJl9uVhDvrqWMS2ATSq3TQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 09:58:38.3059 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1174
Subject: [poky v3][PATCH 5/6] gstreamer1.0-plugins-base: Add videofilter related patch
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
X-List-Received-Date: Tue, 28 Jul 2015 09:58:41 -0000
Content-Type: text/plain

Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
new file mode 100644
index 0000000..afe9131
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
@@ -0,0 +1,69 @@
+From 3a7cdcdfc9c5b0d20394fe51b3b8cda23931ca6d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 12 Sep 2014 14:41:01 +0300
+Subject: [PATCH 3/3] videofilter: Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
+
+Upstream-Status: Accepted
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
index 491bf0d..9c31391 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://videobuffer_updata_alignment_update.patch \
             file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
             file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
+            file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


