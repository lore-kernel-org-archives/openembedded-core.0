Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.1253.1604335820404026743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dvb5aGms;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id w1so13906482edv.11
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LuSrwL8XSW3P4AwHdbSphV+pUgTa9Ps72io6Sg8Eg00=;
        b=dvb5aGmsHuJ/yaGK01B6qlOwuP1uyBF4XSfXI19xHXySpbT+7A2R1k75uOVdHmnXA4
         1NaTff92aZFRui0zatV503pqoGCIk/rAexiRVwumec18C2Lr5ir/dJFP91OIUzNnKXVq
         1OL5NyIMbg+PKXWoTsSU+pAYqXHbuF45qp+WmgeCsOrXq9Of+OpRpnTWSKdLrCM7mjA3
         r+RcxQQvNS5pzFDuMwbh4C06YKfrVklfdlfCCHapKOOLLzIc34uwqKwdUfpCH9peoMPp
         3cV6rEneVl0K1rTfvSP9HLWGyQgSVZo2H4OrZW01iz2g3iRVvM744Zd0ExZIvUw/FwlF
         mn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LuSrwL8XSW3P4AwHdbSphV+pUgTa9Ps72io6Sg8Eg00=;
        b=qgAQSUzF3P3D8JDHoLgaahoNGYcsZ84l8DpHcAWKcOaQRozcSfBZzhsvkloArrVfOA
         MXdog1tpBTHiPdo0U4DjXq9cjFhFkfTnMnSWlXzZYFr+pO6d+aNUZizmeGO9Mq3O6E3j
         lkI+Wo+yjXTWtegCWZ+Li5qPIQDRT9tvGrOLgU/6Tcl10i2lMDLMX20n2kmg1hCOV5R6
         Pubvb4KX6Q+6eNunaZWJa/AeW4TAlbBNLWHhwVmHvuoloHiyGkFh6D4ELmL7q/cTzLn4
         1IGuGcA+DJUb29evJodhr4mA9X/WBB3udD/xvtBbCgSZrzA+BrUTs/AwZpgzLMs1kVl+
         eeDw==
X-Gm-Message-State: AOAM532dUagf+Q2Ezbv+afLRoCcJba+Hnbr+gwli2QosciyTYN0q7W0U
	oMo6T4mYXT6fwLBwIEF/RAgwYVPmo616Hg==
X-Google-Smtp-Source: ABdhPJyQ6mmK4U6IgCtDnFrhSwR+ATztOEUqYy+W2pZv3VsFodt71UOZ8NqUIjcrWY3dVVHr2DLmWw==
X-Received: by 2002:a05:6402:17e4:: with SMTP id t4mr17756430edy.118.1604335818390;
        Mon, 02 Nov 2020 08:50:18 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:17 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 68/80] gstreamer1.0: upgrade 1.18.0 -> 1.18.1
Date: Mon,  2 Nov 2020 17:48:55 +0100
Message-Id: <20201102164907.27572-68-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: COPYING replaces gpl2 with lgpl2.1, COPYING.LIB removed.
This does not change the overall licensing situation as explained here:
https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/1422

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{gst-devtools_1.18.0.bb => gst-devtools_1.18.1.bb}      | 3 +--
 .../{gst-examples_1.18.0.bb => gst-examples_1.18.1.bb}      | 4 ++--
 ...amer1.0-libav_1.18.0.bb => gstreamer1.0-libav_1.18.1.bb} | 3 +--
 ...streamer1.0-omx_1.18.0.bb => gstreamer1.0-omx_1.18.1.bb} | 3 +--
 ...ins-bad_1.18.0.bb => gstreamer1.0-plugins-bad_1.18.1.bb} | 6 ++----
 ...s-base_1.18.0.bb => gstreamer1.0-plugins-base_1.18.1.bb} | 3 +--
 ...s-good_1.18.0.bb => gstreamer1.0-plugins-good_1.18.1.bb} | 3 +--
 ...s-ugly_1.18.0.bb => gstreamer1.0-plugins-ugly_1.18.1.bb} | 3 +--
 ...er1.0-python_1.18.0.bb => gstreamer1.0-python_1.18.1.bb} | 3 +--
 ...-server_1.18.0.bb => gstreamer1.0-rtsp-server_1.18.1.bb} | 3 +--
 ...amer1.0-vaapi_1.18.0.bb => gstreamer1.0-vaapi_1.18.1.bb} | 3 +--
 .../{gstreamer1.0_1.18.0.bb => gstreamer1.0_1.18.1.bb}      | 3 +--
 12 files changed, 14 insertions(+), 26 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.0.bb => gst-devtools_1.18.1.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.0.bb => gst-examples_1.18.1.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.0.bb => gstreamer1.0-libav_1.18.1.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.0.bb => gstreamer1.0-omx_1.18.1.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.0.bb => gstreamer1.0-plugins-bad_1.18.1.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.0.bb => gstreamer1.0-plugins-base_1.18.1.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.0.bb => gstreamer1.0-plugins-good_1.18.1.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.0.bb => gstreamer1.0-plugins-ugly_1.18.1.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.0.bb => gstreamer1.0-python_1.18.1.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.0.bb => gstreamer1.0-rtsp-server_1.18.1.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.0.bb => gstreamer1.0-vaapi_1.18.1.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.0.bb => gstreamer1.0_1.18.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb
index 63e7a99b4f..2e09ef9c25 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb
@@ -12,8 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[md5sum] = "37ca48ea06fb4304cfc9009ec924bc52"
-SRC_URI[sha256sum] = "82337141b5654f11c440f783892ba9d9498b3b6b98c2286b000f96dce6945f16"
+SRC_URI[sha256sum] = "712212babd2238233d55beecfc0fe1ea8db18e8807ac6ab05a64505b2c7ab0df"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
index 66db2f4eb8..048b45a08f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20
 
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 libsoup-2.4 json-glib glib-2.0-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=https \
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=https;branch=1.18 \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop \
            "
 
-SRCREV = "009290dc8784e6714dc2a29be123110c14a38123"
+SRCREV = "998ee69af18a5928759dbe17fffbceebbc8d72d0"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb
index 9fe7957daa..38bbffafa4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[md5sum] = "fe2f07356fa37445837cdde274027117"
-SRC_URI[sha256sum] = "42f93f5ce9a3fc22051e5f783a4574b56ebf213f331f75dcbc3552459bd3a06a"
+SRC_URI[sha256sum] = "39a717bc2613efbbba19df3cf5cacff0987471fc8281ba2c5dcdeaded79c2ed8"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb
index c4855034e0..513d66f9fc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "dcff9e4f055a2b1ecadc9f49f5b60a2e"
-SRC_URI[sha256sum] = "302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad"
+SRC_URI[sha256sum] = "42a8e0f9518b94655981ede441638f9f9395f4b1b9a4b329f068ee793975a965"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
index 8f9036b8ec..100875dfb7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
@@ -6,14 +6,12 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[md5sum] = "c1b5f2fb2d76ace6a3d04df73a8c72ea"
-SRC_URI[sha256sum] = "f382ab1caddd64aaa7acb7c4787487f63fd39bd0fde9c757655cbaa457c1185f"
+SRC_URI[sha256sum] = "c195978c85d97406c05eb9d43ac54b9ab35eda6ffdae32b3ed597b8f1743c1b2"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
 LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
-                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 "
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
index a04af186f6..8e3ff21c90 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
@@ -9,8 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[md5sum] = "5ea9dc2692335e03170c3639901c2d83"
-SRC_URI[sha256sum] = "762abdd1a950809a1cea62fff7f86b5f7d6bd5f6841e3e585c700b823cdb7897"
+SRC_URI[sha256sum] = "1ba654d7de30f7284b4c7071b32f881b609733ce02ab6d9d9ea29386a036c641"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
index 17a9d5a04e..bc7550f40b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
@@ -4,8 +4,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[md5sum] = "c437bf42bf830bc0f482c7d088fb37a5"
-SRC_URI[sha256sum] = "6329bc377a3afea5cf1ab329a91cc4a906f075781780d1edc59e8bea8c1a8bac"
+SRC_URI[sha256sum] = "e210e91a5590ecb6accc9d06c949a58ca6897d8edb3b3d55828e424c624f626c"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb
index d38550c352..614ef8d740 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb
@@ -9,8 +9,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "01d3a24152cfd5eb27b1787d44b524c6"
-SRC_URI[sha256sum] = "686644e45e08258ae240c4519376668ad8d34ea6d0f6ab556473c317bfb7e082"
+SRC_URI[sha256sum] = "18cd6cb829eb9611ca63cbcbf46aca0f0de1dd28b2df18caa2834326a75ff725"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb
index 8ad6e15306..c0c5d271d0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb
@@ -6,8 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2d55c22fcd57cae4fad55a07019aa334"
-SRC_URI[sha256sum] = "76bfe8b85a9c4a6ddfb81874f2635fd0da38c3f39d9d2a0b175213218516dd45"
+SRC_URI[sha256sum] = "42b289422f7ab32757670848cf2245c5a8a8b08a665a9cab65ded8d69364f6f6"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb
index 0adfa2aac9..2f00de1e56 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb
@@ -10,8 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "77fe28c702a83566811ab5c7bbe99ab2"
-SRC_URI[sha256sum] = "2ad19311054cbf2df0d0622936bc703dedc06ced706df46a3d3a3ea5a4b7c70f"
+SRC_URI[sha256sum] = "10a82865c3d199e66731017ca4b120bad071df9889e60cfe4dd6c49d953ef754"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb
index 60a975bf4d..acf5598a62 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "079a3739857e0cf4904afe92659d8a18"
-SRC_URI[sha256sum] = "c6efeb8c736f75bb1b53ab18413c60c4321300e7aee66641bcc07d59c2fe9e31"
+SRC_URI[sha256sum] = "400d3c42810b50b4566df03f37319a6bdd758f969560c40147e7d9a3b0e8a6ea"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
index d382655bcb..d989eefd97 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
@@ -20,8 +20,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-Remove-unused-valgrind-detection.patch \
            file://0003-meson-Add-option-for-installed-tests.patch \
            "
-SRC_URI[md5sum] = "25d683630ff8b82b2c878aa3edd3c491"
-SRC_URI[sha256sum] = "0ff09245b06c0aeb5d9a156edcab088a7e8213a0bf9c84a1ff0318f9c00c7805"
+SRC_URI[sha256sum] = "79df8de21f284a105a5c1568527f8c559c583c85c0f2bd7bdb5b0372b8beecba"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.29.0

