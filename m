Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.7682.1614526640305229238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WuEwC19j;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id hs11so23556637ejc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UGFXfF0OWplFOUXtZhwUrBZQLIoyQphYDl/wkqAX9LQ=;
        b=WuEwC19jcISu3FmnWnsPHkKSHLuT/54I5O7qzYj1BGXzXgV4cKE8dwnG2/p2L6eKGg
         js8CNoc+3yfNTRsuWM6goUrx2W7rSkJ79ZX9YTYpFISJgUe+PialHUtYpan/NQkM6m3s
         1y/9474TGw1BeZrCTLJKPGxyUGifiKmr1I5wcKBtMPaup4EaNFht2WNG3Oz1g9ORCkOg
         VfY2PV/FYfW8hT4MGTT6QI5AgOezSV+ir8ZFOa1LKFERqMh30VoI+/Bhcb6rQOq4erfB
         XMvaMMg9Lm2CdHHnFmzXRuoEuKAxCnkFu4mJ2U2iuSkP8fFBxFSDmneA6eah0MdTAbG3
         B8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UGFXfF0OWplFOUXtZhwUrBZQLIoyQphYDl/wkqAX9LQ=;
        b=cpu6UDzLa6hn+VSmCjlqiA5nUU0y9PC/iHWiKT5CGV0NlQ1BCeZoMb/LSw+R5OwJ/u
         qngG+uZ3vRgktF9i+vEoPCPF/T89qM3I9L30UWSaLjeI0TEQ2amGGavzhLbxOlVjFJJj
         Z6OnkD5/Wu4+LMfaIjRlsBi0QA0jpXhTtPiiwq5a4CrQ4einjcplkv6OUpTXjz9Uvry1
         LQTdTFD54MRjOvz+EIT9gkGqhgiEIBYHwH4XAp92+e2EY/ABn8Hf3VMPnjO/yqs9iL2O
         ueQFtNVopr2+xJyJaJJQBDb4mJIhx8Ff1eqhIU0euWxfztKUaJIzj4G6bh0mAsmOuXdV
         OoFw==
X-Gm-Message-State: AOAM532sxtL5/FmkM93ftZX+AoXIeFZbg3FVN9QRm+pkIC2t6oVJ9cSU
	KNcbZeJ0ljH+iBwSJBZMhvn6BL8JTQA0FQ==
X-Google-Smtp-Source: ABdhPJzP5XJ3zWmwUJRWuU6Q1dymYIfDO0qpQztXtAMsFVhQIpICaGXGCqHzOVtEMkJXgkcJBuKLdg==
X-Received: by 2002:a17:907:3da5:: with SMTP id he37mr12237751ejc.300.1614526638873;
        Sun, 28 Feb 2021 07:37:18 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:18 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/24] meson: update 0.56.2 -> 0.57.1
Date: Sun, 28 Feb 2021 16:36:48 +0100
Message-Id: <20210228153702.498275-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hacky 0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
with entries in meson.cross.

Rest of the patches are refreshed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/meson.bbclass                    |  2 +
 meta/recipes-devtools/meson/meson.inc         |  3 +-
 .../0001-Make-CPU-family-warnings-fatal.patch | 10 ++---
 ...g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch | 37 -------------------
 ...y-do-not-substitute-python-s-install.patch | 14 +++----
 ...pport-building-allarch-recipes-again.patch |  6 +--
 .../meson/meson/0003-native_bindir.patch      | 27 +++++++-------
 .../meson/meson/disable-rpath-handling.patch  | 12 +++---
 .../{meson_0.56.2.bb => meson_0.57.1.bb}      |  0
 ...on_0.56.2.bb => nativesdk-meson_0.57.1.bb} |  0
 10 files changed, 36 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
 rename meta/recipes-devtools/meson/{meson_0.56.2.bb => meson_0.57.1.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.56.2.bb => nativesdk-meson_0.57.1.bb} (100%)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 83aa854b7e..a7644e70cb 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -99,6 +99,8 @@ readelf = ${@meson_array('READELF', d)}
 pkgconfig = 'pkg-config'
 llvm-config = 'llvm-config${LLVMVERSION}'
 cups-config = 'cups-config'
+g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
+g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
 
 [properties]
 needs_exe_wrapper = true
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index d0ebec9911..622c22affd 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -14,9 +14,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://disable-rpath-handling.patch \
            file://cross-prop-default.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
-           file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
            "
-SRC_URI[sha256sum] = "3cb8bdb91383f7f8da642f916e4c44066a29262caa499341e2880f010edb87f4"
+SRC_URI[sha256sum] = "72e1c782ba9bda204f4a1ed57f98d027d7b6eb9414c723eebbd6ec7f1955c8a6"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index edd262df5a..0808891a27 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 248d17b7221e7ebc9d84154eac11ae4ebb5189ab Mon Sep 17 00:00:00 2001
+From 76934bcbf2cfa7304e8864e28c51f58adda0392f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 13d0ba5..5ba3a1a 100644
+index ba35d16..2d3c34c 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -254,7 +254,7 @@ class MachineInfo:
+@@ -262,7 +262,7 @@ class MachineInfo:
  
          cpu_family = literal['cpu_family']
          if cpu_family not in known_cpu_families:
@@ -25,10 +25,10 @@ index 13d0ba5..5ba3a1a 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 588005b..988e3ea 100644
+index 756dd81..4d2c2b6 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -400,9 +400,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -434,9 +434,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
              trial = 'ppc64'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch b/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
deleted file mode 100644
index a1f8422d44..0000000000
--- a/meta/recipes-devtools/meson/meson/0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 64aa6718c290e150dafd8da83f31cb08af00af0e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 27 May 2020 16:43:05 +0000
-Subject: [PATCH] gnome.py: prefix g-i paths with PKG_CONFIG_SYSROOT_DIR
-
-When using sysroots for builds, the standard target paths for the
-tools need to be prefixed (pkg-config is not clever enough to
-determine when a custom variable is a path)
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- mesonbuild/modules/gnome.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 52016f4..2b72ee4 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -410,14 +410,14 @@ class GnomeModule(ExtensionModule):
-             if giscanner is not None:
-                 self.giscanner = ExternalProgram.from_entry('g-ir-scanner', giscanner)
-             elif self.gir_dep.type_name == 'pkgconfig':
--                self.giscanner = ExternalProgram('g_ir_scanner', self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {}))
-+                self.giscanner = ExternalProgram('g_ir_scanner', os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {}))
-             else:
-                 self.giscanner = self.interpreter.find_program_impl('g-ir-scanner')
-             gicompiler = state.environment.lookup_binary_entry(MachineChoice.HOST, 'g-ir-compiler')
-             if gicompiler is not None:
-                 self.gicompiler = ExternalProgram.from_entry('g-ir-compiler', gicompiler)
-             elif self.gir_dep.type_name == 'pkgconfig':
--                self.gicompiler = ExternalProgram('g_ir_compiler', self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {}))
-+                self.gicompiler = ExternalProgram('g_ir_compiler', os.environ['PKG_CONFIG_SYSROOT_DIR'] + self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {}))
-             else:
-                 self.gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
-         return self.gir_dep, self.giscanner, self.gicompiler
diff --git a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
index c0ad01e9d3..231414fcb6 100644
--- a/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
+++ b/meta/recipes-devtools/meson/meson/0001-modules-python.py-do-not-substitute-python-s-install.patch
@@ -1,4 +1,4 @@
-From 214e559d394491b1376e4cc370f75151117a3f83 Mon Sep 17 00:00:00 2001
+From f8f67c8d5c3f374b1e30e2d40cb56a79f0544471 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 18 Apr 2019 17:36:11 +0200
 Subject: [PATCH] modules/python.py: do not substitute python's install prefix
@@ -12,11 +12,11 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- mesonbuild/modules/python.py | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
+ mesonbuild/modules/python.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
-index 2f0c644..d2aa565 100644
+index eda70ce..18edd15 100644
 --- a/mesonbuild/modules/python.py
 +++ b/mesonbuild/modules/python.py
 @@ -251,7 +251,7 @@ INTROSPECT_COMMAND = '''import sysconfig
@@ -28,11 +28,7 @@ index 2f0c644..d2aa565 100644
  
  def links_against_libpython():
      from distutils.core import Distribution, Extension
-@@ -276,12 +276,11 @@ class PythonInstallation(ExternalProgramHolder):
-         ExternalProgramHolder.__init__(self, python, interpreter.subproject)
-         self.interpreter = interpreter
-         self.subproject = self.interpreter.subproject
--        prefix = self.interpreter.environment.coredata.get_builtin_option('prefix')
+@@ -280,8 +280,8 @@ class PythonInstallation(ExternalProgramHolder):
          self.variables = info['variables']
          self.paths = info['paths']
          install_paths = info['install_paths']
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 2bbd2c149c..ddc34c2f49 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 3c0d3d1a32d4a66aa0b7ab9af3e975243855a1db Mon Sep 17 00:00:00 2001
+From 6efb6114836fd4a1e012aa03b37f3beeeb22b466 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,10 +13,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 5ba3a1a..0bf4969 100644
+index 2d3c34c..b9e7908 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -38,6 +38,7 @@ _T = T.TypeVar('_T')
+@@ -36,6 +36,7 @@ from pathlib import Path
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index fb55a05187..ed85116c4f 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From cbc27ee1576b4d04ad8e9d80760c63a9d3b7f5ed Mon Sep 17 00:00:00 2001
+From 1546e1f95a119175b7a4e4272a26dd85505e5ede Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -15,16 +15,17 @@ that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+
 ---
  mesonbuild/dependencies/base.py | 19 +++++++++++--------
  mesonbuild/dependencies/ui.py   |  6 +++---
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 3a5f5f8..0af89f8 100644
+index cd77b4b..7e3f338 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -183,7 +183,7 @@ class Dependency:
+@@ -192,7 +192,7 @@ class Dependency:
      def get_exe_args(self, compiler):
          return []
  
@@ -33,16 +34,16 @@ index 3a5f5f8..0af89f8 100644
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -261,7 +261,7 @@ class InternalDependency(Dependency):
-                 setattr(result, k, copy.deepcopy(v, memo))
-         return result
+@@ -280,7 +280,7 @@ class InternalDependency(Dependency):
+             return True
+         return any(d.is_built() for d in self.ext_deps)
  
 -    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
 +    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -639,8 +639,11 @@ class PkgConfigDependency(ExternalDependency):
+@@ -658,8 +658,11 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -56,16 +57,16 @@ index 3a5f5f8..0af89f8 100644
          p, out, err = Popen_safe(cmd, env=env)
          rc, out, err = p.returncode, out.strip(), err.strip()
          call = ' '.join(cmd)
-@@ -666,7 +669,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -685,7 +688,7 @@ class PkgConfigDependency(ExternalDependency):
+             env['PKG_CONFIG_LIBDIR'] = new_pkg_config_libdir
              mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
  
- 
 -    def _call_pkgbin(self, args, env=None):
 +    def _call_pkgbin(self, args, env=None, use_native=False):
          # Always copy the environment since we're going to modify it
          # with pkg-config variables
          if env is None:
-@@ -680,7 +683,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -699,7 +702,7 @@ class PkgConfigDependency(ExternalDependency):
          targs = tuple(args)
          cache = PkgConfigDependency.pkgbin_cache
          if (self.pkgbin, targs, fenv) not in cache:
@@ -74,7 +75,7 @@ index 3a5f5f8..0af89f8 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
-@@ -889,7 +892,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -905,7 +908,7 @@ class PkgConfigDependency(ExternalDependency):
                                        (self.name, out_raw))
          self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
  
@@ -83,7 +84,7 @@ index 3a5f5f8..0af89f8 100644
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -902,7 +905,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -918,7 +921,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -93,7 +94,7 @@ index 3a5f5f8..0af89f8 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index 5dffd3a..fb3a178 100644
+index d897d76..a598d2e 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
 @@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):
diff --git a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
index 4653a72a20..7c766c61b0 100644
--- a/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
+++ b/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
@@ -1,4 +1,4 @@
-From 9e3fcf192c1ca068d310c648c311f9d850214421 Mon Sep 17 00:00:00 2001
+From 27bbd3c9d8d86de545fcf6608564a14571c98a61 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 23 Nov 2018 15:28:28 +0000
 Subject: [PATCH] meson: Disable rpath stripping at install time
@@ -16,17 +16,17 @@ Upstream-Status: Submitted [https://github.com/mesonbuild/meson/issues/2567]
  1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
-index 0be01fe..5406cab 100644
+index 212568a..06366d4 100644
 --- a/mesonbuild/minstall.py
 +++ b/mesonbuild/minstall.py
-@@ -512,8 +512,11 @@ class Installer:
+@@ -653,8 +653,11 @@ class Installer:
              if file_copied:
                  self.did_install_something = True
                  try:
--                    depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
--                                       install_name_mappings, verbose=False)
+-                    self.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
+-                                         install_name_mappings, verbose=False)
 +                    if install_rpath:
-+                        depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
++                        self.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
 +                                           install_name_mappings, verbose=False)
 +                    else:
 +                        print("RPATH changes at install time disabled")
diff --git a/meta/recipes-devtools/meson/meson_0.56.2.bb b/meta/recipes-devtools/meson/meson_0.57.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.56.2.bb
rename to meta/recipes-devtools/meson/meson_0.57.1.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.57.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.56.2.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.57.1.bb
-- 
2.29.2

