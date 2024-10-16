Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B84BD2068B
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 01:48:33 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.13655.1729043306707713004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 18:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id 51E2B18503
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 03:47:51 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.199]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t0t8g-1Tc2EL0; Wed, 16 Oct 2024 03:47:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libadwaita: update 1.6.0 -> 1.6.1
Date: Wed, 16 Oct 2024 03:49:49 +0200
Message-ID: <20241016014949.581124-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1729043270-107F645E-80E57970/0/0 CLEAN NORMAL
X-TOI-MSGID: 6a8c9f1b-6361-4592-8ea8-5d79eec394fd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 01:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205954

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.6.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix meson syntax in readme
- AdwAboutDialog/Window
  - Fix natural width
- AdwAlertDialog
  - Fix a crash when setting content-width/height before present()
- AdwBottomSheet
  - Fix natural height
  - Fix criticals in dispose in some cases
- AdwBreakpointBin
  - Fix natural size
- AdwClamp
  - Fix get/set_unit() version
- AdwExpanderRow
  - Make suffix spacing match action rows and entry rows
- AdwTabBar
  - Don't select tabs when clicking close or indicator buttons
  - Only handle middle clicks started and ended on the same tab
- AdwTabOverview
  - Only handle middle clicks started and ended on the same thumbnail
- AdwViewSwitcher
  - Have a minimum height outside header bars
- Docs
  - Indicate and explain out of gamut colors on CSS variables page
  - Update deprecated meson syntax
  - Typo fixes
  - Link clamp/layout/scrollable docs between each other
- Translation updates
  - Latvian
  - Thai

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.6.0.bb =3D> libadwaita_1.6.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.6.0.bb =3D> libadwait=
a_1.6.1.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.6.1.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.6.1.bb
index c643dd17d8..a32153c128 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.6.1.bb
@@ -10,7 +10,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "9ed783934cb99c9101639194e1fc072cb09303b8=
f3c2fc6623390186a9dad8d3"
+SRC_URI[archive.sha256sum] =3D "d00ac845a4545d92e6805e31095a51c68f9f4e02=
426900472084b0cddce3f833"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.47.0


