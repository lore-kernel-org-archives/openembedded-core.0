Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4367C001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 14:32:13 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.44174.1691764324631912413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 07:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout02.t-online.de (Postfix) with SMTP id 5278326ECE
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 16:32:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.74]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qUTBK-3riFLV0; Fri, 11 Aug 2023 16:32:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libadwaita: upgrade 1.3.3 -> 1.3.4
Date: Fri, 11 Aug 2023 16:31:53 +0200
Message-ID: <20230811143153.2969209-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691764322-990199C6-C7F39F7A/0/0 CLEAN NORMAL
X-TOI-MSGID: f150bceb-2804-457c-a450-0d90fff4bf68
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 14:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185847

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.3.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwAboutWindow
  - Fix :translator-credits property
- AdwComboRow
  - Fix accessible role on the dropdown arrow
- AdwEntryRow
  - Fix accessibility
- AdwLeaflet
  - Fix back/forward mouse button handling
- AdwTabBar
  - Fix accessibility
- AdwTabThumbnail
  - Fix duplicate thumbnail during transitions
  - Fix the transition curve
- AdwViewSwitcher
  - Set correct accessible role for icons
- AdwWindowTitle
  - Fix initial title visibility
- Stylesheet
  - Fix .card buttons within .osd
  - Fix single-item menu height

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.3.3.bb =3D> libadwaita_1.3.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.3.3.bb =3D> libadwait=
a_1.3.4.bb} (86%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.3.3.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.3.4.bb
similarity index 86%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.3.4.bb
index 8ec5258c73..2abc8d9f2f 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.3.4.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "3fb9f6f8f570e543ab2dafb8b4b94d8b376c59ad=
565efadfede44557e3f3a9e1"
+SRC_URI[archive.sha256sum] =3D "801ccaf3a760213b59ebb9b8185327df22504954=
4aee68a1340b165710acb1bd"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.41.0


