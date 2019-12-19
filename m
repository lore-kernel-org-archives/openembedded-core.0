Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB4F7FDDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:13 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z3so5983991wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zMWj92+13FqYf+b4Nhbzy8GzVTzX9MEDfXOxBK1/eY4=;
	b=nVlUc7O1jTWdnJ3EBPwE20AzixdjfASzaMhiaOCx5U+v89lb26nFkt1oD02F7UrIqK
	OVceoWcfZu9w8Pqbpd7UeuffyON7012KeYW67o90maPS1j0OfyHJsR6exQK6Cge2Ew4l
	YNASUAso9V381+KYm3Iz5k0tUDVDRNpUDWVEopraGSHTG3sPlFHY+xrh7qaR53OZ+VVu
	+9eTd4ZNIsuvWlKIKQDLKjL8Xef9Pi6f22L9+IpG9xem2gfKmFmk/C/wNpH5RLLaOSlk
	TrJspMWBmfogcMvHrFw4MdVtgSwEXeEBt5WqrSSeiV9TFwe512IragvpPB53JaCiKJHQ
	hH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zMWj92+13FqYf+b4Nhbzy8GzVTzX9MEDfXOxBK1/eY4=;
	b=LG7us7uKbhzI5q8uGJdwJjyACPw/scwMMBS3xz8RvCEZ+H3XQ00+GMS9MuBXUITkGE
	UYSsy2VFw6TCnZwkG3r1ugdBBbS8BTpCGVx0VA3E9cUdgi3rkfa1ZnXeObSadwJMYNO8
	7utLBDrwFi8hmI/VUGeII2xNugLKd/vbM5gMadFX60XKD9dOziQR9g3A7a+uHuQ5L6R/
	Lo4RszPSM/XKoqXYUHO94Yvpswfe4d+boZLcAjuw1InPHgvWWoUm5oj9P9jjXCpfi6O+
	1i4/dWHJpulg9U9BKCowCKd4JI5yzlXIRQw8KqE3Aeyfuaar7GaDHMqUsz+VOf1wvtc3
	fvKA==
X-Gm-Message-State: APjAAAX4nSf4ijvg52P2kQcwcDxRaa6nQ5zq26qmp8jS2/nF73w5O7tx
	3E57VyyBhqWTkRwUvU9e5tz7KaVM11I=
X-Google-Smtp-Source: APXvYqxb7gljyePvf7Q18PEwqpdYQ9pD/f7a7XEDa3npbfLbpgrJ3csA9bymMujhOxlj6kzUeKhnAA==
X-Received: by 2002:adf:f382:: with SMTP id m2mr9443859wro.163.1576761794015; 
	Thu, 19 Dec 2019 05:23:14 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:22:49 +0100
Message-Id: <20191219132301.80034-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/16] meson: update 0.52.0 -> 0.52.1
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  5 +-
 .../0001-Make-CPU-family-warnings-fatal.patch | 10 +-
 ...pport-building-allarch-recipes-again.patch |  4 +-
 .../meson/meson/0003-native_bindir.patch      | 26 ++---
 ...e971bd320f3df15c1ee74f54858e6792b183.patch | 95 -------------------
 .../{meson_0.52.0.bb => meson_0.52.1.bb}      |  1 +
 ...on_0.52.0.bb => nativesdk-meson_0.52.1.bb} |  0
 7 files changed, 23 insertions(+), 118 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/dbc9e971bd320f3df15c1ee74f54858e6792b183.patch
 rename meta/recipes-devtools/meson/{meson_0.52.0.bb => meson_0.52.1.bb} (97%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.52.0.bb => nativesdk-meson_0.52.1.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 84bcc8409de..881a14c7f0a 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -16,10 +16,9 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://cross-prop-default.patch \
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
-           file://dbc9e971bd320f3df15c1ee74f54858e6792b183.patch \
            "
-SRC_URI[sha256sum] = "d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef4938d32"
-SRC_URI[md5sum] = "7ea7772414dda8ae11072244bf7ba991"
+SRC_URI[sha256sum] = "0c277472e49950a5537e3de3e60c57b80dbf425788470a1a8ed27446128fc035"
+SRC_URI[md5sum] = "a5f0c99567d772508f649a28ded7f8ad"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index fc55dcacf6d..d4264cee526 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From c07d29b715209cd5d75b142a00a540d45b00c36d Mon Sep 17 00:00:00 2001
+From cd980c763f11cfd928255346cc7e86f24add985e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  2 files changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index a59cd89..17de654 100644
+index 29d7422..5fb00a4 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -186,7 +186,7 @@ class MachineInfo:
+@@ -190,7 +190,7 @@ class MachineInfo:
  
          cpu_family = literal['cpu_family']
          if cpu_family not in known_cpu_families:
@@ -25,10 +25,10 @@ index a59cd89..17de654 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 3704921..f1988f2 100644
+index a9bc2b8..b91c8da 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -251,9 +251,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -348,9 +348,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          trial = 'parisc'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index b8837d77b64..c8c7b298de3 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 263fc0e26e1fd92e25fa3ef93f4a549dcebc5887 Mon Sep 17 00:00:00 2001
+From 4d223562c3e510e0dd62b608d184604e2cab6198 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -13,7 +13,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 17de654..2d2deef 100644
+index 5fb00a4..f5702ba 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -36,6 +36,7 @@ _T = typing.TypeVar('_T')
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index 76cc4931d63..14a9a136664 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From 4a1d676522d6b56cbe9a45c3b040afaa27d37f78 Mon Sep 17 00:00:00 2001
+From baf7b94fec5a31b2d0cb162e43dbd28cc019f38e Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -22,10 +22,10 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 3c55a56..eb52fd1 100644
+index 35f0175..b39cba6 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -185,7 +185,7 @@ class Dependency:
+@@ -184,7 +184,7 @@ class Dependency:
      def get_exe_args(self, compiler):
          return []
  
@@ -34,7 +34,7 @@ index 3c55a56..eb52fd1 100644
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -248,7 +248,7 @@ class InternalDependency(Dependency):
+@@ -247,7 +247,7 @@ class InternalDependency(Dependency):
          self.sources = sources
          self.ext_deps = ext_deps
  
@@ -54,11 +54,11 @@ index 3c55a56..eb52fd1 100644
 +            cmd = [self.pkgbin.get_command()[0] + "-native"] + args
 +        else:
 +            cmd = self.pkgbin.get_command() + args
-         p, out = Popen_safe(cmd, env=env)[0:2]
-         rc, out = p.returncode, out.strip()
+         p, out, err = Popen_safe(cmd, env=env)
+         rc, out, err = p.returncode, out.strip(), err.strip()
          call = ' '.join(cmd)
          mlog.debug("Called `{}` -> {}\n{}".format(call, rc, out))
-         return rc, out
+         return rc, out, err
  
 -    def _call_pkgbin(self, args, env=None):
 +    def _call_pkgbin(self, args, env=None, use_native=False):
@@ -74,21 +74,21 @@ index 3c55a56..eb52fd1 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args):
-@@ -926,7 +929,7 @@ class PkgConfigDependency(ExternalDependency):
-             mlog.warning('Could not determine complete list of dependencies for %s' % self.name)
-         self.link_args, self.raw_link_args = self._search_libs(out, out_raw, out_all)
+@@ -885,7 +888,7 @@ class PkgConfigDependency(ExternalDependency):
+                                       (self.name, out_raw))
+         self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
  
 -    def get_pkgconfig_variable(self, variable_name, kwargs):
 +    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -939,7 +942,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -898,7 +901,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
--        ret, out = self._call_pkgbin(options)
-+        ret, out = self._call_pkgbin(options, use_native=use_native)
+-        ret, out, err = self._call_pkgbin(options)
++        ret, out, err = self._call_pkgbin(options, use_native=use_native)
          variable = ''
          if ret != 0:
              if self.required:
diff --git a/meta/recipes-devtools/meson/meson/dbc9e971bd320f3df15c1ee74f54858e6792b183.patch b/meta/recipes-devtools/meson/meson/dbc9e971bd320f3df15c1ee74f54858e6792b183.patch
deleted file mode 100644
index 7ea8a133e6a..00000000000
--- a/meta/recipes-devtools/meson/meson/dbc9e971bd320f3df15c1ee74f54858e6792b183.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From dbc9e971bd320f3df15c1ee74f54858e6792b183 Mon Sep 17 00:00:00 2001
-From: Xavier Claessens <xavier.claessens@collabora.com>
-Date: Fri, 11 Oct 2019 11:01:22 -0400
-Subject: [PATCH] Remove duplicated object files in static libraries
-
-When a static library link_whole to a bunch of other static libraries,
-we have to extract all their objects recursively. But that could
-introduce duplicated objects. ar is dumb enough to allow this without
-error, but once the resulting static library is linked into an
-executable or shared library, the linker will complain about duplicated
-symbols.
-
-Upstream-Status: Backport
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
----
- mesonbuild/backend/backends.py                 |  3 ++-
- test cases/unit/69 static link/lib/func17.c    |  4 ++++
- test cases/unit/69 static link/lib/func18.c    |  6 ++++++
- test cases/unit/69 static link/lib/func19.c    |  7 +++++++
- test cases/unit/69 static link/lib/meson.build | 12 ++++++++++++
- 5 files changed, 31 insertions(+), 1 deletion(-)
- create mode 100644 test cases/unit/69 static link/lib/func17.c
- create mode 100644 test cases/unit/69 static link/lib/func18.c
- create mode 100644 test cases/unit/69 static link/lib/func19.c
-
-diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/backends.py
-index 947be1cbef..e54809657f 100644
---- a/mesonbuild/backend/backends.py
-+++ b/mesonbuild/backend/backends.py
-@@ -281,7 +281,8 @@ def relpath(self, todir, fromdir):
-                                os.path.join('dummyprefixdir', fromdir))
- 
-     def flatten_object_list(self, target, proj_dir_to_build_root=''):
--        return self._flatten_object_list(target, target.get_objects(), proj_dir_to_build_root)
-+        obj_list = self._flatten_object_list(target, target.get_objects(), proj_dir_to_build_root)
-+        return list(dict.fromkeys(obj_list))
- 
-     def _flatten_object_list(self, target, objects, proj_dir_to_build_root):
-         obj_list = []
-diff --git a/test cases/unit/69 static link/lib/func17.c b/test cases/unit/69 static link/lib/func17.c
-new file mode 100644
-index 0000000000..d1d8ec498c
---- /dev/null
-+++ b/test cases/unit/69 static link/lib/func17.c	
-@@ -0,0 +1,4 @@
-+int func17()
-+{
-+  return 1;
-+}
-diff --git a/test cases/unit/69 static link/lib/func18.c b/test cases/unit/69 static link/lib/func18.c
-new file mode 100644
-index 0000000000..c149085ba4
---- /dev/null
-+++ b/test cases/unit/69 static link/lib/func18.c	
-@@ -0,0 +1,6 @@
-+int func17();
-+
-+int func18()
-+{
-+  return func17() + 1;
-+}
-diff --git a/test cases/unit/69 static link/lib/func19.c b/test cases/unit/69 static link/lib/func19.c
-new file mode 100644
-index 0000000000..69120e4bf8
---- /dev/null
-+++ b/test cases/unit/69 static link/lib/func19.c	
-@@ -0,0 +1,7 @@
-+int func17();
-+int func18();
-+
-+int func19()
-+{
-+  return func17() + func18();
-+}
-diff --git a/test cases/unit/69 static link/lib/meson.build b/test cases/unit/69 static link/lib/meson.build
-index 5f04aab6a1..8f95fc4546 100644
---- a/test cases/unit/69 static link/lib/meson.build	
-+++ b/test cases/unit/69 static link/lib/meson.build	
-@@ -66,3 +66,15 @@ libfunc15 = static_library('func15', 'func15.c',
- libfunc16 = static_library('func16', 'func16.c',
-   link_with : libfunc15,
-   install : true)
-+
-+# Verify func17.c.o gets included only once into libfunc19, otherwise
-+# func19-shared would failed with duplicated symbol.
-+libfunc17 = static_library('func17', 'func17.c',
-+  install : false)
-+libfunc18 = static_library('func18', 'func18.c',
-+  link_with : libfunc17,
-+  install : false)
-+libfunc19 = static_library('func19', 'func19.c',
-+  link_whole : [libfunc17, libfunc18],
-+  install : false)
-+shared_library('func19-shared', link_whole : [libfunc19])
diff --git a/meta/recipes-devtools/meson/meson_0.52.0.bb b/meta/recipes-devtools/meson/meson_0.52.1.bb
similarity index 97%
rename from meta/recipes-devtools/meson/meson_0.52.0.bb
rename to meta/recipes-devtools/meson/meson_0.52.1.bb
index 897fa148d94..de9b905c12b 100644
--- a/meta/recipes-devtools/meson/meson_0.52.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.52.1.bb
@@ -1,3 +1,4 @@
 include meson.inc
 
 BBCLASSEXTEND = "native"
+
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.52.0.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.52.0.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.52.1.bb
-- 
2.17.1


