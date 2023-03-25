Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B58C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 00:50:08 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.13193.1679705403097902003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 17:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id D2B1F19E92
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 01:48:55 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfs5N-20zHGA0; Sat, 25 Mar 2023 01:48:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 6/7] epiphany: update 43.1 -> 44.0
Date: Sat, 25 Mar 2023 01:48:17 +0100
Message-Id: <20230325004818.2784943-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325004818.2784943-1-f_l_k@t-online.de>
References: <20230325004818.2784943-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679705325-E67FBC37-CFD57887/0/0 CLEAN NORMAL
X-TOI-MSGID: f255c657-c630-4219-a16f-6155cb12efac
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 00:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179086

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{epiphany_43.1.bb =3D> epiphany_44.0.bb}    | 37 +++++++++++--------
 1 file changed, 22 insertions(+), 15 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_43.1.bb =3D> epiphany_44.0.=
bb} (72%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-=
gnome/epiphany/epiphany_44.0.bb
similarity index 72%
rename from meta/recipes-gnome/epiphany/epiphany_43.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_44.0.bb
index ea22723a97..f10b818a06 100644
--- a/meta/recipes-gnome/epiphany/epiphany_43.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_44.0.bb
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
@@ -31,7 +38,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.tri=
m_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "e86ead27cb9982815150664de3bf20faf375f77b=
8065b02b31180c65b6bbebb4"
+SRC_URI[archive.sha256sum] =3D "aabdc9de80c409073676e00e15ba97187715e4b8=
4bc776fe86db86d0f8140bb1"
=20
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_m=
ode=3Dfalse"
--=20
2.34.1


