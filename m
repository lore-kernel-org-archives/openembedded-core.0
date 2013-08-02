Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 746C66B51B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:38:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="375219350"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 08:38:24 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:39:55 +0300
Message-Id: <cff9fb7bf96c39361640f05a213f21d418ed889d.1375457906.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
Subject: [PATCH 6/7] gstreamer1.0-libav: upgrade to v1.0.9
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
X-List-Received-Date: Fri, 02 Aug 2013 15:38:24 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{gstreamer1.0-libav_1.0.7.bb => gstreamer1.0-libav_1.0.9.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.0.7.bb => gstreamer1.0-libav_1.0.9.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.9.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.9.bb
index f486a9d..0b6bd50 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.9.bb
@@ -14,9 +14,8 @@ SRC_URI = " \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     file://libav_e500mc.patch \
     "
-
-SRC_URI[md5sum] = "68e1eb18a58907e21b81d26ce7db056a"
-SRC_URI[sha256sum] = "aefa679d14e7a6558673cfbf401b9c01f1903bb52e5dc08332e9001d25a7ba7a"
+SRC_URI[md5sum] = "8414f8d4c4a239a74a3d5eadf3d14875"
+SRC_URI[sha256sum] = "759641c0597c24191322f40945b363b75df299a539ff4086650be6193028189a"
 
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-- 
1.8.1.2


