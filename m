Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4907F79680
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:56 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id j62-v6so8498692edd.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q6An6Ml6nERpaRpBOYdW0PEFrvIiiPGUWP16wro+bd4=;
	b=MVsvIXBfAN8uifBbfN5Z7FfUi016R2ndEjQMkUiCs1SdJ4b2VjzcTYhwOLT7pKlZYL
	MKTqP+4dJjmDr1f4CPIEambDaDrCZCe4ZPMPDCjhYaDrTa8wLWUW5KnYFUNp932KwGxD
	JTs27fNo903MpCCwXmmNkWs41+74V7pdieu6J2sibRBJ9Q2rjoPLPN5nROpqCjwJQMhN
	XZHnvo86cHUW06zHQWmR5GiUn7e2biNreadkkSLlbZc7UEPscqqfKQWxUt2eBGMwpoIU
	Q+P22GxA9u6gr09wkVzir+epxE0xqnQe1uO4YkwXsITSjdSL0Q9Nur+0l3GtgkMnm6/O
	5idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q6An6Ml6nERpaRpBOYdW0PEFrvIiiPGUWP16wro+bd4=;
	b=p4KUFphZ3mjsUhtZ5COMqALxyqlbMbsnzdF+9EV8N1YC9Ip452zQBDF37ZFPBKxwWe
	8UZt+SCC2QT+eFTB42L6FF0FulPeI+4jGtZ9cTEFjJ0qa9ympZBLAuPNSQfnt45ZIXuq
	yMrhBio1HOCw/2BeF0TIi0Xh0azTnkTp9VnF9Ftk5zRVWXJVhZynBTZIiRRtmsOeyKvI
	i6kEEb2umtXcfjEeoU5JV86xt39sm1KZvkvG4MomJMtK2mArWpzRkEfoEEaesidBK10i
	Gou5KSf55U0hU0Y84l1pphF3mLEPVxW/3ArxQzL4lo/b6nShkNu3VfJMleXq0Q4wQMmM
	jR1g==
X-Gm-Message-State: APzg51D6lcfZShvuuWGE408Ej0vRcaO2IwPNwszQY0sFVhElAu0ZTXXi
	2BT6xdc7kUdA702IcMmlevRzQ9IT970=
X-Google-Smtp-Source: ANB0VdapVV5QFkXmVC5rWUAW+41SSshx6rxHmi6Jb5oeVoz61TkZ9MAM9RqUzzOuiuXBX+yE5Xj++Q==
X-Received: by 2002:a50:ed1a:: with SMTP id
	j26-v6mr2812771eds.29.1536230455910; 
	Thu, 06 Sep 2018 03:40:55 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:33 +0200
Message-Id: <1536230436-30342-18-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 18/21] meson: update to 0.47.2
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:57 -0000

Drop backported patches, refresh the rest.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc              |  10 +-
 .../meson/0001-Validate-cpu_family-3753.patch      | 110 ---
 ...ix-issues-that-arise-when-cross-compiling.patch |  30 +-
 ...-mesonbuild-Recognise-risc-v-architecture.patch |  27 -
 .../0002-Make-CPU-family-warnings-fatal.patch      |  24 +-
 ...r-to-our-wiki-instead-of-Meson-bug-system.patch |  16 +-
 .../meson/meson/0003-native_bindir.patch           |  44 +-
 ...0004-Prettifying-some-output-with-pathlib.patch | 188 -----
 ...on-command-to-use-when-we-know-what-it-is.patch | 851 ---------------------
 .../meson/{meson_0.46.1.bb => meson_0.47.2.bb}     |   0
 10 files changed, 62 insertions(+), 1238 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-Validate-cpu_family-3753.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch
 delete mode 100644 meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch
 rename meta/recipes-devtools/meson/{meson_0.46.1.bb => meson_0.47.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index b5dfa2c..e7f999a 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -9,19 +9,17 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
-           file://0004-Prettifying-some-output-with-pathlib.patch \
-           file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
-           file://0001-Validate-cpu_family-3753.patch \
            file://0002-Make-CPU-family-warnings-fatal.patch \
            file://0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch \
-           file://0001-mesonbuild-Recognise-risc-v-architecture.patch \
            file://0001-Support-building-allarch-recipes-again.patch \
            "
+SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
+SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
 
-SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
-SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
 inherit setuptools3
 
 RDEPENDS_${PN} = "ninja python3-core python3-modules"
+
+FILES_${PN} += "${datadir}/polkit-1"
diff --git a/meta/recipes-devtools/meson/meson/0001-Validate-cpu_family-3753.patch b/meta/recipes-devtools/meson/meson/0001-Validate-cpu_family-3753.patch
deleted file mode 100644
index 6b0d0ca..0000000
--- a/meta/recipes-devtools/meson/meson/0001-Validate-cpu_family-3753.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 12fe95b1943eb832a54ba09274fa02c60d04f6b0 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross@burtonini.com>
-Date: Wed, 20 Jun 2018 13:45:44 +0100
-Subject: [PATCH 1/3] Validate cpu_family (#3753)
-
-* environment: validate cpu_family in cross file
-
-* run_unittests: add unittest to ensure CPU family list in docs and environment matches
-
-* run_unittests: skip compiler options test if not in a git repository
-
-* environment: validate the detected cpu_family
-
-* docs: add 32-bit PowerPC and 32/64-bit MIPS to CPU Families table
-
-Names gathered by booting Linux in Qemu and running:
-
-$ python3
-import platform; platform.machine()
-
-Partial fix for #3751
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- mesonbuild/environment.py | 24 ++++++++++++++++++++++++
- run_unittests.py          | 18 ++++++++++++++++++
- 2 files changed, 42 insertions(+)
-
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index d02a837..678d009 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -72,6 +72,22 @@ from .compilers import (
- 
- build_filename = 'meson.build'
- 
-+known_cpu_families = (
-+    'aarch64',
-+    'arm',
-+    'e2k',
-+    'ia64',
-+    'mips',
-+    'mips64',
-+    'parisc',
-+    'ppc',
-+    'ppc64',
-+    'ppc64le',
-+    'sparc64',
-+    'x86',
-+    'x86_64'
-+)
-+
- # Environment variables that each lang uses.
- cflags_mapping = {'c': 'CFLAGS',
-                   'cpp': 'CXXFLAGS',
-@@ -210,6 +226,10 @@ def detect_cpu_family(compilers):
-                 pass
-         return 'x86_64'
-     # Add fixes here as bugs are reported.
-+
-+    if trial not in known_cpu_families:
-+        mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
-+
-     return trial
- 
- def detect_cpu(compilers):
-@@ -1021,6 +1041,10 @@ class CrossBuildInfo:
-                     res = eval(value, {'__builtins__': None}, {'true': True, 'false': False})
-                 except Exception:
-                     raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
-+
-+                if entry == 'cpu_family' and res not in known_cpu_families:
-+                    mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % value)
-+
-                 if self.ok_type(res):
-                     self.config[s][entry] = res
-                 elif isinstance(res, list):
-diff --git a/run_unittests.py b/run_unittests.py
-index 3c215db..7185008 100755
---- a/run_unittests.py
-+++ b/run_unittests.py
-@@ -2065,6 +2065,24 @@ recommended as it can lead to undefined behaviour on some platforms''')
-         self.wipe()
- 
- 
-+    @unittest.skipIf(not os.path.isdir('docs'), 'Doc dir not found, presumably because this is a tarball release.')
-+    def test_cpu_families_documented(self):
-+        with open("docs/markdown/Reference-tables.md") as f:
-+            md = f.read()
-+        self.assertIsNotNone(md)
-+
-+        sections = list(re.finditer(r"^## (.+)$", md, re.MULTILINE))
-+        for s1, s2 in zip(sections[::2], sections[1::2]):
-+            if s1.group(1) == "CPU families":
-+                # Extract the content for this section
-+                content = md[s1.end():s2.start()]
-+                # Find the list entries
-+                arches = [m.group(1) for m in re.finditer(r"^\| (\w+) +\|", content, re.MULTILINE)]
-+                # Drop the header
-+                arches = set(arches[1:])
-+                self.assertEqual(arches, set(mesonbuild.environment.known_cpu_families))
-+
-+
- class FailureTests(BasePlatformTests):
-     '''
-     Tests that test failure conditions. Build files here should be dynamically
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index a00743f..57cb678 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From d1c2b3bf01f1a5897cf5c906ba2326fb68c6af12 Mon Sep 17 00:00:00 2001
+From 3ac4e58c5494bd7e603a325b5b5c2b8075849fee Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:16:41 +0300
 Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
@@ -21,10 +21,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 22 insertions(+), 5 deletions(-)
 
 diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 569011e..770ff4f 100644
+index cb69641..727eb6a 100644
 --- a/mesonbuild/modules/gnome.py
 +++ b/mesonbuild/modules/gnome.py
-@@ -773,6 +773,10 @@ This will become a hard error in the future.''')
+@@ -792,6 +792,10 @@ This will become a hard error in the future.''')
                  '--mode=' + mode]
          if namespace:
              args.append('--namespace=' + namespace)
@@ -35,10 +35,10 @@ index 569011e..770ff4f 100644
          args += self._unpack_args('--htmlargs=', 'html_args', kwargs)
          args += self._unpack_args('--scanargs=', 'scan_args', kwargs)
          args += self._unpack_args('--scanobjsargs=', 'scanobjs_args', kwargs)
-@@ -829,14 +833,22 @@ This will become a hard error in the future.''')
-         cflags.update(get_include_args(inc_dirs))
-         cflags.update(state.environment.coredata.external_args['c'])
-         ldflags.update(state.environment.coredata.external_link_args['c'])
+@@ -854,14 +858,22 @@ This will become a hard error in the future.''')
+         ldflags.update(internal_ldflags)
+         ldflags.update(state.environment.coredata.get_external_link_args('c'))
+         ldflags.update(external_ldflags)
 +
 +        cross_c_args = " ".join(state.environment.cross_info.config["properties"].get('c_args', ""))
 +        cross_link_args = " ".join(state.environment.cross_info.config["properties"].get('c_link_args', ""))
@@ -62,7 +62,7 @@ index 569011e..770ff4f 100644
          return args
  
 diff --git a/mesonbuild/scripts/gtkdochelper.py b/mesonbuild/scripts/gtkdochelper.py
-index 2a5ee8b..2fd692b 100644
+index 948dc5a..9c5bd19 100644
 --- a/mesonbuild/scripts/gtkdochelper.py
 +++ b/mesonbuild/scripts/gtkdochelper.py
 @@ -45,6 +45,7 @@ parser.add_argument('--ignore-headers', dest='ignore_headers', default='')
@@ -71,9 +71,9 @@ index 2a5ee8b..2fd692b 100644
  parser.add_argument('--installdir', dest='install_dir')
 +parser.add_argument('--gtkdoc-exe-wrapper', dest='gtkdoc_exe_wrapper')
  
- def gtkdoc_run_check(cmd, cwd, library_path=None):
-     env = dict(os.environ)
-@@ -54,7 +55,7 @@ def gtkdoc_run_check(cmd, cwd, library_path=None):
+ def gtkdoc_run_check(cmd, cwd, library_paths=None):
+     if library_paths is None:
+@@ -64,7 +65,7 @@ def gtkdoc_run_check(cmd, cwd, library_paths=None):
      # This preserves the order of messages.
      p, out = Popen_safe(cmd, cwd=cwd, env=env, stderr=subprocess.STDOUT)[0:2]
      if p.returncode != 0:
@@ -82,7 +82,7 @@ index 2a5ee8b..2fd692b 100644
          if out:
              err_msg.append(out)
          raise MesonException('\n'.join(err_msg))
-@@ -62,7 +63,7 @@ def gtkdoc_run_check(cmd, cwd, library_path=None):
+@@ -74,7 +75,7 @@ def gtkdoc_run_check(cmd, cwd, library_paths=None):
  def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
                   main_file, module,
                   html_args, scan_args, fixxref_args, mkdb_args,
@@ -91,7 +91,7 @@ index 2a5ee8b..2fd692b 100644
                   html_assets, content_files, ignore_headers, namespace,
                   expand_content_files, mode):
      print("Building documentation for %s" % module)
-@@ -115,6 +116,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
+@@ -135,6 +136,9 @@ def build_gtkdoc(source_root, build_root, doc_subdir, src_subdirs,
      if gobject_typesfile:
          scanobjs_cmd = ['gtkdoc-scangobj'] + scanobjs_args + ['--types=' + gobject_typesfile,
                                                                '--module=' + module,
@@ -100,8 +100,8 @@ index 2a5ee8b..2fd692b 100644
 +                                                              '--ld=' + ld,
                                                                '--cflags=' + cflags,
                                                                '--ldflags=' + ldflags,
-                                                               '--ld=' + ld]
-@@ -219,6 +223,7 @@ def run(args):
+                                                               '--cc=' + cc,
+@@ -238,6 +242,7 @@ def run(args):
          mkdbargs,
          options.gobject_typesfile,
          scanobjsargs,
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch
deleted file mode 100644
index a983bd7..0000000
--- a/meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 85bb96909d2024769d8e758538a7e8e2004dbb4d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Jul 2018 13:03:39 -0700
-Subject: [PATCH] mesonbuild: Recognise risc-v architecture
-
-Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/6fafbad6d5ba591075a72e4726af647cece7020d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mesonbuild/environment.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index a0580a21..b2041424 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -83,6 +83,8 @@ known_cpu_families = (
-     'ppc',
-     'ppc64',
-     'ppc64le',
-+    'riscv32',
-+    'riscv64',
-     'sparc64',
-     'x86',
-     'x86_64'
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
index 3b37735..a6c1b25 100644
--- a/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Make-CPU-family-warnings-fatal.patch
@@ -1,28 +1,31 @@
-From 9681c5bdea6a67abf014d94a392ef42eea7df0cd Mon Sep 17 00:00:00 2001
+From 2e8553fc01e62ebc4faa240bf20984a8a0ac7387 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
-Subject: [PATCH 2/3] Make CPU family warnings fatal
+Subject: [PATCH] Make CPU family warnings fatal
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 ---
- mesonbuild/environment.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ mesonbuild/environment.py | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 678d009..8b32892 100644
+index d29a77f..267acf9 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -228,7 +228,7 @@ def detect_cpu_family(compilers):
-     # Add fixes here as bugs are reported.
+@@ -239,9 +239,7 @@ def detect_cpu_family(compilers):
+         return 'x86_64'
  
      if trial not in known_cpu_families:
--        mlog.warning('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
+-        mlog.warning('Unknown CPU family {!r}, please report this at '
+-                     'https://github.com/mesonbuild/meson/issues/new with the'
+-                     'output of `uname -a` and `cat /proc/cpuinfo`'.format(trial))
 +        raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
  
      return trial
  
-@@ -1043,7 +1043,7 @@ class CrossBuildInfo:
+@@ -1014,7 +1012,7 @@ class CrossBuildInfo:
                      raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
  
                  if entry == 'cpu_family' and res not in known_cpu_families:
@@ -31,6 +34,3 @@ index 678d009..8b32892 100644
  
                  if self.ok_type(res):
                      self.config[s][entry] = res
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch b/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch
index 8f4603e..5295335 100644
--- a/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch
+++ b/meta/recipes-devtools/meson/meson/0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch
@@ -1,7 +1,7 @@
-From 62f4702a1d5076d0c225f899fe65cd3badfdd022 Mon Sep 17 00:00:00 2001
+From 31df0a854aa40c4ce8fbf1ca02ccc9b6bff0abfd Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 6 Jul 2018 15:51:15 +0100
-Subject: [PATCH 3/3] Send user to our wiki instead of Meson bug system
+Subject: [PATCH] Send user to our wiki instead of Meson bug system
 
 If a CPU family isn't recognised the first step should be to verify the
 mapping. Send the user to a wiki page explaining what to do, instead of
@@ -9,16 +9,17 @@ directly to the Meson bug tracker.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 ---
  mesonbuild/environment.py | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 8b32892..a0580a2 100644
+index 267acf9..19a3c1e 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -228,7 +228,7 @@ def detect_cpu_family(compilers):
-     # Add fixes here as bugs are reported.
+@@ -239,7 +239,7 @@ def detect_cpu_family(compilers):
+         return 'x86_64'
  
      if trial not in known_cpu_families:
 -        raise EnvironmentException('Unknown CPU family %s, please report this at https://github.com/mesonbuild/meson/issues/new' % trial)
@@ -26,7 +27,7 @@ index 8b32892..a0580a2 100644
  
      return trial
  
-@@ -1043,7 +1043,7 @@ class CrossBuildInfo:
+@@ -1012,7 +1012,7 @@ class CrossBuildInfo:
                      raise EnvironmentException('Malformed value in cross file variable %s.' % entry)
  
                  if entry == 'cpu_family' and res not in known_cpu_families:
@@ -35,6 +36,3 @@ index 8b32892..a0580a2 100644
  
                  if self.ok_type(res):
                      self.config[s][entry] = res
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index f003277..da47745 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -1,4 +1,4 @@
-From 0eec9428376450917098c68539a6c9dd60b85d93 Mon Sep 17 00:00:00 2001
+From e762d85c823adfefc27ba6128c7b997aa50166ce Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Wed, 15 Nov 2017 15:05:01 +0100
 Subject: [PATCH] native_bindir
@@ -22,10 +22,10 @@ Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
  2 files changed, 14 insertions(+), 11 deletions(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 0114a14..f4f19c5 100644
+index 6d3678f..90fdb80 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -141,7 +141,7 @@ class Dependency:
+@@ -146,7 +146,7 @@ class Dependency:
      def need_threads(self):
          return False
  
@@ -34,7 +34,7 @@ index 0114a14..f4f19c5 100644
          raise DependencyException('{!r} is not a pkgconfig dependency'.format(self.name))
  
      def get_configtool_variable(self, variable_name):
-@@ -178,7 +178,7 @@ class InternalDependency(Dependency):
+@@ -183,7 +183,7 @@ class InternalDependency(Dependency):
          self.sources = sources
          self.ext_deps = ext_deps
  
@@ -43,25 +43,29 @@ index 0114a14..f4f19c5 100644
          raise DependencyException('Method "get_pkgconfig_variable()" is '
                                    'invalid for an internal dependency')
  
-@@ -517,11 +517,14 @@ class PkgConfigDependency(ExternalDependency):
+@@ -523,15 +523,18 @@ class PkgConfigDependency(ExternalDependency):
          return s.format(self.__class__.__name__, self.name, self.is_found,
                          self.version_reqs)
  
 -    def _call_pkgbin_real(self, args, env):
--        p, out = Popen_safe(self.pkgbin.get_command() + args, env=env)[0:2]
+-        cmd = self.pkgbin.get_command() + args
 +    def _call_pkgbin_real(self, args, env, use_native=False):
 +        if use_native:
-+            p, out = Popen_safe(self.pkgbin.get_command() + "-native" + args, env=env)[0:2]
++            cmd = self.pkgbin.get_command() + "-native" + args
 +        else:
-+            p, out = Popen_safe(self.pkgbin.get_command() + args, env=env)[0:2]
-         return p.returncode, out.strip()
++            cmd = self.pkgbin.get_command() + args
+         p, out = Popen_safe(cmd, env=env)[0:2]
+         rc, out = p.returncode, out.strip()
+         call = ' '.join(cmd)
+         mlog.debug("Called `{}` -> {}\n{}".format(call, rc, out))
+         return rc, out
  
 -    def _call_pkgbin(self, args, env=None):
 +    def _call_pkgbin(self, args, env=None, use_native=False):
          if env is None:
              fenv = env
              env = os.environ
-@@ -530,7 +533,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -540,7 +543,7 @@ class PkgConfigDependency(ExternalDependency):
          targs = tuple(args)
          cache = PkgConfigDependency.pkgbin_cache
          if (self.pkgbin, targs, fenv) not in cache:
@@ -70,16 +74,16 @@ index 0114a14..f4f19c5 100644
          return cache[(self.pkgbin, targs, fenv)]
  
      def _convert_mingw_paths(self, args):
-@@ -630,7 +633,7 @@ class PkgConfigDependency(ExternalDependency):
-             # linkers such as MSVC, so prepend them.
-             self.link_args = ['-L' + lp for lp in libpaths] + self.link_args
+@@ -718,7 +721,7 @@ class PkgConfigDependency(ExternalDependency):
+                                       (self.name, out_raw))
+         self.link_args, self.raw_link_args = self._search_libs(out, out_raw)
  
 -    def get_pkgconfig_variable(self, variable_name, kwargs):
 +    def get_pkgconfig_variable(self, variable_name, kwargs, use_native=False):
          options = ['--variable=' + variable_name, self.name]
  
          if 'define_variable' in kwargs:
-@@ -643,7 +646,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -731,7 +734,7 @@ class PkgConfigDependency(ExternalDependency):
  
              options = ['--define-variable=' + '='.join(definition)] + options
  
@@ -89,10 +93,10 @@ index 0114a14..f4f19c5 100644
          if ret != 0:
              if self.required:
 diff --git a/mesonbuild/dependencies/ui.py b/mesonbuild/dependencies/ui.py
-index 2f31196..916f648 100644
+index 197d22c..c683d21 100644
 --- a/mesonbuild/dependencies/ui.py
 +++ b/mesonbuild/dependencies/ui.py
-@@ -240,7 +240,7 @@ class QtBaseDependency(ExternalDependency):
+@@ -285,7 +285,7 @@ class QtBaseDependency(ExternalDependency):
          self.bindir = self.get_pkgconfig_host_bins(core)
          if not self.bindir:
              # If exec_prefix is not defined, the pkg-config file is broken
@@ -101,7 +105,7 @@ index 2f31196..916f648 100644
              if prefix:
                  self.bindir = os.path.join(prefix, 'bin')
  
-@@ -374,7 +374,7 @@ class Qt4Dependency(QtBaseDependency):
+@@ -427,7 +427,7 @@ class Qt4Dependency(QtBaseDependency):
          applications = ['moc', 'uic', 'rcc', 'lupdate', 'lrelease']
          for application in applications:
              try:
@@ -110,12 +114,12 @@ index 2f31196..916f648 100644
              except MesonException:
                  pass
  
-@@ -384,7 +384,7 @@ class Qt5Dependency(QtBaseDependency):
+@@ -437,7 +437,7 @@ class Qt5Dependency(QtBaseDependency):
          QtBaseDependency.__init__(self, 'qt5', env, kwargs)
  
      def get_pkgconfig_host_bins(self, core):
 -        return core.get_pkgconfig_variable('host_bins', {})
 +        return core.get_pkgconfig_variable('host_bins', {}, use_native=True)
  
- 
- # There are three different ways of depending on SDL2:
+     def get_private_includes(self, mod_inc_dir, module):
+         return _qt_get_private_includes(mod_inc_dir, module, self.version)
diff --git a/meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch b/meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch
deleted file mode 100644
index e75633b..0000000
--- a/meta/recipes-devtools/meson/meson/0004-Prettifying-some-output-with-pathlib.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 253ab5bf6d6d925abcf625b72f5fcacf99be13bd Mon Sep 17 00:00:00 2001
-From: Niklas Claesson <nicke.claesson@gmail.com>
-Date: Wed, 18 Apr 2018 15:25:03 +0200
-Subject: [PATCH] Prettifying some output with pathlib
-
-This is a backport required in order to make
-0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch apply.
-
-Upstream-Status: Accepted [https://github.com/mesonbuild/meson/pull/3423]
-Should be in the 0.47.0 release.
-
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
----
- run_cross_test.py    |  6 ++++--
- run_project_tests.py | 51 +++++++++++++++++++++++++++++----------------------
- 2 files changed, 33 insertions(+), 24 deletions(-)
-
-diff --git a/run_cross_test.py b/run_cross_test.py
-index e285e218..71914028 100755
---- a/run_cross_test.py
-+++ b/run_cross_test.py
-@@ -22,13 +22,15 @@ Not part of the main test suite because of two reasons:
- 
- Eventually migrate to something fancier.'''
- 
--import sys, os
-+import sys
-+import os
-+from pathlib import Path
- 
- from run_project_tests import gather_tests, run_tests, StopException, setup_commands
- from run_project_tests import failing_logs
- 
- def runtests(cross_file):
--    commontests = [('common', gather_tests('test cases/common'), False)]
-+    commontests = [('common', gather_tests(Path('test cases', 'common')), False)]
-     try:
-         (passing_tests, failing_tests, skipped_tests) = run_tests(commontests, 'meson-cross-test-run', ['--cross', cross_file])
-     except StopException:
-diff --git a/run_project_tests.py b/run_project_tests.py
-index 8c02a9ee..3c516240 100755
---- a/run_project_tests.py
-+++ b/run_project_tests.py
-@@ -14,14 +14,22 @@
- # See the License for the specific language governing permissions and
- # limitations under the License.
- 
--from glob import glob
- import itertools
--import os, subprocess, shutil, sys, signal
-+import os
-+import subprocess
-+import shutil
-+import sys
-+import signal
- from io import StringIO
- from ast import literal_eval
- from enum import Enum
- import tempfile
--from mesonbuild import build, environment, mesonlib, mlog, mtest
-+from pathlib import Path, PurePath
-+from mesonbuild import build
-+from mesonbuild import environment
-+from mesonbuild import mesonlib
-+from mesonbuild import mlog
-+from mesonbuild import mtest
- from mesonbuild.mesonlib import stringlistify, Popen_safe
- from mesonbuild.coredata import backendlist
- import argparse
-@@ -198,7 +206,7 @@ def validate_install(srcdir, installdir, compiler, env):
- 
- def log_text_file(logfile, testdir, stdo, stde):
-     global stop, executor, futures
--    logfile.write('%s\nstdout\n\n---\n' % testdir)
-+    logfile.write('%s\nstdout\n\n---\n' % testdir.as_posix())
-     logfile.write(stdo)
-     logfile.write('\n\n---\n\nstderr\n\n---\n')
-     logfile.write(stde)
-@@ -245,11 +253,11 @@ def run_test_inprocess(testdir):
-     sys.stderr = mystderr = StringIO()
-     old_cwd = os.getcwd()
-     os.chdir(testdir)
--    test_log_fname = 'meson-logs/testlog.txt'
-+    test_log_fname = Path('meson-logs', 'testlog.txt')
-     try:
-         returncode_test = mtest.run(['--no-rebuild'])
--        if os.path.exists(test_log_fname):
--            test_log = open(test_log_fname, errors='ignore').read()
-+        if test_log_fname.exists():
-+            test_log = test_log_fname.open(errors='ignore').read()
-         else:
-             test_log = ''
-         returncode_benchmark = mtest.run(['--no-rebuild', '--benchmark', '--logbase', 'benchmarklog'])
-@@ -318,9 +326,8 @@ def _run_test(testdir, test_build_dir, install_dir, extra_args, compiler, backen
-     gen_args += [testdir, test_build_dir] + flags + test_args + extra_args
-     (returncode, stdo, stde) = run_configure(meson_command, gen_args)
-     try:
--        logfile = os.path.join(test_build_dir, 'meson-logs/meson-log.txt')
--        with open(logfile, encoding='utf-8', errors='ignore') as f:
--            mesonlog = f.read()
-+        logfile = Path(test_build_dir, 'meson-logs', 'meson-log.txt')
-+        mesonlog = logfile.open(errors='ignore', encoding='utf-8').read()
-     except Exception:
-         mesonlog = no_meson_log_msg
-     gen_time = time.time() - gen_start
-@@ -390,11 +397,11 @@ def _run_test(testdir, test_build_dir, install_dir, extra_args, compiler, backen
-     return TestResult(validate_install(testdir, install_dir, compiler, builddata.environment),
-                       BuildStep.validate, stdo, stde, mesonlog, gen_time, build_time, test_time)
- 
--def gather_tests(testdir):
--    tests = [t.replace('\\', '/').split('/', 2)[2] for t in glob(testdir + '/*')]
-+def gather_tests(testdir: Path):
-+    tests = [t.name for t in testdir.glob('*')]
-     testlist = [(int(t.split()[0]), t) for t in tests]
-     testlist.sort()
--    tests = [os.path.join(testdir, t[1]) for t in testlist]
-+    tests = [testdir / t[1] for t in testlist]
-     return tests
- 
- def have_d_compiler():
-@@ -517,7 +524,7 @@ def detect_tests_to_run():
-         ('fpga', 'fpga', shutil.which('yosys') is None),
-         ('frameworks', 'frameworks', False),
-     ]
--    gathered_tests = [(name, gather_tests('test cases/' + subdir), skip) for name, subdir, skip in all_tests]
-+    gathered_tests = [(name, gather_tests(Path('test cases', subdir)), skip) for name, subdir, skip in all_tests]
-     return gathered_tests
- 
- def run_tests(all_tests, log_name_base, extra_args):
-@@ -566,18 +573,18 @@ def _run_tests(all_tests, log_name_base, extra_args):
-         for t in test_cases:
-             # Jenkins screws us over by automatically sorting test cases by name
-             # and getting it wrong by not doing logical number sorting.
--            (testnum, testbase) = os.path.split(t)[-1].split(' ', 1)
-+            (testnum, testbase) = t.name.split(' ', 1)
-             testname = '%.3d %s' % (int(testnum), testbase)
-             should_fail = False
-             if name.startswith('failing'):
-                 should_fail = name.split('failing-')[1]
--            result = executor.submit(run_test, skipped, t, extra_args, system_compiler, backend, backend_flags, commands, should_fail)
-+            result = executor.submit(run_test, skipped, t.as_posix(), extra_args, system_compiler, backend, backend_flags, commands, should_fail)
-             futures.append((testname, t, result))
-         for (testname, t, result) in futures:
-             sys.stdout.flush()
-             result = result.result()
--            if (result is None) or (('MESON_SKIP_TEST' in result.stdo) and (skippable(name, t))):
--                print(yellow('Skipping:'), t)
-+            if (result is None) or (('MESON_SKIP_TEST' in result.stdo) and (skippable(name, t.as_posix()))):
-+                print(yellow('Skipping:'), t.as_posix())
-                 current_test = ET.SubElement(current_suite, 'testcase', {'name': testname,
-                                                                          'classname': name})
-                 ET.SubElement(current_test, 'skipped', {})
-@@ -585,7 +592,7 @@ def _run_tests(all_tests, log_name_base, extra_args):
-             else:
-                 without_install = "" if len(install_commands) > 0 else " (without install)"
-                 if result.msg != '':
--                    print(red('Failed test{} during {}: {!r}'.format(without_install, result.step.name, t)))
-+                    print(red('Failed test{} during {}: {!r}'.format(without_install, result.step.name, t.as_posix())))
-                     print('Reason:', result.msg)
-                     failing_tests += 1
-                     if result.step == BuildStep.configure and result.mlog != no_meson_log_msg:
-@@ -597,7 +604,7 @@ def _run_tests(all_tests, log_name_base, extra_args):
-                         failing_logs.append(result.stdo)
-                     failing_logs.append(result.stde)
-                 else:
--                    print('Succeeded test%s: %s' % (without_install, t))
-+                    print('Succeeded test%s: %s' % (without_install, t.as_posix()))
-                     passing_tests += 1
-                 conf_time += result.conftime
-                 build_time += result.buildtime
-@@ -641,7 +648,7 @@ def check_format():
- 
- def check_meson_commands_work():
-     global backend, meson_command, compile_commands, test_commands, install_commands
--    testdir = 'test cases/common/1 trivial'
-+    testdir = PurePath('test cases', 'common', '1 trivial').as_posix()
-     with AutoDeletedDir(tempfile.mkdtemp(prefix='b ', dir='.')) as build_dir:
-         print('Checking that configuring works...')
-         gen_cmd = mesonlib.meson_command + [testdir, build_dir] + backend_flags
-@@ -706,7 +713,7 @@ if __name__ == '__main__':
-             except UnicodeError:
-                 print(l.encode('ascii', errors='replace').decode(), '\n')
-     for name, dirs, skip in all_tests:
--        dirs = (os.path.basename(x) for x in dirs)
-+        dirs = (x.name for x in dirs)
-         for k, g in itertools.groupby(dirs, key=lambda x: x.split()[0]):
-             tests = list(g)
-             if len(tests) != 1:
diff --git a/meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch b/meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch
deleted file mode 100644
index 8fb277a..0000000
--- a/meta/recipes-devtools/meson/meson/0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch
+++ /dev/null
@@ -1,851 +0,0 @@
-From 717480549bea68ed2da1420141f64c1c15cda11d Mon Sep 17 00:00:00 2001
-From: Nirbheek Chauhan <nirbheek@centricular.com>
-Date: Fri, 1 Jun 2018 13:00:17 +0530
-Subject: [PATCH] Set the meson command to use when we know what it is
-
-Instead of using fragile guessing to figure out how to invoke meson,
-set the value when meson is run. Also rework how we pass of
-meson_script_launcher to regenchecker.py -- it wasn't even being used
-
-With this change, we only need to guess the meson path when running
-the tests, and in that case:
-
-1. If MESON_EXE is set in the env, we know how to run meson
-   for project tests.
-2. MESON_EXE is not set, which means we run the configure in-process
-   for project tests and need to guess what meson to run, so either
-   - meson.py is found next to run_tests.py, or
-   - meson, meson.py, or meson.exe is in PATH
-
-Otherwise, you can invoke meson in the following ways:
-
-1. meson is installed, and mesonbuild is available in PYTHONPATH:
-   - meson, meson.py, meson.exe from PATH
-   - python3 -m mesonbuild.mesonmain
-   - python3 /path/to/meson.py
-   - meson is a shell wrapper to meson.real
-2. meson is not installed, and is run from git:
-   - Absolute path to meson.py
-   - Relative path to meson.py
-   - Symlink to meson.py
-
-All these are tested in test_meson_commands.py, except meson.exe since
-that involves building the meson msi and installing it.
-
-Upstream-Status: Accepted [https://github.com/mesonbuild/meson/pull/3654]
-Should be in the 0.47.0 release.
-
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
----
- meson.py                            |  17 ++--
- mesonbuild/environment.py           |   6 +-
- mesonbuild/mesonlib.py              |  48 +---------
- mesonbuild/mesonmain.py             |  34 +++++--
- mesonbuild/scripts/regen_checker.py |   6 +-
- run_meson_command_tests.py          | 186 ++++++++++++++++++++++++++++++++++++
- run_project_tests.py                |  20 ++--
- run_tests.py                        |  43 +++++++--
- run_unittests.py                    |  64 +++++--------
- 9 files changed, 297 insertions(+), 127 deletions(-)
- create mode 100755 run_meson_command_tests.py
-
-diff --git a/meson.py b/meson.py
-index abbac6f4..dc84b513 100755
---- a/meson.py
-+++ b/meson.py
-@@ -14,13 +14,16 @@
- # See the License for the specific language governing permissions and
- # limitations under the License.
- 
--from mesonbuild import mesonmain
--import sys, os
-+import sys
-+from pathlib import Path
-+
-+# If we're run uninstalled, add the script directory to sys.path to ensure that
-+# we always import the correct mesonbuild modules even if PYTHONPATH is mangled
-+meson_exe = Path(sys.argv[0]).resolve()
-+if (meson_exe.parent / 'mesonbuild').is_dir():
-+    sys.path.insert(0, meson_exe.parent)
- 
--def main():
--    # Always resolve the command path so Ninja can find it for regen, tests, etc.
--    launcher = os.path.realpath(sys.argv[0])
--    return mesonmain.run(sys.argv[1:], launcher)
-+from mesonbuild import mesonmain
- 
- if __name__ == '__main__':
--    sys.exit(main())
-+    sys.exit(mesonmain.main())
-diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 15b37378..d02a8370 100644
---- a/mesonbuild/environment.py
-+++ b/mesonbuild/environment.py
-@@ -263,10 +263,9 @@ class Environment:
-     log_dir = 'meson-logs'
-     coredata_file = os.path.join(private_dir, 'coredata.dat')
- 
--    def __init__(self, source_dir, build_dir, main_script_launcher, options, original_cmd_line_args):
-+    def __init__(self, source_dir, build_dir, options, original_cmd_line_args):
-         self.source_dir = source_dir
-         self.build_dir = build_dir
--        self.meson_script_launcher = main_script_launcher
-         self.scratch_dir = os.path.join(build_dir, Environment.private_dir)
-         self.log_dir = os.path.join(build_dir, Environment.log_dir)
-         os.makedirs(self.scratch_dir, exist_ok=True)
-@@ -279,7 +278,8 @@ class Environment:
-             # re-initialized with project options by the interpreter during
-             # build file parsing.
-             self.coredata = coredata.CoreData(options)
--            self.coredata.meson_script_launcher = self.meson_script_launcher
-+            # Used by the regenchecker script, which runs meson
-+            self.coredata.meson_command = mesonlib.meson_command
-             self.first_invocation = True
-         if self.coredata.cross_file:
-             self.cross_info = CrossBuildInfo(self.coredata.cross_file)
-diff --git a/mesonbuild/mesonlib.py b/mesonbuild/mesonlib.py
-index 2a3b920b..01561658 100644
---- a/mesonbuild/mesonlib.py
-+++ b/mesonbuild/mesonlib.py
-@@ -38,58 +38,12 @@ except Exception:
- 
- from glob import glob
- 
--def detect_meson_py_location():
--    c = sys.argv[0]
--    c_dir, c_fname = os.path.split(c)
--
--    # get the absolute path to the <mesontool> folder
--    m_dir = None
--    if os.path.isabs(c):
--        # $ /foo/<mesontool>.py <args>
--        m_dir = c_dir
--    elif c_dir == '':
--        # $ <mesontool> <args> (gets run from /usr/bin/<mesontool>)
--        in_path_exe = shutil.which(c_fname)
--        if in_path_exe:
--            if not os.path.isabs(in_path_exe):
--                m_dir = os.getcwd()
--                c_fname = in_path_exe
--            else:
--                m_dir, c_fname = os.path.split(in_path_exe)
--    else:
--        m_dir = os.path.abspath(c_dir)
--
--    # find meson in m_dir
--    if m_dir is not None:
--        for fname in ['meson', 'meson.py']:
--            m_path = os.path.join(m_dir, fname)
--            if os.path.exists(m_path):
--                return m_path
--
--    # No meson found, which means that either:
--    # a) meson is not installed
--    # b) meson is installed to a non-standard location
--    # c) the script that invoked mesonlib is not the one of meson tools (e.g. run_unittests.py)
--    fname = os.path.normpath(os.path.join(os.path.dirname(__file__), '..', 'meson.py'))
--    if os.path.exists(fname):
--        return fname
--    # If meson is still not found, we might be imported by out-of-source tests
--    # https://github.com/mesonbuild/meson/issues/3015
--    exe = shutil.which('meson')
--    if exe is None:
--        exe = shutil.which('meson.py')
--    if exe is not None:
--        return exe
--    # Give up.
--    raise RuntimeError('Could not determine how to run Meson. Please file a bug with details.')
--
- if os.path.basename(sys.executable) == 'meson.exe':
-     # In Windows and using the MSI installed executable.
--    meson_command = [sys.executable]
-     python_command = [sys.executable, 'runpython']
- else:
-     python_command = [sys.executable]
--    meson_command = python_command + [detect_meson_py_location()]
-+meson_command = None
- 
- def is_ascii_string(astring):
-     try:
-diff --git a/mesonbuild/mesonmain.py b/mesonbuild/mesonmain.py
-index 2b6281d7..67f99439 100644
---- a/mesonbuild/mesonmain.py
-+++ b/mesonbuild/mesonmain.py
-@@ -73,9 +73,8 @@ def filter_builtin_options(args, original_args):
- 
- class MesonApp:
- 
--    def __init__(self, dir1, dir2, script_launcher, handshake, options, original_cmd_line_args):
-+    def __init__(self, dir1, dir2, handshake, options, original_cmd_line_args):
-         (self.source_dir, self.build_dir) = self.validate_dirs(dir1, dir2, handshake)
--        self.meson_script_launcher = script_launcher
-         self.options = options
-         self.original_cmd_line_args = original_cmd_line_args
- 
-@@ -129,7 +128,7 @@ class MesonApp:
-             env.coredata.pkgconf_envvar = curvar
- 
-     def generate(self):
--        env = environment.Environment(self.source_dir, self.build_dir, self.meson_script_launcher, self.options, self.original_cmd_line_args)
-+        env = environment.Environment(self.source_dir, self.build_dir, self.options, self.original_cmd_line_args)
-         mlog.initialize(env.get_log_dir())
-         with mesonlib.BuildDirLock(self.build_dir):
-             self._generate(env)
-@@ -268,12 +267,27 @@ def run_script_command(args):
-         raise MesonException('Unknown internal command {}.'.format(cmdname))
-     return cmdfunc(cmdargs)
- 
--def run(original_args, mainfile=None):
-+def set_meson_command(mainfile):
-+    if mainfile.endswith('.exe'):
-+        mesonlib.meson_command = [mainfile]
-+    elif os.path.isabs(mainfile) and mainfile.endswith('mesonmain.py'):
-+        # Can't actually run meson with an absolute path to mesonmain.py, it must be run as -m mesonbuild.mesonmain
-+        mesonlib.meson_command = mesonlib.python_command + ['-m', 'mesonbuild.mesonmain']
-+    else:
-+        mesonlib.meson_command = mesonlib.python_command + [mainfile]
-+    # This won't go into the log file because it's not initialized yet, and we
-+    # need this value for unit tests.
-+    if 'MESON_COMMAND_TESTS' in os.environ:
-+        mlog.log('meson_command is {!r}'.format(mesonlib.meson_command))
-+
-+def run(original_args, mainfile):
-     if sys.version_info < (3, 5):
-         print('Meson works correctly only with python 3.5+.')
-         print('You have python %s.' % sys.version)
-         print('Please update your environment')
-         return 1
-+    # Set the meson command that will be used to run scripts and so on
-+    set_meson_command(mainfile)
-     args = original_args[:]
-     if len(args) > 0:
-         # First check if we want to run a subcommand.
-@@ -351,9 +365,7 @@ def run(original_args, mainfile=None):
-         else:
-             dir2 = '.'
-     try:
--        if mainfile is None:
--            raise AssertionError('I iz broken. Sorry.')
--        app = MesonApp(dir1, dir2, mainfile, handshake, options, original_args)
-+        app = MesonApp(dir1, dir2, handshake, options, original_args)
-     except Exception as e:
-         # Log directory does not exist, so just print
-         # to stdout.
-@@ -381,3 +393,11 @@ def run(original_args, mainfile=None):
-         mlog.shutdown()
- 
-     return 0
-+
-+def main():
-+    # Always resolve the command path so Ninja can find it for regen, tests, etc.
-+    launcher = os.path.realpath(sys.argv[0])
-+    return run(sys.argv[1:], launcher)
-+
-+if __name__ == '__main__':
-+    sys.exit(main())
-diff --git a/mesonbuild/scripts/regen_checker.py b/mesonbuild/scripts/regen_checker.py
-index a9b00c7b..80d9242b 100644
---- a/mesonbuild/scripts/regen_checker.py
-+++ b/mesonbuild/scripts/regen_checker.py
-@@ -14,7 +14,6 @@
- 
- import sys, os
- import pickle, subprocess
--from mesonbuild.mesonlib import meson_command
- 
- # This could also be used for XCode.
- 
-@@ -32,7 +31,7 @@ def need_regen(regeninfo, regen_timestamp):
-     Vs2010Backend.touch_regen_timestamp(regeninfo.build_dir)
-     return False
- 
--def regen(regeninfo, mesonscript, backend):
-+def regen(regeninfo, meson_command, backend):
-     cmd = meson_command + ['--internal',
-                            'regenerate',
-                            regeninfo.build_dir,
-@@ -48,11 +47,10 @@ def run(args):
-         regeninfo = pickle.load(f)
-     with open(coredata, 'rb') as f:
-         coredata = pickle.load(f)
--    mesonscript = coredata.meson_script_launcher
-     backend = coredata.get_builtin_option('backend')
-     regen_timestamp = os.stat(dumpfile).st_mtime
-     if need_regen(regeninfo, regen_timestamp):
--        regen(regeninfo, mesonscript, backend)
-+        regen(regeninfo, coredata.meson_command, backend)
-     sys.exit(0)
- 
- if __name__ == '__main__':
-diff --git a/run_meson_command_tests.py b/run_meson_command_tests.py
-new file mode 100755
-index 00000000..6efd911b
---- /dev/null
-+++ b/run_meson_command_tests.py
-@@ -0,0 +1,186 @@
-+#!/usr/bin/env python3
-+
-+# Copyright 2018 The Meson development team
-+#
-+# Licensed under the Apache License, Version 2.0 (the "License");
-+# you may not use this file except in compliance with the License.
-+# You may obtain a copy of the License at
-+#
-+#     http://www.apache.org/licenses/LICENSE-2.0
-+#
-+# Unless required by applicable law or agreed to in writing, software
-+# distributed under the License is distributed on an "AS IS" BASIS,
-+# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-+# See the License for the specific language governing permissions and
-+# limitations under the License.
-+
-+import os
-+import tempfile
-+import unittest
-+import subprocess
-+from pathlib import Path
-+
-+from mesonbuild.mesonlib import windows_proof_rmtree, python_command, is_windows
-+
-+# Find the meson.py adjacent to us
-+meson_py = Path(__file__).resolve().parent / 'meson.py'
-+if not meson_py.is_file():
-+    raise RuntimeError("meson.py not found: test must only run from git")
-+
-+def get_pypath():
-+    import sysconfig
-+    pypath = sysconfig.get_path('purelib', vars={'base': ''})
-+    # Ensure that / is the path separator and not \, then strip /
-+    return Path(pypath).as_posix().strip('/')
-+
-+def get_pybindir():
-+    import sysconfig
-+    # 'Scripts' on Windows and 'bin' on other platforms including MSYS
-+    return sysconfig.get_path('scripts', vars={'base': ''}).strip('\\/')
-+
-+class CommandTests(unittest.TestCase):
-+    '''
-+    Test that running meson in various ways works as expected by checking the
-+    value of mesonlib.meson_command that was set during configuration.
-+    '''
-+
-+    def setUp(self):
-+        super().setUp()
-+        self.orig_env = os.environ.copy()
-+        self.orig_dir = os.getcwd()
-+        os.environ['MESON_COMMAND_TESTS'] = '1'
-+        self.tmpdir = Path(tempfile.mkdtemp()).resolve()
-+        self.src_root = Path(__file__).resolve().parent
-+        self.testdir = str(self.src_root / 'test cases/common/1 trivial')
-+        self.meson_args = ['--backend=ninja']
-+
-+    def tearDown(self):
-+        try:
-+            windows_proof_rmtree(str(self.tmpdir))
-+        except FileNotFoundError:
-+            pass
-+        os.environ.clear()
-+        os.environ.update(self.orig_env)
-+        os.chdir(str(self.orig_dir))
-+        super().tearDown()
-+
-+    def _run(self, command, workdir=None):
-+        '''
-+        Run a command while printing the stdout and stderr to stdout,
-+        and also return a copy of it
-+        '''
-+        # If this call hangs CI will just abort. It is very hard to distinguish
-+        # between CI issue and test bug in that case. Set timeout and fail loud
-+        # instead.
-+        p = subprocess.run(command, stdout=subprocess.PIPE,
-+                           stderr=subprocess.STDOUT, env=os.environ.copy(),
-+                           universal_newlines=True, cwd=workdir, timeout=60 * 5)
-+        print(p.stdout)
-+        if p.returncode != 0:
-+            raise subprocess.CalledProcessError(p.returncode, command)
-+        return p.stdout
-+
-+    def assertMesonCommandIs(self, line, cmd):
-+        self.assertTrue(line.startswith('meson_command '), msg=line)
-+        self.assertEqual(line, 'meson_command is {!r}'.format(cmd))
-+
-+    def test_meson_uninstalled(self):
-+        # This is what the meson command must be for all these cases
-+        resolved_meson_command = python_command + [str(self.src_root / 'meson.py')]
-+        # Absolute path to meson.py
-+        os.chdir('/')
-+        builddir = str(self.tmpdir / 'build1')
-+        meson_py = str(self.src_root / 'meson.py')
-+        meson_setup = [meson_py, 'setup']
-+        meson_command = python_command + meson_setup + self.meson_args
-+        stdo = self._run(meson_command + [self.testdir, builddir])
-+        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
-+        # ./meson.py
-+        os.chdir(str(self.src_root))
-+        builddir = str(self.tmpdir / 'build2')
-+        meson_py = './meson.py'
-+        meson_setup = [meson_py, 'setup']
-+        meson_command = python_command + meson_setup + self.meson_args
-+        stdo = self._run(meson_command + [self.testdir, builddir])
-+        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
-+        # Symlink to meson.py
-+        if is_windows():
-+            # Symlinks require admin perms
-+            return
-+        os.chdir(str(self.src_root))
-+        builddir = str(self.tmpdir / 'build3')
-+        # Create a symlink to meson.py in bindir, and add it to PATH
-+        bindir = (self.tmpdir / 'bin')
-+        bindir.mkdir()
-+        (bindir / 'meson').symlink_to(self.src_root / 'meson.py')
-+        os.environ['PATH'] = str(bindir) + os.pathsep + os.environ['PATH']
-+        # See if it works!
-+        meson_py = 'meson'
-+        meson_setup = [meson_py, 'setup']
-+        meson_command = meson_setup + self.meson_args
-+        stdo = self._run(meson_command + [self.testdir, builddir])
-+        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
-+
-+    def test_meson_installed(self):
-+        # Install meson
-+        prefix = self.tmpdir / 'prefix'
-+        pylibdir = prefix / get_pypath()
-+        bindir = prefix / get_pybindir()
-+        pylibdir.mkdir(parents=True)
-+        os.environ['PYTHONPATH'] = str(pylibdir)
-+        os.environ['PATH'] = str(bindir) + os.pathsep + os.environ['PATH']
-+        self._run(python_command + ['setup.py', 'install', '--prefix', str(prefix)])
-+        self.assertTrue(pylibdir.is_dir())
-+        self.assertTrue(bindir.is_dir())
-+        # Run `meson`
-+        os.chdir('/')
-+        if is_windows():
-+            resolved_meson_command = python_command + [str(bindir / 'meson.py')]
-+        else:
-+            resolved_meson_command = python_command + [str(bindir / 'meson')]
-+            # The python configuration on appveyor does not register .py as
-+            # a valid extension, so we cannot run `meson` on Windows.
-+            builddir = str(self.tmpdir / 'build1')
-+            meson_setup = ['meson', 'setup']
-+            meson_command = meson_setup + self.meson_args
-+            stdo = self._run(meson_command + [self.testdir, builddir])
-+            self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
-+        # Run `/path/to/meson`
-+        builddir = str(self.tmpdir / 'build2')
-+        if is_windows():
-+            # Cannot run .py directly because of the appveyor configuration,
-+            # and the script is named meson.py, not meson
-+            meson_setup = python_command + [str(bindir / 'meson.py'), 'setup']
-+        else:
-+            meson_setup = [str(bindir / 'meson'), 'setup']
-+        meson_command = meson_setup + self.meson_args
-+        stdo = self._run(meson_command + [self.testdir, builddir])
-+        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
-+        # Run `python3 -m mesonbuild.mesonmain`
-+        resolved_meson_command = python_command + ['-m', 'mesonbuild.mesonmain']
-+        builddir = str(self.tmpdir / 'build3')
-+        meson_setup = ['-m', 'mesonbuild.mesonmain', 'setup']
-+        meson_command = python_command + meson_setup + self.meson_args
-+        stdo = self._run(meson_command + [self.testdir, builddir])
-+        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
-+        if is_windows():
-+            # Next part requires a shell
-+            return
-+        # `meson` is a wrapper to `meson.real`
-+        resolved_meson_command = python_command + [str(bindir / 'meson.real')]
-+        builddir = str(self.tmpdir / 'build4')
-+        (bindir / 'meson').rename(bindir / 'meson.real')
-+        wrapper = (bindir / 'meson')
-+        with open(wrapper, 'w') as f:
-+            f.write('#!/bin/sh\n\nmeson.real "$@"')
-+        wrapper.chmod(0o755)
-+        meson_setup = [str(wrapper), 'setup']
-+        meson_command = meson_setup + self.meson_args
-+        stdo = self._run(meson_command + [self.testdir, builddir])
-+        self.assertMesonCommandIs(stdo.split('\n')[0], resolved_meson_command)
-+
-+    def test_meson_exe_windows(self):
-+        raise unittest.SkipTest('NOT IMPLEMENTED')
-+
-+if __name__ == '__main__':
-+    unittest.main(buffer=True)
-diff --git a/run_project_tests.py b/run_project_tests.py
-index 3c516240..3d22b152 100755
---- a/run_project_tests.py
-+++ b/run_project_tests.py
-@@ -38,8 +38,7 @@ import time
- import multiprocessing
- from concurrent.futures import ProcessPoolExecutor
- import re
--from run_unittests import get_fake_options, run_configure
--
-+from run_tests import get_fake_options, run_configure, get_meson_script
- from run_tests import get_backend_commands, get_backend_args_for_dir, Backend
- from run_tests import ensure_backend_detects_changes
- 
-@@ -88,12 +87,6 @@ no_meson_log_msg = 'No meson-log.txt found.'
- 
- system_compiler = None
- 
--meson_command = os.path.join(os.getcwd(), 'meson')
--if not os.path.exists(meson_command):
--    meson_command += '.py'
--    if not os.path.exists(meson_command):
--        raise RuntimeError('Could not find main Meson script to run.')
--
- class StopException(Exception):
-     def __init__(self):
-         super().__init__('Stopped by user')
-@@ -324,7 +317,7 @@ def _run_test(testdir, test_build_dir, install_dir, extra_args, compiler, backen
-     if pass_libdir_to_test(testdir):
-         gen_args += ['--libdir', 'lib']
-     gen_args += [testdir, test_build_dir] + flags + test_args + extra_args
--    (returncode, stdo, stde) = run_configure(meson_command, gen_args)
-+    (returncode, stdo, stde) = run_configure(gen_args)
-     try:
-         logfile = Path(test_build_dir, 'meson-logs', 'meson-log.txt')
-         mesonlog = logfile.open(errors='ignore', encoding='utf-8').read()
-@@ -417,7 +410,7 @@ def have_d_compiler():
- 
- def have_objc_compiler():
-     with AutoDeletedDir(tempfile.mkdtemp(prefix='b ', dir='.')) as build_dir:
--        env = environment.Environment(None, build_dir, None, get_fake_options('/'), [])
-+        env = environment.Environment(None, build_dir, get_fake_options('/'), [])
-         try:
-             objc_comp = env.detect_objc_compiler(False)
-         except mesonlib.MesonException:
-@@ -432,7 +425,7 @@ def have_objc_compiler():
- 
- def have_objcpp_compiler():
-     with AutoDeletedDir(tempfile.mkdtemp(prefix='b ', dir='.')) as build_dir:
--        env = environment.Environment(None, build_dir, None, get_fake_options('/'), [])
-+        env = environment.Environment(None, build_dir, get_fake_options('/'), [])
-         try:
-             objcpp_comp = env.detect_objcpp_compiler(False)
-         except mesonlib.MesonException:
-@@ -647,11 +640,12 @@ def check_format():
-                 check_file(fullname)
- 
- def check_meson_commands_work():
--    global backend, meson_command, compile_commands, test_commands, install_commands
-+    global backend, compile_commands, test_commands, install_commands
-     testdir = PurePath('test cases', 'common', '1 trivial').as_posix()
-+    meson_commands = mesonlib.python_command + [get_meson_script()]
-     with AutoDeletedDir(tempfile.mkdtemp(prefix='b ', dir='.')) as build_dir:
-         print('Checking that configuring works...')
--        gen_cmd = mesonlib.meson_command + [testdir, build_dir] + backend_flags
-+        gen_cmd = meson_commands + [testdir, build_dir] + backend_flags
-         pc, o, e = Popen_safe(gen_cmd)
-         if pc.returncode != 0:
-             raise RuntimeError('Failed to configure {!r}:\n{}\n{}'.format(testdir, e, o))
-diff --git a/run_tests.py b/run_tests.py
-index 648e6ce1..736cdc07 100755
---- a/run_tests.py
-+++ b/run_tests.py
-@@ -21,13 +21,16 @@ import shutil
- import subprocess
- import tempfile
- import platform
-+from io import StringIO
-+from enum import Enum
-+from glob import glob
-+from pathlib import Path
-+
-+import mesonbuild
- from mesonbuild import mesonlib
- from mesonbuild import mesonmain
- from mesonbuild import mlog
- from mesonbuild.environment import detect_ninja
--from io import StringIO
--from enum import Enum
--from glob import glob
- 
- Backend = Enum('Backend', 'ninja vs xcode')
- 
-@@ -42,6 +45,28 @@ if mesonlib.is_windows() or mesonlib.is_cygwin():
- else:
-     exe_suffix = ''
- 
-+def get_meson_script():
-+    '''
-+    Guess the meson that corresponds to the `mesonbuild` that has been imported
-+    so we can run configure and other commands in-process, since mesonmain.run
-+    needs to know the meson_command to use.
-+
-+    Also used by run_unittests.py to determine what meson to run when not
-+    running in-process (which is the default).
-+    '''
-+    # Is there a meson.py next to the mesonbuild currently in use?
-+    mesonbuild_dir = Path(mesonbuild.__file__).resolve().parent.parent
-+    meson_script = mesonbuild_dir / 'meson.py'
-+    if meson_script.is_file():
-+        return str(meson_script)
-+    # Then if mesonbuild is in PYTHONPATH, meson must be in PATH
-+    mlog.warning('Could not find meson.py next to the mesonbuild module. '
-+                 'Trying system meson...')
-+    meson_cmd = shutil.which('meson')
-+    if meson_cmd:
-+        return meson_cmd
-+    raise RuntimeError('Could not find {!r} or a meson in PATH'.format(meson_script))
-+
- def get_backend_args_for_dir(backend, builddir):
-     '''
-     Visual Studio backend needs to be given the solution to build
-@@ -133,13 +158,13 @@ def get_fake_options(prefix):
- def should_run_linux_cross_tests():
-     return shutil.which('arm-linux-gnueabihf-gcc') and not platform.machine().lower().startswith('arm')
- 
--def run_configure_inprocess(meson_command, commandlist):
-+def run_configure_inprocess(commandlist):
-     old_stdout = sys.stdout
-     sys.stdout = mystdout = StringIO()
-     old_stderr = sys.stderr
-     sys.stderr = mystderr = StringIO()
-     try:
--        returncode = mesonmain.run(commandlist, meson_command)
-+        returncode = mesonmain.run(commandlist, get_meson_script())
-     finally:
-         sys.stdout = old_stdout
-         sys.stderr = old_stderr
-@@ -149,11 +174,11 @@ def run_configure_external(full_command):
-     pc, o, e = mesonlib.Popen_safe(full_command)
-     return pc.returncode, o, e
- 
--def run_configure(meson_command, commandlist):
-+def run_configure(commandlist):
-     global meson_exe
-     if meson_exe:
-         return run_configure_external(meson_exe + commandlist)
--    return run_configure_inprocess(meson_command, commandlist)
-+    return run_configure_inprocess(commandlist)
- 
- def print_system_info():
-     print(mlog.bold('System information.').get_text(mlog.colorize_console))
-@@ -214,6 +239,9 @@ if __name__ == '__main__':
-                         'coverage.process_startup()\n')
-             env['COVERAGE_PROCESS_START'] = '.coveragerc'
-             env['PYTHONPATH'] = os.pathsep.join([td] + env.get('PYTHONPATH', []))
-+        # Meson command tests
-+        returncode += subprocess.call(mesonlib.python_command + ['run_meson_command_tests.py', '-v'], env=env)
-+        # Unit tests
-         returncode += subprocess.call(mesonlib.python_command + ['run_unittests.py', '-v'], env=env)
-         # Ubuntu packages do not have a binary without -6 suffix.
-         if should_run_linux_cross_tests():
-@@ -221,5 +249,6 @@ if __name__ == '__main__':
-             print()
-             returncode += subprocess.call(mesonlib.python_command + ['run_cross_test.py', 'cross/ubuntu-armhf.txt'],
-                                           env=env)
-+        # Project tests
-         returncode += subprocess.call(mesonlib.python_command + ['run_project_tests.py'] + sys.argv[1:], env=env)
-     sys.exit(returncode)
-diff --git a/run_unittests.py b/run_unittests.py
-index 6d4e0339..3c215db4 100755
---- a/run_unittests.py
-+++ b/run_unittests.py
-@@ -36,7 +36,7 @@ import mesonbuild.modules.gnome
- from mesonbuild.interpreter import ObjectHolder
- from mesonbuild.mesonlib import (
-     is_windows, is_osx, is_cygwin, is_dragonflybsd,
--    windows_proof_rmtree, python_command, meson_command, version_compare,
-+    windows_proof_rmtree, python_command, version_compare,
-     BuildDirLock
- )
- from mesonbuild.environment import Environment, detect_ninja
-@@ -44,9 +44,9 @@ from mesonbuild.mesonlib import MesonException, EnvironmentException
- from mesonbuild.dependencies import PkgConfigDependency, ExternalProgram
- import mesonbuild.modules.pkgconfig
- 
--from run_tests import exe_suffix, get_fake_options
-+from run_tests import exe_suffix, get_fake_options, get_meson_script
- from run_tests import get_builddir_target_args, get_backend_commands, Backend
--from run_tests import ensure_backend_detects_changes, run_configure, meson_exe
-+from run_tests import ensure_backend_detects_changes, run_configure_inprocess
- from run_tests import should_run_linux_cross_tests
- 
- 
-@@ -488,13 +488,13 @@ class BasePlatformTests(unittest.TestCase):
-         # Get the backend
-         # FIXME: Extract this from argv?
-         self.backend = getattr(Backend, os.environ.get('MESON_UNIT_TEST_BACKEND', 'ninja'))
--        self.meson_mainfile = os.path.join(src_root, 'meson.py')
-         self.meson_args = ['--backend=' + self.backend.name]
-         self.meson_cross_file = None
--        self.meson_command = meson_command + self.meson_args
--        self.mconf_command = meson_command + ['configure']
--        self.mintro_command = meson_command + ['introspect']
--        self.wrap_command = meson_command + ['wrap']
-+        self.meson_command = python_command + [get_meson_script()]
-+        self.setup_command = self.meson_command + self.meson_args
-+        self.mconf_command = self.meson_command + ['configure']
-+        self.mintro_command = self.meson_command + ['introspect']
-+        self.wrap_command = self.meson_command + ['wrap']
-         # Backend-specific build commands
-         self.build_command, self.clean_command, self.test_command, self.install_command, \
-             self.uninstall_command = get_backend_commands(self.backend)
-@@ -521,7 +521,7 @@ class BasePlatformTests(unittest.TestCase):
-         self.logdir = os.path.join(self.builddir, 'meson-logs')
-         self.installdir = os.path.join(self.builddir, 'install')
-         self.distdir = os.path.join(self.builddir, 'meson-dist')
--        self.mtest_command = meson_command + ['test', '-C', self.builddir]
-+        self.mtest_command = self.meson_command + ['test', '-C', self.builddir]
-         self.builddirs.append(self.builddir)
- 
-     def new_builddir(self):
-@@ -581,7 +581,7 @@ class BasePlatformTests(unittest.TestCase):
-         self.privatedir = os.path.join(self.builddir, 'meson-private')
-         if inprocess:
-             try:
--                (returncode, out, err) = run_configure(self.meson_mainfile, self.meson_args + args + extra_args)
-+                (returncode, out, err) = run_configure_inprocess(self.meson_args + args + extra_args)
-                 if 'MESON_SKIP_TEST' in out:
-                     raise unittest.SkipTest('Project requested skipping.')
-                 if returncode != 0:
-@@ -601,7 +601,7 @@ class BasePlatformTests(unittest.TestCase):
-                 mesonbuild.mlog.log_file = None
-         else:
-             try:
--                out = self._run(self.meson_command + args + extra_args)
-+                out = self._run(self.setup_command + args + extra_args)
-             except unittest.SkipTest:
-                 raise unittest.SkipTest('Project requested skipping: ' + srcdir)
-             except:
-@@ -900,8 +900,7 @@ class AllPlatformTests(BasePlatformTests):
-         https://github.com/mesonbuild/meson/issues/1355
-         '''
-         testdir = os.path.join(self.common_test_dir, '3 static')
--        env = Environment(testdir, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
-         cc = env.detect_c_compiler(False)
-         static_linker = env.detect_static_linker(cc)
-         if is_windows():
-@@ -1182,8 +1181,7 @@ class AllPlatformTests(BasePlatformTests):
-         if not is_windows():
-             langs += [('objc', 'OBJC'), ('objcpp', 'OBJCXX')]
-         testdir = os.path.join(self.unit_test_dir, '5 compiler detection')
--        env = Environment(testdir, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
-         for lang, evar in langs:
-             # Detect with evar and do sanity checks on that
-             if evar in os.environ:
-@@ -1285,8 +1283,7 @@ class AllPlatformTests(BasePlatformTests):
-     def test_always_prefer_c_compiler_for_asm(self):
-         testdir = os.path.join(self.common_test_dir, '141 c cpp and asm')
-         # Skip if building with MSVC
--        env = Environment(testdir, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
-         if env.detect_c_compiler(False).get_id() == 'msvc':
-             raise unittest.SkipTest('MSVC can\'t compile assembly')
-         self.init(testdir)
-@@ -1544,8 +1541,7 @@ int main(int argc, char **argv) {
-             self.assertPathExists(os.path.join(testdir, i))
- 
-     def detect_prebuild_env(self):
--        env = Environment('', self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment('', self.builddir, get_fake_options(self.prefix), [])
-         cc = env.detect_c_compiler(False)
-         stlinker = env.detect_static_linker(cc)
-         if mesonbuild.mesonlib.is_windows():
-@@ -1713,8 +1709,7 @@ int main(int argc, char **argv) {
-                                        '--libdir=' + libdir])
-         # Find foo dependency
-         os.environ['PKG_CONFIG_LIBDIR'] = self.privatedir
--        env = Environment(testdir, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
-         kwargs = {'required': True, 'silent': True}
-         foo_dep = PkgConfigDependency('libfoo', env, kwargs)
-         # Ensure link_args are properly quoted
-@@ -1847,16 +1842,16 @@ int main(int argc, char **argv) {
-         for lang in ('c', 'cpp'):
-             for type in ('executable', 'library'):
-                 with tempfile.TemporaryDirectory() as tmpdir:
--                    self._run(meson_command + ['init', '--language', lang, '--type', type],
-+                    self._run(self.meson_command + ['init', '--language', lang, '--type', type],
-                               workdir=tmpdir)
--                    self._run(self.meson_command + ['--backend=ninja', 'builddir'],
-+                    self._run(self.setup_command + ['--backend=ninja', 'builddir'],
-                               workdir=tmpdir)
-                     self._run(ninja,
-                               workdir=os.path.join(tmpdir, 'builddir'))
-             with tempfile.TemporaryDirectory() as tmpdir:
-                 with open(os.path.join(tmpdir, 'foo.' + lang), 'w') as f:
-                     f.write('int main() {}')
--                self._run(meson_command + ['init', '-b'], workdir=tmpdir)
-+                self._run(self.meson_command + ['init', '-b'], workdir=tmpdir)
- 
-     # The test uses mocking and thus requires that
-     # the current process is the one to run the Meson steps.
-@@ -1981,8 +1976,7 @@ recommended as it can lead to undefined behaviour on some platforms''')
-         testdirbase = os.path.join(self.unit_test_dir, '26 guessed linker dependencies')
-         testdirlib = os.path.join(testdirbase, 'lib')
-         extra_args = None
--        env = Environment(testdirlib, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdirlib, self.builddir, get_fake_options(self.prefix), [])
-         if env.detect_c_compiler(False).get_id() != 'msvc':
-             # static libraries are not linkable with -l with msvc because meson installs them
-             # as .a files which unix_args_to_native will not know as it expects libraries to use
-@@ -2095,9 +2089,6 @@ class FailureTests(BasePlatformTests):
-         Assert that running meson configure on the specified @contents raises
-         a error message matching regex @match.
-         '''
--        if meson_exe is not None:
--            # Because the exception happens in a different process.
--            raise unittest.SkipTest('Can not test assert raise tests with an external Meson command.')
-         if langs is None:
-             langs = []
-         with open(self.mbuild, 'w') as f:
-@@ -2232,8 +2223,7 @@ class FailureTests(BasePlatformTests):
-         '''
-         Test that when we can't detect objc or objcpp, we fail gracefully.
-         '''
--        env = Environment('', self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment('', self.builddir, get_fake_options(self.prefix), [])
-         try:
-             env.detect_objc_compiler(False)
-             env.detect_objcpp_compiler(False)
-@@ -2328,8 +2318,7 @@ class WindowsTests(BasePlatformTests):
-         ExternalLibraryHolder from build files.
-         '''
-         testdir = os.path.join(self.platform_test_dir, '1 basic')
--        env = Environment(testdir, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
-         cc = env.detect_c_compiler(False)
-         if cc.id != 'msvc':
-             raise unittest.SkipTest('Not using MSVC')
-@@ -2399,8 +2388,7 @@ class LinuxlikeTests(BasePlatformTests):
-         '''
-         testdir = os.path.join(self.common_test_dir, '51 pkgconfig-gen')
-         self.init(testdir)
--        env = Environment(testdir, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
-         kwargs = {'required': True, 'silent': True}
-         os.environ['PKG_CONFIG_LIBDIR'] = self.privatedir
-         foo_dep = PkgConfigDependency('libfoo', env, kwargs)
-@@ -2650,8 +2638,7 @@ class LinuxlikeTests(BasePlatformTests):
-         an ordinary test because it requires passing options to meson.
-         '''
-         testdir = os.path.join(self.common_test_dir, '1 trivial')
--        env = Environment(testdir, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
-         cc = env.detect_c_compiler(False)
-         self._test_stds_impl(testdir, cc, 'c')
- 
-@@ -2661,8 +2648,7 @@ class LinuxlikeTests(BasePlatformTests):
-         be an ordinary test because it requires passing options to meson.
-         '''
-         testdir = os.path.join(self.common_test_dir, '2 cpp')
--        env = Environment(testdir, self.builddir, self.meson_command,
--                          get_fake_options(self.prefix), [])
-+        env = Environment(testdir, self.builddir, get_fake_options(self.prefix), [])
-         cpp = env.detect_cpp_compiler(False)
-         self._test_stds_impl(testdir, cpp, 'cpp')
- 
diff --git a/meta/recipes-devtools/meson/meson_0.46.1.bb b/meta/recipes-devtools/meson/meson_0.47.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.46.1.bb
rename to meta/recipes-devtools/meson/meson_0.47.2.bb
-- 
2.7.4


