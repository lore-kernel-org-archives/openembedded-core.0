Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8925760593
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:56:17 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Jul 2013 06:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="275780764"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jul 2013 06:56:16 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:58:50 +0300
Message-Id: <e63ad84faf8021c7d5b964e0c3c220b044fe8072.1375278766.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1375278766.git.ionutx.radu@intel.com>
References: <cover.1375278766.git.ionutx.radu@intel.com>
Subject: [PATCH 1/2] freetype: Upgrade from 2.4.12 to 2.5.0
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
X-List-Received-Date: Wed, 31 Jul 2013 13:56:18 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb}        |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb} (90%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.4.12.bb b/meta/recipes-graphics/freetype/freetype_2.5.0.bb
similarity index 90%
rename from meta/recipes-graphics/freetype/freetype_2.4.12.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.0.bb
index 8cf79d3..21c4d2a 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.12.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.0.bb
@@ -13,13 +13,10 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 
 SECTION = "libs"
 
-PR = "r0"
+SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
-"
-
-SRC_URI[md5sum] = "3463102764315eb86c0d3c2e1f3ffb7d"
-SRC_URI[sha256sum] = "a78a17486689ab6852a9e1a759b179827ac9dfd7e2f237ddf169c73398c85381"
+SRC_URI[md5sum] = "07b7f54bc32d3a0f8a44ec4586c73d81"
+SRC_URI[sha256sum] = "b8c75164f9073809797da19b81fa89d2c0ea507d8913f3b70c744f501880d7de"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.10.4


