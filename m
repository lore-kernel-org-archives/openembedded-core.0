Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 557D26C10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:08:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id u13-v6so5595000wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oRIjio5+v6bSW8XR2uhDPZzqvSO/1MZz7EwbT7Lp1Ks=;
	b=pUDq2JSALHWzSzxfmljV8c6BM2qI/ql0LCVJz2w1QExEW3bNsJGLJLm/rWBt9jGx2W
	v1ICy2KovzyIps500I74ZJDPx81eNNut6o3XAEXmhLsHg95dGsyeETrf9UF403Qw1LhT
	QoHFlYIXpdIHqpFDJ3zDtCFXRIlsnMuME4QcOxysQ5ITbmasErOxxfGlJpU71ldMrdvl
	mtVOiK0BMEUPMY6alKs1uenLh+JYxVa+kOHS8zeQ/7uRq3H7eUG2Y5+rNETLXW/ygGIz
	bImBS5QY5/THk2xWLv/dxbjI/InQ14Y7KTIgVTV0GPbzI+xOjUdPEAuPKIN3s0iNok0c
	dD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oRIjio5+v6bSW8XR2uhDPZzqvSO/1MZz7EwbT7Lp1Ks=;
	b=hzDPe9mxSdEB48v7wE/j/uzp2oVlznrWCgcPuVMswXxP3l0oY2hj9W+FawBzCnV54X
	dWEIYkYHJqfgiVC+3khoZBdwAdBqLR9w5vsaF5d5ZB2yHU0I1uq1whNKKXyv1JDyRjhO
	t70B0ESRl6dul6iFbNB3WSnbRiSaoDqU/wEzfx7BrCPD3Dybf9yzVTcI2PDxzBEpcM1s
	n2rQZz620+cGqKiVrt1Ahmxt32EDnkXjLa4c/zXEe7ktjjJdZBcQiPmKEKahRtra8JBE
	0+gITuLzR7mf5apxWmfJH+vUrfkmtrcIfJKOsYBELbsbGUI5tA+mz6e4CpZlnH2Ol960
	p9uA==
X-Gm-Message-State: AA+aEWa5ObgExpqHqtGbV9OBPOkZmLO6yDMp+T+tskktWo0gql3M9dIk
	6/Fxc7fekLb2H0HGdyOXj4rA+iUH
X-Google-Smtp-Source: AJdET5c3DRaD5/OnmqB5q5BhCAJk8vLoeMn8PW5pwsov/zqEJ0GNNF/3JTGBa2KC+nu1JBKlzA1RkA==
X-Received: by 2002:a1c:ad43:: with SMTP id w64mr1845334wme.32.1542640096300; 
	Mon, 19 Nov 2018 07:08:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm78042526wmf.22.2018.11.19.07.08.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:08:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 16:08:05 +0100
Message-Id: <20181119150810.94381-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] libmodulemd: add a new recipe
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
X-List-Received-Date: Mon, 19 Nov 2018 15:08:16 -0000

This is a hard requirement of the new libdnf versions.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch | 21 ++++++
 ...n.build-do-not-generate-gir-or-gtkdo.patch | 65 +++++++++++++++++++
 .../libmodulemd/libmodulemd_git.bb            | 21 ++++++
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
new file mode 100644
index 00000000000..9465c385202
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
@@ -0,0 +1,21 @@
+From 590bd5ec9f378ab727ee404bb32f615e1bbd15bf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 6 Nov 2018 13:41:29 +0100
+Subject: [PATCH] spec_tmpl.sh: use /bin/sh, not /usr/bin/sh
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ spec_tmpl.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spec_tmpl.sh b/spec_tmpl.sh
+index 45009c3..307c0c2 100755
+--- a/spec_tmpl.sh
++++ b/spec_tmpl.sh
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sh
++#!/bin/sh
+ 
+ version=$1
+ template=$2
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
new file mode 100644
index 00000000000..e94abd27c39
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
@@ -0,0 +1,65 @@
+From b6c8039afe016d25c17cdf1b2462d6a53d49fad1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 6 Nov 2018 13:43:00 +0100
+Subject: [PATCH] modulemd/v1/meson.build: do not generate gir or gtkdoc
+
+Both of these really need a configuration option.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ meson.build             |  1 -
+ modulemd/v1/meson.build | 20 --------------------
+ 2 files changed, 21 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index db7c6a1..e0ea61a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -49,7 +49,6 @@ gnome = import('gnome')
+ pkg = import('pkgconfig')
+ gobject = dependency('gobject-2.0')
+ yaml = dependency('yaml-0.1')
+-gtkdoc = dependency('gtk-doc')
+ 
+ spec_tmpl = find_program('spec_tmpl.sh')
+ 
+diff --git a/modulemd/v1/meson.build b/modulemd/v1/meson.build
+index 38e0d15..d59e519 100644
+--- a/modulemd/v1/meson.build
++++ b/modulemd/v1/meson.build
+@@ -311,19 +311,6 @@ if valgrind.found()
+           timeout : 300)
+ endif
+ 
+-gnome.generate_gir(
+-    modulemd_v1_lib,
+-    sources : modulemd_v1_srcs + modulemd_v1_hdrs,
+-    nsversion : '.'.join([libmodulemd_version_array[0], '0']),
+-    namespace : 'Modulemd',
+-    symbol_prefix : 'modulemd_',
+-    identifier_prefix : 'Modulemd',
+-    includes : [
+-        'GObject-2.0',
+-    ],
+-    install : true,
+-    )
+-
+ xcdata = configuration_data()
+ xcdata.set('VERSION', libmodulemd_version)
+ configure_file(
+@@ -339,13 +326,6 @@ configure_file(
+   configuration : cdata
+ )
+ 
+-gnome.gtkdoc(
+-    'modulemd-1.0',
+-    install_dir: 'modulemd-1.0',
+-    src_dir : './',
+-    main_xml : 'modulemd-docs.xml',
+-    install : true)
+-
+ pkg.generate(
+     libraries : modulemd_v1_lib,
+     subdirs : v1_header_path,
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
new file mode 100644
index 00000000000..556478b5b77
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "C Library for manipulating module metadata files"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
+
+SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
+           file://0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch \
+           file://0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch \
+           "
+
+PV = "1.7.0"
+SRCREV = "9af3e7b4bec2f8daaa857fa668b858e484487710"
+
+S = "${WORKDIR}/git"
+
+inherit meson
+
+EXTRA_OEMESON = "-Ddeveloper_build=false"
+
+DEPENDS += "glib-2.0 libyaml"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


