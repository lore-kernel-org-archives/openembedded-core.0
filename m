Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3437C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 20:40:34 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.2340.1678394430318703365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 12:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id C114695F9
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Mar 2023 21:40:06 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.229.247]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1paN3S-0VX7jR0; Thu, 9 Mar 2023 21:40:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC][PATCH 5/6] epiphany: update 43.1 -> 44.rc
Date: Thu,  9 Mar 2023 21:39:32 +0100
Message-Id: <20230309203933.834098-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309203933.834098-1-f_l_k@t-online.de>
References: <20230309203933.834098-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678394402-A9FF6A74-F01907A3/0/0 CLEAN NORMAL
X-TOI-MSGID: c711f908-c72c-4746-b2fa-df81398a9b9a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 20:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178269

Note: Epiphany is currently broken with webkitgtk 3.9.91. This issue has =
already been fixed upstream and the fix will be
available on the next rc release.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{epiphany_43.1.bb =3D> epiphany_44.rc.bb}   | 41 +++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_43.1.bb =3D> epiphany_44.rc=
.bb} (71%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-=
gnome/epiphany/epiphany_44.rc.bb
similarity index 71%
rename from meta/recipes-gnome/epiphany/epiphany_43.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_44.rc.bb
index ea22723a97..8227524cd6 100644
--- a/meta/recipes-gnome/epiphany/epiphany_43.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_44.rc.bb
@@ -7,20 +7,27 @@ LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
 DEPENDS =3D " \
-          webkitgtk \
-          gcr3 \
-          gsettings-desktop-schemas \
-          nettle \
-          json-glib \
-          libarchive \
-          libdazzle \
-          libhandy \
-          libportal \
-          libsoup \
-          glib-2.0-native \
-          coreutils-native \
-          desktop-file-utils-native \
-          "
+	appstream-glib-native \
+	coreutils-native \
+	desktop-file-utils-native \
+	gcr \
+	glib-2.0-native \
+	gsettings-desktop-schemas \
+	gstreamer1.0 \
+	iso-codes \
+	json-glib \
+	libadwaita \
+	libarchive \
+	libdazzle \
+	libhandy \
+	libportal \
+	libsecret \
+	libsoup \
+	libxml2 \
+	nettle \
+	sqlite3 \
+	webkitgtk \
+"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cac=
he
@@ -31,10 +38,12 @@ SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.t=
rim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "e86ead27cb9982815150664de3bf20faf375f77b=
8065b02b31180c65b6bbebb4"
+SRC_URI[archive.sha256sum] =3D "df75fb535c8041bcef84d6525867d5123c39f0c6=
88503c460614cdb374e9f929"
=20
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_m=
ode=3Dfalse"
=20
 FILES:${PN} +=3D "${datadir}/dbus-1 ${datadir}/gnome-shell/search-provid=
ers ${datadir}/metainfo"
-RDEPENDS:${PN} =3D "iso-codes adwaita-icon-theme gsettings-desktop-schem=
as"
+RDEPENDS:${PN} =3D "iso-codes adwaita-icon-theme gsettings-desktop-schem=
as webkitgtk"
+
+INSANE_SKIP =3D "file-rdeps"
--=20
2.34.1


