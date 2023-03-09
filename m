Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5082C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 20:40:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.2374.1678394407864381932
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 12:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id BC12010D77
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Mar 2023 21:39:59 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.229.247]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1paN3P-0VX7jP0; Thu, 9 Mar 2023 21:39:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC][PATCH 3/6] gsettings-desktop-schemas: update 43.0 -> 44.beta
Date: Thu,  9 Mar 2023 21:39:30 +0100
Message-Id: <20230309203933.834098-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309203933.834098-1-f_l_k@t-online.de>
References: <20230309203933.834098-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678394399-B9016A74-396687E8/0/0 CLEAN NORMAL
X-TOI-MSGID: 73ccf289-0f35-4590-a170-963da726f1c5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 20:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178265

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...top-schemas_43.0.bb =3D> gsettings-desktop-schemas_44.beta.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-s=
chemas_43.0.bb =3D> gsettings-desktop-schemas_44.beta.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_43.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_44.beta.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_43.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-=
schemas_44.beta.bb
index 966a67fead..015fd66ef7 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_43.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_44.beta.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext
=20
-SRC_URI[archive.sha256sum] =3D "5d5568282ab38b95759d425401f7476e56f8cbf2=
629885587439f43bd0b84bbe"
+SRC_URI[archive.sha256sum] =3D "164ee076f42930833708678eb3181d06fe2efccb=
f944da911cc80881c3f12ad4"
--=20
2.34.1


