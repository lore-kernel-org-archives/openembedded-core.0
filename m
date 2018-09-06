Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 64485796A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:58 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id y20-v6so8517852edq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4u55a+uZPDuvkvq2lfJ7uomT7tIEMc1D67UbB8gaKQU=;
	b=M+RoOPXIhGocGzrV0X8sClaVLX/hyV8COgWbBKMu8b4SIgJNpBeschXYo3uIYpEeJ8
	FR6EDfjjR8WCIr35go0tgWgUs3q6Y5q/uuyay2s/3p2hUeNkYD13+7lsZsFRITIfUt/i
	mVgaJp/mhdpjuKU8j332QbGSYdqMQHd9mCA+V77gM44bSEfmdbR/o8WVLc6qv02kuuft
	Z4uWRi+5m9at31gyzkhzlwgCB4nNTR+IdcBXHleMGQMfrKR9u018gtwcMJSz3WDk7KRC
	GvtjIJn3VrrtRjWdhVF34y3kidLJ8B78vaUP5RGOaFc1Qt+yjQrY3ncCHS+5Vl6vnwNl
	i/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4u55a+uZPDuvkvq2lfJ7uomT7tIEMc1D67UbB8gaKQU=;
	b=iSARg1Pli8CnA+4PSFQUmlUN9bAXpReL+6gSM/1bpZhm/qQT+udCLaX6jbrCZsmBSf
	J19vya4lH5Ph8D3Mzso/oYLJ9OVJB+8q1Ym78CjYK91jCdWyDudeR3Av4rIGj58iOcYL
	IAeJ7q4iXkO0T7Jh6SRFLvdekgoSJ8f2G1/xyp/cQyvPxKi0JV+196OSTBTuLuMV1kKm
	9hQQZO3bLKUSYdKoGF/KPxf7/1FUMcJH967XHnkhF/EtkXYIBV3TtmCzVaTR3TOHiold
	DEyaXjUKVBd+9kCckndk0PZFRlWL+zeKwxjY2qbQDh2hyEVE3REuNZyRmng3gF9sIvrx
	KZwg==
X-Gm-Message-State: APzg51C5DRhZ3Rw8YG7JvnlAGI9sRtSdPNJkn0ldKZclhnhOlJOyR89T
	ODkW58tvLBaEXw0EvafObnfblSjrMFk=
X-Google-Smtp-Source: ANB0Vdb+TsS0gGraeNCggeSTh3mom4ahwKwOICE/FbyEa6ZyD7iJzs90NIZOiIodqoFUYO3ljXZxIw==
X-Received: by 2002:a50:c40e:: with SMTP id
	v14-v6mr2915137edf.232.1536230458670; 
	Thu, 06 Sep 2018 03:40:58 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:36 +0200
Message-Id: <1536230436-30342-21-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 21/21] gobject-introspection: update to 1.58.0
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:59 -0000

License-Update: clarification of what parts of g-i are licensed under which license.
Actual terms are the same.

Add a patch to deal with prelink-rtld returning 127 in some cases despite there being no error.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...he-repository-directory-for-native-builds.patch | 12 +++---
 ...ncomplete-upstream-attempt-at-cross-compi.patch | 12 +++---
 ...01-giscanner-add-a-lib-dirs-envvar-option.patch | 16 ++++----
 ...gnore-error-return-codes-from-ldd-wrapper.patch | 27 ++++++++++++++
 ...c-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 43 +++++++++++-----------
 ...3-giscanner-add-use-binary-wrapper-option.patch | 14 +++----
 ...04-giscanner-add-a-use-ldd-wrapper-option.patch | 16 ++++----
 ...config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch | 18 ++++-----
 ...n_1.56.1.bb => gobject-introspection_1.58.0.bb} | 15 ++++----
 9 files changed, 96 insertions(+), 77 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.56.1.bb => gobject-introspection_1.58.0.bb} (93%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 644cab9..ba85c31 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 31ef4cce83c1770ea1e816d91b7e258fbf170035 Mon Sep 17 00:00:00 2001
+From 4cf37d56fddcc22bcd818f6d470404f56d907f3c Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -14,12 +14,13 @@ cache or sstate mirror).
 
 Upstream-Status: Inappropriate
 Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
+
 ---
  girepository/girepository.c | 15 +++++++++++++--
  1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/girepository/girepository.c b/girepository/girepository.c
-index 10282c72..60c45104 100644
+index c1fa3d3..efa557e 100644
 --- a/girepository/girepository.c
 +++ b/girepository/girepository.c
 @@ -21,6 +21,8 @@
@@ -40,7 +41,7 @@ index 10282c72..60c45104 100644
  /**
   * SECTION:girepository
   * @short_description: GObject Introspection repository manager
-@@ -191,9 +195,16 @@ init_globals (void)
+@@ -188,9 +192,16 @@ init_globals (void)
            g_free (custom_dirs);
          }
  
@@ -57,8 +58,5 @@ index 10282c72..60c45104 100644
 +        typelib_dir = g_build_filename (libdir, "girepository-1.0", NULL);
 +      }
  
-       search_path = g_slist_prepend (search_path, typelib_dir);
+       typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
--- 
-2.11.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
index 9abaea7..86cd4ea 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
@@ -1,11 +1,12 @@
-From 3a9d1e5ee0aae56fafec0beba2014c19e4ff310c Mon Sep 17 00:00:00 2001
+From ca0fb17e268c176ac89df081b1efa4a42989f014 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 Mar 2016 17:07:28 +0200
-Subject: [PATCH 1/5] Revert an incomplete upstream attempt at cross-compile
+Subject: [PATCH] Revert an incomplete upstream attempt at cross-compile
  support
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  common.mk                | 4 ----
  giscanner/gdumpparser.py | 6 ------
@@ -29,10 +30,10 @@ index b778f7a..e26c637 100644
  
  INTROSPECTION_COMPILER_ARGS = \
 diff --git a/giscanner/gdumpparser.py b/giscanner/gdumpparser.py
-index 1134f33..9bdc2bc 100644
+index cd9d94d..b41772c 100644
 --- a/giscanner/gdumpparser.py
 +++ b/giscanner/gdumpparser.py
-@@ -162,12 +162,6 @@ blob containing data gleaned from GObject's primitive introspection."""
+@@ -161,12 +161,6 @@ blob containing data gleaned from GObject's primitive introspection."""
          out_path = os.path.join(self._binary.tmpdir, 'dump.xml')
  
          args = []
@@ -45,6 +46,3 @@ index 1134f33..9bdc2bc 100644
          args.extend(self._binary.args)
          args.append('--introspect-dump=%s,%s' % (in_path, out_path))
  
--- 
-2.7.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
index 4aa2e3c..e9338e9 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
@@ -1,4 +1,4 @@
-From 3875175563df28813c22b1de6bda260285f65cb0 Mon Sep 17 00:00:00 2001
+From 3fea5e83803f4cfef21b2e06e37a6ba56f2bb914 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 3 Jan 2018 17:02:01 +0200
 Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index d10327c..47f57c6 100644
+index c003828..8a8ba2b 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
 @@ -109,7 +109,7 @@ class CCompiler(object):
@@ -35,16 +35,16 @@ index d10327c..47f57c6 100644
          if os.name == 'nt':
              runtime_path_envvar = ['LIB', 'PATH']
          else:
--            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH']
-+            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
+-            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_FALLBACK_LIBRARY_PATH']
++            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_FALLBACK_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
              # Search the current directory first
              # (This flag is not supported nor needed for Visual C++)
              args.append('-L.')
 diff --git a/giscanner/dumper.py b/giscanner/dumper.py
-index 3c7220b..0abd565 100644
+index 2c668f5..2e515a0 100644
 --- a/giscanner/dumper.py
 +++ b/giscanner/dumper.py
-@@ -259,7 +259,8 @@ class DumpCompiler(object):
+@@ -249,7 +249,8 @@ class DumpCompiler(object):
                                                     libtool,
                                                     self._options.libraries,
                                                     self._options.extra_libraries,
@@ -55,10 +55,10 @@ index 3c7220b..0abd565 100644
  
          else:
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index d262785..51c9570 100755
+index 5cb793e..87227e2 100644
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
-@@ -130,6 +130,9 @@ def _get_option_parser():
+@@ -132,6 +132,9 @@ def _get_option_parser():
      parser.add_option("", "--use-ldd-wrapper",
                        action="store", dest="ldd_wrapper", default=None,
                        help="wrapper to use instead of ldd (useful when cross-compiling)")
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
new file mode 100644
index 0000000..9167f04
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
@@ -0,0 +1,27 @@
+From f128cbeead687bfc6532cc1f2cc3e2dc5a2b5b30 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 5 Sep 2018 16:46:52 +0200
+Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
+
+prelink-rtld, which we use instead of ldd returns 127 when it can't find a library.
+It is not an error per se, but it breaks subprocess.check_output().
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ giscanner/shlibs.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
+index 01d21a3..3bd3250 100644
+--- a/giscanner/shlibs.py
++++ b/giscanner/shlibs.py
+@@ -108,7 +108,7 @@ def _resolve_non_libtool(options, binary, libraries):
+             args.extend(['otool', '-L', binary.args[0]])
+         else:
+             args.extend(['ldd', binary.args[0]])
+-        output = subprocess.check_output(args)
++        output = subprocess.run(args, check=False, stdout=subprocess.PIPE).stdout
+         if isinstance(output, bytes):
+             output = output.decode("utf-8", "replace")
+ 
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
index c682b42..03ef2b0 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
@@ -1,8 +1,8 @@
-From b1503fe2693d602b3e24e4b832dc0934960d5d22 Mon Sep 17 00:00:00 2001
+From a28cc8413b68bec5b4cf2ee5f37b40a8965490a5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Oct 2015 18:29:21 +0300
-Subject: [PATCH 2/5] configure.ac: add host-gi, gi-cross-wrapper,
- gi-ldd-wrapper and introspection-data options
+Subject: [PATCH] configure.ac: add host-gi, gi-cross-wrapper, gi-ldd-wrapper
+ and introspection-data options
 
 With the first option, gobject-introspection tools (g-ir-doc-tool and g-ir-scanner)
 that are already installed in the host system will be used for building the source tree.
@@ -25,6 +25,7 @@ These options are useful when cross-compiling for a different target architectur
 
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile.am       |  2 ++
  common.mk         | 39 +++++++++++++++++++++++++++++++++++++++
@@ -32,10 +33,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  tests/Makefile.am |  5 ++++-
  4 files changed, 87 insertions(+), 1 deletion(-)
 
-Index: gobject-introspection-1.52.1/Makefile.am
-===================================================================
---- gobject-introspection-1.52.1.orig/Makefile.am
-+++ gobject-introspection-1.52.1/Makefile.am
+diff --git a/Makefile.am b/Makefile.am
+index 44ed115..2a1fa56 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -21,7 +21,9 @@ include Makefile-cmph.am
  include Makefile-girepository.am
  include Makefile-giscanner.am
@@ -44,12 +45,12 @@ Index: gobject-introspection-1.52.1/Makefile.am
  include Makefile-gir.am
 +endif
  include Makefile-tools.am
- include Makefile-msvcproj.am
  
-Index: gobject-introspection-1.52.1/common.mk
-===================================================================
---- gobject-introspection-1.52.1.orig/common.mk
-+++ gobject-introspection-1.52.1/common.mk
+ ## Process this file with automake to produce Makefile.in
+diff --git a/common.mk b/common.mk
+index e26c637..9f3a65f 100644
+--- a/common.mk
++++ b/common.mk
 @@ -6,6 +6,15 @@
  # module itself.
  #
@@ -130,11 +131,11 @@ Index: gobject-introspection-1.52.1/common.mk
  
  INTROSPECTION_DOCTOOL_ARGS = \
      --add-include-path=$(srcdir) \
-Index: gobject-introspection-1.52.1/configure.ac
-===================================================================
---- gobject-introspection-1.52.1.orig/configure.ac
-+++ gobject-introspection-1.52.1/configure.ac
-@@ -366,6 +366,48 @@ dnl
+diff --git a/configure.ac b/configure.ac
+index d48e6c3..ed5f8a2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -367,6 +367,48 @@ dnl
  AM_CONDITIONAL(MSVC_BASE_NO_TOOLSET_SET, [test x$MSVC_BASE_TOOLSET = x])
  AM_CONDITIONAL(MSVC_NO_TOOLSET_SET, [test x$MSVC_TOOLSET = x])
  
@@ -183,10 +184,10 @@ Index: gobject-introspection-1.52.1/configure.ac
  AC_CONFIG_FILES([
  Makefile
  tests/Makefile
-Index: gobject-introspection-1.52.1/tests/Makefile.am
-===================================================================
---- gobject-introspection-1.52.1.orig/tests/Makefile.am
-+++ gobject-introspection-1.52.1/tests/Makefile.am
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 4bdb9c3..10b0f27 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
 @@ -1,6 +1,9 @@
  include $(top_srcdir)/common.mk
  
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
index f21eaca..45fe27a 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
@@ -1,7 +1,7 @@
-From 704b888d0abfb01067352c40156f49f655691c7c Mon Sep 17 00:00:00 2001
+From 46dbe963aa6435591c87e788cdb54bc0daeac42e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Oct 2015 18:26:40 +0300
-Subject: [PATCH 3/5] giscanner: add --use-binary-wrapper option
+Subject: [PATCH] giscanner: add --use-binary-wrapper option
 
 With this option, giscanner will use a wrapper executable to run
 binaries it's producing, instead of running them directly. This
@@ -10,15 +10,16 @@ but they can be run using for example QEMU emulation.
 
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  giscanner/scannermain.py | 14 ++++++++++++++
  1 file changed, 14 insertions(+)
 
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index 633496f..d684cd0 100755
+index ccb14e9..061def0 100644
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
-@@ -124,6 +124,9 @@ def _get_option_parser():
+@@ -126,6 +126,9 @@ def _get_option_parser():
      parser.add_option("", "--program",
                        action="store", dest="program", default=None,
                        help="program to execute")
@@ -28,7 +29,7 @@ index 633496f..d684cd0 100755
      parser.add_option("", "--program-arg",
                        action="append", dest="program_args", default=[],
                        help="extra arguments to program")
-@@ -419,6 +422,17 @@ def create_binary(transformer, options, args):
+@@ -418,6 +421,17 @@ def create_binary(transformer, options, args):
                                                gdump_parser.get_error_quark_functions())
  
      shlibs = resolve_shlibs(options, binary, options.libraries)
@@ -46,6 +47,3 @@ index 633496f..d684cd0 100755
      gdump_parser.set_introspection_binary(binary)
      gdump_parser.parse()
      return shlibs
--- 
-2.7.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
index afb71e7..2e36b64 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
@@ -1,23 +1,24 @@
-From d4ad57fd4a32c4f0d2f0522a3090ef940746431b Mon Sep 17 00:00:00 2001
+From eba2b999e81d81b5f43bb1f0ab33881786bebdec Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Oct 2015 16:28:46 +0200
-Subject: [PATCH 4/5] giscanner: add a --use-ldd-wrapper option
+Subject: [PATCH] giscanner: add a --use-ldd-wrapper option
 
 This is useful in cross-compile environments where system's ldd
 command does not work on binaries built for a different architecture
 
 Upstream-Status: Pending [review in oe-core]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  giscanner/scannermain.py | 3 +++
  giscanner/shlibs.py      | 4 +++-
  2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index d684cd0..1b3b369 100755
+index 061def0..5cb793e 100644
 --- a/giscanner/scannermain.py
 +++ b/giscanner/scannermain.py
-@@ -127,6 +127,9 @@ def _get_option_parser():
+@@ -129,6 +129,9 @@ def _get_option_parser():
      parser.add_option("", "--use-binary-wrapper",
                        action="store", dest="wrapper", default=None,
                        help="wrapper to use for running programs (useful when cross-compiling)")
@@ -28,10 +29,10 @@ index d684cd0..1b3b369 100755
                        action="append", dest="program_args", default=[],
                        help="extra arguments to program")
 diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index c93d20c..c5b5942 100644
+index 7b7b2d0..01d21a3 100644
 --- a/giscanner/shlibs.py
 +++ b/giscanner/shlibs.py
-@@ -105,7 +105,9 @@ def _resolve_non_libtool(options, binary, libraries):
+@@ -102,7 +102,9 @@ def _resolve_non_libtool(options, binary, libraries):
              args.extend(libtool)
              args.append('--mode=execute')
          platform_system = platform.system()
@@ -42,6 +43,3 @@ index c93d20c..c5b5942 100644
              args.extend(['otool', '-L', binary.args[0]])
          else:
              args.extend(['ldd', binary.args[0]])
--- 
-2.7.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
index 47a18ec..2a31117 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
@@ -1,7 +1,7 @@
-From e08b3677dd04d6ec407ba8f74f601b2d51310eff Mon Sep 17 00:00:00 2001
+From a97d060933932e478c03f1de9513b69bc459eefc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 8 Oct 2015 18:30:35 +0300
-Subject: [PATCH 5/5] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
+Subject: [PATCH] Prefix pkg-config paths with PKG_CONFIG_SYSROOT_DIR
  environment variable
 
 This environment variable sets the location of sysroot directory in cross-compilation
@@ -9,16 +9,17 @@ environments; if the variable is not set, the prefix will be empty.
 
 Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile-gir.am     | 18 +++++++++---------
  m4/introspection.m4 |  8 ++++----
  2 files changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/Makefile-gir.am b/Makefile-gir.am
-index a09260a..ba6e89e 100644
+index 2cd7358..eaf0afd 100644
 --- a/Makefile-gir.am
 +++ b/Makefile-gir.am
-@@ -55,8 +55,8 @@ else
+@@ -58,8 +58,8 @@ else
  endif
  
  # glib
@@ -29,7 +30,7 @@ index a09260a..ba6e89e 100644
  
  GLIB_LIBRARY=glib-2.0
  
-@@ -92,8 +92,8 @@ GLib-2.0.gir: g-ir-scanner g-ir-compiler$(EXEEXT)
+@@ -95,8 +95,8 @@ GLib-2.0.gir: g-ir-scanner g-ir-compiler$(EXEEXT)
  gir/DBusGLib-1.0.typelib: GObject-2.0.gir
  
  # gobject
@@ -40,7 +41,7 @@ index a09260a..ba6e89e 100644
  
  GOBJECT_LIBRARY=gobject-2.0
  
-@@ -120,8 +120,8 @@ GObject_2_0_gir_FILES = \
+@@ -123,8 +123,8 @@ GObject_2_0_gir_FILES = \
  BUILT_GIRSOURCES += GObject-2.0.gir
  
  # gmodule
@@ -51,7 +52,7 @@ index a09260a..ba6e89e 100644
  
  GMODULE_LIBRARY=gmodule-2.0
  
-@@ -146,13 +146,13 @@ GModule_2_0_gir_FILES = $(GLIB_INCLUDEDIR)/gmodule.h \
+@@ -149,13 +149,13 @@ GModule_2_0_gir_FILES = $(GLIB_INCLUDEDIR)/gmodule.h \
  BUILT_GIRSOURCES += GModule-2.0.gir
  
  # gio
@@ -91,6 +92,3 @@ index d89c3d9..b562266 100644
      fi
      AC_SUBST(INTROSPECTION_SCANNER)
      AC_SUBST(INTROSPECTION_COMPILER)
--- 
-2.7.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
similarity index 93%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
index f347956..de898a7 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 LICENSE = "LGPLv2+ & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6317a809f70ed9848fa5673121908586 \
-                    file://tools/compiler.c;md5=fc5007fc20022720e6c0b0cdde41fabd;endline=20 \
-                    file://giscanner/sourcescanner.c;md5=194d6e0c1d00662f32d030ce44de8d39;endline=22 \
-                    file://girepository/giregisteredtypeinfo.c;md5=661847611ae6979465415f31a759ba27;endline=21 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
+                    file://tools/compiler.c;endline=20;md5=fc5007fc20022720e6c0b0cdde41fabd \
+                    file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
+                    file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27 \
                     "
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
@@ -16,16 +16,17 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
+           file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
            "
 
-SRC_URI[md5sum] = "62e5f5685b8d9752fdeaf17c057d53d1"
-SRC_URI[sha256sum] = "5b2875ccff99ff7baab63a34b67f8c920def240e178ff50add809e267d9ea24b"
+SRC_URI[md5sum] = "94fec875276262037bfcd51226db12fe"
+SRC_URI[sha256sum] = "27c1590a32749de0a5481ce897772547043e94bccba4bc0a7edb3d8513e401ec"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
 
-DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native"
+DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
 
 # target build needs qemu to run temporary introspection binaries created
 # on the fly by g-ir-scanner and a native version of itself to run
-- 
2.7.4


