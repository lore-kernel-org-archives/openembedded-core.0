Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 238FA758DA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 20:40:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2015 13:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,583,1427785200"; d="scan'208";a="708154373"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2015 13:40:53 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 12:36:52 +0000
Message-Id: <85cde0f4eec2458367d6a92706890b876ff8ee0b.1433852999.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1433852999.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1433852999.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2] libgpg-error: Upgrade 1.18 -> 1.19
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jun 2015 20:41:02 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The patch pkgconfig.patch has not being integrated into upstream
repository, so rebasing it. Another change occurred inside the recipe,
the TUPLE's name changed for i586/i686 target architectures.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../libgpg-error/libgpg-error/pkgconfig.patch      | 45 +++++++++++-----------
 .../{libgpg-error_1.18.bb => libgpg-error_1.19.bb} |  6 +--
 2 files changed, 26 insertions(+), 25 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.18.bb => libgpg-error_1.19.bb} (89%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 96476ba..9ffeedb 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -9,9 +9,9 @@ Index: libgpg-error-1.17/configure.ac
 ===================================================================
 --- libgpg-error-1.17.orig/configure.ac
 +++ libgpg-error-1.17/configure.ac
-@@ -521,6 +521,7 @@ AC_CONFIG_FILES([src/Makefile tests/Make
+@@ -529,6 +529,7 @@ AC_CONFIG_FILES([src/Makefile tests/Make
  AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpg-error.asd])
- AC_CONFIG_FILES([src/versioninfo.rc])
+ AC_CONFIG_FILES([src/versioninfo.rc src/gpg-error.w32-manifest])
  AC_CONFIG_FILES([src/gpg-error-config], [chmod +x src/gpg-error-config])
 +AC_CONFIG_FILES([src/gpg-error.pc])
  
@@ -21,7 +21,7 @@ Index: libgpg-error-1.17/src/Makefile.am
 ===================================================================
 --- libgpg-error-1.17.orig/src/Makefile.am
 +++ libgpg-error-1.17/src/Makefile.am
-@@ -74,13 +74,15 @@ nodist_include_HEADERS = gpg-error.h
+@@ -75,6 +75,8 @@ nodist_include_HEADERS = gpg-error.h
  bin_SCRIPTS = gpg-error-config
  m4datadir = $(datadir)/aclocal
  m4data_DATA = gpg-error.m4
@@ -30,30 +30,15 @@ Index: libgpg-error-1.17/src/Makefile.am
  
  EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
  	mkerrnos.awk errnos.in README \
- 	mkerrcodes.awk mkerrcodes1.awk mkerrcodes2.awk mkerrcodes.c \
+@@ -82,7 +84,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.
  	mkheader.c gpg-error.h.in mkw32errmap.c w32-add.h w32ce-add.h \
  	err-sources.h err-codes.h gpg-error-config.in gpg-error.m4 \
--	gpg-error.vers gpg-error.def.in versioninfo.rc.in \
-+	gpg-error.vers gpg-error.def.in versioninfo.rc.in gpg-error.pc \
+ 	gpg-error.vers gpg-error.def.in \
+-        versioninfo.rc.in gpg-error.w32-manifest.in \
++        versioninfo.rc.in gpg-error.w32-manifest.in gpg-error.pc \
  	$(lock_obj_pub)
  
  BUILT_SOURCES = err-sources.h err-codes.h code-to-errno.h code-from-errno.h \
-Index: libgpg-error-1.17/src/gpg-error.pc.in
-===================================================================
---- /dev/null
-+++ libgpg-error-1.17/src/gpg-error.pc.in
-@@ -0,0 +1,11 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+host=@GPG_ERROR_CONFIG_HOST@
-+
-+Name: gpg-error
-+Description: a library that defines common error values for all GnuPG components
-+Version: @VERSION@
-+Libs: -L${libdir} -lgpg-error
-+Cflags: -I${includedir}
 Index: libgpg-error-1.17/src/gpg-error.m4
 ===================================================================
 --- libgpg-error-1.17.orig/src/gpg-error.m4
@@ -147,3 +132,19 @@ Index: libgpg-error-1.17/src/gpg-error.m4
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(GPG_ERROR_CFLAGS)
+Index: libgpg-error-1.17/src/gpg-error.pc.in
+===================================================================
+--- /dev/null
++++ libgpg-error-1.17/src/gpg-error.pc.in
+@@ -0,0 +1,11 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++host=@GPG_ERROR_CONFIG_HOST@
++
++Name: gpg-error
++Description: a library that defines common error values for all GnuPG components
++Version: @VERSION@
++Libs: -L${libdir} -lgpg-error
++Cflags: -I${includedir}
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
similarity index 89%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
index c9a47a3..39dbbcf 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
@@ -13,8 +13,8 @@ SECTION = "libs"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch"
-SRC_URI[md5sum] = "12312802d2065774b787cbfc22cc04e9"
-SRC_URI[sha256sum] = "9ff1d6e61d4cef7c1d0607ceef6d40dc33f3da7a3094170c3718c00153d80810"
+SRC_URI[md5sum] = "c04c16245b92829281f43b5bef7d16da"
+SRC_URI[sha256sum] = "53120e1333d5c5d28d87ff2854e9e98719c8e214152f17ad5291704d25c4978b"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
@@ -30,7 +30,7 @@ do_compile_prepend() {
 	  aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
 	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
 	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
-	  i586|i686)  TUPLE=i486-pc-linux-gnu ;;
+	  i586|i686)  TUPLE=i686-pc-linux-gnu ;;
 	  mips64el)   TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips64)     TUPLE=mips-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
-- 
1.8.4.5


