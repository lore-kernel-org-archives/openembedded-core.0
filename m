Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQEv-0000Rd-Lu
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486014"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:10 -0700
Message-Id: <9ad01f7e2b64eb00815b7ecf74d4dd25e3411323.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 04/40] popt: fix build with automake 1.12
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
X-List-Received-Date: Fri, 04 May 2012 21:40:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../popt/popt/popt_fix_for_automake-1.12.patch     |   21 ++++++++++++++++++++
 meta/recipes-support/popt/popt_1.16.bb             |    3 +-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch

diff --git a/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch b/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..91bca96
--- /dev/null
+++ b/meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
@@ -0,0 +1,21 @@
+Upstream-Status: pending
+
+This patch avoids this error with automake 1.12:
+
+| configure.ac:49: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: popt-1.16/configure.ac
+===================================================================
+--- popt-1.16.orig/configure.ac
++++ popt-1.16/configure.ac
+@@ -46,7 +46,6 @@ AC_GCC_TRADITIONAL
+ AC_SYS_LARGEFILE
+ 
+ AC_ISC_POSIX
+-AM_C_PROTOTYPES
+ 
+ AC_CHECK_HEADERS(float.h fnmatch.h glob.h langinfo.h libintl.h mcheck.h unistd.h)
+ 
diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index cd22e9a..91b0d60 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -4,10 +4,11 @@ SECTION = "libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
+           file://popt_fix_for_automake-1.12.patch \
           "
 
 SRC_URI[md5sum] = "3743beefa3dd6247a73f8f7a32c14c33"
-- 
1.7.7



