Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 57E106EFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 14:12:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 06:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,505,1389772800"; d="scan'208";a="477667147"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 06:11:59 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 16:14:47 +0200
Message-Id: <1f426da2eb99139389dcfcc4bf26b8fb7b973965.1392819236.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392819236.git.cristian.iorga@intel.com>
References: <cover.1392819236.git.cristian.iorga@intel.com>
Subject: [PATCH 7/8] gstreamer1.0-libav: upgrade to 1.2.3
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
X-List-Received-Date: Wed, 19 Feb 2014 14:12:02 -0000

- bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{gstreamer1.0-libav_1.2.2.bb => gstreamer1.0-libav_1.2.3.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.2.bb => gstreamer1.0-libav_1.2.3.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
index 803bcf2..9561e38 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
@@ -13,9 +13,8 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     "
-SRC_URI[md5sum] = "86540dee14d31daf976eb2713f2294f3"
-SRC_URI[sha256sum] = "585eb7971006100ad771a852e07bd2f3e23bcc6eb0b1253a40b5a0e40e4e7418"
-
+SRC_URI[md5sum] = "58c7998a054d8d8ca041fa35738f72b6"
+SRC_URI[sha256sum] = "ebc7fbe10955f40df6ccc4bf689075e7e296205fc7ecd8ff383d43c5cdf5bcd6"
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \
-- 
1.8.3.2


