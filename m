Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id B9FD177CD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:12:06 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 54B5D4522B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:12:07 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 10:11:54 +0200
Message-Id: <1491898315-7457-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gstreamer1.0-plugins-bad: Update packageconfigs and config flags
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
X-List-Received-Date: Tue, 11 Apr 2017 08:12:07 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc                  | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 992373b..0ccfc89 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -30,6 +30,7 @@ PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,${BLUEZ}"
 PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
+PACKAGECONFIG[dc1394]          = "--enable-dc1394,--disable-dc1394,libdc1394"
 PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
 PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
 PACKAGECONFIG[egl]             = "--enable-egl,--disable-egl,virtual/egl"
@@ -50,6 +51,7 @@ PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
+PACKAGECONFIG[openjpeg]        = "--enable-openjpeg,--disable-openjpeg,openjpeg"
 # the opus encoder/decoder elements are now in the -base package,
 # but the opus parser remains in -bad
 PACKAGECONFIG[opusparse]       = "--enable-opus,--disable-opus,libopus"
@@ -68,14 +70,14 @@ PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-nat
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have not been ported to 1.0 (yet):
-#   apexsink dc1394 lv2 linsys musepack nas timidity sdl xvid wininet
+#   apexsink linsys nas timidity sdl xvid wininet
 #   sndio cdxaparse dccp faceoverlay hdvparse tta mve nuvdemux
 #   patchdetect sdi videomeasure
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
-#   openni2 winks direct3d directsound winscreencap acm
-#   apple_media android_media avc bs2b chromaprint daala dts gme gsm kate ladspa
-#   libde265 mimic mpeg2enc mplex nvenc ofa openh264 opensles pvr soundtouch spandsp
+#   openni2 winks direct3d directsound winscreencap acm apple_media
+#   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate ladspa libde265
+#   lv2 mimic mpeg2enc mplex musepack nvenc ofa openh264 opensles pvr soundtouch spandsp
 #   spc teletextdec tinyalsa vdpau vulkan wasapi x265 zbar
 
 # qt5 support is disabled, because it is not present in OE core, and requires more work than
@@ -99,10 +101,10 @@ EXTRA_OECONF += " \
     --disable-chromaprint \
     --disable-cocoa \
     --disable-daala \
-    --disable-dc1394 \
     --disable-direct3d \
     --disable-directsound \
     --disable-dts \
+    --disable-fdk_aac \
     --disable-gme \
     --disable-gsm \
     --disable-kate \
@@ -120,7 +122,6 @@ EXTRA_OECONF += " \
     --disable-ofa \
     --disable-openexr \
     --disable-openh264 \
-    --disable-openjpeg \
     --disable-openni2 \
     --disable-opensles \
     --disable-pvr \
-- 
2.7.4


