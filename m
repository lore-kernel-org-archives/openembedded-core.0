Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R9Rxx-00027X-II
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 03:32:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Sep 2011 18:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,464,1312182000"; d="scan'208";a="57186165"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 29 Sep 2011 18:27:12 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2011 18:27:08 -0700
Message-Id: <4320d5ae4fbe881a4a4a761c899069225f6c78ca.1317344910.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1317344910.git.nitin.a.kamble@intel.com>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/4] gdb: upgrade from 7.3a to 7.3.1
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
X-List-Received-Date: Fri, 30 Sep 2011 01:32:41 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc           |    4 ++--
 ...anadian_7.3a.bb => gdb-cross-canadian_7.3.1.bb} |    2 +-
 .../gdb/{gdb-cross_7.3a.bb => gdb-cross_7.3.1.bb}  |    2 +-
 .../gdb/{gdb_7.3a.bb => gdb_7.3.1.bb}              |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.3a.bb => gdb-cross-canadian_7.3.1.bb} (83%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.3a.bb => gdb-cross_7.3.1.bb} (78%)
 rename meta/recipes-devtools/gdb/{gdb_7.3a.bb => gdb_7.3.1.bb} (91%)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 074f913..e01b57c 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -22,8 +22,8 @@ inherit autotools
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
            file://no-werror.patch"
 
-SRC_URI[md5sum] = "9443a370dabd9ca9c41b496b59f05145"
-SRC_URI[sha256sum] = "2c2b26eea33ab477ea1f7739a8e511b1e8d89b6f74d87cdd510c6262a3af82d7"
+SRC_URI[md5sum] = "c2795d636a9481d022608cab201be613"
+SRC_URI[sha256sum] = "d7d909b4b8ae0932ba6c1602f2f1f32bef60f0c71c72f1dd833ab6cb15e0d357"
 
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CXX_FOR_BUILD = "${BUILD_CXX}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bb
similarity index 83%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bb
index 7e8ad04..870e29c 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bb
@@ -6,4 +6,4 @@ PR = "${INC_PR}.0"
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
 
-S = "${WORKDIR}/${BPN}-7.3"
+S = "${WORKDIR}/${BPN}-${PN}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.3a.bb b/meta/recipes-devtools/gdb/gdb-cross_7.3.1.bb
similarity index 78%
rename from meta/recipes-devtools/gdb/gdb-cross_7.3a.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.3.1.bb
index dacf6c9..eaf8f36 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_7.3a.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_7.3.1.bb
@@ -5,4 +5,4 @@ EXPAT = "--with-expat"
 
 PR = "${INC_PR}.0"
 
-S = "${WORKDIR}/${BPN}-7.3"
+S = "${WORKDIR}/${BPN}-${PV}"
diff --git a/meta/recipes-devtools/gdb/gdb_7.3a.bb b/meta/recipes-devtools/gdb/gdb_7.3.1.bb
similarity index 91%
rename from meta/recipes-devtools/gdb/gdb_7.3a.bb
rename to meta/recipes-devtools/gdb/gdb_7.3.1.bb
index 8f54416..0645b56 100644
--- a/meta/recipes-devtools/gdb/gdb_7.3a.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.3.1.bb
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 PR = "${INC_PR}.0"
 
-S = "${WORKDIR}/${BPN}-7.3"
+S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.7.4.4



