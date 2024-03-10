Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391B9C54E58
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 15:20:03 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.39270.1710083994695905028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 08:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id 4089A2198E
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:19:53 +0100 (CET)
Received: from [192.168.178.67] ([84.154.166.16]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjKxr-1mQmkC0; Sun, 10 Mar 2024 16:19:51 +0100
Date: Sun, 10 Mar 2024 16:20:15 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] gtk4: update 4.12.5 -> 4.13.9
To: openembedded-core@lists.openembedded.org
Message-Id: <R915AS.S2SD7P4CMM6X2@t-online.de>
In-Reply-To: <17BB704B3D5D1758.5850@lists.openembedded.org>
References: <17BB704B3D5D1758.5850@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LcfW5c1R4KdNlYxRR7sH"
X-TOI-EXPURGATEID: 150726::1710083991-337FD937-F6CECEAC/0/0 CLEAN NORMAL
X-TOI-MSGID: 32aa5b01-ffd1-4edc-b52e-ea27c7841be5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 15:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196889

--=-LcfW5c1R4KdNlYxRR7sH
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

another way to fix this would probably be to backport this to vala:
<https://gitlab.gnome.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b3=
95892789d9e>

On Sun, Mar 10 2024 at 08:19:11 AM -07:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> vala has been updated to 0.56.15 and this version requires gtk 4.14
>=20
> Update to gtk 4.14 prerelease to fix compile of vala programs that=20
> would
> otherwise fail with:
> /usr/src/debug/granite/7.4.0/lib/libgranite-7.so.7.4.0.p/Widgets/DatePick=
er.c:248:
> (.text+0x6b8): undefined reference to `gtk_calendar_get_year'
>=20
> - remove ffmpeg PACKAGECONFIG as the ffmpeg backend has been removed
>=20
> Overview of Changes in 4.13.9, 02-03-2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Note: The new renderers and dmabuf support are using graphics drivers
> in different ways than the old gl renderer, and trigger new driver=20
> bugs,
> (see for example <https://gitlab.gnome.org/GNOME/gtk/-/issues/6418>=20
> and
> <https://gitlab.gnome.org/GNOME/gtk/-/issues/6388>). Therefore, it is
> recommended to use the latest mesa release (24.x) with the new=20
> renderers.
>=20
> * GtkEditable:
>  - Fix preconditions to be not too strict
>=20
> * GtkEmojiChooser:
>  - Support search in the locale as well as in English
>=20
> * GtkIconTheme:
>  - Make gtk_icon_paintable_new_for_file support symbolics
>=20
> * GtkVideo:
>  - Fix a problem with cursor handling that could lead to crashes
>=20
> * Accessibility:
>  - Fix GetCharacterAtOffset implementation
>  - Add a Terminal role
>  - Make TextCaretMoved match gtk3
>  - Support multiple levels of GtkEditable delegates
>=20
> * GSK:
>  - Make the node parser more flexible for text nodes
>  - Change the way font scaling is handled to avoid clipping
>  - Fix handling of missing glyphs in the new renderers
>=20
> * X11:
>  - Don't claim to support shadows without a compositor
>=20
> * Wayland:
>  - Fix handling of output scales
>=20
> * Tools:
>  - Add a compare command to gtk4-rendernode-tool
>=20
> * Build:
>  - Fix some ubsan complaints
>=20
> * Translation updates:
>  Basque
>  British English
>  Catalan
>  Finnish
>  Galician
>  Georgian
>  Hebrew
>  Indonesian
>  Kazakh
>  Latvian
>  Lithuanian
>  Persian
>  Polish
>  Russian
>  Slovenian
>  Spanish
>  Turkish
>  Ukrainian
>=20
> Overview of Changes in 4.13.8, 20-02-2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Accessibility:
>  - Add a GtkAccessibleText interface for allowing 3rd party
>    text widgets (notably vte) to be accessible
>  - Avoid duplicate accessible descriptions
>  - Fix GetAccessibleAtPoint
>=20
> * GSK:
>  - Avoid offscreens for disjoint containers
>  - Don't use the gpu renderers with llvmpipe
>  - Fix various rendering issues found by tests
>  - Allow unnormalized node bounds again
>  - Fix a broken case of rounded-rect intersection
>  - Fix handling of external textures in gpu renderers
>  - Make gpu renderers work with WGL on Windows
>=20
> * build:
>  - Allow building without dmabuf support on (old) Linux
>=20
> * X11:
>  - Fix monitor enter/leave signals
>=20
> * Translation updates:
>  Basque
>  Brazilian Portuguese
>  Catalan
>  Czech
>  Galician
>  Georgian
>  Hebrew
>  Lithuanian
>  Persian
>  Russian
>  Turkish
>  Ukrainian
>=20
> Overview of Changes in 4.13.7, 11-02-2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * GtkFileChooser:
>  - Speed up opening
>=20
> * GtkCalendar:
>  - Add some missing setters and getters
>=20
> * Accessibility:
>  - Add socket support for webkit accessibility
>  - Implement AT-SPI text for GtkText
>  - Implement AT-SPI component generically
>  - Add an announce API
>=20
> * GSK:
>  - Make the ngl renderer work on macOS
>  - Fix a crash in the vulkan renderer
>  - Make nodeparser allow aliases for fonts again
>  - Implement cache eviction for glyph and texture caches
>  - Fix ngl shaders to work on GL < 4.0
>  - Require GL 3.3 for the ngl renderer
>  - Fix problems with scaled shadows
>  - Fix problems with holes for underlaid subsurfaces
>  - Improve handling of scales and glyph cache efficiency
>=20
> * Media:
>  - Support dmabufs in the gstreamer backend. This allows
>    zero-copy video playback on Wayland when paired with
>    hardware video decoding
>  - Drop the experimental ffmpeg backend. It hasn't been
>    building for a year
>=20
> * Wayland:
>  - Commit empty frames if and double-buffered state is pending
>  - Fix monitor size information when using mutter without
>    the scale-monitor-framebuffer setting
>  - Clear the current tablet on tab leave, fixing a crash
>=20
> * macOS:
>  - Propagate unhandled input events back to the OS
>=20
> * Tools:
>  - Make the crash handling in gtk4-node-editor more robust
>=20
> * Translation updates
>  Galician
>  Georgian
>  Occitan
>  Turkish
>=20
> Overview of Changes in 4.13.6, 25-01-2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This release changes the ngl renderer to be the default renderer.
>=20
> The intent of this change is to get wider testing and verify that
> the new renderers are production-ready. If significant problems
> show up, we will revert this change for 4.14.
>=20
> You can still override the renderer choice using the GSK_RENDERER
> environment variable.
>=20
> Since ngl can handle fractional scaling much better than the old gl
> renderer, we allow fractional scaling by default with gl now. If you
> are using the old gl renderer (e.g. because your system is limited to
> GLES2), you can disable fractional scaling by setting the GDK_DEBUG
> environment variable to include the gl-no-fractional key.
>=20
> * GtkColumnView:
>  - Fix infinite loops in dispose
>  - Fix problems with weak ref cycles in GtkExpression
>=20
> * GtkListView:
>  - Fix some corner cases with sections during insertions and deletions
>  - Don't double-recycle widgets
>=20
> * GtkStack:
>  - Add automatic cleanup for GtkStackPage
>=20
> * GDK:
>  - Use standard cursor names for drag cursors
>  - Enable fractional scaling with gl by default
>=20
> * GSK:
>  - Many fixes and improvements to the unified renderers:
>    - Fix text rendering with the uber shader
>    - Fix rounding issues with fractional scales
>    - Fix some memory leaks
>    - Many text rendering fixes
>    - Implement subpixel positioning for glyphs
>    - Support custom fonts in node files
>    - Add tests for font rendering
>    - Fix drawing of repeat nodes
>    - Implement subpixels positioning
>    - Evict stale textures, glyphs and atlases from the cache
>  - Some fixes and improvements to the GL renderer:
>    - Fix problems with GLES on Nvidia
>    - Avoid a crash in the mask demo
>    - Respect opacity of the first child node in containers
>  - Some fixes and improvements to the fallback renderer:
>    - Fix drawing of repeat nodes
>  - Make ngl the default renderer
>=20
> * Wayland:
>  - Fix problems with tablet cursors
>  - Fix problems without seats
>=20
> * Accessibility:
>  - Respect a separate "show-status-shapes setting
>  - Fix change notification for accessible names on some widgets
>=20
> * Inspector:
>  - Show the git commit in devel builds
>=20
> * Tools:
>  - Make gtk4-node-editor autosave its contents
>  - Add a benchmark command to gtk4-rendernode-tool
>=20
> * Translation updates:
>  French
>  Galician
>  Georgian
>  Occitan
>  Persian
>  Russian
>  Vietnamese
>=20
> Overview of Changes in 4.13.5, 07-01-2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This release adds two new GSK renderers called vulkan and ngl,
> that are built from the same sources. The new renderers can
> handle many corner cases correctly that the current gl renderer
> does not handle, and they offer advantages such as antialiasing
> and supersampled gradients.
>=20
> The new renderers are still considered experimental, and GTK
> will only use them if they are explicitly selected using the
> GSK_RENDERER environment variable.
>=20
> As part of this work, the GSK include files have been rearranged.
> It is no longer necessary to include renderer-specific headers for
> ngl and vulkan (and doing so will trigger deprecation warnings),
> and their constructors are always available.
>=20
> The previously available experimental GdkVulkanContext APIs and
> the old Vulkan renderer have been removed.
>=20
> Vulkan is now enabled by default, and Linux distributions should
> build GTK with Vulkan support. This requires the glslc shader
> compiler as a new dependency.
>=20
> Vulkan is now also used for dmabuf support.
>=20
> * GtkDropdown:
>  - Fix display of initial selection
>=20
> * GtkShortcutsWindow:
>  - Make the window adapt to smaller screen widths
>=20
> * GtkTextView:
>  - Fix a possible NULL dereference in history
>=20
> * GDK:
>  - Make the png loader safer against overflows
>=20
> * GL:
>  - Fix some errors in handling of texture formats and mipmaps
>=20
> Overview of Changes in 4.13.4, 30-12-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * GtkFileDialog:
>  - Return an error if no file is selected
>=20
> * GtkFileLauncher:
>  - Add a writable property
>=20
> * GtkFileChooserNative:
>  - Make closing portal file dialogs work
>=20
> * GtkEmojiChooser:
>  - Update Emoji data to CLDR v43
>=20
> * GtkStringList:
>  - Add item-type and n-itmes properties
>=20
> * Input:
>  - Respect GTK grabs on DND events
>  - Fix crossing event generation for enter/leave
>=20
> * Wayland:
>  - Avoid recreating wl_buffers needlessly
>  - Be more careful when loading cursors
>=20
> * Dmabuf:
>  - Add support for all Dmabuf formats
>  - Tweak the offload code a bit, allow offloading translucent
>    textures, as long as they are raised. Decline to offload
>    with fractional scales.
>=20
> * Accessibility:
>  - Add a few more accessible roles
>=20
> * GL:
>  - Use GLES by default
>  - Tweak GDK_DEBUG values. The new values are
>    gl-disable-gl, gl-disable-gles and gl-prefer-gl.
>    The gl-legacy and nograbs values have been dropped.
>=20
> * Css:
>  - Reduce memory consumption during theme loading
>  - Fix opacity handling
>=20
> * Theme:
>  - Refresh some of the included symbolic icons
>=20
> * MacOs:
>  - Silence secure-restore message
>=20
> * Build:
>  - Require Vulkan 1.3
>=20
> * Translation updates:
>  Chinese (China)
>  Czech
>  Hebrew
>  Icelandic
>  Polish
>  Russian
>=20
> Overview of Changes in 4.13.3, 15-11-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * GtkGraphicsOffload: A new widget to support passthrough
>   of dmabuf textures with subsurfaces on Wayland
>=20
> * GtkListView:
>  - reduce tree indentation
>=20
> * GtkInspector:
>  - Show more GL information
>  - Add a subsurface overlay
>  - Improve the fps overlay
>=20
> * GDK
>  - Allow implicit modifiers for dmabufs
>  - Support more dmabuf formats: NV16, NV61, NV24, NV42
>    and 3-plane YUV formats
>=20
> * GSK
>  - Fix padding of icons in the GL atlas
>  - Fix handling of texture-scale nodes in cairo
>  - Treat texture-scale nodes more faithfully in GL
>=20
> * Accessibility:
>  - Tweak the accessible name computation for corner cases
>=20
> * The GTK/GDK/GSK_DEBUG environment variables now
>   work in productions as well as in debug builds
>=20
> * Translation updates
>  Catalan
>  French
>  Russian
>=20
> Overview of Changes in 4.13.2, 22-10-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * GtkPrintdialog:
>  - New async-style api to replace GtkPrintOperation
>=20
> * GtkEmojiChooser:
>  - Add more languages: Bengali, Hindi, Japanese, Finnish,
>    Thai and Norwegian bokm=E5l
>=20
> * Accessibility:
>  - Fix some utf8 handling issues
>=20
> * GDK:
>  - Add support for dmabuf textures, with GdkDmabufTextureBuilder
>  - Add a few more supported memory formats for textures
>=20
> * GSK:
>  - Add a fast-path for masking color
>  - Add support for importing dmabuf textures
>  - Handle GLES better by using some extensions
>=20
> * Translation updates:
>  Catalan
>  Russian
>  Turkish
>=20
> Overview of Changes in 4.13.1, 28-09-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * GtkTooltip:
>  - Don't cross native boundaries when looking for tooltips
>=20
> * GtkCenterLayout, GtkEntry, GtkSearchEntry:
>  - Fix some issues with baseline handling
>=20
> * GtkColorButton, GtkFontButton:
>  - Propagate focus-on-click
>=20
> * GtkFileChooser:
>  - Make "Visit file" scroll to the file
>=20
> * GtkSwitch:
>  - Respect text direction
>=20
> * GtkWindow:
>  - Don't assume titlebars are GtkHeaderBars
>=20
> * Printing:
>  - Fix some problems with the portal implementation
>  - Add a new simple print API: GtkPrintDialog
>=20
> * Paths:
>  - GskPathMeasure performance has been improved
>  - Add custom contours for circles, rounded rectangles and rectangles
>  - Simplify GskPathPoint handling
>  - gsk_path_point_get_closest_point now returns the distance as well
>  - Make GskPathBuilder simplify curves
>=20
> * Input:
>  - Handle (some) single-key compose sequences
>  - Fix active state tracking with sensitivity changes and grabs
>=20
> * GSK:
>  - Make the repeated gradients match between GL and cairo
>  - Make rounded rect shrinking match between Vulkan, GL and cairo
>  - Fix parsing of text nodes with color glyphs
>  - Restrict an optimization to the cases where it is crrect
>  - Fix rendering of shadows with opacity
>  - The Vulkan renderer now requires Vulkan 1.2
>  - GL: Transition gradients unpremultiplied
>  - GL: Fix clipping of shadows
>  - GL: Some optimizations
>  - Broadway: Fix memory leaks in the renderer
>=20
> * Wayland:
>  - Make activation more reliable
>=20
> * macOS:
>  - Clamp damage regions to the surface size
>=20
> * Tools:
>  - gtk4-path-tool gained restrict and reverse commands
>  - gtk4-path-tool show and render can show control points
>=20
> * Demos:
>  - Add a demo for hit testing with paths
>=20
> * Build:
>  - Fix build problems with C++ compilers
>=20
> * Deprecations:
>  - gtk_window_present_with_time
>=20
> * Translation updates
>  Brazilian Portuguese
>  British English
>  Catalan
>  Chinese (China)
>  Czech
>  Danish
>  Dutch
>  Esperanto
>  Galician
>  Georgian
>  Italian
>  Korean
>  Latvian
>  Lithuanian
>  Persian
>  Polish
>  Punjabi
>  Slovenian
>  Turkish
>=20
> Overview of Changes in 4.13.0, 25-08-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * GskPath, GskPathBuilder, GskPathMeasure:
>   Data types and APIs for path rendering. These APIs are still
>   considered experimental, and may change until 4.14. Please try
>   them out and give us feedback. Documentation can be found
>   here: <https://docs.gtk.org/gsk4/paths.html>
>=20
> * GtkGridView:
>  - Fix a crash when scrolling
>=20
> * GtkColumnView:
>  - Fix a refcounting issue in the new scroll_to api
>=20
> * GtkTreeView
>  - Fix style classes for sort arrows
>=20
> * GtkEntry:
>  - Improve tracking of user changes (for undo)
>=20
> * GtkNotebook:
>  - Fix a critical when switching pages
>=20
> * GtkColor/FontDialogButton:
>  - Make these widgets activatable
>=20
> * GtkMenuButton:
>  - Fix problems with focus handling
>  - Fix problems with DND
>  - Make flags a settable property
>=20
> * GtkShortcutsWindow:
>  - Add API to build shortcuts windows programmatically
>=20
> * Printing
>  - Fix the cpdb backend build
>=20
> * MacOS:
>  - Make file filters work again
>=20
> * GSK:
>  - Fix issues with color matrix nodes
>=20
> * Wayland:
>  - Fix a crash with compositors other than gnome-shell
>=20
> * Deprecations:
>  - Remaining GtkTreeModel-related types
>=20
> * Demos:
>  - Add a few path demos to gtk4-demo
>=20
> * Tools:
>  - gtk4-path-tool provides a commandline interface for paths
>=20
> * Translation updates:
>  Basque
>  Catalan
>  Finnish
>  Galician
>  Georgian
>  German
>  Greek
>  Indonesian
>  Kazakh
>  Persian
>  Polish
>  Romanian
>  Spanish
>  Swedish
>  Turkish
>  Ukrainian
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-gnome/gtk+/{gtk4_4.12.5.bb =3D> gtk4_4.13.9.bb} | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk4_4.12.5.bb =3D> gtk4_4.13.9.bb}=20
> (96%)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb=20
> b/meta/recipes-gnome/gtk+/gtk4_4.13.9.bb
> similarity index 96%
> rename from meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
> rename to meta/recipes-gnome/gtk+/gtk4_4.13.9.bb
> index a418ef878f..83aa184c8f 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.13.9.bb
> @@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>  UPSTREAM_CHECK_REGEX =3D=20
> "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
>=20
>  SRC_URI =3D=20
> "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz=20
> <http://ftp.gnome.org/pub/gnome/sources/gtk/$%7BMAJ_VER%7D/gtk-$%7BPV%7D.=
tar.xz>"
> -SRC_URI[sha256sum] =3D=20
> "28b356d590ee68ef626e2ef9820b2dd21441484a9a042a5a3f0c40e9dfc4f4f8"
> +SRC_URI[sha256sum] =3D=20
> "2564bd0449b74c68623db3b9fe8627795fb5a9e67c59cb697e2c66f9d05c423a"
>=20
>  S =3D "${WORKDIR}/gtk-${PV}"
>=20
> @@ -71,7 +71,6 @@ PACKAGECONFIG[cloudproviders] =3D=20
> "-Dcloudproviders=3Denabled,-Dcloudproviders=3Ddisab
>  PACKAGECONFIG[cups] =3D=20
> "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,cups,cups=20
> gtk4-printbackend-cups"
>  PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
>  PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
> -PACKAGECONFIG[ffmpeg] =3D=20
> "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddisabled,ffmpeg"
>  # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
>  PACKAGECONFIG[gstreamer] =3D=20
> "-Dmedia-gstreamer=3Denabled,-Dmedia-gstreamer=3Ddisabled,gstreamer1.0-pl=
ugins-bad"
>  PACKAGECONFIG[tracker] =3D=20
> "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tracker,tracker-miners"
> --
> 2.44.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196888):=20
> <https://lists.openembedded.org/g/openembedded-core/message/196888>
> Mute This Topic: <https://lists.openembedded.org/mt/104845249/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-LcfW5c1R4KdNlYxRR7sH
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>another way to fix this would prob=
ably be to backport this to vala:</div><div><a href=3D"https://gitlab.gnome=
.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b395892789d9e">https://=
gitlab.gnome.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b395892789d=
9e</a></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sun, Mar 10 2=
024 at 08:19:11 AM -07:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<=
br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space:=
 break-spaces;">vala has been updated to 0.56.15 and this version requires =
gtk 4.14

Update to gtk 4.14 prerelease to fix compile of vala programs that would
otherwise fail with:
/usr/src/debug/granite/7.4.0/lib/libgranite-7.so.7.4.0.p/Widgets/DatePicker=
.c:248:
(.text+0x6b8): undefined reference to `gtk_calendar_get_year'

- remove ffmpeg PACKAGECONFIG as the ffmpeg backend has been removed

Overview of Changes in 4.13.9, 02-03-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Note: The new renderers and dmabuf support are using graphics drivers
in different ways than the old gl renderer, and trigger new driver bugs,
(see for example <a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/issues/641=
8">https://gitlab.gnome.org/GNOME/gtk/-/issues/6418</a> and
<a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/issues/6388">https://gitlab=
.gnome.org/GNOME/gtk/-/issues/6388</a>). Therefore, it is
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
 - Fix ngl shaders to work on GL &lt; 4.0
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
   Thai and Norwegian bokm=E5l

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
  here: <a href=3D"https://docs.gtk.org/gsk4/paths.html">https://docs.gtk.o=
rg/gsk4/paths.html</a>

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

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 meta/recipes-gnome/gtk+/{gtk4_4.12.5.bb =3D&gt; gtk4_4.13.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.5.bb =3D&gt; gtk4_4.13.9.bb} (96=
%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.13.9.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.13.9.bb
index a418ef878f..83aa184c8f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.13.9.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P&lt;pver&gt;\d+\.(\d*[02468])+(\.\d+)+)\.=
tar.xz"
=20
 SRC_URI =3D "<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_V=
ER}/gtk-${PV}.tar.xz">http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}=
/gtk-${PV}.tar.xz</a>"
-SRC_URI[sha256sum] =3D "28b356d590ee68ef626e2ef9820b2dd21441484a9a042a5a3f=
0c40e9dfc4f4f8"
+SRC_URI[sha256sum] =3D "2564bd0449b74c68623db3b9fe8627795fb5a9e67c59cb697e=
2c66f9d05c423a"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
@@ -71,7 +71,6 @@ PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dena=
bled,-Dcloudproviders=3Ddisab
 PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,cu=
ps,cups gtk4-printbackend-cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
-PACKAGECONFIG[ffmpeg] =3D "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddisab=
led,ffmpeg"
 # gtk4 wants gstreamer-player-1.0 -&gt; gstreamer1.0-plugins-bad
 PACKAGECONFIG[gstreamer] =3D "-Dmedia-gstreamer=3Denabled,-Dmedia-gstreame=
r=3Ddisabled,gstreamer1.0-plugins-bad"
 PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,track=
er,tracker-miners"
<div>--=20
</div>2.44.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#196888): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196888">https://lists.openembedded.org/g/openembedd=
ed-core/message/196888</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104845249/361=
8223">https://lists.openembedded.org/mt/104845249/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-LcfW5c1R4KdNlYxRR7sH--


