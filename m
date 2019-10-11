Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF326C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z9so11562795wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TRK+4csT+x38y6LSjwMnNLdRJMulbpyle/N16jW2XEU=;
	b=qy+1f1Ts9y3BrmmmPWXZAibM1osPfDaY8U93VowCqv+sRZccvSNTqzt/ScdhbaZXjM
	JIjw+K8Ec+Jt1uIe2wy4EpgHcq9UBmanoFcJtRRRMthukkZj7qfL5gr0F25uF7fSYmQn
	ywGW7Xt7mECzNR31Nf2a1likisqjl19It7Nv3lQxtqO0L1v0BOl0BQFlTrnZeHKdo8/p
	qUVEWt+ZDp3L6sZ0ZuMU92QRSZXy2nIlbDgny9V6ryylB/Km/8YgLyx7hQMfl7MkwRPy
	Zmz9YbxhUHyrFeZegNo46yzNkKMgtVjHkIBqTj+BC6ZUFUCvoY4pwyLK4X3lruByzp/K
	/2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TRK+4csT+x38y6LSjwMnNLdRJMulbpyle/N16jW2XEU=;
	b=AIDESB6QoMwP8f1VoSxqLAUKDiyl9ilNnDmwFbabYF5SPrHJRxaNUYUwohkgcwHafl
	uncgXQrJeRpnjpT8oBtEbDcszG7I+PX7kCYpvqz4E1r7/XyWvw0XaqrZFxCcEzFufvyw
	p5D/yo7yrNoKYMdIs5GTys0lKYk9cp7IlpxqHuU5mkqZpaso99184q/g0w73sdDQDD6s
	UAOX2RlEXJZCdnV0jbsApcXbUgPl0KCorVbl9ariFm349I4pmvIVSofkRBZt3mr7R9TZ
	74WXLVNF5FPpF6RALYkiu9/DYh01bL3Ov3iklUbh2Vi9e6KvIr0CSzlmIoP7rnAswrS6
	Z3xA==
X-Gm-Message-State: APjAAAUitbP240qdXOrUBAY6UfPgIHcRR8b8w2Y/2qbR4+/xfOyWlDIy
	M2XYziNEQy5rdVdmVSgQPP2sT5Aj
X-Google-Smtp-Source: APXvYqwE00Q1TtyNdojlhplWbZP67iiD6SEk94rIXSgP8fR6R9plqB2Fe9re40K7rVao6TeTWA7AjA==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr13073360wrr.365.1570794484474;
	Fri, 11 Oct 2019 04:48:04 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:39 +0200
Message-Id: <20191011114754.91740-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/19] gobject-introspection: update to 1.62.0
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:04 -0000

Upstream has removed autotools support entirely, so we can drop
the chunks of patches that touch it.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-cross-compilation-support-to-meson.patch |  20 +-
 ...pository-directory-for-native-builds.patch |   6 +-
 ...lete-upstream-attempt-at-cross-compi.patch |  48 -----
 ...-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 201 ------------------
 ...g-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch |  61 +-----
 ...0.2.bb => gobject-introspection_1.62.0.bb} |   6 +-
 6 files changed, 18 insertions(+), 324 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.60.2.bb => gobject-introspection_1.62.0.bb} (96%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
index 5747d61c192..639f9c8f61a 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
@@ -1,4 +1,4 @@
-From 2b3bce1526b538dc2c7fa223eaf9808858aa1b06 Mon Sep 17 00:00:00 2001
+From 0417a1bb08745f2bf5310d20b342c2b3b9b212d3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 15 Nov 2018 15:10:05 +0100
 Subject: [PATCH] Port cross-compilation support to meson
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 68 insertions(+), 18 deletions(-)
 
 diff --git a/gir/meson.build b/gir/meson.build
-index 85ae575..327c134 100644
+index c312100..a028033 100644
 --- a/gir/meson.build
 +++ b/gir/meson.build
-@@ -36,16 +36,29 @@ gir_files = [
+@@ -41,16 +41,29 @@ gir_files = [
  typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
  install_data(gir_files, install_dir: girdir)
  
@@ -56,7 +56,7 @@ index 85ae575..327c134 100644
  
  dep_type = glib_dep.type_name()
  if dep_type == 'internal'
-@@ -58,6 +71,12 @@ if dep_type == 'internal'
+@@ -63,6 +76,12 @@ if dep_type == 'internal'
                        '--extra-library=glib-2.0', '--extra-library=gobject-2.0']
  endif
  
@@ -69,7 +69,7 @@ index 85ae575..327c134 100644
  # Take a glob and print to newlines
  globber = '''
  from glob import glob
-@@ -84,8 +103,8 @@ glib_command = scanner_command + [
+@@ -89,8 +108,8 @@ glib_command = scanner_command + [
  
  if dep_type == 'pkgconfig'
    glib_command += ['--external-library', '--pkg=glib-2.0']
@@ -80,8 +80,8 @@ index 85ae575..327c134 100644
    glib_libincdir = join_paths(glib_libdir, 'glib-2.0', 'include')
    glib_files += join_paths(glib_incdir, 'gobject', 'glib-types.h')
    glib_files += join_paths(glib_libincdir, 'glibconfig.h')
-@@ -339,7 +358,7 @@ endforeach
- if giounix_dep.found()
+@@ -345,7 +364,7 @@ if giounix_dep.found()
+   dep_type = giounix_dep.type_name()
    if dep_type == 'pkgconfig'
      gio_command += ['--pkg=gio-unix-2.0']
 -    giounix_includedir = join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
@@ -89,7 +89,7 @@ index 85ae575..327c134 100644
      # Get the installed gio-unix header list
      ret = run_command(python, '-c', globber.format(join_paths(giounix_includedir, 'gio', '*.h')))
      if ret.returncode() != 0
-@@ -422,15 +441,24 @@ gir_files += custom_target('gir-girepository',
+@@ -428,15 +447,24 @@ gir_files += custom_target('gir-girepository',
  )
  
  typelibs = []
@@ -119,10 +119,10 @@ index 85ae575..327c134 100644
      install_dir: typelibdir,
    )
 diff --git a/meson.build b/meson.build
-index 95bbd2b..f7baefd 100644
+index a5e825f..a28490a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -163,7 +163,9 @@ endif
+@@ -168,7 +168,9 @@ endif
  subdir('girepository')
  subdir('tools')
  subdir('giscanner')
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index a4f45a142dd..a15401aeb2f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 8f01066e935a7323ff6e53f27ed1b5fb74fa11eb Mon Sep 17 00:00:00 2001
+From 673623851fb70c0e43cf79cef67b3751432ebe72 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -62,10 +62,10 @@ index ca5dc2b..7a4d17f 100644
        typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
 diff --git a/girepository/meson.build b/girepository/meson.build
-index 0261e1a..4cb646f 100644
+index 1d7aed6..5637fb5 100644
 --- a/girepository/meson.build
 +++ b/girepository/meson.build
-@@ -36,7 +36,7 @@ girepo_internals_lib = static_library('girepository-internals',
+@@ -44,7 +44,7 @@ girepo_internals_lib = static_library('girepository-internals',
    ],
    c_args: gi_hidden_visibility_cflags + custom_c_args,
    include_directories : configinc,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
deleted file mode 100644
index d1fdc068c08..00000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8a57aa0ac6c2f00b9b7a7fc177431f7643399e70 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 23 Mar 2016 17:07:28 +0200
-Subject: [PATCH] Revert an incomplete upstream attempt at cross-compile
- support
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- common.mk                | 4 ----
- giscanner/gdumpparser.py | 6 ------
- 2 files changed, 10 deletions(-)
-
-diff --git a/common.mk b/common.mk
-index 64fb02f..77e819d 100644
---- a/common.mk
-+++ b/common.mk
-@@ -24,12 +24,8 @@ INTROSPECTION_SCANNER_ARGS = \
-     --add-include-path=$(top_builddir) \
-     --add-include-path=$(top_builddir)/gir
- 
--# GI_CROSS_LAUNCHER is the command to use for executing g-ir-compiler.
--# Normally will be undefined but can be set (e.g. to wine or qemu)
--# when cross-compiling
- INTROSPECTION_COMPILER = \
-     env PATH=".libs:$(PATH)" \
--        $(GI_CROSS_LAUNCHER) \
-         $(top_builddir)/g-ir-compiler$(EXEEXT)
- 
- INTROSPECTION_COMPILER_ARGS = \
-diff --git a/giscanner/gdumpparser.py b/giscanner/gdumpparser.py
-index 1730fee..26bab84 100644
---- a/giscanner/gdumpparser.py
-+++ b/giscanner/gdumpparser.py
-@@ -156,12 +156,6 @@ blob containing data gleaned from GObject's primitive introspection."""
-         out_path = os.path.join(self._binary.tmpdir, 'dump.xml')
- 
-         args = []
--
--        # Prepend the launcher command and arguments, if defined
--        launcher = os.environ.get('GI_CROSS_LAUNCHER')
--        if launcher:
--            args.extend(launcher.split())
--
-         args.extend(self._binary.args)
-         args.append('--introspect-dump=%s,%s' % (in_path, out_path))
- 
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
deleted file mode 100644
index e4fffcf6133..00000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
+++ /dev/null
@@ -1,201 +0,0 @@
-From 2335d22e4c64db3d5dfc16ac65468b9dd66db8ac Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 19 Oct 2015 18:29:21 +0300
-Subject: [PATCH] configure.ac: add host-gi, gi-cross-wrapper, gi-ldd-wrapper
- and introspection-data options
-
-With the first option, gobject-introspection tools (g-ir-doc-tool and g-ir-scanner)
-that are already installed in the host system will be used for building the source tree.
-
-With the second option, g-ir-scanner will be instructed to use an executable
-wrapper to run binaries it's producing, and g-ir-compiler will be run
-through the same wrapper (host system's g-ir-compiler cannot be used because
-it's producing architecture-specific output).
-
-With the third option, giscanner will be instructed to use a special ldd
-command instead of system's ldd (which does not work when the binary to inspect
-is compiled for a different architecture).
-
-With the fourth option, it is possible to disable building of introspection data
-(.gir and .typelib files), which may be difficult or impossible in cross-compilation
-environments, because of lack of emulation (or native hardware) for the target architecture
-on which the target binaries can be run.
-
-These options are useful when cross-compiling for a different target architecture.
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile.am       |  2 ++
- common.mk         | 39 +++++++++++++++++++++++++++++++++++++++
- configure.ac      | 42 ++++++++++++++++++++++++++++++++++++++++++
- tests/Makefile.am |  5 ++++-
- 4 files changed, 87 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 952bf71..797a3bd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -21,7 +21,9 @@ include Makefile-cmph.am
- include Makefile-girepository.am
- include Makefile-giscanner.am
- include Makefile-examples.am
-+if BUILD_INTROSPECTION_DATA
- include Makefile-gir.am
-+endif
- include Makefile-tools.am
- 
- ## Process this file with automake to produce Makefile.in
-diff --git a/common.mk b/common.mk
-index 77e819d..379ab53 100644
---- a/common.mk
-+++ b/common.mk
-@@ -6,6 +6,15 @@
- # module itself.
- #
- 
-+if USE_HOST_GI
-+INTROSPECTION_SCANNER = \
-+    env PATH="$(PATH)" \
-+        LPATH=.libs \
-+        CC="$(CC)" \
-+        PYTHONPATH=$(top_builddir):$(top_srcdir) \
-+        UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
-+        g-ir-scanner
-+else
- INTROSPECTION_SCANNER = \
-     env PATH=".libs:$(PATH)" \
-         LPATH=.libs \
-@@ -14,9 +23,24 @@ INTROSPECTION_SCANNER = \
-         UNINSTALLED_INTROSPECTION_SRCDIR=$(top_srcdir) \
-         UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
-         $(top_builddir)/g-ir-scanner
-+endif
-+
-+if USE_CROSS_WRAPPER
-+CROSS_WRAPPER_ARG = --use-binary-wrapper=$(GI_CROSS_WRAPPER)
-+else
-+CROSS_WRAPPER_ARG =
-+endif
-+
-+if USE_LDD_WRAPPER
-+LDD_WRAPPER_ARG = --use-ldd-wrapper=$(GI_LDD_WRAPPER)
-+else
-+LDD_WRAPPER_ARG =
-+endif
- 
- INTROSPECTION_SCANNER_ARGS = \
-     --verbose \
-+    $(CROSS_WRAPPER_ARG) \
-+    $(LDD_WRAPPER_ARG) \
-     -I$(top_srcdir) \
-     --add-include-path=$(srcdir) \
-     --add-include-path=$(top_srcdir)/gir \
-@@ -24,9 +48,15 @@ INTROSPECTION_SCANNER_ARGS = \
-     --add-include-path=$(top_builddir) \
-     --add-include-path=$(top_builddir)/gir
- 
-+if USE_CROSS_WRAPPER
-+INTROSPECTION_COMPILER = \
-+    env PATH=".libs:$(PATH)" \
-+        $(GI_CROSS_WRAPPER) $(top_builddir)/.libs/g-ir-compiler$(EXEEXT)
-+else
- INTROSPECTION_COMPILER = \
-     env PATH=".libs:$(PATH)" \
-         $(top_builddir)/g-ir-compiler$(EXEEXT)
-+endif
- 
- INTROSPECTION_COMPILER_ARGS = \
-     --includedir=$(srcdir) \
-@@ -35,6 +65,14 @@ INTROSPECTION_COMPILER_ARGS = \
-     --includedir=$(top_builddir) \
-     --includedir=$(top_builddir)/gir
- 
-+if USE_HOST_GI
-+INTROSPECTION_DOCTOOL = \
-+    env PATH="$(PATH)" \
-+        LPATH=.libs \
-+        PYTHONPATH=$(top_builddir):$(top_srcdir) \
-+        UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
-+        g-ir-doc-tool
-+else
- INTROSPECTION_DOCTOOL = \
-     env PATH=".libs:$(PATH)" \
-         LPATH=.libs \
-@@ -42,6 +80,7 @@ INTROSPECTION_DOCTOOL = \
-         UNINSTALLED_INTROSPECTION_SRCDIR=$(top_srcdir) \
-         UNINSTALLED_INTROSPECTION_BUILDDIR=$(top_builddir) \
-         $(top_builddir)/g-ir-doc-tool
-+endif
- 
- INTROSPECTION_DOCTOOL_ARGS = \
-     --add-include-path=$(srcdir) \
-diff --git a/configure.ac b/configure.ac
-index 885da70..cd8108b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -383,6 +383,48 @@ dnl
- AM_CONDITIONAL(MSVC_BASE_NO_TOOLSET_SET, [test x$MSVC_BASE_TOOLSET = x])
- AM_CONDITIONAL(MSVC_NO_TOOLSET_SET, [test x$MSVC_TOOLSET = x])
- 
-+AC_ARG_ENABLE([host-gi],
-+[AS_HELP_STRING([--enable-host-gi],[Use gobject introspection tools installed in the host system (useful when cross-compiling)])],
-+[case "${enableval}" in
-+  yes) host_gi=true ;;
-+  no)  host_gi=false ;;
-+  *) AC_MSG_ERROR([bad value ${enableval} for --enable-host-gi]) ;;
-+esac],[host_gi=false])
-+AM_CONDITIONAL([USE_HOST_GI], [test x$host_gi = xtrue])
-+
-+AC_ARG_ENABLE([gi-cross-wrapper],
-+[AS_HELP_STRING([--enable-gi-cross-wrapper=path],[Use a wrapper to run gicompiler and binaries produced by giscanner (useful when cross-compiling)])],
-+[
-+GI_CROSS_WRAPPER="${enableval}"
-+use_wrapper=true
-+],[
-+GI_CROSS_WRAPPER=""
-+use_wrapper=false
-+])
-+AC_SUBST(GI_CROSS_WRAPPER)
-+AM_CONDITIONAL([USE_CROSS_WRAPPER], [test x$use_wrapper = xtrue])
-+
-+AC_ARG_ENABLE([gi-ldd-wrapper],
-+[AS_HELP_STRING([--enable-gi-ldd-wrapper=path],[Use a ldd wrapper instead of system's ldd command in giscanner (useful when cross-compiling)])],
-+[
-+GI_LDD_WRAPPER="${enableval}"
-+use_ldd_wrapper=true
-+],[
-+GI_LDD_WRAPPER=""
-+use_ldd_wrapper=false
-+])
-+AC_SUBST(GI_LDD_WRAPPER)
-+AM_CONDITIONAL([USE_LDD_WRAPPER], [test x$use_ldd_wrapper = xtrue])
-+
-+AC_ARG_ENABLE([introspection-data],
-+[AS_HELP_STRING([--enable-introspection-data],[Build introspection data (.gir and .typelib files) in addition to library and tools])],
-+[case "${enableval}" in
-+  yes) introspection_data=true ;;
-+  no)  introspection_data=false ;;
-+  *) AC_MSG_ERROR([bad value ${enableval} for --enable-introspection-data]) ;;
-+esac],[introspection_data=true])
-+AM_CONDITIONAL([BUILD_INTROSPECTION_DATA], [test x$introspection_data = xtrue])
-+
- AC_CONFIG_FILES([
- Makefile
- tests/Makefile
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 4bdb9c3..10b0f27 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1,6 +1,9 @@
- include $(top_srcdir)/common.mk
- 
--SUBDIRS = . scanner repository offsets warn
-+SUBDIRS = . scanner repository warn
-+if BUILD_INTROSPECTION_DATA
-+SUBDIRS += offsets
-+endif
- 
- EXTRA_DIST=
- BUILT_SOURCES=
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
index 74622680d6d..26f8da6d415 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
@@ -1,4 +1,4 @@
-From 74dab0fb6104ab6b715a24b783f8e8dfa5f83617 Mon Sep 17 00:00:00 2001
+From 740d91151ffe576e0c08513af9d7bc8133eb9dfb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 8 Oct 2015 18:30:35 +0300
 Subject: [PATCH] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
@@ -11,64 +11,9 @@ Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- Makefile-gir.am     | 18 +++++++++---------
- m4/introspection.m4 |  8 ++++----
- 2 files changed, 13 insertions(+), 13 deletions(-)
+ m4/introspection.m4 | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/Makefile-gir.am b/Makefile-gir.am
-index b59b0a6..24a50c2 100644
---- a/Makefile-gir.am
-+++ b/Makefile-gir.am
-@@ -58,8 +58,8 @@ else
- endif
- 
- # glib
--GLIB_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir glib-2.0)/glib-2.0
--GLIB_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir glib-2.0)
-+GLIB_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir glib-2.0)/glib-2.0
-+GLIB_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir glib-2.0)
- 
- GLIB_LIBRARY=glib-2.0
- 
-@@ -95,8 +95,8 @@ GLib-2.0.gir: g-ir-scanner g-ir-compiler$(EXEEXT)
- gir/DBusGLib-1.0.typelib: GObject-2.0.gir
- 
- # gobject
--GOBJECT_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gobject-2.0)/glib-2.0
--GOBJECT_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gobject-2.0)
-+GOBJECT_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gobject-2.0)/glib-2.0
-+GOBJECT_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gobject-2.0)
- 
- GOBJECT_LIBRARY=gobject-2.0
- 
-@@ -124,8 +124,8 @@ GObject_2_0_gir_FILES = \
- BUILT_GIRSOURCES += GObject-2.0.gir
- 
- # gmodule
--GMODULE_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gmodule-2.0)/glib-2.0
--GMODULE_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gmodule-2.0)
-+GMODULE_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gmodule-2.0)/glib-2.0
-+GMODULE_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gmodule-2.0)
- 
- GMODULE_LIBRARY=gmodule-2.0
- 
-@@ -150,13 +150,13 @@ GModule_2_0_gir_FILES = $(GLIB_INCLUDEDIR)/gmodule.h \
- BUILT_GIRSOURCES += GModule-2.0.gir
- 
- # gio
--GIO_INCLUDEDIR=$(shell "${PKG_CONFIG}" --variable=includedir gio-2.0)/glib-2.0
--GIO_LIBDIR=$(shell "${PKG_CONFIG}" --variable=libdir gio-2.0)
-+GIO_INCLUDEDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-2.0)/glib-2.0
-+GIO_LIBDIR=$(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=libdir gio-2.0)
- 
- GIO_LIBRARY=gio-2.0
- 
- if HAVE_GIO_UNIX
--GIO_UNIX_INCLUDEDIR = $(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0
-+GIO_UNIX_INCLUDEDIR = $(PKG_CONFIG_SYSROOT_DIR)$(shell "${PKG_CONFIG}" --variable=includedir gio-unix-2.0)/gio-unix-2.0
- GIO_UNIX_HDRS = $(wildcard $(GIO_UNIX_INCLUDEDIR)/gio/*.h)
- GIO_UNIX_PACKAGES = gio-unix-2.0
- else
 diff --git a/m4/introspection.m4 b/m4/introspection.m4
 index d89c3d9..b562266 100644
 --- a/m4/introspection.m4
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
similarity index 96%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
index f46053f4432..c925115fb73 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     "
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
-           file://0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch \
-           file://0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch \
            file://0003-giscanner-add-use-binary-wrapper-option.patch \
            file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
@@ -21,8 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-meson.build-disable-tests-when-cross-compiling.patch \
            "
 
-SRC_URI[md5sum] = "57c1c5dcf3d0a9aa73d06c2d5e6960d7"
-SRC_URI[sha256sum] = "ffdfe2368fb2e34a547898b01aac0520d52d8627fdeb1c306559bcb503ab5e9c"
+SRC_URI[md5sum] = "37278eab3704e42234b6080b8cf241f1"
+SRC_URI[sha256sum] = "b1ee7ed257fdbc008702bdff0ff3e78a660e7e602efa8f211dc89b9d1e7d90a2"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.17.1


