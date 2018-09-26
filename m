Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFC6793DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 5BF656E96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:55 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:44 +0200
Message-Id: <20180926174244.20989-12-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 12/12] gstreamer1.0-plugins-bad: add openmpt packageconfig
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
X-List-Received-Date: Wed, 26 Sep 2018 17:51:43 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb
index c01e7cb993..1c913bc644 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb
@@ -60,6 +60,7 @@ PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[openh264]        = "--enable-openh264,--disable-openh264,openh264"
 PACKAGECONFIG[openjpeg]        = "--enable-openjpeg,--disable-openjpeg,openjpeg"
+PACKAGECONFIG[openmpt]         = "--enable-openmpt,--disable-openmpt,libopenmpt"
 # the opus encoder/decoder elements are now in the -base package,
 # but the opus parser remains in -bad
 PACKAGECONFIG[opusparse]       = "--enable-opus,--disable-opus,libopus"
@@ -84,7 +85,7 @@ PACKAGECONFIG[webrtcdsp]       = "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-
 # these plugins have no corresponding library in OE-core or meta-openembedded:
 #   openni2 winks direct3d directsound winscreencap acm apple_media iqa
 #   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate ladspa
-#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openmpt opensles soundtouch
+#   lv2 mpeg2enc mplex msdk musepack nvenc ofa opensles soundtouch
 #   spandsp spc teletextdec vdpau wasapi x265 zbar
 
 EXTRA_OECONF += " \
@@ -120,7 +121,6 @@ EXTRA_OECONF += " \
     --disable-nvenc \
     --disable-ofa \
     --disable-openexr \
-    --disable-openmpt \
     --disable-openni2 \
     --disable-opensles \
     --disable-soundtouch \
-- 
2.17.1


