Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3E427763DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 15:04:52 +0000 (UTC)
Received: from dastp.fritz.box ([79.253.156.126]) by mail.gmx.com (mrgmx002)
	with ESMTPSA (Nemesis) id 0LhOSG-1YXaFe2LxY-00mduy;
	Tue, 28 Jul 2015 16:59:46 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:58:38 +0200
Message-Id: <1438095518-7513-5-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
References: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:/FKJ4BgwHcwNC2DbtOZiC0DjxUSrM5xKEIittipEV3907nUBLBS
	adq4+wTxXYuHeLMRzyQBE03rmXAf6vZ2KxGKguQQQwbsRbnplXbdYcOMWnUdQL/yKjcgfL+
	LYOM983YeXkyXitumFkU2/hNQTvY2hgBJBVMu/jgPYYIY3NVh0EcoxvHYYNQYXrXeukszjw
	ic+LQA14BstPeq3Fp2mHw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lNqbBWP/D3Q=:L1lIWtglodZfhad1p0QKMB
	NwxlHyUaemLIdWukKas3aFwPTdMTPBlxyR4UgJlHyv3sCCYncWGgWO59xVufQ8p9NHJ9KUhhD
	owIrh6HXMCVYEUZxPdvNSImvVDbUA0nir49RjPRZP22wdbhz5YXsVW5WhJGMyyUj2+2Zygc7+
	BGzr9NNMraQrzJDc6AIHCpxUai3aRfgCQLnIndxzZvpcLRu09sAHPW6dMyS836KpARubObjTr
	keVnNLasAenGsZLKEjakgD41onI8o/CEg5Qysly1wl6FGIIHm/+RzbbzsHYnOlCEfFhE9AoKO
	b9hWWT34RR65GLX3OSvmHLpmf+yhUSMXyDDT83LpwhCBaj5/5NQucYOLh59H7vDi4nQ4sJ5xv
	CWDDB+/LSN/FjG2mqXAE2PniR5msQrT/0jhal1KkZZdpa2ROVr1wX7yn1ANfj0ErKpDPiKXWc
	nkLCxcqMttccB1bq0sG9WU3Fx45+epPWNODpFjoXp2HCwYtWnzLEc7ISCBV5tuX52rSmEMMyY
	IgCwZaOIr7aDLVnZM55vsh8i2VYv63XzVVwMFjMLQ/Ejbs7HPh0dpAImDONKAkEmaPfk3CZIv
	LXCQhB2JdE2TqhFRcEjNkrSr/kba/5DNw0Kr2WVhW0ghYOsCtsl6qf56EqGMy7xVKHWctlFns
	LEkQBldCVznrmSjemKytfsubA8Oc2pros+ezxfSDbBCoGswfSRg1Z858vUXCYEdlFU+w=
Subject: [PATCH 4/4] python3: delete patches that don't get applied anywhere
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
X-List-Received-Date: Tue, 28 Jul 2015 15:04:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches are not referenced in any of the Python recipes.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../python3/06-ctypes-libffi-fix-configure.patch   | 44 ---------------
 .../python/python3/fix-ast.h-dependency.patch      | 26 ---------
 .../python3/pip_build_directory_unclean.patch      | 28 ----------
 ...python3-fix-build-error-with-Readline-6.3.patch | 62 ----------------------
 .../python/python3/remove_sqlite_rpath.patch       | 19 -------
 5 files changed, 179 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
 delete mode 100644 meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch
 delete mode 100644 meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch
 delete mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch

diff --git a/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch b/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
deleted file mode 100644
index abd63d2..0000000
--- a/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-This fixes configure issues with recent autoconf, e.g:
-  autoreconf: Entering directory `Modules/_ctypes/libffi'
-  autoreconf: configure.ac: not using Gettext
-  autoreconf: running: aclocal --force
-  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
-  configure.ac:26: the top level
-
-The problem is still present in python-2.6.5 but fixed in python-svn.
-
-Upstream-Status: Accepted [python-svn]
-
-Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
-Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-2011/09/29
-Rebased for python 2.7.2
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-
-Index: Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
-===================================================================
---- Python-2.7.2.orig/Modules/_ctypes/libffi/Makefile.am
-+++ Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
-@@ -2,7 +2,7 @@
- 
- AUTOMAKE_OPTIONS = foreign subdir-objects
- 
--SUBDIRS = include testsuite man
-+SUBDIRS = include
- 
- EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
- 	src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
-@@ -34,8 +34,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
- 	libtool-version ChangeLog.libffi m4/libtool.m4 \
- 	m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
- 
--info_TEXINFOS = doc/libffi.texi
--
- ## ################################################################
- 
- ##
diff --git a/meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch b/meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch
deleted file mode 100644
index 77c220a..0000000
--- a/meta/recipes-devtools/python/python3/fix-ast.h-dependency.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix a missed dependency on ast.h which can result in race condition
-at high parallel build
-
-It fixed here
-
-http://hg.python.org/cpython/rev/cfe0a293551f
-
-[YOCTO #5884]
-
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: Python-3.3.3/Makefile.pre.in
-===================================================================
---- Python-3.3.3.orig/Makefile.pre.in	2014-02-26 09:33:13.868288863 -0800
-+++ Python-3.3.3/Makefile.pre.in	2014-02-26 09:36:27.348292492 -0800
-@@ -853,7 +853,8 @@
- 		$(srcdir)/Include/warnings.h \
- 		$(srcdir)/Include/weakrefobject.h \
- 		pyconfig.h \
--		$(PARSER_HEADERS)
-+		$(PARSER_HEADERS) \
-+		$(AST_H)
- 
- $(LIBRARY_OBJS) $(MODOBJS) Modules/python.o: $(PYTHON_HEADERS)
- 
diff --git a/meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch b/meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch
deleted file mode 100644
index c0c4617..0000000
--- a/meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Index: Python-3.4.2/Lib/ensurepip/__init__.py
-===================================================================
---- Python-3.4.2.orig/Lib/ensurepip/__init__.py
-+++ Python-3.4.2/Lib/ensurepip/__init__.py
-@@ -3,6 +3,7 @@ import os.path
- import pkgutil
- import sys
- import tempfile
-+import pwd
- 
- 
- __all__ = ["version", "bootstrap"]
-@@ -36,6 +37,15 @@ def _run_pip(args, additional_paths=None
-     if additional_paths is not None:
-         sys.path = additional_paths + sys.path
- 
-+    # Explicitly make sure pip build directory was left clean
-+    user = pwd.getpwuid(os.getuid())[0]
-+    if os.path.exists("/tmp/pip_build_" + user + "/pip-delete-this-directory.txt"):
-+        os.remove("/tmp/pip_build_" + user + "/pip-delete-this-directory.txt")
-+        try:
-+            os.rmdir("/tmp/pip_build_" + user + "/")
-+        except OSError:
-+            print("Error: Pip build directory (%s) was left unclean, make sure it is clean before continuing\n" % ("/tmp/pip_build_" + user + "/"))
-+
-     # Install the bundled software
-     import pip
-     pip.main(args)
diff --git a/meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch b/meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch
deleted file mode 100644
index 44e2b7e..0000000
--- a/meta/recipes-devtools/python/python3/python3-fix-build-error-with-Readline-6.3.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-python3: fix build error with Readline 6.3
-
-Backport two patches from upstream:
-
-use new readline function types (closes #20374)
-Issue #20374: Avoid compiler warnings when compiling readline with libedit.
-
-Upstream-Status: Backport
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- Modules/readline.c |   15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/Modules/readline.c b/Modules/readline.c
-index 096c6d1..1646ef8 100644
---- a/Modules/readline.c
-+++ b/Modules/readline.c
-@@ -773,15 +773,24 @@ on_hook(PyObject *func)
-     return result;
- }
- 
-+
- static int
-+#if defined(_RL_FUNCTION_TYPEDEF)
- on_startup_hook(void)
-+#else
-+on_startup_hook()
-+#endif
- {
-     return on_hook(startup_hook);
- }
- 
- #ifdef HAVE_RL_PRE_INPUT_HOOK
- static int
-+#if defined(_RL_FUNCTION_TYPEDEF)
- on_pre_input_hook(void)
-+#else
-+on_pre_input_hook()
-+#endif
- {
-     return on_hook(pre_input_hook);
- }
-@@ -936,12 +945,12 @@ setup_readline(void)
-     rl_bind_key_in_map ('\t', rl_complete, emacs_meta_keymap);
-     rl_bind_key_in_map ('\033', rl_complete, emacs_meta_keymap);
-     /* Set our hook functions */
--    rl_startup_hook = (Function *)on_startup_hook;
-+    rl_startup_hook = (rl_hook_func_t *)on_startup_hook;
- #ifdef HAVE_RL_PRE_INPUT_HOOK
--    rl_pre_input_hook = (Function *)on_pre_input_hook;
-+    rl_pre_input_hook = (rl_hook_func_t *)on_pre_input_hook;
- #endif
-     /* Set our completion function */
--    rl_attempted_completion_function = (CPPFunction *)flex_complete;
-+    rl_attempted_completion_function = (rl_completion_func_t *)flex_complete;
-     /* Set Python word break characters */
-     completer_word_break_characters =
-         rl_completer_word_break_characters =
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch b/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
deleted file mode 100644
index 4ec627e..0000000
--- a/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-This patch removes the RPATH setting which contains a pointer to
-the target relocated sysroot, which is incorrect.
-
-Upstream-Status: Inappropriate [Embedded Specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: Python-2.6.6/setup.py
-===================================================================
---- Python-2.6.6.orig/setup.py	2011-09-28 14:22:57.000000000 -0700
-+++ Python-2.6.6/setup.py	2011-09-28 16:11:25.147279633 -0700
-@@ -1079,7 +1079,6 @@
-                                   include_dirs=["Modules/_sqlite",
-                                                 sqlite_incdir],
-                                   library_dirs=sqlite_libdir,
--                                  runtime_library_dirs=sqlite_libdir,
-                                   extra_link_args=sqlite_extra_link_args,
-                                   libraries=["sqlite3",]))
-         else:
-- 
2.4.6


