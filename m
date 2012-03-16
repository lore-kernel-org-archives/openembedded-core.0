Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUT-0002PQ-Et
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:57:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121480688"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:49:07 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:45 +0800
Message-Id: <4732ef1d8e9a3118f163e3aaef92cf32e9b7354e.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 48/60] libdmx: upgrade to 1.1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 00:57:57 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libdmx_1.1.1.bb => libdmx_1.1.2.bb}  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libdmx_1.1.1.bb => libdmx_1.1.2.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libdmx_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libdmx_1.1.2.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libdmx_1.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libdmx_1.1.2.bb
index cb49880..9d876bb 100644
--- a/meta/recipes-graphics/xorg-lib/libdmx_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libdmx_1.1.2.bb
@@ -16,6 +16,6 @@ DEPENDS += "libxext dmxproto"
 PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "75fd328fab3bd4a55cccaa6d5dfff749"
-SRC_URI[sha256sum] = "a6de6e87470bc749de02056fa38758d0e633303789830fdafc56600e75b3de18"
+SRC_URI[md5sum] = "782ced3a9e754dfeb53a8a006a75eb1a"
+SRC_URI[sha256sum] = "a7870b648a8768d65432af76dd11581ff69f3955118540d5967eb1eef43838ba"
 
-- 
1.7.6



