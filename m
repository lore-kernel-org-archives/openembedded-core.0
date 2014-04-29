Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1D84B65D18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:51:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 01:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,949,1389772800"; d="scan'208";a="531450517"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 01:51:15 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 11:54:24 +0300
Message-Id: <2b2ad91b96b116e1f8f7436881017382d2c28caf.1398761629.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
Subject: [PATCH 3/7] gstreamer1.0-libav: upgrade to 1.2.4
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
X-List-Received-Date: Tue, 29 Apr 2014 08:51:15 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{gstreamer1.0-libav_1.2.3.bb => gstreamer1.0-libav_1.2.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.3.bb => gstreamer1.0-libav_1.2.4.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb
index 9561e38..350b528 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     "
-SRC_URI[md5sum] = "58c7998a054d8d8ca041fa35738f72b6"
-SRC_URI[sha256sum] = "ebc7fbe10955f40df6ccc4bf689075e7e296205fc7ecd8ff383d43c5cdf5bcd6"
+SRC_URI[md5sum] = "6454f9f22b3aa37694781633e0d20a9c"
+SRC_URI[sha256sum] = "2a69480d63fc2db93249d9e2e229ab3541bbc2db881b0f64de13d0bfc7d1f037"
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \
-- 
1.9.1


