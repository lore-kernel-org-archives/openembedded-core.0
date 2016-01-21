Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 57D7A7317C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:45 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id is5so1823215obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XgsP3DSXPQxHapBnWd4eBITf8Zp5NbM8ujAZPxwXaHY=;
	b=uzdnj1vmQhChKso7++cAVcbQ44IRWkjRd6I9jLfgDtmYXJZyRnIge2ZLyen6mwxBYc
	Mz85mj/49zT88gXJRUnsMPa+iZOpB169h9ev1b0afLhQN1TYKDNPW4v5sBxvztf5hLvE
	3QbARK7x2DVCRulAx/p84jurypyyVKkFJ02QYt38G4UZAIv6olq6OsEllxo6mG3E8DKJ
	2fVjOoltGIzHsuIm3tVds154KJK0Va6fPN0kH3xkKvWiGYaLZhBG2TewKDhKCVpAPJgp
	iwp96R/qt7mCFkXoiV6Ie/ztFMVABR7428R5d+W3aecxNT4T78N8zYfAGALs7gjC0B+F
	7WkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XgsP3DSXPQxHapBnWd4eBITf8Zp5NbM8ujAZPxwXaHY=;
	b=CO/Jobua6KdFxBY2z7KTsXZwMe1uOEy3HKBdY2E3l/e+T5XQKfxVT2LJVe/kdsQOWX
	uEPFld8pCTp5FGMVH4SNFvoC8f3ovKVroRb7m3aDcDQqGD9JbnyF8Wn/VcKX7jtr3+7c
	bt8v1asHuZSrPIwAjN3F4x7BEFPfhrtUzCE0dF1QG/UvTOYAWI4W7Ko34JWe3s1yXRmR
	xd+6aX6jC6XEjrJF8vvM/vx3Uz0f+DZj390vVPI3i8kxFnLrTh4B9GWyVoz1QEkzy1wx
	q9l0X6JkW+jX3RSLdo+KKDKn7AtJd7Knr+9G6PBaIFBRSmeNXkp3JSw2Cc0mp+K5tmXL
	jkqA==
X-Gm-Message-State: ALoCoQmILrIIt6xlitr2iMf1a2pkML3UvMMPD7QpiwoDEzIvc8l2wBzp2rgR92r6c7zU/5jtUlhtFXRMudX7JGtsIeL9wtgdHQ==
X-Received: by 10.182.116.200 with SMTP id jy8mr31817333obb.35.1453344225992; 
	Wed, 20 Jan 2016 18:43:45 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:45 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:05 -0800
Message-Id: <1453344203-7118-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 07/25] gstreamer1.0-plugins-bad: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:45 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 74 ++++++++++------------
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  5 +-
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 11 ++--
 3 files changed, 42 insertions(+), 48 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 9bdf9da..4aa2f56 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -1,13 +1,12 @@
 require gstreamer1.0-plugins.inc
 
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 
 DEPENDS += "gstreamer1.0-plugins-base libpng jpeg"
 
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
+SRC_URI += "file://configure-allow-to-disable-libssh2.patch"
 
-SRC_URI += "file://configure-allow-to-disable-libssh2.patch \
-           "
+S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
 inherit gettext bluetooth
 
@@ -15,54 +14,52 @@ inherit gettext bluetooth
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)}"
 
+# gtk is not in the PACKAGECONFIG variable by default until
+# the transition to gtk+3 is finished
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-    orc curl uvch264 neon sndfile hls sbc dash bz2 smoothstreaming rsvg dtls \
-    "
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+    bz2 curl dash dtls hls neon orc rsvg sbc smoothstreaming sndfile uvch264 \
+"
 
-# gtk is not in the PACKAGECONFIG variable by default until
-# the transition to gtk+3 is finished
-#
-# dash = Dynamic Adaptive Streaming over HTTP
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
+PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,${BLUEZ}"
+PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
-PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
+PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
+PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
+PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
 PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
 PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
+PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
+PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
+PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
+PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
+PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,gnutls"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
+PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
 PACKAGECONFIG[mpg123]          = "--enable-mpg123,--disable-mpg123,mpg123"
-PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
-PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
-PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
-PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland virtual/egl"
-PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
-PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
 PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
-PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,gnutls"
+PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
+PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
+PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
+PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdread libdvdnav"
+PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
+PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
 PACKAGECONFIG[sbc]             = "--enable-sbc,--disable-sbc,sbc"
-PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
-PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
-PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
-PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,${BLUEZ}"
-PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
-PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
-PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
-PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
-PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
-PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
+PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
-PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdread libdvdnav"
+PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-wayland --disable-egl,wayland virtual/egl"
+PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have not been ported to 1.0 (yet):
 #   apexsink dc1394 lv2 linsys musepack nas timidity teletextdec sdl xvid wininet
@@ -81,10 +78,10 @@ PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdrea
 # in a gstreamer1.0-plugins-bad bbappend).
 
 EXTRA_OECONF += " \
+    --enable-decklink \
     --enable-dvb \
-    --enable-shm \
     --enable-fbdev \
-    --enable-decklink \
+    --enable-shm \
     --enable-vcd \
     --disable-acm \
     --disable-android_media \
@@ -104,8 +101,8 @@ EXTRA_OECONF += " \
     --disable-gsm \
     --disable-kate \
     --disable-ladspa \
-    --disable-libvisual \
     --disable-libde265 \
+    --disable-libvisual \
     --disable-linsys \
     --disable-lv2 \
     --disable-mimic \
@@ -139,14 +136,13 @@ EXTRA_OECONF += " \
     --disable-xvid \
     --disable-zbar \
     ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
-    "
+"
 
-OPENCV_PREFIX="${STAGING_DIR_TARGET}${prefix}"
-export OPENCV_PREFIX
+export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
 
 ARM_INSTRUCTION_SET = "arm"
 
-FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/${LIBV}/opencv*"
+FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
 FILES_${PN}-freeverb += "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"
+FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/${LIBV}/opencv*"
 FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
-FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 284e1f2..c1c322b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -1,9 +1,9 @@
 include gstreamer1.0-plugins-bad.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
-                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
+                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
+                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
 SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch"
 
@@ -11,4 +11,3 @@ SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
 SRC_URI[sha256sum] = "650855e39ff56a8bb6cb0c192109c5926ce12f536d06e19ebf829de71ef396fe"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 309505f..79c1777 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -3,24 +3,23 @@ DEFAULT_PREFERENCE = "-1"
 include gstreamer1.0-plugins-bad.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
-                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
-
-S = "${WORKDIR}/git"
+                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
+                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
 SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
 
+S = "${WORKDIR}/git"
+
 PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
 PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
 
 EXTRA_OECONF += " \
     -disable-openjpeg \
-    "
+"
 
 do_configure_prepend() {
 	cd ${S}
 	./autogen.sh --noconfigure
 	cd ${B}
 }
-
-- 
1.9.1


