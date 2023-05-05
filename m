Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DED2C7EE23
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 03:12:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.18932.1683256368354401335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 20:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=WbCM6jCE;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683256368; x=1714792368;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AHU7GmNYa8bCGDJ3dVrUHGOjLA2idF06Ok1iXN7awks=;
  b=WbCM6jCEZs/Hd03yNU7b5qE9kBW1BWxJ9M7wbOpJCzs4Cr0latAXQGiJ
   Sy+BZ5nhT48kvJzl6yQMjZWmXWW7ATEuiwGk2gz7iXKY6Inb3ndBd8Lo+
   DhQoFFsX4YHh57vZNKg670DXbqgtc2evw/6/AcknT2VBSuNFmxAib6bi+
   JlMyRMoDVAueLwxh9sP0MBBMr12qsDyfSi+0Yh7FdHmmIqXzt5GCNr2zI
   5JYJXbz+7ubuo+vciJJKXbZLMHJZlTzw+1DAosndTFaBN+dpsvtnAw5in
   d9N6MR+YNV+mjtv1WZNv5UlqLKozvgMJwxFVnzOt2iCJ7LbYGAUOydGq2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347939023"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="347939023"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 20:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="786857875"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="786857875"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.170.248])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 20:12:37 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gstreamer1.0: upgrade 1.22.0 -> 1.22.2
Date: Fri,  5 May 2023 11:12:30 +0800
Message-Id: <20230505031231.48080-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 03:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180894

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...tools_1.22.0.bb => gst-devtools_1.22.2.bb} |  2 +-
 .../gstreamer1.0-libav/ffmpeg-6.0.patch       | 49 -------------------
 ...1.22.0.bb => gstreamer1.0-libav_1.22.2.bb} |  6 +--
 ...x_1.22.0.bb => gstreamer1.0-omx_1.22.2.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.2.bb} |  2 +-
 ....22.0.bb => gstreamer1.0-python_1.22.2.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.2.bb} |  2 +-
 ...1.22.0.bb => gstreamer1.0-vaapi_1.22.2.bb} |  9 +---
 ...er1.0_1.22.0.bb => gstreamer1.0_1.22.2.bb} |  2 +-
 12 files changed, 12 insertions(+), 70 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.0.bb => gst-devtools_1.22.2.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.0.bb => gstreamer1.0-libav_1.22.2.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.0.bb => gstreamer1.0-omx_1.22.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.0.bb => gstreamer1.0-plugins-bad_1.22.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.0.bb => gstreamer1.0-plugins-base_1.22.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.0.bb => gstreamer1.0-plugins-good_1.22.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.0.bb => gstreamer1.0-plugins-ugly_1.22.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.0.bb => gstreamer1.0-python_1.22.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.0.bb => gstreamer1.0-rtsp-server_1.22.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.0.bb => gstreamer1.0-vaapi_1.22.2.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.0.bb => gstreamer1.0_1.22.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
index 3e9a789d24f..8b282bbb7bf 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4d21fee5c15f2877c0b1f6c2da0cdba67ce7caab2c199ab27e91a1394d5ba195"
+SRC_URI[sha256sum] = "eb62726d3e27a8782369a24fd6364a8885ed2462b3bbdab091dffc8139ee06d8"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.patch
deleted file mode 100644
index 0a06540fb47..00000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From cde31d23c071ee93fae96331805f696856084254 Mon Sep 17 00:00:00 2001
-From: "U. Artie Eoff" <ullysses.a.eoff@intel.com>
-Date: Mon, 13 Feb 2023 17:02:01 -0500
-Subject: [PATCH] avviddec: change
- AV_CODEC_CAP_AUTO_THREADS->AV_CODEC_CAP_OTHER_THREADS
-
-This fixes a compile error with recent upstream FFmpeg.
-
-The AV_CODEC_CAP_AUTO_THREADS was deprecated and renamed to
-AV_CODEC_CAP_OTHER_THREADS in FFmpeg upstream commit
-7d09579190de (lavc 58.132.100).
-
-The AV_CODEC_CAP_AUTO_THREADS was finally removed in FFmpeg upstream
-commit 10c9a0874cb3 (lavc 59.63.100).
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3964>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/cde31d23c071ee93fae96331805f696856084254?merge_request_iid=3964]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ext/libav/gstavviddec.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
-index 43cea456ae8..6d7c4cd0de8 100644
---- a/ext/libav/gstavviddec.c
-+++ b/ext/libav/gstavviddec.c
-@@ -35,6 +35,10 @@
- 
- GST_DEBUG_CATEGORY_STATIC (GST_CAT_PERFORMANCE);
- 
-+#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(58,132,100)
-+#define AV_CODEC_CAP_OTHER_THREADS AV_CODEC_CAP_AUTO_THREADS
-+#endif
-+
- #define GST_FFMPEG_VIDEO_CODEC_FRAME_FLAG_ALLOCATED (1<<15)
- 
- #define MAX_TS_MASK 0xff
-@@ -615,7 +619,7 @@ gst_ffmpegviddec_set_format (GstVideoDecoder * decoder,
-   if (ffmpegdec->max_threads == 0) {
-     /* When thread type is FF_THREAD_FRAME, extra latency is introduced equal
-      * to one frame per thread. We thus need to calculate the thread count ourselves */
--    if ((!(oclass->in_plugin->capabilities & AV_CODEC_CAP_AUTO_THREADS)) ||
-+    if ((!(oclass->in_plugin->capabilities & AV_CODEC_CAP_OTHER_THREADS)) ||
-         (ffmpegdec->context->thread_type & FF_THREAD_FRAME))
-       ffmpegdec->context->thread_count =
-           MIN (gst_ffmpeg_auto_max_threads (), 16);
--- 
-GitLab
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
index d1dce6739dd..ed3dbaca226 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.2.bb
@@ -11,10 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
                     "
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-           file://ffmpeg-6.0.patch \
-          "
-SRC_URI[sha256sum] = "0e48407b4905227a260213dbda84cba3812f0530fc7a75b43829102ef82810f1"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI[sha256sum] = "fcaaf9878fe8f3bc82317ef13a1558824cb68df1f8968c6797f556c5e33bcffd"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
index ed4c44583ef..d2d23050d9d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "dbc951a99af532380e599aa8acd9e1385fdb299b46b5868cd2be4230ad888341"
+SRC_URI[sha256sum] = "1b0c57f2cc4ddeec5e7f0c436e502f06665c4e93c73261855b94e04fc94337b2"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
index bb6bcb45b05..6260f9586b2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3c9d9300f5f4fb3e3d36009379d1fb6d9ecd79c1a135df742b8a68417dd663a1"
+SRC_URI[sha256sum] = "3d8faf1ce3402c8535ce3a8c4e1a6c960e4b5655dbda6b55943db9ac79022d0f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
index 91c072accd8..c1e5d0cd09c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f53672294f3985d56355c8b1df8f6b49c8c8721106563e19f53be3507ff2229d"
+SRC_URI[sha256sum] = "eb65120c4ee79b7a153c3c1972d5c0158c2151877cc51ec7725bba5749679d49"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
index 67a6a224048..a9352949b58 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "582e617271e7f314d1a2211e3e3856ae2e4303c8c0d6114e9c4a5ea5719294b0"
+SRC_URI[sha256sum] = "7c8cc59425f2b232f60ca7d13e56edd615da4f711e73dd01a7cffa46e6bc0cdd"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
index 35baaea3043..dc81bf27f67 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.2.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "a644dc981afa2d8d3a913f763ab9523c0620ee4e65a7ec73c7721c29da3c5a0c"
+SRC_URI[sha256sum] = "8f30f44db0bd063709bf6fbe55138e3a98af0abcb61c360f35582bbe10e80691"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
index c447f2cbe86..52d987eee5a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6c63ad364ca4617eb2cbb3975ab26c66760eb3c7a6adf5be69f99c11e21ef3a5"
+SRC_URI[sha256sum] = "bef2b3d82ce4be46b775b1bb56305c1003ee01b535a53a82f9fe8924972153ad"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
index f943c829c4e..02c2badc2aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "aea24eeb59ee5fadfac355de2f7cecb51966c3e147e5ad7cfb4c314f1a4086ed"
+SRC_URI[sha256sum] = "2be4aecfb88710100ea7115ed0216403e8094344ebf146094271b8d4d73828bf"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
index 8a703f533e0..61117209766 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "593ccad19f88e5fa29f40f98356c007806bd535828707b1406944d16a90bdff5"
+SRC_URI[sha256sum] = "d2e642f9745f97d9f73a7f5085e7659a9a31fe209b774e6e45dae041b435df06"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
@@ -51,10 +51,3 @@ FILES:${PN} += "${libdir}/gstreamer-*/*.so"
 FILES:${PN}-dbg += "${libdir}/gstreamer-*/.debug"
 FILES:${PN}-dev += "${libdir}/gstreamer-*/*.a"
 FILES:${PN}-tests = "${bindir}/*"
-
-# correct .pc install location - fixed in upstream trunk
-do_install:append() {
-    mkdir -p ${D}/${libdir}/pkgconfig
-    mv ${D}/${libdir}/gstreamer-1.0/pkgconfig/*.pc ${D}/${libdir}/pkgconfig
-    rmdir ${D}/${libdir}/gstreamer-1.0/pkgconfig/
-}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
index 11002e667d5..f6dd2c168eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "78d21b5469ac93edafc6d8ceb63bc82f6cbbee94d2f866cca6b9252157ee0a09"
+SRC_URI[sha256sum] = "b2afe73603921c608ba48969dbb7d743776744bfe5d8059ece241137b7f88e21"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.40.1


