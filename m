Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0108.outbound.protection.outlook.com [207.46.100.108])
	by mail.openembedded.org (Postfix) with ESMTP id 7033F7673F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:40 +0000 (UTC)
Received: from BY2PR03CA062.namprd03.prod.outlook.com (10.141.249.35) by
	BY1PR0301MB1173.namprd03.prod.outlook.com (10.160.195.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:39 +0000
Received: from BN1BFFO11FD028.protection.gbl (2a01:111:f400:7c10::1:148) by
	BY2PR03CA062.outlook.office365.com (2a01:111:e400:2c5d::35) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:39 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD028.mail.protection.outlook.com (10.58.144.91) with
	Microsoft SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:38 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVMw028512;
	Thu, 6 Aug 2015 23:16:36 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:34 +0800
Message-ID: <1438928203-12256-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD028;
	1:ZcsCGHIMTMJWoCilj3AZFv8h0x5xVIzcIt87yQQ1FAGK6xhcMtnhXdFAUVkAlUIsjTpLL+Gm3MVEO5VZpbmNis/Jp7k+xiY+SzZ+ajG6LDJOb3PixbncOmh9fqpVGcUMhIGpEvQFPD/o5gNQ6ct/dYNcOjIE3wAcKMFfPjKPLLQRVOEZH0pg4zjN3SPpLhDK3+WKYSSmXKFfVAVhnzMN3p0wfYiUJ4gYSslq02m3PegizcfZ5H/37ptaTMjTrHxUdaPKpYCieChxIzpmDEJ7wIHe/6ggV6UNSha+Zy+kQBQShw/2ljIzAOxendOpudj44tUTmqp6k2tXhPKiUyVmzQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(62966003)(86362001)(5001960100002)(189998001)(110136002)(87936001)(107886002)(575784001)(4001540100001)(81156007)(92566002)(77156002)(85426001)(6806004)(69596002)(68736005)(50986999)(15975445007)(5001860100001)(77096005)(19580395003)(2950100001)(5001830100001)(19580405001)(76176999)(106466001)(105606002)(64706001)(33646002)(229853001)(104016003)(2351001)(97736004)(47776003)(36756003)(50226001)(230783001)(5003940100001)(46102003)(50466002)(48376002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1173;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	2:Wne6P0q8U77JbHLgk1XxRDNuTcMUtTZPRq1mH9HNEJ9zC4pi4LkQySVh09g/GxswJyP31BMZ923MQKEELukNqxTNEac3Csec2MyYYfEOAaAmFI6qvoiJevdlS/BtsBh1u2zWWvVLhO2a+SPYfIBushx+ucYrDlZqbSxMTgYAT5s=;
	3:1gsftQpsumAYJflXFzoEi0dLojq+11Ckb0yKoi4DHxEP/k1ajCyBn3ZBGIfkeoLckCzSUd6zpJkAyOzLSXBxRM1fl0i34RVF34VcwtW8rCuUgHY4rEHX5O9R3rC+c4k7lW9X1ap3ekVw0zYkbJmNBhpgI/UA4ZeI561AmEn5Nf9vtXWO6I/E6N+iBmZ8Q4b6r0EohQZcgPIE34pUdPh17d9qn/fiAOF4JQdlimevUZw=;
	25:VJ9OyGIUBMHZ4Gk8WOtDKeLnyGH7FJFT1M1JgVRrsumC+9d7AJDwCK4O5xoGQqRyeAzNvPZq2x+p2r81WZTliNhGdNLOQIyxzAQ0bPHcYq/c0cMUKsJWa6AgADQ8KktqLhOVxZxYzxdUC8YO9zDZjPQzaA7+IGzwsErb8jb31/vD2pOWWWBelHhFtobp39K4q7NzXYueeyJrn+gY1c+ULInHwcgrw5SBGjDHnFAXZbwXdFcYGQ06Mgzrcq7CzFwianZa+5SshTjNGUNH7OWlWQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1173;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	20:PLrEdQQ6JFIKaZIY/3nKyJraHIAUl/ztT8+07uXExrZYLrkk1gkz73dy2rk2Z2bfv/eISFKZA5RmGSjonTjTd9JISOvkVf06NY0DPboRD3YZ2mEvCCawACbIlXjKvFMMgpp0wdqtlsYLaspL+ZTB706DQ25wJBE9y+5vGtfTWYHtzCVeKTcASCtFHz5MrIak1mdCYZOSGiVP3+HV35sOBsp9ROGFiRpzb6y2L1cIpXZuW6xpi9yHlp3Jt7oWfqmhgev3SPGgG2fAfrCFgdaJ5lwEUrhlzBA8wJAW93FRmnYFi+M1MSshQ8MqJAyg6Jr2sgEkwLiuu43s9+gM37L97iMrr/dUHV0X0hDbYanIHJg=;
	4:hUawIZnuWmFLyQbXB5VCvCtSiatcTCoaxdUpDe8lrUhW73dy9LJ9TIZpm0DpTe6gbmEhHHF7KER/G832s3n49T4cgIx+KBHATEsxvQ1ZFltSFJmn9SmXzBpqN171A1TVhGn1AIojYcRSR3DVKIfcvVvz32uxGfa+SPEQE7SfObT0vLbJonIg6EGma99WzZJYcL1qHO+dvH0XZibCLuShIix5BGzDFRqlIUhDkr+XB6JPwdHwZMcWdGYhmMlil66SkiNsyF87ccIXFc2DEiINkbY8maY86S8Hl0eZBFgJijw=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB11735681B28B8246A0E10F8A86730@BY1PR0301MB1173.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1173; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1173; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1173;
	23:9JatKDJwY8e5PBXXtLNYNrA2x9ER/BxPxJ/OGPb?=
	=?us-ascii?Q?Mh+/wAKT214d29k6mPpytoPY+7YCew4deQ6SpDy99Di9Kdgpucc2jomJsXmx?=
	=?us-ascii?Q?3OPh+63wE/mE8leO+BYZMPxBDcbIg1+t8GowUrz5+JZ7lJYfpVdBxlqg7jEy?=
	=?us-ascii?Q?oPx1be8kTASizRrsYQfPggqJmOdjvGVh3TTfvAUefY7EQEwkLGvOySgCBc+8?=
	=?us-ascii?Q?gjgfwqbC+swJT4JP9CvwyKx2aV2MQjVoDSyYmBhgbjxW7nuj4WjPl40jRb1f?=
	=?us-ascii?Q?rSDH8HyJPsgOY6yv1+MkboLmUhlI4zM4wTG6L9PYg9QKVwT1Skjbr4qsXxFR?=
	=?us-ascii?Q?37L1ycyVT7OSPa+lCuOc7DM6EMQJr6xeAi8w/UEg/pl3VLT5xJwB4zVULN2l?=
	=?us-ascii?Q?OTK9Cl1WwpdjS5qwYU79VR9sj458ewOtTazLgKDYwgvsP+cSRX2Y/zyPeukD?=
	=?us-ascii?Q?3w3s9yRyv+XjahZ6h06P0RlZ9kgBhEkaGJHob7cb20sCJ0rPqB6Y3BE3wj0k?=
	=?us-ascii?Q?+k71bmMzguI9wn7KwzwsBprTCLfsWZkZMvNfdGWaAxd/aWxMtyYmbNS3kOrk?=
	=?us-ascii?Q?V2UR+EGz0r7uyjFSnJkZpIVeg8+T4/yZ0H+xXCV6DTOFLIK2vlCR7S//9EFo?=
	=?us-ascii?Q?lC7qfeju2OL/m4Gy6GLpesAUj09dJxXs4UsEIMcpMTAbyoLJJlxBb24Adg3K?=
	=?us-ascii?Q?hwQb7oJDxT4p2d+j8MuFxHLxcS/QG6uwEh84xMU9KyIt4gKOMKXLPoYtql5/?=
	=?us-ascii?Q?/PCdNhRsPvbderuI2H0JSCUuSHRMIjUvwbL/hSkNnxnbWURWE8sGjVIw2Nbd?=
	=?us-ascii?Q?qzbiiqciY/M+SgDPDvDeHIhy4TcLrWZ5GWPogONdOgUIGT1lBKhU2LPxVfKR?=
	=?us-ascii?Q?NAIbxPTV5g2x0GTe3DUSUuNJBdvw3uXS+ApA/GDH48SGbDbnU8T5YRr/apj9?=
	=?us-ascii?Q?8WfNDx3tgalRWIibdLwBUHFhQcYEZ7tLBdbtuZ3TIOLKlqflUglnCzeLPPVI?=
	=?us-ascii?Q?5msGhHHAsTVlzS27PbVfnlEA1gmNMah/N1Jy+HWtAzzeErdoYAqHRB/ckvvy?=
	=?us-ascii?Q?Rhc5Y/WDX9pCSTQB0AszhWacTQbEFf+L1pV4GIHokak23i5LbPW+hN30/7GH?=
	=?us-ascii?Q?AUqy0FMWA8RBgvyophFGeRLnYK+Z9UDNBPOp9W9iQl1fItGn/pSPiwu9dpmY?=
	=?us-ascii?Q?ahn5T9UU6S8dLcewahH4LrF6lbMDcCTji93330Tjw1zE4wlfjv7GCeZSpg9W?=
	=?us-ascii?Q?byb2GdhG45ynasrF+nd4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	5:O1Dd2n3qlq8pNGR8VCbco9HZvrQAapZEc2PWIcTQ0x+WKfOn6fnUgGlahrd3KjxIuHG+xrLAomoh3tBZx8/wAfCG5T8Y7L9Fm0xY9eXA6g6gczEWrCgs9t9K8YIbDTOS0PgmZIjAu2cGYGQCdMSaTA==;
	24:lcVAsE+6CdsQYPC+gNv/78ESFeLO7Fe3/oWOfk5TDnXhsTN6cpxg2jngeJd3Qxa7mE0Fmk3xlKk1tADqUlYVB0Fr9uH2pYeQO7ZqA7K9IBw=;
	20:0Ib+0e9Px123lHE4S7//8UYXM1IX1gudRuDy/OfwKowozz8GD7RlpR+Zr9DfGw14AYS235FoDTK5tQeMCe8aWQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:38.5338 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1173
Subject: [poky][PATCH v7 02/11] gstreamer1.0-plugins-base: handle audio/video decoder error
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:41 -0000
Content-Type: text/plain

When there is input data and no output data to the end of the stream, it will
send GST_ELEMENT_ERROR and quit from playing.
The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
information instead.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../handle-audio-video-decoder-error.patch         | 64 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 65 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
new file mode 100755
index 0000000..833ce72
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
@@ -0,0 +1,64 @@
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
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=741542]
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index aaa1ecb..aa90179 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
             file://fix-id3demux-utf16-to-utf8-issue.patch \
+            file://handle-audio-video-decoder-error.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


