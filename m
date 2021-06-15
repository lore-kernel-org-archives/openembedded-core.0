Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.6323.1623744775514885921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dWGcCwPT;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id w21so49823019edv.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tVp/yqoXZQX7nN4UjGlP39jqs2OZrlmR1PVp5sdsJ08=;
        b=dWGcCwPT45mDPWNGspaaWEk3xpFkKzE8rpLhfaEOEuD+onz4TO1j0KMkSSVIaAhMJt
         cb82GMO8x5FUO/BgWx5GBE+zgQ8AD8sRivdwW9War+bsf6I6b4dypEFa0mPIFdKqBVrt
         AnibOBGWJgfEX23XbNjziBBxAShb2YBPfdHPr5y//MqfTk9aTAHV4NWPasYniKqLAsss
         WEkm8WLrSIFS5DXBCxBizIqkL7GSazoGshwQCcAnSxDCI2955oPfKIyxJd6GDOrgQvev
         MRdxtfAhhYEOt9X92wgxs+CQhHAs2sTCNli3k8FBLHaPf37zP3Ypk4XZQVhx8Vcqvm1z
         h3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tVp/yqoXZQX7nN4UjGlP39jqs2OZrlmR1PVp5sdsJ08=;
        b=gNnh74S/hFHBYHRzC0GrPWFh452LhopK3UjfMxTAhFYyaIWdCszaBMwgHklUtb/iqQ
         6Kd82rVFsEGDS9F/ER4EWR5/rrXOnxNnP6QisAxrK109u2/mOR8PM7FneDKkhTlVhWM8
         8Dzl4OAUtEBSNiSXh+EmbBlduwYWk6cwUBhW41uSfuJYO7gQD6Qs3lv5asVQkOcl2QeK
         rBqEqyazCxMlhZrSUQEubna/FZlJ6G8b+MYhq1Sv+hv3MDWj0xWsnSzj/HWS85cH9SG6
         JrUBxWNDwaMn7GgEYpS//wE6QbV90XdRavoJWC9Cq0+N2PZIv+2KgmNH+Wv4hdLYhyPX
         3JVg==
X-Gm-Message-State: AOAM532XlPMTUWA0J4thzQrDU1QegRdYGlZkt+FSuW4F9aOUzclhpmd5
	+bTUK5hfg7LARmXXGVAwT5on84hzpvGM9w==
X-Google-Smtp-Source: ABdhPJx98hdbJiIqRbCnVsBBYOQLFwq2p+PHol8bFWlFh4oQWYlZTNrI1A056QBqf3kOYOwpAmubwg==
X-Received: by 2002:aa7:c7cd:: with SMTP id o13mr21933037eds.269.1623744774032;
        Tue, 15 Jun 2021 01:12:54 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:53 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/31] meson: upgrade 0.58.0 -> 0.58.1
Date: Tue, 15 Jun 2021 10:12:22 +0200
Message-Id: <20210615081240.1734087-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |   3 +-
 ...2c19e693a69b0650ce6c8a8903163c959996.patch | 412 ------------------
 .../{meson_0.58.0.bb => meson_0.58.1.bb}      |   0
 ...on_0.58.0.bb => nativesdk-meson_0.58.1.bb} |   0
 4 files changed, 1 insertion(+), 414 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
 rename meta/recipes-devtools/meson/{meson_0.58.0.bb => meson_0.58.1.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.58.0.bb => nativesdk-meson_0.58.1.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index f60381453b..7ddfccf2d6 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,9 +16,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://gi-target-dep.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
-           file://4e312c19e693a69b0650ce6c8a8903163c959996.patch \
            "
-SRC_URI[sha256sum] = "f4820df0bc969c99019fd4af8ca5f136ee94c63d8a5ad67e7eb73bdbc9182fdd"
+SRC_URI[sha256sum] = "3144a3da662fcf79f1e5602fa929f2821cba4eba28c2c923fe0a7d3e3db04d5d"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch b/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
deleted file mode 100644
index 76daf019b0..0000000000
--- a/meta/recipes-devtools/meson/meson/4e312c19e693a69b0650ce6c8a8903163c959996.patch
+++ /dev/null
@@ -1,412 +0,0 @@
-From 4e312c19e693a69b0650ce6c8a8903163c959996 Mon Sep 17 00:00:00 2001
-From: Xavier Claessens <xavier.claessens@collabora.com>
-Date: Tue, 11 May 2021 09:18:47 -0400
-Subject: [PATCH] gnome: Fix gtkdoc generation
-
-install_scripts used to replace @BUILD_ROOT@ and @SOURCE_ROOT@ but it
-was not documented and got removed in Meson 0.58.0. gnome.gtkdoc() was
-relying on that behaviour, but it has always been broken in the case the
-source or build directory contains spaces.
-
-Fix this by changing get_include_args() to substitue paths directly
-which will then get escaped correctly.
-
-Add a unit test that builds GObject documentation which is where this
-issue has been spotted.
-
-Fixes: #8744
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- mesonbuild/modules/__init__.py                | 54 +++++++++----------
- mesonbuild/modules/gnome.py                   | 15 +++---
- mesonbuild/modules/hotdoc.py                  |  3 +-
- mesonbuild/modules/qt.py                      |  4 +-
- mesonbuild/modules/windows.py                 |  5 +-
- .../10 gtk-doc/doc/foobar1/foobar-docs.sgml   |  2 +-
- .../doc/foobar1/foobar-sections.txt           | 16 ++++++
- .../10 gtk-doc/doc/foobar1/foobar.types       |  4 ++
- .../10 gtk-doc/doc/foobar1/meson.build        |  6 ++-
- test cases/frameworks/10 gtk-doc/foo.c        | 30 +++++++++++
- .../frameworks/10 gtk-doc/include/foo.h       | 18 +++++++
- test cases/frameworks/10 gtk-doc/meson.build  | 12 +++++
- test cases/frameworks/10 gtk-doc/test.json    |  4 +-
- 13 files changed, 127 insertions(+), 46 deletions(-)
- create mode 100644 test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt
- create mode 100644 test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types
- create mode 100644 test cases/frameworks/10 gtk-doc/foo.c
-
-diff --git a/mesonbuild/modules/__init__.py b/mesonbuild/modules/__init__.py
-index ddb5e3e6cf3..c0970294c34 100644
---- a/mesonbuild/modules/__init__.py
-+++ b/mesonbuild/modules/__init__.py
-@@ -56,6 +56,33 @@ def __init__(self, interpreter: 'Interpreter') -> None:
-         self.target_machine = interpreter.builtin['target_machine'].held_object
-         self.current_node = interpreter.current_node
- 
-+    def get_include_args(self, include_dirs, prefix='-I'):
-+        if not include_dirs:
-+            return []
-+
-+        srcdir = self.environment.get_source_dir()
-+        builddir = self.environment.get_build_dir()
-+
-+        dirs_str = []
-+        for dirs in unholder(include_dirs):
-+            if isinstance(dirs, str):
-+                dirs_str += [f'{prefix}{dirs}']
-+                continue
-+
-+            # Should be build.IncludeDirs object.
-+            basedir = dirs.get_curdir()
-+            for d in dirs.get_incdirs():
-+                expdir = os.path.join(basedir, d)
-+                srctreedir = os.path.join(srcdir, expdir)
-+                buildtreedir = os.path.join(builddir, expdir)
-+                dirs_str += [f'{prefix}{buildtreedir}',
-+                             f'{prefix}{srctreedir}']
-+            for d in dirs.get_extra_build_dirs():
-+                dirs_str += [f'{prefix}{d}']
-+
-+        return dirs_str
-+
-+
- class ModuleObject:
-     """Base class for all objects returned by modules
-     """
-@@ -71,33 +98,6 @@ def __init__(self, interpreter: T.Optional['Interpreter'] = None) -> None:
- class ExtensionModule(ModuleObject):
-     pass
- 
--def get_include_args(include_dirs, prefix='-I'):
--    '''
--    Expand include arguments to refer to the source and build dirs
--    by using @SOURCE_ROOT@ and @BUILD_ROOT@ for later substitution
--    '''
--    if not include_dirs:
--        return []
--
--    dirs_str = []
--    for dirs in unholder(include_dirs):
--        if isinstance(dirs, str):
--            dirs_str += [f'{prefix}{dirs}']
--            continue
--
--        # Should be build.IncludeDirs object.
--        basedir = dirs.get_curdir()
--        for d in dirs.get_incdirs():
--            expdir = os.path.join(basedir, d)
--            srctreedir = os.path.join('@SOURCE_ROOT@', expdir)
--            buildtreedir = os.path.join('@BUILD_ROOT@', expdir)
--            dirs_str += [f'{prefix}{buildtreedir}',
--                         f'{prefix}{srctreedir}']
--        for d in dirs.get_extra_build_dirs():
--            dirs_str += [f'{prefix}{d}']
--
--    return dirs_str
--
- def is_module_library(fname):
-     '''
-     Check if the file is a library-like file generated by a module-specific
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index d0b053d4f76..c91cda66f8b 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -26,7 +26,6 @@
- from .. import mesonlib
- from .. import interpreter
- from . import GResourceTarget, GResourceHeaderTarget, GirTarget, TypelibTarget, VapiTarget
--from . import get_include_args
- from . import ExtensionModule
- from . import ModuleReturnValue
- from ..mesonlib import (
-@@ -394,7 +393,7 @@ def _get_dependencies_flags(self, deps, state, depends, include_rpath=False,
-                     gi_includes.update([girdir])
-             if isinstance(dep, InternalDependency):
-                 cflags.update(dep.get_compile_args())
--                cflags.update(get_include_args(dep.include_directories))
-+                cflags.update(state.get_include_args(dep.include_directories))
-                 for lib in unholder(dep.libraries):
-                     if isinstance(lib, build.SharedLibrary):
-                         internal_ldflags.update(self._get_link_args(state, lib, depends, include_rpath))
-@@ -443,7 +442,7 @@ def _get_dependencies_flags(self, deps, state, depends, include_rpath=False,
-                     else:
-                         external_ldflags.update([lib])
-             elif isinstance(dep, (build.StaticLibrary, build.SharedLibrary)):
--                cflags.update(get_include_args(dep.get_include_dirs()))
-+                cflags.update(state.get_include_args(dep.get_include_dirs()))
-                 depends.append(dep)
-             else:
-                 mlog.log(f'dependency {dep!r} not handled to build gir files')
-@@ -853,7 +852,7 @@ def generate_gir(self, state, args, kwargs):
-         scan_command += self._scan_header(kwargs)
-         scan_command += self._scan_extra_args(kwargs)
-         scan_command += ['-I' + srcdir, '-I' + builddir]
--        scan_command += get_include_args(girtargets_inc_dirs)
-+        scan_command += state.get_include_args(girtargets_inc_dirs)
-         scan_command += ['--filelist=' + self._make_gir_filelist(state, srcdir, ns, nsversion, girtargets, libsources)]
-         scan_command += self._scan_link_withs(state, depends, kwargs)
-         scan_command += self._scan_include(state, depends, gir_inc_dirs, kwargs)
-@@ -863,8 +862,8 @@ def generate_gir(self, state, args, kwargs):
-         scan_command += ['--cflags-begin']
-         scan_command += cflags
-         scan_command += ['--cflags-end']
--        scan_command += get_include_args(inc_dirs)
--        scan_command += get_include_args(list(gi_includes) + gir_inc_dirs + inc_dirs, prefix='--add-include-path=')
-+        scan_command += state.get_include_args(inc_dirs)
-+        scan_command += state.get_include_args(list(gi_includes) + gir_inc_dirs + inc_dirs, prefix='--add-include-path=')
-         scan_command += list(internal_ldflags)
-         scan_command += self._scan_gir_targets(state, girtargets)
-         scan_command += self._scan_langs(state, [lc[0] for lc in langs_compilers])
-@@ -886,7 +885,7 @@ def generate_gir(self, state, args, kwargs):
- 
-         typelib_output = f'{ns}-{nsversion}.typelib'
-         typelib_cmd = [gicompiler, scan_target, '--output', '@OUTPUT@']
--        typelib_cmd += get_include_args(gir_inc_dirs, prefix='--includedir=')
-+        typelib_cmd += state.get_include_args(gir_inc_dirs, prefix='--includedir=')
- 
-         for incdir in typelib_includes:
-             typelib_cmd += ["--includedir=" + incdir]
-@@ -1127,7 +1126,7 @@ def _get_build_args(self, kwargs, state, depends):
-                     'Gir include dirs should be include_directories().')
- 
-         cflags.extend(deps_cflags)
--        cflags.extend(get_include_args(inc_dirs))
-+        cflags.extend(state.get_include_args(inc_dirs))
-         ldflags = []
-         ldflags.extend(internal_ldflags)
-         ldflags.extend(external_ldflags)
-diff --git a/mesonbuild/modules/hotdoc.py b/mesonbuild/modules/hotdoc.py
-index bf8cd229c0d..89a5d938ea7 100644
---- a/mesonbuild/modules/hotdoc.py
-+++ b/mesonbuild/modules/hotdoc.py
-@@ -22,7 +22,6 @@
- from mesonbuild.coredata import MesonException
- from . import ModuleReturnValue
- from . import ExtensionModule
--from . import get_include_args
- from ..dependencies import Dependency, InternalDependency
- from ..interpreterbase import FeatureNew, InvalidArguments, noPosargs, noKwargs
- from ..interpreter import CustomTargetHolder
-@@ -191,7 +190,7 @@ def process_dependencies(self, deps):
-         for dep in mesonlib.listify(ensure_list(deps)):
-             dep = getattr(dep, "held_object", dep)
-             if isinstance(dep, InternalDependency):
--                inc_args = get_include_args(dep.include_directories)
-+                inc_args = self.state.get_include_args(dep.include_directories)
-                 cflags.update([self.replace_dirs_in_string(x)
-                                for x in inc_args])
-                 cflags.update(self.process_dependencies(dep.libraries))
-diff --git a/mesonbuild/modules/qt.py b/mesonbuild/modules/qt.py
-index b7389bd59af..1bf0099d1df 100644
---- a/mesonbuild/modules/qt.py
-+++ b/mesonbuild/modules/qt.py
-@@ -23,7 +23,7 @@
- from ..mesonlib import MesonException, extract_as_list, File, unholder, version_compare
- from ..dependencies import Dependency
- import xml.etree.ElementTree as ET
--from . import ModuleReturnValue, get_include_args, ExtensionModule
-+from . import ModuleReturnValue, ExtensionModule
- from ..interpreterbase import noPosargs, permittedKwargs, FeatureNew, FeatureNewKwargs
- from ..interpreter import extract_required_kwarg
- from ..programs import NonExistingExternalProgram
-@@ -239,7 +239,7 @@ def preprocess(self, state, args, kwargs):
-             ui_gen = build.Generator([self.uic], ui_kwargs)
-             ui_output = ui_gen.process_files(f'Qt{self.qt_version} ui', ui_files, state)
-             sources.append(ui_output)
--        inc = get_include_args(include_dirs=include_directories)
-+        inc = state.get_include_args(include_dirs=include_directories)
-         compile_args = []
-         for dep in unholder(dependencies):
-             if isinstance(dep, Dependency):
-diff --git a/mesonbuild/modules/windows.py b/mesonbuild/modules/windows.py
-index d7a86380885..c4fdc196681 100644
---- a/mesonbuild/modules/windows.py
-+++ b/mesonbuild/modules/windows.py
-@@ -19,7 +19,6 @@
- from .. import mlog
- from .. import mesonlib, build
- from ..mesonlib import MachineChoice, MesonException, extract_as_list, unholder
--from . import get_include_args
- from . import ModuleReturnValue
- from . import ExtensionModule
- from ..interpreter import CustomTargetHolder
-@@ -83,12 +82,12 @@ def compile_resources(self, state, args, kwargs):
-         wrc_depends = extract_as_list(kwargs, 'depends', pop = True)
-         for d in wrc_depends:
-             if isinstance(d, CustomTargetHolder):
--                extra_args += get_include_args([d.outdir_include()])
-+                extra_args += state.get_include_args([d.outdir_include()])
-         inc_dirs = extract_as_list(kwargs, 'include_directories', pop = True)
-         for incd in inc_dirs:
-             if not isinstance(incd.held_object, (str, build.IncludeDirs)):
-                 raise MesonException('Resource include dirs should be include_directories().')
--        extra_args += get_include_args(inc_dirs)
-+        extra_args += state.get_include_args(inc_dirs)
- 
-         rescomp, rescomp_type = self._find_resource_compiler(state)
-         if rescomp_type == ResourceCompilerType.rc:
-diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml
-index 95f73efdf45..6ccd087dc18 100644
---- a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml	
-+++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-docs.sgml	
-@@ -35,7 +35,7 @@
-     </partintro>
-     <xi:include href="xml/foo.xml"/>
-     <xi:include href="../../include/bar.xml"/>
--    <xi:include href="xml/foo-version.xml"/>
-+    <xi:include href="xml/version.xml"/>
-   </reference>
- 
- </book>
-diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt
-new file mode 100644
-index 00000000000..d14c8dab010
---- /dev/null
-+++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar-sections.txt	
-@@ -0,0 +1,16 @@
-+<SECTION>
-+<FILE>foo</FILE>
-+<TITLE>FooObj</TITLE>
-+FooObj
-+FooObjClass
-+foo_do_something
-+</SECTION>
-+
-+<SECTION>
-+<FILE>version</FILE>
-+<TITLE>version</TITLE>
-+FOO_MAJOR_VERSION
-+FOO_MINOR_VERSION
-+FOO_MICRO_VERSION
-+</SECTION>
-+
-diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types
-new file mode 100644
-index 00000000000..0a9c046f3ed
---- /dev/null
-+++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/foobar.types	
-@@ -0,0 +1,4 @@
-+% This include is useless it's a regression test for https://github.com/mesonbuild/meson/issues/8744
-+#include <foo.h>
-+
-+foo_obj_get_type
-diff --git a/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build b/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build
-index 149c6e956aa..f4b3724dbae 100644
---- a/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build	
-+++ b/test cases/frameworks/10 gtk-doc/doc/foobar1/meson.build	
-@@ -1,5 +1,9 @@
- gnome.gtkdoc('foobar',
--  src_dir : inc,
-+  src_dir : [inc, '.'],
-   main_sgml : 'foobar-docs.sgml',
-   content_files : [docbook, version_xml],
-+  dependencies: foo_dep,
-+  # Manually written types file for regression test:
-+  # https://github.com/mesonbuild/meson/issues/8744
-+  gobject_typesfile: 'foobar.types',
-   install : true)
-diff --git a/test cases/frameworks/10 gtk-doc/foo.c b/test cases/frameworks/10 gtk-doc/foo.c
-new file mode 100644
-index 00000000000..36c0639ec08
---- /dev/null
-+++ b/test cases/frameworks/10 gtk-doc/foo.c	
-@@ -0,0 +1,30 @@
-+#include <foo.h>
-+
-+
-+struct _FooObj {
-+  GObject parent;
-+  int dummy;
-+};
-+
-+G_DEFINE_TYPE(FooObj, foo_obj, G_TYPE_OBJECT)
-+
-+static void foo_obj_init (FooObj *self)
-+{
-+}
-+
-+static void foo_obj_class_init (FooObjClass *klass)
-+{
-+}
-+
-+/**
-+ * foo_do_something:
-+ * @self: self
-+ *
-+ * Useless function.
-+ *
-+ * Returns: 0.
-+ */
-+int foo_do_something(FooObj *self)
-+{
-+  return 0;
-+}
-diff --git a/test cases/frameworks/10 gtk-doc/include/foo.h b/test cases/frameworks/10 gtk-doc/include/foo.h
-index 7b8946b6a86..510f3d1ecb5 100644
---- a/test cases/frameworks/10 gtk-doc/include/foo.h	
-+++ b/test cases/frameworks/10 gtk-doc/include/foo.h	
-@@ -1,5 +1,7 @@
- #pragma once
- 
-+#include <glib-object.h>
-+
- /**
-  * FooIndecision:
-  * @FOO_MAYBE:     Something maybe
-@@ -13,3 +15,19 @@ typedef enum {
-     FOO_POSSIBLY,
- } FooIndecision;
- 
-+/**
-+ * FooObjClass:
-+ *
-+ * The class
-+ */
-+
-+/**
-+ * FooObj:
-+ *
-+ * The instance
-+ */
-+
-+#define FOO_TYPE_OBJ foo_obj_get_type()
-+G_DECLARE_FINAL_TYPE(FooObj, foo_obj, FOO, OBJ, GObject)
-+
-+int foo_do_something(FooObj *self);
-diff --git a/test cases/frameworks/10 gtk-doc/meson.build b/test cases/frameworks/10 gtk-doc/meson.build
-index 5c22ad0afa4..292980fafa7 100644
---- a/test cases/frameworks/10 gtk-doc/meson.build	
-+++ b/test cases/frameworks/10 gtk-doc/meson.build	
-@@ -24,4 +24,16 @@ if gtkdoc_ver.version_compare('<1.26')
-   error('MESON_SKIP_TEST gtk-doc test requires gtkdoc >= 1.26.')
- endif
- 
-+gobject = dependency('gobject-2.0')
-+
-+libfoo = library('foo', 'foo.c',
-+  include_directories: inc,
-+  dependencies: gobject,
-+)
-+
-+foo_dep = declare_dependency(
-+  link_with: libfoo,
-+  include_directories: inc,
-+)
-+
- subdir('doc')
-diff --git a/test cases/frameworks/10 gtk-doc/test.json b/test cases/frameworks/10 gtk-doc/test.json
-index c44126cc741..03ad0595817 100644
---- a/test cases/frameworks/10 gtk-doc/test.json	
-+++ b/test cases/frameworks/10 gtk-doc/test.json	
-@@ -4,8 +4,8 @@
-     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/BAR.html"},
-     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foobar.devhelp2"},
-     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foobar.html"},
--    {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foobar-foo.html"},
--    {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foobar-foo-version.html"},
-+    {"type": "file", "file": "usr/share/gtk-doc/html/foobar/FooObj.html"},
-+    {"type": "file", "file": "usr/share/gtk-doc/html/foobar/foo-version.html"},
-     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/home.png"},
-     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/index.html"},
-     {"type": "file", "file": "usr/share/gtk-doc/html/foobar/left.png"},
diff --git a/meta/recipes-devtools/meson/meson_0.58.0.bb b/meta/recipes-devtools/meson/meson_0.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.58.0.bb
rename to meta/recipes-devtools/meson/meson_0.58.1.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.58.1.bb
-- 
2.31.1

