Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0111.outbound.protection.outlook.com [65.55.169.111])
	by mail.openembedded.org (Postfix) with ESMTP id 857D771951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:54:32 +0000 (UTC)
Received: from BY2PR03CA008.namprd03.prod.outlook.com (10.255.93.25) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Wed, 20 Jan 2016 09:54:31 +0000
Received: from BY2FFO11FD044.protection.gbl (10.255.93.4) by
	BY2PR03CA008.outlook.office365.com (10.255.93.25) with Microsoft SMTP
	Server (TLS) id 15.1.365.19 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:31 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD044.mail.protection.outlook.com (10.1.14.229) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:30 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0K9s9RJ004523; Wed, 20 Jan 2016 02:54:29 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:51:36 +0800
Message-ID: <1453283501-3982-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453283501-3982-1-git-send-email-b54851@freescale.com>
References: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD044;
	1:1CbjSN+b06H1uYNjQdMKQcRUYyf8hF3I4xfMeTc5cpD/nKwynM8qFyWHR3iJlAqh4bdNvvvL/M6zvi0BUwQhDTbWCfpa/21qcNH/s4XTqIYs/bX1/L+3QkkTYi0eYGD/shytFH6I7FQebUK9qmXH4QB8hHr5xWcmSvKgziWGxfmocmMOUxRmgBm1WcBTe4dDo0zue2lUll9YEpTbKsgin3LkMVpuMLXKeoKLlEbS30h8qlyZpxO/3YkcTlIgq9/JFTK/soymIUVH0MZvRPOfP8XcbE+ZTuQwD35k8tf88nVeAqhJE1ofMi5GO+uAzMm4zvnQ6nwiw/GJgQ0h8ICXXmKhKwlQ+dXYsRTlJbCw9c+0xHDYMPqFh48JFWWI+uqdfXzHQWD2Zzq0Fd7AhPFv61jzOxDUUUc3Yhbzc0EmuJQMbNCQ/cU+fN8NbajqPxir
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(77096005)(15975445007)(5008740100001)(4326007)(104016004)(6806005)(2950100001)(50226001)(19580395003)(19580405001)(36756003)(4001430100002)(5003940100001)(11100500001)(586003)(1220700001)(81156007)(107886002)(110136002)(33646002)(2351001)(48376002)(86362001)(450100001)(85326001)(50466002)(92566002)(229853001)(189998001)(106466001)(50986999)(47776003)(76176999)(97736004)(87936001)(230783001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 032771d4-1ad9-4a5e-8ee9-08d3217fb17a
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:xpLdElHlfUnyTHmcrRCATLDKudaPxvTgV2ThKikR8GujLxfB0BMjhQdrKQjtgdlGZ0q/WtIr7JZ98OObeSM29AWEP503QxqibfePc+t2sRJlFT1QrGM/cKdFw+QO+XXZm0l7urgNjKmOY4X8piJwXqZbVzIhxygimpFqItuDIQ53Ps0qR8Apzt3FT15KI3ML;
	3:rVsbnscrfiWmG2VcZi25UZq7F01RdHIRDXBhgIEZtDYWXwsbjNVflu5N3z4aZKOFPdj5CHaHJXU5FtqQyOzJnsEfUukl2luwGcVRLeXrvZqcH65HPpNVqzC3Ll57lj+o3VwbCyohFcqpoysJyknb25m1IH7J7e/i/o3l57u9Q4NCUvbjDCze826b4gFmz0ps9CG4hZIQral/Xlh33ahZuZCKTlrtq1Fnt0UGBJwRcTw=;
	25:7TFisM1QmHEjv2zB/h0aOxKJ9Oy29qErV48daZH2Liw8bV8yqVUm5Xs9Ykend257ZA6ijnIDD7SKcfTYK01G0AZOPu75646zqfrA+tAPvWCF0la0E2jGIZKiUbZFZ9/v+/dTd22wcWS4i+hX//JDQKZa0KCcecIT1fxpfUrLkazlJhOR46t0BXeeKbJX9+dbz41UwpoJj+d4ygsnj574hK3B4B+gTgua+/K1efQB5ZrbfX8KLQvvLvR3HaInJP3b
X-Exchange-Antispam-Report-Test: BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1169;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:JjFUxmFbdjmoUXLX0X/RRFlzxhWYLF6PGI7mHSeOf73/FRTJCLe2Ul+JiLCJUhX+vS/9im4OWJN4W3DGCEaiVs1xHmPbgqOm4+VnDf2bF+PRDHftf2DCT4nAfxsuaW0IMmbufirUn6NU9BlN8rEojau/6GFMSZM9r4zDfOKGpSQNt+pzVzOUjWRuwy0cadv3cpIrzQhzYY+KcV28P2a1cd28jAy3XvpmIhyn/iGOEETyztXgkamyJLHkiJ06fA7JsgrGPTdhmh93jc1gjXmLn11wQBBHc4nqqLHvgy9bcAJ3K3DXB/NL/NGLWhXlLKhrqi2FpoCR3M7Nehx2XFOKanGQ3dgeKcl4iZ03CoqT8Q28MLPzFgLv6VUqEFx1vevkdGzoCHk1Wdg11FXb2/cJSEkPwLYqMHYBVRe6blS7zyJbpSHQNbhS42GslGtjZrdZ
X-Forefront-PRVS: 0827D7ACB9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1169;
	23:SlM/t8sajFPhCtrH0hEi0sl3Dwjbudorg5B/YeE?=
	=?us-ascii?Q?1DRlpe0jvVSzbWirETzbkk+4NKf4JJdMQviQugWYua4FFUztSj3JLl55KyiN?=
	=?us-ascii?Q?Sbmo3idEf+IE4ihiISmEvIns2//bbDq5ELaxEnER9zUQpEff7uqQS5IMf+kT?=
	=?us-ascii?Q?Ds9CVCnRCfoaqwynvVepN2ugS3W9rjOflyCXNh5Cf04I9YcALnVXL6XDs+Xt?=
	=?us-ascii?Q?WK2eeIY0mqpwagGiVM8+t7PDlh+XYPN4GuwlxZd+5qXlghMNYxdyoeJ8LUC2?=
	=?us-ascii?Q?HNO0Q+r7PSFlSrryPJts8dKYuHTTA06O89oVFeGLgkWxCuQ6yHTGmz7vk4MW?=
	=?us-ascii?Q?IA6Wrc4feTK6rWH8Z14pRpwjZPo4BZETqoS6k1OVJoFD1krR93seoOp0XIxc?=
	=?us-ascii?Q?ypKyCIJXUyZuFp8uLwl2tRQuK/iCMzxvx010/GMNkk74k3smgAYlDGKoggsd?=
	=?us-ascii?Q?OIYCQM1+n7dPBW+kncf3QF4DiTmTEL9q+O2aKF4jFrvS0CV2r408SugaOrjN?=
	=?us-ascii?Q?U51rXWn6uHN9caOxm1ShyUPcBVJrQGjI7LYjHRXjB9kjkbtyYYQWzWCPyIqC?=
	=?us-ascii?Q?R9BbrCv+oVph7KMCvu5zCxW2SjpBqrkSYqEe0g2rXwnGjrOb5MxOyYWTulsp?=
	=?us-ascii?Q?jVvJb9cwW1HM5H7qrJGCfxQB5ZhhBAM+lssI8PlSd25cqFiLQsddEBPeeM3/?=
	=?us-ascii?Q?Ttp3I5OaevCdYqhnr06o+iLHbEOAX0YZ3wRYaakpkXCaOqDuHByIKc8gt3JO?=
	=?us-ascii?Q?ZcxJ+f4VPtOnFHX4VCzO02Sl1upBVn2OSow8vgbgxeRTspjvQBM1gQgr9WME?=
	=?us-ascii?Q?ikH8/jINKIl6Ic0Ch0DetNorHgYEun2tSsbTDz2D9v8IoayqDzbwb2rDqpRt?=
	=?us-ascii?Q?/Gd22ENxYbX7YRJ96w0155st9f7B6EfG6YIY1wFdPe6x6PiRgzh1c1agDHa6?=
	=?us-ascii?Q?4nmuw9O01tZFZVweWh0fzAdWSgzNSPPCvnNplqIvLohwQpEvMTCQtbx2ZJ/W?=
	=?us-ascii?Q?QxGabXPg0DSUjZHn64yQ639Jtmsdjf++R0CCnk6YbdV53y5tIg/pLRDbQ8bl?=
	=?us-ascii?Q?fnAQkVtu6JJV6Cq3y193r9OmWN5ENLnOF/FPieC48JMLQonvukw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	24:fO8JaOuNrjFuscK+YAWYk6LNMdqcsCCq7TBGKo76OXanmEWSd/2rcUwrR3nhYKPuC7x5SRwr8VOQMbNCA8neVLYRSLuzL2WxIYWz6zbCMa4=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 09:54:30.9506 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
Subject: [poky][PATCH v2 2/7] gstreamer1.0-plugins-base: Fix taglist not being sent to down stream if all the frame corrupted
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
X-List-Received-Date: Wed, 20 Jan 2016 09:54:32 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...-send-to-down-stream-if-all-the-frame-cor.patch | 57 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
new file mode 100755
index 0000000..0f4657b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
@@ -0,0 +1,57 @@
+From 2f2fc40a88061995053c60d700efe20cb17358c9 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Wed, 21 Oct 2015 16:35:43 +0800
+Subject: [PATCH 8/9] taglist not send to down stream if all the frame
+ corrupted
+
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=737246]
+
+Signed-off-by: Jian Li <lj.qfy.sh@gmail.com>
+---
+ gst-libs/gst/audio/gstaudiodecoder.c | 9 +++++++++
+ gst-libs/gst/video/gstvideodecoder.c | 8 ++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
+index f4c663a..b68f9eb 100644
+--- a/gst-libs/gst/audio/gstaudiodecoder.c
++++ b/gst-libs/gst/audio/gstaudiodecoder.c
+@@ -2309,6 +2309,15 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
+             ("no valid frames found"));
+       }
+ 
++      /* send taglist if no valid frame is decoded util EOS */
++      if (dec->priv->taglist && dec->priv->taglist_changed) {
++        GST_DEBUG_OBJECT (dec, "codec tag %" GST_PTR_FORMAT, dec->priv->taglist);
++        if (!gst_tag_list_is_empty (dec->priv->taglist))
++          gst_audio_decoder_push_event (dec,
++              gst_event_new_tag (gst_tag_list_ref (dec->priv->taglist)));
++        dec->priv->taglist_changed = FALSE;
++      }
++
+       /* Forward EOS because no buffer or serialized event will come after
+        * EOS and nothing could trigger another _finish_frame() call. */
+       if (dec->priv->pending_events)
+diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
+index f8a5869..514c06f 100644
+--- a/gst-libs/gst/video/gstvideodecoder.c
++++ b/gst-libs/gst/video/gstvideodecoder.c
+@@ -1265,6 +1265,14 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
+        * parent class' ::sink_event() until a later time.
+        */
+       forward_immediate = TRUE;
++
++      /* send taglist if no valid frame is decoded util EOS */
++      if (decoder->priv->tags && decoder->priv->tags_changed) {
++        gst_video_decoder_push_event (decoder,
++            gst_event_new_tag (gst_tag_list_ref (decoder->priv->tags)));
++        decoder->priv->tags_changed = FALSE;
++      }
++
+       break;
+     }
+     case GST_EVENT_GAP:
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index 473dbcd..3139148 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
             file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
+            file://0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
 "
 
 SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
-- 
1.9.1


