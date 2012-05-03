Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iN-0001nM-WC
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065361"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:26 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:13 -0700
Message-Id: <86903161b7e85de0c18d15bd59d31e0b0565e653.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 19/28] findutils: fix build with automake 1.12
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
X-List-Received-Date: Thu, 03 May 2012 18:25:21 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../findutils_fix_for_automake-1.12.patch          |   22 ++++++++++++++++++++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    6 +++-
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..d4a7e95
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| configure.ac:80: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: findutils-4.4.2/configure.ac
+===================================================================
+--- findutils-4.4.2.orig/configure.ac
++++ findutils-4.4.2/configure.ac
+@@ -77,8 +77,6 @@ AC_PROG_CPP
+ dnl for gnulib
+ gl_EARLY
+ 
+-AM_C_PROTOTYPES
+-
+ AC_PROG_INSTALL
+ AC_PROG_RANLIB
+ dnl AC_PROG_LIBTOOL
diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
index d80511c..127eb4b 100644
--- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
+++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
@@ -1,11 +1,13 @@
 require findutils.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://01-27017.patch \
             file://02-28824.patch \
             file://03-28872.patch \
-            file://findutils_fix_for_x32.patch "
+            file://findutils_fix_for_x32.patch \
+            file://findutils_fix_for_automake-1.12.patch \
+            "
 
 SRC_URI[md5sum] = "351cc4adb07d54877fa15f75fb77d39f"
 SRC_URI[sha256sum] = "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd702b62a"
-- 
1.7.7



