Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902A1C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 01:19:40 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.33064.1710724775121832248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 18:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id 6393F19042
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:19:33 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm1f2-0Ujtyb0; Mon, 18 Mar 2024 02:19:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gsettings-desktop-schemas: update 45.0 -> 46.0
Date: Mon, 18 Mar 2024 02:19:51 +0100
Message-ID: <20240318011951.1860940-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710724772-FBFFC850-8EE1251B/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e95b326-76d0-47ae-acf4-9cea75adf06f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 01:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197272

Major changes in 46.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates

Major changes in 46.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Make default clock format overridable by translators
- Translation updates

Major changes in 46.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Add key to modify XKB options
- Add key to indicate whether switches should indicate
  state with shapes
- Translation updates

Major changes in 46.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Update default background file extension to jxl
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...esktop-schemas_45.0.bb =3D> gsettings-desktop-schemas_46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-s=
chemas_45.0.bb =3D> gsettings-desktop-schemas_46.0.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_45.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_46.0.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_45.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-=
schemas_46.0.bb
index 657f9d61ce..8260c3d357 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_45.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_46.0.bb
@@ -12,4 +12,4 @@ DEPENDS =3D "glib-2.0"
=20
 inherit gnomebase gsettings gobject-introspection gettext
=20
-SRC_URI[archive.sha256sum] =3D "365c8d04daf79b38c8b3dc9626349a024f9e4bef=
dd31fede74b42f7a9fbe0ae2"
+SRC_URI[archive.sha256sum] =3D "493a46a1161b6388d57aa72f632a79ce96c42d5f=
fbd1d0b00f496ec5876f8575"
--=20
2.44.0


