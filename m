Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DEA756C560
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727663"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:13 +0800
Message-Id: <20181127085524.4826-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 03/14] gst-plugins-bad: add PACKAGECONFIG for msdk
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:35 -0000

gst-msdk is a plugin for Intel Media SDK. More details:

https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/tree/sys/msdk/README

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb
index ef0af7bbdc..996a7490fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb
@@ -55,6 +55,7 @@ PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 PACKAGECONFIG[lcms2]           = "--enable-lcms2,--disable-lcms2,lcms"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[msdk]            = "--enable-msdk,--disable-msdk,intel-mediasdk"
 PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
@@ -85,7 +86,7 @@ PACKAGECONFIG[webrtcdsp]       = "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-
 # these plugins have no corresponding library in OE-core or meta-openembedded:
 #   openni2 winks direct3d directsound winscreencap acm apple_media iqa
 #   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate ladspa
-#   lv2 mpeg2enc mplex msdk musepack nvenc ofa opensles soundtouch
+#   lv2 mpeg2enc mplex musepack nvenc ofa opensles soundtouch
 #   spandsp spc teletextdec vdpau wasapi x265 zbar
 
 EXTRA_OECONF += " \
@@ -116,7 +117,6 @@ EXTRA_OECONF += " \
     --disable-lv2 \
     --disable-mpeg2enc \
     --disable-mplex \
-    --disable-msdk \
     --disable-musepack \
     --disable-nvenc \
     --disable-ofa \
-- 
2.17.1


