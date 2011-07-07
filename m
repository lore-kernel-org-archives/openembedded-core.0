Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QevWW-0003aT-BI
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 22:50:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 13:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,495,1304319600"; d="scan'208";a="22782104"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 13:25:42 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 13:25:35 -0700
Message-Id: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1310070283.git.nitin.a.kamble@intel.com>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/7] binutils: upgrade from 2.21 to 2.21.1
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
X-List-Received-Date: Thu, 07 Jul 2011 20:50:21 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...n_2.21.bb => binutils-cross-canadian_2.21.1.bb} |    0
 ...tils-cross_2.21.bb => binutils-cross_2.21.1.bb} |    0
 ...rosssdk_2.21.bb => binutils-crosssdk_2.21.1.bb} |    0
 .../110-arm-eabi-conf.patch                        |    0
 .../binutils-2.19.1-ld-sysroot.patch               |    0
 .../binutils-poison.patch                          |    0
 .../binutils-pr12366.patch                         |    0
 .../binutils-uclibc-100-uclibc-conf.patch          |    0
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
 ...binutils-uclibc-300-006_better_file_error.patch |    0
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
 .../binutils-uclibc-gas-needs-libm.patch           |    0
 .../binutils-x86_64_i386_biarch.patch              |    0
 .../libiberty_path_fix.patch                       |    0
 .../libtool-2.4-update.patch                       | 1725 ++++++++++----------
 .../libtool-rpath-fix.patch                        |    0
 .../{binutils_2.21.bb => binutils_2.21.1.bb}       |    7 +-
 17 files changed, 871 insertions(+), 861 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.bb => binutils-cross-canadian_2.21.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.21.bb => binutils-cross_2.21.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.bb => binutils-crosssdk_2.21.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/110-arm-eabi-conf.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-2.19.1-ld-sysroot.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-poison.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-pr12366.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-100-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-006_better_file_error.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-gas-needs-libm.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-x86_64_i386_biarch.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libiberty_path_fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libtool-2.4-update.patch (94%)
 rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libtool-rpath-fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.21.bb => binutils_2.21.1.bb} (87%)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.21.bb b/meta/recipes-devtools/binutils/binutils-cross_2.21.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.21.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.21.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.21.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch b/meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
rename to meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch b/meta/recipes-devtools/binutils/binutils/binutils-2.19.1-ld-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-2.19.1-ld-sysroot.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-poison.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-pr12366.patch b/meta/recipes-devtools/binutils/binutils/binutils-pr12366.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-pr12366.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-pr12366.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-300-001_ld_makefile_patch.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-300-001_ld_makefile_patch.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-300-006_better_file_error.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-300-006_better_file_error.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-300-012_check_ldrunpath_length.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-300-012_check_ldrunpath_length.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-gas-needs-libm.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-gas-needs-libm.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-x86_64_i386_biarch.patch b/meta/recipes-devtools/binutils/binutils/binutils-x86_64_i386_biarch.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/binutils-x86_64_i386_biarch.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-x86_64_i386_biarch.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/libiberty_path_fix.patch b/meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/libiberty_path_fix.patch
rename to meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/libtool-2.4-update.patch b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
similarity index 94%
rename from meta/recipes-devtools/binutils/binutils-2.21/libtool-2.4-update.patch
rename to meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
index 1f49db0..fc1735e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/libtool-2.4-update.patch
+++ b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
@@ -1,9 +1,9 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: binutils-2.21/libtool.m4
+Index: binutils-2.21.1/libtool.m4
 ===================================================================
---- binutils-2.21.orig/libtool.m4	2010-01-09 13:11:31.000000000 -0800
-+++ binutils-2.21/libtool.m4	2011-01-07 10:49:16.396101000 -0800
+--- binutils-2.21.1.orig/libtool.m4
++++ binutils-2.21.1/libtool.m4
 @@ -1,7 +1,8 @@
  # libtool.m4 - Configure libtool for the host system. -*-Autoconf-*-
  #
@@ -24,7 +24,7 @@ Index: binutils-2.21/libtool.m4
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -37,7 +39,7 @@
+@@ -37,7 +39,7 @@ m4_define([_LT_COPYING], [dnl
  # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  ])
  
@@ -33,7 +33,7 @@ Index: binutils-2.21/libtool.m4
  
  
  # LT_PREREQ(VERSION)
-@@ -92,7 +94,8 @@
+@@ -92,7 +94,8 @@ _LT_SET_OPTIONS([$0], [$1])
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -43,7 +43,7 @@ Index: binutils-2.21/libtool.m4
  AC_SUBST(LIBTOOL)dnl
  
  _LT_SETUP
-@@ -166,10 +169,13 @@
+@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable 
  dnl
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_CHECK_SHELL_FEATURES])dnl
@@ -57,7 +57,7 @@ Index: binutils-2.21/libtool.m4
  
  _LT_CONFIG_LIBTOOL_INIT([
  # See if we are running on zsh, and set the options which allow our
-@@ -199,7 +205,7 @@
+@@ -199,7 +205,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -66,7 +66,7 @@ Index: binutils-2.21/libtool.m4
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -632,7 +638,7 @@
+@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_
  m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
  configured by $[0], generated by m4_PACKAGE_STRING.
  
@@ -75,7 +75,7 @@ Index: binutils-2.21/libtool.m4
  This config.lt script is free software; the Free Software Foundation
  gives unlimited permision to copy, distribute and modify it."
  
-@@ -746,15 +752,12 @@
+@@ -746,15 +752,12 @@ _LT_EOF
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -95,7 +95,7 @@ Index: binutils-2.21/libtool.m4
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  ],
-@@ -980,6 +983,8 @@
+@@ -980,6 +983,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&AS_MESSAGE_LOG_FD
        echo "$AR cru libconftest.a conftest.o" >&AS_MESSAGE_LOG_FD
        $AR cru libconftest.a conftest.o 2>&AS_MESSAGE_LOG_FD
@@ -104,7 +104,7 @@ Index: binutils-2.21/libtool.m4
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -1069,30 +1074,41 @@
+@@ -1069,30 +1074,41 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
    fi
  ])
  
@@ -162,7 +162,7 @@ Index: binutils-2.21/libtool.m4
  ])# _LT_SYS_MODULE_PATH_AIX
  
  
-@@ -1117,7 +1133,7 @@
+@@ -1117,7 +1133,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  
  AC_MSG_CHECKING([how to print strings])
  # Test print first, because it will be a builtin if present.
@@ -171,7 +171,7 @@ Index: binutils-2.21/libtool.m4
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -1161,6 +1177,39 @@
+@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo progr
  ])# _LT_PROG_ECHO_BACKSLASH
  
  
@@ -211,7 +211,7 @@ Index: binutils-2.21/libtool.m4
  # _LT_ENABLE_LOCK
  # ---------------
  m4_defun([_LT_ENABLE_LOCK],
-@@ -1307,14 +1356,47 @@
+@@ -1307,14 +1356,47 @@ need_locks="$enable_libtool_lock"
  ])# _LT_ENABLE_LOCK
  
  
@@ -264,7 +264,7 @@ Index: binutils-2.21/libtool.m4
  
  AC_CHECK_TOOL(STRIP, strip, :)
  test -z "$STRIP" && STRIP=:
-@@ -1610,7 +1692,7 @@
+@@ -1610,7 +1692,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -273,7 +273,7 @@ Index: binutils-2.21/libtool.m4
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -1654,10 +1736,10 @@
+@@ -1654,10 +1736,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -286,7 +286,7 @@ Index: binutils-2.21/libtool.m4
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -2197,8 +2279,9 @@
+@@ -2197,8 +2279,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -298,7 +298,7 @@ Index: binutils-2.21/libtool.m4
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -2231,13 +2314,71 @@
+@@ -2231,13 +2314,71 @@ m4_if([$1], [],[
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -371,7 +371,7 @@ Index: binutils-2.21/libtool.m4
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -2333,7 +2474,7 @@
+@@ -2333,7 +2474,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -380,7 +380,7 @@ Index: binutils-2.21/libtool.m4
    hardcode_into_libs=yes
    ;;
  
-@@ -2941,6 +3082,11 @@
+@@ -2941,6 +3082,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -392,7 +392,7 @@ Index: binutils-2.21/libtool.m4
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -3007,7 +3153,8 @@
+@@ -3007,7 +3153,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -402,7 +402,7 @@ Index: binutils-2.21/libtool.m4
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -3158,6 +3305,21 @@
+@@ -3158,6 +3305,21 @@ tpf*)
    ;;
  esac
  ])
@@ -424,7 +424,7 @@ Index: binutils-2.21/libtool.m4
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3165,7 +3327,11 @@
+@@ -3165,7 +3327,11 @@ test -z "$deplibs_check_method" && depli
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -437,7 +437,7 @@ Index: binutils-2.21/libtool.m4
  ])# _LT_CHECK_MAGIC_METHOD
  
  
-@@ -3268,6 +3434,67 @@
+@@ -3268,6 +3434,67 @@ dnl aclocal-1.4 backwards compatibility:
  dnl AC_DEFUN([AM_PROG_NM], [])
  dnl AC_DEFUN([AC_PROG_NM], [])
  
@@ -505,7 +505,7 @@ Index: binutils-2.21/libtool.m4
  
  # LT_LIB_M
  # --------
-@@ -3394,8 +3621,8 @@
+@@ -3394,8 +3621,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -516,7 +516,7 @@ Index: binutils-2.21/libtool.m4
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -3431,6 +3658,7 @@
+@@ -3431,6 +3658,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -524,7 +524,7 @@ Index: binutils-2.21/libtool.m4
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -3464,6 +3692,18 @@
+@@ -3464,6 +3692,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -543,7 +543,7 @@ Index: binutils-2.21/libtool.m4
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -3475,7 +3715,7 @@
+@@ -3475,7 +3715,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -552,7 +552,7 @@ Index: binutils-2.21/libtool.m4
    const char *name;
    void       *address;
  }
-@@ -3501,15 +3741,15 @@
+@@ -3501,15 +3741,15 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -572,7 +572,7 @@ Index: binutils-2.21/libtool.m4
  	else
  	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
  	fi
-@@ -3542,6 +3782,13 @@
+@@ -3542,6 +3782,13 @@ else
    AC_MSG_RESULT(ok)
  fi
  
@@ -586,7 +586,7 @@ Index: binutils-2.21/libtool.m4
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3552,6 +3799,8 @@
+@@ -3552,6 +3799,8 @@ _LT_DECL([global_symbol_to_c_name_addres
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -595,7 +595,7 @@ Index: binutils-2.21/libtool.m4
  ]) # _LT_CMD_GLOBAL_SYMBOLS
  
  
-@@ -3563,7 +3812,6 @@
+@@ -3563,7 +3812,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
  _LT_TAGVAR(lt_prog_compiler_pic, $1)=
  _LT_TAGVAR(lt_prog_compiler_static, $1)=
  
@@ -603,7 +603,7 @@ Index: binutils-2.21/libtool.m4
  m4_if([$1], [CXX], [
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -3668,6 +3916,12 @@
+@@ -3668,6 +3916,12 @@ m4_if([$1], [CXX], [
  	  ;;
  	esac
  	;;
@@ -616,7 +616,7 @@ Index: binutils-2.21/libtool.m4
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -3820,7 +4074,7 @@
+@@ -3820,7 +4074,7 @@ m4_if([$1], [CXX], [
  	;;
        solaris*)
  	case $cc_basename in
@@ -625,7 +625,7 @@ Index: binutils-2.21/libtool.m4
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
  	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
-@@ -4042,6 +4296,12 @@
+@@ -4042,6 +4296,12 @@ m4_if([$1], [CXX], [
  	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
  	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
  	;;
@@ -638,7 +638,7 @@ Index: binutils-2.21/libtool.m4
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -4104,7 +4364,7 @@
+@@ -4104,7 +4364,7 @@ m4_if([$1], [CXX], [
        _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
        _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
        case $cc_basename in
@@ -647,7 +647,7 @@ Index: binutils-2.21/libtool.m4
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
        *)
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
-@@ -4161,9 +4421,11 @@
+@@ -4161,9 +4421,11 @@ case $host_os in
      _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
      ;;
  esac
@@ -662,7 +662,7 @@ Index: binutils-2.21/libtool.m4
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -4182,6 +4444,8 @@
+@@ -4182,6 +4444,8 @@ fi
  _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
  	[Additional compiler flags for building library objects])
  
@@ -671,7 +671,7 @@ Index: binutils-2.21/libtool.m4
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4202,6 +4466,7 @@
+@@ -4202,6 +4466,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -679,7 +679,7 @@ Index: binutils-2.21/libtool.m4
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
  m4_require([_LT_DECL_SED])dnl
-@@ -4210,6 +4475,7 @@
+@@ -4210,6 +4475,7 @@ m4_require([_LT_TAG_COMPILER])dnl
  AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
  m4_if([$1], [CXX], [
    _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -687,7 +687,7 @@ Index: binutils-2.21/libtool.m4
    case $host_os in
    aix[[4-9]]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -4224,15 +4490,20 @@
+@@ -4224,15 +4490,20 @@ m4_if([$1], [CXX], [
      ;;
    pw32*)
      _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
@@ -713,7 +713,7 @@ Index: binutils-2.21/libtool.m4
  ], [
    runpath_var=
    _LT_TAGVAR(allow_undefined_flag, $1)=
-@@ -4400,7 +4671,8 @@
+@@ -4400,7 +4671,8 @@ _LT_EOF
        _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
        _LT_TAGVAR(always_export_symbols, $1)=no
        _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
@@ -723,7 +723,7 @@ Index: binutils-2.21/libtool.m4
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -4448,7 +4720,7 @@
+@@ -4448,7 +4720,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -732,7 +732,7 @@ Index: binutils-2.21/libtool.m4
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -4499,12 +4771,12 @@
+@@ -4499,12 +4771,12 @@ _LT_EOF
  	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
  	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
  	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
@@ -747,7 +747,7 @@ Index: binutils-2.21/libtool.m4
  	  fi
  	  ;;
  	esac
-@@ -4518,8 +4790,8 @@
+@@ -4518,8 +4790,8 @@ _LT_EOF
  	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -758,7 +758,7 @@ Index: binutils-2.21/libtool.m4
        fi
        ;;
  
-@@ -4537,8 +4809,8 @@
+@@ -4537,8 +4809,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -769,7 +769,7 @@ Index: binutils-2.21/libtool.m4
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4584,8 +4856,8 @@
+@@ -4584,8 +4856,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -780,7 +780,7 @@ Index: binutils-2.21/libtool.m4
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4715,7 +4987,7 @@
+@@ -4715,7 +4987,7 @@ _LT_EOF
  	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -789,7 +789,7 @@ Index: binutils-2.21/libtool.m4
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
        else
-@@ -4726,7 +4998,7 @@
+@@ -4726,7 +4998,7 @@ _LT_EOF
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -798,7 +798,7 @@ Index: binutils-2.21/libtool.m4
  	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
  	  # -berok will link without error, but may produce a broken library.
-@@ -4770,20 +5042,63 @@
+@@ -4770,20 +5042,63 @@ _LT_EOF
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -876,7 +876,7 @@ Index: binutils-2.21/libtool.m4
        ;;
  
      darwin* | rhapsody*)
-@@ -4821,7 +5136,7 @@
+@@ -4821,7 +5136,7 @@ _LT_EOF
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -885,7 +885,7 @@ Index: binutils-2.21/libtool.m4
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
        _LT_TAGVAR(hardcode_direct, $1)=yes
        _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
-@@ -4829,7 +5144,7 @@
+@@ -4829,7 +5144,7 @@ _LT_EOF
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -894,7 +894,7 @@ Index: binutils-2.21/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -4845,7 +5160,7 @@
+@@ -4845,7 +5160,7 @@ _LT_EOF
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -903,7 +903,7 @@ Index: binutils-2.21/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -4869,10 +5184,10 @@
+@@ -4869,10 +5184,10 @@ _LT_EOF
  	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -916,7 +916,7 @@ Index: binutils-2.21/libtool.m4
  	  ;;
  	esac
        else
-@@ -4919,16 +5234,31 @@
+@@ -4919,16 +5234,31 @@ _LT_EOF
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -955,7 +955,7 @@ Index: binutils-2.21/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -5013,7 +5343,7 @@
+@@ -5013,7 +5343,7 @@ _LT_EOF
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
@@ -964,7 +964,7 @@ Index: binutils-2.21/libtool.m4
  	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
        else
  	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
-@@ -5032,9 +5362,9 @@
+@@ -5032,9 +5362,9 @@ _LT_EOF
        _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -976,7 +976,7 @@ Index: binutils-2.21/libtool.m4
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -5306,8 +5636,6 @@
+@@ -5306,8 +5636,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
      to runtime path list])
  _LT_TAGDECL([], [link_all_deplibs], [0],
      [Whether libtool must link a program against all its dependency libraries])
@@ -985,7 +985,7 @@ Index: binutils-2.21/libtool.m4
  _LT_TAGDECL([], [always_export_symbols], [0],
      [Set to "yes" if exported symbols are required])
  _LT_TAGDECL([], [export_symbols_cmds], [2],
-@@ -5318,6 +5646,8 @@
+@@ -5318,6 +5646,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
      [Symbols that must always be exported])
  _LT_TAGDECL([], [prelink_cmds], [2],
      [Commands necessary for linking programs (against libraries) with templates])
@@ -994,7 +994,7 @@ Index: binutils-2.21/libtool.m4
  _LT_TAGDECL([], [file_list_spec], [1],
      [Specify filename containing input files])
  dnl FIXME: Not yet implemented
-@@ -5419,6 +5749,7 @@
+@@ -5419,6 +5749,7 @@ CC="$lt_save_CC"
  m4_defun([_LT_LANG_CXX_CONFIG],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
@@ -1002,7 +1002,7 @@ Index: binutils-2.21/libtool.m4
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5480,6 +5811,7 @@
+@@ -5480,6 +5811,7 @@ if test "$_lt_caught_CXX_error" != yes; 
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -1010,7 +1010,7 @@ Index: binutils-2.21/libtool.m4
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5497,6 +5829,7 @@
+@@ -5497,6 +5829,7 @@ if test "$_lt_caught_CXX_error" != yes; 
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -1018,7 +1018,7 @@ Index: binutils-2.21/libtool.m4
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5518,8 +5851,8 @@
+@@ -5518,8 +5851,8 @@ if test "$_lt_caught_CXX_error" != yes; 
        # Check if GNU C++ uses GNU ld as the underlying linker, since the
        # archiving commands below assume that GNU ld is being used.
        if test "$with_gnu_ld" = yes; then
@@ -1029,7 +1029,7 @@ Index: binutils-2.21/libtool.m4
  
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
          _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
-@@ -5660,7 +5993,7 @@
+@@ -5660,7 +5993,7 @@ if test "$_lt_caught_CXX_error" != yes; 
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -1038,7 +1038,7 @@ Index: binutils-2.21/libtool.m4
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5672,7 +6005,7 @@
+@@ -5672,7 +6005,7 @@ if test "$_lt_caught_CXX_error" != yes; 
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -1047,7 +1047,7 @@ Index: binutils-2.21/libtool.m4
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5714,29 +6047,75 @@
+@@ -5714,29 +6047,75 @@ if test "$_lt_caught_CXX_error" != yes; 
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -1146,7 +1146,7 @@ Index: binutils-2.21/libtool.m4
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5811,7 +6190,7 @@
+@@ -5811,7 +6190,7 @@ if test "$_lt_caught_CXX_error" != yes; 
              ;;
            *)
              if test "$GXX" = yes; then
@@ -1155,7 +1155,7 @@ Index: binutils-2.21/libtool.m4
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5882,10 +6261,10 @@
+@@ -5882,10 +6261,10 @@ if test "$_lt_caught_CXX_error" != yes; 
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -1168,7 +1168,7 @@ Index: binutils-2.21/libtool.m4
  	            ;;
  	        esac
  	      fi
-@@ -5926,9 +6305,9 @@
+@@ -5926,9 +6305,9 @@ if test "$_lt_caught_CXX_error" != yes; 
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -1180,7 +1180,7 @@ Index: binutils-2.21/libtool.m4
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -5998,20 +6377,20 @@
+@@ -5998,20 +6377,20 @@ if test "$_lt_caught_CXX_error" != yes; 
  	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -1205,7 +1205,7 @@ Index: binutils-2.21/libtool.m4
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6206,7 +6585,7 @@
+@@ -6206,7 +6585,7 @@ if test "$_lt_caught_CXX_error" != yes; 
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -1214,7 +1214,7 @@ Index: binutils-2.21/libtool.m4
  		  ;;
  	      esac
  
-@@ -6252,7 +6631,7 @@
+@@ -6252,7 +6631,7 @@ if test "$_lt_caught_CXX_error" != yes; 
  
        solaris*)
          case $cc_basename in
@@ -1223,7 +1223,7 @@ Index: binutils-2.21/libtool.m4
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6293,9 +6672,9 @@
+@@ -6293,9 +6672,9 @@ if test "$_lt_caught_CXX_error" != yes; 
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -1235,7 +1235,7 @@ Index: binutils-2.21/libtool.m4
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6424,6 +6803,7 @@
+@@ -6424,6 +6803,7 @@ if test "$_lt_caught_CXX_error" != yes; 
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -1243,7 +1243,7 @@ Index: binutils-2.21/libtool.m4
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -6438,6 +6818,29 @@
+@@ -6438,6 +6818,29 @@ AC_LANG_POP
  ])# _LT_LANG_CXX_CONFIG
  
  
@@ -1273,7 +1273,7 @@ Index: binutils-2.21/libtool.m4
  # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
  # ---------------------------------
  # Figure out "hidden" library dependencies from verbose
-@@ -6446,6 +6849,7 @@
+@@ -6446,6 +6849,7 @@ AC_LANG_POP
  # objects, libraries and library flags.
  m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
@@ -1281,7 +1281,7 @@ Index: binutils-2.21/libtool.m4
  # Dependencies to place before and after the object being linked:
  _LT_TAGVAR(predep_objects, $1)=
  _LT_TAGVAR(postdep_objects, $1)=
-@@ -6496,6 +6900,13 @@
+@@ -6496,6 +6900,13 @@ public class foo {
  };
  _LT_EOF
  ])
@@ -1295,7 +1295,7 @@ Index: binutils-2.21/libtool.m4
  dnl Parse the compiler output and extract the necessary
  dnl objects, libraries and library flags.
  if AC_TRY_EVAL(ac_compile); then
-@@ -6507,7 +6918,7 @@
+@@ -6507,7 +6918,7 @@ if AC_TRY_EVAL(ac_compile); then
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -1304,7 +1304,7 @@ Index: binutils-2.21/libtool.m4
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -6516,13 +6927,22 @@
+@@ -6516,13 +6927,22 @@ if AC_TRY_EVAL(ac_compile); then
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -1331,7 +1331,7 @@ Index: binutils-2.21/libtool.m4
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -6542,8 +6962,10 @@
+@@ -6542,8 +6962,10 @@ if AC_TRY_EVAL(ac_compile); then
  	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
  	 fi
         fi
@@ -1342,7 +1342,7 @@ Index: binutils-2.21/libtool.m4
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -6579,6 +7001,7 @@
+@@ -6579,6 +7001,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -1350,7 +1350,7 @@ Index: binutils-2.21/libtool.m4
  
  # PORTME: override above test on systems where it is broken
  m4_if([$1], [CXX],
-@@ -6615,7 +7038,7 @@
+@@ -6615,7 +7038,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -1359,7 +1359,7 @@ Index: binutils-2.21/libtool.m4
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -6728,7 +7151,9 @@
+@@ -6728,7 +7151,9 @@ if test "$_lt_disable_F77" != yes; then
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -1369,7 +1369,7 @@ Index: binutils-2.21/libtool.m4
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -6782,6 +7207,7 @@
+@@ -6782,6 +7207,7 @@ if test "$_lt_disable_F77" != yes; then
  
    GCC=$lt_save_GCC
    CC="$lt_save_CC"
@@ -1377,7 +1377,7 @@ Index: binutils-2.21/libtool.m4
  fi # test "$_lt_disable_F77" != yes
  
  AC_LANG_POP
-@@ -6858,7 +7284,9 @@
+@@ -6858,7 +7284,9 @@ if test "$_lt_disable_FC" != yes; then
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -1387,7 +1387,7 @@ Index: binutils-2.21/libtool.m4
    compiler=$CC
    GCC=$ac_cv_fc_compiler_gnu
  
-@@ -6914,7 +7342,8 @@
+@@ -6914,7 +7342,8 @@ if test "$_lt_disable_FC" != yes; then
    fi # test -n "$compiler"
  
    GCC=$lt_save_GCC
@@ -1397,7 +1397,7 @@ Index: binutils-2.21/libtool.m4
  fi # test "$_lt_disable_FC" != yes
  
  AC_LANG_POP
-@@ -6951,10 +7380,12 @@
+@@ -6951,10 +7380,12 @@ _LT_COMPILER_BOILERPLATE
  _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
@@ -1411,7 +1411,7 @@ Index: binutils-2.21/libtool.m4
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_TAGVAR(LD, $1)="$LD"
-@@ -6985,7 +7416,8 @@
+@@ -6985,7 +7416,8 @@ fi
  AC_LANG_RESTORE
  
  GCC=$lt_save_GCC
@@ -1421,7 +1421,7 @@ Index: binutils-2.21/libtool.m4
  ])# _LT_LANG_GCJ_CONFIG
  
  
-@@ -7020,9 +7452,11 @@
+@@ -7020,9 +7452,11 @@ _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
  lt_save_CC="$CC"
@@ -1433,7 +1433,7 @@ Index: binutils-2.21/libtool.m4
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_CC_BASENAME([$compiler])
-@@ -7035,7 +7469,8 @@
+@@ -7035,7 +7469,8 @@ fi
  
  GCC=$lt_save_GCC
  AC_LANG_RESTORE
@@ -1443,7 +1443,7 @@ Index: binutils-2.21/libtool.m4
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7094,6 +7529,15 @@
+@@ -7094,6 +7529,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object 
  AC_SUBST([OBJDUMP])
  ])
  
@@ -1459,7 +1459,7 @@ Index: binutils-2.21/libtool.m4
  
  # _LT_DECL_SED
  # ------------
-@@ -7187,8 +7631,8 @@
+@@ -7187,8 +7631,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -1470,7 +1470,7 @@ Index: binutils-2.21/libtool.m4
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7227,206 +7671,162 @@
+@@ -7227,206 +7671,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -1823,10 +1823,10 @@ Index: binutils-2.21/libtool.m4
 +_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
-Index: binutils-2.21/ltmain.sh
+Index: binutils-2.21.1/ltmain.sh
 ===================================================================
---- binutils-2.21.orig/ltmain.sh	2010-01-09 13:11:32.000000000 -0800
-+++ binutils-2.21/ltmain.sh	2011-01-07 10:49:16.406101000 -0800
+--- binutils-2.21.1.orig/ltmain.sh
++++ binutils-2.21.1/ltmain.sh
 @@ -1,10 +1,9 @@
 -# Generated from ltmain.m4sh.
  
@@ -1872,7 +1872,7 @@ Index: binutils-2.21/ltmain.sh
  
  # Be Bourne compatible
  if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
-@@ -106,9 +106,6 @@
+@@ -106,9 +106,6 @@ _LTECHO_EOF'
  }
  
  # NLS nuisances: We save the old values to restore during execute mode.
@@ -1882,7 +1882,7 @@ Index: binutils-2.21/ltmain.sh
  lt_user_locale=
  lt_safe_locale=
  for lt_var in LANG LANGUAGE LC_ALL LC_CTYPE LC_COLLATE LC_MESSAGES
-@@ -121,15 +118,13 @@
+@@ -121,15 +118,13 @@ do
  	  lt_safe_locale=\"$lt_var=C; \$lt_safe_locale\"
  	fi"
  done
@@ -1901,7 +1901,7 @@ Index: binutils-2.21/ltmain.sh
  # Work around backward compatibility issue on IRIX 6.5. On IRIX 6.4+, sh
  # is ksh but when the shell is invoked as "sh" and the current value of
  # the _XPG environment variable is not equal to 1 (one), the special
-@@ -140,7 +135,7 @@
+@@ -140,7 +135,7 @@ progpath="$0"
  
  
  : ${CP="cp -f"}
@@ -1910,7 +1910,7 @@ Index: binutils-2.21/ltmain.sh
  : ${EGREP="/bin/grep -E"}
  : ${FGREP="/bin/grep -F"}
  : ${GREP="/bin/grep"}
-@@ -149,7 +144,7 @@
+@@ -149,7 +144,7 @@ progpath="$0"
  : ${MKDIR="mkdir"}
  : ${MV="mv -f"}
  : ${RM="rm -f"}
@@ -1919,7 +1919,7 @@ Index: binutils-2.21/ltmain.sh
  : ${SHELL="${CONFIG_SHELL-/bin/sh}"}
  : ${Xsed="$SED -e 1s/^X//"}
  
-@@ -169,6 +164,27 @@
+@@ -169,6 +164,27 @@ IFS=" 	$lt_nl"
  dirname="s,/[^/]*$,,"
  basename="s,^.*/,,"
  
@@ -1947,7 +1947,7 @@ Index: binutils-2.21/ltmain.sh
  # func_dirname_and_basename file append nondir_replacement
  # perform func_basename and func_dirname in a single function
  # call:
-@@ -183,17 +199,31 @@
+@@ -183,17 +199,31 @@ basename="s,^.*/,,"
  # those functions but instead duplicate the functionality here.
  func_dirname_and_basename ()
  {
@@ -1989,7 +1989,7 @@ Index: binutils-2.21/ltmain.sh
  
  # These SED scripts presuppose an absolute path with a trailing slash.
  pathcar='s,^/\([^/]*\).*$,\1,'
-@@ -376,6 +406,15 @@
+@@ -376,6 +406,15 @@ sed_quote_subst='s/\([`"$\\]\)/\\\1/g'
  # Same as above, but do not quote variable references.
  double_quote_subst='s/\(["`\\]\)/\\\1/g'
  
@@ -2005,7 +2005,7 @@ Index: binutils-2.21/ltmain.sh
  # Re-`\' parameter expansions in output of double_quote_subst that were
  # `\'-ed in input to the same.  If an odd number of `\' preceded a '$'
  # in input to double_quote_subst, that '$' was protected from expansion.
-@@ -404,7 +443,7 @@
+@@ -404,7 +443,7 @@ opt_warning=:
  # name if it has been set yet.
  func_echo ()
  {
@@ -2014,7 +2014,7 @@ Index: binutils-2.21/ltmain.sh
  }
  
  # func_verbose arg...
-@@ -430,14 +469,14 @@
+@@ -430,14 +469,14 @@ func_echo_all ()
  # Echo program name prefixed message to standard error.
  func_error ()
  {
@@ -2031,7 +2031,7 @@ Index: binutils-2.21/ltmain.sh
  
      # bash bug again:
      :
-@@ -656,19 +695,35 @@
+@@ -656,19 +695,35 @@ func_show_eval_locale ()
      fi
  }
  
@@ -2070,7 +2070,7 @@ Index: binutils-2.21/ltmain.sh
  	  b more
  	}
  	:go
-@@ -685,7 +740,9 @@
+@@ -685,7 +740,9 @@ func_version ()
  # Echo short help message to standard output and exit.
  func_usage ()
  {
@@ -2081,7 +2081,7 @@ Index: binutils-2.21/ltmain.sh
          s/^# //
  	s/^# *$//
  	s/\$progname/'$progname'/
-@@ -701,7 +758,10 @@
+@@ -701,7 +758,10 @@ func_usage ()
  # unless 'noexit' is passed as argument.
  func_help ()
  {
@@ -2092,7 +2092,7 @@ Index: binutils-2.21/ltmain.sh
          s/^# //
  	s/^# *$//
  	s*\$progname*'$progname'*
-@@ -714,7 +774,11 @@
+@@ -714,7 +774,11 @@ func_help ()
  	s/\$automake_version/'"`(automake --version) 2>/dev/null |$SED 1q`"'/
  	s/\$autoconf_version/'"`(autoconf --version) 2>/dev/null |$SED 1q`"'/
  	p
@@ -2105,7 +2105,7 @@ Index: binutils-2.21/ltmain.sh
      ret=$?
      if test -z "$1"; then
        exit $ret
-@@ -726,12 +790,39 @@
+@@ -726,12 +790,39 @@ func_help ()
  # exit_cmd.
  func_missing_arg ()
  {
@@ -2147,7 +2147,7 @@ Index: binutils-2.21/ltmain.sh
  
  
  
-@@ -741,26 +832,64 @@
+@@ -741,26 +832,64 @@ magic="%%%MAGIC variable%%%"
  magic_exe="%%%MAGIC EXE variable%%%"
  
  # Global variables.
@@ -2220,7 +2220,7 @@ Index: binutils-2.21/ltmain.sh
  # func_fatal_configuration arg...
  # Echo program name prefixed message to standard error, followed by
  # a configuration failure hint, and exit.
-@@ -850,130 +979,204 @@
+@@ -850,130 +979,204 @@ func_enable_tag ()
    esac
  }
  
@@ -2519,7 +2519,7 @@ Index: binutils-2.21/ltmain.sh
  
    case $host in
      *cygwin* | *mingw* | *pw32* | *cegcc*)
-@@ -981,82 +1184,44 @@
+@@ -981,82 +1184,44 @@ func_enable_tag ()
        opt_duplicate_compiler_generated_deps=:
        ;;
      *)
@@ -2626,7 +2626,7 @@ Index: binutils-2.21/ltmain.sh
  
  # func_lalib_p file
  # True iff FILE is a libtool `.la' library or `.lo' object file.
-@@ -1121,12 +1286,9 @@
+@@ -1121,12 +1286,9 @@ func_ltwrapper_executable_p ()
  # temporary ltwrapper_script.
  func_ltwrapper_scriptname ()
  {
@@ -2642,7 +2642,7 @@ Index: binutils-2.21/ltmain.sh
  }
  
  # func_ltwrapper_p file
-@@ -1149,7 +1311,7 @@
+@@ -1149,7 +1311,7 @@ func_execute_cmds ()
      save_ifs=$IFS; IFS='~'
      for cmd in $1; do
        IFS=$save_ifs
@@ -2651,7 +2651,7 @@ Index: binutils-2.21/ltmain.sh
        func_show_eval "$cmd" "${2-:}"
      done
      IFS=$save_ifs
-@@ -1172,6 +1334,37 @@
+@@ -1172,6 +1334,37 @@ func_source ()
  }
  
  
@@ -2689,7 +2689,7 @@ Index: binutils-2.21/ltmain.sh
  # func_infer_tag arg
  # Infer tagged configuration to use if any are available and
  # if one wasn't chosen via the "--tag" command line option.
-@@ -1184,8 +1377,7 @@
+@@ -1184,8 +1377,7 @@ func_infer_tag ()
      if test -n "$available_tags" && test -z "$tagname"; then
        CC_quoted=
        for arg in $CC; do
@@ -2699,7 +2699,7 @@ Index: binutils-2.21/ltmain.sh
        done
        CC_expanded=`func_echo_all $CC`
        CC_quoted_expanded=`func_echo_all $CC_quoted`
-@@ -1204,8 +1396,7 @@
+@@ -1204,8 +1396,7 @@ func_infer_tag ()
  	    CC_quoted=
  	    for arg in $CC; do
  	      # Double-quote args containing other shell metacharacters.
@@ -2709,7 +2709,7 @@ Index: binutils-2.21/ltmain.sh
  	    done
  	    CC_expanded=`func_echo_all $CC`
  	    CC_quoted_expanded=`func_echo_all $CC_quoted`
-@@ -1274,6 +1465,486 @@
+@@ -1274,6 +1465,486 @@ EOF
      }
  }
  
@@ -3196,7 +3196,7 @@ Index: binutils-2.21/ltmain.sh
  # func_mode_compile arg...
  func_mode_compile ()
  {
-@@ -1314,12 +1985,12 @@
+@@ -1314,12 +1985,12 @@ func_mode_compile ()
  	  ;;
  
  	-pie | -fpie | -fPIE)
@@ -3211,7 +3211,7 @@ Index: binutils-2.21/ltmain.sh
  	  continue
  	  ;;
  
-@@ -1340,15 +2011,14 @@
+@@ -1340,15 +2011,14 @@ func_mode_compile ()
  	  save_ifs="$IFS"; IFS=','
  	  for arg in $args; do
  	    IFS="$save_ifs"
@@ -3229,7 +3229,7 @@ Index: binutils-2.21/ltmain.sh
  	  continue
  	  ;;
  
-@@ -1364,8 +2034,7 @@
+@@ -1364,8 +2034,7 @@ func_mode_compile ()
        esac    #  case $arg_mode
  
        # Aesthetically quote the previous argument.
@@ -3239,7 +3239,7 @@ Index: binutils-2.21/ltmain.sh
      done # for arg
  
      case $arg_mode in
-@@ -1496,17 +2165,16 @@
+@@ -1496,17 +2165,16 @@ compiler."
  	$opt_dry_run || $RM $removelist
  	exit $EXIT_FAILURE
        fi
@@ -3261,7 +3261,7 @@ Index: binutils-2.21/ltmain.sh
      func_quote_for_eval "$srcfile"
      qsrcfile=$func_quote_for_eval_result
  
-@@ -1526,7 +2194,7 @@
+@@ -1526,7 +2194,7 @@ compiler."
  
        if test -z "$output_obj"; then
  	# Place PIC objects in $objdir
@@ -3270,7 +3270,7 @@ Index: binutils-2.21/ltmain.sh
        fi
  
        func_show_eval_locale "$command"	\
-@@ -1573,11 +2241,11 @@
+@@ -1573,11 +2241,11 @@ compiler."
  	command="$base_compile $qsrcfile $pic_flag"
        fi
        if test "$compiler_c_o" = yes; then
@@ -3284,7 +3284,7 @@ Index: binutils-2.21/ltmain.sh
        func_show_eval_locale "$command" \
          '$opt_dry_run || $RM $removelist; exit $EXIT_FAILURE'
  
-@@ -1622,13 +2290,13 @@
+@@ -1622,13 +2290,13 @@ compiler."
  }
  
  $opt_help || {
@@ -3300,7 +3300,7 @@ Index: binutils-2.21/ltmain.sh
        "")
          # Generic help is extracted from the usage comments
          # at the start of this file.
-@@ -1659,8 +2327,8 @@
+@@ -1659,8 +2327,8 @@ This mode accepts the following addition
  
    -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
    -no-suppress      do not suppress compiler output for multiple passes
@@ -3311,7 +3311,7 @@ Index: binutils-2.21/ltmain.sh
    -shared           do not build a \`.o' file suitable for static linking
    -static           only build a \`.o' file suitable for static linking
    -Wc,FLAG          pass FLAG directly to the compiler
-@@ -1804,7 +2472,7 @@
+@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted u
          ;;
  
        *)
@@ -3320,7 +3320,7 @@ Index: binutils-2.21/ltmain.sh
          ;;
      esac
  
-@@ -1819,13 +2487,13 @@
+@@ -1819,13 +2487,13 @@ if $opt_help; then
    else
      {
        func_help noexit
@@ -3336,7 +3336,7 @@ Index: binutils-2.21/ltmain.sh
  	echo
  	func_mode_help
        done
-@@ -1854,13 +2522,16 @@
+@@ -1854,13 +2522,16 @@ func_mode_execute ()
        func_fatal_help "you must specify a COMMAND"
  
      # Handle -dlopen flags immediately.
@@ -3354,7 +3354,7 @@ Index: binutils-2.21/ltmain.sh
  	# Check to see that this really is a libtool archive.
  	func_lalib_unsafe_p "$file" \
  	  || func_fatal_help "\`$lib' is not a valid libtool archive"
-@@ -1882,7 +2553,7 @@
+@@ -1882,7 +2553,7 @@ func_mode_execute ()
  	dir="$func_dirname_result"
  
  	if test -f "$dir/$objdir/$dlname"; then
@@ -3363,7 +3363,7 @@ Index: binutils-2.21/ltmain.sh
  	else
  	  if test ! -f "$dir/$dlname"; then
  	    func_fatal_error "cannot find \`$dlname' in \`$dir' or \`$dir/$objdir'"
-@@ -1907,10 +2578,10 @@
+@@ -1907,10 +2578,10 @@ func_mode_execute ()
        test -n "$absdir" && dir="$absdir"
  
        # Now add the directory to shlibpath_var.
@@ -3377,7 +3377,7 @@ Index: binutils-2.21/ltmain.sh
        fi
      done
  
-@@ -1939,8 +2610,7 @@
+@@ -1939,8 +2610,7 @@ func_mode_execute ()
  	;;
        esac
        # Quote arguments (to preserve shell metacharacters).
@@ -3387,7 +3387,7 @@ Index: binutils-2.21/ltmain.sh
      done
  
      if test "X$opt_dry_run" = Xfalse; then
-@@ -1972,22 +2642,59 @@
+@@ -1972,22 +2642,59 @@ func_mode_execute ()
      fi
  }
  
@@ -3454,7 +3454,7 @@ Index: binutils-2.21/ltmain.sh
        for libdir in $libdirs; do
  	if test -n "$finish_cmds"; then
  	  # Do each command in the finish commands.
-@@ -1997,7 +2704,7 @@
+@@ -1997,7 +2704,7 @@ func_mode_finish ()
  	if test -n "$finish_eval"; then
  	  # Do the single finish_eval.
  	  eval cmds=\"$finish_eval\"
@@ -3463,7 +3463,7 @@ Index: binutils-2.21/ltmain.sh
         $cmds"
  	fi
        done
-@@ -2006,53 +2713,55 @@
+@@ -2006,53 +2713,55 @@ func_mode_finish ()
      # Exit here if they wanted silent mode.
      $opt_silent && exit $EXIT_SUCCESS
  
@@ -3561,7 +3561,7 @@ Index: binutils-2.21/ltmain.sh
  
  
  # func_mode_install arg...
-@@ -2077,7 +2786,7 @@
+@@ -2077,7 +2786,7 @@ func_mode_install ()
      # The real first argument should be the name of the installation program.
      # Aesthetically quote it.
      func_quote_for_eval "$arg"
@@ -3570,7 +3570,7 @@ Index: binutils-2.21/ltmain.sh
      install_shared_prog=$install_prog
      case " $install_prog " in
        *[\\\ /]cp\ *) install_cp=: ;;
-@@ -2097,7 +2806,7 @@
+@@ -2097,7 +2806,7 @@ func_mode_install ()
      do
        arg2=
        if test -n "$dest"; then
@@ -3579,7 +3579,7 @@ Index: binutils-2.21/ltmain.sh
  	dest=$arg
  	continue
        fi
-@@ -2135,11 +2844,11 @@
+@@ -2135,11 +2844,11 @@ func_mode_install ()
  
        # Aesthetically quote the argument.
        func_quote_for_eval "$arg"
@@ -3593,7 +3593,7 @@ Index: binutils-2.21/ltmain.sh
      done
  
      test -z "$install_prog" && \
-@@ -2151,7 +2860,7 @@
+@@ -2151,7 +2860,7 @@ func_mode_install ()
      if test -n "$install_override_mode" && $no_mode; then
        if $install_cp; then :; else
  	func_quote_for_eval "$install_override_mode"
@@ -3602,7 +3602,7 @@ Index: binutils-2.21/ltmain.sh
        fi
      fi
  
-@@ -2209,10 +2918,13 @@
+@@ -2209,10 +2918,13 @@ func_mode_install ()
        case $file in
        *.$libext)
  	# Do the static libraries later.
@@ -3617,7 +3617,7 @@ Index: binutils-2.21/ltmain.sh
  	# Check to see that this really is a libtool archive.
  	func_lalib_unsafe_p "$file" \
  	  || func_fatal_help "\`$file' is not a valid libtool archive"
-@@ -2226,23 +2938,30 @@
+@@ -2226,23 +2938,30 @@ func_mode_install ()
  	if test "X$destdir" = "X$libdir"; then
  	  case "$current_libdirs " in
  	  *" $libdir "*) ;;
@@ -3652,7 +3652,7 @@ Index: binutils-2.21/ltmain.sh
  
  	  # Don't allow the user to place us outside of our expected
  	  # location b/c this prevents finding dependent libraries that
-@@ -2315,7 +3034,7 @@
+@@ -2315,7 +3034,7 @@ func_mode_install ()
  	func_show_eval "$install_prog $instname $destdir/$name" 'exit $?'
  
  	# Maybe install the static library, too.
@@ -3661,7 +3661,7 @@ Index: binutils-2.21/ltmain.sh
  	;;
  
        *.lo)
-@@ -2503,7 +3222,7 @@
+@@ -2503,7 +3222,7 @@ func_mode_install ()
      test -n "$future_libdirs" && \
        func_warning "remember to run \`$progname --finish$future_libdirs'"
  
@@ -3670,7 +3670,7 @@ Index: binutils-2.21/ltmain.sh
        # Maybe just do a dry run.
        $opt_dry_run && current_libdirs=" -n$current_libdirs"
        exec_cmd='$SHELL $progpath $preserve_args --finish$current_libdirs'
-@@ -2512,7 +3231,7 @@
+@@ -2512,7 +3231,7 @@ func_mode_install ()
      fi
  }
  
@@ -3679,7 +3679,7 @@ Index: binutils-2.21/ltmain.sh
  
  
  # func_generate_dlsyms outputname originator pic_p
-@@ -2559,6 +3278,18 @@
+@@ -2559,6 +3278,18 @@ extern \"C\" {
  #pragma GCC diagnostic ignored \"-Wstrict-prototypes\"
  #endif
  
@@ -3698,7 +3698,7 @@ Index: binutils-2.21/ltmain.sh
  /* External symbol declarations for the compiler. */\
  "
  
-@@ -2570,21 +3301,22 @@
+@@ -2570,21 +3301,22 @@ extern \"C\" {
  	  # Add our own program objects to the symbol list.
  	  progfiles=`$ECHO "$objs$old_deplibs" | $SP2NL | $SED "$lo2o" | $NL2SP`
  	  for progfile in $progfiles; do
@@ -3727,7 +3727,7 @@ Index: binutils-2.21/ltmain.sh
  	    }
  	  fi
  
-@@ -2593,23 +3325,23 @@
+@@ -2593,23 +3325,23 @@ extern \"C\" {
  	    export_symbols="$output_objdir/$outputname.exp"
  	    $opt_dry_run || {
  	      $RM $export_symbols
@@ -3759,7 +3759,7 @@ Index: binutils-2.21/ltmain.sh
  	          ;;
  	      esac
  	    }
-@@ -2620,10 +3352,52 @@
+@@ -2620,10 +3352,52 @@ extern \"C\" {
  	  func_verbose "extracting global C symbols from \`$dlprefile'"
  	  func_basename "$dlprefile"
  	  name="$func_basename_result"
@@ -3816,7 +3816,7 @@ Index: binutils-2.21/ltmain.sh
  	done
  
  	$opt_dry_run || {
-@@ -2661,26 +3435,9 @@
+@@ -2661,26 +3435,9 @@ typedef struct {
    const char *name;
    void *address;
  } lt_dlsymlist;
@@ -3845,7 +3845,7 @@ Index: binutils-2.21/ltmain.sh
  lt_${my_prefix}_LTX_preloaded_symbols[] =
  {\
    { \"$my_originator\", (void *) 0 },"
-@@ -2736,7 +3493,7 @@
+@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup() 
  	for arg in $LTCFLAGS; do
  	  case $arg in
  	  -pie | -fpie | -fPIE) ;;
@@ -3854,7 +3854,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	done
  
-@@ -2796,9 +3553,11 @@
+@@ -2796,9 +3553,11 @@ func_win32_libid ()
      win32_libid_type="x86 archive import"
      ;;
    *ar\ archive*) # could be an import, or static
@@ -3869,7 +3869,7 @@ Index: binutils-2.21/ltmain.sh
  	$SED -n -e '
  	    1,100{
  		/ I /{
-@@ -2827,6 +3586,131 @@
+@@ -2827,6 +3586,131 @@ func_win32_libid ()
    $ECHO "$win32_libid_type"
  }
  
@@ -4001,7 +4001,7 @@ Index: binutils-2.21/ltmain.sh
  
  
  # func_extract_an_archive dir oldlib
-@@ -2917,7 +3801,7 @@
+@@ -2917,7 +3801,7 @@ func_extract_archives ()
  	    darwin_file=
  	    darwin_files=
  	    for darwin_file in $darwin_filelist; do
@@ -4010,7 +4010,7 @@ Index: binutils-2.21/ltmain.sh
  	      $LIPO -create -output "$darwin_file" $darwin_files
  	    done # $darwin_filelist
  	    $RM -rf unfat-$$
-@@ -2932,7 +3816,7 @@
+@@ -2932,7 +3816,7 @@ func_extract_archives ()
          func_extract_an_archive "$my_xdir" "$my_xabs"
  	;;
        esac
@@ -4019,7 +4019,7 @@ Index: binutils-2.21/ltmain.sh
      done
  
      func_extract_archives_result="$my_oldobjs"
-@@ -3014,7 +3898,110 @@
+@@ -3014,7 +3898,110 @@ func_fallback_echo ()
  _LTECHO_EOF'
  }
      ECHO=\"$qECHO\"
@@ -4131,7 +4131,7 @@ Index: binutils-2.21/ltmain.sh
  
    # Find the directory that this script lives in.
    thisdir=\`\$ECHO \"\$file\" | $SED 's%/[^/]*$%%'\`
-@@ -3078,7 +4065,7 @@
+@@ -3078,7 +4065,7 @@ _LTECHO_EOF'
  
      # relink executable if necessary
      if test -n \"\$relink_command\"; then
@@ -4140,7 +4140,7 @@ Index: binutils-2.21/ltmain.sh
        else
  	$ECHO \"\$relink_command_output\" >&2
  	$RM \"\$progdir/\$file\"
-@@ -3102,6 +4089,18 @@
+@@ -3102,6 +4089,18 @@ _LTECHO_EOF'
  
    if test -f \"\$progdir/\$program\"; then"
  
@@ -4159,7 +4159,7 @@ Index: binutils-2.21/ltmain.sh
  	# Export our shlibpath_var if we have one.
  	if test "$shlibpath_overrides_runpath" = yes && test -n "$shlibpath_var" && test -n "$temp_rpath"; then
  	  $ECHO "\
-@@ -3116,35 +4115,10 @@
+@@ -3116,35 +4115,10 @@ _LTECHO_EOF'
  "
  	fi
  
@@ -4196,7 +4196,7 @@ Index: binutils-2.21/ltmain.sh
      fi
    else
      # The program doesn't exist.
-@@ -3158,166 +4132,6 @@
+@@ -3158,166 +4132,6 @@ fi\
  }
  
  
@@ -4363,7 +4363,7 @@ Index: binutils-2.21/ltmain.sh
  # func_emit_cwrapperexe_src
  # emit the source code for a wrapper executable on stdout
  # Must ONLY be called from within func_mode_link because
-@@ -3334,10 +4148,6 @@
+@@ -3334,10 +4148,6 @@ func_emit_cwrapperexe_src ()
  
     This wrapper executable should never be moved out of the build directory.
     If it is, it will not operate correctly.
@@ -4374,7 +4374,7 @@ Index: binutils-2.21/ltmain.sh
  */
  EOF
  	    cat <<"EOF"
-@@ -3462,22 +4272,13 @@
+@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *, 
    if (stale) { free ((void *) stale); stale = 0; } \
  } while (0)
  
@@ -4401,7 +4401,7 @@ Index: binutils-2.21/ltmain.sh
  
  void *xmalloc (size_t num);
  char *xstrdup (const char *string);
-@@ -3487,7 +4288,10 @@
+@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathsp
  int make_executable (const char *path);
  int check_executable (const char *path);
  char *strendzap (char *str, const char *pat);
@@ -4413,7 +4413,7 @@ Index: binutils-2.21/ltmain.sh
  void lt_setenv (const char *name, const char *value);
  char *lt_extend_str (const char *orig_value, const char *add, int to_end);
  void lt_update_exe_path (const char *name, const char *value);
-@@ -3497,14 +4301,14 @@
+@@ -3497,14 +4301,14 @@ void lt_dump_script (FILE *f);
  EOF
  
  	    cat <<EOF
@@ -4431,7 +4431,7 @@ Index: binutils-2.21/ltmain.sh
  EOF
  	    else
  	      cat <<"EOF"
-@@ -3513,10 +4317,10 @@
+@@ -3513,10 +4317,10 @@ EOF
  	    fi
  
  	    if test -n "$dllsearchpath"; then
@@ -4444,7 +4444,7 @@ Index: binutils-2.21/ltmain.sh
  EOF
  	    else
  	      cat <<"EOF"
-@@ -3539,12 +4343,10 @@
+@@ -3539,12 +4343,10 @@ EOF
  	    cat <<"EOF"
  
  #define LTWRAPPER_OPTION_PREFIX         "--lt-"
@@ -4458,7 +4458,7 @@ Index: binutils-2.21/ltmain.sh
  
  int
  main (int argc, char *argv[])
-@@ -3561,10 +4363,13 @@
+@@ -3561,10 +4363,13 @@ main (int argc, char *argv[])
    int i;
  
    program_name = (char *) xstrdup (base_name (argv[0]));
@@ -4475,7 +4475,7 @@ Index: binutils-2.21/ltmain.sh
    for (i = 1; i < argc; i++)
      {
        if (strcmp (argv[i], dumpscript_opt) == 0)
-@@ -3581,21 +4386,54 @@
+@@ -3581,21 +4386,54 @@ EOF
  	  lt_dump_script (stdout);
  	  return 0;
  	}
@@ -4537,7 +4537,7 @@ Index: binutils-2.21/ltmain.sh
    strendzap (actual_cwrapper_path, actual_cwrapper_name);
  
    /* wrapper name transforms */
-@@ -3613,8 +4451,9 @@
+@@ -3613,8 +4451,9 @@ EOF
    target_name = tmp_pathspec;
    tmp_pathspec = 0;
  
@@ -4549,7 +4549,7 @@ Index: binutils-2.21/ltmain.sh
  EOF
  
  	    cat <<EOF
-@@ -3664,35 +4503,19 @@
+@@ -3664,35 +4503,19 @@ EOF
  
    lt_setenv ("BIN_SH", "xpg4"); /* for Tru64 */
    lt_setenv ("DUALCASE", "1");  /* for MSK sh */
@@ -4594,7 +4594,7 @@ Index: binutils-2.21/ltmain.sh
      }
  
  EOF
-@@ -3706,7 +4529,9 @@
+@@ -3706,7 +4529,9 @@ EOF
    if (rval == -1)
      {
        /* failed to start process */
@@ -4605,7 +4605,7 @@ Index: binutils-2.21/ltmain.sh
        return 127;
      }
    return rval;
-@@ -3728,7 +4553,7 @@
+@@ -3728,7 +4553,7 @@ xmalloc (size_t num)
  {
    void *p = (void *) malloc (num);
    if (!p)
@@ -4614,7 +4614,7 @@ Index: binutils-2.21/ltmain.sh
  
    return p;
  }
-@@ -3762,8 +4587,8 @@
+@@ -3762,8 +4587,8 @@ check_executable (const char *path)
  {
    struct stat st;
  
@@ -4625,7 +4625,7 @@ Index: binutils-2.21/ltmain.sh
    if ((!path) || (!*path))
      return 0;
  
-@@ -3780,8 +4605,8 @@
+@@ -3780,8 +4605,8 @@ make_executable (const char *path)
    int rval = 0;
    struct stat st;
  
@@ -4636,7 +4636,7 @@ Index: binutils-2.21/ltmain.sh
    if ((!path) || (!*path))
      return 0;
  
-@@ -3807,8 +4632,8 @@
+@@ -3807,8 +4632,8 @@ find_executable (const char *wrapper)
    int tmp_len;
    char *concat_name;
  
@@ -4647,7 +4647,7 @@ Index: binutils-2.21/ltmain.sh
  
    if ((wrapper == NULL) || (*wrapper == '\0'))
      return NULL;
-@@ -3861,7 +4686,8 @@
+@@ -3861,7 +4686,8 @@ find_executable (const char *wrapper)
  		{
  		  /* empty path: current directory */
  		  if (getcwd (tmp, LT_PATHMAX) == NULL)
@@ -4657,7 +4657,7 @@ Index: binutils-2.21/ltmain.sh
  		  tmp_len = strlen (tmp);
  		  concat_name =
  		    XMALLOC (char, tmp_len + 1 + strlen (wrapper) + 1);
-@@ -3886,7 +4712,8 @@
+@@ -3886,7 +4712,8 @@ find_executable (const char *wrapper)
      }
    /* Relative path | not found in path: prepend cwd */
    if (getcwd (tmp, LT_PATHMAX) == NULL)
@@ -4667,7 +4667,7 @@ Index: binutils-2.21/ltmain.sh
    tmp_len = strlen (tmp);
    concat_name = XMALLOC (char, tmp_len + 1 + strlen (wrapper) + 1);
    memcpy (concat_name, tmp, tmp_len);
-@@ -3912,8 +4739,9 @@
+@@ -3912,8 +4739,9 @@ chase_symlinks (const char *pathspec)
    int has_symlinks = 0;
    while (strlen (tmp_pathspec) && !has_symlinks)
      {
@@ -4679,7 +4679,7 @@ Index: binutils-2.21/ltmain.sh
        if (lstat (tmp_pathspec, &s) == 0)
  	{
  	  if (S_ISLNK (s.st_mode) != 0)
-@@ -3935,8 +4763,9 @@
+@@ -3935,8 +4763,9 @@ chase_symlinks (const char *pathspec)
  	}
        else
  	{
@@ -4691,7 +4691,7 @@ Index: binutils-2.21/ltmain.sh
  	}
      }
    XFREE (tmp_pathspec);
-@@ -3949,7 +4778,8 @@
+@@ -3949,7 +4778,8 @@ chase_symlinks (const char *pathspec)
    tmp_pathspec = realpath (pathspec, buf);
    if (tmp_pathspec == 0)
      {
@@ -4701,7 +4701,7 @@ Index: binutils-2.21/ltmain.sh
      }
    return xstrdup (tmp_pathspec);
  #endif
-@@ -3975,11 +4805,25 @@
+@@ -3975,11 +4805,25 @@ strendzap (char *str, const char *pat)
    return str;
  }
  
@@ -4729,7 +4729,7 @@ Index: binutils-2.21/ltmain.sh
    vfprintf (stderr, message, ap);
    fprintf (stderr, ".\n");
  
-@@ -3988,20 +4832,32 @@
+@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const ch
  }
  
  void
@@ -4767,7 +4767,7 @@ Index: binutils-2.21/ltmain.sh
    {
  #ifdef HAVE_SETENV
      /* always make a copy, for consistency with !HAVE_SETENV */
-@@ -4049,9 +4905,9 @@
+@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, c
  void
  lt_update_exe_path (const char *name, const char *value)
  {
@@ -4780,7 +4780,7 @@ Index: binutils-2.21/ltmain.sh
  
    if (name && *name && value && *value)
      {
-@@ -4070,9 +4926,9 @@
+@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, co
  void
  lt_update_lib_path (const char *name, const char *value)
  {
@@ -4793,7 +4793,7 @@ Index: binutils-2.21/ltmain.sh
  
    if (name && *name && value && *value)
      {
-@@ -4222,7 +5078,7 @@
+@@ -4222,7 +5078,7 @@ EOF
  func_win32_import_lib_p ()
  {
      $opt_debug
@@ -4802,7 +4802,7 @@ Index: binutils-2.21/ltmain.sh
      *import*) : ;;
      *) false ;;
      esac
-@@ -4401,9 +5257,9 @@
+@@ -4401,9 +5257,9 @@ func_mode_link ()
  	    ;;
  	  *)
  	    if test "$prev" = dlfiles; then
@@ -4814,7 +4814,7 @@ Index: binutils-2.21/ltmain.sh
  	    fi
  	    prev=
  	    continue
-@@ -4427,7 +5283,7 @@
+@@ -4427,7 +5283,7 @@ func_mode_link ()
  	    *-*-darwin*)
  	      case "$deplibs " in
  		*" $qarg.ltframework "*) ;;
@@ -4823,7 +4823,7 @@ Index: binutils-2.21/ltmain.sh
  		   ;;
  	      esac
  	      ;;
-@@ -4446,7 +5302,7 @@
+@@ -4446,7 +5302,7 @@ func_mode_link ()
  	    moreargs=
  	    for fil in `cat "$save_arg"`
  	    do
@@ -4832,7 +4832,7 @@ Index: binutils-2.21/ltmain.sh
  	      arg=$fil
  	      # A libtool-controlled object.
  
-@@ -4475,7 +5331,7 @@
+@@ -4475,7 +5331,7 @@ func_mode_link ()
  
  		  if test "$prev" = dlfiles; then
  		    if test "$build_libtool_libs" = yes && test "$dlopen_support" = yes; then
@@ -4841,7 +4841,7 @@ Index: binutils-2.21/ltmain.sh
  		      prev=
  		      continue
  		    else
-@@ -4487,7 +5343,7 @@
+@@ -4487,7 +5343,7 @@ func_mode_link ()
  		  # CHECK ME:  I think I busted this.  -Ossama
  		  if test "$prev" = dlprefiles; then
  		    # Preload the old-style object.
@@ -4850,7 +4850,7 @@ Index: binutils-2.21/ltmain.sh
  		    prev=
  		  fi
  
-@@ -4557,12 +5413,12 @@
+@@ -4557,12 +5413,12 @@ func_mode_link ()
  	  if test "$prev" = rpath; then
  	    case "$rpath " in
  	    *" $arg "*) ;;
@@ -4865,7 +4865,7 @@ Index: binutils-2.21/ltmain.sh
  	    esac
  	  fi
  	  prev=
-@@ -4574,28 +5430,28 @@
+@@ -4574,28 +5430,28 @@ func_mode_link ()
  	  continue
  	  ;;
  	weak)
@@ -4900,7 +4900,7 @@ Index: binutils-2.21/ltmain.sh
  	  prev=
  	  func_append compile_command " $wl$qarg"
  	  func_append finalize_command " $wl$qarg"
-@@ -4686,15 +5542,16 @@
+@@ -4686,15 +5542,16 @@ func_mode_link ()
  	;;
  
        -L*)
@@ -4920,7 +4920,7 @@ Index: binutils-2.21/ltmain.sh
  	# We need an absolute path.
  	case $dir in
  	[\\/]* | [A-Za-z]:[\\/]*) ;;
-@@ -4706,10 +5563,16 @@
+@@ -4706,10 +5563,16 @@ func_mode_link ()
  	  ;;
  	esac
  	case "$deplibs " in
@@ -4940,7 +4940,7 @@ Index: binutils-2.21/ltmain.sh
  	  ;;
  	esac
  	case $host in
-@@ -4718,12 +5581,12 @@
+@@ -4718,12 +5581,12 @@ func_mode_link ()
  	  case :$dllsearchpath: in
  	  *":$dir:"*) ;;
  	  ::) dllsearchpath=$dir;;
@@ -4955,7 +4955,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	  ;;
  	esac
-@@ -4747,7 +5610,7 @@
+@@ -4747,7 +5610,7 @@ func_mode_link ()
  	    ;;
  	  *-*-rhapsody* | *-*-darwin1.[012])
  	    # Rhapsody C and math libraries are in the System framework
@@ -4964,7 +4964,7 @@ Index: binutils-2.21/ltmain.sh
  	    continue
  	    ;;
  	  *-*-sco3.2v5* | *-*-sco5v6*)
-@@ -4758,9 +5621,6 @@
+@@ -4758,9 +5621,6 @@ func_mode_link ()
  	    # Compiler inserts libc in the correct place for threads to work
  	    test "X$arg" = "X-lc" && continue
  	    ;;
@@ -4974,7 +4974,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	elif test "X$arg" = "X-lc_r"; then
  	 case $host in
-@@ -4770,7 +5630,7 @@
+@@ -4770,7 +5630,7 @@ func_mode_link ()
  	   ;;
  	 esac
  	fi
@@ -4983,7 +4983,7 @@ Index: binutils-2.21/ltmain.sh
  	continue
  	;;
  
-@@ -4782,8 +5642,8 @@
+@@ -4782,8 +5642,8 @@ func_mode_link ()
        # Tru64 UNIX uses -model [arg] to determine the layout of C++
        # classes, name mangling, and exception handling.
        # Darwin uses the -arch flag to determine output architecture.
@@ -4994,7 +4994,7 @@ Index: binutils-2.21/ltmain.sh
  	func_append compile_command " $arg"
  	func_append finalize_command " $arg"
  	prev=xcompiler
-@@ -4791,12 +5651,12 @@
+@@ -4791,12 +5651,12 @@ func_mode_link ()
  	;;
  
        -mt|-mthreads|-kthread|-Kthread|-pthread|-pthreads|--thread-safe|-threads)
@@ -5009,7 +5009,7 @@ Index: binutils-2.21/ltmain.sh
  	esac
  	continue
  	;;
-@@ -4863,13 +5723,17 @@
+@@ -4863,13 +5723,17 @@ func_mode_link ()
  	# We need an absolute path.
  	case $dir in
  	[\\/]* | [A-Za-z]:[\\/]*) ;;
@@ -5028,7 +5028,7 @@ Index: binutils-2.21/ltmain.sh
  	esac
  	continue
  	;;
-@@ -4922,8 +5786,8 @@
+@@ -4922,8 +5786,8 @@ func_mode_link ()
  	for flag in $args; do
  	  IFS="$save_ifs"
            func_quote_for_eval "$flag"
@@ -5039,7 +5039,7 @@ Index: binutils-2.21/ltmain.sh
  	done
  	IFS="$save_ifs"
  	func_stripname ' ' '' "$arg"
-@@ -4938,9 +5802,9 @@
+@@ -4938,9 +5802,9 @@ func_mode_link ()
  	for flag in $args; do
  	  IFS="$save_ifs"
            func_quote_for_eval "$flag"
@@ -5052,7 +5052,7 @@ Index: binutils-2.21/ltmain.sh
  	done
  	IFS="$save_ifs"
  	func_stripname ' ' '' "$arg"
-@@ -4968,24 +5832,27 @@
+@@ -4968,24 +5832,27 @@ func_mode_link ()
  	arg="$func_quote_for_eval_result"
  	;;
  
@@ -5093,7 +5093,7 @@ Index: binutils-2.21/ltmain.sh
          continue
          ;;
  
-@@ -4997,7 +5864,7 @@
+@@ -4997,7 +5864,7 @@ func_mode_link ()
  
        *.$objext)
  	# A standard object.
@@ -5102,7 +5102,7 @@ Index: binutils-2.21/ltmain.sh
  	;;
  
        *.lo)
-@@ -5028,7 +5895,7 @@
+@@ -5028,7 +5895,7 @@ func_mode_link ()
  
  	    if test "$prev" = dlfiles; then
  	      if test "$build_libtool_libs" = yes && test "$dlopen_support" = yes; then
@@ -5111,7 +5111,7 @@ Index: binutils-2.21/ltmain.sh
  		prev=
  		continue
  	      else
-@@ -5040,7 +5907,7 @@
+@@ -5040,7 +5907,7 @@ func_mode_link ()
  	    # CHECK ME:  I think I busted this.  -Ossama
  	    if test "$prev" = dlprefiles; then
  	      # Preload the old-style object.
@@ -5120,7 +5120,7 @@ Index: binutils-2.21/ltmain.sh
  	      prev=
  	    fi
  
-@@ -5085,24 +5952,25 @@
+@@ -5085,24 +5952,25 @@ func_mode_link ()
  
        *.$libext)
  	# An archive.
@@ -5151,7 +5151,7 @@ Index: binutils-2.21/ltmain.sh
  	fi
  	continue
  	;;
-@@ -5127,7 +5995,7 @@
+@@ -5127,7 +5995,7 @@ func_mode_link ()
        func_fatal_help "the \`$prevarg' option requires an argument"
  
      if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then
@@ -5160,7 +5160,7 @@ Index: binutils-2.21/ltmain.sh
        func_append compile_command " $arg"
        func_append finalize_command " $arg"
      fi
-@@ -5144,11 +6012,13 @@
+@@ -5144,11 +6012,13 @@ func_mode_link ()
      else
        shlib_search_path=
      fi
@@ -5176,7 +5176,7 @@ Index: binutils-2.21/ltmain.sh
      # Create the object directory.
      func_mkdir_p "$output_objdir"
  
-@@ -5169,12 +6039,12 @@
+@@ -5169,12 +6039,12 @@ func_mode_link ()
      # Find all interdependent deplibs by searching for libraries
      # that are linked more than once (e.g. -la -lb -la)
      for deplib in $deplibs; do
@@ -5192,7 +5192,7 @@ Index: binutils-2.21/ltmain.sh
      done
  
      if test "$linkmode" = lib; then
-@@ -5187,9 +6057,9 @@
+@@ -5187,9 +6057,9 @@ func_mode_link ()
        if $opt_duplicate_compiler_generated_deps; then
  	for pre_post_dep in $predeps $postdeps; do
  	  case "$pre_post_deps " in
@@ -5204,7 +5204,7 @@ Index: binutils-2.21/ltmain.sh
  	done
        fi
        pre_post_deps=
-@@ -5256,8 +6126,9 @@
+@@ -5256,8 +6126,9 @@ func_mode_link ()
  	for lib in $dlprefiles; do
  	  # Ignore non-libtool-libs
  	  dependency_libs=
@@ -5215,7 +5215,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  
  	  # Collect preopened libtool deplibs, except any this library
-@@ -5267,7 +6138,7 @@
+@@ -5267,7 +6138,7 @@ func_mode_link ()
              deplib_base=$func_basename_result
  	    case " $weak_libs " in
  	    *" $deplib_base "*) ;;
@@ -5224,7 +5224,7 @@ Index: binutils-2.21/ltmain.sh
  	    esac
  	  done
  	done
-@@ -5288,11 +6159,11 @@
+@@ -5288,11 +6159,11 @@ func_mode_link ()
  	    compile_deplibs="$deplib $compile_deplibs"
  	    finalize_deplibs="$deplib $finalize_deplibs"
  	  else
@@ -5238,7 +5238,7 @@ Index: binutils-2.21/ltmain.sh
  		esac
  	    fi
  	  fi
-@@ -5377,7 +6248,7 @@
+@@ -5377,7 +6248,7 @@ func_mode_link ()
  	    if test "$linkmode" = lib ; then
  		case "$new_inherited_linker_flags " in
  		    *" $deplib "*) ;;
@@ -5247,7 +5247,7 @@ Index: binutils-2.21/ltmain.sh
  		esac
  	    fi
  	  fi
-@@ -5390,7 +6261,8 @@
+@@ -5390,7 +6261,8 @@ func_mode_link ()
  	    test "$pass" = conv && continue
  	    newdependency_libs="$deplib $newdependency_libs"
  	    func_stripname '-L' '' "$deplib"
@@ -5257,7 +5257,7 @@ Index: binutils-2.21/ltmain.sh
  	    ;;
  	  prog)
  	    if test "$pass" = conv; then
-@@ -5404,7 +6276,8 @@
+@@ -5404,7 +6276,8 @@ func_mode_link ()
  	      finalize_deplibs="$deplib $finalize_deplibs"
  	    fi
  	    func_stripname '-L' '' "$deplib"
@@ -5267,7 +5267,7 @@ Index: binutils-2.21/ltmain.sh
  	    ;;
  	  *)
  	    func_warning "\`-L' is ignored for archives/objects"
-@@ -5415,17 +6288,21 @@
+@@ -5415,17 +6288,21 @@ func_mode_link ()
  	-R*)
  	  if test "$pass" = link; then
  	    func_stripname '-R' '' "$deplib"
@@ -5292,7 +5292,7 @@ Index: binutils-2.21/ltmain.sh
  	*.$libext)
  	  if test "$pass" = conv; then
  	    deplibs="$deplib $deplibs"
-@@ -5488,11 +6365,11 @@
+@@ -5488,11 +6365,11 @@ func_mode_link ()
  	    if test "$pass" = dlpreopen || test "$dlopen_support" != yes || test "$build_libtool_libs" = no; then
  	      # If there is no dlopen support or we're linking statically,
  	      # we need to preload.
@@ -5306,7 +5306,7 @@ Index: binutils-2.21/ltmain.sh
  	    fi
  	  fi
  	  continue
-@@ -5538,7 +6415,7 @@
+@@ -5538,7 +6415,7 @@ func_mode_link ()
  	  for tmp_inherited_linker_flag in $tmp_inherited_linker_flags; do
  	    case " $new_inherited_linker_flags " in
  	      *" $tmp_inherited_linker_flag "*) ;;
@@ -5315,7 +5315,7 @@ Index: binutils-2.21/ltmain.sh
  	    esac
  	  done
  	fi
-@@ -5546,8 +6423,8 @@
+@@ -5546,8 +6423,8 @@ func_mode_link ()
  	if test "$linkmode,$pass" = "lib,link" ||
  	   test "$linkmode,$pass" = "prog,scan" ||
  	   { test "$linkmode" != prog && test "$linkmode" != lib; }; then
@@ -5326,7 +5326,7 @@ Index: binutils-2.21/ltmain.sh
  	fi
  
  	if test "$pass" = conv; then
-@@ -5558,20 +6435,20 @@
+@@ -5558,20 +6435,20 @@ func_mode_link ()
  	      func_fatal_error "cannot find name of link library for \`$lib'"
  	    fi
  	    # It is a libtool convenience library, so add in its objects.
@@ -5352,7 +5352,7 @@ Index: binutils-2.21/ltmain.sh
  	  done
  	  continue
  	fi # $pass = conv
-@@ -5579,9 +6456,15 @@
+@@ -5579,9 +6456,15 @@ func_mode_link ()
  
  	# Get the name of the library we link against.
  	linklib=
@@ -5371,7 +5371,7 @@ Index: binutils-2.21/ltmain.sh
  	if test -z "$linklib"; then
  	  func_fatal_error "cannot find name of link library for \`$lib'"
  	fi
-@@ -5598,9 +6481,9 @@
+@@ -5598,9 +6481,9 @@ func_mode_link ()
  	    # statically, we need to preload.  We also need to preload any
  	    # dependent libraries so libltdl's deplib preloader doesn't
  	    # bomb out in the load deplibs phase.
@@ -5383,7 +5383,7 @@ Index: binutils-2.21/ltmain.sh
  	  fi
  	  continue
  	fi # $pass = dlopen
-@@ -5622,14 +6505,14 @@
+@@ -5622,14 +6505,14 @@ func_mode_link ()
  
  	# Find the relevant object directory and library name.
  	if test "X$installed" = Xyes; then
@@ -5401,7 +5401,7 @@ Index: binutils-2.21/ltmain.sh
  	  fi
  	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
  	else
-@@ -5637,12 +6520,12 @@
+@@ -5637,12 +6520,12 @@ func_mode_link ()
  	    dir="$ladir"
  	    absdir="$abs_ladir"
  	    # Remove this search path later
@@ -5416,7 +5416,7 @@ Index: binutils-2.21/ltmain.sh
  	  fi
  	fi # $installed = yes
  	func_stripname 'lib' '.la' "$laname"
-@@ -5653,20 +6536,46 @@
+@@ -5653,20 +6536,46 @@ func_mode_link ()
  	  if test -z "$libdir" && test "$linkmode" = prog; then
  	    func_fatal_error "only libraries may -dlpreopen a convenience library: \`$lib'"
  	  fi
@@ -5477,7 +5477,7 @@ Index: binutils-2.21/ltmain.sh
  	fi # $pass = dlpreopen
  
  	if test -z "$libdir"; then
-@@ -5684,7 +6593,7 @@
+@@ -5684,7 +6593,7 @@ func_mode_link ()
  
  
  	if test "$linkmode" = prog && test "$pass" != link; then
@@ -5486,7 +5486,7 @@ Index: binutils-2.21/ltmain.sh
  	  deplibs="$lib $deplibs"
  
  	  linkalldeplibs=no
-@@ -5697,7 +6606,8 @@
+@@ -5697,7 +6606,8 @@ func_mode_link ()
  	  for deplib in $dependency_libs; do
  	    case $deplib in
  	    -L*) func_stripname '-L' '' "$deplib"
@@ -5496,7 +5496,7 @@ Index: binutils-2.21/ltmain.sh
  		 ;;
  	    esac
  	    # Need to link against all dependency_libs?
-@@ -5708,12 +6618,12 @@
+@@ -5708,12 +6618,12 @@ func_mode_link ()
  	      # or/and link against static libraries
  	      newdependency_libs="$deplib $newdependency_libs"
  	    fi
@@ -5512,7 +5512,7 @@ Index: binutils-2.21/ltmain.sh
  	  done # for deplib
  	  continue
  	fi # $linkmode = prog...
-@@ -5728,7 +6638,7 @@
+@@ -5728,7 +6638,7 @@ func_mode_link ()
  	      # Make sure the rpath contains only unique directories.
  	      case "$temp_rpath:" in
  	      *"$absdir:"*) ;;
@@ -5521,7 +5521,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	    fi
  
-@@ -5740,7 +6650,7 @@
+@@ -5740,7 +6650,7 @@ func_mode_link ()
  	    *)
  	      case "$compile_rpath " in
  	      *" $absdir "*) ;;
@@ -5530,7 +5530,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	      ;;
  	    esac
-@@ -5749,7 +6659,7 @@
+@@ -5749,7 +6659,7 @@ func_mode_link ()
  	    *)
  	      case "$finalize_rpath " in
  	      *" $libdir "*) ;;
@@ -5539,7 +5539,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	      ;;
  	    esac
-@@ -5774,12 +6684,12 @@
+@@ -5774,12 +6684,12 @@ func_mode_link ()
  	  case $host in
  	  *cygwin* | *mingw* | *cegcc*)
  	      # No point in relinking DLLs because paths are not encoded
@@ -5554,7 +5554,7 @@ Index: binutils-2.21/ltmain.sh
  	      need_relink=yes
  	    fi
  	    ;;
-@@ -5814,7 +6724,7 @@
+@@ -5814,7 +6724,7 @@ func_mode_link ()
  	    *)
  	      case "$compile_rpath " in
  	      *" $absdir "*) ;;
@@ -5563,7 +5563,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	      ;;
  	    esac
-@@ -5823,7 +6733,7 @@
+@@ -5823,7 +6733,7 @@ func_mode_link ()
  	    *)
  	      case "$finalize_rpath " in
  	      *" $libdir "*) ;;
@@ -5572,7 +5572,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	      ;;
  	    esac
-@@ -5835,7 +6745,7 @@
+@@ -5835,7 +6745,7 @@ func_mode_link ()
  	    shift
  	    realname="$1"
  	    shift
@@ -5581,7 +5581,7 @@ Index: binutils-2.21/ltmain.sh
  	    # use dlname if we got it. it's perfectly good, no?
  	    if test -n "$dlname"; then
  	      soname="$dlname"
-@@ -5848,7 +6758,7 @@
+@@ -5848,7 +6758,7 @@ func_mode_link ()
  		versuffix="-$major"
  		;;
  	      esac
@@ -5590,7 +5590,7 @@ Index: binutils-2.21/ltmain.sh
  	    else
  	      soname="$realname"
  	    fi
-@@ -5877,7 +6787,7 @@
+@@ -5877,7 +6787,7 @@ func_mode_link ()
  	    linklib=$newlib
  	  fi # test -n "$old_archive_from_expsyms_cmds"
  
@@ -5599,7 +5599,7 @@ Index: binutils-2.21/ltmain.sh
  	    add_shlibpath=
  	    add_dir=
  	    add=
-@@ -5933,7 +6843,7 @@
+@@ -5933,7 +6843,7 @@ func_mode_link ()
  		if test -n "$inst_prefix_dir"; then
  		  case $libdir in
  		    [\\/]*)
@@ -5608,7 +5608,7 @@ Index: binutils-2.21/ltmain.sh
  		      ;;
  		  esac
  		fi
-@@ -5955,7 +6865,7 @@
+@@ -5955,7 +6865,7 @@ func_mode_link ()
  	    if test -n "$add_shlibpath"; then
  	      case :$compile_shlibpath: in
  	      *":$add_shlibpath:"*) ;;
@@ -5617,7 +5617,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	    fi
  	    if test "$linkmode" = prog; then
-@@ -5969,13 +6879,13 @@
+@@ -5969,13 +6879,13 @@ func_mode_link ()
  		 test "$hardcode_shlibpath_var" = yes; then
  		case :$finalize_shlibpath: in
  		*":$libdir:"*) ;;
@@ -5633,7 +5633,7 @@ Index: binutils-2.21/ltmain.sh
  	    add_shlibpath=
  	    add_dir=
  	    add=
-@@ -5989,7 +6899,7 @@
+@@ -5989,7 +6899,7 @@ func_mode_link ()
  	    elif test "$hardcode_shlibpath_var" = yes; then
  	      case :$finalize_shlibpath: in
  	      *":$libdir:"*) ;;
@@ -5642,7 +5642,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	      add="-l$name"
  	    elif test "$hardcode_automatic" = yes; then
-@@ -6001,12 +6911,12 @@
+@@ -6001,12 +6911,12 @@ func_mode_link ()
  	      fi
  	    else
  	      # We cannot seem to hardcode it, guess we'll fake it.
@@ -5657,7 +5657,7 @@ Index: binutils-2.21/ltmain.sh
  		    ;;
  		esac
  	      fi
-@@ -6083,27 +6993,33 @@
+@@ -6083,27 +6993,33 @@ func_mode_link ()
  	           temp_xrpath=$func_stripname_result
  		   case " $xrpath " in
  		   *" $temp_xrpath "*) ;;
@@ -5697,7 +5697,7 @@ Index: binutils-2.21/ltmain.sh
  	  done
  
  	  if test "$link_all_deplibs" != no; then
-@@ -6113,8 +7029,10 @@
+@@ -6113,8 +7029,10 @@ func_mode_link ()
  	      case $deplib in
  	      -L*) path="$deplib" ;;
  	      *.la)
@@ -5709,7 +5709,7 @@ Index: binutils-2.21/ltmain.sh
  		# We need an absolute path.
  		case $dir in
  		[\\/]* | [A-Za-z]:[\\/]*) absdir="$dir" ;;
-@@ -6130,7 +7048,7 @@
+@@ -6130,7 +7048,7 @@ func_mode_link ()
  		case $host in
  		*-*-darwin*)
  		  depdepl=
@@ -5718,7 +5718,7 @@ Index: binutils-2.21/ltmain.sh
  		  if test -n "$deplibrary_names" ; then
  		    for tmp in $deplibrary_names ; do
  		      depdepl=$tmp
-@@ -6141,8 +7059,8 @@
+@@ -6141,8 +7059,8 @@ func_mode_link ()
                        if test -z "$darwin_install_name"; then
                            darwin_install_name=`${OTOOL64} -L $depdepl  | awk '{if (NR == 2) {print $1;exit}}'`
                        fi
@@ -5729,7 +5729,7 @@ Index: binutils-2.21/ltmain.sh
  		      path=
  		    fi
  		  fi
-@@ -6152,7 +7070,7 @@
+@@ -6152,7 +7070,7 @@ func_mode_link ()
  		  ;;
  		esac
  		else
@@ -5738,7 +5738,7 @@ Index: binutils-2.21/ltmain.sh
  		  test -z "$libdir" && \
  		    func_fatal_error "\`$deplib' is not a valid libtool archive"
  		  test "$absdir" != "$libdir" && \
-@@ -6192,7 +7110,7 @@
+@@ -6192,7 +7110,7 @@ func_mode_link ()
  	  for dir in $newlib_search_path; do
  	    case "$lib_search_path " in
  	    *" $dir "*) ;;
@@ -5747,7 +5747,7 @@ Index: binutils-2.21/ltmain.sh
  	    esac
  	  done
  	  newlib_search_path=
-@@ -6205,7 +7123,7 @@
+@@ -6205,7 +7123,7 @@ func_mode_link ()
  	fi
  	for var in $vars dependency_libs; do
  	  # Add libraries to $var in reverse order
@@ -5756,7 +5756,7 @@ Index: binutils-2.21/ltmain.sh
  	  new_libs=
  	  for deplib in $tmp_libs; do
  	    # FIXME: Pedantically, this is the right thing to do, so
-@@ -6250,13 +7168,13 @@
+@@ -6250,13 +7168,13 @@ func_mode_link ()
  	    -L*)
  	      case " $tmp_libs " in
  	      *" $deplib "*) ;;
@@ -5773,7 +5773,7 @@ Index: binutils-2.21/ltmain.sh
  	done # for var
        fi
        # Last step: remove runtime libs from dependency_libs
-@@ -6269,7 +7187,7 @@
+@@ -6269,7 +7187,7 @@ func_mode_link ()
  	  ;;
  	esac
  	if test -n "$i" ; then
@@ -5782,7 +5782,7 @@ Index: binutils-2.21/ltmain.sh
  	fi
        done
        dependency_libs=$tmp_libs
-@@ -6310,7 +7228,7 @@
+@@ -6310,7 +7228,7 @@ func_mode_link ()
        # Now set the variables for building old libraries.
        build_libtool_libs=no
        oldlibs="$output"
@@ -5791,7 +5791,7 @@ Index: binutils-2.21/ltmain.sh
        ;;
  
      lib)
-@@ -6319,8 +7237,8 @@
+@@ -6319,8 +7237,8 @@ func_mode_link ()
        lib*)
  	func_stripname 'lib' '.la' "$outputname"
  	name=$func_stripname_result
@@ -5802,7 +5802,7 @@ Index: binutils-2.21/ltmain.sh
  	;;
        *)
  	test "$module" = no && \
-@@ -6330,8 +7248,8 @@
+@@ -6330,8 +7248,8 @@ func_mode_link ()
  	  # Add the "lib" prefix for modules if required
  	  func_stripname '' '.la' "$outputname"
  	  name=$func_stripname_result
@@ -5813,7 +5813,7 @@ Index: binutils-2.21/ltmain.sh
  	else
  	  func_stripname '' '.la' "$outputname"
  	  libname=$func_stripname_result
-@@ -6346,7 +7264,7 @@
+@@ -6346,7 +7264,7 @@ func_mode_link ()
  	  echo
  	  $ECHO "*** Warning: Linking the shared library $output against the non-libtool"
  	  $ECHO "*** objects $objs is not portable!"
@@ -5822,7 +5822,7 @@ Index: binutils-2.21/ltmain.sh
  	fi
        fi
  
-@@ -6544,7 +7462,7 @@
+@@ -6544,7 +7462,7 @@ func_mode_link ()
  	  done
  
  	  # Make executables depend on our current version.
@@ -5831,7 +5831,7 @@ Index: binutils-2.21/ltmain.sh
  	  ;;
  
  	qnx)
-@@ -6612,10 +7530,10 @@
+@@ -6612,10 +7530,10 @@ func_mode_link ()
        fi
  
        func_generate_dlsyms "$libname" "$libname" "yes"
@@ -5844,7 +5844,7 @@ Index: binutils-2.21/ltmain.sh
  	# Remove our outputs, but don't remove object files since they
  	# may have been created when compiling PIC objects.
  	removelist=
-@@ -6631,7 +7549,7 @@
+@@ -6631,7 +7549,7 @@ func_mode_link ()
  		   continue
  		 fi
  	       fi
@@ -5853,7 +5853,7 @@ Index: binutils-2.21/ltmain.sh
  	       ;;
  	    *) ;;
  	  esac
-@@ -6642,7 +7560,7 @@
+@@ -6642,7 +7560,7 @@ func_mode_link ()
  
        # Now set the variables for building old libraries.
        if test "$build_old_libs" = yes && test "$build_libtool_libs" != convenience ; then
@@ -5862,7 +5862,7 @@ Index: binutils-2.21/ltmain.sh
  
  	# Transform .lo files to .o files.
  	oldobjs="$objs "`$ECHO "$libobjs" | $SP2NL | $SED "/\.${libext}$/d; $lo2o" | $NL2SP`
-@@ -6659,10 +7577,11 @@
+@@ -6659,10 +7577,11 @@ func_mode_link ()
  	# If the user specified any rpath flags, then add them.
  	temp_xrpath=
  	for libdir in $xrpath; do
@@ -5876,7 +5876,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	done
  	if test "$hardcode_into_libs" != yes || test "$build_old_libs" = yes; then
-@@ -6676,7 +7595,7 @@
+@@ -6676,7 +7595,7 @@ func_mode_link ()
        for lib in $old_dlfiles; do
  	case " $dlprefiles $dlfiles " in
  	*" $lib "*) ;;
@@ -5885,7 +5885,7 @@ Index: binutils-2.21/ltmain.sh
  	esac
        done
  
-@@ -6686,7 +7605,7 @@
+@@ -6686,7 +7605,7 @@ func_mode_link ()
        for lib in $old_dlprefiles; do
  	case "$dlprefiles " in
  	*" $lib "*) ;;
@@ -5894,7 +5894,7 @@ Index: binutils-2.21/ltmain.sh
  	esac
        done
  
-@@ -6698,7 +7617,7 @@
+@@ -6698,7 +7617,7 @@ func_mode_link ()
  	    ;;
  	  *-*-rhapsody* | *-*-darwin1.[012])
  	    # Rhapsody C library is in the System framework
@@ -5903,7 +5903,7 @@ Index: binutils-2.21/ltmain.sh
  	    ;;
  	  *-*-netbsd*)
  	    # Don't link with libc until the a.out ld.so is fixed.
-@@ -6715,7 +7634,7 @@
+@@ -6715,7 +7634,7 @@ func_mode_link ()
  	  *)
  	    # Add libc to deplibs on all other systems if necessary.
  	    if test "$build_libtool_need_lc" = "yes"; then
@@ -5912,7 +5912,7 @@ Index: binutils-2.21/ltmain.sh
  	    fi
  	    ;;
  	  esac
-@@ -6764,18 +7683,18 @@
+@@ -6764,18 +7683,18 @@ EOF
  		if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
  		  case " $predeps $postdeps " in
  		  *" $i "*)
@@ -5935,7 +5935,7 @@ Index: binutils-2.21/ltmain.sh
  		  else
  		    droppeddeps=yes
  		    echo
-@@ -6789,7 +7708,7 @@
+@@ -6789,7 +7708,7 @@ EOF
  		fi
  		;;
  	      *)
@@ -5944,7 +5944,7 @@ Index: binutils-2.21/ltmain.sh
  		;;
  	      esac
  	    done
-@@ -6807,18 +7726,18 @@
+@@ -6807,18 +7726,18 @@ EOF
  		  if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
  		    case " $predeps $postdeps " in
  		    *" $i "*)
@@ -5967,7 +5967,7 @@ Index: binutils-2.21/ltmain.sh
  		    else
  		      droppeddeps=yes
  		      echo
-@@ -6840,7 +7759,7 @@
+@@ -6840,7 +7759,7 @@ EOF
  		fi
  		;;
  	      *)
@@ -5976,7 +5976,7 @@ Index: binutils-2.21/ltmain.sh
  		;;
  	      esac
  	    done
-@@ -6857,15 +7776,27 @@
+@@ -6857,15 +7776,27 @@ EOF
  	      if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
  		case " $predeps $postdeps " in
  		*" $a_deplib "*)
@@ -6007,7 +6007,7 @@ Index: binutils-2.21/ltmain.sh
  		  for potent_lib in $potential_libs; do
  		      # Follow soft links.
  		      if ls -lLd "$potent_lib" 2>/dev/null |
-@@ -6885,10 +7816,10 @@
+@@ -6885,10 +7816,10 @@ EOF
  			*) potlib=`$ECHO "$potlib" | $SED 's,[^/]*$,,'`"$potliblink";;
  			esac
  		      done
@@ -6020,7 +6020,7 @@ Index: binutils-2.21/ltmain.sh
  			a_deplib=""
  			break 2
  		      fi
-@@ -6913,7 +7844,7 @@
+@@ -6913,7 +7844,7 @@ EOF
  	      ;;
  	    *)
  	      # Add a -L argument.
@@ -6029,7 +6029,7 @@ Index: binutils-2.21/ltmain.sh
  	      ;;
  	    esac
  	  done # Gone through all deplibs.
-@@ -6929,20 +7860,20 @@
+@@ -6929,20 +7860,20 @@ EOF
  	      if test "X$allow_libtool_libs_with_static_runtimes" = "Xyes" ; then
  		case " $predeps $postdeps " in
  		*" $a_deplib "*)
@@ -6053,7 +6053,7 @@ Index: binutils-2.21/ltmain.sh
  		      a_deplib=""
  		      break 2
  		    fi
-@@ -6967,7 +7898,7 @@
+@@ -6967,7 +7898,7 @@ EOF
  	      ;;
  	    *)
  	      # Add a -L argument.
@@ -6062,7 +6062,7 @@ Index: binutils-2.21/ltmain.sh
  	      ;;
  	    esac
  	  done # Gone through all deplibs.
-@@ -7071,7 +8002,7 @@
+@@ -7071,7 +8002,7 @@ EOF
  	*)
  	  case " $deplibs " in
  	  *" -L$path/$objdir "*)
@@ -6071,7 +6071,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	  ;;
  	esac
-@@ -7081,10 +8012,10 @@
+@@ -7081,10 +8012,10 @@ EOF
  	-L*)
  	  case " $new_libs " in
  	  *" $deplib "*) ;;
@@ -6084,7 +6084,7 @@ Index: binutils-2.21/ltmain.sh
  	esac
        done
        deplibs="$new_libs"
-@@ -7101,10 +8032,12 @@
+@@ -7101,10 +8032,12 @@ EOF
  	  hardcode_libdirs=
  	  dep_rpath=
  	  rpath="$finalize_rpath"
@@ -6098,7 +6098,7 @@ Index: binutils-2.21/ltmain.sh
  		if test -z "$hardcode_libdirs"; then
  		  hardcode_libdirs="$libdir"
  		else
-@@ -7113,18 +8046,18 @@
+@@ -7113,18 +8046,18 @@ EOF
  		  *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
  		    ;;
  		  *)
@@ -6121,7 +6121,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	    fi
  	  done
-@@ -7133,40 +8066,38 @@
+@@ -7133,40 +8066,38 @@ EOF
  	     test -n "$hardcode_libdirs"; then
  	    libdir="$hardcode_libdirs"
  	    if test -n "$hardcode_libdir_flag_spec_ld"; then
@@ -6171,7 +6171,7 @@ Index: binutils-2.21/ltmain.sh
  	else
  	  soname="$realname"
  	fi
-@@ -7178,7 +8109,7 @@
+@@ -7178,7 +8109,7 @@ EOF
  	linknames=
  	for link
  	do
@@ -6180,7 +6180,7 @@ Index: binutils-2.21/ltmain.sh
  	done
  
  	# Use standard objects if they are pic
-@@ -7189,7 +8120,7 @@
+@@ -7189,7 +8120,7 @@ EOF
  	if test -n "$export_symbols" && test -n "$include_expsyms"; then
  	  $opt_dry_run || cp "$export_symbols" "$output_objdir/$libname.uexp"
  	  export_symbols="$output_objdir/$libname.uexp"
@@ -6189,7 +6189,7 @@ Index: binutils-2.21/ltmain.sh
  	fi
  
  	orig_export_symbols=
-@@ -7220,13 +8151,45 @@
+@@ -7220,13 +8151,45 @@ EOF
  	    $opt_dry_run || $RM $export_symbols
  	    cmds=$export_symbols_cmds
  	    save_ifs="$IFS"; IFS='~'
@@ -6240,7 +6240,7 @@ Index: binutils-2.21/ltmain.sh
  		skipped_export=false
  	      else
  		# The command line is too long to execute in one step.
-@@ -7248,7 +8211,7 @@
+@@ -7248,7 +8211,7 @@ EOF
  	if test -n "$export_symbols" && test -n "$include_expsyms"; then
  	  tmp_export_symbols="$export_symbols"
  	  test -n "$orig_export_symbols" && tmp_export_symbols="$orig_export_symbols"
@@ -6249,7 +6249,7 @@ Index: binutils-2.21/ltmain.sh
  	fi
  
  	if test "X$skipped_export" != "X:" && test -n "$orig_export_symbols"; then
-@@ -7260,7 +8223,7 @@
+@@ -7260,7 +8223,7 @@ EOF
  	  # global variables. join(1) would be nice here, but unfortunately
  	  # isn't a blessed tool.
  	  $opt_dry_run || $SED -e '/[ ,]DATA/!d;s,\(.*\)\([ \,].*\),s|^\1$|\1\2|,' < $export_symbols > $output_objdir/$libname.filter
@@ -6258,7 +6258,7 @@ Index: binutils-2.21/ltmain.sh
  	  export_symbols=$output_objdir/$libname.def
  	  $opt_dry_run || $SED -f $output_objdir/$libname.filter < $orig_export_symbols > $export_symbols
  	fi
-@@ -7270,7 +8233,7 @@
+@@ -7270,7 +8233,7 @@ EOF
  	  case " $convenience " in
  	  *" $test_deplib "*) ;;
  	  *)
@@ -6267,7 +6267,7 @@ Index: binutils-2.21/ltmain.sh
  	    ;;
  	  esac
  	done
-@@ -7286,43 +8249,43 @@
+@@ -7286,43 +8249,43 @@ EOF
  	  fi
  	  if test -n "$whole_archive_flag_spec"; then
  	    save_libobjs=$libobjs
@@ -6322,7 +6322,7 @@ Index: binutils-2.21/ltmain.sh
  	    cmds=$archive_cmds
  	  fi
  	fi
-@@ -7366,10 +8329,13 @@
+@@ -7366,10 +8329,13 @@ EOF
  	    echo 'INPUT (' > $output
  	    for obj in $save_libobjs
  	    do
@@ -6338,7 +6338,7 @@ Index: binutils-2.21/ltmain.sh
  	  elif test -n "$save_libobjs" && test "X$skipped_export" != "X:" && test "X$file_list_spec" != X; then
  	    output=${output_objdir}/${output_la}.lnk
  	    func_verbose "creating linker input file list: $output"
-@@ -7383,15 +8349,17 @@
+@@ -7383,15 +8349,17 @@ EOF
  	    fi
  	    for obj
  	    do
@@ -6360,7 +6360,7 @@ Index: binutils-2.21/ltmain.sh
  	      func_len " $test_cmds"
  	      len0=$func_len_result
  	      len=$len0
-@@ -7411,12 +8379,12 @@
+@@ -7411,12 +8379,12 @@ EOF
  		  if test "$k" -eq 1 ; then
  		    # The first file doesn't have a previous command to add.
  		    reload_objs=$objlist
@@ -6375,7 +6375,7 @@ Index: binutils-2.21/ltmain.sh
  		  fi
  		  last_robj=$output_objdir/$output_la-${k}.$objext
  		  func_arith $k + 1
-@@ -7433,11 +8401,11 @@
+@@ -7433,11 +8401,11 @@ EOF
  	      # files will link in the last one created.
  	      test -z "$concat_cmds" || concat_cmds=$concat_cmds~
  	      reload_objs="$objlist $last_robj"
@@ -6390,7 +6390,7 @@ Index: binutils-2.21/ltmain.sh
  
  	    else
  	      output=
-@@ -7450,9 +8418,9 @@
+@@ -7450,9 +8418,9 @@ EOF
  	      libobjs=$output
  	      # Append the command to create the export file.
  	      test -z "$concat_cmds" || concat_cmds=$concat_cmds~
@@ -6402,7 +6402,7 @@ Index: binutils-2.21/ltmain.sh
  	      fi
  	    fi
  
-@@ -7471,7 +8439,7 @@
+@@ -7471,7 +8439,7 @@ EOF
  		lt_exit=$?
  
  		# Restore the uninstalled library and exit
@@ -6411,7 +6411,7 @@ Index: binutils-2.21/ltmain.sh
  		  ( cd "$output_objdir" && \
  		    $RM "${realname}T" && \
  		    $MV "${realname}U" "$realname" )
-@@ -7492,7 +8460,7 @@
+@@ -7492,7 +8460,7 @@ EOF
  	    if test -n "$export_symbols" && test -n "$include_expsyms"; then
  	      tmp_export_symbols="$export_symbols"
  	      test -n "$orig_export_symbols" && tmp_export_symbols="$orig_export_symbols"
@@ -6420,7 +6420,7 @@ Index: binutils-2.21/ltmain.sh
  	    fi
  
  	    if test -n "$orig_export_symbols"; then
-@@ -7504,7 +8472,7 @@
+@@ -7504,7 +8472,7 @@ EOF
  	      # global variables. join(1) would be nice here, but unfortunately
  	      # isn't a blessed tool.
  	      $opt_dry_run || $SED -e '/[ ,]DATA/!d;s,\(.*\)\([ \,].*\),s|^\1$|\1\2|,' < $export_symbols > $output_objdir/$libname.filter
@@ -6429,7 +6429,7 @@ Index: binutils-2.21/ltmain.sh
  	      export_symbols=$output_objdir/$libname.def
  	      $opt_dry_run || $SED -f $output_objdir/$libname.filter < $orig_export_symbols > $export_symbols
  	    fi
-@@ -7515,7 +8483,7 @@
+@@ -7515,7 +8483,7 @@ EOF
  	  output=$save_output
  
  	  if test -n "$convenience" && test -n "$whole_archive_flag_spec"; then
@@ -6438,7 +6438,7 @@ Index: binutils-2.21/ltmain.sh
  	    test "X$libobjs" = "X " && libobjs=
  	  fi
  	  # Expand the library linking commands again to reset the
-@@ -7539,23 +8507,23 @@
+@@ -7539,23 +8507,23 @@ EOF
  
  	if test -n "$delfiles"; then
  	  # Append the command to remove temporary files to $cmds.
@@ -6466,7 +6466,7 @@ Index: binutils-2.21/ltmain.sh
  	  $opt_silent || {
  	    func_quote_for_expand "$cmd"
  	    eval "func_echo $func_quote_for_expand_result"
-@@ -7564,7 +8532,7 @@
+@@ -7564,7 +8532,7 @@ EOF
  	    lt_exit=$?
  
  	    # Restore the uninstalled library and exit
@@ -6475,7 +6475,7 @@ Index: binutils-2.21/ltmain.sh
  	      ( cd "$output_objdir" && \
  	        $RM "${realname}T" && \
  		$MV "${realname}U" "$realname" )
-@@ -7576,8 +8544,8 @@
+@@ -7576,8 +8544,8 @@ EOF
  	IFS="$save_ifs"
  
  	# Restore the uninstalled library and exit
@@ -6486,7 +6486,7 @@ Index: binutils-2.21/ltmain.sh
  
  	  if test -n "$convenience"; then
  	    if test -z "$whole_archive_flag_spec"; then
-@@ -7656,17 +8624,20 @@
+@@ -7656,17 +8624,20 @@ EOF
  
        if test -n "$convenience"; then
  	if test -n "$whole_archive_flag_spec"; then
@@ -6509,7 +6509,7 @@ Index: binutils-2.21/ltmain.sh
        # Create the old-style object.
        reload_objs="$objs$old_deplibs "`$ECHO "$libobjs" | $SP2NL | $SED "/\.${libext}$/d; /\.lib$/d; $lo2o" | $NL2SP`" $reload_conv_objs" ### testsuite: skip nested quoting test
  
-@@ -7690,7 +8661,7 @@
+@@ -7690,7 +8661,7 @@ EOF
  	# Create an invalid libtool object if no PIC, so that we don't
  	# accidentally link it into a program.
  	# $show "echo timestamp > $libobj"
@@ -6518,7 +6518,7 @@ Index: binutils-2.21/ltmain.sh
  	exit $EXIT_SUCCESS
        fi
  
-@@ -7740,8 +8711,8 @@
+@@ -7740,8 +8711,8 @@ EOF
  	if test "$tagname" = CXX ; then
  	  case ${MACOSX_DEPLOYMENT_TARGET-10.0} in
  	    10.[0123])
@@ -6529,7 +6529,7 @@ Index: binutils-2.21/ltmain.sh
  	    ;;
  	  esac
  	fi
-@@ -7761,7 +8732,7 @@
+@@ -7761,7 +8732,7 @@ EOF
  	*)
  	  case " $compile_deplibs " in
  	  *" -L$path/$objdir "*)
@@ -6538,7 +6538,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	  ;;
  	esac
-@@ -7771,17 +8742,17 @@
+@@ -7771,17 +8742,17 @@ EOF
  	-L*)
  	  case " $new_libs " in
  	  *" $deplib "*) ;;
@@ -6560,7 +6560,7 @@ Index: binutils-2.21/ltmain.sh
  
        if test -n "$rpath$xrpath"; then
  	# If the user specified any rpath flags, then add them.
-@@ -7789,7 +8760,7 @@
+@@ -7789,7 +8760,7 @@ EOF
  	  # This is the magic to use -rpath.
  	  case "$finalize_rpath " in
  	  *" $libdir "*) ;;
@@ -6569,7 +6569,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	done
        fi
-@@ -7808,18 +8779,18 @@
+@@ -7808,18 +8779,18 @@ EOF
  	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
  		;;
  	      *)
@@ -6592,7 +6592,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	fi
  	case $host in
-@@ -7828,12 +8799,12 @@
+@@ -7828,12 +8799,12 @@ EOF
  	  case :$dllsearchpath: in
  	  *":$libdir:"*) ;;
  	  ::) dllsearchpath=$libdir;;
@@ -6607,7 +6607,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	  ;;
  	esac
-@@ -7842,7 +8813,7 @@
+@@ -7842,7 +8813,7 @@ EOF
        if test -n "$hardcode_libdir_separator" &&
  	 test -n "$hardcode_libdirs"; then
  	libdir="$hardcode_libdirs"
@@ -6616,7 +6616,7 @@ Index: binutils-2.21/ltmain.sh
        fi
        compile_rpath="$rpath"
  
-@@ -7859,18 +8830,18 @@
+@@ -7859,18 +8830,18 @@ EOF
  	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
  		;;
  	      *)
@@ -6639,7 +6639,7 @@ Index: binutils-2.21/ltmain.sh
  	  esac
  	fi
        done
-@@ -7878,7 +8849,7 @@
+@@ -7878,7 +8849,7 @@ EOF
        if test -n "$hardcode_libdir_separator" &&
  	 test -n "$hardcode_libdirs"; then
  	libdir="$hardcode_libdirs"
@@ -6648,7 +6648,7 @@ Index: binutils-2.21/ltmain.sh
        fi
        finalize_rpath="$rpath"
  
-@@ -7921,6 +8892,12 @@
+@@ -7921,6 +8892,12 @@ EOF
  	exit_status=0
  	func_show_eval "$link_command" 'exit_status=$?'
  
@@ -6661,7 +6661,7 @@ Index: binutils-2.21/ltmain.sh
  	# Delete the generated files.
  	if test -f "$output_objdir/${outputname}S.${objext}"; then
  	  func_show_eval '$RM "$output_objdir/${outputname}S.${objext}"'
-@@ -7943,7 +8920,7 @@
+@@ -7943,7 +8920,7 @@ EOF
  	  # We should set the runpath_var.
  	  rpath=
  	  for dir in $perm_rpath; do
@@ -6670,7 +6670,7 @@ Index: binutils-2.21/ltmain.sh
  	  done
  	  compile_var="$runpath_var=\"$rpath\$$runpath_var\" "
  	fi
-@@ -7951,7 +8928,7 @@
+@@ -7951,7 +8928,7 @@ EOF
  	  # We should set the runpath_var.
  	  rpath=
  	  for dir in $finalize_perm_rpath; do
@@ -6679,7 +6679,7 @@ Index: binutils-2.21/ltmain.sh
  	  done
  	  finalize_var="$runpath_var=\"$rpath\$$runpath_var\" "
  	fi
-@@ -7966,6 +8943,13 @@
+@@ -7966,6 +8943,13 @@ EOF
  	$opt_dry_run || $RM $output
  	# Link the executable and exit
  	func_show_eval "$link_command" 'exit $?'
@@ -6693,7 +6693,7 @@ Index: binutils-2.21/ltmain.sh
  	exit $EXIT_SUCCESS
        fi
  
-@@ -7999,6 +8983,12 @@
+@@ -7999,6 +8983,12 @@ EOF
  
        func_show_eval "$link_command" 'exit $?'
  
@@ -6706,7 +6706,7 @@ Index: binutils-2.21/ltmain.sh
        # Now create the wrapper script.
        func_verbose "creating $output"
  
-@@ -8096,7 +9086,7 @@
+@@ -8096,7 +9086,7 @@ EOF
  	else
  	  oldobjs="$old_deplibs $non_pic_objects"
  	  if test "$preload" = yes && test -f "$symfileobj"; then
@@ -6715,7 +6715,7 @@ Index: binutils-2.21/ltmain.sh
  	  fi
  	fi
  	addlibs="$old_convenience"
-@@ -8104,10 +9094,10 @@
+@@ -8104,10 +9094,10 @@ EOF
  
        if test -n "$addlibs"; then
  	gentop="$output_objdir/${outputname}x"
@@ -6728,7 +6728,7 @@ Index: binutils-2.21/ltmain.sh
        fi
  
        # Do each command in the archive commands.
-@@ -8118,10 +9108,10 @@
+@@ -8118,10 +9108,10 @@ EOF
  	# Add any objects from preloaded convenience libraries
  	if test -n "$dlprefiles"; then
  	  gentop="$output_objdir/${outputname}x"
@@ -6741,7 +6741,7 @@ Index: binutils-2.21/ltmain.sh
  	fi
  
  	# POSIX demands no paths to be encoded in archives.  We have
-@@ -8139,7 +9129,7 @@
+@@ -8139,7 +9129,7 @@ EOF
  	else
  	  echo "copying selected object files to avoid basename conflicts..."
  	  gentop="$output_objdir/${outputname}x"
@@ -6750,7 +6750,7 @@ Index: binutils-2.21/ltmain.sh
  	  func_mkdir_p "$gentop"
  	  save_oldobjs=$oldobjs
  	  oldobjs=
-@@ -8163,18 +9153,28 @@
+@@ -8163,18 +9153,28 @@ EOF
  		esac
  	      done
  	      func_show_eval "ln $obj $gentop/$newobj || cp $obj $gentop/$newobj"
@@ -6782,7 +6782,7 @@ Index: binutils-2.21/ltmain.sh
  	else
  	  # the command line is too long to link in one step, link in parts
  	  func_verbose "using piecewise archive linking..."
-@@ -8189,7 +9189,7 @@
+@@ -8189,7 +9189,7 @@ EOF
  	  do
  	    last_oldobj=$obj
  	  done
@@ -6791,7 +6791,7 @@ Index: binutils-2.21/ltmain.sh
  	  func_len " $test_cmds"
  	  len0=$func_len_result
  	  len=$len0
-@@ -8208,7 +9208,7 @@
+@@ -8208,7 +9208,7 @@ EOF
  		RANLIB=$save_RANLIB
  	      fi
  	      test -z "$concat_cmds" || concat_cmds=$concat_cmds~
@@ -6800,7 +6800,7 @@ Index: binutils-2.21/ltmain.sh
  	      objlist=
  	      len=$len0
  	    fi
-@@ -8216,9 +9216,9 @@
+@@ -8216,9 +9216,9 @@ EOF
  	  RANLIB=$save_RANLIB
  	  oldobjs=$objlist
  	  if test "X$oldobjs" = "X" ; then
@@ -6812,7 +6812,7 @@ Index: binutils-2.21/ltmain.sh
  	  fi
  	fi
        fi
-@@ -8268,12 +9268,23 @@
+@@ -8268,12 +9268,23 @@ EOF
  	      *.la)
  		func_basename "$deplib"
  		name="$func_basename_result"
@@ -6839,7 +6839,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	    done
  	    dependency_libs="$newdependency_libs"
-@@ -8284,12 +9295,14 @@
+@@ -8284,12 +9295,14 @@ EOF
  	      *.la)
  	        func_basename "$lib"
  		name="$func_basename_result"
@@ -6857,7 +6857,7 @@ Index: binutils-2.21/ltmain.sh
  	      esac
  	    done
  	    dlfiles="$newdlfiles"
-@@ -8303,10 +9316,11 @@
+@@ -8303,10 +9316,11 @@ EOF
  		# the library:
  		func_basename "$lib"
  		name="$func_basename_result"
@@ -6871,7 +6871,7 @@ Index: binutils-2.21/ltmain.sh
  		;;
  	      esac
  	    done
-@@ -8318,7 +9332,7 @@
+@@ -8318,7 +9332,7 @@ EOF
  		[\\/]* | [A-Za-z]:[\\/]*) abs="$lib" ;;
  		*) abs=`pwd`"/$lib" ;;
  	      esac
@@ -6880,7 +6880,7 @@ Index: binutils-2.21/ltmain.sh
  	    done
  	    dlfiles="$newdlfiles"
  	    newdlprefiles=
-@@ -8327,7 +9341,7 @@
+@@ -8327,7 +9341,7 @@ EOF
  		[\\/]* | [A-Za-z]:[\\/]*) abs="$lib" ;;
  		*) abs=`pwd`"/$lib" ;;
  	      esac
@@ -6889,7 +6889,7 @@ Index: binutils-2.21/ltmain.sh
  	    done
  	    dlprefiles="$newdlprefiles"
  	  fi
-@@ -8412,7 +9426,7 @@
+@@ -8412,7 +9426,7 @@ relink_command=\"$relink_command\""
      exit $EXIT_SUCCESS
  }
  
@@ -6898,7 +6898,7 @@ Index: binutils-2.21/ltmain.sh
      func_mode_link ${1+"$@"}
  
  
-@@ -8432,9 +9446,9 @@
+@@ -8432,9 +9446,9 @@ func_mode_uninstall ()
      for arg
      do
        case $arg in
@@ -6911,7 +6911,7 @@ Index: binutils-2.21/ltmain.sh
        esac
      done
  
-@@ -8443,24 +9457,23 @@
+@@ -8443,24 +9457,23 @@ func_mode_uninstall ()
  
      rmdirs=
  
@@ -6943,7 +6943,7 @@ Index: binutils-2.21/ltmain.sh
  	esac
        fi
  
-@@ -8486,18 +9499,17 @@
+@@ -8486,18 +9499,17 @@ func_mode_uninstall ()
  
  	  # Delete the libtool libraries and symlinks.
  	  for n in $library_names; do
@@ -6968,7 +6968,7 @@ Index: binutils-2.21/ltmain.sh
  	    ;;
  	  uninstall)
  	    if test -n "$library_names"; then
-@@ -8525,19 +9537,19 @@
+@@ -8525,19 +9537,19 @@ func_mode_uninstall ()
  	  # Add PIC object to the list of files to remove.
  	  if test -n "$pic_object" &&
  	     test "$pic_object" != none; then
@@ -6991,7 +6991,7 @@ Index: binutils-2.21/ltmain.sh
  	  noexename=$name
  	  case $file in
  	  *.exe)
-@@ -8547,7 +9559,7 @@
+@@ -8547,7 +9559,7 @@ func_mode_uninstall ()
  	    noexename=$func_stripname_result
  	    # $file with .exe has already been added to rmfiles,
  	    # add $file without .exe
@@ -7000,7 +7000,7 @@ Index: binutils-2.21/ltmain.sh
  	    ;;
  	  esac
  	  # Do a test to see if this is a libtool program.
-@@ -8556,7 +9568,7 @@
+@@ -8556,7 +9568,7 @@ func_mode_uninstall ()
  	      func_ltwrapper_scriptname "$file"
  	      relink_command=
  	      func_source $func_ltwrapper_scriptname_result
@@ -7009,7 +7009,7 @@ Index: binutils-2.21/ltmain.sh
  	    else
  	      relink_command=
  	      func_source $dir/$noexename
-@@ -8564,12 +9576,12 @@
+@@ -8564,12 +9576,12 @@ func_mode_uninstall ()
  
  	    # note $name still contains .exe if it was in $file originally
  	    # as does the version of $file that was added into $rmfiles
@@ -7025,7 +7025,7 @@ Index: binutils-2.21/ltmain.sh
  	    fi
  	  fi
  	fi
-@@ -8577,7 +9589,6 @@
+@@ -8577,7 +9589,6 @@ func_mode_uninstall ()
        esac
        func_show_eval "$RM $rmfiles" 'exit_status=1'
      done
@@ -7033,7 +7033,7 @@ Index: binutils-2.21/ltmain.sh
  
      # Try to remove the ${objdir}s in the directories where we deleted files
      for dir in $rmdirs; do
-@@ -8589,16 +9600,16 @@
+@@ -8589,16 +9600,16 @@ func_mode_uninstall ()
      exit $exit_status
  }
  
@@ -7053,10 +7053,10 @@ Index: binutils-2.21/ltmain.sh
  
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
-Index: binutils-2.21/ltoptions.m4
+Index: binutils-2.21.1/ltoptions.m4
 ===================================================================
---- binutils-2.21.orig/ltoptions.m4	2010-01-09 13:11:32.000000000 -0800
-+++ binutils-2.21/ltoptions.m4	2011-01-07 10:49:16.406101000 -0800
+--- binutils-2.21.1.orig/ltoptions.m4
++++ binutils-2.21.1/ltoptions.m4
 @@ -8,7 +8,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7066,10 +7066,10 @@ Index: binutils-2.21/ltoptions.m4
  
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
-Index: binutils-2.21/ltversion.m4
+Index: binutils-2.21.1/ltversion.m4
 ===================================================================
---- binutils-2.21.orig/ltversion.m4	2010-01-09 13:11:32.000000000 -0800
-+++ binutils-2.21/ltversion.m4	2011-01-07 10:49:16.406101000 -0800
+--- binutils-2.21.1.orig/ltversion.m4
++++ binutils-2.21.1/ltversion.m4
 @@ -7,17 +7,17 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7094,10 +7094,10 @@ Index: binutils-2.21/ltversion.m4
  _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
  _LT_DECL(, macro_revision, 0)
  ])
-Index: binutils-2.21/lt~obsolete.m4
+Index: binutils-2.21.1/lt~obsolete.m4
 ===================================================================
---- binutils-2.21.orig/lt~obsolete.m4	2010-01-09 13:11:32.000000000 -0800
-+++ binutils-2.21/lt~obsolete.m4	2011-01-07 10:49:16.406101000 -0800
+--- binutils-2.21.1.orig/lt~obsolete.m4
++++ binutils-2.21.1/lt~obsolete.m4
 @@ -7,7 +7,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7107,11 +7107,11 @@ Index: binutils-2.21/lt~obsolete.m4
  
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
-Index: binutils-2.21/configure
+Index: binutils-2.21.1/configure
 ===================================================================
---- binutils-2.21.orig/configure	2011-01-07 10:49:16.006101000 -0800
-+++ binutils-2.21/configure	2011-01-07 10:49:17.906101000 -0800
-@@ -2670,7 +2670,7 @@
+--- binutils-2.21.1.orig/configure
++++ binutils-2.21.1/configure
+@@ -2670,7 +2670,7 @@ host_libs="intl mmalloc libiberty opcode
  # binutils, gas and ld appear in that order because it makes sense to run
  # "make check" in that particular order.
  # If --enable-gold is used, "gold" may replace "ld".
@@ -7120,7 +7120,7 @@ Index: binutils-2.21/configure
  
  # libgcj represents the runtime libraries only used by gcj.
  libgcj="target-libffi \
-@@ -3148,7 +3148,7 @@
+@@ -3148,7 +3148,7 @@ case "${target}" in
    am33_2.0-*-linux*)
      noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
      ;;
@@ -7129,7 +7129,7 @@ Index: binutils-2.21/configure
      noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
      ;;
    sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -3487,7 +3487,7 @@
+@@ -3487,7 +3487,7 @@ case "${target}" in
    romp-*-*)
      noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
      ;;
@@ -7138,7 +7138,7 @@ Index: binutils-2.21/configure
      case "${host}" in
        i[3456789]86-*-vsta) ;; # don't add gprof back in
        i[3456789]86-*-go32*) ;; # don't add gprof back in
-@@ -7597,7 +7597,7 @@
+@@ -7597,7 +7597,7 @@ case " $build_configdirs " in
      # For an installed makeinfo, we require it to be from texinfo 4.7 or
      # higher, else we use the "missing" dummy.
      if ${MAKEINFO} --version \
@@ -7147,11 +7147,11 @@ Index: binutils-2.21/configure
        :
      else
        MAKEINFO="$MISSING makeinfo"
-Index: binutils-2.21/bfd/configure
+Index: binutils-2.21.1/bfd/configure
 ===================================================================
---- binutils-2.21.orig/bfd/configure	2010-12-08 00:37:34.000000000 -0800
-+++ binutils-2.21/bfd/configure	2011-01-07 11:25:57.156101002 -0800
-@@ -667,6 +667,9 @@
+--- binutils-2.21.1.orig/bfd/configure
++++ binutils-2.21.1/bfd/configure
+@@ -667,6 +667,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7161,7 +7161,7 @@ Index: binutils-2.21/bfd/configure
  OBJDUMP
  LN_S
  NM
-@@ -779,6 +782,7 @@
+@@ -779,6 +782,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7169,7 +7169,7 @@ Index: binutils-2.21/bfd/configure
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1453,6 +1457,8 @@
+@@ -1453,6 +1457,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7178,7 +7178,7 @@ Index: binutils-2.21/bfd/configure
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
                            Look for global separate debug info in DIR
-@@ -5383,8 +5389,8 @@
+@@ -5383,8 +5389,8 @@ esac
  
  
  
@@ -7189,7 +7189,7 @@ Index: binutils-2.21/bfd/configure
  
  
  
-@@ -5424,7 +5430,7 @@
+@@ -5424,7 +5430,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7198,7 +7198,7 @@ Index: binutils-2.21/bfd/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6110,8 +6116,8 @@
+@@ -6110,8 +6116,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7209,7 +7209,7 @@ Index: binutils-2.21/bfd/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6160,6 +6166,80 @@
+@@ -6160,6 +6166,80 @@ esac
  
  
  
@@ -7290,7 +7290,7 @@ Index: binutils-2.21/bfd/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6176,6 +6256,11 @@
+@@ -6176,6 +6256,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7302,7 +7302,7 @@ Index: binutils-2.21/bfd/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6344,7 +6429,8 @@
+@@ -6344,7 +6429,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7312,7 +7312,7 @@ Index: binutils-2.21/bfd/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6498,6 +6584,21 @@
+@@ -6498,6 +6584,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7334,7 +7334,7 @@ Index: binutils-2.21/bfd/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6513,9 +6614,162 @@
+@@ -6513,9 +6614,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -7499,7 +7499,7 @@ Index: binutils-2.21/bfd/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6531,7 +6785,7 @@
+@@ -6531,7 +6785,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -7508,7 +7508,7 @@ Index: binutils-2.21/bfd/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6551,11 +6805,15 @@
+@@ -6551,11 +6805,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -7527,7 +7527,7 @@ Index: binutils-2.21/bfd/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6571,7 +6829,7 @@
+@@ -6571,7 +6829,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -7536,7 +7536,7 @@ Index: binutils-2.21/bfd/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6590,6 +6848,10 @@
+@@ -6590,6 +6848,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -7547,7 +7547,7 @@ Index: binutils-2.21/bfd/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6601,16 +6863,72 @@
+@@ -6601,16 +6863,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -7624,7 +7624,7 @@ Index: binutils-2.21/bfd/configure
  
  
  
-@@ -6952,8 +7270,8 @@
+@@ -6952,8 +7270,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -7635,7 +7635,7 @@ Index: binutils-2.21/bfd/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6989,6 +7307,7 @@
+@@ -6989,6 +7307,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -7643,7 +7643,7 @@ Index: binutils-2.21/bfd/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7030,6 +7349,18 @@
+@@ -7030,6 +7349,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -7662,7 +7662,7 @@ Index: binutils-2.21/bfd/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7041,7 +7372,7 @@
+@@ -7041,7 +7372,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -7671,7 +7671,7 @@ Index: binutils-2.21/bfd/configure
    const char *name;
    void       *address;
  }
-@@ -7067,8 +7398,8 @@
+@@ -7067,8 +7398,8 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -7682,7 +7682,7 @@ Index: binutils-2.21/bfd/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7078,8 +7409,8 @@
+@@ -7078,8 +7409,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -7693,7 +7693,7 @@ Index: binutils-2.21/bfd/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7116,6 +7447,20 @@
+@@ -7116,6 +7447,20 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -7714,7 +7714,7 @@ Index: binutils-2.21/bfd/configure
  
  
  
-@@ -7135,6 +7480,41 @@
+@@ -7135,6 +7480,41 @@ fi
  
  
  
@@ -7756,7 +7756,7 @@ Index: binutils-2.21/bfd/configure
  
  
  # Check whether --enable-libtool-lock was given.
-@@ -7330,6 +7710,123 @@
+@@ -7330,6 +7710,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -7880,7 +7880,7 @@ Index: binutils-2.21/bfd/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7893,6 +8390,8 @@
+@@ -7893,6 +8390,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -7889,7 +7889,7 @@ Index: binutils-2.21/bfd/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8057,7 +8556,8 @@
+@@ -8057,7 +8556,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -7899,7 +7899,7 @@ Index: binutils-2.21/bfd/configure
  
  
  
-@@ -8146,7 +8646,7 @@
+@@ -8146,7 +8646,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -7908,7 +7908,7 @@ Index: binutils-2.21/bfd/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8444,8 +8944,6 @@
+@@ -8444,8 +8944,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -7917,7 +7917,7 @@ Index: binutils-2.21/bfd/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8610,6 +9108,12 @@
+@@ -8610,6 +9108,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -7930,7 +7930,7 @@ Index: binutils-2.21/bfd/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8672,7 +9176,7 @@
+@@ -8672,7 +9176,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -7939,7 +7939,7 @@ Index: binutils-2.21/bfd/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8729,13 +9233,17 @@
+@@ -8729,13 +9233,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -7963,7 +7963,7 @@ Index: binutils-2.21/bfd/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8796,6 +9304,11 @@
+@@ -8796,6 +9304,11 @@ fi
  
  
  
@@ -7975,7 +7975,7 @@ Index: binutils-2.21/bfd/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9146,7 +9659,8 @@
+@@ -9146,7 +9659,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -7985,7 +7985,7 @@ Index: binutils-2.21/bfd/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9194,7 +9708,7 @@
+@@ -9194,7 +9708,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -7994,7 +7994,7 @@ Index: binutils-2.21/bfd/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9245,12 +9759,12 @@
+@@ -9245,12 +9759,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8009,7 +8009,7 @@ Index: binutils-2.21/bfd/configure
  	  fi
  	  ;;
  	esac
-@@ -9264,8 +9778,8 @@
+@@ -9264,8 +9778,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8020,7 +8020,7 @@ Index: binutils-2.21/bfd/configure
        fi
        ;;
  
-@@ -9283,8 +9797,8 @@
+@@ -9283,8 +9797,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8031,7 +8031,7 @@ Index: binutils-2.21/bfd/configure
        else
  	ld_shlibs=no
        fi
-@@ -9330,8 +9844,8 @@
+@@ -9330,8 +9844,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8042,7 +8042,7 @@ Index: binutils-2.21/bfd/configure
        else
  	ld_shlibs=no
        fi
-@@ -9461,7 +9975,13 @@
+@@ -9461,7 +9975,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8057,7 +8057,7 @@ Index: binutils-2.21/bfd/configure
  /* end confdefs.h.  */
  
  int
-@@ -9474,22 +9994,29 @@
+@@ -9474,22 +9994,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8100,7 +8100,7 @@ Index: binutils-2.21/bfd/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9501,7 +10028,13 @@
+@@ -9501,7 +10028,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8115,7 +8115,7 @@ Index: binutils-2.21/bfd/configure
  /* end confdefs.h.  */
  
  int
-@@ -9514,22 +10047,29 @@
+@@ -9514,22 +10047,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8158,7 +8158,7 @@ Index: binutils-2.21/bfd/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9574,20 +10114,63 @@
+@@ -9574,20 +10114,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -8236,7 +8236,7 @@ Index: binutils-2.21/bfd/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9652,7 +10235,7 @@
+@@ -9652,7 +10235,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8245,7 +8245,7 @@ Index: binutils-2.21/bfd/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9660,7 +10243,7 @@
+@@ -9660,7 +10243,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8254,7 +8254,7 @@ Index: binutils-2.21/bfd/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9676,7 +10259,7 @@
+@@ -9676,7 +10259,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8263,7 +8263,7 @@ Index: binutils-2.21/bfd/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9700,10 +10283,10 @@
+@@ -9700,10 +10283,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8276,7 +8276,7 @@ Index: binutils-2.21/bfd/configure
  	  ;;
  	esac
        else
-@@ -9782,23 +10365,36 @@
+@@ -9782,23 +10365,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8321,7 +8321,7 @@ Index: binutils-2.21/bfd/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9883,7 +10479,7 @@
+@@ -9883,7 +10479,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8330,7 +8330,7 @@ Index: binutils-2.21/bfd/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9902,9 +10498,9 @@
+@@ -9902,9 +10498,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8342,7 +8342,7 @@ Index: binutils-2.21/bfd/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10480,8 +11076,9 @@
+@@ -10480,8 +11076,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8354,7 +8354,7 @@ Index: binutils-2.21/bfd/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10514,13 +11111,71 @@
+@@ -10514,13 +11111,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8427,7 +8427,7 @@ Index: binutils-2.21/bfd/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10616,7 +11271,7 @@
+@@ -10616,7 +11271,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -8436,7 +8436,7 @@ Index: binutils-2.21/bfd/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11412,7 +12067,7 @@
+@@ -11412,7 +12067,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -8445,7 +8445,7 @@ Index: binutils-2.21/bfd/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11456,10 +12111,10 @@
+@@ -11456,10 +12111,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8458,7 +8458,7 @@ Index: binutils-2.21/bfd/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11518,7 +12173,7 @@
+@@ -11518,7 +12173,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -8467,7 +8467,7 @@ Index: binutils-2.21/bfd/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11562,10 +12217,10 @@
+@@ -11562,10 +12217,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8480,7 +8480,7 @@ Index: binutils-2.21/bfd/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14897,7 +15552,7 @@
+@@ -15045,7 +15700,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -8489,7 +8489,7 @@ Index: binutils-2.21/bfd/configure
    fi
  
  # More hacks to build DLLs on Windows.
-@@ -16473,13 +17128,20 @@
+@@ -16619,13 +17274,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -8510,7 +8510,7 @@ Index: binutils-2.21/bfd/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16494,14 +17156,17 @@
+@@ -16640,14 +17302,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -8529,7 +8529,7 @@ Index: binutils-2.21/bfd/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16534,12 +17199,12 @@
+@@ -16680,12 +17345,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -8543,7 +8543,7 @@ Index: binutils-2.21/bfd/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16594,8 +17259,13 @@
+@@ -16740,8 +17405,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -8557,7 +8557,7 @@ Index: binutils-2.21/bfd/configure
  STRIP \
  RANLIB \
  CC \
-@@ -16605,12 +17275,14 @@
+@@ -16751,12 +17421,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -8573,7 +8573,7 @@ Index: binutils-2.21/bfd/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16626,7 +17298,6 @@
+@@ -16772,7 +17444,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -8581,7 +8581,7 @@ Index: binutils-2.21/bfd/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16662,6 +17333,7 @@
+@@ -16808,6 +17479,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -8589,7 +8589,7 @@ Index: binutils-2.21/bfd/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17441,7 +18113,8 @@
+@@ -17587,7 +18259,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -8599,7 +8599,7 @@ Index: binutils-2.21/bfd/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17544,19 +18217,42 @@
+@@ -17690,19 +18363,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -8643,7 +8643,7 @@ Index: binutils-2.21/bfd/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17586,6 +18282,12 @@
+@@ -17732,6 +18428,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -8656,7 +8656,7 @@ Index: binutils-2.21/bfd/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17595,6 +18297,9 @@
+@@ -17741,6 +18443,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -8666,7 +8666,7 @@ Index: binutils-2.21/bfd/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17709,12 +18414,12 @@
+@@ -17855,12 +18560,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -8682,7 +8682,7 @@ Index: binutils-2.21/bfd/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17801,9 +18506,6 @@
+@@ -17947,9 +18652,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -8692,7 +8692,7 @@ Index: binutils-2.21/bfd/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17819,6 +18521,9 @@
+@@ -17965,6 +18667,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -8702,7 +8702,7 @@ Index: binutils-2.21/bfd/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17851,210 +18556,169 @@
+@@ -17997,210 +18702,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -9073,11 +9073,11 @@ Index: binutils-2.21/bfd/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21/opcodes/configure
+Index: binutils-2.21.1/opcodes/configure
 ===================================================================
---- binutils-2.21.orig/opcodes/configure	2010-11-05 03:32:32.000000000 -0700
-+++ binutils-2.21/opcodes/configure	2011-01-07 11:26:03.686101001 -0800
-@@ -647,6 +647,9 @@
+--- binutils-2.21.1.orig/opcodes/configure
++++ binutils-2.21.1/opcodes/configure
+@@ -647,6 +647,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -9087,7 +9087,7 @@ Index: binutils-2.21/opcodes/configure
  OBJDUMP
  LN_S
  NM
-@@ -759,6 +762,7 @@
+@@ -759,6 +762,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -9095,7 +9095,7 @@ Index: binutils-2.21/opcodes/configure
  enable_libtool_lock
  enable_targets
  enable_werror
-@@ -1417,6 +1421,8 @@
+@@ -1417,6 +1421,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -9104,7 +9104,7 @@ Index: binutils-2.21/opcodes/configure
  
  Some influential environment variables:
    CC          C compiler command
-@@ -5112,8 +5118,8 @@
+@@ -5112,8 +5118,8 @@ esac
  
  
  
@@ -9115,7 +9115,7 @@ Index: binutils-2.21/opcodes/configure
  
  
  
-@@ -5153,7 +5159,7 @@
+@@ -5153,7 +5159,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -9124,7 +9124,7 @@ Index: binutils-2.21/opcodes/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5839,8 +5845,8 @@
+@@ -5839,8 +5845,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -9135,7 +9135,7 @@ Index: binutils-2.21/opcodes/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5889,6 +5895,80 @@
+@@ -5889,6 +5895,80 @@ esac
  
  
  
@@ -9216,7 +9216,7 @@ Index: binutils-2.21/opcodes/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5905,6 +5985,11 @@
+@@ -5905,6 +5985,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -9228,7 +9228,7 @@ Index: binutils-2.21/opcodes/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6073,7 +6158,8 @@
+@@ -6073,7 +6158,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -9238,7 +9238,7 @@ Index: binutils-2.21/opcodes/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6227,6 +6313,21 @@
+@@ -6227,6 +6313,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -9260,7 +9260,7 @@ Index: binutils-2.21/opcodes/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6242,9 +6343,162 @@
+@@ -6242,9 +6343,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -9425,7 +9425,7 @@ Index: binutils-2.21/opcodes/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6260,7 +6514,7 @@
+@@ -6260,7 +6514,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -9434,7 +9434,7 @@ Index: binutils-2.21/opcodes/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6280,11 +6534,15 @@
+@@ -6280,11 +6534,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -9453,7 +9453,7 @@ Index: binutils-2.21/opcodes/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6300,7 +6558,7 @@
+@@ -6300,7 +6558,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -9462,7 +9462,7 @@ Index: binutils-2.21/opcodes/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6319,6 +6577,10 @@
+@@ -6319,6 +6577,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -9473,7 +9473,7 @@ Index: binutils-2.21/opcodes/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6330,12 +6592,11 @@
+@@ -6330,12 +6592,11 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -9489,7 +9489,7 @@ Index: binutils-2.21/opcodes/configure
  
  
  
-@@ -6346,6 +6607,63 @@
+@@ -6346,6 +6607,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -9553,7 +9553,7 @@ Index: binutils-2.21/opcodes/configure
  
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
-@@ -6681,8 +6999,8 @@
+@@ -6681,8 +6999,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -9564,7 +9564,7 @@ Index: binutils-2.21/opcodes/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6718,6 +7036,7 @@
+@@ -6718,6 +7036,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -9572,7 +9572,7 @@ Index: binutils-2.21/opcodes/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6759,6 +7078,18 @@
+@@ -6759,6 +7078,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -9591,7 +9591,7 @@ Index: binutils-2.21/opcodes/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6770,7 +7101,7 @@
+@@ -6770,7 +7101,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -9600,7 +9600,7 @@ Index: binutils-2.21/opcodes/configure
    const char *name;
    void       *address;
  }
-@@ -6796,8 +7127,8 @@
+@@ -6796,8 +7127,8 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -9611,7 +9611,7 @@ Index: binutils-2.21/opcodes/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6807,8 +7138,8 @@
+@@ -6807,8 +7138,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -9622,7 +9622,7 @@ Index: binutils-2.21/opcodes/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6845,6 +7176,14 @@
+@@ -6845,6 +7176,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -9637,7 +9637,7 @@ Index: binutils-2.21/opcodes/configure
  
  
  
-@@ -6866,6 +7205,47 @@
+@@ -6866,6 +7205,47 @@ fi
  
  
  
@@ -9685,7 +9685,7 @@ Index: binutils-2.21/opcodes/configure
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
    enableval=$enable_libtool_lock;
-@@ -7059,6 +7439,123 @@
+@@ -7059,6 +7439,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -9809,7 +9809,7 @@ Index: binutils-2.21/opcodes/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7622,6 +8119,8 @@
+@@ -7622,6 +8119,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -9818,7 +9818,7 @@ Index: binutils-2.21/opcodes/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7787,7 +8286,8 @@
+@@ -7787,7 +8286,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -9828,7 +9828,7 @@ Index: binutils-2.21/opcodes/configure
  
  
  
-@@ -7876,7 +8376,7 @@
+@@ -7876,7 +8376,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -9837,7 +9837,7 @@ Index: binutils-2.21/opcodes/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8174,8 +8674,6 @@
+@@ -8174,8 +8674,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -9846,7 +9846,7 @@ Index: binutils-2.21/opcodes/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8340,6 +8838,12 @@
+@@ -8340,6 +8838,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -9859,7 +9859,7 @@ Index: binutils-2.21/opcodes/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8402,7 +8906,7 @@
+@@ -8402,7 +8906,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -9868,7 +9868,7 @@ Index: binutils-2.21/opcodes/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8459,13 +8963,17 @@
+@@ -8459,13 +8963,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -9892,7 +9892,7 @@ Index: binutils-2.21/opcodes/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8526,6 +9034,11 @@
+@@ -8526,6 +9034,11 @@ fi
  
  
  
@@ -9904,7 +9904,7 @@ Index: binutils-2.21/opcodes/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8876,7 +9389,8 @@
+@@ -8876,7 +9389,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -9914,7 +9914,7 @@ Index: binutils-2.21/opcodes/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8924,7 +9438,7 @@
+@@ -8924,7 +9438,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -9923,7 +9923,7 @@ Index: binutils-2.21/opcodes/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -8975,12 +9489,12 @@
+@@ -8975,12 +9489,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -9938,7 +9938,7 @@ Index: binutils-2.21/opcodes/configure
  	  fi
  	  ;;
  	esac
-@@ -8994,8 +9508,8 @@
+@@ -8994,8 +9508,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -9949,7 +9949,7 @@ Index: binutils-2.21/opcodes/configure
        fi
        ;;
  
-@@ -9013,8 +9527,8 @@
+@@ -9013,8 +9527,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -9960,7 +9960,7 @@ Index: binutils-2.21/opcodes/configure
        else
  	ld_shlibs=no
        fi
-@@ -9060,8 +9574,8 @@
+@@ -9060,8 +9574,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -9971,7 +9971,7 @@ Index: binutils-2.21/opcodes/configure
        else
  	ld_shlibs=no
        fi
-@@ -9191,7 +9705,13 @@
+@@ -9191,7 +9705,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -9986,7 +9986,7 @@ Index: binutils-2.21/opcodes/configure
  /* end confdefs.h.  */
  
  int
-@@ -9204,22 +9724,29 @@
+@@ -9204,22 +9724,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -10029,7 +10029,7 @@ Index: binutils-2.21/opcodes/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9231,7 +9758,13 @@
+@@ -9231,7 +9758,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -10044,7 +10044,7 @@ Index: binutils-2.21/opcodes/configure
  /* end confdefs.h.  */
  
  int
-@@ -9244,22 +9777,29 @@
+@@ -9244,22 +9777,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -10087,7 +10087,7 @@ Index: binutils-2.21/opcodes/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9304,20 +9844,63 @@
+@@ -9304,20 +9844,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -10165,7 +10165,7 @@ Index: binutils-2.21/opcodes/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9382,7 +9965,7 @@
+@@ -9382,7 +9965,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -10174,7 +10174,7 @@ Index: binutils-2.21/opcodes/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9390,7 +9973,7 @@
+@@ -9390,7 +9973,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -10183,7 +10183,7 @@ Index: binutils-2.21/opcodes/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9406,7 +9989,7 @@
+@@ -9406,7 +9989,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -10192,7 +10192,7 @@ Index: binutils-2.21/opcodes/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9430,10 +10013,10 @@
+@@ -9430,10 +10013,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -10205,7 +10205,7 @@ Index: binutils-2.21/opcodes/configure
  	  ;;
  	esac
        else
-@@ -9512,23 +10095,36 @@
+@@ -9512,23 +10095,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -10250,7 +10250,7 @@ Index: binutils-2.21/opcodes/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9613,7 +10209,7 @@
+@@ -9613,7 +10209,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -10259,7 +10259,7 @@ Index: binutils-2.21/opcodes/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9632,9 +10228,9 @@
+@@ -9632,9 +10228,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -10271,7 +10271,7 @@ Index: binutils-2.21/opcodes/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10210,8 +10806,9 @@
+@@ -10210,8 +10806,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -10283,7 +10283,7 @@ Index: binutils-2.21/opcodes/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10244,13 +10841,71 @@
+@@ -10244,13 +10841,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -10356,7 +10356,7 @@ Index: binutils-2.21/opcodes/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10346,7 +11001,7 @@
+@@ -10346,7 +11001,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -10365,7 +10365,7 @@ Index: binutils-2.21/opcodes/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11142,7 +11797,7 @@
+@@ -11142,7 +11797,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -10374,7 +10374,7 @@ Index: binutils-2.21/opcodes/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11186,10 +11841,10 @@
+@@ -11186,10 +11841,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -10387,7 +10387,7 @@ Index: binutils-2.21/opcodes/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11248,7 +11903,7 @@
+@@ -11248,7 +11903,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -10396,7 +10396,7 @@ Index: binutils-2.21/opcodes/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11292,10 +11947,10 @@
+@@ -11292,10 +11947,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -10409,7 +10409,7 @@ Index: binutils-2.21/opcodes/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12328,7 +12983,7 @@
+@@ -12328,7 +12983,7 @@ if test "$enable_shared" = "yes"; then
  # since libbfd may not pull in the entirety of libiberty.
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -10418,7 +10418,7 @@ Index: binutils-2.21/opcodes/configure
    fi
  
    case "${host}" in
-@@ -13289,13 +13944,20 @@
+@@ -13289,13 +13944,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -10439,7 +10439,7 @@ Index: binutils-2.21/opcodes/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13310,14 +13972,17 @@
+@@ -13310,14 +13972,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -10458,7 +10458,7 @@ Index: binutils-2.21/opcodes/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13350,12 +14015,12 @@
+@@ -13350,12 +14015,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -10472,7 +10472,7 @@ Index: binutils-2.21/opcodes/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13410,8 +14075,13 @@
+@@ -13410,8 +14075,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -10486,7 +10486,7 @@ Index: binutils-2.21/opcodes/configure
  STRIP \
  RANLIB \
  CC \
-@@ -13421,12 +14091,14 @@
+@@ -13421,12 +14091,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -10502,7 +10502,7 @@ Index: binutils-2.21/opcodes/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13442,7 +14114,6 @@
+@@ -13442,7 +14114,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -10510,7 +10510,7 @@ Index: binutils-2.21/opcodes/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13478,6 +14149,7 @@
+@@ -13478,6 +14149,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -10518,7 +10518,7 @@ Index: binutils-2.21/opcodes/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14234,7 +14906,8 @@
+@@ -14234,7 +14906,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -10528,7 +10528,7 @@ Index: binutils-2.21/opcodes/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14337,19 +15010,42 @@
+@@ -14337,19 +15010,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -10572,7 +10572,7 @@ Index: binutils-2.21/opcodes/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14379,6 +15075,12 @@
+@@ -14379,6 +15075,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -10585,7 +10585,7 @@ Index: binutils-2.21/opcodes/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14388,6 +15090,9 @@
+@@ -14388,6 +15090,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -10595,7 +10595,7 @@ Index: binutils-2.21/opcodes/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14502,12 +15207,12 @@
+@@ -14502,12 +15207,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -10611,7 +10611,7 @@ Index: binutils-2.21/opcodes/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14594,9 +15299,6 @@
+@@ -14594,9 +15299,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -10621,7 +10621,7 @@ Index: binutils-2.21/opcodes/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14612,6 +15314,9 @@
+@@ -14612,6 +15314,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -10631,7 +10631,7 @@ Index: binutils-2.21/opcodes/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14644,210 +15349,169 @@
+@@ -14644,210 +15349,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -11002,11 +11002,11 @@ Index: binutils-2.21/opcodes/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21/binutils/configure
+Index: binutils-2.21.1/binutils/configure
 ===================================================================
---- binutils-2.21.orig/binutils/configure	2010-11-05 03:32:55.000000000 -0700
-+++ binutils-2.21/binutils/configure	2011-01-07 10:49:16.426101000 -0800
-@@ -654,8 +654,11 @@
+--- binutils-2.21.1.orig/binutils/configure
++++ binutils-2.21.1/binutils/configure
+@@ -654,8 +654,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -11018,7 +11018,7 @@ Index: binutils-2.21/binutils/configure
  OBJDUMP
  LN_S
  NM
-@@ -768,6 +771,7 @@
+@@ -768,6 +771,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -11026,7 +11026,7 @@ Index: binutils-2.21/binutils/configure
  enable_libtool_lock
  enable_targets
  enable_werror
-@@ -1429,6 +1433,8 @@
+@@ -1429,6 +1433,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -11035,7 +11035,7 @@ Index: binutils-2.21/binutils/configure
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
    --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
    --without-libiconv-prefix     don't search for libiconv in includedir and libdir
-@@ -5146,8 +5152,8 @@
+@@ -5146,8 +5152,8 @@ esac
  
  
  
@@ -11046,7 +11046,7 @@ Index: binutils-2.21/binutils/configure
  
  
  
-@@ -5187,7 +5193,7 @@
+@@ -5187,7 +5193,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -11055,7 +11055,7 @@ Index: binutils-2.21/binutils/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5873,8 +5879,8 @@
+@@ -5873,8 +5879,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -11066,7 +11066,7 @@ Index: binutils-2.21/binutils/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5923,6 +5929,80 @@
+@@ -5923,6 +5929,80 @@ esac
  
  
  
@@ -11147,7 +11147,7 @@ Index: binutils-2.21/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5939,6 +6019,11 @@
+@@ -5939,6 +6019,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -11159,7 +11159,7 @@ Index: binutils-2.21/binutils/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6107,7 +6192,8 @@
+@@ -6107,7 +6192,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -11169,7 +11169,7 @@ Index: binutils-2.21/binutils/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6261,6 +6347,21 @@
+@@ -6261,6 +6347,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -11191,7 +11191,7 @@ Index: binutils-2.21/binutils/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6276,9 +6377,162 @@
+@@ -6276,9 +6377,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -11356,7 +11356,7 @@ Index: binutils-2.21/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6294,7 +6548,7 @@
+@@ -6294,7 +6548,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -11365,7 +11365,7 @@ Index: binutils-2.21/binutils/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6314,11 +6568,15 @@
+@@ -6314,11 +6568,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -11384,7 +11384,7 @@ Index: binutils-2.21/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6334,7 +6592,7 @@
+@@ -6334,7 +6592,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -11393,7 +11393,7 @@ Index: binutils-2.21/binutils/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6353,6 +6611,10 @@
+@@ -6353,6 +6611,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -11404,7 +11404,7 @@ Index: binutils-2.21/binutils/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6364,12 +6626,10 @@
+@@ -6364,12 +6626,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -11419,7 +11419,7 @@ Index: binutils-2.21/binutils/configure
  
  
  
-@@ -6381,6 +6641,64 @@
+@@ -6381,6 +6641,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -11484,7 +11484,7 @@ Index: binutils-2.21/binutils/configure
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6715,8 +7033,8 @@
+@@ -6715,8 +7033,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -11495,7 +11495,7 @@ Index: binutils-2.21/binutils/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6752,6 +7070,7 @@
+@@ -6752,6 +7070,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -11503,7 +11503,7 @@ Index: binutils-2.21/binutils/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6793,6 +7112,18 @@
+@@ -6793,6 +7112,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -11522,7 +11522,7 @@ Index: binutils-2.21/binutils/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6804,7 +7135,7 @@
+@@ -6804,7 +7135,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -11531,7 +11531,7 @@ Index: binutils-2.21/binutils/configure
    const char *name;
    void       *address;
  }
-@@ -6830,8 +7161,8 @@
+@@ -6830,8 +7161,8 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -11542,7 +11542,7 @@ Index: binutils-2.21/binutils/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6841,8 +7172,8 @@
+@@ -6841,8 +7172,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -11553,7 +11553,7 @@ Index: binutils-2.21/binutils/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6879,6 +7210,19 @@
+@@ -6879,6 +7210,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -11573,7 +11573,7 @@ Index: binutils-2.21/binutils/configure
  
  
  
-@@ -6899,6 +7243,42 @@
+@@ -6899,6 +7243,42 @@ fi
  
  
  
@@ -11616,7 +11616,7 @@ Index: binutils-2.21/binutils/configure
  
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
-@@ -7093,6 +7473,123 @@
+@@ -7093,6 +7473,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -11740,7 +11740,7 @@ Index: binutils-2.21/binutils/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7656,6 +8153,8 @@
+@@ -7656,6 +8153,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -11749,7 +11749,7 @@ Index: binutils-2.21/binutils/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7851,7 +8350,8 @@
+@@ -7851,7 +8350,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -11759,7 +11759,7 @@ Index: binutils-2.21/binutils/configure
  
  
  
-@@ -7940,7 +8440,7 @@
+@@ -7940,7 +8440,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -11768,7 +11768,7 @@ Index: binutils-2.21/binutils/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8238,8 +8738,6 @@
+@@ -8238,8 +8738,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -11777,7 +11777,7 @@ Index: binutils-2.21/binutils/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8404,6 +8902,12 @@
+@@ -8404,6 +8902,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -11790,7 +11790,7 @@ Index: binutils-2.21/binutils/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8466,7 +8970,7 @@
+@@ -8466,7 +8970,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -11799,7 +11799,7 @@ Index: binutils-2.21/binutils/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8523,13 +9027,17 @@
+@@ -8523,13 +9027,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -11823,7 +11823,7 @@ Index: binutils-2.21/binutils/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8590,6 +9098,11 @@
+@@ -8590,6 +9098,11 @@ fi
  
  
  
@@ -11835,7 +11835,7 @@ Index: binutils-2.21/binutils/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8940,7 +9453,8 @@
+@@ -8940,7 +9453,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -11845,7 +11845,7 @@ Index: binutils-2.21/binutils/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8988,7 +9502,7 @@
+@@ -8988,7 +9502,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -11854,7 +11854,7 @@ Index: binutils-2.21/binutils/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9039,12 +9553,12 @@
+@@ -9039,12 +9553,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -11869,7 +11869,7 @@ Index: binutils-2.21/binutils/configure
  	  fi
  	  ;;
  	esac
-@@ -9058,8 +9572,8 @@
+@@ -9058,8 +9572,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -11880,7 +11880,7 @@ Index: binutils-2.21/binutils/configure
        fi
        ;;
  
-@@ -9077,8 +9591,8 @@
+@@ -9077,8 +9591,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11891,7 +11891,7 @@ Index: binutils-2.21/binutils/configure
        else
  	ld_shlibs=no
        fi
-@@ -9124,8 +9638,8 @@
+@@ -9124,8 +9638,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11902,7 +11902,7 @@ Index: binutils-2.21/binutils/configure
        else
  	ld_shlibs=no
        fi
-@@ -9255,7 +9769,13 @@
+@@ -9255,7 +9769,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -11917,7 +11917,7 @@ Index: binutils-2.21/binutils/configure
  /* end confdefs.h.  */
  
  int
-@@ -9268,22 +9788,29 @@
+@@ -9268,22 +9788,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -11960,7 +11960,7 @@ Index: binutils-2.21/binutils/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9295,7 +9822,13 @@
+@@ -9295,7 +9822,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -11975,7 +11975,7 @@ Index: binutils-2.21/binutils/configure
  /* end confdefs.h.  */
  
  int
-@@ -9308,22 +9841,29 @@
+@@ -9308,22 +9841,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -12018,7 +12018,7 @@ Index: binutils-2.21/binutils/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9368,20 +9908,63 @@
+@@ -9368,20 +9908,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -12096,7 +12096,7 @@ Index: binutils-2.21/binutils/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9446,7 +10029,7 @@
+@@ -9446,7 +10029,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -12105,7 +12105,7 @@ Index: binutils-2.21/binutils/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9454,7 +10037,7 @@
+@@ -9454,7 +10037,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -12114,7 +12114,7 @@ Index: binutils-2.21/binutils/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9470,7 +10053,7 @@
+@@ -9470,7 +10053,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -12123,7 +12123,7 @@ Index: binutils-2.21/binutils/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9494,10 +10077,10 @@
+@@ -9494,10 +10077,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -12136,7 +12136,7 @@ Index: binutils-2.21/binutils/configure
  	  ;;
  	esac
        else
-@@ -9576,23 +10159,36 @@
+@@ -9576,23 +10159,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -12181,7 +12181,7 @@ Index: binutils-2.21/binutils/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9677,7 +10273,7 @@
+@@ -9677,7 +10273,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -12190,7 +12190,7 @@ Index: binutils-2.21/binutils/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9696,9 +10292,9 @@
+@@ -9696,9 +10292,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -12202,7 +12202,7 @@ Index: binutils-2.21/binutils/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10274,8 +10870,9 @@
+@@ -10274,8 +10870,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -12214,7 +12214,7 @@ Index: binutils-2.21/binutils/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10308,13 +10905,71 @@
+@@ -10308,13 +10905,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -12287,7 +12287,7 @@ Index: binutils-2.21/binutils/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10410,7 +11065,7 @@
+@@ -10410,7 +11065,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -12296,7 +12296,7 @@ Index: binutils-2.21/binutils/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11206,7 +11861,7 @@
+@@ -11206,7 +11861,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -12305,7 +12305,7 @@ Index: binutils-2.21/binutils/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11250,10 +11905,10 @@
+@@ -11250,10 +11905,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -12318,7 +12318,7 @@ Index: binutils-2.21/binutils/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11312,7 +11967,7 @@
+@@ -11312,7 +11967,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -12327,7 +12327,7 @@ Index: binutils-2.21/binutils/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11356,10 +12011,10 @@
+@@ -11356,10 +12011,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -12340,7 +12340,7 @@ Index: binutils-2.21/binutils/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14751,13 +15406,20 @@
+@@ -14754,13 +15409,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -12361,7 +12361,7 @@ Index: binutils-2.21/binutils/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14772,14 +15434,17 @@
+@@ -14775,14 +15437,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -12380,7 +12380,7 @@ Index: binutils-2.21/binutils/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -14812,12 +15477,12 @@
+@@ -14815,12 +15480,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -12394,7 +12394,7 @@ Index: binutils-2.21/binutils/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -14872,8 +15537,13 @@
+@@ -14875,8 +15540,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -12408,7 +12408,7 @@ Index: binutils-2.21/binutils/configure
  STRIP \
  RANLIB \
  CC \
-@@ -14883,12 +15553,14 @@
+@@ -14886,12 +15556,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -12424,7 +12424,7 @@ Index: binutils-2.21/binutils/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -14904,7 +15576,6 @@
+@@ -14907,7 +15579,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -12432,7 +12432,7 @@ Index: binutils-2.21/binutils/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -14940,6 +15611,7 @@
+@@ -14943,6 +15614,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -12440,7 +12440,7 @@ Index: binutils-2.21/binutils/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15697,7 +16369,8 @@
+@@ -15700,7 +16372,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -12450,7 +12450,7 @@ Index: binutils-2.21/binutils/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15800,19 +16473,42 @@
+@@ -15803,19 +16476,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -12494,7 +12494,7 @@ Index: binutils-2.21/binutils/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -15842,6 +16538,12 @@
+@@ -15845,6 +16541,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -12507,7 +12507,7 @@ Index: binutils-2.21/binutils/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -15851,6 +16553,9 @@
+@@ -15854,6 +16556,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -12517,7 +12517,7 @@ Index: binutils-2.21/binutils/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -15965,12 +16670,12 @@
+@@ -15968,12 +16673,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -12533,7 +12533,7 @@ Index: binutils-2.21/binutils/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16057,9 +16762,6 @@
+@@ -16060,9 +16765,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -12543,7 +12543,7 @@ Index: binutils-2.21/binutils/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16075,6 +16777,9 @@
+@@ -16078,6 +16780,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -12553,7 +12553,7 @@ Index: binutils-2.21/binutils/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16107,210 +16812,169 @@
+@@ -16110,210 +16815,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -12924,11 +12924,11 @@ Index: binutils-2.21/binutils/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21/gas/configure
+Index: binutils-2.21.1/gas/configure
 ===================================================================
---- binutils-2.21.orig/gas/configure	2010-11-05 03:33:36.000000000 -0700
-+++ binutils-2.21/gas/configure	2011-01-07 10:49:16.426101000 -0800
-@@ -645,8 +645,11 @@
+--- binutils-2.21.1.orig/gas/configure
++++ binutils-2.21.1/gas/configure
+@@ -645,8 +645,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -12940,7 +12940,7 @@ Index: binutils-2.21/gas/configure
  OBJDUMP
  LN_S
  NM
-@@ -759,6 +762,7 @@
+@@ -759,6 +762,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -12948,7 +12948,7 @@ Index: binutils-2.21/gas/configure
  enable_libtool_lock
  enable_targets
  enable_checking
-@@ -1420,6 +1424,8 @@
+@@ -1420,6 +1424,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -12957,7 +12957,7 @@ Index: binutils-2.21/gas/configure
    --with-zlib             include zlib support (auto/yes/no) default=auto
  
  Some influential environment variables:
-@@ -5135,8 +5141,8 @@
+@@ -5135,8 +5141,8 @@ esac
  
  
  
@@ -12968,7 +12968,7 @@ Index: binutils-2.21/gas/configure
  
  
  
-@@ -5176,7 +5182,7 @@
+@@ -5176,7 +5182,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -12977,7 +12977,7 @@ Index: binutils-2.21/gas/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5862,8 +5868,8 @@
+@@ -5862,8 +5868,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -12988,7 +12988,7 @@ Index: binutils-2.21/gas/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5912,6 +5918,80 @@
+@@ -5912,6 +5918,80 @@ esac
  
  
  
@@ -13069,7 +13069,7 @@ Index: binutils-2.21/gas/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5928,6 +6008,11 @@
+@@ -5928,6 +6008,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -13081,7 +13081,7 @@ Index: binutils-2.21/gas/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6096,7 +6181,8 @@
+@@ -6096,7 +6181,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -13091,7 +13091,7 @@ Index: binutils-2.21/gas/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6250,6 +6336,21 @@
+@@ -6250,6 +6336,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -13113,7 +13113,7 @@ Index: binutils-2.21/gas/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6265,9 +6366,162 @@
+@@ -6265,9 +6366,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -13278,7 +13278,7 @@ Index: binutils-2.21/gas/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6283,7 +6537,7 @@
+@@ -6283,7 +6537,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -13287,7 +13287,7 @@ Index: binutils-2.21/gas/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6303,11 +6557,15 @@
+@@ -6303,11 +6557,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -13306,7 +13306,7 @@ Index: binutils-2.21/gas/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6323,7 +6581,7 @@
+@@ -6323,7 +6581,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -13315,7 +13315,7 @@ Index: binutils-2.21/gas/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6342,6 +6600,10 @@
+@@ -6342,6 +6600,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -13326,7 +13326,7 @@ Index: binutils-2.21/gas/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6353,16 +6615,72 @@
+@@ -6353,16 +6615,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -13403,7 +13403,7 @@ Index: binutils-2.21/gas/configure
  
  
  
-@@ -6704,8 +7022,8 @@
+@@ -6704,8 +7022,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -13414,7 +13414,7 @@ Index: binutils-2.21/gas/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6741,6 +7059,7 @@
+@@ -6741,6 +7059,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -13422,7 +13422,7 @@ Index: binutils-2.21/gas/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6782,6 +7101,18 @@
+@@ -6782,6 +7101,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -13441,7 +13441,7 @@ Index: binutils-2.21/gas/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6793,7 +7124,7 @@
+@@ -6793,7 +7124,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -13450,7 +13450,7 @@ Index: binutils-2.21/gas/configure
    const char *name;
    void       *address;
  }
-@@ -6819,8 +7150,8 @@
+@@ -6819,8 +7150,8 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -13461,7 +13461,7 @@ Index: binutils-2.21/gas/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6830,8 +7161,8 @@
+@@ -6830,8 +7161,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -13472,7 +13472,7 @@ Index: binutils-2.21/gas/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6868,6 +7199,19 @@
+@@ -6868,6 +7199,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -13492,7 +13492,7 @@ Index: binutils-2.21/gas/configure
  
  
  
-@@ -6888,6 +7232,42 @@
+@@ -6888,6 +7232,42 @@ fi
  
  
  
@@ -13535,7 +13535,7 @@ Index: binutils-2.21/gas/configure
  
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
-@@ -7082,6 +7462,123 @@
+@@ -7082,6 +7462,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -13659,7 +13659,7 @@ Index: binutils-2.21/gas/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7645,6 +8142,8 @@
+@@ -7645,6 +8142,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -13668,7 +13668,7 @@ Index: binutils-2.21/gas/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7840,7 +8339,8 @@
+@@ -7840,7 +8339,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -13678,7 +13678,7 @@ Index: binutils-2.21/gas/configure
  
  
  
-@@ -7929,7 +8429,7 @@
+@@ -7929,7 +8429,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -13687,7 +13687,7 @@ Index: binutils-2.21/gas/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8227,8 +8727,6 @@
+@@ -8227,8 +8727,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -13696,7 +13696,7 @@ Index: binutils-2.21/gas/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8393,6 +8891,12 @@
+@@ -8393,6 +8891,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -13709,7 +13709,7 @@ Index: binutils-2.21/gas/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8455,7 +8959,7 @@
+@@ -8455,7 +8959,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -13718,7 +13718,7 @@ Index: binutils-2.21/gas/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8512,13 +9016,17 @@
+@@ -8512,13 +9016,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -13742,7 +13742,7 @@ Index: binutils-2.21/gas/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8579,6 +9087,11 @@
+@@ -8579,6 +9087,11 @@ fi
  
  
  
@@ -13754,7 +13754,7 @@ Index: binutils-2.21/gas/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8929,7 +9442,8 @@
+@@ -8929,7 +9442,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -13764,7 +13764,7 @@ Index: binutils-2.21/gas/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8977,7 +9491,7 @@
+@@ -8977,7 +9491,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -13773,7 +13773,7 @@ Index: binutils-2.21/gas/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9028,12 +9542,12 @@
+@@ -9028,12 +9542,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -13788,7 +13788,7 @@ Index: binutils-2.21/gas/configure
  	  fi
  	  ;;
  	esac
-@@ -9047,8 +9561,8 @@
+@@ -9047,8 +9561,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -13799,7 +13799,7 @@ Index: binutils-2.21/gas/configure
        fi
        ;;
  
-@@ -9066,8 +9580,8 @@
+@@ -9066,8 +9580,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -13810,7 +13810,7 @@ Index: binutils-2.21/gas/configure
        else
  	ld_shlibs=no
        fi
-@@ -9113,8 +9627,8 @@
+@@ -9113,8 +9627,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -13821,7 +13821,7 @@ Index: binutils-2.21/gas/configure
        else
  	ld_shlibs=no
        fi
-@@ -9244,7 +9758,13 @@
+@@ -9244,7 +9758,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -13836,7 +13836,7 @@ Index: binutils-2.21/gas/configure
  /* end confdefs.h.  */
  
  int
-@@ -9257,22 +9777,29 @@
+@@ -9257,22 +9777,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -13879,7 +13879,7 @@ Index: binutils-2.21/gas/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9284,7 +9811,13 @@
+@@ -9284,7 +9811,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -13894,7 +13894,7 @@ Index: binutils-2.21/gas/configure
  /* end confdefs.h.  */
  
  int
-@@ -9297,22 +9830,29 @@
+@@ -9297,22 +9830,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -13937,7 +13937,7 @@ Index: binutils-2.21/gas/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9357,20 +9897,63 @@
+@@ -9357,20 +9897,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -14015,7 +14015,7 @@ Index: binutils-2.21/gas/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9435,7 +10018,7 @@
+@@ -9435,7 +10018,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -14024,7 +14024,7 @@ Index: binutils-2.21/gas/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9443,7 +10026,7 @@
+@@ -9443,7 +10026,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -14033,7 +14033,7 @@ Index: binutils-2.21/gas/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9459,7 +10042,7 @@
+@@ -9459,7 +10042,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -14042,7 +14042,7 @@ Index: binutils-2.21/gas/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9483,10 +10066,10 @@
+@@ -9483,10 +10066,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -14055,7 +14055,7 @@ Index: binutils-2.21/gas/configure
  	  ;;
  	esac
        else
-@@ -9565,23 +10148,36 @@
+@@ -9565,23 +10148,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -14100,7 +14100,7 @@ Index: binutils-2.21/gas/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9666,7 +10262,7 @@
+@@ -9666,7 +10262,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -14109,7 +14109,7 @@ Index: binutils-2.21/gas/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9685,9 +10281,9 @@
+@@ -9685,9 +10281,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -14121,7 +14121,7 @@ Index: binutils-2.21/gas/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10263,8 +10859,9 @@
+@@ -10263,8 +10859,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14133,7 +14133,7 @@ Index: binutils-2.21/gas/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10297,13 +10894,71 @@
+@@ -10297,13 +10894,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -14206,7 +14206,7 @@ Index: binutils-2.21/gas/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10399,7 +11054,7 @@
+@@ -10399,7 +11054,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -14215,7 +14215,7 @@ Index: binutils-2.21/gas/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11195,7 +11850,7 @@
+@@ -11195,7 +11850,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -14224,7 +14224,7 @@ Index: binutils-2.21/gas/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11239,10 +11894,10 @@
+@@ -11239,10 +11894,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14237,7 +14237,7 @@ Index: binutils-2.21/gas/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11301,7 +11956,7 @@
+@@ -11301,7 +11956,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -14246,7 +14246,7 @@ Index: binutils-2.21/gas/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11345,10 +12000,10 @@
+@@ -11345,10 +12000,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14259,7 +14259,7 @@ Index: binutils-2.21/gas/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14941,13 +15596,20 @@
+@@ -14941,13 +15596,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -14280,7 +14280,7 @@ Index: binutils-2.21/gas/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14962,14 +15624,17 @@
+@@ -14962,14 +15624,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -14299,7 +14299,7 @@ Index: binutils-2.21/gas/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15002,12 +15667,12 @@
+@@ -15002,12 +15667,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -14313,7 +14313,7 @@ Index: binutils-2.21/gas/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15062,8 +15727,13 @@
+@@ -15062,8 +15727,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -14327,7 +14327,7 @@ Index: binutils-2.21/gas/configure
  STRIP \
  RANLIB \
  CC \
-@@ -15073,12 +15743,14 @@
+@@ -15073,12 +15743,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -14343,7 +14343,7 @@ Index: binutils-2.21/gas/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15094,7 +15766,6 @@
+@@ -15094,7 +15766,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -14351,7 +14351,7 @@ Index: binutils-2.21/gas/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15130,6 +15801,7 @@
+@@ -15130,6 +15801,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -14359,7 +14359,7 @@ Index: binutils-2.21/gas/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15894,7 +16566,8 @@
+@@ -15894,7 +16566,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -14369,7 +14369,7 @@ Index: binutils-2.21/gas/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15997,19 +16670,42 @@
+@@ -15997,19 +16670,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -14413,7 +14413,7 @@ Index: binutils-2.21/gas/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16039,6 +16735,12 @@
+@@ -16039,6 +16735,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -14426,7 +14426,7 @@ Index: binutils-2.21/gas/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16048,6 +16750,9 @@
+@@ -16048,6 +16750,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -14436,7 +14436,7 @@ Index: binutils-2.21/gas/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16162,12 +16867,12 @@
+@@ -16162,12 +16867,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -14452,7 +14452,7 @@ Index: binutils-2.21/gas/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16254,9 +16959,6 @@
+@@ -16254,9 +16959,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -14462,7 +14462,7 @@ Index: binutils-2.21/gas/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16272,6 +16974,9 @@
+@@ -16272,6 +16974,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -14472,7 +14472,7 @@ Index: binutils-2.21/gas/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16304,210 +17009,169 @@
+@@ -16304,210 +17009,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -14843,11 +14843,11 @@ Index: binutils-2.21/gas/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21/gprof/configure
+Index: binutils-2.21.1/gprof/configure
 ===================================================================
---- binutils-2.21.orig/gprof/configure	2011-01-07 10:49:15.956101000 -0800
-+++ binutils-2.21/gprof/configure	2011-01-07 10:49:16.436101000 -0800
-@@ -629,8 +629,11 @@
+--- binutils-2.21.1.orig/gprof/configure
++++ binutils-2.21.1/gprof/configure
+@@ -629,8 +629,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -14859,7 +14859,7 @@ Index: binutils-2.21/gprof/configure
  OBJDUMP
  LN_S
  NM
-@@ -743,6 +746,7 @@
+@@ -743,6 +746,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -14867,7 +14867,7 @@ Index: binutils-2.21/gprof/configure
  enable_libtool_lock
  enable_nls
  enable_maintainer_mode
-@@ -1397,6 +1401,8 @@
+@@ -1397,6 +1401,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -14876,7 +14876,7 @@ Index: binutils-2.21/gprof/configure
  
  Some influential environment variables:
    CC          C compiler command
-@@ -5065,8 +5071,8 @@
+@@ -5065,8 +5071,8 @@ esac
  
  
  
@@ -14887,7 +14887,7 @@ Index: binutils-2.21/gprof/configure
  
  
  
-@@ -5106,7 +5112,7 @@
+@@ -5106,7 +5112,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -14896,7 +14896,7 @@ Index: binutils-2.21/gprof/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5792,8 +5798,8 @@
+@@ -5792,8 +5798,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -14907,7 +14907,7 @@ Index: binutils-2.21/gprof/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5842,6 +5848,80 @@
+@@ -5842,6 +5848,80 @@ esac
  
  
  
@@ -14988,7 +14988,7 @@ Index: binutils-2.21/gprof/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5858,6 +5938,11 @@
+@@ -5858,6 +5938,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -15000,7 +15000,7 @@ Index: binutils-2.21/gprof/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6026,7 +6111,8 @@
+@@ -6026,7 +6111,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -15010,7 +15010,7 @@ Index: binutils-2.21/gprof/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6103,11 +6189,6 @@
+@@ -6103,11 +6189,6 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
    lt_cv_deplibs_check_method=pass_all
    ;;
  
@@ -15022,7 +15022,7 @@ Index: binutils-2.21/gprof/configure
  netbsd*)
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
-@@ -6185,6 +6266,21 @@
+@@ -6185,6 +6266,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -15044,7 +15044,7 @@ Index: binutils-2.21/gprof/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6200,9 +6296,162 @@
+@@ -6200,9 +6296,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -15209,7 +15209,7 @@ Index: binutils-2.21/gprof/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6218,7 +6467,7 @@
+@@ -6218,7 +6467,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -15218,7 +15218,7 @@ Index: binutils-2.21/gprof/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6238,11 +6487,15 @@
+@@ -6238,11 +6487,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -15237,7 +15237,7 @@ Index: binutils-2.21/gprof/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6258,7 +6511,7 @@
+@@ -6258,7 +6511,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -15246,7 +15246,7 @@ Index: binutils-2.21/gprof/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6277,6 +6530,10 @@
+@@ -6277,6 +6530,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -15257,7 +15257,7 @@ Index: binutils-2.21/gprof/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6288,16 +6545,72 @@
+@@ -6288,16 +6545,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -15334,7 +15334,7 @@ Index: binutils-2.21/gprof/configure
  
  
  
-@@ -6639,8 +6952,8 @@
+@@ -6639,8 +6952,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -15345,7 +15345,7 @@ Index: binutils-2.21/gprof/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6676,6 +6989,7 @@
+@@ -6676,6 +6989,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -15353,7 +15353,7 @@ Index: binutils-2.21/gprof/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6717,6 +7031,18 @@
+@@ -6717,6 +7031,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -15372,7 +15372,7 @@ Index: binutils-2.21/gprof/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6728,7 +7054,7 @@
+@@ -6728,7 +7054,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -15381,7 +15381,7 @@ Index: binutils-2.21/gprof/configure
    const char *name;
    void       *address;
  }
-@@ -6754,8 +7080,8 @@
+@@ -6754,8 +7080,8 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -15392,7 +15392,7 @@ Index: binutils-2.21/gprof/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6765,8 +7091,8 @@
+@@ -6765,8 +7091,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -15403,7 +15403,7 @@ Index: binutils-2.21/gprof/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6803,6 +7129,17 @@
+@@ -6803,6 +7129,17 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -15421,7 +15421,7 @@ Index: binutils-2.21/gprof/configure
  
  
  
-@@ -6824,6 +7161,44 @@
+@@ -6824,6 +7161,44 @@ fi
  
  
  
@@ -15466,7 +15466,7 @@ Index: binutils-2.21/gprof/configure
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
    enableval=$enable_libtool_lock;
-@@ -7017,6 +7392,123 @@
+@@ -7017,6 +7392,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -15590,7 +15590,7 @@ Index: binutils-2.21/gprof/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7580,6 +8072,8 @@
+@@ -7580,6 +8072,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -15599,7 +15599,7 @@ Index: binutils-2.21/gprof/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7775,7 +8269,8 @@
+@@ -7775,7 +8269,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -15609,7 +15609,7 @@ Index: binutils-2.21/gprof/configure
  
  
  
-@@ -7864,7 +8359,7 @@
+@@ -7864,7 +8359,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -15618,7 +15618,7 @@ Index: binutils-2.21/gprof/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8162,8 +8657,6 @@
+@@ -8162,8 +8657,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -15627,7 +15627,7 @@ Index: binutils-2.21/gprof/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8328,6 +8821,12 @@
+@@ -8328,6 +8821,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -15640,7 +15640,7 @@ Index: binutils-2.21/gprof/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8390,7 +8889,7 @@
+@@ -8390,7 +8889,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -15649,7 +15649,7 @@ Index: binutils-2.21/gprof/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8447,13 +8946,17 @@
+@@ -8447,13 +8946,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -15673,7 +15673,7 @@ Index: binutils-2.21/gprof/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8514,6 +9017,11 @@
+@@ -8514,6 +9017,11 @@ fi
  
  
  
@@ -15685,7 +15685,7 @@ Index: binutils-2.21/gprof/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8864,7 +9372,8 @@
+@@ -8864,7 +9372,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -15695,7 +15695,7 @@ Index: binutils-2.21/gprof/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8912,7 +9421,7 @@
+@@ -8912,7 +9421,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -15704,7 +15704,7 @@ Index: binutils-2.21/gprof/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -8963,12 +9472,12 @@
+@@ -8963,12 +9472,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -15719,7 +15719,7 @@ Index: binutils-2.21/gprof/configure
  	  fi
  	  ;;
  	esac
-@@ -8982,8 +9491,8 @@
+@@ -8982,8 +9491,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -15730,7 +15730,7 @@ Index: binutils-2.21/gprof/configure
        fi
        ;;
  
-@@ -9001,8 +9510,8 @@
+@@ -9001,8 +9510,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -15741,7 +15741,7 @@ Index: binutils-2.21/gprof/configure
        else
  	ld_shlibs=no
        fi
-@@ -9048,8 +9557,8 @@
+@@ -9048,8 +9557,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -15752,7 +15752,7 @@ Index: binutils-2.21/gprof/configure
        else
  	ld_shlibs=no
        fi
-@@ -9179,7 +9688,13 @@
+@@ -9179,7 +9688,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -15767,7 +15767,7 @@ Index: binutils-2.21/gprof/configure
  /* end confdefs.h.  */
  
  int
-@@ -9192,22 +9707,29 @@
+@@ -9192,22 +9707,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -15810,7 +15810,7 @@ Index: binutils-2.21/gprof/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9219,7 +9741,13 @@
+@@ -9219,7 +9741,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -15825,7 +15825,7 @@ Index: binutils-2.21/gprof/configure
  /* end confdefs.h.  */
  
  int
-@@ -9232,22 +9760,29 @@
+@@ -9232,22 +9760,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -15868,7 +15868,7 @@ Index: binutils-2.21/gprof/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9292,20 +9827,63 @@
+@@ -9292,20 +9827,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -15946,7 +15946,7 @@ Index: binutils-2.21/gprof/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9370,7 +9948,7 @@
+@@ -9370,7 +9948,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -15955,7 +15955,7 @@ Index: binutils-2.21/gprof/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9378,7 +9956,7 @@
+@@ -9378,7 +9956,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -15964,7 +15964,7 @@ Index: binutils-2.21/gprof/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9394,7 +9972,7 @@
+@@ -9394,7 +9972,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -15973,7 +15973,7 @@ Index: binutils-2.21/gprof/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9418,10 +9996,10 @@
+@@ -9418,10 +9996,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -15986,7 +15986,7 @@ Index: binutils-2.21/gprof/configure
  	  ;;
  	esac
        else
-@@ -9500,23 +10078,36 @@
+@@ -9500,23 +10078,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -16031,7 +16031,7 @@ Index: binutils-2.21/gprof/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9601,7 +10192,7 @@
+@@ -9601,7 +10192,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -16040,7 +16040,7 @@ Index: binutils-2.21/gprof/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9620,9 +10211,9 @@
+@@ -9620,9 +10211,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -16052,7 +16052,7 @@ Index: binutils-2.21/gprof/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10198,8 +10789,9 @@
+@@ -10198,8 +10789,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -16064,7 +16064,7 @@ Index: binutils-2.21/gprof/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10232,13 +10824,71 @@
+@@ -10232,13 +10824,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -16137,7 +16137,7 @@ Index: binutils-2.21/gprof/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10334,7 +10984,7 @@
+@@ -10334,7 +10984,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -16146,7 +16146,7 @@ Index: binutils-2.21/gprof/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11130,7 +11780,7 @@
+@@ -11130,7 +11780,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -16155,7 +16155,7 @@ Index: binutils-2.21/gprof/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11174,10 +11824,10 @@
+@@ -11174,10 +11824,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -16168,7 +16168,7 @@ Index: binutils-2.21/gprof/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11236,7 +11886,7 @@
+@@ -11236,7 +11886,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -16177,7 +16177,7 @@ Index: binutils-2.21/gprof/configure
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11280,10 +11930,10 @@
+@@ -11280,10 +11930,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -16190,7 +16190,7 @@ Index: binutils-2.21/gprof/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12825,13 +13475,20 @@
+@@ -12825,13 +13475,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -16211,7 +16211,7 @@ Index: binutils-2.21/gprof/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12846,14 +13503,17 @@
+@@ -12846,14 +13503,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -16230,7 +16230,7 @@ Index: binutils-2.21/gprof/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12886,12 +13546,12 @@
+@@ -12886,12 +13546,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -16244,7 +16244,7 @@ Index: binutils-2.21/gprof/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12946,8 +13606,13 @@
+@@ -12946,8 +13606,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -16258,7 +16258,7 @@ Index: binutils-2.21/gprof/configure
  STRIP \
  RANLIB \
  CC \
-@@ -12957,12 +13622,14 @@
+@@ -12957,12 +13622,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -16274,7 +16274,7 @@ Index: binutils-2.21/gprof/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12978,7 +13645,6 @@
+@@ -12978,7 +13645,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -16282,7 +16282,7 @@ Index: binutils-2.21/gprof/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13014,6 +13680,7 @@
+@@ -13014,6 +13680,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -16290,7 +16290,7 @@ Index: binutils-2.21/gprof/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13770,7 +14437,8 @@
+@@ -13770,7 +14437,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -16300,7 +16300,7 @@ Index: binutils-2.21/gprof/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -13873,19 +14541,42 @@
+@@ -13873,19 +14541,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -16344,7 +16344,7 @@ Index: binutils-2.21/gprof/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13915,6 +14606,12 @@
+@@ -13915,6 +14606,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -16357,7 +16357,7 @@ Index: binutils-2.21/gprof/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -13924,6 +14621,9 @@
+@@ -13924,6 +14621,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -16367,7 +16367,7 @@ Index: binutils-2.21/gprof/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14038,12 +14738,12 @@
+@@ -14038,12 +14738,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -16383,7 +16383,7 @@ Index: binutils-2.21/gprof/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14130,9 +14830,6 @@
+@@ -14130,9 +14830,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -16393,7 +16393,7 @@ Index: binutils-2.21/gprof/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14148,6 +14845,9 @@
+@@ -14148,6 +14845,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -16403,7 +16403,7 @@ Index: binutils-2.21/gprof/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14180,210 +14880,169 @@
+@@ -14180,210 +14880,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -16774,11 +16774,11 @@ Index: binutils-2.21/gprof/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21/ld/configure
+Index: binutils-2.21.1/ld/configure
 ===================================================================
---- binutils-2.21.orig/ld/configure	2010-11-23 05:50:32.000000000 -0800
-+++ binutils-2.21/ld/configure	2011-01-07 10:49:16.436101000 -0800
-@@ -643,8 +643,11 @@
+--- binutils-2.21.1.orig/ld/configure
++++ binutils-2.21.1/ld/configure
+@@ -644,8 +644,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -16790,7 +16790,7 @@ Index: binutils-2.21/ld/configure
  OBJDUMP
  LN_S
  NM
-@@ -776,6 +779,7 @@
+@@ -783,6 +786,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -16798,7 +16798,7 @@ Index: binutils-2.21/ld/configure
  enable_libtool_lock
  enable_nls
  '
-@@ -1436,6 +1440,8 @@
+@@ -1447,6 +1451,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -16807,7 +16807,7 @@ Index: binutils-2.21/ld/configure
  
  Some influential environment variables:
    CC          C compiler command
-@@ -5562,8 +5568,8 @@
+@@ -6081,8 +6087,8 @@ esac
  
  
  
@@ -16818,7 +16818,7 @@ Index: binutils-2.21/ld/configure
  
  
  
-@@ -5603,7 +5609,7 @@
+@@ -6122,7 +6128,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -16827,7 +16827,7 @@ Index: binutils-2.21/ld/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6289,8 +6295,8 @@
+@@ -6808,8 +6814,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -16838,7 +16838,7 @@ Index: binutils-2.21/ld/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6339,6 +6345,80 @@
+@@ -6858,6 +6864,80 @@ esac
  
  
  
@@ -16919,7 +16919,7 @@ Index: binutils-2.21/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6355,6 +6435,11 @@
+@@ -6874,6 +6954,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -16931,7 +16931,7 @@ Index: binutils-2.21/ld/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6523,7 +6608,8 @@
+@@ -7042,7 +7127,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -16941,7 +16941,7 @@ Index: binutils-2.21/ld/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6677,6 +6763,21 @@
+@@ -7196,6 +7282,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -16963,7 +16963,7 @@ Index: binutils-2.21/ld/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6692,9 +6793,162 @@
+@@ -7211,9 +7312,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -16977,7 +16977,9 @@ Index: binutils-2.21/ld/configure
 +
 +
 +
-+if test -n "$ac_tool_prefix"; then
+ if test -n "$ac_tool_prefix"; then
+-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
+-set dummy ${ac_tool_prefix}ar; ac_word=$2
 +  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
@@ -17118,9 +17120,7 @@ Index: binutils-2.21/ld/configure
 +
 +
 +
- if test -n "$ac_tool_prefix"; then
--  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
--set dummy ${ac_tool_prefix}ar; ac_word=$2
++if test -n "$ac_tool_prefix"; then
 +  for ac_prog in ar
 +  do
 +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
@@ -17128,7 +17128,7 @@ Index: binutils-2.21/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6710,7 +6964,7 @@
+@@ -7229,7 +7483,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -17137,7 +17137,7 @@ Index: binutils-2.21/ld/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6730,11 +6984,15 @@
+@@ -7249,11 +7503,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -17156,7 +17156,7 @@ Index: binutils-2.21/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6750,7 +7008,7 @@
+@@ -7269,7 +7527,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -17165,7 +17165,7 @@ Index: binutils-2.21/ld/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6769,6 +7027,10 @@
+@@ -7288,6 +7546,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -17176,7 +17176,7 @@ Index: binutils-2.21/ld/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6780,16 +7042,72 @@
+@@ -7299,12 +7561,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -17188,17 +17188,13 @@ Index: binutils-2.21/ld/configure
 -test -z "$AR_FLAGS" && AR_FLAGS=cru
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
-+
-+
-+
-+
-+
-+
-+
-+
-+
-+
+ 
+ 
+ 
+@@ -7316,6 +7576,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if test "${lt_cv_ar_at_file+set}" = set; then :
@@ -17211,7 +17207,7 @@ Index: binutils-2.21/ld/configure
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -17237,23 +17233,30 @@ Index: binutils-2.21/ld/configure
 +        fi
 +      fi
 +      rm -f conftest.* libconftest.a
- 
++
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
- 
++
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
- 
++
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
- 
- 
- 
-@@ -7131,8 +7449,8 @@
++
++
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
+@@ -7650,8 +7968,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -17264,7 +17267,7 @@ Index: binutils-2.21/ld/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7168,6 +7486,7 @@
+@@ -7687,6 +8005,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -17272,7 +17275,7 @@ Index: binutils-2.21/ld/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7209,6 +7528,18 @@
+@@ -7728,6 +8047,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -17291,7 +17294,7 @@ Index: binutils-2.21/ld/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7220,7 +7551,7 @@
+@@ -7739,7 +8070,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -17300,7 +17303,7 @@ Index: binutils-2.21/ld/configure
    const char *name;
    void       *address;
  }
-@@ -7246,8 +7577,8 @@
+@@ -7765,8 +8096,8 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -17311,7 +17314,7 @@ Index: binutils-2.21/ld/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7257,8 +7588,8 @@
+@@ -7776,8 +8107,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -17322,7 +17325,7 @@ Index: binutils-2.21/ld/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7295,6 +7626,19 @@
+@@ -7814,6 +8145,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -17339,10 +17342,12 @@ Index: binutils-2.21/ld/configure
 +
 +
 +
++
++
  
  
  
-@@ -7315,6 +7659,42 @@
+@@ -7832,6 +8178,40 @@ fi
  
  
  
@@ -17380,15 +17385,21 @@ Index: binutils-2.21/ld/configure
 +$as_echo "${lt_sysroot:-no}" >&6; }
 +
 +
-+
-+
  
- # Check whether --enable-libtool-lock was given.
- if test "${enable_libtool_lock+set}" = set; then :
-@@ -7509,6 +7889,123 @@
  
- need_locks="$enable_libtool_lock"
  
+@@ -8022,11 +8402,128 @@ sparc*-*solaris*)
+       ;;
+     esac
+   fi
+-  rm -rf conftest*
+-  ;;
++  rm -rf conftest*
++  ;;
++esac
++
++need_locks="$enable_libtool_lock"
++
 +if test -n "$ac_tool_prefix"; then
 +  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
@@ -17474,7 +17485,7 @@ Index: binutils-2.21/ld/configure
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
 +$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 +ac_tool_warned=yes ;;
-+esac
+ esac
 +    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
 +  fi
 +else
@@ -17504,12 +17515,12 @@ Index: binutils-2.21/ld/configure
 +
 +
 +
-+
-+
+ 
+-need_locks="$enable_libtool_lock"
+ 
  
    case $host_os in
-     rhapsody* | darwin*)
-@@ -8072,6 +8569,8 @@
+@@ -8591,6 +9088,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -17518,7 +17529,7 @@ Index: binutils-2.21/ld/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8267,7 +8766,8 @@
+@@ -8787,7 +9286,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -17528,7 +17539,7 @@ Index: binutils-2.21/ld/configure
  
  
  
-@@ -8356,7 +8856,7 @@
+@@ -8876,7 +9376,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -17537,7 +17548,7 @@ Index: binutils-2.21/ld/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8654,8 +9154,6 @@
+@@ -9174,8 +9674,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -17546,7 +17557,7 @@ Index: binutils-2.21/ld/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8820,6 +9318,12 @@
+@@ -9340,6 +9838,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -17559,7 +17570,7 @@ Index: binutils-2.21/ld/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8882,7 +9386,7 @@
+@@ -9402,7 +9906,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -17568,7 +17579,7 @@ Index: binutils-2.21/ld/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8939,13 +9443,17 @@
+@@ -9459,13 +9963,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -17592,7 +17603,7 @@ Index: binutils-2.21/ld/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9006,6 +9514,11 @@
+@@ -9526,6 +10034,11 @@ fi
  
  
  
@@ -17604,7 +17615,7 @@ Index: binutils-2.21/ld/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9356,7 +9869,8 @@
+@@ -9876,7 +10389,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -17614,7 +17625,7 @@ Index: binutils-2.21/ld/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9404,7 +9918,7 @@
+@@ -9924,7 +10438,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -17623,7 +17634,7 @@ Index: binutils-2.21/ld/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9455,12 +9969,12 @@
+@@ -9975,12 +10489,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -17638,7 +17649,7 @@ Index: binutils-2.21/ld/configure
  	  fi
  	  ;;
  	esac
-@@ -9474,8 +9988,8 @@
+@@ -9994,8 +10508,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -17649,7 +17660,7 @@ Index: binutils-2.21/ld/configure
        fi
        ;;
  
-@@ -9493,8 +10007,8 @@
+@@ -10013,8 +10527,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -17660,7 +17671,7 @@ Index: binutils-2.21/ld/configure
        else
  	ld_shlibs=no
        fi
-@@ -9540,8 +10054,8 @@
+@@ -10060,8 +10574,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -17671,7 +17682,7 @@ Index: binutils-2.21/ld/configure
        else
  	ld_shlibs=no
        fi
-@@ -9671,7 +10185,13 @@
+@@ -10191,7 +10705,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -17686,7 +17697,7 @@ Index: binutils-2.21/ld/configure
  /* end confdefs.h.  */
  
  int
-@@ -9684,22 +10204,29 @@
+@@ -10204,22 +10724,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -17729,7 +17740,7 @@ Index: binutils-2.21/ld/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9711,7 +10238,13 @@
+@@ -10231,7 +10758,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -17744,7 +17755,7 @@ Index: binutils-2.21/ld/configure
  /* end confdefs.h.  */
  
  int
-@@ -9724,22 +10257,29 @@
+@@ -10244,22 +10777,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -17787,7 +17798,7 @@ Index: binutils-2.21/ld/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9784,20 +10324,63 @@
+@@ -10304,20 +10844,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -17865,7 +17876,7 @@ Index: binutils-2.21/ld/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9862,7 +10445,7 @@
+@@ -10382,7 +10965,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -17874,7 +17885,7 @@ Index: binutils-2.21/ld/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9870,7 +10453,7 @@
+@@ -10390,7 +10973,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -17883,7 +17894,7 @@ Index: binutils-2.21/ld/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9886,7 +10469,7 @@
+@@ -10406,7 +10989,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -17892,7 +17903,7 @@ Index: binutils-2.21/ld/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9910,10 +10493,10 @@
+@@ -10430,10 +11013,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -17905,7 +17916,7 @@ Index: binutils-2.21/ld/configure
  	  ;;
  	esac
        else
-@@ -9992,23 +10575,36 @@
+@@ -10512,23 +11095,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -17950,7 +17961,7 @@ Index: binutils-2.21/ld/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10093,7 +10689,7 @@
+@@ -10613,7 +11209,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -17959,7 +17970,7 @@ Index: binutils-2.21/ld/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10112,9 +10708,9 @@
+@@ -10632,9 +11228,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -17971,7 +17982,7 @@ Index: binutils-2.21/ld/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10690,8 +11286,9 @@
+@@ -11210,8 +11806,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -17983,7 +17994,7 @@ Index: binutils-2.21/ld/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10724,13 +11321,71 @@
+@@ -11244,13 +11841,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -18056,7 +18067,7 @@ Index: binutils-2.21/ld/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10826,7 +11481,7 @@
+@@ -11346,7 +12001,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -18065,16 +18076,16 @@ Index: binutils-2.21/ld/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11622,7 +12277,7 @@
+@@ -12142,7 +12797,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11625 "configure"
+-#line 12145 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11666,10 +12321,10 @@
+@@ -12186,10 +12841,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18087,16 +18098,16 @@ Index: binutils-2.21/ld/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11728,7 +12383,7 @@
+@@ -12248,7 +12903,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11731 "configure"
+-#line 12251 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11772,10 +12427,10 @@
+@@ -12292,10 +12947,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18109,7 +18120,7 @@ Index: binutils-2.21/ld/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14063,13 +14718,20 @@
+@@ -17606,13 +18261,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18130,7 +18141,7 @@ Index: binutils-2.21/ld/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14084,14 +14746,17 @@
+@@ -17627,14 +18289,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18149,7 +18160,7 @@ Index: binutils-2.21/ld/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -14124,12 +14789,12 @@
+@@ -17667,12 +18332,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18163,7 +18174,7 @@ Index: binutils-2.21/ld/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -14184,8 +14849,13 @@
+@@ -17782,8 +18447,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18177,7 +18188,7 @@ Index: binutils-2.21/ld/configure
  STRIP \
  RANLIB \
  CC \
-@@ -14195,12 +14865,14 @@
+@@ -17793,12 +18463,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18193,7 +18204,7 @@ Index: binutils-2.21/ld/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -14216,7 +14888,6 @@
+@@ -17814,7 +18486,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18201,7 +18212,7 @@ Index: binutils-2.21/ld/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -14252,6 +14923,7 @@
+@@ -17883,6 +18554,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18209,7 +18220,7 @@ Index: binutils-2.21/ld/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15047,7 +15719,8 @@
+@@ -18690,7 +19362,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18219,7 +18230,7 @@ Index: binutils-2.21/ld/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15150,19 +15823,42 @@
+@@ -18793,19 +19466,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18263,7 +18274,7 @@ Index: binutils-2.21/ld/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -15192,6 +15888,12 @@
+@@ -18835,6 +19531,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18276,7 +18287,7 @@ Index: binutils-2.21/ld/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -15201,6 +15903,9 @@
+@@ -18844,6 +19546,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18286,7 +18297,7 @@ Index: binutils-2.21/ld/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -15315,12 +16020,12 @@
+@@ -18958,12 +19663,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18302,7 +18313,7 @@ Index: binutils-2.21/ld/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -15407,9 +16112,6 @@
+@@ -19050,9 +19755,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18312,7 +18323,7 @@ Index: binutils-2.21/ld/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -15425,6 +16127,9 @@
+@@ -19068,6 +19770,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18322,7 +18333,7 @@ Index: binutils-2.21/ld/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -15457,210 +16162,169 @@
+@@ -19114,210 +19819,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -18693,11 +18704,11 @@ Index: binutils-2.21/ld/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21/bfd/configure.in
+Index: binutils-2.21.1/bfd/configure.in
 ===================================================================
---- binutils-2.21.orig/bfd/configure.in	2011-01-07 11:24:12.586101000 -0800
-+++ binutils-2.21/bfd/configure.in	2011-01-07 11:24:45.206101000 -0800
-@@ -532,7 +532,7 @@
+--- binutils-2.21.1.orig/bfd/configure.in
++++ binutils-2.21.1/bfd/configure.in
+@@ -536,7 +536,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -18706,11 +18717,11 @@ Index: binutils-2.21/bfd/configure.in
    fi
  
  # More hacks to build DLLs on Windows.
-Index: binutils-2.21/opcodes/configure.in
+Index: binutils-2.21.1/opcodes/configure.in
 ===================================================================
---- binutils-2.21.orig/opcodes/configure.in	2011-01-07 11:24:12.606100958 -0800
-+++ binutils-2.21/opcodes/configure.in	2011-01-07 11:25:36.816101002 -0800
-@@ -134,7 +134,7 @@
+--- binutils-2.21.1.orig/opcodes/configure.in
++++ binutils-2.21.1/opcodes/configure.in
+@@ -134,7 +134,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/libtool-rpath-fix.patch b/meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.21/libtool-rpath-fix.patch
rename to meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch
diff --git a/meta/recipes-devtools/binutils/binutils_2.21.bb b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
similarity index 87%
rename from meta/recipes-devtools/binutils/binutils_2.21.bb
rename to meta/recipes-devtools/binutils/binutils_2.21.1.bb
index 2211931..368ec4a 100644
--- a/meta/recipes-devtools/binutils/binutils_2.21.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r1"
+PR = "r0"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -29,10 +29,9 @@ SRC_URI = "\
      file://libiberty_path_fix.patch \
      file://binutils-poison.patch \
      file://libtool-rpath-fix.patch \
-     file://binutils-pr12366.patch \
      "
 
-SRC_URI[md5sum] = "c84c5acc9d266f1a7044b51c85a823f5"
-SRC_URI[sha256sum] = "60abec5bf448eb930a5a15acb8712612377dc8bcfb13dfd5131228f70561d0c7"
+SRC_URI[md5sum] = "a22801a9cad45c85e9ff6afc10537d72"
+SRC_URI[sha256sum] = "f769b64350a02fbee009e1582cc12b6ed43b41985de65effb741e258e075dd05"
 
 BBCLASSEXTEND = "native"
-- 
1.7.4.4



