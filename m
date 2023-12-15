Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1107C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 17:30:25 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.68644.1702661418813120093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 09:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id 202C7FC1C
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 18:30:17 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.124]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rEC0u-0kuDFB0; Fri, 15 Dec 2023 18:30:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/2] libadwaita: update 1.4.0 -> 1.4.2
Date: Fri, 15 Dec 2023 18:30:55 +0100
Message-ID: <20231215173056.2392-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1702661416-317F9937-862D82C2/0/0 CLEAN NORMAL
X-TOI-MSGID: 06240b5f-0cad-4170-b988-5ce1bd2ee34a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 17:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192541

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.4.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Really fix build with libappstream 1.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.4.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix build with MSVC
- Fix build with libappstream 1.0
- AdwCarousel
  - Fix carousel scroll behavior with page reordering
- AdwComboRow
  - Fix focus when opening the popover
  - Set the correct state on the selected checkmark
- AdwNavigationView
  - Fix a warning message
- AdwTabOverview
  - Allow child focus on out animations
- AdwTabView
  - Keep view alive during ::page-detached
  - Fix crashes when using :pages
- Docs
  - Fix erroneous <child> use in breakpoints migration guide
- Translation updates
  - Russian
  - Serbian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.4.0.bb =3D> libadwaita_1.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.0.bb =3D> libadwait=
a_1.4.2.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.4.2.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
index cc05756805..edcfba54b6 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.2.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "e51a098a54d43568218fc48fcf52e80e36f469b3=
ce912d8ce9c308a37e9f47c2"
+SRC_URI[archive.sha256sum] =3D "33fa16754e7370c841767298b3ff5f23003ee1d2=
515cc2ff255e65ef3d4e8713"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.43.0


