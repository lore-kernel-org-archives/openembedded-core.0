Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7E17391A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 18:52:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2016 11:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,466,1464678000"; d="scan'208";a="150127683"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2016 11:52:42 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 18:49:43 +0000
Message-Id: <343d2d1cdd0646ad98359e4ada930a5f256a01a4.1470158817.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <94406436e753a3b5c6b85552578f97a704f825be.1470158817.git.alejandro.hernandez@linux.intel.com>
References: <94406436e753a3b5c6b85552578f97a704f825be.1470158817.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1470158817.git.alejandro.hernandez@linux.intel.com>
References: <cover.1470158817.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/4] Python3-native: Upgrade from 3.5.1 to 3.5.2
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
X-List-Received-Date: Wed, 03 Aug 2016 18:52:48 -0000

    LICENSE did not change, only dates were changed

    Rebases:
     - 000-cross-compile.patch
     - python-3.3-multilib.patch

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...on3-native_3.5.1.bb => python3-native_3.5.2.bb} |   7 +-
 .../python/python3/000-cross-compile.patch         |  38 +++----
 .../python/python3/python-3.3-multilib.patch       | 116 ++++++++++-----------
 3 files changed, 81 insertions(+), 80 deletions(-)
 rename meta/recipes-devtools/python/{python3-native_3.5.1.bb => python3-native_3.5.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.1.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-native_3.5.1.bb
rename to meta/recipes-devtools/python/python3-native_3.5.2.bb
index 81ea087..061b595 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -26,10 +26,11 @@ file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 "
-SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
-SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
+SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"  
+SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40" 
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
diff --git a/meta/recipes-devtools/python/python3/000-cross-compile.patch b/meta/recipes-devtools/python/python3/000-cross-compile.patch
index 28fe70a..2d82221 100644
--- a/meta/recipes-devtools/python/python3/000-cross-compile.patch
+++ b/meta/recipes-devtools/python/python3/000-cross-compile.patch
@@ -9,19 +9,19 @@ Upstream-Status: Inappropriate[Configuration Specific]
  Makefile.pre.in |   25 +++++++++++++------------
  1 file changed, 13 insertions(+), 12 deletions(-)
 
-Index: Python-3.5.1/Makefile.pre.in
+Index: Python-3.5.2/Makefile.pre.in
 ===================================================================
---- Python-3.5.1.orig/Makefile.pre.in
-+++ Python-3.5.1/Makefile.pre.in
+--- Python-3.5.2.orig/Makefile.pre.in
++++ Python-3.5.2/Makefile.pre.in
 @@ -220,6 +220,7 @@ LIBOBJS=	@LIBOBJS@
  
  PYTHON=		python$(EXE)
  BUILDPYTHON=	python$(BUILDEXE)
 +HOSTPYTHON=	$(BUILDPYTHON)
  
+ cross_compiling=@cross_compiling@
  PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
- _PYTHON_HOST_PLATFORM=@_PYTHON_HOST_PLATFORM@
-@@ -276,6 +277,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+@@ -279,6 +280,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
  ##########################################################################
  # Parser
  PGEN=		Parser/pgen$(EXE)
@@ -29,7 +29,7 @@ Index: Python-3.5.1/Makefile.pre.in
  
  PSRCS=		\
  		Parser/acceler.c \
-@@ -506,7 +508,7 @@ build_all_generate_profile:
+@@ -509,7 +511,7 @@ build_all_generate_profile:
  
  run_profile_task:
  	: # FIXME: can't run for a cross build
@@ -38,16 +38,16 @@ Index: Python-3.5.1/Makefile.pre.in
  
  build_all_merge_profile:
  	$(LLVM_PROF_MERGER)
-@@ -779,7 +781,7 @@ $(IO_OBJS): $(IO_H)
- 
- $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
- 		@$(MKDIR_P) Include
--		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- $(GRAMMAR_C): $(GRAMMAR_H)
- 		touch $(GRAMMAR_C)
- 
-@@ -968,7 +970,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/pyth
+@@ -792,7 +794,7 @@ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
+ 	@$(MKDIR_P) Include
+ 	# Avoid copying the file onto itself for an in-tree build
+ 	if test "$(cross_compiling)" != "yes"; then \
+-		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C); \
++		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C); \
+ 	else \
+ 		cp $(srcdir)/Include/graminit.h $(GRAMMAR_H).tmp; \
+ 		mv $(GRAMMAR_H).tmp $(GRAMMAR_H); \
+@@ -990,7 +992,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Programs/pyth
  ######################################################################
  
  TESTOPTS=	$(EXTRATESTOPTS)
@@ -56,7 +56,7 @@ Index: Python-3.5.1/Makefile.pre.in
  TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
  TESTTIMEOUT=	3600
  
-@@ -1455,7 +1457,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
+@@ -1481,7 +1483,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
  		fi; \
  	done
  	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
@@ -65,7 +65,7 @@ Index: Python-3.5.1/Makefile.pre.in
  	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
  	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
  	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
-@@ -1521,7 +1523,7 @@ config.status:	$(srcdir)/configure
+@@ -1547,7 +1549,7 @@ config.status:	$(srcdir)/configure
  
  # Run reindent on the library
  reindent:
@@ -74,7 +74,7 @@ Index: Python-3.5.1/Makefile.pre.in
  
  # Rerun configure with the same options as it was run last time,
  # provided the config.status script exists
-@@ -1656,7 +1658,7 @@ funny:
+@@ -1683,7 +1685,7 @@ funny:
  
  # Perform some verification checks on any modified files.
  patchcheck: all
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 44ec424..056e8e7 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -7,10 +7,10 @@ get the sys.lib from python itself and do not use hardcoded value of 'lib'
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
-Index: Python-3.5.0/Include/pythonrun.h
+Index: Python-3.5.2/Include/pythonrun.h
 ===================================================================
---- Python-3.5.0.orig/Include/pythonrun.h
-+++ Python-3.5.0/Include/pythonrun.h
+--- Python-3.5.2.orig/Include/pythonrun.h
++++ Python-3.5.2/Include/pythonrun.h
 @@ -23,6 +23,9 @@ typedef struct {
  } PyCompilerFlags;
  #endif
@@ -21,10 +21,10 @@ Index: Python-3.5.0/Include/pythonrun.h
  #ifndef Py_LIMITED_API
  PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
  PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags *);
-Index: Python-3.5.0/Lib/distutils/command/install.py
+Index: Python-3.5.2/Lib/distutils/command/install.py
 ===================================================================
---- Python-3.5.0.orig/Lib/distutils/command/install.py
-+++ Python-3.5.0/Lib/distutils/command/install.py
+--- Python-3.5.2.orig/Lib/distutils/command/install.py
++++ Python-3.5.2/Lib/distutils/command/install.py
 @@ -19,6 +19,8 @@ from site import USER_BASE
  from site import USER_SITE
  HAS_USER_SITE = True
@@ -43,23 +43,23 @@ Index: Python-3.5.0/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-3.5.0/Lib/pydoc.py
+Index: Python-3.5.2/Lib/pydoc.py
 ===================================================================
---- Python-3.5.0.orig/Lib/pydoc.py
-+++ Python-3.5.0/Lib/pydoc.py
-@@ -393,7 +393,7 @@ class Doc:
+--- Python-3.5.2.orig/Lib/pydoc.py
++++ Python-3.5.2/Lib/pydoc.py
+@@ -384,7 +384,7 @@ class Doc:
+     docmodule = docclass = docroutine = docother = docproperty = docdata = fail
  
-         docloc = os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
+     def getdocloc(self, object,
+-                  basedir=os.path.join(sys.base_exec_prefix, "lib",
++                  basedir=os.path.join(sys.base_exec_prefix, sys.lib,
+                                        "python%d.%d" %  sys.version_info[:2])):
+         """Return the location of module docs or None"""
  
--        basedir = os.path.join(sys.base_exec_prefix, "lib",
-+        basedir = os.path.join(sys.base_exec_prefix, sys.lib,
-                                "python%d.%d" %  sys.version_info[:2])
-         if (isinstance(object, type(os)) and
-             (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
-Index: Python-3.5.0/Lib/trace.py
+Index: Python-3.5.2/Lib/trace.py
 ===================================================================
---- Python-3.5.0.orig/Lib/trace.py
-+++ Python-3.5.0/Lib/trace.py
+--- Python-3.5.2.orig/Lib/trace.py
++++ Python-3.5.2/Lib/trace.py
 @@ -749,10 +749,10 @@ def main(argv=None):
                  # should I also call expanduser? (after all, could use $HOME)
  
@@ -73,11 +73,11 @@ Index: Python-3.5.0/Lib/trace.py
                                             "python" + sys.version[:3]))
                  s = os.path.normpath(s)
                  ignore_dirs.append(s)
-Index: Python-3.5.0/Makefile.pre.in
+Index: Python-3.5.2/Makefile.pre.in
 ===================================================================
---- Python-3.5.0.orig/Makefile.pre.in
-+++ Python-3.5.0/Makefile.pre.in
-@@ -101,6 +101,8 @@ PY_CORE_CFLAGS=	$(PY_CFLAGS) $(PY_CFLAGS
+--- Python-3.5.2.orig/Makefile.pre.in
++++ Python-3.5.2/Makefile.pre.in
+@@ -106,6 +106,8 @@ PY_CORE_CFLAGS=	$(PY_CFLAGS) $(PY_CFLAGS
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -86,7 +86,7 @@ Index: Python-3.5.0/Makefile.pre.in
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -120,7 +122,7 @@ LIBDIR=		@libdir@
+@@ -125,7 +127,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -95,7 +95,7 @@ Index: Python-3.5.0/Makefile.pre.in
  ABIFLAGS=	@ABIFLAGS@
  
  # Detailed destination directories
-@@ -729,6 +731,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -755,6 +757,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -103,7 +103,7 @@ Index: Python-3.5.0/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Programs/python.o: $(srcdir)/Programs/python.c
-@@ -798,7 +801,7 @@ $(OPCODE_H): $(srcdir)/Lib/opcode.py $(O
+@@ -835,7 +838,7 @@ $(OPCODE_H): $(srcdir)/Lib/opcode.py $(O
  Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
@@ -112,25 +112,25 @@ Index: Python-3.5.0/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-3.5.0/Modules/getpath.c
+Index: Python-3.5.2/Modules/getpath.c
 ===================================================================
---- Python-3.5.0.orig/Modules/getpath.c
-+++ Python-3.5.0/Modules/getpath.c
-@@ -117,9 +117,11 @@
- #define EXEC_PREFIX PREFIX
+--- Python-3.5.2.orig/Modules/getpath.c
++++ Python-3.5.2/Modules/getpath.c
+@@ -105,6 +105,13 @@
+ #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
  
 +#define LIB_PYTHON LIB "/python" VERSION
 +
- #ifndef PYTHONPATH
--#define PYTHONPATH PREFIX "/lib/python" VERSION ":" \
--              EXEC_PREFIX "/lib/python" VERSION "/lib-dynload"
++#ifndef PYTHONPATH
 +#define PYTHONPATH PREFIX "/" LIB_PYTHON ":" \
-+              EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
- #endif
- 
++        EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
++#endif
++
  #ifndef LANDMARK
-@@ -130,6 +132,7 @@ static wchar_t prefix[MAXPATHLEN+1];
+ #define LANDMARK L"os.py"
+ #endif
+@@ -113,6 +120,7 @@ static wchar_t prefix[MAXPATHLEN+1];
  static wchar_t exec_prefix[MAXPATHLEN+1];
  static wchar_t progpath[MAXPATHLEN+1];
  static wchar_t *module_search_path = NULL;
@@ -138,10 +138,10 @@ Index: Python-3.5.0/Modules/getpath.c
  
  /* Get file status. Encode the path to the locale encoding. */
  
-Index: Python-3.5.0/Python/getplatform.c
+Index: Python-3.5.2/Python/getplatform.c
 ===================================================================
---- Python-3.5.0.orig/Python/getplatform.c
-+++ Python-3.5.0/Python/getplatform.c
+--- Python-3.5.2.orig/Python/getplatform.c
++++ Python-3.5.2/Python/getplatform.c
 @@ -10,3 +10,23 @@ Py_GetPlatform(void)
  {
  	return PLATFORM;
@@ -166,11 +166,11 @@ Index: Python-3.5.0/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-3.5.0/Python/sysmodule.c
+Index: Python-3.5.2/Python/sysmodule.c
 ===================================================================
---- Python-3.5.0.orig/Python/sysmodule.c
-+++ Python-3.5.0/Python/sysmodule.c
-@@ -1767,6 +1767,10 @@ _PySys_Init(void)
+--- Python-3.5.2.orig/Python/sysmodule.c
++++ Python-3.5.2/Python/sysmodule.c
+@@ -1790,6 +1790,10 @@ _PySys_Init(void)
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyUnicode_FromString(Py_GetPlatform()));
@@ -181,11 +181,11 @@ Index: Python-3.5.0/Python/sysmodule.c
      SET_SYS_FROM_STRING("executable",
                          PyUnicode_FromWideChar(
                                 Py_GetProgramFullPath(), -1));
-Index: Python-3.5.0/setup.py
+Index: Python-3.5.2/setup.py
 ===================================================================
---- Python-3.5.0.orig/setup.py
-+++ Python-3.5.0/setup.py
-@@ -472,7 +472,7 @@ class PyBuildExt(build_ext):
+--- Python-3.5.2.orig/setup.py
++++ Python-3.5.2/setup.py
+@@ -492,7 +492,7 @@ class PyBuildExt(build_ext):
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -194,7 +194,7 @@ Index: Python-3.5.0/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -530,8 +530,7 @@ class PyBuildExt(build_ext):
+@@ -550,8 +550,7 @@ class PyBuildExt(build_ext):
          # be assumed that no additional -I,-L directives are needed.
          if not cross_compiling:
              lib_dirs = self.compiler.library_dirs + [
@@ -204,7 +204,7 @@ Index: Python-3.5.0/setup.py
                  ]
              inc_dirs = self.compiler.include_dirs + ['/usr/include']
          else:
-@@ -716,11 +715,11 @@ class PyBuildExt(build_ext):
+@@ -743,11 +742,11 @@ class PyBuildExt(build_ext):
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -218,10 +218,10 @@ Index: Python-3.5.0/setup.py
                                     extra_link_args=readline_extra_link_args,
                                     libraries=readline_libs) )
          else:
-Index: Python-3.5.0/Lib/sysconfig.py
+Index: Python-3.5.2/Lib/sysconfig.py
 ===================================================================
---- Python-3.5.0.orig/Lib/sysconfig.py
-+++ Python-3.5.0/Lib/sysconfig.py
+--- Python-3.5.2.orig/Lib/sysconfig.py
++++ Python-3.5.2/Lib/sysconfig.py
 @@ -20,10 +20,10 @@ __all__ = [
  
  _INSTALL_SCHEMES = {
@@ -264,11 +264,11 @@ Index: Python-3.5.0/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data': '{userbase}',
-Index: Python-3.5.0/configure.ac
+Index: Python-3.5.2/configure.ac
 ===================================================================
---- Python-3.5.0.orig/configure.ac
-+++ Python-3.5.0/configure.ac
-@@ -858,6 +858,41 @@ PLATDIR=plat-$MACHDEP
+--- Python-3.5.2.orig/configure.ac
++++ Python-3.5.2/configure.ac
+@@ -876,6 +876,41 @@ PLATDIR=plat-$MACHDEP
  AC_SUBST(PLATDIR)
  AC_SUBST(PLATFORM_TRIPLET)
  
-- 
2.6.6


