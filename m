Return-Path: <B50113@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0145.outbound.protection.outlook.com [157.56.110.145])
	by mail.openembedded.org (Postfix) with ESMTP id CCF6D7264B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 02:55:00 +0000 (UTC)
Received: from CY1PR0301MB1258.namprd03.prod.outlook.com (25.161.212.156) by
	CY1PR0301MB0889.namprd03.prod.outlook.com (25.160.164.20) with
	Microsoft SMTP
	Server (TLS) id 15.1.49.12; Tue, 30 Dec 2014 02:55:00 +0000
Received: from DM2PR03CA0024.namprd03.prod.outlook.com (10.141.96.23) by
	CY1PR0301MB1258.namprd03.prod.outlook.com (25.161.212.156) with
	Microsoft
	SMTP Server (TLS) id 15.1.49.12; Tue, 30 Dec 2014 02:54:59 +0000
Received: from BY2FFO11FD025.protection.gbl (2a01:111:f400:7c0c::135) by
	DM2PR03CA0024.outlook.office365.com (2a01:111:e400:2428::23) with
	Microsoft
	SMTP Server (TLS) id 15.1.49.12 via Frontend Transport; Tue, 30 Dec 2014
	02:54:58 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD025.mail.protection.outlook.com (10.1.15.214) with Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Tue, 30 Dec 2014 02:54:58 +0000
Received: from b50113.ap.freescale.net (b50113.ap.freescale.net
	[10.192.241.89])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sBU2spuL009052; Mon, 29 Dec 2014 19:54:56 -0700
From: Zidan Wang <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Dec 2014 10:55:53 +0800
Message-ID: <1419908153-18661-3-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419908153-18661-1-git-send-email-b50113@freescale.com>
References: <1419908153-18661-1-git-send-email-b50113@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B50113@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(230783001)(21056001)(20776003)(47776003)(86362001)(19580395003)(64706001)(450100001)(62966003)(77156002)(76176999)(4396001)(50226001)(99396003)(84676001)(33646002)(46102003)(89996001)(31966008)(48376002)(107046002)(229853001)(110136001)(87936001)(2351001)(106466001)(97736003)(68736005)(575784001)(50466002)(15975445007)(77096005)(85426001)(120916001)(50986999)(105606002)(92566001)(6806004)(19580405001)(36756003)(104016003)(2950100001)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1258;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction: None
X-Microsoft-Antispam: UriScan:;UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:CY1PR0301MB1258;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:CY1PR0301MB1258; 
X-Forefront-PRVS: 04410E544A
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1258; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2014 02:54:58.1898 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1258
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0889;
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 2/2] gstreamer1.0-plugins-base: Taglist will not be sent to downstream if all the frame corrupted
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
X-List-Received-Date: Tue, 30 Dec 2014 02:55:07 -0000
Content-Type: text/plain

Add patch to fix the issue that taglist will not be sent to downstream if the tack is EOS.

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


