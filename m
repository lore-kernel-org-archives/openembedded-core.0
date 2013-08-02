Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4419B6B46D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:38:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="375219342"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 08:38:21 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:39:52 +0300
Message-Id: <7d3acc2505f0fd34bfbfecad6a234053c3465353.1375457906.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
Subject: [PATCH 3/7] gstreamer1.0: upgrade to v1.0.9
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
X-List-Received-Date: Fri, 02 Aug 2013 15:38:21 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc                    | 2 --
 .../gstreamer/{gstreamer1.0_1.0.7.bb => gstreamer1.0_1.0.9.bb}        | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.0.7.bb => gstreamer1.0_1.0.9.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index d7bbee1..3cb478a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -7,8 +7,6 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
-PR = "r1"
-
 inherit autotools pkgconfig gettext
 
 GSTREAMER_1_DEBUG ?= "--disable-debug"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.9.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.9.bb
index 1423227..e4b2f1e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.9.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
     "
-SRC_URI[md5sum] = "8f6066a37c71a0d0ff5fe5f7687fea12"
-SRC_URI[sha256sum] = "68cada7ee24ede23e15dc81ccde11898eed1a7a3c6a2d81a8c31596fccb1b5ce"
+SRC_URI[md5sum] = "cbbad73d703b811bc8bd18e47b36e534"
+SRC_URI[sha256sum] = "17a2c60a82baa461ef685ad3de187edb9c03a2c7e07513daba58a5a32efacaa3"
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
1.8.1.2


