Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 55E3D7C9C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:22 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n2so10792605wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K3nQ59Ktr84MpRs9I1gRrPtYkD5QZi2+Cw4w0TMLE8E=;
	b=jZAg2jYEPKCeRD1TrlOJHNIZCT0I0JiiizGE8KaF0rfs4RtX5hT+qwdAKCemIo6wkK
	Bgx+UCOxeDqEfESkkqfT0EZi+pkiMLEiwl+Xy6DqGo5SIqmZ5klpvWTG0EqQ3HZACXtU
	jRIQC32u5CnWjDZgKyCWRh7nsD2HrzvcQ/3CdbkjRwCmtqwINON+df5YGi5bUvQrb7+t
	WHE6ptOGDe+EWUnQJf5cOwk//J1Cst4Wcph0gqHT/Pok96EJnnF7L8KOzPzm/j/VmqNf
	rgnWyRcskW6oN5KOgFzR6z9c7lJkpuY0XRBKTSlW+vpE16uRSWioF0dw2NeGUTUUsYqe
	bNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K3nQ59Ktr84MpRs9I1gRrPtYkD5QZi2+Cw4w0TMLE8E=;
	b=YZhG7X4IxnHGZ7SqoFdr+21nviA5Krfyg8vcPX/3US5/mYwgMMaEfayJkJUnAibZCm
	YlYjflSE2N0Q0vyhFOBNrACYaWaxcHO1+68d2bPPJnUtJXldOslJ+hHOLdxlHTj4uBCh
	G5eHlO1WtpTauQ24hd1aCVA+sEmIQBojX1r1BcTf5Crch96i9nJiVuoGOc5OnLL7L8a1
	6MF8YwbznQtbFjwwFmfO1ib3wwiCoe53mAg4yqOQxsVWt8xRIhtKZo8Y8JG3yKDmdSA9
	YVJFJTfQhP4vhybygDxq4dZrSEVpzjLPoMFI1LNR6ErAOv4jwyKEPoj7PKaC1luZ3Oj7
	vylg==
X-Gm-Message-State: AHQUAuZ6WgoBCFiVSGEktUIOmqvsoZdr2YoZ54rtQLSw8NgHfZ4mxii1
	xPfYGLAszYkQfAVCWNI4QYXsCc00
X-Google-Smtp-Source: AHgI3IYGNruHCAqKY/wKJJSo/qSIc7QMWwuDma9j5Po7OS1tMYJGd4/ZKFwabBFYI+wG4a2FikmsXg==
X-Received: by 2002:a5d:4605:: with SMTP id t5mr21126571wrq.311.1550598442741; 
	Tue, 19 Feb 2019 09:47:22 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:46:54 +0100
Message-Id: <20190219174712.60694-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/20] libmodulemd: update to 2.1.0
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:22 -0000

Add support for gobject-introspection.

Add v2 API fixes to the gtkdoc/gi disabling patch.
Add a dependency on glib-native to allow use of glib-mkenums.

Disable v2 API/library for now as libdnf is not compatible with it,
yet is erroneously linked against it (if it's enabled).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch |  7 +-
 ...n.build-do-not-generate-gir-or-gtkdo.patch | 76 ++++++++++---------
 .../libmodulemd/libmodulemd_git.bb            | 19 +++--
 3 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
index 9465c385202..2598c177c4c 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
@@ -1,16 +1,17 @@
-From 590bd5ec9f378ab727ee404bb32f615e1bbd15bf Mon Sep 17 00:00:00 2001
+From 74ea6a665d0f3417e75f1d3d02f27a12f128ec70 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 6 Nov 2018 13:41:29 +0100
 Subject: [PATCH] spec_tmpl.sh: use /bin/sh, not /usr/bin/sh
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  spec_tmpl.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/spec_tmpl.sh b/spec_tmpl.sh
-index 45009c3..307c0c2 100755
+index 14e895a..fc80fc6 100755
 --- a/spec_tmpl.sh
 +++ b/spec_tmpl.sh
 @@ -1,4 +1,4 @@
@@ -18,4 +19,4 @@ index 45009c3..307c0c2 100755
 +#!/bin/sh
  
  version=$1
- template=$2
+ libmodulemd_v1_version=$2
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
index e94abd27c39..a3e62bf52ca 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
@@ -1,65 +1,67 @@
-From b6c8039afe016d25c17cdf1b2462d6a53d49fad1 Mon Sep 17 00:00:00 2001
+From b77c9c3d07430b014b2d1bff42027f483c81f15a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 6 Nov 2018 13:43:00 +0100
-Subject: [PATCH] modulemd/v1/meson.build: do not generate gir or gtkdoc
+Subject: [PATCH] modulemd/v[12]/meson.build: do not generate gtkdoc or python
+ bindings
 
-Both of these really need a configuration option.
+All of these really need a configuration option.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- meson.build             |  1 -
- modulemd/v1/meson.build | 20 --------------------
- 2 files changed, 21 deletions(-)
+ meson.build             | 3 +--
+ modulemd/v1/meson.build | 8 --------
+ modulemd/v2/meson.build | 8 --------
+ 3 files changed, 1 insertion(+), 18 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index db7c6a1..e0ea61a 100644
+index 228bd34..a1e60bb 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -49,7 +49,6 @@ gnome = import('gnome')
+@@ -52,7 +52,6 @@ gnome = import('gnome')
  pkg = import('pkgconfig')
  gobject = dependency('gobject-2.0')
  yaml = dependency('yaml-0.1')
 -gtkdoc = dependency('gtk-doc')
  
- spec_tmpl = find_program('spec_tmpl.sh')
+ sh = find_program('sh')
+ sed = find_program('sed')
+@@ -110,4 +109,4 @@ configure_file(
+ )
  
+ subdir('modulemd')
+-subdir('bindings/python')
++
 diff --git a/modulemd/v1/meson.build b/modulemd/v1/meson.build
-index 38e0d15..d59e519 100644
+index 74db89a..4d54e69 100644
 --- a/modulemd/v1/meson.build
 +++ b/modulemd/v1/meson.build
-@@ -311,19 +311,6 @@ if valgrind.found()
-           timeout : 300)
- endif
+@@ -341,11 +341,3 @@ configure_file(
+   configuration : xcdata
+ )
  
--gnome.generate_gir(
--    modulemd_v1_lib,
--    sources : modulemd_v1_srcs + modulemd_v1_hdrs,
--    nsversion : '.'.join([libmodulemd_version_array[0], '0']),
--    namespace : 'Modulemd',
--    symbol_prefix : 'modulemd_',
--    identifier_prefix : 'Modulemd',
--    includes : [
--        'GObject-2.0',
--    ],
+-gnome.gtkdoc(
+-    'modulemd-1.0',
+-    install_dir: 'modulemd-1.0',
+-    src_dir : './modulemd/v1',
+-    main_xml : 'modulemd-v1-docs.xml',
 -    install : true,
--    )
+-)
 -
- xcdata = configuration_data()
- xcdata.set('VERSION', libmodulemd_version)
- configure_file(
-@@ -339,13 +326,6 @@ configure_file(
-   configuration : cdata
+diff --git a/modulemd/v2/meson.build b/modulemd/v2/meson.build
+index 7b94e0c..c5f72b9 100644
+--- a/modulemd/v2/meson.build
++++ b/modulemd/v2/meson.build
+@@ -530,11 +530,3 @@ configure_file(
+   configuration : xcdata
  )
  
 -gnome.gtkdoc(
--    'modulemd-1.0',
--    install_dir: 'modulemd-1.0',
--    src_dir : './',
--    main_xml : 'modulemd-docs.xml',
--    install : true)
+-    'modulemd-2.0',
+-    install_dir: 'modulemd-2.0',
+-    src_dir : './modulemd/v2',
+-    main_xml : 'modulemd-v2-docs.xml',
+-    install : true,
+-)
 -
- pkg.generate(
-     libraries : modulemd_v1_lib,
-     subdirs : v1_header_path,
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index d9bfdc0878f..87e92114c8d 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -7,15 +7,24 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
            file://0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch \
            "
 
-PV = "1.7.0"
-SRCREV = "9af3e7b4bec2f8daaa857fa668b858e484487710"
+PV = "2.1.0"
+SRCREV = "072e6ee791fe7822a6d423bdac7e4a5cbb118bce"
 
 S = "${WORKDIR}/git"
 
-inherit meson
+inherit meson gobject-introspection
 
-EXTRA_OEMESON = "-Ddeveloper_build=false"
+EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true -Dbuild_api_v2=false"
 
-DEPENDS += "glib-2.0 libyaml"
+DEPENDS += "glib-2.0 libyaml glib-2.0-native"
 
 BBCLASSEXTEND = "native nativesdk"
+
+GI_ENABLE_FLAG = "-Dskip_introspection=false"
+GI_DISABLE_FLAG = "-Dskip_introspection=true"
+
+EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
+EXTRA_OEMESON_append_class-native = " ${GI_DISABLE_FLAG}"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
+                                                                                       '${GI_DISABLE_FLAG}', d)} "
-- 
2.17.1


