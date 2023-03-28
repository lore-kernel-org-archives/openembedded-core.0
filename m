Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB6FC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:32:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.62747.1679999556550034105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 03:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout01.t-online.de (Postfix) with SMTP id DFFFB1A11B
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 12:32:32 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.166]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph6cx-17U9ES0; Tue, 28 Mar 2023 12:32:31 +0200
From: Markus Volk <f_L_K@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv5 4/8] gsettings-desktop-schemas: update 43.0 -> 44.0
Date: Tue, 28 Mar 2023 12:31:40 +0200
Message-Id: <20230328103144.5757-4-f_L_K@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328103144.5757-1-f_L_K@t-online.de>
References: <20230328103144.5757-1-f_L_K@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679999551-8556AC08-EBBF798D/0/0 CLEAN NORMAL
X-TOI-MSGID: 7895a6e9-0e90-4567-9e87-ebf11da8e6e4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 10:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179226

From: Markus Volk <f_l_k@t-online.de>

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


