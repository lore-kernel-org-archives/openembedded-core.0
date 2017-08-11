Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 19B2B78250
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 09:48:38 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 02:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,356,1498546800"; d="scan'208";a="117958426"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 11 Aug 2017 02:48:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 12:45:16 +0300
Message-Id: <20170811094519.27645-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
References: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/5] assimp: fix upstream version check
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
X-List-Received-Date: Fri, 11 Aug 2017 09:48:38 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/vulkan/assimp_4.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/vulkan/assimp_4.0.0.bb b/meta/recipes-graphics/vulkan/assimp_4.0.0.bb
index 0268ebb3727..7a96a4f36c1 100644
--- a/meta/recipes-graphics/vulkan/assimp_4.0.0.bb
+++ b/meta/recipes-graphics/vulkan/assimp_4.0.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271"
 DEPENDS = "zlib"
 
 SRC_URI = "git://github.com/assimp/assimp.git"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV = "52c8d06f5d6498afd66df983da348a6b112f1314"
 
-- 
2.13.2


