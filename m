Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.3050.1604100200764721332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 16:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KaHClPED;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id k21so4303809wmi.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 16:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yE/IWmtRR6QF/YG4NJd/IoAPtgIvRUAju+AEKDulcBo=;
        b=KaHClPEDuyg6fT3AWfVFEt8opoqC12rIJ5z7/I80yG2wBvxfjvK8T2G9ufj795Ulww
         s1dpmcx3CF4QDyMfWk9SBxSU/NUNXmg3NrgaqKZwxfEtuV+QX9XW8bZinPSDnH2noogr
         jYZMr3mhcBcyGAwxaOJSS7fiKSDZ0wFb5ZkcTwj6hqlXpcmHs0Ekmbs52Y8BTg7d82Mf
         OFTtN/dwaF1O61x/S7sv6jkontqBLn/66FIhNhmg18U/KBx3vqUf6GOvMEQhfVmCRaGt
         SvkpPzo0Sj6hoTFHk22YQO9UG8uE+jDJxA+jdaG3h3sLhFpVZGJY4+9KRUyXqZqlj3oE
         0WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yE/IWmtRR6QF/YG4NJd/IoAPtgIvRUAju+AEKDulcBo=;
        b=K3oJqkfp+oy0zjiXN3gUc0h0LhaDY2/S9ETJ/rFpqsLVbN16XTKFLMY3bzfiK5tUN5
         8o7bdjv/QUwX3cB9oWKhqJlgA1E0iYP/4tEDJkxN5Ejvb8d3+IWBH+Uk9PvzDYoD33sL
         ntBf7CNj4OgNpxkWM9VaN278GApp+IY77QIplEQ4L9uYc4k5+r4w5T1b3HEQQXlvN1jU
         tHwUQ3jNA1KMB0bbU6YsVfFW4eT851ptkNvGolkHuiExnF4UKW3MkVekXkqhEhcCo1Fg
         KshCUEnlaU/BiV1RTOPIti/tyE8P5e36q1WLcltTWaviVurSY0Nxn9Os72lrKtx+SvJE
         3dPQ==
X-Gm-Message-State: AOAM532JXdHBzJaQx6PGcSpWcU45Tmt+GSSTbfMF+/2ZPxH6e7N/PfPn
	WCEDlASQMzJMOF+cqFVo968pInvxb5x3bSVM
X-Google-Smtp-Source: ABdhPJyJZrFIXgUYKnAsvmZqz4WFJjP2NxCwX7LxH6RSAjXxQ5lleq0PYyQeOk5U9UpvkHLeTVDAOg==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr5273298wmj.109.1604100198543;
        Fri, 30 Oct 2020 16:23:18 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h4sm12235895wrv.11.2020.10.30.16.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 16:23:17 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] gstreamer: use git to fetch the sources
Date: Fri, 30 Oct 2020 23:22:56 +0000
Message-Id: <20201030232256.624297-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gstreamer has the code hosted on [1] and this repo as tags.
manage code with git its more convenient than with tarball archives.

[1] - https://gitlab.freedesktop.org/gstreamer

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gst-devtools_1.18.0.bb                | 10 +++++-----
 .../gstreamer/gstreamer1.0-libav_1.18.0.bb          | 11 ++++++-----
 .../gstreamer/gstreamer1.0-omx_1.18.0.bb            | 10 +++++-----
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb    |  9 +++++----
 .../gstreamer/gstreamer1.0-plugins-base_1.18.0.bb   |  9 +++++----
 .../gstreamer/gstreamer1.0-plugins-common.inc       |  2 +-
 .../gstreamer/gstreamer1.0-plugins-good_1.18.0.bb   |  8 ++++----
 .../gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb   | 11 +++++------
 .../gstreamer/gstreamer1.0-python_1.18.0.bb         | 13 ++++++-------
 .../gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb    | 12 +++++-------
 .../gstreamer/gstreamer1.0-vaapi_1.18.0.bb          | 13 ++++++-------
 .../gstreamer/gstreamer1.0_1.18.0.bb                | 11 ++++++-----
 12 files changed, 59 insertions(+), 60 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
index 63e7a99b4f..59b4edea34 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
@@ -6,21 +6,21 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://validate/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-#S = "${WORKDIR}/gst-devtools-${PV}"
+S = "${WORKDIR}/git"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}.tar.xz \
+SRCREV = "796b7caad02fc69a060865d23e8e8d53500991e4"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-devtools.git;protocol=https \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[md5sum] = "37ca48ea06fb4304cfc9009ec924bc52"
-SRC_URI[sha256sum] = "82337141b5654f11c440f783892ba9d9498b3b6b98c2286b000f96dce6945f16"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
 
 FILES_${PN} += "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-launcher/* ${libdir}/gstreamer-1.0/*"
 
-inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection
+inherit meson pkgconfig gettext gobject-introspection
 
 # TODO: put this in a gettext.bbclass patch
 def gettext_oemeson(d):
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
index 9fe7957daa..be67751143 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
@@ -9,15 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[md5sum] = "fe2f07356fa37445837cdde274027117"
-SRC_URI[sha256sum] = "42f93f5ce9a3fc22051e5f783a4574b56ebf213f331f75dcbc3552459bd3a06a"
+SRCREV = "215b3ed959f2b307065319f94855cc9e1ce7be95"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-libav.git;protocol=https"
 
-S = "${WORKDIR}/gst-libav-${PV}"
+S = "${WORKDIR}/git"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
 
-inherit meson pkgconfig upstream-version-is-even
+inherit meson pkgconfig
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
index c4855034e0..ab59d9ed23 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
@@ -7,16 +7,16 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
+SRCREV = "f5efdba36c64ac2bf826cee34642e7fd54104ab1"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-omx.git;protocol=https"
 
-SRC_URI[md5sum] = "dcff9e4f055a2b1ecadc9f49f5b60a2e"
-SRC_URI[sha256sum] = "302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
-S = "${WORKDIR}/gst-omx-${PV}"
+S = "${WORKDIR}/git"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad virtual/libomxil"
 
-inherit meson pkgconfig upstream-version-is-even
+inherit meson pkgconfig
 
 GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
 GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index 8f9036b8ec..a573090beb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -1,15 +1,16 @@
 require gstreamer1.0-plugins-common.inc
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
+SRCREV = "7cb583bb0427819a6b59b783e7df67961df2155f"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-plugins-bad.git;protocol=https \
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[md5sum] = "c1b5f2fb2d76ace6a3d04df73a8c72ea"
-SRC_URI[sha256sum] = "f382ab1caddd64aaa7acb7c4787487f63fd39bd0fde9c757655cbaa457c1185f"
 
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
 
 LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
index a04af186f6..010557778a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.0.bb
@@ -3,16 +3,17 @@ require gstreamer1.0-plugins-common.inc
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
+SRCREV = "f21623c1f60949ed6a77e2c2c3857be942cd2db5"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-plugins-base.git;protocol=https \
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[md5sum] = "5ea9dc2692335e03170c3639901c2d83"
-SRC_URI[sha256sum] = "762abdd1a950809a1cea62fff7f86b5f7d6bd5f6841e3e585c700b823cdb7897"
 
-S = "${WORKDIR}/gst-plugins-base-${PV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
 
 DEPENDS += "iso-codes util-linux zlib"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
index dba96e0f6e..215faeed4e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
@@ -8,7 +8,7 @@ SECTION = "multimedia"
 
 DEPENDS = "gstreamer1.0 glib-2.0-native"
 
-inherit gettext meson pkgconfig upstream-version-is-even
+inherit gettext meson pkgconfig
 
 require gstreamer1.0-plugins-packaging.inc
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
index 17a9d5a04e..c1cd547a31 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
@@ -1,13 +1,13 @@
 require gstreamer1.0-plugins-common.inc
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
+SRCREV = "6ef694ce7b40dda9f2163ed5e1b1de7378505ad0"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-plugins-good.git;protocol=https \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[md5sum] = "c437bf42bf830bc0f482c7d088fb37a5"
-SRC_URI[sha256sum] = "6329bc377a3afea5cf1ab329a91cc4a906f075781780d1edc59e8bea8c1a8bac"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
-S = "${WORKDIR}/gst-plugins-good-${PV}"
+S = "${WORKDIR}/git"
 
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
index d38550c352..d735bb77d4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
@@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
 LICENSE_FLAGS = "commercial"
 
-SRC_URI = " \
-            https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
-            "
-SRC_URI[md5sum] = "01d3a24152cfd5eb27b1787d44b524c6"
-SRC_URI[sha256sum] = "686644e45e08258ae240c4519376668ad8d34ea6d0f6ab556473c317bfb7e082"
+SRCREV = "ae91a81d9aa913cee1e8310af93a8fff5445628d"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly.git;protocol=https"
 
-S = "${WORKDIR}/gst-plugins-ugly-${PV}"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
 
 DEPENDS += "gstreamer1.0-plugins-base"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
index 8ad6e15306..e8fdae1726 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
@@ -5,19 +5,18 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2d55c22fcd57cae4fad55a07019aa334"
-SRC_URI[sha256sum] = "76bfe8b85a9c4a6ddfb81874f2635fd0da38c3f39d9d2a0b175213218516dd45"
+SRCREV = "a85f99e274fe14348645c61606463ff63ceb45eb"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-python.git;protocol=https"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 
-PNREAL = "gst-python"
-
-S = "${WORKDIR}/${PNREAL}-${PV}"
+S = "${WORKDIR}/git"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
+inherit meson pkgconfig distutils3-base gobject-introspection features_check
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
index 0adfa2aac9..7e3e83d8b6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
@@ -6,16 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
-PNREAL = "gst-rtsp-server"
+SRCREV = "12eef972482ab3243743ae1bda1c40fc4411782c"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-rtsp-server.git;protocol=https"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
-SRC_URI[md5sum] = "77fe28c702a83566811ab5c7bbe99ab2"
-SRC_URI[sha256sum] = "2ad19311054cbf2df0d0622936bc703dedc06ced706df46a3d3a3ea5a4b7c70f"
+S = "${WORKDIR}/git"
 
-S = "${WORKDIR}/${PNREAL}-${PV}"
-
-inherit meson pkgconfig upstream-version-is-even gobject-introspection
+inherit meson pkgconfig gobject-introspection
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb
index 60a975bf4d..2127e02b68 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.0.bb
@@ -3,20 +3,19 @@ DESCRIPTION = "gstreamer-vaapi consists of a collection of VA-API \
 based plugins for GStreamer and helper libraries: `vaapidecode', \
 `vaapiconvert', and `vaapisink'."
 
-REALPN = "gstreamer-vaapi"
-
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
+SRCREV = "de6fb60929252d6ee066aa06e25302a3f4a9856e"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi.git;protocol=https"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
-SRC_URI[md5sum] = "079a3739857e0cf4904afe92659d8a18"
-SRC_URI[sha256sum] = "c6efeb8c736f75bb1b53ab18413c60c4321300e7aee66641bcc07d59c2fe9e31"
+S = "${WORKDIR}/git"
 
-S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
-inherit meson pkgconfig features_check upstream-version-is-even
+inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
index d382655bcb..63a04b6893 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
@@ -8,20 +8,21 @@ LICENSE = "LGPLv2+"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
-inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection
+inherit meson pkgconfig gettext gobject-introspection
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
-S = "${WORKDIR}/gstreamer-${PV}"
+S = "${WORKDIR}/git"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+SRCREV = "96148da56f9cbf23120e51ce59ab90f94d8b19b8"
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https \
            file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
            file://0002-Remove-unused-valgrind-detection.patch \
            file://0003-meson-Add-option-for-installed-tests.patch \
            "
-SRC_URI[md5sum] = "25d683630ff8b82b2c878aa3edd3c491"
-SRC_URI[sha256sum] = "0ff09245b06c0aeb5d9a156edcab088a7e8213a0bf9c84a1ff0318f9c00c7805"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.29.2

