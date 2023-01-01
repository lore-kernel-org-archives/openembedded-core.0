Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04046C3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.16446.1672594689110446248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZumtHAsn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id k19so9734685pfg.11
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5OA5eiyH43jI2df+VhKCUBhIGWK/8r+fFacILfEwL0=;
        b=ZumtHAsn+5Fv/EDswGvzJGzKrEDGU6C9kv5RJcoh7E9Qv34stpstGaXF453yEceo06
         c5Pf3PK091xw5JrduEjP3JcdBgotITyD1+qlQqXKp6MoV766521op8uV3ocuojjG+NAS
         AHivxvmrK4FUw6JOCBf71yu3DKvf1eRZuabTfYMNmkn7Yts79hOW3+1/0jZZqGDVwfOE
         kpfu2dd44yOvX5W+w0oHAY2kQpjjUKn1BnAUdyyGooQpnYRfOGvM6GfkJ/slF7JTuREV
         Z3sNMR6e8OUMfkY7Rxg7vUktSZj0yjWz1c8x304BD4yIWJFYc+UKrsvziH5lyCD6rTBe
         C/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5OA5eiyH43jI2df+VhKCUBhIGWK/8r+fFacILfEwL0=;
        b=BWMUp/b6EFS8Kr3/hBxlWHxnDNAjyAbtkyykqCWiWUsM7uw7rnzDxxI0aeO92tMn/S
         Fk388XjEY48ZYduayLkNkp0vjTE3c4qB/KU/vv/TdPKlUEjZlIyePqNsR4a7ZDi9Hf6J
         a3BaLC2JRw9XwVWjcoght0PDEh7EA2gW3v2L4ZLnEBjhRuOfaDrC0aOc/tk09f+4CIPn
         aXRnGAWVVPncMS1hxeCUnP+xGZSs9brncdonBo3ywNR3YEX+YYAckSZ6m2Dw7JDLZRD6
         XPwog1sFsos5AnFVMweSTyT+cpP5VBc8Wc3wVyrdHUSVZ8KcOVbkQOIiZUNVIKDAMRr4
         +AYg==
X-Gm-Message-State: AFqh2kr90CXSEq6u9uGdKGXEWmHHQGfo2m73eATmXni37Zy8bIvJIe1Z
	bsomrYEd8onbgmfS01u0UBt7/USwqj3PbxpboCo=
X-Google-Smtp-Source: AMrXdXtVh+1zIHGNlbeH0QoT3wdKqtFy3FyLE0nMOoQmfnxac/abGwDdrNkLDyXGdi1yJIOOXnWSuw==
X-Received: by 2002:a62:1c52:0:b0:581:f654:a37d with SMTP id c79-20020a621c52000000b00581f654a37dmr9753460pfc.17.1672594712960;
        Sun, 01 Jan 2023 09:38:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/29] gstreamer1.0: upgrade 1.20.4 -> 1.20.5
Date: Sun,  1 Jan 2023 07:37:40 -1000
Message-Id: <e3311c81f3f3c495b824cc6e4aeac1dad8d8bb00.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175206

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
systemclock waiting fixes for certain 32-bit platforms/libcs
alphacombine: robustness improvements for corner case scenarios
avfvideosrc: Report latency when doing screen capture
d3d11videosink: various thread-safety and stability fixes
decklink: fix performance issue when HDMI signal has been lost for a long time
flacparse: Fix handling of headers advertising 32 bits per sample
mpegts: Handle when iconv doesn't support ISO 6937 (e.g. musl libc)
opengl: fix automatic dispmanx detection for rpi4 and fix usage of eglCreate/DestroyImage
opusdec: Various channel-related fixes
textrender: event handling fixes, esp. for GAP event
subparse: Fix non-closed tag handling
videoscale: fix handling of unknown buffer metas
videosink: reverse playback handling fixes
qtmux: Prefill mode fixes, especially for raw audio
multiudpsink: allow binding to IPv6 address
rtspsrc: Fix usage of IPv6 connections in SETUP
rtspsrc: Only EOS on timeout if all streams are timed out/EOS
splitmuxsrc: fix playback stall if there are unlinked pads
v4l2: Fix SIGSEGV on state change during format changes
wavparse robustness fixes
Fix static linking on macOS (opengl, vulkan)
gstreamer-vaapi: fix headless build against mesa >= 22.3.0
GStreamer Editing Services library: Fix build with tools disabled
webrtc example/demo fixes
unit test fixes for aesdec and rtpjitterbuffer
Cerbero: Fix ios cross-compile with cmake on M1; some recipe updates and other build fixes
Binary packages: pkg-config file fixes for various recipes (ffmpeg, taglib, gstreamer)
Binary packages: Enable high bitdepth support for libvpx (VP8/VP9 encoding/decoding)
Binary packages: ship aes plugin
Miscellaneous bug fixes, memory leak fixes, and other stability and reliability improvements
Performance improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fd8ab6052d88120c58cf84ad7d77d60c12ef3b8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.20.4.bb => gst-devtools_1.20.5.bb}          | 2 +-
 ...streamer1.0-libav_1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} | 2 +-
 .../{gstreamer1.0-omx_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb}  | 2 +-
 ...plugins-bad_1.20.4.bb => gstreamer1.0-plugins-bad_1.20.5.bb} | 2 +-
 ...ugins-base_1.20.4.bb => gstreamer1.0-plugins-base_1.20.5.bb} | 2 +-
 ...ugins-good_1.20.4.bb => gstreamer1.0-plugins-good_1.20.5.bb} | 2 +-
 ...ugins-ugly_1.20.4.bb => gstreamer1.0-plugins-ugly_1.20.5.bb} | 2 +-
 ...reamer1.0-python_1.20.4.bb => gstreamer1.0-python_1.20.5.bb} | 2 +-
 ...rtsp-server_1.20.4.bb => gstreamer1.0-rtsp-server_1.20.5.bb} | 2 +-
 ...streamer1.0-vaapi_1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} | 2 +-
 .../{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.4.bb => gst-devtools_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.4.bb => gstreamer1.0-plugins-bad_1.20.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.4.bb => gstreamer1.0-plugins-base_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.4.bb => gstreamer1.0-plugins-good_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.4.bb => gstreamer1.0-plugins-ugly_1.20.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.4.bb => gstreamer1.0-python_1.20.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.4.bb => gstreamer1.0-rtsp-server_1.20.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
index 09b6e5a497..9db31c18e4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "82a293600273f4dd3eed567aae510ca0c7d629c3807788b00e6cdbd1d2459a84"
+SRC_URI[sha256sum] = "5684436121b8bae07fd00b74395f95e44b5f26323dce4fa045fa665676807bba"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
index e23cf2e337..e5925c6510 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "04ccbdd58fb31dd94098da599209834a0e7661638c5703381dd0a862c56fc532"
+SRC_URI[sha256sum] = "b152e3cc49d014899f53c39d8a6224a44e1399b4cf76aa5f9a903fdf9793c3cc"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
index 4d63db89a7..ec5efcd408 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "70ddd485e2dcab79070164d61ad2ff3a63e15a1d7abf9075d86eb77762b0edfd"
+SRC_URI[sha256sum] = "bcccbc02548cdc123fd49944dd44a4f1adc5d107e36f010d320eb526e2107806"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
index c83beb6632..80766b9166 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "a1a3f53b3604d9a04fdd0bf9a1a616c3d2dab5320489e9ecee1178e81e33a16a"
+SRC_URI[sha256sum] = "f431214b0754d7037adcde93c3195106196588973e5b32dcb24938805f866363"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
index a0f238a59d..c37b542c57 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "8d181b7abe4caf23ee9f9ec5b4d3e232640452464e39495bfffb6d776fc97225"
+SRC_URI[sha256sum] = "11f911ef65f3095d7cf698a1ad1fc5242ac3ad6c9270465fb5c9e7f4f9c19b35"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
index 4a4672992e..80aed01973 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "b16130fbe632fa8547c2147a0ef575b0140fb521065c5cb121c72ddbd23b64da"
+SRC_URI[sha256sum] = "e83ab4d12ca24959489bbb0ec4fac9b90e32f741d49cda357cb554b2cb8b97f9"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
index 94b8c8e2cf..f765e626c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "5c9ec6bab96517e438b3f9bae0ceb84d3436f3da9bbe180cf4d28e32a7251b59"
+SRC_URI[sha256sum] = "af67d8ba7cab230f64d0594352112c2c443e2aa36a87c35f9f98a43d11430b87"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
index b514989864..05e9ace276 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5eb4136d03e2a495f4499c8b2e6d9d3e7b5e73c5a8b8acf9213d57bc6a7bd3c1"
+SRC_URI[sha256sum] = "27487652318659cfd7dc42784b713c78d29cc7a7df4fb397134c8c125f65e3b2"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
index 4137b4993b..c9cf42903d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "88d9ef634e59aeb8cc183ad5ae444557c5a88dd49d833b9072bc6e1fae6a3d7d"
+SRC_URI[sha256sum] = "ba398a7ddd559cce56ef4b91f448d174e0dccad98a493563d2d59c41a2ef39c5"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
index 81ec23d26e..716f50ebe1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a"
+SRC_URI[sha256sum] = "510c6fb4ff3f676d7946ce1800e04ccf5aabe5a586d4e164d1961808fab8c94b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
index d0ba2919ee..bb4dba3861 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae970e2491c5c4c055ef5f"
+SRC_URI[sha256sum] = "5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.25.1


