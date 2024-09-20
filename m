Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD039CF395E
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 09:57:48 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.14437.1726826261890595580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 02:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 330A2292AB
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 11:57:29 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sraOG-0C1kdX0; Fri, 20 Sep 2024 11:57:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 3/4] libadwaita: update 1.5.3 -> 1.6.0
Date: Fri, 20 Sep 2024 11:58:15 +0200
Message-ID: <20240920095816.261281-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920095816.261281-1-f_l_k@t-online.de>
References: <20240920095816.261281-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726826249-8FFFD5A0-D33B36FA/0/0 CLEAN NORMAL
X-TOI-MSGID: 00a919d9-8786-457e-9c9e-923575ac7f04
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 09:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204732

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.6.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwAboutDialog/Window
  - Support non-deprecated GPL-2/3.0-only SPDX IDs
- AdwBottomSheet
  - Fix a crash in tests on some platforms
- AdwHeaderBar
  - Fix back button menu picking up phantom pages in some situations
- AdwMessageDialog
  - Fix title size
- AdwTabOverview
  - Focus search entry with Ctrl+F
- Docs
  - Screenshot tool fixes
  - Update screenshots
- Tests
  - Add AdwBackButton tests
- Stylesheet
  - Disable .devel header bars for bottom sheets, like for dialogs
  - Fix header bar in GTK dialogs
  - Fix fine-tune scale styles
  - Fix scroll undershoot in dropdowns and emoji picker
- Translation updates
  - British English
  - Bulgarian
  - Czech
  - Danish
  - French
  - Galician
  - Indonesian
  - Korean
  - Lithuanian
  - Occitan
  - Polish
  - Portuguese
  - Spanish
  - Swedish
  - Turkish

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.6.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwMultiLayoutView
  - Hide slots when their child is invisible
- AdwPreferencesDialog/Window
  - Support macOS keybindings
- AdwSpinner
  - Work around a memory corruption issue
- AdwTabBar/Overview
  - Fix 2 drag-n-drop crashes
- AdwTabView
  - Support macOS keybindings
- Demo
  - List ADW_DEBUG_ACCENT_COLOR in about dialog debug info
  - Support macOS keybindings
- Docs
  - List available style classes for each widget
  - Typo fixes
- Stylesheet
  - Add .ssd-frame style class for mutter titlebars
  - Make radio button focus ring round
  - Use relative font sizes
  - Support .property.monospace for AdwExpanderRow too
  - Fix GtkScale value overlapping with slider
  - Fix --window-radius 0px unit
- Translation updates
  - Basque
  - Belarusian
  - Brazilian Portuguese
  - Catalan
  - Chinese (China)
  - Finnish
  - Georgian
  - German
  - Hebrew
  - Hindi
  - Hungarian
  - Norwegian Bokm=C3=A5l
  - Persian
  - Romanian
  - Russian
  - Slovenian
  - Ukrainian

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.6.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Introduce AdwSpinner and AdwSpinnerPaintable
- AdwAlertDialog
  - Accessibility fixes
  - Fix a sizing bug with :prefer-wide-layout
- AdwComboRow
  - Don't change sensitivity on model change
- AdwDialog
  - Fix a memory leak
  - Speed up switching presentation
- AdwEntryRow
  - Fix row activation
- AdwPreferencesPage
  - Add an a11y relation to the description
- AdwSpinRow
  - Set accessible role to presentation
- AdwStatusPage
  - Adjust style when using AdwSpinnerPaintable
- AdwStyleManager
  - Speed up reloading CSS
  - Partially support system accent color on macOS
- AdwSwitchRow
  - Set accessible role to switch
- AdwTabBar/Overview
  - Use AdwSpinnerPaintable for loading state
  - Fix a use after free when closing tabs
- AdwToastOverlay
  - Announce appearing toasts for screen reader
- Demo
  - Make strings HIG-compliant
  - Add ctrl+q shortcut, make ctrl+w close the window instead
- Docs
  - Don't annotate user_data params with closure
  - Fix typos in migrating to breakpoints page
- Stylesheet
  - Fix a specificity issue with scrolled windows in popovers
  - Fix file chooser styles
- Translation updates
  - Chinese (Taiwan)
  - Georgian
  - Hebrew
  - Hindi
  - Russian
  - Slovenian
  - Turkish

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.6.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Introduce AdwBottomSheet
- Introduce AdwButtonRow
- Introduce AdwMultiLayoutView
- Deprecate AdwAboutWindow, AdwMessageDialog and AdwPreferencesWindow
- Various annotation fixes
- Build
  - Depend on GTK 4.15.2
- AdwAboutDialog/Window
  - Fix an outdated appstream reference in docs
- AdwActionRow
  - Mention .property in docs
- AdwAlertDialog
  - Refresh style, drop custom suggested and destructive button styles
  - Try harder to fit into landscape mobile screens
  - Fix initial focus
  - Fix the accessible role
  - Fix setting default widget when removing a response
  - Fix unmatched va_start()
- AdwApplicationWindow
  - Default minimum size to 360=C3=97200
- AdwAvatar
  - Fix portrait avatars on hidpi
- AdwBin
  - Fix a potential focus issue
- AdwBreakpointBin
  - Fix a leak
- AdwBreakpointCondition
  - Fix leaks when parsing
- AdwCarousel
  - Fix a build warning
- AdwComboRow
  - Add :header-factory
  - Add :search-match-mode
  - Fix initial checkmark
  - Handle model changes properly
- AdwDialog
  - Fix toggling presentation mode
  - Fix close button ignoring :can-close
  - Fix ::close-attempt not emitting in some cases
  - Fix swipe area for bottom sheets
  - Make shortcuts work when there are no focusable widgets
  - Correctly restore focus when opening a dialog from a menu
  - Fix GtkWindow:deletable=3Dfalse hiding close buttons in dialogs
  - Fix accessibility warnings
  - Leak fixes
- AdwEntryRow
  - Add :max-length
  - Don't change size on focus
- AdwExpanderRow
  - Fix get_title_lines() and get_subtitle_lines() return types
  - Fix remove() docs
- AdwHeaderBar
  - Don't show title when used inside AdwBottomSheet with a drag handle
  - Fix split view links in docs
  - Fix initial focus for the back button
- AdwMessageDialog
  - Refresh style, drop custom suggested and destructive button styles
  - Try harder to fit into landscape mobile screens
  - Fix unmatched va_start()
- AdwOverlaySplitView
  - Unmap sidebar when it's hidden
- AdwPreferencesGroup
  - Add :separate-rows
  - Fix :header-group annotations and notifications
  - Fix a potential focus issue
- AdwPreferencesPage
  - Add :description-centered
  - Fix a potential focus issue
- AdwSpinRow
  - Fix ::input handling
- AdwStyleManager
  - Support system accent color on Linux and Windows
- AdwSwipeTracker
  - Various fixes for swipe handling
- AdwTabBar
  - Remove spinner unmap hack as GTK handles it now
- AdwTabButton
  - Fix needs-attention badge on RTL
- AdwTabOverview
  - Remove spinner unmap hack as GTK handles it now
- AdwTabView
  - Fix a leak when closing the last page
  - Accessibility fixes
  - Document :close-page return value
- AdwToast
  - Fix accessible role
- AdwViewStack
  - Accessibility fixes
  - Fix a typo in docs
- AdwWindow
  - Default minimum size to 360=C3=97200
- Docs
  - Add a AdwMultiLayout example to the adaptive layouts page
  - Replace the named colors page with css variables
  - Use modern CSS rgb() syntax instead of the legacy one
  - Stop mentioning _finish() functions, gi-docgen does it now
  - Stop using non-standard property getter/setter annotations
  - An attempt to make screenshot tool less flaky
  - Update screenshots
  - Don't list ADW_ENCODE_VERSION and ADW_UNAVAILABLE
- Demo
  - Rename Dialogs page to Alert Dialog
  - Use :separate-rows for the entry rows group on the lists page
  - Remove colored buttons example
  - Use neutral accent color for tab pages
  - Refresh tab page colors
  - Fix writing style for subtitles
  - Fix the banner page button switch
- Stylesheet
  - Use standard CSS functions instead of GTK-specific ones
  - Introduce a CSS variable for each named color: @accent_color -> --acc=
ent-color etc
    - @borders is replaced with --border-color, not --borders
    - Each variable by default points to its named color to ensure
      backwards compatibility
  - Introduce --standalone-color-oklab
  - Generate standalone colors from background colors by default
  - Introduce --accent-blue, --accent-teal, --accent-green,
    --accent-yellow, --accent-orange, --accent-red, --accent-pink,
    --accent-purple and --accent-slate matching the system accents
  - Introduce --border-opacity, --dim-opacity, --disabled-opacity
  - Introduce --window-radius
  - Introduce .boxed-list-separate
  - Refresh style for GtkMessageDialog too
  - Change .destructive-action style to make it distinct from
    .suggested-action
  - Support .navigation-sidebar for GtkGridView and GtkFlowBox
  - Support .monospace for property rows
  - Support .inline for text views
  - Use white accent color for .osd instead of overriding it for every
    widget inside
  - Use matching accent colors for .error, .warning and .success
  - Use red focus rings for destructive buttons
  - Make file chooser selection grey
  - Make sure --success-color, --warning-color and --error-color are
    legible in .osd
  - Add a hack to make GtkTreeView and GtkIconView redraw when accent
    color changes
  - Deprecate button.opaque
  - Fix entry progress bars
- Various cleanups and refactoring
- Translation updates
  - Brazilian Portuguese
  - Catalan
  - Dutch
  - Hungarian
  - Kabyle
  - Portuguese
  - Punjabi
  - Slovenian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.5.3.bb =3D> libadwaita_1.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.5.3.bb =3D> libadwait=
a_1.6.0.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.6.0.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb
index 2e22211135..c643dd17d8 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.6.0.bb
@@ -10,7 +10,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "3b358635f7ea455d9fe75101373e34d2fba130d1=
590bd1a1c87ab1ccfba05f32"
+SRC_URI[archive.sha256sum] =3D "9ed783934cb99c9101639194e1fc072cb09303b8=
f3c2fc6623390186a9dad8d3"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.46.0


