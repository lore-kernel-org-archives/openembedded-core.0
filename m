Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 38E606AC7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:54:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="595239751"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2014 11:54:00 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 21:53:44 +0300
Message-Id: <6d466cd7e01c8e00597edd939785a821e041c19e.1409338378.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
Subject: [PATCH 2/7] gstreamer1.0-libav: upgrade to 1.4.1
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
X-List-Received-Date: Fri, 29 Aug 2014 18:54:55 -0000

Bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{gstreamer1.0-libav_1.4.0.bb => gstreamer1.0-libav_1.4.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.4.0.bb => gstreamer1.0-libav_1.4.1.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb
index bc79d54..8bba831 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
 "
-SRC_URI[md5sum] = "60811ae08c26fa093a96996582962c75"
-SRC_URI[sha256sum] = "c82c7a657863f2e27ac5cba539b0bd0a8114ad6bd4ba33bae777e4dbfab9e380"
+SRC_URI[md5sum] = "ea2d636c24d7c5ae123967ef22e37c07"
+SRC_URI[sha256sum] = "fc125521187fa84f3210269a0eecc51f8a856802f1ca4bb251f118dab90c5a9d"
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \
-- 
1.9.1


