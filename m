Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8369CE8D47
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 09:57:58 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.14668.1726826268406581707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 02:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id 96C2717D83
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 11:57:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sraOA-0C1kdV0; Fri, 20 Sep 2024 11:57:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/4] glib-2.0: update 2.80.4 -> 2.82.1
Date: Fri, 20 Sep 2024 11:58:13 +0200
Message-ID: <20240920095816.261281-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726826242-8D7F85A0-0BF5C7CE/0/0 CLEAN NORMAL
X-TOI-MSGID: 9584c368-f643-4649-9de3-9b98b858a977
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 09:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204733

- adjust 0010-Do-not-hardcode-python-path-into-various-tools.patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...010-Do-not-hardcode-python-path-into-various-tools.patch | 6 +++---
 ...lib-2.0-initial_2.80.4.bb =3D> glib-2.0-initial_2.82.1.bb} | 0
 .../glib-2.0/{glib-2.0_2.80.4.bb =3D> glib-2.0_2.82.1.bb}     | 0
 meta/recipes-core/glib-2.0/glib.inc                         | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.80.4.bb =3D> glib-=
2.0-initial_2.82.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.80.4.bb =3D> glib-2.0_2.82=
.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python=
-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do=
-not-hardcode-python-path-into-various-tools.patch
index 30a6bd4c3a..4609f1fb2b 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-i=
nto-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-i=
nto-various-tools.patch
@@ -16,7 +16,7 @@ index 67d3675..4e92a7a 100755
 --- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
 +++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
 @@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
+-#!@PYTHON@
 +#!/usr/bin/env python3
 =20
  # GDBus - GLib D-Bus Library
@@ -26,7 +26,7 @@ index aa5af43..56e8e2e 100755
 --- a/gobject/glib-genmarshal.in
 +++ b/gobject/glib-genmarshal.in
 @@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
+-#!@PYTHON@
 +#!/usr/bin/env python3
 =20
  # pylint: disable=3Dtoo-many-lines, missing-docstring, invalid-name
@@ -36,7 +36,7 @@ index e10b910..4b619f8 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
+-#!@PYTHON@
 +#!/usr/bin/env python3
 =20
  # If the code below looks horrible and unpythonic, do not panic.
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb b/meta=
/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.82.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index 9e742c4d3b..0855e6eb00 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -221,17 +221,17 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-=
${PV}.tar.xz \
            file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-sche=
mas.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch=
 \
-           file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
+           file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \=20
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "24e029c5dfc9b44e4573697adf33078a9827c48938555004=
b3b9096fa4ea034f"
+SRC_URI[sha256sum] =3D "478634440bf52ee4ec4428d558787398c0be6b043c521beb=
308334b3db4489a6"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.46.0


