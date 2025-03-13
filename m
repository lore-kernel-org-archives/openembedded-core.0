Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E176C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:33:58 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.8988.1741851235296866316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id 73D6CEDC
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:33:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsd4g-0gQTqc0; Thu, 13 Mar 2025 08:33:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][gnome48][oe-core][PATCHv2 2/4] libadwaita: update 1.6.4 -> 1.7.rc
Date: Thu, 13 Mar 2025 08:34:31 +0100
Message-ID: <20250313073436.5133-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313073436.5133-1-f_l_k@t-online.de>
References: <20250313073436.5133-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1741851230-A67FA5C8-55FFC158/0/0 CLEAN NORMAL
X-TOI-MSGID: 8af9ca40-ec08-4872-9b97-a7b5f491bf9f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212741

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.7.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix build failures on win32
- Bump minimum GTK and GLib versions
- Adaptive preview
  - Fix screenshotting GtkGraphicsOffload
  - Add a missing translators comment
- AdwAboutDialog/Window
  - Use system monospace font for `<code>` in release notes
- AdwDialog
  - Fix parent window shortcuts propagating into dialogs
- AdwPreferencesDialog
  - Hide pages with visible=3Dfalse
- AdwStyleManager
  - Document how to handle font names
- Stylesheet
  - Fix popovers in non-composited environments
  - Fix GtkPaned drag area
- Translation updates
  - Basque
  - Brazilian Portuguese
  - Bulgarian
  - Catalan
  - Chinese (China)
  - Czech
  - Finnish
  - Galician
  - Georgian
  - Hebrew
  - Indonesian
  - Korean
  - Lithuanian
  - Norwegian Bokm=C3=A5l
  - Occitan
  - Persian
  - Polish
  - Portuguese
  - Turkish
  - Ukrainian

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.7.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- AdwApplicationWindow, AdwWindow
  - Add a public property for toggling adaptive preview
  - Open adaptive preview with Ctrl+Shift+M
- AdwBreakpoint
  - Fix to_string() with locales using comma as decimal separator
- AdwComboRow
  - Fix very short strings not being displayed
- AdwDialog
  - Fix ::closed emission with window-backed dialogs
  - Fix a focus-related crash
- AdwOverlaySplitView, AdwFlap
  - Remove an unreachable check
- AdwPreferencesDialog
  - Document navigation.pop action
- AdwTabBox, AdwTabGrid
  - Fix scrolling to newly appearing tabs
  - Fix a copy-paste error
- AdwToast
  - Use a lighter opaque style
- Adaptive Preview
  - Add an outline around the device
  - Round bezel sizes
  - Fix bezels with locales using comma as decimal separator
  - Prevent secondary sidebar style leak into the previewed app
- Demo
  - Allow opening adaptive preview from menu
  - Inherit page background color when duplicating tabs
- Docs
  - Switch to Adwaita Sans/Mono 11pt for doc screenshots
- Inspector
  - Provide a list of windows instead of a single button for adaptive pre=
view
- Stylesheet
  - Add --document-font-family/size and --monospace-font-family/size
  - Use --monospace-font-family/size for .monospace
  - Fix disabled style for raised/suggested/destructive menubuttons in to=
olbars
  - Drop GtkSourceView support for textview.inline as it didn't work anyw=
ay
- Translation updates
  - Italian
  - Russian
  - Slovenian
  - Turkish

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 1.7.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Add AdwToggleGroup and AdwInlineViewSwitcher
- Add AdwWrapBox and AdwWrapLayout
- Add adaptive preview in inspector
- Use EASE easing for timed animations instead of EASE_OUT_CUBIC
- Don't warn when setting child in bin-like widgets to itself
- Fix meson syntax in readme
- Add doc guidelines to HACKING
- Build
  - Drop pre-built docs and styles
  - Rename -Dgtk_doc to -Ddocumentation, deprecate the old option
- AdwAboutDialog
  - Add Other Apps section
  - Fix natural width
- AdwAboutWindow
  - Fix natural width
- AdwActionRow
  - Set accessible role to presentation for the icon
- AdwAlertDialog
  - Fix a crash when setting content-width/height before present()
- AdwAvatar
  - Set accessible role and label
- AdwBanner
  - Start-align the title earlier
  - Tone down visuals
  - Add :style to allow to make button suggested
- AdwBottomSheet
  - Add :reveal-bottom-bar
  - Fix natural height
  - Fix criticals in dispose in some cases
- AdwBreakpointBin
  - Fix natural size
- AdwButtonRow
  - Set accessible role to presentation for icons
- AdwClamp
  - Fix get/set_unit() version
- AdwClampLayout
  - Fix layout with multiple children
  - Fix height-for-width measuring
- AdwComboRow
  - Fix a property noficiation
- AdwDialog
  - Fix accessible role critical when using window-backed dialogs
  - Handle close() before and right after present()
  - Don't crash when chaining up in vfuncs
- AdwEasing
  - Add EASE, EASE_IN, EASE_OUT and EASE_IN_OUT
- AdwExpanderRow
  - Make suffix spacing match action rows and entry rows
- AdwHeaderBar
  - Ignore split views outside sheets
- AdwLengthUnit
  - Fix pt and sp unit values when gtk-xft-dpi =3D -1
- AdwMessageDialog
  - Fix a typo in adw_message_dialog_response() deprecation message
- AdwNavigationSplitView
  - Support :sidebar-position
  - Stop reporting baseline
- AdwNavigationView
  - Addw :h/vhomogeneous
  - Add :visible-page-tag
  - Don't crash when chaining up in vfuncs
- AdwOverlaySplitView
  - Don't allow focusing hidden sidebar
- AdwPreferencesPage
  - Add :banner
- AdwStyleManager
  - Fix initial color scheme value on Windows
- AdwTabBar
  - Only handle middle clicks started and ended on the same tab
  - Don't select tabs when clicking close or indicator buttons
- AdwTabOverview
  - Darken background color
  - Only handle middle clicks started and ended on the same thumbnail
- AdwToastOverlay
  - Add dismiss_all()
  - Add tooltip to the dismiss button
- AdwToolbarView
  - Fix height-for-width measurements
- AdwViewSwitcher
  - Have a minimum height outside header bars
  - Always focus active toggle when entering focus
- AdwViewStack
  - Add an optional crossfade transition
  - Rework adjusting child allocation
- AdwWindow, AdwApplicationWindow
  - Fix allocating children
- Docs
  - Indicate and explain out of gamut colors on CSS variables page
  - Update deprecated meson syntax
  - Link clamp/layout/scrollable docs between each other
  - Force GTK_FONT_RENDERING_MANUAL for screenshots
  - Typo fixes
- Stylesheet
  - Increase border radii of various widgets
  - Tint gray colors to make them colder
  - Add hover and active transition to switch, check, radio and slider
  - Increase scrollbar padding to match the new window radius
  - Add .dimmed and deprecate .dim-label
  - Make preferences group .labels style more specific
- Translation updates
  - Belarusian
  - Catalan
  - Chinese (China)
  - Dutch
  - Hebrew
  - Russian
  - Serbian
  - Slovenian
  - Thai

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libadwaita/{libadwaita_1.6.4.bb =3D> libadwaita_1.7.rc.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.6.4.bb =3D> libadwait=
a_1.7.rc.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.7.rc.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.7.rc.bb
index a8cf642ff0..6dd47225a0 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.7.rc.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "1011a5a93dc3b87e82da19910d7fab01a3b9d7fc=
b0b09751babb476eedb3d9a3"
+SRC_URI[archive.sha256sum] =3D "515f28e1aa2df77b77989f541e26d8817c431314=
f838c71c9e44c9f6f15fddc0"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.48.1


