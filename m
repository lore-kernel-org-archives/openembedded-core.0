Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5705A73CC9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:07 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so26764404igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=42cqQQvWCZnEHWb7jTgSB2X+eOfwlThPJOBoO4/SkwE=;
	b=N7tnx51HYZjbY2iMoYq7h1UqDW3ly2NMfj99gHTo/Bp5UCQqay6cZOLAN90MVh8uMQ
	ZJ/0H0FZe0txmC8cOKgZje0drbAyjceiahfDtaF2qBHzBl4U5gp1ZK/pAzHyEN+DFsQ+
	Aj9/QTsRtuZvVEIehzNnwUBivPiyF0Lm2x8p1Af0mSISoJEoqea9LvtvpPBwsazymGMH
	qS9RodEQ8IbEAjlmUDxEvPxmcXwvzS/wkkoOD1EkG2eNi/GsThxXTae8/YBosmlyIGZs
	2+zTs0rkTOMWJ0eLhJo6VCHsHpWXhYRL+ma+2OCvxFfiN0ItUUuyWDcPdoE7Rchiv1Am
	byEw==
X-Received: by 10.50.79.197 with SMTP id l5mr48877357igx.39.1428341828626;
	Mon, 06 Apr 2015 10:37:08 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:37 +0000
Message-Id: <8ebcff1cccf99e4b7e23cc403e873c4cfacc8a95.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 09/24] gcc-4.8: Upgrade 4.8.2 -> 4.8.4
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:07 -0000

Drop already applied patches
This fixes random ICE seen on mips with large c++ files ( webkit )
Then there are several backports

Change-Id: Ie1c3acda2fda1b6cbd356416c860938f6cbd758e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  13 +-
 .../0016-gcc-poison-system-directories.patch       |  95 +++++++--------
 .../gcc/gcc-4.8/0019-64-bit-multilib-hack.patch    |  41 +++----
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 101 ++++++++--------
 .../gcc/gcc-4.8/0038-gcc-4.8-build-args.patch      |  63 ++++++----
 .../gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch         |  23 ----
 .../0045-gcc-4.8-PR57717-PowerPC-E500v2.patch      |  21 ----
 .../0048-PR58854_fix_arm_apcs_epilogue.patch       |  23 ----
 .../gcc/gcc-4.8/0050-PR-target-58595.patch         | 132 ---------------------
 .../gcc-4.8/0052-PR-rtl-optimization-61801.patch   |  36 ------
 10 files changed, 164 insertions(+), 384 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 06e6982..476aaf9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "4.8.2"
+PV = "4.8.4"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "4.8.2"
+BINV = "4.8.4"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-4.8:"
 
@@ -60,23 +60,18 @@ SRC_URI = "\
     file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
     file://0035-wcast-qual-PR-55383.patch \
     file://0038-gcc-4.8-build-args.patch \
-    file://0039-gcc-4.8-PR57717.patch \
     file://0040-fix-g++-sysroot.patch \
     file://0041-libtool-avoid-libdir.patch \
     file://0042-pr57748.patch \
     file://0043-cpp.patch \
     file://0044-gengtypes.patch \
-    file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
     file://0046-libatomic-deptracking.patch \
     file://0047-repomembug.patch \
-    file://0048-PR58854_fix_arm_apcs_epilogue.patch \
     file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
-    file://0050-PR-target-58595.patch \
-    file://0052-PR-rtl-optimization-61801.patch \
     file://target-gcc-includedir.patch \
 "
-SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
-SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
+SRC_URI[md5sum] = "5a84a30839b2aca22a2d723de2a626ec"
+SRC_URI[sha256sum] = "4a80aa23798b8e9b5793494b8c976b39b8d9aa2e53cd5ed5534aff662a7f8695"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.patch
index 1e2a9e1..c955e49 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0016-gcc-poison-system-directories.patch
@@ -17,11 +17,11 @@ Upstream-Status: Inappropriate [distribution: codesourcery]
  gcc/incpath.c       |   19 +++++++++++++++++++
  8 files changed, 69 insertions(+), 3 deletions(-)
 
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 54ea04f..90a2bba 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -2018,7 +2018,7 @@ attribs.o : attribs.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) $(TREE_H) \
+Index: gcc-4.8.4/gcc/Makefile.in
+===================================================================
+--- gcc-4.8.4.orig/gcc/Makefile.in
++++ gcc-4.8.4/gcc/Makefile.in
+@@ -2019,7 +2019,7 @@ attribs.o : attribs.c $(CONFIG_H) $(SYST
  
  incpath.o: incpath.c incpath.h $(CONFIG_H) $(SYSTEM_H) $(CPPLIB_H) \
  		intl.h prefix.h coretypes.h $(TM_H) cppdefault.h $(TARGET_H) \
@@ -30,10 +30,10 @@ index 54ea04f..90a2bba 100644
  
  CFLAGS-prefix.o += -DPREFIX=\"$(prefix)\" -DBASEVER=$(BASEVER_s)
  prefix.o: prefix.c $(CONFIG_H) $(SYSTEM_H) coretypes.h prefix.h \
-diff --git a/gcc/common.opt b/gcc/common.opt
-index bdbd3b6..ab86b00 100644
---- a/gcc/common.opt
-+++ b/gcc/common.opt
+Index: gcc-4.8.4/gcc/common.opt
+===================================================================
+--- gcc-4.8.4.orig/gcc/common.opt
++++ gcc-4.8.4/gcc/common.opt
 @@ -595,6 +595,10 @@ Wpedantic
  Common Var(pedantic) Warning
  Issue warnings needed for strict compliance to the standard
@@ -45,10 +45,10 @@ index bdbd3b6..ab86b00 100644
  Wshadow
  Common Var(warn_shadow) Warning
  Warn when one local variable shadows another
-diff --git a/gcc/config.in b/gcc/config.in
-index d80fb9f..0524af7 100644
---- a/gcc/config.in
-+++ b/gcc/config.in
+Index: gcc-4.8.4/gcc/config.in
+===================================================================
+--- gcc-4.8.4.orig/gcc/config.in
++++ gcc-4.8.4/gcc/config.in
 @@ -138,6 +138,12 @@
  #endif
  
@@ -62,11 +62,11 @@ index d80fb9f..0524af7 100644
  /* Define if you want all operations on RTL (the basic data structure of the
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
-diff --git a/gcc/configure b/gcc/configure
-index 135bbf5..b65d21d 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -917,6 +917,7 @@ with_gc
+Index: gcc-4.8.4/gcc/configure
+===================================================================
+--- gcc-4.8.4.orig/gcc/configure
++++ gcc-4.8.4/gcc/configure
+@@ -918,6 +918,7 @@ with_gc
  with_system_zlib
  enable_maintainer_mode
  enable_version_specific_runtime_libs
@@ -74,7 +74,7 @@ index 135bbf5..b65d21d 100755
  enable_plugin
  enable_libquadmath_support
  with_linker_hash_style
-@@ -1630,6 +1631,8 @@ Optional Features:
+@@ -1639,6 +1640,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -83,25 +83,25 @@ index 135bbf5..b65d21d 100755
    --enable-plugin         enable plugin support
    --disable-libquadmath-support
                            disable libquadmath support for Fortran
-@@ -17828,7 +17831,7 @@ else
+@@ -17847,7 +17850,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 17831 "configure"
-+#line 17834 "configure"
+-#line 17850 "configure"
++#line 17853 "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -17934,7 +17937,7 @@ else
+@@ -17953,7 +17956,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 17937 "configure"
-+#line 17940 "configure"
+-#line 17956 "configure"
++#line 17959 "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -27103,6 +27106,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -27219,6 +27222,19 @@ if test "${enable_version_specific_runti
  fi
  
  
@@ -121,11 +121,11 @@ index 135bbf5..b65d21d 100755
  # Substitute configuration variables
  
  
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 6363a21..e226b85 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -5063,6 +5063,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+Index: gcc-4.8.4/gcc/configure.ac
+===================================================================
+--- gcc-4.8.4.orig/gcc/configure.ac
++++ gcc-4.8.4/gcc/configure.ac
+@@ -5120,6 +5120,16 @@ AC_ARG_ENABLE(version-specific-runtime-l
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -142,10 +142,10 @@ index 6363a21..e226b85 100644
  # Substitute configuration variables
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 9273d7d..a022622 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
+Index: gcc-4.8.4/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4.8.4.orig/gcc/doc/invoke.texi
++++ gcc-4.8.4/gcc/doc/invoke.texi
 @@ -258,6 +258,7 @@ Objective-C and Objective-C++ Dialects}.
  -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
  -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
@@ -154,7 +154,7 @@ index 9273d7d..a022622 100644
  -Wredundant-decls  -Wno-return-local-addr @gol
  -Wreturn-type  -Wsequence-point  -Wshadow @gol
  -Wsign-compare  -Wsign-conversion  -Wsizeof-pointer-memaccess @gol
-@@ -4007,6 +4008,14 @@ headers---for that, @option{-Wunknown-pragmas} must also be used.
+@@ -4022,6 +4023,14 @@ headers---for that, @option{-Wunknown-pr
   for most targets, it is made up of code and thus requires the stack
   to be made executable in order for the program to work properly.
  
@@ -169,11 +169,11 @@ index 9273d7d..a022622 100644
  @item -Wfloat-equal
  @opindex Wfloat-equal
  @opindex Wno-float-equal
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 86077f8..efdb625 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -740,6 +740,8 @@ proper position among the other output files.  */
+Index: gcc-4.8.4/gcc/gcc.c
+===================================================================
+--- gcc-4.8.4.orig/gcc/gcc.c
++++ gcc-4.8.4/gcc/gcc.c
+@@ -741,6 +741,8 @@ proper position among the other output f
     "%{fuse-ld=*:-fuse-ld=%*}\
      %X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}}\
@@ -182,10 +182,10 @@ index 86077f8..efdb625 100644
      %{static:} %{L*} %(mfwrap) %(link_libgcc) " SANITIZER_EARLY_SPEC " %o\
      %{fopenmp|ftree-parallelize-loops=*:%:include(libgomp.spec)%(link_gomp)}\
      %{fgnu-tm:%:include(libitm.spec)%(link_itm)}\
-diff --git a/gcc/incpath.c b/gcc/incpath.c
-index 018da98..cd41c78 100644
---- a/gcc/incpath.c
-+++ b/gcc/incpath.c
+Index: gcc-4.8.4/gcc/incpath.c
+===================================================================
+--- gcc-4.8.4.orig/gcc/incpath.c
++++ gcc-4.8.4/gcc/incpath.c
 @@ -28,6 +28,7 @@
  #include "intl.h"
  #include "incpath.h"
@@ -194,7 +194,7 @@ index 018da98..cd41c78 100644
  
  /* Microsoft Windows does not natively support inodes.
     VMS has non-numeric inodes.  */
-@@ -382,6 +383,24 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+@@ -382,6 +383,24 @@ merge_include_chains (const char *sysroo
  	}
        fprintf (stderr, _("End of search list.\n"));
      }
@@ -219,6 +219,3 @@ index 018da98..cd41c78 100644
  }
  
  /* Use given -I paths for #include "..." but not #include <...>, and
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch
index 51f4dba..a975cfb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0019-64-bit-multilib-hack.patch
@@ -31,10 +31,10 @@ Upstream-Status: Pending
  gcc/config/rs6000/t-linux64 |    5 ++---
  3 files changed, 7 insertions(+), 14 deletions(-)
 
-diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
-index bcea0c6..eb004d7 100644
---- a/gcc/config/i386/t-linux64
-+++ b/gcc/config/i386/t-linux64
+Index: gcc-4.8.4/gcc/config/i386/t-linux64
+===================================================================
+--- gcc-4.8.4.orig/gcc/config/i386/t-linux64
++++ gcc-4.8.4/gcc/config/i386/t-linux64
 @@ -32,7 +32,5 @@
  #
  comma=,
@@ -45,10 +45,10 @@ index bcea0c6..eb004d7 100644
 -MULTILIB_OSDIRNAMES+= mx32=../libx32$(call if_multiarch,:x86_64-linux-gnux32)
 +MULTILIB_DIRNAMES = . .
 +MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
-diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
-index bdbbd4f..16a6366 100644
---- a/gcc/config/mips/t-linux64
-+++ b/gcc/config/mips/t-linux64
+Index: gcc-4.8.4/gcc/config/mips/t-linux64
+===================================================================
+--- gcc-4.8.4.orig/gcc/config/mips/t-linux64
++++ gcc-4.8.4/gcc/config/mips/t-linux64
 @@ -17,10 +17,6 @@
  # <http://www.gnu.org/licenses/>.
  
@@ -63,20 +63,17 @@ index bdbbd4f..16a6366 100644
 +MULTILIB_DIRNAMES = . . .
 +MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 +
-diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
-index 9175de2..3971019 100644
---- a/gcc/config/rs6000/t-linux64
-+++ b/gcc/config/rs6000/t-linux64
+Index: gcc-4.8.4/gcc/config/rs6000/t-linux64
+===================================================================
+--- gcc-4.8.4.orig/gcc/config/rs6000/t-linux64
++++ gcc-4.8.4/gcc/config/rs6000/t-linux64
 @@ -26,7 +26,6 @@
  # MULTILIB_OSDIRNAMES according to what is found on the target.
  
- MULTILIB_OPTIONS        = m64/m32
--MULTILIB_DIRNAMES       = 64 32
-+MULTILIB_DIRNAMES       = . .
- MULTILIB_EXTRA_OPTS     = fPIC
--MULTILIB_OSDIRNAMES	= ../lib64$(call if_multiarch,:powerpc64-linux-gnu)
--MULTILIB_OSDIRNAMES    += $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc-linux-gnu)
-+MULTILIB_OSDIRNAMES    = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
--- 
-1.7.10.4
-
+ MULTILIB_OPTIONS    := m64/m32
+-MULTILIB_DIRNAMES   := 64 32
++MULTILIB_DIRNAMES   := . .
+ MULTILIB_EXTRA_OPTS := 
+-MULTILIB_OSDIRNAMES := m64=../lib64$(call if_multiarch,:powerpc64-linux-gnu)
+-MULTILIB_OSDIRNAMES += m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc-linux-gnu)
++MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 5755da8..0aa6d92 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -29,11 +29,11 @@ Upstream-Status: Inappropriate [OE configuration]
  gcc/config/sparc/linux64.h   |    4 ++--
  11 files changed, 22 insertions(+), 22 deletions(-)
 
-Index: gcc-4.8.2/gcc/config/alpha/linux-elf.h
+Index: gcc-4.8.4/gcc/config/alpha/linux-elf.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/alpha/linux-elf.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/alpha/linux-elf.h	2014-05-06 10:34:51.073657377 +0000
-@@ -23,8 +23,8 @@
+--- gcc-4.8.4.orig/gcc/config/alpha/linux-elf.h
++++ gcc-4.8.4/gcc/config/alpha/linux-elf.h
+@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
  #define EXTRA_SPECS \
  { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
  
@@ -44,10 +44,10 @@ Index: gcc-4.8.2/gcc/config/alpha/linux-elf.h
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
-Index: gcc-4.8.2/gcc/config/arm/linux-eabi.h
+Index: gcc-4.8.4/gcc/config/arm/linux-eabi.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/arm/linux-eabi.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/arm/linux-eabi.h	2014-05-06 10:34:51.077657377 +0000
+--- gcc-4.8.4.orig/gcc/config/arm/linux-eabi.h
++++ gcc-4.8.4/gcc/config/arm/linux-eabi.h
 @@ -68,8 +68,8 @@
     GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
  
@@ -59,10 +59,10 @@ Index: gcc-4.8.2/gcc/config/arm/linux-eabi.h
  #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
  
  #define GLIBC_DYNAMIC_LINKER \
-Index: gcc-4.8.2/gcc/config/arm/linux-elf.h
+Index: gcc-4.8.4/gcc/config/arm/linux-elf.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/arm/linux-elf.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/arm/linux-elf.h	2014-05-06 10:34:51.077657377 +0000
+--- gcc-4.8.4.orig/gcc/config/arm/linux-elf.h
++++ gcc-4.8.4/gcc/config/arm/linux-elf.h
 @@ -57,7 +57,7 @@
  
  #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
@@ -72,21 +72,21 @@ Index: gcc-4.8.2/gcc/config/arm/linux-elf.h
  
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
-Index: gcc-4.8.2/gcc/config/i386/linux.h
+Index: gcc-4.8.4/gcc/config/i386/linux.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/i386/linux.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/i386/linux.h	2014-05-06 10:34:51.077657377 +0000
-@@ -20,4 +20,4 @@
+--- gcc-4.8.4.orig/gcc/config/i386/linux.h
++++ gcc-4.8.4/gcc/config/i386/linux.h
+@@ -20,4 +20,4 @@ along with GCC; see the file COPYING3.
  <http://www.gnu.org/licenses/>.  */
  
  #define GNU_USER_LINK_EMULATION "elf_i386"
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
 +#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
-Index: gcc-4.8.2/gcc/config/i386/linux64.h
+Index: gcc-4.8.4/gcc/config/i386/linux64.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/i386/linux64.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/i386/linux64.h	2014-05-06 10:34:51.077657377 +0000
-@@ -27,6 +27,6 @@
+--- gcc-4.8.4.orig/gcc/config/i386/linux64.h
++++ gcc-4.8.4/gcc/config/i386/linux64.h
+@@ -27,6 +27,6 @@ see the files COPYING3 and COPYING.RUNTI
  #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
  #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
  
@@ -96,21 +96,21 @@ Index: gcc-4.8.2/gcc/config/i386/linux64.h
 +#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
 +#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
 +#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
-Index: gcc-4.8.2/gcc/config/mips/linux.h
+Index: gcc-4.8.4/gcc/config/mips/linux.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/mips/linux.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/mips/linux.h	2014-05-06 10:34:51.077657377 +0000
-@@ -17,4 +17,4 @@
+--- gcc-4.8.4.orig/gcc/config/mips/linux.h
++++ gcc-4.8.4/gcc/config/mips/linux.h
+@@ -17,4 +17,4 @@ You should have received a copy of the G
  along with GCC; see the file COPYING3.  If not see
  <http://www.gnu.org/licenses/>.  */
  
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
 +#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
-Index: gcc-4.8.2/gcc/config/mips/linux64.h
+Index: gcc-4.8.4/gcc/config/mips/linux64.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/mips/linux64.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/mips/linux64.h	2014-05-06 10:34:51.077657377 +0000
-@@ -22,10 +22,10 @@
+--- gcc-4.8.4.orig/gcc/config/mips/linux64.h
++++ gcc-4.8.4/gcc/config/mips/linux64.h
+@@ -22,10 +22,10 @@ along with GCC; see the file COPYING3.
  #define GNU_USER_LINK_EMULATION64 "elf64%{EB:b}%{EL:l}tsmip"
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
  
@@ -125,30 +125,33 @@ Index: gcc-4.8.2/gcc/config/mips/linux64.h
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
    CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
-Index: gcc-4.8.2/gcc/config/rs6000/linux64.h
+Index: gcc-4.8.4/gcc/config/rs6000/linux64.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/rs6000/linux64.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/rs6000/linux64.h	2014-05-06 10:34:51.077657377 +0000
-@@ -350,10 +350,10 @@
+--- gcc-4.8.4.orig/gcc/config/rs6000/linux64.h
++++ gcc-4.8.4/gcc/config/rs6000/linux64.h
+@@ -366,14 +366,14 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
 -#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
--#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld64.so.1"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
+ #ifdef LINUX64_DEFAULT_ABI_ELFv2
+ #define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv1:/lib64/ld64.so.1;:/lib64/ld64.so.2}"
+ #else
+ #define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv2:/lib64/ld64.so.2;:/lib64/ld64.so.1}"
+ #endif
 -#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
 -#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
-+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
 +#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
 +#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
-Index: gcc-4.8.2/gcc/config/sh/linux.h
+Index: gcc-4.8.4/gcc/config/sh/linux.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/sh/linux.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/sh/linux.h	2014-05-06 10:34:51.077657377 +0000
-@@ -43,7 +43,7 @@
+--- gcc-4.8.4.orig/gcc/config/sh/linux.h
++++ gcc-4.8.4/gcc/config/sh/linux.h
+@@ -43,7 +43,7 @@ along with GCC; see the file COPYING3.
  
  #define TARGET_ASM_FILE_END file_end_indicate_exec_stack
  
@@ -157,11 +160,11 @@ Index: gcc-4.8.2/gcc/config/sh/linux.h
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
-Index: gcc-4.8.2/gcc/config/sparc/linux.h
+Index: gcc-4.8.4/gcc/config/sparc/linux.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/sparc/linux.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/sparc/linux.h	2014-05-06 10:34:51.077657377 +0000
-@@ -83,7 +83,7 @@
+--- gcc-4.8.4.orig/gcc/config/sparc/linux.h
++++ gcc-4.8.4/gcc/config/sparc/linux.h
+@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -170,11 +173,11 @@ Index: gcc-4.8.2/gcc/config/sparc/linux.h
  
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-Index: gcc-4.8.2/gcc/config/sparc/linux64.h
+Index: gcc-4.8.4/gcc/config/sparc/linux64.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/sparc/linux64.h	2014-05-06 10:34:51.081657377 +0000
-+++ gcc-4.8.2/gcc/config/sparc/linux64.h	2014-05-06 10:34:51.077657377 +0000
-@@ -92,8 +92,8 @@
+--- gcc-4.8.4.orig/gcc/config/sparc/linux64.h
++++ gcc-4.8.4/gcc/config/sparc/linux64.h
+@@ -92,8 +92,8 @@ along with GCC; see the file COPYING3.
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -185,11 +188,11 @@ Index: gcc-4.8.2/gcc/config/sparc/linux64.h
  
  #ifdef SPARC_BI_ARCH
  
-Index: gcc-4.8.2/gcc/config/linux.h
+Index: gcc-4.8.4/gcc/config/linux.h
 ===================================================================
---- gcc-4.8.2.orig/gcc/config/linux.h	2013-01-10 20:38:27.000000000 +0000
-+++ gcc-4.8.2/gcc/config/linux.h	2014-05-06 10:36:26.549656893 +0000
-@@ -73,10 +73,10 @@
+--- gcc-4.8.4.orig/gcc/config/linux.h
++++ gcc-4.8.4/gcc/config/linux.h
+@@ -73,10 +73,10 @@ see the files COPYING3 and COPYING.RUNTI
     GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
     GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
     supporting both 32-bit and 64-bit compilation.  */
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0038-gcc-4.8-build-args.patch b/meta/recipes-devtools/gcc/gcc-4.8/0038-gcc-4.8-build-args.patch
index c27e009..7c8290f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8/0038-gcc-4.8-build-args.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0038-gcc-4.8-build-args.patch
@@ -15,27 +15,50 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-Index: gcc-4.8.0/gcc/configure
+Index: gcc-4.8.4/gcc/configure
 ===================================================================
---- gcc-4.8.0.orig/gcc/configure
-+++ gcc-4.8.0/gcc/configure
-@@ -11720,6 +10581,7 @@ STMP_FIXINC=stmp-fixinc
- if test x$build != x$host || test "x$coverage_flags" != x
- then
-     BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
-+    BUILD_CXXFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
-     BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
- fi
+--- gcc-4.8.4.orig/gcc/configure
++++ gcc-4.8.4/gcc/configure
+@@ -17864,7 +17864,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17853 "configure"
++#line 17867 "configure"
+ #include "confdefs.h"
  
-Index: gcc-4.8.0/gcc/configure.ac
-===================================================================
---- gcc-4.8.0.orig/gcc/configure.ac
-+++ gcc-4.8.0/gcc/configure.ac
-@@ -1901,6 +1901,7 @@ STMP_FIXINC=stmp-fixinc		AC_SUBST(STMP_F
- if test x$build != x$host || test "x$coverage_flags" != x
- then
-     BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
-+    BUILD_CXXFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
-     BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
+ #if HAVE_DLFCN_H
+@@ -17970,7 +17970,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17959 "configure"
++#line 17973 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -26918,18 +26918,15 @@ $as_echo "#define TARGET_LIBC_PROVIDES_S
  fi
  
+ # Test for <sys/sdt.h> on the target.
+-
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
+-$as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
+-have_sys_sdt_h=no
++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
++#have_sys_sdt_h=no
+ #if test -f $target_header_dir/sys/sdt.h; then
+ #  have_sys_sdt_h=yes
+-#
+-#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+-#
++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
++#            [Define if your target C library provides sys/sdt.h])
+ #fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
+-$as_echo "$have_sys_sdt_h" >&6; }
++#AC_MSG_RESULT($have_sys_sdt_h)
+ 
+ # Check if TFmode long double should be used by default or not.
+ # Some glibc targets used DFmode long double, but with glibc 2.4
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch b/meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch
deleted file mode 100644
index f983f70..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.8/0039-gcc-4.8-PR57717.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-This backports fix from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: gcc-4.8.1/gcc/config/rs6000/rs6000.c
-===================================================================
---- gcc-4.8.1.orig/gcc/config/rs6000/rs6000.c	2013-05-09 18:54:06.000000000 -0700
-+++ gcc-4.8.1/gcc/config/rs6000/rs6000.c	2013-06-27 08:22:40.459021366 -0700
-@@ -5431,11 +5431,12 @@
- 
-     case TFmode:
-     case TDmode:
--    case TImode:
-       if (TARGET_E500_DOUBLE)
- 	return (SPE_CONST_OFFSET_OK (offset)
- 		&& SPE_CONST_OFFSET_OK (offset + 8));
-+        /* Fall through.  */
- 
-+    case TImode:
-       extra = 8;
-       if (!worst_case)
- 	break;
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch b/meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch
deleted file mode 100644
index 96fa1da..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-This backports fix from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717
-
-Upstream-Status: Backport
-Signed-off-by: Julian Brown <Julian_Brown@mentor.com>
-
-fix for PR57717 (PowerPC E500v2)
-http://gcc.gnu.org/ml/gcc-patches/2013-08/msg00668.html
-
---- a/gcc/config/rs6000/rs6000.c	2013-05-09 20:54:06.000000000 -0500
-+++ b/gcc/config/rs6000/rs6000.c	2013-08-28 01:25:24.865218744 -0500
-@@ -6337,9 +6337,7 @@
-       && GET_CODE (XEXP (x, 1)) == CONST_INT
-       && reg_offset_p
-       && !SPE_VECTOR_MODE (mode)
--      && !(TARGET_E500_DOUBLE && (mode == DFmode || mode == TFmode
--				  || mode == DDmode || mode == TDmode
--				  || mode == DImode))
-+      && !(TARGET_E500_DOUBLE && GET_MODE_SIZE (mode) > UNITS_PER_WORD)
-       && VECTOR_MEM_NONE_P (mode))
-     {
-       HOST_WIDE_INT val = INTVAL (XEXP (x, 1));
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch b/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch
deleted file mode 100644
index 0ef245a..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.8/0048-PR58854_fix_arm_apcs_epilogue.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Backport fix for PR target/58854
-
-2013-11-11  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
-
-       Backported from mainline
-        2013-10-30  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
-
-       PR target/58854
-       * config/arm/arm.c (arm_expand_epilogue_apcs_frame): Emit blockage
-
-
-Upstream-Status: Backport
-
---- gcc-4_8-branch/gcc/config/arm/arm.c	2013/11/11 08:00:45	204664
-+++ gcc-4_8-branch/gcc/config/arm/arm.c	2013/11/11 09:38:14	204665
-@@ -23555,6 +23555,7 @@
-   num_regs = bit_count (saved_regs_mask);
-   if ((offsets->outgoing_args != (1 + num_regs)) || cfun->calls_alloca)
-     {
-+      emit_insn (gen_blockage ());
-       /* Unwind the stack to just below the saved registers.  */
-       emit_insn (gen_addsi3 (stack_pointer_rtx,
-                              hard_frame_pointer_rtx,
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch b/meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch
deleted file mode 100644
index 4470596..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-Backport fix for PR target/58595
-
-From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 6 Mar 2014 12:07:07 +0000
-Subject: [PATCH] 	PR target/58595 	* config/arm/arm.c
- (arm_tls_symbol_p): Remove. 	(arm_legitimize_address): Call
- legitimize_tls_address for any 	arm_tls_referenced_p expression,
- handle constant addend.  Call it 	before testing for !TARGET_ARM. 
- (thumb_legitimize_address): Don't handle arm_tls_symbol_p here.
-
-	* gcc.dg/tls/pr58595.c: New test.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@208380 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Index: gcc-4.8.2/gcc/ChangeLog
-===================================================================
---- gcc-4.8.2.orig/gcc/ChangeLog
-+++ gcc-4.8.2/gcc/ChangeLog
-@@ -1,3 +1,13 @@
-+2014-03-06  Jakub Jelinek  <jakub@redhat.com>
-+	    Meador Inge  <meadori@codesourcery.com>
-+
-+	PR target/58595
-+	* config/arm/arm.c (arm_tls_symbol_p): Remove.
-+	(arm_legitimize_address): Call legitimize_tls_address for any
-+	arm_tls_referenced_p expression, handle constant addend.  Call it
-+	before testing for !TARGET_ARM.
-+	(thumb_legitimize_address): Don't handle arm_tls_symbol_p here.
-+
- 2013-10-16  Release Manager
- 
- 	* GCC 4.8.2 released.
-Index: gcc-4.8.2/gcc/config/arm/arm.c
-===================================================================
---- gcc-4.8.2.orig/gcc/config/arm/arm.c
-+++ gcc-4.8.2/gcc/config/arm/arm.c
-@@ -230,7 +230,6 @@ static tree arm_gimplify_va_arg_expr (tr
- static void arm_option_override (void);
- static unsigned HOST_WIDE_INT arm_shift_truncation_mask (enum machine_mode);
- static bool arm_cannot_copy_insn_p (rtx);
--static bool arm_tls_symbol_p (rtx x);
- static int arm_issue_rate (void);
- static void arm_output_dwarf_dtprel (FILE *, int, rtx) ATTRIBUTE_UNUSED;
- static bool arm_output_addr_const_extra (FILE *, rtx);
-@@ -6573,6 +6572,32 @@ legitimize_tls_address (rtx x, rtx reg)
- rtx
- arm_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
- {
-+  if (arm_tls_referenced_p (x))
-+    {
-+      rtx addend = NULL;
-+
-+      if (GET_CODE (x) == CONST && GET_CODE (XEXP (x, 0)) == PLUS)
-+	{
-+	  addend = XEXP (XEXP (x, 0), 1);
-+	  x = XEXP (XEXP (x, 0), 0);
-+	}
-+
-+      if (GET_CODE (x) != SYMBOL_REF)
-+	return x;
-+
-+      gcc_assert (SYMBOL_REF_TLS_MODEL (x) != 0);
-+
-+      x = legitimize_tls_address (x, NULL_RTX);
-+
-+      if (addend)
-+	{
-+	  x = gen_rtx_PLUS (SImode, x, addend);
-+	  orig_x = x;
-+	}
-+      else
-+	return x;
-+    }
-+
-   if (!TARGET_ARM)
-     {
-       /* TODO: legitimize_address for Thumb2.  */
-@@ -6581,9 +6606,6 @@ arm_legitimize_address (rtx x, rtx orig_
-       return thumb_legitimize_address (x, orig_x, mode);
-     }
- 
--  if (arm_tls_symbol_p (x))
--    return legitimize_tls_address (x, NULL_RTX);
--
-   if (GET_CODE (x) == PLUS)
-     {
-       rtx xop0 = XEXP (x, 0);
-@@ -6695,9 +6717,6 @@ arm_legitimize_address (rtx x, rtx orig_
- rtx
- thumb_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
- {
--  if (arm_tls_symbol_p (x))
--    return legitimize_tls_address (x, NULL_RTX);
--
-   if (GET_CODE (x) == PLUS
-       && CONST_INT_P (XEXP (x, 1))
-       && (INTVAL (XEXP (x, 1)) >= 32 * GET_MODE_SIZE (mode)
-@@ -6988,20 +7007,6 @@ thumb_legitimize_reload_address (rtx *x_
- 
- /* Test for various thread-local symbols.  */
- 
--/* Return TRUE if X is a thread-local symbol.  */
--
--static bool
--arm_tls_symbol_p (rtx x)
--{
--  if (! TARGET_HAVE_TLS)
--    return false;
--
--  if (GET_CODE (x) != SYMBOL_REF)
--    return false;
--
--  return SYMBOL_REF_TLS_MODEL (x) != 0;
--}
--
- /* Helper for arm_tls_referenced_p.  */
- 
- static int
-Index: gcc-4.8.2/gcc/testsuite/ChangeLog
-===================================================================
---- gcc-4.8.2.orig/gcc/testsuite/ChangeLog
-+++ gcc-4.8.2/gcc/testsuite/ChangeLog
-@@ -1,3 +1,8 @@
-+2014-03-06  Jakub Jelinek  <jakub@redhat.com>
-+
-+	PR target/58595
-+	* gcc.dg/tls/pr58595.c: New test.
-+
- 2013-10-16  Release Manager
- 
- 	* GCC 4.8.2 released.
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch b/meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch
deleted file mode 100644
index 300b204..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8dfe30973ab03f0480f1e249f320e78f210dc230 Mon Sep 17 00:00:00 2001
-From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 17 Jul 2014 07:49:44 +0000
-Subject: [PATCH] 2014-07-17  Richard Biener  <rguenther@suse.de>
-
-	PR rtl-optimization/61801
-	* sched-deps.c (sched_analyze_2): For ASM_OPERANDS and
-	ASM_INPUT don't set reg_pending_barrier if it appears in a
-	debug-insn.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_8-branch@212740 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801]
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
-
----
- gcc/sched-deps.c | 3 ++-
-
-diff --git a/gcc/sched-deps.c b/gcc/sched-deps.c
-index 07857f2..4ac2542 100644
---- a/gcc/sched-deps.c
-+++ b/gcc/sched-deps.c
-@@ -2744,7 +2744,8 @@ sched_analyze_2 (struct deps_desc *deps, rtx x, rtx insn)
- 	   Consider for instance a volatile asm that changes the fpu rounding
- 	   mode.  An insn should not be moved across this even if it only uses
- 	   pseudo-regs because it might give an incorrectly rounded result.  */
--	if (code != ASM_OPERANDS || MEM_VOLATILE_P (x))
-+	if ((code != ASM_OPERANDS || MEM_VOLATILE_P (x))
-+	    && !DEBUG_INSN_P (insn))
- 	  reg_pending_barrier = TRUE_BARRIER;
- 
- 	/* For all ASM_OPERANDS, we must traverse the vector of input operands.
--- 
-1.8.5.5
-
-- 
2.1.4


