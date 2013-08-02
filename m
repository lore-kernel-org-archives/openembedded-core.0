Return-Path: <ionutx.radu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9589E6B4FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:37:52 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="276854908"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2013 08:37:52 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:40:31 +0300
Message-Id: <c9a41bb004c2b313f8dc4067b431da6f3c18f689.1375457879.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1375457879.git.ionutx.radu@intel.com>
References: <cover.1375457879.git.ionutx.radu@intel.com>
Subject: [PATCH 1/2] freetype: upgrade to 2.5.0.1
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
X-List-Received-Date: Fri, 02 Aug 2013 15:37:53 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.1.bb}         |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.4.12.bb => freetype_2.5.0.1.bb} (90%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.4.12.bb b/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
similarity index 90%
rename from meta/recipes-graphics/freetype/freetype_2.4.12.bb
rename to meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
index 8cf79d3..d9f53ab 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.12.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.0.1.bb
@@ -13,13 +13,11 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56
 
 SECTION = "libs"
 
-PR = "r0"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "3463102764315eb86c0d3c2e1f3ffb7d"
-SRC_URI[sha256sum] = "a78a17486689ab6852a9e1a759b179827ac9dfd7e2f237ddf169c73398c85381"
+SRC_URI[md5sum] = "c72e9010b1d986d556fc0b2b5fcbf31a"
+SRC_URI[sha256sum] = "57bce5b37989577aa8b4a588426839f6bf39bcc3869748cb18f6827df251f4e5"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.10.4


