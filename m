Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Q95r7-0005kX-5F
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2011 03:23:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2011 18:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,336,1299484800"; d="scan'208";a="416839161"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2011 18:21:42 -0700
Message-Id: <c7f069ac1dbdd66df84691fd6d1770f055221d0d.1302485033.git.ke.yu@intel.com>
In-Reply-To: <cover.1302485033.git.ke.yu@intel.com>
References: <cover.1302485033.git.ke.yu@intel.com>
Old-Date: Sat, 9 Apr 2011 21:33:50 +0800
Date: Mon, 11 Apr 2011  9:28:53 +0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 7/9] pango: upgrade from 1.28.3 to 1.28.4
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
X-List-Received-Date: Mon, 11 Apr 2011 01:23:53 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../{pango-1.28.3 => pango-1.28.4}/no-tests.patch  |    0
 .../pango/{pango_1.28.3.bb => pango_1.28.4.bb}     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango-1.28.3 => pango-1.28.4}/no-tests.patch (100%)
 rename meta/recipes-graphics/pango/{pango_1.28.3.bb => pango_1.28.4.bb} (50%)

diff --git a/meta/recipes-graphics/pango/pango-1.28.3/no-tests.patch b/meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
similarity index 100%
rename from meta/recipes-graphics/pango/pango-1.28.3/no-tests.patch
rename to meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
diff --git a/meta/recipes-graphics/pango/pango_1.28.3.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
similarity index 50%
rename from meta/recipes-graphics/pango/pango_1.28.3.bb
rename to meta/recipes-graphics/pango/pango_1.28.4.bb
index 228aae7..600f00b 100644
--- a/meta/recipes-graphics/pango/pango_1.28.3.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -6,7 +6,7 @@ PR = "r0"
 
 SRC_URI += "file://no-tests.patch"
 
-SRC_URI[archive.md5sum] = "caa74baea47e7e16bc73c89f9089d522"
-SRC_URI[archive.sha256sum] = "5e278bc9430cc7bb00270f183360d262c5006b51248e8b537ea904573f200632"
+SRC_URI[archive.md5sum] = "3f3989700f04e9117d30544a9078b3a0"
+SRC_URI[archive.sha256sum] = "7eb035bcc10dd01569a214d5e2bc3437de95d9ac1cfa9f50035a687c45f05a9f"
 
 #PARALLEL_MAKE = ""
-- 
1.7.0.4



