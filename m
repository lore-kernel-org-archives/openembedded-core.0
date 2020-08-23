Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.181524.1598214101570047175
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HbjzKLy8;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id bo3so9265361ejb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hT24aGZsabpww7lR50Bxq+BEKL6EBr4N+WslUwShylg=;
        b=HbjzKLy8z88mWOqhKPMAng7PCojB5c85OWYFayE3QpFCcGht/rt8/IdoQEa3wOlLtb
         r/LypdyX7nLgjf220VYvffZZQ20rk8N1+9JYxG+E6kHo2Z+Aiylmt0wvjOAhxETNtbHD
         BYuKsqGOEHxnzUAK62OamjtwMgP874nFm6322WD65nTYJ+EXRCTQ0StwZ/9BQJNhHpCw
         iGHLDwEO38wvHlr8+okGFEMq0xjjmLw+a+LbHvQe0MtsM9JZFimuHr0oE60W8lBVkThA
         M24oALeA1IScvrrTkn2JA5h0TTAavC+CHB6gxTNH32EDOPLtOhvTjjUcRu7wXz5QQfWS
         qIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hT24aGZsabpww7lR50Bxq+BEKL6EBr4N+WslUwShylg=;
        b=C/fvWF5AzTJUSI+D21E4gqA1ZivgbwITyEua315kudxWQ4MC/bODTIS7eh3lkyqXE/
         DfcR9e2VQc3BnvN0S1w1z1pl+hVZkR4yWFC0cWzHsMazH8hqztmiRCuvf/PlWRokO7L4
         E/XcaYCKcBM+ca6OhMDyUboRyFvDvjdBL2JbxLDtFYnKaJp3BH0YgEKvlEXkyvdDpRED
         7Z7bhmlxWElEKcJM5M7AMrBTiQw34z4BQIr8xTMuvQ5XCbeZud+h8PbaxNrgPmInJHNL
         qZ2v0FR9QPdT7opbjwP5joXZu42YD8/YzQKAdng1flTDT9U5qW49nN8X2zm22gNlFJlS
         wI0A==
X-Gm-Message-State: AOAM5314p0h84f3bnP6FiVl3HbmvSbWofxVLXYU1PZqe0g+BlrbATgDs
	PTuGkPO59Vds7t5u7krgMJAhVYXSLF8=
X-Google-Smtp-Source: ABdhPJyHgHNJ1ym4KS97ww+Qe3cHGjOU/KV+A+GtXWlezTukY6qpFilRJYr5pHjzANpJg57p86hoxA==
X-Received: by 2002:a17:906:c187:: with SMTP id g7mr2814485ejz.108.1598214099714;
        Sun, 23 Aug 2020 13:21:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/37] meson: update 0.55.0 -> 0.55.1
Date: Sun, 23 Aug 2020 22:20:31 +0200
Message-Id: <20200823202031.24686-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  2 +-
 .../0001-Make-CPU-family-warnings-fatal.patch |  7 ++---
 ...pport-building-allarch-recipes-again.patch |  4 +--
 .../meson/meson/0003-native_bindir.patch      | 28 +++++++++----------
 .../{meson_0.55.0.bb => meson_0.55.1.bb}      |  0
 ...on_0.55.0.bb => nativesdk-meson_0.55.1.bb} |  0
 6 files changed, 19 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.55.0.bb => meson_0.55.1.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.55.0.bb => nativesdk-meson_0.55.1.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 607093a152..004189e36e 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
            file://0001-gnome.py-prefix-g-i-paths-with-PKG_CONFIG_SYSROOT_DI.patch \
            "
-SRC_URI[sha256sum] = "0a1ae2bfe2ae14ac47593537f93290fb79e9b775c55b4c53c282bc3ca3745b35"
+SRC_URI[sha256sum] = "3b5741f884e04928bdfa1947467ff06afa6c98e623c25cef75adf71ca39ce080"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index ceb2fde342..fbc03b8ca0 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,7 +1,7 @@
-From 5624b5835af747b601780ad14646f9c1fb854931 Mon Sep 17 00:00:00 2001
+From 9311844b6c422479556e83b89a8e675ebcb2056c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
-Subject: [PATCH 1/2] Make CPU family warnings fatal
+Subject: [PATCH] Make CPU family warnings fatal
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
@@ -39,6 +39,3 @@ index bf09a88..8eabe78 100644
  
      return trial
  
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 7a3b01262e..2d804740ad 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 4b283d545152092fec12b9d80219161d11002c72 Mon Sep 17 00:00:00 2001
+From 38f59e256f760aa959c13f4c5713f87ff7addee5 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index dc20616..f54adcd 100644
+index d1be65b..90f3573 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -36,6 +36,7 @@ _T = T.TypeVar('_T')
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index fb119ae852..5d7bdc2f59 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From da2091f6dfe978fc6140fc2d01bcafbbfae8d8db Mon Sep 17 00:00:00 2001
+From f06c89939d0d006090a8a8728b2a13d532b83047 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -22,10 +22,10 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 50f4179..e1529d8 100644
+index 368a4bc..9fc398e 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -157,7 +157,7 @@ class Dependency:
+@@ -183,7 +183,7 @@ class Dependency:
      def get_exe_args(self, compiler):
          return []
  
@@ -34,16 +34,16 @@ index 50f4179..e1529d8 100644
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -225,7 +225,7 @@ class InternalDependency(Dependency):
-         self.ext_deps = ext_deps
-         self.variables = variables
+@@ -261,7 +261,7 @@ class InternalDependency(Dependency):
+                 setattr(result, k, copy.deepcopy(v, memo))
+         return result
  
 -    def get_pkgconfig_variable(self, variable_name, kwargs):
 +    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -633,15 +633,18 @@ class PkgConfigDependency(ExternalDependency):
+@@ -634,15 +634,18 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
@@ -65,7 +65,7 @@ index 50f4179..e1529d8 100644
          # Always copy the environment since we're going to modify it
          # with pkg-config variables
          if env is None:
-@@ -667,7 +670,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -668,7 +671,7 @@ class PkgConfigDependency(ExternalDependency):
          targs = tuple(args)
          cache = PkgConfigDependency.pkgbin_cache
          if (self.pkgbin, targs, fenv) not in cache:
@@ -74,7 +74,7 @@ index 50f4179..e1529d8 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args: T.List[str]) -> T.List[str]:
-@@ -876,7 +879,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -877,7 +880,7 @@ class PkgConfigDependency(ExternalDependency):
                                        (self.name, out_raw))
          self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
  
@@ -83,7 +83,7 @@ index 50f4179..e1529d8 100644
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -889,7 +892,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -890,7 +893,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -93,10 +93,10 @@ index 50f4179..e1529d8 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index 741f0b8..134dd54 100644
+index 95dfe2b..5f82890 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
-@@ -320,7 +320,7 @@ class QtBaseDependency(ExternalDependency):
+@@ -325,7 +325,7 @@ class QtBaseDependency(ExternalDependency):
          self.bindir = self.get_pkgconfig_host_bins(core)
          if not self.bindir:
              # If exec_prefix is not defined, the pkg-config file is broken
@@ -105,7 +105,7 @@ index 741f0b8..134dd54 100644
              if prefix:
                  self.bindir = os.path.join(prefix, 'bin')
  
-@@ -524,7 +524,7 @@ class Qt4Dependency(QtBaseDependency):
+@@ -528,7 +528,7 @@ class Qt4Dependency(QtBaseDependency):
          applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
          for application in applications:
              try:
@@ -114,7 +114,7 @@ index 741f0b8..134dd54 100644
              except MesonException:
                  pass
  
-@@ -534,7 +534,7 @@ class Qt5Dependency(QtBaseDependency):
+@@ -538,7 +538,7 @@ class Qt5Dependency(QtBaseDependency):
          QtBaseDependency.__init__(self, 'qt5', env, kwargs)
  
      def get_pkgconfig_host_bins(self, core):
diff --git a/meta/recipes-devtools/meson/meson_0.55.0.bb b/meta/recipes-devtools/meson/meson_0.55.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.55.0.bb
rename to meta/recipes-devtools/meson/meson_0.55.1.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.55.0.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
-- 
2.28.0

