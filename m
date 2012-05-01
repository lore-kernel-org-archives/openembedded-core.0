Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SPLHE-0000o3-Vg
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 00:10:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2012 15:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="135871097"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2012 15:00:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 15:00:43 -0700
Message-Id: <5d131cb45b8cb298fda838defe6d5eaed0c15919.1335909595.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
References: <b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1335909595.git.nitin.a.kamble@intel.com>
References: <cover.1335909595.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/6] gdb: upgrade from 7.4 to 7.4.1
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
X-List-Received-Date: Tue, 01 May 2012 22:10:33 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc           |    6 +++---
 ...canadian_7.4.bb => gdb-cross-canadian_7.4.1.bb} |    2 +-
 .../gdb/{gdb-cross_7.4.bb => gdb-cross_7.4.1.bb}   |    0
 .../gdb/{gdb_7.4.bb => gdb_7.4.1.bb}               |    0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.4.bb => gdb-cross-canadian_7.4.1.bb} (88%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.4.bb => gdb-cross_7.4.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.4.bb => gdb_7.4.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 8836aa3..ae82226 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -12,7 +12,7 @@ LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
 LTTNGUST_sh4 = ""
 
-INC_PR = "r9"
+INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
@@ -23,8 +23,8 @@ inherit autotools
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
            file://no-werror.patch"
 
-SRC_URI[md5sum] = "7877875c8af7c7ef7d06d329ac961d3f"
-SRC_URI[sha256sum] = "e2c18e2f4a5feab897595455a3d623cebbba9e9dd2dbe9a5510ed7ad43ae01d2"
+SRC_URI[md5sum] = "5fb7fca9ef7a9e3cfee0e2f2c0e52051"
+SRC_URI[sha256sum] = "f99d2be831ead324712ae4f11868e07e545272f10aac4186060f1386f2629b3"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CXX_FOR_BUILD = "${BUILD_CXX}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.1.bb
similarity index 88%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.1.bb
index b2f39ce..c15aa7a 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.1.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.0"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.4.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.4.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb_7.4.bb b/meta/recipes-devtools/gdb/gdb_7.4.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.4.bb
rename to meta/recipes-devtools/gdb/gdb_7.4.1.bb
-- 
1.7.7



