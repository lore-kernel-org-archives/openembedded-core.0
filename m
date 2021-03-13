Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.2539.1615661449870919237
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xc6mXMYf;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id u62so14608033oib.6
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o7bNplQ2wMRnieNC4pRvyG8+2o0GFeLBY3q6AgMdpL4=;
        b=xc6mXMYfLht489NIsM0KzJYDC6k9cDTXSdtFiIdHkevwyy2lUqgclvlpqcWPcVRiw3
         FY2gSVDIh+ulxt/ZKQ+/WZvMs5dnxkz5tvWhLoUtEla2SA7qTx0LCifBFvJp6hcK6e9i
         M9yBoQRts48TB0MQ387xZ1ucagCOMPRiwhKL2ezRYUIcg0JhBk0TaKRYNm+q6gjiec42
         6T8z1jbm+AVoR1lVOCoee2wGNL9ohiSM4EN22eTkHNbD64ZSssM+iZVKBdq/RBvf42vV
         oB1ylrrU3ekG2/Z6l5VIUjby00tuY6QrG0lvBQLroaaE8P82Y91o3789qgdXq7k7hA36
         rpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o7bNplQ2wMRnieNC4pRvyG8+2o0GFeLBY3q6AgMdpL4=;
        b=A9VVDEn0C+/d4gxIIairSr4649F53o47Z51S36FekHuNj9MDgCqJtD/YcwC4XJzIoI
         yESupBWxGfTaMpC6KnW5SOMh+V8gqucd23xb5TA/Ac6HqVC+GLzxOeHdA/qQX4iY41wv
         iHdS3k+Lt0ngEYG3pPTQxUGx4r98shn6ceIcqLroXzbsdaBo5ksGYvSo2iMfC6RCx6px
         b5JmMzJUigel43eBXjiaUEvMstZQW3wFeoxj8eWwfGQekFkH96mc7IscJSPc+BnovBSc
         AQLqtRlKwqFKW7zUAmopkUq2o4W+h6U0HH5YPowsoXRZ6u08bO5Sg5dT38qzSL2jieWp
         U0xw==
X-Gm-Message-State: AOAM533Us7QiEI+cIHuuy9QTr1CJI/xY1/SwnZhoOE3RvmAW16+CKl6E
	OrLG6ff1l0zSsvrTTodQnDnnYVNB7NpiHB4r
X-Google-Smtp-Source: ABdhPJx3aTxDgSHvlXtZoSKfYMk9r6q7AzoknW/xqDdzsnHZsCEoDgBcyCS0ooqX9hU3zDYsx0vhfQ==
X-Received: by 2002:aca:3286:: with SMTP id y128mr13070088oiy.145.1615661448405;
        Sat, 13 Mar 2021 10:50:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:47 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/38] recipes-multimedia: Add missing HOMEPAGE and DESCRIPTION for recipes.
Date: Sat, 13 Mar 2021 08:49:00 -1000
Message-Id: <70d05a262924979403d5c70ba8dc5a5f65dfcac3.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meh Mbeh Ida Delphine <idadelm@gmail.com>

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 312994268bb68a012a61c99e1c3697e8de60a2ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb            | 2 ++
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb          | 3 +++
 meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb            | 3 +++
 meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb    | 3 +++
 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb       | 3 +++
 meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb            | 2 ++
 meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb    | 3 +++
 .../gstreamer/gstreamer1.0-libav_1.16.3.bb                  | 2 ++
 .../recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb | 1 +
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb            | 4 ++++
 .../gstreamer/gstreamer1.0-plugins-base_1.16.3.bb           | 3 +++
 .../gstreamer/gstreamer1.0-plugins-good_1.16.3.bb           | 4 ++++
 .../gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb           | 4 ++++
 .../gstreamer/gstreamer1.0-python_1.16.3.bb                 | 2 ++
 meta/recipes-multimedia/lame/lame_3.100.bb                  | 3 ++-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb              | 3 +++
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb             | 3 +++
 .../libsamplerate/libsamplerate0_0.1.9.bb                   | 1 +
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb    | 3 +++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb               | 4 ++++
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb          | 6 +++++-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc           | 2 ++
 22 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
index e2bc61fbe9..4867c798b9 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
@@ -1,4 +1,6 @@
 SUMMARY = "ALSA sound library"
+DESCRIPTION = "(Occasionally a.k.a. libasound) is a userspace library that \
+provides a level of abstraction over the /dev interfaces provided by the kernel modules."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
index 61d394b0f0..659eea672f 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
@@ -1,4 +1,7 @@
 SUMMARY = "ALSA Plugins"
+DESCRIPTION = "Used to create virtual devices that can be used like normal \
+hardware devices but cause extra processing of the sound stream to take place. \
+They are used while configuring ALSA in the .asoundrc file."
 HOMEPAGE = "http://alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "multimedia"
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
index c1f4acdb03..c979d7642e 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Advanced tools for certain ALSA sound card drivers"
+DESCRIPTION = "Package containing a number of tools ranging from envy24control \
+which provides complete control over all devices with an envy24 chip, to \
+firmware loaders for pcmcia, USB and the hdsp devices."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
index 5101cc7b7a..2ff5494c99 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
@@ -1,4 +1,7 @@
 SUMMARY = "ALSA topology configuration files"
+DESCRIPTION = "Provides a method for audio drivers to load their mixers, \
+routing, PCMs and capabilities from user space at runtime without changing \
+any driver source code."
 HOMEPAGE = "https://alsa-project.org"
 BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
index a432d5de07..ee1688b421 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
@@ -1,4 +1,7 @@
 SUMMARY = "ALSA Use Case Manager configuration"
+DESCRIPTION = "This package contains ALSA Use Case Manager configuration \
+of audio input/output names and routing for specific audio hardware. \
+They can be used with the alsaucm tool. "
 HOMEPAGE = "https://alsa-project.org"
 BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
index 1dc30f377b..54aa2f9544 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
@@ -1,4 +1,6 @@
 SUMMARY = "ALSA sound utilities"
+DESCRIPTION = "collection of small and often extremely powerful applications \
+designed to allow users to control the various parts of the ALSA system."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
index cc7a7e78e2..af79a6f952 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
@@ -1,4 +1,7 @@
 SUMMARY = "GStreamer examples (including gtk-play, gst-play)"
+DESCRIPTION = "GStreamer example applications"
+HOMEPAGE = "https://gitlab.freedesktop.org/gstreamer/gst-examples"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-examples/-/issues"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
index 98355a1b75..a8ad777422 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Libav-based GStreamer 1.x plugin"
+DESCRIPTION = "Contains a GStreamer plugin for using the encoders, decoders, \
+muxers, and demuxers provided by FFmpeg."
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
index 1aa13cf73c..46653e2392 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
@@ -1,4 +1,5 @@
 SUMMARY = "OpenMAX IL plugins for GStreamer"
+DESCRIPTION = "Wraps available OpenMAX IL components and makes them available as standard GStreamer elements."
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
index ffbaaf425a..f741db2172 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
@@ -1,5 +1,9 @@
 require gstreamer1.0-plugins-common.inc
 
+DESCRIPTION = "'Bad' GStreamer plugins and helper libraries "
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues"
+
 SRC_URI = " \
     https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
     file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
index 9daaf7587e..f8f5caa94a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
@@ -1,5 +1,8 @@
 require gstreamer1.0-plugins-common.inc
 
+DESCRIPTION = "'Base' GStreamer plugins and helper libraries"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
index 75dd029109..168bff4137 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
@@ -1,5 +1,9 @@
 require gstreamer1.0-plugins-common.inc
 
+DESCRIPTION = "'Good' GStreamer plugins"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues"
+
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
             file://0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
index d9ec82d887..afde9a013d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
@@ -1,5 +1,9 @@
 require gstreamer1.0-plugins-common.inc
 
+DESCRIPTION = "'Ugly GStreamer plugins"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
index 14b34a2808..9c7f0e078c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
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
index 8c53d11642..3c46fa3302 100644
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 1f92c18513..5a1cb13c53 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
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
index 417eb1d9d3..317983edb2 100644
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

