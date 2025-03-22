Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DAFC35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 17:45:00 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.1037.1742665491283287273
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Mar 2025 10:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id A0377788
	for <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 18:44:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.42.220]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tw2ts-30qjQ10; Sat, 22 Mar 2025 18:44:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gsettings-desktop-schemas: update 47.1 -> 48.0
Date: Sat, 22 Mar 2025 18:45:34 +0100
Message-ID: <20250322174534.17865-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742665488-10BCE83B-3B332CD1/0/0 CLEAN NORMAL
X-TOI-MSGID: dfc494af-fbf6-4cfd-9e46-7f507dd43cdd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 17:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213496

This update is required for gnome-control-center-48

Major changes in 48.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
Major changes in 48.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Switch to JPEG for background image
- Translation updates
Major changes in 48.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Switch to Adwaita Fonts
- Split data recording and limits in time limits schema
- Set more useful defaults on stylus buttons
- Translation updates
Major changes in 48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Add screen limits schema
- Fix gendered language in key descriptions

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...esktop-schemas_47.1.bb =3D> gsettings-desktop-schemas_48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-s=
chemas_47.1.bb =3D> gsettings-desktop-schemas_48.0.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_47.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_48.0.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_47.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-=
schemas_48.0.bb
index 3368443c25..30ab992db4 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_47.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_48.0.bb
@@ -11,4 +11,4 @@ DEPENDS =3D "glib-2.0"
=20
 inherit gnomebase gsettings gobject-introspection gettext
=20
-SRC_URI[archive.sha256sum] =3D "a60204d9c9c0a1b264d6d0d134a38340ba5fc607=
6a34b84da945d8bfcc7a2815"
+SRC_URI[archive.sha256sum] =3D "e68f155813bf18f865a8b2c8e9d473588b6ccadc=
afbb666ab788857c6c2d1bd3"
--=20
2.48.1


