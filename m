Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrU-0004tp-R7
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:41 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752324"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:32 -0800
Message-Id: <98c3b4f912fdd7d436f2c3230d2983ad256a151d.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 106/113] texinfo: fix gettext patch
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../texinfo/texinfo-4.13a/gettext-macros.patch     |   27 ++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    2 +-
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch
index 0a2e491..6adeba5 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch
@@ -3,6 +3,7 @@ Bump gettext macro numbers as required by newer gettext built by OE.
 Upstream-Status: Pending
 
 Signed-off-by: Joshua Lock <josh@linux.intel.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Index: texinfo-4.13/configure.ac
 ===================================================================
@@ -32,3 +33,29 @@ Index: texinfo-4.13/po/Makefile.in.in
  
  PACKAGE = @PACKAGE@
  VERSION = @VERSION@
+Index: texinfo-4.13/gnulib/m4/gnulib-comp.m4
+===================================================================
+--- texinfo-4.13.orig/gnulib/m4/gnulib-comp.m4
++++ texinfo-4.13/gnulib/m4/gnulib-comp.m4
+@@ -56,7 +56,7 @@ AC_DEFUN([gl_INIT],
+   gl_EXITFAIL
+   gl_GETOPT
+   dnl you must add AM_GNU_GETTEXT([external]) or similar to configure.ac.
+-  AM_GNU_GETTEXT_VERSION([0.17])
++  AM_GNU_GETTEXT_VERSION([0.18])
+   AC_SUBST([LIBINTL])
+   AC_SUBST([LTLIBINTL])
+   gl_FUNC_GETTIMEOFDAY
+Index: texinfo-4.13/gnulib/m4/po.m4
+===================================================================
+--- texinfo-4.13.orig/gnulib/m4/po.m4
++++ texinfo-4.13/gnulib/m4/po.m4
+@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
+ 
+   dnl Release version of the gettext macros. This is used to ensure that
+   dnl the gettext macros and po/Makefile.in.in are in sync.
+-  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
++  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
+ 
+   dnl Perform the following tests also if --disable-nls has been given,
+   dnl because they are needed for "make dist" to work.
diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index f205d4e..8ee5616 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/texinfo/"
 SECTION = "console/utils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "zlib ncurses texinfo-native"
 DEPENDS_virtclass-native = "zlib-native ncurses-native"
-- 
1.7.6.4



