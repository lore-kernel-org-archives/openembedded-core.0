Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ACEC61D90
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:34:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lmA3iRGi;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530494; x=1732066494;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dAWDOwQvi1Wr0n90aefR54X26hhGvlivp3tXEyZ7BZk=;
  b=lmA3iRGiYeB0S00KxcGWLjvSn267+Z7RNF9FGHIR/yw9UccTgx8gKtfj
   wZg156D4oLL5RXZk/IV6S3ju05F0Z0DtA0N6nfRhA5JkhNi5zXusJHz3x
   BuBoMYE2fYk6GtS3amydVQaXYTgvo2i3CGNxcbZps8pk6MFaxaivCll26
   7PPQdUTmK0lqEjaWQ3AdJo7UCsUofjK6sjhhcZMSoQsw0xxvuYDH1oYit
   qfX+lCwlE/sMT2jxGLg00V9SJtiL8xuVcZ34d9WOFqVCZB+tsHDOZdAgJ
   vIOIkPVg9ebcsplNgl1a8+zLoGyp4Iy38fev0nvPrLVErxNjDzUwbSrh+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584372"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584372"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952127"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952127"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:52 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] gstreamer1.0: upgrade 1.22.6 -> 1.22.7
Date: Tue, 21 Nov 2023 09:34:38 +0800
Message-ID: <20231121013448.8478-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190940

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-devtools_1.22.6.bb => gst-devtools_1.22.7.bb}          | 2 +-
 ...streamer1.0-libav_1.22.6.bb => gstreamer1.0-libav_1.22.7.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.6.bb => gstreamer1.0-omx_1.22.7.bb}  | 2 +-
 ...plugins-bad_1.22.6.bb => gstreamer1.0-plugins-bad_1.22.7.bb} | 2 +-
 ...ugins-base_1.22.6.bb => gstreamer1.0-plugins-base_1.22.7.bb} | 2 +-
 ...ugins-good_1.22.6.bb => gstreamer1.0-plugins-good_1.22.7.bb} | 2 +-
 ...ugins-ugly_1.22.6.bb => gstreamer1.0-plugins-ugly_1.22.7.bb} | 2 +-
 ...reamer1.0-python_1.22.6.bb => gstreamer1.0-python_1.22.7.bb} | 2 +-
 ...rtsp-server_1.22.6.bb => gstreamer1.0-rtsp-server_1.22.7.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.6.bb => gstreamer1.0-vaapi_1.22.7.bb} | 2 +-
 .../{gstreamer1.0_1.22.6.bb => gstreamer1.0_1.22.7.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.6.bb => gst-devtools_1.22.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.6.bb => gstreamer1.0-libav_1.22.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.6.bb => gstreamer1.0-omx_1.22.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.6.bb => gstreamer1.0-plugins-bad_1.22.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.6.bb => gstreamer1.0-plugins-base_1.22.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.6.bb => gstreamer1.0-plugins-good_1.22.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.6.bb => gstreamer1.0-plugins-ugly_1.22.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.6.bb => gstreamer1.0-python_1.22.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.6.bb => gstreamer1.0-rtsp-server_1.22.7.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.6.bb => gstreamer1.0-vaapi_1.22.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.6.bb => gstreamer1.0_1.22.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb
index 90bbd9c7336..b545f020cf8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8928560efaf16137c30285e718708e5d0bab0777eb4ef8127e0274e120d3d86b"
+SRC_URI[sha256sum] = "157cf93fb2741cf0c3dea731be3af2ffae703c9f2cd3c0c91b380fbc685eb9f9"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb
index 8906556b44b..7169223636a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7789e6408388a25f23cbf948cfc5c6230d735bbcd8b7f37f4a01c9e348a1e3a7"
+SRC_URI[sha256sum] = "1525b917141b895fe5cf618fe8867622b2528278a0286e9f727b5f37317daca1"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
index 2579aa3d661..ad40cf5513b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "223833c42518ad7eb1923bb4dd3726809f59a66d6e9aaaa69cb29ad0750c8758"
+SRC_URI[sha256sum] = "d7a18ec47d40a472bd5cba2015e0be72b732f1699895398cec5cd8e6a3a53b44"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb
index 3db7ddff5f2..b7d787b611b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "b4029cd2908a089c55f1d902a565d007495c95b1442d838485dc47fb12df7137"
+SRC_URI[sha256sum] = "c716f8dffa8fac3fb646941af1c6ec72fff05a045131311bf2d049fdc87bce2e"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb
index 1f67ca303a1..3b8923e8f22 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "50f2b4d17c02eefe430bbefa8c5cd134b1be78a53c0f60e951136d96cf49fd4b"
+SRC_URI[sha256sum] = "62519e0d8f969ebf62a9a7996f2d23efdda330217a635f4a32c0bf1c71577468"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb
index 6b76ba957ee..b8496a17508 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "b3b07fe3f1ce7fe93aa9be7217866044548f35c4a7792280eec7e108a32f9817"
+SRC_URI[sha256sum] = "b6db0e18e398b52665b7cdce301c34a8750483d5f4fbac1ede9f80b03743cd15"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb
index 77f79a630af..8a67531123a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "3e31454c98cb2f7f6d2d355eceb933a892fa0f1dc09bc36c9abc930d8e29ca48"
+SRC_URI[sha256sum] = "520b46bca637189ad86a298ff245b2d89375dbcac8b05d74daea910f81a9e9da"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
index addf12c4277..a3870316353 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "51de2d6d13b12ce095eac97c0b94ee59c2aeba3712bb7462b78c4d57dde176c5"
+SRC_URI[sha256sum] = "1ef8df7608012fa469329799c950ec087737a6dabad3003c230658b58c710172"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb
index fd79fe43241..af1c2ced449 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "0ae33a8b50443b62f11581a9181e906b41cd3877b2d799dbea72912c3eda4bb3"
+SRC_URI[sha256sum] = "f7fac001e20ad21e36d18397741c4657c5d43571eb1cc3b49f9a93ae127dc88f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
index bf4c1050578..4cad50742d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d9ba2fc26bef98c78e982c599f585d46bbb65fe122da89c2d7ab41f468a52c7b"
+SRC_URI[sha256sum] = "0e9fff768b89de6d318b34146e4e781d82b9a0f4025dc541b2c8349c7bcb7f67"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb
index a8984643222..72161b272fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "f500e6cfddff55908f937711fc26a0840de28a1e9ec49621c0b6f1adbd8f818e"
+SRC_URI[sha256sum] = "01e42c6352a06bdfa4456e64b06ab7d98c5c487a25557c761554631cbda64217"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.42.0


