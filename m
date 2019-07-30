Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 00FE27ECB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 15:54:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id y4so66360112wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+/s3F6ibqfIHnMUezwN2u4wKLygxtbhY5muMgIz8eag=;
	b=P9AVCniHV9pUYk+rLmct0CJWx37QhxaouoHALuUzA/CYILEZraQ08IxrqgPYBZNctt
	OgD8XHsCB1J2s1DWKneC8a6lSNk2yj0uhBbBNuw63Hjl3azx4ebCcuaDFMxgNhnAgcb0
	lHLbr9ueubGDzJ+D8gN1ZU6SYTc0lXCKKiTbpvz1ne3NJkThSSWmxHQN/M7PWt1YB1+7
	AGsgYmz55RPXClOSExR9WjSxDdHsJF7YrJhjy+qv2EKU2iY+S1X1JoUr3UhV2/2R29Ix
	aqpouEEHCIRxAMg8asBfFyrtfDUd3MK9XM5ibMhZv2hHK9NsVJmvtex+AWdRqO/J1bOj
	n/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+/s3F6ibqfIHnMUezwN2u4wKLygxtbhY5muMgIz8eag=;
	b=XUO7xNM99Go9HMwyTI5TY3BS7IDT/yJRocHyZiwTx0EnzD9U25T3TqKhDeOXmocrBL
	mPYTVg1O0sEOlALOZnQHrUsBvmVqF3t4z0XxzmQsNYwS87TDsfEEkvZxeLnARmq7+nkc
	/14fQMcX8SO5DTcaG4OBXLl/iIdQ5eUFLqJ/s/DI8+ILzCnrMo1fwXVL8NIdwq0ioZ8F
	bucnx/s338firlcaRUBbJ5uEocJx3zlOGesNLHqfp3QaskWt/4ApiwX5R2LMYvmgdZ+v
	ZbG2tZySmzwPRZ64IoruwbVhIxeH1Lvv9TBAl2etGWqpH6IDNY6e1ysr/FzNS2il7GHW
	aaAg==
X-Gm-Message-State: APjAAAXeh/mPHkOtheNa2ldNW1nsprusdsspGDHi+n2D5C9+iN5lPD20
	ZbbXXkjJHhIuG4GQjRhTG41vj6iN38g=
X-Google-Smtp-Source: APXvYqyVFHffmyZWGz592qVRSddyTS7ISdJGDE+D5i86efTzxsZul2KqvqIKSn+YGKURIVviMQuEBQ==
X-Received: by 2002:a5d:51c8:: with SMTP id n8mr115426395wrv.46.1564502080909; 
	Tue, 30 Jul 2019 08:54:40 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c3sm70781403wrx.19.2019.07.30.08.54.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 08:54:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:54:25 +0200
Message-Id: <20190730155432.96611-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/8] meson: update 0.50.1 -> 0.51.1
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
X-List-Received-Date: Tue, 30 Jul 2019 15:54:41 -0000

Drop backports.

Rebase other patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |   6 +-
 .../0001-Make-CPU-family-warnings-fatal.patch |  10 +-
 ...etect-windows-also-if-the-system-str.patch |  14 +-
 ...onment.py-check-environment-for-vari.patch |  20 +-
 ...onment.py-do-not-determine-whether-a.patch |  10 +-
 ...pport-building-allarch-recipes-again.patch |   6 +-
 .../meson/meson/0003-native_bindir.patch      |  32 +--
 ...ld-allow-multiple-cross-file-options.patch | 185 ------------------
 .../load-configs-generalise-search-path.patch |  53 -----
 .../{meson_0.50.1.bb => meson_0.51.1.bb}      |   0
 ...on_0.50.1.bb => nativesdk-meson_0.51.1.bb} |   0
 11 files changed, 49 insertions(+), 287 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
 rename meta/recipes-devtools/meson/{meson_0.50.1.bb => meson_0.51.1.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.50.1.bb => nativesdk-meson_0.51.1.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 6a723683cc0..b9a05967f46 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -11,15 +11,13 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
            file://cross-prop-default.patch \
-           file://load-configs-generalise-search-path.patch \
-           file://0007-mesonbuild-allow-multiple-cross-file-options.patch \
            file://0001-environment.py-detect-windows-also-if-the-system-str.patch \
            file://0001-mesonbuild-environment.py-do-not-determine-whether-a.patch \
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            "
-SRC_URI[sha256sum] = "f68f56d60c80a77df8fc08fa1016bc5831605d4717b622c96212573271e14ecc"
-SRC_URI[md5sum] = "24a6527796115828d2ebc75880e18d62"
+SRC_URI[sha256sum] = "f27b7a60f339ba66fe4b8f81f0d1072e090a08eabbd6aa287683b2c2b9dd2d82"
+SRC_URI[md5sum] = "48787e391ec5c052799a3dd491f73909"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index adde1e271f1..444fc081686 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 4b4b3d4932d928f05dbd74d730a3c8a5ac371e1d Mon Sep 17 00:00:00 2001
+From f70fee13e4dbc757cd8153cd42d92fa9394fb542 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 5309ef4..3f0a399 100644
+index 03c6346..86b350b 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -178,7 +178,7 @@ class MachineInfo:
+@@ -186,7 +186,7 @@ class MachineInfo:
  
          cpu_family = literal['cpu_family']
          if cpu_family not in known_cpu_families:
@@ -25,10 +25,10 @@ index 5309ef4..3f0a399 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 3031a82..ecd18d0 100644
+index 0cfdf9c..40aa189 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -242,9 +242,7 @@ def detect_cpu_family(compilers):
+@@ -262,9 +262,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          trial = 'parisc'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
index f6043190af0..37b5356d77a 100644
--- a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
+++ b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
@@ -1,4 +1,4 @@
-From 63b78b7990c5d60f7bc674a26f655caa0bec3c49 Mon Sep 17 00:00:00 2001
+From b52e47c9d61dc4c930cfc7236fbeb70338c3b953 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 25 Mar 2019 17:17:06 +0100
 Subject: [PATCH] environment.py: detect windows also if the system string
@@ -6,20 +6,24 @@ Subject: [PATCH] environment.py: detect windows also if the system string
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  mesonbuild/envconfig.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index f2510c1..5309ef4 100644
+index 03c6346..a59cd89 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -194,7 +194,7 @@ class MachineInfo:
+@@ -198,7 +198,7 @@ class MachineInfo:
          """
          Machine is windows?
          """
--        return self.system == 'windows'
+-        return self.system in {'windows', 'mingw'}
 +        return self.system == 'windows' or 'mingw' in self.system
  
-     def is_cygwin(self):
+     def is_cygwin(self) -> bool:
          """
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
index fadb2734f4b..f4456235fe7 100644
--- a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
+++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
@@ -1,4 +1,4 @@
-From 63e79329b5dd00882f0cea56a6d907a831b94171 Mon Sep 17 00:00:00 2001
+From a72dc2b1cddcf180ce782860896deae0b12d5000 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 25 Mar 2019 18:52:48 +0100
 Subject: [PATCH] mesonbuild/environment.py: check environment for various
@@ -6,23 +6,21 @@ Subject: [PATCH] mesonbuild/environment.py: check environment for various
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  mesonbuild/environment.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 6e5d689..bbfd87d 100644
+index 9a029f4..0cfdf9c 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -398,7 +398,7 @@ class Environment:
+@@ -448,7 +448,7 @@ class Environment:
              config = MesonConfigFile.from_config_parser(
-                 coredata.load_configs(self.coredata.cross_files, 'cross'))
-             self.properties.host = Properties(config.get('properties', {}), False)
--            self.binaries.host = BinaryTable(config.get('binaries', {}), False)
-+            self.binaries.host = BinaryTable(config.get('binaries', {}), True)
+                 coredata.load_configs(self.coredata.cross_files))
+             properties.host = Properties(config.get('properties', {}), False)
+-            binaries.host = BinaryTable(config.get('binaries', {}), False)
++            binaries.host = BinaryTable(config.get('binaries', {}), True)
              if 'host_machine' in config:
-                 self.machines.host = MachineInfo.from_literal(config['host_machine'])
+                 machines.host = MachineInfo.from_literal(config['host_machine'])
              if 'target_machine' in config:
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
index 83347145417..8cb11879f4d 100644
--- a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
+++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
@@ -1,4 +1,4 @@
-From d9da5e7a16a9397e22a8900fac4b60b40d7f00de Mon Sep 17 00:00:00 2001
+From ec9c4a22424a5d55fcf213a55d03f096ec24bcae Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 25 Mar 2019 18:18:33 +0100
 Subject: [PATCH] mesonbuild/environment.py: do not determine whether a build
@@ -14,14 +14,14 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index d4f0630..c584fa4 100644
+index 84a7596..9a029f4 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -483,7 +483,7 @@ class Environment:
+@@ -520,7 +520,7 @@ class Environment:
          self.first_invocation = True
  
-     def is_cross_build(self):
--        return self.coredata.cross_file is not None
+     def is_cross_build(self) -> bool:
+-        return not self.machines.matches_build_machine(MachineChoice.HOST)
 +        return self.need_exe_wrapper()
  
      def dump_coredata(self):
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index e47e555324f..8ad86a46e99 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 2164655328ec4e47335fc9033813274365491ad8 Mon Sep 17 00:00:00 2001
+From 3009a1c2f1b736b836a057d84dc11f379cba99cf Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,10 +13,10 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 3f0a399..4509e09 100644
+index 86b350b..aa426ca 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -34,6 +34,7 @@ from . import mlog
+@@ -36,6 +36,7 @@ _T = typing.TypeVar('_T')
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index 2b22531dd0c..57de598d2f1 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From e762d85c823adfefc27ba6128c7b997aa50166ce Mon Sep 17 00:00:00 2001
+From ac38495de38a1ea42e2bc09a2f23c2e945fbc22d Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -22,19 +22,19 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 6d3678f..90fdb80 100644
+index 21da8e2..7d1ef85 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -146,7 +146,7 @@ class Dependency:
-     def need_threads(self):
-         return False
+@@ -155,7 +155,7 @@ class Dependency:
+     def get_exe_args(self, compiler):
+         return []
  
 -    def get_pkgconfig_variable(self, variable_name, kwargs):
 +    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -183,7 +183,7 @@ class InternalDependency(Dependency):
+@@ -214,7 +214,7 @@ class InternalDependency(Dependency):
          self.sources = sources
          self.ext_deps = ext_deps
  
@@ -43,7 +43,7 @@ index 6d3678f..90fdb80 100644
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -523,15 +523,18 @@ class PkgConfigDependency(ExternalDependency):
+@@ -639,15 +639,18 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -62,10 +62,10 @@ index 6d3678f..90fdb80 100644
  
 -    def _call_pkgbin(self, args, env=None):
 +    def _call_pkgbin(self, args, env=None, use_native=False):
+         # Always copy the environment since we're going to modify it
+         # with pkg-config variables
          if env is None:
-             fenv = env
-             env = os.environ
-@@ -540,7 +543,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -663,7 +666,7 @@ class PkgConfigDependency(ExternalDependency):
          targs = tuple(args)
          cache = PkgConfigDependency.pkgbin_cache
          if (self.pkgbin, targs, fenv) not in cache:
@@ -74,7 +74,7 @@ index 6d3678f..90fdb80 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args):
-@@ -718,7 +721,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -845,7 +848,7 @@ class PkgConfigDependency(ExternalDependency):
                                        (self.name, out_raw))
          self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
  
@@ -83,7 +83,7 @@ index 6d3678f..90fdb80 100644
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -731,7 +734,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -858,7 +861,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -93,10 +93,10 @@ index 6d3678f..90fdb80 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index 197d22c..c683d21 100644
+index 6d784e6..73a9e13 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
-@@ -285,7 +285,7 @@ class QtBaseDependency(ExternalDependency):
+@@ -330,7 +330,7 @@ class QtBaseDependency(ExternalDependency):
          self.bindir = self.get_pkgconfig_host_bins(core)
          if not self.bindir:
              # If exec_prefix is not defined, the pkg-config file is broken
@@ -105,7 +105,7 @@ index 197d22c..c683d21 100644
              if prefix:
                  self.bindir = os.path.join(prefix, 'bin')
  
-@@ -427,7 +427,7 @@ class Qt4Dependency(QtBaseDependency):
+@@ -507,7 +507,7 @@ class Qt4Dependency(QtBaseDependency):
          applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
          for application in applications:
              try:
@@ -114,7 +114,7 @@ index 197d22c..c683d21 100644
              except MesonException:
                  pass
  
-@@ -437,7 +437,7 @@ class Qt5Dependency(QtBaseDependency):
+@@ -517,7 +517,7 @@ class Qt5Dependency(QtBaseDependency):
          QtBaseDependency.__init__(self, 'qt5', env, kwargs)
  
      def get_pkgconfig_host_bins(self, core):
diff --git a/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch b/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
deleted file mode 100644
index 6c2949c0e8b..00000000000
--- a/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
+++ /dev/null
@@ -1,185 +0,0 @@
-From 07ae4f949b8402cff178dd12c210d9a726ffe2da Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 18 Mar 2019 17:27:57 +0000
-Subject: [PATCH] mesonbuild: allow multiple --cross-file options
-
-Just like --native-file, allow multiple --cross-file options.  This is mostly
-unifying the logic between cross_files and config_files.
-
-Upstream-Status: Backport [will be in 0.50.1]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- .../markdown/snippets/multiple-cross-files.md |  3 ++
- mesonbuild/backend/backends.py                |  3 +-
- mesonbuild/coredata.py                        | 52 +++----------------
- mesonbuild/environment.py                     |  5 +-
- mesonbuild/msetup.py                          |  4 +-
- mesonbuild/munstable_coredata.py              |  5 +-
- 6 files changed, 20 insertions(+), 52 deletions(-)
- create mode 100644 docs/markdown/snippets/multiple-cross-files.md
-
-diff --git a/docs/markdown/snippets/multiple-cross-files.md b/docs/markdown/snippets/multiple-cross-files.md
-new file mode 100644
-index 0000000..de229be
---- /dev/null
-+++ b/docs/markdown/snippets/multiple-cross-files.md
-@@ -0,0 +1,3 @@
-+## Multipe cross files can be specified
-+
-+`--cross-file` can be passed multiple times, with the configuration files overlaying the same way as `--native-file`.
-diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/backends.py
-index 4d35d22..5b270d3 100644
---- a/mesonbuild/backend/backends.py
-+++ b/mesonbuild/backend/backends.py
-@@ -788,8 +788,7 @@ class Backend:
-         deps = [os.path.join(self.build_to_src, df)
-                 for df in self.interpreter.get_build_def_files()]
-         if self.environment.is_cross_build():
--            deps.append(os.path.join(self.build_to_src,
--                                     self.environment.coredata.cross_file))
-+            deps.extend(self.environment.coredata.cross_files)
-         deps.append('meson-private/coredata.dat')
-         if os.path.exists(os.path.join(self.environment.get_source_dir(), 'meson_options.txt')):
-             deps.append(os.path.join(self.build_to_src, 'meson_options.txt'))
-diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
-index 066ad30..d80e9a0 100644
---- a/mesonbuild/coredata.py
-+++ b/mesonbuild/coredata.py
-@@ -265,7 +265,7 @@ class CoreData:
-         self.compiler_options = PerMachine({}, {}, {})
-         self.base_options = {}
-         self.external_preprocess_args = PerMachine({}, {}, {}) # CPPFLAGS only
--        self.cross_file = self.__load_cross_file(options.cross_file)
-+        self.cross_files = self.__load_config_files(options.cross_file)
-         self.compilers = OrderedDict()
-         self.cross_compilers = OrderedDict()
-         self.deps = OrderedDict()
-@@ -276,57 +276,19 @@ class CoreData:
- 
-     @staticmethod
-     def __load_config_files(filenames):
-+        # Need to try and make the passed filenames absolute because when the
-+        # files are parsed later we'll have chdir()d.
-         if not filenames:
-             return []
-         filenames = [os.path.abspath(os.path.expanduser(os.path.expanduser(f)))
-                      for f in filenames]
-         return filenames
- 
--    @staticmethod
--    def __load_cross_file(filename):
--        """Try to load the cross file.
--
--        If the filename is None return None. If the filename is an absolute
--        (after resolving variables and ~), return that absolute path. Next,
--        check if the file is relative to the current source dir. If the path
--        still isn't resolved do the following:
--            Windows:
--                - Error
--            *:
--                - $XDG_DATA_HOME/meson/cross (or ~/.local/share/meson/cross if
--                  undefined)
--                - $XDG_DATA_DIRS/meson/cross (or
--                  /usr/local/share/meson/cross:/usr/share/meson/cross if undefined)
--                - Error
--
--        Non-Windows follows the Linux path and will honor XDG_* if set. This
--        simplifies the implementation somewhat.
--        """
--        if filename is None:
--            return None
--        filename = os.path.expanduser(os.path.expandvars(filename))
--        if os.path.isabs(filename):
--            return filename
--        path_to_try = os.path.abspath(filename)
--        if os.path.isfile(path_to_try):
--            return path_to_try
--        if sys.platform != 'win32':
--            paths = [
--                os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')),
--            ] + os.environ.get('XDG_DATA_DIRS', '/usr/local/share:/usr/share').split(':')
--            for path in paths:
--                path_to_try = os.path.join(path, 'meson', 'cross', filename)
--                if os.path.isfile(path_to_try):
--                    return path_to_try
--            raise MesonException('Cannot find specified cross file: ' + filename)
--
--        raise MesonException('Cannot find specified cross file: ' + filename)
--
-     def libdir_cross_fixup(self):
-         # By default set libdir to "lib" when cross compiling since
-         # getting the "system default" is always wrong on multiarch
-         # platforms as it gets a value like lib/x86_64-linux-gnu.
--        if self.cross_file is not None:
-+        if self.cross_files:
-             self.builtins['libdir'].value = 'lib'
- 
-     def sanitize_prefix(self, prefix):
-@@ -642,8 +604,8 @@ def read_cmd_line_file(build_dir, options):
-     options.cmd_line_options = d
- 
-     properties = config['properties']
--    if options.cross_file is None:
--        options.cross_file = properties.get('cross_file', None)
-+    if not options.cross_file:
-+        options.cross_file = ast.literal_eval(properties.get('cross_file', '[]'))
-     if not options.native_file:
-         # This will be a string in the form: "['first', 'second', ...]", use
-         # literal_eval to get it into the list of strings.
-@@ -654,7 +616,7 @@ def write_cmd_line_file(build_dir, options):
-     config = CmdLineFileParser()
- 
-     properties = {}
--    if options.cross_file is not None:
-+    if options.cross_file:
-         properties['cross_file'] = options.cross_file
-     if options.native_file:
-         properties['native_file'] = options.native_file
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index c25ef33..4c1c5ac 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -394,8 +394,9 @@ class Environment:
-             self.binaries.build = BinaryTable(config.get('binaries', {}))
-             self.paths.build = Directories(**config.get('paths', {}))
- 
--        if self.coredata.cross_file is not None:
--            config = MesonConfigFile.parse_datafile(self.coredata.cross_file)
-+        if self.coredata.cross_files:
-+            config = MesonConfigFile.from_config_parser(
-+                coredata.load_configs(self.coredata.cross_files, 'cross'))
-             self.properties.host = Properties(config.get('properties', {}), False)
-             self.binaries.host = BinaryTable(config.get('binaries', {}), False)
-             if 'host_machine' in config:
-diff --git a/mesonbuild/msetup.py b/mesonbuild/msetup.py
-index 023afdb..6e8ca83 100644
---- a/mesonbuild/msetup.py
-+++ b/mesonbuild/msetup.py
-@@ -29,7 +29,9 @@ from .mesonlib import MesonException
- 
- def add_arguments(parser):
-     coredata.register_builtin_arguments(parser)
--    parser.add_argument('--cross-file', default=None,
-+    parser.add_argument('--cross-file',
-+                        default=[],
-+                        action='append',
-                         help='File describing cross compilation environment.')
-     parser.add_argument('--native-file',
-                         default=[],
-diff --git a/mesonbuild/munstable_coredata.py b/mesonbuild/munstable_coredata.py
-index 78f3f34..913f942 100644
---- a/mesonbuild/munstable_coredata.py
-+++ b/mesonbuild/munstable_coredata.py
-@@ -81,8 +81,9 @@ def run(options):
-             print('Last seen PKGCONFIG enviroment variable value: ' + v)
-         elif k == 'version':
-             print('Meson version: ' + v)
--        elif k == 'cross_file':
--            print('Cross File: ' + (v or 'None'))
-+        elif k == 'cross_files':
-+            if v:
-+                print('Cross File: ' + ' '.join(v))
-         elif k == 'config_files':
-             if v:
-                 print('Native File: ' + ' '.join(v))
diff --git a/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch b/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
deleted file mode 100644
index 2056763db5d..00000000000
--- a/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d57dd1092e84e08ee15d7063b6c56bd6d864f2e1 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 18 Mar 2019 16:16:56 +0000
-Subject: [PATCH] load_configs: generalise the search path
-
-Instead of hard-coding the fact that load_configs() searches for files under
-meson/native, pass in the subdirectory allowing the cross-file code to use the
-same logic.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- mesonbuild/coredata.py    | 6 +++---
- mesonbuild/environment.py | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
-index fba90fa369..6e60917d10 100644
---- a/mesonbuild/coredata.py
-+++ b/mesonbuild/coredata.py
-@@ -211,8 +211,8 @@ def is_auto(self):
-         return self.value == 'auto'
- 
- 
--def load_configs(filenames):
--    """Load native files."""
-+def load_configs(filenames, subdir):
-+    """Load configuration files from a named subdirectory."""
-     def gen():
-         for f in filenames:
-             f = os.path.expanduser(os.path.expandvars(f))
-@@ -225,7 +225,7 @@ def gen():
-                     os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')),
-                 ] + os.environ.get('XDG_DATA_DIRS', '/usr/local/share:/usr/share').split(':')
-                 for path in paths:
--                    path_to_try = os.path.join(path, 'meson', 'native', f)
-+                    path_to_try = os.path.join(path, 'meson', subdir, f)
-                     if os.path.isfile(path_to_try):
-                         yield path_to_try
-                         break
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 58adb06960..92a00dd7bf 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -408,7 +408,7 @@ def __init__(self, source_dir, build_dir, options):
- 
-         if self.coredata.config_files is not None:
-             config = MesonConfigFile.from_config_parser(
--                coredata.load_configs(self.coredata.config_files))
-+                coredata.load_configs(self.coredata.config_files, 'native'))
-             self.binaries.build = BinaryTable(config.get('binaries', {}))
-             self.paths.build = Directories(**config.get('paths', {}))
- 
diff --git a/meta/recipes-devtools/meson/meson_0.50.1.bb b/meta/recipes-devtools/meson/meson_0.51.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.50.1.bb
rename to meta/recipes-devtools/meson/meson_0.51.1.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.51.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.51.1.bb
-- 
2.17.1


