Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08A0C41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:38:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.181978.1692257922425150253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mnVOez+E;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692257922; x=1723793922;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A8HObTqwsyvjp5a+hZB2zJlETANXeHYbtjrlhfsvM9I=;
  b=mnVOez+E6m67AcHxSlKTKrgrXOQFf3TcJsyZuw6Mhwe4g40pyUxfCBAH
   tpoYrUm9gP7jveNxL8OKXRync/9higmlAc9TSigh93VwCJNmXa1YYvS6Q
   jY71Y3rp4LDamrjOSNJuHO42dGSqrwgjPHspRsewMNMe43NV3KlmKNey9
   rfUhP7TSD7cyMpzLFFKQuqkTHG7pVrD8/p+WHm5BveG3JuFNW4ACW+pCW
   c1zYVH/dUvDSCeEPIV0ZBhEDGn80JARutWszk9blV9QsXiTueO1Qp8wTR
   qi2DEjXFgmi8tt+ULWs5sirOQ9Pb/LHbMNtTWOVOZ7IZX3IjhrGG+hB91
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403720048"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403720048"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734569772"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="734569772"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.150.235])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:38:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] gstreamer1.0: upgrade 1.22.4 -> 1.22.5
Date: Thu, 17 Aug 2023 15:38:32 +0800
Message-ID: <20230817073834.55471-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186290

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-devtools_1.22.4.bb => gst-devtools_1.22.5.bb}          | 2 +-
 ...streamer1.0-libav_1.22.4.bb => gstreamer1.0-libav_1.22.5.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.4.bb => gstreamer1.0-omx_1.22.5.bb}  | 2 +-
 ...plugins-bad_1.22.4.bb => gstreamer1.0-plugins-bad_1.22.5.bb} | 2 +-
 ...ugins-base_1.22.4.bb => gstreamer1.0-plugins-base_1.22.5.bb} | 2 +-
 ...ugins-good_1.22.4.bb => gstreamer1.0-plugins-good_1.22.5.bb} | 2 +-
 ...ugins-ugly_1.22.4.bb => gstreamer1.0-plugins-ugly_1.22.5.bb} | 2 +-
 ...reamer1.0-python_1.22.4.bb => gstreamer1.0-python_1.22.5.bb} | 2 +-
 ...rtsp-server_1.22.4.bb => gstreamer1.0-rtsp-server_1.22.5.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.4.bb => gstreamer1.0-vaapi_1.22.5.bb} | 2 +-
 .../{gstreamer1.0_1.22.4.bb => gstreamer1.0_1.22.5.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.4.bb => gst-devtools_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.4.bb => gstreamer1.0-libav_1.22.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.4.bb => gstreamer1.0-omx_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.4.bb => gstreamer1.0-plugins-bad_1.22.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.4.bb => gstreamer1.0-plugins-base_1.22.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.4.bb => gstreamer1.0-plugins-good_1.22.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.4.bb => gstreamer1.0-plugins-ugly_1.22.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.4.bb => gstreamer1.0-python_1.22.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.4.bb => gstreamer1.0-rtsp-server_1.22.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.4.bb => gstreamer1.0-vaapi_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.4.bb => gstreamer1.0_1.22.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
index beaf1a9b91f..3e029396a61 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4c52053ce8c1df72fd81721e9f53de3b146edcf2de28f607be705bce4cf909d1"
+SRC_URI[sha256sum] = "2add1519aa6eeb01d544cb94293688ee3bc2079f6bca6075bf5c23d00a0921be"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
index 4d59353e08f..af9dc5d2d59 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9a751bc740de768e791c37a95f0a924c6a41d12fd7f37f54ce6a4e834be122d3"
+SRC_URI[sha256sum] = "8583f0c1f4fcb01eed11fa1e3c21126543a8bd739ed4fc1db31f756a5ab01d9a"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
index fc70805daf4..5d99810cd40 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5fcb872d977b035fb75a2d0ea955ba052dc3bdae282f8f60aa9d865808784211"
+SRC_URI[sha256sum] = "cf0cb9c4de06c5d62eef77cb31238bbaf257dc88802010072eedd1c168f136a4"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
index 16d53203a4e..ec65ec2ae88 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "eaaf53224565eaabd505ca39c6d5769719b45795cf532ce1ceb60e1b2ebe99ac"
+SRC_URI[sha256sum] = "e64e75cdafd7ff2fc7fc34e855b06b1e3ed227cc06fa378d17bbcd76780c338c"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
index 3c0cb7dc6cf..88ec756b4b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "292424e82dea170528c42b456f62a89532bcabc0508f192e34672fb86f68e5b8"
+SRC_URI[sha256sum] = "edd4338b45c26a9af28c0d35aab964a024c3884ba6f520d8428df04212c8c93a"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
index 0ae1758a3f1..93f0e76ee9d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "d7120c1146a9d723d53d5bfe8074da2575a81f0598438752937f39bb7c833b6a"
+SRC_URI[sha256sum] = "b67b31313a54c6929b82969d41d3cfdf2f58db573fb5f491e6bba5d84aea0778"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
index 1b3d3b6da73..29d705aaafe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "ffb461fda6c06d316c4be5682632cc8901454ed72b1098b1e0221bc55e673cd7"
+SRC_URI[sha256sum] = "2680473b218158f18467cac3e1c50291b7ff4e0710dd350a59eaacbc29c09a54"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
index e35bef3d562..be817bf3f5f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e1302dcc0f2451b64380dcc0dd3b82735795e8951dc812d938d8ba91f388163e"
+SRC_URI[sha256sum] = "bf05232415cf6018142ae51dd3b897bb73432687b5ce1786bf46edc6298ce5b0"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
index 29eb4bb0117..84c51e8a6c8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4666612d7a99c60dcd6f0bdba1b7a74d2562a0501b2a3e0576f0916bf1d8811b"
+SRC_URI[sha256sum] = "f343eb54964ebd4d8c071be5eecad586f28feb0156e036e06b148d0e7febb1c0"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
index 34c15bb3777..231d252323c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "967b8e353d82d0081a68dc53639b25d9fb4ca89bfa1e061403e0cd7d23585ba6"
+SRC_URI[sha256sum] = "a9a550267c9584df0e8c70434d30476e8fd0018b733c1c1ee33deaf422bdb24b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
index 2eadb79637d..2dacf037f8d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "11cb0498bc16b93d8b99d22f75f829b8d0abfd8254840b2120618db5532dc655"
+SRC_URI[sha256sum] = "4408d7930f381809e85917acc19712f173261ba85bdf20c5567b2a21b1193b61"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.41.0


