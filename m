Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C9F997CAB1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 20:10:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v26so7690923wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 12:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E1+Cbs/f3wAXFP3Lqe4tx2XwZt+jHag29NzMOcd7kH8=;
	b=ADtWWVFTvb/4g1jYxewnapI1o4TtUcbTmYz93GrwpqYBHAU2agYVU5x4+wsh/I6IEt
	Z2kOXmhgIQMmI/9WWchBMmCeimgmzDCncDW/XyOaBTvYaAalO49Jvy6oh8EdDwxPSyYw
	IaZnsX7puxegWymcXXfPxnm0YQKw6O6ogTjqFCacaaryLyV7mVpnx4d/W3AUk1+13GPo
	GmM26tNUZoUZ3LXHqyejcBIiXwAAXLQy3Q+o1QO1OQ9LLDviR+BDPYIfwUpaSYVAJrnE
	Ph6U3klcCbU2+HIs0jpCW8qgjFzDLyMSE2G7Y4RtTIPSl0x443SywzGfuq/IsACsKHpw
	b29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E1+Cbs/f3wAXFP3Lqe4tx2XwZt+jHag29NzMOcd7kH8=;
	b=N+xgOJmA26WsTFJLkYwxDC7G42+dexpb/H2F9cUf3bQQFTwcRmfAX/BTSP5EjwiDID
	oRdWINaKl3ieSE6TsNnvq4zwFi8/LW0Yua1fu+vjOahGU5P6d2/vtaaJcwmBA1+62Iiu
	u9P7KBPgdXhRN/QITZw5gZHkqc+8oWdeZ032sNcIjXWuxjIuF+IAKNcUEulQ0YPS+hy2
	SHD2MP7W56kt33D4M8YDHaEQ2b61h4qqw+9my07nWhYz0J/J6lgtKnp8XkKg22H4kgMo
	pL5yUXE5JbTcqdkCO7+j/Wco4tOx474AT35OnyX8FEpA+ebx/s+PBVubPZjxjMMELnoW
	xV7A==
X-Gm-Message-State: AHQUAuZRFFCzZagJcg0li4+kqexIvnt+onIqlUPo0NfD9svp1/Ymivwu
	N4VxMs6fzdm2EaTyJw0PMfDndQL6zE0=
X-Google-Smtp-Source: AHgI3IY+QvnPe6JNelHlcXLf/6NhIsqdxgwt+u5CJvTFpI4VMto9GKcOQ57PN5xzBwKeV4mTBbxRzg==
X-Received: by 2002:a1c:9692:: with SMTP id y140mr8089778wmd.67.1550693436781; 
	Wed, 20 Feb 2019 12:10:36 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	g202sm4997205wme.26.2019.02.20.12.10.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 12:10:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 21:10:26 +0100
Message-Id: <20190220201026.70803-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190220201026.70803-1-alex.kanavin@gmail.com>
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/4] glib-2.0: convert from autotools to meson
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
X-List-Received-Date: Wed, 20 Feb 2019 20:10:37 -0000

PRINTF settings no longer seem necessary (tested with mingw).

Add meson-specific bits to Enable-more-tests-while-cross-compiling.patch and
0001-Install-gio-querymodules-as-libexec_PROGRAM.patch

Add 0001-Set-host_machine-correctly-when-building-with-mingw3.patch
to allow 'mingw32' as target machine in addition to 'windows'.

Add 0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch to
correct ARM build errors.

Drop configure-libtool.patch (autotools-specific).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-write-bindir-into-pkg-config-files.patch |  50 +++++++++
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  17 ++-
 ...-correctly-when-building-with-mingw3.patch | 104 ++++++++++++++++++
 ...ot-hardcode-linux-as-the-host-system.patch |  27 +++++
 ...dcode-python-path-into-various-tools.patch |   2 +-
 ...ble-more-tests-while-cross-compiling.patch |  91 ++++++++++++++-
 .../glib-2.0/glib-2.0/configure-libtool.patch |  44 --------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb |   4 +-
 meta/recipes-core/glib-2.0/glib.inc           |  35 +++---
 10 files changed, 310 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
new file mode 100644
index 00000000000..ede29c90bab
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -0,0 +1,50 @@
+From 474e59abec88de0c455836c1f53152bf2aa26c34 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 15 Feb 2019 11:17:27 +0100
+Subject: [PATCH] Do not write $bindir into pkg-config files
+
+This would otherwise break when using the files to build other target
+components (we need to rely on PATH containing the paths to utilities,
+rather than use target paths).
+
+Upstream-Status: Inappropriate [upstream wants the paths in .pc files]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gio/meson.build  | 6 +++---
+ glib/meson.build | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gio/meson.build b/gio/meson.build
+index 85d8b14..657720a 100644
+--- a/gio/meson.build
++++ b/gio/meson.build
+@@ -813,9 +813,9 @@ pkg.generate(libraries : libgio,
+                'schemasdir=' + join_paths('${datadir}', schemas_subdir),
+                'bindir=' + join_paths('${prefix}', get_option('bindir')),
+                'giomoduledir=' + giomodulesdir,
+-               'glib_compile_schemas=' + join_paths('${bindir}', 'glib-compile-schemas'),
+-               'glib_compile_resources=' + join_paths('${bindir}', 'glib-compile-resources'),
+-               'gdbus_codegen=' + join_paths('${bindir}', 'gdbus-codegen')],
++               'glib_compile_schemas=glib-compile-schemas',
++               'glib_compile_resources=glib-compile-resources',
++               'gdbus_codegen=gdbus-codegen'],
+   version : glib_version,
+   install_dir : glib_pkgconfigreldir,
+   filebase : 'gio-2.0',
+diff --git a/glib/meson.build b/glib/meson.build
+index c05c694..434e8b1 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -261,9 +261,9 @@ pkg.generate(libraries : [libglib, libintl],
+   subdirs : ['glib-2.0'],
+   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
+   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
+-               'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
+-               'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
+-               'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
++               'glib_genmarshal=glib-genmarshal',
++               'gobject_query=gobject-query',
++               'glib_mkenums=glib-mkenums'],
+   version : glib_version,
+   install_dir : glib_pkgconfigreldir,
+   filebase : 'glib-2.0',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 97d0aff5d6c..f246254942e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 856045927b9ab391165c0ebabf401835f8439eab Mon Sep 17 00:00:00 2001
+From 17fc9230fb932432d8faaaabf8c56fdc4845495e Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -11,7 +11,8 @@ Upstream-Status: Inappropriate [OE specific]
 
 ---
  gio/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ gio/meson.build | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/gio/Makefile.am b/gio/Makefile.am
 index e14cad2..bf2bcc7 100644
@@ -27,3 +28,15 @@ index e14cad2..bf2bcc7 100644
  
  glib_compile_resources_LDADD = libgio-2.0.la 		\
  	$(top_builddir)/gobject/libgobject-2.0.la	\
+diff --git a/gio/meson.build b/gio/meson.build
+index b83d8f5..85d8b14 100644
+--- a/gio/meson.build
++++ b/gio/meson.build
+@@ -925,6 +925,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+   c_args : gio_c_args,
+   # intl.lib is not compatible with SAFESEH
+   link_args : noseh_link_args,
++  install_dir: glib_libexecdir,
+   dependencies : [libgio_dep, libgobject_dep, libgmodule_dep, libglib_dep])
+ 
+ glib_compile_schemas = executable('glib-compile-schemas',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
new file mode 100644
index 00000000000..2b7fab7bded
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -0,0 +1,104 @@
+From 4169f11beedacfbb8c7934a4c99189d44935a6b9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 13 Feb 2019 15:32:05 +0100
+Subject: [PATCH] Set host_machine correctly when building with mingw32
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ gio/tests/meson.build  | 8 ++++----
+ glib/tests/meson.build | 4 ++--
+ meson.build            | 3 +++
+ tests/meson.build      | 2 +-
+ 4 files changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/gio/tests/meson.build b/gio/tests/meson.build
+index 181f5c7..11a1f12 100644
+--- a/gio/tests/meson.build
++++ b/gio/tests/meson.build
+@@ -12,7 +12,7 @@ test_c_args = [
+   '-DGLIB_COMPILE_SCHEMAS="@0@"'.format(glib_compile_schemas.full_path()),
+ ]
+ 
+-if host_machine.system() == 'windows'
++if host_system == 'windows'
+   common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
+ endif
+ 
+@@ -122,7 +122,7 @@ if dbus1_dep.found()
+ endif
+ 
+ #  Test programs buildable on UNIX only
+-if host_machine.system() != 'windows'
++if host_system != 'windows'
+   gio_tests += [{
+     'file' : {},
+     'gdbus-peer' : {
+@@ -314,7 +314,7 @@ if host_machine.system() != 'windows'
+ endif # unix
+ 
+ #  Test programs buildable on Windows only
+-if host_machine.system() == 'windows'
++if host_system == 'windows'
+   gio_tests += [{'win32-streams' : {}}]
+ endif
+ 
+@@ -379,7 +379,7 @@ if cc.get_id() != 'msvc'
+   }]
+ endif
+ 
+-if host_machine.system() != 'windows'
++if host_system != 'windows'
+   test_extra_programs += [{
+     'gdbus-example-unix-fd-client' : {
+       'install' : false,
+diff --git a/glib/tests/meson.build b/glib/tests/meson.build
+index d7b6a7a..6678a08 100644
+--- a/glib/tests/meson.build
++++ b/glib/tests/meson.build
+@@ -45,7 +45,7 @@ glib_tests = {
+   'hook' : {},
+   'hostutils' : {},
+   'include' : {
+-    'skip' : host_machine.system() == 'windows',
++    'skip' : host_system == 'windows',
+   },
+   'keyfile' : {},
+   'list' : {},
+@@ -112,7 +112,7 @@ glib_tests = {
+   'utils' : {},
+   'unicode' : {},
+   'unix' : {
+-    'skip' : host_machine.system() == 'windows',
++    'skip' : host_system == 'windows',
+   },
+   'uri' : {},
+   '1bit-mutex' : {},
+diff --git a/meson.build b/meson.build
+index f7405a2..4348f20 100644
+--- a/meson.build
++++ b/meson.build
+@@ -31,6 +31,9 @@ else
+ endif
+ 
+ host_system = host_machine.system()
++if host_system == 'mingw32'
++  host_system = 'windows'
++endif
+ 
+ glib_version = meson.project_version()
+ glib_api_version = '2.0'
+diff --git a/tests/meson.build b/tests/meson.build
+index 80e45d7..9f3869f 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -67,7 +67,7 @@ test_extra_programs = {
+   'unicode-collate' : {},
+ }
+ 
+-if host_machine.system() != 'windows'
++if host_system != 'windows'
+   tests += [{
+     'timeloop' : {},
+     'spawn-test' : {},
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch
new file mode 100644
index 00000000000..5a1a5898908
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch
@@ -0,0 +1,27 @@
+From 635fe26af51f20194c8b208e7d01303be1086d68 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 19 Feb 2019 10:31:11 +0100
+Subject: [PATCH] meson.build: do not hardcode 'linux' as the host system
+
+OE build system can set this to other values that include 'linux',
+e.g. 'linux-gnueabi'
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 4348f20..af5ed63 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1574,7 +1574,7 @@ atomicdefine = '''
+ # We know that we can always use real ("lock free") atomic operations with MSVC
+ if cc.get_id() == 'msvc' or cc.links(atomictest, name : 'atomic ops')
+   have_atomic_lock_free = true
+-  if (host_system == 'android' or host_system == 'linux') and not cc.compiles(atomicdefine, name : 'atomic ops define')
++  if (host_system == 'android' or host_system.contains('linux')) and not cc.compiles(atomicdefine, name : 'atomic ops define')
+     # When building for armv5 on Linux, gcc provides
+     # __sync_bool_compare_and_swap but doesn't define
+     # __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 697d63d5feb..872340df964 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/gio/gdbus-2.0/codegen/gdbus-codegen.in b/gio/gdbus-2.0/codegen/gdbus-codegen.in
-index 8050981..e693ef3 100644
+index 8050981..e693ef3 100755
 --- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
 +++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index 50608809264..5ccd3203fb2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 70e462e070f8eb20b7660c1cf88271c0449e43cc Mon Sep 17 00:00:00 2001
+From 1481c6d5f08f9dbbe10abc87b372a1f61db36476 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
 Subject: [PATCH] Enable more tests while cross-compiling
@@ -10,8 +10,10 @@ case we can depend on glib-2.0-native.
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- gio/tests/Makefile.am | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
+ gio/tests/Makefile.am     | 10 ++++++----
+ gio/tests/meson.build     | 15 ++++++++-------
+ tests/gobject/Makefile.am |  6 ++++++
+ 3 files changed, 20 insertions(+), 11 deletions(-)
 
 diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
 index c4e7a92..633e85c 100644
@@ -50,3 +52,86 @@ index c4e7a92..633e85c 100644
  
  BUILT_SOURCES += giotypefuncs.inc
  
+diff --git a/gio/tests/meson.build b/gio/tests/meson.build
+index dca33bd..181f5c7 100644
+--- a/gio/tests/meson.build
++++ b/gio/tests/meson.build
+@@ -173,7 +173,7 @@ if host_machine.system() != 'windows'
+ 
+   #  Test programs that need to bring up a session bus (requires dbus-daemon)
+   have_dbus_daemon = find_program('dbus-daemon', required : false).found()
+-  if have_dbus_daemon
++  if true
+     annotate_args = [
+       '--annotate', 'org.project.Bar', 'Key1', 'Value1',
+       '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
+@@ -406,12 +406,13 @@ if installed_tests_enabled
+   install_subdir('cert-tests', install_dir : installed_tests_execdir)
+ endif
+ 
+-if not meson.is_cross_build() or meson.has_exe_wrapper()
++#if not meson.is_cross_build() or meson.has_exe_wrapper()
++if meson.is_cross_build()
+ 
+   plugin_resources_c = custom_target('plugin-resources.c',
+     input : 'test4.gresource.xml',
+     output : 'plugin-resources.c',
+-    command : [glib_compile_resources,
++    command : ['glib-compile-resources',
+                '--target=@OUTPUT@',
+                '--sourcedir=' + meson.current_source_dir(),
+                '--generate-source',
+@@ -428,7 +429,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+   test_gresource = custom_target('test.gresource',
+     input : 'test.gresource.xml',
+     output : 'test.gresource',
+-    command : [glib_compile_resources,
++    command : ['glib-compile-resources',
+                '--target=@OUTPUT@',
+                '--sourcedir=' + meson.current_source_dir(),
+                '--sourcedir=' + meson.current_build_dir(),
+@@ -439,7 +440,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+   test_resources2_c = custom_target('test_resources2.c',
+     input : 'test3.gresource.xml',
+     output : 'test_resources2.c',
+-    command : [glib_compile_resources,
++    command : ['glib-compile-resources',
+                '--target=@OUTPUT@',
+                '--sourcedir=' + meson.current_source_dir(),
+                '--generate',
+@@ -450,7 +451,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+   test_resources2_h = custom_target('test_resources2.h',
+     input : 'test3.gresource.xml',
+     output : 'test_resources2.h',
+-    command : [glib_compile_resources,
++    command : ['glib-compile-resources',
+                '--target=@OUTPUT@',
+                '--sourcedir=' + meson.current_source_dir(),
+                '--generate',
+@@ -461,7 +462,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+   test_resources_c = custom_target('test_resources.c',
+     input : 'test2.gresource.xml',
+     output : 'test_resources.c',
+-    command : [glib_compile_resources,
++    command : ['glib-compile-resources',
+                '--target=@OUTPUT@',
+                '--sourcedir=' + meson.current_source_dir(),
+                '--generate-source',
+diff --git a/tests/gobject/Makefile.am b/tests/gobject/Makefile.am
+index 1bcefbe..77e646a 100644
+--- a/tests/gobject/Makefile.am
++++ b/tests/gobject/Makefile.am
+@@ -51,7 +51,13 @@ if ENABLE_TIMELOOP
+ installed_test_programs += timeloop-closure
+ endif
+ 
++# The marshal test requires running a binary, which means we require
++# glib-native when cross-compiling
++if !CROSS_COMPILING
+ glib_genmarshal=$(top_builddir)/gobject/glib-genmarshal
++else
++glib_genmarshal=$(shell which glib-genmarshal)
++endif
+ 
+ testmarshal.h: stamp-testmarshal.h
+ 	@true
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
deleted file mode 100644
index 59b891347da..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1dd1e6ddca5deada049bac2e1ee1fe4ecc5342c5 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 28 Apr 2012 18:24:50 +0200
-Subject: [PATCH 01/10] configure: use $host_alias-libtool instead of libtool
- directly
-
-Poky renames libtool to $host_alias-libtool.
-./$host_alias-libtool isn't created until after configure runs with
-libtool >= 2.2.2
-so we can't call # it at this point. We can safely assume a version is
-available
-from PATH though
-
-Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
-Rebased to glib-2.32.1 by Martin Jansa <Martin.Jansa@gmail.com>
-Rebased to glib-2.31.20+ by Andre McCurdy <armccurdy@gmail.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6fa6eb0..b6f78a6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1428,9 +1428,9 @@ AS_IF([ test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL" ], [
- 	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
- dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
- 	echo "void glib_plugin_test(void) { }" > plugin.c
--	${SHELL} ./libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
-+	${SHELL} ./$host_alias-libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
- 		${CPPFLAGS} -c -o plugin.lo plugin.c >/dev/null 2>&1
--	${SHELL} ./libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
-+	${SHELL} ./$host_alias-libtool --mode=link --tag=CC ${CC} ${CFLAGS} \
- 		${LDFLAGS} -module -o plugin.la -export-dynamic \
- 		-shrext ".o" -avoid-version plugin.lo \
- 		-rpath /dont/care >/dev/null 2>&1
--- 
-2.14.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 9ec011a0950..a4e0c9201f2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 43967e85b7a87f9c2e780504ef30f4c9bf56f8f5 Mon Sep 17 00:00:00 2001
+From 9d985803c50cfb99253c757934985f937da34822 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index 8aad570fa9d..2de2affa51a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -5,7 +5,6 @@ PE = "1"
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
-           file://configure-libtool.patch \
            file://run-ptest \
            file://uclibc_musl_translation.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
@@ -14,6 +13,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://0001-Revert-Use-absolute-paths-in-pkg-config-files.patch \
+           file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
+           file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
+           file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index a186c1d9eb6..4d7fdeebbbd 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -29,7 +29,11 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
+inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
+
+# This avoids the need to depend on target python3, which in case of mingw is not even possible.
+# meson's python configuration pokes into python3 configuration, so this provides the native config to it.
+unset _PYTHON_SYSCONFIGDATA_NAME
 
 REQUIRED_DISTRO_FEATURES_libc-glibc = "${@'libc-charsets libc-locale-code libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False, d) else ''}"
 
@@ -37,21 +41,17 @@ S = "${WORKDIR}/glib-${PV}"
 
 PACKAGECONFIG ??= "system-pcre libmount"
 # To use the system pcre it must be configured with --enable-unicode-properties
-PACKAGECONFIG[system-pcre] = "--with-pcre=system,--with-pcre=internal,libpcre"
-PACKAGECONFIG[libmount] = "--enable-libmount,--disable-libmount,util-linux"
-PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
-PACKAGECONFIG[libelf] = "--enable-libelf,--disable-libelf,elfutils"
-
-CORECONF = "--disable-dtrace --disable-fam --disable-systemtap"
+PACKAGECONFIG[system-pcre] = "-Dinternal_pcre=false,-Dinternal_pcre=true,libpcre"
+PACKAGECONFIG[libmount] = "-Dlibmount=true,-Dlibmount=false,util-linux"
+PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
+# libelf is auto-detected without a configuration option
+PACKAGECONFIG[libelf] = ",,elfutils"
 
-PRINTF = "--enable-included-printf=no"
-PRINTF_darwin = "--enable-included-printf=yes"
-PRINTF_mingw32 = "--enable-included-printf=yes"
-EXTRA_OECONF = "${PRINTF} ${CORECONF}"
-EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
+CORECONF = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=false"
 
-# Tell configure that we'll have dbus-daemon on the target for the tests
-EXTRA_OECONF_append_class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ac_cv_prog_DBUS_DAEMON=dbus-daemon', '', d)}"
+EXTRA_OEMESON = "${CORECONF} ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dinstalled_tests=true', '-Dinstalled_tests=false', d)}"
+EXTRA_OEMESON_class-native = "${CORECONF} -Dinstalled_tests=false"
+EXTRA_OEMESON_class-nativesdk = "${CORECONF} -Dinstalled_tests=false"
 
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
@@ -117,6 +117,8 @@ do_install_append () {
         if test "x${MLPREFIX}" != "x"; then
                 mv ${D}${libexecdir}/gio-querymodules${EXEEXT} ${D}${libexecdir}/${MLPREFIX}gio-querymodules${EXEEXT}
         fi
+        # Autotools does this, meson does not
+        mkdir -p ${D}${libdir}/gio/modules
 }
 
 do_install_append_class-target () {
@@ -129,6 +131,11 @@ do_install_append_class-target () {
 	fi
 }
 
+# As we do not build python3 for windows, makes no sense to ship the script that's using it
+do_install_append_mingw32() {
+        rm -f ${D}${bindir}/gtester-report
+}
+
 CODEGEN_PYTHON_RDEPENDS = "python3 python3-distutils python3-xml"
 CODEGEN_PYTHON_RDEPENDS_mingw32 = ""
 
-- 
2.17.1


