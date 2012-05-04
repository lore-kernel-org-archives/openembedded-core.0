Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF0-0000V8-5I
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486028"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:22 -0700
Message-Id: <d79e89e22e289b68d2794cc8a8bf8493efadc917.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 16/40] findutils: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:42 -0000

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



