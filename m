Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id BE3C37F5AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:13 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f22so9896253wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=05sqjX/Q5PVuxdH6QjlWBfT1wRTwhlLyQz5L/f5IpN4=;
	b=oTtONtwfUqE2/2lz7sKAHIX88u/APqkw102jyqFC//1O9k8SAUga6Yv4vYAuEwAv4i
	PZODT3b95GVUkk2MSIEenQ/4813ZsANsZTUDKfm6TriNtD4RCa6zsyzqjKdnUrNn8bKp
	I0kLBZF5o1LHdDHwqNXN5N1ranngM8AiXu518XXE0CE8yIEyVchcXlpb5cHwekwGYLE5
	P3f6gfujgJXqeDVw7SMekm84MPX7mEiE3fjeP5zJXKLHyVGdLDuDwdReSshCCMPcI8hn
	O6b6Blg7PoNi16LHuYYsMkcXPZ/68MLRURo/9SGj+DEWS00+Alc6S8iQujtQtgnkjhAr
	Ly6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=05sqjX/Q5PVuxdH6QjlWBfT1wRTwhlLyQz5L/f5IpN4=;
	b=evZcyvsfUaB7ToqjFkaiIiTiYb43v11LjHLbby8g8Rm/dWRVK1w4JT4Avmi5HJR+rd
	5WPUGt9C6dQiCzBRzEJQrxauB67LKT1dQBPdjc+GQM0azqgQ3AXLZnBhsAHrXwcJe3wJ
	XbB9Nh5oJ6/VNS1X3Qci1e/f92lOn/5r3dLDwUe5rfbk3SXNETou3paDwzU1fUD//o2O
	XM7ZCyHoiLtzfQHnvSWymcyyPNTq/80B1Q/NQ6Zbuj4UeXJX4dPJb0PrvUMyldVSQ4Oo
	G4bq7EF+A2MuZx+Ou4Ct6kpqYfcW7vq3Oa3Em5cxwoBX4BpqLarGM9HyvGTcVzcK8ACi
	Jolg==
X-Gm-Message-State: APjAAAX1enTywE7FAnzEKReuheoIbBv5YDM299CG1R7SlgGm+vnPdJbx
	KCZrW1/xGp/xitaLE5cL18I4Yjgv
X-Google-Smtp-Source: APXvYqy3vVHvMiX72A1mMNFMj7iMT+ScICqRvsv25NWeQWHaqHyrXztF6V7wsrmG7lUFJwufi2U3KA==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr3036261wml.43.1570794494062; 
	Fri, 11 Oct 2019 04:48:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:51 +0200
Message-Id: <20191011114754.91740-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:14 -0000

Drop backported patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  7 +--
 ...efined-by-the-existance-of-a-cross-f.patch | 28 -----------
 .../0001-Make-CPU-family-warnings-fatal.patch |  8 +--
 ...etect-windows-also-if-the-system-str.patch | 29 -----------
 ...sues-that-arise-when-cross-compiling.patch |  8 +--
 ...pport-building-allarch-recipes-again.patch |  4 +-
 .../meson/meson/0003-native_bindir.patch      | 20 ++++----
 .../meson/meson/vala-cross-compile.patch      | 50 -------------------
 .../{meson_0.51.2.bb => meson_0.52.0.bb}      |  1 -
 ...on_0.51.2.bb => nativesdk-meson_0.52.0.bb} |  0
 10 files changed, 22 insertions(+), 133 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/vala-cross-compile.patch
 rename meta/recipes-devtools/meson/{meson_0.51.2.bb => meson_0.52.0.bb} (97%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.51.2.bb => nativesdk-meson_0.52.0.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 8219d87c741..ae0091c051c 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -14,14 +14,11 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
            file://cross-prop-default.patch \
-           file://0001-environment.py-detect-windows-also-if-the-system-str.patch \
-           file://0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch \
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
-           file://vala-cross-compile.patch \
            "
-SRC_URI[sha256sum] = "23688f0fc90be623d98e80e1defeea92bbb7103bf9336a5f5b9865d36e892d76"
-SRC_URI[md5sum] = "d46c4a8e3cfd27f90e2c6fe4a69e574b"
+SRC_URI[sha256sum] = "d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef4938d32"
+SRC_URI[md5sum] = "7ea7772414dda8ae11072244bf7ba991"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch b/meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch
deleted file mode 100644
index a5dbb81b088..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-Cross-build-is-defined-by-the-existance-of-a-cross-f.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 0b4d1e8afd5428a495f8624ee061f63977b4c268 Mon Sep 17 00:00:00 2001
-From: Jussi Pakkanen <jpakkane@gmail.com>
-Date: Sun, 6 Oct 2019 15:17:32 +0300
-Subject: [PATCH] Cross build is defined by the existance of a cross file.
-
----
- mesonbuild/environment.py | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index e5d041b4..03c65688 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -611,7 +611,7 @@ class Environment:
-         self.first_invocation = True
- 
-     def is_cross_build(self) -> bool:
--        return not self.machines.matches_build_machine(MachineChoice.HOST)
-+        return self.coredata.is_cross_build()
- 
-     def dump_coredata(self):
-         return coredata.save(self.coredata, self.get_build_dir())
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 444fc081686..fc55dcacf6d 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From f70fee13e4dbc757cd8153cd42d92fa9394fb542 Mon Sep 17 00:00:00 2001
+From c07d29b715209cd5d75b142a00a540d45b00c36d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 03c6346..86b350b 100644
+index a59cd89..17de654 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -186,7 +186,7 @@ class MachineInfo:
@@ -25,10 +25,10 @@ index 03c6346..86b350b 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 0cfdf9c..40aa189 100644
+index 3704921..f1988f2 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -262,9 +262,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -251,9 +251,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          trial = 'parisc'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
deleted file mode 100644
index 2faeda2e711..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b52e47c9d61dc4c930cfc7236fbeb70338c3b953 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 25 Mar 2019 17:17:06 +0100
-Subject: [PATCH] environment.py: detect windows also if the system string
- contains 'mingw'
-
-Upstream-Status: Backport [fe645a0a9e2da230d2c500af1f5b2db5da1e364d]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- mesonbuild/envconfig.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 03c6346..a59cd89 100644
---- a/mesonbuild/envconfig.py
-+++ b/mesonbuild/envconfig.py
-@@ -198,7 +198,7 @@ class MachineInfo:
-         """
-         Machine is windows?
-         """
--        return self.system in {'windows', 'mingw'}
-+        return self.system == 'windows' or 'mingw' in self.system
- 
-     def is_cygwin(self) -> bool:
-         """
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index 7c3238bf91a..471f1500daa 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 1afbf5ccff56e582229c8f673f50aedf2b24117e Mon Sep 17 00:00:00 2001
+From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:16:41 +0300
 Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
@@ -20,11 +20,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index bf49770..7c5a363 100644
+index bcf77b9..6a4b472 100644
 --- a/mesonbuild/modules/gnome.py
 +++ b/mesonbuild/modules/gnome.py
-@@ -972,6 +972,10 @@ This will become a hard error in the future.''')
-                 '--mode=' + mode]
+@@ -974,6 +974,10 @@ This will become a hard error in the future.''')
+             args.append('--{}={}'.format(program_name, path))
          if namespace:
              args.append('--namespace=' + namespace)
 +        gtkdoc_exe_wrapper = state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 8ad86a46e99..b8837d77b64 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 3009a1c2f1b736b836a057d84dc11f379cba99cf Mon Sep 17 00:00:00 2001
+From 263fc0e26e1fd92e25fa3ef93f4a549dcebc5887 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 86b350b..aa426ca 100644
+index 17de654..2d2deef 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -36,6 +36,7 @@ _T = typing.TypeVar('_T')
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index 57de598d2f1..76cc4931d63 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From ac38495de38a1ea42e2bc09a2f23c2e945fbc22d Mon Sep 17 00:00:00 2001
+From 4a1d676522d6b56cbe9a45c3b040afaa27d37f78 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -22,10 +22,10 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 21da8e2..7d1ef85 100644
+index 3c55a56..eb52fd1 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -155,7 +155,7 @@ class Dependency:
+@@ -185,7 +185,7 @@ class Dependency:
      def get_exe_args(self, compiler):
          return []
  
@@ -34,7 +34,7 @@ index 21da8e2..7d1ef85 100644
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -214,7 +214,7 @@ class InternalDependency(Dependency):
+@@ -248,7 +248,7 @@ class InternalDependency(Dependency):
          self.sources = sources
          self.ext_deps = ext_deps
  
@@ -43,7 +43,7 @@ index 21da8e2..7d1ef85 100644
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -639,15 +639,18 @@ class PkgConfigDependency(ExternalDependency):
+@@ -670,15 +670,18 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -65,7 +65,7 @@ index 21da8e2..7d1ef85 100644
          # Always copy the environment since we're going to modify it
          # with pkg-config variables
          if env is None:
-@@ -663,7 +666,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -698,7 +701,7 @@ class PkgConfigDependency(ExternalDependency):
          targs = tuple(args)
          cache = PkgConfigDependency.pkgbin_cache
          if (self.pkgbin, targs, fenv) not in cache:
@@ -74,16 +74,16 @@ index 21da8e2..7d1ef85 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args):
-@@ -845,7 +848,7 @@ class PkgConfigDependency(ExternalDependency):
-                                       (self.name, out_raw))
-         self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
+@@ -926,7 +929,7 @@ class PkgConfigDependency(ExternalDependency):
+             mlog.warning('Could not determine complete list of dependencies for %s' % self.name)
+         self.link_args, self.raw_link_args = self._search_libs(out, out_raw, out_all)
  
 -    def get_pkgconfig_variable(self, variable_name, kwargs):
 +    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -858,7 +861,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -939,7 +942,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
diff --git a/meta/recipes-devtools/meson/meson/vala-cross-compile.patch b/meta/recipes-devtools/meson/meson/vala-cross-compile.patch
deleted file mode 100644
index 816f810c054..00000000000
--- a/meta/recipes-devtools/meson/meson/vala-cross-compile.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 77c3e6a4aaed07e626f4bf4deb7eb66e0f03a33d Mon Sep 17 00:00:00 2001
-From: James Westman <flyingpimonster@flyingpimonster.net>
-Date: Mon, 24 Jun 2019 12:04:12 -0500
-Subject: [PATCH] Fix two errors when cross-compiling with Vala
-
-- AttributeError: 'ValaCompiler' object has no attribute 'get_program_dirs'
-
-  Fixed by adding a `get_program_dirs()` function to the base Compiler
-  class, to match `get_library_dirs()`
-
-- KeyError: 'vala_COMPILER'
-
-  Fixed by creating the Vala compile rules for all machines, not just
-  the build machine.
-
-Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/77c3e6a4aaed07e626f4bf4deb7eb66e0f03a33d]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- mesonbuild/backend/ninjabackend.py | 3 +--
- mesonbuild/compilers/compilers.py  | 3 +++
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
-index a454e6ab5f..b830e377e4 100644
---- a/mesonbuild/backend/ninjabackend.py
-+++ b/mesonbuild/backend/ninjabackend.py
-@@ -1653,8 +1653,7 @@ def generate_compile_rule_for(self, langname, compiler):
-                 self.generate_cs_compile_rule(compiler)
-             return
-         if langname == 'vala':
--            if self.environment.machines.matches_build_machine(compiler.for_machine):
--                self.generate_vala_compile_rules(compiler)
-+            self.generate_vala_compile_rules(compiler)
-             return
-         if langname == 'rust':
-             self.generate_rust_compile_rules(compiler)
-diff --git a/mesonbuild/compilers/compilers.py b/mesonbuild/compilers/compilers.py
-index 5855de71c8..86c1e33407 100644
---- a/mesonbuild/compilers/compilers.py
-+++ b/mesonbuild/compilers/compilers.py
-@@ -1117,6 +1117,9 @@ def find_library(self, *args, **kwargs):
-     def get_library_dirs(self, *args, **kwargs):
-         return ()
- 
-+    def get_program_dirs(self, *args, **kwargs):
-+        return ()
-+
-     def has_multi_arguments(self, args, env) -> Tuple[bool, bool]:
-         raise EnvironmentException(
-             'Language {} does not support has_multi_arguments.'.format(
diff --git a/meta/recipes-devtools/meson/meson_0.51.2.bb b/meta/recipes-devtools/meson/meson_0.52.0.bb
similarity index 97%
rename from meta/recipes-devtools/meson/meson_0.51.2.bb
rename to meta/recipes-devtools/meson/meson_0.52.0.bb
index de9b905c12b..897fa148d94 100644
--- a/meta/recipes-devtools/meson/meson_0.51.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.52.0.bb
@@ -1,4 +1,3 @@
 include meson.inc
 
 BBCLASSEXTEND = "native"
-
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.51.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.52.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.51.2.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.52.0.bb
-- 
2.17.1


