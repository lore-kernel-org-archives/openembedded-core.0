Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2B0478205
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945840"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:27 +0300
Message-Id: <2c81ad2331f186b6ac09c5b9e4a259a14a280725.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 35/50] assimp: update to 4.0.1
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:05 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/vulkan/{assimp_4.0.0.bb => assimp_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{assimp_4.0.0.bb => assimp_4.0.1.bb} (92%)

diff --git a/meta/recipes-graphics/vulkan/assimp_4.0.0.bb b/meta/recipes-graphics/vulkan/assimp_4.0.1.bb
similarity index 92%
rename from meta/recipes-graphics/vulkan/assimp_4.0.0.bb
rename to meta/recipes-graphics/vulkan/assimp_4.0.1.bb
index 7a96a4f36c1..b2dd59ef14b 100644
--- a/meta/recipes-graphics/vulkan/assimp_4.0.0.bb
+++ b/meta/recipes-graphics/vulkan/assimp_4.0.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 SRC_URI = "git://github.com/assimp/assimp.git"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "52c8d06f5d6498afd66df983da348a6b112f1314"
+SRCREV = "eb8639d7c8a056d1c1b1cd42598c84ba3974c41b"
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


