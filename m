Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUZ-0002WH-K4
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:58:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 17:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119580422"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:49:15 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:51 +0800
Message-Id: <4280f62e67d3d35add642f4637f6fde785d1d48a.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 54/60] libxres: upgrade to 1.0.6
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
X-List-Received-Date: Fri, 16 Mar 2012 00:58:04 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxres_1.0.5.bb => libxres_1.0.6.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.0.5.bb => libxres_1.0.6.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.0.5.bb b/meta/recipes-graphics/xorg-lib/libxres_1.0.6.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxres_1.0.5.bb
rename to meta/recipes-graphics/xorg-lib/libxres_1.0.6.bb
index 3d9e8fc..dff2f02 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.0.6.bb
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXres"
 
-SRC_URI[md5sum] = "d08f0b6df3f96c051637d37009f4e55a"
-SRC_URI[sha256sum] = "a00b0f464bc0c038db5614513b0e33475db22a7b3cd41e4e56a6c661a518a059"
+SRC_URI[md5sum] = "80d0c6d8522fa7a645e4f522e9a9cd20"
+SRC_URI[sha256sum] = "ff8661c925e8b182f98ae98f02bbd93c55259ef7f34a92c1a126b6074ebde890"
-- 
1.7.6



