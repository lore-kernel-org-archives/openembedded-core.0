Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsiI7-000078-Fy
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:04:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2012 13:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102140816"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2012 13:55:23 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 13:55:18 -0800
Message-Id: <8d7aca3d86ea93641902352d2270abd0670fe944.1328133261.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1328133261.git.nitin.a.kamble@intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/8] gdb: upgrade from 7.3.1 to 7.4
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
X-List-Received-Date: Wed, 01 Feb 2012 22:04:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc           |    4 ++--
 ...canadian_7.3.1.bb => gdb-cross-canadian_7.4.bb} |    0
 .../gdb/{gdb-cross_7.3.1.bb => gdb-cross_7.4.bb}   |    0
 .../gdb/{gdb_7.3.1.bb => gdb_7.4.bb}               |    0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.3.1.bb => gdb-cross-canadian_7.4.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.3.1.bb => gdb-cross_7.4.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.3.1.bb => gdb_7.4.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 930a71b..a100b79 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -22,8 +22,8 @@ inherit autotools
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
            file://no-werror.patch"
 
-SRC_URI[md5sum] = "c2795d636a9481d022608cab201be613"
-SRC_URI[sha256sum] = "d7d909b4b8ae0932ba6c1602f2f1f32bef60f0c71c72f1dd833ab6cb15e0d357"
+SRC_URI[md5sum] = "7877875c8af7c7ef7d06d329ac961d3f"
+SRC_URI[sha256sum] = "e2c18e2f4a5feab897595455a3d623cebbba9e9dd2dbe9a5510ed7ad43ae01d2"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CXX_FOR_BUILD = "${BUILD_CXX}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.3.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.4.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.3.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.4.bb
diff --git a/meta/recipes-devtools/gdb/gdb_7.3.1.bb b/meta/recipes-devtools/gdb/gdb_7.4.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.3.1.bb
rename to meta/recipes-devtools/gdb/gdb_7.4.bb
-- 
1.7.6.4



