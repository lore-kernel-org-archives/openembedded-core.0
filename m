Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1E68460655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:00:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973368"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:41 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:42 +0300
Message-Id: <8ac67950063b7aab0915a0bb764504cd7570293c.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 10/12] libxcb: Updated from 1.9 to 1.9.1
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
X-List-Received-Date: Fri, 28 Jun 2013 16:00:32 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-graphics/xcb/{libxcb_1.9.bb => libxcb_1.9.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xcb/{libxcb_1.9.bb => libxcb_1.9.1.bb} (55%)

diff --git a/meta/recipes-graphics/xcb/libxcb_1.9.bb b/meta/recipes-graphics/xcb/libxcb_1.9.1.bb
similarity index 55%
rename from meta/recipes-graphics/xcb/libxcb_1.9.bb
rename to meta/recipes-graphics/xcb/libxcb_1.9.1.bb
index f7da48c..a40a1c1 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.9.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.9.1.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxdmcp"
 
 PACKAGES =+ "libxcb-xinerama"
 
-SRC_URI[md5sum] = "2b05856e9d1cb37836aae7406f2f4ce2"
-SRC_URI[sha256sum] = "8857e62b3aae2976c7e10043643e45a85964fd1dcb4469dfde0d04d3d1b12c96"
+SRC_URI[md5sum] = "ed632cb0dc31b6fbd7ea5c0f931cf5a4"
+SRC_URI[sha256sum] = "d44a5ff4eb0b9569e6f7183b51fdaf6f58da90e7d6bfc36b612d7263f83e362f"
-- 
1.7.10.4


