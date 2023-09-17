Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C18CD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 18:28:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.35098.1694975323278521430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 11:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id C41BE11AF7
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 20:28:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhwVa-1kKibz0; Sun, 17 Sep 2023 20:28:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 3/4] libadwaita: upgrade 1.3.4 -> 1.4.0
Date: Sun, 17 Sep 2023 20:28:25 +0200
Message-ID: <20230917182829.2153680-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230917182829.2153680-1-f_l_k@t-online.de>
References: <20230917182829.2153680-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694975318-2B024649-CC20DE08/0/0 CLEAN NORMAL
X-TOI-MSGID: b42c4c53-3c42-48d5-9f65-e07fdf53e029
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 18:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187811

- add dependency on appstream
- build vapi dependent on GI_DATA_ENABLED

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.4.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwBreakpointBin
  - Clarify minimum size warnings
- AdwExpanderRow
  - Improve accessible roles
- AdwPreferencesGroup
  - Set described-by on the listbox
- Docs
  - Fix a property name in breakpoint migration guide
- Stylesheet
  - Fix toolbar view styles within sidebars
  - Fix .navigation-sidebar:disabled style when used with GtkListView
- Build system fixes
- Translation updates
  - Catalan
  - Danish
  - Dutch
  - Esperanto
  - Italian
  - Occitan
  - Spanish
  - Swedish

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.4.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- AdwAboutWindow
  - Accessibility fixes
  - Add a minimum size
- AdwExpanderRow
  - Accessibility fixes
- AdwHeaderBar
  - Fix missing title fallback for back button tooltip and history menu
  - Set "Back" as an accessible label for the back button
  - Clarify docs around :show-back-button
- AdwNavigationView
  - Warn when a navigation page is missing a title
- AdwStyleManager
  - Fix over-releasing a string on macOS
- AdwTabButton
  - Set the correct gettext domain
- AdwTabOverview
  - Set the correct gettext domain
  - Fix reordered thumbnail being drawn below others
- AdwToastOverlay
  - Set the correct gettext domain
- Build
  - Update pkg-config description field
- Demo
  - Update screenshot in appdata
  - Correctly dismiss the last toast in the dialogs demo
  - Add missing navigation page titles
- Stylesheet
  - Fix filename entry margins in file chooser
  - Fix menubutton.card corners
  - Fix button.card focus ring transition
  - Avoid background overdraw in GtkColumnView
- Translation updates
  - Basque
  - Chinese (China)
  - Czech
  - Finnish
  - Galician
  - German
  - Indonesian
  - Kazakh
  - Korean
  - Lithuanian
  - Persian
  - Polish
  - Romanian
  - Spanish
  - Turkish

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.4.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Build
  - Depend on GLib 2.76.0
  - Fix build on Windows
  - Add a GTK subproject
- AdwBreakpointBin
  - Mention the correct widget in exceeded size warnings
  - Fix width-for-height and height-for-width sizing
- AdwComboRow
  - Recreate default factory on expression changes
- AdwEnumListModel
  - Better invalid value for find_position()
- AdwHeaderBar
  - Fix spacing when there are no start/end children
  - Fix a memory leak
  - Fix GtkCenterBox:shrink-center-last usage
- AdwLeaflet
  - Fix back/forward mouse button handling
- AdwMessageDialog
  - Fix shadow style
- AdwNavigationView
  - Pop the current page when pressing Escape
  - Make AdwNavigationPage:child-view private
  - Fix back/forward mouse button handling
  - Clarify docs
- AdwPreferencesWindow
  - Fix a memory leak
- AdwTabOverview
  - Cull invisible thumbnails
  - Fix a crash when opening overview before it's mpped
- AdwTabView
  - Fix thumbnail regressions from 1.4.alpha
- AdwToastOverlay
  - Fix width-for-height and height-for-width sizing
- AdwToolbarView
  - Add ADW_TOOLBAR_RAISED_BORDER style
  - Fix width-for-height and height-for-width sizing
  - Clarify docs
- AdwViewStack
  - Add AdwViewStackPages:selected-page
- AdwViewSwitcherBar
  - Fix disabling reveal animation when using breakpoints
  - Make sure the height doesn't change with large text
- Demo
  - Fix view switcher demo minimum height
  - Set input hints and purpose in the entries
- Docs
  - Assorted screenshot tool fixes
  - Fix a deprecation warning in the screenshot tool
- Stylesheet
  - Make button.osd focus rings blue for better visibility
  - Fix .card buttons within .osd
  - Fix button transitions in high contrast mode
  - Fix single-item menu height
  - Modernize GtkFileDialog, GtkAppChooserDialog and GtkAssistant styles
- Translation updates
  - Belarusian
  - Friulian
  - Georgian
  - Hebrew
  - Hungarian
  - Persian
  - Portuguese
  - Russian
  - Slovenian
  - Ukrainian

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.4.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Build
  - Depend on GTK 4.11.3
  - Depend on libappstream
  - Add Vala metadata file
  - Fix gnome.compile_resources() on MSBuild
  - Fix doc include path
  - Make metainfo build reproducible
- Add AdwBreakpoint and AdwBreakpointBin
- Add AdwNavigationView
- Add AdwNavigationSplitView
- Add AdwOverlaySplitView
- Add AdwSpinRow
- Add AdwSwitchRow
- Add AdwToolbarView
- Deprecate AdwFlap, AdwLeaflet, AdwSqueezer and AdwViewSwitcherTitle
- AdwAboutWindow
  - Add new_from_appdata()
  - Add a missing Since annotation
  - Fix accessible role on the application icon
- AdwActionRow
  - Fix an inaccuracy in docs
- AdwAvatar
  - Fix a memory leak
- AdwBanner
  - Allow to ellipsize the button
  - Clarify title placement in docs
  - Add a backdrop style
- AdwButtonContent
  - Add :can-shrink
- AdwCarousel
  - Fix allocation
  - Fix scrolling to a recently inserted item
- AdwClamp/AdwClampLayout/AdwClampScrollable
  - Add :unit, default to the sp unit instead of px
  - Deprecate clamp child  style classes
- AdwComboRow
  - Add :enable-search
  - Fix accessible role on the dropdown arrow
- AdwExpanderRow
  - Deprecate add_action(), replace it with add_suffix()
- AdwFlap
  - Add a missing setter annotation for :fold-policy
  - Correctly measure separator
  - Avoid notify emissions in dispose()
- AdwEntryRow
  - Fix baseline with new GTK
  - Fix accessibility
- AdwHeaderBar
  - Add :show-title property
  - Show page title instead of window title inside AdwNavigationPage
  - Show back buttons inside AdwNavigationView, add :show-back-button
  - Hide redundant window buttons inside AdwNavigationSplitView and
    AdwOverlaySplitView
  - Ellipsize title before start/end children
- AdwMessageDialog
  - Allow to ellipsize the buttons
  - Be more responsive on parent state changes
  - Fix criticals when using choose() with hide-on-close=3Dtrue
- AdwPasswordEntryRow
  - Say password instead of text in the ui
- AdwPreferencesPage
  - Add :description
- AdwPreferencesWindow
  - Deprecate present_subpage(), close_subpage() and :can-navigate-back,
    replace with push_subpage() and pop_subpage() using AdwNavigationView
  - Move search button to the left
  - Add placeholder to the search entry
  - Fix markup handling when searching
- AdwSplitButton
  - Add :can-shrink
- AdwStatusPage
  - Clarify docs
- AdwStyleManager
  - Stop reading GNOME-specific color-scheme setting via settings portal
  - Only use GSettings with ADW_DISABLE_PORTAL=3D1
  - Fix get_for_display() annotation
- AdwSwipeTracker
  - Add overshoot properties
  - Fix swipe area handling
- AdwTabBar
  - Add :extra-drag-preferred-action
  - Fix dropping data onto tabs/thumbnails
  - Fix accessibility
  - Fix clipped labels
  - Correctly unparent context menu
- AdwTabOverview
  - Rework thumbnails, reducing the number of glitches with
    WebKitWebView, and gaining antialiasing in process
  - Fix the transition curve
  - Add :extra-drag-preferred-action
  - Add a translator comment for "%u tabs"
  - Fix dropping data onto tabs/thumbnails
  - Fix clipped labels
  - Correctly unparent context menu
- AdwTabView
  - Allow Ctrl+Page Up/Down to wrap around
- AdwToast
  - Add :use-markup
  - Allow to ellipsize toast buttons
- AdwViewSwitcher
  - Ellipsize labels in wide mode
  - Set correct accessible role for icons
- AdwViewSwitcherBar
  - Modernize style
- AdwWindow/AdwApplicationWindow
  - Add API for using breakpoints, matching AdwBreakpointBin
- AdwWindowTitle
  - Fix initial title visibility
- Demo
  - Drop leaflet and flap demos
  - Fix a critical when trying to set a non-image file as avatar
  - Add tooltip to the main menu button
  - Open primary menu with F10
  - Make sure dialogs can be closed with Esc
- Docs
  - Add a breakpoint migration guide
  - Rewrite the adaptive layouts page using the new widgetry
  - Update examples everywhere
  - Fix success/error color values
  - List thumbnail colors on the named colors page
  - Consistently mention since/deprecated since versions for named
    colors and style classes
  - Drop alpha migration guide
  - Adjust heading levels so that document outline consistently works
  - Crop screenshots more precisely
  - Don't show marshal functions in docs
- Tests
  - Add a few manual tests, intended to be ran from Builder
- Stylesheet
  - Make header bars white in light variant
  - Use shadow instead of a border for GtkWindow:titlebar
  - Revert menubar style changes from 1.3
  - Use a shadow for undershoot styles
  - Add .undershoot-top/bottom/start/end style classes
  - Add @popover_shade_color, use for undershoots and transition shadows
    within popovers
  - Move toolbar padding to toolbars instead of buttons/entries/etc.
    Applications may need to adapt if they were relying on the previous
    padding.
  - Add .property style class for list rows
  - Deprecate headerbar.flat
  - Remove non-overlay scrollbar background
  - Remove outline on scrollbar troughs
  - Use flat header bars for GtkShortcutsWindow, GtkAboutDialog,
    GtkColorDialog, GtkPrintUnixDialog and GtkPageSetupUnixDialog
  - Adapt styles for GTK 4.11.x additions
  - Improve selected list/grid item contrast
  - Fix click areas in file chooser rows and grid items
  - Fix file chooser grid dimensions
  - Fix button.card checked state
  - Fix link hover color
- Warn when trying to add a child that already has a parent
- Fix GTK deprecation warnings
- Translation updates
  - Basque
  - Brazilian Portuguese
  - British English
  - Bulgarian
  - Catalan
  - Chinese (Taiwan)
  - Dutch
  - Finnish
  - French
  - Friulian
  - German
  - Hebrew
  - Hungarian
  - Italian
  - Lithuanian
  - Persian
  - Polish
  - Portuguese
  - Russian
  - Slovak
  - Swedish
  - Turkish

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.3.4.bb =3D> libadwaita_1.4.0.bb}  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.3.4.bb =3D> libadwait=
a_1.4.0.bb} (74%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.3.4.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.4.0.bb
similarity index 74%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.3.4.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
index 2abc8d9f2f..d8aa2cd697 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.3.4.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
@@ -7,11 +7,12 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     gtk4 \
+    appstream \
 "
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "801ccaf3a760213b59ebb9b8185327df22504954=
4aee68a1340b165710acb1bd"
+SRC_URI[archive.sha256sum] =3D "e51a098a54d43568218fc48fcf52e80e36f469b3=
ce912d8ce9c308a37e9f47c2"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
@@ -23,3 +24,5 @@ GTKDOC_MESON_OPTION =3D 'gtk_doc'
 PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
+
+EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
--=20
2.41.0


