Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0600C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:30:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.8225.1647945013717273246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=HWO3sAza;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945012; i=@fujitsu.com;
	bh=DSyCVgGDWvjLVP67X1BOWK/9KIIWrxx8H/aeqMDItJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=HWO3sAzabwZgv4bgLjvSbn7KKMsfTF5hDn0kp2ysdItz9iNQ6GxD9TN5Qe12RZrmY
	 qaSSt9MXWB3c5x5xDrgg3zh4rHfBe411FaarNEpdybonDH1fPWiP/Gy0LdM959agit
	 3phW6je7vKBd/Bz7IrlJemygqVudcUnX85A8iEW//v0W/P9N2XNJABjD1yioQUJLGM
	 WGNkIBoN628JaTXO4101rbcGk3CeFcRH2telE3W3B/qUMwpPuzwYyGM3P35iEmgKPg
	 uvUzzRX9M6NnxIiwOHNEZ4dn4AX3D0pmQUw1AfgnWnAup6Fm8qUzcHA0FWFx1kZ1iN
	 yJmTPvIsomPRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsViZ8ORqGu81DL
  JYOFaGYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPtz+WsBdvdK97t3svWwLjYtouRi0NI4DGj
  xMq/Z1ggnPNMErc+bIRy9jBKfF54lLmLkZODTUBNYvqtG6xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFvCQWrLzIBGKzCKhKzDm0mxmknFfAUWJLoyZIWEJAQWLKw/dgEzkFnCQm7LsKVi4EVP
  Jl8gpGEJtXQFDi5MwnLBDjVSW6jzxlgrDlJZq3zmaGmKMoMftyMwuEXSExa1YbE4StJnH13Cb
  mCYxCs5CMmoVk1CwkoxYwMq9itEoqykzPKMlNzMzRNTQw0DU0NNU1NtI1NNFLrNJN1Est1S1P
  LS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgM+ZRiBb4djM2rfuodYpTkYFIS5X3TapkkxJeUn
  1KZkVicEV9UmpNafIhRhoNDSYL36GKgnGBRanpqRVpmDjD+YNISHDxKIrwZ3UBp3uKCxNzizH
  SI1ClGXY79167sZRZiycvPS5US530JMkMApCijNA9uBCwVXGKUlRLmZWRgYBDiKUgtys0sQZV
  /xSjOwagkzLsNZApPZl4J3KZXQEcwAR2hz2oGckRJIkJKqoEpXrZ92akbgYdt9z7WjdL9xKCx
  rGdbEeu04xzhJ69Gbcre8/yX3XG1oJjOMoa7UdPEUx9+lDhn+T7p/tRrD2Q+8Zj9emUhwWEv7
  aG1eSFr1MHkpy+axUu+nFZ+FPWzcWfPNIvY21EbF/rMXcjJ94rre5j01KCz18Oz9otaL56uy/
  ltpffzxX5vp8ZlBa62vPJsm8aCS08+ijHIsqvNWa3yT7ktOKf0OOPRihUTTddOOjRlMZ/zc/W
  ErTePrnCterh3c/xC3onvLFUOXpI7u+yyzYbHCTMaPM7l8Ejxv7Cz8lypGq3JeOxG8q+i+Rv5
  vCJfOVYXK57JO/Ltuqx32Y+s8x/qxbZ6r9zL11iZE37/kxJLcUaioRZzUXEiALR1b/SAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1647945011!255341!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6126 invoked from network); 22 Mar 2022 10:30:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:30:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B132D10019E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:30:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3E4D8100193
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:30:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:30:01 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gobject-introspection: upgrade 1.70.0 -> 1.72.0
Date: Tue, 22 Mar 2022 18:29:44 +0800
Message-ID: <1647944984-5058-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647944984-5058-1-git-send-email-wangmy@fujitsu.com>
References: <1647944984-5058-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163536

0001-build-Avoid-the-doctemplates-hack.patch
removed since it's included in 1.72.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-build-Avoid-the-doctemplates-hack.patch | 219 ------------------
 ...0.0.bb =3D> gobject-introspection_1.72.0.bb} |   6 +-
 2 files changed, 2 insertions(+), 223 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-build-Avoid-the-doctemplates-hack.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.70.0.bb =3D> gobject-introspection_1.72.0.bb} (97%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-build-Avoid-the-doctemplates-hack.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-build-Avoid-the-doctemplates-hack.patch
deleted file mode 100644
index b7d31ccfb0..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-build-Avoid-the-doctemplates-hack.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From effb1e09dee263cdac4ec593e8caf316e6f01fe2 Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Tue, 11 Jan 2022 15:51:10 +0000
-Subject: [PATCH] build: Avoid the doctemplates hack
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-The hack that copies the doctemplates directory into the build
-directory has stopped working with newer versions of Meson; while it's
-possible to copy files, custom_target() cannot depend on a directory.
-Additionally, the dependency has always been broken.
-
-Instead, we enumerate the template files=E2=80=94after all, it's not like they
-change a lot=E2=80=94and then we list them as dependencies for the test targets.
-
-Fixes: #414
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- giscanner/doctemplates/devdocs/meson.build | 19 +++++++
- giscanner/doctemplates/mallard/meson.build | 63 ++++++++++++++++++++++
- giscanner/meson.build                      | 14 ++---
- tests/scanner/meson.build                  | 24 +++++----
- 4 files changed, 98 insertions(+), 22 deletions(-)
- create mode 100644 giscanner/doctemplates/devdocs/meson.build
- create mode 100644 giscanner/doctemplates/mallard/meson.build
-
-diff --git a/giscanner/doctemplates/devdocs/meson.build b/giscanner/doctemplates/devdocs/meson.build
-new file mode 100644
-index 00000000..2037182a
---- /dev/null
-+++ b/giscanner/doctemplates/devdocs/meson.build
-@@ -0,0 +1,19 @@
-+doc_templates +=3D files([
-+  'Gjs/_doc.tmpl',
-+  'Gjs/_index.tmpl',
-+  'Gjs/_method.tmpl',
-+  'Gjs/_methods.tmpl',
-+  'Gjs/_properties.tmpl',
-+  'Gjs/_signals.tmpl',
-+  'Gjs/_staticmethods.tmpl',
-+  'Gjs/_vfuncs.tmpl',
-+  'Gjs/base.tmpl',
-+  'Gjs/callback.tmpl',
-+  'Gjs/class.tmpl',
-+  'Gjs/default.tmpl',
-+  'Gjs/enum.tmpl',
-+  'Gjs/function.tmpl',
-+  'Gjs/interface.tmpl',
-+  'Gjs/method.tmpl',
-+  'Gjs/namespace.tmpl',
-+])
-diff --git a/giscanner/doctemplates/mallard/meson.build b/giscanner/doctemplates/mallard/meson.build
-new file mode 100644
-index 00000000..5fe4e2af
---- /dev/null
-+++ b/giscanner/doctemplates/mallard/meson.build
-@@ -0,0 +1,63 @@
-+base_templates =3D files([
-+  'base.tmpl',
-+  'class.tmpl',
-+  'namespace.tmpl',
-+])
-+
-+c_templates =3D files([
-+  'C/callback.tmpl',
-+  'C/class.tmpl',
-+  'C/constructor.tmpl',
-+  'C/default.tmpl',
-+  'C/enum.tmpl',
-+  'C/field.tmpl',
-+  'C/function.tmpl',
-+  'C/interface.tmpl',
-+  'C/method.tmpl',
-+  'C/namespace.tmpl',
-+  'C/property.tmpl',
-+  'C/record.tmpl',
-+  'C/signal.tmpl',
-+  'C/vfunc.tmpl',
-+])
-+
-+gjs_templates =3D files([
-+  'Gjs/callback.tmpl',
-+  'Gjs/class.tmpl',
-+  'Gjs/constructor.tmpl',
-+  'Gjs/default.tmpl',
-+  'Gjs/enum.tmpl',
-+  'Gjs/field.tmpl',
-+  'Gjs/function.tmpl',
-+  'Gjs/interface.tmpl',
-+  'Gjs/method.tmpl',
-+  'Gjs/namespace.tmpl',
-+  'Gjs/property.tmpl',
-+  'Gjs/record.tmpl',
-+  'Gjs/signal.tmpl',
-+  'Gjs/vfunc.tmpl',
-+])
-+
-+py_templates =3D files([
-+  'Python/callback.tmpl',
-+  'Python/class.tmpl',
-+  'Python/constructor.tmpl',
-+  'Python/default.tmpl',
-+  'Python/enum.tmpl',
-+  'Python/field.tmpl',
-+  'Python/function.tmpl',
-+  'Python/interface.tmpl',
-+  'Python/method.tmpl',
-+  'Python/namespace.tmpl',
-+  'Python/property.tmpl',
-+  'Python/record.tmpl',
-+  'Python/signal.tmpl',
-+  'Python/vfunc.tmpl',
-+])
-+
-+doc_templates +=3D [
-+  base_templates,
-+  c_templates,
-+  gjs_templates,
-+  py_templates,
-+]
-diff --git a/giscanner/meson.build b/giscanner/meson.build
-index 41edcd44..3d7dc678 100644
---- a/giscanner/meson.build
-+++ b/giscanner/meson.build
-@@ -53,17 +53,9 @@ configure_file(input : '../girepository/gdump.c',
- 
- install_subdir('doctemplates', install_dir: giscannerdir)
- 
--# XXX: this doesn't track the input, but there is nothing to copy many files
--# in meson.
--doc_templates =3D custom_target('copy-templates',
--  input : 'doctemplates',
--  output : 'doctemplates',
--  command : [
--    python, '-c',
--      'import sys, shutil;' +
--      'shutil.rmtree(sys.argv[2], ignore_errors=3DTrue);' +
--      'shutil.copytree(sys.argv[1], sys.argv[2])',
--    '@INPUT@', '@OUTPUT@'])
-+doc_templates =3D []
-+subdir('doctemplates/devdocs')
-+subdir('doctemplates/mallard')
- 
- flex =3D find_program('flex', 'win_flex')
- bison =3D find_program('bison', 'win_bison')
-diff --git a/tests/scanner/meson.build b/tests/scanner/meson.build
-index 5176b957..b81b3fd5 100644
---- a/tests/scanner/meson.build
-+++ b/tests/scanner/meson.build
-@@ -525,19 +525,26 @@ foreach gir : test_girs
- endforeach
- 
- if has_girdoctool and glib_dep.type_name() =3D=3D 'pkgconfig'
-+  doctool_env =3D environment()
-+  doctool_env.set('srcdir', meson.current_source_dir())
-+  doctool_env.set('builddir', meson.current_build_dir())
-+
-   foreach language : ['C', 'Python', 'Gjs']
-     regress_docs =3D custom_target(
-       'generate-docs-' + language,
-       input: regress_gir,
--      depends: [doc_templates],
-+      depend_files: doc_templates,
-       build_by_default: not cairo_deps_found,
-+      env: doctool_env,
-       output: 'Regress-1.0-' + language,
-       command: [
-         python, girdoctool,
-         '--add-include-path=3D' + join_paths(build_root, 'gir'),
-         '--add-include-path=3D' + meson.current_build_dir(),
-         '--language', language,
--        '@INPUT@', '-o', '@OUTPUT@'],
-+        '--templates-dir=3D' + join_paths(meson.current_source_dir(), '../../giscanner/doctemplates'),
-+        '@INPUT@', '-o', '@OUTPUT@',
-+      ],
-     )
- 
-     if cairo_deps_found
-@@ -546,10 +553,7 @@ if has_girdoctool and glib_dep.type_name() =3D=3D 'pkgconfig'
-         python,
-         args: [gi_tester, 'Regress-1.0-' + language],
-         depends: [regress_docs],
--        env: [
--          'srcdir=3D' + meson.current_source_dir(),
--          'builddir=3D' + meson.current_build_dir(),
--        ],
-+        env: doctool_env,
-       )
-     endif
-   endforeach
-@@ -557,9 +561,10 @@ if has_girdoctool and glib_dep.type_name() =3D=3D 'pkgconfig'
-   regress_sections =3D custom_target(
-     'generate-docs-sections',
-     input: regress_gir,
--    depends: [doc_templates],
-+    depend_files: [doc_templates],
-     build_by_default: not cairo_deps_found,
-     output: 'Regress-1.0-sections.txt',
-+    env: doctool_env,
-     command: [
-       python, girdoctool,
-       '--add-include-path=3D' + join_paths(build_root, 'gir'),
-@@ -574,10 +579,7 @@ if has_girdoctool and glib_dep.type_name() =3D=3D 'pkgconfig'
-       python,
-       args: [gi_tester, 'Regress-1.0-sections.txt'],
-       depends: [regress_sections],
--      env: [
--        'srcdir=3D' + meson.current_source_dir(),
--        'builddir=3D' + meson.current_build_dir(),
--      ],
-+      env: doctool_env,
-     )
-   endif
- endif
--- 
-2.20.1
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
similarity index 97%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
index fcda10bd33..39475daf2e 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb
@@ -13,11 +13,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc434e8128a68bedd59b80b2ac1eb1c4a \
                     file://girepository/giregisteredtypeinfo.c;endline=3D21;md5=3D661847611ae6979465415f31a759ba27 \
                     "
 
-SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
-           file://0001-build-Avoid-the-doctemplates-hack.patch \
-           "
+SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] =3D "902b4906e3102d17aa2fcb6dad1c19971c70f2a82a159ddc4a94df73a3cafc4a"
+SRC_URI[sha256sum] =3D "02fe8e590861d88f83060dd39cda5ccaa60b2da1d21d0f95499301b186beaabc"
 
 SRC_URI:append:class-native =3D " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.25.1


