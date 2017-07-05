Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 09E3F77809
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:28:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 05:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,311,1496127600"; d="scan'208";a="988912720"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 05 Jul 2017 05:28:42 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 649F95800EA;
	Wed,  5 Jul 2017 05:28:41 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 15:28:34 +0300
Message-Id: <389044c992c3a59a17433f1fe18ba3ec702f0546.1499256752.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499256752.git.jussi.kukkonen@intel.com>
References: <cover.1499256752.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/6] assimp: Add as dependency of vulkan-demos
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
X-List-Received-Date: Wed, 05 Jul 2017 12:28:41 -0000

Asset import library used by Sascha Willems Vulkan demos.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/vulkan/assimp_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/assimp_git.bb

diff --git a/meta/recipes-graphics/vulkan/assimp_git.bb b/meta/recipes-graphics/vulkan/assimp_git.bb
new file mode 100644
index 0000000..c519458
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/assimp_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Open Asset Import Library"
+LICENSE = "BSD-3-Clause"
+DEPENDS = "zlib"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271 \
+                    file://code/Assimp.cpp;endline=41;md5=717f847b6e8f43c64cdbafcfea109923"
+
+SRC_URI = "git://github.com/assimp/assimp.git"
+SRCREV = "b38ba233f530fdb103d3ede3df5126121af78b10"
+S = "${WORKDIR}/git"
+
+inherit cmake
+EXTRA_OECMAKE = "-DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DASSIMP_BUILD_TESTS=OFF"
+FILES_${PN}-dev += "${libdir}/cmake/assimp-3.3"
-- 
2.1.4


