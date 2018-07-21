Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id A9F4378879
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:24:07 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id EE00716B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 11:24:07 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 11:23:58 +0200
Message-Id: <20180721092402.20271-2-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180721092402.20271-1-dv@pseudoterminal.org>
References: <20180721092402.20271-1-dv@pseudoterminal.org>
Subject: [PATCH v4 2/6] gstreamer1.0-plugin-good: Update packageconfigs
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
X-List-Received-Date: Sat, 21 Jul 2018 09:24:08 -0000

* There is no twolame recipe in oe-core or in meta-openembedded, so
  disable it
* Reorder the packageconfigs alphabetically

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.14.1.bb   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
index 673bf10918..b80cd129be 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.1.bb
@@ -27,20 +27,24 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
-    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 bz2 zlib mpg123 lame \
+    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 zlib \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
 
+PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
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
@@ -49,11 +53,7 @@ PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
-PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
-PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
-PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
-PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
 
 # qt5 support is disabled, because it is not present in OE core, and requires more work than
 # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
@@ -70,9 +70,10 @@ EXTRA_OECONF += " \
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


