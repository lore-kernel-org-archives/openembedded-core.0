Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B886C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 06:53:48 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.9030.1710831220752309547
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 23:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id 00F4AF714
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 07:53:39 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.144]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmTLu-0n4g9x0; Tue, 19 Mar 2024 07:53:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libadwaita: update 1.4.4 -> 1.5.0
Date: Tue, 19 Mar 2024 07:54:08 +0100
Message-ID: <20240319065408.33061-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1710831218-BF7FD917-5EC56958/0/0 CLEAN NORMAL
X-TOI-MSGID: 0cb51faa-abda-4729-a40e-abeba4f61df6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 06:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197316

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.5.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwDialog
  - Fix widget selection in inspector when presented as a bottom sheet
  - Fix clicks on the dimming still working with can-closed=3Dtrue
- Demo
  - Fix <developer> in metainfo
- Translation updates
  - Belarusian
  - Brazilian Portuguese
  - Danish
  - French
  - Galician
  - Hungarian
  - Italian
  - Kabyle
  - Kazakh
  - Latvian
  - Norwegian Bokm=C3=A5l
  - Occitan
  - Slovenian
  - Swedish
  - Turkish

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.5.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Depend on GTK 4.13.4
- Fix layout with GtkSettings:gtk-xft-dpi =3D=3D 0
- AdwAboutDialog
  - Support zero-clause bsd license
  - Fix example
- AdwAboutWindow
  - Support zero-clause bsd license
- AdwDialog
  - Allow bottom sheets to shrink beyond 360px width
  - Fix a crash when swiping on the dimming
  - Adjust dimming intensity
- AdwNavigationView
  - Fix signal mentions in push() docs
  - Disable missing title warning when containing a split view
- AdwStatusPage
  - Fix property notification in set_child()
- AdwSwipeTracker
  - Use a smaller threshold for window handles
- AdwToolbarView
  - Fix a typo in docs
- Demo
  - Fix window.devel demo
- Stylesheet
  - Adjust shade colors in dark
  - Make .devel not propagate to dialogs

- Translation updates
  - Basque
  - Belarusian
  - Catalan
  - Chinese (China)
  - Chinese (Taiwan)
  - Czech
  - Dutch
  - Finnish
  - French
  - Georgian
  - Hebrew
  - Hungarian
  - Indonesian
  - Kazakh
  - Korean
  - Latvian
  - Lithuanian
  - Norwegian Bokm=C3=A5l
  - Occitan
  - Persian
  - Polish
  - Russian
  - Spanish
  - Swedish
  - Ukrainian

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.5.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix build with libappstream 1.0
- Fix deprecation warning with libappstream 0.16.4
- Fix a build error with MSVC
- Add AdwDialog, AdwAlertDialog, AdwPreferencesDialog and AdwAboutDialog
- AdwAboutWindow
  - Don't pre-select the first section on the Legal page
- AdwApplicationWindow
  - Add :dialogs and :visible-dialog
- AdwBreakpointBin
  - Add remove_breakpoint()
  - Fix focus during transitions
  - Fix swapping the child during transitions
- AdwButtonContent
  - Horizontally center children
- AdwCarousel
  - Fix carousel scroll behavior with page reordering
- AdwComboRow
  - Don't change selection on filtering
  - Fix focus when opening the popover
  - Set the correct state on the selected checkmark
- AdwEntryRow
  - Add :text-length
- AdwHeaderBar
  - Integrate with AdwDialog
  - Fix visibility after changing :show-back-button
- AdwMessageDialog
  - Add remove_response()
  - Fix choose() annotations
- AdwNavigationView
  - Fix a warning message
- AdwPreferencesWindow
  - Fix :visible-page and :visible-page-name docs
- AdwStyleManager
  - Support contrast setting in the settings portal
- AdwSwipeTracker
  - Add :allow-window-handle
- AdwTabOverview
  - Allow child focus on out animations
- AdwTabView
  - Keep view alive during ::page-detached
  - Fix crashes when using :pages
- AdwViewSwitcherBar
  - Fix a warning when empty
- AdwWindow
  - Add :dialogs and :visible-dialog
- Demo
  - Port everything to AdwDialog
- Docs
  - Add a migration guide for adaptive dialogs
  - Add a favicon
  - Use the new asides
  - Fix erroneous <child> use in breakpoints migration guide
- Stylesheet
  - Increase GtkSwitch padding
  - Align property row title and other row subtitle sizes
  - Align expander row and combo row arrows
  - Stop hiding switch shapes
- Translation updates
  - Czech
  - French
  - Galician
  - German
  - Greek
  - Hebrew
  - Hungarian
  - Norwegian Bokm=C3=A5l
  - Persian
  - Russian
  - Serbian
  - Slovenian
  - Turkish
  - Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.4.4.bb =3D> libadwaita_1.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.4.4.bb =3D> libadwait=
a_1.5.0.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.5.0.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.5.0.bb
index e81580feba..b0b1e4502a 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.4.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.5.0.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "f802b7d8d5ae33be4650ef571a580f144a806202=
a26f527dacd57d1560938828"
+SRC_URI[archive.sha256sum] =3D "fd92287df9bb95c963654fb6e70d3e082e2bcb37=
b147e0e3c905567167993783"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.44.0


