Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1549C04A6A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:45:19 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.162729.1692197117716230195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 07:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Il3X7gyz;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1c4c5375329so2931188fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692197117; x=1692801917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41X8IGO7NP5Nv/akEvr+XaZhMyLRGHEK30O9aAdfi+0=;
        b=Il3X7gyzIzLqx2pkKgZ+VGdS+LlkfuOHe/bgNgrEnK2hSWgm272xOb6gwM+NcT/gBz
         GDJ8w04y83PraOibiMNyzBrN627tsI3ukIKc1D8JtNOCoXJW1A2IcnCmL1qFTXyXFxSl
         pMOl2mLEAd83CGSqUem8Kit8ZbNPNpAXiH2X0u8Pe5GhDCWMgWowi1l2bQiDkfVQUIPU
         DNyT66cVXahYYXXXIlsaFAjaCSax571jMQ4Xz+R2jiyEIOSYCGsckXA50Vl7neCcJnyn
         vDmnBR7i3GZze6XFDHd0rpv+gEvSy8wQnvCk9PwDJ6WiENjI76mE0wfbQMsCAw/7OtiL
         Gn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197117; x=1692801917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41X8IGO7NP5Nv/akEvr+XaZhMyLRGHEK30O9aAdfi+0=;
        b=iVW8v5wMiy+25aJQx5NcZj6lmumq/kFEU21yhQbEcKTX+0zR85SeTY96r4tM9epGMf
         UUQ4PYa5n0j9S3TMt1dERiO2E9fnqhiLHfrvyfZcXZzzZoEGx5yPQ4auf41CqEMkuSPw
         m7q8SNLRf+h9zoT2rfT3OZd/AiDzes00ft9R9jDnzrQ2cjo6G6qQXw1U7iv5NHPdYs1v
         bdBkCcP0BnIgUBQAhDGMj5oYaJ+/5Orqk6s4Ou4V2xrC/BVIXY2FLN8dBKDd+ICSbxqm
         cIyeYRd51ubtUtKVyNFJM40KEb0YZ0hPg2+T+O6DYBTsaXyoPV3v4C1oqNMxCJ4GQwIO
         T8gQ==
X-Gm-Message-State: AOJu0YzPdZSk+Pl/kRQRyMafSFlfe0m7HRg15nmIOo2sEvSNK0Xs10d6
	iP9ZoNS0YsO2nRWwWIbF1ekvq+wzIV6FH1foO6iNisuSOnnDRA==
X-Google-Smtp-Source: AGHT+IEmLnA3dt6Ri1VVEqZX85j9yyK2rPHLn8Z9e/PvxnAimavH7hDlUV/DmSPmDv8fJ/ivqYsH1mJoqtxtDfW0k6Q=
X-Received: by 2002:a05:6871:212:b0:1c0:5f7a:896f with SMTP id
 t18-20020a056871021200b001c05f7a896fmr2519051oad.8.1692197116805; Wed, 16 Aug
 2023 07:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230815145218.1561896-1-f_l_k@t-online.de>
In-Reply-To: <20230815145218.1561896-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2023 07:44:50 -0700
Message-ID: <CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186134

clang finds more errors with this upgrade

https://errors.yoctoproject.org/Errors/Details/731552/

On Tue, Aug 15, 2023 at 7:52=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> gtk.h: gtkscrollinfo.h was added, no change of license
> gdk.h: gdkpixbuf.h was deprecated, no change of license
>
> update renamed build-options
>
> Overview of Changes in 4.12.0, 05-08-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
>    GtkMenuButton, GtkAboutDialog, GtkFileChooserDialog, GtkStackSidebar,
>    GtkStackSwitcher, GtkMediaControls, GtkColorDialogButton, GtkDropDown,
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
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
>  - Support baselines in vertical orientation with GtkBox:baseline-child
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
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> * GtkLabel, GtkLinkButton:
>  - Make file:// uris work again
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
>  - Use fractional scales on Wayland with GL if GDK_DEBUG=3Dgl-fractional
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
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gtk+/{gtk4_4.10.5.bb =3D> gtk4_4.12.0.bb}            | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk4_4.10.5.bb =3D> gtk4_4.12.0.bb} (94%=
)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.0.bb
> similarity index 94%
> rename from meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
> rename to meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
> index 85fff6c61e..4f38e0cb2c 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
> @@ -27,8 +27,8 @@ DEPENDS =3D " \
>  LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D " \
>      file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \
> -    file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce88af737=
 \
> -    file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50e08086f2=
 \
> +    file://gtk/gtk.h;endline=3D25;md5=3D61900d77e8d5bc67cf15ad93de9a3490=
 \
> +    file://gdk/gdk.h;endline=3D25;md5=3Da0fb26c1f6b94e66d148279e192c333f=
 \
>      file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19=
d29fb2 \
>  "
>
> @@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>  UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
>
>  SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956e=
d74b956369af609b"
> +SRC_URI[sha256sum] =3D "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d=
97426da4f84f1f6f"
>
>  S =3D "${WORKDIR}/gtk-${PV}"
>
> @@ -53,11 +53,11 @@ GSETTINGS_PACKAGE:class-native =3D ""
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES =3D "opengl"
> -GTKDOC_MESON_OPTION =3D "gtk_doc"
> +GTKDOC_MESON_OPTION =3D "documentation"
>  GIR_MESON_ENABLE_FLAG =3D 'enabled'
>  GIR_MESON_DISABLE_FLAG =3D 'disabled'
>
> -EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Dde=
mos=3Dfalse"
> +EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Dbu=
ild-demos=3Dfalse"
>
>  PACKAGECONFIG ??=3D "gstreamer ${@bb.utils.filter('DISTRO_FEATURES', 'wa=
yland x11 vulkan', d)}"
>  PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x=
11', d)}"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186069): https://lists.openembedded.org/g/openembedde=
d-core/message/186069
> Mute This Topic: https://lists.openembedded.org/mt/100759433/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

