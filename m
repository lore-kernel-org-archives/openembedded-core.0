Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76560C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 09:01:41 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.17612.1716886894213135980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 02:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout12.t-online.de (Postfix) with SMTP id 7522214E32
	for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 11:01:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.240]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBsi3-0vtLO50; Tue, 28 May 2024 11:01:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libadwaita: update 1.5.0 -> 1.5.1
Date: Tue, 28 May 2024 11:02:10 +0200
Message-ID: <20240528090210.1936542-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716886891-14BEE352-8F0E75BA/0/0 CLEAN NORMAL
X-TOI-MSGID: fed63360-5078-4c67-9c8a-beb4cb631974
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 09:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199957

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.5.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwAboutDialog/Window
  - Fix an outdated appstream reference in docs
- AdwActionRow
  - Mention .property in docs
- AdwAlertDialog
  - Fix the accessible role
  - Fix initial focus
- AdwAvatar
  - Fix portrait avatars on hidpi
- AdwBin
  - Fix a potential focus issue
- AdwBreakpoint
  - Fix add_setter() annotations
- AdwCarousel
  - Fix a build warning
- AdwComboRow
  - Fix initial checkmark
  - Handle model changes properly
- AdwDialog
  - Fix accessibility warnings
  - Make shortcuts work when there are no focusable widgets
  - Correctly restore focus when opening a dialog from a menu
  - Fix GtkWindow:deletable=3Dfalse hiding close buttons in dialogs
- AdwExpanderRow
  - Fix get_title_lines() and get_subtitle_lines() return types
  - Fix remove() docs
- AdwOverlaySplitView
  - Unmap sidebar when it's hidden
- AdwPreferencesGroup
  - Fix a potential focus issue
  - Fix :header-group annotations and notifications
- AdwPreferencesPage
  - Fix a potential focus issue
- AdwTabView
  - Document :close-page return value
  - Fix a leak when closing the last page
- AdwViewStack
  - Fix a typo in docs
- Docs
  - Update screenshots
- Stylesheet
  - Fix entry progress bars
- Add missing return annotations
- Translation updates
  - Brazilian Portuguese
  - Hindi
  - Kabyle
  - Portuguese
  - Slovak

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.5.0.bb =3D> libadwaita_1.5.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.5.0.bb =3D> libadwait=
a_1.5.1.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.5.0.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.5.1.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.5.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
index b0b1e4502a..6cb67c0db0 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.5.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libadwaita"
 LICENSE=3D"LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-
 DEPENDS =3D " \
     gtk4 \
     appstream \
@@ -11,7 +10,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "fd92287df9bb95c963654fb6e70d3e082e2bcb37=
b147e0e3c905567167993783"
+SRC_URI[archive.sha256sum] =3D "7f144c5887d6dd2d99517c00fd42395ee20abc13=
ce55958a4fda64e6d7e473f8"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.45.1


