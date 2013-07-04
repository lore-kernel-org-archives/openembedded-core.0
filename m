Return-Path: <radu.moisan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 78ECC6B01E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 14:56:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 04 Jul 2013 07:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="360532314"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2013 07:57:08 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 17:57:49 +0300
Message-Id: <072c55d4b73deb36a97efb05280da2cb480d8885.1372947733.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
In-Reply-To: <cover.1372947733.git.radu.moisan@intel.com>
References: <cover.1372947733.git.radu.moisan@intel.com>
Subject: [PATCH 06/11] atk: Upgrade to v2.9.3
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
X-List-Received-Date: Thu, 04 Jul 2013 14:56:12 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
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


