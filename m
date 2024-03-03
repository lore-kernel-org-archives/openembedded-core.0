Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27EDC5475B
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 10:33:21 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.70777.1709461997827242687
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 02:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id C9F58E4EC
	for <openembedded-core@lists.openembedded.org>; Sun,  3 Mar 2024 11:33:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.233.233]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rgj9a-35O2S10; Sun, 3 Mar 2024 11:33:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk+3: update 3.24.38 -> 3.24.41
Date: Sun,  3 Mar 2024 11:33:29 +0100
Message-ID: <20240303103329.252312-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709461991-3B7FD95D-709AC934/0/0 CLEAN NORMAL
X-TOI-MSGID: c65135b4-e746-4e06-a733-e9c7f51921bf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 10:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196556

- update opengl.patch

Overview of Changes in GTK+ 3.24.41, 23-01-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix a crash introduced in the X11 changes in 3.24.40

* Build fixes

* Wayland: Fix interpretation of gtk-shell protocol

Overview of Changes in GTK+ 3.24.40, 17-01-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkEmojiChooser:
 - Update to CLDR v44
 - Add more translations

* GtkGestures:
 - Preserve accuracy when translating events

* X11
 - Support 'virtual' XRANDR monitors

* MacOs:
 - Use consistent event coordinates

* Translation updates:
 Georgian
 Hebrew
 Swedish

Overview of Changes in GTK+ 3.24.39, 19-12-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkMountOperation:
 - Avoid a segfault

* GtkTooltip:
 - Fix some positioning problems

* GtkFileChooser:
 - Handle webdav in the pathbar

* GtkFileChooserNative:
 - Fix closing portal file choosers

* GDK:
 - Handle offscreen windows better in some places

* Wayland:
 - Create pad devices on enter
 - Ensure device-added/removed are emitted
 - Make stylus button mappings compatible with X11
 - Try harder to preserve cursor size with scaling
 - Avoid oob access to cursor images
 - Support tiling in xdg-shell
 - Avoid using legacy cursor names
 - Fix buffer size for scaled custom cursors

* X11:
 - Remove slow path in gdk_cairo_draw_from_gl
 - Trap more XRANDR errors

* MacOs:
 - Make gdkquartz-cocoa-access.h usable again
 - Silence secure-restore message

* Translation updates
 Belarusian
 British English
 Catalan
 Chinese (China)
 Czech
 Danish
 Esperanto
 Farsi
 Georgian
 Greek
 Hebrew
 Icelandic
 Kazakh
 Korean
 Polish
 Punjabi
 Romanian
 Slovak
 Slovenian
 Spanish
 Turkish

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 25 ++++++++++---------
 .../{gtk+3_3.24.38.bb =3D> gtk+3_3.24.41.bb}    |  2 +-
 2 files changed, 14 insertions(+), 13 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.38.bb =3D> gtk+3_3.24.41.bb} =
(87%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gn=
ome/gtk+/gtk+3/opengl.patch
index 7354265e10..8f2feb0ee7 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -141,17 +141,18 @@ diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
 index 9690077cc2..55f85ef605 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
-@@ -26,7 +26,9 @@
- # include "win32/gdkwin32.h"
- #endif
+@@ -21,8 +21,9 @@
+ #include "gdkglcontextprivate.h"
 =20
+ #include "gdkinternals.h"
+-
 +#ifdef HAVE_OPENGL
  #include <epoxy/gl.h>
 +#endif
  #include <math.h>
  #include <string.h>
 =20
-@@ -40,6 +42,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *sur=
face,
+@@ -36,6 +37,7 @@
                                 g_object_ref (window),  g_object_unref);
  }
 =20
@@ -159,7 +160,7 @@ index 9690077cc2..55f85ef605 100644
  static const char *
  get_vertex_type_name (int type)
  {
-@@ -212,6 +215,7 @@ use_texture_rect_program (GdkGLContextPaintData *pai=
nt_data)
+@@ -208,6 +210,7 @@
        glUseProgram (paint_data->current_program->program);
      }
  }
@@ -167,7 +168,7 @@ index 9690077cc2..55f85ef605 100644
 =20
  void
  gdk_gl_texture_quads (GdkGLContext *paint_context,
-@@ -220,6 +224,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+@@ -216,6 +219,7 @@
                        GdkTexturedQuad *quads,
                        gboolean flip_colors)
  {
@@ -175,7 +176,7 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContextPaintData *paint_data  =3D gdk_gl_context_get_paint_data =
(paint_context);
    GdkGLContextProgram *program;
    GdkWindow *window =3D gdk_gl_context_get_window (paint_context);
-@@ -293,6 +298,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+@@ -289,6 +293,7 @@
 =20
    glDisableVertexAttribArray (program->position_location);
    glDisableVertexAttribArray (program->uv_location);
@@ -183,15 +184,15 @@ index 9690077cc2..55f85ef605 100644
  }
 =20
  /* x,y,width,height describes a rectangle in the gl render buffer
-@@ -341,6 +347,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
+@@ -337,6 +342,7 @@
                          int                   width,
                          int                   height)
  {
 +#ifdef HAVE_OPENGL
-   GdkGLContext *paint_context;
+   GdkGLContext *paint_context, *current_context;
    cairo_surface_t *image;
    cairo_matrix_t matrix;
-@@ -718,6 +725,7 @@ out:
+@@ -703,6 +709,7 @@
    if (clip_region)
      cairo_region_destroy (clip_region);
 =20
@@ -199,7 +200,7 @@ index 9690077cc2..55f85ef605 100644
  }
 =20
  /* This is always called with the paint context current */
-@@ -725,6 +733,7 @@ void
+@@ -710,6 +717,7 @@
  gdk_gl_texture_from_surface (cairo_surface_t *surface,
  			     cairo_region_t  *region)
  {
@@ -207,7 +208,7 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    double device_x_offset, device_y_offset;
-@@ -825,4 +834,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surfac=
e,
+@@ -810,4 +818,5 @@
 =20
    glDisable (GL_SCISSOR_TEST);
    glDeleteTextures (1, &texture_id);
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.41.bb
similarity index 87%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
index c23c46a689..17e90c59f0 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
@@ -5,7 +5,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+=
-${PV}.tar.xz \
            file://opengl.patch \
            "
-SRC_URI[sha256sum] =3D "ce11decf018b25bdd8505544a4f87242854ec88be054d9ad=
e5f3a20444dd8ee7"
+SRC_URI[sha256sum] =3D "47da61487af3087a94bc49296fd025ca0bc02f96ef06c556=
e7c8988bd651b6fa"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.43.0


