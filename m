Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F156B6A5C7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:18 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059431"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:19 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:20 +0300
Message-Id: <46432360b2c4452312117f1111531f74b6222c76.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 03/10] libxvmc: Update from 1.0.7 to 1.0.8
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:19 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxvmc_1.0.7.bb => libxvmc_1.0.8.bb}               |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.7.bb => libxvmc_1.0.8.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.7.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.8.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.7.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.8.bb
index 70b4816..b0d5e0d 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.8.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0a207f08d4961489c55046c9a5e500da \
 
 DEPENDS += "libxext libxv videoproto"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[md5sum] = "3340c99ff556ea2457b4be47f5cb96fa"
-SRC_URI[sha256sum] = "28f085fc8518a3dadfe355360705d50153051f09898093e69af806c0b437cea3"
+SRC_URI[md5sum] = "2e4014e9d55c430e307999a6b3dd256d"
+SRC_URI[sha256sum] = "5e1a401efa433f959d41e17932b8c218c56b931348f494b8fa4656d7d798b204"
-- 
1.7.10.4


