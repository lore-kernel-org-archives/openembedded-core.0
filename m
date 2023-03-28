Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07BFC77B61
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:32:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.62746.1679999556427229838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 03:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout01.t-online.de (Postfix) with SMTP id EBD691A11E
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 12:32:32 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.166]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph6cy-17U9EW0; Tue, 28 Mar 2023 12:32:32 +0200
From: Markus Volk <f_L_K@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv5 8/8] epiphany: update 43.1 -> 44.0
Date: Tue, 28 Mar 2023 12:31:44 +0200
Message-Id: <20230328103144.5757-8-f_L_K@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328103144.5757-1-f_L_K@t-online.de>
References: <20230328103144.5757-1-f_L_K@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679999552-8556AC08-8FC3BD3E/0/0 CLEAN NORMAL
X-TOI-MSGID: 7d2bdd8b-38e9-4834-896d-1a2a760d4c32
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 10:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179225

From: Markus Volk <f_l_k@t-online.de>

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


