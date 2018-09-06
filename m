Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7517C79617
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:59 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id p52-v6so8434648eda.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z30hiwcCvp9niP3XS6ivAZUaNAxjrK+ChXwnyy/ld3M=;
	b=bvVS0/Lg/qYZUPc06cYsQR5nF0IxekzziqfV+PcsDID5cm1buNS9GSpWH6MNcIXDDT
	T4GPtVGcL3B/+DavPKYlog8sGpav+3LecB22yXq5BlCUtuOzd3wMR8ttsHMTMU5CKVN0
	XEuPqTOSzJ+fo7ErMqYkd7kZS1j/ZFutOImeOAGppyctaH+x9xxE/IvteJ9HkrNf85Hb
	a/16lpotZyWcpnp/eOxMuVaE7pbQpq6xkWawVpRUb9GrZDRgL3tdOm4+fPa1Q64dFGHQ
	pA8dshrx7gkyhN1vJxiqnL1QMnnnDoTzijasxHer+h0kIdPEJ2i4IZlYizTwHnBPWEm9
	iwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z30hiwcCvp9niP3XS6ivAZUaNAxjrK+ChXwnyy/ld3M=;
	b=Kb3Xy+nu2GzALvoAAWfbkpP9gtebrjzmzMIPK1XjYyhVZhXY/BUWwGJy+gExAH+B9E
	RiHBWrqDnK4fdt6fnCgiVDrf2zAv0sUKCpeYjEjKjE6oTc7LmxemGwVa82Gi8YAh80jp
	vWZI6ZiVj1Ajz2OIECiYLc3IE5t1G8906S0ebiZ/B7H4s/oszBNwz72xWYDgdnB4ub+Z
	bJBbQmffYxP2DpCnCVWCjvfgzJnKTnBwml3k5j+mHDXgwc8vVnRTswxArljEGmLGvMXh
	Evi73dDS/0qnCVy/6KxiAZ9Ha+u1sQspsP+pq3W3P3/t+jGAbEuVReiDvebF8huRz5IV
	TSNg==
X-Gm-Message-State: APzg51AmrefWUDuHE7ADNNEzEo/29I38TK8KKCrZF0drMZt95AV8bOJ9
	d4KIMDpG6cIEa7T4SHn9p/Zz1a8WLYk=
X-Google-Smtp-Source: ANB0VdZKXtApL4idmgAsSHXcSbo9Gx7oXU0JpgE/NjJHMPKVlmaQTwtnp8RFBl3mjb7VavFI4obM6g==
X-Received: by 2002:a50:fb8f:: with SMTP id
	e15-v6mr2693241edq.153.1536229799656; 
	Thu, 06 Sep 2018 03:29:59 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:30 +0200
Message-Id: <1536229770-29600-21-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 21/21] gobject-introspection: update to 1.58.0
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
X-List-Received-Date: Thu, 06 Sep 2018 10:30:00 -0000

License-Update: clarification of what parts of g-i are licensed under which license.
Actual terms are the same.

Add a patch to deal with prelink-rtld returning 127 in some cases despite there being no error.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...he-repository-directory-for-native-builds.patch |  12 +-
 ...ncomplete-upstream-attempt-at-cross-compi.patch |  12 +-
 ...01-giscanner-add-a-lib-dirs-envvar-option.patch |  16 +-
 ...gnore-error-return-codes-from-ldd-wrapper.patch |  27 +++
 ...c-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch |  43 ++---
 ...3-giscanner-add-use-binary-wrapper-option.patch |  14 +-
 ...04-giscanner-add-a-use-ldd-wrapper-option.patch |  16 +-
 ...config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch |  18 +-
 .../gobject-introspection_1.56.1.bb                | 196 --------------------
 .../gobject-introspection_1.58.0.bb                | 197 +++++++++++++++++++++
 10 files changed, 285 insertions(+), 266 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb

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
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
deleted file mode 100644
index f347956..0000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
+++ /dev/null
@@ -1,196 +0,0 @@
-SUMMARY = "Middleware layer between GObject-using C libraries and language bindings"
-HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "libs"
-LICENSE = "LGPLv2+ & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6317a809f70ed9848fa5673121908586 \
-                    file://tools/compiler.c;md5=fc5007fc20022720e6c0b0cdde41fabd;endline=20 \
-                    file://giscanner/sourcescanner.c;md5=194d6e0c1d00662f32d030ce44de8d39;endline=22 \
-                    file://girepository/giregisteredtypeinfo.c;md5=661847611ae6979465415f31a759ba27;endline=21 \
-                    "
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
-           file://0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch \
-           file://0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch \
-           file://0003-giscanner-add-use-binary-wrapper-option.patch \
-           file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
-           file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
-           file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
-           "
-
-SRC_URI[md5sum] = "62e5f5685b8d9752fdeaf17c057d53d1"
-SRC_URI[sha256sum] = "5b2875ccff99ff7baab63a34b67f8c920def240e178ff50add809e267d9ea24b"
-
-SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
-
-inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
-
-DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native"
-
-# target build needs qemu to run temporary introspection binaries created
-# on the fly by g-ir-scanner and a native version of itself to run
-# native versions of its own tools during build.
-# Also prelink-rtld is used to find out library dependencies of introspection binaries
-# (standard ldd doesn't work when cross-compiling).
-DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
-
-# needed for writing out the qemu wrapper script
-export STAGING_DIR_HOST
-export B
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python3-mako,"
-
-# Configure target build to use native tools of itself and to use a qemu wrapper
-# and optionally to generate introspection data
-EXTRA_OECONF_class-target = " \
-    --disable-static \
-    --enable-host-gi \
-    --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
-    --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
-    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
-"
-
-# Need to ensure ld.so.conf exists so prelink-native works
-# both before we build and if we install from sstate
-do_configure[prefuncs] += "gobject_introspection_preconfigure"
-python gobject_introspection_preconfigure () {
-    oe.utils.write_ld_so_conf(d)
-}
-
-do_configure_prepend_class-native() {
-        # Tweak the native python scripts so that they don't refer to the
-        # full path of native python binary (the solution is taken from glib-2.0 recipe)
-        # This removes the risk of exceeding Linux kernel's shebang line limit (128 bytes)
-        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/tools/g-ir-tool-template.in
-}
-
-do_configure_prepend_class-target() {
-        # Write out a qemu wrapper that will be given to gi-scanner so that it
-        # can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
-        cat > ${B}/g-ir-scanner-qemuwrapper << EOF
-#!/bin/sh
-# Use a modules directory which doesn't exist so we don't load random things
-# which may then get deleted (or their dependencies) and potentially segfault
-export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
-
-$qemu_binary "\$@"
-if [ \$? -ne 0 ]; then
-    echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the recipe should help."
-    echo "(typically like this: GIR_EXTRA_LIBS_PATH=\"$""{B}/something/.libs\" )"
-    exit 1
-fi
-EOF
-        chmod +x ${B}/g-ir-scanner-qemuwrapper
-
-        # Write out a wrapper for g-ir-scanner itself, which will be used when building introspection files
-        # for glib-based packages. This wrapper calls the native version of the scanner, and tells it to use
-        # a qemu wrapper for running transient target binaries produced by the scanner, and an include directory 
-        # from the target sysroot.
-        cat > ${B}/g-ir-scanner-wrapper << EOF
-#!/bin/sh
-# This prevents g-ir-scanner from writing cache data to $HOME
-export GI_SCANNER_DISABLE_CACHE=1
-
-g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 "\$@"
-EOF
-        chmod +x ${B}/g-ir-scanner-wrapper
-
-        # Write out a wrapper for g-ir-compiler, which runs the target version of it through qemu.
-        # g-ir-compiler writes out the raw content of a C struct to disk, and therefore is architecture dependent.
-        cat > ${B}/g-ir-compiler-wrapper << EOF
-#!/bin/sh
-${STAGING_BINDIR}/g-ir-scanner-qemuwrapper ${STAGING_BINDIR}/g-ir-compiler "\$@"
-EOF
-        chmod +x ${B}/g-ir-compiler-wrapper
-
-        # Write out a wrapper to use instead of ldd, which does not work when a binary is built
-        # for a different architecture
-        cat > ${B}/g-ir-scanner-lddwrapper << EOF
-#!/bin/sh
-prelink-rtld --root=$STAGING_DIR_HOST "\$@"
-EOF
-        chmod +x ${B}/g-ir-scanner-lddwrapper
-
-        # Also tweak the target python scripts so that they don't refer to the
-        # native version of python binary (the solution is taken from glib-2.0 recipe)
-        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/tools/g-ir-tool-template.in
-}
-
-do_compile_prepend() {
-        # This prevents g-ir-scanner from writing cache data to $HOME
-        export GI_SCANNER_DISABLE_CACHE=1
-
-        # Needed to run g-ir unit tests, which won't be able to find the built libraries otherwise
-        export GIR_EXTRA_LIBS_PATH=$B/.libs
-}
-
-# Our wrappers need to be available system-wide, because they will be used 
-# to build introspection files for all other gobject-based packages
-do_install_append_class-target() {
-        install -d ${D}${bindir}/
-        install ${B}/g-ir-scanner-qemuwrapper ${D}${bindir}/
-        install ${B}/g-ir-scanner-wrapper ${D}${bindir}/
-        install ${B}/g-ir-compiler-wrapper ${D}${bindir}/
-        install ${B}/g-ir-scanner-lddwrapper ${D}${bindir}/
-}
-
-# we need target versions of introspection tools in sysroot so that they can be run via qemu
-# when building introspection files in other packages
-SYSROOT_DIRS_append_class-target = " ${bindir}"
-
-SYSROOT_PREPROCESS_FUNCS_append_class-target = " gi_binaries_sysroot_preprocess"
-gi_binaries_sysroot_preprocess() {
-        # Tweak the binary names in the introspection pkgconfig file, so that it
-        # picks up our wrappers which do the cross-compile and qemu magic.
-        sed -i \
-           -e "s|g_ir_scanner=.*|g_ir_scanner=${bindir}/g-ir-scanner-wrapper|" \
-           -e "s|g_ir_compiler=.*|g_ir_compiler=${bindir}/g-ir-compiler-wrapper|" \
-           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/gobject-introspection-1.0.pc
-}
-
-SYSROOT_PREPROCESS_FUNCS_append = " gi_ldsoconf_sysroot_preprocess"
-gi_ldsoconf_sysroot_preprocess () {
-	mkdir -p ${SYSROOT_DESTDIR}${bindir}
-	dest=${SYSROOT_DESTDIR}${bindir}/postinst-ldsoconf-${PN}
-	echo "#!/bin/sh" > $dest
-	echo "mkdir -p ${STAGING_DIR_TARGET}${sysconfdir}" >> $dest
-	echo "echo ${base_libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
-	echo "echo ${libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
-	chmod 755 $dest
-}
-
-# Remove wrapper files from the package, only used for cross-compiling
-PACKAGE_PREPROCESS_FUNCS += "gi_package_preprocess"
-gi_package_preprocess() {
-	rm -f ${PKGD}${bindir}/g-ir-scanner-qemuwrapper
-	rm -f ${PKGD}${bindir}/g-ir-scanner-wrapper
-	rm -f ${PKGD}${bindir}/g-ir-compiler-wrapper
-	rm -f ${PKGD}${bindir}/g-ir-scanner-lddwrapper
-}
-
-SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir postinst-ldsoconf-${PN}"
-
-# .typelib files are needed at runtime and so they go to the main package
-FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
-
-# .gir files go to dev package, as they're needed for developing (but not for running)
-# things that depends on introspection.
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.rnc"
-
-# These are used by gobject-based packages
-# to generate transient introspection binaries
-FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/gdump.c \
-                           ${datadir}/gobject-introspection-1.0/Makefile.introspection"
-
-# These are used by dependent packages (e.g. pygobject) to build their
-# testsuites.
-FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
-                           ${datadir}/gobject-introspection-1.0/tests/*.h"
-
-FILES_${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
-FILES_${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
new file mode 100644
index 0000000..de898a7
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
@@ -0,0 +1,197 @@
+SUMMARY = "Middleware layer between GObject-using C libraries and language bindings"
+HOMEPAGE = "https://wiki.gnome.org/action/show/Projects/GObjectIntrospection"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "libs"
+LICENSE = "LGPLv2+ & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
+                    file://tools/compiler.c;endline=20;md5=fc5007fc20022720e6c0b0cdde41fabd \
+                    file://giscanner/sourcescanner.c;endline=22;md5=194d6e0c1d00662f32d030ce44de8d39 \
+                    file://girepository/giregisteredtypeinfo.c;endline=21;md5=661847611ae6979465415f31a759ba27 \
+                    "
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
+           file://0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch \
+           file://0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch \
+           file://0003-giscanner-add-use-binary-wrapper-option.patch \
+           file://0004-giscanner-add-a-use-ldd-wrapper-option.patch \
+           file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
+           file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
+           file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
+           "
+
+SRC_URI[md5sum] = "94fec875276262037bfcd51226db12fe"
+SRC_URI[sha256sum] = "27c1590a32749de0a5481ce897772547043e94bccba4bc0a7edb3d8513e401ec"
+
+SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
+
+inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
+
+DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
+
+# target build needs qemu to run temporary introspection binaries created
+# on the fly by g-ir-scanner and a native version of itself to run
+# native versions of its own tools during build.
+# Also prelink-rtld is used to find out library dependencies of introspection binaries
+# (standard ldd doesn't work when cross-compiling).
+DEPENDS_class-target_append = " gobject-introspection-native qemu-native prelink-native"
+
+# needed for writing out the qemu wrapper script
+export STAGING_DIR_HOST
+export B
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python3-mako,"
+
+# Configure target build to use native tools of itself and to use a qemu wrapper
+# and optionally to generate introspection data
+EXTRA_OECONF_class-target = " \
+    --disable-static \
+    --enable-host-gi \
+    --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
+    --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
+"
+
+# Need to ensure ld.so.conf exists so prelink-native works
+# both before we build and if we install from sstate
+do_configure[prefuncs] += "gobject_introspection_preconfigure"
+python gobject_introspection_preconfigure () {
+    oe.utils.write_ld_so_conf(d)
+}
+
+do_configure_prepend_class-native() {
+        # Tweak the native python scripts so that they don't refer to the
+        # full path of native python binary (the solution is taken from glib-2.0 recipe)
+        # This removes the risk of exceeding Linux kernel's shebang line limit (128 bytes)
+        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/tools/g-ir-tool-template.in
+}
+
+do_configure_prepend_class-target() {
+        # Write out a qemu wrapper that will be given to gi-scanner so that it
+        # can run target helper binaries through that.
+        qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['\$GIR_EXTRA_LIBS_PATH','.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+        cat > ${B}/g-ir-scanner-qemuwrapper << EOF
+#!/bin/sh
+# Use a modules directory which doesn't exist so we don't load random things
+# which may then get deleted (or their dependencies) and potentially segfault
+export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
+
+$qemu_binary "\$@"
+if [ \$? -ne 0 ]; then
+    echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the recipe should help."
+    echo "(typically like this: GIR_EXTRA_LIBS_PATH=\"$""{B}/something/.libs\" )"
+    exit 1
+fi
+EOF
+        chmod +x ${B}/g-ir-scanner-qemuwrapper
+
+        # Write out a wrapper for g-ir-scanner itself, which will be used when building introspection files
+        # for glib-based packages. This wrapper calls the native version of the scanner, and tells it to use
+        # a qemu wrapper for running transient target binaries produced by the scanner, and an include directory 
+        # from the target sysroot.
+        cat > ${B}/g-ir-scanner-wrapper << EOF
+#!/bin/sh
+# This prevents g-ir-scanner from writing cache data to $HOME
+export GI_SCANNER_DISABLE_CACHE=1
+
+g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 "\$@"
+EOF
+        chmod +x ${B}/g-ir-scanner-wrapper
+
+        # Write out a wrapper for g-ir-compiler, which runs the target version of it through qemu.
+        # g-ir-compiler writes out the raw content of a C struct to disk, and therefore is architecture dependent.
+        cat > ${B}/g-ir-compiler-wrapper << EOF
+#!/bin/sh
+${STAGING_BINDIR}/g-ir-scanner-qemuwrapper ${STAGING_BINDIR}/g-ir-compiler "\$@"
+EOF
+        chmod +x ${B}/g-ir-compiler-wrapper
+
+        # Write out a wrapper to use instead of ldd, which does not work when a binary is built
+        # for a different architecture
+        cat > ${B}/g-ir-scanner-lddwrapper << EOF
+#!/bin/sh
+prelink-rtld --root=$STAGING_DIR_HOST "\$@"
+EOF
+        chmod +x ${B}/g-ir-scanner-lddwrapper
+
+        # Also tweak the target python scripts so that they don't refer to the
+        # native version of python binary (the solution is taken from glib-2.0 recipe)
+        sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/tools/g-ir-tool-template.in
+}
+
+do_compile_prepend() {
+        # This prevents g-ir-scanner from writing cache data to $HOME
+        export GI_SCANNER_DISABLE_CACHE=1
+
+        # Needed to run g-ir unit tests, which won't be able to find the built libraries otherwise
+        export GIR_EXTRA_LIBS_PATH=$B/.libs
+}
+
+# Our wrappers need to be available system-wide, because they will be used 
+# to build introspection files for all other gobject-based packages
+do_install_append_class-target() {
+        install -d ${D}${bindir}/
+        install ${B}/g-ir-scanner-qemuwrapper ${D}${bindir}/
+        install ${B}/g-ir-scanner-wrapper ${D}${bindir}/
+        install ${B}/g-ir-compiler-wrapper ${D}${bindir}/
+        install ${B}/g-ir-scanner-lddwrapper ${D}${bindir}/
+}
+
+# we need target versions of introspection tools in sysroot so that they can be run via qemu
+# when building introspection files in other packages
+SYSROOT_DIRS_append_class-target = " ${bindir}"
+
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " gi_binaries_sysroot_preprocess"
+gi_binaries_sysroot_preprocess() {
+        # Tweak the binary names in the introspection pkgconfig file, so that it
+        # picks up our wrappers which do the cross-compile and qemu magic.
+        sed -i \
+           -e "s|g_ir_scanner=.*|g_ir_scanner=${bindir}/g-ir-scanner-wrapper|" \
+           -e "s|g_ir_compiler=.*|g_ir_compiler=${bindir}/g-ir-compiler-wrapper|" \
+           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/gobject-introspection-1.0.pc
+}
+
+SYSROOT_PREPROCESS_FUNCS_append = " gi_ldsoconf_sysroot_preprocess"
+gi_ldsoconf_sysroot_preprocess () {
+	mkdir -p ${SYSROOT_DESTDIR}${bindir}
+	dest=${SYSROOT_DESTDIR}${bindir}/postinst-ldsoconf-${PN}
+	echo "#!/bin/sh" > $dest
+	echo "mkdir -p ${STAGING_DIR_TARGET}${sysconfdir}" >> $dest
+	echo "echo ${base_libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
+	echo "echo ${libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
+	chmod 755 $dest
+}
+
+# Remove wrapper files from the package, only used for cross-compiling
+PACKAGE_PREPROCESS_FUNCS += "gi_package_preprocess"
+gi_package_preprocess() {
+	rm -f ${PKGD}${bindir}/g-ir-scanner-qemuwrapper
+	rm -f ${PKGD}${bindir}/g-ir-scanner-wrapper
+	rm -f ${PKGD}${bindir}/g-ir-compiler-wrapper
+	rm -f ${PKGD}${bindir}/g-ir-scanner-lddwrapper
+}
+
+SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir postinst-ldsoconf-${PN}"
+
+# .typelib files are needed at runtime and so they go to the main package
+FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
+
+# .gir files go to dev package, as they're needed for developing (but not for running)
+# things that depends on introspection.
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+FILES_${PN}-dev_append = " ${datadir}/gir-*/*.rnc"
+
+# These are used by gobject-based packages
+# to generate transient introspection binaries
+FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/gdump.c \
+                           ${datadir}/gobject-introspection-1.0/Makefile.introspection"
+
+# These are used by dependent packages (e.g. pygobject) to build their
+# testsuites.
+FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
+                           ${datadir}/gobject-introspection-1.0/tests/*.h"
+
+FILES_${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
+FILES_${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


