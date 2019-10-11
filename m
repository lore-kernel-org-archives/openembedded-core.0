Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id B465F7F598
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 3so9913862wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oU+J5M+546KI+mt6qGMGZI+1TVGVXSOTnW2SXknJbIE=;
	b=cm9/CcGdtewCKPDXsxpfxi9JZ9UJ9pr29xlWDeLdDNomh+kw1ufJY14acpGe/rns+p
	TjDC+7iVlJmH7Fgki7WU0wg4KgROhQsIfGIubXw7mjtYd3ZQ/oLr5cP5VJGEBCJg1no/
	MwJ6d6twNhQTc9q1S5584P+A6e+nNUFh6mtDOCUeo6WUPU/MbFlC4StZjxyf2u34nxEh
	GaGTgBOnwNU28dR3XehCNEVFuZzh4b4TL5OnOnENOncYv97k8OXym1ML+zPXGz7jA2VS
	A2yxZxwbwPd1LxlqX67qPHS1QnGyjP/zWjlYarSTHUhp7bHgL9bpiXDFXzq55D409pXy
	a/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oU+J5M+546KI+mt6qGMGZI+1TVGVXSOTnW2SXknJbIE=;
	b=sPAFssRqcf6/qVdwoxXJK3URhp0HEIOcMt19CSOOYsfCFoiNNx4aON523xfGEaFlYr
	R2WQZjFZFuINhNLWml6ux6ypUyA9lpDU7Kl1zHAyzpEMXLy0u64ClHWPxN3VvVmMvBAp
	VrH27PYAfHEnTjhzCYO+F1Gi2IxWA//j3b8o2OLX7RaFa/6VjnFljuXGgrudynn5yeVu
	irzERirPx5yGIUBf/Zs0aaI6INn3Gm21V6ERXbueQTqIuctlG8mQxuk1PxbMLChgCmOc
	1wvj3b7CozdjbjO04HreydUpH1LAzc56nvsDqQdHIQTXi32kEotjgEgfuoLHOvHIIbAn
	/uzA==
X-Gm-Message-State: APjAAAVevXH/izxeTW2RCnIywOsk7+kU8q0HGZXML1e+A8iRvb0sK0cT
	EgkKGjiw5HfiVXzZ3ggPpNeXHc/0
X-Google-Smtp-Source: APXvYqyd5y07gEta1kKHC2bnYAXJmMrww1lsewO4x33iwyGgTj8zssgCAEDvmh0n3XcVuGlJa2N/Qw==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr2746728wmj.22.1570794495883;
	Fri, 11 Oct 2019 04:48:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:53 +0200
Message-Id: <20191011114754.91740-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/19] libmodulemd: remove the recipe
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:16 -0000

Version 2 of the recipe is not actually required by anything; the
lidmodulemd dependency in createrepo-c is optional, and the
libmodulemd feature is not used in YP.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../createrepo-c/createrepo-c_0.15.0.bb       |  4 +-
 ...ec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch | 22 ------
 ...xplicitly-specify-the-v1-library-in-.patch | 28 --------
 ...n.build-do-not-generate-gir-or-gtkdo.patch | 71 -------------------
 .../libmodulemd/libmodulemd_git.bb            | 26 -------
 6 files changed, 2 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
 delete mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch
 delete mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
 delete mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7a9d55c5c34..d85e5b697f5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -355,7 +355,6 @@ RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libmodulemd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmodulemd-v1 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnewt-python = "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb
index ae0a35da847..dc1b851b2d7 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.0.bb
@@ -12,12 +12,12 @@ SRCREV = "2077ba104eae04bb819e9e0c906c8c835b62e7a6"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm libmodulemd"
+DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS_append_class-native = " file-replacement-native"
 
 inherit cmake pkgconfig bash-completion distutils3-base
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF -DENABLE_DRPM=OFF"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DWITH_ZCHUNK=OFF -DENABLE_DRPM=OFF -DWITH_LIBMODULEMD=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
deleted file mode 100644
index 2598c177c4c..00000000000
--- a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 74ea6a665d0f3417e75f1d3d02f27a12f128ec70 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 6 Nov 2018 13:41:29 +0100
-Subject: [PATCH] spec_tmpl.sh: use /bin/sh, not /usr/bin/sh
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- spec_tmpl.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/spec_tmpl.sh b/spec_tmpl.sh
-index 14e895a..fc80fc6 100755
---- a/spec_tmpl.sh
-+++ b/spec_tmpl.sh
-@@ -1,4 +1,4 @@
--#!/usr/bin/sh
-+#!/bin/sh
- 
- version=$1
- libmodulemd_v1_version=$2
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch
deleted file mode 100644
index 1568d25f9d8..00000000000
--- a/meta/recipes-devtools/libmodulemd/libmodulemd/0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b651551134cf170038b3e01812e3767969506491 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 21 May 2019 17:59:26 +0200
-Subject: [PATCH] v1/meson.build: explicitly specify the v1 library in
- pkgconfig
-
-Otherwise there would be '-lmodulemd' which resolves
-to v2 version if both v2 and v1 are present in the sysroot.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- modulemd/v1/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modulemd/v1/meson.build b/modulemd/v1/meson.build
-index 4d54e69..9144ca2 100644
---- a/modulemd/v1/meson.build
-+++ b/modulemd/v1/meson.build
-@@ -325,7 +325,7 @@ configure_file(
- )
- 
- pkg.generate(
--    libraries : modulemd_v1_lib,
-+    libraries : '-l:libmodulemd.so.1',
-     subdirs : v1_header_path,
-     version : libmodulemd_v1_version,
-     name : 'modulemd',
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
deleted file mode 100644
index 0b7535624c9..00000000000
--- a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 4a2a592c5a3898df37ff231d9c410f0fd32f5d5d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 6 Nov 2018 13:43:00 +0100
-Subject: [PATCH] modulemd/v[12]/meson.build: do not generate gtkdoc or python
- bindings
-
-All of these really need a configuration option.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- meson.build             |  3 +--
- modulemd/v1/meson.build |  8 --------
- modulemd/v2/meson.build | 12 ------------
- 3 files changed, 1 insertion(+), 22 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 5a0cd3d..f51b16e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -52,7 +52,6 @@ gnome = import('gnome')
- pkg = import('pkgconfig')
- gobject = dependency('gobject-2.0')
- yaml = dependency('yaml-0.1')
--gtkdoc = dependency('gtk-doc')
- 
- sh = find_program('sh')
- sed = find_program('sed')
-@@ -127,4 +126,4 @@ configure_file(
- )
- 
- subdir('modulemd')
--subdir('bindings/python')
-+
-diff --git a/modulemd/v1/meson.build b/modulemd/v1/meson.build
-index ddc95a1..e85fafd 100644
---- a/modulemd/v1/meson.build
-+++ b/modulemd/v1/meson.build
-@@ -356,11 +356,3 @@ configure_file(
-   configuration : xcdata
- )
- 
--gnome.gtkdoc(
--    'modulemd-1.0',
--    install_dir: 'modulemd-1.0',
--    src_dir : './modulemd/v1',
--    main_xml : 'modulemd-v1-docs.xml',
--    install : true,
--)
--
-diff --git a/modulemd/v2/meson.build b/modulemd/v2/meson.build
-index 93c7fbd..0d9ed24 100644
---- a/modulemd/v2/meson.build
-+++ b/modulemd/v2/meson.build
-@@ -285,15 +285,3 @@ configure_file(
-   configuration : xcdata
- )
- 
--gnome.gtkdoc(
--    'modulemd-2.0',
--    install_dir: 'modulemd-2.0',
--    src_dir : './modulemd/v2',
--    main_xml : 'modulemd-v2-docs.xml',
--    gobject_typesfile : join_paths(meson.current_build_dir(), 'modulemd-2.0.types'),
--    dependencies : [
--        modulemd_v2_dep,
--    ],
--    install : true,
--)
--
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
deleted file mode 100644
index 63d3fad6ab4..00000000000
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "C Library for manipulating module metadata files"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
-
-SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
-           file://0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch \
-           file://0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch \
-           file://0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch \
-           "
-
-PV = "2.6.0"
-SRCREV = "7c7f88258491866cdb86d26cadfce37a78f242ec"
-
-S = "${WORKDIR}/git"
-
-inherit meson gobject-introspection
-
-EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true -Dbuild_api_v2=true"
-
-DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
-
-BBCLASSEXTEND = "native nativesdk"
-
-GIR_MESON_OPTION = 'skip_introspection'
-GIR_MESON_ENABLE_FLAG = 'false'
-GIR_MESON_DISABLE_FLAG = 'true'
-- 
2.17.1


