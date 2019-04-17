Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 501A67D330
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 04:04:56 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w5so25852040qtb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 21:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UZz5GhS3ZxqGjeaTHWFGrCs5o94+M+rUGyLHcZrUJGA=;
	b=Gfsnaxf2aKe1xnc0j1qRJ7a3aALMuil8qYJnBT0NbyjZ8XdaDObLqDKu7Sx5ruX0y4
	PclErj8TxZa8LTs855HTeFkgNrLLmttgUULz1Ks923LrE2bq0q3mtoS71WRio23XT92y
	TKJG2W5y2vEiOLbvgd6rT/NhEV3Ke2L18/XtKs2iqCdc1yG2Xbn0vIv2SM4RTYx/jkBC
	lQkvCod4xaAbMc6tLxzbyX41HoKHif/++CpDW0E5h6GHYRi0kZIeYR4uiIeDAG0f5Fmk
	J53GWFHwpViuZXgucac2eHRFVBcVPN32/6vQcGDsZBm6msF5EwJupt/NWEiJMqu9U/5T
	/7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UZz5GhS3ZxqGjeaTHWFGrCs5o94+M+rUGyLHcZrUJGA=;
	b=QwOYs/xNu4tskfYrksRK1uNLjXyb60TN6jRRfWAh6+3AoKmcgK8w98PxkQ9t1DdhWn
	bhYvdofwtFidHZC6b/t8FvjPQQC89F6sxltMsgpEmsCVeFI0NGcPd50Z4eK77rPxAKld
	zBuH+RvpXIqlt89y1GVEhwUFRBcbGy1qe+ZaNjdZ+bI6VIQUegGTE6yrN7armVTh5yju
	35hH2TZlhx4k6zVD9WeSICgu8rNzFvQXhzYnTwcpaZlaIpZ3OfZdIF8UAdw2TvpvvGtv
	jNCbTHpxWD9JUxPgUEwPFO13w8lIjVuOnyy6yHYfIeNtrPuY7Zj+jFEBrCnULGdaiuBu
	FPyw==
X-Gm-Message-State: APjAAAWErL2ifGuvxVC0gkze5SveolCxcXxiUnmIrrvM9+oMn+YMNZM8
	GLu0c+s54TOI4mGDsBWDoszX5d4KUmHMSRONj7o=
X-Google-Smtp-Source: APXvYqzQPtnTBUoTSzxmx9JvlfL4FYDjYYvRJlyoH6MMQiu1TowjsRMhCZ12XwbJVcTIbtao3UyjHTLhcgnIFaVQRDk=
X-Received: by 2002:a0c:81a9:: with SMTP id 38mr67706372qvd.208.1555473896973; 
	Tue, 16 Apr 2019 21:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
	<20190415105457.57067-6-alex.kanavin@gmail.com>
In-Reply-To: <20190415105457.57067-6-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Apr 2019 21:04:30 -0700
Message-ID: <CAMKF1soxwoYJr1rcqvN27qugjajsSQ-2K5iC4Kn2HWQPgrnezQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/19] vala: update to 0.44.3
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
X-List-Received-Date: Wed, 17 Apr 2019 04:04:56 -0000
Content-Type: text/plain; charset="UTF-8"

This means we need to update xfce4-vala recipe at same time
see
https://errors.yoctoproject.org/Errors/Details/237659/

On Mon, Apr 15, 2019 at 3:56 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Remove valadoc-related patches, as upstream added an option to disable it;
> adjust the recipe accordingly.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/vala/vala.inc           |   2 +-
>  .../vala/vala/0001-Disable-valadoc.patch      |  32 ---
>  .../vala/vala/disable-graphviz.patch          | 226 ------------------
>  meta/recipes-devtools/vala/vala_0.42.5.bb     |  10 -
>  meta/recipes-devtools/vala/vala_0.44.3.bb     |   8 +
>  5 files changed, 9 insertions(+), 269 deletions(-)
>  delete mode 100644 meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch
>  delete mode 100644 meta/recipes-devtools/vala/vala/disable-graphviz.patch
>  delete mode 100644 meta/recipes-devtools/vala/vala_0.42.5.bb
>  create mode 100644 meta/recipes-devtools/vala/vala_0.44.3.bb
>
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
> index f680640ca68..703ed1aa8d0 100644
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -37,7 +37,7 @@ EOF
>          chmod +x ${B}/vapigen-wrapper
>  }
>
> -EXTRA_OECONF += " --disable-graphviz"
> +EXTRA_OECONF += " --disable-valadoc"
>
>  # Vapigen wrapper needs to be available system-wide, because it will be used
>  # to build vapi files from all other packages with vala support
> diff --git a/meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch b/meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch
> deleted file mode 100644
> index 9b27b7fd14a..00000000000
> --- a/meta/recipes-devtools/vala/vala/0001-Disable-valadoc.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From b6ca3876e233c724fd460c1579abc4ab63c8d01e Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 4 Oct 2017 15:23:08 +0300
> -Subject: [PATCH] Disable valadoc
> -
> -Valadoc is a documentation generator for Vala sources, which was
> -recently merged into the main vala source tree. Unsurprisingly,
> -it's broken in cross-compile environment in multiple ways,
> -so let's fix it some other time.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - Makefile.am | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index e5dc0cc..813b3fc 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -13,8 +13,6 @@ SUBDIRS = \
> -       doc \
> -       gobject-introspection \
> -       vapigen \
> --      libvaladoc \
> --      valadoc \
> -       $(NULL)
> -
> - if ENABLE_UNVERSIONED
> ---
> -2.14.1
> -
> diff --git a/meta/recipes-devtools/vala/vala/disable-graphviz.patch b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
> deleted file mode 100644
> index e521bc854b3..00000000000
> --- a/meta/recipes-devtools/vala/vala/disable-graphviz.patch
> +++ /dev/null
> @@ -1,226 +0,0 @@
> -From b2723ff18b70c67c8a7fab5375a7f3c442d49790 Mon Sep 17 00:00:00 2001
> -From: Rico Tzschichholz <ricotz@ubuntu.com>
> -Date: Wed, 6 Sep 2017 18:52:55 +0200
> -Subject: [PATCH] libvaladoc: Allow disabling the graphviz dependency of
> -
> - valadoc
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=787375
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -Upstream-Status: Submitted [bugzilla link above]
> -
> ----
> - configure.ac                          | 60 ++++++++++++++-------------
> - libvaladoc/Makefile.am                | 25 ++++++++---
> - libvaladoc/html/basicdoclet.vala      |  8 ++++
> - libvaladoc/html/htmlmarkupwriter.vala |  4 ++
> - 4 files changed, 63 insertions(+), 34 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 730c72d..af81986 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -119,34 +119,38 @@ PKG_CHECK_MODULES(GMODULE, gmodule-2.0 >= $GLIB_REQUIRED)
> - AC_SUBST(GMODULE_CFLAGS)
> - AC_SUBST(GMODULE_LIBS)
> -
> --PKG_CHECK_MODULES(LIBGVC, libgvc >= $LIBGVC_REQUIRED)
> --AC_MSG_CHECKING([for CGRAPH])
> --cgraph_tmp_LIBADD="$LIBADD"
> --cgraph_tmp_CFLAGS="$CFLAGS"
> --LIBADD="$LIBADD $LIBGVC_LIBS"
> --CFLAGS="$CFLAGS $LIBGVC_CFLAGS"
> --AC_RUN_IFELSE(
> --      [AC_LANG_SOURCE([
> --              #include <gvc.h>
> --
> --              int main(void) {
> --                      #ifdef WITH_CGRAPH
> --                              return 0;
> --                      #else
> --                              return -1;
> --                      #endif
> --              }
> --      ])], [
> --              AC_MSG_RESULT([yes])
> --              VALAFLAGS="$VALAFLAGS -D WITH_CGRAPH"
> --              have_cgraph=yes
> --      ], [
> --              AC_MSG_RESULT([no])
> --              have_cgraph=no
> --      ]
> --)
> --LIBADD="$cgraph_tmp_LIBADD"
> --CFLAGS="$cgraph_tmp_CFLAGS"
> -+AC_ARG_ENABLE(graphviz, AS_HELP_STRING([--disable-graphviz], [Disable graphviz usage for valadoc]), enable_graphviz=$enableval, enable_graphviz=yes)
> -+if test x$enable_graphviz = xyes; then
> -+      PKG_CHECK_MODULES(LIBGVC, libgvc >= $LIBGVC_REQUIRED)
> -+      AC_MSG_CHECKING([for CGRAPH])
> -+      VALAFLAGS="$VALAFLAGS -D HAVE_GRAPHVIZ"
> -+      cgraph_tmp_LIBADD="$LIBADD"
> -+      cgraph_tmp_CFLAGS="$CFLAGS"
> -+      LIBADD="$LIBADD $LIBGVC_LIBS"
> -+      CFLAGS="$CFLAGS $LIBGVC_CFLAGS"
> -+      AC_RUN_IFELSE(
> -+              [AC_LANG_SOURCE([
> -+                      #include <gvc.h>
> -+                      int main(void) {
> -+                              #ifdef WITH_CGRAPH
> -+                                      return 0;
> -+                              #else
> -+                                      return -1;
> -+                              #endif
> -+                      }
> -+              ])], [
> -+                      AC_MSG_RESULT([yes])
> -+                      VALAFLAGS="$VALAFLAGS -D WITH_CGRAPH"
> -+                      have_cgraph=yes
> -+              ], [
> -+                      AC_MSG_RESULT([no])
> -+                      have_cgraph=no
> -+              ]
> -+      )
> -+      LIBADD="$cgraph_tmp_LIBADD"
> -+      CFLAGS="$cgraph_tmp_CFLAGS"
> -+fi
> -+AM_CONDITIONAL(ENABLE_GRAPHVIZ, test x$enable_graphviz = xyes)
> - AM_CONDITIONAL(HAVE_CGRAPH, test "$have_cgraph" = "yes")
> -
> - AC_PATH_PROG([XSLTPROC], [xsltproc], :)
> -diff --git a/libvaladoc/Makefile.am b/libvaladoc/Makefile.am
> -index f3f790e..3c5dc4c 100644
> ---- a/libvaladoc/Makefile.am
> -+++ b/libvaladoc/Makefile.am
> -@@ -128,10 +128,6 @@ libvaladoc_la_VALASOURCES = \
> -       content/tablerow.vala \
> -       content/taglet.vala \
> -       content/text.vala \
> --      charts/chart.vala \
> --      charts/chartfactory.vala \
> --      charts/hierarchychart.vala \
> --      charts/simplechartfactory.vala \
> -       parser/manyrule.vala \
> -       parser/oneofrule.vala \
> -       parser/optionalrule.vala \
> -@@ -158,13 +154,24 @@ libvaladoc_la_VALASOURCES = \
> -       highlighter/codetoken.vala \
> -       highlighter/highlighter.vala \
> -       html/basicdoclet.vala \
> --      html/htmlchartfactory.vala \
> -       html/linkhelper.vala \
> -       html/cssclassresolver.vala \
> -       html/htmlmarkupwriter.vala \
> -       html/htmlrenderer.vala \
> -       $(NULL)
> -
> -+if ENABLE_GRAPHVIZ
> -+libvaladoc_la_VALASOURCES += \
> -+      charts/chart.vala \
> -+      charts/chartfactory.vala \
> -+      charts/hierarchychart.vala \
> -+      charts/simplechartfactory.vala \
> -+      html/htmlchartfactory.vala \
> -+      $(NULL)
> -+
> -+LIBGVC_PKG = --vapidir $(top_srcdir)/vapi --pkg libgvc
> -+endif
> -+
> - libvaladoc@PACKAGE_SUFFIX@_la_SOURCES = \
> -       libvaladoc.vala.stamp \
> -       $(libvaladoc_la_VALASOURCES:.vala=.c) \
> -@@ -184,11 +191,11 @@ libvaladoc.vala.stamp: $(libvaladoc_la_VALASOURCES)
> -               --library valadoc \
> -               --vapi valadoc@PACKAGE_SUFFIX@.vapi \
> -               --vapidir $(top_srcdir)/vapi --pkg gmodule-2.0 \
> --              --vapidir $(top_srcdir)/vapi --pkg libgvc \
> -               --vapidir $(top_srcdir)/gee --pkg gee \
> -               --vapidir $(top_srcdir)/vala --pkg vala \
> -               --vapidir $(top_srcdir)/ccode --pkg ccode \
> -               --vapidir $(top_srcdir)/codegen --pkg codegen \
> -+              $(LIBGVC_PKG) \
> -               --pkg config \
> -               $(filter %.vala %.c,$^)
> -       touch $@
> -@@ -217,6 +224,9 @@ nodist_pkgconfig_DATA = valadoc@PACKAGE_SUFFIX@.pc
> -
> - valadoc@PACKAGE_SUFFIX@.pc: valadoc.pc
> -       cp $< $@
> -+if !ENABLE_GRAPHVIZ
> -+      sed -i "s/libgvc //g" $@
> -+endif
> -
> - vapidir = $(datadir)/vala/vapi
> - dist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.vapi
> -@@ -224,6 +234,9 @@ nodist_vapi_DATA = valadoc@PACKAGE_SUFFIX@.deps
> -
> - valadoc@PACKAGE_SUFFIX@.deps: valadoc.deps
> -       cp $< $@
> -+if !ENABLE_GRAPHVIZ
> -+      sed -i "s/libgvc//g" $@
> -+endif
> -
> - EXTRA_DIST = \
> -       $(libvaladoc_la_VALASOURCES) \
> -diff --git a/libvaladoc/html/basicdoclet.vala b/libvaladoc/html/basicdoclet.vala
> -index 192e488..ec09602 100644
> ---- a/libvaladoc/html/basicdoclet.vala
> -+++ b/libvaladoc/html/basicdoclet.vala
> -@@ -46,7 +46,11 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
> -       protected HtmlRenderer _renderer;
> -       protected Html.MarkupWriter writer;
> -       protected Html.CssClassResolver cssresolver;
> -+#if HAVE_GRAPHVIZ
> -       protected Charts.Factory image_factory;
> -+#else
> -+      protected void* image_factory;
> -+#endif
> -       protected ErrorReporter reporter;
> -       protected string package_list_link = "../index.html";
> -
> -@@ -120,7 +124,9 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
> -               this.linker = new LinkHelper ();
> -
> -               _renderer = new HtmlRenderer (settings, this.linker, this.cssresolver);
> -+#if HAVE_GRAPHVIZ
> -               this.image_factory = new SimpleChartFactory (settings, linker);
> -+#endif
> -       }
> -
> -
> -@@ -1026,6 +1032,7 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
> -       }
> -
> -       protected void write_image_block (Api.Node element) {
> -+#if HAVE_GRAPHVIZ
> -               if (element is Class || element is Interface || element is Struct) {
> -                       unowned string format = (settings.use_svg_images ? "svg" : "png");
> -                       var chart = new Charts.Hierarchy (image_factory, element);
> -@@ -1045,6 +1052,7 @@ public abstract class Valadoc.Html.BasicDoclet : Api.Visitor, Doclet {
> -                                                                          this.get_img_path_html (element, format)});
> -                       writer.add_usemap (chart);
> -               }
> -+#endif
> -       }
> -
> -       public void write_namespace_content (Namespace node, Api.Node? parent) {
> -diff --git a/libvaladoc/html/htmlmarkupwriter.vala b/libvaladoc/html/htmlmarkupwriter.vala
> -index 5aa4afd..e79b0b8 100644
> ---- a/libvaladoc/html/htmlmarkupwriter.vala
> -+++ b/libvaladoc/html/htmlmarkupwriter.vala
> -@@ -51,12 +51,16 @@ public class Valadoc.Html.MarkupWriter : Valadoc.MarkupWriter {
> -               }
> -       }
> -
> -+#if HAVE_GRAPHVIZ
> -       public unowned MarkupWriter add_usemap (Charts.Chart chart) {
> -               string? buf = (string?) chart.write_buffer ("cmapx");
> -               if (buf != null) {
> -                       raw_text ("\n");
> -                       raw_text ((!) buf);
> -               }
> -+#else
> -+      public unowned MarkupWriter add_usemap (void* chart) {
> -+#endif
> -
> -               return this;
> -       }
> diff --git a/meta/recipes-devtools/vala/vala_0.42.5.bb b/meta/recipes-devtools/vala/vala_0.42.5.bb
> deleted file mode 100644
> index eea17661604..00000000000
> --- a/meta/recipes-devtools/vala/vala_0.42.5.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
> -             file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
> -            file://disable-graphviz.patch \
> -            file://0001-Disable-valadoc.patch \
> -"
> -
> -SRC_URI[md5sum] = "d204eb4fa210995e731e2a9a01c8c772"
> -SRC_URI[sha256sum] = "8c33b4abc0573d364781bbfe54a1668ed34956902e471191a31cf05dc87c6e12"
> diff --git a/meta/recipes-devtools/vala/vala_0.44.3.bb b/meta/recipes-devtools/vala/vala_0.44.3.bb
> new file mode 100644
> index 00000000000..fe6a5fcdcbd
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala_0.44.3.bb
> @@ -0,0 +1,8 @@
> +require ${BPN}.inc
> +
> +SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
> +           file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
> +           "
> +
> +SRC_URI[md5sum] = "25f97c1b46ae0b60b5cc49cbc044eca2"
> +SRC_URI[sha256sum] = "8553b422484af88be1685d8b47f7b0df36ae4477c3e77e89ab22276ffed1eae9"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

