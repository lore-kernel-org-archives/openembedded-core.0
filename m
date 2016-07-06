Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90DAE60589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 03:09:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6639I8b019479
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Jul 2016 20:09:18 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Jul 2016 20:09:17 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
	<d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
	<577BB188.6050703@windriver.com>
	<CAHiDW_EDPmiEVqihcQ4qu5BU8S9YJOSRw6VXXEmhKgPS0QDppQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <577C765C.9060409@windriver.com>
Date: Wed, 6 Jul 2016 11:09:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_EDPmiEVqihcQ4qu5BU8S9YJOSRw6VXXEmhKgPS0QDppQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/10] gtk+3: Upgrade 3.18.8 -> 3.20.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jul 2016 03:09:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/05/2016 10:08 PM, Jussi Kukkonen wrote:
>
>
> On 5 July 2016 at 16:09, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>
>     Hi,
>
>     I can't build it on Ubuntu 14.04:
>
>
> I can't see from the log why the file would be be missing and can't reproduce
> that locally... Cleaning sstate should be a valid workaround but I'd be really
> interested in reproducing this: if you can reproduce (or remember if you did any
>   distro feature or  packageconfig changes) please let me know the details.
>
> In the meantime I'll take another look at the build system...

Please see below ...


>         +diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
>         +similarity index 100%
>         +rename from gdk/x11/gdkx.h
>         +rename to gdk/x11/gdkx-with-gl-context.h

Older patch tool such as patch 2.7.1 can't apply this patch, I will update it.

// Robert

>            diff --git a/gdk/x11/gdkx-without-gl-context.h
>         b/gdk/x11/gdkx-without-gl-context.h
>            new file mode 100644
>            index 0000000..c9e2617
>         @@ -686,76 +617,11 @@ index 0000000..c9e2617
>            +#undef __GDKX_H_INSIDE__
>            +
>            +#endif /* __GDK_X_H__ */
>         -diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
>         -deleted file mode 100644
>         -index ae05fa6..0000000
>         ---- a/gdk/x11/gdkx.h
>         -+++ /dev/null
>         -@@ -1,59 +0,0 @@
>         --/* GDK - The GIMP Drawing Kit
>         -- * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh
>         MacDonald
>         -- *
>         -- * This library is free software; you can redistribute it and/or
>         -- * modify it under the terms of the GNU Lesser General Public
>         -- * License as published by the Free Software Foundation; either
>         -- * version 2 of the License, or (at your option) any later version.
>         -- *
>         -- * This library is distributed in the hope that it will be useful,
>         -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
>         -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>         -- * Lesser General Public License for more details.
>         -- *
>         -- * You should have received a copy of the GNU Lesser General Public
>         -- * License along with this library. If not, see
>         <http://www.gnu.org/licenses/>.
>         -- */
>         --
>         --/*
>         -- * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
>         -- * file for a list of people on the GTK+ Team.  See the ChangeLog
>         -- * files for a list of changes.  These files are distributed with
>         -- * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
>         -- */
>         --
>         --#ifndef __GDK_X_H__
>         --#define __GDK_X_H__
>         --
>         --#include <gdk/gdk.h>
>         --
>         --#include <X11/Xlib.h>
>         --#include <X11/Xutil.h>
>         --
>         --#define __GDKX_H_INSIDE__
>         --
>         --#include <gdk/x11/gdkx11applaunchcontext.h>
>         --#include <gdk/x11/gdkx11cursor.h>
>         --#include <gdk/x11/gdkx11device.h>
>         --#include <gdk/x11/gdkx11device-core.h>
>         --#include <gdk/x11/gdkx11device-xi2.h>
>         --#include <gdk/x11/gdkx11devicemanager.h>
>         --#include <gdk/x11/gdkx11devicemanager-core.h>
>         --#include <gdk/x11/gdkx11devicemanager-xi2.h>
>         --#include <gdk/x11/gdkx11display.h>
>         --#include <gdk/x11/gdkx11displaymanager.h>
>         --#include <gdk/x11/gdkx11dnd.h>
>         --#include <gdk/x11/gdkx11glcontext.h>
>         --#include <gdk/x11/gdkx11keys.h>
>         --#include <gdk/x11/gdkx11property.h>
>         --#include <gdk/x11/gdkx11screen.h>
>         --#include <gdk/x11/gdkx11selection.h>
>         --#include <gdk/x11/gdkx11utils.h>
>         --#include <gdk/x11/gdkx11visual.h>
>         --#include <gdk/x11/gdkx11window.h>
>         --
>         --#include <gdk/x11/gdkx-autocleanups.h>
>         --
>         --#undef __GDKX_H_INSIDE__
>         --
>         --#endif /* __GDK_X_H__ */
>            diff --git a/gtk/Makefile.am b/gtk/Makefile.am
>         -index 801c3a5..2d8839d 100644
>         +index 6a53a2b..49a35e6 100644
>            --- a/gtk/Makefile.am
>            +++ b/gtk/Makefile.am
>         -@@ -1246,14 +1246,13 @@ gtkprivatetypebuiltins.c:
>         $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
>         +@@ -1351,14 +1351,13 @@ gtkprivatetypebuiltins.c:
>         $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
>                  && cp xgen-gptbc gtkprivatetypebuiltins.c  \
>                  && rm -f xgen-gptbc
>
>         @@ -772,7 +638,7 @@ index 801c3a5..2d8839d 100644
>             gtktestutils.c: gtktypefuncs.c
>
>            diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
>         -index 4098409..45fa1d1 100644
>         +index 245fc6b..4214ad1 100644
>            --- a/gtk/gtkglarea.c
>            +++ b/gtk/gtkglarea.c
>            @@ -28,7 +28,9 @@
>         @@ -868,7 +734,7 @@ index 4098409..45fa1d1 100644
>
>             static gboolean
>            diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
>         -index 0611373..4499a29 100644
>         +index 4eab3a7..c4e900e 100644
>            --- a/gtk/inspector/general.c
>            +++ b/gtk/inspector/general.c
>            @@ -33,8 +33,10 @@
>         @@ -882,7 +748,7 @@ index 0611373..4499a29 100644
>
>             #ifdef GDK_WINDOWING_WIN32
>             #include "win32/gdkwin32.h"
>         -@@ -146,6 +148,7 @@ append_extension_row (GtkInspectorGeneral *gen,
>         +@@ -147,6 +149,7 @@ append_extension_row (GtkInspectorGeneral *gen,
>               gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
>             }
>
>         @@ -890,7 +756,7 @@ index 0611373..4499a29 100644
>             #ifdef GDK_WINDOWING_X11
>             static void
>             append_glx_extension_row (GtkInspectorGeneral *gen,
>         -@@ -155,6 +158,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
>         +@@ -156,6 +159,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
>               append_extension_row (gen, ext, epoxy_has_glx_extension (dpy, 0,
>         ext));
>             }
>             #endif
>         @@ -898,27 +764,27 @@ index 0611373..4499a29 100644
>
>             #ifdef GDK_WINDOWING_WAYLAND
>             static void
>         -@@ -174,6 +178,7 @@ init_gl (GtkInspectorGeneral *gen)
>         -
>         -   display = gdk_display_get_default ();
>         -
>         +@@ -171,6 +175,7 @@ append_egl_extension_row (GtkInspectorGeneral *gen,
>         + static void
>         + init_gl (GtkInspectorGeneral *gen)
>         + {
>            +#ifdef HAVE_OPENGL
>             #ifdef GDK_WINDOWING_X11
>         -   if (GDK_IS_X11_DISPLAY (display))
>         +   if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
>                 {
>         -@@ -199,6 +204,7 @@ init_gl (GtkInspectorGeneral *gen)
>         +@@ -197,6 +202,7 @@ init_gl (GtkInspectorGeneral *gen)
>                 }
>               else
>             #endif
>            +#endif
>             #ifdef GDK_WINDOWING_WAYLAND
>         -   if (GDK_IS_WAYLAND_DISPLAY (display))
>         +   if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
>                 {
>            diff --git a/tests/Makefile.am b/tests/Makefile.am
>         -index 50f2986..3b39169 100644
>         +index 681807d..2941a36 100644
>            --- a/tests/Makefile.am
>            +++ b/tests/Makefile.am
>         -@@ -78,8 +78,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)     \
>         +@@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)     \
>                  testfullscreen                  \
>                  testgeometry                    \
>                  testgiconpixbuf                 \
>         @@ -927,18 +793,19 @@ index 50f2986..3b39169 100644
>                  testgrid                        \
>                  testgtk                         \
>                  testheaderbar                   \
>         -@@ -166,10 +164,16 @@ noinst_PROGRAMS =  $(TEST_PROGS) \
>         +@@ -169,11 +167,17 @@ noinst_PROGRAMS =  $(TEST_PROGS) \
>                  testactionbar                   \
>                  testwindowsize                  \
>                  testpopover                     \
>            -     gdkgears                        \
>                  listmodel                       \
>         +       testpopup                       \
>                  $(NULL)
>
>            +if HAVE_OPENGL
>            +noinst_PROGRAMS +=
>         -+      testglarea                      \
>         -+      testglblending                  \
>         ++      testglarea                      \
>         ++      testglblending                  \
>            +     gdkgears
>            +endif
>            +
>         @@ -946,11 +813,11 @@ index 50f2986..3b39169 100644
>             noinst_PROGRAMS += testerrors
>             endif
>            diff --git a/testsuite/gtk/objects-finalize.c
>         b/testsuite/gtk/objects-finalize.c
>         -index 3568505..682ea10 100644
>         +index e0ebee0..703643c 100644
>            --- a/testsuite/gtk/objects-finalize.c
>            +++ b/testsuite/gtk/objects-finalize.c
>         -@@ -114,8 +114,10 @@ main (int argc, char **argv)
>         -         all_types[i] != GDK_TYPE_X11_DISPLAY &&
>         +@@ -115,8 +115,10 @@ main (int argc, char **argv)
>         +         all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
>                    all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
>                    all_types[i] != GDK_TYPE_X11_DISPLAY_MANAGER &&
>            +#ifdef HAVE_OPENGL
>         @@ -961,5 +828,5 @@ index 3568505..682ea10 100644
>                    all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
>                    all_types[i] != gdk_pixbuf_simple_anim_iter_get_type())
>            --
>         -2.8.1
>         +2.1.4
>
>         diff --git
>         a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>         b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>         new file mode 100644
>         index 0000000..634b3a4
>         --- /dev/null
>         +++
>         b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>         @@ -0,0 +1,36 @@
>         +From 97b78e566634579bbae51be914aeaaa921137a8b Mon Sep 17 00:00:00 2001
>         +From: Jussi Kukkonen <jussi.kukkonen@intel.com
>         <mailto:jussi.kukkonen@intel.com>>
>         +Date: Thu, 9 Jun 2016 11:21:36 +0300
>         +Subject: [PATCH 4/4] configure.ac <http://configure.ac>: Fix
>         wayland-protocols path
>         +
>         +The wayland-protocols directory is used during build: Fix the path
>         +to point to sysroot specified in recipe.
>         +
>         +Normally PKG_CONFIG_SYSROOT_DIR could be used in configure.ac
>         <http://configure.ac> but that
>         +breaks multilib gtk+ as it would point to multilib sysroot when the
>         +(allarch) wayland-protocols is actually in the machine sysroot.
>         +
>         +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
>         <mailto:jussi.kukkonen@intel.com>>
>         +Upstream-Status: Inappropriate [embedded specific]
>         +
>         +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
>         <mailto:jussi.kukkonen@intel.com>>
>         +---
>         + configure.ac <http://configure.ac> | 2 +-
>         + 1 file changed, 1 insertion(+), 1 deletion(-)
>         +
>         +diff --git a/configure.ac <http://configure.ac> b/configure.ac
>         <http://configure.ac>
>         +index a3e9beb..dde9dc5 100644
>         +--- a/configure.ac <http://configure.ac>
>         ++++ b/configure.ac <http://configure.ac>
>         +@@ -461,7 +461,7 @@ fi
>         + if test "$enable_wayland_backend" = "yes"; then
>         +   # For the cairo image backend
>         +   cairo_backends="$cairo_backends cairo"
>         +-  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG
>         --variable=pkgdatadir wayland-protocols`)
>         ++  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR,
>         ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir
>         wayland-protocols`)
>         +   GDK_BACKENDS="$GDK_BACKENDS wayland"
>         +   GDK_WINDOWING="$GDK_WINDOWING
>         + #define GDK_WINDOWING_WAYLAND"
>         +--
>         +2.1.4
>         +
>         diff --git a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>         b/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>         deleted file mode 100644
>         index 32d8a84..0000000
>         --- a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>         +++ /dev/null
>         @@ -1,118 +0,0 @@
>         -window: Check if we can use CSD before enabling them
>         -
>         -Upstream-Status: Backport
>         -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
>         <mailto:jussi.kukkonen@intel.com>>
>         -
>         -
>         -From c5e5ee67490e7e7af56052d8f8beb75db002c2f1 Mon Sep 17 00:00:00 2001
>         -From: Emmanuele Bassi <ebassi@gnome.org <mailto:ebassi@gnome.org>>
>         -Date: Wed, 3 Jun 2015 14:07:29 +0100
>         -Subject: window: Check if we can use CSD before enabling them
>         -
>         -The change in 03213b9509fc1df16c66194ea168aed6c15110e9 changed the rules
>         -as to when CSD can be enabled, but it also unconditionally enables CSD
>         -with the implicit assumption that client-side shadows were the real
>         -issue, and that we could work around that by drawing our own borders.
>         -This also means that setting a titlebar for a GtkWindow will enable CSD
>         -unconditionally.
>         -
>         -In reality, some window managers (like Matchbox) *only* support
>         -server-side decorations, and will ignore all hints to the contrary, to
>         -the point of drawing decorations at random locations on top of the
>         -window.
>         -
>         -Since CSD are enabled unconditionally, the GTK_CSD environment variable
>         -is also not a suitable escape hatch.
>         -
>         -In the grand tradition of asking ourselves if we should do something
>         -just because we can, we should split the environment checks from the
>         -checks on what the user requested; by doing that, we can also check
>         -when enabling client-side decorations, and ideally bail out if needed.
>         -
>         -https://bugzilla.gnome.org/show_bug.cgi?id=750343
>         -
>         -diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
>         -index 423c6bd..9fe882f 100644
>         ---- a/gtk/gtkwindow.c
>         -+++ b/gtk/gtkwindow.c
>         -@@ -4056,6 +4056,32 @@ gtk_window_supports_client_shadow (GtkWindow
>         *window)
>         -   return TRUE;
>         - }
>         -
>         -+static gboolean
>         -+gtk_window_can_use_csd (GtkWindow *window)
>         -+{
>         -+  const gchar *csd_env;
>         -+
>         -+#ifdef GDK_WINDOWING_BROADWAY
>         -+  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>         (window))))
>         -+    return TRUE;
>         -+#endif
>         -+
>         -+#ifdef GDK_WINDOWING_WAYLAND
>         -+  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>         (window))))
>         -+    return TRUE;
>         -+#endif
>         -+
>         -+#ifdef GDK_WINDOWING_MIR
>         -+  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
>         -+    return TRUE;
>         -+#endif
>         -+
>         -+  csd_env = g_getenv ("GTK_CSD");
>         -+
>         -+  /* If GTK_CSD is unset we default to CSD support */
>         -+  return csd_env == NULL || (strcmp (csd_env, "1") == 0);
>         -+}
>         -+
>         - static void
>         - gtk_window_enable_csd (GtkWindow *window)
>         - {
>         -@@ -4063,6 +4089,10 @@ gtk_window_enable_csd (GtkWindow *window)
>         -   GtkWidget *widget = GTK_WIDGET (window);
>         -   GdkVisual *visual;
>         -
>         -+  /* If the environment does not support CSD, then there's no point in
>         enabling them */
>         -+  if (!gtk_window_can_use_csd (window))
>         -+    return;
>         -+
>         -   /* We need a visual with alpha for client shadows */
>         -   if (priv->use_client_shadow)
>         -     {
>         -@@ -5839,7 +5869,6 @@ static gboolean
>         - gtk_window_should_use_csd (GtkWindow *window)
>         - {
>         -   GtkWindowPrivate *priv = window->priv;
>         --  const gchar *csd_env;
>         -
>         -   if (priv->csd_requested)
>         -     return TRUE;
>         -@@ -5850,24 +5879,7 @@ gtk_window_should_use_csd (GtkWindow *window)
>         -   if (priv->type == GTK_WINDOW_POPUP)
>         -     return FALSE;
>         -
>         --#ifdef GDK_WINDOWING_BROADWAY
>         --  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>         (window))))
>         --    return TRUE;
>         --#endif
>         --
>         --#ifdef GDK_WINDOWING_WAYLAND
>         --  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>         (window))))
>         --    return TRUE;
>         --#endif
>         --
>         --#ifdef GDK_WINDOWING_MIR
>         --  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
>         --    return TRUE;
>         --#endif
>         --
>         --  csd_env = g_getenv ("GTK_CSD");
>         --
>         --  return (g_strcmp0 (csd_env, "1") == 0);
>         -+  return gtk_window_can_use_csd (window);
>         - }
>         -
>         - static void
>         ---
>         -cgit v0.10.2
>         -
>         diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
>         <http://3_3.18.8.bb> b/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
>         <http://3_3.20.6.bb>
>         similarity index 57%
>         rename from meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb <http://3_3.18.8.bb>
>         rename to meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb <http://3_3.20.6.bb>
>         index d776b6d..453a4e2 100644
>         --- a/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb <http://3_3.18.8.bb>
>         +++ b/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb <http://3_3.20.6.bb>
>         @@ -3,14 +3,13 @@ require gtk+3.inc
>            MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>
>            SRC_URI =
>         "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz <http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz>
>         \
>         -           file://hardcoded_libtool.patch \
>         -           file://Dont-force-csd.patch \
>         -           file://Do-not-try-to-initialize-GL-without-libGL.patch \
>         -           file://0001-Add-disable-opengl-configure-option.patch \
>         +           file://0001-Hardcoded-libtool.patch \
>         +           file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
>         +           file://0003-Add-disable-opengl-configure-option.patch \
>         +           file://0004-configure.ac-Fix-wayland-protocols-path.patch \
>                      "
>         -
>         -SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
>         -SRC_URI[sha256sum] =
>         "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
>         +SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
>         +SRC_URI[sha256sum] =
>         "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
>
>            S = "${WORKDIR}/gtk+-${PV}"
>
>         diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
>         <http://gtk-icon-utils-native_3.18.8.bb>
>         b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
>         <http://gtk-icon-utils-native_3.20.6.bb>
>         similarity index 93%
>         rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
>         <http://gtk-icon-utils-native_3.18.8.bb>
>         rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
>         <http://gtk-icon-utils-native_3.20.6.bb>
>         index 793f14a..e870ba3 100644
>         --- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
>         <http://gtk-icon-utils-native_3.18.8.bb>
>         +++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
>         <http://gtk-icon-utils-native_3.20.6.bb>
>         @@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>
>            SRC_URI =
>         "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz <http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz>
>         \
>
>         file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
>         -SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
>         -SRC_URI[sha256sum] =
>         "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
>         +SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
>         +SRC_URI[sha256sum] =
>         "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
>
>            LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
>
>         file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
>
>

