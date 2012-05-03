Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQZ-0006gj-RA
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772201"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:40 -0700
Message-Id: <193507e28ff264d4397cfb3060516906f39ae95e.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/36] gdb: upgrade from 7.4 to 7.4.1
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
X-List-Received-Date: Thu, 03 May 2012 02:05:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

[Fixed sha256 - sgw]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
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
index 8836aa3..be4d77a 100644
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
+SRC_URI[sha256sum] = "f99d2be831ead324712ae4f11868e07e545272f10aac4186060f1386f2629b38"
 
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
1.7.7.6



