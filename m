Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C111D6003C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 07:32:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2017 00:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,377,1496127600"; d="scan'208";a="126348469"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 18 Jul 2017 00:32:14 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 75039580386;
	Tue, 18 Jul 2017 00:32:13 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 10:32:10 +0300
Message-Id: <1500363130-19509-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] vulkan-demos: Rename ${bindir}/screenshot
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
X-List-Received-Date: Tue, 18 Jul 2017 07:32:13 -0000

This conflicts with sato-screenshot.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index fcd9e7b..e088277 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -24,6 +24,8 @@ do_install_append () {
        ${D}${datadir}/vulkan-demos/models/vulkanscene* \
        ${D}${datadir}/vulkan-demos/models/plants.dae \
        ${D}${datadir}/vulkan-demos/textures/texturearray_plants*
+
+    mv ${D}${bindir}/screenshot ${D}${bindir}/vulkan-screenshot
 }
 
 EXTRA_OECMAKE = "-DRESOURCE_INSTALL_DIR=${datadir}/vulkan-demos"
-- 
2.1.4


