Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A062060655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:00:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973356"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:40 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:41 +0300
Message-Id: <84bd1ac0bc449e7b697637bb8e692163f61a0b8d.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 09/12] libxfixes: Updated from 5.0 to 5.0.1
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
X-List-Received-Date: Fri, 28 Jun 2013 16:00:05 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxfixes_5.0.bb => libxfixes_5.0.1.bb}              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.bb => libxfixes_5.0.1.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb
rename to meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
index 1bdc3c0..32f8900 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.1.bb
@@ -19,5 +19,5 @@ XORG_PN = "libXfixes"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "678071bd7f9f7467e2fc712d81022318"
-SRC_URI[sha256sum] = "537a2446129242737a35db40081be4bbcc126e56c03bf5f2b142b10a79cda2e3"
+SRC_URI[md5sum] = "b985b85f8b9386c85ddcfe1073906b4d"
+SRC_URI[sha256sum] = "63bec085084fa3caaee5180490dd871f1eb2020ba9e9b39a30f93693ffc34767"
-- 
1.7.10.4


