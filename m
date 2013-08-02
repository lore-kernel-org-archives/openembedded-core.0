Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 280ED6B52C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:38:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="375219344"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 08:38:22 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:39:53 +0300
Message-Id: <d6ac8b0dfe70147e029592a62594648279dd55fe.1375457906.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
Subject: [PATCH 4/7] gstreamer1.0-plugins-base: upgrade to v1.0.9
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
X-List-Received-Date: Fri, 02 Aug 2013 15:38:22 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc      | 2 --
 ...r1.0-plugins-base_1.0.7.bb => gstreamer1.0-plugins-base_1.0.9.bb} | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.0.7.bb => gstreamer1.0-plugins-base_1.0.9.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index b2c8995..5002399 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -5,8 +5,6 @@ LICENSE = "GPLv2+ & LGPLv2+"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
 DEPENDS += "freetype liboil util-linux"
 
-PR = "r1"
-
 inherit gettext
 
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb
index 72a4aee..7b1e990 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                    "
-
-SRC_URI[md5sum] = "b5b43cfbf82b413ce2e07a190d87e68f"
-SRC_URI[sha256sum] = "014805e50b696bc06c3862ea656df079fc0b5fef0c10f16e9f085f290545677a"
+SRC_URI[md5sum] = "24af1986581d9c2cd3dc834ab64d133d"
+SRC_URI[sha256sum] = "963e3b83d651661f495ca2e44ccd2d5c61e986e9d7706246e568276689a372ea"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.8.1.2


