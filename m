Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4225F7CB6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:16:56 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r5so2525670wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5GwwfhNlW/xELLvxViS+sBuEkXM78TkChYcTKr0Yk9g=;
	b=JjBqgBYXIY6JK4JOnf7R/uXv15X4/iFpwvVvWjjmwNJziRqoiRAa6rZ9mp66p0qIjB
	jnhMpIZ3paGelVd/m2sgd6E9P1YtuL5HQa7xYBUsUTbckq6AI6j2X8cmoprt00tTu5cC
	vuy7zJJ5YkHySaPC6hrHQUM3s8X9Mu4LPS+4FAlnZWdCrQqn5E7k37aPwTBmI4s0/eeF
	ZW33VfOi/dxAFFCqtXs2UqGvERZDCo38MvhLVod3Sd6ikM89XS4TtuPYdLed0cFzR8Vj
	QkclNZZgig+7rgLFMb6nHg86aaa2ctXE9WMYP+FApQOaqZJuDFOBINuV6NgyCpMVY43s
	4xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5GwwfhNlW/xELLvxViS+sBuEkXM78TkChYcTKr0Yk9g=;
	b=ITx2FgvuLN3xSpRSYtVsXpqCU3InaBSPaAxTbp0m8Rqp7zelLe6sI+YDZO4ITBfw9w
	wNtrjuXVHg1gQK+QESSKpFx+SWsVcnZJEvsf+B03o7Dp5avwbUQuhAL7FkWJSCI6R6Qz
	PNGkljcD1e+pjElf55gEeSDWo+/34DWSQkmnKlxrWjxDM+f5qsG/fO6R7AmGo6ViVuZD
	LbKHqERzQjUA9cJvHO975+MxRMw+aMSh5K1Og5/y08kTnnlkuU9HNBH6ugKIr5ZcvAA3
	8GnBVvrCCty9SUkWdRzvCqgRprXONL/fXllyhS2067rP2hVrK9zf5bGxKdiM/05sgyzx
	bVqA==
X-Gm-Message-State: AHQUAubHEkR5Zw8e3geost9s+/6BA8PwdfWeIhsUUWu0XaKS5QCeIr8X
	ECRgFHlyAkMawSXM3S4Del8usNmB
X-Google-Smtp-Source: AHgI3IZhBOCyl/Bf3630RrSp9GJY2sqyj1Ek9JVV8RQ94Iai+V8FYv4/8+u4Uw/iRuNKqaa174ZfvA==
X-Received: by 2002:adf:8447:: with SMTP id 65mr2995043wrf.328.1550845015946; 
	Fri, 22 Feb 2019 06:16:55 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	h13sm1377309wrs.42.2019.02.22.06.16.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:16:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:16:49 +0100
Message-Id: <20190222141650.46895-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] gdk-pixbuf: update to 2.38.0
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
X-List-Received-Date: Fri, 22 Feb 2019 14:16:56 -0000

Drop 0001-Disable-tests-in-native-builds.patch as upstream has fixed the issue.

Rework 0001-Fix-a-couple-of-decisions-around-cross-compilation.patch to
enable generation of loaders.cache in target builds (using a native tool),
because otherwise building tests becomes impossible.

Rework 0002-Work-around-thumbnailer-cross-compile-failure.patch into
0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
(which deals with substituting native tools in cross builds) and
0004-Do-not-run-tests-when-building.patch (which avoids running
test binaries during cross builds).

Rebase fatal-loader.patch.

License checksum updates as COPYING file had 2.0 version of LGPL and
has been replaced with 2.1 version.

Take meson's x11 and installed_tests options into use.

Install gdk-pixbuf-query-loaders also into $bindir, as we need the native
version during cross compile.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Disable-tests-in-native-builds.patch |  31 -----
 ...f-decisions-around-cross-compilation.patch |  38 +++--
 ...nd-thumbnailer-cross-compile-failure.patch | 131 ------------------
 ...-around-thumbnailer-cross-compile-fa.patch |  96 +++++++++++++
 .../0004-Do-not-run-tests-when-building.patch |  39 ++++++
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch  |  37 +++--
 ...pixbuf_2.36.11.bb => gdk-pixbuf_2.38.0.bb} |  44 +++---
 7 files changed, 197 insertions(+), 219 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Disable-tests-in-native-builds.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0002-Work-around-thumbnailer-cross-compile-failure.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.11.bb => gdk-pixbuf_2.38.0.bb} (76%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Disable-tests-in-native-builds.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Disable-tests-in-native-builds.patch
deleted file mode 100644
index 1e45b716b93..00000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Disable-tests-in-native-builds.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b287cb313dbfac3257f1ab451b19ba59580f78e1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 18 Feb 2019 16:00:12 +0100
-Subject: [PATCH] Disable tests in native builds.
-
-They have found to be problematic at least on Centos 7:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/296/steps/7/logs/step1b
-
-With autotools this was not a problem because it had a configuration
-switch for disabling test, which was used. Meson has no such facility :(
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 92c4049..0871c84 100644
---- a/meson.build
-+++ b/meson.build
-@@ -397,7 +397,7 @@ endif
- # i18n
- subdir('po')
- 
--subdir('tests')
-+#subdir('tests')
- subdir('thumbnailer')
- 
- # Documentation
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
index 90d4830df50..e638fd3b6f3 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Fix-a-couple-of-decisions-around-cross-compilation.patch
@@ -1,23 +1,23 @@
-From 48cbdd56036728ffea431ad63cf5e2ad05cef69c Mon Sep 17 00:00:00 2001
+From bf71999b6e64d1f1919b0351b27c1c417e2b8856 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 14 Feb 2019 18:06:25 +0100
-Subject: [PATCH] Fix a couple of decisions around cross-compilation
+Subject: [PATCH] Generate loaders.cache using a native tool when
+ cross-compiling
 
-1. gobject-introspection can be build when cross compiling
-2. generating loaders.cache requires running a target binary which
-we do elsewhere (in postinsts)
+Otherwise meson would attempt to run a target binary.
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- gdk-pixbuf/meson.build | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ gdk-pixbuf/meson.build | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
 
 diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index 77c162b..fc3eb33 100644
+index 1995ffd..d692cb7 100644
 --- a/gdk-pixbuf/meson.build
 +++ b/gdk-pixbuf/meson.build
-@@ -230,6 +230,7 @@ foreach bin: gdkpixbuf_bin
+@@ -291,6 +291,7 @@ foreach bin: gdkpixbuf_bin
    set_variable(bin_name.underscorify(), bin)
  endforeach
  
@@ -25,14 +25,22 @@ index 77c162b..fc3eb33 100644
  # The 'loaders.cache' used for testing, so we don't accidentally
  # load the installed cache; we always build it by default
  loaders_cache = custom_target('loaders.cache',
-@@ -241,8 +242,9 @@ loaders_cache = custom_target('loaders.cache',
+@@ -302,6 +303,18 @@ loaders_cache = custom_target('loaders.cache',
                                ],
                                build_by_default: true)
  loaders_dep = declare_dependency(sources: [ loaders_cache ])
++else
++loaders_cache = custom_target('loaders.cache',
++                              output: 'loaders.cache',
++                              capture: true,
++                              depends: [ dynamic_loaders_dep ],
++                              command: [
++                                'gdk-pixbuf-query-loaders',
++                                dynamic_loaders,
++                              ],
++                              build_by_default: true)
++loaders_dep = declare_dependency(sources: [ loaders_cache ])
 +endif
  
--build_gir = get_option('with_gir') and not meson.is_cross_build()
-+build_gir = get_option('with_gir')
- if build_gir
-   gir_args = [
-     '--quiet',
+ pkgconfig = import('pkgconfig')
+ pkgconfig.generate(
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0002-Work-around-thumbnailer-cross-compile-failure.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0002-Work-around-thumbnailer-cross-compile-failure.patch
deleted file mode 100644
index b0cd838a8fd..00000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0002-Work-around-thumbnailer-cross-compile-failure.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From a184e6bfdd7761ad9807f3de9e873d49aff79e6d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 14 Feb 2019 17:56:34 +0100
-Subject: [PATCH] (target only) Work-around thumbnailer cross-compile failure
-
-Use native gdk-pixbuf-print-mime-types when generating the thumbnail
-metadata. This works but the mime types will come from native
-loader.cache (which will only contain in-tree loaders), not from the
-target loader.cache.
-
-The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
-
-Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- build-aux/gen-thumbnailer.py |  2 --
- tests/meson.build            | 49 +-----------------------------------
- thumbnailer/meson.build      |  5 +---
- 3 files changed, 2 insertions(+), 54 deletions(-)
-
-diff --git a/build-aux/gen-thumbnailer.py b/build-aux/gen-thumbnailer.py
-index 05ac821..c5b99ab 100644
---- a/build-aux/gen-thumbnailer.py
-+++ b/build-aux/gen-thumbnailer.py
-@@ -20,8 +20,6 @@ argparser.add_argument('output', help='Output file')
- args = argparser.parse_args()
- 
- newenv = os.environ.copy()
--newenv['GDK_PIXBUF_PIXDATA'] = args.pixdata
--newenv['GDK_PIXBUF_MODULE_FILE'] = args.loaders
- # 'nt': NT-based Windows, see https://docs.python.org/3/library/os.html
- if os.name == 'nt':
-     gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
-diff --git a/tests/meson.build b/tests/meson.build
-index 77a427a..467f5b2 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -1,38 +1,6 @@
- # Resources; we cannot use gnome.compile_resources() here, because we need to
- # override the environment in order to use the utilities we just built instead
- # of the system ones
--resources_c = custom_target('resources.c',
--                            input: 'resources.gresource.xml',
--                            output: 'resources.c',
--                            command: [
--                              gen_resources,
--                              '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
--                              '--loaders=@0@'.format(loaders_cache.full_path()),
--                              '--sourcedir=@0@'.format(meson.current_source_dir()),
--                              '--source',
--                              '@INPUT@',
--                              '@OUTPUT@',
--                            ],
--                            depends: [
--                              gdk_pixbuf_pixdata,
--                              loaders_cache,
--                            ])
--resources_h = custom_target('resources.h',
--                            input: 'resources.gresource.xml',
--                            output: 'resources.h',
--                            command: [
--                              gen_resources,
--                              '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
--                              '--loaders=@0@'.format(loaders_cache.full_path()),
--                              '--sourcedir=@0@'.format(meson.current_source_dir()),
--                              '--header',
--                              '@INPUT@',
--                              '@OUTPUT@',
--                            ],
--                            depends: [
--                              gdk_pixbuf_pixdata,
--                              loaders_cache,
--                            ])
- 
- installed_tests = [
-   [ 'animation' ],
-@@ -94,7 +62,7 @@ foreach t: installed_tests
-   test_sources = [ test_name + '.c', 'test-common.c' ]
-   needs_resources = t.get(1, false)
-   if needs_resources
--    test_sources += [ resources_c, resources_h ]
-+    test_sources += [ 'resources.c', 'resources.h' ]
-   endif
- 
-   custom_target(test_name + '.test',
-@@ -116,21 +84,6 @@ foreach t: installed_tests
-                         ],
-                         c_args: common_cflags)
- 
--  # Two particularly slow tests
--  if test_name == 'pixbuf-area-updated' or test_name == 'pixbuf-randomly-modified'
--    timeout = 300
--  else
--    timeout = 30
--  endif
--
--  test(test_name, test_bin,
--       args: [ '-k', '--tap' ],
--       env: [
--         'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
--         'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
--         'GDK_PIXBUF_MODULE_FILE=@0@'.format(loaders_cache.full_path()),
--       ],
--       timeout: timeout)
- endforeach
- 
- executable('pixbuf-read',
-diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
-index aaafec8..71bd61b 100644
---- a/thumbnailer/meson.build
-+++ b/thumbnailer/meson.build
-@@ -18,9 +18,7 @@ custom_target('thumbnailer',
-               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
-               command: [
-                 gen_thumbnailer,
--                '--printer=@0@'.format(gdk_pixbuf_print_mime_types.full_path()),
--                '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
--                '--loaders=@0@'.format(loaders_cache.full_path()),
-+                '--printer=gdk-pixbuf-print-mime-types',
-                 '--bindir=@0@'.format(gdk_pixbuf_bindir),
-                 '@INPUT@',
-                 '@OUTPUT@',
-@@ -28,7 +26,6 @@ custom_target('thumbnailer',
-               depends: [
-                 gdk_pixbuf_print_mime_types,
-                 gdk_pixbuf_pixdata,
--                loaders_cache,
-               ],
-               install: true,
-               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
new file mode 100644
index 00000000000..928962d230b
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
@@ -0,0 +1,96 @@
+From 6fc7f341399ec49ab06c94426f50dbdca49a2844 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 22 Feb 2019 13:22:06 +0100
+Subject: [PATCH] (target only) Work-around thumbnailer and pixdata
+ cross-compile failure
+
+Use native gdk-pixbuf-print-mime-types and gdk-pixbuf-pixdata
+when generating the thumbnail metadata and resources.
+
+This works but the mime types will come from native
+loader.cache (which will only contain in-tree loaders), not from the
+target loader.cache.
+
+The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
+
+Upstream-Status: Inappropriate [workaround]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ build-aux/gen-thumbnailer.py |  2 --
+ tests/meson.build            | 11 +++++++++--
+ thumbnailer/meson.build      |  5 +----
+ 3 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/build-aux/gen-thumbnailer.py b/build-aux/gen-thumbnailer.py
+index 05ac821..c5b99ab 100644
+--- a/build-aux/gen-thumbnailer.py
++++ b/build-aux/gen-thumbnailer.py
+@@ -20,8 +20,6 @@ argparser.add_argument('output', help='Output file')
+ args = argparser.parse_args()
+ 
+ newenv = os.environ.copy()
+-newenv['GDK_PIXBUF_PIXDATA'] = args.pixdata
+-newenv['GDK_PIXBUF_MODULE_FILE'] = args.loaders
+ # 'nt': NT-based Windows, see https://docs.python.org/3/library/os.html
+ if os.name == 'nt':
+     gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
+diff --git a/tests/meson.build b/tests/meson.build
+index 4fa3fbc..eca5166 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -1,12 +1,19 @@
+ # Resources; we cannot use gnome.compile_resources() here, because we need to
+ # override the environment in order to use the utilities we just built instead
+ # of the system ones
++
++if not meson.is_cross_build()
++pixdata_binary = gdk_pixbuf_pixdata.full_path()
++else
++pixdata_binary = 'gdk-pixbuf-pixdata'
++endif
++
+ resources_c = custom_target('resources.c',
+   input: 'resources.gresource.xml',
+   output: 'resources.c',
+   command: [
+     gen_resources,
+-    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++    '--pixdata=@0@'.format(pixdata_binary),
+     '--loaders=@0@'.format(loaders_cache.full_path()),
+     '--sourcedir=@0@'.format(meson.current_source_dir()),
+     '--source',
+@@ -24,7 +31,7 @@ resources_h = custom_target('resources.h',
+   output: 'resources.h',
+   command: [
+     gen_resources,
+-    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++    '--pixdata=@0@'.format(pixdata_binary),
+     '--loaders=@0@'.format(loaders_cache.full_path()),
+     '--sourcedir=@0@'.format(meson.current_source_dir()),
+     '--header',
+diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
+index aaafec8..71bd61b 100644
+--- a/thumbnailer/meson.build
++++ b/thumbnailer/meson.build
+@@ -18,9 +18,7 @@ custom_target('thumbnailer',
+               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
+               command: [
+                 gen_thumbnailer,
+-                '--printer=@0@'.format(gdk_pixbuf_print_mime_types.full_path()),
+-                '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
+-                '--loaders=@0@'.format(loaders_cache.full_path()),
++                '--printer=gdk-pixbuf-print-mime-types',
+                 '--bindir=@0@'.format(gdk_pixbuf_bindir),
+                 '@INPUT@',
+                 '@OUTPUT@',
+@@ -28,7 +26,6 @@ custom_target('thumbnailer',
+               depends: [
+                 gdk_pixbuf_print_mime_types,
+                 gdk_pixbuf_pixdata,
+-                loaders_cache,
+               ],
+               install: true,
+               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
+-- 
+2.17.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
new file mode 100644
index 00000000000..96c546f271a
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
@@ -0,0 +1,39 @@
+From 3c4a6c147ae8a0962ba9194373d8a41d14eed44f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 22 Feb 2019 13:23:55 +0100
+Subject: [PATCH] Do not run tests when building
+
+Upstream-Status: Inappropriate [cross-compile specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/meson.build | 17 -----------------
+ 1 file changed, 17 deletions(-)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index 4fa3fbc..6ef7884 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -138,23 +138,6 @@ foreach t: installed_tests
+     install_dir: installed_test_bindir,
+   )
+ 
+-  # Two particularly slow tests
+-  if test_suites.contains('slow')
+-    timeout = 300
+-  else
+-    timeout = 30
+-  endif
+-
+-  test(test_name, test_bin,
+-    suite: test_suites,
+-    args: [ '-k', '--tap' ],
+-    env: [
+-      'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
+-      'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
+-      'GDK_PIXBUF_MODULE_FILE=@0@'.format(loaders_cache.full_path()),
+-    ],
+-    timeout: timeout,
+-  )
+ endforeach
+ 
+ executable('pixbuf-read',
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 7d0d54bafea..25410b11ea2 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,7 +1,7 @@
-From b6a7b30522455cab39a0b9ea8463313380146e70 Mon Sep 17 00:00:00 2001
+From f00603d58d844422363b896ea7d07aaf48ddaa66 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
-Subject: [PATCH 3/4] gdk-pixbuf: add an option so that loader errors are fatal
+Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
 
 If an environment variable is specified set the return value from main() to
 non-zero if the loader had errors (missing libraries, generally).
@@ -14,10 +14,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index a81c804..350bec8 100644
+index 312aa78..b813d99 100644
 --- a/gdk-pixbuf/queryloaders.c
 +++ b/gdk-pixbuf/queryloaders.c
-@@ -146,7 +146,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
+@@ -212,7 +212,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
          g_string_append_c (contents, '\n');
  }
  
@@ -26,7 +26,7 @@ index a81c804..350bec8 100644
  query_module (GString *contents, const char *dir, const char *file)
  {
          char *path;
-@@ -155,6 +155,7 @@ query_module (GString *contents, const char *dir, const char *file)
+@@ -221,6 +221,7 @@ query_module (GString *contents, const char *dir, const char *file)
          void                    (*fill_vtable)   (GdkPixbufModule *module);
          gpointer fill_info_ptr;
          gpointer fill_vtable_ptr;
@@ -34,7 +34,7 @@ index a81c804..350bec8 100644
  
          if (g_path_is_absolute (file))
                  path = g_strdup (file);
-@@ -204,10 +205,13 @@ query_module (GString *contents, const char *dir, const char *file)
+@@ -270,10 +271,13 @@ query_module (GString *contents, const char *dir, const char *file)
                                     g_module_error());
                  else
                          g_fprintf (stderr, "Cannot load loader %s\n", path);
@@ -48,26 +48,26 @@ index a81c804..350bec8 100644
  }
  
  #ifdef G_OS_WIN32
-@@ -257,6 +261,7 @@ int main (int argc, char **argv)
-         GString *contents;
-         gchar *cache_file = NULL;
+@@ -314,6 +318,7 @@ int main (int argc, char **argv)
          gint first_file = 1;
+         GFile *pixbuf_libdir_file;
+         gchar *pixbuf_libdir;
 +        gboolean success = TRUE;
  
  #ifdef G_OS_WIN32
          gchar *libdir;
-@@ -370,7 +375,9 @@ int main (int argc, char **argv)
+@@ -452,7 +457,9 @@ int main (int argc, char **argv)
                  }
                  modules = g_list_sort (modules, (GCompareFunc)strcmp);
                  for (l = modules; l != NULL; l = l->next)
--                        query_module (contents, path, l->data);
-+                        if (!query_module (contents, path, l->data))
+-                        query_module (contents, moduledir, l->data);
++                        if (!query_module (contents, moduledir, l->data))
 +                                success = FALSE;
 +
                  g_list_free_full (modules, g_free);
+                 g_free (moduledir);
  #else
-                 g_string_append_printf (contents, "# dynamic loading of modules not supported\n");
-@@ -385,7 +392,8 @@ int main (int argc, char **argv)
+@@ -468,7 +475,8 @@ int main (int argc, char **argv)
                          infilename = g_locale_to_utf8 (infilename,
                                                         -1, NULL, NULL, NULL);
  #endif
@@ -77,9 +77,9 @@ index a81c804..350bec8 100644
                  }
                  g_free (cwd);
          }
-@@ -401,5 +409,8 @@ int main (int argc, char **argv)
-         else
-                 g_print ("%s\n", contents->str);
+@@ -486,5 +494,8 @@ int main (int argc, char **argv)
+ 
+         g_free (pixbuf_libdir);
  
 -        return 0;
 +        if (g_getenv ("GDK_PIXBUF_FATAL_LOADER"))
@@ -87,6 +87,3 @@ index a81c804..350bec8 100644
 +        else
 +                return 0;
  }
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
similarity index 76%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
index 5f081fbb945..3a544bd8a60 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
@@ -2,9 +2,10 @@ SUMMARY = "Image loading library for GTK+"
 HOMEPAGE = "http://www.gtk.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://gdk-pixbuf/gdk-pixbuf.h;endline=26;md5=72b39da7cbdde2e665329fef618e1d6b"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://gdk-pixbuf/gdk-pixbuf.h;endline=26;md5=72b39da7cbdde2e665329fef618e1d6b \
+                    "
 
 SECTION = "libs"
 
@@ -18,29 +19,26 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
            file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
            file://0001-loaders.cache-depend-on-loaders-being-fully-build.patch \
+           file://0004-Do-not-run-tests-when-building.patch \
            "
 
 SRC_URI_append_class-target = " \
-           file://0002-Work-around-thumbnailer-cross-compile-failure.patch \
+           file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
            "
 SRC_URI_append_class-nativesdk = " \
-           file://0002-Work-around-thumbnailer-cross-compile-failure.patch \
-           file://0001-Disable-tests-in-native-builds.patch \
-           "
-SRC_URI_append_class-native = " \
-           file://0001-Disable-tests-in-native-builds.patch \
+           file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
            "
 
-SRC_URI[md5sum] = "6e84e5485c17ce7c25df77fe76eb2d6a"
-SRC_URI[sha256sum] = "ae62ab87250413156ed72ef756347b10208c00e76b222d82d9ed361ed9dde2f3"
+SRC_URI[md5sum] = "77765f24496dc8c90c6e0cbe10fd8f0e"
+SRC_URI[sha256sum] = "dd50973c7757bcde15de6bcd3a6d462a445efd552604ae6435a0532fbbadae47"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-GTKDOC_ENABLE_FLAG = "-Dwith_docs=true"
-GTKDOC_DISABLE_FLAG = "-Dwith_docs=false"
+GTKDOC_ENABLE_FLAG = "-Ddocs=true"
+GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 
-GI_ENABLE_FLAG = "-Dwith_gir=true"
-GI_DISABLE_FLAG = "-Dwith_gir=false"
+GI_ENABLE_FLAG = "-Dgir=true"
+GI_DISABLE_FLAG = "-Dgir=false"
 
 EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
 
@@ -50,6 +48,8 @@ EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'T
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                      '${GTKDOC_DISABLE_FLAG}', d)} "
 
+EXTRA_OEMESON_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dinstalled_tests=true', '-Dinstalled_tests=false', d)}"
+
 LIBV = "2.10.0"
 
 GDK_PIXBUF_LOADERS ?= "png jpeg"
@@ -63,7 +63,7 @@ PACKAGECONFIG[jpeg] = "-Denable_jpeg=true,-Denable_jpeg=false,jpeg"
 PACKAGECONFIG[tiff] = "-Denable_tiff=true,-Denable_tiff=false,tiff"
 PACKAGECONFIG[jpeg2000] = "-Denable_jasper=true,-Denable_jasper=false,jasper"
 
-PACKAGECONFIG[x11] = ",,virtual/libx11"
+PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
 
 PACKAGES =+ "${PN}-xlib"
 
@@ -102,14 +102,10 @@ python populate_packages_prepend () {
 }
 
 do_install_append() {
-	# Move gdk-pixbuf-query-loaders into libdir so it is always available
+	# Copy gdk-pixbuf-query-loaders into libdir so it is always available
 	# in multilib builds.
-	mv ${D}/${bindir}/gdk-pixbuf-query-loaders ${D}/${libdir}/gdk-pixbuf-2.0/
+	cp ${D}/${bindir}/gdk-pixbuf-query-loaders ${D}/${libdir}/gdk-pixbuf-2.0/
 
-	# Do not install ptests if ptest is not enabled; gdk-pixbuf has no configuration option for this
-	if [ "${PTEST_ENABLED}" != "1" ]; then
-		rm -rf ${D}${datadir}/installed-tests
-	fi
 }
 
 do_install_append_class-native() {
@@ -127,5 +123,9 @@ do_install_append_class-native() {
 	create_wrapper ${D}/${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
 		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
 		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
+
+	create_wrapper ${D}/${bindir}/gdk-pixbuf-query-loaders \
+		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache \
+		GDK_PIXBUF_MODULEDIR=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders
 }
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


