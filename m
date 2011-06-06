Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbH-0005lt-Vc
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7608978"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:07 -0700
Message-Id: <6d663a8974d2f6730b481a535ee50aeebd28d757.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/20] autoconf: upgrade from 2.65 to 2.68
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

And rebase the patches to the newer code.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../{autoconf-2.65 => autoconf}/autoconf-x.patch   |    0
 .../autoheader-nonfatal-warnings.patch             |    0
 .../autoreconf-exclude.patch                       |    0
 .../autoreconf-foreign.patch                       |    0
 .../autoreconf-gnuconfigize.patch                  |    0
 .../autoreconf-include.patch                       |    0
 .../{autoconf-2.65 => autoconf}/config_site.patch  |   19 ++++++++++++++-----
 .../fix_path_xtra.patch                            |   14 +++++++-------
 .../path_prog_fixes.patch                          |    0
 .../program_prefix.patch                           |    0
 .../{autoconf_2.65.bb => autoconf_2.68.bb}         |    6 +++---
 11 files changed, 24 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoconf-x.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoheader-nonfatal-warnings.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-exclude.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-foreign.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-gnuconfigize.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-include.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/config_site.patch (60%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/fix_path_xtra.patch (90%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/path_prog_fixes.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/program_prefix.patch (100%)
 rename meta/recipes-devtools/autoconf/{autoconf_2.65.bb => autoconf_2.68.bb} (85%)

diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/autoconf-x.patch b/meta/recipes-devtools/autoconf/autoconf/autoconf-x.patch
similarity index 100%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/autoconf-x.patch
rename to meta/recipes-devtools/autoconf/autoconf/autoconf-x.patch
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/autoheader-nonfatal-warnings.patch b/meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch
similarity index 100%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/autoheader-nonfatal-warnings.patch
rename to meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/autoreconf-exclude.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
similarity index 100%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/autoreconf-exclude.patch
rename to meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/autoreconf-foreign.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
similarity index 100%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/autoreconf-foreign.patch
rename to meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/autoreconf-gnuconfigize.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-gnuconfigize.patch
similarity index 100%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/autoreconf-gnuconfigize.patch
rename to meta/recipes-devtools/autoconf/autoconf/autoreconf-gnuconfigize.patch
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/autoreconf-include.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-include.patch
similarity index 100%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/autoreconf-include.patch
rename to meta/recipes-devtools/autoconf/autoconf/autoreconf-include.patch
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/config_site.patch b/meta/recipes-devtools/autoconf/autoconf/config_site.patch
similarity index 60%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/config_site.patch
rename to meta/recipes-devtools/autoconf/autoconf/config_site.patch
index e3ff318..9f04440 100644
--- a/meta/recipes-devtools/autoconf/autoconf-2.65/config_site.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/config_site.patch
@@ -6,17 +6,26 @@ them.
 
 RP 1/2/10
 
-Index: autoconf-2.65/lib/autoconf/general.m4
+Updated for 2.68 version: the CONFIG_SITE var was not getting used at all
+fixed the 2.68 code 
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/27
+
+Index: autoconf-2.68/lib/autoconf/general.m4
 ===================================================================
---- autoconf-2.65.orig/lib/autoconf/general.m4	2010-02-01 12:41:32.329073138 +0000
-+++ autoconf-2.65/lib/autoconf/general.m4	2010-02-01 12:41:56.769040799 +0000
-@@ -1863,17 +1863,10 @@
+--- autoconf-2.68.orig/lib/autoconf/general.m4
++++ autoconf-2.68/lib/autoconf/general.m4
+@@ -1878,7 +1878,6 @@ AU_DEFUN([AC_VALIDATE_CACHED_SYSTEM_TUPL
  m4_define([AC_SITE_LOAD],
  [# Prefer an explicitly selected file to automatically selected ones.
  ac_site_file1=NONE
 -ac_site_file2=NONE
  if test -n "$CONFIG_SITE"; then
-   ac_site_file1=$CONFIG_SITE
+   # We do not want a PATH search for config.site.
+   case $CONFIG_SITE in @%:@((
+@@ -1886,14 +1885,8 @@ if test -n "$CONFIG_SITE"; then
+     */*) ac_site_file1=$CONFIG_SITE;;
+     *)   ac_site_file1=./$CONFIG_SITE;;
+   esac
 -elif test "x$prefix" != xNONE; then
 -  ac_site_file1=$prefix/share/config.site
 -  ac_site_file2=$prefix/etc/config.site
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/fix_path_xtra.patch b/meta/recipes-devtools/autoconf/autoconf/fix_path_xtra.patch
similarity index 90%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/fix_path_xtra.patch
rename to meta/recipes-devtools/autoconf/autoconf/fix_path_xtra.patch
index 29fe6a2..65df88f 100644
--- a/meta/recipes-devtools/autoconf/autoconf-2.65/fix_path_xtra.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/fix_path_xtra.patch
@@ -6,11 +6,11 @@ This patch removes them to stop any confusion.
 
 RP - 20071115
 
-Index: autoconf-2.65/lib/autoconf/libs.m4
+Index: autoconf-2.68/lib/autoconf/libs.m4
 ===================================================================
---- autoconf-2.65.orig/lib/autoconf/libs.m4	2009-10-29 01:53:41.000000000 +0000
-+++ autoconf-2.65/lib/autoconf/libs.m4	2010-01-29 13:40:13.000000000 +0000
-@@ -159,53 +159,6 @@
+--- autoconf-2.68.orig/lib/autoconf/libs.m4
++++ autoconf-2.68/lib/autoconf/libs.m4
+@@ -159,53 +159,6 @@ m4_popdef([AC_Lib_Name])dnl
  # --------------------- #
  
  
@@ -32,7 +32,7 @@ Index: autoconf-2.65/lib/autoconf/libs.m4
 -	@echo libdir='${LIBDIR}'
 -_ACEOF
 -  if (export CC; ${XMKMF-xmkmf}) >/dev/null 2>/dev/null && test -f Makefile; then
--    # GNU make sometimes prints "make[1]: Entering...", which would confuse us.
+-    # GNU make sometimes prints "make[1]: Entering ...", which would confuse us.
 -    for ac_var in incroot usrlibdir libdir; do
 -      eval "ac_im_$ac_var=\`\${MAKE-make} $ac_var 2>/dev/null | sed -n 's/^$ac_var=//p'\`"
 -    done
@@ -64,7 +64,7 @@ Index: autoconf-2.65/lib/autoconf/libs.m4
  # _AC_PATH_X_DIRECT
  # -----------------
  # Internal subroutine of _AC_PATH_X.
-@@ -213,44 +166,7 @@
+@@ -213,44 +166,7 @@ fi
  m4_define([_AC_PATH_X_DIRECT],
  [# Standard set of common directories for X headers.
  # Check X11 before X11Rn because it is often a symlink to the current release.
@@ -110,7 +110,7 @@ Index: autoconf-2.65/lib/autoconf/libs.m4
  
  if test "$ac_x_includes" = no; then
    # Guess where to find include files, by looking for Xlib.h.
-@@ -299,7 +215,6 @@
+@@ -299,7 +215,6 @@ AC_DEFUN([_AC_PATH_X],
  [AC_CACHE_VAL(ac_cv_have_x,
  [# One or both of the vars are not set, and there is no cached value.
  ac_x_includes=no ac_x_libraries=no
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/path_prog_fixes.patch b/meta/recipes-devtools/autoconf/autoconf/path_prog_fixes.patch
similarity index 100%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/path_prog_fixes.patch
rename to meta/recipes-devtools/autoconf/autoconf/path_prog_fixes.patch
diff --git a/meta/recipes-devtools/autoconf/autoconf-2.65/program_prefix.patch b/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
similarity index 100%
rename from meta/recipes-devtools/autoconf/autoconf-2.65/program_prefix.patch
rename to meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.65.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
similarity index 85%
rename from meta/recipes-devtools/autoconf/autoconf_2.65.bb
rename to meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 0bc615e..c647a15 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.65.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r2"
+PR = "r0"
 
 PARALLEL_MAKE = ""
 
@@ -17,8 +17,8 @@ SRC_URI += "file://autoreconf-include.patch;patch=1 \
 	   ${@['file://path_prog_fixes.patch;patch=1', ''][bb.data.inherits_class('native', d)]} \
            file://config_site.patch;patch=1"
 
-SRC_URI[md5sum] = "a6de1cc6434cd64038b0a0ae4e252b33"
-SRC_URI[sha256sum] = "db11944057f3faf229ff5d6ce3fcd819f565455c152b72cec17ebc1cbb80136b"
+SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
+SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e571454332c8"
 
 DEPENDS_virtclass-native = "m4-native gnu-config-native"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
-- 
1.7.3.4



