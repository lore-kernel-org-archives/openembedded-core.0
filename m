Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS2xG-0006YD-NA
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:08:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 01:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5775225"
Received: from unknown (HELO swold-MOBL.nomadix.com) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 01:05:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 01:05:03 -0700
Message-Id: <65cfe32631413a8eb52cb12667a6b649157b2bb0.1307001679.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/12] gettext-0.16.1: mark upstream status for gplv2 recipe's patches
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
X-List-Received-Date: Thu, 02 Jun 2011 08:08:36 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../gettext/gettext-0.16.1/disable_java.patch      |    3 ++-
 .../gettext-0.16.1/fix_aclocal_version.patch       |    1 +
 .../gettext-0.16.1/fix_gnu_source_circular.patch   |    3 ++-
 .../gettext/gettext-0.16.1/fixchicken.patch        |    3 ++-
 .../gettext/gettext-0.16.1/getline.m4.patch        |    3 ++-
 .../gettext-autoconf-lib-link-no-L.patch           |    3 ++-
 .../gettext-error_print_progname.patch             |    3 ++-
 .../gettext/gettext-0.16.1/gettext-vpath.patch     |    3 ++-
 .../gettext-0.16.1/hardcode_macro_version.patch    |    3 ++-
 .../gettext/gettext-0.16.1/linklib_from_0.17.patch |    3 ++-
 10 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch b/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
index 2f8478a..e4c5f15 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/disable_java.patch
@@ -1,8 +1,9 @@
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
 
-Upstream-Status: Inappropriate [embedded]
+Upstream-Status: Inappropriate [licensing]
 
 Index: gettext-0.16.1/gettext-tools/configure.ac
 ===================================================================
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
index 8fe7712..7293f5b 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_aclocal_version.patch
@@ -1,3 +1,4 @@
+
 This patch updates the required version number from 2.61 to the 
 current 2.65 version of aclocal, this will need to be updated 
 when we update aclocal
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
index d1c0bbb..0686149 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fix_gnu_source_circular.patch
@@ -1,9 +1,10 @@
+
 This patch removes the circular dependency on AC_GNU_SOURCE in
 AC_USE_SYSTEM_EXTENSIONS.
 
 Thanks to Mark Hatle for the timely pointers and fixes.
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [licensing]
 
 Signed-off-by Saul Wold <sgw@linux.intel.com>
 
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch b/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
index d6bb7b0..36ce463 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/fixchicken.patch
@@ -1,8 +1,9 @@
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
 
-Upstream-Status: Inappropriate [embedded]
+Upstream-Status: Inappropriate [licensing]
 
 Index: gettext-tools/m4/csharpcomp.m4
 ===================================================================
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch b/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
index 34965fc..bf995bc 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/getline.m4.patch
@@ -1,8 +1,9 @@
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [licensing]
 
 --- /gettext-tools/m4/orig-getline.m4	2003-07-18 18:11:37.000000000 +0300
 +++ /gettext-tools/m4/getline.m4	2007-02-03 13:33:41.000000000 +0200
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
index 82775d6..072fe5f 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-autoconf-lib-link-no-L.patch
@@ -1,8 +1,9 @@
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [licensing]
 
 --- gettext-0.17/autoconf-lib-link/m4/lib-link.m4~	2009-04-17 15:12:30.000000000 -0700
 +++ gettext-0.17/autoconf-lib-link/m4/lib-link.m4	2009-04-17 15:37:39.000000000 -0700
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
index abb7195..93d9194 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
@@ -1,8 +1,9 @@
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [licensing]
 
 diff -ur gettext-0.14.6/gettext-tools/lib/error.h gettext-0.14.6-patched/gettext-tools/lib/error.h
 --- gettext-0.14.6/gettext-tools/lib/error.h	2005-05-20 16:03:42.000000000 -0500
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
index 67b0a5a..f09e450 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/gettext-vpath.patch
@@ -1,8 +1,9 @@
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [licensing]
 
 Index: gettext-0.16.1/gettext-runtime/intl/Makefile.in
 ===================================================================
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch b/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
index 82ed04d..4da8dd4 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/hardcode_macro_version.patch
@@ -1,8 +1,9 @@
+
 This patch hardcodes in version 0.17 for the GETTEXT_MACRO_VERSION,
 the version check is only part of 0.17 and will not affect any 0.16.1
 operations
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [licensing]
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
diff --git a/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch b/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
index 3cbe867..d921069 100644
--- a/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
+++ b/meta/recipes-core/gettext/gettext-0.16.1/linklib_from_0.17.patch
@@ -1,8 +1,9 @@
+
 # Pulled from OpenEmbedded
 # 
 # Commented by: Saul Wold <saul.wold@intel.com>
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [licensing]
 
 Index: gettext-0.16.1/autoconf-lib-link/m4/lib-link.m4
 ===================================================================
-- 
1.7.3.4



