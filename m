Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE563C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 23:28:45 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.940.1645054124446935313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=npaZHvxD;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id w11so5932564wra.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3sImbnTgKP5GaR6tIsAa6ikgpCM++bcDkPBiCvqQHX4=;
        b=npaZHvxDftOT/hLD/iPbKm8AueSaSMYIAUlg5A1ujzRkD5MeLrE5cO+SFSFjP1+ns+
         3Wh51T4yhBlyBireZSZlyRZ9EdeOwbpsEREzOsi2/dWLgujFaI82cgETyxZg2+NXBK7I
         emuipVpBPrrrbPNh9Lazb4CXuF/W3HHCjO4bvg1CY48f7HN9ekHHrMm56ZAQwH9JqDo/
         sSbwv1QTWxV2zmDbwXEo7W3dUvCCXJwOFHN2Wf0W6Sn2NJDYE4r8cIVeU4iu3KOfJJ1f
         amcmZ66D3qW/yM3ICdc50itzA7izx9C4zkQzPVUFRjqpiXy5b9gLqx6vZ4kNIDUVrv2J
         AeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3sImbnTgKP5GaR6tIsAa6ikgpCM++bcDkPBiCvqQHX4=;
        b=xisKZRRSFfE5r7cR3NpQJgrAZB3utUKCS0/6EXndZoAMDSXkDzTst6WShehYSDzqvF
         9/aJ5pzyNc71q4T/Igiel45KiOJrP15c9pK28WA9o7le5AgtXKbA6eAnPGTPB6OS3xzJ
         xenxF2uD9Wq/h15Gxgfx322duSEV3ZDVe/XShH4sS0itnzNo8N/POT1QL5YSDs4QTUvZ
         sQhBMI6bH3fwLllCmnw9ekVfN9Ux7CLDbFaCL8f9DIkRIOKWJ9SGUBeHM3FQRW29tJI+
         CUMNi5I2UqwhpJ2OoLz4qV0xvpONtLgZZW+BKh5sLOwitOI6ahd85EupqnyUl6aXIVAU
         glMA==
X-Gm-Message-State: AOAM533dsCJuYA7t/Pd2xcp6rdYT0WGB+MW5fG+TSugCU1osbHqXmnln
	33WgFR5NDHAdh448cp/V/ScbmpH/jEw=
X-Google-Smtp-Source: 
 ABdhPJxOcNs22rB+bHCqoTZmt1U6xnVlRkG1jMIMC5aapvR70fAu/uQ1aOIPTTuTgkVx19b4IusVaQ==
X-Received: by 2002:a05:6000:144a:b0:1e6:2783:b3fd with SMTP id
 v10-20020a056000144a00b001e62783b3fdmr229759wrx.156.1645054122586;
        Wed, 16 Feb 2022 15:28:42 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 g22sm223941wmh.12.2022.02.16.15.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 15:28:42 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.kjellerstedt@axis.com,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] gstreamer1.0: update licences of all modules
Date: Wed, 16 Feb 2022 23:28:04 +0000
Message-Id: <20220216232803.1868265-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:28:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161786

Since all gstreamer modules uses LGPLv2.1 with exceptions
for some plugins in bad and ugly modules that has GPLv2+.

For the GPLv2+ this patch set the licence only for each plugin
that is affected by this licence. The commercial LICENSE_FLAGS
is enabled if any of the previous plugins is builded.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../gstreamer/gst-devtools_1.20.0.bb                   |  2 +-
 .../gstreamer/gstreamer1.0-libav_1.20.0.bb             |  2 +-
 .../gstreamer/gstreamer1.0-omx_1.20.0.bb               |  2 +-
 .../gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb       |  7 ++++++-
 .../gstreamer/gstreamer1.0-plugins-base_1.20.0.bb      |  2 +-
 .../gstreamer/gstreamer1.0-plugins-good_1.20.0.bb      |  2 +-
 .../gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb      | 10 ++++++++--
 .../gstreamer/gstreamer1.0-python_1.20.0.bb            |  2 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb       |  2 +-
 .../gstreamer/gstreamer1.0-vaapi_1.20.0.bb             |  2 +-
 .../gstreamer/gstreamer1.0_1.20.0.bb                   |  2 +-
 11 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
index 7a27d27b2e..e17f4ee09d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A Tool to test GStreamer components"
 HOMEPAGE = "https://gstreamer.freedesktop.org/documentation/gst-devtools/index.html"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://validate/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 #S = "${WORKDIR}/gst-devtools-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
index 98b2650bb0..575e608d65 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.0.bb
@@ -6,7 +6,7 @@ SECTION = "multimedia"
 
 # ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
 LICENSE_FLAGS = "commercial"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
index 15f19e349e..94c5214a37 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Wraps available OpenMAX IL components and makes them available as
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-or-later"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
index 915d4ec744..22288373ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee7
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS += "gstreamer1.0-plugins-base"
@@ -98,6 +98,11 @@ PACKAGECONFIG[faad]            = "-Dfaad=enabled,-Dfaad=disabled,faad2"
 PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdread libdvdnav"
 PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
 
+LICENSE_FLAGS = "${@bb.utils.contains("PACKAGECONFIG", "gpl", "commercial", "", d)}"
+LICENSE:${PN}-faad = "GPL-2.0-or-later"
+LICENSE:${PN}-resindvd = "GPL-2.0-or-later"
+LICENSE:${PN}-x265 = "GPL-2.0-or-later"
+
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Daes=enabled \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
index 455c9fc480..c9fbc599ae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
@@ -3,7 +3,7 @@ require gstreamer1.0-plugins-common.inc
 DESCRIPTION = "'Base' GStreamer plugins and helper libraries"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
index da4d4a8ccb..17086bc3b8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "2d119c15ab8c9e79f8cd3c6bf582ff7a050b28ccae52ab4865e1a14649
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
index 8128104319..6442fd4504 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.bb
@@ -7,8 +7,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly/-/issues
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
-LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
-LICENSE_FLAGS = "commercial"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
@@ -37,6 +36,13 @@ PACKAGECONFIG[dvdread]  = "-Ddvdread=enabled,-Ddvdread=disabled,libdvdread"
 PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
 PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
 
+LICENSE_FLAGS = "${@bb.utils.contains("PACKAGECONFIG", "gpl", "commercial", "", d)}"
+LICENSE:${PN}-cdio = "GPL-2.0-or-later"
+LICENSE:${PN}-a52dec = "GPL-2.0-or-later"
+LICENSE:${PN}-dvdread = "GPL-2.0-or-later"
+LICENSE:${PN}-mpeg2dec = "GPL-2.0-or-later"
+LICENSE:${PN}-x264 = "GPL-2.0-or-later"
+
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Dsidplay=disabled \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
index 3399b6f9d7..29d7c55acb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
@@ -4,7 +4,7 @@ provided by python-gi) "
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
 SECTION = "multimedia"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
index 66764f0880..be81f87616 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A library on top of GStreamer for building an RTSP server"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
index ce7fbde0df..7ef8ae3138 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
@@ -6,7 +6,7 @@ based plugins for GStreamer and helper libraries: `vaapidecode', \
 
 REALPN = "gstreamer-vaapi"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
index 243f99fee9..a84616cdd9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
@@ -4,7 +4,7 @@ It supports a wide range of formats including mp3, ogg, avi, mpeg and quicktime.
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.1-or-later"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
-- 
2.35.1


