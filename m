Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA074C3064E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:13:29 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.190301.1692285204257842085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 08:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=D6mn/DMe;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-44768609e0bso3107181137.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692285203; x=1692890003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjNYRwEQ12pGcegJjs4K+GsrqvbUydsipaPC7eVdQtY=;
        b=D6mn/DMeLc0DRh0Fgeyn29u8d9CtyPFf3N9psLJIV8ebIEhzhCKDQclxf/Zlvz8boi
         lJLThBEyPW9wJ+l0M5dTzCb3DfvJqmlPQFUlqLfg48ZPS/vzJ7fyjs6CaHuMIZNf/aqk
         1tUxzG1OeLlFCRn6C2h6uQSR8cNkx4rs/7qtr6XdDb6o53qsPJghXQvf4I4+MX5VX9O0
         8mR0u3dQF6A5Dyf5aUCn9HLq42yGNa8SIiASaiYyT+NSlUiHIBlvlVWn9e63KZD207ex
         +fNQkk/sF1gFkit0UN+t24Jxc+Y/dCpqwSOYWutR6D7idX6PWIMPqog+f9WfRqSsui9T
         Up6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692285203; x=1692890003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjNYRwEQ12pGcegJjs4K+GsrqvbUydsipaPC7eVdQtY=;
        b=Q5APkjD4ahZP1VxlCXgGBXoQKSA03M3IiemIin4s5dMVo6CZdcfGvMCiLxLoseNVLL
         KLR+i7xzI+TFOpY0lYYj11d+m/5aOeJCsykzLlWDlFwdsTeIOnBl3F5+b7PmYWBxJN/6
         Ma2MPNOAKHInfwD2UKok9WT6kl2SnT8FWJV5yE1O+Kg2y0VMT4Pkf0WKYCTnA0wZpYpx
         sgN2teUPccNfabwlcki+spiogX6PEIiNoP800lnEx8v5ZA7pyXKC/tAMI/vyqkZWXJyp
         YCa1v99Gx204+DF5jYm/jJDnS6Fcxd7a2ntYI7Qe88P7DD0Tt94IgvwuW42oMF9OVoAN
         BzEw==
X-Gm-Message-State: AOJu0YwPRVRD4nLpJtm0DfSWTtaJe9u6wQaxbs6jZjDhwXClLbjAyzkc
	+6+uV2EZWxCMfVDkIEUTbPDRMOz1drOjusXjCS8=
X-Google-Smtp-Source: AGHT+IHM0kkJUKcxi8yWXJUN08fqIt2SNQ/5q2gKupnzKh3/w+h6yzjTbXB+7rIJlePoXFCYLlXeLu805JomUQHO+MU=
X-Received: by 2002:a67:f04c:0:b0:444:ca59:57a6 with SMTP id
 q12-20020a67f04c000000b00444ca5957a6mr53360vsm.8.1692285203158; Thu, 17 Aug
 2023 08:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230815145218.1561896-1-f_l_k@t-online.de> <CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
 <IHIJZR.16XNVQ6SKCIP1@t-online.de>
In-Reply-To: <IHIJZR.16XNVQ6SKCIP1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 08:12:56 -0700
Message-ID: <CAMKF1soQSYA1xg8iDciyVxxZSqxekVOv-tjaojiXXqgOqU4Pqg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 15:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186325

On Thu, Aug 17, 2023 at 7:49=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Sorry for the late reply. I was on the road yesterday.
>
> I can't reproduce the issue unfortunately. That's because I've been runni=
ng my build host with a homebuilt yocto image for a couple of weeks now to =
find runtime errors (and because it gets me better hardware support). So fa=
r this is running very well, but I seem to have a problem with libgcc-initi=
al. When I want to use the clang toolchain, libcxx-native aborts with:
>
> | /home/flk/poky/build/tmp/hosttools/ld: cannot find crtbeginS.o: No such=
 file or directory
> | /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such file =
or directory
> | /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such file =
or directory
> | clang-16: error: linker command failed with exit code 1 (use -v to see =
the call)
> | ninja: build stopped: subcommand failed.
>

Perhaps need libgcc dev package on build host

> Will have to look into this first. So far I have no idea what is going on=
. In any case, at most I'd be able to hack this with a 'cast', but I don't =
have enough knowledge of the gtk code to find the root cause
>
> I think the best thing would be to create an issue at gitlab, but I'm a b=
it afraid of that because I can't help if something needs to be tested or i=
f I should add more context.
>
> In general this is an issue that should be fixed in gcc because this seem=
s to be indeed a bug.
>
> Short term solutions might be to add -Wno-int-conversion to the cflags fo=
r clang to make it less strict or to disable the experimental vulkan suppor=
t in gtk4 by default?
>
> On Wed, Aug 16 2023 at 07:44:50 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m> wrote:
>
> clang finds more errors with this upgrade https://errors.yoctoproject.org=
/Errors/Details/731552/ On Tue, Aug 15, 2023 at 7:52=E2=80=AFAM Markus Volk=
 <f_l_k@t-online.de> wrote:
>
> gtk.h: gtkscrollinfo.h was added, no change of license gdk.h: gdkpixbuf.h=
 was deprecated, no change of license update renamed build-options Overview=
 of Changes in 4.12.0, 05-08-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D * List widgets: - Add scroll_to APIs * GtkFileLauncher: - Add an =
always-ask property * GtkTextView: - Make backspace behavior match GtkEntry=
 * gsk: - Fix handling of luminance in mask nodes * Text rendering: - Autom=
ate the setting of gtk-hint-font-metrics from the scale factor. This improv=
es font rendering in flatpaks * Wayland: - Fix behavior of stylus buttons -=
 Support suspended window state * Vulkan: - Many improvements * Tools: - Ad=
d gtk4-rendernode-tool * Debugging: - Drop the GTK_DEBUG_TOUCHSCREEN flag *=
 Build: - Some build options have been renamed: gtk_doc -> documentation up=
date_screenshots -> screenshots The old names still work Overview of Change=
s in 4.11.4, 03-07-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * =
GtkFileChooser: - Default to sorting folders first - Fix a crash when visit=
ing recent files * GtkTextView: - Fix corner cases in word navigation * Gtk=
MenuButton: - Normalize label layout * GtkDropDown: - Add support for secti=
ons * GtkVideo: - Make the overlay icon clickable * GtkWindow: - Clear the =
resize cursors to avoid artifacts * GtkFileDialog: - Always set initial-fol=
der * GtkDropDown: - Update on expression changes * GtkMapListModel: - Impl=
ement GtkSectionModel * Accessibility: - Improvements all over the place: G=
tkButton, GtkPasswordEntry, GtkFontChooserDialog, GtkColorChooserDialog, Gt=
kShortcutsWindow, GtkMenuButton, GtkAboutDialog, GtkFileChooserDialog, GtkS=
tackSidebar, GtkStackSwitcher, GtkMediaControls, GtkColorDialogButton, GtkD=
ropDown, GtkInfoBar, GtkNotebook, GtkPrintUnixDialog, GtkModelButton - Make=
 name computation follow the ARIA spec more closely - Adapt name computatio=
n for the common 'nested button' scenario - Change many containers to use `=
generic` instead of `group` - Use `generic` as the default role - Use `appl=
ication` instead of `window` for windows - Add properties for accessible na=
mes of not directly exposed widgets in GtkListView, GtkGridView and GtkColu=
mnView * DND: - Fix criticals when drops are rejected * X11: - Fix regressi=
ons in GLX setup * Windows: - Center newly created transient windows * Vulk=
an: - Add antialising for gradients - Do less work on clipped away nodes - =
Redo image uploading - Support different image depths and formats - Add a p=
ipeline cache * Demos: - gtk4-demo: Improve window sizing - gtk4-demo: Impr=
ove focus behavior - gtk4-demo: Add many missing a11y properties * Tools: -=
 gtk4-builder-tool: Make render an alias screenshot * Inspector: - Show mor=
e information in the a11y tab - Add an accessibility overlay with warnings =
and recommendations - Limit the width of the a11y tab * Build: - Require GL=
ib 2.76 - Make asan builds work again - Fix the build if ld is not ld.bdf O=
verview of Changes in 4.11.3, 05-06-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D * GtkGridView: - Respect css border-spacing - Don't leak th=
e factories * GtkListView: - Don't leak the factories * GtkColumnView: - Su=
pport displaying sections * GtkNotebook: - Make the pages model implement G=
tkSelectionModel * GtkScrolledWindow: - Propagate child measure size whenev=
er possible * GtkPopoverMenu: - Avoid unnecessary left padding * GtkSearchE=
ntry: - Improve size allocation for the clear icon * GtkBoxLayout: - Fix a =
regression from recent baseline work * CSS: - Add new binding-friendly css =
provider apis * Theme: - Show focus in the shortcuts window * GDK: - Suppor=
t grayscale and alpha texture formats for loading and saving to png and tif=
f, and in GL - Fix some regressions in GL context initialization * GSK: - S=
upport grayscale and alpha texture formats in the GL renderer - Support str=
aight alpha textures in the GL renderer - Many improvements to the experime=
ntal Vulkan renderer * Wayland: - Make exporting surface handles more flexi=
ble * X11: - Trap XRandr errors - Stop using passive grabs during DND * Win=
dows: - Many cleanups and simplifications * Tests: - Improve test coverage =
* Build: - Some build options have been renamed: demos -> build-demos profi=
le -> demo-profile The old names still work * Deprecations: - gtk_css_provi=
der_load_from_data - gdk_wayland_toplevel_unexport_handle - gdk_pixbuf_get_=
from_surface - gdk_pixbuf_get_from_texture - gtk_image_new_from_pixbuf - gt=
k_image_set_from_pixbuf - gtk_picture_new_for_pixbuf - gtk_picture_set_pixb=
uf Overview of Changes in 4.11.2, 09-05-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D * GtkGLArea: - Add an allowed-apis property * GtkListBox=
: - Fix a problem with gtk_list_box_remove_all * Add the GtkSectionModel in=
terface, and implement it in most of our list models * GtkListView: - Suppo=
rt displaying sections * GtkCenterBox: - Add a shrink-center-last property =
* GtkButton, GtkMenuButton: - Add a can-shrink property * GtkPopover: - Fix=
 problems with grabs * GtkFileChooser: - Fix a problem with removing files =
- Make the date, time and location columns work - Fix filtering in the save=
 entry popup - A few memory leak fixes - Handle webdav in the pathbar * Gtk=
Box: - Support baselines in vertical orientation with GtkBox:baseline-child=
 * Dialogs: - Destroy windows promptly when the async callback finishes - D=
etect absence of the OpenURI portal and fall back * Theme: - Add explicit s=
tyle classes to a number of widgets - Fix some contrast issues in the dark =
theme * Accessibility: - Fix alert dialogs in the a11y tree - Improve acces=
sibility of GtkShortcutsWindow * Layout: - Some fixes to baseline alignment=
 - Separate GTK_ALIGN_BASELINE_CENTER and _FILL * CSS: - Fix a crash with c=
olor transitions * GSK: - Fix problems with negative scales - Improve scali=
ng of offscreens for (cross-fades, masks, blends) * GL: - Add GdkGLTextureB=
uilder, a more flexible api for creating textures - Support setting update =
regions for GL textures - Ensure that we work with GLES 2 * Vulkan: - More =
fixes to the experimental Vulkan renderer - Rework glyph caching * Wayland:=
 - Don't destroy wl_surfaces on hide - Plug leaks of compositor-side resour=
ces * X11: - Fix artifacts in gnome-shell frame decorations * Windows: - Fi=
x GL context initialization * Inspector: - Improve the action list - Improv=
e the accessibility pane - Fix a crash * Tools: - gtk4-node-editor: Improve=
 scaling - gtk4-node-editor: Preserve aspect ratio of textures - gtk4-node-=
editor: Add some smarter editing - gtk4-demo: Make the stylus demo work wit=
h mice * Deprecations: - gtk_widget_get_allocated_width/height/baseline - G=
TK_ALIGN_BASELINE Overview of Changes in 4.11.1, 03-04-2023 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * GtkLabel, GtkLinkButton: - Make file://=
 uris work again * GtkListView/GtkColumnView/GtkGridView: - Fix clipping is=
sues - Handle focus movement better - Introduce ::tab-behavior properties -=
 Introduce GtkListItem::focusable - Introduce GtkColumnViewCell - Introduce=
 row factories in GtkColumnView - Make list grid and column views inert whe=
n not rendering * Drag-and-Drop: - Support resizing drag surfaces, using th=
e new GdkDragSurface::compute-size signal * Theme: - Port .boxed-list style=
 from Adwaita - Make insensitive pictures appear grayed out * Accessibility=
: - Fix memory leaks - Fix a crash * GDK: - Add gdk_surface_get_scale to ge=
t the fractional scale - Use fractional scales on Wayland with cairo - Use =
fractional scales on Wayland with GL if GDK_DEBUG=3Dgl-fractional is set. T=
his support is still experimental * GSK: - Allow limiting texture sizes wit=
h GSK_MAX_TEXTURE_SIZE - Use samplers for GL texture filtering - Fix proble=
ms with texture slicing - Avoid re-uploading textures when possible - Use m=
ipmaps when it is beneficial * Wayland: - Fix handling of Drag hotspots - F=
ix a crash with cursor size 0 - Support absolute paths in WAYLAND_DISPLAY -=
 Use the fractional scale protocol - Use a viewporter to set buffer scale *=
 Windows: - Fix problems with WGL * Vulkan: - Some fixes to the experimenta=
l Vulkan renderer - Support fractional scaling * Debugging: - Show more Way=
land-specific information in the inspector * Deprecations: - gtk_widget_tra=
nslate_coordinates - gdk_surface_create_similar_surface * Documentation: - =
Add a section on coordinate systems * Build: - Require wayland-protocols 1.=
31 Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../gtk+/{gtk4_4.10.5=
.bb =3D> gtk4_4.12.0.bb} | 10 +++++----- 1 file changed, 5 insertions(+), 5=
 deletions(-) rename meta/recipes-gnome/gtk+/{gtk4_4.10.5.bb =3D> gtk4_4.12=
.0.bb} (94%) diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb b/meta/rec=
ipes-gnome/gtk+/gtk4_4.12.0.bb similarity index 94% rename from meta/recipe=
s-gnome/gtk+/gtk4_4.10.5.bb rename to meta/recipes-gnome/gtk+/gtk4_4.12.0.b=
b index 85fff6c61e..4f38e0cb2c 100644 --- a/meta/recipes-gnome/gtk+/gtk4_4.=
10.5.bb +++ b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb @@ -27,8 +27,8 @@ DEPE=
NDS =3D " \ LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-la=
ter" LIC_FILES_CHKSUM =3D " \ file://COPYING;md5=3D5f30f0716dfdd0d91eb439eb=
ec522ec2 \ - file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce8=
8af737 \ - file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50e080=
86f2 \ + file://gtk/gtk.h;endline=3D25;md5=3D61900d77e8d5bc67cf15ad93de9a34=
90 \ + file://gdk/gdk.h;endline=3D25;md5=3Da0fb26c1f6b94e66d148279e192c333f=
 \ file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d29f=
b2 \ " @@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}=
" UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.x=
z" SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz" -SRC_URI[sha256sum] =3D "9bd5e437e41d48e3d6a224c336b0fd3fd4900=
36dceb8956ed74b956369af609b" +SRC_URI[sha256sum] =3D "a6d10829f405b1afc0b65=
e2a9642c04126a1d1b638d11c6d97426da4f84f1f6f" S =3D "${WORKDIR}/gtk-${PV}" @=
@ -53,11 +53,11 @@ GSETTINGS_PACKAGE:class-native =3D "" ANY_OF_DISTRO_FEAT=
URES =3D "${GTK3DISTROFEATURES}" REQUIRED_DISTRO_FEATURES =3D "opengl" -GTK=
DOC_MESON_OPTION =3D "gtk_doc" +GTKDOC_MESON_OPTION =3D "documentation" GIR=
_MESON_ENABLE_FLAG =3D 'enabled' GIR_MESON_DISABLE_FLAG =3D 'disabled' -EXT=
RA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Ddemos=3D=
false" +EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse=
 -Dbuild-demos=3Dfalse" PACKAGECONFIG ??=3D "gstreamer ${@bb.utils.filter('=
DISTRO_FEATURES', 'wayland x11 vulkan', d)}" PACKAGECONFIG:class-native =3D=
 "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" -- 2.41.0 -=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all messages sent to th=
is group. View/Reply Online (#186069): https://lists.openembedded.org/g/ope=
nembedded-core/message/186069 Mute This Topic: https://lists.openembedded.o=
rg/mt/100759433/1997914 Group Owner: openembedded-core+owner@lists.openembe=
dded.org Unsubscribe: https://lists.openembedded.org/g/openembedded-core/un=
sub [raj.khem@gmail.com] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

