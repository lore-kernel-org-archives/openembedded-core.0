Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 808206B1FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 14:42:38 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Jul 2013 07:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; d="scan'208";a="267448335"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jul 2013 07:42:34 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 17:44:06 +0300
Message-Id: <64f5905504694f462895e22594ff4321ca49097b.1373640113.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1373640113.git.cristian.iorga@intel.com>
References: <cover.1373640113.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1373640113.git.cristian.iorga@intel.com>
References: <cover.1373640113.git.cristian.iorga@intel.com>
Subject: [PATCH 3/5] bluez5: upgrade to v5.7
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
X-List-Received-Date: Fri, 12 Jul 2013 14:42:38 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../bluez5/{bluez5-5.4 => bluez5-5.7}/bluetooth.conf               |    0
 .../bluez5/{bluez5-5.4 => bluez5-5.7}/fix-udev-paths.patch         |    0
 meta/recipes-connectivity/bluez5/{bluez5_5.4.bb => bluez5_5.7.bb}  |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5-5.4 => bluez5-5.7}/bluetooth.conf (100%)
 rename meta/recipes-connectivity/bluez5/{bluez5-5.4 => bluez5-5.7}/fix-udev-paths.patch (100%)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.4.bb => bluez5_5.7.bb} (90%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.4/bluetooth.conf b/meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
similarity index 100%
rename from meta/recipes-connectivity/bluez5/bluez5-5.4/bluetooth.conf
rename to meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.4/fix-udev-paths.patch b/meta/recipes-connectivity/bluez5/bluez5-5.7/fix-udev-paths.patch
similarity index 100%
rename from meta/recipes-connectivity/bluez5/bluez5-5.4/fix-udev-paths.patch
rename to meta/recipes-connectivity/bluez5/bluez5-5.7/fix-udev-paths.patch
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.4.bb b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
similarity index 90%
rename from meta/recipes-connectivity/bluez5/bluez5_5.4.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.7.bb
index 4379de6..824800b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.4.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
@@ -3,8 +3,8 @@ require bluez5.inc
 SRC_URI += "file://bluetooth.conf \
             file://fix-udev-paths.patch"
 
-SRC_URI[md5sum] = "e4a7d8bab9c28053a53f00bc940382a8"
-SRC_URI[sha256sum] = "65b2d0d7eead2b3c49216b9f94ea71c3d15da92fb3fd49fce1ee6e91af1b4430"
+SRC_URI[md5sum] = "ce0ef43938e8bfc230f3f06d6ad02d7e"
+SRC_URI[sha256sum] = "902299204b7139c913765603c7054a604570aea9e9fddb30454bd1b5e5997860"
 
 RCONFLICTS_${PN} = "bluez4"
 RREPLACES_${PN} = "bluez4"
-- 
1.7.10.4


