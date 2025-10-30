Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91043CCF9EA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 03:49:13 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.20092.1761796149900210146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 20:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout07.t-online.de (Postfix) with SMTP id EE73FF14D
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 04:49:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.193]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vEJet-0JEK3t0; Thu, 30 Oct 2025 04:49:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libadwaita: update 1.7.6 -> 1.8.1
Date: Thu, 30 Oct 2025 04:48:49 +0100
Message-ID: <20251030034849.426920-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761796147-4DFF8992-356AD449/0/0 CLEAN NORMAL
X-TOI-MSGID: dc8b603f-c521-4a3d-8ef4-0a62417526cf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 03:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225477

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.8.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwComboRow
  - Allow selecting items via touchscreen
  - Improve accessibility
- AdwEntryRow
  - Fix title ellipsizing too late
  - Activate the row action when pressing enter
- AdwHeaderBar
  - Fix title buttons on macOS
- AdwNavigationView
  - Fix a build warning on some platforms
- AdwShortcutsDialog
  - Fix removing sections when the model changes
- AdwTabBar/AdwTabGrid
  - Fix context menu alignment on RTL
- Docs
  - Replace deprecated GApplication flag
  - Fix shortcuts screenshots in widget gallery in dark mode
- Translation updates
  - Bulgarian
  - Dutch
  - Filipino
  - Occitan
  - Portuguese
  - Uighur

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.8.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwSpinner
  - Switch to progressbar accessible role
- AdwSwipeTracker
  - Fix memory leak
- Demo
  - Fix 2 memory leaks
- Docs
  - Typo fixes
- Translation updates
  - Basque
  - British English
  - Catalan
  - Chinese (China)
  - Czech
  - Danish
  - Spanish
  - Esperanto
  - Finnish
  - Galician
  - Georgian
  - Hungarian
  - Korean
  - Lithuanian
  - Swedish
  - Turkish
  - Ukrainian

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.8.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Add copy-func and free-func annotations to boxed types
- AdwAlertDialog/AdwMessageDialog:
  - Clarify behavior around :default-response
- AdwApplication
  - Enable support for CSS media queries in the autoloaded styles
- AdwShortcutLabel
  - Fix RTL layout
- AdwShortcutsDialog
  - Fix 2 memory leaks
- AdwToastOverlay
  - Fix disappear animation not playing on dismiss_all()
  - Make the action button in toasts insensitive after a click
- AdwWrapLayout
  - Fx allocation of a single child in RTL languages or with align > 0
- Build
  - Require GTK 4.19.4
- Docs
  - Fix AdwShortcutLabel and AdwShortcutsDialog screenshots in dark
  - Fix close button style on screenshots
- Stylesheet
  - Update GtkShortcutLabel style to match AdwShortcutLabel
  - Switch to media queries instead of separate CSS variants
- Translation updates
  - Brazilian Portuguese
  - Galician
  - Interlingua
  - Japanese
  - Persian
  - Polish
  - Russian

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.8.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwAlertDialog/AdwMessageDialog
  - Emit ::response when cancelled after calling choose()
- AdwDialog
  - Fix widget activation in window-backed dialogs
  - Fix set_focus() in window-backed dialogs
- AdwLayoutSlot
  - Error out if ID is not set
- AdwNavigationView
 - Defer swipe start to ::begin-swipe
- AdwShortcutLabel
  - Differentiate keypad keys better (same as in GtkShortcutLabel)
- AdwShortcutsDialog
  - Show navigation pills for large dialogs
  - Set a title
  - Focus search bar with Ctrl+F
  - Fix action-name fetching when presented as a window
  - Fix search row activation
  - Fix markup handling
- AdwTabBar
  - Fix focusing start/end action widgets
- AdwTabOverview
  - Make button hitboxes larger
- AdwWrapBox
  - Add remove_all()
- AdwWrapLayout
  - Fix a memory leak
- Build
  - Evaluate dependencies early
- Demo
  - Switch to AdwShortcutLabel
- Stylesheet
  - Add .document style class using the document font
  - Increase line height for .body and .caption
  - Add hover/active styles to GtkFlowBox children
  - Stop shipping symbolic PNG assets
  - Fix .devel striping with new GTK
  - Adapt window controls styles to GTK styles
- Various fixes
- Translation updates
  - Belarusian
  - Hebrew
  - Romanian
  - Slovenian

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.8.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Add AdwShortcutsDialog
- Add AdwShortcutLabel
- Fix a crash with empty window layouts
- Avoid needlessly resassigning CSS classes for dynamic shadows
- AdwAboutDialog/AdwAboutWindow
  - Fix a leak
  - Fix mnemonics
  - Clarify :translator-credits docs
- AdwAlertDialog/AdwMessageDialog
  - Fix a warning with long headings
- AdwApplication
  - Automatically set up app.shortcuts action if shortcuts-dialog.ui is p=
resent
- AdwAvatar
  - Fix custom image size with GTK 4.19.2
- AdwBreakpointBin
  - Preserve focus when switching breakpoints
- AdwCarousel
  - Support keyboard navigation
  - Fix a critical when disposing it after scrolling with mouse wheel
- AdwExpanderRow
  - Fix grab_focus() behavior
- AdwHeaderBar
  - Add support for native window controls in macOS
- AdwNavigationView
  - fix :visible-page-tag notifications
- AdwPreferencesGroup
  - Add bind_model()
  - Add get_row()
  - Allow rows that aren't AdwPreferencesRow
- AdwPreferencesPage
  - Add insert()
  - Add get_group()
- AdwStyleManager
  - Fix font name docs
  - Fix loading font names when debug variables are set
  - Move yellow/green boundary for accent color
  - Support high contrast on macOS
- AdwTabOverview
  - Update window radius
- AdwToastOverlay
  - Fix a critical when showing a toast while hiding it
  - Fix accessible role in documentation
- Adaptive preview
  - Add context to shell and device preset translatable strings
  - Change screenshot tooltip
- Build
  - Don't install internal static library
  - Fix build with older gobject-introspection versions
- Demo
  - Add a shortcut for opening preferences
- Docs
  - Fix window radius value
  - Fix missing AdwCarouselIndicatorLines image
- Inspector
  - Disable markup on window rows
- Stylesheet
  - Adjust GtkWindowControls styles for GTK 4.18.4 changes
  - Optimize window and dialog shadows
  - Fix disabled styles for various .view widgets
  - Fix list DND styles
  - Fix .property for expander rows
- Tests
  - Fix a leak
- Translation updates
  - Belarusian
  - Brazilian Portuguese
  - British English
  - Catalan
  - Friulian
  - German
  - Hebrew
  - Hungarian
  - Indonesian
  - Japanese
  - Latvian
  - Portuguese
  - Romanian
  - Russian
  - Slovenian
  - Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.7.6.bb =3D> libadwaita_1.8.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.6.bb =3D> libadwait=
a_1.8.1.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.8.1.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
index 6e5eca38de..16ef1db38f 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "5eacc5550f0bdbba6a1568aebf25a3d88f5ee07d=
6b558becc6fd9487579c9a29"
+SRC_URI[archive.sha256sum] =3D "8b1d4d5f89373a5b6eea8d93ecdaee34cd26ad27=
a4dd396c06f5d9929fb313bc"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.51.0


