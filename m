Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 071FC6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:43 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id tr5so1825686obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BmodJzGmr4eAL2D+y+KPY6mayKoVi7k0PDGbkgW3Z3s=;
	b=uunoqQ8wVoOigwi1c/Tf8BFYE+YiLyitxFoDe+Aw7J7IKTYsUJhvIIyYY5dqMsklDG
	VV1/ltsddNy12zKh/QJyqstgGl0wFdcfwLU5p59jKbUH9NrcLXtwaFDxGlqgy4MDskJp
	wmHnARM6VTUZLuLHzEfwowblU08bKEAZszHpaESOQPAbRoqFrEM9mwkvWmzAEUN2QmFG
	GbR6SAa6Nm1snAGcZlgtJ1zsG72ANetkv6sh68AH1WEnVo2OVOy6DKFqBjHC3ESKawQP
	rClMrHsrTQM2565rwxE8Rl0Rhr4yaPRNHN0gqTF4l08gbUx5WVlUlZtfy4haNwIIfndR
	C3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BmodJzGmr4eAL2D+y+KPY6mayKoVi7k0PDGbkgW3Z3s=;
	b=gJEssIeqRCeAhqOQhTtf2iorx3CR2eF/QtKs+BkzQre9COre4ohPgfxlyqvpfoTpaM
	X15cxQcBQql+ql4UVxfSTzXGmWUt6kkyP3ytOXg7STQbp95a3BqgUV5E0ELypDTS8H+G
	vDWFUlt8hImRmGgpCuu668EwMqUcztZ3jWc4YJIU/57Lp8mxG7+AUvMrz9Ezam5VXWub
	ZTeQ3Jmo79L2/93S4Bfz2pidhk77c9dD0JraeiX8xSkxSAZJos3Nzv0XdVvDlAbt6Tym
	e/DLqvQqrZSD037VwXy7zoLPO2N/Os4l7IHHbkr/BXlN+AGKr+yxk+Twhj78t2xzMp9G
	vRkA==
X-Gm-Message-State: ALoCoQlhHcrL0WfTmjytlRmJjVGiR0xB6WMVNfwavIWKJHQiTml+1yPACK13bO09B2qfz6LUb1jznsEPvG2i1j5pDk3DV0N0Pw==
X-Received: by 10.182.114.167 with SMTP id jh7mr30581526obb.70.1453344224256; 
	Wed, 20 Jan 2016 18:43:44 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:04 -0800
Message-Id: <1453344203-7118-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 06/25] gstreamer1.0-plugins-good: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:44 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-good.inc        | 37 +++++++++++-----------
 .../gstreamer/gstreamer1.0-plugins-good_1.6.2.bb   |  1 +
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  5 ++-
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 3d17497..e79da9e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -2,53 +2,52 @@ require gstreamer1.0-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-# libid3tag
-DEPENDS += "gstreamer1.0-plugins-base zlib bzip2 libcap"
+DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
 
 inherit gettext
 
-
 PACKAGECONFIG ??= " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 \
-    "
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    cairo flac gdk-pixbuf gudev jpeg libpng orc soup speex taglib v4l2 \
+"
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
-PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
-PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
+PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
 PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
-PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,libv4l2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
+PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,libv4l2"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
 PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
+PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2,--disable-gst_v4l2"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
-PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
-PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2,--disable-gst_v4l2"
+PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
 
 EXTRA_OECONF += " \
+    --enable-bz2 \
     --enable-oss \
     --enable-zlib \
-    --enable-bz2 \
-    --disable-directsound \
-    --disable-waveform \
-    --disable-oss4 \
-    --disable-sunaudio \
-    --disable-osx_audio \
-    --disable-osx_video \
     --disable-aalib \
     --disable-aalibtest \
+    --disable-directsound \
+    --disable-examples \
     --disable-libcaca \
     --disable-libdv \
+    --disable-oss4 \
+    --disable-osx_audio \
+    --disable-osx_video \
     --disable-shout2 \
-    --disable-examples \
+    --disable-sunaudio \
+    --disable-waveform \
 "
 
 FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
index 92ebe1d..022cfd2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch"
+
 SRC_URI[md5sum] = "ef4f5bc4f31f706832a234b0f603967b"
 SRC_URI[sha256sum] = "876e54dfce93274b98e024f353258d35fa4d49d1f9010069e676c530f6eb6a92"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 2c0e0ef..d60eaff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-S = "${WORKDIR}/git"
-
 SRCREV = "fd0123800c8c1cf1468c0fa5d592ad0d0d8b4140"
 
+S = "${WORKDIR}/git"
+
 do_configure_prepend() {
 	cd ${S}
 	./autogen.sh --noconfigure
 	cd ${B}
 }
-
-- 
1.9.1


