Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A857C54E58
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 15:19:13 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.39434.1710083951413436191
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 08:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id C1BA22C494
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:19:09 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.166.16]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjKxB-1dprxh0; Sun, 10 Mar 2024 16:19:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.12.5 -> 4.13.9
Date: Sun, 10 Mar 2024 16:19:32 +0100
Message-ID: <20240310151932.40108-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1710083949-E5E0A93F-E435BA89/0/0 CLEAN NORMAL
X-TOI-MSGID: a164606f-48fd-4ac2-9b42-012f6728c13a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 15:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196888

vala has been updated to 0.56.15 and this version requires gtk 4.14

Update to gtk 4.14 prerelease to fix compile of vala programs that would
otherwise fail with:
/usr/src/debug/granite/7.4.0/lib/libgranite-7.so.7.4.0.p/Widgets/DatePick=
er.c:248:
(.text+0x6b8): undefined reference to `gtk_calendar_get_year'

- remove ffmpeg PACKAGECONFIG as the ffmpeg backend has been removed

Overview of Changes in 4.13.9, 02-03-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Note: The new renderers and dmabuf support are using graphics drivers
in different ways than the old gl renderer, and trigger new driver bugs,
(see for example https://gitlab.gnome.org/GNOME/gtk/-/issues/6418 and
https://gitlab.gnome.org/GNOME/gtk/-/issues/6388). Therefore, it is
recommended to use the latest mesa release (24.x) with the new renderers.

* GtkEditable:
 - Fix preconditions to be not too strict

* GtkEmojiChooser:
 - Support search in the locale as well as in English

* GtkIconTheme:
 - Make gtk_icon_paintable_new_for_file support symbolics

* GtkVideo:
 - Fix a problem with cursor handling that could lead to crashes

* Accessibility:
 - Fix GetCharacterAtOffset implementation
 - Add a Terminal role
 - Make TextCaretMoved match gtk3
 - Support multiple levels of GtkEditable delegates

* GSK:
 - Make the node parser more flexible for text nodes
 - Change the way font scaling is handled to avoid clipping
 - Fix handling of missing glyphs in the new renderers

* X11:
 - Don't claim to support shadows without a compositor

* Wayland:
 - Fix handling of output scales

* Tools:
 - Add a compare command to gtk4-rendernode-tool

* Build:
 - Fix some ubsan complaints

* Translation updates:
 Basque
 British English
 Catalan
 Finnish
 Galician
 Georgian
 Hebrew
 Indonesian
 Kazakh
 Latvian
 Lithuanian
 Persian
 Polish
 Russian
 Slovenian
 Spanish
 Turkish
 Ukrainian

Overview of Changes in 4.13.8, 20-02-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Accessibility:
 - Add a GtkAccessibleText interface for allowing 3rd party
   text widgets (notably vte) to be accessible
 - Avoid duplicate accessible descriptions
 - Fix GetAccessibleAtPoint

* GSK:
 - Avoid offscreens for disjoint containers
 - Don't use the gpu renderers with llvmpipe
 - Fix various rendering issues found by tests
 - Allow unnormalized node bounds again
 - Fix a broken case of rounded-rect intersection
 - Fix handling of external textures in gpu renderers
 - Make gpu renderers work with WGL on Windows

* build:
 - Allow building without dmabuf support on (old) Linux

* X11:
 - Fix monitor enter/leave signals

* Translation updates:
 Basque
 Brazilian Portuguese
 Catalan
 Czech
 Galician
 Georgian
 Hebrew
 Lithuanian
 Persian
 Russian
 Turkish
 Ukrainian

Overview of Changes in 4.13.7, 11-02-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkFileChooser:
 - Speed up opening

* GtkCalendar:
 - Add some missing setters and getters

* Accessibility:
 - Add socket support for webkit accessibility
 - Implement AT-SPI text for GtkText
 - Implement AT-SPI component generically
 - Add an announce API

* GSK:
 - Make the ngl renderer work on macOS
 - Fix a crash in the vulkan renderer
 - Make nodeparser allow aliases for fonts again
 - Implement cache eviction for glyph and texture caches
 - Fix ngl shaders to work on GL < 4.0
 - Require GL 3.3 for the ngl renderer
 - Fix problems with scaled shadows
 - Fix problems with holes for underlaid subsurfaces
 - Improve handling of scales and glyph cache efficiency

* Media:
 - Support dmabufs in the gstreamer backend. This allows
   zero-copy video playback on Wayland when paired with
   hardware video decoding
 - Drop the experimental ffmpeg backend. It hasn't been
   building for a year

* Wayland:
 - Commit empty frames if and double-buffered state is pending
 - Fix monitor size information when using mutter without
   the scale-monitor-framebuffer setting
 - Clear the current tablet on tab leave, fixing a crash

* macOS:
 - Propagate unhandled input events back to the OS

* Tools:
 - Make the crash handling in gtk4-node-editor more robust

* Translation updates
 Galician
 Georgian
 Occitan
 Turkish

Overview of Changes in 4.13.6, 25-01-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release changes the ngl renderer to be the default renderer.

The intent of this change is to get wider testing and verify that
the new renderers are production-ready. If significant problems
show up, we will revert this change for 4.14.

You can still override the renderer choice using the GSK_RENDERER
environment variable.

Since ngl can handle fractional scaling much better than the old gl
renderer, we allow fractional scaling by default with gl now. If you
are using the old gl renderer (e.g. because your system is limited to
GLES2), you can disable fractional scaling by setting the GDK_DEBUG
environment variable to include the gl-no-fractional key.

* GtkColumnView:
 - Fix infinite loops in dispose
 - Fix problems with weak ref cycles in GtkExpression

* GtkListView:
 - Fix some corner cases with sections during insertions and deletions
 - Don't double-recycle widgets

* GtkStack:
 - Add automatic cleanup for GtkStackPage

* GDK:
 - Use standard cursor names for drag cursors
 - Enable fractional scaling with gl by default

* GSK:
 - Many fixes and improvements to the unified renderers:
   - Fix text rendering with the uber shader
   - Fix rounding issues with fractional scales
   - Fix some memory leaks
   - Many text rendering fixes
   - Implement subpixel positioning for glyphs
   - Support custom fonts in node files
   - Add tests for font rendering
   - Fix drawing of repeat nodes
   - Implement subpixels positioning
   - Evict stale textures, glyphs and atlases from the cache
 - Some fixes and improvements to the GL renderer:
   - Fix problems with GLES on Nvidia
   - Avoid a crash in the mask demo
   - Respect opacity of the first child node in containers
 - Some fixes and improvements to the fallback renderer:
   - Fix drawing of repeat nodes
 - Make ngl the default renderer

* Wayland:
 - Fix problems with tablet cursors
 - Fix problems without seats

* Accessibility:
 - Respect a separate "show-status-shapes setting
 - Fix change notification for accessible names on some widgets

* Inspector:
 - Show the git commit in devel builds

* Tools:
 - Make gtk4-node-editor autosave its contents
 - Add a benchmark command to gtk4-rendernode-tool

* Translation updates:
 French
 Galician
 Georgian
 Occitan
 Persian
 Russian
 Vietnamese

Overview of Changes in 4.13.5, 07-01-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release adds two new GSK renderers called vulkan and ngl,
that are built from the same sources. The new renderers can
handle many corner cases correctly that the current gl renderer
does not handle, and they offer advantages such as antialiasing
and supersampled gradients.

The new renderers are still considered experimental, and GTK
will only use them if they are explicitly selected using the
GSK_RENDERER environment variable.

As part of this work, the GSK include files have been rearranged.
It is no longer necessary to include renderer-specific headers for
ngl and vulkan (and doing so will trigger deprecation warnings),
and their constructors are always available.

The previously available experimental GdkVulkanContext APIs and
the old Vulkan renderer have been removed.

Vulkan is now enabled by default, and Linux distributions should
build GTK with Vulkan support. This requires the glslc shader
compiler as a new dependency.

Vulkan is now also used for dmabuf support.

* GtkDropdown:
 - Fix display of initial selection

* GtkShortcutsWindow:
 - Make the window adapt to smaller screen widths

* GtkTextView:
 - Fix a possible NULL dereference in history

* GDK:
 - Make the png loader safer against overflows

* GL:
 - Fix some errors in handling of texture formats and mipmaps

Overview of Changes in 4.13.4, 30-12-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkFileDialog:
 - Return an error if no file is selected

* GtkFileLauncher:
 - Add a writable property

* GtkFileChooserNative:
 - Make closing portal file dialogs work

* GtkEmojiChooser:
 - Update Emoji data to CLDR v43

* GtkStringList:
 - Add item-type and n-itmes properties

* Input:
 - Respect GTK grabs on DND events
 - Fix crossing event generation for enter/leave

* Wayland:
 - Avoid recreating wl_buffers needlessly
 - Be more careful when loading cursors

* Dmabuf:
 - Add support for all Dmabuf formats
 - Tweak the offload code a bit, allow offloading translucent
   textures, as long as they are raised. Decline to offload
   with fractional scales.

* Accessibility:
 - Add a few more accessible roles

* GL:
 - Use GLES by default
 - Tweak GDK_DEBUG values. The new values are
   gl-disable-gl, gl-disable-gles and gl-prefer-gl.
   The gl-legacy and nograbs values have been dropped.

* Css:
 - Reduce memory consumption during theme loading
 - Fix opacity handling

* Theme:
 - Refresh some of the included symbolic icons

* MacOs:
 - Silence secure-restore message

* Build:
 - Require Vulkan 1.3

* Translation updates:
 Chinese (China)
 Czech
 Hebrew
 Icelandic
 Polish
 Russian

Overview of Changes in 4.13.3, 15-11-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkGraphicsOffload: A new widget to support passthrough
  of dmabuf textures with subsurfaces on Wayland

* GtkListView:
 - reduce tree indentation

* GtkInspector:
 - Show more GL information
 - Add a subsurface overlay
 - Improve the fps overlay

* GDK
 - Allow implicit modifiers for dmabufs
 - Support more dmabuf formats: NV16, NV61, NV24, NV42
   and 3-plane YUV formats

* GSK
 - Fix padding of icons in the GL atlas
 - Fix handling of texture-scale nodes in cairo
 - Treat texture-scale nodes more faithfully in GL

* Accessibility:
 - Tweak the accessible name computation for corner cases

* The GTK/GDK/GSK_DEBUG environment variables now
  work in productions as well as in debug builds

* Translation updates
 Catalan
 French
 Russian

Overview of Changes in 4.13.2, 22-10-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkPrintdialog:
 - New async-style api to replace GtkPrintOperation

* GtkEmojiChooser:
 - Add more languages: Bengali, Hindi, Japanese, Finnish,
   Thai and Norwegian bokm=C3=A5l

* Accessibility:
 - Fix some utf8 handling issues

* GDK:
 - Add support for dmabuf textures, with GdkDmabufTextureBuilder
 - Add a few more supported memory formats for textures

* GSK:
 - Add a fast-path for masking color
 - Add support for importing dmabuf textures
 - Handle GLES better by using some extensions

* Translation updates:
 Catalan
 Russian
 Turkish

Overview of Changes in 4.13.1, 28-09-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkTooltip:
 - Don't cross native boundaries when looking for tooltips

* GtkCenterLayout, GtkEntry, GtkSearchEntry:
 - Fix some issues with baseline handling

* GtkColorButton, GtkFontButton:
 - Propagate focus-on-click

* GtkFileChooser:
 - Make "Visit file" scroll to the file

* GtkSwitch:
 - Respect text direction

* GtkWindow:
 - Don't assume titlebars are GtkHeaderBars

* Printing:
 - Fix some problems with the portal implementation
 - Add a new simple print API: GtkPrintDialog

* Paths:
 - GskPathMeasure performance has been improved
 - Add custom contours for circles, rounded rectangles and rectangles
 - Simplify GskPathPoint handling
 - gsk_path_point_get_closest_point now returns the distance as well
 - Make GskPathBuilder simplify curves

* Input:
 - Handle (some) single-key compose sequences
 - Fix active state tracking with sensitivity changes and grabs

* GSK:
 - Make the repeated gradients match between GL and cairo
 - Make rounded rect shrinking match between Vulkan, GL and cairo
 - Fix parsing of text nodes with color glyphs
 - Restrict an optimization to the cases where it is crrect
 - Fix rendering of shadows with opacity
 - The Vulkan renderer now requires Vulkan 1.2
 - GL: Transition gradients unpremultiplied
 - GL: Fix clipping of shadows
 - GL: Some optimizations
 - Broadway: Fix memory leaks in the renderer

* Wayland:
 - Make activation more reliable

* macOS:
 - Clamp damage regions to the surface size

* Tools:
 - gtk4-path-tool gained restrict and reverse commands
 - gtk4-path-tool show and render can show control points

* Demos:
 - Add a demo for hit testing with paths

* Build:
 - Fix build problems with C++ compilers

* Deprecations:
 - gtk_window_present_with_time

* Translation updates
 Brazilian Portuguese
 British English
 Catalan
 Chinese (China)
 Czech
 Danish
 Dutch
 Esperanto
 Galician
 Georgian
 Italian
 Korean
 Latvian
 Lithuanian
 Persian
 Polish
 Punjabi
 Slovenian
 Turkish

Overview of Changes in 4.13.0, 25-08-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GskPath, GskPathBuilder, GskPathMeasure:
  Data types and APIs for path rendering. These APIs are still
  considered experimental, and may change until 4.14. Please try
  them out and give us feedback. Documentation can be found
  here: https://docs.gtk.org/gsk4/paths.html

* GtkGridView:
 - Fix a crash when scrolling

* GtkColumnView:
 - Fix a refcounting issue in the new scroll_to api

* GtkTreeView
 - Fix style classes for sort arrows

* GtkEntry:
 - Improve tracking of user changes (for undo)

* GtkNotebook:
 - Fix a critical when switching pages

* GtkColor/FontDialogButton:
 - Make these widgets activatable

* GtkMenuButton:
 - Fix problems with focus handling
 - Fix problems with DND
 - Make flags a settable property

* GtkShortcutsWindow:
 - Add API to build shortcuts windows programmatically

* Printing
 - Fix the cpdb backend build

* MacOS:
 - Make file filters work again

* GSK:
 - Fix issues with color matrix nodes

* Wayland:
 - Fix a crash with compositors other than gnome-shell

* Deprecations:
 - Remaining GtkTreeModel-related types

* Demos:
 - Add a few path demos to gtk4-demo

* Tools:
 - gtk4-path-tool provides a commandline interface for paths

* Translation updates:
 Basque
 Catalan
 Finnish
 Galician
 Georgian
 German
 Greek
 Indonesian
 Kazakh
 Persian
 Polish
 Romanian
 Spanish
 Swedish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.12.5.bb =3D> gtk4_4.13.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.5.bb =3D> gtk4_4.13.9.bb} (96%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.13.9.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.13.9.bb
index a418ef878f..83aa184c8f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.13.9.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "28b356d590ee68ef626e2ef9820b2dd21441484a9a042a5a=
3f0c40e9dfc4f4f8"
+SRC_URI[sha256sum] =3D "2564bd0449b74c68623db3b9fe8627795fb5a9e67c59cb69=
7e2c66f9d05c423a"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
@@ -71,7 +71,6 @@ PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3De=
nabled,-Dcloudproviders=3Ddisab
 PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups,cups gtk4-printbackend-cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
-PACKAGECONFIG[ffmpeg] =3D "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddis=
abled,ffmpeg"
 # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
 PACKAGECONFIG[gstreamer] =3D "-Dmedia-gstreamer=3Denabled,-Dmedia-gstrea=
mer=3Ddisabled,gstreamer1.0-plugins-bad"
 PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tra=
cker,tracker-miners"
--=20
2.44.0


