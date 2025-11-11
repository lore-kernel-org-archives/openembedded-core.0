Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4502BCCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 20:41:31 +0000 (UTC)
Received: from xmbgsz7.mail.foxmail.com (xmbgsz7.mail.foxmail.com [61.241.55.243])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25837.1762889204699589140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 11:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foxmail.com header.s=s201512 header.b=Buzc4wFK;
 spf=pass (domain: foxmail.com, ip: 61.241.55.243, mailfrom: wenyang.linux@foxmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1762889200;
	bh=en11NfIoTnz/JSD/fuR1MY+2rP5xrMiMiF7CDBYrhi8=;
	h=From:To:Cc:Subject:Date;
	b=Buzc4wFKzQiMxDZNdZ4TMRCSKB9k48/+ShhP5bKAIYMp1EzflDzVHTLi/MtUC0ypt
	 Jc2s+0PQYVCviSd9V/ks60VCrbYYXfG6JqlBgNbWhNXBrtK3AoTTimo7LPpJ5zKuZw
	 rAGKDJ11Z5tfs9gyVQoqq1IdK3p52T1fFOZZYFP4=
Received: from localhost.localdomain ([2409:891f:9260:781a:a874:84af:2d5b:7f05])
	by newxmesmtplogicsvrszb42-0.qq.com (NewEsmtp) with SMTP
	id 4768ECCD; Wed, 12 Nov 2025 01:17:54 +0800
X-QQ-mid: xmsmtpt1762881474tbrhioswk
Message-ID: <tencent_48D3734B550F356650C664773A0B33A9DF06@qq.com>
X-QQ-XMAILINFO: M+LbSN6IdDJLWWntUjsaISOPR4oYhVOZ1TpK3ZddRHdhMgDw5XQH2tNLjbTRcm
	 lHQ1ysVkvifaEuGYWlsaHtsnxSwyuOKTQzi7rQshsowGvOLr+k97raOI67OfsTtKZRn2Hkb3R3m+
	 JnOZGyyGD6gTTyprdAD3PZBFEhcDWNInXQshdZpxaA1OAcYik2AVSrUPc/GCPsCXew8gFB07c0uV
	 e4JeJFzHzdOVt7JwZ8g2wsGf9+u4XzFL8ywoPOW0C/dsQiZ+3qXyoIj0t7DS22Yfs1n/atpomDTe
	 5GAyKx82R3QXvjCdRxHgoCDY9g+oevMmoVjfTGb0EYqKVe7x1XkA2ZO6WeW/Gj2haMu7iSJrKjx3
	 ixhj84ePFqBda0kKXYdEP4Rd0SNgCS5tgc/6UayHswlaZ7DgqGk9WJYSsGCMo9RfSG7POpjJzKsc
	 E/e1jfUrQORxFLHbVfmkAFfGv0hRUymKV6T1yZ3dq3g0nf/76Py9y744YmpOKVxoj3fC9KDrRDK7
	 IKo2FsTcDhaBz2+oQkjir8WQAcCTOU94Q95QVl7Csn1F1HyIykkCawz13ieR5F8NVXwF430ra+uB
	 VRKt7Nexv/f2mpneN0HpzW1M1+NzTGAwPmSrM4SVT40FCB0Due7kU3rVdBpwUOH9n4dIe/CzVbTk
	 X6Q1SNqGGLW3deLGlh9W8uy4bx86PbcbefuJxJx9+CsMES7TROF+CSskevlRHmzMshNdUaXktWDi
	 kr77kIWeyQt01ADDSJjbOo2QcRXPPju8rudyvgg0CwGkFQGwcntttmK8xUapQQbAqRcpExLdSsp0
	 Vji4S3rs7Z3hmLSbyFFoMDatRrZB40C+xcrHGGd482mWZgRgBAL/TVUyLUn4gHW+nlVIXKoTTVfn
	 CDZ+9IACQBxe7z5suvy8X1AVbRIoF+hcPfE2RADYHXpl+yizqDOgDFZHB+qJlDoE0g07f4LiYE9p
	 CfTOiveneiudifFzsG4q0j9CgKTw8zebUlQ+SCYPVcQqR651hvWaYx395Nd7bE/SvBV5Nf5bteXC
	 X5M1jnZ0C51V+6MqWjoTsfWwgM7BHXniwuRb7ImtGWVsZZHd8nM5bd1cJ4D9XwOwEKwqhPS67i7e
	 lALFDx
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: wenyang.linux@foxmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Wen Yang <wenyang.linux@foxmail.com>
Subject: [meta-oe][PATCH RESEND v3] nethogs: add recipe
Date: Wed, 12 Nov 2025 01:17:47 +0800
X-OQ-MSGID: <20251111171747.12622-1-wenyang.linux@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 20:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226190

From: Wen Yang <wenyang.linux@foxmail.com>

NetHogs is a small 'net top' tool. Instead of breaking the traffic
down per protocol or per subnet, like most tools do, it groups
bandwidth by process.

Signed-off-by: Wen Yang <wenyang.linux@foxmail.com>
---
 ...0001-meson-cleanup-version-detection.patch |  49 +++++
 ...n-fix-build-with-libnethogs-disabled.patch |  38 ++++
 .../files/0003-meson-run-meson-format.patch   | 183 ++++++++++++++++++
 .../files/0004-meson-fix-library-name.patch   |  25 +++
 ...-security-flags-to-LDFLAGS-for-Linux.patch |  25 +++
 ...S-for-devices.cpp-and-libnethogs.cpp.patch |  30 +++
 .../nethogs/nethogs_git.bb                    |  21 ++
 7 files changed, 371 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-detection.patch
 create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-libnethogs-disabled.patch
 create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.patch
 create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.patch
 create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
 create mode 100644 meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch
 create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs_git.bb

diff --git a/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-detection.patch b/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-detection.patch
new file mode 100644
index 0000000000..797c79225d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-detection.patch
@@ -0,0 +1,49 @@
+From 049fff5623720fcd0b4fdc92501b586addbb6b48 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 25 Jan 2025 16:03:12 +0000
+Subject: [PATCH 1/6] meson: cleanup version detection
+
+Tell Meson what version the project is, so that we set the right versioning
+on libnethogs.
+
+Upstream-Status: Backport [https://github.com/raboof/nethogs/commit/049fff5623720fcd0b4fdc92501b586addbb6b48]
+---
+ meson.build | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 81d7b59..16e61b4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -5,11 +5,11 @@
+ project('nethogs',
+         ['c', 'cpp'],
+         default_options : ['warning_level=3',
+-                           'cpp_std=c++14']
++                           'cpp_std=c++14'],
++        version : run_command('./determineVersion.sh').stdout().strip(),
+         )
+
+ cc = meson.get_compiler('cpp')
+-version = run_command('./determineVersion.sh', check: true).stdout().strip()
+
+ #######################################
+ ## Dependencies and flags definition ##
+@@ -19,7 +19,7 @@ projectinc = [include_directories('.', 'src')]
+
+ # flags
+ c_args = [
+-  '-DVERSION="' + version + '"'
++  '-DVERSION="' + meson.project_version() + '"'
+ ]
+
+ # dependencies
+@@ -42,5 +42,5 @@ pkgconfig = import('pkgconfig')
+ pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
+ pkgconfig.generate(libnethogs,
+                    requires: ['libpcap'],
+-                   version: version
++                   version: meson.project_version()
+                    )
+--
+2.25.1
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-libnethogs-disabled.patch b/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-libnethogs-disabled.patch
new file mode 100644
index 0000000000..c9a7cf69d6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-libnethogs-disabled.patch
@@ -0,0 +1,38 @@
+From 5afce747f142f6df6a264ab368c99f47050d9984 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 25 Jan 2025 16:05:20 +0000
+Subject: [PATCH 2/6] meson: fix build with libnethogs disabled
+
+Fix `meson.build:43:19: ERROR: Unknown variable "libnethogs".`.
+
+While src/ has this correct, the top-level meson.build wasn't right.
+
+Upstream-Status: Backport [https://github.com/raboof/nethogs/commit/5afce747f142f6df6a264ab368c99f47050d9984]
+---
+ meson.build | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 16e61b4..8537718 100644
+--- a/meson.build
++++ b/meson.build
+@@ -38,9 +38,11 @@ subdir('src')
+ #############################
+ ## Pkgconfig definition    ##
+ #############################
+-pkgconfig = import('pkgconfig')
+-pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
+-pkgconfig.generate(libnethogs,
+-                   requires: ['libpcap'],
+-                   version: meson.project_version()
+-                   )
++if get_option('enable-libnethogs').enabled()
++  pkgconfig = import('pkgconfig')
++  pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
++  pkgconfig.generate(libnethogs,
++                     requires: ['libpcap'],
++                     version: meson.project_version()
++                     )
++endif
+--
+2.25.1
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.patch b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.patch
new file mode 100644
index 0000000000..9c92a9d835
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.patch
@@ -0,0 +1,183 @@
+From fcbde46b0082b4c571392ea9b6427f5e11941393 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 25 Jan 2025 16:06:12 +0000
+Subject: [PATCH 3/6] meson: run `meson format`
+
+Upstream-Status: Backport [https://github.com/raboof/nethogs/commit/fcbde46b0082b4c571392ea9b6427f5e11941393]
+---
+ meson.build     | 34 +++++++++----------
+ src/meson.build | 87 ++++++++++++++++++++++---------------------------
+ 2 files changed, 54 insertions(+), 67 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 8537718..eb9f16e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2,12 +2,12 @@
+ # See COPYING for more information about licensing
+ #
+
+-project('nethogs',
+-        ['c', 'cpp'],
+-        default_options : ['warning_level=3',
+-                           'cpp_std=c++14'],
+-        version : run_command('./determineVersion.sh').stdout().strip(),
+-        )
++project(
++    'nethogs',
++    ['c', 'cpp'],
++    default_options: ['warning_level=3', 'cpp_std=c++14'],
++    version: run_command('./determineVersion.sh').stdout().strip(),
++)
+
+ cc = meson.get_compiler('cpp')
+
+@@ -18,17 +18,12 @@ cc = meson.get_compiler('cpp')
+ projectinc = [include_directories('.', 'src')]
+
+ # flags
+-c_args = [
+-  '-DVERSION="' + meson.project_version() + '"'
+-]
++c_args = ['-DVERSION="' + meson.project_version() + '"']
+
+ # dependencies
+ thread_dep = dependency('threads', required: true)
+ libpcap_dep = dependency('libpcap', required: true)
+-project_deps = [
+-  thread_dep,
+-  libpcap_dep
+-]
++project_deps = [thread_dep, libpcap_dep]
+
+ #############################
+ ## Code Compilation        ##
+@@ -39,10 +34,11 @@ subdir('src')
+ ## Pkgconfig definition    ##
+ #############################
+ if get_option('enable-libnethogs').enabled()
+-  pkgconfig = import('pkgconfig')
+-  pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
+-  pkgconfig.generate(libnethogs,
+-                     requires: ['libpcap'],
+-                     version: meson.project_version()
+-                     )
++    pkgconfig = import('pkgconfig')
++    pkgconfig_install_dir = join_paths(get_option('libdir'), 'pkgconfig')
++    pkgconfig.generate(
++        libnethogs,
++        requires: ['libpcap'],
++        version: meson.project_version(),
++    )
+ endif
+diff --git a/src/meson.build b/src/meson.build
+index 03f1b58..1329df4 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -3,65 +3,56 @@
+ #
+
+ sources = [
+-  files([
+-    'connection.cpp',
+-    'conninode.cpp',
+-    'decpcap.c',
+-    'devices.cpp',
+-    'inode2prog.cpp',
+-    'packet.cpp',
+-    'process.cpp',
+-  ])
++    files(
++        'connection.cpp',
++        'conninode.cpp',
++        'decpcap.c',
++        'devices.cpp',
++        'inode2prog.cpp',
++        'packet.cpp',
++        'process.cpp',
++    ),
+ ]
+
+ # --- Executable Compilation ---
+
+ if get_option('enable-nethogs-app').enabled()
+-  app_sources = [
+-    files([
+-      'main.cpp',
+-      'cui.cpp',
+-    ])
+-  ]
+-
+-  cursespp_dep = dependency('ncurses++', required: true)
+-  curses_dep = dependency('ncurses', required: true)
+-
+-  executable('nethogs',
+-    [app_sources + sources],
+-    include_directories: [projectinc],
+-    cpp_args: c_args,
+-    c_args: c_args,
+-    install: true,
+-    dependencies : [project_deps, cursespp_dep, curses_dep]
+-  )
++    app_sources = [files('cui.cpp', 'main.cpp')]
++
++    cursespp_dep = dependency('ncurses++', required: true)
++    curses_dep = dependency('ncurses', required: true)
++
++    executable(
++        'nethogs',
++        [app_sources + sources],
++        include_directories: [projectinc],
++        cpp_args: c_args,
++        c_args: c_args,
++        install: true,
++        dependencies: [project_deps, cursespp_dep, curses_dep],
++    )
+ endif
+
+ # --- Library Compilation ---
+
+ if get_option('enable-libnethogs').enabled()
+-  lib_sources = [
+-    files([
+-      'libnethogs.cpp',
+-    ])
+-  ]
++    lib_sources = [files('libnethogs.cpp')]
++
++    libnethogs = shared_library(
++        'libnethogs' ,
++        sources + lib_sources,
++        cpp_args: c_args,
++        c_args: c_args,
++        install: true,
++        soversion: meson.project_version(),
++        include_directories: [projectinc],
++        dependencies: [project_deps],
++    )
+
+-  libnethogs = shared_library('libnethogs' ,
+-    sources + lib_sources,
+-    cpp_args: c_args,
+-    c_args: c_args,
+-    install: true,
+-    soversion: meson.project_version(),
+-    include_directories: [projectinc],
+-    dependencies: [project_deps]
+-  )
+-
+-  libnethogs_dep = declare_dependency(link_with: libnethogs)
++    libnethogs_dep = declare_dependency(link_with: libnethogs)
+
+-  # --- Header Installation ---
++    # --- Header Installation ---
+
+-  lib_headers = [
+-    files('libnethogs.h'),
+-  ]
+-  install_headers(lib_headers, subdir : 'libnethogs')
++    lib_headers = [files('libnethogs.h')]
++    install_headers(lib_headers, subdir: 'libnethogs')
+ endif
+--
+2.25.1
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.patch b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.patch
new file mode 100644
index 0000000000..cc69a66748
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.patch
@@ -0,0 +1,25 @@
+From ba25a64dcd35f4a58c4d397160e90560e9851c79 Mon Sep 17 00:00:00 2001
+From: CAB233 <yidaduizuoye@outlook.com>
+Date: Mon, 24 Feb 2025 20:06:52 +0800
+Subject: [PATCH 4/6] meson: fix library name
+
+Upstream-Status: Backport [https://github.com/raboof/nethogs/commit/ba25a64dcd35f4a58c4d397160e90560e9851c79]
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 1329df4..7f6dcba 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -39,7 +39,7 @@ if get_option('enable-libnethogs').enabled()
+     lib_sources = [files('libnethogs.cpp')]
+
+     libnethogs = shared_library(
+-        'libnethogs' ,
++        'nethogs' ,
+         sources + lib_sources,
+         cpp_args: c_args,
+         c_args: c_args,
+--
+2.25.1
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch b/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
new file mode 100644
index 0000000000..553b382a66
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
@@ -0,0 +1,25 @@
+From 42e7950db8e412160e3f1f74b6cbc7298714c587 Mon Sep 17 00:00:00 2001
+From: Matheus Polkorny <mpolkorny@ipt.br>
+Date: Tue, 25 Mar 2025 00:47:04 -0300
+Subject: [PATCH 5/6] Add security flags to LDFLAGS for Linux
+
+Upstream-Status: Backport [https://github.com/raboof/nethogs/commit/42e7950db8e412160e3f1f74b6cbc7298714c587]
+---
+ src/MakeLib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/MakeLib.mk b/src/MakeLib.mk
+index 96ba694..1be0361 100644
+--- a/src/MakeLib.mk
++++ b/src/MakeLib.mk
+@@ -10,7 +10,7 @@ all: $(LIBNAME) libnethogs.a
+
+ UNAME_S := $(shell uname -s)
+ ifeq ($(UNAME_S),Linux)
+-  LDFLAGS:= -shared -Wl,-soname,$(SO_NAME)
++  LDFLAGS:= -shared -Wl,-soname,$(SO_NAME) -Wl,-z,now -Wl,-z,relro
+ else ifeq ($(UNAME_S),FreeBSD)
+   LDFLAGS:= -shared -Wl,-soname,$(SO_NAME)
+ else
+--
+2.25.1
diff --git a/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch b/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch
new file mode 100644
index 0000000000..485d476c50
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch
@@ -0,0 +1,30 @@
+From 1407f83485c31cd6f29614402bb2a3e912a3dd34 Mon Sep 17 00:00:00 2001
+From: Matheus Polkorny <mpolkorny@ipt.br>
+Date: Tue, 25 Mar 2025 00:48:20 -0300
+Subject: [PATCH 6/6] Include $(CPPFLAGS) for devices.cpp and libnethogs.cpp
+
+Upstream-Status: Backport [https://github.com/raboof/nethogs/commit/1407f83485c31cd6f29614402bb2a3e912a3dd34]
+---
+ src/MakeLib.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/MakeLib.mk b/src/MakeLib.mk
+index 1be0361..513096e 100644
+--- a/src/MakeLib.mk
++++ b/src/MakeLib.mk
+@@ -97,11 +97,11 @@ $(ODIR)/conninode.o: conninode.cpp nethogs.h conninode.h
+
+ $(ODIR)/devices.o: devices.cpp devices.h
+	@mkdir -p $(ODIR)
+-	$(CXX) $(CXXFLAGS) -o $@ -c devices.cpp
++	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c devices.cpp
+
+ $(ODIR)/libnethogs.o: libnethogs.cpp libnethogs.h
+	@mkdir -p $(ODIR)
+-	$(CXX) $(CXXFLAGS) -o $@ -c libnethogs.cpp -DVERSION=\"$(LIBVERSION)\"
++	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c libnethogs.cpp -DVERSION=\"$(LIBVERSION)\"
+
+ .PHONY: clean
+ clean:
+--
+2.25.1
diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
new file mode 100644
index 0000000000..816cd9c542
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "NetHogs is a small 'net top' tool that can group bandwidth by process"
+HOMEPAGE = "https://github.com/raboof/nethogs"
+SECTION = "console/network"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/raboof/nethogs.git;branch=main;protocol=https \
+           file://0001-meson-cleanup-version-detection.patch \
+           file://0002-meson-fix-build-with-libnethogs-disabled.patch \
+           file://0003-meson-run-meson-format.patch \
+           file://0004-meson-fix-library-name.patch \
+           file://0005-Add-security-flags-to-LDFLAGS-for-Linux.patch \
+           file://0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch \
+           "
+
+DEPENDS = "ncurses libpcap"
+
+inherit meson pkgconfig
+
+SRCREV = "632a78846eb3cc3259dc45c59a47fa9c293a2831"
+PV = "0.8.8+git"
-- 
2.25.1


