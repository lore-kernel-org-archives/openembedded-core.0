Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 050AD78803
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:44:48 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id C58C31543
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:35:33 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 11:35:19 +0200
Message-Id: <20180717093523.5582-2-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180717093523.5582-1-dv@pseudoterminal.org>
References: <20180717093523.5582-1-dv@pseudoterminal.org>
Subject: [PATCH 2/6] gstreamer1.0-plugin-good: Update packageconfigs
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
X-List-Received-Date: Tue, 17 Jul 2018 09:44:49 -0000

* Always enable bz2 and zlib, since these are part of oe-core, and
  dependencies that are in oe-core can be always enabled
* There is no twolame recipe in oe-core or in meta-openembedded, so
  disable it
* Reorder the packageconfigs alphabetically

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer1.0-plugins-good_1.14.1.bb         | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
index 36eb3107ae..baeb19ddfe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-DEPENDS += "gstreamer1.0-plugins-base libcap"
+DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
 RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
 RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
 
@@ -28,7 +28,7 @@ PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
     ${@bb.utils.contains_any('DISTRO_FEATURES', d.getVar('GTK3DISTROFEATURES'), 'gtk', '', d)} \
-    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 bz2 zlib mpg123 lame \
+    cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
@@ -37,11 +37,14 @@ PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
 PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
+PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
+PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
 PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
 PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
+PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
 PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
@@ -50,11 +53,6 @@ PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
-PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
-PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
-PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
-PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
-PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
 
 # qt5 support is disabled, because it is not present in OE core, and requires more work than
 # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
@@ -62,7 +60,9 @@ PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
 # in a gstreamer1.0-plugins-good bbappend).
 
 EXTRA_OECONF += " \
+    --enable-bz2 \
     --enable-oss \
+    --enable-zlib \
     --disable-aalib \
     --disable-aalibtest \
     --disable-directsound \
@@ -71,9 +71,10 @@ EXTRA_OECONF += " \
     --disable-oss4 \
     --disable-osx_audio \
     --disable-osx_video \
+    --disable-qt \
     --disable-shout2 \
+    --disable-twolame \
     --disable-waveform \
-    --disable-qt \
 "
 
 FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
-- 
2.17.1


