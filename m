Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0115.outbound.protection.outlook.com [207.46.100.115])
	by mail.openembedded.org (Postfix) with ESMTP id 654227637A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:58:41 +0000 (UTC)
Received: from BY2PR03CA007.namprd03.prod.outlook.com (10.255.93.24) by
	BY1PR0301MB1174.namprd03.prod.outlook.com (10.160.195.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Tue, 28 Jul 2015 09:58:41 +0000
Received: from BN1BFFO11FD056.protection.gbl (10.255.93.4) by
	BY2PR03CA007.outlook.office365.com (10.255.93.24) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:40 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD056.mail.protection.outlook.com (10.58.145.11) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:40 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6S9wPem017590; Tue, 28 Jul 2015 02:58:38 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 01:58:11 +0800
Message-ID: <1438106291-14986-7-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438106291-14986-1-git-send-email-b54851@freescale.com>
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD056;
	1:Oun02w/WboLz14an4AnEOCuMO/oRW6EWDpwqBCTTP+wHO7PxHQdO+w+/o8jV+2BpgDQ2tT+pe165bF1cv81JYMcol9+EpZM5cmoo2Z0304r0rKqVzqgjNJCbB8jOd2VSTfBpUxAFhlJGIScrh78sQvOAbGPX17Ha0RA8ykxr480hCV2amVMzglwkxg5RRSCwwk01ux42tZDp4cM4pMgbqXfVb/NXj0dbRWu4QG679J8AFKxoDezPb0Sg0BCo1vuOp9NjWputX4uFvtovDs6Eqprw526Q1IDL5Nb2kT7pHxHLXtybf3JVJb1ex+sVTaQbRyK6Y2I6Zqeq+D+zrUpOkg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(36756003)(575784001)(46102003)(19580405001)(189998001)(6806004)(19580395003)(5001960100002)(230783001)(15975445007)(110136002)(107886002)(77096005)(106466001)(62966003)(2950100001)(48376002)(77156002)(47776003)(92566002)(86362001)(50226001)(104016003)(85426001)(229853001)(50466002)(76176999)(87936001)(2351001)(33646002)(50986999)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1174;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	2:1TFlRvRlDW5o+XY+VWHbw7EqZku4C5Bv1g3UX5X/6DSjm9+6alQnxD0W2+hiSq0elrmnBCOvVfRLXo/5x0o0GAfIrSJ+Wao7jLHB9GiV0HHytkWUoGZvJkgr3/3ppObPBrdjI1qs6puVV57lwKvmlMV+jB+lswh4d+D3wOHAamI=;
	3:ER2HbE0nDaCqCNI9yXq4Qu2BAWIHwfFMpn2wcymifl36yDdIP4CsQj9CxDRSjQihd/4L6tcB1xPL1pC8eOVmoFFafXka+i2jyXrO7aa29IlkxVfurKrNshwbtrTsGR6lAmkJN2WiGrx6YX7RMSBV/VJwBCY3FiclLhUAuuDmShCJs3WXsOEjzkTOrg6UXozBwXnX4e5eZThaK2U01QmA5lFe/LbcxogK8FDwDy6gw+0=;
	25:XBUsPv6FOGwAPapDDExIW15bohAls1Z4pTee2dhq48SjDCN71QGG/V8NQbudvAFLVNhRWRlFfWoE3/WqdSmXh0iq4H6lShM5VlJ/UYegmt0dXIFeFg3fPCiLPFotIqty8OfzEvukz05iiM4EL/QALqsSIcxt/5oaNntO7zAxt+O7JXp+7y41J2oKE3ZQyczax5ZAbyLDwpX4OnYL4LWgoAJbUu5t1FUS6D+MuK1RwB8Zesvk84V9W3qT2hUxbBNouywySdzgFJG8lun20mCl0w==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1174;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	20:5xj31I/mn6X+a6Zl1i8d05W76sgB7kzN3oaf37BED6FXNczr7TULn4OyHHXgllsUFt7qAoGSXQFJ8gTjPf5p2Bw8zukNTut4OcPG+OVfmfoCwHv1rO33FKEVw7U65dmwrek2SVpgLeD3fcUtCQXXp1tfdEs2TZhTGIBZtB6PjqySgp4TO/hfz3NbpkWlm2gax+Qri/h2yHHn4YWpN2qv5kQPhAdMIxvICBMPduB7R1pAq0okhoADvQyMVOw1CPgvVFIQ9PcrFSVtu+vkFlT5BmpTYZolkrKwht0tEwrUzYwUPx46cnJIviDVAMSTIt0JV992L4D1tkXQgRwvaHhDGKmYbmA2x7REqQSk9DquhSE=;
	4:Ac0yHzJN2wHh864grzgTOqeVcjRfgcQfY5oqA+GLSeBEqPboW9t4G1+qhVBQduHbbfL3IsfrauBW/QVnFOzHDWcWcpmjLGFjHXVgYf7msw9+V9KD5VYjzsCFEGDVCk09+B9kvdI6iW8ew/t56NDAubZqomRsZOAwgcGZZ4ndpCuDbWhZ7yTxwB7Rfb7Poz9rcRTIu4RPDoHnF+X+1U7GPvbcgIfdY0aXJCeRP9uYz66RI6qH+yTjTD2a8S2HhUfDsFO5JJ78SJQrgCMzp/4DmZmP8OF/AbhQTOs/MdNVM9w=
BY1PR0301MB1174: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB117410E9AC985243D2251131868D0@BY1PR0301MB1174.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1174; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1174; 
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1174;
	23:dQTKpxESl6hFZqYWA3Gt9AsfVb9GUYvZKcNlTjA?=
	=?us-ascii?Q?l24Ya6Y3XdKEJaMnj5v5TQ5QE6nZSwYJFNjv9XEdVXbjjf6VIHqb0Q3UdLzm?=
	=?us-ascii?Q?rqyLjXOBemmwSa/0lyaiX9R49CB7RcJC50yOESi9RPRVT1Hp8BQP2jLk14Iz?=
	=?us-ascii?Q?wtAMx44JJ/nzDuuSr2d/TGsTX94TjnB0D6BEMQcjrWZOwsSJIgoWGoF5CVkO?=
	=?us-ascii?Q?dEUHyKo76mn1nYlhAupnAdxDc+0LVdnsV7sQ+IiEFxbCsg1XuP24QTkiaclL?=
	=?us-ascii?Q?OT3E5TWeYcUZ7AOi9e+cCZB5bafrVxapwQnQI6JVcrDxEvTuBTMFeH3FQQlF?=
	=?us-ascii?Q?BzMuE8oLF9HcgB3ZnnGYpLhd/xvfjCL/vxlgYHf/HSFiKR91K0cy4HgdEkr8?=
	=?us-ascii?Q?HSb9GlrdR6zKJylUOQ/ecraFvwFXT/aie8ySdIdzKBw7zWT0TYwWD+J9ALz0?=
	=?us-ascii?Q?P+Rnm7avuCrG2kRC9zxx869MylVNHZFuodFkZ9ZdMcWW6dZtokKQsoEYYUfB?=
	=?us-ascii?Q?cLsG/LZ02KgnzT0ZxaE2rhEsBXwkpeRh508B9WDi5ZfRKs6B3G+Egs3d9diC?=
	=?us-ascii?Q?EJr/n4tuzNmcrV3CpqiXhTZxJGcky0m909BU+naAD76slXeZyb4yma5iW3Rd?=
	=?us-ascii?Q?1s8le+9XZbxM4vhZUvwB3EHzZqGo8ZT3fPorbaHa0rbnKA1jFSlqDrB83g1z?=
	=?us-ascii?Q?CPu+UFtgPWFsb2LQuc3oICK5Z9AphkEPciKhnZw3A2cE0o2Y+UQalj+jti21?=
	=?us-ascii?Q?70y75RWThpu+PwRyhgbc/K4ayzdoHxeNYaURjm8+D7y5fx7oM5J+m9F+jdwl?=
	=?us-ascii?Q?rvuI1d3/cY3Eij5Te+qYTYuxxAm427lwuvx+MfeRo0+iYWeAQytubo9kB7Tw?=
	=?us-ascii?Q?Q9+i+PkgkTMtE7z9ai0TCEtqPvVBIXTKU1cp60YJcufcGcrZWCU8s7MBepyO?=
	=?us-ascii?Q?0rCj6kb7IOeREea929oXzMptvqX44Av4CRea6gG0tIsLvcLm6tofHTiEDR/B?=
	=?us-ascii?Q?Zmf0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	5:mQGt0I805hqcvH/GgKARuxRAVUagaE4NvKLHhxXJa5E++HTuKWlRCjFCaYCAJgZo6yd7ogzRHcXkS04xoJkhvb0J+Tq3w15LX84yCgulWjeEydyYO8JoFkhM60FtUNSb+PfJvXZQMAeRKrW77sVHMw==;
	24:PrKa8cjR1JcNk7xXHjS7v+3/3etvPcW7njMx+1IKtfBuxPOHGG9QOann+EL2ckaarHXgM9G1Xzv1apliQNWsqkEeoKefEDfRpmNn/8J0os8=;
	20:mHDoMrcq5TwAnlaIIQu3S+QRhkLx4UQ9z5MPTgXZnA6dccBtHCOgjnMMkmiEQatNPkIZkki0Gr5L8++5MHwtKQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 09:58:40.4695 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1174
Subject: [poky v3][PATCH 6/6] gstreamer1.0-plugins-base: Add videoencoder related patch
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

Keep sticky events around when doing a soft reset.
The current code will first discard all frames, and then tries to copy
all sticky events from the (now discarded) frames. So change the order.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...p-sticky-events-around-when-doing-a-soft-.patch | 46 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch
new file mode 100644
index 0000000..b476969
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
+Upstream-Status: Accepted 
+https://bugzilla.gnome.org/show_bug.cgi?id=746865
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
index 9c31391..8daf5af 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
             file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
             file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
+            file://videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


