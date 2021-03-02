Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6379.1614679671474381221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 02:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pO8ZI4AY;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: idadelm@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id l22so1721011wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 02:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r97AQvqFaHu5fD2jTTZTKDX/hevFUln9/PZlqEIz5yU=;
        b=pO8ZI4AYeFjc6/3D7XMDoMZH6KjnzE0fz9qTw0AVrU2oWxODxxB+cpoxa8KkT3ZiLx
         o6Zhe/5XKo9MGXYGQGicXnYb7mv38JKGSnuGz5LDKotRhh6H9aBZSk4tEfv2CoeHIRPN
         dev77pdmqBrNNY7LLWok+sBGBjjIYsTpflZhdtwG3jja0QciglmeNWNkg69gK369wPnG
         dHNBFDYRIkkwYWDrMeWXexV9FqupNmdFpIrm4cqHT8xAWuzud4tBD7iis1Q9mTLj2erp
         aovN0pqSEPwseL2+/U5EaI4o1RlgfoKTnczc9XiGDeNH3GslgM55htU7LBeannUI3MFb
         kv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r97AQvqFaHu5fD2jTTZTKDX/hevFUln9/PZlqEIz5yU=;
        b=q+GTnaHKFkGSMOFFDKYcklvRkKd+5YOG7mY2pwhcNdxukv9lil+oIVxnhfgc67uN6w
         BhqcLWjKClAlgQ9+JgN6JSvauHskx+Xdy8AZRepEJMViH2na3LOZ6j/Vf5xhLRInL07L
         5S1fuZoNE45Z7xEl7XTn75dlH1R3qM6EL+J346z/N787yZWc5tCk3tp9EJZxE42T1Gs8
         gzv6GFzcpKTS/3Y+3wSuFfCEJ721jBICvujqNroAeMocEi4/7WCoihpmyHMwqAUja9r/
         8hKsDJzJVAHeYhp9hyZb6MhtLCSPSvVn8dXhPPFfBFK0VYB/jVMow4S2ZQJBvM2Lm4qn
         V6cQ==
X-Gm-Message-State: AOAM5301a123538UdvlT/t46KFBCy6K+C6wZzfgQ+YRU5UFdmX+skKRC
	dzxKp8o56bLKnE2SgiNJZ1WmEDmKD+5Thg==
X-Google-Smtp-Source: ABdhPJyg7UitI2Qp8oMNy+JsCefJCnL9j7HSl3Orx2deyVp9Ke2j9FibltMVkpFACtXKlDb3epvS2g==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr3197995wma.37.1614679668847;
        Tue, 02 Mar 2021 02:07:48 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([154.72.153.141])
        by smtp.gmail.com with ESMTPSA id m11sm15369568wrz.40.2021.03.02.02.07.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:07:48 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] recipes-multimedia: Add missing HOMEPAGE and DESCRIPTION for recipes.
Date: Tue,  2 Mar 2021 11:07:31 +0100
Message-Id: <20210302100734.114315-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb              | 2 ++
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb          | 3 +++
 meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb            | 3 +++
 meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb    | 3 +++
 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb         | 3 +++
 meta/recipes-multimedia/alsa/alsa-utils.inc                 | 2 ++
 meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb    | 3 +++
 .../gstreamer/gstreamer1.0-libav_1.18.3.bb                  | 2 ++
 .../recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb | 2 ++
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb            | 4 ++++
 .../gstreamer/gstreamer1.0-plugins-base_1.18.3.bb           | 3 +++
 .../gstreamer/gstreamer1.0-plugins-good_1.18.3.bb           | 4 ++++
 .../gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb           | 4 ++++
 .../gstreamer/gstreamer1.0-python_1.18.3.bb                 | 2 ++
 meta/recipes-multimedia/lame/lame_3.100.bb                  | 3 ++-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb              | 3 +++
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb             | 3 +++
 .../libsamplerate/libsamplerate0_0.1.9.bb                   | 1 +
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb    | 3 +++
 meta/recipes-multimedia/libtiff/tiff_4.2.0.bb               | 4 ++++
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb          | 6 +++++-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc           | 2 ++
 22 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb
index f38e8b94ff..c49cc2a9b4 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb
@@ -1,4 +1,6 @@
 SUMMARY = "ALSA sound library"
+DESCRIPTION = "(Occasionally a.k.a. libasound) is a userspace library that \
+provides a level of abstraction over the /dev interfaces provided by the kernel modules."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
index e8402a6fcb..1381896f38 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
@@ -1,4 +1,7 @@
 SUMMARY = "ALSA Plugins"
+DESCRIPTION = "Used to create virtual devices that can be used like normal \
+hardware devices but cause extra processing of the sound stream to take place. \
+They are used while configuring ALSA in the .asoundrc file."
 HOMEPAGE = "http://alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "multimedia"
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
index 0838be8798..0a25d809b0 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.2.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Advanced tools for certain ALSA sound card drivers"
+DESCRIPTION = "Package containing a number of tools ranging from envy24control \
+which provides complete control over all devices with an envy24 chip, to \
+firmware loaders for pcmcia, USB and the hdsp devices."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
index aac4b48948..26542fbbbc 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
@@ -1,4 +1,7 @@
 SUMMARY = "ALSA topology configuration files"
+DESCRIPTION = "Provides a method for audio drivers to load their mixers, \
+routing, PCMs and capabilities from user space at runtime without changing \
+any driver source code."
 HOMEPAGE = "https://alsa-project.org"
 BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
index da41c3db75..32cf41c8fd 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
@@ -1,4 +1,7 @@
 SUMMARY = "ALSA Use Case Manager configuration"
+DESCRIPTION = "This package contains ALSA Use Case Manager configuration \
+of audio input/output names and routing for specific audio hardware. \
+They can be used with the alsaucm tool. "
 HOMEPAGE = "https://alsa-project.org"
 BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index c001b29a0c..f2e8133d2c 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -1,4 +1,6 @@
 SUMMARY = "ALSA sound utilities"
+DESCRIPTION = "collection of small and often extremely powerful applications \
+designed to allow users to control the various parts of the ALSA system."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
index 35a8928f51..b49201fb0e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
@@ -1,4 +1,7 @@
 SUMMARY = "GStreamer examples (including gtk-play, gst-play)"
+DESCRIPTION = "GStreamer example applications"
+HOMEPAGE = "https://gitlab.freedesktop.org/gstreamer/gst-examples"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-examples/-/issues"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
index 8fa93253ac..baf87fd871 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Libav-based GStreamer 1.x plugin"
+DESCRIPTION = "Contains a GStreamer plugin for using the encoders, decoders, \
+muxers, and demuxers provided by FFmpeg."
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
index 797ed60722..36bb5b5dd7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
@@ -1,4 +1,6 @@
 SUMMARY = "OpenMAX IL plugins for GStreamer"
+DESCRIPTION = "Wraps available OpenMAX IL components and makes
+ them available as standard GStreamer elements."
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb
index bbb7427b07..b1e3664cbf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb
@@ -1,5 +1,9 @@
 require gstreamer1.0-plugins-common.inc
 
+DESCRIPTION = "'Bad' GStreamer plugins and helper libraries "
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues"
+
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
index 84602246c9..86b0f2790e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
@@ -1,5 +1,8 @@
 require gstreamer1.0-plugins-common.inc
 
+DESCRIPTION = "'Base' GStreamer plugins and helper libraries"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb
index 7643e9e601..93c6616c33 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb
@@ -1,5 +1,9 @@
 require gstreamer1.0-plugins-common.inc
 
+DESCRIPTION = "'Good' GStreamer plugins"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues"
+
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb
index fe737a9984..876a9268a2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb
@@ -1,5 +1,9 @@
 require gstreamer1.0-plugins-common.inc
 
+DESCRIPTION = "'Ugly GStreamer plugins"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
index de78fe8445..90b6fc38df 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Python bindings for GStreamer 1.0"
+DESCRIPTION = "GStreamer Python binding overrides (complementing the bindings \
+provided by python-gi) "
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
 SECTION = "multimedia"
 
diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
index 7f8996fb52..d007e0a495 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -1,5 +1,6 @@
 SUMMARY = "High quality MP3 audio encoder"
-HOMEPAGE = "http://lame.sourceforge.net/"
+DESCRIPTION = "LAME is an educational tool to be used for learning about MP3 encoding."
+HOMEPAGE = "https://lame.sourceforge.io/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=290&atid=100290"
 SECTION = "console/utils"
 LICENSE = "LGPLv2+"
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 8ff8889b60..0ef5d947c3 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -1,4 +1,7 @@
 SUMMARY = "ATSC A/52 surround sound stream decoder"
+DESCRIPTION = "Library for decoding ATSC A/52 streams. The A/52 standard \
+is used in a variety of applications, including digital television \
+and DVD. It is also known as AC-3."
 HOMEPAGE = "http://liba52.sourceforge.net/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index edb2ac6146..0b0af756f6 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -1,4 +1,7 @@
 SUMMARY = "PNG image format decoding library"
+DESCRIPTION = "An open source project to develop and maintain the reference \
+library for use in applications that read, create, and manipulate PNG \
+(Portable Network Graphics) raster image files. "
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
index ae08189441..6dfc42b436 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Audio Sample Rate Conversion library"
+DESCRIPTION = "Also known as Secret Rabbit Code - a library for performing sample rate conversion of audio data."
 HOMEPAGE = "http://www.mega-nerd.com/SRC/"
 SECTION = "libs"
 LICENSE = "BSD-2-Clause"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index b100108766..044881a859 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Audio format Conversion library"
+DESCRIPTION = "Library for reading and writing files containing sampled \
+sound (such as MS Windows WAV and the Apple/SGI AIFF format) through \
+one standard library interface."
 HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
 AUTHOR = "Erik de Castro Lopo"
 DEPENDS = "flac libogg libvorbis"
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
index 43eb60b33c..ea8580a25e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Provides support for the Tag Image File Format (TIFF)"
+DESCRIPTION = "Library provides support for the Tag Image File Format \
+(TIFF), a widely used format for storing image data.  This library \
+provide means to easily access and create TIFF image files."
+HOMEPAGE = "http://www.libtiff.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
index 00ca3675ca..d603602584 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
@@ -1,5 +1,9 @@
 SUMMARY = "Library and test program for decoding MPEG-2 and MPEG-1 video streams"
-HOMEPAGE = "http://libmpeg2.sourceforge.net/"
+DESCRIPTION = "mpeg2dec is a test program for libmpeg2. It decodes \
+mpeg-1 and mpeg-2 video streams, and also includes a demultiplexer \
+for mpeg-1 and mpeg-2 program streams. The main purpose of mpeg2dec \
+is to have a simple test bed for libmpeg2."
+HOMEPAGE = "https://libmpeg2.sourceforge.io/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LICENSE_FLAGS = "commercial"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index e40b8c1c40..005cb36b8e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -1,4 +1,6 @@
 SUMMARY = "Sound server for Linux and Unix-like operating systems"
+DESCRIPTION = "A general purpose sound server intended to run as a middleware \
+between your applications and your hardware devices, either using ALSA or OSS."
 HOMEPAGE = "http://www.pulseaudio.org"
 AUTHOR = "Lennart Poettering"
 SECTION = "libs/multimedia"
-- 
2.25.1

