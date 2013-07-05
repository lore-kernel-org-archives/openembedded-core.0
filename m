Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 20ED9606AC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059509"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:29 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:26 +0300
Message-Id: <680c48c97e528b9e76c739ef5d9fb6147cbdc645.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 09/10] freetype: Updated from 2.4.12 to 2.5.0
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:29 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb}           |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb} (90%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.4.12.bb b/meta/recipes-graphics/freetype/freetype_2.5.0.bb
similarity index 90%
rename from meta/recipes-graphics/freetype/freetype_2.4.12.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.0.bb
index 8cf79d3..d35c7ef 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.12.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.0.bb
@@ -13,13 +13,11 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 
 SECTION = "libs"
 
-PR = "r0"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "3463102764315eb86c0d3c2e1f3ffb7d"
-SRC_URI[sha256sum] = "a78a17486689ab6852a9e1a759b179827ac9dfd7e2f237ddf169c73398c85381"
+SRC_URI[md5sum] = "07b7f54bc32d3a0f8a44ec4586c73d81"
+SRC_URI[sha256sum] = "b8c75164f9073809797da19b81fa89d2c0ea507d8913f3b70c744f501880d7de"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.10.4


