Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.20403.1607112468242779523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V18f5Kt3;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id cm17so7126893edb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x3UGFEr+JMTRbJQbX9DefvUnSgbikr3jwQjiECqj4WQ=;
        b=V18f5Kt3EUsW6Jw/wzrP6E3EOUmloxXVoPbKzFPcAi5IWGM52rLeFTP4DEBCbgRZli
         2XvEjjVaGkBjcXqJ1KetBKh7l5ymJGyRpm4r2ItLZgP+ZOFLvje4w5cDn8KjWe1RIwyM
         wHlGVIhuG5hcosvGiRjUz3GuWY6M8cZ7i1HwyBz2Yb60aXeG+yfW9L5Bb8L+DdMHaHKA
         nCg2h0AoEKYytejleQtPeS59xPksIQQY7yqFJ1wsve7hEDNEUKG7YAyuCfVVINXmL56y
         oSYBiQLpNZjDN2jHOFtDHpjZcqXLUNLNMOXJzv9yCBwYlyCerI9B29w1xYHAzVzZRid3
         qLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x3UGFEr+JMTRbJQbX9DefvUnSgbikr3jwQjiECqj4WQ=;
        b=WI/VqMZtDOSh+c35KSyoGxKwIR9pAwFRWJnKToOJUHYu6rosHrwZqd7WRasicL2hVO
         fCcFjvJui0im2EaKUld88R+srtKnp8EXIJZds7INU8Ns1g3BJtr/h910HTOZNgohSeJA
         6gTCvfYpYDdkvNVpjee+oc4JhpJ5VxuWQJ/AyRXIW2qNY+bBcz0+/SUO2M3D/nzgd6CM
         PcNpeJsMusAW+2NAZm4UcuZ0egNc5XTnoJhzSUR+TZPyzyc1OkAACYQ0OOCzEG5W5U1F
         F/vWKHPSfIJckPlz1crE+diTpVEVUtyEyvHgabbxiU/bWJ3vthqEhqqCvd+eiBDR5xK7
         il+w==
X-Gm-Message-State: AOAM531EMTk/I9Ll6HI/NvqGtlSDowVfQp+e/j8nDzZ4JrKlW+QCErTc
	lyiOnbvLn+HvHIWR9W2VcBfZnX0G8eW7Mg==
X-Google-Smtp-Source: ABdhPJx5y2GhXcP+8rCDyhmt7fhBoY0kC7s9T3rm8SlT0xay/5QLu4Fmh/f77ilWxN9yrrGHbs3FKQ==
X-Received: by 2002:a05:6402:181a:: with SMTP id g26mr9256316edy.220.1607112466536;
        Fri, 04 Dec 2020 12:07:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/23] meson: upgrade 0.55.1 -> 0.56.0
Date: Fri,  4 Dec 2020 21:07:15 +0100
Message-Id: <20201204200737.7072-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  2 +-
 .../0001-Make-CPU-family-warnings-fatal.patch | 12 +++----
 .../meson/meson/0003-native_bindir.patch      | 32 +++++++++----------
 .../{meson_0.55.1.bb => meson_0.56.0.bb}      |  0
 ...on_0.55.1.bb => nativesdk-meson_0.56.0.bb} |  0
 5 files changed, 23 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.55.1.bb => meson_0.56.0.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.55.1.bb => nativesdk-meson_0.56.0.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 004189e36e..2d3adbdb1a 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
            "
-SRC_URI[sha256sum] = "3b5741f884e04928bdfa1947467ff06afa6c98e623c25cef75adf71ca39ce080"
+SRC_URI[sha256sum] = "291dd38ff1cd55fcfca8fc985181dd39be0d3e5826e5f0013bf867be40117213"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index fbc03b8ca0..86edcb5241 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 9311844b6c422479556e83b89a8e675ebcb2056c Mon Sep 17 00:00:00 2001
+From 110a525e5ebed2fca138d72da493c39510311c1f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 219b62e..d1be65b 100644
+index 13d0ba5..5ba3a1a 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -199,7 +199,7 @@ class MachineInfo:
+@@ -254,7 +254,7 @@ class MachineInfo:
  
          cpu_family = literal['cpu_family']
          if cpu_family not in known_cpu_families:
@@ -25,11 +25,11 @@ index 219b62e..d1be65b 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index bf09a88..8eabe78 100644
+index 588005b..988e3ea 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -375,9 +375,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
-         trial = 'parisc'
+@@ -400,9 +400,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+             trial = 'ppc64'
  
      if trial not in known_cpu_families:
 -        mlog.warning('Unknown CPU family {!r}, please report this at '
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index 5d7bdc2f59..fb55a05187 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From f06c89939d0d006090a8a8728b2a13d532b83047 Mon Sep 17 00:00:00 2001
+From cbc27ee1576b4d04ad8e9d80760c63a9d3b7f5ed Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -15,22 +15,21 @@ that is is OE only. https://github.com/mesonbuild/meson/issues/1849#issuecomment
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-
 ---
  mesonbuild/dependencies/base.py | 19 +++++++++++--------
  mesonbuild/dependencies/ui.py   |  6 +++---
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 368a4bc..9fc398e 100644
+index 3a5f5f8..0af89f8 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
 @@ -183,7 +183,7 @@ class Dependency:
      def get_exe_args(self, compiler):
          return []
  
--    def get_pkgconfig_variable(self, variable_name, kwargs):
-+    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+-    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
++    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
@@ -38,12 +37,12 @@ index 368a4bc..9fc398e 100644
                  setattr(result, k, copy.deepcopy(v, memo))
          return result
  
--    def get_pkgconfig_variable(self, variable_name, kwargs):
-+    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+-    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
++    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -634,15 +634,18 @@ class PkgConfigDependency(ExternalDependency):
+@@ -639,8 +639,11 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -57,15 +56,16 @@ index 368a4bc..9fc398e 100644
          p, out, err = Popen_safe(cmd, env=env)
          rc, out, err = p.returncode, out.strip(), err.strip()
          call = ' '.join(cmd)
-         mlog.debug("Called `{}` -> {}\n{}".format(call, rc, out))
-         return rc, out, err
+@@ -666,7 +669,7 @@ class PkgConfigDependency(ExternalDependency):
+             mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
+ 
  
 -    def _call_pkgbin(self, args, env=None):
 +    def _call_pkgbin(self, args, env=None, use_native=False):
          # Always copy the environment since we're going to modify it
          # with pkg-config variables
          if env is None:
-@@ -668,7 +671,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -680,7 +683,7 @@ class PkgConfigDependency(ExternalDependency):
          targs = tuple(args)
          cache = PkgConfigDependency.pkgbin_cache
          if (self.pkgbin, targs, fenv) not in cache:
@@ -74,16 +74,16 @@ index 368a4bc..9fc398e 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
-@@ -877,7 +880,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -889,7 +892,7 @@ class PkgConfigDependency(ExternalDependency):
                                        (self.name, out_raw))
          self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
  
--    def get_pkgconfig_variable(self, variable_name, kwargs):
-+    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
+-    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any]) -> str:
++    def get_pkgconfig_variable(self, variable_name: str, kwargs: T.Dict[str, T.Any], use_native=False) -> str:
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -890,7 +893,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -902,7 +905,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -93,7 +93,7 @@ index 368a4bc..9fc398e 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index 95dfe2b..5f82890 100644
+index 5dffd3a..fb3a178 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
 @@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):
diff --git a/meta/recipes-devtools/meson/meson_0.55.1.bb b/meta/recipes-devtools/meson/meson_0.56.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.55.1.bb
rename to meta/recipes-devtools/meson/meson_0.56.0.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.56.0.bb
-- 
2.29.2

