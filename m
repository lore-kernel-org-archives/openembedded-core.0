Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.17530.1590940461535093788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O2rPqVui;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n24so6894664ejd.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OwvBaniY2GyudiD8RUm/iB7og4prKeDz5X2lzYnNaMw=;
        b=O2rPqVuien6A3M+TkFEvbLAc1mFPLW+4exo1VKNpJJug6lPaCxeQwrJWHRuCmj35Au
         nrnLANcGB5QBZyNaCusrIjoo3wWzdAQBMEXTN/VGN8wt6A4Gv7xndm1WJm1dwon/pHtn
         wD39T+t5ng9rRw+JjHBUAH/HGlru7ZscNaCzRHy2bYXlu47hIapWZAKCEuoXQid2pXwt
         aOS3MFwcObdMAiceBUP4o0I7qRNTQ3MOG5WilQZRfb/NEKpRKmbp1lAwwvwvb5ioATBU
         iqqJPP3aE8aXjwEmmBwd8NeYNpzIuy/zJj6qryAnqi1xtjK6rWWNrs9w+qa+RitTgsa7
         Pciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OwvBaniY2GyudiD8RUm/iB7og4prKeDz5X2lzYnNaMw=;
        b=TRajzM8DC2NEv4TwdjPfcq0zv4XEdezlQzcqia/R5FB6K1lTSK3lCfOdIL6SESxpHm
         w1ct6WIZmYHntY8nGIdYiPA0vTqE8SfkNcdBRUXtjdjliqm/+CrAd72EFlx20oA93s5G
         ilf8OZMnYhdqbt/En+GeE2lUJMjyFHY/CsdGVa6wrgh+RhIfQ6aRg+reQ2dFRZpCcVXE
         zWU7yhuFF/Bt7prbEhw2VYSvsctnwROG7URuXRXwGDqL+9m3K63lrSNzE6gU1JCfNlPu
         BE1bxpxzkU0kZP7RA5E8sgZWDGA+tfwjWnbmobITkLcxaIdNKl46H2+eOHxJ3IQAWUUL
         zIJA==
X-Gm-Message-State: AOAM531Rwd7NgjbNo1SNqYU5DD21OEvhe3cBFo0N3DhCPvGM0R65BZcT
	pUhrOScSPJzCjlWsOEPbPhieYtIi
X-Google-Smtp-Source: ABdhPJzfSWPNb7bCNcJTcgBiucjYbST7TfjiEpsWAc2K2rvvxoeQ273Q0DH5it/+ttdVbTcY48tqUA==
X-Received: by 2002:a17:906:1cc6:: with SMTP id i6mr15375495ejh.552.1590940459578;
        Sun, 31 May 2020 08:54:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 59/70] meson: upgrade 0.53.2 -> 0.54.2
Date: Sun, 31 May 2020 17:52:43 +0200
Message-Id: <20200531155254.10283-59-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-mesonbuild-environment.py-check-environment-for-vari.patch
as upstream has refactored the code.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  6 +--
 .../0001-Make-CPU-family-warnings-fatal.patch | 10 ++---
 ...g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch | 41 +++++++++++++++++++
 ...onment.py-check-environment-for-vari.patch | 26 ------------
 ...pport-building-allarch-recipes-again.patch |  6 +--
 ...ction-determine-g-ir-scanner-and-g-i.patch | 40 ------------------
 .../meson/meson/0003-native_bindir.patch      | 26 ++++++------
 .../meson/meson/disable-rpath-handling.patch  | 25 +++++++----
 .../{meson_0.53.2.bb => meson_0.54.2.bb}      |  0
 ...on_0.53.2.bb => nativesdk-meson_0.54.2.bb} |  0
 10 files changed, 81 insertions(+), 99 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
 rename meta/recipes-devtools/meson/{meson_0.53.2.bb => meson_0.54.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.53.2.bb => nativesdk-meson_0.54.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 0a58c971ae..12bc08648a 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -9,16 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
            file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
-           file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0003-native_bindir.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
            file://cross-prop-default.patch \
-           file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
+           file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
            "
-SRC_URI[sha256sum] = "3e8f830f33184397c2eb0b651ec502adb63decb28978bdc84b3558d71284c21f"
-SRC_URI[md5sum] = "80303535995fcae72bdb887df102b421"
+SRC_URI[sha256sum] = "a7716eeae8f8dff002e4147642589ab6496ff839e4376a5aed761f83c1fa0455"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 9ce31e5489..8b2263588c 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From ee638fd4a299bfc53a2238e9f71ae310c8d97460 Mon Sep 17 00:00:00 2001
+From 830db2c7a136b2446d740c9ca025374352ffd16d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 0f277a7..24578ea 100644
+index 17058df..18bbf86 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -192,7 +192,7 @@ class MachineInfo:
+@@ -225,7 +225,7 @@ class MachineInfo:
  
          cpu_family = literal['cpu_family']
          if cpu_family not in known_cpu_families:
@@ -25,10 +25,10 @@ index 0f277a7..24578ea 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index dc8b14f..3aab71e 100644
+index a2f78a4..59fcb07 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -354,9 +354,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -364,9 +364,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          trial = 'parisc'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch b/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
new file mode 100644
index 0000000000..35c18f0785
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
@@ -0,0 +1,41 @@
+From 7be634fa9705d0367f48a91305f9acb642ff0a11 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 27 May 2020 16:43:05 +0000
+Subject: [PATCH] gnome.py: prefix g-i paths with PKG_CONFIG_SYSROOT_DIR
+
+When using sysroots for builds, the standard target paths for the
+tools need to be prefixed (pkg-config is not clever enough to
+determine when a custom variable is a path)
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/modules/gnome.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index 89d5d5d..d75f2e5 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -739,17 +739,17 @@ class GnomeModule(ExtensionModule):
+         if giscanner.found():
+             giscanner_path = giscanner.get_command()[0]
+             if not any(x in giscanner_path for x in gi_util_dirs_check):
+-                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
++                giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
+         else:
+-            giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
++            giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
+ 
+         gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
+         if gicompiler.found():
+             gicompiler_path = gicompiler.get_command()[0]
+             if not any(x in gicompiler_path for x in gi_util_dirs_check):
+-                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
++                gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
+         else:
+-            gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
++            gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
+ 
+         ns = kwargs.pop('namespace')
+         nsversion = kwargs.pop('nsversion')
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
deleted file mode 100644
index f4456235fe..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a72dc2b1cddcf180ce782860896deae0b12d5000 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 25 Mar 2019 18:52:48 +0100
-Subject: [PATCH] mesonbuild/environment.py: check environment for various
- binaries
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- mesonbuild/environment.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 9a029f4..0cfdf9c 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -448,7 +448,7 @@ class Environment:
-             config = MesonConfigFile.from_config_parser(
-                 coredata.load_configs(self.coredata.cross_files))
-             properties.host = Properties(config.get('properties', {}), False)
--            binaries.host = BinaryTable(config.get('binaries', {}), False)
-+            binaries.host = BinaryTable(config.get('binaries', {}), True)
-             if 'host_machine' in config:
-                 machines.host = MachineInfo.from_literal(config['host_machine'])
-             if 'target_machine' in config:
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index ce18660756..18517a6e26 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 9c221c74bd306dfa6fec22c8f156eb9d4e4f7fcb Mon Sep 17 00:00:00 2001
+From 45df8f0a71c6b60cb98a336f8690af04965dfa9b Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,10 +13,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 24578ea..216e71f 100644
+index 18bbf86..e76315e 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -36,6 +36,7 @@ _T = typing.TypeVar('_T')
+@@ -36,6 +36,7 @@ _T = T.TypeVar('_T')
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch b/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
deleted file mode 100644
index 61b26bb883..0000000000
--- a/meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9ccaed380780178c4dab3a681f652ac7cd27452d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 4 Aug 2017 16:18:47 +0300
-Subject: [PATCH] gobject-introspection: determine g-ir-scanner and
- g-ir-compiler paths from pkgconfig
-
-Do not hardcode the name of those binaries; gobject-introspection
-provides them via pkgconfig, and they can be set to something else
-(for example when cross-compiling).
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- mesonbuild/modules/gnome.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 7c5a363..0002498 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -744,15 +744,15 @@ class GnomeModule(ExtensionModule):
-         if kwargs.get('install_dir'):
-             raise MesonException('install_dir is not supported with generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
- 
--        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
--        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
--
-         girtargets = [self._unwrap_gir_target(arg, state) for arg in args]
- 
-         if len(girtargets) > 1 and any([isinstance(el, build.Executable) for el in girtargets]):
-             raise MesonException('generate_gir only accepts a single argument when one of the arguments is an executable')
- 
-         self.gir_dep, pkgargs = self._get_gir_dep(state)
-+        giscanner = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
-+        gicompiler = os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
-+
- 
-         ns = kwargs.pop('namespace')
-         nsversion = kwargs.pop('nsversion')
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index dc822fb1fc..fb119ae852 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From e76726321067748362b39937bd1e663a1a948ad5 Mon Sep 17 00:00:00 2001
+From da2091f6dfe978fc6140fc2d01bcafbbfae8d8db Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -22,10 +22,10 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 40e304c..4b687df 100644
+index 50f4179..e1529d8 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -184,7 +184,7 @@ class Dependency:
+@@ -157,7 +157,7 @@ class Dependency:
      def get_exe_args(self, compiler):
          return []
  
@@ -34,16 +34,16 @@ index 40e304c..4b687df 100644
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -247,7 +247,7 @@ class InternalDependency(Dependency):
-         self.sources = sources
+@@ -225,7 +225,7 @@ class InternalDependency(Dependency):
          self.ext_deps = ext_deps
+         self.variables = variables
  
 -    def get_pkgconfig_variable(self, variable_name, kwargs):
 +    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -673,15 +673,18 @@ class PkgConfigDependency(ExternalDependency):
+@@ -633,15 +633,18 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -65,7 +65,7 @@ index 40e304c..4b687df 100644
          # Always copy the environment since we're going to modify it
          # with pkg-config variables
          if env is None:
-@@ -701,7 +704,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -667,7 +670,7 @@ class PkgConfigDependency(ExternalDependency):
          targs = tuple(args)
          cache = PkgConfigDependency.pkgbin_cache
          if (self.pkgbin, targs, fenv) not in cache:
@@ -74,7 +74,7 @@ index 40e304c..4b687df 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
-@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -876,7 +879,7 @@ class PkgConfigDependency(ExternalDependency):
                                        (self.name, out_raw))
          self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
  
@@ -83,7 +83,7 @@ index 40e304c..4b687df 100644
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -920,7 +923,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -889,7 +892,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -93,10 +93,10 @@ index 40e304c..4b687df 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index da411ef..856506a 100644
+index 741f0b8..134dd54 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
-@@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):
+@@ -320,7 +320,7 @@ class QtBaseDependency(ExternalDependency):
          self.bindir = self.get_pkgconfig_host_bins(core)
          if not self.bindir:
              # If exec_prefix is not defined, the pkg-config file is broken
@@ -105,7 +105,7 @@ index da411ef..856506a 100644
              if prefix:
                  self.bindir = os.path.join(prefix, 'bin')
  
-@@ -508,7 +508,7 @@ class Qt4Dependency(QtBaseDependency):
+@@ -524,7 +524,7 @@ class Qt4Dependency(QtBaseDependency):
          applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
          for application in applications:
              try:
@@ -114,7 +114,7 @@ index da411ef..856506a 100644
              except MesonException:
                  pass
  
-@@ -518,7 +518,7 @@ class Qt5Dependency(QtBaseDependency):
+@@ -534,7 +534,7 @@ class Qt5Dependency(QtBaseDependency):
          QtBaseDependency.__init__(self, 'qt5', env, kwargs)
  
      def get_pkgconfig_host_bins(self, core):
diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
index 4b1fb57dd4..38e50d72f4 100644
--- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
+++ b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
@@ -1,4 +1,9 @@
-We need to allow our rpaths generated through the compiler flags to make it into 
+From 3af10fa8cd4e97181288d72227dea712290fd5e6 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 23 Nov 2018 15:28:28 +0000
+Subject: [PATCH] meson: Disable rpath stripping at install time
+
+We need to allow our rpaths generated through the compiler flags to make it into
 our binaries. Therefore disable the meson manipulations of these unless there
 is a specific directive to do something differently in the project.
 
@@ -6,13 +11,17 @@ RP 2018/11/23
 
 Upstream-Status: Submitted [https://github.com/mesonbuild/meson/issues/2567]
 
-Index: meson-0.47.2/mesonbuild/minstall.py
-===================================================================
---- meson-0.47.2.orig/mesonbuild/minstall.py
-+++ meson-0.47.2/mesonbuild/minstall.py
-@@ -486,8 +486,11 @@ class Installer:
-                         printed_symlink_error = True
-             if os.path.isfile(outname):
+---
+ mesonbuild/minstall.py | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
+index ace0569..85bd8df 100644
+--- a/mesonbuild/minstall.py
++++ b/mesonbuild/minstall.py
+@@ -508,8 +508,11 @@ class Installer:
+             if file_copied:
+                 self.did_install_something = True
                  try:
 -                    depfixer.fix_rpath(outname, install_rpath, final_path,
 -                                       install_name_mappings, verbose=False)
diff --git a/meta/recipes-devtools/meson/meson_0.53.2.bb b/meta/recipes-devtools/meson/meson_0.54.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.53.2.bb
rename to meta/recipes-devtools/meson/meson_0.54.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.54.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.53.2.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.54.2.bb
-- 
2.26.2

