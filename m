Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3895D7D416
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 07:31:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jul 2019 00:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,465,1557212400"; d="scan'208";a="363721386"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.181.245])
	by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2019 00:31:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 15:31:00 +0800
Message-Id: <20190708073101.7529-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708073101.7529-1-anuj.mittal@intel.com>
References: <20190708073101.7529-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] vulkan-demos: depend on vulkan-loader
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
X-List-Received-Date: Mon, 08 Jul 2019 07:31:16 -0000
Content-Transfer-Encoding: 8bit

Depend on vulkan-loader component of the now split-up vulkan.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index bf30c980c0..d2041d7d4c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 REQUIRED_DISTRO_FEATURES = 'vulkan'
 
 inherit cmake distro_features_check
-DEPENDS = "vulkan assimp"
+DEPENDS = "vulkan-loader assimp"
 
 do_install_append () {
     # Remove assets that have uncertain licenses
-- 
2.20.1


