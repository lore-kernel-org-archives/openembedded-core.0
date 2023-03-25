Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F78C77B62
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 00:50:08 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.13192.1679705402531900692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 17:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id A62D519E90
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 01:48:55 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfs5N-20zHG80; Sat, 25 Mar 2023 01:48:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 4/7] gsettings-desktop-schemas: update 43.0 -> 44.0
Date: Sat, 25 Mar 2023 01:48:15 +0100
Message-Id: <20230325004818.2784943-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325004818.2784943-1-f_l_k@t-online.de>
References: <20230325004818.2784943-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679705325-E67FBC37-2EC2088C/0/0 CLEAN NORMAL
X-TOI-MSGID: 6cddf1ea-a3e5-4b4f-9e08-0b588c5b45a1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 00:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179085

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...esktop-schemas_43.0.bb =3D> gsettings-desktop-schemas_44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-s=
chemas_43.0.bb =3D> gsettings-desktop-schemas_44.0.bb} (85%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_43.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_44.0.bb
similarity index 85%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_43.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-=
schemas_44.0.bb
index 966a67fead..8e30d5e524 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_43.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_44.0.bb
@@ -13,4 +13,4 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext
=20
-SRC_URI[archive.sha256sum] =3D "5d5568282ab38b95759d425401f7476e56f8cbf2=
629885587439f43bd0b84bbe"
+SRC_URI[archive.sha256sum] =3D "eb2de45cad905994849e642a623adeb75d41b21b=
0626d40d2a07b8ea281fec0e"
--=20
2.34.1


