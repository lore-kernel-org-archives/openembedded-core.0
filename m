Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id AEF426013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 07:09:28 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id s66so259881285oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WjXkGJaeyI9rFUsP4+Os0jJrmRXM6HeOYHmwuey9Hts=;
	b=LYkQcwRCEQyNuQ9yUlzi0NXprztijFfdRtEmN+cFhRRuVNoQlfsWRaiBuERYdB2q68
	UkrOc4NwFjn2MdoVhVmXoyFrb3qYHIGAkcoFAMAwdy4fUOWd2FK4zd5CsJnWdFQa5eTa
	+uyR0CTTlmuSIV7J5addLZ0PU9YMdHmnocnW3P76gpuyFv34FsihoXCJ/c/nUQoum80z
	dnhzyXUGtiqsU2GChfYUEBhAwMATRlJiuNuKSHsbwneOkF7BhwJzA2z3KMrua2Pfn1iY
	AvKsd3o+88tsnlqHf+fb2UPb61PHcBHgpoFKjYO2RrQCRAgX5177+fB84p1NqJCOf5zY
	cgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WjXkGJaeyI9rFUsP4+Os0jJrmRXM6HeOYHmwuey9Hts=;
	b=Gu6AhEQazfhh/IH+iaqWhvkJ2ob+zcMPw+daRE9m4iYQRppD/1GkRhA9YEG5H5edte
	DeDKigu0TpVHRXmltPWF16GvwU2erRILuscMr76hAO7wOZGHUgN8NQOJMXIf552qZfiB
	J1UL7XYnsATvlRageREpXJKhHcHa+xe2k1O4cO3qt54Gx+qTz6P0EroR0EY0MsqAGbzb
	S+SeLA7lS098W8So44I9Vr7dLqztVmxpvop+Pd2Gmx4v8rRxWE8RXDn2XghNvzEHGzDR
	ncs5Cx+Szz0MLQF15yJJ1Kf33McdRkkYLqlQouGITowG0eawoDzrLmuinR6hL/v7ZB7P
	4Geg==
X-Gm-Message-State: ALyK8tLhMqbr3A5YLmgU/doFChTt0tTfkuAYIdA7sQCKRmmGe8Zm20ouQeNmWBw0LMG7ZnQo4hUydvqlWN75b734
X-Received: by 10.157.38.165 with SMTP id l34mr3049676otb.59.1467788968612;
	Wed, 06 Jul 2016 00:09:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.79.83 with HTTP; Wed, 6 Jul 2016 00:08:59 -0700 (PDT)
In-Reply-To: <577C793A.5080800@windriver.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
	<d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
	<577BB188.6050703@windriver.com>
	<CAHiDW_EDPmiEVqihcQ4qu5BU8S9YJOSRw6VXXEmhKgPS0QDppQ@mail.gmail.com>
	<577C765C.9060409@windriver.com> <577C793A.5080800@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 6 Jul 2016 10:08:59 +0300
Message-ID: <CAHiDW_FhuPKYhTWd7Ab+OTfsL=_u_nQN1FnybvCxLVxbNdE1kQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
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
X-List-Received-Date: Wed, 06 Jul 2016 07:09:29 -0000
Content-Type: multipart/alternative; boundary=001a113ce6fa1467d50536f2405c

--001a113ce6fa1467d50536f2405c
Content-Type: text/plain; charset=UTF-8

On 6 July 2016 at 06:21, Robert Yang <liezhi.yang@windriver.com> wrote:

> On 07/06/2016 11:09 AM, Robert Yang wrote:
>
>> On 07/05/2016 10:08 PM, Jussi Kukkonen wrote:
>>
>>> On 5 July 2016 at 16:09, Robert Yang <liezhi.yang@windriver.com
>>> <mailto:liezhi.yang@windriver.com>> wrote:
>>>
>>>
>>>     Hi,
>>>
>>>     I can't build it on Ubuntu 14.04:
>>>
>>>
>>> I can't see from the log why the file would be be missing and can't
>>> reproduce
>>> that locally... Cleaning sstate should be a valid workaround but I'd be
>>> really
>>> interested in reproducing this: if you can reproduce (or remember if you
>>> did any
>>>   distro feature or  packageconfig changes) please let me know the
>>> details.
>>>
>>> In the meantime I'll take another look at the build system...
>>>
>>
>> Please see below ...
>>
>>
>>         +diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
>>>         +similarity index 100%
>>>         +rename from gdk/x11/gdkx.h
>>>         +rename to gdk/x11/gdkx-with-gl-context.h
>>>
>>
>> Older patch tool such as patch 2.7.1 can't apply this patch, I will
>> update it.
>>
>
> Sorry, 2.6.1:-).
>
>

Thanks for the follow up. Ubuntu 14.04 should not have gnu patch 2.6.1
though, or am I mistaken?

Jussi



> // Robert
>
>
>
>> // Robert
>>
>>            diff --git a/gdk/x11/gdkx-without-gl-context.h
>>>         b/gdk/x11/gdkx-without-gl-context.h
>>>            new file mode 100644
>>>            index 0000000..c9e2617
>>>         @@ -686,76 +617,11 @@ index 0000000..c9e2617
>>>            +#undef __GDKX_H_INSIDE__
>>>            +
>>>            +#endif /* __GDK_X_H__ */
>>>         -diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
>>>         -deleted file mode 100644
>>>         -index ae05fa6..0000000
>>>         ---- a/gdk/x11/gdkx.h
>>>         -+++ /dev/null
>>>         -@@ -1,59 +0,0 @@
>>>         --/* GDK - The GIMP Drawing Kit
>>>         -- * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and
>>> Josh
>>>         MacDonald
>>>         -- *
>>>         -- * This library is free software; you can redistribute it
>>> and/or
>>>         -- * modify it under the terms of the GNU Lesser General Public
>>>         -- * License as published by the Free Software Foundation; either
>>>         -- * version 2 of the License, or (at your option) any later
>>> version.
>>>         -- *
>>>         -- * This library is distributed in the hope that it will be
>>> useful,
>>>         -- * but WITHOUT ANY WARRANTY; without even the implied warranty
>>> of
>>>         -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>>> the GNU
>>>         -- * Lesser General Public License for more details.
>>>         -- *
>>>         -- * You should have received a copy of the GNU Lesser General
>>> Public
>>>         -- * License along with this library. If not, see
>>>         <http://www.gnu.org/licenses/>.
>>>         -- */
>>>         --
>>>         --/*
>>>         -- * Modified by the GTK+ Team and others 1997-2000.  See the
>>> AUTHORS
>>>         -- * file for a list of people on the GTK+ Team.  See the
>>> ChangeLog
>>>         -- * files for a list of changes.  These files are distributed
>>> with
>>>         -- * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
>>>         -- */
>>>         --
>>>         --#ifndef __GDK_X_H__
>>>         --#define __GDK_X_H__
>>>         --
>>>         --#include <gdk/gdk.h>
>>>         --
>>>         --#include <X11/Xlib.h>
>>>         --#include <X11/Xutil.h>
>>>         --
>>>         --#define __GDKX_H_INSIDE__
>>>         --
>>>         --#include <gdk/x11/gdkx11applaunchcontext.h>
>>>         --#include <gdk/x11/gdkx11cursor.h>
>>>         --#include <gdk/x11/gdkx11device.h>
>>>         --#include <gdk/x11/gdkx11device-core.h>
>>>         --#include <gdk/x11/gdkx11device-xi2.h>
>>>         --#include <gdk/x11/gdkx11devicemanager.h>
>>>         --#include <gdk/x11/gdkx11devicemanager-core.h>
>>>         --#include <gdk/x11/gdkx11devicemanager-xi2.h>
>>>         --#include <gdk/x11/gdkx11display.h>
>>>         --#include <gdk/x11/gdkx11displaymanager.h>
>>>         --#include <gdk/x11/gdkx11dnd.h>
>>>         --#include <gdk/x11/gdkx11glcontext.h>
>>>         --#include <gdk/x11/gdkx11keys.h>
>>>         --#include <gdk/x11/gdkx11property.h>
>>>         --#include <gdk/x11/gdkx11screen.h>
>>>         --#include <gdk/x11/gdkx11selection.h>
>>>         --#include <gdk/x11/gdkx11utils.h>
>>>         --#include <gdk/x11/gdkx11visual.h>
>>>         --#include <gdk/x11/gdkx11window.h>
>>>         --
>>>         --#include <gdk/x11/gdkx-autocleanups.h>
>>>         --
>>>         --#undef __GDKX_H_INSIDE__
>>>         --
>>>         --#endif /* __GDK_X_H__ */
>>>            diff --git a/gtk/Makefile.am b/gtk/Makefile.am
>>>         -index 801c3a5..2d8839d 100644
>>>         +index 6a53a2b..49a35e6 100644
>>>            --- a/gtk/Makefile.am
>>>            +++ b/gtk/Makefile.am
>>>         -@@ -1246,14 +1246,13 @@ gtkprivatetypebuiltins.c:
>>>         $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
>>>         +@@ -1351,14 +1351,13 @@ gtkprivatetypebuiltins.c:
>>>         $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
>>>                  && cp xgen-gptbc gtkprivatetypebuiltins.c  \
>>>                  && rm -f xgen-gptbc
>>>
>>>         @@ -772,7 +638,7 @@ index 801c3a5..2d8839d 100644
>>>             gtktestutils.c: gtktypefuncs.c
>>>
>>>            diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
>>>         -index 4098409..45fa1d1 100644
>>>         +index 245fc6b..4214ad1 100644
>>>            --- a/gtk/gtkglarea.c
>>>            +++ b/gtk/gtkglarea.c
>>>            @@ -28,7 +28,9 @@
>>>         @@ -868,7 +734,7 @@ index 4098409..45fa1d1 100644
>>>
>>>             static gboolean
>>>            diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
>>>         -index 0611373..4499a29 100644
>>>         +index 4eab3a7..c4e900e 100644
>>>            --- a/gtk/inspector/general.c
>>>            +++ b/gtk/inspector/general.c
>>>            @@ -33,8 +33,10 @@
>>>         @@ -882,7 +748,7 @@ index 0611373..4499a29 100644
>>>
>>>             #ifdef GDK_WINDOWING_WIN32
>>>             #include "win32/gdkwin32.h"
>>>         -@@ -146,6 +148,7 @@ append_extension_row (GtkInspectorGeneral
>>> *gen,
>>>         +@@ -147,6 +149,7 @@ append_extension_row (GtkInspectorGeneral
>>> *gen,
>>>               gtk_size_group_add_widget (GTK_SIZE_GROUP
>>> (gen->priv->labels),
>>> label);
>>>             }
>>>
>>>         @@ -890,7 +756,7 @@ index 0611373..4499a29 100644
>>>             #ifdef GDK_WINDOWING_X11
>>>             static void
>>>             append_glx_extension_row (GtkInspectorGeneral *gen,
>>>         -@@ -155,6 +158,7 @@ append_glx_extension_row
>>> (GtkInspectorGeneral *gen,
>>>         +@@ -156,6 +159,7 @@ append_glx_extension_row
>>> (GtkInspectorGeneral *gen,
>>>               append_extension_row (gen, ext, epoxy_has_glx_extension
>>> (dpy, 0,
>>>         ext));
>>>             }
>>>             #endif
>>>         @@ -898,27 +764,27 @@ index 0611373..4499a29 100644
>>>
>>>             #ifdef GDK_WINDOWING_WAYLAND
>>>             static void
>>>         -@@ -174,6 +178,7 @@ init_gl (GtkInspectorGeneral *gen)
>>>         -
>>>         -   display = gdk_display_get_default ();
>>>         -
>>>         +@@ -171,6 +175,7 @@ append_egl_extension_row
>>> (GtkInspectorGeneral *gen,
>>>         + static void
>>>         + init_gl (GtkInspectorGeneral *gen)
>>>         + {
>>>            +#ifdef HAVE_OPENGL
>>>             #ifdef GDK_WINDOWING_X11
>>>         -   if (GDK_IS_X11_DISPLAY (display))
>>>         +   if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
>>>                 {
>>>         -@@ -199,6 +204,7 @@ init_gl (GtkInspectorGeneral *gen)
>>>         +@@ -197,6 +202,7 @@ init_gl (GtkInspectorGeneral *gen)
>>>                 }
>>>               else
>>>             #endif
>>>            +#endif
>>>             #ifdef GDK_WINDOWING_WAYLAND
>>>         -   if (GDK_IS_WAYLAND_DISPLAY (display))
>>>         +   if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
>>>                 {
>>>            diff --git a/tests/Makefile.am b/tests/Makefile.am
>>>         -index 50f2986..3b39169 100644
>>>         +index 681807d..2941a36 100644
>>>            --- a/tests/Makefile.am
>>>            +++ b/tests/Makefile.am
>>>         -@@ -78,8 +78,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)     \
>>>         +@@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)     \
>>>                  testfullscreen                  \
>>>                  testgeometry                    \
>>>                  testgiconpixbuf                 \
>>>         @@ -927,18 +793,19 @@ index 50f2986..3b39169 100644
>>>                  testgrid                        \
>>>                  testgtk                         \
>>>                  testheaderbar                   \
>>>         -@@ -166,10 +164,16 @@ noinst_PROGRAMS =  $(TEST_PROGS) \
>>>         +@@ -169,11 +167,17 @@ noinst_PROGRAMS =  $(TEST_PROGS) \
>>>                  testactionbar                   \
>>>                  testwindowsize                  \
>>>                  testpopover                     \
>>>            -     gdkgears                        \
>>>                  listmodel                       \
>>>         +       testpopup                       \
>>>                  $(NULL)
>>>
>>>            +if HAVE_OPENGL
>>>            +noinst_PROGRAMS +=
>>>         -+      testglarea                      \
>>>         -+      testglblending                  \
>>>         ++      testglarea                      \
>>>         ++      testglblending                  \
>>>            +     gdkgears
>>>            +endif
>>>            +
>>>         @@ -946,11 +813,11 @@ index 50f2986..3b39169 100644
>>>             noinst_PROGRAMS += testerrors
>>>             endif
>>>            diff --git a/testsuite/gtk/objects-finalize.c
>>>         b/testsuite/gtk/objects-finalize.c
>>>         -index 3568505..682ea10 100644
>>>         +index e0ebee0..703643c 100644
>>>            --- a/testsuite/gtk/objects-finalize.c
>>>            +++ b/testsuite/gtk/objects-finalize.c
>>>         -@@ -114,8 +114,10 @@ main (int argc, char **argv)
>>>         -         all_types[i] != GDK_TYPE_X11_DISPLAY &&
>>>         +@@ -115,8 +115,10 @@ main (int argc, char **argv)
>>>         +         all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
>>>                    all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
>>>                    all_types[i] != GDK_TYPE_X11_DISPLAY_MANAGER &&
>>>            +#ifdef HAVE_OPENGL
>>>         @@ -961,5 +828,5 @@ index 3568505..682ea10 100644
>>>                    all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
>>>                    all_types[i] !=
>>> gdk_pixbuf_simple_anim_iter_get_type())
>>>            --
>>>         -2.8.1
>>>         +2.1.4
>>>
>>>         diff --git
>>>
>>>
>>> a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>>>
>>>
>>>
>>> b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>>>
>>>         new file mode 100644
>>>         index 0000000..634b3a4
>>>         --- /dev/null
>>>         +++
>>>
>>>
>>> b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>>>
>>>         @@ -0,0 +1,36 @@
>>>         +From 97b78e566634579bbae51be914aeaaa921137a8b Mon Sep 17
>>> 00:00:00 2001
>>>         +From: Jussi Kukkonen <jussi.kukkonen@intel.com
>>>         <mailto:jussi.kukkonen@intel.com>>
>>>         +Date: Thu, 9 Jun 2016 11:21:36 +0300
>>>         +Subject: [PATCH 4/4] configure.ac <http://configure.ac>: Fix
>>>         wayland-protocols path
>>>         +
>>>         +The wayland-protocols directory is used during build: Fix the
>>> path
>>>         +to point to sysroot specified in recipe.
>>>         +
>>>         +Normally PKG_CONFIG_SYSROOT_DIR could be used in configure.ac
>>>         <http://configure.ac> but that
>>>         +breaks multilib gtk+ as it would point to multilib sysroot when
>>> the
>>>         +(allarch) wayland-protocols is actually in the machine sysroot.
>>>         +
>>>         +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
>>>         <mailto:jussi.kukkonen@intel.com>>
>>>         +Upstream-Status: Inappropriate [embedded specific]
>>>         +
>>>         +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
>>>         <mailto:jussi.kukkonen@intel.com>>
>>>         +---
>>>         + configure.ac <http://configure.ac> | 2 +-
>>>         + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>         +
>>>         +diff --git a/configure.ac <http://configure.ac> b/configure.ac
>>>         <http://configure.ac>
>>>         +index a3e9beb..dde9dc5 100644
>>>         +--- a/configure.ac <http://configure.ac>
>>>         ++++ b/configure.ac <http://configure.ac>
>>>         +@@ -461,7 +461,7 @@ fi
>>>         + if test "$enable_wayland_backend" = "yes"; then
>>>         +   # For the cairo image backend
>>>         +   cairo_backends="$cairo_backends cairo"
>>>         +-  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG
>>>         --variable=pkgdatadir wayland-protocols`)
>>>         ++  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR,
>>>         ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG
>>> --variable=pkgdatadir
>>>         wayland-protocols`)
>>>         +   GDK_BACKENDS="$GDK_BACKENDS wayland"
>>>         +   GDK_WINDOWING="$GDK_WINDOWING
>>>         + #define GDK_WINDOWING_WAYLAND"
>>>         +--
>>>         +2.1.4
>>>         +
>>>         diff --git a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>>>         b/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>>>         deleted file mode 100644
>>>         index 32d8a84..0000000
>>>         --- a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>>>         +++ /dev/null
>>>         @@ -1,118 +0,0 @@
>>>         -window: Check if we can use CSD before enabling them
>>>         -
>>>         -Upstream-Status: Backport
>>>         -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
>>>         <mailto:jussi.kukkonen@intel.com>>
>>>         -
>>>         -
>>>         -From c5e5ee67490e7e7af56052d8f8beb75db002c2f1 Mon Sep 17
>>> 00:00:00 2001
>>>         -From: Emmanuele Bassi <ebassi@gnome.org <mailto:
>>> ebassi@gnome.org>>
>>>         -Date: Wed, 3 Jun 2015 14:07:29 +0100
>>>         -Subject: window: Check if we can use CSD before enabling them
>>>         -
>>>         -The change in 03213b9509fc1df16c66194ea168aed6c15110e9 changed
>>> the rules
>>>         -as to when CSD can be enabled, but it also unconditionally
>>> enables CSD
>>>         -with the implicit assumption that client-side shadows were the
>>> real
>>>         -issue, and that we could work around that by drawing our own
>>> borders.
>>>         -This also means that setting a titlebar for a GtkWindow will
>>> enable CSD
>>>         -unconditionally.
>>>         -
>>>         -In reality, some window managers (like Matchbox) *only* support
>>>         -server-side decorations, and will ignore all hints to the
>>> contrary, to
>>>         -the point of drawing decorations at random locations on top of
>>> the
>>>         -window.
>>>         -
>>>         -Since CSD are enabled unconditionally, the GTK_CSD environment
>>> variable
>>>         -is also not a suitable escape hatch.
>>>         -
>>>         -In the grand tradition of asking ourselves if we should do
>>> something
>>>         -just because we can, we should split the environment checks
>>> from the
>>>         -checks on what the user requested; by doing that, we can also
>>> check
>>>         -when enabling client-side decorations, and ideally bail out if
>>> needed.
>>>         -
>>>         -https://bugzilla.gnome.org/show_bug.cgi?id=750343
>>>         -
>>>         -diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
>>>         -index 423c6bd..9fe882f 100644
>>>         ---- a/gtk/gtkwindow.c
>>>         -+++ b/gtk/gtkwindow.c
>>>         -@@ -4056,6 +4056,32 @@ gtk_window_supports_client_shadow
>>> (GtkWindow
>>>         *window)
>>>         -   return TRUE;
>>>         - }
>>>         -
>>>         -+static gboolean
>>>         -+gtk_window_can_use_csd (GtkWindow *window)
>>>         -+{
>>>         -+  const gchar *csd_env;
>>>         -+
>>>         -+#ifdef GDK_WINDOWING_BROADWAY
>>>         -+  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display
>>> (GTK_WIDGET
>>>         (window))))
>>>         -+    return TRUE;
>>>         -+#endif
>>>         -+
>>>         -+#ifdef GDK_WINDOWING_WAYLAND
>>>         -+  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display
>>> (GTK_WIDGET
>>>         (window))))
>>>         -+    return TRUE;
>>>         -+#endif
>>>         -+
>>>         -+#ifdef GDK_WINDOWING_MIR
>>>         -+  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>>> (window))))
>>>         -+    return TRUE;
>>>         -+#endif
>>>         -+
>>>         -+  csd_env = g_getenv ("GTK_CSD");
>>>         -+
>>>         -+  /* If GTK_CSD is unset we default to CSD support */
>>>         -+  return csd_env == NULL || (strcmp (csd_env, "1") == 0);
>>>         -+}
>>>         -+
>>>         - static void
>>>         - gtk_window_enable_csd (GtkWindow *window)
>>>         - {
>>>         -@@ -4063,6 +4089,10 @@ gtk_window_enable_csd (GtkWindow *window)
>>>         -   GtkWidget *widget = GTK_WIDGET (window);
>>>         -   GdkVisual *visual;
>>>         -
>>>         -+  /* If the environment does not support CSD, then there's no
>>> point in
>>>         enabling them */
>>>         -+  if (!gtk_window_can_use_csd (window))
>>>         -+    return;
>>>         -+
>>>         -   /* We need a visual with alpha for client shadows */
>>>         -   if (priv->use_client_shadow)
>>>         -     {
>>>         -@@ -5839,7 +5869,6 @@ static gboolean
>>>         - gtk_window_should_use_csd (GtkWindow *window)
>>>         - {
>>>         -   GtkWindowPrivate *priv = window->priv;
>>>         --  const gchar *csd_env;
>>>         -
>>>         -   if (priv->csd_requested)
>>>         -     return TRUE;
>>>         -@@ -5850,24 +5879,7 @@ gtk_window_should_use_csd (GtkWindow
>>> *window)
>>>         -   if (priv->type == GTK_WINDOW_POPUP)
>>>         -     return FALSE;
>>>         -
>>>         --#ifdef GDK_WINDOWING_BROADWAY
>>>         --  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display
>>> (GTK_WIDGET
>>>         (window))))
>>>         --    return TRUE;
>>>         --#endif
>>>         --
>>>         --#ifdef GDK_WINDOWING_WAYLAND
>>>         --  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display
>>> (GTK_WIDGET
>>>         (window))))
>>>         --    return TRUE;
>>>         --#endif
>>>         --
>>>         --#ifdef GDK_WINDOWING_MIR
>>>         --  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>>> (window))))
>>>         --    return TRUE;
>>>         --#endif
>>>         --
>>>         --  csd_env = g_getenv ("GTK_CSD");
>>>         --
>>>         --  return (g_strcmp0 (csd_env, "1") == 0);
>>>         -+  return gtk_window_can_use_csd (window);
>>>         - }
>>>         -
>>>         - static void
>>>         ---
>>>         -cgit v0.10.2
>>>         -
>>>         diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
>>>         <http://3_3.18.8.bb> b/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
>>>         <http://3_3.20.6.bb>
>>>         similarity index 57%
>>>         rename from meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb <
>>> http://3_3.18.8.bb>
>>>         rename to meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb <
>>> http://3_3.20.6.bb>
>>>         index d776b6d..453a4e2 100644
>>>         --- a/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb <
>>> http://3_3.18.8.bb>
>>>         +++ b/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb <
>>> http://3_3.20.6.bb>
>>>         @@ -3,14 +3,13 @@ require gtk+3.inc
>>>            MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>>>
>>>            SRC_URI =
>>>
>>> "
>>> http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz
>>> <http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz>
>>> <
>>> http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz
>>> >
>>>
>>>         \
>>>         -           file://hardcoded_libtool.patch \
>>>         -           file://Dont-force-csd.patch \
>>>         -
>>>  file://Do-not-try-to-initialize-GL-without-libGL.patch \
>>>         -
>>>  file://0001-Add-disable-opengl-configure-option.patch \
>>>         +           file://0001-Hardcoded-libtool.patch \
>>>         +
>>>  file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
>>>         +
>>>  file://0003-Add-disable-opengl-configure-option.patch \
>>>         +
>>>  file://0004-configure.ac-Fix-wayland-protocols-path.patch \
>>>                      "
>>>         -
>>>         -SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
>>>         -SRC_URI[sha256sum] =
>>>
>>> "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
>>>         +SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
>>>         +SRC_URI[sha256sum] =
>>>
>>> "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
>>>
>>>            S = "${WORKDIR}/gtk+-${PV}"
>>>
>>>         diff --git a/meta/recipes-gnome/gtk+/
>>> gtk-icon-utils-native_3.18.8.bb
>>>         <http://gtk-icon-utils-native_3.18.8.bb>
>>>         b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
>>>         <http://gtk-icon-utils-native_3.20.6.bb>
>>>         similarity index 93%
>>>         rename from meta/recipes-gnome/gtk+/
>>> gtk-icon-utils-native_3.18.8.bb
>>>         <http://gtk-icon-utils-native_3.18.8.bb>
>>>         rename to meta/recipes-gnome/gtk+/
>>> gtk-icon-utils-native_3.20.6.bb
>>>         <http://gtk-icon-utils-native_3.20.6.bb>
>>>         index 793f14a..e870ba3 100644
>>>         --- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
>>>         <http://gtk-icon-utils-native_3.18.8.bb>
>>>         +++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
>>>         <http://gtk-icon-utils-native_3.20.6.bb>
>>>         @@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}",
>>> 2)}"
>>>
>>>            SRC_URI =
>>>
>>> "
>>> http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz
>>> <http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz>
>>> <
>>> http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz
>>> >
>>>
>>>         \
>>>
>>>         file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
>>>         -SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
>>>         -SRC_URI[sha256sum] =
>>>
>>> "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
>>>         +SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
>>>         +SRC_URI[sha256sum] =
>>>
>>> "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
>>>
>>>            LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
>>>
>>>         file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737
>>> \
>>>
>>>
>>>

--001a113ce6fa1467d50536f2405c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 6=
 July 2016 at 06:21, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:li=
ezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 07/06=
/2016 11:09 AM, Robert Yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 07/05/2016 10:08 PM, Jussi Kukkonen wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 5 July 2016 at 16:09, Robert Yang &lt;<a =
href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@win=
driver.com</a><br>
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
<br>
=C2=A0 =C2=A0 Hi,<br>
<br>
=C2=A0 =C2=A0 I can&#39;t build it on Ubuntu 14.04:<br>
<br>
<br>
I can&#39;t see from the log why the file would be be missing and can&#39;t=
 reproduce<br>
that locally... Cleaning sstate should be a valid workaround but I&#39;d be=
 really<br>
interested in reproducing this: if you can reproduce (or remember if you di=
d any<br>
=C2=A0 distro feature or=C2=A0 packageconfig changes) please let me know th=
e details.<br>
<br>
In the meantime I&#39;ll take another look at the build system...<br>
</blockquote>
<br>
Please see below ...<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-wit=
h-gl-context.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +similarity index 100%<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +rename from gdk/x11/gdkx.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +rename to gdk/x11/gdkx-with-gl-context.h<br>
</blockquote>
<br>
Older patch tool such as patch 2.7.1 can&#39;t apply this patch, I will upd=
ate it.<br>
</blockquote>
<br></span>
Sorry, 2.6.1:-).<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br></font></span></blockquote><div><br></div><div><br></div><div>Thanks fo=
r the follow up. Ubuntu 14.04 should not have gnu patch 2.6.1 though, or am=
 I mistaken?</div><div><br></div><div>Jussi</div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"HOEnZb"><font color=3D"=
#888888">
// Robert</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
// Robert<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/gdk/x11/gdkx-without-=
gl-context.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/gdk/x11/gdkx-without-gl-context.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index 0000000..c9e2617<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -686,76 +617,11 @@ index 0000000..c9e2617<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+#undef __GDKX_H_INSIDE__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+#endif /* __GDK_X_H__ */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -deleted file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -index ae05fa6..0000000<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---- a/gdk/x11/gdkx.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+++ /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -1,59 +0,0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --/* GDK - The GIMP Drawing Kit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * Copyright (C) 1995-1997 Peter Mattis, Spen=
cer Kimball and Josh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 MacDonald<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * This library is free software; you can red=
istribute it and/or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * modify it under the terms of the GNU Lesse=
r General Public<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * License as published by the Free Software =
Foundation; either<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * version 2 of the License, or (at your opti=
on) any later version.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * This library is distributed in the hope th=
at it will be useful,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * but WITHOUT ANY WARRANTY; without even the=
 implied warranty of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * MERCHANTABILITY or FITNESS FOR A PARTICULA=
R PURPOSE.=C2=A0 See the GNU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * Lesser General Public License for more det=
ails.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * You should have received a copy of the GNU=
 Lesser General Public<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * License along with this library. If not, s=
ee<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://www.gnu.org/licenses/" re=
l=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * Modified by the GTK+ Team and others 1997-=
2000.=C2=A0 See the AUTHORS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * file for a list of people on the GTK+ Team=
.=C2=A0 See the ChangeLog<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * files for a list of changes.=C2=A0 These f=
iles are distributed with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- * GTK+ at <a href=3D"ftp://ftp.gtk.org/pub/g=
tk/" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.gtk.org/pub/gtk/</a>.<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#ifndef __GDK_X_H__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#define __GDK_X_H__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/gdk.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;X11/Xlib.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;X11/Xutil.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#define __GDKX_H_INSIDE__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11applaunchcontext.h=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11cursor.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11device.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11device-core.h&gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11device-xi2.h&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11devicemanager.h&gt=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11devicemanager-core=
.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11devicemanager-xi2.=
h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11display.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11displaymanager.h&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11dnd.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11glcontext.h&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11keys.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11property.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11screen.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11selection.h&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11utils.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11visual.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx11window.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#include &lt;gdk/x11/gdkx-autocleanups.h&gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#undef __GDKX_H_INSIDE__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#endif /* __GDK_X_H__ */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/gtk/Makefile.am b/gtk=
/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -index 801c3a5..2d8839d 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +index 6a53a2b..49a35e6 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/gtk/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/gtk/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -1246,14 +1246,13 @@ gtkprivatetypebuiltins=
.c:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(gtk_private_type_h_sources)=C2=A0 gtkprivatet=
ypebuiltins.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -1351,14 +1351,13 @@ gtkprivatetypebuiltins=
.c:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(gtk_private_type_h_sources)=C2=A0 gtkprivatet=
ypebuiltins.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; cp=
 xgen-gptbc gtkprivatetypebuiltins.c=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; rm=
 -f xgen-gptbc<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -772,7 +638,7 @@ index 801c3a5..2d8839d 1006=
44<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtktestutils.c: gtktypefuncs.c<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/gtk/gtkglarea.c b/gtk=
/gtkglarea.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -index 4098409..45fa1d1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +index 245fc6b..4214ad1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/gtk/gtkglarea.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/gtk/gtkglarea.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -28,7 +28,9 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -868,7 +734,7 @@ index 4098409..45fa1d1 1006=
44<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static gboolean<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/gtk/inspector/general=
.c b/gtk/inspector/general.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -index 0611373..4499a29 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +index 4eab3a7..c4e900e 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/gtk/inspector/general.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/gtk/inspector/general.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -33,8 +33,10 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -882,7 +748,7 @@ index 0611373..4499a29 1006=
44<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifdef GDK_WINDOWING_WIN32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &quot;win32/gdkwin32.h&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -146,6 +148,7 @@ append_extension_row (GtkI=
nspectorGeneral *gen,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -147,6 +149,7 @@ append_extension_row (GtkI=
nspectorGeneral *gen,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_size_group_add_widget =
(GTK_SIZE_GROUP (gen-&gt;priv-&gt;labels),<br>
label);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -890,7 +756,7 @@ index 0611373..4499a29 1006=
44<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifdef GDK_WINDOWING_X11<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static void<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 append_glx_extension_row (GtkInsp=
ectorGeneral *gen,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -155,6 +158,7 @@ append_glx_extension_row (=
GtkInspectorGeneral *gen,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -156,6 +159,7 @@ append_glx_extension_row (=
GtkInspectorGeneral *gen,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 append_extension_row (gen,=
 ext, epoxy_has_glx_extension (dpy, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ext));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -898,27 +764,27 @@ index 0611373..4499a29 10=
0644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifdef GDK_WINDOWING_WAYLAND<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static void<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -174,6 +178,7 @@ init_gl (GtkInspectorGener=
al *gen)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0display =3D gdk_display_get_defau=
lt ();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -171,6 +175,7 @@ append_egl_extension_row (=
GtkInspectorGeneral *gen,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + static void<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + init_gl (GtkInspectorGeneral *gen)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+#ifdef HAVE_OPENGL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifdef GDK_WINDOWING_X11<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0if (GDK_IS_X11_DISPLAY (display))=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0if (GDK_IS_X11_DISPLAY (gdk_displ=
ay_get_default ()))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -199,6 +204,7 @@ init_gl (GtkInspectorGener=
al *gen)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -197,6 +202,7 @@ init_gl (GtkInspectorGener=
al *gen)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifdef GDK_WINDOWING_WAYLAND<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0if (GDK_IS_WAYLAND_DISPLAY (displ=
ay))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0if (GDK_IS_WAYLAND_DISPLAY (gdk_d=
isplay_get_default ()))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/tests/Makefile.am b/t=
ests/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -index 50f2986..3b39169 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +index 681807d..2941a36 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/tests/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/tests/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -78,8 +78,6 @@ noinst_PROGRAMS =3D=C2=A0 $(=
TEST_PROGS)=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -80,8 +80,6 @@ noinst_PROGRAMS =3D=C2=A0 $(=
TEST_PROGS)=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testfullscree=
n=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testgeometry=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testgiconpixb=
uf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -927,18 +793,19 @@ index 50f2986..3b39169 10=
0644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testgrid=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testgtk=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testheaderbar=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -166,10 +164,16 @@ noinst_PROGRAMS =3D=C2=
=A0 $(TEST_PROGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -169,11 +167,17 @@ noinst_PROGRAMS =3D=C2=
=A0 $(TEST_PROGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testactionbar=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testwindowsiz=
e=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testpopover=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0gdkgears=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0listmodel=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0testpopup=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+if HAVE_OPENGL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+noinst_PROGRAMS +=3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 =C2=A0 =C2=A0 testglarea=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 =C2=A0 =C2=A0 testglblending=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++=C2=A0 =C2=A0 =C2=A0 testglarea=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++=C2=A0 =C2=A0 =C2=A0 testglblending=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0gdkgears<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -946,11 +813,11 @@ index 50f2986..3b39169 10=
0644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 noinst_PROGRAMS +=3D testerrors<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/testsuite/gtk/objects=
-finalize.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/testsuite/gtk/objects-finalize.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -index 3568505..682ea10 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +index e0ebee0..703643c 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/testsuite/gtk/objects-finali=
ze.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/testsuite/gtk/objects-finali=
ze.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -114,8 +114,10 @@ main (int argc, char **ar=
gv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_types[i]=
 !=3D GDK_TYPE_X11_DISPLAY &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -115,8 +115,10 @@ main (int argc, char **ar=
gv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_types[i]=
 !=3D GDK_TYPE_X11_DEVICE_MANAGER_CORE &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_ty=
pes[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_XI2 &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_ty=
pes[i] !=3D GDK_TYPE_X11_DISPLAY_MANAGER &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+#ifdef HAVE_OPENGL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -961,5 +828,5 @@ index 3568505..682ea10 1006=
44<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_ty=
pes[i] !=3D GDK_TYPE_PIXBUF_LOADER &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_ty=
pes[i] !=3D gdk_pixbuf_simple_anim_iter_get_type())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -2.8.1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +2.1.4<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git<br>
<br>
a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-pat=
h.patch<br>
<br>
<br>
b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-pat=
h.patch<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index 0000000..634b3a4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++<br>
<br>
b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-pat=
h.patch<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -0,0 +1,36 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +From 97b78e566634579bbae51be914aeaaa921137a8b =
Mon Sep 17 00:00:00 2001<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +From: Jussi Kukkonen &lt;<a href=3D"mailto:jus=
si.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:jussi.kukkonen@int=
el.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +Date: Thu, 9 Jun 2016 11:21:36 +0300<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +Subject: [PATCH 4/4] <a href=3D"http://configu=
re.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D=
"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure=
.ac</a>&gt;: Fix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland-protocols path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +The wayland-protocols directory is used during=
 build: Fix the path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +to point to sysroot specified in recipe.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +Normally PKG_CONFIG_SYSROOT_DIR could be used =
in <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">http://configure.ac</a>&gt; but that<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +breaks multilib gtk+ as it would point to mult=
ilib sysroot when the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +(allarch) wayland-protocols is actually in the=
 machine sysroot.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +Signed-off-by: Jussi Kukkonen &lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:jussi.kukkonen@int=
el.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +Upstream-Status: Inappropriate [embedded speci=
fic]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +Signed-off-by: Jussi Kukkonen &lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:jussi.kukkonen@int=
el.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + <a href=3D"http://configure.ac" rel=3D"norefe=
rrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt; | 2 +-<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + 1 file changed, 1 insertion(+), 1 deletion(-)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +diff --git a/<a href=3D"http://configure.ac" r=
el=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://=
configure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&=
gt; b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">http://configure.ac</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +index a3e9beb..dde9dc5 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +--- a/<a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configu=
re.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++++ b/<a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configu=
re.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -461,7 +461,7 @@ fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + if test &quot;$enable_wayland_backend&quot; =
=3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0# For the cairo image backend<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0cairo_backends=3D&quot;$cairo_bac=
kends cairo&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +-=C2=A0 AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$=
PKG_CONFIG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --variable=3Dpkgdatadir wayland-protocols`)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++=C2=A0 AC_SUBST(WAYLAND_PROTOCOLS_DATADIR,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --=
variable=3Dpkgdatadir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland-protocols`)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0GDK_BACKENDS=3D&quot;$GDK_BACKEND=
S wayland&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0GDK_WINDOWING=3D&quot;$GDK_WINDOW=
ING<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + #define GDK_WINDOWING_WAYLAND&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +--<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +2.1.4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git a/meta/recipes-gnome/gtk+/gtk+3/Dont=
-force-csd.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.=
patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 deleted file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index 32d8a84..0000000<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-=
csd.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -1,118 +0,0 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -window: Check if we can use CSD before enablin=
g them<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Upstream-Status: Backport<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Signed-off-by: Jussi Kukkonen &lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:jussi.kukkonen@int=
el.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -From c5e5ee67490e7e7af56052d8f8beb75db002c2f1 =
Mon Sep 17 00:00:00 2001<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -From: Emmanuele Bassi &lt;<a href=3D"mailto:eb=
assi@gnome.org" target=3D"_blank">ebassi@gnome.org</a> &lt;mailto:<a href=
=3D"mailto:ebassi@gnome.org" target=3D"_blank">ebassi@gnome.org</a>&gt;&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Date: Wed, 3 Jun 2015 14:07:29 +0100<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Subject: window: Check if we can use CSD befor=
e enabling them<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -The change in 03213b9509fc1df16c66194ea168aed6=
c15110e9 changed the rules<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -as to when CSD can be enabled, but it also unc=
onditionally enables CSD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -with the implicit assumption that client-side =
shadows were the real<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -issue, and that we could work around that by d=
rawing our own borders.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -This also means that setting a titlebar for a =
GtkWindow will enable CSD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -unconditionally.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -In reality, some window managers (like Matchbo=
x) *only* support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -server-side decorations, and will ignore all h=
ints to the contrary, to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -the point of drawing decorations at random loc=
ations on top of the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -window.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Since CSD are enabled unconditionally, the GTK=
_CSD environment variable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -is also not a suitable escape hatch.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -In the grand tradition of asking ourselves if =
we should do something<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -just because we can, we should split the envir=
onment checks from the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -checks on what the user requested; by doing th=
at, we can also check<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -when enabling client-side decorations, and ide=
ally bail out if needed.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<a href=3D"https://bugzilla.gnome.org/show_bug=
.cgi?id=3D750343" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gno=
me.org/show_bug.cgi?id=3D750343</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -index 423c6bd..9fe882f 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---- a/gtk/gtkwindow.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+++ b/gtk/gtkwindow.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -4056,6 +4056,32 @@ gtk_window_supports_cli=
ent_shadow (GtkWindow<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *window)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+static gboolean<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+gtk_window_can_use_csd (GtkWindow *window)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 const gchar *csd_env;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+#ifdef GDK_WINDOWING_BROADWAY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 if (GDK_IS_BROADWAY_DISPLAY (gtk_widge=
t_get_display (GTK_WIDGET<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (window))))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 =C2=A0 return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+#ifdef GDK_WINDOWING_WAYLAND<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 if (GDK_IS_WAYLAND_DISPLAY (gtk_widget=
_get_display (GTK_WIDGET<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (window))))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 =C2=A0 return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+#ifdef GDK_WINDOWING_MIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 if (GDK_IS_MIR_DISPLAY (gtk_widget_get=
_display (GTK_WIDGET<br>
(window))))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 =C2=A0 return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 csd_env =3D g_getenv (&quot;GTK_CSD&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 /* If GTK_CSD is unset we default to C=
SD support */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 return csd_env =3D=3D NULL || (strcmp =
(csd_env, &quot;1&quot;) =3D=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - static void<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - gtk_window_enable_csd (GtkWindow *window)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -4063,6 +4089,10 @@ gtk_window_enable_csd (=
GtkWindow *window)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0GtkWidget *widget =3D GTK_WIDGET =
(window);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0GdkVisual *visual;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 /* If the environment does not support=
 CSD, then there&#39;s no point in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enabling them */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 if (!gtk_window_can_use_csd (window))<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0/* We need a visual with alpha fo=
r client shadows */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0if (priv-&gt;use_client_shadow)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -5839,7 +5869,6 @@ static gboolean<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - gtk_window_should_use_csd (GtkWindow *window)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0GtkWindowPrivate *priv =3D window=
-&gt;priv;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 const gchar *csd_env;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0if (priv-&gt;csd_requested)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -@@ -5850,24 +5879,7 @@ gtk_window_should_use_c=
sd (GtkWindow *window)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0if (priv-&gt;type =3D=3D GTK_WIND=
OW_POPUP)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#ifdef GDK_WINDOWING_BROADWAY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 if (GDK_IS_BROADWAY_DISPLAY (gtk_widge=
t_get_display (GTK_WIDGET<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (window))))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 =C2=A0 return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#ifdef GDK_WINDOWING_WAYLAND<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 if (GDK_IS_WAYLAND_DISPLAY (gtk_widget=
_get_display (GTK_WIDGET<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (window))))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 =C2=A0 return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#ifdef GDK_WINDOWING_MIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 if (GDK_IS_MIR_DISPLAY (gtk_widget_get=
_display (GTK_WIDGET<br>
(window))))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 =C2=A0 return TRUE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 csd_env =3D g_getenv (&quot;GTK_CSD&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --=C2=A0 return (g_strcmp0 (csd_env, &quot;1&qu=
ot;) =3D=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -+=C2=A0 return gtk_window_can_use_csd (window)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - static void<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -cgit v0.10.2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git a/meta/recipes-gnome/gtk+/gtk+<a hre=
f=3D"http://3_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">3_3.18.8.bb</=
a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://3_3.18.8.bb" rel=3D"noref=
errer" target=3D"_blank">http://3_3.18.8.bb</a>&gt; b/meta/recipes-gnome/gt=
k+/gtk+<a href=3D"http://3_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">=
3_3.20.6.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://3_3.20.6.bb" rel=3D"noref=
errer" target=3D"_blank">http://3_3.20.6.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 similarity index 57%<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rename from meta/recipes-gnome/gtk+/gtk+<a href=
=3D"http://3_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">3_3.18.8.bb</a=
> &lt;<a href=3D"http://3_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://3_3.18.8.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rename to meta/recipes-gnome/gtk+/gtk+<a href=
=3D"http://3_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">3_3.20.6.bb</a=
> &lt;<a href=3D"http://3_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">h=
ttp://3_3.20.6.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index d776b6d..453a4e2 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- a/meta/recipes-gnome/gtk+/gtk+<a href=3D"ht=
tp://3_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">3_3.18.8.bb</a> &lt;=
<a href=3D"http://3_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">http://=
3_3.18.8.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ b/meta/recipes-gnome/gtk+/gtk+<a href=3D"ht=
tp://3_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">3_3.20.6.bb</a> &lt;=
<a href=3D"http://3_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">http://=
3_3.20.6.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -3,14 +3,13 @@ require gtk+3.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAJ_VER =3D &quot;${@oe.utils.trim=
_version(&quot;${PV}&quot;, 2)}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SRC_URI =3D<br>
<br>
&quot;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D=
/gtk+-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://ftp.gno=
me.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz</a><br>
&lt;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/g=
tk+-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome=
.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz</a>&gt;<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//hardcoded_libtool.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//Dont-force-csd.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//Do-not-try-to-initialize-GL-without-libGL.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//0001-Add-disable-opengl-configure-option.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//0001-Hardcoded-libtool.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//0002-Do-not-try-to-initialize-GL-without-libGL.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//0003-Add-disable-opengl-configure-option.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//0004-configure.ac-Fix-wayland-protocols-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -SRC_URI[md5sum] =3D &quot;9671acb41dc13561d192=
33f1a75cf184&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -SRC_URI[sha256sum] =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1c53ef1bb55364698f7183ecd185b547f92f4a3a7=
abfafd531400232e2e052f8&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +SRC_URI[md5sum] =3D &quot;914e55ea053161f4a575=
c1c8dade7954&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +SRC_URI[sha256sum] =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;3f8016563a96b1cfef4ac9e795647f6316deb2978=
ff939b19e4e4f8f936fa4b2&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S =3D &quot;${WORKDIR}/gtk+-${PV}&=
quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git a/meta/recipes-gnome/gtk+/<a href=3D=
"http://gtk-icon-utils-native_3.18.8.bb" rel=3D"noreferrer" target=3D"_blan=
k">gtk-icon-utils-native_3.18.8.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://gtk-icon-utils-native_3.1=
8.8.bb" rel=3D"noreferrer" target=3D"_blank">http://gtk-icon-utils-native_3=
.18.8.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/meta/recipes-gnome/gtk+/<a href=3D"http://gtk=
-icon-utils-native_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">gtk-icon=
-utils-native_3.20.6.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://gtk-icon-utils-native_3.2=
0.6.bb" rel=3D"noreferrer" target=3D"_blank">http://gtk-icon-utils-native_3=
.20.6.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 similarity index 93%<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rename from meta/recipes-gnome/gtk+/<a href=3D"=
http://gtk-icon-utils-native_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank=
">gtk-icon-utils-native_3.18.8.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://gtk-icon-utils-native_3.1=
8.8.bb" rel=3D"noreferrer" target=3D"_blank">http://gtk-icon-utils-native_3=
.18.8.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rename to meta/recipes-gnome/gtk+/<a href=3D"ht=
tp://gtk-icon-utils-native_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">=
gtk-icon-utils-native_3.20.6.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://gtk-icon-utils-native_3.2=
0.6.bb" rel=3D"noreferrer" target=3D"_blank">http://gtk-icon-utils-native_3=
.20.6.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index 793f14a..e870ba3 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- a/meta/recipes-gnome/gtk+/<a href=3D"http:/=
/gtk-icon-utils-native_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">gtk-=
icon-utils-native_3.18.8.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://gtk-icon-utils-native_3.1=
8.8.bb" rel=3D"noreferrer" target=3D"_blank">http://gtk-icon-utils-native_3=
.18.8.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ b/meta/recipes-gnome/gtk+/<a href=3D"http:/=
/gtk-icon-utils-native_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">gtk-=
icon-utils-native_3.20.6.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://gtk-icon-utils-native_3.2=
0.6.bb" rel=3D"noreferrer" target=3D"_blank">http://gtk-icon-utils-native_3=
.20.6.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -10,8 +10,8 @@ MAJ_VER =3D &quot;${@oe.utils=
.trim_version(&quot;${PV}&quot;, 2)}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SRC_URI =3D<br>
<br>
&quot;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D=
/gtk+-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://ftp.gno=
me.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz</a><br>
&lt;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/g=
tk+-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://ftp.gnome=
.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz</a>&gt;<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Remove-Gdk-dependency-from-gtk-encode-sy=
mbolic-svg.patch&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -SRC_URI[md5sum] =3D &quot;9671acb41dc13561d192=
33f1a75cf184&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -SRC_URI[sha256sum] =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;1c53ef1bb55364698f7183ecd185b547f92f4a3a7=
abfafd531400232e2e052f8&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +SRC_URI[md5sum] =3D &quot;914e55ea053161f4a575=
c1c8dade7954&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +SRC_URI[sha256sum] =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;3f8016563a96b1cfef4ac9e795647f6316deb2978=
ff939b19e4e4f8f936fa4b2&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIC_FILES_CHKSUM =3D<br>
&quot;file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdb=
fa26287a271dce88af737 \<br>
<br>
<br>
</blockquote></blockquote>
</div></div></blockquote></div><br></div></div>

--001a113ce6fa1467d50536f2405c--
