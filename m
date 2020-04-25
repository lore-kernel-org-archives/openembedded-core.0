Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.358.1587835716971017542
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSufiQqW;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j2so15423883wrs.9
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RUgfA7Wn/M85+S+53cWhuAnGGAO+F6cC/TMShCtcclg=;
        b=HSufiQqWXwVPUnNUk4zxqy27s2EzsooRl95yc7/XwWPaHRfjoW29ye2KZ4CzNmSF1Q
         R/YwZtcKOgeSBmvpmg9rTLC6vqzb8fDHNbuW/89sVyTEoIZR1tcxwRlxJYNoiJMI9UzC
         sRJjBwOAugEW5WAB3V9gM/Pq3556KQ3I+STjdWkLqiMhfyxyCJkWMlC4QXibAWdjvSZE
         2rH4FOJAnc7NxfgkZhHh1P1hG3ggK0UHoZrf1gE4xOAca1dryC4Caw5u9Ou+mDqs2RXN
         mziJ000r2RJ4rb4Xjfr5BmzWw0ojcFPS+zXP4yfXzetUDFsPddDpOGtne3stoTXSq+Ov
         QODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RUgfA7Wn/M85+S+53cWhuAnGGAO+F6cC/TMShCtcclg=;
        b=lH/f3ndov4GulvOZP37b2GPzJzC1R5uJwZBnndRox7Ojp0fOn00Ux6Y3NCdIMjysnr
         S9c9HfpXo7nIWnO2F8+xrxrJdGzQ4pbgZ9ohoTTGXz2v2T/Ce1uzcYYru2BWMrroDMg2
         SrAJfj7MSK3fhe24xn6n+9lIK8n2v3JMzGOVfYpJnDhyQGsBo4zju0nHnGM7GHSQJzvY
         oat0qKc4ogFnTuOvhcVtbxP3mDJsBvpmtqBI9W3zDw/e8HXQSkhygQ2k97jE/GrUiz0k
         DY4r6X5SMAFmWsTJ0gk9/3pdrxSVdhFrRwkjBivgxmkuttjRdNj0RKlIsmo6akriwUZv
         8XyQ==
X-Gm-Message-State: AGi0PuZP8LnLItiW9i/NceYdgcNK6vgc1oq0PoAgR9kaNYXNT7xEC1dy
	pv6przrYJYV4v5mXa5ZL4Q+DGtva
X-Google-Smtp-Source: APiQypKIK4AVCC7m79T8KSbo4cSUyCMwnq4N+kiLrlETMkCOeTP1jcRkyTwie7Eq7p7RWDy+aZLLKg==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr19079225wrj.372.1587835714729;
        Sat, 25 Apr 2020 10:28:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/15] gobject-introspection: update to 1.64.1
Date: Sat, 25 Apr 2020 19:28:08 +0200
Message-Id: <20200425172814.27370-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All the cross-support patches are finally merged upstream;
the maintainer also changed the option naming to his preference, so
the recipe is adjusted.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Fix-build-reproducibility.patch      |  50 ------
 ...t-cross-compilation-support-to-meson.patch | 163 ------------------
 ...pository-directory-for-native-builds.patch |   8 +-
 ...scanner-add-a-lib-dirs-envvar-option.patch |  70 --------
 ...d-disable-tests-when-cross-compiling.patch |  26 ---
 ...canner-add-use-binary-wrapper-option.patch |  49 ------
 ...scanner-add-a-use-ldd-wrapper-option.patch |  45 -----
 ...g-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch |  39 -----
 ...2.0.bb => gobject-introspection_1.64.1.bb} |  23 +--
 9 files changed, 12 insertions(+), 461 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Fix-build-reproducibility.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable-tests-when-cross-compiling.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.62.0.bb => gobject-introspection_1.64.1.bb} (89%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Fix-build-reproducibility.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Fix-build-reproducibility.patch
deleted file mode 100644
index 9e1f79e881..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Fix-build-reproducibility.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 59d2cbb54c012b25adeb965a94b6585d911a4539 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Wed, 20 Nov 2019 09:03:47 -0600
-Subject: [PATCH] Fix build reproducibility
-
-ba744068 ("Make meson.override_find_program working on more complex use
-cases") made the build no longer reproducible by encoding a build system
-path into the output. This shouldn't be necessary anyway, since it
-should be possible to add new paths to search for gir files by setting
-the XDG_DATA_DIR environment variable.
-
-Closes #318
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-introspection/merge_requests/192]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- girepository/girparser.c | 4 ----
- meson.build              | 1 -
- 2 files changed, 5 deletions(-)
-
-diff --git a/girepository/girparser.c b/girepository/girparser.c
-index fb47e75c..53450baf 100644
---- a/girepository/girparser.c
-+++ b/girepository/girparser.c
-@@ -309,10 +309,6 @@ locate_gir (GIrParser  *parser,
-   if (g_file_test (path, G_FILE_TEST_EXISTS | G_FILE_TEST_IS_REGULAR))
-     return path;
-   g_free (path);
--  path = g_build_filename (UNINSTALLED_GIR_DIR, girname, NULL);
--  if (g_file_test (path, G_FILE_TEST_EXISTS | G_FILE_TEST_IS_REGULAR))
--    return path;
--  g_free (path);
-   return NULL;
- }
- 
-diff --git a/meson.build b/meson.build
-index d6231c5f..2f248579 100644
---- a/meson.build
-+++ b/meson.build
-@@ -90,7 +90,6 @@ endif
- girdir = join_paths(gir_dir_prefix, 'gir-1.0')
- config.set_quoted('GIR_DIR', girdir)
- config.set_quoted('GOBJECT_INTROSPECTION_LIBDIR', join_paths(get_option('prefix'), get_option('libdir')))
--config.set_quoted('UNINSTALLED_GIR_DIR', join_paths(meson.current_build_dir(), 'gir'))
- 
- foreach type : ['char', 'short', 'int', 'long']
-   size = cc.sizeof(type)
--- 
-2.23.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
deleted file mode 100644
index 639f9c8f61..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Port-cross-compilation-support-to-meson.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 0417a1bb08745f2bf5310d20b342c2b3b9b212d3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 15 Nov 2018 15:10:05 +0100
-Subject: [PATCH] Port cross-compilation support to meson
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gir/meson.build   | 62 ++++++++++++++++++++++++++++++++++-------------
- meson.build       |  4 ++-
- meson_options.txt | 20 +++++++++++++++
- 3 files changed, 68 insertions(+), 18 deletions(-)
-
-diff --git a/gir/meson.build b/gir/meson.build
-index c312100..a028033 100644
---- a/gir/meson.build
-+++ b/gir/meson.build
-@@ -41,16 +41,29 @@ gir_files = [
- typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
- install_data(gir_files, install_dir: girdir)
- 
--scanner_command = [
--  python,
--  girscanner,
--  '--output=@OUTPUT@',
--  '--no-libtool',
--  '--quiet',
--  '--reparse-validate',
--  '--add-include-path', join_paths(meson.current_build_dir()),
--  '--add-include-path', join_paths(meson.current_source_dir()),
--]
-+if get_option('enable-host-gi')
-+    scanner_command = [
-+      'g-ir-scanner',
-+      '--output=@OUTPUT@',
-+      '--no-libtool',
-+      '--quiet',
-+      '--reparse-validate',
-+      '--add-include-path', join_paths(meson.current_build_dir()),
-+      '--add-include-path', join_paths(meson.current_source_dir()),
-+    ]
-+else
-+    scanner_command = [
-+      python,
-+      girscanner,
-+      '--output=@OUTPUT@',
-+      '--no-libtool',
-+      '--quiet',
-+      '--reparse-validate',
-+      '--add-include-path', join_paths(meson.current_build_dir()),
-+      '--add-include-path', join_paths(meson.current_source_dir()),
-+    ]
-+endif
-+
- 
- dep_type = glib_dep.type_name()
- if dep_type == 'internal'
-@@ -63,6 +76,12 @@ if dep_type == 'internal'
-                       '--extra-library=glib-2.0', '--extra-library=gobject-2.0']
- endif
- 
-+if get_option('enable-gi-cross-wrapper') != ''
-+  scanner_command += ['--use-binary-wrapper=' + get_option('enable-gi-cross-wrapper')]
-+endif
-+if get_option('enable-gi-ldd-wrapper') != ''
-+  scanner_command += ['--use-ldd-wrapper=' + get_option('enable-gi-ldd-wrapper')]
-+endif
- # Take a glob and print to newlines
- globber = '''
- from glob import glob
-@@ -89,8 +108,8 @@ glib_command = scanner_command + [
- 
- if dep_type == 'pkgconfig'
-   glib_command += ['--external-library', '--pkg=glib-2.0']
--  glib_libdir = glib_dep.get_pkgconfig_variable('libdir')
--  glib_incdir = join_paths(glib_dep.get_pkgconfig_variable('includedir'), 'glib-2.0')
-+  glib_libdir = get_option('pkgconfig-sysroot-path') + glib_dep.get_pkgconfig_variable('libdir')
-+  glib_incdir = get_option('pkgconfig-sysroot-path') + join_paths(glib_dep.get_pkgconfig_variable('includedir'), 'glib-2.0')
-   glib_libincdir = join_paths(glib_libdir, 'glib-2.0', 'include')
-   glib_files += join_paths(glib_incdir, 'gobject', 'glib-types.h')
-   glib_files += join_paths(glib_libincdir, 'glibconfig.h')
-@@ -345,7 +364,7 @@ if giounix_dep.found()
-   dep_type = giounix_dep.type_name()
-   if dep_type == 'pkgconfig'
-     gio_command += ['--pkg=gio-unix-2.0']
--    giounix_includedir = join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
-+    giounix_includedir = get_option('pkgconfig-sysroot-path') + join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
-     # Get the installed gio-unix header list
-     ret = run_command(python, '-c', globber.format(join_paths(giounix_includedir, 'gio', '*.h')))
-     if ret.returncode() != 0
-@@ -428,15 +447,24 @@ gir_files += custom_target('gir-girepository',
- )
- 
- typelibs = []
-+if get_option('enable-gi-cross-wrapper') != ''
-+    gircompiler_command = [get_option('enable-gi-cross-wrapper'), gircompiler.full_path(), '-o', '@OUTPUT@', '@INPUT@',
-+              '--includedir', meson.current_build_dir(),
-+              '--includedir', meson.current_source_dir(),
-+    ]
-+else
-+    gircompiler_command = [gircompiler, '-o', '@OUTPUT@', '@INPUT@',
-+              '--includedir', meson.current_build_dir(),
-+              '--includedir', meson.current_source_dir(),
-+    ]
-+endif
-+
- foreach gir : gir_files
-   typelibs += custom_target('generate-typelib-@0@'.format(gir).underscorify(),
-     input: gir,
-     output: '@BASENAME@.typelib',
-     depends: [gobject_gir, ],
--    command: [gircompiler, '-o', '@OUTPUT@', '@INPUT@',
--              '--includedir', meson.current_build_dir(),
--              '--includedir', meson.current_source_dir(),
--    ],
-+    command: gircompiler_command,
-     install: true,
-     install_dir: typelibdir,
-   )
-diff --git a/meson.build b/meson.build
-index a5e825f..a28490a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -168,7 +168,9 @@ endif
- subdir('girepository')
- subdir('tools')
- subdir('giscanner')
--subdir('gir')
-+if get_option('enable-introspection-data') == true
-+    subdir('gir')
-+endif
- subdir('examples')
- subdir('docs')
- subdir('tests')
-diff --git a/meson_options.txt b/meson_options.txt
-index 445a68a..a325511 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -25,3 +25,23 @@ option('python', type: 'string', value: 'python3',
- option('gir_dir_prefix', type: 'string',
-   description: 'Intermediate prefix for gir installation under ${prefix}'
- )
-+
-+option('enable-host-gi', type: 'boolean', value : false,
-+  description: 'Use gobject introspection tools installed in the host system (useful when cross-compiling)'
-+)
-+
-+option('enable-gi-cross-wrapper', type: 'string',
-+  description: 'Use a wrapper to run gicompiler and binaries produced by giscanner (useful when cross-compiling)'
-+)
-+
-+option('enable-gi-ldd-wrapper', type: 'string',
-+  description: 'Use a ldd wrapper instead of system ldd command in giscanner (useful when cross-compiling)'
-+)
-+
-+option('enable-introspection-data', type: 'boolean', value : true,
-+  description: 'Build introspection data (.gir and .typelib files) in addition to library and tools'
-+)
-+
-+option('pkgconfig-sysroot-path', type: 'string',
-+  description: 'Specify a sysroot path to prepend to pkgconfig output (useful when cross-compiling)'
-+)
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index a15401aeb2..9d6f5dea3c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 673623851fb70c0e43cf79cef67b3751432ebe72 Mon Sep 17 00:00:00 2001
+From 8dfb44450ca9fffc15977e95eadcb7054ab60a9a Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -21,7 +21,7 @@ Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
  2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/girepository/girepository.c b/girepository/girepository.c
-index ca5dc2b..7a4d17f 100644
+index b7948d6..39a2586 100644
 --- a/girepository/girepository.c
 +++ b/girepository/girepository.c
 @@ -21,6 +21,8 @@
@@ -42,7 +42,7 @@ index ca5dc2b..7a4d17f 100644
  /**
   * SECTION:girepository
   * @short_description: GObject Introspection repository manager
-@@ -212,9 +216,16 @@ init_globals (void)
+@@ -215,9 +219,16 @@ init_globals (void)
            g_free (custom_dirs);
          }
  
@@ -62,7 +62,7 @@ index ca5dc2b..7a4d17f 100644
        typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
 diff --git a/girepository/meson.build b/girepository/meson.build
-index 1d7aed6..5637fb5 100644
+index 204659f..3e61d31 100644
 --- a/girepository/meson.build
 +++ b/girepository/meson.build
 @@ -44,7 +44,7 @@ girepo_internals_lib = static_library('girepository-internals',
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
deleted file mode 100644
index ddd955354d..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 6653c28f0b76aad86e26c512b03efcec6d9d9e95 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 3 Jan 2018 17:02:01 +0200
-Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
-
-By default LD_LIBRARY_PATH is set to the list of target library paths;
-this breaks down in cross-compilation environment, as we need to run a
-native emulation wrapper rather than the target binary itself. This patch
-allows exporting those paths to a different environment variable
-which can be picked up and used by the wrapper.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- giscanner/ccompiler.py   | 4 ++--
- giscanner/dumper.py      | 3 ++-
- giscanner/scannermain.py | 3 +++
- 3 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index 32c9296..3fb262b 100644
---- a/giscanner/ccompiler.py
-+++ b/giscanner/ccompiler.py
-@@ -174,7 +174,7 @@ class CCompiler(object):
- 
-             self._cflags_no_deprecation_warnings = "-Wno-deprecated-declarations"
- 
--    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths):
-+    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths, lib_dirs_envvar):
-         # An "internal" link is where the library to be introspected
-         # is being built in the current directory.
- 
-@@ -184,7 +184,7 @@ class CCompiler(object):
-         if os.name == 'nt':
-             runtime_path_envvar = ['LIB', 'PATH']
-         else:
--            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_FALLBACK_LIBRARY_PATH']
-+            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_FALLBACK_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
-             # Search the current directory first
-             # (This flag is not supported nor needed for Visual C++)
-             args.append('-L.')
-diff --git a/giscanner/dumper.py b/giscanner/dumper.py
-index 2b851a5..10a7c39 100644
---- a/giscanner/dumper.py
-+++ b/giscanner/dumper.py
-@@ -244,7 +244,8 @@ class DumpCompiler(object):
-                                                    libtool,
-                                                    self._options.libraries,
-                                                    self._options.extra_libraries,
--                                                   self._options.library_paths)
-+                                                   self._options.library_paths,
-+                                                   self._options.lib_dirs_envvar)
-             args.extend(pkg_config_libs)
- 
-         else:
-diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index 9013562..9c9fe12 100644
---- a/giscanner/scannermain.py
-+++ b/giscanner/scannermain.py
-@@ -126,6 +126,9 @@ def _get_option_parser():
-     parser.add_option("", "--use-ldd-wrapper",
-                       action="store", dest="ldd_wrapper", default=None,
-                       help="wrapper to use instead of ldd (useful when cross-compiling)")
-+    parser.add_option("", "--lib-dirs-envvar",
-+                      action="store", dest="lib_dirs_envvar", default=None,
-+                      help="environment variable to write a list of library directories to (for running the transient binary), instead of standard LD_LIBRARY_PATH")
-     parser.add_option("", "--program-arg",
-                       action="append", dest="program_args", default=[],
-                       help="extra arguments to program")
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable-tests-when-cross-compiling.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable-tests-when-cross-compiling.patch
deleted file mode 100644
index c4951b22bb..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-disable-tests-when-cross-compiling.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2c384187cc22113c0c9b1cd233948118f7c085ef Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 25 Mar 2019 13:28:48 +0100
-Subject: [PATCH] meson.build: disable tests when cross-compiling
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-introspection/merge_requests/64]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 2544ff3..4c16fe5 100644
---- a/meson.build
-+++ b/meson.build
-@@ -168,7 +168,9 @@ if get_option('enable-introspection-data') == true
- endif
- subdir('examples')
- subdir('docs')
--subdir('tests')
-+if not meson.is_cross_build()
-+    subdir('tests')
-+endif
- 
- install_data('Makefile.introspection', install_dir: join_paths(get_option('datadir'), 'gobject-introspection-1.0'))
- install_data('m4/introspection.m4', install_dir: join_paths(get_option('datadir'), 'aclocal'))
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
deleted file mode 100644
index b954dcebd8..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5f985fd8a24764ccb38af6335d4584d7e33fc3a1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 19 Oct 2015 18:26:40 +0300
-Subject: [PATCH] giscanner: add --use-binary-wrapper option
-
-With this option, giscanner will use a wrapper executable to run
-binaries it's producing, instead of running them directly. This
-is useful when binaries are cross-compiled and cannot be run directly,
-but they can be run using for example QEMU emulation.
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- giscanner/scannermain.py | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index c004fb1..0b6a2d2 100644
---- a/giscanner/scannermain.py
-+++ b/giscanner/scannermain.py
-@@ -120,6 +120,9 @@ def _get_option_parser():
-     parser.add_option("", "--program",
-                       action="store", dest="program", default=None,
-                       help="program to execute")
-+    parser.add_option("", "--use-binary-wrapper",
-+                      action="store", dest="wrapper", default=None,
-+                      help="wrapper to use for running programs (useful when cross-compiling)")
-     parser.add_option("", "--program-arg",
-                       action="append", dest="program_args", default=[],
-                       help="extra arguments to program")
-@@ -417,6 +420,17 @@ def create_binary(transformer, options, args):
-                                               gdump_parser.get_error_quark_functions())
- 
-     shlibs = resolve_shlibs(options, binary, options.libraries)
-+    if options.wrapper:
-+        # The wrapper needs the binary itself, not the libtool wrapper script,
-+        # so we check if libtool has sneaked the binary into .libs subdirectory
-+        # and adjust the path accordingly
-+        import os.path
-+        dir_name, binary_name  = os.path.split(binary.args[0])
-+        libtool_binary = os.path.join(dir_name, '.libs', binary_name)
-+        if os.path.exists(libtool_binary):
-+            binary.args[0] = libtool_binary
-+	# Then prepend the wrapper to the command line to execute
-+        binary.args = [options.wrapper] + binary.args
-     gdump_parser.set_introspection_binary(binary)
-     gdump_parser.parse()
-     return shlibs
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
deleted file mode 100644
index 79264ed086..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From cba7807888a4a1f1d630d16c51c89859209334b3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Oct 2015 16:28:46 +0200
-Subject: [PATCH] giscanner: add a --use-ldd-wrapper option
-
-This is useful in cross-compile environments where system's ldd
-command does not work on binaries built for a different architecture
-
-Upstream-Status: Pending [review in oe-core]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- giscanner/scannermain.py | 3 +++
- giscanner/shlibs.py      | 4 +++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index 0b6a2d2..9013562 100644
---- a/giscanner/scannermain.py
-+++ b/giscanner/scannermain.py
-@@ -123,6 +123,9 @@ def _get_option_parser():
-     parser.add_option("", "--use-binary-wrapper",
-                       action="store", dest="wrapper", default=None,
-                       help="wrapper to use for running programs (useful when cross-compiling)")
-+    parser.add_option("", "--use-ldd-wrapper",
-+                      action="store", dest="ldd_wrapper", default=None,
-+                      help="wrapper to use instead of ldd (useful when cross-compiling)")
-     parser.add_option("", "--program-arg",
-                       action="append", dest="program_args", default=[],
-                       help="extra arguments to program")
-diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index 2c61f2f..d67df95 100644
---- a/giscanner/shlibs.py
-+++ b/giscanner/shlibs.py
-@@ -96,7 +96,9 @@ def _resolve_non_libtool(options, binary, libraries):
-             args.extend(libtool)
-             args.append('--mode=execute')
-         platform_system = platform.system()
--        if platform_system == 'Darwin':
-+        if options.ldd_wrapper:
-+            args.extend([options.ldd_wrapper, binary.args[0]])
-+        elif platform_system == 'Darwin':
-             args.extend(['otool', '-L', binary.args[0]])
-         else:
-             args.extend(['ldd', binary.args[0]])
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
deleted file mode 100644
index 26f8da6d41..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 740d91151ffe576e0c08513af9d7bc8133eb9dfb Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 8 Oct 2015 18:30:35 +0300
-Subject: [PATCH] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
- environment variable
-
-This environment variable sets the location of sysroot directory in cross-compilation
-environments; if the variable is not set, the prefix will be empty.
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- m4/introspection.m4 | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/m4/introspection.m4 b/m4/introspection.m4
-index d89c3d9..b562266 100644
---- a/m4/introspection.m4
-+++ b/m4/introspection.m4
-@@ -56,14 +56,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
-     INTROSPECTION_GIRDIR=
-     INTROSPECTION_TYPELIBDIR=
-     if test "x$found_introspection" = "xyes"; then
--       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
--       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
--       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-+       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
-+       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
-+       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-        INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
-        INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
-        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
-        INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
--       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-+       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-     fi
-     AC_SUBST(INTROSPECTION_SCANNER)
-     AC_SUBST(INTROSPECTION_COMPILER)
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
similarity index 89%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
index b1371776af..9dfb55e055 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
@@ -14,18 +14,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
                     "
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
-           file://0003-giscanner-add-use-binary-wrapper-option.patch \
-           file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
-           file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
-           file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
-           file://0001-Port-cross-compilation-support-to-meson.patch \
-           file://0001-meson.build-disable-tests-when-cross-compiling.patch \
-           file://0001-Fix-build-reproducibility.patch \
            "
 
-SRC_URI[md5sum] = "37278eab3704e42234b6080b8cf241f1"
-SRC_URI[sha256sum] = "b1ee7ed257fdbc008702bdff0ff3e78a660e7e602efa8f211dc89b9d1e7d90a2"
+SRC_URI[md5sum] = "3419dfd086efcf83768e0579ab6abd2b"
+SRC_URI[sha256sum] = "80beae6728c134521926affff9b2e97125749b38d38744dc901f4010ee3e7fa7"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
@@ -49,16 +42,16 @@ export STAGING_DIR_HOST
 export B
 
 PACKAGECONFIG ?= ""
-PACKAGECONFIG[doctool] = "-Ddoctool=true,-Ddoctool=false,python3-mako,"
+PACKAGECONFIG[doctool] = "-Ddoctool=enabled,-Ddoctool=disabled,python3-mako,"
 
 # Configure target build to use native tools of itself and to use a qemu wrapper
 # and optionally to generate introspection data
 EXTRA_OEMESON_class-target = " \
-    -Denable-host-gi=true \
-    -Denable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
-    -Denable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
-    -Dpkgconfig-sysroot-path=${PKG_CONFIG_SYSROOT_DIR} \
-    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Denable-introspection-data=true', '-Denable-introspection-data=false', d)} \
+    -Dgi_cross_use_host_gi=true \
+    -Dgi_cross_binary_wrapper=${B}/g-ir-scanner-qemuwrapper \
+    -Dgi_cross_ldd_wrapper=${B}/g-ir-scanner-lddwrapper \
+    -Dgi_cross_pkgconfig_sysroot_path=${PKG_CONFIG_SYSROOT_DIR} \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dbuild_introspection_data=true', '-Dbuild_introspection_data=false', d)} \
     ${@'-Dgir_dir_prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
 "
 
-- 
2.26.1

