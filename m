Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0117C7EE2A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 05:17:08 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.2122.1686028620587863173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 22:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=B4svSbOv;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686028620; x=1717564620;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SppxCHSH1Is6sx8XZsFVEJjCeO3PD6sa7SzojeZmx8U=;
  b=B4svSbOvcKmuXcqx2FxO30/h/Jj+3Eup6GHUmIaFP9wcWpMtlxYh62u1
   kdzrzLn8E5txSLE9Yp5d+mW33/V9xS2e5zK9+0afVa3XFMiiBBdwvRgvu
   HH2zxdwVgBkNUSGy10Xg4a/02ZBfJoQkGQ57mYHN5hSEbbgJgRIrpcUEx
   xgz3+V9bTfdeBktPhsOFaQCFLUW+/W598anCdnUAQrcrBBzsRI9tcLmc2
   Oz8ERD4lMBU0SSIVzHbHmck6B9WBkiLUyGtNuzF8AXXKI0QufnFPkZXV/
   wgS3Txihm1E3giY3DTwSb3tuekrMYxFzRu4GWr4qtYu5UV6WR3gDAabI8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420113016"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="420113016"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 22:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798683759"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="798683759"
Received: from anmitta2-mobl3.png.intel.com ([10.107.4.247])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 22:16:58 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] gstreamer1.0: upgrade 1.22.2 -> 1.22.3
Date: Tue,  6 Jun 2023 13:16:46 +0800
Message-Id: <20230606051648.29103-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 05:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182407

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-devtools_1.22.2.bb => gst-devtools_1.22.3.bb}          | 2 +-
 ...streamer1.0-libav_1.22.2.bb => gstreamer1.0-libav_1.22.3.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.2.bb => gstreamer1.0-omx_1.22.3.bb}  | 2 +-
 ...plugins-bad_1.22.2.bb => gstreamer1.0-plugins-bad_1.22.3.bb} | 2 +-
 ...ugins-base_1.22.2.bb => gstreamer1.0-plugins-base_1.22.3.bb} | 2 +-
 ...ugins-good_1.22.2.bb => gstreamer1.0-plugins-good_1.22.3.bb} | 2 +-
 ...ugins-ugly_1.22.2.bb => gstreamer1.0-plugins-ugly_1.22.3.bb} | 2 +-
 ...reamer1.0-python_1.22.2.bb => gstreamer1.0-python_1.22.3.bb} | 2 +-
 ...rtsp-server_1.22.2.bb => gstreamer1.0-rtsp-server_1.22.3.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.2.bb => gstreamer1.0-vaapi_1.22.3.bb} | 2 +-
 .../{gstreamer1.0_1.22.2.bb => gstreamer1.0_1.22.3.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.2.bb => gst-devtools_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.2.bb => gstreamer1.0-libav_1.22.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.2.bb => gstreamer1.0-omx_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.2.bb => gstreamer1.0-plugins-bad_1.22.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.2.bb => gstreamer1.0-plugins-base_1.22.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.2.bb => gstreamer1.0-plugins-good_1.22.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.2.bb => gstreamer1.0-plugins-ugly_1.22.3.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.2.bb => gstreamer1.0-python_1.22.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.2.bb => gstreamer1.0-rtsp-server_1.22.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.2.bb => gstreamer1.0-vaapi_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.2.bb => gstreamer1.0_1.22.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
index 8b282bbb7b..fa82ef7861 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "eb62726d3e27a8782369a24fd6364a8885ed2462b3bbdab091dffc8139ee06d8"
+SRC_URI[sha256sum] = "446ac9c42d502cbfd9081737cc1b853b3c1f50db77ca7ccd01aea10f687550c1"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
index ed3dbaca22..c5af676a95 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fcaaf9878fe8f3bc82317ef13a1558824cb68df1f8968c6797f556c5e33bcffd"
+SRC_URI[sha256sum] = "2ec5c805808b4371a7e32b1da0202a1c8a6b36b6ce905080bf5c34097d12a923"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
index d2d23050d9..694a12b1c1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1b0c57f2cc4ddeec5e7f0c436e502f06665c4e93c73261855b94e04fc94337b2"
+SRC_URI[sha256sum] = "6f51c2331c334593c2c3cf12e9f22b9e3b419a3247cfb2fec0e1bd845569863a"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
index 6260f9586b..bbcbded1ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3d8faf1ce3402c8535ce3a8c4e1a6c960e4b5655dbda6b55943db9ac79022d0f"
+SRC_URI[sha256sum] = "e1798fee2d86127f0637481c607f983293bf0fd81aad70a5c7b47205af3621d8"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
index c1e5d0cd09..44056b04e9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "eb65120c4ee79b7a153c3c1972d5c0158c2151877cc51ec7725bba5749679d49"
+SRC_URI[sha256sum] = "1c596289a0d4207380233eba8c36a932c4d1aceba19932937d9b57c24cef89f3"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
index a9352949b5..8de1d1c5f5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "7c8cc59425f2b232f60ca7d13e56edd615da4f711e73dd01a7cffa46e6bc0cdd"
+SRC_URI[sha256sum] = "af81154b3a2ef3f4d2feba395f25696feea6fd13ec62c92d3c7a973470710273"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
index dc81bf27f6..21102d59b6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "8f30f44db0bd063709bf6fbe55138e3a98af0abcb61c360f35582bbe10e80691"
+SRC_URI[sha256sum] = "3dc98ed5c2293368b3c4e6ce55d89be834a0a62e9bf88ef17928cf03b7d5a360"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
index ab1600db41..0cf1908e76 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bef2b3d82ce4be46b775b1bb56305c1003ee01b535a53a82f9fe8924972153ad"
+SRC_URI[sha256sum] = "70bed3fabe634bc622ef6de4e6eb1c33bc9cefd64bdab200f6fa316b468c731c"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
index 02c2badc2a..0f8a89db7c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2be4aecfb88710100ea7115ed0216403e8094344ebf146094271b8d4d73828bf"
+SRC_URI[sha256sum] = "d02a39dfa9bdbf99a3dd2d378e17942b3ce42dfe36fb0c27e2d0b01722fc561d"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
index 6111720976..6e0014c090 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d2e642f9745f97d9f73a7f5085e7659a9a31fe209b774e6e45dae041b435df06"
+SRC_URI[sha256sum] = "a27867062e8b69305fca5b7d3f13ed7c318b703e7d72756c94395bd305c7b32c"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
index f6dd2c168e..ca7548758c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "b2afe73603921c608ba48969dbb7d743776744bfe5d8059ece241137b7f88e21"
+SRC_URI[sha256sum] = "9ffeab95053f9f6995eb3b3da225e88f21c129cd60da002d3f795db70d6d5974"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.40.1


