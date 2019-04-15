Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD707D933
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id z24so19932787wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NvSiA5DmKE4hJJ75zAg7h+nTzTcRT0NyT91CK7+NuNg=;
	b=EVj7vOEyzOsAywj8Gk5LNLbZTYtJriFTzpcL8ibBzN7CDW3lVcCBOFdAzimP4HcOkC
	CthGjLC/14+Bqm/uxK1j2z7V3jaH9NVaNp64hjBW1B8a0EUTMM0dLThwY9qC8WHwt3wu
	59lEdZqx7rQj4pHk8gpFv8uHGb9CStw+XgZoRbhZeNZDNN20x379t1KAHKb7lMCzGNp0
	y+P1pY8CrRTgI5LGg0m+W6+51ei+Mc/N+JsZCAk1WfjlR/uH9USEGsWOB9x+zvU4PSIS
	Ml6d4a4JJ4QyvfQangtLinFVfPvd6ljZjKw2B7/49ywmmNZ9s7iAQ9G7jZDyxCiCA9KZ
	fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NvSiA5DmKE4hJJ75zAg7h+nTzTcRT0NyT91CK7+NuNg=;
	b=Bgrjfs8ZgbjbdgwY6IMkPIl7iZVzsigS6gQIS/ygPFGx2/MNJ8hkiPKAQQ/kOc/03o
	nkRtKKY6AUTOKwHqW0nfuKL9/W0PtL3bBVQk8/NbjEoakXyIGUNriJw2qaLe2sVKN8/0
	5Pwrq0jmlb2kMJZSUBUmRx6t2fvianDXUR3MNKkUzckSqdTqas+daskgH/FEDgd9zAPS
	B/TrXOITJ2LwchI0Lkm3paZiBV7OBFgnm48GQp3MEd7JA9dqa28QsRfbSzqhAufobmbD
	dyXthTUS+Q8lbyLYOAEt6HyXuDlzllWwst+AUayizp/ZxXbQrXxW//OLtGrKP6Q9jJHT
	TpUg==
X-Gm-Message-State: APjAAAXu4BLtJ59aXDQwWFOCrQhKAiL1WoldFYfXyMu/4qrjhtQ89wgU
	ZAMTgHsRlHpM3wGU+IW3CULie2xWR24=
X-Google-Smtp-Source: APXvYqwM5nSjopVJ8RCuoA6JXf1Bq15r2mzlxdEk85T31w66slmz2TFrdEoU0B3Zwgl5+8N8GjI9Fw==
X-Received: by 2002:a05:600c:2118:: with SMTP id
	u24mr21704335wml.24.1555325713530; 
	Mon, 15 Apr 2019 03:55:13 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:49 +0200
Message-Id: <20190415105457.57067-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/19] meson: update to 0.50.0
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:13 -0000

Remove 0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
as the upstream code has been completely reworked; if the issues pops up
again, we need to re-write the fix.

Rebase:
0001-Make-CPU-family-warnings-fatal.patch
0001-environment.py-detect-windows-also-if-the-system-str.patch
0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
0002-Support-building-allarch-recipes-again.patch

Add 0001-mesonbuild-environment.py-check-environment-for-vari.patch
as particularly we set windows resource compiler through an
environment variable WINDRES. This has replaced the
0001-modules-windows-split-WINDRES-env-variable.patch as the code
has been refactored.

Add 0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
for a more robust detection of cross builds.

Replace many-cross.patch with corresponding backports from upcoming 0.50.1:
0007-mesonbuild-allow-multiple-cross-file-options.patch
load-configs-generalise-search-path.patch

Drop cross-libdir.patch as it has been merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  14 +-
 ...e-cross_args-in-front-of-output_args.patch |  30 ----
 .../0001-Make-CPU-family-warnings-fatal.patch |  35 ++--
 ...tect-windows-also-if-the-system-str.patch} |  16 +-
 ...sues-that-arise-when-cross-compiling.patch |   2 +-
 ...onment.py-check-environment-for-vari.patch |  28 +++
 ...onment.py-do-not-determine-whether-a.patch |  30 ++++
 ...s-windows-split-WINDRES-env-variable.patch |  26 ---
 ...pport-building-allarch-recipes-again.patch |  16 +-
 ...d-allow-multiple-cross-file-options.patch} | 162 ++++++++----------
 .../meson/meson/cross-libdir.patch            |  35 ----
 .../load-configs-generalise-search-path.patch |  50 ++++++
 .../{meson_0.49.2.bb => meson_0.50.0.bb}      |   0
 ...on_0.49.2.bb => nativesdk-meson_0.50.0.bb} |   0
 14 files changed, 222 insertions(+), 222 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
 rename meta/recipes-devtools/meson/meson/{0002-environment.py-detect-windows-also-if-the-system-str.patch => 0001-environment.py-detect-windows-also-if-the-system-str.patch} (59%)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-modules-windows-split-WINDRES-env-variable.patch
 rename meta/recipes-devtools/meson/meson/{many-cross.patch => 0007-mesonbuild-allow-multiple-cross-file-options.patch} (54%)
 delete mode 100644 meta/recipes-devtools/meson/meson/cross-libdir.patch
 create mode 100644 meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
 rename meta/recipes-devtools/meson/{meson_0.49.2.bb => meson_0.50.0.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.49.2.bb => nativesdk-meson_0.50.0.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 2d18f72c0c1..6d743fbe142 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -7,18 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
            file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
-           file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://disable-rpath-handling.patch \
-           file://0001-modules-windows-split-WINDRES-env-variable.patch \
-           file://0002-environment.py-detect-windows-also-if-the-system-str.patch \
            file://cross-prop-default.patch \
-           file://many-cross.patch \
-           file://cross-libdir.patch \
+           file://load-configs-generalise-search-path.patch \
+           file://0007-mesonbuild-allow-multiple-cross-file-options.patch \
+           file://0001-environment.py-detect-windows-also-if-the-system-str.patch \
+           file://0001-mesonbuild-environment.py-do-not-determine-whether-a.patch \
+           file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            "
-SRC_URI[sha256sum] = "ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd"
-SRC_URI[md5sum] = "0267b0871266056184c484792572c682"
+SRC_URI[sha256sum] = "2a1bc42dda58206fb922cda5e1ca95cc03ad126321d26acc47d3493ec4e7021f"
+SRC_URI[md5sum] = "433483107fda4616eaf33de7e7083a84"
 
 SRC_URI_append_class-native = " \
     file://0001-Make-CPU-family-warnings-fatal.patch \
diff --git a/meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch b/meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
deleted file mode 100644
index 97778c32eb5..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4676224dbdff0f7107e8cbdbe0eab19c855f1454 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 17 Nov 2017 13:18:28 +0200
-Subject: [PATCH] Linker rules: move {cross_args} in front of {output_args}
-
-The previous order was found to break linking in some cases
-(e.g. when -no-pic -fno-PIC was present in {cross_args}.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- mesonbuild/backend/ninjabackend.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
-index bb281e1..969b70e 100644
---- a/mesonbuild/backend/ninjabackend.py
-+++ b/mesonbuild/backend/ninjabackend.py
-@@ -1501,7 +1501,7 @@ int dummy;
-  rspfile_content = $ARGS  {output_args} $in $LINK_ARGS {cross_args} $aliasing
- '''
-                 else:
--                    command_template = ' command = {executable} $ARGS {output_args} $in $LINK_ARGS {cross_args} $aliasing\n'
-+                    command_template = ' command = {executable} $ARGS {cross_args} {output_args} $in $LINK_ARGS $aliasing\n'
-                 command = command_template.format(
-                     executable=' '.join(compiler.get_linker_exelist()),
-                     cross_args=' '.join(cross_args),
--- 
-2.15.0
-
diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index fbc3f5ad827..2580b1e366e 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 2db829d865bb6464ac15dbb4a58c9a675e296866 Mon Sep 17 00:00:00 2001
+From f76d2bf09f7ffd871d068c4ac4c4be083f5fb07f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -7,15 +7,29 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
- mesonbuild/environment.py | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
+ mesonbuild/envconfig.py   | 2 +-
+ mesonbuild/environment.py | 4 +---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
 
+diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
+index f2510c1..b9841fe 100644
+--- a/mesonbuild/envconfig.py
++++ b/mesonbuild/envconfig.py
+@@ -178,7 +178,7 @@ class MachineInfo:
+ 
+         cpu_family = literal['cpu_family']
+         if cpu_family not in known_cpu_families:
+-            mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % cpu_family)
++            raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % cpu_family)
+ 
+         endian = literal['endian']
+         if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 2ccd31e..5fcf9df 100644
+index 4c1c5ac..a5a7461 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -265,9 +265,7 @@ def detect_cpu_family(compilers):
-     # below.
+@@ -242,9 +242,7 @@ def detect_cpu_family(compilers):
+         trial = 'parisc'
  
      if trial not in known_cpu_families:
 -        mlog.warning('Unknown CPU family {!r}, please report this at '
@@ -25,12 +39,3 @@ index 2ccd31e..5fcf9df 100644
  
      return trial
  
-@@ -1232,7 +1230,7 @@ class MachineInfo:
- 
-         cpu_family = literal['cpu_family']
-         if cpu_family not in known_cpu_families:
--            mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % cpu_family)
-+            raise EnvironmentException('Unknown CPU family %s, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.' % cpu_family)
- 
-         endian = literal['endian']
-         if endian not in ('little', 'big'):
diff --git a/meta/recipes-devtools/meson/meson/0002-environment.py-detect-windows-also-if-the-system-str.patch b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
similarity index 59%
rename from meta/recipes-devtools/meson/meson/0002-environment.py-detect-windows-also-if-the-system-str.patch
rename to meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
index 1be5d663291..f6043190af0 100644
--- a/meta/recipes-devtools/meson/meson/0002-environment.py-detect-windows-also-if-the-system-str.patch
+++ b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
@@ -1,20 +1,20 @@
-From 7bf4c2c02eb7fe1bf24b23e3ba2d7df36495e0aa Mon Sep 17 00:00:00 2001
+From 63b78b7990c5d60f7bc674a26f655caa0bec3c49 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 13 Feb 2019 17:45:09 +0100
+Date: Mon, 25 Mar 2019 17:17:06 +0100
 Subject: [PATCH] environment.py: detect windows also if the system string
  contains 'mingw'
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- mesonbuild/environment.py | 2 +-
+ mesonbuild/envconfig.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index b4fc0dc..845077e 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -1247,7 +1247,7 @@ class MachineInfo:
+diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
+index f2510c1..5309ef4 100644
+--- a/mesonbuild/envconfig.py
++++ b/mesonbuild/envconfig.py
+@@ -194,7 +194,7 @@ class MachineInfo:
          """
          Machine is windows?
          """
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index 11fd9ed3acc..7c3238bf91a 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -27,7 +27,7 @@ index bf49770..7c5a363 100644
                  '--mode=' + mode]
          if namespace:
              args.append('--namespace=' + namespace)
-+        gtkdoc_exe_wrapper = state.environment.cross_info.config["properties"].get('gtkdoc_exe_wrapper', None)
++        gtkdoc_exe_wrapper = state.environment.properties.host.get('gtkdoc_exe_wrapper', None)
 +        if gtkdoc_exe_wrapper is not None:
 +            args.append('--run=' + gtkdoc_exe_wrapper)
 +
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
new file mode 100644
index 00000000000..fadb2734f4b
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-check-environment-for-vari.patch
@@ -0,0 +1,28 @@
+From 63e79329b5dd00882f0cea56a6d907a831b94171 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 25 Mar 2019 18:52:48 +0100
+Subject: [PATCH] mesonbuild/environment.py: check environment for various
+ binaries
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/environment.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 6e5d689..bbfd87d 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -398,7 +398,7 @@ class Environment:
+             config = MesonConfigFile.from_config_parser(
+                 coredata.load_configs(self.coredata.cross_files, 'cross'))
+             self.properties.host = Properties(config.get('properties', {}), False)
+-            self.binaries.host = BinaryTable(config.get('binaries', {}), False)
++            self.binaries.host = BinaryTable(config.get('binaries', {}), True)
+             if 'host_machine' in config:
+                 self.machines.host = MachineInfo.from_literal(config['host_machine'])
+             if 'target_machine' in config:
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
new file mode 100644
index 00000000000..e64e13b8360
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-environment.py-do-not-determine-whether-a.patch
@@ -0,0 +1,30 @@
+From c040f0dbace3259c80f3710bc019433b9c817940 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 25 Mar 2019 18:18:33 +0100
+Subject: [PATCH] mesonbuild/environment.py: do not determine whether a build
+ is cross by comparing architectures
+
+This can, and does, go wrong when our host architecture is same as the target one(e.g. x86_64).
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/environment.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 4c1c5ac..6e5d689 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -478,7 +478,7 @@ class Environment:
+         self.first_invocation = True
+ 
+     def is_cross_build(self):
+-        return not self.machines.matches_build_machine(MachineChoice.HOST)
++        return self.need_exe_wrapper()
+ 
+     def dump_coredata(self):
+         return coredata.save(self.coredata, self.get_build_dir())
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/meson/meson/0001-modules-windows-split-WINDRES-env-variable.patch b/meta/recipes-devtools/meson/meson/0001-modules-windows-split-WINDRES-env-variable.patch
deleted file mode 100644
index c334e6dd66b..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-modules-windows-split-WINDRES-env-variable.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 5293d0f5067b2aeefe9ce3c175c972de367589bc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 13 Feb 2019 17:43:54 +0100
-Subject: [PATCH] modules/windows: split WINDRES env variable
-
-As it may contain not just the binary, but also the arguments to it.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- mesonbuild/modules/windows.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/modules/windows.py b/mesonbuild/modules/windows.py
-index d185d89..dbaeb9b 100644
---- a/mesonbuild/modules/windows.py
-+++ b/mesonbuild/modules/windows.py
-@@ -56,7 +56,7 @@ class WindowsModule(ExtensionModule):
-             if 'WINDRES' in os.environ:
-                 # Pick-up env var WINDRES if set. This is often used for
-                 # specifying an arch-specific windres.
--                rescomp = ExternalProgram('windres', command=os.environ.get('WINDRES'), silent=True)
-+                rescomp = ExternalProgram('windres', command=os.environ.get('WINDRES').split(), silent=True)
- 
-         if not rescomp or not rescomp.found():
-             # Take windres from the config file after the environment, which is
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 81548cdfb85..f0ea61bac55 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From f8419d5f279f1fb9b5e7eead4f1579bce7cb0e4e Mon Sep 17 00:00:00 2001
+From 755902910ad124095c671b3c7f057e6513d9c0c6 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -9,15 +9,15 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
 
 ---
- mesonbuild/environment.py | 1 +
+ mesonbuild/envconfig.py | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 5fcf9df..b4fc0dc 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -72,6 +72,7 @@ from .compilers import (
- build_filename = 'meson.build'
+diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
+index b9841fe..9c0487e 100644
+--- a/mesonbuild/envconfig.py
++++ b/mesonbuild/envconfig.py
+@@ -34,6 +34,7 @@ from . import mlog
+ 
  
  known_cpu_families = (
 +    'allarch',
diff --git a/meta/recipes-devtools/meson/meson/many-cross.patch b/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
similarity index 54%
rename from meta/recipes-devtools/meson/meson/many-cross.patch
rename to meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
index d04c28b8a38..6c2949c0e8b 100644
--- a/meta/recipes-devtools/meson/meson/many-cross.patch
+++ b/meta/recipes-devtools/meson/meson/0007-mesonbuild-allow-multiple-cross-file-options.patch
@@ -1,4 +1,7 @@
-mesonbuild: allow multiple --cross-file options
+From 07ae4f949b8402cff178dd12c210d9a726ffe2da Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 18 Mar 2019 17:27:57 +0000
+Subject: [PATCH] mesonbuild: allow multiple --cross-file options
 
 Just like --native-file, allow multiple --cross-file options.  This is mostly
 unifying the logic between cross_files and config_files.
@@ -6,11 +9,30 @@ unifying the logic between cross_files and config_files.
 Upstream-Status: Backport [will be in 0.50.1]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ .../markdown/snippets/multiple-cross-files.md |  3 ++
+ mesonbuild/backend/backends.py                |  3 +-
+ mesonbuild/coredata.py                        | 52 +++----------------
+ mesonbuild/environment.py                     |  5 +-
+ mesonbuild/msetup.py                          |  4 +-
+ mesonbuild/munstable_coredata.py              |  5 +-
+ 6 files changed, 20 insertions(+), 52 deletions(-)
+ create mode 100644 docs/markdown/snippets/multiple-cross-files.md
+
+diff --git a/docs/markdown/snippets/multiple-cross-files.md b/docs/markdown/snippets/multiple-cross-files.md
+new file mode 100644
+index 0000000..de229be
+--- /dev/null
++++ b/docs/markdown/snippets/multiple-cross-files.md
+@@ -0,0 +1,3 @@
++## Multipe cross files can be specified
++
++`--cross-file` can be passed multiple times, with the configuration files overlaying the same way as `--native-file`.
 diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/backends.py
-index 40402513..4b9bcb59 100644
+index 4d35d22..5b270d3 100644
 --- a/mesonbuild/backend/backends.py
 +++ b/mesonbuild/backend/backends.py
-@@ -726,8 +726,7 @@ class Backend:
+@@ -788,8 +788,7 @@ class Backend:
          deps = [os.path.join(self.build_to_src, df)
                  for df in self.interpreter.get_build_def_files()]
          if self.environment.is_cross_build():
@@ -21,39 +43,19 @@ index 40402513..4b9bcb59 100644
          if os.path.exists(os.path.join(self.environment.get_source_dir(), 'meson_options.txt')):
              deps.append(os.path.join(self.build_to_src, 'meson_options.txt'))
 diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
-index c3f5a745..ff810683 100644
+index 066ad30..d80e9a0 100644
 --- a/mesonbuild/coredata.py
 +++ b/mesonbuild/coredata.py
-@@ -201,8 +201,8 @@ class UserFeatureOption(UserComboOption):
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
-@@ -215,7 +215,7 @@ def load_configs(filenames):
-                     os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')),
-                 ] + os.environ.get('XDG_DATA_DIRS', '/usr/local/share:/usr/share').split(':')
-                 for path in paths:
--                    path_to_try = os.path.join(path, 'meson', 'native', f)
-+                    path_to_try = os.path.join(path, 'meson', subdir, f)
-                     if os.path.isfile(path_to_try):
-                         yield path_to_try
-                         break
-@@ -291,7 +291,7 @@ class CoreData:
-         self.compiler_options = {}
+@@ -265,7 +265,7 @@ class CoreData:
+         self.compiler_options = PerMachine({}, {}, {})
          self.base_options = {}
-         self.external_preprocess_args = {} # CPPFLAGS only
+         self.external_preprocess_args = PerMachine({}, {}, {}) # CPPFLAGS only
 -        self.cross_file = self.__load_cross_file(options.cross_file)
 +        self.cross_files = self.__load_config_files(options.cross_file)
          self.compilers = OrderedDict()
          self.cross_compilers = OrderedDict()
          self.deps = OrderedDict()
-@@ -301,52 +301,14 @@ class CoreData:
+@@ -276,57 +276,19 @@ class CoreData:
  
      @staticmethod
      def __load_config_files(filenames):
@@ -105,10 +107,16 @@ index c3f5a745..ff810683 100644
 -
 -        raise MesonException('Cannot find specified cross file: ' + filename)
 -
+     def libdir_cross_fixup(self):
+         # By default set libdir to "lib" when cross compiling since
+         # getting the "system default" is always wrong on multiarch
+         # platforms as it gets a value like lib/x86_64-linux-gnu.
+-        if self.cross_file is not None:
++        if self.cross_files:
+             self.builtins['libdir'].value = 'lib'
+ 
      def sanitize_prefix(self, prefix):
-         if not os.path.isabs(prefix):
-             raise MesonException('prefix value {!r} must be an absolute path'
-@@ -558,8 +520,8 @@ def read_cmd_line_file(build_dir, options):
+@@ -642,8 +604,8 @@ def read_cmd_line_file(build_dir, options):
      options.cmd_line_options = d
  
      properties = config['properties']
@@ -119,7 +127,7 @@ index c3f5a745..ff810683 100644
      if not options.native_file:
          # This will be a string in the form: "['first', 'second', ...]", use
          # literal_eval to get it into the list of strings.
-@@ -570,7 +532,7 @@ def write_cmd_line_file(build_dir, options):
+@@ -654,7 +616,7 @@ def write_cmd_line_file(build_dir, options):
      config = CmdLineFileParser()
  
      properties = {}
@@ -129,50 +137,26 @@ index c3f5a745..ff810683 100644
      if options.native_file:
          properties['native_file'] = options.native_file
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 6d86daf9..406ab8b8 100644
+index c25ef33..4c1c5ac 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -355,8 +355,8 @@ class Environment:
-         self.machines = MachineInfos()
-         # Will be fully initialized later using compilers later.
-         self.machines.detect_build()
--        if self.coredata.cross_file:
--            self.cross_info = CrossBuildInfo(self.coredata.cross_file)
-+        if self.coredata.cross_files:
-+            self.cross_info = CrossBuildInfo(self.coredata.cross_files)
-             if 'exe_wrapper' in self.cross_info.config['binaries']:
-                 from .dependencies import ExternalProgram
-                 self.exe_wrapper = ExternalProgram.from_bin_list(
-@@ -373,7 +373,7 @@ class Environment:
+@@ -394,8 +394,9 @@ class Environment:
+             self.binaries.build = BinaryTable(config.get('binaries', {}))
+             self.paths.build = Directories(**config.get('paths', {}))
  
-         if self.coredata.config_files:
-             self.config_info = coredata.ConfigData(
--                coredata.load_configs(self.coredata.config_files))
-+                coredata.load_configs(self.coredata.config_files, 'native'))
-         else:
-             self.config_info = coredata.ConfigData()
- 
-@@ -1113,13 +1113,8 @@ class CrossBuildInfo:
-     def ok_type(self, i):
-         return isinstance(i, (str, int, bool))
- 
--    def parse_datafile(self, filename):
--        config = configparser.ConfigParser()
--        try:
--            with open(filename, 'r') as f:
--                config.read_file(f, filename)
--        except FileNotFoundError:
--            raise EnvironmentException('File not found: %s.' % filename)
-+    def parse_datafile(self, filenames):
-+        config = coredata.load_configs(filenames, 'cross')
-         # This is a bit hackish at the moment.
-         for s in config.sections():
-             self.config[s] = {}
+-        if self.coredata.cross_file is not None:
+-            config = MesonConfigFile.parse_datafile(self.coredata.cross_file)
++        if self.coredata.cross_files:
++            config = MesonConfigFile.from_config_parser(
++                coredata.load_configs(self.coredata.cross_files, 'cross'))
+             self.properties.host = Properties(config.get('properties', {}), False)
+             self.binaries.host = BinaryTable(config.get('binaries', {}), False)
+             if 'host_machine' in config:
 diff --git a/mesonbuild/msetup.py b/mesonbuild/msetup.py
-index 56a0e9a7..f0a1ae19 100644
+index 023afdb..6e8ca83 100644
 --- a/mesonbuild/msetup.py
 +++ b/mesonbuild/msetup.py
-@@ -27,7 +27,9 @@ from .mesonlib import MesonException
+@@ -29,7 +29,9 @@ from .mesonlib import MesonException
  
  def add_arguments(parser):
      coredata.register_builtin_arguments(parser)
@@ -183,25 +167,19 @@ index 56a0e9a7..f0a1ae19 100644
                          help='File describing cross compilation environment.')
      parser.add_argument('--native-file',
                          default=[],
-diff --git a/run_unittests.py b/run_unittests.py
-index e6874b25..1d247291 100755
---- a/run_unittests.py
-+++ b/run_unittests.py
-@@ -529,7 +529,7 @@ class InternalTests(unittest.TestCase):
-         config.write(configfile)
-         configfile.flush()
-         configfile.close()
--        detected_value = mesonbuild.environment.CrossBuildInfo(configfile.name).need_exe_wrapper()
-+        detected_value = mesonbuild.environment.CrossBuildInfo((configfile.name,)).need_exe_wrapper()
-         os.unlink(configfilename)
- 
-         desired_value = not detected_value
-@@ -541,7 +541,7 @@ class InternalTests(unittest.TestCase):
-         configfilename = configfile.name
-         config.write(configfile)
-         configfile.close()
--        forced_value = mesonbuild.environment.CrossBuildInfo(configfile.name).need_exe_wrapper()
-+        forced_value = mesonbuild.environment.CrossBuildInfo((configfile.name,)).need_exe_wrapper()
-         os.unlink(configfilename)
- 
-         self.assertEqual(forced_value, desired_value)
+diff --git a/mesonbuild/munstable_coredata.py b/mesonbuild/munstable_coredata.py
+index 78f3f34..913f942 100644
+--- a/mesonbuild/munstable_coredata.py
++++ b/mesonbuild/munstable_coredata.py
+@@ -81,8 +81,9 @@ def run(options):
+             print('Last seen PKGCONFIG enviroment variable value: ' + v)
+         elif k == 'version':
+             print('Meson version: ' + v)
+-        elif k == 'cross_file':
+-            print('Cross File: ' + (v or 'None'))
++        elif k == 'cross_files':
++            if v:
++                print('Cross File: ' + ' '.join(v))
+         elif k == 'config_files':
+             if v:
+                 print('Native File: ' + ' '.join(v))
diff --git a/meta/recipes-devtools/meson/meson/cross-libdir.patch b/meta/recipes-devtools/meson/meson/cross-libdir.patch
deleted file mode 100644
index 7395fdbdaa6..00000000000
--- a/meta/recipes-devtools/meson/meson/cross-libdir.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ce24f0d6a9be22ba61d80cd254e0409de2eaffd7 Mon Sep 17 00:00:00 2001
-From: Jussi Pakkanen <jpakkane@gmail.com>
-Date: Thu, 27 Dec 2018 23:43:35 +0200
-Subject: [PATCH] Default libdir is "lib" when cross compiling. Closes #2535.
-
----
-diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
-index ff810683..9ee23a69 100644
---- a/mesonbuild/coredata.py
-+++ b/mesonbuild/coredata.py
-@@ -298,6 +298,7 @@ class CoreData:
-         # Only to print a warning if it changes between Meson invocations.
-         self.pkgconf_envvar = os.environ.get('PKG_CONFIG_PATH', '')
-         self.config_files = self.__load_config_files(options.native_file)
-+        self.libdir_cross_fixup()
- 
-     @staticmethod
-     def __load_config_files(filenames):
-@@ -309,6 +310,13 @@ class CoreData:
-                      for f in filenames]
-         return filenames
- 
-+    def libdir_cross_fixup(self):
-+        # By default set libdir to "lib" when cross compiling since
-+        # getting the "system default" is always wrong on multiarch
-+        # platforms as it gets a value like lib/x86_64-linux-gnu.
-+        if self.cross_files:
-+            self.builtins['libdir'].value = 'lib'
-+
-     def sanitize_prefix(self, prefix):
-         if not os.path.isabs(prefix):
-             raise MesonException('prefix value {!r} must be an absolute path'
diff --git a/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch b/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
new file mode 100644
index 00000000000..fc02576f5bd
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/load-configs-generalise-search-path.patch
@@ -0,0 +1,50 @@
+From d57dd1092e84e08ee15d7063b6c56bd6d864f2e1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 18 Mar 2019 16:16:56 +0000
+Subject: [PATCH] load_configs: generalise the search path
+
+Instead of hard-coding the fact that load_configs() searches for files under
+meson/native, pass in the subdirectory allowing the cross-file code to use the
+same logic.
+---
+ mesonbuild/coredata.py    | 6 +++---
+ mesonbuild/environment.py | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/mesonbuild/coredata.py b/mesonbuild/coredata.py
+index fba90fa369..6e60917d10 100644
+--- a/mesonbuild/coredata.py
++++ b/mesonbuild/coredata.py
+@@ -211,8 +211,8 @@ def is_auto(self):
+         return self.value == 'auto'
+ 
+ 
+-def load_configs(filenames):
+-    """Load native files."""
++def load_configs(filenames, subdir):
++    """Load configuration files from a named subdirectory."""
+     def gen():
+         for f in filenames:
+             f = os.path.expanduser(os.path.expandvars(f))
+@@ -225,7 +225,7 @@ def gen():
+                     os.environ.get('XDG_DATA_HOME', os.path.expanduser('~/.local/share')),
+                 ] + os.environ.get('XDG_DATA_DIRS', '/usr/local/share:/usr/share').split(':')
+                 for path in paths:
+-                    path_to_try = os.path.join(path, 'meson', 'native', f)
++                    path_to_try = os.path.join(path, 'meson', subdir, f)
+                     if os.path.isfile(path_to_try):
+                         yield path_to_try
+                         break
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 58adb06960..92a00dd7bf 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -408,7 +408,7 @@ def __init__(self, source_dir, build_dir, options):
+ 
+         if self.coredata.config_files is not None:
+             config = MesonConfigFile.from_config_parser(
+-                coredata.load_configs(self.coredata.config_files))
++                coredata.load_configs(self.coredata.config_files, 'native'))
+             self.binaries.build = BinaryTable(config.get('binaries', {}))
+             self.paths.build = Directories(**config.get('paths', {}))
+ 
diff --git a/meta/recipes-devtools/meson/meson_0.49.2.bb b/meta/recipes-devtools/meson/meson_0.50.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.49.2.bb
rename to meta/recipes-devtools/meson/meson_0.50.0.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.50.0.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.49.2.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.50.0.bb
-- 
2.17.1


