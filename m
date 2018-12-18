Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 93FB47BD8B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t6so16371471wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lepR4pPpyKUgcK9WmtbLSrqR3KqyXfpRZCfyywoIgXY=;
	b=KuKDtUgfOqluD3Ng7olJQg2t3X2HkqlRzDONoRIf98wEkLp3a/swkrCuXz2Dc7cECu
	nA0yas5slmqv81Db+enTzMl45KeyplUC0OYCqsM53ZedeMR49glfh8PXBpOQrGOqGZnu
	516fr9sVGpmx1jc2gbRlyX4Elx73SS//oVTHfUANNeK8fDvSoquiseRaJFu1JVuKJq8i
	07g3fE69q/nb+IGCZ4RYryM0Pefq5xOqLdU4KmCCbZLBsC9thlpb52lAauSMM/Bb9Qhp
	tWkkQw028m9xWCrBensUaBtXD1S8v7gWLfV/DCxnjUfPP5fiGqbnsSP3n0XWxhnTLSTN
	hOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lepR4pPpyKUgcK9WmtbLSrqR3KqyXfpRZCfyywoIgXY=;
	b=D4JgSjkkVSK2+oiaRzhakIYCTGPwKIj3EwezlsCBq3ztRAKeBYxOw9IoaohTLZ+XaJ
	+NWlmpZrPEpZPkVyD8uAhDem5d4VxHjpMSBt0CNGTgkOnI8Q9k97NojIdeSqvZdF0xKR
	kKQgVNuVNfMS1sKqmLHfjG46Stf9l3CEYp3YK+uwlsr3EAwLX231ApqeJQ/sPsoVn06e
	UIJ3UemJ6WkJxq1KEWfh2YbY3aBZjejIdKEsIOgdl3uICumrin8s/RD8T6Gtr1+W5/Hv
	kdyULCnCwoVbiCV0gF4ma1IpN6rESHRojMtoKXiiipWWrgsLzIowwnEaHgE00cSX4VnJ
	pnFQ==
X-Gm-Message-State: AA+aEWal0BThBR4jNW0jKHjIY6sEnusk2bRGOzp3AZnLI6aQrGmGAhqK
	LtNAU/z0r0SToG1CNSOUHe8z1QO0
X-Google-Smtp-Source: AFSGD/U1WPN51j4qmPw+DCo6uAjMG4oT6tIz0OevlO52RGbofj8RspZyxaglzCt2RQk05udgyQYEmA==
X-Received: by 2002:adf:e707:: with SMTP id c7mr14452253wrm.196.1545150615659; 
	Tue, 18 Dec 2018 08:30:15 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:29:54 +0100
Message-Id: <20181218163005.1330-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/13] meson: update to 0.49.0
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:15 -0000

Drop upstreamed gi-flags.patch and gtkdoc-flags.patch, rebase the rest.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         | 10 ++-
 ...0001-Make-CPU-family-warnings-fatal.patch} | 27 ++++----
 ...sues-that-arise-when-cross-compiling.patch | 61 ++-----------------
 ...-not-manipulate-the-environment-when.patch | 52 ++++++++--------
 ...port-building-allarch-recipes-again.patch} | 20 +++---
 ...ction-determine-g-ir-scanner-and-g-i.patch | 37 +++++------
 .../meson/meson/gi-flags.patch                | 35 -----------
 .../meson/meson/gtkdoc-flags.patch            | 44 -------------
 .../{meson_0.47.2.bb => meson_0.49.0.bb}      |  1 +
 ...on_0.47.2.bb => nativesdk-meson_0.49.0.bb} |  0
 10 files changed, 83 insertions(+), 204 deletions(-)
 rename meta/recipes-devtools/meson/meson/{0002-Make-CPU-family-warnings-fatal.patch => 0001-Make-CPU-family-warnings-fatal.patch} (50%)
 rename meta/recipes-devtools/meson/meson/{0001-Support-building-allarch-recipes-again.patch => 0002-Support-building-allarch-recipes-again.patch} (52%)
 delete mode 100644 meta/recipes-devtools/meson/meson/gi-flags.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/gtkdoc-flags.patch
 rename meta/recipes-devtools/meson/{meson_0.47.2.bb => meson_0.49.0.bb} (97%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.47.2.bb => nativesdk-meson_0.49.0.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 61b23914843..ef8c5aefa52 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -9,17 +9,15 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
-           file://gi-flags.patch \
-           file://gtkdoc-flags.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
            "
-SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
-SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
+SRC_URI[sha256sum] = "fb0395c4ac208eab381cd1a20571584bdbba176eb562a7efa9cb17cace0e1551"
+SRC_URI[md5sum] = "3c35b91e8040901034809576d54007c6"
 
 SRC_URI_append_class-native = " \
-    file://0002-Make-CPU-family-warnings-fatal.patch \
-    file://0001-Support-building-allarch-recipes-again.patch \
+    file://0001-Make-CPU-family-warnings-fatal.patch \
+    file://0002-Support-building-allarch-recipes-again.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
diff --git a/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
similarity index 50%
rename from meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
rename to meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index ca56a6a8bff..785c0f027bf 100644
--- a/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,7 +1,7 @@
-From 2e8553fc01e62ebc4faa240bf20984a8a0ac7387 Mon Sep 17 00:00:00 2001
+From d058d0f1d8833d99e8a3d3b9bcc383db23b52671 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
-Subject: [PATCH] Make CPU family warnings fatal
+Subject: [PATCH 1/2] Make CPU family warnings fatal
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
@@ -11,11 +11,11 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index d29a77f..267acf9 100644
+index 2ccd31e..5fcf9df 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -239,9 +239,7 @@ def detect_cpu_family(compilers):
-         return 'x86_64'
+@@ -265,9 +265,7 @@ def detect_cpu_family(compilers):
+     # below.
  
      if trial not in known_cpu_families:
 -        mlog.warning('Unknown CPU family {!r}, please report this at '
@@ -25,12 +25,15 @@ index d29a77f..267acf9 100644
  
      return trial
  
-@@ -1014,7 +1012,7 @@ class CrossBuildInfo:
-                     raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
+@@ -1232,7 +1230,7 @@ class MachineInfo:
  
-                 if entry == 'cpu_family' and res not in known_cpu_families:
--                    mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
-+                    raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % value)
+         cpu_family = literal['cpu_family']
+         if cpu_family not in known_cpu_families:
+-            mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % cpu_family)
++            raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % cpu_family)
  
-                 if self.ok_type(res):
-                     self.config[s][entry] = res
+         endian = literal['endian']
+         if endian not in ('little', 'big'):
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index 7ffd6c54cb0..11fd9ed3acc 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 3ac4e58c5494bd7e603a325b5b5c2b8075849fee Mon Sep 17 00:00:00 2001
+From 1afbf5ccff56e582229c8f673f50aedf2b24117e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:16:41 +0300
 Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
@@ -16,70 +16,21 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- mesonbuild/modules/gnome.py        | 18 +++++++++++++++---
- mesonbuild/scripts/gtkdochelper.py |  9 +++++++--
- 2 files changed, 22 insertions(+), 5 deletions(-)
+ mesonbuild/modules/gnome.py | 4 ++++
+ 1 file changed, 4 insertions(+)
 
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index cb69641..727eb6a 100644
+index bf49770..7c5a363 100644
 --- a/mesonbuild/modules/gnome.py
 +++ b/mesonbuild/modules/gnome.py
-@@ -792,6 +792,10 @@ This will become a hard error in the future.''')
+@@ -972,6 +972,10 @@ This will become a hard error in the future.''')
                  '--mode=' + mode]
          if namespace:
              args.append('--namespace=' + namespace)
 +        gtkdoc_exe_wrapper = state.environment.cross_info.config["properties"].get('gtkdoc_exe_wrapper', None)
 +        if gtkdoc_exe_wrapper is not None:
-+            args.append('--gtkdoc-exe-wrapper=' + gtkdoc_exe_wrapper)
++            args.append('--run=' + gtkdoc_exe_wrapper)
 +
          args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
          args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
          args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
-diff --git a/mesonbuild/scripts/gtkdochelper.py b/mesonbuild/scripts/gtkdochelper.py
-index 948dc5a..9c5bd19 100644
---- a/mesonbuild/scripts/gtkdochelper.py
-+++ b/mesonbuild/scripts/gtkdochelper.py
-@@ -45,6 +45,7 @@ parser.add_argument('--ignore-headers', dest='ignore_headers', default='')
- parser.add_argument('--namespace', dest='namespace', default='')
- parser.add_argument('--mode', dest='mode', default='')
- parser.add_argument('--installdir', dest='install_dir')
-+parser.add_argument('--gtkdoc-exe-wrapper', dest='gtkdoc_exe_wrapper')
- 
- def gtkdoc_run_check(cmd, cwd, library_paths=None):
-     if library_paths is None:
-@@ -64,7 +65,7 @@ def gtkdoc_run_check(cmd, cwd, library_paths=None):
-     # This preserves the order of messages.
-     p, out = Popen_safe(cmd, cwd=cwd, env=env, stderr=subprocess.STDOUT)[0:2]
-     if p.returncode != 0:
--        err_msg = ["{!r} failed with status {:d}".format(cmd[0], p.returncode)]
-+        err_msg = ["{!r} failed with status {:d}".format(cmd, p.returncode)]
-         if out:
-             err_msg.append(out)
-         raise MesonException('\n'.join(err_msg))
-@@ -74,7 +75,7 @@ def gtkdoc_run_check(cmd, cwd, library_paths=None):
- def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
-                  main_file, module,
-                  html_args, scan_args, fixxref_args, mkdb_args,
--                 gobject_typesfile, scanobjs_args, ld, cc, ldflags, cflags,
-+                 gobject_typesfile, scanobjs_args, gtkdoc_exe_wrapper, ld, cc, ldflags, cflags,
-                  html_assets, content_files, ignore_headers, namespace,
-                  expand_content_files, mode):
-     print("Building documentation for %s" % module)
-@@ -135,6 +136,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
-     if gobject_typesfile:
-         scanobjs_cmd = ['gtkdoc-scangobj'] + scanobjs_args + ['--types=' + gobject_typesfile,
-                                                               '--module=' + module,
-+                                                              '--run=' + gtkdoc_exe_wrapper,
-+                                                              '--cc=' + cc,
-+                                                              '--ld=' + ld,
-                                                               '--cflags=' + cflags,
-                                                               '--ldflags=' + ldflags,
-                                                               '--cc=' + cc,
-@@ -238,6 +242,7 @@ def run(args):
-         mkdbargs,
-         options.gobject_typesfile,
-         scanobjsargs,
-+        options.gtkdoc_exe_wrapper,
-         options.ld,
-         options.cc,
-         options.ldflags,
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 60729854045..bf715d1e9f4 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 45426f06689a520fc47f81ee29b49d509f11ba58 Mon Sep 17 00:00:00 2001
+From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -6,38 +6,38 @@ Subject: [PATCH] python module: do not manipulate the environment when calling
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- mesonbuild/modules/python.py | 14 --------------
- 1 file changed, 14 deletions(-)
+ mesonbuild/modules/python.py | 12 ------------
+ 1 file changed, 12 deletions(-)
 
 diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
-index 1195d8a..df81da4 100644
+index 9cfbd6f..3ff687a 100644
 --- a/mesonbuild/modules/python.py
 +++ b/mesonbuild/modules/python.py
-@@ -67,26 +67,12 @@ class PythonDependency(ExternalDependency):
-         if DependencyMethods.PKGCONFIG in self.methods and not python_holder.is_pypy:
-             pkg_version = self.variables.get('LDVERSION') or self.version
-             pkg_libdir = self.variables.get('LIBPC')
--            old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
--            old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
+@@ -75,11 +75,6 @@ class PythonDependency(ExternalDependency):
+                 old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
+                 old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
+ 
+-                os.environ.pop('PKG_CONFIG_PATH', None)
 -
--            os.environ.pop('PKG_CONFIG_PATH', None)
+-                if pkg_libdir:
+-                    os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
 -
--            if pkg_libdir:
--                os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
- 
-             try:
-                 self.pkgdep = PkgConfigDependency('python-{}'.format(pkg_version), environment, kwargs)
-             except Exception:
-                 pass
+                 try:
+                     self.pkgdep = PkgConfigDependency('python-{}'.format(pkg_version), environment, kwargs)
+                     mlog.debug('Found "python-{}" via pkgconfig lookup in LIBPC ({})'.format(pkg_version, pkg_libdir))
+@@ -88,13 +83,6 @@ class PythonDependency(ExternalDependency):
+                     mlog.debug('"python-{}" could not be found in LIBPC ({})'.format(pkg_version, pkg_libdir))
+                     mlog.debug(e)
  
--            if old_pkg_path is not None:
--                os.environ['PKG_CONFIG_PATH'] = old_pkg_path
+-                if old_pkg_path is not None:
+-                    os.environ['PKG_CONFIG_PATH'] = old_pkg_path
 -
--            if old_pkg_libdir is not None:
--                os.environ['PKG_CONFIG_LIBDIR'] = old_pkg_libdir
--            else:
--                os.environ.pop('PKG_CONFIG_LIBDIR', None)
+-                if old_pkg_libdir is not None:
+-                    os.environ['PKG_CONFIG_LIBDIR'] = old_pkg_libdir
+-                else:
+-                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
+             else:
+                 mlog.debug('"python-{}" could not be found in LIBPC ({}), this is likely due to a relocated python installation'.format(pkg_version, pkg_libdir))
  
-         if self.pkgdep and self.pkgdep.found():
-             self.compile_args = self.pkgdep.get_compile_args()
diff --git a/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
similarity index 52%
rename from meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch
rename to meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 96be104a52f..e7ba40701f6 100644
--- a/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,25 +1,29 @@
-From d80d02a3ca6e21fa3d055c88c05234c2eb4db128 Mon Sep 17 00:00:00 2001
+From ffab5c5046da29fc20b074d21f6de46520cee58c Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
-Subject: [PATCH] Support building allarch recipes again
+Subject: [PATCH 2/2] Support building allarch recipes again
 
 This registers "allarch" as a known CPU family.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
 ---
  mesonbuild/environment.py | 1 +
  1 file changed, 1 insertion(+)
 
-Index: meson-0.47.2/mesonbuild/environment.py
-===================================================================
---- meson-0.47.2.orig/mesonbuild/environment.py
-+++ meson-0.47.2/mesonbuild/environment.py
-@@ -75,6 +75,7 @@ from .compilers import (
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 5fcf9df..b4fc0dc 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -72,6 +72,7 @@ from .compilers import (
  build_filename = 'meson.build'
  
  known_cpu_families = (
 +    'allarch',
      'aarch64',
+     'arc',
      'arm',
-     'e2k',
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
index f32267d0c41..61b26bb8838 100644
--- a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
+++ b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
@@ -1,4 +1,4 @@
-From 0b860cb8a22ae876b6088939dbabca216bc29431 Mon Sep 17 00:00:00 2001
+From 9ccaed380780178c4dab3a681f652ac7cd27452d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:18:47 +0300
 Subject: [PATCH] gobject-introspection: determine g-ir-scanner and
@@ -12,28 +12,29 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- mesonbuild/modules/gnome.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ mesonbuild/modules/gnome.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index b29bab9..dc4c401 100644
+index 7c5a363..0002498 100644
 --- a/mesonbuild/modules/gnome.py
 +++ b/mesonbuild/modules/gnome.py
-@@ -393,8 +393,6 @@ class GnomeModule(ExtensionModule):
-             raise MesonException('Gir takes one argument')
+@@ -744,15 +744,15 @@ class GnomeModule(ExtensionModule):
          if kwargs.get('install_dir'):
              raise MesonException('install_dir is not supported with generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
+ 
 -        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
 -        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
-         girtarget = args[0]
-         while hasattr(girtarget, 'held_object'):
-             girtarget = girtarget.held_object
-@@ -405,6 +403,8 @@ class GnomeModule(ExtensionModule):
-                 self.gir_dep = PkgConfigDependency('gobject-introspection-1.0',
-                                                    state.environment,
-                                                    {'native': True})
-+            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
-+            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
-             pkgargs = self.gir_dep.get_compile_args()
-         except Exception:
-             raise MesonException('gobject-introspection dependency was not found, gir cannot be generated.')
+-
+         girtargets = [self._unwrap_gir_target(arg, state) for arg in args]
+ 
+         if len(girtargets) > 1 and any([isinstance(el, build.Executable) for el in girtargets]):
+             raise MesonException('generate_gir only accepts a single argument when one of the arguments is an executable')
+ 
+         self.gir_dep, pkgargs = self._get_gir_dep(state)
++        giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
++        gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
++
+ 
+         ns = kwargs.pop('namespace')
+         nsversion = kwargs.pop('nsversion')
diff --git a/meta/recipes-devtools/meson/meson/gi-flags.patch b/meta/recipes-devtools/meson/meson/gi-flags.patch
deleted file mode 100644
index 9a4c2961911..00000000000
--- a/meta/recipes-devtools/meson/meson/gi-flags.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Pass the correct cflags/ldflags to the gobject-introspection tools.
-
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/4261]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index cb69641e..bb4449a0 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -579,7 +579,10 @@ class GnomeModule(ExtensionModule):
-         external_ldflags += list(dep_external_ldflags)
-         scan_command += ['--cflags-begin']
-         scan_command += cflags
--        scan_command += state.environment.coredata.get_external_args(lang)
-+        if state.environment.is_cross_build():
-+            scan_command += state.environment.cross_info.config["properties"].get(lang + '_args', "")
-+        else:
-+            scan_command += state.environment.coredata.get_external_args(lang)
-         scan_command += ['--cflags-end']
-         # need to put our output directory first as we need to use the
-         # generated libraries instead of any possibly installed system/prefix
-@@ -614,7 +614,12 @@ class GnomeModule(ExtensionModule):
-                 scan_command.append('-L' + d)
-             scan_command += ['--library', libname]
- 
--        for link_arg in state.environment.coredata.get_external_link_args(lang):
-+        if state.environment.is_cross_build():
-+            link_args = state.environment.cross_info.config["properties"].get(lang + '_link_args', "")
-+        else:
-+            link_args = state.environment.coredata.get_external_link_args(lang)
-+
-+        for link_arg in link_args:
-             if link_arg.startswith('-L'):
-                 scan_command.append(link_arg)
-         scan_command += list(external_ldflags)
diff --git a/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch b/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch
deleted file mode 100644
index ecf3489bbe5..00000000000
--- a/meta/recipes-devtools/meson/meson/gtkdoc-flags.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Ensure that in a cross compile only the target flags are passed to gtk-doc, and
-not the native flags.
-
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/4261]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 4af33304..8751f53c 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -851,17 +851,30 @@ This will become a hard error in the future.''')
-             if not isinstance(incd.held_object, (str, build.IncludeDirs)):
-                 raise MesonException(
-                     'Gir include dirs should be include_directories().')
-+
-         cflags.update(get_include_args(inc_dirs))
--        cflags.update(state.environment.coredata.get_external_args('c'))
-+        if state.environment.is_cross_build():
-+            cflags.update(state.environment.cross_info.config["properties"].get('c_args', ""))
-+        else:
-+            cflags.update(state.environment.coredata.get_external_args('c'))
-+
-         ldflags = OrderedSet()
-         ldflags.update(internal_ldflags)
--        ldflags.update(state.environment.coredata.get_external_link_args('c'))
-+        if state.environment.is_cross_build():
-+            ldflags.update(state.environment.cross_info.config["properties"].get('c_link_args', ""))
-+        else:
-+            ldflags.update(state.environment.coredata.get_external_link_args('c'))
-         ldflags.update(external_ldflags)
-+
-         if cflags:
-             args += ['--cflags=%s' % ' '.join(cflags)]
-         if ldflags:
-             args += ['--ldflags=%s' % ' '.join(ldflags)]
--        compiler = state.environment.coredata.compilers.get('c')
-+
-+        if state.environment.is_cross_build():
-+            compiler = state.environment.coredata.cross_compilers.get('c')
-+        else:
-+            compiler = state.environment.coredata.compilers.get('c')
-         if compiler:
-             args += ['--cc=%s' % ' '.join(compiler.get_exelist())]
-             args += ['--ld=%s' % ' '.join(compiler.get_linker_exelist())]
diff --git a/meta/recipes-devtools/meson/meson_0.47.2.bb b/meta/recipes-devtools/meson/meson_0.49.0.bb
similarity index 97%
rename from meta/recipes-devtools/meson/meson_0.47.2.bb
rename to meta/recipes-devtools/meson/meson_0.49.0.bb
index 897fa148d94..de9b905c12b 100644
--- a/meta/recipes-devtools/meson/meson_0.47.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.49.0.bb
@@ -1,3 +1,4 @@
 include meson.inc
 
 BBCLASSEXTEND = "native"
+
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.47.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.47.2.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.49.0.bb
-- 
2.17.1


