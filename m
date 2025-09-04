Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2BECA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:21:39 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.35767.1756981291531714273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id 85022382FA
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 12:21:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.163.17]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uu75s-2BW5Mf0; Thu, 4 Sep 2025 12:21:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][RFC][PATCHv2] gtk4: update 4.18.6 -> 4.20.0
Date: Thu,  4 Sep 2025 12:21:19 +0200
Message-ID: <20250904102119.18777-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1756981288-FF7FD9EC-14551D7A/0/0 CLEAN NORMAL
X-TOI-MSGID: d636fba4-cca5-4841-adea-02b4227132dd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 10:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222912

Changelog: [https://gitlab.gnome.org/GNOME/gtk/-/blob/71926a295583bc44c1c=
52c4d7b74f375381d68b2/NEWS]

- add bash-completion to FILES to avoid an installed-vs-shipped issue
- remove gtk4-printbackend-cups package

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.0.bb}           | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.0.bb} (91%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.20.0.bb
similarity index 91%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
index 2d24468dcc..89ddf705d3 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
@@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc=
03cc7becefffd0fa"
+SRC_URI[sha256sum] =3D "79e51e62f7f0cff32904569b0cebc96297d0ebfafa6de817=
2073c69ce0391a98"
=20
 S =3D "${UNPACKDIR}/gtk-${PV}"
=20
@@ -69,7 +69,7 @@ PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('=
DISTRO_FEATURES', 'x11', d)
 PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-sp=
i2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr li=
bxrender libxcomposite libxfixes xinerama"
 PACKAGECONFIG[wayland] =3D "-Dwayland-backend=3Dtrue,-Dwayland-backend=3D=
false,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-nati=
ve"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Denabled,-Dcloudpro=
viders=3Ddisabled,libcloudproviders"
-PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups,cups gtk4-printbackend-cups"
+PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups,cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
 # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
@@ -84,6 +84,7 @@ CFLAGS +=3D "-Wno-error=3Dint-conversion"
 LIBV =3D "4.0.0"
=20
 FILES:${PN}:append =3D " \
+    ${datadir}/bash-completion \
     ${datadir}/glib-2.0/schemas/ \
     ${datadir}/gtk-4.0/emoji/ \
     ${datadir}/metainfo/ \
@@ -121,15 +122,9 @@ RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
 RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland"=
, "wayland-protocols", "", d)}"
=20
-PACKAGES_DYNAMIC +=3D "^gtk4-printbackend-.*"
 python populate_packages:prepend () {
     import os.path
=20
-    gtk_libdir =3D d.expand('${libdir}/gtk-4.0/${LIBV}')
-    printmodules_root =3D os.path.join(gtk_libdir, 'printbackends');
-
-    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$=
', 'gtk4-printbackend-%s', 'GTK printbackend module for %s')
-
     if (d.getVar('DEBIAN_NAMES')):
         d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
 }
--=20
2.50.1


