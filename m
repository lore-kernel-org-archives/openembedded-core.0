Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA80C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 08:58:31 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.39299.1710925105973393055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 01:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id 2AFF5232F1
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:58:24 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.101]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmrm9-2HOzGT0; Wed, 20 Mar 2024 09:58:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/2] glib-2.0: update 2.78.4 -> 2.80.0
Date: Wed, 20 Mar 2024 09:58:45 +0100
Message-ID: <20240320085846.206946-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1710925101-BEFFA917-7BD0E582/0/0 CLEAN NORMAL
X-TOI-MSGID: 5f82451e-545f-4a29-b94e-bdcd22506c65
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 08:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197350

- drop backport patches
- refresh patches

Bugs fixed:

!3940 tests: Don=E2=80=99t run check-missing-install-tag.py test under va=
lgrind (Philip Withnall)
!3946 Add missing argument placeholders to several command-line tools (Si=
mon McVittie)
!3947 docs: Fix a typo in the macros docs page (Philip Withnall)
!3951 g_warn_if_fail: Document as always evaluating expr (Simon McVittie)
!3953 docs: Specify gi-docgen as a native dependency (Bobby Rong)
!3955 docs: Fix building with docs enabled and introspection disabled (Bo=
bby Rong)
!3956 docs: Minor improvements to GSignal documentation (Philip Withnall)

Translation updates:

Basque (Asier Sarasua Garmendia)
British English (Andi Chandler, Bruce Cowan)
Chinese (China) (Luming Zh)
Czech (Daniel Rusek)
Georgian (Ekaterine Papava)
Hebrew (Yaron Shahrabani)
Hungarian (Bal=C3=A1zs =C3=9Ar)
Kazakh (Baurzhan Muftakhidinov)
Lithuanian (Aurimas =C4=8Cernius)
Norwegian Bokm=C3=A5l (Brage Fuglseth)
Persian (Danial Behzadi)
Russian (Artur S0)
Slovenian (Matej Urban=C4=8Di=C4=8D)
Spanish (Daniel Mustieles)
Swedish (Anders Jonsson)
Turkish (Sabri =C3=9Cnal)
Ukrainian (Yuri Chornoivan)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...t-write-bindir-into-pkg-config-files.patch |  28 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |   2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |   6 +-
 ...ng-about-deprecated-paths-in-schemas.patch |   2 +-
 ...-correctly-when-building-with-mingw3.patch |  20 +-
 ...deprecated-distutils-module-to-the-p.patch |  34 --
 ...ces.c-comment-out-a-build-host-only-.patch |   4 +-
 ...on-Run-atomics-test-on-clang-as-well.patch |   6 +-
 ...ot-enable-pidfd-features-on-native-g.patch |   6 +-
 ...dcode-python-path-into-various-tools.patch |   4 +-
 .../glib-2.0/glib-2.0/fix-regex.patch         |  54 ---
 .../glib-2.0/glib-2.0/memory-monitor.patch    | 361 ------------------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   8 +-
 ...{glib-2.0_2.78.4.bb =3D> glib-2.0_2.80.0.bb} |   5 +-
 14 files changed, 40 insertions(+), 500 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-=
the-deprecated-distutils-module-to-the-p.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.pa=
tch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.4.bb =3D> glib-2.0_2.80=
.0.bb} (90%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir=
-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-D=
o-not-write-bindir-into-pkg-config-files.patch
index 8e6598fbef..88e5c26975 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-p=
kg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-p=
kg-config-files.patch
@@ -1,4 +1,4 @@
-From e7077aa23bfcd31a8e72e39dc93ce4f854678376 Mon Sep 17 00:00:00 2001
+From 5a01316dd394f5d0d55639766c78ec54b0d2b24c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
@@ -10,17 +10,17 @@ rather than use target paths).
 Upstream-Status: Inappropriate [upstream wants the paths in .pc files]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- gio/meson.build  | 16 ++++++++--------
- glib/meson.build |  6 +++---
- 2 files changed, 11 insertions(+), 11 deletions(-)
+ gio/meson.build  | 8 --------
+ glib/meson.build | 6 +++---
+ 2 files changed, 3 insertions(+), 11 deletions(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index 5f91586..1a95f4f 100644
+index 77cba7b..72cd71c 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -884,14 +884,14 @@ pkg.generate(libgio,
+@@ -886,14 +886,6 @@ pkg.generate(libgio,
+     'schemasdir=3D' + '${datadir}' / schemas_subdir,
      'dtdsdir=3D' + '${datadir}' / dtds_subdir,
-     'bindir=3D' + '${prefix}' / get_option('bindir'),
      'giomoduledir=3D' + pkgconfig_giomodulesdir,
 -    'gio=3D' + '${bindir}' / 'gio',
 -    'gio_querymodules=3D' + pkgconfig_multiarch_bindir / 'gio-querymodu=
les',
@@ -30,25 +30,17 @@ index 5f91586..1a95f4f 100644
 -    'gdbus_codegen=3D' + '${bindir}' / 'gdbus-codegen',
 -    'gresource=3D' + '${bindir}' / 'gresource',
 -    'gsettings=3D' + '${bindir}' / 'gsettings',
-+    'gio=3Dgio',
-+    'gio_querymodules=3Dgio-querymodules',
-+    'glib_compile_schemas=3Dglib-compile-schemas',
-+    'glib_compile_resources=3Dglib-compile-resources',
-+    'gdbus=3Dgdbus',
-+    'gdbus_codegen=3Dgdbus-codegen',
-+    'gresource=3Dgresource',
-+    'gsettings=3Dgsettings',
    ],
    version : glib_version,
    install_dir : glib_pkgconfigreldir,
 diff --git a/glib/meson.build b/glib/meson.build
-index c26a35e..1d8ca6b 100644
+index d2efeba..fdc6a2d 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
 @@ -447,9 +447,9 @@ pkg.generate(libglib,
+   subdirs : ['glib-2.0'],
+   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : [
-     'bindir=3D' + '${prefix}' / get_option('bindir'),
-     'datadir=3D' + '${prefix}' / get_option('datadir'),
 -    'glib_genmarshal=3D' + '${bindir}' / 'glib-genmarshal',
 -    'gobject_query=3D' + '${bindir}' / 'gobject-query',
 -    'glib_mkenums=3D' + '${bindir}' / 'glib-mkenums',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-=
uclibc-Linux.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIR=
NAME-on-uclibc-Linux.patch
index eb9dfdbcf9..d980920de4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-=
Linux.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-=
Linux.patch
@@ -1,4 +1,4 @@
-From 9a5d4bf65b658d744d610ee27ecd2ae65b14b158 Mon Sep 17 00:00:00 2001
+From ce25443337f2e8901914813b391e112007c343a5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymo=
dules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001=
-Install-gio-querymodules-as-libexec_PROGRAM.patch
index ad69f7ec65..911cb39930 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-a=
s-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-a=
s-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 4933aef791857a5aac650b60af800778658b875b Mon Sep 17 00:00:00 2001
+From 69df1633a21f25f1b3521427471c332148590732 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index f9fdf6e..5f91586 100644
+index 59c2b0f..77cba7b 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1005,6 +1005,7 @@ gio_querymodules =3D executable('gio-querymodules'=
, 'gio-querymodules.c', 'giomodu
+@@ -1007,6 +1007,7 @@ gio_querymodules =3D executable('gio-querymodules'=
, 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-=
about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 0e3a62af6a..36cfd7041c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-d=
eprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-d=
eprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 8ae2e9c2a04e089306693a021149dc6b7d1bd679 Mon Sep 17 00:00:00 2001
+From 7f17b47948f3778fd71e03186dda443a73927a60 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-co=
rrectly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index 32b4cea409..15a8a268d2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly=
-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly=
-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From c0733f7a91dfe13152abc60c5a3064456b3e9d63 Mon Sep 17 00:00:00 2001
+From 540ec8e882f38a7d7748b2f0ced50cc66467dc9a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  3 files changed, 8 insertions(+), 5 deletions(-)
=20
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 4ef3343..e498e7e 100644
+index 232ecca..563298b 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
 @@ -29,7 +29,7 @@ endif
@@ -24,16 +24,16 @@ index 4ef3343..e498e7e 100644
    common_gio_tests_deps +=3D [iphlpapi_dep, winsock2, cc.find_library (=
'secur32')]
  endif
 =20
-@@ -230,7 +230,7 @@ if have_dbus_daemon
+@@ -244,7 +244,7 @@ if have_dbus_daemon
  endif
 =20
  #  Test programs buildable on UNIX only
 -if host_machine.system() !=3D 'windows'
 +if host_system !=3D 'windows'
    gio_tests +=3D {
-     'file' : {},
-     'gdbus-peer-object-manager' : {},
-@@ -562,7 +562,7 @@ if host_machine.system() !=3D 'windows'
+     'file' : {
+       # FIXME: https://gitlab.gnome.org/GNOME/glib/-/issues/3148
+@@ -593,7 +593,7 @@ if host_machine.system() !=3D 'windows'
  endif # unix
 =20
  #  Test programs buildable on Windows only
@@ -42,7 +42,7 @@ index 4ef3343..e498e7e 100644
    gio_tests +=3D {'win32-streams' : {}}
  endif
 =20
-@@ -632,7 +632,7 @@ if cc.get_id() !=3D 'msvc' and cc.get_id() !=3D 'cla=
ng-cl'
+@@ -663,7 +663,7 @@ if cc.get_id() !=3D 'msvc' and cc.get_id() !=3D 'cla=
ng-cl'
    }
  endif
 =20
@@ -52,10 +52,10 @@ index 4ef3343..e498e7e 100644
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index d80c86e..5329cda 100644
+index f6efc59..83eb5a5 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -216,7 +216,7 @@ if glib_conf.has('HAVE_EVENTFD')
+@@ -226,7 +226,7 @@ if glib_conf.has('HAVE_EVENTFD')
    }
  endif
 =20
@@ -65,7 +65,7 @@ index d80c86e..5329cda 100644
      glib_tests +=3D {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index 813c9b7..6ee775e 100644
+index 7534542..2560686 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -54,6 +54,9 @@ else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-dep=
recated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
deleted file mode 100644
index b11c283e6d..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated=
-distutils-module-to-the-p.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a8eb944a10353403241608a084787f6efcbb2eb7 Mon Sep 17 00:00:00 2001
-From: Jordan Williams <jordan@jwillikers.com>
-Date: Fri, 1 Dec 2023 09:53:50 -0600
-Subject: [PATCH] Switch from the deprecated distutils module to the pack=
aging
- module
-
-The distutils module was removed in Python 3.12.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
6ef967a0f930ce37a8c9b5aff969693b34714291]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- gio/gdbus-2.0/codegen/utils.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codegen/util=
s.py
-index 0204610..08f1ba9 100644
---- a/gio/gdbus-2.0/codegen/utils.py
-+++ b/gio/gdbus-2.0/codegen/utils.py
-@@ -19,7 +19,7 @@
- #
- # Author: David Zeuthen <davidz@redhat.com>
-=20
--import distutils.version
-+import packaging.version
- import os
- import sys
-=20
-@@ -166,4 +166,4 @@ def version_cmp_key(key):
-         v =3D str(key[0])
-     else:
-         v =3D "0"
--    return (distutils.version.LooseVersion(v), key[1])
-+    return (packaging.version.Version(v), key[1])
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources=
.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index aee2986033..73fbbf185c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comm=
ent-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comm=
ent-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 878e51f82100c698236fda0e069e14ea9249350c Mon Sep 17 00:00:00 2001
+From 5e9f6696467e9421564307bff0e72d7da31364fb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only te=
st
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gio/tests/resources.c b/gio/tests/resources.c
-index f567914..b21b616 100644
+index f7dc039..f708876 100644
 --- a/gio/tests/resources.c
 +++ b/gio/tests/resources.c
 @@ -1068,7 +1068,7 @@ main (int   argc,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-t=
est-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-mes=
on-Run-atomics-test-on-clang-as-well.patch
index 0b10269114..f128356d7b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-=
clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-=
clang-as-well.patch
@@ -1,4 +1,4 @@
-From b4b523160ef550a53705fcc45ac6e10d086ce491 Mon Sep 17 00:00:00 2001
+From 5c97aa3a100ab04112e0573f36b790eae41818e5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 6ee775e..8bc5fa7 100644
+index 2560686..5c46d0b 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1938,7 +1938,7 @@ atomicdefine =3D '''
+@@ -2024,7 +2024,7 @@ atomicdefine =3D '''
  # We know that we can always use real ("lock free") atomic operations w=
ith MSVC
  if cc.get_id() =3D=3D 'msvc' or cc.get_id() =3D=3D 'clang-cl' or cc.lin=
ks(atomictest, name : 'atomic ops')
    have_atomic_lock_free =3D true
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-=
enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 14dcb278e0..3274a8190e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-=
pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-=
pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 294f3e6e9a0a9f4733e85ed6810d1b743055370b Mon Sep 17 00:00:00 2001
+From 3689e31e27d96a94455c5de2feebec1eba25770b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native gli=
b
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 8bc5fa7..df1fa60 100644
+index 5c46d0b..222c1a1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1022,7 +1022,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-pyt=
hon-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0=
010-Do-not-hardcode-python-path-into-various-tools.patch
index 6dff5179c7..dd35728a2a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-pat=
h-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-pat=
h-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 50636758c73e5e61212a8f801c6c602b8aab5ba7 Mon Sep 17 00:00:00 2001
+From c3f196e8f3616502d2ae6dc63ceab10fa3b05215 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -32,7 +32,7 @@ index aa5af43..56e8e2e 100755
  # pylint: disable=3Dtoo-many-lines, missing-docstring, invalid-name
 =20
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index 353e53a..8ed6c39 100755
+index e10b910..4b619f8 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch b/meta/r=
ecipes-core/glib-2.0/glib-2.0/fix-regex.patch
deleted file mode 100644
index bdfbd55899..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From cce3ae98a2c1966719daabff5a4ec6cf94a846f6 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Mon, 26 Feb 2024 16:55:44 +0000
-Subject: [PATCH] tests: Remove variable-length lookbehind tests for GReg=
ex
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-PCRE2 10.43 has now introduced support for variable-length lookbehind,
-so these tests now fail if GLib is built against PCRE2 10.43 or higher.
-
-See
-https://github.com/PCRE2Project/pcre2/blob/e8db6fa7137f4c6f66cb87e0a3c94=
67252ec1ef7/ChangeLog#L94.
-
-Rather than making the tests conditional on the version of PCRE2 in use,
-just remove them. They are mostly testing the PCRE2 code rather than
-any code in GLib, so don=C3=A2=E2=82=AC=E2=84=A2t have much value.
-
-This should fix CI runs on msys2-mingw32, which updated to PCRE2 10.43 2
-days ago.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
cce3ae98a2c1966719daabff5a4ec6cf94a846f6]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- glib/tests/regex.c | 10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/glib/tests/regex.c b/glib/tests/regex.c
-index 1082526292..d7a698ec67 100644
---- a/glib/tests/regex.c
-+++ b/glib/tests/regex.c
-@@ -1885,16 +1885,6 @@ test_lookbehind (void)
-   g_match_info_free (match);
-   g_regex_unref (regex);
-=20
--  regex =3D g_regex_new ("(?<!dogs?|cats?) x", G_REGEX_OPTIMIZE, G_REGE=
X_MATCH_DEFAULT, &error);
--  g_assert (regex =3D=3D NULL);
--  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH_L=
OOKBEHIND);
--  g_clear_error (&error);
--
--  regex =3D g_regex_new ("(?<=3Dab(c|de)) foo", G_REGEX_OPTIMIZE, G_REG=
EX_MATCH_DEFAULT, &error);
--  g_assert (regex =3D=3D NULL);
--  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH_L=
OOKBEHIND);
--  g_clear_error (&error);
--
-   regex =3D g_regex_new ("(?<=3Dabc|abde)foo", G_REGEX_OPTIMIZE, G_REGE=
X_MATCH_DEFAULT, &error);
-   g_assert (regex);
-   g_assert_no_error (error);
---=20
-GitLab
-
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch b/m=
eta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
deleted file mode 100644
index 4f38509da6..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
+++ /dev/null
@@ -1,361 +0,0 @@
-From ce840b6b111e1e109e511f6833d6aa419e2b723a Mon Sep 17 00:00:00 2001
-From: Philip Withnall <philip@tecnocode.co.uk>
-Date: Tue, 23 Jan 2024 11:16:52 +0000
-Subject: [PATCH] Merge branch '2887-memory-monitor-tests' into 'main'
-
-tests: Fix race condition in memory-monitor-dbus.test
-
-Closes #2887
-
-See merge request GNOME/glib!3844
-
-Hopefully these commits fix the occasional failures we've been seeing:
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15362
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- gio/tests/memory-monitor-dbus.py.in          | 64 +++++++++++++-------
- gio/tests/memory-monitor-portal.py.in        | 54 ++++++++++-------
- gio/tests/power-profile-monitor-dbus.py.in   | 35 ++++++-----
- gio/tests/power-profile-monitor-portal.py.in | 34 ++++++-----
- 4 files changed, 113 insertions(+), 74 deletions(-)
-
-diff --git a/gio/tests/memory-monitor-dbus.py.in b/gio/tests/memory-moni=
tor-dbus.py.in
-index bf32918..7aae01e 100755
---- a/gio/tests/memory-monitor-dbus.py.in
-+++ b/gio/tests/memory-monitor-dbus.py.in
-@@ -16,7 +16,6 @@ import sys
- import subprocess
- import fcntl
- import os
--import time
-=20
- import taptestrunner
-=20
-@@ -57,53 +56,74 @@ try:
-             fcntl.fcntl(self.p_mock.stdout, fcntl.F_SETFL, flags | os.O=
_NONBLOCK)
-             self.last_warning =3D -1
-             self.dbusmock =3D dbus.Interface(self.obj_lmm, dbusmock.MOC=
K_IFACE)
-+
-+            try:
-+                self.wait_for_bus_object('org.freedesktop.LowMemoryMoni=
tor',
-+                                        '/org/freedesktop/LowMemoryMoni=
tor',
-+                                        system_bus=3DTrue)
-+            except:
-+                raise
-+
-             self.memory_monitor =3D Gio.MemoryMonitor.dup_default()
-+            assert("GMemoryMonitorDBus" in str(self.memory_monitor))
-             self.memory_monitor.connect("low-memory-warning", self.memo=
ry_warning_cb)
-             self.mainloop =3D GLib.MainLoop()
-             self.main_context =3D self.mainloop.get_context()
-=20
-+            # The LowMemoryMonitor API is stateless: it doesn=E2=80=99t=
 expose any
-+            # properties, just a warning signal. Emit the signal in a l=
oop until
-+            # the GMemoryMonitor instance has initialised and synchroni=
sed to
-+            # the right state.
-+            def emit_warning(level):
-+                self.dbusmock.EmitWarning(level)
-+                return GLib.SOURCE_CONTINUE
-+
-+            idle_id =3D GLib.idle_add(emit_warning, 0)
-+            while self.last_warning !=3D 0:
-+                self.main_context.iteration(True)
-+            GLib.source_remove(idle_id)
-+
-         def tearDown(self):
-             self.p_mock.terminate()
-             self.p_mock.wait()
-=20
--        def assertEventually(self, condition, message=3DNone, timeout=3D=
50):
-+        def assertEventually(self, condition, message=3DNone, timeout=3D=
5):
-             '''Assert that condition function eventually returns True.
-=20
--            Timeout is in deciseconds, defaulting to 50 (5 seconds). me=
ssage is
-+            Timeout is in seconds, defaulting to 5 seconds. message is
-             printed on failure.
-             '''
--            while timeout >=3D 0:
--                context =3D GLib.MainContext.default()
--                while context.iteration(False):
--                    pass
--                if condition():
--                    break
--                timeout -=3D 1
--                time.sleep(0.1)
--            else:
--                self.fail(message or 'timed out waiting for ' + str(con=
dition))
-+            if not message:
-+                message =3D 'timed out waiting for ' + str(condition)
-+
-+            def timed_out_cb(message):
-+                self.fail(message)
-+                return GLib.SOURCE_REMOVE
-+
-+            timeout_source =3D GLib.timeout_source_new_seconds(timeout)
-+            timeout_source.set_callback(timed_out_cb, message)
-+            timeout_source.attach(self.main_context)
-+
-+            while not condition():
-+                self.main_context.iteration(True)
-+
-+            timeout_source.destroy()
-=20
-         def memory_warning_cb(self, monitor, level):
-+            print("Received memory warning signal, level", level)
-             self.last_warning =3D level
-             self.main_context.wakeup()
-=20
-         def test_low_memory_warning_signal(self):
-             '''LowMemoryWarning signal'''
-=20
--            # Wait 2 seconds
--            timeout =3D 2
--            while timeout > 0:
--                time.sleep(0.5)
--                timeout -=3D 0.5
--                self.main_context.iteration(False)
--
-             self.dbusmock.EmitWarning(100)
-             # Wait 2 seconds or until warning
--            self.assertEventually(lambda: self.last_warning =3D=3D 100,=
 "'100' low-memory warning not received", 20)
-+            self.assertEventually(lambda: self.last_warning =3D=3D 100,=
 "'100' low-memory warning not received", 2)
-=20
-             self.dbusmock.EmitWarning(255)
-             # Wait 2 seconds or until warning
--            self.assertEventually(lambda: self.last_warning =3D=3D 255,=
 "'255' low-memory warning not received", 20)
-+            self.assertEventually(lambda: self.last_warning =3D=3D 255,=
 "'255' low-memory warning not received", 2)
-=20
- except ImportError as e:
-     @unittest.skip("Cannot import %s" % e.name)
-diff --git a/gio/tests/memory-monitor-portal.py.in b/gio/tests/memory-mo=
nitor-portal.py.in
-index 748cee8..f570508 100755
---- a/gio/tests/memory-monitor-portal.py.in
-+++ b/gio/tests/memory-monitor-portal.py.in
-@@ -16,7 +16,6 @@ import sys
- import subprocess
- import fcntl
- import os
--import time
-=20
- import taptestrunner
-=20
-@@ -80,26 +79,44 @@ try:
-             self.mainloop =3D GLib.MainLoop()
-             self.main_context =3D self.mainloop.get_context()
-=20
-+            # The LowMemoryMonitor API is stateless: it doesn=E2=80=99t=
 expose any
-+            # properties, just a warning signal. Emit the signal in a l=
oop until
-+            # the GMemoryMonitor instance has initialised and synchroni=
sed to
-+            # the right state.
-+            def emit_warning(level):
-+                self.dbusmock.EmitWarning(level)
-+                return GLib.SOURCE_CONTINUE
-+
-+            idle_id =3D GLib.idle_add(self.emit_warning, 0)
-+            while self.last_warning !=3D 0:
-+                self.main_context.iteration(True)
-+            GLib.source_remove(idle_id)
-+
-         def tearDown(self):
-             self.p_mock.terminate()
-             self.p_mock.wait()
-=20
--        def assertEventually(self, condition, message=3DNone, timeout=3D=
50):
-+        def assertEventually(self, condition, message=3DNone, timeout=3D=
5):
-             '''Assert that condition function eventually returns True.
-=20
--            Timeout is in deciseconds, defaulting to 50 (5 seconds). me=
ssage is
-+            Timeout is in seconds, defaulting to 5 seconds. message is
-             printed on failure.
-             '''
--            while timeout >=3D 0:
--                context =3D GLib.MainContext.default()
--                while context.iteration(False):
--                    pass
--                if condition():
--                    break
--                timeout -=3D 1
--                time.sleep(0.1)
--            else:
--                self.fail(message or 'timed out waiting for ' + str(con=
dition))
-+            if not message:
-+                message =3D 'timed out waiting for ' + str(condition)
-+
-+            def timed_out_cb(message):
-+                self.fail(message)
-+                return GLib.SOURCE_REMOVE
-+
-+            timeout_source =3D GLib.timeout_source_new_seconds(timeout)
-+            timeout_source.set_callback(timed_out_cb, message)
-+            timeout_source.attach(self.main_context)
-+
-+            while not condition():
-+                self.main_context.iteration(True)
-+
-+            timeout_source.destroy()
-=20
-         def portal_memory_warning_cb(self, monitor, level):
-             self.last_warning =3D level
-@@ -108,20 +125,13 @@ try:
-         def test_low_memory_warning_portal_signal(self):
-             '''LowMemoryWarning signal'''
-=20
--            # Wait 2 seconds
--            timeout =3D 2
--            while timeout > 0:
--                time.sleep(0.5)
--                timeout -=3D 0.5
--                self.main_context.iteration(False)
--
-             self.dbusmock.EmitWarning(100)
-             # Wait 2 seconds or until warning
--            self.assertEventually(lambda: self.last_warning =3D=3D 100,=
 "'100' low-memory warning not received", 20)
-+            self.assertEventually(lambda: self.last_warning =3D=3D 100,=
 "'100' low-memory warning not received", 2)
-=20
-             self.dbusmock.EmitWarning(255)
-             # Wait 2 seconds or until warning
--            self.assertEventually(lambda: self.last_warning =3D=3D 255,=
 "'255' low-memory warning not received", 20)
-+            self.assertEventually(lambda: self.last_warning =3D=3D 255,=
 "'255' low-memory warning not received", 2)
-=20
- except ImportError as e:
-     @unittest.skip("Cannot import %s" % e.name)
-diff --git a/gio/tests/power-profile-monitor-dbus.py.in b/gio/tests/powe=
r-profile-monitor-dbus.py.in
-index 06e594f..f955afc 100755
---- a/gio/tests/power-profile-monitor-dbus.py.in
-+++ b/gio/tests/power-profile-monitor-dbus.py.in
-@@ -16,7 +16,6 @@ import sys
- import subprocess
- import fcntl
- import os
--import time
-=20
- import taptestrunner
-=20
-@@ -58,6 +57,7 @@ try:
-             self.power_saver_enabled =3D False
-             self.dbus_props =3D dbus.Interface(self.obj_ppd, dbus.PROPE=
RTIES_IFACE)
-             self.power_profile_monitor =3D Gio.PowerProfileMonitor.dup_=
default()
-+            assert("GPowerProfileMonitorDBus" in str(self.power_profile=
_monitor))
-             self.power_profile_monitor.connect("notify::power-saver-ena=
bled", self.power_saver_enabled_cb)
-             self.mainloop =3D GLib.MainLoop()
-             self.main_context =3D self.mainloop.get_context()
-@@ -66,22 +66,27 @@ try:
-             self.p_mock.terminate()
-             self.p_mock.wait()
-=20
--        def assertEventually(self, condition, message=3DNone, timeout=3D=
50):
-+        def assertEventually(self, condition, message=3DNone, timeout=3D=
5):
-             '''Assert that condition function eventually returns True.
-=20
--            Timeout is in deciseconds, defaulting to 50 (5 seconds). me=
ssage is
-+            Timeout is in seconds, defaulting to 5 seconds. message is
-             printed on failure.
-             '''
--            while timeout >=3D 0:
--                context =3D GLib.MainContext.default()
--                while context.iteration(False):
--                    pass
--                if condition():
--                    break
--                timeout -=3D 1
--                time.sleep(0.1)
--            else:
--                self.fail(message or 'timed out waiting for ' + str(con=
dition))
-+            if not message:
-+                message =3D 'timed out waiting for ' + str(condition)
-+
-+            def timed_out_cb(message):
-+                self.fail(message)
-+                return GLib.SOURCE_REMOVE
-+
-+            timeout_source =3D GLib.timeout_source_new_seconds(timeout)
-+            timeout_source.set_callback(timed_out_cb, message)
-+            timeout_source.attach(self.main_context)
-+
-+            while not condition():
-+                self.main_context.iteration(True)
-+
-+            timeout_source.destroy()
-=20
-         def power_saver_enabled_cb(self, spec, data):
-             self.power_saver_enabled =3D self.power_profile_monitor.get=
_power_saver_enabled()
-@@ -92,10 +97,10 @@ try:
-=20
-             self.assertEqual(self.power_profile_monitor.get_power_saver=
_enabled(), False)
-             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProf=
ile', dbus.String('power-saver', variant_level=3D1))
--            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 True, "power-saver didn't become enabled", 10)
-+            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 True, "power-saver didn't become enabled", 1)
-=20
-             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProf=
ile', dbus.String('balanced', variant_level=3D1))
--            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 False, "power-saver didn't become disabled", 10)
-+            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 False, "power-saver didn't become disabled", 1)
-=20
- except ImportError as e:
-     @unittest.skip("Cannot import %s" % e.name)
-diff --git a/gio/tests/power-profile-monitor-portal.py.in b/gio/tests/po=
wer-profile-monitor-portal.py.in
-index 09e9a45..ad2abf6 100755
---- a/gio/tests/power-profile-monitor-portal.py.in
-+++ b/gio/tests/power-profile-monitor-portal.py.in
-@@ -16,7 +16,6 @@ import sys
- import subprocess
- import fcntl
- import os
--import time
-=20
- import taptestrunner
-=20
-@@ -90,22 +89,27 @@ try:
-             self.p_mock.terminate()
-             self.p_mock.wait()
-=20
--        def assertEventually(self, condition, message=3DNone, timeout=3D=
50):
-+        def assertEventually(self, condition, message=3DNone, timeout=3D=
5):
-             '''Assert that condition function eventually returns True.
-=20
--            Timeout is in deciseconds, defaulting to 50 (5 seconds). me=
ssage is
-+            Timeout is in seconds, defaulting to 5 seconds. message is
-             printed on failure.
-             '''
--            while timeout >=3D 0:
--                context =3D GLib.MainContext.default()
--                while context.iteration(False):
--                    pass
--                if condition():
--                    break
--                timeout -=3D 1
--                time.sleep(0.1)
--            else:
--                self.fail(message or 'timed out waiting for ' + str(con=
dition))
-+            if not message:
-+                message =3D 'timed out waiting for ' + str(condition)
-+
-+            def timed_out_cb(message):
-+                self.fail(message)
-+                return GLib.SOURCE_REMOVE
-+
-+            timeout_source =3D GLib.timeout_source_new_seconds(timeout)
-+            timeout_source.set_callback(timed_out_cb, message)
-+            timeout_source.attach(self.main_context)
-+
-+            while not condition():
-+                self.main_context.iteration(True)
-+
-+            timeout_source.destroy()
-=20
-         def power_saver_enabled_cb(self, spec, data):
-             self.power_saver_enabled =3D self.power_profile_monitor.get=
_power_saver_enabled()
-@@ -116,10 +120,10 @@ try:
-=20
-             self.assertEqual(self.power_profile_monitor.get_power_saver=
_enabled(), False)
-             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProf=
ile', dbus.String('power-saver', variant_level=3D1))
--            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 True, "power-saver didn't become enabled", 10)
-+            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 True, "power-saver didn't become enabled", 1)
-=20
-             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProf=
ile', dbus.String('balanced', variant_level=3D1))
--            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 False, "power-saver didn't become disabled", 10)
-+            self.assertEventually(lambda: self.power_saver_enabled =3D=3D=
 False, "power-saver didn't become disabled", 1)
-=20
-         def test_power_profile_power_saver_enabled_portal_default(self)=
:
-             '''power-saver-enabled property default value'''
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b=
/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 3e79bbf679..6cc725c563 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From f40e89b3852df37959606ee13b1a14ade81fa886 Mon Sep 17 00:00:00 2001
+From a23f76fa064e7a1bba6c039172911f04339be99e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native =
builds
@@ -18,10 +18,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.c=
om>
  1 file changed, 7 deletions(-)
=20
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 17fabe6..8021208 100644
+index 1e14955..3c09bb5 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1271,11 +1271,6 @@ get_gio_module_dir (void)
+@@ -1259,11 +1259,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
        module_dir =3D g_strdup (GIO_MODULE_DIR);
@@ -33,7 +33,7 @@ index 17fabe6..8021208 100644
  #include <dlfcn.h>
        {
          g_autofree gchar *path =3D NULL;
-@@ -1294,8 +1289,6 @@ get_gio_module_dir (void)
+@@ -1282,8 +1277,6 @@ get_gio_module_dir (void)
                }
            }
        }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.80.0.bb
similarity index 90%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
index f0fd057be7..8f97e07c4b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
@@ -14,15 +14,12 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${=
PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
-           file://0001-Switch-from-the-deprecated-distutils-module-to-th=
e-p.patch \
-           file://memory-monitor.patch \
-           file://fix-regex.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \=20
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "24b8e0672dca120cc32d394bccb85844e732e04fe75d18bb=
0573b2dbc7548f63"
+SRC_URI[sha256sum] =3D "8228a92f92a412160b139ae68b6345bd28f24434a7b5af15=
0ebe21ff587a561d"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.44.0


