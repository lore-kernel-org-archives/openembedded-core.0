Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967E3C021A4
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 00:40:32 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.734.1740444028137058249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 16:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 9A61D30B
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 01:39:27 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.213]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmiyt-2aSJN60; Tue, 25 Feb 2025 01:39:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH 4/4] gsettings-desktop-schemas: update 47.1 -> 48.beta
Date: Tue, 25 Feb 2025 01:40:00 +0100
Message-ID: <20250225004000.3673-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225004000.3673-1-f_l_k@t-online.de>
References: <20250225004000.3673-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740443967-257F8681-944D0858/0/0 CLEAN NORMAL
X-TOI-MSGID: 495b246f-cbca-4c26-97de-9186b4b1ad47
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 00:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211858

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
 ...top-schemas_47.1.bb =3D> gsettings-desktop-schemas_48.beta.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-s=
chemas_47.1.bb =3D> gsettings-desktop-schemas_48.beta.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_47.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_48.beta.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_47.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-=
schemas_48.beta.bb
index 3368443c25..6eeafbe2fc 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_47.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_48.beta.bb
@@ -11,4 +11,4 @@ DEPENDS =3D "glib-2.0"
=20
 inherit gnomebase gsettings gobject-introspection gettext
=20
-SRC_URI[archive.sha256sum] =3D "a60204d9c9c0a1b264d6d0d134a38340ba5fc607=
6a34b84da945d8bfcc7a2815"
+SRC_URI[archive.sha256sum] =3D "531dc41bb5cb5ad3b51f1b9510bd5671801528e1=
0b60a6073df6b446d2648d29"
--=20
2.48.1


