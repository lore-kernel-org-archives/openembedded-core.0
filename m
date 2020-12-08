Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.9731.1607439967859185302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UW0R1Z3l;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id r3so16574073wrt.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYmwmDdw3rwwFYmHNkoq3AjB7L//y1bIkA1PbkzBOFQ=;
        b=UW0R1Z3lt4tjTJmv4Ia3A7URcSMMq53omgM8gwzNHP2pOVU3HyhEn00qwimfQhbwXQ
         AVvCxk62qlceKBP813h7yduFzVRrS9/XOFlTezzFRzNB89Xunqvda4BSZmZscm0CMSi7
         dWxTSvtJGwozbQLBlihbwMKjtZBAJ9qYXCmgEF3HGWbxyw388M8nhfFgGKV87Vz/Cj4G
         eH9uixdVuEul7Y6gFeNYBOTxbyU2L0i9rXrvh0zWfE4rBlTO3XsqRpWo/ooHjTyYDYvB
         bp2nHsBtic/Ng90xzjYnMCJrIHK7ALiWQK8DdMFD0zLM8nXbmX9g+ribfmo63kPSb/WI
         0TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYmwmDdw3rwwFYmHNkoq3AjB7L//y1bIkA1PbkzBOFQ=;
        b=U6ZTjgY1y87aRvCJ7Zv/urwr8mVnkJA2G8d78BA0s5Sb+cz+tUGrrbQ3YZB0ioafzj
         qgx3Vm/cS27/kX1/QDL6plLWM7W+xS1+5R48bIJ673WIvymWsgjz2AoAjNuT6sj44XlI
         jiLbor5gufn2oNHnf66e5KbmwtIg3DiV6oxOBWN39xSjEyRdCsSuZsv1Z0S+j9S60XNN
         QfGIGHtu5UsUio9ku5BIgbwqpqrVyJKwvicI5DIrSk28U7OOb9HjJmGKO2WQsnUWhm/9
         GwaIzcP0/cIXKgcZtZu/joUMs5w13SHgHFgPBVaeIhAoaGjeBLMetenCsGbVuTSUWExW
         /64A==
X-Gm-Message-State: AOAM533LO+buMsuLZYOp0ujeiczHz+j4HFba4gN6pR3oraa9QeBDr7NE
	pkE+bPn5Ooe4iB0sq/hQ6rJjwcBoP1s=
X-Google-Smtp-Source: ABdhPJyF6hX+58lIzlDbL3gLAi7/P2J9Tm9XGhPRNT9JCzchXVEVtnNnFH46LnpCbI1Plz0qV/Uehw==
X-Received: by 2002:adf:ebc5:: with SMTP id v5mr25284014wrn.392.1607439965378;
        Tue, 08 Dec 2020 07:06:05 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h5sm10322086wrp.56.2020.12.08.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:06:04 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] gstreamer1.0: upgrade 1.18.1 -> 1.18.2
Date: Tue,  8 Dec 2020 15:05:42 +0000
Message-Id: <20201208150542.744326-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patches as it as merged upstream:

    * gstreamer1.0: 0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
    * gstreamer1.0-plugins-good: 0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch

Update pacthes:
    * gstreamer1.0: 0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...tools_1.18.1.bb => gst-devtools_1.18.2.bb} |  2 +-
 ...mples_1.18.1.bb => gst-examples_1.18.2.bb} |  2 +-
 ...1.18.1.bb => gstreamer1.0-libav_1.18.2.bb} |  2 +-
 ...x_1.18.1.bb => gstreamer1.0-omx_1.18.2.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.18.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.18.2.bb} |  2 +-
 ...hostif-library-as-it-is-required-to-.patch | 32 ------------
 ...bb => gstreamer1.0-plugins-good_1.18.2.bb} |  3 +-
 ...bb => gstreamer1.0-plugins-ugly_1.18.2.bb} |  2 +-
 ....18.1.bb => gstreamer1.0-python_1.18.2.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.18.2.bb} |  2 +-
 ...1.18.1.bb => gstreamer1.0-vaapi_1.18.2.bb} |  2 +-
 ...der.c-when-env-var-is-set-do-not-fal.patch | 51 +++++++++++++++----
 ...crese-padding-in-struct-_GstClockEnt.patch | 34 -------------
 ...002-Remove-unused-valgrind-detection.patch | 18 +++----
 ...meson-Add-option-for-installed-tests.patch | 16 +++---
 ...er1.0_1.18.1.bb => gstreamer1.0_1.18.2.bb} |  3 +-
 17 files changed, 69 insertions(+), 108 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.1.bb => gst-devtools_1.18.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.1.bb => gst-examples_1.18.2.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.1.bb => gstreamer1.0-libav_1.18.2.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.1.bb => gstreamer1.0-omx_1.18.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.1.bb => gstreamer1.0-plugins-bad_1.18.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.1.bb => gstreamer1.0-plugins-base_1.18.2.bb} (97%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.1.bb => gstreamer1.0-plugins-good_1.18.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.1.bb => gstreamer1.0-plugins-ugly_1.18.2.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.1.bb => gstreamer1.0-python_1.18.2.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.1.bb => gstreamer1.0-rtsp-server_1.18.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.1.bb => gstreamer1.0-vaapi_1.18.2.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.1.bb => gstreamer1.0_1.18.2.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb
index 2e09ef9c25..9fd9e0be93 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "712212babd2238233d55beecfc0fe1ea8db18e8807ac6ab05a64505b2c7ab0df"
+SRC_URI[sha256sum] = "6ea73d718bf1f9692218540ff88479c51d67c0b477fa56d6812fc7b739d30a56"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
index 048b45a08f..54a4b5df15 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "998ee69af18a5928759dbe17fffbceebbc8d72d0"
+SRCREV = "45086d8ef2d75244d9d5c8f69c0f0e1dfd4200b3"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb
index 38bbffafa4..b638814aa4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "39a717bc2613efbbba19df3cf5cacff0987471fc8281ba2c5dcdeaded79c2ed8"
+SRC_URI[sha256sum] = "36969ad44c5f0756a8a90215410710d6c39713d58f6cee13d663be9774557f49"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
index 513d66f9fc..686fcc2655 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "42a8e0f9518b94655981ede441638f9f9395f4b1b9a4b329f068ee793975a965"
+SRC_URI[sha256sum] = "4c05d64544eecf4aaf5b337789916c67ed720317dfb2c8c8c335720fcc5c7cf4"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index ebd8c5a27d..f70437ccd3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -6,7 +6,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "c195978c85d97406c05eb9d43ac54b9ab35eda6ffdae32b3ed597b8f1743c1b2"
+SRC_URI[sha256sum] = "8ad5822f1118fe46a19af54422b74e3a16d79a6800dcb173b49e199a496b341a"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
index 1b2bd4fe14..531d577b0c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "1ba654d7de30f7284b4c7071b32f881b609733ce02ab6d9d9ea29386a036c641"
+SRC_URI[sha256sum] = "dd04fb1f7826e2f6d9b4d66fc22f19cc6a47c301e13041f0ee3d7f65c89b05ac"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
deleted file mode 100644
index 685ee08e50..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3ec4fe5507a39383b161f1ab7687acb4a57c32f8 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sun, 15 Nov 2020 11:30:07 +0000
-Subject: [PATCH] rpicamsrc: add vchostif library as it is required to build
- successful
-
-fix: undefined reference to `vc_gencmd'
-/usr/src/debug/gstreamer1.0-plugins-good/1.18.1-r0/build/../gst-plugins-good-1.18.1/sys/rpicamsrc/RaspiCamControl.c:1440: undefined reference to `vc_gencmd'
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/818]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- sys/rpicamsrc/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sys/rpicamsrc/meson.build b/sys/rpicamsrc/meson.build
-index dc18a8345..48b2ceb66 100644
---- a/sys/rpicamsrc/meson.build
-+++ b/sys/rpicamsrc/meson.build
-@@ -34,7 +34,7 @@ if not cc.has_header('bcm_host.h', args: rpi_inc_args)
- endif
- 
- mmal_deps = []
--foreach rpi_lib : ['mmal_core', 'mmal_util', 'mmal_vc_client', 'vcos', 'bcm_host']
-+foreach rpi_lib : ['mmal_core', 'mmal_util', 'mmal_vc_client', 'vcos', 'vchostif', 'bcm_host']
-   l = cc.find_library(rpi_lib, dirs: rpi_lib_path, required: false)
-   if not l.found()
-     if get_option('rpicamsrc').enabled()
--- 
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb
index 77e1333ddc..2e076bf884 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb
@@ -2,10 +2,9 @@ require gstreamer1.0-plugins-common.inc
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
-           file://0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch \
            "
 
-SRC_URI[sha256sum] = "e210e91a5590ecb6accc9d06c949a58ca6897d8edb3b3d55828e424c624f626c"
+SRC_URI[sha256sum] = "f71752dde434d9ec55fa5e8d2e2a3be3fc6eb5b34f397b065f84aead25b449a4"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb
index 614ef8d740..e482aa10b2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "18cd6cb829eb9611ca63cbcbf46aca0f0de1dd28b2df18caa2834326a75ff725"
+SRC_URI[sha256sum] = "a337a022ed472209b38cab5918dc2f4e7a6adc1f4afacd226a6345e5cb668bdb"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
index c0c5d271d0..5711744b4d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "42b289422f7ab32757670848cf2245c5a8a8b08a665a9cab65ded8d69364f6f6"
+SRC_URI[sha256sum] = "e19d0f760b353e88161b3712193cffbd79bf1314418da792b5fec4d8ecef389c"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb
index 30534c9782..b680aa38d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "10a82865c3d199e66731017ca4b120bad071df9889e60cfe4dd6c49d953ef754"
+SRC_URI[sha256sum] = "973922aba65a1672a131527dee965fb09bab4bb996c351f0ee7f42f0d5b954e2"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
index acf5598a62..f237191d5f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "400d3c42810b50b4566df03f37319a6bdd758f969560c40147e7d9a3b0e8a6ea"
+SRC_URI[sha256sum] = "8c7b2c74fda095d83dea67accde6a68ba9f608d97ed969fdcf278930f9b1c7c0"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
index 17f8a0beb7..fe58e718a7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
@@ -1,27 +1,41 @@
-From f700975f514758a4a7582c2c972fa54ecfca3302 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 25 Jan 2018 17:55:02 +0200
-Subject: [PATCH 1/4] gst/gstpluginloader.c: when env var is set do not fall
- through to system plugin scanner
+From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sat, 10 Oct 2020 19:09:03 +0000
+Subject: [PATCH 1/3] gstpluginloader: when env var is set do not fall through
+ to system plugin scanner
 
 If we set a custom GST_PLUGIN_SCANNER env var, then we probably want to use that and only that.
 
 Falling through to the one installed on the system is problamatic in cross-compilation
 environemnts, regardless of whether one pointed to by the env var succeeded or failed.
 
-written by: Alexander Kanavin <alex.kanavin@gmail.com>
+taken from:
+http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch?id=0db7ba34ca41b107042306d13a6f0162885c123b
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669]
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
- gst/gstpluginloader.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
+ gst/gstpluginloader.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
 
 diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
-index d1e404d..2e00c3c 100644
+index d1e404d98..c626bf263 100644
 --- a/gst/gstpluginloader.c
 +++ b/gst/gstpluginloader.c
-@@ -475,9 +475,7 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
+@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
+   if (loader->child_running)
+     return TRUE;
+ 
+-  /* Find the gst-plugin-scanner: first try the env-var if it is set,
+-   * otherwise use the installed version */
++  /* Find the gst-plugin-scanner */
+   env = g_getenv ("GST_PLUGIN_SCANNER_1_0");
+   if (env == NULL)
+     env = g_getenv ("GST_PLUGIN_SCANNER");
+ 
+   if (env != NULL && *env != '\0') {
++    /* use the env-var if it is set */
+     GST_LOG ("Trying GST_PLUGIN_SCANNER env var: %s", env);
      helper_bin = g_strdup (env);
      res = gst_plugin_loader_try_helper (loader, helper_bin);
      g_free (helper_bin);
@@ -29,9 +43,24 @@ index d1e404d..2e00c3c 100644
 -
 -  if (!res) {
 +  } else {
++    /* use the installed version */
      GST_LOG ("Trying installed plugin scanner");
  
  #ifdef G_OS_WIN32
+@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
+ #endif
+     res = gst_plugin_loader_try_helper (loader, helper_bin);
+     g_free (helper_bin);
++  }
+ 
+-    if (!res) {
+-      GST_INFO ("No gst-plugin-scanner available, or not working");
+-    }
++  if (!res) {
++    GST_INFO ("No gst-plugin-scanner available, or not working");
+   }
+ 
+   return loader->child_running;
 -- 
-2.28.0
+2.29.2
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
deleted file mode 100644
index a2d215d72d..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4449246a8d788e71dfe4679fba95955cec5894c1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 3 Nov 2020 22:58:26 -0800
-Subject: [PATCH] gst_private.h: increse padding in struct _GstClockEntryImpl
-
-When compiling for 32bit architectures with 64bit time_t e.g. riscv32,
-the static assert that the GstClockEntryImpl smaller or
-equal to the struct _GstClockEntryImpl triggered.
-(they were 12bytes off).
-
-To fix this, the padding is increased by 8 bytes (on 32bit).
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/694]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gst/gst_private.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/gst_private.h b/gst/gst_private.h
-index a8897e1..8252ede 100644
---- a/gst/gst_private.h
-+++ b/gst/gst_private.h
-@@ -522,7 +522,7 @@ struct _GstClockEntryImpl
-   GstClockEntry entry;
-   GWeakRef clock;
-   GDestroyNotify destroy_entry;
--  gpointer padding[19];                 /* padding for allowing e.g. systemclock
-+  gpointer padding[21];                 /* padding for allowing e.g. systemclock
-                                          * to add data in lieu of overridable
-                                          * virtual functions on the clock */
- };
--- 
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
index c8bd58d471..96abef17b0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
@@ -1,7 +1,7 @@
-From 355dd938bfb2cd36d6c3c4ed59ba1dcafdc78d95 Mon Sep 17 00:00:00 2001
+From 598d108e2c438d8f2ecd3bf948fa3ebbd3681490 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
 Date: Fri, 14 Aug 2020 16:38:26 +0100
-Subject: [PATCH 2/4] Remove unused valgrind detection
+Subject: [PATCH 2/3] Remove unused valgrind detection
 
 Having this just to log a debug message in case we're
 running inside valgrind doesn't seem very useful, and
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  3 files changed, 42 deletions(-)
 
 diff --git a/gst/gst_private.h b/gst/gst_private.h
-index 1b0f02b..a8897e1 100644
+index eefd044d9..8252ede51 100644
 --- a/gst/gst_private.h
 +++ b/gst/gst_private.h
 @@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
@@ -32,10 +32,10 @@ index 1b0f02b..a8897e1 100644
  G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
  G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (void);
 diff --git a/gst/gstinfo.c b/gst/gstinfo.c
-index 37987d3..15f522e 100644
+index 5d317877b..097f8b20d 100644
 --- a/gst/gstinfo.c
 +++ b/gst/gstinfo.c
-@@ -304,36 +304,6 @@ static gboolean pretty_tags = PRETTY_TAGS_DEFAULT;
+@@ -305,36 +305,6 @@ static gboolean pretty_tags = PRETTY_TAGS_DEFAULT;
  static volatile gint G_GNUC_MAY_ALIAS __default_level = GST_LEVEL_DEFAULT;
  static volatile gint G_GNUC_MAY_ALIAS __use_color = GST_DEBUG_COLOR_MODE_ON;
  
@@ -72,7 +72,7 @@ index 37987d3..15f522e 100644
  static gchar *
  _replace_pattern_in_gst_debug_file_name (gchar * name, const char *token,
      guint val)
-@@ -462,9 +432,6 @@ _priv_gst_debug_init (void)
+@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)
    _priv_GST_CAT_PROTECTION =
        _gst_debug_category_new ("GST_PROTECTION", 0, "protection");
  
@@ -82,7 +82,7 @@ index 37987d3..15f522e 100644
    env = g_getenv ("GST_DEBUG_OPTIONS");
    if (env != NULL) {
      if (strstr (env, "full_tags") || strstr (env, "full-tags"))
-@@ -2502,12 +2469,6 @@ gst_debug_construct_win_color (guint colorinfo)
+@@ -2503,12 +2470,6 @@ gst_debug_construct_win_color (guint colorinfo)
    return 0;
  }
  
@@ -96,7 +96,7 @@ index 37987d3..15f522e 100644
  _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
      const gchar * func, gint line, GObject * obj, const gchar * msg,
 diff --git a/meson.build b/meson.build
-index f95b4f7..143c043 100644
+index ce1921aa4..7a84d0981 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -200,7 +200,6 @@ check_headers = [
@@ -108,5 +108,5 @@ index f95b4f7..143c043 100644
    'sys/uio.h',
  ]
 -- 
-2.28.0
+2.29.2
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
index 1c0e1f8171..bf5e57249c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
@@ -1,7 +1,7 @@
-From 24867db22a5cc35e7643bc218e959ce56c306aca Mon Sep 17 00:00:00 2001
+From cf8077a7e3ab0ae236ebde79b7fc0b02eac658de Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Fri, 25 Oct 2019 00:06:26 +0200
-Subject: [PATCH 3/4] meson: Add option for installed tests
+Subject: [PATCH 3/3] meson: Add option for installed tests
 
 This adds an option for producing installed versions of the unit tests.
 These versions don't need meson to run (only a small shell script). This
@@ -23,7 +23,7 @@ Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
 
 diff --git a/build-aux/gen-installed-test-desc.py b/build-aux/gen-installed-test-desc.py
 new file mode 100644
-index 0000000..69e8a0f
+index 000000000..69e8a0faf
 --- /dev/null
 +++ b/build-aux/gen-installed-test-desc.py
 @@ -0,0 +1,18 @@
@@ -47,7 +47,7 @@ index 0000000..69e8a0f
 +write_template(args.output, build_template(args.test_execdir, args.testname))
 diff --git a/build-aux/gen-installed-test-shscript.py b/build-aux/gen-installed-test-shscript.py
 new file mode 100644
-index 0000000..5da86fb
+index 000000000..5da86fb37
 --- /dev/null
 +++ b/build-aux/gen-installed-test-shscript.py
 @@ -0,0 +1,25 @@
@@ -77,7 +77,7 @@ index 0000000..5da86fb
 +write_template(args.output, build_template(args.test_execdir, args.testname))
 +os.chmod(args.output, 0o755)
 diff --git a/meson_options.txt b/meson_options.txt
-index 72c3997..346c423 100644
+index 72c3997e2..346c423d4 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -15,6 +15,8 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
@@ -90,7 +90,7 @@ index 72c3997..346c423 100644
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 372ea41..bb0dcfa 100644
+index a617cf159..e629131c5 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
 @@ -120,11 +120,17 @@ if add_languages('cpp', native: false, required: false)
@@ -168,7 +168,7 @@ index 372ea41..bb0dcfa 100644
      env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
 diff --git a/tests/files/testfile b/tests/files/testfile
 new file mode 100644
-index 0000000..89954e0
+index 000000000..89954e0e2
 --- /dev/null
 +++ b/tests/files/testfile
 @@ -0,0 +1,80 @@
@@ -253,5 +253,5 @@ index 0000000..89954e0
 +................................................................................
 +................................................................................
 -- 
-2.28.0
+2.29.2
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
index d55b2871e7..0fb0bcebc1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
@@ -19,9 +19,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
            file://0002-Remove-unused-valgrind-detection.patch \
            file://0003-meson-Add-option-for-installed-tests.patch \
-           file://0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch \
            "
-SRC_URI[sha256sum] = "79df8de21f284a105a5c1568527f8c559c583c85c0f2bd7bdb5b0372b8beecba"
+SRC_URI[sha256sum] = "66cdeb4f970c2e55932a2f427177d438fe2c55c0b6d29e80fda80263f2ae5446"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.29.2

