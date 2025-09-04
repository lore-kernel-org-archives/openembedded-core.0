Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCCFCA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 06:28:48 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.33177.1756967325179250339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 23:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id 1B3CEE3FB
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 08:28:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.163.17]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uu3SY-0POGzh0; Thu, 4 Sep 2025 08:28:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.18.6 -> 4.20.0
Date: Thu,  4 Sep 2025 08:28:28 +0200
Message-ID: <20250904062828.128946-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1756967318-DA7FB977-6D80AC29/0/0 CLEAN NORMAL
X-TOI-MSGID: d24a92e2-8c59-485b-87e8-f96f74bbc809
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 06:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222904

Changelog: [https://gitlab.gnome.org/GNOME/gtk/-/blob/71926a295583bc44c1c=
52c4d7b74f375381d68b2/NEWS]

- add bash-completion to FILES to avoid an installed-vs-shipped issue
- make gtk4-printbackend-cups rrecommend instead of rdepend to avoid a si=
tuation where gtk4 depends
  on itself:
  ERROR: gtk4-4.20.0-r0 do_package_qa: QA Issue: gtk4 rdepends on gtk4-pr=
intbackend-cups, but it isn't a build dependency? [build-deps]
  ERROR: gtk4-4.20.0-r0 do_package_qa: Fatal QA errors were found, failin=
g task.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.0.bb} (96%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.20.0.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.0.bb
index 2d24468dcc..f99789a9e9 100644
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
cups,cups,gtk4-printbackend-cups"
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
--=20
2.50.1


