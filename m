Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.31205.1620651683395830659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eZ5Ppro2;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id b25so24343199eju.5
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+uAJaTy+DX97hqSkR1eqyoh72pTiNTppx7os62ct8ms=;
        b=eZ5Ppro2kF2FsSD6GMhms+jNMxGCxJuyrfNyJwHkkhKTohpib9hpWXg7WtiCZNOyG/
         NsGOqKODLTFbM9+edy9iuDsy7XiutwDxWStC8onkaJkxEpfI1WuAghqwx+piSwM1jj6S
         JG5zLaCS710vbo+IL94hFGT/5NDIqrYNm4l2FcIVcw85VJ2IP3F44edS2UbJohhQdEny
         sRWy2hSC+MHMBnbWob9BGvxYxfdS2uQ8XzmRqV/2IT9aJ0UOTmp74VFOWpC4n0OAMgwj
         ERLEw9z4MNl48vlpuhOh5wmm2QjwiXfxdS6gUd0t98LDWC5luLBkS96u+LpriX1SuLI+
         P0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+uAJaTy+DX97hqSkR1eqyoh72pTiNTppx7os62ct8ms=;
        b=HEMQhne6I2KN226XbJ5uJchc0rufwPBbZnxsjOFyAM+trvvmkc/3aZD17pvGnoD31w
         +dY21ZBoumWAcwlgbt1H12qI74zjqHy6wNJlKT2h3GeW8x/xb0g3y95fVgkr9DZXOTk6
         ySrH0Co4ZAYL8sHutbDRl6yMmfFwlbdomSyRyYdtlBnRF9SMLLMFu5ZxvvqrpGzroHMU
         B3uB4PSlVaPDfwvbOIX+7gf968euh/nM2OVDoerIIFYGx3lYRim1SLAFMXrdO1hyasBb
         umnc7NC0L/M7i7Q1lgvt1ng8snOmIVuaLi4wuTnXwZykkcozOdmV+Q8Q0koho/kx7Yte
         nvNg==
X-Gm-Message-State: AOAM531QfylU49u8druP8u75vxYYdc/lRMQoliQDd68D0fnEXuNcYe+2
	KnYuGZ/I5FzoPk9r48L7DwbKruR/B/k=
X-Google-Smtp-Source: ABdhPJz/4MrIDeG6PIGOmmMAdVG6EgCjgMiPr+rMIYs0VRQrwXZh0RoA2kFfQbhwpnXITymIsphhtg==
X-Received: by 2002:a17:906:1684:: with SMTP id s4mr25334774ejd.506.1620651681842;
        Mon, 10 May 2021 06:01:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id pw11sm9057361ejb.88.2021.05.10.06.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:01:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 7/8] meson: update 0.57.2 -> 0.58.0
Date: Mon, 10 May 2021 15:01:09 +0200
Message-Id: <20210510130110.939820-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510130110.939820-1-alex.kanavin@gmail.com>
References: <20210510130110.939820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebase patches; dropped chunks (and cross-prop-default.patch)
have been removed upstream.

Move native-only patches to all-patches, as they're a pain to rebase
separately.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         | 10 +---
 .../0001-Make-CPU-family-warnings-fatal.patch | 18 +++---
 ...sues-that-arise-when-cross-compiling.patch |  8 +--
 ...-not-manipulate-the-environment-when.patch | 14 ++---
 ...pport-building-allarch-recipes-again.patch | 10 ++--
 .../meson/meson/0003-native_bindir.patch      | 58 +++++--------------
 .../meson/meson/cross-prop-default.patch      | 23 --------
 .../{meson_0.57.2.bb => meson_0.58.0.bb}      |  0
 ...on_0.57.2.bb => nativesdk-meson_0.58.0.bb} |  0
 9 files changed, 43 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/cross-prop-default.patch
 rename meta/recipes-devtools/meson/{meson_0.57.2.bb => meson_0.58.0.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.57.2.bb => nativesdk-meson_0.58.0.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 10e7d8a1ce..12a48fc992 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -12,16 +12,12 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0003-native_bindir.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
-           file://cross-prop-default.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://gi-target-dep.patch \
+           file://0001-Make-CPU-family-warnings-fatal.patch \
+           file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5"
-
-SRC_URI_append_class-native = " \
-    file://0001-Make-CPU-family-warnings-fatal.patch \
-    file://0002-Support-building-allarch-recipes-again.patch \
-"
+SRC_URI[sha256sum] = "f4820df0bc969c99019fd4af8ca5f136ee94c63d8a5ad67e7eb73bdbc9182fdd"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 300797f9ee..bcccfabd17 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,34 +1,33 @@
-From 198e2de24adf5845e3ba389b533cf43440ee8acb Mon Sep 17 00:00:00 2001
+From b64032a2eb1fb760f4ffd5b4b666e2433cf80d39 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
-Subject: [PATCH] Make CPU family warnings fatal
+Subject: [PATCH 1/2] Make CPU family warnings fatal
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  mesonbuild/envconfig.py   | 2 +-
  mesonbuild/environment.py | 4 +---
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index ba35d16..2d3c34c 100644
+index c6a4df3..4d58c91 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -262,7 +262,7 @@ class MachineInfo:
+@@ -266,7 +266,7 @@ class MachineInfo:
  
          cpu_family = literal['cpu_family']
          if cpu_family not in known_cpu_families:
--            mlog.warning('Unknown CPU family {}, please report this at https://github.com/mesonbuild/meson/issues/new'.format(cpu_family))
+-            mlog.warning(f'Unknown CPU family {cpu_family}, please report this at https://github.com/mesonbuild/meson/issues/new')
 +            raise EnvironmentException('Unknown CPU family {}, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.'.format(cpu_family))
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 756dd81..4d2c2b6 100644
+index fc9b703..eea8345 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -434,9 +434,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -436,9 +436,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
              trial = 'ppc64'
  
      if trial not in known_cpu_families:
@@ -39,3 +38,6 @@ index 756dd81..4d2c2b6 100644
  
      return trial
  
+-- 
+2.24.0
+
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index 471f1500da..ce90e515da 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From d3ef01a4208a801acad380a4aaceb6a21f8fa603 Mon Sep 17 00:00:00 2001
+From 2f9c59e0489e569c5382404667c10f5c200a72ad Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:16:41 +0300
 Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
@@ -20,11 +20,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index bcf77b9..6a4b472 100644
+index dc2979e..c9ff9bd 100644
 --- a/mesonbuild/modules/gnome.py
 +++ b/mesonbuild/modules/gnome.py
-@@ -974,6 +974,10 @@ This will become a hard error in the future.''')
-             args.append('--{}={}'.format(program_name, path))
+@@ -1053,6 +1053,10 @@ class GnomeModule(ExtensionModule):
+             args.append(f'--{program_name}={path}')
          if namespace:
              args.append('--namespace=' + namespace)
 +        gtkdoc_exe_wrapper = state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index eb0e90dbdd..fdadc6869b 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 689e28c49b85311f93f39df70cbee702fc44afb6 Mon Sep 17 00:00:00 2001
+From 2264e67d7c2c22ca634fd26ea8ada6f0344ab280 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 12 deletions(-)
 
 diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
-index 07be318..b770603 100644
+index 422155b..aaf5844 100644
 --- a/mesonbuild/modules/python.py
 +++ b/mesonbuild/modules/python.py
-@@ -71,11 +71,6 @@ class PythonDependency(ExternalDependency):
+@@ -70,11 +70,6 @@ class PythonDependency(ExternalDependency):
                  old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
                  old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
  
@@ -26,9 +26,9 @@ index 07be318..b770603 100644
 -
                  try:
                      self.pkgdep = PkgConfigDependency(pkg_name, environment, kwargs)
-                     mlog.debug('Found "{}" via pkgconfig lookup in LIBPC ({})'.format(pkg_name, pkg_libdir))
-@@ -84,13 +79,6 @@ class PythonDependency(ExternalDependency):
-                     mlog.debug('"{}" could not be found in LIBPC ({})'.format(pkg_name, pkg_libdir))
+                     mlog.debug(f'Found "{pkg_name}" via pkgconfig lookup in LIBPC ({pkg_libdir})')
+@@ -83,13 +78,6 @@ class PythonDependency(ExternalDependency):
+                     mlog.debug(f'"{pkg_name}" could not be found in LIBPC ({pkg_libdir})')
                      mlog.debug(e)
  
 -                if old_pkg_path is not None:
@@ -39,5 +39,5 @@ index 07be318..b770603 100644
 -                else:
 -                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
              else:
-                 mlog.debug('"{}" could not be found in LIBPC ({}), this is likely due to a relocated python installation'.format(pkg_name, pkg_libdir))
+                 mlog.debug(f'"{pkg_name}" could not be found in LIBPC ({pkg_libdir}), this is likely due to a relocated python installation')
  
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index f6175a194c..dcc1ce9c27 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,19 +1,18 @@
-From ac1021a3abf612e8be9b19eecb97062e0c314701 Mon Sep 17 00:00:00 2001
+From 656bf55fed01df2d2e2ad6d9d9887173cb16b85c Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
-Subject: [PATCH] Support building allarch recipes again
+Subject: [PATCH 2/2] Support building allarch recipes again
 
 This registers "allarch" as a known CPU family.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
 ---
  mesonbuild/envconfig.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 2d3c34c..b9e7908 100644
+index 4d58c91..ff01ad1 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -36,6 +36,7 @@ from pathlib import Path
@@ -24,3 +23,6 @@ index 2d3c34c..b9e7908 100644
      'aarch64',
      'alpha',
      'arc',
+-- 
+2.24.0
+
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index ed85116c4f..89257b9e05 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From 1546e1f95a119175b7a4e4272a26dd85505e5ede Mon Sep 17 00:00:00 2001
+From 30e97d4090a3d3f5b7ddcaf27cfa17f3c8c1d462 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -18,23 +18,22 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 
 ---
  mesonbuild/dependencies/base.py | 19 +++++++++++--------
- mesonbuild/dependencies/ui.py   |  6 +++---
- 2 files changed, 14 insertions(+), 11 deletions(-)
+ 1 file changed, 11 insertions(+), 8 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index cd77b4b..7e3f338 100644
+index 14380d4..d0c443f 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -192,7 +192,7 @@ class Dependency:
+@@ -179,7 +179,7 @@ class Dependency:
      def get_exe_args(self, compiler):
          return []
  
 -    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
 +    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
-         raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
+         raise DependencyException(f'{self.name!r} is not a pkgconfig dependency')
  
      def get_configtool_variable(self, variable_name):
-@@ -280,7 +280,7 @@ class InternalDependency(Dependency):
+@@ -267,7 +267,7 @@ class InternalDependency(Dependency):
              return True
          return any(d.is_built() for d in self.ext_deps)
  
@@ -43,7 +42,7 @@ index cd77b4b..7e3f338 100644
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -658,8 +658,11 @@ class PkgConfigDependency(ExternalDependency):
+@@ -645,8 +645,11 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -57,16 +56,16 @@ index cd77b4b..7e3f338 100644
          p, out, err = Popen_safe(cmd, env=env)
          rc, out, err = p.returncode, out.strip(), err.strip()
          call = ' '.join(cmd)
-@@ -685,7 +688,7 @@ class PkgConfigDependency(ExternalDependency):
-             env['PKG_CONFIG_LIBDIR'] = new_pkg_config_libdir
-             mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
+@@ -674,7 +677,7 @@ class PkgConfigDependency(ExternalDependency):
+             if key.startswith('PKG_'):
+                 mlog.debug(f'env[{key}]: {value}')
  
 -    def _call_pkgbin(self, args, env=None):
 +    def _call_pkgbin(self, args, env=None, use_native=False):
          # Always copy the environment since we're going to modify it
          # with pkg-config variables
          if env is None:
-@@ -699,7 +702,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -688,7 +691,7 @@ class PkgConfigDependency(ExternalDependency):
          targs = tuple(args)
          cache = PkgConfigDependency.pkgbin_cache
          if (self.pkgbin, targs, fenv) not in cache:
@@ -75,7 +74,7 @@ index cd77b4b..7e3f338 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
-@@ -905,7 +908,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -894,7 +897,7 @@ class PkgConfigDependency(ExternalDependency):
                                        (self.name, out_raw))
          self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
  
@@ -84,7 +83,7 @@ index cd77b4b..7e3f338 100644
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -918,7 +921,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -907,7 +910,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -93,34 +92,3 @@ index cd77b4b..7e3f338 100644
          variable = ''
          if ret != 0:
              if self.required:
-diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index d897d76..a598d2e 100644
---- a/mesonbuild/dependencies/ui.py
-+++ b/mesonbuild/dependencies/ui.py
-@@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):
-         self.bindir = self.get_pkgconfig_host_bins(core)
-         if not self.bindir:
-             # If exec_prefix is not defined, the pkg-config file is broken
--            prefix = core.get_pkgconfig_variable('exec_prefix', {})
-+            prefix = core.get_pkgconfig_variable('exec_prefix', {}, use_native=True)
-             if prefix:
-                 self.bindir = os.path.join(prefix, 'bin')
- 
-@@ -528,7 +528,7 @@ class Qt4Dependency(QtBaseDependency):
-         applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
-         for application in applications:
-             try:
--                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, {}))
-+                return os.path.dirname(core.get_pkgconfig_variable('%s_location' % application, {}, use_native=True))
-             except MesonException:
-                 pass
- 
-@@ -538,7 +538,7 @@ class Qt5Dependency(QtBaseDependency):
-         QtBaseDependency.__init__(self, 'qt5', env, kwargs)
- 
-     def get_pkgconfig_host_bins(self, core):
--        return core.get_pkgconfig_variable('host_bins', {})
-+        return core.get_pkgconfig_variable('host_bins', {}, use_native=True)
- 
-     def get_private_includes(self, mod_inc_dir, module):
-         return _qt_get_private_includes(mod_inc_dir, module, self.version)
diff --git a/meta/recipes-devtools/meson/meson/cross-prop-default.patch b/meta/recipes-devtools/meson/meson/cross-prop-default.patch
deleted file mode 100644
index 772395e879..0000000000
--- a/meta/recipes-devtools/meson/meson/cross-prop-default.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-meson.build files that use cc.run() in native builds can silently fallback to
-meson.get_cross_property() in cross builds without an exe-wrapper, but there's
-no way to know that this is happening.
-
-As the defaults may be pessimistic (for example, disabling the support for a
-feature that should be enabled) emit a warning when the default is used, so that
-the recipe can explicitly set the cross property as relevant.
-
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/5071]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/mesonbuild/interpreter.py b/mesonbuild/interpreter.py
-index 3c3cfae0..10e741ae 100644
---- a/mesonbuild/interpreter.py
-+++ b/mesonbuild/interpreter.py
-@@ -1890,6 +1890,7 @@ class MesonMain(InterpreterObject):
-             return props[propname]
-         except Exception:
-             if len(args) == 2:
-+                mlog.warning('Cross property %s is using default value %s' % (propname, args[1]))
-                 return args[1]
-             raise InterpreterException('Unknown cross property: %s.' % propname)
- 
diff --git a/meta/recipes-devtools/meson/meson_0.57.2.bb b/meta/recipes-devtools/meson/meson_0.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.57.2.bb
rename to meta/recipes-devtools/meson/meson_0.58.0.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.57.2.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.58.0.bb
-- 
2.31.1

