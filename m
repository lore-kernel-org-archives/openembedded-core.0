Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2356F6B073
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 12:20:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g135so1856465wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jJAtbh2clv8F9cNicbRvq8hXkQfxxFM1T2PAfSMeqLY=;
	b=JTxOvmHLa/Z26NUThK5PPqzERQzRNy8rB4/cxMSShHT30PLPucSf/voyMV+F3yf9k7
	E819XvbJCnpUuCbKF6ZBqeeBaG64xORH+EVI9YTKSDx9Sa8Wrjcjfe3jQWdlPP9pss/f
	kzViSJvFdjKHqwJKbkcjkaYCZxAvDQVWGKyu+wo3Z7IWrPsHk7n32T9X7M5O+kDhez0K
	lLaxK5zmsd5b8gtuc5ufOFzM7LxzQ4loiIfs0D0/63SF+uF295fjXJBdlBEPDtWwCvUH
	D5b6grc5rXFxtriL6buJ5FTqk7xmomAj29wQ0HvJOPWdMjIyTla9XGlfplE4jh95hMhW
	U2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jJAtbh2clv8F9cNicbRvq8hXkQfxxFM1T2PAfSMeqLY=;
	b=HTRgJFuA/GBbnrxjL6hK7nVzrxxnL0Aw0solIBtf5D7BnHZcPMF1ozcFcRmzU3eSDI
	pLqhgB6+hPkk+c3UtAOiOP/v3/fr3kCdvOQaAiqjDHXwAhTzvQaOOSEX+LlLtX1qJ/nE
	zCStc1IdC5I9/r440czw+O/6mn/eU28LyQGyVnp/8qhOAHmuKOitDXV8hxEP4y981RhL
	5TO874tAgQAxCZ/+jui8A5pfJxxQhPmREbvDAVE38qHqT4LDjtWRHCtZgDCaFV8TIe3o
	1HhwJ3AUsWq36WkQvfzQ9ucRQm+MEalMnR7l/CV5AJTzX+dw/0MBO226ghG7ZUFJqCPJ
	rA+Q==
X-Gm-Message-State: APjAAAXHpHLsQX+l6HYY578gZ1Q23OLp1bufkqBYUnYK7fAe4Lzvy0VQ
	YDjYStfQ5yp1w6uM0tI+oax+h+E9Q7k=
X-Google-Smtp-Source: APXvYqzWIi4kwLCEd/IhLDYUEt9xz/KKZsyheL2tcPd8UtqISrB3XIDtH3XOCtXrc9Urty5cLpLSnQ==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr3823577wme.51.1559910005046; 
	Fri, 07 Jun 2019 05:20:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	d10sm2694657wrh.91.2019.06.07.05.20.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 05:20:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 14:19:52 +0200
Message-Id: <20190607121954.116898-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/3] glib-2.0: udpate 2.58.3 -> 2.60.3
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
X-List-Received-Date: Fri, 07 Jun 2019 12:20:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop autotools-specific parts from patches, as all autotools files
have been removed upstream (meson is now the only option).

Remove autotools-specific 0001-Revert-Use-absolute-paths-in-pkg-config-files.patch

Remove backported fix-nl-abaltmon.patch

Add a hunk to Enable-more-tests-while-cross-compiling.patch which comments out
the part of the tests that hard-codes native ld for building.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  23 +---
 ...e-absolute-paths-in-pkg-config-files.patch |  64 ---------
 ...-correctly-when-building-with-mingw3.patch |  61 ++++-----
 ...ble-more-tests-while-cross-compiling.patch | 126 ++++++++----------
 .../glib-2.0/glib-2.0/fix-nl-abaltmon.patch   | 104 ---------------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   6 +-
 ...{glib-2.0_2.58.3.bb => glib-2.0_2.60.3.bb} |   6 +-
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 8 files changed, 92 insertions(+), 300 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-absolute-paths-in-pkg-config-files.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.58.3.bb => glib-2.0_2.60.3.bb} (79%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index f246254942e..a3d71f2b7aa 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 17fc9230fb932432d8faaaabf8c56fdc4845495e Mon Sep 17 00:00:00 2001
+From d29dfba67b1808eea6d428085f95b6e42cf2d1e4 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -10,29 +10,14 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
 
 ---
- gio/Makefile.am | 3 ++-
  gio/meson.build | 1 +
- 2 files changed, 3 insertions(+), 1 deletion(-)
+ 1 file changed, 1 insertion(+)
 
-diff --git a/gio/Makefile.am b/gio/Makefile.am
-index e14cad2..bf2bcc7 100644
---- a/gio/Makefile.am
-+++ b/gio/Makefile.am
-@@ -835,7 +835,8 @@ gio.def: libgio-2.0.la
- gio-2.0.lib: libgio-2.0.la gio.def
- 	$(AM_V_GEN) lib.exe -machine:@LIB_EXE_MACHINE_FLAG@ -name:libgio-2.0-$(LT_CURRENT_MINUS_AGE).dll -def:$(builddir)/gio.def -out:$@
- 
--bin_PROGRAMS = gio-querymodules glib-compile-schemas glib-compile-resources gsettings gio-launch-desktop
-+bin_PROGRAMS = glib-compile-schemas glib-compile-resources gsettings gio-launch-desktop
-+libexec_PROGRAMS = gio-querymodules
- 
- glib_compile_resources_LDADD = libgio-2.0.la 		\
- 	$(top_builddir)/gobject/libgobject-2.0.la	\
 diff --git a/gio/meson.build b/gio/meson.build
-index b83d8f5..85d8b14 100644
+index 4e5e021..90a741a 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -925,6 +925,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -940,6 +940,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-absolute-paths-in-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-absolute-paths-in-pkg-config-files.patch
deleted file mode 100644
index f0c5d84ba7c..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-absolute-paths-in-pkg-config-files.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From abc26aed7a28678dfcc20b21726a97c7c02ea73b Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Thu, 14 Feb 2019 14:55:15 +0800
-Subject: [PATCH] Revert "Use absolute paths in pkg-config files"
-
-This reverts commit e7a7c9b97776fa2a638d18ea3a931ba84e778f80.
-
-The glib pkgconfig files now contain absolute paths, but they're
-target paths so when we used them from a sysroot it fails.  Upstream
-thinks that we should be setting
-GLIB_MKENUMS=/path/to/sysroot/usr/bin/glib-mkenums but that really
-doesn't scale.
-
-For now, we just revert the change to put absolute paths into
-the sysroot. This should be re-evaluated when we move the recipe to use
-meson.
-
-Upstream-Status: Inappropriate [Revert of an upstream commit]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- gio-2.0.pc.in  | 7 +++----
- glib-2.0.pc.in | 7 +++----
- 2 files changed, 6 insertions(+), 8 deletions(-)
-
-diff --git a/gio-2.0.pc.in b/gio-2.0.pc.in
-index d67e80839..526f0daa0 100644
---- a/gio-2.0.pc.in
-+++ b/gio-2.0.pc.in
-@@ -5,11 +5,10 @@ includedir=@includedir@
- 
- datadir=@datadir@
- schemasdir=${datadir}/glib-2.0/schemas
--bindir=@bindir@
- giomoduledir=@GIO_MODULE_DIR@
--glib_compile_schemas=${bindir}/glib-compile-schemas
--glib_compile_resources=${bindir}/glib-compile-resources
--gdbus_codegen=${bindir}/gdbus-codegen
-+glib_compile_schemas=glib-compile-schemas
-+glib_compile_resources=glib-compile-resources
-+gdbus_codegen=gdbus-codegen
- 
- Name: GIO
- Description: glib I/O library
-diff --git a/glib-2.0.pc.in b/glib-2.0.pc.in
-index 3c5ea81dc..275fc0163 100644
---- a/glib-2.0.pc.in
-+++ b/glib-2.0.pc.in
-@@ -3,10 +3,9 @@ exec_prefix=@exec_prefix@
- libdir=@libdir@
- includedir=@includedir@
- 
--bindir=@bindir@
--glib_genmarshal=${bindir}/glib-genmarshal
--gobject_query=${bindir}/gobject-query
--glib_mkenums=${bindir}/glib-mkenums
-+glib_genmarshal=glib-genmarshal
-+gobject_query=gobject-query
-+glib_mkenums=glib-mkenums
- 
- Name: GLib
- Description: C Utility Library
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index 2b7fab7bded..d22a646c5de 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From 4169f11beedacfbb8c7934a4c99189d44935a6b9 Mon Sep 17 00:00:00 2001
+From f5a4b4c0579734923c9caf70944322efff57318b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -8,13 +8,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
  gio/tests/meson.build  | 8 ++++----
- glib/tests/meson.build | 4 ++--
+ glib/tests/meson.build | 2 +-
  meson.build            | 3 +++
  tests/meson.build      | 2 +-
- 4 files changed, 10 insertions(+), 7 deletions(-)
+ 4 files changed, 9 insertions(+), 6 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 181f5c7..11a1f12 100644
+index 028b196..217ccb1 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
 @@ -12,7 +12,7 @@ test_c_args = [
@@ -26,57 +26,48 @@ index 181f5c7..11a1f12 100644
    common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
  endif
  
-@@ -122,7 +122,7 @@ if dbus1_dep.found()
+@@ -119,7 +119,7 @@ if dbus1_dep.found()
  endif
  
  #  Test programs buildable on UNIX only
 -if host_machine.system() != 'windows'
 +if host_system != 'windows'
-   gio_tests += [{
+   gio_tests += {
      'file' : {},
      'gdbus-peer' : {
-@@ -314,7 +314,7 @@ if host_machine.system() != 'windows'
+@@ -327,7 +327,7 @@ if host_machine.system() != 'windows'
  endif # unix
  
  #  Test programs buildable on Windows only
 -if host_machine.system() == 'windows'
 +if host_system == 'windows'
-   gio_tests += [{'win32-streams' : {}}]
+   gio_tests += {'win32-streams' : {}}
  endif
  
-@@ -379,7 +379,7 @@ if cc.get_id() != 'msvc'
-   }]
+@@ -392,7 +392,7 @@ if cc.get_id() != 'msvc'
+   }
  endif
  
 -if host_machine.system() != 'windows'
 +if host_system != 'windows'
-   test_extra_programs += [{
+   test_extra_programs += {
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index d7b6a7a..6678a08 100644
+index d54fc41..a4761fe 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -45,7 +45,7 @@ glib_tests = {
-   'hook' : {},
-   'hostutils' : {},
-   'include' : {
--    'skip' : host_machine.system() == 'windows',
-+    'skip' : host_system == 'windows',
-   },
-   'keyfile' : {},
-   'list' : {},
-@@ -112,7 +112,7 @@ glib_tests = {
-   'utils' : {},
-   'unicode' : {},
-   'unix' : {
--    'skip' : host_machine.system() == 'windows',
-+    'skip' : host_system == 'windows',
-   },
-   'uri' : {},
-   '1bit-mutex' : {},
+@@ -132,7 +132,7 @@ if glib_conf.has('HAVE_EVENTFD')
+   }
+ endif
+ 
+-if host_machine.system() == 'windows'
++if host_system == 'windows'
+   if winsock2.found()
+     glib_tests += {
+       'gpoll' : {
 diff --git a/meson.build b/meson.build
-index f7405a2..4348f20 100644
+index a745024..e87eae5 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -31,6 +31,9 @@ else
@@ -90,15 +81,15 @@ index f7405a2..4348f20 100644
  glib_version = meson.project_version()
  glib_api_version = '2.0'
 diff --git a/tests/meson.build b/tests/meson.build
-index 80e45d7..9f3869f 100644
+index 11075dd..cd6067b 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -67,7 +67,7 @@ test_extra_programs = {
+@@ -66,7 +66,7 @@ test_extra_programs = {
    'unicode-collate' : {},
  }
  
 -if host_machine.system() != 'windows'
 +if host_system != 'windows'
-   tests += [{
+   tests += {
      'timeloop' : {},
-     'spawn-test' : {},
+     'iochannel-test' : {},
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index 5ccd3203fb2..ff2629f06c8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 1481c6d5f08f9dbbe10abc87b372a1f61db36476 Mon Sep 17 00:00:00 2001
+From 23cd157352ac8a53f992ddc6d6d01caadf1c79bc Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
 Subject: [PATCH] Enable more tests while cross-compiling
@@ -9,54 +9,16 @@ case we can depend on glib-2.0-native.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
- gio/tests/Makefile.am     | 10 ++++++----
- gio/tests/meson.build     | 15 ++++++++-------
- tests/gobject/Makefile.am |  6 ++++++
- 3 files changed, 20 insertions(+), 11 deletions(-)
+ gio/tests/meson.build | 26 ++++++++++++++------------
+ 1 file changed, 14 insertions(+), 12 deletions(-)
 
-diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
-index c4e7a92..633e85c 100644
---- a/gio/tests/Makefile.am
-+++ b/gio/tests/Makefile.am
-@@ -583,10 +583,9 @@ test_programs += \
- endif
- 
- # -----------------------------------------------------------------------------
--#  The resources test is a bit more complicated, and we cannot build it when
--#  cross-compiling GIO because it requires running a binary...
-+#  The resources test is a bit more complicated, and requires glib-native
-+#  for running a binary
- 
--if !CROSS_COMPILING
- test_programs += resources
- resources_SOURCES = resources.c
- nodist_resources_SOURCES = test_resources.c test_resources2.c test_resources2.h
-@@ -611,7 +610,11 @@ if !ENABLE_INSTALLED_TESTS
- libresourceplugin_la_LDFLAGS += -rpath /
- endif
- 
-+if !CROSS_COMPILING
- glib_compile_resources=$(top_builddir)/gio/glib-compile-resources
-+else
-+glib_compile_resources=glib-compile-resources
-+endif
- 
- test-generated.txt: test1.txt
- 	$(AM_V_GEN) echo "Generated" > $@ && \
-@@ -632,7 +635,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
- 
- EXTRA_DIST += test.gresource.xml test1.txt test2.gresource.xml test2.txt test3.gresource.xml test3.txt test4.gresource.xml
- CLEANFILES += test-generated.txt test_resources.c test_resources2.[ch] plugin_resources.c test.gresource
--endif # !CROSS_COMPILING
- 
- BUILT_SOURCES += giotypefuncs.inc
- 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index dca33bd..181f5c7 100644
+index 65f43e2..028b196 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -173,7 +173,7 @@ if host_machine.system() != 'windows'
+@@ -185,7 +185,7 @@ if host_machine.system() != 'windows'
  
    #  Test programs that need to bring up a session bus (requires dbus-daemon)
    have_dbus_daemon = find_program('dbus-daemon', required : false).found()
@@ -65,8 +27,8 @@ index dca33bd..181f5c7 100644
      annotate_args = [
        '--annotate', 'org.project.Bar', 'Key1', 'Value1',
        '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
-@@ -406,12 +406,13 @@ if installed_tests_enabled
-   install_subdir('cert-tests', install_dir : installed_tests_execdir)
+@@ -453,12 +453,13 @@ if installed_tests_enabled
+   install_data('static-link.py', install_dir : installed_tests_execdir)
  endif
  
 -if not meson.is_cross_build() or meson.has_exe_wrapper()
@@ -81,7 +43,7 @@ index dca33bd..181f5c7 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate-source',
-@@ -428,7 +429,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -482,7 +483,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_gresource = custom_target('test.gresource',
      input : 'test.gresource.xml',
      output : 'test.gresource',
@@ -90,7 +52,7 @@ index dca33bd..181f5c7 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -439,7 +440,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -493,7 +494,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_c = custom_target('test_resources2.c',
      input : 'test3.gresource.xml',
      output : 'test_resources2.c',
@@ -99,7 +61,7 @@ index dca33bd..181f5c7 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -450,7 +451,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -504,7 +505,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_h = custom_target('test_resources2.h',
      input : 'test3.gresource.xml',
      output : 'test_resources2.h',
@@ -108,30 +70,54 @@ index dca33bd..181f5c7 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -461,7 +462,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-   test_resources_c = custom_target('test_resources.c',
+@@ -516,7 +517,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      input : 'test2.gresource.xml',
+     depends : big_test_resource,
      output : 'test_resources.c',
 -    command : [glib_compile_resources,
 +    command : ['glib-compile-resources',
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
-                '--generate-source',
-diff --git a/tests/gobject/Makefile.am b/tests/gobject/Makefile.am
-index 1bcefbe..77e646a 100644
---- a/tests/gobject/Makefile.am
-+++ b/tests/gobject/Makefile.am
-@@ -51,7 +51,13 @@ if ENABLE_TIMELOOP
- installed_test_programs += timeloop-closure
- endif
- 
-+# The marshal test requires running a binary, which means we require
-+# glib-native when cross-compiling
-+if !CROSS_COMPILING
- glib_genmarshal=$(top_builddir)/gobject/glib-genmarshal
-+else
-+glib_genmarshal=$(shell which glib-genmarshal)
-+endif
- 
- testmarshal.h: stamp-testmarshal.h
- 	@true
+                '--sourcedir=' + meson.current_build_dir(),
+@@ -527,7 +528,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+   digit_test_resources_c = custom_target('digit_test_resources.c',
+     input : '111_digit_test.gresource.xml',
+     output : 'digit_test_resources.c',
+-    command : [glib_compile_resources,
++    command : ['glib-compile-resources',
+                '--target=@OUTPUT@',
+                '--sourcedir=' + meson.current_source_dir(),
+                '--sourcedir=' + meson.current_build_dir(),
+@@ -538,7 +539,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+   digit_test_resources_h = custom_target('digit_test_resources.h',
+     input : '111_digit_test.gresource.xml',
+     output : 'digit_test_resources.h',
+-    command : [glib_compile_resources,
++    command : ['glib-compile-resources',
+                '--target=@OUTPUT@',
+                '--sourcedir=' + meson.current_source_dir(),
+                '--generate',
+@@ -565,11 +566,12 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+   # Support for --add-symbol was added to LLVM objcopy in 2019
+   # (https://reviews.llvm.org/D58234). FIXME: This test could be enabled for
+   # LLVM once that support is in a stable release.
+-  if build_machine.system() == 'linux' and cc.get_id() == 'gcc'
++  #if build_machine.system() == 'linux' and cc.get_id() == 'gcc'
++  if not meson.is_cross_build()
+     test_gresource_binary = custom_target('test5.gresource',
+       input : 'test5.gresource.xml',
+       output : 'test5.gresource',
+-      command : [glib_compile_resources,
++      command : ['glib-compile-resources',
+                  '--target=@OUTPUT@',
+                  '--sourcedir=' + meson.current_source_dir(),
+                  '--sourcedir=' + meson.current_build_dir(),
+@@ -581,7 +583,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+     test_resources_binary_c = custom_target('test_resources_binary.c',
+       input : 'test5.gresource.xml',
+       output : 'test_resources_binary.c',
+-      command : [glib_compile_resources,
++      command : ['glib-compile-resources',
+                  '--target=@OUTPUT@',
+                  '--sourcedir=' + meson.current_source_dir(),
+                  '--sourcedir=' + meson.current_build_dir(),
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch
deleted file mode 100644
index c36a397fefc..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-Fix the last few remaining bugs in glib's date/locale code.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 93d8482384ebc5c7d1f3d92b0190db0371269663 Mon Sep 17 00:00:00 2001
-From: Rafal Luzynski <digitalfreak@lingonborough.com>
-Date: Fri, 10 May 2019 00:40:27 +0200
-Subject: [PATCH] build: Fix a typo in the test whether _NL_ABALTMON_n is
- supported
-
-The correct spelling is "_NL_ABALTMON_n" rather than "_NL_ALTMON_n".
-The typo made Meson build think that _NL_ABALTMON_n constants are
-not supported which was totally wrong. This made g_date_time_format()
-output incorrect abbreviated month names in some languages.
-The old configure.ac script was correct here.
-
-Bug introduced in commit be4f96b6502c01d2a51d60b7a669c8ef82e22a4d.
-
-Closes: #1759
----
- meson.build | 26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index c5d2ce5f8..08fa40ac5 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1002,20 +1002,20 @@ if cc.links('''#ifndef _GNU_SOURCE
-               #include <langinfo.h>
-                int main (int argc, char ** argv) {
-                  char *str;
--                 str = nl_langinfo (_NL_ALTMON_1);
--                 str = nl_langinfo (_NL_ALTMON_2);
--                 str = nl_langinfo (_NL_ALTMON_3);
--                 str = nl_langinfo (_NL_ALTMON_4);
--                 str = nl_langinfo (_NL_ALTMON_5);
--                 str = nl_langinfo (_NL_ALTMON_6);
--                 str = nl_langinfo (_NL_ALTMON_7);
--                 str = nl_langinfo (_NL_ALTMON_8);
--                 str = nl_langinfo (_NL_ALTMON_9);
--                 str = nl_langinfo (_NL_ALTMON_10);
--                 str = nl_langinfo (_NL_ALTMON_11);
--                 str = nl_langinfo (_NL_ALTMON_12);
-+                 str = nl_langinfo (_NL_ABALTMON_1);
-+                 str = nl_langinfo (_NL_ABALTMON_2);
-+                 str = nl_langinfo (_NL_ABALTMON_3);
-+                 str = nl_langinfo (_NL_ABALTMON_4);
-+                 str = nl_langinfo (_NL_ABALTMON_5);
-+                 str = nl_langinfo (_NL_ABALTMON_6);
-+                 str = nl_langinfo (_NL_ABALTMON_7);
-+                 str = nl_langinfo (_NL_ABALTMON_8);
-+                 str = nl_langinfo (_NL_ABALTMON_9);
-+                 str = nl_langinfo (_NL_ABALTMON_10);
-+                 str = nl_langinfo (_NL_ABALTMON_11);
-+                 str = nl_langinfo (_NL_ABALTMON_12);
-                  return 0;
--               }''', name : 'nl_langinfo (_NL_ALTMON_n)')
-+               }''', name : 'nl_langinfo (_NL_ABALTMON_n)')
-   glib_conf.set('HAVE_LANGINFO_ABALTMON', 1)
- endif
- 
--- 
-2.18.1
-
-From 35c28be32762d5af6b93cb6a3420c5977f7bf599 Mon Sep 17 00:00:00 2001
-From: Rafal Luzynski <digitalfreak@lingonborough.com>
-Date: Mon, 13 May 2019 23:11:28 +0200
-Subject: [PATCH] tests: Update month name check for Greek locale
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Update the abbreviated month name in the test to match the actual
-translation. Otherwise the test fails with false positive.
-
-Vocabulary:
-
-July (nominative)  - Greek: Ιούλιος (abbreviated: Ιούλ)
-Of July (genitive) - Greek: Ιουλίου (abbreviated: Ιουλ)
-
-This is similar to commit 4d215e006ee69bd7a993bf853722993433adbf9a
-and commit 7fe793e125c316ac34edd8158df5a132cb044bc1.
-
-Closes #1776
----
- glib/tests/date.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/glib/tests/date.c b/glib/tests/date.c
-index 8eb28712b..ff13ad101 100644
---- a/glib/tests/date.c
-+++ b/glib/tests/date.c
-@@ -388,7 +388,7 @@ test_month_names (void)
-       TEST_DATE ( 1,  4, 2018,   "%OB %Y",       "Απρίλιος 2018");
-       TEST_DATE ( 1,  5, 2018,   "%OB %Y",          "Μάιος 2018");
-       TEST_DATE ( 1,  6, 2018,   "%OB %Y",        "Ιούνιος 2018");
--      TEST_DATE (16,  7, 2018, "%e %b %Y",        "16 Ιούλ 2018");
-+      TEST_DATE (16,  7, 2018, "%e %b %Y",        "16 Ιουλ 2018");
-       TEST_DATE ( 1,  8, 2018,   "%Ob %Y",            "Αύγ 2018");
-     }
-   else
--- 
-2.18.1
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index a4e0c9201f2..2d698a67c8e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 9d985803c50cfb99253c757934985f937da34822 Mon Sep 17 00:00:00 2001
+From 17ca85e329bf39c004b73a02e94b597dac41ddfe Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,7 +19,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 36c0cef..912e490 100644
+index b92162d..fce9933 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -40,6 +40,8 @@
@@ -31,7 +31,7 @@ index 36c0cef..912e490 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1099,7 +1101,15 @@ get_gio_module_dir (void)
+@@ -1156,7 +1158,15 @@ get_gio_module_dir (void)
  #endif
        g_free (install_dir);
  #else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
similarity index 79%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
index d749be34ee8..f4ade098ef1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
@@ -12,16 +12,14 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
-           file://0001-Revert-Use-absolute-paths-in-pkg-config-files.patch \
            file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
-           file://fix-nl-abaltmon.patch \
            file://glib-meson.cross \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "8058c7bde846dcffe5fa453eca366d73"
-SRC_URI[sha256sum] = "8f43c31767e88a25da72b52a40f3301fefc49a665b56dc10ee7cc9565cbe7481"
+SRC_URI[md5sum] = "112a850caa8d2c21e24d4c9844e8b1fe"
+SRC_URI[sha256sum] = "04ab0d560d45790d055f50db2d69974eab8b693a77390075462c56e652b760b9"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 385596c7544..3ae22f5e807 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -48,7 +48,7 @@ PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
 PACKAGECONFIG[libelf] = ",,elfutils"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
 
-EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=false"
+EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=disabled"
 EXTRA_OEMESON_append_class-target = " --cross-file ${WORKDIR}/glib-meson.cross"
 
 do_configure_prepend() {
-- 
2.17.1


