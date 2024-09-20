Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6322CE8D45
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 09:57:38 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.14434.1726826252795120695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 02:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id 9FD11103EE
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 11:57:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sraOI-0C1kdY0; Fri, 20 Sep 2024 11:57:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 4/4] gsettings-desktop-schemas: update 46.1 -> 47.1
Date: Fri, 20 Sep 2024 11:58:16 +0200
Message-ID: <20240920095816.261281-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920095816.261281-1-f_l_k@t-online.de>
References: <20240920095816.261281-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726826250-AEFFB5A0-F4E34F64/0/0 CLEAN NORMAL
X-TOI-MSGID: 603912ee-4fda-46ec-87af-566f1d9e0ffe
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 09:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204730

Major changes in 47.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- meson: Fix project version

Major changes in 47.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates

Major changes in 47.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates

Major changes in 47.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Add break-reminder schema
- Provide a new pressure range for styli
- Add SwitchMonitor and Keybinding to the tablet stylus actions
- Switch back to Cantarell font
- Translation updates

Major changes in 47.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Add key to tweak font rendering
- Include Settings in sort order
- Add key to pick accent color
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...sktop-schemas_46.1.bb =3D> gsettings-desktop-schemas_47.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-s=
chemas_46.1.bb =3D> gsettings-desktop-schemas_47.1.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_46.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_47.1.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskto=
p-schemas_46.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-=
schemas_47.1.bb
index 19a3948f59..3368443c25 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_46.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_47.1.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 DEPENDS =3D "glib-2.0"
=20
-
 inherit gnomebase gsettings gobject-introspection gettext
=20
-SRC_URI[archive.sha256sum] =3D "9b88101437a6958ebe6bbd812e49bbf1d09cc667=
011e415559d847e870468a61"
+SRC_URI[archive.sha256sum] =3D "a60204d9c9c0a1b264d6d0d134a38340ba5fc607=
6a34b84da945d8bfcc7a2815"
--=20
2.46.0


