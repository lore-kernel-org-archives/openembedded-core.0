Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QAbld-0004nh-Mr
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 07:40:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Apr 2011 22:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,216,1301900400"; d="scan'208";a="419668731"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by azsmga001.ch.intel.com with ESMTP; 14 Apr 2011 22:37:09 -0700
Message-Id: <781d61b18036ce2c856198d0573aec3054cdba65.1302846043.git.ke.yu@intel.com>
In-Reply-To: <cover.1302846043.git.ke.yu@intel.com>
References: <cover.1302846043.git.ke.yu@intel.com>
Old-Date: Sat, 9 Apr 2011 21:33:50 +0800
Date: Fri, 15 Apr 2011 13:44:32 +0800
To: openembedded-core@lists.openembedded.org
CC: 
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
X-List-Received-Date: Fri, 15 Apr 2011 05:40:29 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../{pango-1.28.3 => pango-1.28.4}/no-tests.patch  |    4 ++++
 .../pango/{pango_1.28.3.bb => pango_1.28.4.bb}     |    4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango-1.28.3 => pango-1.28.4}/no-tests.patch (72%)
 rename meta/recipes-graphics/pango/{pango_1.28.3.bb => pango_1.28.4.bb} (50%)

diff --git a/meta/recipes-graphics/pango/pango-1.28.3/no-tests.patch b/meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
similarity index 72%
rename from meta/recipes-graphics/pango/pango-1.28.3/no-tests.patch
rename to meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
index 4a74d8c..6d9e74b 100644
--- a/meta/recipes-graphics/pango/pango-1.28.3/no-tests.patch
+++ b/meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Inappropriate [ disable tests make sense in embedded, but not appropriate for upstream]
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
 Index: pango-1.22.2/Makefile.am
 ===================================================================
 --- pango-1.22.2.orig/Makefile.am
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



