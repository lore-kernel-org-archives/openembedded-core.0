Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7p-0000AM-44
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:31:21 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453931"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:21:03 -0700
Message-Id: <c5a3097cc2507d3fe49f113684912d4804ed02bd.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/19] gcc-package-target: add libexec for plugins
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
X-List-Received-Date: Mon, 30 Apr 2012 22:31:21 -0000

Fixes:

ERROR: For recipe gcc, the following files/directories were installed but not shipped in any package:
ERROR:   /usr/libexec/gcc/i586-poky-linux/4.7.1/plugin/gengtype
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc |   11 ++++-------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 784a3be..8adeb8d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r0"
+PR = "r1"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.0
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index d58e001..392dfc4 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -1,5 +1,5 @@
 PACKAGES = "\
-  ${PN} ${PN}-plugins ${PN}-symlinks \
+  ${PN} ${PN}-symlinks \
   g++ g++-symlinks \
   cpp cpp-symlinks \
   g77 g77-symlinks \
@@ -36,20 +36,17 @@ FILES_${PN}-dev = "\
 "
 FILES_${PN}-plugin-dev = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gengtype \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
 "
+ALLOW_EMPTY_${PN}-plugin-dev = "1"
+
 FILES_${PN}-symlinks = "\
   ${bindir}/cc \
   ${bindir}/gcc \
   ${bindir}/gccbug \
 "
 
-FILES_${PN}-plugins = "\
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
-"
-ALLOW_EMPTY_${PN}-plugins = "1"
-
 FILES_g77 = "\
   ${bindir}/${TARGET_PREFIX}g77 \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
-- 
1.7.7.6



