Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F57EC2BA1B
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:27:18 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.8922.1741850829177756303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 1B8A6880
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:27:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tscyA-466q6F0; Thu, 13 Mar 2025 08:27:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][gnome48][oe-core][PATCH 3/4] gsettings-desktop-schemas: update 47.1 -> 48.rc
Date: Thu, 13 Mar 2025 08:27:36 +0100
Message-ID: <20250313072742.4636-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313072742.4636-1-f_l_k@t-online.de>
References: <20250313072742.4636-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741850826-817F844E-827A2E20/0/0 CLEAN NORMAL
X-TOI-MSGID: d3ce6b2f-104b-4750-99f2-2ffddcd77c50
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212736

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
 ...sktop-schemas_47.1.bb =3D> gsettings-desktop-schemas_48.rc.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-s=
chemas_47.1.bb =3D> gsettings-desktop-schemas_48.rc.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_47.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_48.rc.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_47.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-=
schemas_48.rc.bb
index 3368443c25..d847c02a43 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_47.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_48.rc.bb
@@ -11,4 +11,4 @@ DEPENDS =3D "glib-2.0"
=20
 inherit gnomebase gsettings gobject-introspection gettext
=20
-SRC_URI[archive.sha256sum] =3D "a60204d9c9c0a1b264d6d0d134a38340ba5fc607=
6a34b84da945d8bfcc7a2815"
+SRC_URI[archive.sha256sum] =3D "2d26b05d997723f67f3be052622923d83acd04cc=
bbaf01b80668a5a0249aca67"
--=20
2.48.1


