Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D9B846A543
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:56:48 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973292"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:32 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:36 +0300
Message-Id: <f217cffc12836351cf1328a727e786effe3c86ed.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 04/12] libxau: Updated from 1.0.7 to 1.0.8
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
X-List-Received-Date: Fri, 28 Jun 2013 15:56:49 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxau_1.0.7.bb => libxau_1.0.8.bb}                 |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.7.bb => libxau_1.0.8.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.7.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/libxau_1.0.7.bb
rename to meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
index 9fa9045..2ef8bfa 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.8.bb
@@ -14,12 +14,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7908e342491198401321cec1956807ec"
 DEPENDS += " xproto"
 PROVIDES = "xau"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXau"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "2d241521df40d27034413436d1a1465c"
-SRC_URI[sha256sum] = "7153ba503e2362d552612d9dc2e7d7ad3106d5055e310a26ecf28addf471a489"
+SRC_URI[md5sum] = "685f8abbffa6d145c0f930f00703b21b"
+SRC_URI[sha256sum] = "fdd477320aeb5cdd67272838722d6b7d544887dfe7de46e1e7cc0c27c2bea4f2"
-- 
1.7.10.4


