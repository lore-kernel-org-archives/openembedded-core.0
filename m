Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE051C001DB
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 14:54:12 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.136302.1692111242392739102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 07:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout01.t-online.de (Postfix) with SMTP id 77568A2DF
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:54:00 +0200 (CEST)
Received: from [192.168.178.58] ([79.219.225.50]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qVvQj-0XkL8S0; Tue, 15 Aug 2023 16:53:57 +0200
Date: Tue, 15 Aug 2023 16:53:47 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: openembedded-core@lists.openembedded.org
Message-Id: <NDTFZR.IDU2M12WN4L73@t-online.de>
In-Reply-To: <177B96226951B512.12117@lists.openembedded.org>
References: <177B96226951B512.12117@lists.openembedded.org>
X-Mailer: geary/44.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Iw5gUfXnvC6v6DYwmk9t"
X-TOI-EXPURGATEID: 150726::1692111237-BE7E29BF-70035F2C/0/0 CLEAN NORMAL
X-TOI-MSGID: 0569d652-2e19-47ef-ac8e-8d33a3804107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 14:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186070

--=-Iw5gUfXnvC6v6DYwmk9t
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 fixes build with DISTRO_FEATURE 'api-documentation' enabled

On Tue, Aug 15 2023 at 04:52:18 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> gtk.h: gtkscrollinfo.h was added, no change of license
> gdk.h: gdkpixbuf.h was deprecated, no change of license
> 
> update renamed build-options
> 
> Overview of Changes in 4.12.0, 05-08-2023
> =========================================
> 
> * List widgets:
>  - Add scroll_to APIs
> 
> * GtkFileLauncher:
>  - Add an always-ask property
> 
> * GtkTextView:
>  - Make backspace behavior match GtkEntry
> 
> * gsk:
>  - Fix handling of luminance in mask nodes
> 
> * Text rendering:
>  - Automate the setting of gtk-hint-font-metrics from the
>    scale factor. This improves font rendering in flatpaks
> 
> * Wayland:
>  - Fix behavior of stylus buttons
>  - Support suspended window state
> 
> * Vulkan:
>  - Many improvements
> 
> * Tools:
>  - Add gtk4-rendernode-tool
> 
> * Debugging:
>  - Drop the GTK_DEBUG_TOUCHSCREEN flag
> 
> * Build:
>  - Some build options have been renamed:
>      gtk_doc -> documentation
>      update_screenshots -> screenshots
>    The old names still work
> 
> Overview of Changes in 4.11.4, 03-07-2023
> =========================================
> 
> * GtkFileChooser:
>  - Default to sorting folders first
>  - Fix a crash when visiting recent files
> 
> * GtkTextView:
>  - Fix corner cases in word navigation
> 
> * GtkMenuButton:
>  - Normalize label layout
> 
> * GtkDropDown:
>  - Add support for sections
> 
> * GtkVideo:
>  - Make the overlay icon clickable
> 
> * GtkWindow:
>  - Clear the resize cursors to avoid artifacts
> 
> * GtkFileDialog:
>  - Always set initial-folder
> 
> * GtkDropDown:
>  - Update on expression changes
> 
> * GtkMapListModel:
>  - Implement GtkSectionModel
> 
> * Accessibility:
>  - Improvements all over the place: GtkButton, GtkPasswordEntry,
>    GtkFontChooserDialog, GtkColorChooserDialog, GtkShortcutsWindow,
>    GtkMenuButton, GtkAboutDialog, GtkFileChooserDialog, 
> GtkStackSidebar,
>    GtkStackSwitcher, GtkMediaControls, GtkColorDialogButton, 
> GtkDropDown,
>    GtkInfoBar, GtkNotebook, GtkPrintUnixDialog, GtkModelButton
>  - Make name computation follow the ARIA spec more closely
>  - Adapt name computation for the common 'nested button' scenario
>  - Change many containers to use `generic` instead of `group`
>  - Use `generic` as the default role
>  - Use `application` instead of `window` for windows
>  - Add properties for accessible names of not directly exposed
>    widgets in GtkListView, GtkGridView and GtkColumnView
> 
> * DND:
>  - Fix criticals when drops are rejected
> 
> * X11:
>  - Fix regressions in GLX setup
> 
> * Windows:
>  - Center newly created transient windows
> 
> * Vulkan:
>  - Add antialising for gradients
>  - Do less work on clipped away nodes
>  - Redo image uploading
>  - Support different image depths and formats
>  - Add a pipeline cache
> 
> * Demos:
>  - gtk4-demo: Improve window sizing
>  - gtk4-demo: Improve focus behavior
>  - gtk4-demo: Add many missing a11y properties
> 
> * Tools:
>  - gtk4-builder-tool: Make render an alias screenshot
> 
> * Inspector:
>  - Show more information in the a11y tab
>  - Add an accessibility overlay with warnings and recommendations
>  - Limit the width of the a11y tab
> 
> * Build:
>  - Require GLib 2.76
>  - Make asan builds work again
>  - Fix the build if ld is not ld.bdf
> 
> Overview of Changes in 4.11.3, 05-06-2023
> =========================================
> 
> * GtkGridView:
>  - Respect css border-spacing
>  - Don't leak the factories
> 
> * GtkListView:
>  - Don't leak the factories
> 
> * GtkColumnView:
>  - Support displaying sections
> 
> * GtkNotebook:
>  - Make the pages model implement GtkSelectionModel
> 
> * GtkScrolledWindow:
>  - Propagate child measure size whenever possible
> 
> * GtkPopoverMenu:
>  - Avoid unnecessary left padding
> 
> * GtkSearchEntry:
>  - Improve size allocation for the clear icon
> 
> * GtkBoxLayout:
>  - Fix a regression from recent baseline work
> 
> * CSS:
>  - Add new binding-friendly css provider apis
> 
> * Theme:
>  - Show focus in the shortcuts window
> 
> * GDK:
>  - Support grayscale and alpha texture formats for loading
>    and saving to png and tiff, and in GL
>  - Fix some regressions in GL context initialization
> 
> * GSK:
>  - Support grayscale and alpha texture formats in the GL renderer
>  - Support straight alpha textures in the GL renderer
>  - Many improvements to the experimental Vulkan renderer
> 
> * Wayland:
>  - Make exporting surface handles more flexible
> 
> * X11:
>  - Trap XRandr errors
>  - Stop using passive grabs during DND
> 
> * Windows:
>  - Many cleanups and simplifications
> 
> * Tests:
>  - Improve test coverage
> 
> * Build:
>  - Some build options have been renamed:
>      demos -> build-demos
>      profile -> demo-profile
>    The old names still work
> 
> * Deprecations:
>  - gtk_css_provider_load_from_data
>  - gdk_wayland_toplevel_unexport_handle
>  - gdk_pixbuf_get_from_surface
>  - gdk_pixbuf_get_from_texture
>  - gtk_image_new_from_pixbuf
>  - gtk_image_set_from_pixbuf
>  - gtk_picture_new_for_pixbuf
>  - gtk_picture_set_pixbuf
> 
> Overview of Changes in 4.11.2, 09-05-2023
> =========================================
> 
> * GtkGLArea:
>  - Add an allowed-apis property
> 
> * GtkListBox:
>  - Fix a problem with gtk_list_box_remove_all
> 
> * Add the GtkSectionModel interface, and implement it in most
>   of our list models
> 
> * GtkListView:
>  - Support displaying sections
> 
> * GtkCenterBox:
>  - Add a shrink-center-last property
> 
> * GtkButton, GtkMenuButton:
>  - Add a can-shrink property
> 
> * GtkPopover:
>  - Fix problems with grabs
> 
> * GtkFileChooser:
>  - Fix a problem with removing files
>  - Make the date, time and location columns work
>  - Fix filtering in the save entry popup
>  - A few memory leak fixes
>  - Handle webdav in the pathbar
> 
> * GtkBox:
>  - Support baselines in vertical orientation with 
> GtkBox:baseline-child
> 
> * Dialogs:
>  - Destroy windows promptly when the async callback finishes
>  - Detect absence of the OpenURI portal and fall back
> 
> * Theme:
>  - Add explicit style classes to a number of widgets
>  - Fix some contrast issues in the dark theme
> 
> * Accessibility:
>  - Fix alert dialogs in the a11y tree
>  - Improve accessibility of GtkShortcutsWindow
> 
> * Layout:
>  - Some fixes to baseline alignment
>  - Separate GTK_ALIGN_BASELINE_CENTER and _FILL
> 
> * CSS:
>  - Fix a crash with color transitions
> 
> * GSK:
>  - Fix problems with negative scales
>  - Improve scaling of offscreens for (cross-fades, masks, blends)
> 
> * GL:
>  - Add GdkGLTextureBuilder, a more flexible api for creating textures
>  - Support setting update regions for GL textures
>  - Ensure that we work with GLES 2
> 
> * Vulkan:
>  - More fixes to the experimental Vulkan renderer
>  - Rework glyph caching
> 
> * Wayland:
>  - Don't destroy wl_surfaces on hide
>  - Plug leaks of compositor-side resources
> 
> * X11:
>  - Fix artifacts in gnome-shell frame decorations
> 
> * Windows:
>  - Fix GL context initialization
> 
> * Inspector:
>  - Improve the action list
>  - Improve the accessibility pane
>  - Fix a crash
> 
> * Tools:
>  - gtk4-node-editor: Improve scaling
>  - gtk4-node-editor: Preserve aspect ratio of textures
>  - gtk4-node-editor: Add some smarter editing
>  - gtk4-demo: Make the stylus demo work with mice
> 
> * Deprecations:
>  - gtk_widget_get_allocated_width/height/baseline
>  - GTK_ALIGN_BASELINE
> 
> Overview of Changes in 4.11.1, 03-04-2023
> =========================================
> 
> * GtkLabel, GtkLinkButton:
>  - Make file:// <file:///> uris work again
> 
> * GtkListView/GtkColumnView/GtkGridView:
>  - Fix clipping issues
>  - Handle focus movement better
>  - Introduce ::tab-behavior properties
>  - Introduce GtkListItem::focusable
>  - Introduce GtkColumnViewCell
>  - Introduce row factories in GtkColumnView
>  - Make list grid and column views inert when not rendering
> 
> * Drag-and-Drop:
>  - Support resizing drag surfaces, using the new
>    GdkDragSurface::compute-size signal
> 
> * Theme:
>  - Port .boxed-list style from Adwaita
>  - Make insensitive pictures appear grayed out
> 
> * Accessibility:
>  - Fix memory leaks
>  - Fix a crash
> 
> * GDK:
>  - Add gdk_surface_get_scale to get the fractional scale
>  - Use fractional scales on Wayland with cairo
>  - Use fractional scales on Wayland with GL if GDK_DEBUG=gl-fractional
>    is set. This support is still experimental
> 
> * GSK:
>  - Allow limiting texture sizes with GSK_MAX_TEXTURE_SIZE
>  - Use samplers for GL texture filtering
>  - Fix problems with texture slicing
>  - Avoid re-uploading textures when possible
>  - Use mipmaps when it is beneficial
> 
> * Wayland:
>  - Fix handling of Drag hotspots
>  - Fix a crash with cursor size 0
>  - Support absolute paths in WAYLAND_DISPLAY
>  - Use the fractional scale protocol
>  - Use a viewporter to set buffer scale
> 
> * Windows:
>  - Fix problems with WGL
> 
> * Vulkan:
>  - Some fixes to the experimental Vulkan renderer
>  - Support fractional scaling
> 
> * Debugging:
>  - Show more Wayland-specific information in the inspector
> 
> * Deprecations:
>  - gtk_widget_translate_coordinates
>  - gdk_surface_create_similar_surface
> 
> * Documentation:
>  - Add a section on coordinate systems
> 
> * Build:
>  - Require wayland-protocols 1.31
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../gtk+/{gtk4_4.10.5.bb => gtk4_4.12.0.bb}            | 10 
> +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk4_4.10.5.bb => gtk4_4.12.0.bb} 
> (94%)
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb 
> b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
> similarity index 94%
> rename from meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
> rename to meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
> index 85fff6c61e..4f38e0cb2c 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
> @@ -27,8 +27,8 @@ DEPENDS = " \
>  LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = " \
>      file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 
> <file://copying;md5=5f30f0716dfdd0d91eb439ebec522ec2/> \
> -    
> <file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737> \
> -    
> <file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2> \
> +    
> <file://gtk/gtk.h;endline=25;md5=61900d77e8d5bc67cf15ad93de9a3490> \
> +    
> <file://gdk/gdk.h;endline=25;md5=a0fb26c1f6b94e66d148279e192c333f> \
>      
> <file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2> 
> \
>  "
> 
> @@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  UPSTREAM_CHECK_REGEX = 
> "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
> 
>  SRC_URI = 
> "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz 
> <http://ftp.gnome.org/pub/gnome/sources/gtk/$%7BMAJ_VER%7D/gtk-$%7BPV%7D.tar.xz>"
> -SRC_URI[sha256sum] = 
> "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956ed74b956369af609b"
> +SRC_URI[sha256sum] = 
> "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d97426da4f84f1f6f"
> 
>  S = "${WORKDIR}/gtk-${PV}"
> 
> @@ -53,11 +53,11 @@ GSETTINGS_PACKAGE:class-native = ""
> 
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES = "opengl"
> -GTKDOC_MESON_OPTION = "gtk_doc"
> +GTKDOC_MESON_OPTION = "documentation"
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
> 
> -EXTRA_OEMESON = " -Dbuild-tests=false -Dbuild-testsuite=false 
> -Ddemos=false"
> +EXTRA_OEMESON = " -Dbuild-tests=false -Dbuild-testsuite=false 
> -Dbuild-demos=false"
> 
>  PACKAGECONFIG ??= "gstreamer ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland x11 vulkan', 
> d)}"
>  PACKAGECONFIG:class-native = "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11', d)}"
> --
> 2.41.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186069): 
> <https://lists.openembedded.org/g/openembedded-core/message/186069>
> Mute This Topic: <https://lists.openembedded.org/mt/100759433/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Iw5gUfXnvC6v6DYwmk9t
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 fixes build with DISTRO_FEATURE 'api-documentation' enabled</div></div><div id="geary-quote" dir="auto"><br>On Tue, Aug 15 2023 at 04:52:18 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">gtk.h: gtkscrollinfo.h was added, no change of license
gdk.h: gdkpixbuf.h was deprecated, no change of license

update renamed build-options

Overview of Changes in 4.12.0, 05-08-2023
=========================================

* List widgets:
 - Add scroll_to APIs

* GtkFileLauncher:
 - Add an always-ask property

* GtkTextView:
 - Make backspace behavior match GtkEntry

* gsk:
 - Fix handling of luminance in mask nodes

* Text rendering:
 - Automate the setting of gtk-hint-font-metrics from the
   scale factor. This improves font rendering in flatpaks

* Wayland:
 - Fix behavior of stylus buttons
 - Support suspended window state

* Vulkan:
 - Many improvements

* Tools:
 - Add gtk4-rendernode-tool

* Debugging:
 - Drop the GTK_DEBUG_TOUCHSCREEN flag

* Build:
 - Some build options have been renamed:
     gtk_doc -&gt; documentation
     update_screenshots -&gt; screenshots
   The old names still work

Overview of Changes in 4.11.4, 03-07-2023
=========================================

* GtkFileChooser:
 - Default to sorting folders first
 - Fix a crash when visiting recent files

* GtkTextView:
 - Fix corner cases in word navigation

* GtkMenuButton:
 - Normalize label layout

* GtkDropDown:
 - Add support for sections

* GtkVideo:
 - Make the overlay icon clickable

* GtkWindow:
 - Clear the resize cursors to avoid artifacts

* GtkFileDialog:
 - Always set initial-folder

* GtkDropDown:
 - Update on expression changes

* GtkMapListModel:
 - Implement GtkSectionModel

* Accessibility:
 - Improvements all over the place: GtkButton, GtkPasswordEntry,
   GtkFontChooserDialog, GtkColorChooserDialog, GtkShortcutsWindow,
   GtkMenuButton, GtkAboutDialog, GtkFileChooserDialog, GtkStackSidebar,
   GtkStackSwitcher, GtkMediaControls, GtkColorDialogButton, GtkDropDown,
   GtkInfoBar, GtkNotebook, GtkPrintUnixDialog, GtkModelButton
 - Make name computation follow the ARIA spec more closely
 - Adapt name computation for the common 'nested button' scenario
 - Change many containers to use `generic` instead of `group`
 - Use `generic` as the default role
 - Use `application` instead of `window` for windows
 - Add properties for accessible names of not directly exposed
   widgets in GtkListView, GtkGridView and GtkColumnView

* DND:
 - Fix criticals when drops are rejected

* X11:
 - Fix regressions in GLX setup

* Windows:
 - Center newly created transient windows

* Vulkan:
 - Add antialising for gradients
 - Do less work on clipped away nodes
 - Redo image uploading
 - Support different image depths and formats
 - Add a pipeline cache

* Demos:
 - gtk4-demo: Improve window sizing
 - gtk4-demo: Improve focus behavior
 - gtk4-demo: Add many missing a11y properties

* Tools:
 - gtk4-builder-tool: Make render an alias screenshot

* Inspector:
 - Show more information in the a11y tab
 - Add an accessibility overlay with warnings and recommendations
 - Limit the width of the a11y tab

* Build:
 - Require GLib 2.76
 - Make asan builds work again
 - Fix the build if ld is not ld.bdf

Overview of Changes in 4.11.3, 05-06-2023
=========================================

* GtkGridView:
 - Respect css border-spacing
 - Don't leak the factories

* GtkListView:
 - Don't leak the factories

* GtkColumnView:
 - Support displaying sections

* GtkNotebook:
 - Make the pages model implement GtkSelectionModel

* GtkScrolledWindow:
 - Propagate child measure size whenever possible

* GtkPopoverMenu:
 - Avoid unnecessary left padding

* GtkSearchEntry:
 - Improve size allocation for the clear icon

* GtkBoxLayout:
 - Fix a regression from recent baseline work

* CSS:
 - Add new binding-friendly css provider apis

* Theme:
 - Show focus in the shortcuts window

* GDK:
 - Support grayscale and alpha texture formats for loading
   and saving to png and tiff, and in GL
 - Fix some regressions in GL context initialization

* GSK:
 - Support grayscale and alpha texture formats in the GL renderer
 - Support straight alpha textures in the GL renderer
 - Many improvements to the experimental Vulkan renderer

* Wayland:
 - Make exporting surface handles more flexible

* X11:
 - Trap XRandr errors
 - Stop using passive grabs during DND

* Windows:
 - Many cleanups and simplifications

* Tests:
 - Improve test coverage

* Build:
 - Some build options have been renamed:
     demos -&gt; build-demos
     profile -&gt; demo-profile
   The old names still work

* Deprecations:
 - gtk_css_provider_load_from_data
 - gdk_wayland_toplevel_unexport_handle
 - gdk_pixbuf_get_from_surface
 - gdk_pixbuf_get_from_texture
 - gtk_image_new_from_pixbuf
 - gtk_image_set_from_pixbuf
 - gtk_picture_new_for_pixbuf
 - gtk_picture_set_pixbuf

Overview of Changes in 4.11.2, 09-05-2023
=========================================

* GtkGLArea:
 - Add an allowed-apis property

* GtkListBox:
 - Fix a problem with gtk_list_box_remove_all

* Add the GtkSectionModel interface, and implement it in most
  of our list models

* GtkListView:
 - Support displaying sections

* GtkCenterBox:
 - Add a shrink-center-last property

* GtkButton, GtkMenuButton:
 - Add a can-shrink property

* GtkPopover:
 - Fix problems with grabs

* GtkFileChooser:
 - Fix a problem with removing files
 - Make the date, time and location columns work
 - Fix filtering in the save entry popup
 - A few memory leak fixes
 - Handle webdav in the pathbar

* GtkBox:
 - Support baselines in vertical orientation with GtkBox:baseline-child

* Dialogs:
 - Destroy windows promptly when the async callback finishes
 - Detect absence of the OpenURI portal and fall back

* Theme:
 - Add explicit style classes to a number of widgets
 - Fix some contrast issues in the dark theme

* Accessibility:
 - Fix alert dialogs in the a11y tree
 - Improve accessibility of GtkShortcutsWindow

* Layout:
 - Some fixes to baseline alignment
 - Separate GTK_ALIGN_BASELINE_CENTER and _FILL

* CSS:
 - Fix a crash with color transitions

* GSK:
 - Fix problems with negative scales
 - Improve scaling of offscreens for (cross-fades, masks, blends)

* GL:
 - Add GdkGLTextureBuilder, a more flexible api for creating textures
 - Support setting update regions for GL textures
 - Ensure that we work with GLES 2

* Vulkan:
 - More fixes to the experimental Vulkan renderer
 - Rework glyph caching

* Wayland:
 - Don't destroy wl_surfaces on hide
 - Plug leaks of compositor-side resources

* X11:
 - Fix artifacts in gnome-shell frame decorations

* Windows:
 - Fix GL context initialization

* Inspector:
 - Improve the action list
 - Improve the accessibility pane
 - Fix a crash

* Tools:
 - gtk4-node-editor: Improve scaling
 - gtk4-node-editor: Preserve aspect ratio of textures
 - gtk4-node-editor: Add some smarter editing
 - gtk4-demo: Make the stylus demo work with mice

* Deprecations:
 - gtk_widget_get_allocated_width/height/baseline
 - GTK_ALIGN_BASELINE

Overview of Changes in 4.11.1, 03-04-2023
=========================================

* GtkLabel, GtkLinkButton:
 - Make <a href="file://">file://</a> uris work again

* GtkListView/GtkColumnView/GtkGridView:
 - Fix clipping issues
 - Handle focus movement better
 - Introduce ::tab-behavior properties
 - Introduce GtkListItem::focusable
 - Introduce GtkColumnViewCell
 - Introduce row factories in GtkColumnView
 - Make list grid and column views inert when not rendering

* Drag-and-Drop:
 - Support resizing drag surfaces, using the new
   GdkDragSurface::compute-size signal

* Theme:
 - Port .boxed-list style from Adwaita
 - Make insensitive pictures appear grayed out

* Accessibility:
 - Fix memory leaks
 - Fix a crash

* GDK:
 - Add gdk_surface_get_scale to get the fractional scale
 - Use fractional scales on Wayland with cairo
 - Use fractional scales on Wayland with GL if GDK_DEBUG=gl-fractional
   is set. This support is still experimental

* GSK:
 - Allow limiting texture sizes with GSK_MAX_TEXTURE_SIZE
 - Use samplers for GL texture filtering
 - Fix problems with texture slicing
 - Avoid re-uploading textures when possible
 - Use mipmaps when it is beneficial

* Wayland:
 - Fix handling of Drag hotspots
 - Fix a crash with cursor size 0
 - Support absolute paths in WAYLAND_DISPLAY
 - Use the fractional scale protocol
 - Use a viewporter to set buffer scale

* Windows:
 - Fix problems with WGL

* Vulkan:
 - Some fixes to the experimental Vulkan renderer
 - Support fractional scaling

* Debugging:
 - Show more Wayland-specific information in the inspector

* Deprecations:
 - gtk_widget_translate_coordinates
 - gdk_surface_create_similar_surface

* Documentation:
 - Add a section on coordinate systems

* Build:
 - Require wayland-protocols 1.31

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../gtk+/{gtk4_4.10.5.bb =&gt; gtk4_4.12.0.bb}            | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.5.bb =&gt; gtk4_4.12.0.bb} (94%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
similarity index 94%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
index 85fff6c61e..4f38e0cb2c 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
@@ -27,8 +27,8 @@ DEPENDS = " \
 LICENSE = "LGPL-2.0-only &amp; LGPL-2.0-or-later &amp; LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = " \
     <a href="file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2">file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2</a> \
-    <a href="file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737">file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737</a> \
-    <a href="file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2">file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2</a> \
+    <a href="file://gtk/gtk.h;endline=25;md5=61900d77e8d5bc67cf15ad93de9a3490">file://gtk/gtk.h;endline=25;md5=61900d77e8d5bc67cf15ad93de9a3490</a> \
+    <a href="file://gdk/gdk.h;endline=25;md5=a0fb26c1f6b94e66d148279e192c333f">file://gdk/gdk.h;endline=25;md5=a0fb26c1f6b94e66d148279e192c333f</a> \
     <a href="file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2">file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2</a> \
 "
 
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P&lt;pver&gt;\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "<a href="http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz">http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz</a>"
-SRC_URI[sha256sum] = "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956ed74b956369af609b"
+SRC_URI[sha256sum] = "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d97426da4f84f1f6f"
 
 S = "${WORKDIR}/gtk-${PV}"
 
@@ -53,11 +53,11 @@ GSETTINGS_PACKAGE:class-native = ""
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-GTKDOC_MESON_OPTION = "gtk_doc"
+GTKDOC_MESON_OPTION = "documentation"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
-EXTRA_OEMESON = " -Dbuild-tests=false -Dbuild-testsuite=false -Ddemos=false"
+EXTRA_OEMESON = " -Dbuild-tests=false -Dbuild-testsuite=false -Dbuild-demos=false"
 
 PACKAGECONFIG ??= "gstreamer <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'wayland x11 vulkan', d)}"
 PACKAGECONFIG:class-native = "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'x11', d)}"
<div>-- 
</div>2.41.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#186069): <a href="https://lists.openembedded.org/g/openembedded-core/message/186069">https://lists.openembedded.org/g/openembedded-core/message/186069</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/100759433/3618223">https://lists.openembedded.org/mt/100759433/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Iw5gUfXnvC6v6DYwmk9t--


