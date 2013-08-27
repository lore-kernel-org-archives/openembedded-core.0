Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id E3B2F6BB9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:09 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so5117172pab.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6Ebu24t1Zgun5oNL1kxbHw8Yjq0MXm9HK2hobNVwLL0=;
	b=Sy0rVeQOBcF/G+E7/q6iT6/7pfjCk31se/V1bkRly2mijFsNb2k15maqV1KkCCszTQ
	WD88TcwuGffvhs0OAiqxG8j+0ql8dpUdrYKPverEUz3kMlGKyc4XmxaTIlRE5XYmOwMH
	naGMm5CoQsuTCnv6cmeeQyU5/2+DTQzSETkW+va+ZLMvhUvsFIerL9FHhSuIsL32w3s3
	/G/IHdlzLQk23/fJvBHQaNpfPbnde0chT5WE6c553C1YpwkE+8zzOCYTSG35uSbN1n75
	umNiDrnSsYsQyEESjYQXyKlqKRakM2FSTCbfLtv7oBDP/hFbti7bGb0W55Lr3+gJrYI3
	Mjbw==
X-Received: by 10.68.202.169 with SMTP id kj9mr1199869pbc.140.1377623770888;
	Tue, 27 Aug 2013 10:16:10 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:08 -0700
Message-Id: <2ed37159f4db57f0ae1896da84c79086aa9f4bf3.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 09/20] python3: Add recipes
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3/000-cross-compile.patch         |  76 +++++
 .../python3/020-dont-compile-python-files.patch    |  31 ++
 .../python/python3/03-fix-tkinter-detection.patch  |  42 +++
 .../python/python3/030-fixup-include-dirs.patch    |  36 +++
 .../python/python3/04-default-is-optimized.patch   |  58 ++++
 .../python3/06-ctypes-libffi-fix-configure.patch   |  44 +++
 .../python3/070-dont-clean-ipkg-install.patch      |  30 ++
 .../python3/080-distutils-dont_adjust_files.patch  |  86 +++++
 .../python/python3/110-enable-zlib.patch           |  15 +
 .../python/python3/130-readline-setup.patch        |  49 +++
 .../python/python3/140-verbose-sharedmods.patch    |  10 +
 .../python/python3/150-fix-setupterm.patch         |  11 +
 .../python3/avoid_warning_about_tkinter.patch      |  25 ++
 meta/recipes-devtools/python/python3/cgi_py.patch  |  23 ++
 .../python3/fix_for_using_different_libdir.patch   |  54 ++++
 .../python/python3/h2py-pr13032.patch              | 185 +++++++++++
 .../python3/host_include_contamination.patch       |  28 ++
 .../python/python3/python-3.3-multilib.patch       | 348 +++++++++++++++++++++
 .../python/python3/remove_sqlite_rpath.patch       |  19 ++
 .../python/python3/setuptweaks.patch               |  57 ++++
 .../python/python3/shutil-follow-symlink-fix.patch |  11 +
 .../python/python3/sitecustomize.py                |  37 +++
 .../sys_platform_is_now_always_linux2.patch        |  29 ++
 meta/recipes-devtools/python/python3_3.3.0.bb      | 203 ++++++++++++
 24 files changed, 1507 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/000-cross-compile.patch
 create mode 100644 meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
 create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
 create mode 100644 meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
 create mode 100644 meta/recipes-devtools/python/python3/04-default-is-optimized.patch
 create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
 create mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
 create mode 100644 meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
 create mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.patch
 create mode 100644 meta/recipes-devtools/python/python3/130-readline-setup.patch
 create mode 100644 meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch
 create mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
 create mode 100644 meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
 create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
 create mode 100644 meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
 create mode 100644 meta/recipes-devtools/python/python3/h2py-pr13032.patch
 create mode 100644 meta/recipes-devtools/python/python3/host_include_contamination.patch
 create mode 100644 meta/recipes-devtools/python/python3/python-3.3-multilib.patch
 create mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
 create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.patch
 create mode 100644 meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
 create mode 100644 meta/recipes-devtools/python/python3/sitecustomize.py
 create mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
 create mode 100644 meta/recipes-devtools/python/python3_3.3.0.bb

diff --git a/meta/recipes-devtools/python/python3/000-cross-compile.patch b/meta/recipes-devtools/python/python3/000-cross-compile.patch
new file mode 100644
index 0000000..23c1755
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/000-cross-compile.patch
@@ -0,0 +1,76 @@
+---
+ Makefile.pre.in |   25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
+
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -193,6 +193,7 @@ LIBOBJS=	@LIBOBJS@
+ 
+ PYTHON=		python$(EXE)
+ BUILDPYTHON=	python$(BUILDEXE)
++HOSTPYTHON=	$(BUILDPYTHON)
+ 
+ PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
+ _PYTHON_HOST_PLATFORM=@_PYTHON_HOST_PLATFORM@
+@@ -239,6 +240,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+ ##########################################################################
+ # Parser
+ PGEN=		Parser/pgen$(EXE)
++HOSTPGEN=	$(PGEN)$(EXE)
+ 
+ PSRCS=		\
+ 		Parser/acceler.c \
+@@ -451,7 +453,7 @@ build_all_generate_profile:
+ 
+ run_profile_task:
+ 	: # FIXME: can't run for a cross build
+-	$(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK)
++	$(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK)
+ 
+ build_all_use_profile:
+ 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-use -fprofile-correction"
+@@ -640,7 +642,7 @@ $(IO_OBJS): $(IO_H)
+ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
+ 		@$(MKDIR_P) Include
+ 		$(MAKE) $(PGEN)
+-		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ $(GRAMMAR_C): $(GRAMMAR_H) $(GRAMMAR_INPUT) $(PGENSRCS)
+ 		$(MAKE) $(GRAMMAR_H)
+ 		touch $(GRAMMAR_C)
+@@ -820,7 +822,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Modules/pytho
+ ######################################################################
+ 
+ TESTOPTS=	$(EXTRATESTOPTS)
+-TESTPYTHON=	$(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
++TESTPYTHON=	$(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
+ TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
+ TESTTIMEOUT=	3600
+ 
+@@ -1229,7 +1231,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
+ 		fi; \
+ 	done
+ 	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
+-	sed 's/%VERSION%/'"`$(RUNSHARED) ./$(BUILDPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
++	sed 's/%VERSION%/'"`$(RUNSHARED) $(HOSTPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
+ 	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
+ 	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
+ 	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
+@@ -1288,7 +1290,7 @@ config.status:	$(srcdir)/configure
+ 
+ # Run reindent on the library
+ reindent:
+-	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
++	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
+ 
+ # Rerun configure with the same options as it was run last time,
+ # provided the config.status script exists
+@@ -1414,7 +1416,7 @@ funny:
+ 
+ # Perform some verification checks on any modified files.
+ patchcheck:
+-	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
++	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
+ 
+ # Dependencies
+ 
diff --git a/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch b/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
new file mode 100644
index 0000000..07a906e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
@@ -0,0 +1,31 @@
+---
+ Makefile.pre.in |   16 ----------------
+ 1 file changed, 16 deletions(-)
+
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1078,24 +1078,6 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
+ 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
+ 	fi
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
diff --git a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
new file mode 100644
index 0000000..fddfd2b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+# We need to supply STAGING_INCDIR here, otherwise the Tk headers
+# will not be found.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+
+Index: Python-3.3.0rc2/setup.py
+===================================================================
+--- Python-3.3.0rc2.orig/setup.py	2012-09-20 15:24:14.009124003 -0700
++++ Python-3.3.0rc2/setup.py	2012-09-20 15:25:08.449124963 -0700
+@@ -1620,7 +1620,7 @@
+                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
+             tcl_include_sub = []
+             tk_include_sub = []
+-            for dir in inc_dirs:
++            for dir in [os.getenv("STAGING_INCDIR")]:
+                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
+                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
+             tk_include_sub += tcl_include_sub
+@@ -1639,22 +1639,6 @@
+             if dir not in include_dirs:
+                 include_dirs.append(dir)
+ 
+-        # Check for various platform-specific directories
+-        if host_platform == 'sunos5':
+-            include_dirs.append('/usr/openwin/include')
+-            added_lib_dirs.append('/usr/openwin/lib')
+-        elif os.path.exists('/usr/X11R6/include'):
+-            include_dirs.append('/usr/X11R6/include')
+-            added_lib_dirs.append('/usr/X11R6/lib64')
+-            added_lib_dirs.append('/usr/X11R6/lib')
+-        elif os.path.exists('/usr/X11R5/include'):
+-            include_dirs.append('/usr/X11R5/include')
+-            added_lib_dirs.append('/usr/X11R5/lib')
+-        else:
+-            # Assume default location for X11
+-            include_dirs.append('/usr/X11/include')
+-            added_lib_dirs.append('/usr/X11/lib')
+-
+         # If Cygwin, then verify that X is installed before proceeding
+         if host_platform == 'cygwin':
+             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
new file mode 100644
index 0000000..4882118
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
@@ -0,0 +1,36 @@
+---
+ setup.py |   15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+
+--- a/setup.py
++++ b/setup.py
+@@ -464,7 +464,8 @@ class PyBuildExt(build_ext):
+         # only change this for cross builds for 3.3, issues on Mageia
+         if cross_compiling:
+             self.add_gcc_paths()
+-        self.add_multiarch_paths()
++        if not cross_compiling:
++            self.add_multiarch_paths()
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -500,7 +501,7 @@ class PyBuildExt(build_ext):
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.base_prefix) != '/usr' \
++        if not cross_compiling and os.path.normpath(sys.base_prefix) != '/usr' \
+                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
+             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
+             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
+@@ -520,6 +521,10 @@ class PyBuildExt(build_ext):
+                 '/lib', '/usr/lib',
+                 ]
+             inc_dirs = self.compiler.include_dirs + ['/usr/include']
++        if cross_compiling:
++            lib_dirs = self.compiler.library_dirs
++            inc_dirs = self.compiler.include_dirs
++
+         exts = []
+         missing = []
+ 
diff --git a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
new file mode 100644
index 0000000..d5afd40
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Updated original patch for python 2.7.3
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/01
+
+
+# when compiling for an embedded system, we need every bit of
+# performance we can get. default to optimized with the option
+# of opt-out.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-3.2.3/Python/compile.c
+===================================================================
+--- Python-3.2.3.orig/Python/compile.c	2012-04-10 23:54:08.000000000 -0700
++++ Python-3.2.3/Python/compile.c	2012-09-19 15:58:46.649123998 -0700
+@@ -30,7 +30,7 @@
+ #include "symtable.h"
+ #include "opcode.h"
+ 
+-int Py_OptimizeFlag = 0;
++int Py_OptimizeFlag = 1;
+ 
+ #define DEFAULT_BLOCK_SIZE 16
+ #define DEFAULT_BLOCKS 8
+Index: Python-3.2.3/Modules/main.c
+===================================================================
+--- Python-3.2.3.orig/Modules/main.c	2012-04-10 23:54:07.000000000 -0700
++++ Python-3.2.3/Modules/main.c	2012-09-19 16:00:32.153124053 -0700
+@@ -46,7 +46,7 @@
+ static int  orig_argc;
+ 
+ /* command line options */
+-#define BASE_OPTS L"bBc:dEhiJm:OqRsStuvVW:xX:?"
++#define BASE_OPTS L"bBc:dEhiJm:NOqRsStuvVW:xX:?"
+ 
+ #define PROGRAM_OPTS BASE_OPTS
+ 
+@@ -71,6 +71,7 @@
+ -m mod : run library module as a script (terminates option list)\n\
+ -O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
+ -OO    : remove doc-strings in addition to the -O optimizations\n\
++-N     : do NOT optimize generated bytecode\n\
+ -q     : don't print version and copyright messages on interactive startup\n\
+ -R     : use a pseudo-random salt to make hash() values of various types be\n\
+          unpredictable between separate invocations of the interpreter, as\n\
+@@ -407,8 +408,8 @@
+ 
+         /* case 'J': reserved for Jython */
+ 
+-        case 'O':
+-            Py_OptimizeFlag++;
++        case 'N':
++            Py_OptimizeFlag=0;
+             break;
+ 
+         case 'B':
diff --git a/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch b/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
new file mode 100644
index 0000000..abd63d2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
@@ -0,0 +1,44 @@
+This fixes configure issues with recent autoconf, e.g:
+  autoreconf: Entering directory `Modules/_ctypes/libffi'
+  autoreconf: configure.ac: not using Gettext
+  autoreconf: running: aclocal --force
+  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
+  configure.ac:26: the top level
+
+The problem is still present in python-2.6.5 but fixed in python-svn.
+
+Upstream-Status: Accepted [python-svn]
+
+Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
+Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+
+2011/09/29
+Rebased for python 2.7.2
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+
+Index: Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
+===================================================================
+--- Python-2.7.2.orig/Modules/_ctypes/libffi/Makefile.am
++++ Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
+@@ -2,7 +2,7 @@
+ 
+ AUTOMAKE_OPTIONS = foreign subdir-objects
+ 
+-SUBDIRS = include testsuite man
++SUBDIRS = include
+ 
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
+ 	src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
+@@ -34,8 +34,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
+ 	libtool-version ChangeLog.libffi m4/libtool.m4 \
+ 	m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
+ 
+-info_TEXINFOS = doc/libffi.texi
+-
+ ## ################################################################
+ 
+ ##
diff --git a/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
new file mode 100644
index 0000000..2ac85d9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
@@ -0,0 +1,30 @@
+---
+ Makefile.pre.in |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1306,8 +1306,8 @@ touch:
+ # Sanitation targets -- clean leaves libraries, executables and tags
+ # files, which clobber removes as well
+ pycremoval:
+-	-find $(srcdir) -depth -name '__pycache__' -exec rm -rf {} ';'
+-	-find $(srcdir) -name '*.py[co]' -exec rm -f {} ';'
++	-find $(srcdir) ! -path './ipkg-install/*' -depth -name '__pycache__' -exec rm -rf {} ';'
++	-find $(srcdir) ! -path './ipkg-install/*' -name '*.py[co]' -exec rm -f {} ';'
+ 
+ rmtestturds:
+ 	-rm -f *BAD *GOOD *SKIPPED
+@@ -1321,9 +1321,9 @@ docclean:
+ 	-rm -rf Doc/tools/sphinx Doc/tools/pygments Doc/tools/docutils
+ 
+ clean: pycremoval
+-	find . -name '*.[oa]' -exec rm -f {} ';'
+-	find . -name '*.s[ol]' -exec rm -f {} ';'
+-	find . -name '*.so.[0-9]*.[0-9]*' -exec rm -f {} ';'
++	find . ! -path './ipkg-install/*' -name '*.[oa]' -exec rm -f {} ';'
++	find . ! -path './ipkg-install/*' -name '*.s[ol]' -exec rm -f {} ';'
++	find . ! -path './ipkg-install/*' -name '*.so.[0-9]*.[0-9]*' -exec rm -f {} ';'
+ 	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
+ 	find build -name 'fficonfig.py' -exec rm -f {} ';' || true
+ 	-rm -f Lib/lib2to3/*Grammar*.pickle
diff --git a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
new file mode 100644
index 0000000..ac5450b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
@@ -0,0 +1,86 @@
+---
+ Lib/distutils/command/build_scripts.py |   43 +++------------------------------
+ 1 file changed, 4 insertions(+), 39 deletions(-)
+
+--- a/Lib/distutils/command/build_scripts.py
++++ b/Lib/distutils/command/build_scripts.py
+@@ -51,10 +51,7 @@ class build_scripts(Command):
+ 
+ 
+     def copy_scripts(self):
+-        """Copy each script listed in 'self.scripts'; if it's marked as a
+-        Python script in the Unix way (first line matches 'first_line_re',
+-        ie. starts with "\#!" and contains "python"), then adjust the first
+-        line to refer to the current Python interpreter as we copy.
++        """Copy each script listed in 'self.scripts'
+         """
+         self.mkpath(self.build_dir)
+         outfiles = []
+@@ -78,64 +75,10 @@ class build_scripts(Command):
+                 if not self.dry_run:
+                     raise
+                 f = None
+-            else:
+-                encoding, lines = tokenize.detect_encoding(f.readline)
+-                f.seek(0)
+-                first_line = f.readline()
+-                if not first_line:
+-                    self.warn("%s is an empty file (skipping)" % script)
+-                    continue
+-
+-                match = first_line_re.match(first_line)
+-                if match:
+-                    adjust = True
+-                    post_interp = match.group(1) or b''
+-
+-            if adjust:
+-                log.info("copying and adjusting %s -> %s", script,
+-                         self.build_dir)
+-                updated_files.append(outfile)
+-                if not self.dry_run:
+-                    if not sysconfig.python_build:
+-                        executable = self.executable
+-                    else:
+-                        executable = os.path.join(
+-                            sysconfig.get_config_var("BINDIR"),
+-                           "python%s%s" % (sysconfig.get_config_var("VERSION"),
+-                                           sysconfig.get_config_var("EXE")))
+-                    executable = os.fsencode(executable)
+-                    shebang = b"#!" + executable + post_interp + b"\n"
+-                    # Python parser starts to read a script using UTF-8 until
+-                    # it gets a #coding:xxx cookie. The shebang has to be the
+-                    # first line of a file, the #coding:xxx cookie cannot be
+-                    # written before. So the shebang has to be decodable from
+-                    # UTF-8.
+-                    try:
+-                        shebang.decode('utf-8')
+-                    except UnicodeDecodeError:
+-                        raise ValueError(
+-                            "The shebang ({!r}) is not decodable "
+-                            "from utf-8".format(shebang))
+-                    # If the script is encoded to a custom encoding (use a
+-                    # #coding:xxx cookie), the shebang has to be decodable from
+-                    # the script encoding too.
+-                    try:
+-                        shebang.decode(encoding)
+-                    except UnicodeDecodeError:
+-                        raise ValueError(
+-                            "The shebang ({!r}) is not decodable "
+-                            "from the script encoding ({})"
+-                            .format(shebang, encoding))
+-                    with open(outfile, "wb") as outf:
+-                        outf.write(shebang)
+-                        outf.writelines(f.readlines())
+-                if f:
+-                    f.close()
+-            else:
+-                if f:
++            if f:
+                     f.close()
+-                updated_files.append(outfile)
+-                self.copy_file(script, outfile)
++            updated_files.append(outfile)
++            self.copy_file(script, outfile)
+ 
+         if os.name == 'posix':
+             for file in outfiles:
diff --git a/meta/recipes-devtools/python/python3/110-enable-zlib.patch b/meta/recipes-devtools/python/python3/110-enable-zlib.patch
new file mode 100644
index 0000000..90c364e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/110-enable-zlib.patch
@@ -0,0 +1,15 @@
+---
+ Modules/Setup.dist |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/Modules/Setup.dist
++++ b/Modules/Setup.dist
+@@ -354,7 +354,7 @@ _symtable symtablemodule.c
+ # Andrew Kuchling's zlib module.
+ # This require zlib 1.1.3 (or later).
+ # See http://www.gzip.org/zlib/
+-#zlib zlibmodule.c -I$(prefix)/include -L$(exec_prefix)/lib -lz
++zlib zlibmodule.c -lz
+ 
+ # Interface to the Expat XML parser
+ #
diff --git a/meta/recipes-devtools/python/python3/130-readline-setup.patch b/meta/recipes-devtools/python/python3/130-readline-setup.patch
new file mode 100644
index 0000000..3d28a19
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/130-readline-setup.patch
@@ -0,0 +1,49 @@
+--- a/setup.py
++++ b/setup.py
+@@ -666,45 +666,7 @@ class PyBuildExt(build_ext):
+         # readline
+         do_readline = self.compiler.find_library_file(lib_dirs, 'readline')
+         readline_termcap_library = ""
+-        curses_library = ""
+-        # Cannot use os.popen here in py3k.
+-        tmpfile = os.path.join(self.build_temp, 'readline_termcap_lib')
+-        if not os.path.exists(self.build_temp):
+-            os.makedirs(self.build_temp)
+-        # Determine if readline is already linked against curses or tinfo.
+-        if do_readline:
+-            if cross_compiling:
+-                ret = os.system("%s -d %s | grep '(NEEDED)' > %s" \
+-                                % (sysconfig.get_config_var('READELF'),
+-                                   do_readline, tmpfile))
+-            elif find_executable('ldd'):
+-                ret = os.system("ldd %s > %s" % (do_readline, tmpfile))
+-            else:
+-                ret = 256
+-            if ret >> 8 == 0:
+-                with open(tmpfile) as fp:
+-                    for ln in fp:
+-                        if 'curses' in ln:
+-                            readline_termcap_library = re.sub(
+-                                r'.*lib(n?cursesw?)\.so.*', r'\1', ln
+-                            ).rstrip()
+-                            break
+-                        # termcap interface split out from ncurses
+-                        if 'tinfo' in ln:
+-                            readline_termcap_library = 'tinfo'
+-                            break
+-            if os.path.exists(tmpfile):
+-                os.unlink(tmpfile)
+-        # Issue 7384: If readline is already linked against curses,
+-        # use the same library for the readline and curses modules.
+-        if 'curses' in readline_termcap_library:
+-            curses_library = readline_termcap_library
+-        elif self.compiler.find_library_file(lib_dirs, 'ncursesw'):
+-            curses_library = 'ncursesw'
+-        elif self.compiler.find_library_file(lib_dirs, 'ncurses'):
+-            curses_library = 'ncurses'
+-        elif self.compiler.find_library_file(lib_dirs, 'curses'):
+-            curses_library = 'curses'
++        curses_library = "ncurses"
+ 
+         if host_platform == 'darwin':
+             os_release = int(os.uname()[2].split('.')[0])
diff --git a/meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch b/meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch
new file mode 100644
index 0000000..db3f124
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/140-verbose-sharedmods.patch
@@ -0,0 +1,10 @@
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -477,7 +477,6 @@ $(SYSCONFIGDATA): $(BUILDPYTHON)
+ 
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON) $(SYSCONFIGDATA)
+-	case $$MAKEFLAGS in *s*) quiet=-q; esac; \
+ 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
+ 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
+ 
diff --git a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
new file mode 100644
index 0000000..db53482
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
@@ -0,0 +1,11 @@
+--- a/Modules/_cursesmodule.c
++++ b/Modules/_cursesmodule.c
+@@ -116,7 +116,7 @@ char *PyCursesVersion = "2.2";
+     #defines many common symbols (such as "lines") which breaks the
+     curses module in other ways.  So the code will just specify
+     explicit prototypes here. */
+-extern int setupterm(char *,int,int *);
++//extern int setupterm(char *,int,int *);
+ #ifdef __sgi
+ #include <term.h>
+ #endif
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
new file mode 100644
index 0000000..208c57c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
@@ -0,0 +1,25 @@
+_tkinter module needs tk module along with tcl. tk is not yet integrated
+in yocto so we skip the check for this module.
+Avoid a warning by not adding this module to missing variable.
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-05 23:18:38.500136647 +0300
++++ Python-2.7.2/setup.py	2012-04-05 23:19:35.888134969 +0300
+@@ -1634,8 +1634,10 @@
+         # Call the method for detecting whether _tkinter can be compiled
+         self.detect_tkinter(inc_dirs, lib_dirs)
+ 
+-        if '_tkinter' not in [e.name for e in self.extensions]:
+-            missing.append('_tkinter')
++        # tkinter module will not be avalaible as yocto
++        # doesn't have tk integrated (yet)
++        #if '_tkinter' not in [e.name for e in self.extensions]:
++        #    missing.append('_tkinter')
+ 
+         return missing
+ 
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
new file mode 100644
index 0000000..de504f9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch
@@ -0,0 +1,23 @@
+Lib/cgi.py: Update the script as mentioned in the comment
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- Python-2.6.6/Lib/cgi.py.orig	2010-08-01 22:14:27.000000000 -0500
++++ Python-2.6.6/Lib/cgi.py	2011-09-21 15:28:40.478208631 -0500
+@@ -1,13 +1,4 @@
+-#! /usr/local/bin/python
+-
+-# NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
+-# intentionally NOT "/usr/bin/env python".  On many systems
+-# (e.g. Solaris), /usr/local/bin is not in $PATH as passed to CGI
+-# scripts, and /usr/local/bin is the default directory where Python is
+-# installed, so /usr/bin/env would be unable to find python.  Granted,
+-# binary installations by Linux vendors often install Python in
+-# /usr/bin.  So let those vendors patch cgi.py to match their choice
+-# of installation.
++#! /usr/bin/env python
+ 
+ """Support module for CGI (Common Gateway Interface) scripts.
+ 
diff --git a/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
new file mode 100644
index 0000000..cd1a978
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Inappropriate [Embedded specific]
+
+This patch fixes issuing with different libdir like lib64.
+This patch makes the native python binary modules findable
+in the install process of the host python.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2012/03/14
+
+Updated for python 2.7.3
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2012/05/01
+
+Index: Python-3.3.0rc2/Lib/sysconfig.py
+===================================================================
+--- Python-3.3.0rc2.orig/Lib/sysconfig.py	2012-09-20 22:50:11.000000000 -0700
++++ Python-3.3.0rc2/Lib/sysconfig.py	2012-09-20 22:53:01.561123396 -0700
+@@ -21,9 +21,9 @@
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
++        'stdlib': '{base}/'+sys.lib+'/python{py_version_short}',
+         'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
+-        'purelib': '{base}/lib/python{py_version_short}/site-packages',
++        'purelib': '{base}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+@@ -83,7 +83,7 @@
+     'posix_user': {
+         'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+         'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+-        'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
++        'purelib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{userbase}/include/python{py_version_short}',
+         'scripts': '{userbase}/bin',
+Index: Python-3.3.0rc2/Makefile.pre.in
+===================================================================
+--- Python-3.3.0rc2.orig/Makefile.pre.in	2012-09-20 22:50:11.000000000 -0700
++++ Python-3.3.0rc2/Makefile.pre.in	2012-09-20 22:50:54.245123997 -0700
+@@ -1080,9 +1080,9 @@
+ 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
+ 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
+ 	fi
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
diff --git a/meta/recipes-devtools/python/python3/h2py-pr13032.patch b/meta/recipes-devtools/python/python3/h2py-pr13032.patch
new file mode 100644
index 0000000..39b845b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/h2py-pr13032.patch
@@ -0,0 +1,185 @@
+This is backport of upstream bug
+
+http://bugs.python.org/issue13032
+
+Fixes issues like below
+
+|   File "/work/yocto/poky/build/tmp/work/x86_64-poky-linux/python3-3.3.0-r0.0/Python-3.3.0rc2/Tools/scripts/h2py.py", line 167, in <module>
+|     main()
+|   File "/work/yocto/poky/build/tmp/work/x86_64-poky-linux/python3-3.3.0-r0.0/Python-3.3.0rc2/Tools/scripts/h2py.py", line 81, in main
+|     process(fp, outfp)
+|   File "/work/yocto/poky/build/tmp/work/x86_64-poky-linux/python3-3.3.0-r0.0/Python-3.3.0rc2/Tools/scripts/h2py.py", line 108, in process
+|     line = fp.readline()
+|   File "/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib/python3.3/encodings/ascii.py", line 26, in decode
+|     return codecs.ascii_decode(input, self.errors)[0]
+| UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 175: ordinal not in range(128)
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/Tools/scripts/h2py.py
++++ b/Tools/scripts/h2py.py
+@@ -23,55 +23,56 @@
+ 
+ import sys, re, getopt, os
+ 
+-p_define = re.compile('^[\t ]*#[\t ]*define[\t ]+([a-zA-Z0-9_]+)[\t ]+')
++p_define = re.compile(b'^[\t ]*#[\t ]*define[\t ]+([a-zA-Z0-9_]+)[\t ]+')
+ 
+ p_macro = re.compile(
+-  '^[\t ]*#[\t ]*define[\t ]+'
+-  '([a-zA-Z0-9_]+)\(([_a-zA-Z][_a-zA-Z0-9]*)\)[\t ]+')
++  b'^[\t ]*#[\t ]*define[\t ]+'
++  b'([a-zA-Z0-9_]+)\(([_a-zA-Z][_a-zA-Z0-9]*)\)[\t ]+')
+ 
+-p_include = re.compile('^[\t ]*#[\t ]*include[\t ]+<([a-zA-Z0-9_/\.]+)')
++p_include = re.compile(b'^[\t ]*#[\t ]*include[\t ]+<([a-zA-Z0-9_/\.]+)')
+ 
+-p_comment = re.compile(r'/\*([^*]+|\*+[^/])*(\*+/)?')
+-p_cpp_comment = re.compile('//.*')
++p_comment = re.compile(br'/\*([^*]+|\*+[^/])*(\*+/)?')
++p_cpp_comment = re.compile(b'//.*')
+ 
+ ignores = [p_comment, p_cpp_comment]
+ 
+-p_char = re.compile(r"'(\\.[^\\]*|[^\\])'")
++p_char = re.compile(br"'(\\.[^\\]*|[^\\])'")
+ 
+-p_hex = re.compile(r"0x([0-9a-fA-F]+)L?")
++p_hex = re.compile(br"0x([0-9a-fA-F]+)L?")
+ 
+ filedict = {}
+ importable = {}
+ 
+ try:
+-    searchdirs=os.environ['include'].split(';')
++    searchdirs=os.environb[b'include'].split(b';')
+ except KeyError:
+     try:
+-        searchdirs=os.environ['INCLUDE'].split(';')
++        searchdirs=os.environb[b'INCLUDE'].split(b';')
+     except KeyError:
+-        searchdirs=['/usr/include']
++        searchdirs=[b'/usr/include']
+ 
+ def main():
+     global filedict
+     opts, args = getopt.getopt(sys.argv[1:], 'i:')
+     for o, a in opts:
+         if o == '-i':
+-            ignores.append(re.compile(a))
++            ignores.append(re.compile(a.encode()))
+     if not args:
+         args = ['-']
+     for filename in args:
+         if filename == '-':
+             sys.stdout.write('# Generated by h2py from stdin\n')
+-            process(sys.stdin, sys.stdout)
++            process(sys.stdin.buffer, sys.stdout.buffer)
+         else:
+-            fp = open(filename, 'r')
++            filename = filename.encode()
++            fp = open(filename, 'rb')
+             outfile = os.path.basename(filename)
+-            i = outfile.rfind('.')
++            i = outfile.rfind(b'.')
+             if i > 0: outfile = outfile[:i]
+             modname = outfile.upper()
+-            outfile = modname + '.py'
+-            outfp = open(outfile, 'w')
+-            outfp.write('# Generated by h2py from %s\n' % filename)
++            outfile = modname + b'.py'
++            outfp = open(outfile, 'wb')
++            outfp.write(b'# Generated by h2py from ' + filename + b'\n')
+             filedict = {}
+             for dir in searchdirs:
+                 if filename[:len(dir)] == dir:
+@@ -85,9 +86,9 @@
+ def pytify(body):
+     # replace ignored patterns by spaces
+     for p in ignores:
+-        body = p.sub(' ', body)
++        body = p.sub(b' ', body)
+     # replace char literals by ord(...)
+-    body = p_char.sub("ord('\\1')", body)
++    body = p_char.sub(b"ord('\\1')", body)
+     # Compute negative hexadecimal constants
+     start = 0
+     UMAX = 2*(sys.maxsize+1)
+@@ -98,7 +99,7 @@
+         val = int(body[slice(*m.span(1))], 16)
+         if val > sys.maxsize:
+             val -= UMAX
+-            body = body[:s] + "(" + str(val) + ")" + body[e:]
++            body = body[:s] + b"(" + str(val).encode() + b")" + body[e:]
+         start = s + 1
+     return body
+ 
+@@ -111,7 +112,7 @@
+         match = p_define.match(line)
+         if match:
+             # gobble up continuation lines
+-            while line[-2:] == '\\\n':
++            while line[-2:] == b'\\\n':
+                 nextline = fp.readline()
+                 if not nextline: break
+                 lineno = lineno + 1
+@@ -120,11 +121,11 @@
+             body = line[match.end():]
+             body = pytify(body)
+             ok = 0
+-            stmt = '%s = %s\n' % (name, body.strip())
++            stmt = name + b' = ' + body.strip() + b'\n'
+             try:
+                 exec(stmt, env)
+             except:
+-                sys.stderr.write('Skipping: %s' % stmt)
++                sys.stderr.buffer.write(b'Skipping: ' + stmt)
+             else:
+                 outfp.write(stmt)
+         match = p_macro.match(line)
+@@ -132,11 +133,11 @@
+             macro, arg = match.group(1, 2)
+             body = line[match.end():]
+             body = pytify(body)
+-            stmt = 'def %s(%s): return %s\n' % (macro, arg, body)
++            stmt = b'def ' + macro + b'(' + arg + b'): return ' + body + b'\n'
+             try:
+                 exec(stmt, env)
+             except:
+-                sys.stderr.write('Skipping: %s' % stmt)
++                sys.stderr.buffer.write(b'Skipping: ' + stmt)
+             else:
+                 outfp.write(stmt)
+         match = p_include.match(line)
+@@ -145,23 +146,24 @@
+             a, b = regs[1]
+             filename = line[a:b]
+             if filename in importable:
+-                outfp.write('from %s import *\n' % importable[filename])
++                outfp.write(b'from ' + importable[filename] + b' import *\n')
+             elif filename not in filedict:
+                 filedict[filename] = None
+                 inclfp = None
+                 for dir in searchdirs:
+                     try:
+-                        inclfp = open(dir + '/' + filename)
++                        inclfp = open(dir + b'/' + filename, 'rb')
+                         break
+                     except IOError:
+                         pass
+                 if inclfp:
+                     outfp.write(
+-                            '\n# Included from %s\n' % filename)
++                            b'\n# Included from ' + filename + b'\n')
+                     process(inclfp, outfp, env)
++                    inclfp.close()
+                 else:
+-                    sys.stderr.write('Warning - could not find file %s\n' %
+-                                     filename)
++                    sys.stderr.buffer.write(b'Warning - could not find file ' +
++                                            filename + b'\n')
+ 
+ if __name__ == '__main__':
+     main()
+
diff --git a/meta/recipes-devtools/python/python3/host_include_contamination.patch b/meta/recipes-devtools/python/python3/host_include_contamination.patch
new file mode 100644
index 0000000..ef2054d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/host_include_contamination.patch
@@ -0,0 +1,28 @@
+when building python for qemux86-64 on ubuntu 11.10/64bit
+it gropes into host includes and then mixes them with cross
+includes and as a result some modules fail to compile and link
+one of the modules is python-elementtree which is then not
+found during image creation
+
+Proble is that setup.py tries to add native includes that newer
+ubuntu has introduced for multiarch support. But that should
+only happen for native builds and not cross building python
+so we add a check here.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: Python-3.3.0rc2/setup.py
+===================================================================
+--- Python-3.3.0rc2.orig/setup.py	2012-09-20 21:54:50.000000000 -0700
++++ Python-3.3.0rc2/setup.py	2012-09-20 21:57:35.029123858 -0700
+@@ -402,6 +402,9 @@
+ 
+         if not find_executable('dpkg-architecture'):
+             return
++        if cross_compiling:
++            return
++
+         opt = ''
+         if cross_compiling:
+             opt = '-t' + sysconfig.get_config_var('HOST_GNU_TYPE')
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
new file mode 100644
index 0000000..426e299
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -0,0 +1,348 @@
+Index: Python-3.3.0rc2/Include/pythonrun.h
+===================================================================
+--- Python-3.3.0rc2.orig/Include/pythonrun.h	2012-09-09 02:10:55.000000000 -0700
++++ Python-3.3.0rc2/Include/pythonrun.h	2012-09-20 22:46:53.273124016 -0700
+@@ -181,6 +181,8 @@
+ /* In their own files */
+ PyAPI_FUNC(const char *) Py_GetVersion(void);
+ PyAPI_FUNC(const char *) Py_GetPlatform(void);
++PyAPI_FUNC(const char *) Py_GetArch(void);
++PyAPI_FUNC(const char *) Py_GetLib(void);
+ PyAPI_FUNC(const char *) Py_GetCopyright(void);
+ PyAPI_FUNC(const char *) Py_GetCompiler(void);
+ PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
+Index: Python-3.3.0rc2/Lib/distutils/command/install.py
+===================================================================
+--- Python-3.3.0rc2.orig/Lib/distutils/command/install.py	2012-09-09 02:10:56.000000000 -0700
++++ Python-3.3.0rc2/Lib/distutils/command/install.py	2012-09-20 22:46:53.273124016 -0700
+@@ -25,6 +25,8 @@
+     from site import USER_SITE
+     HAS_USER_SITE = True
+ 
++libname = sys.lib
++
+ if sys.version < "2.2":
+     WINDOWS_SCHEME = {
+         'purelib': '$base',
+@@ -45,7 +47,7 @@
+ INSTALL_SCHEMES = {
+     'unix_prefix': {
+         'purelib': '$base/lib/python$py_version_short/site-packages',
+-        'platlib': '$platbase/lib/python$py_version_short/site-packages',
++        'platlib': '$platbase/'+libname+'/python$py_version_short/site-packages',
+         'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
+         'scripts': '$base/bin',
+         'data'   : '$base',
+Index: Python-3.3.0rc2/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-3.3.0rc2.orig/Lib/distutils/sysconfig.py	2012-09-09 02:10:56.000000000 -0700
++++ Python-3.3.0rc2/Lib/distutils/sysconfig.py	2012-09-20 22:46:53.273124016 -0700
+@@ -139,8 +139,11 @@
+             prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+-        libpython = os.path.join(prefix,
+-                                 "lib", "python" + get_python_version())
++        if plat_specific or standard_lib:
++            lib = sys.lib
++        else:
++            lib = "lib"
++        libpython = os.path.join(prefix, lib, "python" + get_python_version())
+         if standard_lib:
+             return libpython
+         else:
+Index: Python-3.3.0rc2/Lib/pydoc.py
+===================================================================
+--- Python-3.3.0rc2.orig/Lib/pydoc.py	2012-09-09 02:10:59.000000000 -0700
++++ Python-3.3.0rc2/Lib/pydoc.py	2012-09-20 22:46:53.273124016 -0700
+@@ -369,7 +369,7 @@
+ 
+         docloc = os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
+ 
+-        basedir = os.path.join(sys.base_exec_prefix, "lib",
++        basedir = os.path.join(sys.base_exec_prefix, sys.lib,
+                                "python%d.%d" %  sys.version_info[:2])
+         if (isinstance(object, type(os)) and
+             (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
+Index: Python-3.3.0rc2/Lib/site.py
+===================================================================
+--- Python-3.3.0rc2.orig/Lib/site.py	2012-09-09 02:10:59.000000000 -0700
++++ Python-3.3.0rc2/Lib/site.py	2012-09-20 22:46:53.273124016 -0700
+@@ -303,13 +303,19 @@
+         if sys.platform in ('os2emx', 'riscos'):
+             sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
+         elif os.sep == '/':
+-            sitepackages.append(os.path.join(prefix, "lib",
++            sitepackages.append(os.path.join(prefix, sys.lib,
+                                         "python" + sys.version[:3],
+                                         "site-packages"))
+-            sitepackages.append(os.path.join(prefix, "lib", "site-python"))
++            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, "lib",
++                                        "python" + sys.version[:3],
++                                        "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
++            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, "lib", "site-python"))
+         else:
+             sitepackages.append(prefix)
+-            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
+         if sys.platform == "darwin":
+             # for framework builds *only* we add the standard Apple
+             # locations.
+Index: Python-3.3.0rc2/Lib/trace.py
+===================================================================
+--- Python-3.3.0rc2.orig/Lib/trace.py	2012-09-09 02:11:04.000000000 -0700
++++ Python-3.3.0rc2/Lib/trace.py	2012-09-20 22:46:53.273124016 -0700
+@@ -750,10 +750,10 @@
+                 # should I also call expanduser? (after all, could use $HOME)
+ 
+                 s = s.replace("$prefix",
+-                              os.path.join(sys.base_prefix, "lib",
++                              os.path.join(sys.base_prefix, sys.lib,
+                                            "python" + sys.version[:3]))
+                 s = s.replace("$exec_prefix",
+-                              os.path.join(sys.base_exec_prefix, "lib",
++                              os.path.join(sys.base_exec_prefix, sys.lib,
+                                            "python" + sys.version[:3]))
+                 s = os.path.normpath(s)
+                 ignore_dirs.append(s)
+Index: Python-3.3.0rc2/Makefile.pre.in
+===================================================================
+--- Python-3.3.0rc2.orig/Makefile.pre.in	2012-09-20 22:45:52.000000000 -0700
++++ Python-3.3.0rc2/Makefile.pre.in	2012-09-20 22:46:53.277124015 -0700
+@@ -92,6 +92,8 @@
+ 
+ # Machine-dependent subdirectories
+ MACHDEP=	@MACHDEP@
++LIB=		@LIB@
++ARCH=		@ARCH@
+ 
+ # Install prefix for architecture-independent files
+ prefix=		@prefix@
+@@ -108,7 +110,7 @@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
+-SCRIPTDIR=	$(prefix)/lib
++SCRIPTDIR=	@libdir@
+ ABIFLAGS=	@ABIFLAGS@
+ 
+ # Detailed destination directories
+@@ -618,6 +620,7 @@
+ 		-DEXEC_PREFIX='"$(exec_prefix)"' \
+ 		-DVERSION='"$(VERSION)"' \
+ 		-DVPATH='"$(VPATH)"' \
++		-DARCH='"$(ARCH)"' -DLIB='"$(LIB)"' \
+ 		-o $@ $(srcdir)/Modules/getpath.c
+ 
+ Modules/python.o: $(srcdir)/Modules/python.c
+@@ -669,7 +672,7 @@
+ Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
+ 
+ Python/getplatform.o: $(srcdir)/Python/getplatform.c
+-		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
++		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -DARCH='"$(ARCH)"' -DLIB='"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
+ 
+ Python/importdl.o: $(srcdir)/Python/importdl.c
+ 		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
+Index: Python-3.3.0rc2/Modules/getpath.c
+===================================================================
+--- Python-3.3.0rc2.orig/Modules/getpath.c	2012-09-09 02:11:09.000000000 -0700
++++ Python-3.3.0rc2/Modules/getpath.c	2012-09-20 22:46:53.277124015 -0700
+@@ -121,9 +121,11 @@
+ #define EXEC_PREFIX PREFIX
+ #endif
+ 
++#define LIB_PYTHON LIB "/python" VERSION
++
+ #ifndef PYTHONPATH
+-#define PYTHONPATH PREFIX "/lib/python" VERSION ":" \
+-              EXEC_PREFIX "/lib/python" VERSION "/lib-dynload"
++#define PYTHONPATH PREFIX "/" LIB_PYTHON ":" \
++              EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
+ #endif
+ 
+ #ifndef LANDMARK
+@@ -135,7 +137,7 @@
+ static wchar_t progpath[MAXPATHLEN+1];
+ static wchar_t *module_search_path = NULL;
+ static int module_search_path_malloced = 0;
+-static wchar_t *lib_python = L"lib/python" VERSION;
++static wchar_t *lib_python = L"" LIB_PYTHON;
+ 
+ static void
+ reduce(wchar_t *dir)
+Index: Python-3.3.0rc2/Python/getplatform.c
+===================================================================
+--- Python-3.3.0rc2.orig/Python/getplatform.c	2012-09-09 02:11:12.000000000 -0700
++++ Python-3.3.0rc2/Python/getplatform.c	2012-09-20 22:46:53.277124015 -0700
+@@ -10,3 +10,23 @@
+ {
+ 	return PLATFORM;
+ }
++
++#ifndef ARCH
++#define ARCH "unknown"
++#endif
++
++const char *
++Py_GetArch(void)
++{
++	return ARCH;
++}
++
++#ifndef LIB
++#define LIB "lib"
++#endif
++
++const char *
++Py_GetLib(void)
++{
++	return LIB;
++}
+Index: Python-3.3.0rc2/Python/sysmodule.c
+===================================================================
+--- Python-3.3.0rc2.orig/Python/sysmodule.c	2012-09-09 02:11:12.000000000 -0700
++++ Python-3.3.0rc2/Python/sysmodule.c	2012-09-20 22:46:53.277124015 -0700
+@@ -1612,6 +1612,10 @@
+                         PyUnicode_FromString(Py_GetCopyright()));
+     SET_SYS_FROM_STRING("platform",
+                         PyUnicode_FromString(Py_GetPlatform()));
++    SET_SYS_FROM_STRING("arch",
++                        PyUnicode_FromString(Py_GetArch()));
++    SET_SYS_FROM_STRING("lib",
++                        PyUnicode_FromString(Py_GetLib()));
+     SET_SYS_FROM_STRING("executable",
+                         PyUnicode_FromWideChar(
+                                Py_GetProgramFullPath(), -1));
+Index: Python-3.3.0rc2/setup.py
+===================================================================
+--- Python-3.3.0rc2.orig/setup.py	2012-09-20 22:45:53.000000000 -0700
++++ Python-3.3.0rc2/setup.py	2012-09-20 22:46:53.277124015 -0700
+@@ -462,7 +462,7 @@
+         # directories (i.e. '.' and 'Include') must be first.  See issue
+         # 10520.
+         if not cross_compiling:
+-            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++            add_dir_to_list(self.compiler.library_dirs, os.path.join('/usr/local', sys.lib))
+             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+         # only change this for cross builds for 3.3, issues on Mageia
+         if cross_compiling:
+@@ -520,8 +520,7 @@
+         # be assumed that no additional -I,-L directives are needed.
+         if not cross_compiling:
+             lib_dirs = self.compiler.library_dirs + [
+-                '/lib64', '/usr/lib64',
+-                '/lib', '/usr/lib',
++                '/' + sys.lib, '/usr/' + sys.lib,
+                 ]
+             inc_dirs = self.compiler.include_dirs + ['/usr/include']
+         if cross_compiling:
+@@ -699,11 +698,11 @@
+             elif curses_library:
+                 readline_libs.append(curses_library)
+             elif self.compiler.find_library_file(lib_dirs +
+-                                                     ['/usr/lib/termcap'],
++                                                     ['/usr/'+sys.lib+'/termcap'],
+                                                      'termcap'):
+                 readline_libs.append('termcap')
+             exts.append( Extension('readline', ['readline.c'],
+-                                   library_dirs=['/usr/lib/termcap'],
++                                   library_dirs=['/usr/'+sys.lib+'/termcap'],
+                                    extra_link_args=readline_extra_link_args,
+                                    libraries=readline_libs) )
+         else:
+Index: Python-3.3.0rc2/Lib/sysconfig.py
+===================================================================
+--- Python-3.3.0rc2.orig/Lib/sysconfig.py	2012-09-09 02:11:00.000000000 -0700
++++ Python-3.3.0rc2/Lib/sysconfig.py	2012-09-20 22:46:53.277124015 -0700
+@@ -21,10 +21,10 @@
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
++        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+         'platinclude':
+@@ -33,10 +33,10 @@
+         'data': '{base}',
+         },
+     'posix_home': {
+-        'stdlib': '{installed_base}/lib/python',
+-        'platstdlib': '{base}/lib/python',
++        'stdlib': '{installed_base}/'+sys.lib+'/python',
++        'platstdlib': '{base}/'+sys.lib+'/python',
+         'purelib': '{base}/lib/python',
+-        'platlib': '{base}/lib/python',
++        'platlib': '{base}/'+sys.lib+'/python',
+         'include': '{installed_base}/include/python',
+         'platinclude': '{installed_base}/include/python',
+         'scripts': '{base}/bin',
+@@ -81,10 +81,10 @@
+         'data': '{userbase}',
+         },
+     'posix_user': {
+-        'stdlib': '{userbase}/lib/python{py_version_short}',
+-        'platstdlib': '{userbase}/lib/python{py_version_short}',
++        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{userbase}/include/python{py_version_short}',
+         'scripts': '{userbase}/bin',
+         'data': '{userbase}',
+Index: Python-3.3.0b2/configure.ac
+===================================================================
+--- Python-3.3.0b2.orig/configure.ac	2012-08-11 08:54:25.000000000 +0200
++++ Python-3.3.0b2/configure.ac	2012-08-23 14:49:29.000000000 +0200
+@@ -746,6 +746,41 @@
+     esac;;
+ esac
+ 
++AC_SUBST(ARCH)
++AC_MSG_CHECKING(ARCH)
++ARCH=`uname -m`
++case $ARCH in
++i?86) ARCH=i386;;
++esac
++AC_MSG_RESULT($ARCH)
++
++AC_SUBST(LIB)
++AC_MSG_CHECKING(LIB)
++case $ac_sys_system in
++Linux*)
++  # Test if the compiler is 64bit
++  echo 'int i;' > conftest.$ac_ext
++  python_cv_cc_64bit_output=no
++  if AC_TRY_EVAL(ac_compile); then
++    case `/usr/bin/file conftest.$ac_objext` in
++    *"ELF 64"*)
++      python_cv_cc_64bit_output=yes
++      ;;
++    esac
++  fi
++  rm -rf conftest*
++  ;;
++esac
++
++case $ARCH:$python_cv_cc_64bit_output in
++ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
++  LIB="lib64"
++  ;;
++*:*)
++  LIB="lib"
++  ;;
++esac
++AC_MSG_RESULT($LIB)
+ 
+ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
diff --git a/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch b/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
new file mode 100644
index 0000000..4ec627e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
@@ -0,0 +1,19 @@
+This patch removes the RPATH setting which contains a pointer to
+the target relocated sysroot, which is incorrect.
+
+Upstream-Status: Inappropriate [Embedded Specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: Python-2.6.6/setup.py
+===================================================================
+--- Python-2.6.6.orig/setup.py	2011-09-28 14:22:57.000000000 -0700
++++ Python-2.6.6/setup.py	2011-09-28 16:11:25.147279633 -0700
+@@ -1079,7 +1079,6 @@
+                                   include_dirs=["Modules/_sqlite",
+                                                 sqlite_incdir],
+                                   library_dirs=sqlite_libdir,
+-                                  runtime_library_dirs=sqlite_libdir,
+                                   extra_link_args=sqlite_extra_link_args,
+                                   libraries=["sqlite3",]))
+         else:
diff --git a/meta/recipes-devtools/python/python3/setuptweaks.patch b/meta/recipes-devtools/python/python3/setuptweaks.patch
new file mode 100644
index 0000000..c34ef16
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/setuptweaks.patch
@@ -0,0 +1,57 @@
+This patch removes various ways native system options can pass into the python 
+compilation and somehow break C modules.
+
+Upstream-Status: Configuration [OE Specific]
+
+RP 2012/04/23
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-23 20:03:47.295582553 +0000
++++ Python-2.7.2/setup.py	2012-04-23 20:03:15.000000000 +0000
+@@ -231,7 +231,13 @@
+         # compilers
+         if compiler is not None:
+             (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
+-            args['compiler_so'] = compiler + ' ' + ccshared + ' ' + cflags
++            # Need to filter out -isysroot from the flags. Ideally should 
++            # figure out target flags here.
++            flags = []
++            for f in cflags.split():
++                if not f.startswith("-isystem"):
++                    flags.append(f)
++            args['compiler_so'] = compiler + ' ' + ccshared + ' ' + ' '.join(flags)
+         self.compiler.set_executables(**args)
+ 
+         build_ext.build_extensions(self)
+@@ -393,7 +399,6 @@
+         # into configure and stored in the Makefile (issue found on OS X 10.3).
+         for env_var, arg_name, dir_list in (
+                 ('LDFLAGS', '-R', self.compiler.runtime_library_dirs),
+-                ('LDFLAGS', '-L', self.compiler.library_dirs),
+                 ('CPPFLAGS', '-I', self.compiler.include_dirs)):
+             env_val = sysconfig.get_config_var(env_var)
+             if env_val:
+@@ -419,16 +424,16 @@
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.prefix) != '/usr' \
+-                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
++#        if os.path.normpath(sys.prefix) != '/usr' \
++#                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
+             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
+             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
+             # building a framework with different architectures than
+             # the one that is currently installed (issue #7473)
+-            add_dir_to_list(self.compiler.library_dirs,
+-                            sysconfig.get_config_var("LIBDIR"))
+-            add_dir_to_list(self.compiler.include_dirs,
+-                            sysconfig.get_config_var("INCLUDEDIR"))
++#            add_dir_to_list(self.compiler.library_dirs,
++#                            sysconfig.get_config_var("LIBDIR"))
++#            add_dir_to_list(self.compiler.include_dirs,
++#                            sysconfig.get_config_var("INCLUDEDIR"))
+ 
+         try:
+             have_unicode = unicode
diff --git a/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch b/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
new file mode 100644
index 0000000..0e4680e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
@@ -0,0 +1,11 @@
+--- a/Lib/shutil.py	2013-01-29 12:31:06.926555779 -0800
++++ b/Lib/shutil.py	2013-01-29 16:31:39.097554182 -0800
+@@ -132,7 +132,7 @@ def copymode(src, dst, *, follow_symlink
+     st = stat_func(src)
+     chmod_func(dst, stat.S_IMODE(st.st_mode))
+ 
+-if hasattr(os, 'listxattr'):
++if hasattr(os, 'listxattr') and os.listxattr in os.supports_follow_symlinks:
+     def _copyxattr(src, dst, *, follow_symlinks=True):
+         """Copy extended filesystem attributes from `src` to `dst`.
+ 
diff --git a/meta/recipes-devtools/python/python3/sitecustomize.py b/meta/recipes-devtools/python/python3/sitecustomize.py
new file mode 100644
index 0000000..4c8b5e2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/sitecustomize.py
@@ -0,0 +1,37 @@
+# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# GPLv2 or later
+# Version: 20081123
+# Features:
+# * set proper default encoding
+# * enable readline completion in the interactive interpreter
+# * load command line history on startup
+# * save command line history on exit 
+
+import os
+
+def __exithandler():
+    try:
+        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __registerExitHandler():
+    import atexit
+    atexit.register( __exithandler )
+
+def __enableReadlineSupport():
+    readline.set_history_length( 1000 )
+    readline.parse_and_bind( "tab: complete" )
+    try:
+        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+import sys
+try:
+    import rlcompleter, readline
+except ImportError:
+    pass
+else:
+    __registerExitHandler()
+    __enableReadlineSupport()
diff --git a/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch b/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
new file mode 100644
index 0000000..506210f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Accepted [http://hg.python.org/cpython/rev/c816479f6aaf/]
+Bugtracker: http://bugs.python.org/issue12326
+
+[Removed "Misc/NEWS" hunk]
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
+# HG changeset patch
+# User Victor Stinner <victor.stinner@haypocalc.com>
+# Date 1313841758 -7200
+# Node ID c816479f6aaf71dbd3f3fe4b239186d60c55ce48
+# Parent  3e093590ac57fdda428c7da3f72ddf0c475ecf2b
+Issue #12326: sys.platform is now always 'linux2' on Linux
+
+Even if Python is compiled on Linux 3.
+
+Index: Python-3.3.0rc2/configure.ac
+===================================================================
+--- Python-3.3.0rc2.orig/configure.ac	2012-09-09 02:11:14.000000000 -0700
++++ Python-3.3.0rc2/configure.ac	2012-09-20 00:44:03.317124001 -0700
+@@ -366,7 +366,7 @@
+     MACHDEP="$ac_md_system$ac_md_release"
+ 
+     case $MACHDEP in
+-	linux*) MACHDEP="linux";;
++	linux*) MACHDEP="linux2";;
+ 	cygwin*) MACHDEP="cygwin";;
+ 	darwin*) MACHDEP="darwin";;
+ 	irix646) MACHDEP="irix6";;
diff --git a/meta/recipes-devtools/python/python3_3.3.0.bb b/meta/recipes-devtools/python/python3_3.3.0.bb
new file mode 100644
index 0000000..081586d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3_3.3.0.bb
@@ -0,0 +1,203 @@
+require recipes-devtools/python/python.inc
+
+DEPENDS = "python3-native libffi bzip2 db gdbm openssl readline sqlite3 zlib"
+PR = "${INC_PR}.0"
+PYTHON_MAJMIN = "3.3"
+PYTHON_BINABI= "${PYTHON_MAJMIN}m"
+DISTRO_SRC_URI ?= "file://sitecustomize.py"
+DISTRO_SRC_URI_linuxstdbase = ""
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+file://000-cross-compile.patch \
+file://020-dont-compile-python-files.patch \
+file://030-fixup-include-dirs.patch \
+file://070-dont-clean-ipkg-install.patch \
+file://080-distutils-dont_adjust_files.patch \
+file://110-enable-zlib.patch \
+file://130-readline-setup.patch \
+file://140-verbose-sharedmods.patch \
+file://150-fix-setupterm.patch \
+file://h2py-pr13032.patch \
+${DISTRO_SRC_URI} \
+"
+
+SRC_URI += "\
+            file://03-fix-tkinter-detection.patch \
+            file://04-default-is-optimized.patch \
+            file://avoid_warning_about_tkinter.patch \
+            file://06-ctypes-libffi-fix-configure.patch \
+            file://remove_sqlite_rpath.patch \
+            file://cgi_py.patch \
+            file://host_include_contamination.patch \
+            file://python-3.3-multilib.patch \
+            file://shutil-follow-symlink-fix.patch \
+           "
+SRC_URI[md5sum] = "b3b2524f72409d919a4137826a870a8f"
+SRC_URI[sha256sum] = "15c113fd6c058712f05d31b4eff149d4d823b8e39ef5e37228dc5dc4f8716df9"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d214581529e343354f8e23025bdf582d"
+
+S = "${WORKDIR}/Python-${PV}"
+
+inherit autotools multilib_header python3native pkgconfig
+
+CONFIGUREOPTS += " --with-system-ffi "
+
+CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
+                ac_cv_have_lchflags=no \
+                ac_cv_have_long_long_format=yes \
+                ac_cv_buggy_getaddrinfo=no \
+                ac_cv_file__dev_ptmx=yes \
+                ac_cv_file__dev_ptc=no \
+"
+# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
+#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
+TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
+TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
+EXTRA_OEMAKE += "CROSS_COMPILE=yes"
+
+do_configure_prepend() {
+	rm -f ${S}/Makefile.orig
+	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+}
+
+do_compile() {
+        # regenerate platform specific files, because they depend on system headers
+        cd Lib/plat-linux*
+        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+                ${S}/Tools/scripts/h2py.py -i '(u_long)' \
+                ${STAGING_INCDIR}/dlfcn.h \
+                ${STAGING_INCDIR}/linux/cdrom.h \
+                ${STAGING_INCDIR}/netinet/in.h \
+                ${STAGING_INCDIR}/sys/types.h
+        sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
+        cd -
+
+	#
+	# Copy config.h and an appropriate Makefile for distutils.sysconfig,
+	# which laters uses the information out of these to compile extensions
+	#
+	# The following part (until python compilation) should probably moved to an
+	# -initial recipe to handle staging better
+	#
+	install -d ${STAGING_INCDIR}/python${PYTHON_BINABI}/
+	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_BINABI}/
+
+	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
+	sed -i -e s,ccache,'$(CCACHE)', Makefile
+
+	# remove any bogus LD_LIBRARY_PATH
+	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
+
+	if [ ! -f Makefile.orig ]; then
+		install -m 0644 Makefile Makefile.orig
+	fi
+	sed -i -e 's,^LDFLAGS=.*,LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
+		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
+		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
+		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
+		-e 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
+		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
+		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
+		Makefile
+	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	# save copy of it now, because if we do it in do_install and 
+	# then call do_install twice we get Makefile.orig == Makefile.sysroot
+	install -m 0644 Makefile Makefile.sysroot
+
+	export CROSS_COMPILE="${TARGET_PREFIX}"
+	export PYTHONBUILDDIR="${S}"
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		LIB=${baselib} \
+		ARCH=${TARGET_ARCH} \
+		OPT="${CFLAGS}" libpython3.so
+
+	oe_libinstall -so libpython${PYTHON_BINABI} ${STAGING_LIBDIR}
+
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native3/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native3/python3 \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		LIB=${baselib} \
+		ARCH=${TARGET_ARCH} \
+		OPT="${CFLAGS}"
+}
+
+do_install() {
+	# make install needs the original Makefile, or otherwise the inclues would
+	# go to ${D}${STAGING...}/...
+	install -m 0644 Makefile.orig Makefile
+
+	export CROSS_COMPILE="${TARGET_PREFIX}"
+	export PYTHONBUILDDIR="${S}"
+	install -d ${D}${libdir}/pkgconfig
+	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
+	
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native3/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native3/python3 \
+		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		LIB=${baselib} \
+		ARCH=${TARGET_ARCH} \
+		DESTDIR=${D} LIBDIR=${libdir} install
+
+	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+
+	if [ -e ${WORKDIR}/sitecustomize.py ]; then
+		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+	fi
+
+	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+}
+
+SSTATE_SCAN_FILES += "Makefile"
+PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
+
+py_package_preprocess () {
+	# copy back the old Makefile to fix target package
+	install -m 0644 Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
+require python-${PYTHON_MAJMIN}-manifest.inc
+
+# manual dependency additions
+RPROVIDES_${PN}-core = "${PN}"
+RRECOMMENDS_${PN}-core = "${PN}-readline"
+RRECOMMENDS_${PN}-crypt = "openssl"
+RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
+
+FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
+FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
+FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
+
+PACKAGES =+ "${PN}-pyvenv"
+FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
+
+# package libpython3
+PACKAGES =+ "libpython3 libpython3-staticdev"
+FILES_libpython3 = "${libdir}/libpython*.so.*"
+FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
+
+# catch debug extensions (isn't that already in python-core-dbg?)
+FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
+
+# catch all the rest (unsorted)
+PACKAGES += "${PN}-misc"
+FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
+
+# catch manpage
+PACKAGES += "${PN}-man"
+FILES_${PN}-man = "${datadir}/man"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.3.4


