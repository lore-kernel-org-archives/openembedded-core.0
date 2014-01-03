Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1E76BCF7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627816"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:39 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:09 +0200
Message-Id: <0c1b75d0ac8aa409bc4644b976622fd56387be3d.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
Subject: [PATCH 6/8] gstreamer1.0-libav: upgrade to 1.2.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jan 2014 14:27:38 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc              | 3 ---
 .../{gstreamer1.0-libav_1.2.0.bb => gstreamer1.0-libav_1.2.2.bb}      | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.0.bb => gstreamer1.0-libav_1.2.2.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 2b7123b..784ddc3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -7,9 +7,6 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2"
 
 inherit autotools pkgconfig
 
-PR = "r1"
-
-
 # CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
 # compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
 # libav copy included in the gst-libav package.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.2.bb
index 66fe83b..803bcf2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.2.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     "
-SRC_URI[md5sum] = "382bc5a99d22a4fbf8e971c42bb72c01"
-SRC_URI[sha256sum] = "48721eb318ffffdd134edea754d0b65d76b08c8209a8d2c8a42bca1f799f9099"
+SRC_URI[md5sum] = "86540dee14d31daf976eb2713f2294f3"
+SRC_URI[sha256sum] = "585eb7971006100ad771a852e07bd2f3e23bcc6eb0b1253a40b5a0e40e4e7418"
 
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-- 
1.8.3.2


