Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOF-000867-C9
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115419"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:51 -0700
Message-Id: <3594d97a69d3e536df4b89b7871b969a7f935666.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 12/45] popt: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:52:48 -0000

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
1.7.7.6



