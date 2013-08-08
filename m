Return-Path: <cristiana.voicu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6E46B4BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 13:45:23 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2013 06:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,839,1367996400"; d="scan'208";a="279405797"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2013 06:45:21 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 16:46:11 +0300
Message-Id: <6d45e79a28f0e03dd2d21cd1a2d0e2450736b56d.1375969277.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
References: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1375969277.git.cristiana.voicu@intel.com>
References: <cover.1375969277.git.cristiana.voicu@intel.com>
Subject: [PATCH 3/5] atk: upgrade to 2.9.3
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
X-List-Received-Date: Thu, 08 Aug 2013 13:45:23 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../atk/{atk_2.8.0.bb => atk_2.9.3.bb}             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.8.0.bb => atk_2.9.3.bb} (79%)

diff --git a/meta/recipes-support/atk/atk_2.8.0.bb b/meta/recipes-support/atk/atk_2.9.3.bb
similarity index 79%
rename from meta/recipes-support/atk/atk_2.8.0.bb
rename to meta/recipes-support/atk/atk_2.9.3.bb
index 9a36ae4..e7cc67c 100644
--- a/meta/recipes-support/atk/atk_2.8.0.bb
+++ b/meta/recipes-support/atk/atk_2.9.3.bb
@@ -14,8 +14,8 @@ inherit gnomebase gtk-doc
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "c652bd25530825d604dae1c1ebd2da02"
-SRC_URI[archive.sha256sum] = "b22519176226f3e07cf6d932b77852e6b6be4780977770704b32d0f4e0686df4"
+SRC_URI[archive.md5sum] = "467447fa3d733394481c214d619690df"
+SRC_URI[archive.sha256sum] = "5fdb79c729cfad45042c3e0f55d01f57fdde3b8379b6cb5bbeb8b37478d4456d"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.9.5


