Return-Path: <B50113@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0139.outbound.protection.outlook.com [157.56.111.139])
	by mail.openembedded.org (Postfix) with ESMTP id A06CB725E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 09:29:46 +0000 (UTC)
Received: from BY2PR03CA008.namprd03.prod.outlook.com (10.255.93.25) by
	DM2PR0301MB1263.namprd03.prod.outlook.com (25.160.219.28) with
	Microsoft SMTP
	Server (TLS) id 15.1.49.12; Mon, 29 Dec 2014 09:14:48 +0000
Received: from BY2FFO11FD037.protection.gbl (10.255.93.4) by
	BY2PR03CA008.outlook.office365.com (10.255.93.25) with Microsoft SMTP
	Server (TLS) id 15.1.49.12 via Frontend Transport;
	Mon, 29 Dec 2014 09:14:47 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD037.mail.protection.outlook.com (10.1.14.222) with Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Mon, 29 Dec 2014 09:14:47 +0000
Received: from b50113.ap.freescale.net (b50113.ap.freescale.net
	[10.192.241.89])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sBT9Egff012453; Mon, 29 Dec 2014 02:14:45 -0700
From: Zidan Wang <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Dec 2014 17:15:43 +0800
Message-ID: <1419844544-10137-2-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419844544-10137-1-git-send-email-b50113@freescale.com>
References: <1419844544-10137-1-git-send-email-b50113@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B50113@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(19580405001)(97736003)(450100001)(21056001)(77156002)(33646002)(62966003)(6806004)(87936001)(64706001)(47776003)(68736005)(2950100001)(15975445007)(50466002)(48376002)(230783001)(4396001)(19580395003)(50986999)(31966008)(77096005)(46102003)(50226001)(20776003)(104016003)(84676001)(99396003)(120916001)(110136001)(89996001)(2351001)(105606002)(107046002)(229853001)(92566001)(36756003)(85426001)(86362001)(575784001)(76176999)(106466001)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1263;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1263;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:DM2PR0301MB1263; 
X-Forefront-PRVS: 0440AC9990
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1263; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2014 09:14:47.6538 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1263
Subject: [PATCH 1/2] gstreamer1.0-plugins-base: Add taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
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
X-List-Received-Date: Mon, 29 Dec 2014 09:29:51 -0000
Content-Type: text/plain

The patch fix the issue that taglist will not send to downstream when the tack is EOS.

https://bugzilla.gnome.org/show_bug.cgi?id=737246

Signed-off-by: Zidan Wang <b50113@freescale.com>
---
 ...-send-to-down-stream-if-all-the-frame-cor.patch | 57 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.1.bb   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
new file mode 100755
index 0000000..51fdc7e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
@@ -0,0 +1,57 @@
+From 68fa1b1425ad2c5f7c5013d0943153a8a6d0934e Mon Sep 17 00:00:00 2001
+From: Jian Li <lj.qfy.sh@gmail.com>
+Date: Wed, 24 Sep 2014 17:21:02 +0800
+Subject: [PATCH] taglist not send to down stream if all the frame corrupted
+
+https://bugzilla.gnome.org/show_bug.cgi?id=737246
+
+Upstream status: Pending
+
+Signed-off-by: Jian Li <lj.qfy.sh@gmail.com>
+---
+ gst-libs/gst/audio/gstaudiodecoder.c |    9 +++++++++
+ gst-libs/gst/video/gstvideodecoder.c |    8 ++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
+index 3504678..3d69efe 100644
+--- a/gst-libs/gst/audio/gstaudiodecoder.c
++++ b/gst-libs/gst/audio/gstaudiodecoder.c
+@@ -2083,6 +2083,15 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
+       gst_audio_decoder_drain (dec);
+       GST_AUDIO_DECODER_STREAM_UNLOCK (dec);
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
+       ret = gst_audio_decoder_push_event (dec, event);
+diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
+index dd8abe3..d9bfe4d 100644
+--- a/gst-libs/gst/video/gstvideodecoder.c
++++ b/gst-libs/gst/video/gstvideodecoder.c
+@@ -1024,6 +1024,14 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
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
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
index 0db42ce..27b8774 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
 
 SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
+            file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
 "
 
 SRC_URI[md5sum] = "a825628225bd0a58c0df87cdd2a5db91"
-- 
1.9.1


