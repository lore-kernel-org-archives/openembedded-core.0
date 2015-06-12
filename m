Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id C665A7324E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 08:53:03 +0000 (UTC)
Received: by oihb142 with SMTP id b142so17857673oih.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 01:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e2ZjOj5N+3O4Rqo2GW+jc3OK4v4HdaeargmpDNRPeFs=;
	b=T4P/qtAu7uFGuR8xQKTd9Bhx1afTp6+L0trFE0hpvXi0CTWT1Wzc/c39zvLUCy7rgb
	1aj8jsxREjy0hkpiMKTbNQ9bB2ORvq0U0kxBeJJpbSM1RAfd+mvhSUlKAQSCY3B4+dmv
	Oj/lf1/hm1ea8z89saBX6fkYci0MKhKhIJ1gdN2Pzb/EjVn8IKmfH9cbmDaovcEaSjDd
	jqOXG3cDA9CwmrPcE5s5QCYrRjOdNfrsKxDpGEZVFG+PVe+VW6RocHXu4iSqpsZEM/r6
	MU0168bXyt0I6mMNJs/8/j59ShG1OeZrQOLor8ZVEkpdWyfLx58EyXi4FMACK7rdMZtI
	TO4A==
X-Gm-Message-State: ALoCoQkzR49JlagbgHJh1x/1Gup5OnChCN8RHmuIF9SGSWgf6VXWyQFif8ItsGAcH/q6d/IPh2Z/
X-Received: by 10.60.47.165 with SMTP id e5mr11247924oen.52.1434099184843;
	Fri, 12 Jun 2015 01:53:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Fri, 12 Jun 2015 01:52:34 -0700 (PDT)
In-Reply-To: <ee45da59fce99a5a283a7d9a50a8d85aea7f4f30.1434028277.git.jussi.kukkonen@intel.com>
References: <cover.1434028277.git.jussi.kukkonen@intel.com>
	<ee45da59fce99a5a283a7d9a50a8d85aea7f4f30.1434028277.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 12 Jun 2015 11:52:34 +0300
Message-ID: <CAHiDW_HhdeN5R39vw0NAzWQFUsYgSst=7nwxf3ZnKMUtzMguXQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gtk-update-icon-cache-native: Upgrade, add binary
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
X-List-Received-Date: Fri, 12 Jun 2015 08:53:09 -0000
Content-Type: text/plain; charset=UTF-8

Please don't pull this yet:

I seem to still be missing a dependency on this recipe as building
adwaita after wiping sysroot gives these errors from running
gtk-encode-symbolic-svg:
> Can't load file: Unrecognized image file format

Jussi

On 11 June 2015 at 16:24, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> * Upgrade to GTK+ 3.16.3
> * Add gtk-encode-symbolic-svg binary: it is used by icon themes
>   (e.g. Adwaita) to generate png versions of svg icons.
> * Add a patch that removes Gdk dependency from gtk-encode-symbolic-svg:
>   this way the native build stays slim.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  ...4.bb => gtk-update-icon-cache-native_3.16.3.bb} |  41 ++++++---
>  ...k-dependency-from-gtk-encode-symbolic-svg.patch | 102 +++++++++++++++++++++
>  2 files changed, 129 insertions(+), 14 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk-update-icon-cache-native_3.4.4.bb => gtk-update-icon-cache-native_3.16.3.bb} (42%)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
> similarity index 42%
> rename from meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> rename to meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
> index 73b7644..9f1c2f0 100644
> --- a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> +++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
> @@ -1,20 +1,23 @@
> -SUMMARY = "gtk-update-icon-cache built natively"
> -DESCRIPTION = "Just gtk-update-icon-cache built from GTK+ natively, for on-host postinst script execution."
> +SUMMARY = "Native icon utils for GTK+"
> +DESCRIPTION = "gtk-update-icon-cache and gtk-encode-symbolic-svg built from GTK+ natively, for build time and on-host postinst script execution."
>  SECTION = "libs"
>
> -DEPENDS = "gdk-pixbuf-native"
> +DEPENDS = "glib-2.0-native gdk-pixbuf-native"
>
>  LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
>
> +MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
> +          file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
> +SRC_URI[md5sum] = "af22a1a753ea9b182babfed9d8b38228"
> +SRC_URI[sha256sum] = "2943fd4a6b02c2a9b2edd231c1d8f7a1d2f8d36996f14310d34f503dca9ebea4"
> +
>  LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
>                      file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
>                      file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
>                      file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
>
> -SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz"
> -SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
> -SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
> -
>  S = "${WORKDIR}/gtk+-${PV}"
>
>  inherit pkgconfig native
> @@ -22,26 +25,36 @@ inherit pkgconfig native
>  PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
>
>  do_configure() {
> -       # Quite ugly but defines enough to compile the tool.
> +       # Quite ugly but defines enough to compile the tools.
>         if ! test -f gtk/config.h; then
>                 echo "#define GETTEXT_PACKAGE \"gtk30\"" >> gtk/config.h
>                 echo "#define HAVE_UNISTD_H 1" >> gtk/config.h
>                 echo "#define HAVE_FTW_H 1" >> gtk/config.h
> -
> +       fi
> +       if ! test -f gdk/config.h; then
> +               touch gdk/config.h
>         fi
>  }
>
>  do_compile() {
> -       ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} ${S}/gtk/updateiconcache.c \
> -       $(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
> -               -o gtk-update-icon-cache
> +       ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \
> +               ${S}/gtk/updateiconcache.c \
> +               $(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
> +               -o gtk-update-icon-cache
> +
> +       ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \
> +               ${S}/gtk/encodesymbolic.c \
> +               $(${PKG_CONFIG_FOR_BUILD} --cflags --libs gio-2.0 gdk-pixbuf-2.0) \
> +               -o gtk-encode-symbolic-svg
>  }
>
>  do_install() {
>         install -d ${D}${bindir}
> -        install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
> +       install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
> +       install -m 0755 ${B}/gtk-encode-symbolic-svg ${D}${bindir}
>
>         create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
>                 GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
> -
> +       create_wrapper ${D}/${bindir}/gtk-encode-symbolic-svg \
> +               GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
>  }
> diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch b/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
> new file mode 100644
> index 0000000..237f803
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
> @@ -0,0 +1,102 @@
> +From 4d09ff324419fe4e671233044e424378da53969b Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Tue, 9 Jun 2015 14:20:30 +0300
> +Subject: [PATCH] Remove Gdk-dependency from gtk-encode-symbolic-svg
> +
> +Building gtk-encode-symbolic-svg without building Gdk is useful
> +as only the icon tools are needed on the native build: this makes
> +native build much faster and requires much less dependencies.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + gtk/encodesymbolic.c | 36 ++++++++++--------------------------
> + 1 file changed, 10 insertions(+), 26 deletions(-)
> +
> +diff --git a/gtk/encodesymbolic.c b/gtk/encodesymbolic.c
> +index 9f7d015..1f07563 100644
> +--- a/gtk/encodesymbolic.c
> ++++ b/gtk/encodesymbolic.c
> +@@ -19,7 +19,6 @@
> +
> + #include <glib.h>
> + #include <gdk-pixbuf/gdk-pixdata.h>
> +-#include <gdk/gdk.h>
> + #include <glib/gi18n.h>
> +
> + #ifdef HAVE_UNISTD_H
> +@@ -43,30 +42,18 @@ static GdkPixbuf *
> + load_symbolic_svg (char *file_data, gsize file_len,
> +                    int width,
> +                    int height,
> +-                   const GdkRGBA  *fg,
> +-                   const GdkRGBA  *success_color,
> +-                   const GdkRGBA  *warning_color,
> +-                   const GdkRGBA  *error_color,
> ++                   const char *css_fg,
> ++                   const char *css_success,
> ++                   const char *css_warning,
> ++                   const char *css_error,
> +                    GError        **error)
> + {
> +   GInputStream *stream;
> +   GdkPixbuf *pixbuf;
> +-  gchar *css_fg;
> +-  gchar *css_success;
> +-  gchar *css_warning;
> +-  gchar *css_error;
> +   gchar *data;
> +   gchar *svg_width, *svg_height;
> +   gchar *escaped_file_data;
> +
> +-  css_fg = gdk_rgba_to_string (fg);
> +-
> +-  css_success = css_warning = css_error = NULL;
> +-
> +-  css_warning = gdk_rgba_to_string (warning_color);
> +-  css_error = gdk_rgba_to_string (error_color);
> +-  css_success = gdk_rgba_to_string (success_color);
> +-
> +   /* Fetch size from the original icon */
> +   stream = g_memory_input_stream_new_from_data (file_data, file_len, NULL);
> +   pixbuf = gdk_pixbuf_new_from_stream (stream, NULL, error);
> +@@ -105,10 +92,6 @@ load_symbolic_svg (char *file_data, gsize file_len,
> +                       "</svg>",
> +                       NULL);
> +   g_free (escaped_file_data);
> +-  g_free (css_fg);
> +-  g_free (css_warning);
> +-  g_free (css_error);
> +-  g_free (css_success);
> +   g_free (svg_width);
> +   g_free (svg_height);
> +
> +@@ -167,7 +150,8 @@ make_symbolic_pixbuf (char *file,
> +                       GError        **error)
> +
> + {
> +-  GdkRGBA r = { 1,0,0,1}, g = {0,1,0,1};
> ++  const char r[] = "rgba(255,0,0,1)";
> ++  const char g[] = "rgba(0,255,0,1)";
> +   GdkPixbuf *loaded;
> +   GdkPixbuf *pixbuf;
> +   int plane;
> +@@ -196,10 +180,10 @@ make_symbolic_pixbuf (char *file,
> +        * the "rest", as all color fractions should add up to 1.
> +        */
> +       loaded = load_symbolic_svg (file_data, file_len, width, height,
> +-                                  &g,
> +-                                  plane == 0 ? &r : &g,
> +-                                  plane == 1 ? &r : &g,
> +-                                  plane == 2 ? &r : &g,
> ++                                  g,
> ++                                  plane == 0 ? r : g,
> ++                                  plane == 1 ? r : g,
> ++                                  plane == 2 ? r : g,
> +                                   error);
> +       if (loaded == NULL)
> +         return NULL;
> +--
> +2.1.4
> +
> --
> 2.1.4
>

On 11 June 2015 at 16:24, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> * Upgrade to GTK+ 3.16.3
> * Add gtk-encode-symbolic-svg binary: it is used by icon themes
>   (e.g. Adwaita) to generate png versions of svg icons.
> * Add a patch that removes Gdk dependency from gtk-encode-symbolic-svg:
>   this way the native build stays slim.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  ...4.bb => gtk-update-icon-cache-native_3.16.3.bb} |  41 ++++++---
>  ...k-dependency-from-gtk-encode-symbolic-svg.patch | 102 +++++++++++++++++++++
>  2 files changed, 129 insertions(+), 14 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk-update-icon-cache-native_3.4.4.bb => gtk-update-icon-cache-native_3.16.3.bb} (42%)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
> similarity index 42%
> rename from meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> rename to meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
> index 73b7644..9f1c2f0 100644
> --- a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> +++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
> @@ -1,20 +1,23 @@
> -SUMMARY = "gtk-update-icon-cache built natively"
> -DESCRIPTION = "Just gtk-update-icon-cache built from GTK+ natively, for on-host postinst script execution."
> +SUMMARY = "Native icon utils for GTK+"
> +DESCRIPTION = "gtk-update-icon-cache and gtk-encode-symbolic-svg built from GTK+ natively, for build time and on-host postinst script execution."
>  SECTION = "libs"
>
> -DEPENDS = "gdk-pixbuf-native"
> +DEPENDS = "glib-2.0-native gdk-pixbuf-native"
>
>  LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
>
> +MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
> +          file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
> +SRC_URI[md5sum] = "af22a1a753ea9b182babfed9d8b38228"
> +SRC_URI[sha256sum] = "2943fd4a6b02c2a9b2edd231c1d8f7a1d2f8d36996f14310d34f503dca9ebea4"
> +
>  LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
>                      file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
>                      file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
>                      file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
>
> -SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz"
> -SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
> -SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
> -
>  S = "${WORKDIR}/gtk+-${PV}"
>
>  inherit pkgconfig native
> @@ -22,26 +25,36 @@ inherit pkgconfig native
>  PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
>
>  do_configure() {
> -       # Quite ugly but defines enough to compile the tool.
> +       # Quite ugly but defines enough to compile the tools.
>         if ! test -f gtk/config.h; then
>                 echo "#define GETTEXT_PACKAGE \"gtk30\"" >> gtk/config.h
>                 echo "#define HAVE_UNISTD_H 1" >> gtk/config.h
>                 echo "#define HAVE_FTW_H 1" >> gtk/config.h
> -
> +       fi
> +       if ! test -f gdk/config.h; then
> +               touch gdk/config.h
>         fi
>  }
>
>  do_compile() {
> -       ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} ${S}/gtk/updateiconcache.c \
> -       $(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
> -               -o gtk-update-icon-cache
> +       ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \
> +               ${S}/gtk/updateiconcache.c \
> +               $(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
> +               -o gtk-update-icon-cache
> +
> +       ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \
> +               ${S}/gtk/encodesymbolic.c \
> +               $(${PKG_CONFIG_FOR_BUILD} --cflags --libs gio-2.0 gdk-pixbuf-2.0) \
> +               -o gtk-encode-symbolic-svg
>  }
>
>  do_install() {
>         install -d ${D}${bindir}
> -        install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
> +       install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
> +       install -m 0755 ${B}/gtk-encode-symbolic-svg ${D}${bindir}
>
>         create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
>                 GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
> -
> +       create_wrapper ${D}/${bindir}/gtk-encode-symbolic-svg \
> +               GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
>  }
> diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch b/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
> new file mode 100644
> index 0000000..237f803
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
> @@ -0,0 +1,102 @@
> +From 4d09ff324419fe4e671233044e424378da53969b Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Tue, 9 Jun 2015 14:20:30 +0300
> +Subject: [PATCH] Remove Gdk-dependency from gtk-encode-symbolic-svg
> +
> +Building gtk-encode-symbolic-svg without building Gdk is useful
> +as only the icon tools are needed on the native build: this makes
> +native build much faster and requires much less dependencies.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + gtk/encodesymbolic.c | 36 ++++++++++--------------------------
> + 1 file changed, 10 insertions(+), 26 deletions(-)
> +
> +diff --git a/gtk/encodesymbolic.c b/gtk/encodesymbolic.c
> +index 9f7d015..1f07563 100644
> +--- a/gtk/encodesymbolic.c
> ++++ b/gtk/encodesymbolic.c
> +@@ -19,7 +19,6 @@
> +
> + #include <glib.h>
> + #include <gdk-pixbuf/gdk-pixdata.h>
> +-#include <gdk/gdk.h>
> + #include <glib/gi18n.h>
> +
> + #ifdef HAVE_UNISTD_H
> +@@ -43,30 +42,18 @@ static GdkPixbuf *
> + load_symbolic_svg (char *file_data, gsize file_len,
> +                    int width,
> +                    int height,
> +-                   const GdkRGBA  *fg,
> +-                   const GdkRGBA  *success_color,
> +-                   const GdkRGBA  *warning_color,
> +-                   const GdkRGBA  *error_color,
> ++                   const char *css_fg,
> ++                   const char *css_success,
> ++                   const char *css_warning,
> ++                   const char *css_error,
> +                    GError        **error)
> + {
> +   GInputStream *stream;
> +   GdkPixbuf *pixbuf;
> +-  gchar *css_fg;
> +-  gchar *css_success;
> +-  gchar *css_warning;
> +-  gchar *css_error;
> +   gchar *data;
> +   gchar *svg_width, *svg_height;
> +   gchar *escaped_file_data;
> +
> +-  css_fg = gdk_rgba_to_string (fg);
> +-
> +-  css_success = css_warning = css_error = NULL;
> +-
> +-  css_warning = gdk_rgba_to_string (warning_color);
> +-  css_error = gdk_rgba_to_string (error_color);
> +-  css_success = gdk_rgba_to_string (success_color);
> +-
> +   /* Fetch size from the original icon */
> +   stream = g_memory_input_stream_new_from_data (file_data, file_len, NULL);
> +   pixbuf = gdk_pixbuf_new_from_stream (stream, NULL, error);
> +@@ -105,10 +92,6 @@ load_symbolic_svg (char *file_data, gsize file_len,
> +                       "</svg>",
> +                       NULL);
> +   g_free (escaped_file_data);
> +-  g_free (css_fg);
> +-  g_free (css_warning);
> +-  g_free (css_error);
> +-  g_free (css_success);
> +   g_free (svg_width);
> +   g_free (svg_height);
> +
> +@@ -167,7 +150,8 @@ make_symbolic_pixbuf (char *file,
> +                       GError        **error)
> +
> + {
> +-  GdkRGBA r = { 1,0,0,1}, g = {0,1,0,1};
> ++  const char r[] = "rgba(255,0,0,1)";
> ++  const char g[] = "rgba(0,255,0,1)";
> +   GdkPixbuf *loaded;
> +   GdkPixbuf *pixbuf;
> +   int plane;
> +@@ -196,10 +180,10 @@ make_symbolic_pixbuf (char *file,
> +        * the "rest", as all color fractions should add up to 1.
> +        */
> +       loaded = load_symbolic_svg (file_data, file_len, width, height,
> +-                                  &g,
> +-                                  plane == 0 ? &r : &g,
> +-                                  plane == 1 ? &r : &g,
> +-                                  plane == 2 ? &r : &g,
> ++                                  g,
> ++                                  plane == 0 ? r : g,
> ++                                  plane == 1 ? r : g,
> ++                                  plane == 2 ? r : g,
> +                                   error);
> +       if (loaded == NULL)
> +         return NULL;
> +--
> +2.1.4
> +
> --
> 2.1.4
>

