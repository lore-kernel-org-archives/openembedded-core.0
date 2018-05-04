Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3B974CA0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 11:52:35 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id p3-v6so3009052itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 04:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mHdXVcvBmbDRf4Vyfyn/+Fy0OPx1Pn70Nf4MsY1fQWU=;
	b=SVybSDZ8fvT5BUyE+mqQq6DAGr8p0IVKU0HLTYrs8mlXKJXSHskUScDsEq6AxXYHen
	ECmxVQGhQc6u832V5CCkyFZujzhH8SBRjgWVJr/bDAHDjkIN4YYZ5l9n233RFJa2ACJc
	O/8OlUsZSqivt7JqlYIY3V4wudD0PaKTlhPsWaqNLd+ADXjXzcb9Y3gE2nzDqTrkChX4
	6TKB+EZHyLxffUr/1qsT2ojv/BNxR8R7VQ7sOr4HC0HrJ6QUhaYs5O68jz44qaC7IvMu
	YTlhfnVoQdygOwyARUqKbHVj6nYEzEFZLIPeFqABTm5Dyg7PInuQisPmWEHLYAoP+JzG
	6PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mHdXVcvBmbDRf4Vyfyn/+Fy0OPx1Pn70Nf4MsY1fQWU=;
	b=g3vDRSmjmaZ06JwyKfQ7UXTVRyiAXReNnuPM4FnkwVnm9ZSpWFHo2h3KHh+IujkYa/
	jcIvH1vkw/P/4l4tHjua40GWAgc8noosAgLuS+o+G5ElTaLqtDGF2YXLceAZiHES1Vsl
	0mFvH2Zv1Me0cz1X3V4nmIuucFNtFm9yjSkTftxUFIlr4KDI1SuUE2fiK21XPHyEnbR4
	F2+FRY3nbVEQwM+Yp3+NmpYV7U+heGR7BiEmO73GpubDVr2jHhwBM85vNb2oSJymepDE
	gU1AIYcOYwMT0NCZiVP17GnwTdsIihYTPT3g8wyVm9ajUi85ZacaZjALWHfp229BaaV5
	wO9w==
X-Gm-Message-State: ALQs6tBYe4kAkVMHSl98gv9IOyF6kfmNQ4cpoPFYamOMU0Fz/lieMYm4
	sZHqu6Kru4Rd3SaGe8IS6lF6Idid75c2pcdYe4TCzQ==
X-Google-Smtp-Source: AB8JxZrPhFd7+bn+neInmRKz5quPdKcsGjeK+Vriigxlcvu4r0cjXQarqwZEBd0VkZ1VnAQ7BbOm8Aw4m2j4/m5AuLY=
X-Received: by 2002:a24:56c3:: with SMTP id
	o186-v6mr13421550itb.127.1525434756465; 
	Fri, 04 May 2018 04:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Fri, 4 May 2018 04:52:16 -0700 (PDT)
In-Reply-To: <20180503081758.4661-2-anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
	<20180503081758.4661-2-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 May 2018 12:52:16 +0100
Message-ID: <CAJTo0LZqqcDiMQE6-GjaLmYJWQoj_g_ttkz1JR8X25K6uUcHxw@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] gst-plugins-base: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Fri, 04 May 2018 11:52:36 -0000
Content-Type: multipart/alternative; boundary="000000000000c99af0056b5ff405"

--000000000000c99af0056b5ff405
Content-Type: text/plain; charset="UTF-8"

 Couldn't find include 'GstVideo-1.0.gir' (search path:
'['/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot/usr/share/gir-1.0',
'/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0',
'/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot/usr/share/gir-1.0',
'/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot-native/usr/share/gir-1.0',
'/usr/share/gir-1.0',
'/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot-native/usr/share/gir-1.0']')
| Makefile:1506: recipe for target 'GstGL-1.0.gir' failed

Turn on gobject-introspection DISTRO_FEATURE if you haven't already.

That file is at ./gst-libs/gst/video/GstVideo-1.0.gir in the build tree, so
that search path is wrong...

Ross

On 3 May 2018 at 09:17, Anuj Mittal <anuj.mittal@intel.com> wrote:

> * For changes, please see: https://gstreamer.freedesktop.
> org/releases/1.14/
> * OpenGL integration library has moved to -plugins-base, add PACKAGECONFIG.
> * Remove one patch as that has been fixed in a different way upstream.
> * Merge inc/bb and refresh patches to get rid of fuzz warnings.
> * Remove x86 specific cached variables as they're not needed anymore.
> * Add jpeg to PACKAGECONFIG and enable it by default.
> * Port gstreamer-gl specific patches from -plugins-bad.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  ...on.m4-prefix-pkgconfig-paths-with-PKG_CON.patch |  12 +-
>  .../gstreamer/gstreamer1.0-plugins-base.inc        |  50 -------
>  ...-don-t-hardcode-libtool-name-when-running.patch |  71 +++++-----
>  ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  29 ++++
>  ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 151
> +++++++++------------
>  ...ssing-include-directories-when-calling-in.patch |  12 +-
>  ...3-ssaparse-enhance-SSA-text-lines-parsing.patch |  24 ++--
>  ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  12 +-
>  ...t-need_segment-after-sink-pad-received-GS.patch |  69 ----------
>  .../0009-glimagesink-Downrank-to-marginal.patch    |  32 +++++
>  .../get-caps-from-src-pad-when-query-caps.patch    |  12 +-
>  .../link-with-libvchostif.patch                    |  45 ++++++
>  ...make-gio_unix_2_0-dependency-configurable.patch |  12 +-
>  .../gstreamer/gstreamer1.0-plugins-base_1.12.4.bb  |  18 ---
>  .../gstreamer/gstreamer1.0-plugins-base_1.14.0.bb  |  70 ++++++++++
>  15 files changed, 314 insertions(+), 305 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_
> CFLAGS-to-CFLAGS.patch
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-subparse-set-need_segment-after-sink-
> pad-received-GS.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0009-glimagesink-Downrank-to-marginal.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/link-with-libvchostif.patch
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.12.4.bb
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.14.0.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/files/0001-
> introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-
> pkgconfig-paths-with-PKG_CON.patch
> index 2cab87f9ec..1b7f115083 100644
> --- a/meta/recipes-multimedia/gstreamer/files/0001-
> introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> +++ b/meta/recipes-multimedia/gstreamer/files/0001-
> introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> @@ -1,4 +1,4 @@
> -From 90916f96262fa7b27a0a99788c69f9fd6df11000 Mon Sep 17 00:00:00 2001
> +From 2b0436f9a07773fae8c74df902d7024e8bfc3512 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 24 Nov 2015 16:46:27 +0200
>  Subject: [PATCH] introspection.m4: prefix pkgconfig paths with
> @@ -10,12 +10,13 @@ is later supplied to g-ir-scanner.
>
>  Upstream-Status: Pending [review on oe-core list]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
> - common/m4/introspection.m4 | 12 ++++++------
> - 1 file changed, 6 insertions(+), 6 deletions(-)
> + common/m4/introspection.m4 | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/common/m4/introspection.m4 b/common/m4/introspection.m4
> -index 162be57..217a6ae 100644
> +index 162be57..933f979 100644
>  --- a/common/m4/introspection.m4
>  +++ b/common/m4/introspection.m4
>  @@ -54,14 +54,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
> @@ -37,6 +38,3 @@ index 162be57..217a6ae 100644
>          INTROSPECTION_INIT="extern void gst_init(gint*,gchar**);
> gst_init(NULL,NULL);"
>       fi
>       AC_SUBST(INTROSPECTION_SCANNER)
> ---
> -2.6.2
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> deleted file mode 100644
> index 08130c1da4..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -require gstreamer1.0-plugins.inc
> -
> -SRC_URI_append = "\
> -    file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
> \
> -    file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
> \
> -    file://0003-riff-add-missing-include-directories-when-calling-in.patch
> \
> -    file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
> \
> -"
> -
> -LICENSE = "GPLv2+ & LGPLv2+"
> -
> -DEPENDS += "iso-codes util-linux zlib"
> -
> -inherit gettext
> -
> -PACKAGES_DYNAMIC =+ "^libgst.*"
> -
> -PACKAGECONFIG ??= " \
> -    ${GSTREAMER_ORC} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
> -    gio-unix-2.0 ogg pango theora vorbis \
> -"
> -
> -X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
> -X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
> -X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
> -
> -PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
> -PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--
> disable-cdparanoia,cdparanoia"
> -PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--
> disable-gio_unix_2_0,glib-2.0"
> -PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
> -PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
> -PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
> -PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
> -PACKAGECONFIG[theora]       = "--enable-theora,--disable-
> theora,libtheora"
> -PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-
> libvisual,libvisual"
> -PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-
> vorbis,libvorbis"
> -PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${
> X11DISABLEOPTS},${X11DEPENDS}"
> -
> -EXTRA_OECONF += " \
> -    --enable-zlib \
> -"
> -
> -CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no
> ac_cv_header_xmmintrin_h=no"
> -
> -FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/
> 1.0/license-translations.dict"
> -
> -do_compile_prepend() {
> -        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-
> libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-
> libs/gst/rtp/.libs"
> -}
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-
> when-running.patch
> index 094bdac846..128c7f8cb6 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-
> when-running.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-
> when-running.patch
> @@ -1,16 +1,18 @@
> -From f1d9652351e7754c63003104eceb526af424c7e0 Mon Sep 17 00:00:00 2001
> +From 4d6ea58f96b9744af8d899ddca22c2695ac74b5b Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 20 Nov 2015 16:53:04 +0200
> -Subject: [PATCH 1/4] Makefile.am: don't hardcode libtool name when running
> +Date: Thu, 5 Apr 2018 10:15:08 +0800
> +Subject: [PATCH] Makefile.am: don't hardcode libtool name when running
>   introspection tools
>
>  Upstream-Status: Pending [review on oe-core maillist]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +
>  ---
>   gst-libs/gst/allocators/Makefile.am | 2 +-
>   gst-libs/gst/app/Makefile.am        | 2 +-
>   gst-libs/gst/audio/Makefile.am      | 2 +-
> - gst-libs/gst/fft/Makefile.am        | 2 +-
> + gst-libs/gst/gl/Makefile.am         | 2 +-
>   gst-libs/gst/pbutils/Makefile.am    | 2 +-
>   gst-libs/gst/riff/Makefile.am       | 2 +-
>   gst-libs/gst/rtp/Makefile.am        | 2 +-
> @@ -21,10 +23,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   11 files changed, 11 insertions(+), 11 deletions(-)
>
>  diff --git a/gst-libs/gst/allocators/Makefile.am
> b/gst-libs/gst/allocators/Makefile.am
> -index 9361bf9..bc7f53a 100644
> +index 1957d28..1ecc950 100644
>  --- a/gst-libs/gst/allocators/Makefile.am
>  +++ b/gst-libs/gst/allocators/Makefile.am
> -@@ -38,7 +38,7 @@ GstAllocators-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstallocators-@
> +@@ -42,7 +42,7 @@ GstAllocators-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstallocators-@
>                 --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>                 --library=libgstallocators-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
> @@ -34,10 +36,10 @@ index 9361bf9..bc7f53a 100644
>                 --pkg-export gstreamer-allocators-@GST_API_VERSION@ \
>                 --output $@ \
>  diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
> -index 6d6de8d..dcc2fe0 100644
> +index 52f6ad3..5bfd606 100644
>  --- a/gst-libs/gst/app/Makefile.am
>  +++ b/gst-libs/gst/app/Makefile.am
> -@@ -53,7 +53,7 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstapp-@GST_API_VERSIO
> +@@ -56,7 +56,7 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstapp-@GST_API_VERSIO
>                 --library=libgstapp-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> @@ -47,10 +49,10 @@ index 6d6de8d..dcc2fe0 100644
>                 --pkg gstreamer-base-@GST_API_VERSION@ \
>                 --pkg-export gstreamer-app-@GST_API_VERSION@ \
>  diff --git a/gst-libs/gst/audio/Makefile.am
> b/gst-libs/gst/audio/Makefile.am
> -index 275d222..2374196 100644
> +index 2922245..7fb65f2 100644
>  --- a/gst-libs/gst/audio/Makefile.am
>  +++ b/gst-libs/gst/audio/Makefile.am
> -@@ -116,7 +116,7 @@ GstAudio-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
> +@@ -184,7 +184,7 @@ GstAudio-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
>                 --include=GstTag-@GST_API_VERSION@ \
> @@ -59,24 +61,24 @@ index 275d222..2374196 100644
>                 --pkg gstreamer-@GST_API_VERSION@ \
>                 --pkg gstreamer-base-@GST_API_VERSION@ \
>                 --pkg-export gstreamer-audio-@GST_API_VERSION@ \
> -diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
> -index 09b3d68..f545354 100644
> ---- a/gst-libs/gst/fft/Makefile.am
> -+++ b/gst-libs/gst/fft/Makefile.am
> -@@ -65,7 +65,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstfft-@GST_API_VERSIO
> -               --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> -               --library=libgstfft-@GST_API_VERSION@.la \
> +diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
> +index a3bbc94..16f829f 100644
> +--- a/gst-libs/gst/gl/Makefile.am
> ++++ b/gst-libs/gst/gl/Makefile.am
> +@@ -192,7 +192,7 @@ GstGL-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
>                 --include=Gst-@GST_API_VERSION@ \
> +               --include=GstBase-@GST_API_VERSION@ \
> +               --include=GstVideo-@GST_API_VERSION@ \
>  -              --libtool="$(top_builddir)/libtool" \
>  +              --libtool="$(LIBTOOL)" \
>                 --pkg gstreamer-@GST_API_VERSION@ \
> -               --pkg-export gstreamer-fft-@GST_API_VERSION@ \
> -               --output $@ \
> +               --pkg gstreamer-base-@GST_API_VERSION@ \
> +               --pkg gstreamer-video-@GST_API_VERSION@ \
>  diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/
> Makefile.am
> -index 64d5eb0..91dc214 100644
> +index ae51993..35a6e44 100644
>  --- a/gst-libs/gst/pbutils/Makefile.am
>  +++ b/gst-libs/gst/pbutils/Makefile.am
> -@@ -99,7 +99,7 @@ GstPbutils-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
> +@@ -103,7 +103,7 @@ GstPbutils-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
>                 --include=GstTag-@GST_API_VERSION@ \
>                 --include=GstVideo-@GST_API_VERSION@ \
>                 --include=GstAudio-@GST_API_VERSION@ \
> @@ -86,10 +88,10 @@ index 64d5eb0..91dc214 100644
>                 --pkg gstreamer-tag-@GST_API_VERSION@ \
>                 --pkg gstreamer-video-@GST_API_VERSION@ \
>  diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.
> am
> -index 83d83cb..3bd8fc0 100644
> +index fb53f06..e66ef4f 100644
>  --- a/gst-libs/gst/riff/Makefile.am
>  +++ b/gst-libs/gst/riff/Makefile.am
> -@@ -47,7 +47,7 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
> +@@ -49,7 +49,7 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>   #             --include=GstAudio-@GST_API_VERSION@ \
>   #             --include=GstTag-@GST_API_VERSION@ \
>   #             --include=Gst-@GST_API_VERSION@ \
> @@ -99,10 +101,10 @@ index 83d83cb..3bd8fc0 100644
>   #             --pkg gstreamer-tag-@GST_API_VERSION@ \
>   #             --pkg gstreamer-audio-@GST_API_VERSION@ \
>  diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
> -index fdd01c1..f5445c1 100644
> +index a6f971d..77ebeeb 100644
>  --- a/gst-libs/gst/rtp/Makefile.am
>  +++ b/gst-libs/gst/rtp/Makefile.am
> -@@ -65,7 +65,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstrtp-@GST_API_VERSIO
> +@@ -69,7 +69,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstrtp-@GST_API_VERSIO
>                 --library=libgstrtp-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> @@ -112,10 +114,10 @@ index fdd01c1..f5445c1 100644
>                 --pkg gstreamer-base-@GST_API_VERSION@ \
>                 --pkg-export gstreamer-rtp-@GST_API_VERSION@ \
>  diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.
> am
> -index ede5706..9b0b258 100644
> +index ceb07f4..db9d0fd 100644
>  --- a/gst-libs/gst/rtsp/Makefile.am
>  +++ b/gst-libs/gst/rtsp/Makefile.am
> -@@ -72,7 +72,7 @@ GstRtsp-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
> +@@ -76,7 +76,7 @@ GstRtsp-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
>                 --include=Gio-2.0 \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstSdp-@GST_API_VERSION@ \
> @@ -125,10 +127,10 @@ index ede5706..9b0b258 100644
>                 --pkg gstreamer-@GST_API_VERSION@ \
>                 --pkg gstreamer-sdp-@GST_API_VERSION@ \
>  diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
> -index a90f30b..0e149b8 100644
> +index e197e9b..6e05cc7 100644
>  --- a/gst-libs/gst/sdp/Makefile.am
>  +++ b/gst-libs/gst/sdp/Makefile.am
> -@@ -32,7 +32,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstsdp-@GST_API_VERSIO
> +@@ -34,7 +34,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstsdp-@GST_API_VERSIO
>                 --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>                 --library=libgstsdp-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
> @@ -138,10 +140,10 @@ index a90f30b..0e149b8 100644
>                 --pkg-export gstreamer-sdp-@GST_API_VERSION@ \
>                 --output $@ \
>  diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
> -index c534a4d..cafafd3 100644
> +index 0247c33..c86515b 100644
>  --- a/gst-libs/gst/tag/Makefile.am
>  +++ b/gst-libs/gst/tag/Makefile.am
> -@@ -45,7 +45,7 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgsttag-@GST_API_VERSIO
> +@@ -66,7 +66,7 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgsttag-@GST_API_VERSIO
>                 --library=libgsttag-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> @@ -151,10 +153,10 @@ index c534a4d..cafafd3 100644
>                 --pkg gstreamer-base-@GST_API_VERSION@ \
>                 --pkg-export gstreamer-tag-@GST_API_VERSION@ \
>  diff --git a/gst-libs/gst/video/Makefile.am
> b/gst-libs/gst/video/Makefile.am
> -index 5d31fa1..ac64eb3 100644
> +index 9fc1ccf..0f8455f 100644
>  --- a/gst-libs/gst/video/Makefile.am
>  +++ b/gst-libs/gst/video/Makefile.am
> -@@ -116,7 +116,7 @@ GstVideo-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
> +@@ -124,7 +124,7 @@ GstVideo-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
>                 --library=libgstvideo-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> @@ -163,6 +165,3 @@ index 5d31fa1..ac64eb3 100644
>                 --pkg gstreamer-@GST_API_VERSION@ \
>                 --pkg gstreamer-base-@GST_API_VERSION@ \
>                 --pkg-export gstreamer-video-@GST_API_VERSION@ \
> ---
> -2.6.2
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_
> CFLAGS-to-CFLAGS.patch
> new file mode 100644
> index 0000000000..251dc172cb
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_
> CFLAGS-to-CFLAGS.patch
> @@ -0,0 +1,29 @@
> +From 61a672e79c8cb1aeeeda4c968997c577ac73a8f3 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 12 May 2017 16:47:12 +0300
> +Subject: [PATCH] gstreamer-gl.pc.in: don't append GL_CFLAGS to CFLAGS
> +
> +Dependencies' include directories should not be added in this way;
> +it causes problems when cross-compiling in sysroot environments.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +---
> + pkgconfig/gstreamer-gl.pc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pkgconfig/gstreamer-gl.pc.in b/pkgconfig/gstreamer-gl.pc.in
> +index dc672a9..8c290ba 100644
> +--- a/pkgconfig/gstreamer-gl.pc.in
> ++++ b/pkgconfig/gstreamer-gl.pc.in
> +@@ -13,4 +13,4 @@ Version: @VERSION@
> + Requires: gstreamer-video-@GST_API_VERSION@ gstreamer-base-@GST_API_
> VERSION@ gstreamer-@GST_API_VERSION@
> +
> + Libs: -L${libdir} -lgstgl-@GST_API_VERSION@
> +-Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include
> @GL_CFLAGS@
> ++Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-
> with-PKG_CONF.patch
> index 6616e2cf0d..dc15d93eb0 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-
> with-PKG_CONF.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-
> with-PKG_CONF.patch
> @@ -1,16 +1,17 @@
> -From 990b653c7b6de1937ec759019982d6c5f15770f7 Mon Sep 17 00:00:00 2001
> +From f523721e453febfb3f62f3ba1e9fefb31dcec471 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 26 Oct 2015 16:38:18 +0200
> -Subject: [PATCH 2/4] Makefile.am: prefix calls to pkg-config with
> +Date: Thu, 5 Apr 2018 10:26:25 +0800
> +Subject: [PATCH] Makefile.am: prefix calls to pkg-config with
>   PKG_CONFIG_SYSROOT_DIR
>
>  Upstream-Status: Pending [review on oe-core maillist]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +
>  ---
>   gst-libs/gst/allocators/Makefile.am |  4 ++--
>   gst-libs/gst/app/Makefile.am        |  4 ++--
>   gst-libs/gst/audio/Makefile.am      | 12 ++++++------
> - gst-libs/gst/fft/Makefile.am        |  4 ++--
>   gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
>   gst-libs/gst/riff/Makefile.am       |  8 ++++----
>   gst-libs/gst/rtp/Makefile.am        |  8 ++++----
> @@ -18,13 +19,13 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   gst-libs/gst/sdp/Makefile.am        |  4 ++--
>   gst-libs/gst/tag/Makefile.am        |  8 ++++----
>   gst-libs/gst/video/Makefile.am      |  8 ++++----
> - 11 files changed, 38 insertions(+), 38 deletions(-)
> + 10 files changed, 36 insertions(+), 36 deletions(-)
>
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/allocators/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
> -@@ -36,7 +36,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(I
> +diff --git a/gst-libs/gst/allocators/Makefile.am
> b/gst-libs/gst/allocators/Makefile.am
> +index 1ecc950..d6417ac 100644
> +--- a/gst-libs/gst/allocators/Makefile.am
> ++++ b/gst-libs/gst/allocators/Makefile.am
> +@@ -39,7 +39,7 @@ GstAllocators-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstallocators-@
>                 --c-include "gst/allocators/allocators.h" \
>                 -I$(top_srcdir)/gst-libs \
>                 -I$(top_builddir)/gst-libs \
> @@ -33,7 +34,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/allocators/Makefile.am
>                 --library=libgstallocators-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --libtool="$(LIBTOOL)" \
> -@@ -60,7 +60,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> +@@ -63,7 +63,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                 $(INTROSPECTION_COMPILER) \
>                 --includedir=$(srcdir) \
>                 --includedir=$(builddir) \
> @@ -42,11 +43,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/allocators/Makefile.am
>                 $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>
>   CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/app/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
> -@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPE
> +diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
> +index 5bfd606..6441674 100644
> +--- a/gst-libs/gst/app/Makefile.am
> ++++ b/gst-libs/gst/app/Makefile.am
> +@@ -51,8 +51,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstapp-@GST_API_VERSIO
>                 --c-include "gst/app/app.h" \
>                 -I$(top_srcdir)/gst-libs \
>                 -I$(top_builddir)/gst-libs \
> @@ -57,11 +58,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/app/Makefile.am
>                 --library=libgstapp-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/audio/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
> -@@ -167,12 +167,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROS
> +diff --git a/gst-libs/gst/audio/Makefile.am
> b/gst-libs/gst/audio/Makefile.am
> +index 7fb65f2..5379f79 100644
> +--- a/gst-libs/gst/audio/Makefile.am
> ++++ b/gst-libs/gst/audio/Makefile.am
> +@@ -174,12 +174,12 @@ GstAudio-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
>                 -I$(top_srcdir)/gst-libs \
>                 -I$(top_builddir)/gst-libs \
>                 --c-include "gst/audio/audio.h" \
> @@ -78,7 +79,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/audio/Makefile.am
>                 --library-path="$(top_builddir)/gst-libs/gst/tag/" \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> -@@ -201,8 +201,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> +@@ -208,8 +208,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                 --includedir=$(srcdir) \
>                 --includedir=$(builddir) \
>                 --includedir="$(top_builddir)/gst-libs/gst/tag/" \
> @@ -89,33 +90,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/audio/Makefile.am
>                 $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>
>   CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/fft/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
> -@@ -63,7 +63,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPE
> -               --c-include "gst/fft/fft.h" \
> -               -I$(top_srcdir)/gst-libs \
> -               -I$(top_builddir)/gst-libs \
> --              --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> -+              --add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_
> CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir
> gstreamer-@GST_API_VERSION@` \
> -               --library=libgstfft-@GST_API_VERSION@.la \
> -               --include=Gst-@GST_API_VERSION@ \
> -               --libtool="$(LIBTOOL)" \
> -@@ -87,7 +87,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> -               $(INTROSPECTION_COMPILER) \
> -               --includedir=$(srcdir) \
> -               --includedir=$(builddir) \
> --              --includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> -+              --includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> -               $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> -
> - CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/pbutils/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
> -@@ -85,14 +85,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTR
> +diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/
> Makefile.am
> +index 35a6e44..49d6894 100644
> +--- a/gst-libs/gst/pbutils/Makefile.am
> ++++ b/gst-libs/gst/pbutils/Makefile.am
> +@@ -88,14 +88,14 @@ GstPbutils-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
>                 --c-include "gst/pbutils/pbutils.h" \
>                 -I$(top_srcdir)/gst-libs \
>                 -I$(top_builddir)/gst-libs \
> @@ -134,7 +113,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/pbutils/Makefile.am
>                 --library-path="$(top_builddir)/gst-libs/gst/tag/" \
>                 --library-path="$(top_builddir)/gst-libs/gst/video/" \
>                 --library-path="$(top_builddir)/gst-libs/gst/audio/" \
> -@@ -125,8 +125,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> +@@ -128,8 +128,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                 $(INTROSPECTION_COMPILER) \
>                 --includedir=$(srcdir) \
>                 --includedir=$(builddir) \
> @@ -145,11 +124,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/pbutils/Makefile.am
>                 --includedir="$(top_builddir)/gst-libs/gst/tag/" \
>                 --includedir="$(top_builddir)/gst-libs/gst/video/" \
>                 --includedir="$(top_builddir)/gst-libs/gst/audio/" \
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/riff/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
> -@@ -42,8 +42,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS
> +diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.
> am
> +index e66ef4f..c8c588a 100644
> +--- a/gst-libs/gst/riff/Makefile.am
> ++++ b/gst-libs/gst/riff/Makefile.am
> +@@ -43,8 +43,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>   #             --c-include "gst/riff/riff.h" \
>   #             --add-include-path=$(builddir)/../tag \
>   #             --add-include-path=$(builddir)/../audio \
> @@ -160,7 +139,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/riff/Makefile.am
>   #             --library=libgstriff-@GST_API_VERSION@.la \
>   #             --include=GstAudio-@GST_API_VERSION@ \
>   #             --include=GstTag-@GST_API_VERSION@ \
> -@@ -74,8 +74,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS
> +@@ -75,8 +75,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>   #             --includedir=$(builddir) \
>   #             --includedir=$(builddir)/../tag \
>   #             --includedir=$(builddir)/../audio \
> @@ -171,11 +150,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/riff/Makefile.am
>   #             $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>   #
>   #CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/rtp/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
> -@@ -61,8 +61,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPE
> +diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
> +index 77ebeeb..9aee788 100644
> +--- a/gst-libs/gst/rtp/Makefile.am
> ++++ b/gst-libs/gst/rtp/Makefile.am
> +@@ -64,8 +64,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstrtp-@GST_API_VERSIO
>                 --c-include "gst/rtp/rtp.h" \
>                 -I$(top_builddir)/gst-libs \
>                 -I$(top_srcdir)/gst-libs \
> @@ -186,7 +165,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/rtp/Makefile.am
>                 --library=libgstrtp-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> -@@ -89,8 +89,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> +@@ -92,8 +92,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                 $(INTROSPECTION_COMPILER) \
>                 --includedir=$(srcdir) \
>                 --includedir=$(builddir) \
> @@ -197,11 +176,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/rtp/Makefile.am
>                 $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>
>   CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/rtsp/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
> -@@ -68,7 +68,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSP
> +diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.
> am
> +index db9d0fd..79027cb 100644
> +--- a/gst-libs/gst/rtsp/Makefile.am
> ++++ b/gst-libs/gst/rtsp/Makefile.am
> +@@ -71,7 +71,7 @@ GstRtsp-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
>                 -I$(top_builddir)/gst-libs \
>                 -I$(top_srcdir)/gst-libs \
>                 --add-include-path=$(builddir)/../sdp \
> @@ -210,7 +189,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/rtsp/Makefile.am
>                 --library=libgstrtsp-@GST_API_VERSION@.la \
>                 --include=Gio-2.0 \
>                 --include=Gst-@GST_API_VERSION@ \
> -@@ -98,7 +98,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> +@@ -101,7 +101,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                 --includedir=$(srcdir) \
>                 --includedir=$(builddir) \
>                 --includedir=$(builddir)/../sdp \
> @@ -219,11 +198,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/rtsp/Makefile.am
>                 $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>
>   CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/sdp/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
> -@@ -30,7 +30,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPE
> +diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
> +index 6e05cc7..c7cf514 100644
> +--- a/gst-libs/gst/sdp/Makefile.am
> ++++ b/gst-libs/gst/sdp/Makefile.am
> +@@ -31,7 +31,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgstsdp-@GST_API_VERSIO
>                 --warn-all \
>                 --c-include "gst/sdp/sdp.h" \
>                 -I$(top_srcdir)/gst-libs \
> @@ -232,7 +211,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/sdp/Makefile.am
>                 --library=libgstsdp-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --libtool="$(LIBTOOL)" \
> -@@ -54,7 +54,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> +@@ -55,7 +55,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                 $(INTROSPECTION_COMPILER) \
>                 --includedir=$(srcdir) \
>                 --includedir=$(builddir) \
> @@ -241,11 +220,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/sdp/Makefile.am
>                 $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>
>   CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/tag/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
> -@@ -59,8 +59,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPE
> +diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
> +index c86515b..363e6d2 100644
> +--- a/gst-libs/gst/tag/Makefile.am
> ++++ b/gst-libs/gst/tag/Makefile.am
> +@@ -61,8 +61,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER)
> libgsttag-@GST_API_VERSIO
>                 --c-include "gst/tag/tag.h" \
>                 -I$(top_srcdir)/gst-libs \
>                 -I$(top_builddir)/gst-libs \
> @@ -256,7 +235,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/tag/Makefile.am
>                 --library=libgsttag-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> -@@ -87,8 +87,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> +@@ -89,8 +89,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                 $(INTROSPECTION_COMPILER) \
>                 --includedir=$(srcdir) \
>                 --includedir=$(builddir) \
> @@ -267,11 +246,11 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/tag/Makefile.am
>                 $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>
>   CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
> -Index: gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
> -===================================================================
> ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/video/Makefile.am
> -+++ gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
> -@@ -116,8 +116,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROS
> +diff --git a/gst-libs/gst/video/Makefile.am
> b/gst-libs/gst/video/Makefile.am
> +index 0f8455f..8c9955c 100644
> +--- a/gst-libs/gst/video/Makefile.am
> ++++ b/gst-libs/gst/video/Makefile.am
> +@@ -119,8 +119,8 @@ GstVideo-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
>                 --c-include "gst/video/video.h" \
>                 -I$(top_srcdir)/gst-libs \
>                 -I$(top_builddir)/gst-libs \
> @@ -282,7 +261,7 @@ Index: gst-plugins-base-1.12.3/gst-
> libs/gst/video/Makefile.am
>                 --library=libgstvideo-@GST_API_VERSION@.la \
>                 --include=Gst-@GST_API_VERSION@ \
>                 --include=GstBase-@GST_API_VERSION@ \
> -@@ -144,8 +144,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> +@@ -147,8 +147,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                 $(INTROSPECTION_COMPILER) \
>                 --includedir=$(srcdir) \
>                 --includedir=$(builddir) \
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-riff-add-missing-include-directories-
> when-calling-in.patch
> index 9b66f7f49d..98ffdb1c10 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-riff-add-missing-include-directories-
> when-calling-in.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-riff-add-missing-include-directories-
> when-calling-in.patch
> @@ -1,20 +1,21 @@
> -From 3c2c2d5dd08aa30ed0e8acd8566ec99412bb8209 Mon Sep 17 00:00:00 2001
> +From b9765efb1696e3e2e79f2955f759be199fe34882 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 26 Oct 2015 17:29:37 +0200
> -Subject: [PATCH 3/4] riff: add missing include directories when calling
> +Subject: [PATCH] riff: add missing include directories when calling
>   introspection scanner
>
>  Upstream-Status: Pending [review on oe-core maillist]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   gst-libs/gst/riff/Makefile.am | 2 ++
>   1 file changed, 2 insertions(+)
>
>  diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.
> am
> -index 0a115cc..5057a58 100644
> +index c8c588a..c096453 100644
>  --- a/gst-libs/gst/riff/Makefile.am
>  +++ b/gst-libs/gst/riff/Makefile.am
> -@@ -39,6 +39,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
> +@@ -41,6 +41,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>   #             --strip-prefix=Gst \
>   #             --warn-all \
>   #             --c-include "gst/riff/riff.h" \
> @@ -23,6 +24,3 @@ index 0a115cc..5057a58 100644
>   #             --add-include-path=$(builddir)/../tag \
>   #             --add-include-path=$(builddir)/../audio \
>   #             --add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_
> CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir
> gstreamer-@GST_API_VERSION@` \
> ---
> -2.6.2
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> index 9fbebd5700..9e95524057 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> @@ -1,7 +1,7 @@
> -From be6163cfa3a255493f9d75bad9541cbfe1723fee Mon Sep 17 00:00:00 2001
> +From 918c96b24d10f61b7455b4cef3bab490849d0d77 Mon Sep 17 00:00:00 2001
>  From: Mingke Wang <mingke.wang@freescale.com>
>  Date: Thu, 19 Mar 2015 14:17:10 +0800
> -Subject: [PATCH 3/4] ssaparse: enhance SSA text lines parsing.
> +Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
>
>  some parser will pass in the original ssa text line which starts with
> "Dialog:"
>  and there's are maybe multiple Dialog lines in one input buffer.
> @@ -10,13 +10,18 @@ Upstream-Status: Submitted [
> https://bugzilla.gnome.org/show_bug.cgi?id=747496]
>
>  Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
>
> +---
> + gst/subparse/gstssaparse.c | 150 ++++++++++++++++++++++++++++++
> ++++++++++-----
> + 1 file changed, 134 insertions(+), 16 deletions(-)
> + mode change 100644 => 100755 gst/subparse/gstssaparse.c
> +
>  diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
>  old mode 100644
>  new mode 100755
> -index 06ecef9..0ab5dce
> +index c849c08..4b9636c
>  --- a/gst/subparse/gstssaparse.c
>  +++ b/gst/subparse/gstssaparse.c
> -@@ -260,6 +260,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse *
> parse, gchar * txt)
> +@@ -262,6 +262,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse *
> parse, gchar * txt)
>    * gst_ssa_parse_push_line:
>    * @parse: caller element
>    * @txt: text to push
> @@ -24,7 +29,7 @@ index 06ecef9..0ab5dce
>    * @start: timestamp for the buffer
>    * @duration: duration for the buffer
>    *
> -@@ -269,27 +270,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse
> * parse, gchar * txt)
> +@@ -271,27 +272,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse
> * parse, gchar * txt)
>    * Returns: result of the push of the created buffer
>    */
>   static GstFlowReturn
> @@ -169,7 +174,7 @@ index 06ecef9..0ab5dce
>     GST_LOG_OBJECT (parse, "Text : %s", t);
>
>     if (gst_ssa_parse_remove_override_codes (parse, t)) {
> -@@ -307,13 +414,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar
> * txt,
> +@@ -309,13 +416,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar
> * txt,
>     gst_buffer_fill (buf, 0, escaped, len + 1);
>     gst_buffer_set_size (buf, len);
>     g_free (escaped);
> @@ -196,7 +201,7 @@ index 06ecef9..0ab5dce
>
>     ret = gst_pad_push (parse->srcpad, buf);
>
> -@@ -333,6 +449,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject *
> parent, GstBuffer * buf)
> +@@ -335,6 +451,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject *
> parent, GstBuffer * buf)
>     GstClockTime ts;
>     gchar *txt;
>     GstMapInfo map;
> @@ -204,7 +209,7 @@ index 06ecef9..0ab5dce
>
>     if (G_UNLIKELY (!parse->framed))
>       goto not_framed;
> -@@ -350,13 +467,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject *
> parent, GstBuffer * buf)
> +@@ -352,13 +469,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject *
> parent, GstBuffer * buf)
>     /* make double-sure it's 0-terminated and all */
>     gst_buffer_map (buf, &map, GST_MAP_READ);
>     txt = g_strndup ((gchar *) map.data, map.size);
> @@ -220,6 +225,3 @@ index 06ecef9..0ab5dce
>
>     if (ret != GST_FLOW_OK && GST_CLOCK_TIME_IS_VALID (ts)) {
>       GstSegment segment;
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-rtsp-drop-incorrect-reference-to-
> gstreamer-sdp-in-Ma.patch
> index 4adf605460..aaeb611fec 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-rtsp-drop-incorrect-reference-to-
> gstreamer-sdp-in-Ma.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-rtsp-drop-incorrect-reference-to-
> gstreamer-sdp-in-Ma.patch
> @@ -1,20 +1,21 @@
> -From 4330915d88dc4dd46eb4c28d756482b767c2747f Mon Sep 17 00:00:00 2001
> +From 53b5868491cf99ee797192395dbfeb69df23edd2 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 26 Oct 2015 17:30:14 +0200
> -Subject: [PATCH 4/4] rtsp: drop incorrect reference to gstreamer-sdp in
> +Subject: [PATCH] rtsp: drop incorrect reference to gstreamer-sdp in
>   Makefile.am
>
>  Upstream-Status: Pending [review on oe-core maillist]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   gst-libs/gst/rtsp/Makefile.am | 1 -
>   1 file changed, 1 deletion(-)
>
>  diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.
> am
> -index 4f6d9f8..0afa370 100644
> +index 79027cb..2987e23 100644
>  --- a/gst-libs/gst/rtsp/Makefile.am
>  +++ b/gst-libs/gst/rtsp/Makefile.am
> -@@ -75,7 +75,6 @@ GstRtsp-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
> +@@ -79,7 +79,6 @@ GstRtsp-@GST_API_VERSION@.gir:
> $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
>                 --libtool="$(LIBTOOL)" \
>                 --pkg gio-2.0 \
>                 --pkg gstreamer-@GST_API_VERSION@ \
> @@ -22,6 +23,3 @@ index 4f6d9f8..0afa370 100644
>                 --pkg-export gstreamer-rtsp-@GST_API_VERSION@ \
>                 --add-init-section="$(INTROSPECTION_INIT)" \
>                 --output $@ \
> ---
> -2.6.2
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-subparse-set-need_segment-after-sink-
> pad-received-GS.patch
> deleted file mode 100644
> index b924e38824..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-subparse-set-need_segment-after-sink-
> pad-received-GS.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From ed09c8fd2c9c2b5384b72cc70af3728be6694e64 Mon Sep 17 00:00:00 2001
> -From: Mingke Wang <mingke.wang@freescale.com>
> -Date: Thu, 19 Mar 2015 14:20:26 +0800
> -Subject: [PATCH 4/4] subparse: set need_segment after sink pad received
> - GST_EVENT_SEGMENT
> -
> -subparse works in push mode, chain funciton will be called once
> -up stream element finished the seeking and flushing.
> -if set need_segment flag in src pad event handler, the segment
> -event will be pushed earlier, result in the subtitle text will
> -be send out to down stream from the beginning.
> -
> -Upstream-Status: Submitted [https://bugzilla.gnome.org/
> show_bug.cgi?id=747498]
> -
> -Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
> -
> -diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c
> -old mode 100644
> -new mode 100755
> -index b565e93..7741ccc
> ---- a/gst/subparse/gstsubparse.c
> -+++ b/gst/subparse/gstsubparse.c
> -@@ -266,22 +266,20 @@ gst_sub_parse_src_event (GstPad * pad, GstObject *
> parent, GstEvent * event)
> -         goto beach;
> -       }
> -
> -+      /* Apply the seek to our segment */
> -+      gst_segment_do_seek (&self->segment, rate, format, flags,
> -+          start_type, start, stop_type, stop, &update);
> -+
> -+      GST_DEBUG_OBJECT (self, "segment after seek: %" GST_SEGMENT_FORMAT,
> -+          &self->segment);
> -+
> -       /* Convert that seek to a seeking in bytes at position 0,
> -          FIXME: could use an index */
> -       ret = gst_pad_push_event (self->sinkpad,
> -           gst_event_new_seek (rate, GST_FORMAT_BYTES, flags,
> -               GST_SEEK_TYPE_SET, 0, GST_SEEK_TYPE_NONE, 0));
> -
> --      if (ret) {
> --        /* Apply the seek to our segment */
> --        gst_segment_do_seek (&self->segment, rate, format, flags,
> --            start_type, start, stop_type, stop, &update);
> --
> --        GST_DEBUG_OBJECT (self, "segment after seek: %"
> GST_SEGMENT_FORMAT,
> --            &self->segment);
> --
> --        self->need_segment = TRUE;
> --      } else {
> -+      if (!ret) {
> -         GST_WARNING_OBJECT (self, "seek to 0 bytes failed");
> -       }
> -
> -@@ -1641,8 +1639,10 @@ gst_sub_parse_sink_event (GstPad * pad, GstObject
> * parent, GstEvent * event)
> -       gst_event_parse_segment (event, &s);
> -       if (s->format == GST_FORMAT_TIME)
> -         gst_event_copy_segment (event, &self->segment);
> --      GST_DEBUG_OBJECT (self, "newsegment (%s)",
> --          gst_format_get_name (self->segment.format));
> -+      GST_DEBUG_OBJECT (self, "newsegment (%s) %" GST_SEGMENT_FORMAT,
> -+          gst_format_get_name (self->segment.format), &self->segment);
> -+
> -+      self->need_segment = TRUE;
> -
> -       /* if not time format, we'll either start with a 0 timestamp
> anyway or
> -        * it's following a seek in which case we'll have saved the
> requested
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0009-glimagesink-Downrank-to-marginal.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0009-glimagesink-Downrank-to-marginal.patch
> new file mode 100644
> index 0000000000..c81fb0f6aa
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0009-glimagesink-Downrank-to-marginal.patch
> @@ -0,0 +1,32 @@
> +From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 24 Sep 2015 19:47:32 +0300
> +Subject: [PATCH] glimagesink: Downrank to marginal
> +
> +On desktop, where there is good OpenGL, xvimagesink will come up first,
> +on other platforms, OpenGL can't be trusted because it's either software
> (like
> +in a VM) or broken (like on embedded)., so let ximagesink come above.
> +
> +Upstream-Status: Submitted [https://bugzilla.gnome.org/
> show_bug.cgi?id=751684]
> +
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + ext/gl/gstopengl.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
> +index a4b2540..0ccaacd 100644
> +--- a/ext/gl/gstopengl.c
> ++++ b/ext/gl/gstopengl.c
> +@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugin)
> + #endif
> +
> +   if (!gst_element_register (plugin, "glimagesink",
> +-          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
> ++          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
> +     return FALSE;
> +   }
> +
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/get-caps-from-src-pad-when-query-caps.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/get-caps-from-src-pad-when-query-caps.patch
> index c8e6287a55..a4727e23ea 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/get-caps-from-src-pad-when-query-caps.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/get-caps-from-src-pad-when-query-caps.patch
> @@ -1,4 +1,4 @@
> -From af0dac26f62aaceb4bf266720911953793e0fc5d Mon Sep 17 00:00:00 2001
> +From 41de2ec64ab06bb58c82c1659adaa3811bc5bcf8 Mon Sep 17 00:00:00 2001
>  From: zhouming <b42586@freescale.com>
>  Date: Wed, 14 May 2014 10:16:20 +0800
>  Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
> @@ -8,18 +8,19 @@ https://bugzilla.gnome.org/show_bug.cgi?id=728312
>  Upstream-Status: Pending
>
>  Signed-off-by: zhouming <b42586@freescale.com>
> +
>  ---
> - gst-libs/gst/tag/gsttagdemux.c |   13 +++++++++++++
> + gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   mode change 100644 => 100755 gst-libs/gst/tag/gsttagdemux.c
>
>  diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/
> gsttagdemux.c
>  old mode 100644
>  new mode 100755
> -index 9b6c478..ae2294a
> +index 8a127c8..71c5d78
>  --- a/gst-libs/gst/tag/gsttagdemux.c
>  +++ b/gst-libs/gst/tag/gsttagdemux.c
> -@@ -1769,6 +1769,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject *
> parent, GstQuery * query)
> +@@ -1759,6 +1759,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject *
> parent, GstQuery * query)
>         }
>         break;
>       }
> @@ -39,6 +40,3 @@ index 9b6c478..ae2294a
>       default:
>         res = gst_pad_query_default (pad, parent, query);
>         break;
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/link-with-libvchostif.patch b/meta/recipes-multimedia/
> gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
> new file mode 100644
> index 0000000000..d5a7f6bdc2
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/link-with-libvchostif.patch
> @@ -0,0 +1,45 @@
> +From 9866f51e5e0913f1e453eb574618bf7432f38cb6 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 11 Apr 2018 10:46:33 +0800
> +Subject: [PATCH] Add -lvchostif to link when using -lEGL on rpi
> +
> +This is required because libEGL from userland uses sybols
> +from this library.
> +
> +lib/libEGL.so.1.0.0
>
>
>                 121: 00000000     0 FUNC    GLOBAL DEFAULT  UND
> vc_dispmanx_element_add
> +  1552: 00000000     0 FUNC    GLOBAL DEFAULT  UND vc_dispmanx_element_add
> +
> +These symbols are provided by libvchostif as seen below
> +
> +lib/libvchostif.so
> +   252: 0000b161   192 FUNC    GLOBAL DEFAULT    9 vc_dispmanx_element_add
> +   809: 0000b161   192 FUNC    GLOBAL DEFAULT    9 vc_dispmanx_element_add
> +
> +With this explicit link, plugins fail during runtime
> +
> +(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin
> '/usr/lib/gstreamer-1.0/libgstomx.so': Error relocating
> /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
> +(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin
> '/usr/lib/gstreamer-1.0/libgstopengl.so': Error relocating
> /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + m4/gst-gl.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
> +index 1e97240..ab7774c 100644
> +--- a/m4/gst-gl.m4
> ++++ b/m4/gst-gl.m4
> +@@ -231,7 +231,7 @@ case $host in
> +                             HAVE_EGL=yes
> +                             HAVE_GLES2=yes
> +                             HAVE_EGL_RPI=yes
> +-                            EGL_LIBS="-lbcm_host -lvcos -lvchiq_arm"
> ++                            EGL_LIBS="-lbcm_host -lvchostif -lvcos
> -lvchiq_arm"
> +                             EGL_CFLAGS=""
> +                             AC_DEFINE(USE_EGL_RPI, [1], [Use RPi
> platform])
> +                           ])
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/make-gio_unix_2_0-dependency-configurable.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/make-gio_unix_2_0-dependency-configurable.patch
> index 413eff0695..23950b67f2 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/make-gio_unix_2_0-dependency-configurable.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/make-gio_unix_2_0-dependency-configurable.patch
> @@ -1,4 +1,4 @@
> -From 10d2a977ee1d469f0bf9059bb2d0b55fd2eecbac Mon Sep 17 00:00:00 2001
> +From 7ffa6e3d00e1d8a060f3f4c2bb9a72691af05d79 Mon Sep 17 00:00:00 2001
>  From: Andre McCurdy <armccurdy@gmail.com>
>  Date: Wed, 20 Jan 2016 13:00:00 -0800
>  Subject: [PATCH] make gio_unix_2_0 dependency configurable
> @@ -17,16 +17,17 @@ instead of AG_GST_CHECK_FEATURE.
>  Upstream-Status: Pending
>
>  Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +
>  ---
>   configure.ac | 7 +++++++
>   1 file changed, 7 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index 9c52aeb..26cacd6 100644
> +index 12807bc..35a0bf3 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -752,9 +752,16 @@ AC_SUBST(FT2_CFLAGS)
> - fi dnl of EXT plugins
> +@@ -806,9 +806,16 @@ AM_CONDITIONAL(HAVE_PNG, test "x$HAVE_PNG" = "xyes")
> + AM_CONDITIONAL(HAVE_JPEG, test "x$HAVE_JPEG" = "xyes")
>
>   dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***
>  +AC_ARG_ENABLE([gio_unix_2_0],
> @@ -42,6 +43,3 @@ index 9c52aeb..26cacd6 100644
>   AM_CONDITIONAL(USE_GIO_UNIX_2_0, test "x$HAVE_GIO_UNIX_2_0" = "xyes")
>
>   dnl *** finalize CFLAGS, LDFLAGS, LIBS
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.12.4.bb
> deleted file mode 100644
> index dd895bbcb1..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.12.4.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require gstreamer1.0-plugins-base.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
> -                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d
> \
> -                    file://common/coverage/coverage-report.pl
> ;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
> -
> -SRC_URI = " \
> -    http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-
> plugins-base-${PV}.tar.xz \
> -    file://get-caps-from-src-pad-when-query-caps.patch \
> -    file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
> -    file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
> \
> -    file://make-gio_unix_2_0-dependency-configurable.patch \
> -    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> \
> -"
> -SRC_URI[md5sum] = "b35b04071f69b8ab69a7f3a497ff0131"
> -SRC_URI[sha256sum] = "4c306b03df0212f1b8903784e29bb3
> 493319ba19ebebf13b0c56a17870292282"
> -
> -S = "${WORKDIR}/gst-plugins-base-${PV}"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.14.0.bb
> new file mode 100644
> index 0000000000..370cd0368c
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.14.0.bb
> @@ -0,0 +1,70 @@
> +require gstreamer1.0-plugins.inc
> +
> +LICENSE = "GPLv2+ & LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
> +                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d
> \
> +                    file://common/coverage/coverage-report.pl
> ;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
> +
> +SRC_URI = " \
> +            http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-
> plugins-base-${PV}.tar.xz \
> +            file://get-caps-from-src-pad-when-query-caps.patch \
> +            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
> +            file://make-gio_unix_2_0-dependency-configurable.patch \
> +            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> \
> +            file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
> \
> +            file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
> \
> +            file://0003-riff-add-missing-include-directories-when-calling-in.patch
> \
> +            file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
> \
> +            file://0009-glimagesink-Downrank-to-marginal.patch \
> +            file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
> \
> +            file://link-with-libvchostif.patch \
> +            "
> +SRC_URI[md5sum] = "370271327dd23110421a9c2927ac989a"
> +SRC_URI[sha256sum] = "7e904660ff56e02b036cf7fdfb77a5
> 0a540828ca9d2614d69ba931772e5b6940"
> +
> +S = "${WORKDIR}/gst-plugins-base-${PV}"
> +
> +DEPENDS += "iso-codes util-linux"
> +
> +inherit gettext
> +
> +PACKAGES_DYNAMIC =+ "^libgst.*"
> +
> +PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'gles2 egl', '', d)}"
> +PACKAGECONFIG ??= " \
> +    ${GSTREAMER_ORC} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
> +    gio-unix-2.0 ogg pango theora vorbis zlib jpeg \
> +    ${PACKAGECONFIG_GL} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl',
> '', d)} \
> +"
> +
> +X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
> +X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
> +X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
> +
> +PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--
> disable-cdparanoia,cdparanoia"
> +PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--
> disable-gio_unix_2_0,glib-2.0"
> +PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
> +PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
> +PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
> +PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
> +PACKAGECONFIG[theora]       = "--enable-theora,--disable-
> theora,libtheora"
> +PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-
> libvisual,libvisual"
> +PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-
> vorbis,libvorbis"
> +PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${
> X11DISABLEOPTS},${X11DEPENDS}"
> +PACKAGECONFIG[zlib]         = "--enable-zlib,--disable-zlib,zlib"
> +PACKAGECONFIG[opengl]       = "--enable-opengl,--disable-opengl,virtual/libgl
> libglu"
> +PACKAGECONFIG[gles2]        = "--enable-gles2,--disable-
> gles2,virtual/libgles2"
> +PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,virtual/egl"
> +PACKAGECONFIG[wayland]      = "--enable-wayland,--disable-wayland,wayland-native
> wayland wayland-protocols libdrm"
> +PACKAGECONFIG[jpeg]         = ",,jpeg"
> +
> +FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/
> 1.0/license-translations.dict"
> +
> +do_compile_prepend() {
> +        export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-
> libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-
> libs/gst/rtp/.libs"
> +}
> +
> +FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/
> include/gst/gl/gstglconfig.h"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c99af0056b5ff405
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>=C2=A0Couldn&#39;t find include &#39;GstVideo-1.0.gir=
&#39; (search path: &#39;[&#39;/data/poky-tmp/master/work/corei7-64-poky-li=
nux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot/usr/share/gir-1.0&#3=
9;, &#39;/usr/share/gir-1.0&#39;, &#39;/usr/share/gir-1.0&#39;, &#39;/usr/s=
hare/gir-1.0&#39;, &#39;/data/poky-tmp/master/work/corei7-64-poky-linux/gst=
reamer1.0-plugins-base/1.14.0-r0/recipe-sysroot/usr/share/gir-1.0&#39;, &#3=
9;/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base=
/1.14.0-r0/recipe-sysroot-native/usr/share/gir-1.0&#39;, &#39;/usr/share/gi=
r-1.0&#39;, &#39;/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1=
.0-plugins-base/1.14.0-r0/recipe-sysroot-native/usr/share/gir-1.0&#39;]&#39=
;)</div><div>| Makefile:1506: recipe for target &#39;GstGL-1.0.gir&#39; fai=
led</div><div><br></div><div>Turn on gobject-introspection DISTRO_FEATURE i=
f you haven&#39;t already.</div><div><br></div><div>That file is at=C2=A0./=
gst-libs/gst/video/GstVideo-1.0.gir in the build tree, so that search path =
is wrong...</div><div><br></div><div>Ross</div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 3 May 2018 at 09:17, Anuj Mittal <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blan=
k">anuj.mittal@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">* For changes, please see: <a href=3D"https://gstreamer.freedesktop.o=
rg/releases/1.14/" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.f=
reedesktop.<wbr>org/releases/1.14/</a><br>
* OpenGL integration library has moved to -plugins-base, add PACKAGECONFIG.=
<br>
* Remove one patch as that has been fixed in a different way upstream.<br>
* Merge inc/bb and refresh patches to get rid of fuzz warnings.<br>
* Remove x86 specific cached variables as they&#39;re not needed anymore.<b=
r>
* Add jpeg to PACKAGECONFIG and enable it by default.<br>
* Port gstreamer-gl specific patches from -plugins-bad.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">anu=
j.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0...on.m4-prefix-pkgconfig-<wbr>paths-with-PKG_CON.patch |=C2=A0 12 +-=
<br>
=C2=A0.../gstreamer/gstreamer1.0-<wbr>plugins-base.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 50 -------<br>
=C2=A0...-don-t-hardcode-libtool-<wbr>name-when-running.patch |=C2=A0 71 ++=
+++-----<br>
=C2=A0...gl.pc.in-don-t-append-GL_<wbr>CFLAGS-to-CFLAGS.patch |=C2=A0 29 ++=
++<br>
=C2=A0...-prefix-calls-to-pkg-<wbr>config-with-PKG_CONF.patch | 151 +++++++=
++------------<br>
=C2=A0...ssing-include-directories-<wbr>when-calling-in.patch |=C2=A0 12 +-=
<br>
=C2=A0...3-ssaparse-enhance-SSA-<wbr>text-lines-parsing.patch |=C2=A0 24 ++=
--<br>
=C2=A0...ncorrect-reference-to-<wbr>gstreamer-sdp-in-Ma.patch |=C2=A0 12 +-=
<br>
=C2=A0...t-need_segment-after-sink-<wbr>pad-received-GS.patch |=C2=A0 69 --=
--------<br>
=C2=A0.../0009-glimagesink-Downrank-<wbr>to-marginal.patch=C2=A0 =C2=A0 |=
=C2=A0 32 +++++<br>
=C2=A0.../get-caps-from-src-pad-<wbr>when-query-caps.patch=C2=A0 =C2=A0 |=
=C2=A0 12 +-<br>
=C2=A0.../link-with-libvchostif.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 45 ++++++<br>
=C2=A0...make-gio_unix_2_0-<wbr>dependency-configurable.patch |=C2=A0 12 +-=
<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-base_1.12.4.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>plugins-base_1.12.4.=
bb</a>=C2=A0 |=C2=A0 18 ---<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-base_1.14.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<wbr>plugins-base_1.14.0.=
bb</a>=C2=A0 |=C2=A0 70 ++++++++++<br>
=C2=A015 files changed, 314 insertions(+), 305 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.=
0-<wbr>plugins-base.inc<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.=
0-<wbr>plugins-base/0001-gstreamer-<wbr>gl.pc.in-don-t-append-GL_<wbr>CFLAG=
S-to-CFLAGS.patch<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.=
0-<wbr>plugins-base/0004-subparse-<wbr>set-need_segment-after-sink-<wbr>pad=
-received-GS.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.=
0-<wbr>plugins-base/0009-glimagesink-<wbr>Downrank-to-marginal.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.=
0-<wbr>plugins-base/link-with-<wbr>libvchostif.patch<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"=
http://gstreamer1.0-plugins-base_1.12.4.bb" rel=3D"noreferrer" target=3D"_b=
lank">gstreamer1.0-<wbr>plugins-base_1.12.4.bb</a><br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"=
http://gstreamer1.0-plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">gstreamer1.0-<wbr>plugins-base_1.14.0.bb</a><br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/files/0001-<wbr>introsp=
ection.m4-prefix-<wbr>pkgconfig-paths-with-PKG_CON.<wbr>patch b/meta/recipe=
s-multimedia/<wbr>gstreamer/files/0001-<wbr>introspection.m4-prefix-<wbr>pk=
gconfig-paths-with-PKG_CON.<wbr>patch<br>
index 2cab87f9ec..1b7f115083 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/files/0001-<wbr>introspection.=
m4-prefix-<wbr>pkgconfig-paths-with-PKG_CON.<wbr>patch<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/files/0001-<wbr>introspection.=
m4-prefix-<wbr>pkgconfig-paths-with-PKG_CON.<wbr>patch<br>
@@ -1,4 +1,4 @@<br>
-From 90916f96262fa7b27a0a99788c69f9<wbr>fd6df11000 Mon Sep 17 00:00:00 200=
1<br>
+From 2b0436f9a07773fae8c74df902d702<wbr>4e8bfc3512 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 24 Nov 2015 16:46:27 +0200<br>
=C2=A0Subject: [PATCH] introspection.m4: prefix pkgconfig paths with<br>
@@ -10,12 +10,13 @@ is later supplied to g-ir-scanner.<br>
<br>
=C2=A0Upstream-Status: Pending [review on oe-core list]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
- common/m4/introspection.m4 | 12 ++++++------<br>
- 1 file changed, 6 insertions(+), 6 deletions(-)<br>
+ common/m4/introspection.m4 | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/common/m4/introspection.m4 b/common/m4/introspection.m4<=
br>
-index 162be57..217a6ae 100644<br>
+index 162be57..933f979 100644<br>
=C2=A0--- a/common/m4/introspection.m4<br>
=C2=A0+++ b/common/m4/introspection.m4<br>
=C2=A0@@ -54,14 +54,14 @@ m4_define([_GOBJECT_<wbr>INTROSPECTION_CHECK_INTE=
RNAL],<br>
@@ -37,6 +38,3 @@ index 162be57..217a6ae 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_INIT=3D&quot;extern void gs=
t_init(gint*,gchar**); gst_init(NULL,NULL);&quot;<br>
=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_<wbr>SCANNER)<br>
--- <br>
-2.6.2<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base.inc b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plug=
ins-base.inc<br>
deleted file mode 100644<br>
index 08130c1da4..0000000000<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
.inc<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-require gstreamer1.0-plugins.inc<br>
-<br>
-SRC_URI_append =3D &quot;\<br>
-=C2=A0 =C2=A0 file://0001-Makefile.am-don-t-<wbr>hardcode-libtool-name-whe=
n-<wbr>running.patch \<br>
-=C2=A0 =C2=A0 file://0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr=
>with-PKG_CONF.patch \<br>
-=C2=A0 =C2=A0 file://0003-riff-add-missing-<wbr>include-directories-when-<=
wbr>calling-in.patch \<br>
-=C2=A0 =C2=A0 file://0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstre=
amer-sdp-in-Ma.patch \<br>
-&quot;<br>
-<br>
-LICENSE =3D &quot;GPLv2+ &amp; LGPLv2+&quot;<br>
-<br>
-DEPENDS +=3D &quot;iso-codes util-linux zlib&quot;<br>
-<br>
-inherit gettext<br>
-<br>
-PACKAGES_DYNAMIC =3D+ &quot;^libgst.*&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot; \<br>
-=C2=A0 =C2=A0 ${GSTREAMER_ORC} \<br>
-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;alsa=
 x11&#39;, d)} \<br>
-=C2=A0 =C2=A0 gio-unix-2.0 ogg pango theora vorbis \<br>
-&quot;<br>
-<br>
-X11DEPENDS =3D &quot;virtual/libx11 libsm libxrender libxv&quot;<br>
-X11ENABLEOPTS =3D &quot;--enable-x --enable-xvideo --enable-xshm&quot;<br>
-X11DISABLEOPTS =3D &quot;--disable-x --disable-xvideo --disable-xshm&quot;=
<br>
-<br>
-PACKAGECONFIG[alsa]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-al=
sa,--disable-alsa,<wbr>alsa-lib&quot;<br>
-PACKAGECONFIG[cdparanoia]=C2=A0 =C2=A0=3D &quot;--enable-cdparanoia,--<wbr=
>disable-cdparanoia,cdparanoia&quot;<br>
-PACKAGECONFIG[gio-unix-2.0] =3D &quot;--enable-gio_unix_2_0,--<wbr>disable=
-gio_unix_2_0,glib-2.0&quot;<br>
-PACKAGECONFIG[ivorbis]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-ivorbis,--di=
sable-<wbr>ivorbis,tremor&quot;<br>
-PACKAGECONFIG[ogg]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-og=
g,--disable-ogg,<wbr>libogg&quot;<br>
-PACKAGECONFIG[opus]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-op=
us,--disable-opus,<wbr>libopus&quot;<br>
-PACKAGECONFIG[pango]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-pango,-=
-disable-<wbr>pango,pango&quot;<br>
-PACKAGECONFIG[theora]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-theora,=
--disable-<wbr>theora,libtheora&quot;<br>
-PACKAGECONFIG[visual]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-libvisu=
al,--disable-<wbr>libvisual,libvisual&quot;<br>
-PACKAGECONFIG[vorbis]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-vorbis,=
--disable-<wbr>vorbis,libvorbis&quot;<br>
-PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${X11ENABLE=
OPTS},${<wbr>X11DISABLEOPTS},${X11DEPENDS}&quot;<br>
-<br>
-EXTRA_OECONF +=3D &quot; \<br>
-=C2=A0 =C2=A0 --enable-zlib \<br>
-&quot;<br>
-<br>
-CACHED_CONFIGUREVARS_append_<wbr>x86 =3D &quot; ac_cv_header_emmintrin_h=
=3Dno ac_cv_header_xmmintrin_h=3Dno&quot;<br>
-<br>
-FILES_${MLPREFIX}libgsttag-1.<wbr>0 +=3D &quot;${datadir}/gst-plugins-base=
/<wbr>1.0/license-translations.dict&quot;<br>
-<br>
-do_compile_prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/gst-<w=
br>libs/gst/tag/.libs:${B}/gst-<wbr>libs/gst/video/.libs:${B}/gst-<wbr>libs=
/gst/audio/.libs:${B}/gst-<wbr>libs/gst/rtp/.libs&quot;<br>
-}<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/0001-Makefile.am-<wbr>don-t-hardcode-libtool-name-<wbr>when-running=
.patch b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-b=
ase/0001-Makefile.am-<wbr>don-t-hardcode-libtool-name-<wbr>when-running.pat=
ch<br>
index 094bdac846..128c7f8cb6 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0001-Makefile.am-<wbr>don-t-hardcode-libtool-name-<wbr>when-running.patch<=
br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0001-Makefile.am-<wbr>don-t-hardcode-libtool-name-<wbr>when-running.patch<=
br>
@@ -1,16 +1,18 @@<br>
-From f1d9652351e7754c63003104eceb52<wbr>6af424c7e0 Mon Sep 17 00:00:00 200=
1<br>
+From 4d6ea58f96b9744af8d899ddca22c2<wbr>695ac74b5b Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
-Date: Fri, 20 Nov 2015 16:53:04 +0200<br>
-Subject: [PATCH 1/4] Makefile.am: don&#39;t hardcode libtool name when run=
ning<br>
+Date: Thu, 5 Apr 2018 10:15:08 +0800<br>
+Subject: [PATCH] Makefile.am: don&#39;t hardcode libtool name when running=
<br>
=C2=A0 introspection tools<br>
<br>
=C2=A0Upstream-Status: Pending [review on oe-core maillist]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
+Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">an=
uj.mittal@intel.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 gst-libs/gst/allocators/<wbr>Makefile.am | 2 +-<br>
=C2=A0 gst-libs/gst/app/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0 gst-libs/gst/audio/Makefile.am=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- gst-libs/gst/fft/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ gst-libs/gst/gl/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0 gst-libs/gst/pbutils/Makefile.<wbr>am=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0 gst-libs/gst/riff/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0 gst-libs/gst/rtp/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
@@ -21,10 +23,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0 11 files changed, 11 insertions(+), 11 deletions(-)<br>
<br>
=C2=A0diff --git a/gst-libs/gst/allocators/<wbr>Makefile.am b/gst-libs/gst/=
allocators/<wbr>Makefile.am<br>
-index 9361bf9..bc7f53a 100644<br>
+index 1957d28..1ecc950 100644<br>
=C2=A0--- a/gst-libs/gst/allocators/<wbr>Makefile.am<br>
=C2=A0+++ b/gst-libs/gst/allocators/<wbr>Makefile.am<br>
-@@ -38,7 +38,7 @@ GstAllocators-@GST_API_VERSION<wbr>@.gir: $(INTROSPECTIO=
N_SCANNER) libgstallocators-@<br>
+@@ -42,7 +42,7 @@ GstAllocators-@GST_API_VERSION<wbr>@.gir: $(INTROSPECTIO=
N_SCANNER) libgstallocators-@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --add-include-path=
=3D`PKG_<wbr>CONFIG_PATH=3D&quot;$(GST_PKG_CONFIG_<wbr>PATH)&quot; $(PKG_CO=
NFIG) --variable=3Dgirdir gstreamer-@GST_API_VERSION@` \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgsta=
llocators-@<wbr>GST_API_VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
@@ -34,10 +36,10 @@ index 9361bf9..bc7f53a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg-export gstrea=
mer-allocators-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --output $@ \<br>
=C2=A0diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile=
.am<br>
-index 6d6de8d..dcc2fe0 100644<br>
+index 52f6ad3..5bfd606 100644<br>
=C2=A0--- a/gst-libs/gst/app/Makefile.am<br>
=C2=A0+++ b/gst-libs/gst/app/Makefile.am<br>
-@@ -53,7 +53,7 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstapp-@GST_API_VERSIO<br>
+@@ -56,7 +56,7 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstapp-@GST_API_VERSIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgsta=
pp-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
@@ -47,10 +49,10 @@ index 6d6de8d..dcc2fe0 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-bas=
e-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg-export gstrea=
mer-app-@GST_API_VERSION<wbr>@ \<br>
=C2=A0diff --git a/gst-libs/gst/audio/Makefile.<wbr>am b/gst-libs/gst/audio=
/Makefile.<wbr>am<br>
-index 275d222..2374196 100644<br>
+index 2922245..7fb65f2 100644<br>
=C2=A0--- a/gst-libs/gst/audio/Makefile.<wbr>am<br>
=C2=A0+++ b/gst-libs/gst/audio/Makefile.<wbr>am<br>
-@@ -116,7 +116,7 @@ GstAudio-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION_S=
CANNER) libgstaudio-@GST_API_VE<br>
+@@ -184,7 +184,7 @@ GstAudio-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION_S=
CANNER) libgstaudio-@GST_API_VE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstTag-=
@GST_API_<wbr>VERSION@ \<br>
@@ -59,24 +61,24 @@ index 275d222..2374196 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-@GS=
T_API_VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-bas=
e-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg-export gstrea=
mer-audio-@GST_API_<wbr>VERSION@ \<br>
-diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am<b=
r>
-index 09b3d68..f545354 100644<br>
---- a/gst-libs/gst/fft/Makefile.am<br>
-+++ b/gst-libs/gst/fft/Makefile.am<br>
-@@ -65,7 +65,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstfft-@GST_API_VERSIO<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-include-path=
=3D`PKG_<wbr>CONFIG_PATH=3D&quot;$(GST_PKG_CONFIG_<wbr>PATH)&quot; $(PKG_CO=
NFIG) --variable=3Dgirdir gstreamer-@GST_API_VERSION@` \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--library=3Dlibgstf=
ft-@GST_API_<wbr>VERSION@.la \<br>
+diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am<br>
+index a3bbc94..16f829f 100644<br>
+--- a/gst-libs/gst/gl/Makefile.am<br>
++++ b/gst-libs/gst/gl/Makefile.am<br>
+@@ -192,7 +192,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) =
libgstgl-@GST_API_VERSION@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--include=3DGstVide=
o-@GST_API_<wbr>VERSION@ \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libtool=3D&quot;$=
(top_builddir)/<wbr>libtool&quot; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libtool=3D&quot;$=
(LIBTOOL)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-@GS=
T_API_VERSION@ \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pkg-export gstrea=
mer-fft-@GST_API_VERSION<wbr>@ \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--output $@ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pkg gstreamer-bas=
e-@GST_API_<wbr>VERSION@ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pkg gstreamer-vid=
eo-@GST_API_<wbr>VERSION@ \<br>
=C2=A0diff --git a/gst-libs/gst/pbutils/<wbr>Makefile.am b/gst-libs/gst/pbu=
tils/<wbr>Makefile.am<br>
-index 64d5eb0..91dc214 100644<br>
+index ae51993..35a6e44 100644<br>
=C2=A0--- a/gst-libs/gst/pbutils/<wbr>Makefile.am<br>
=C2=A0+++ b/gst-libs/gst/pbutils/<wbr>Makefile.am<br>
-@@ -99,7 +99,7 @@ GstPbutils-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION_S=
CANNER) libgstpbutils-@GST_AP<br>
+@@ -103,7 +103,7 @@ GstPbutils-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION=
_SCANNER) libgstpbutils-@GST_AP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstTag-=
@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstVide=
o-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstAudi=
o-@GST_API_<wbr>VERSION@ \<br>
@@ -86,10 +88,10 @@ index 64d5eb0..91dc214 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-tag=
-@GST_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-vid=
eo-@GST_API_<wbr>VERSION@ \<br>
=C2=A0diff --git a/gst-libs/gst/riff/Makefile.<wbr>am b/gst-libs/gst/riff/M=
akefile.<wbr>am<br>
-index 83d83cb..3bd8fc0 100644<br>
+index fb53f06..e66ef4f 100644<br>
=C2=A0--- a/gst-libs/gst/riff/Makefile.<wbr>am<br>
=C2=A0+++ b/gst-libs/gst/riff/Makefile.<wbr>am<br>
-@@ -47,7 +47,7 @@ libgstriff_@GST_API_VERSION@_<wbr>la_LDFLAGS =3D $(GST_L=
IB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
+@@ -49,7 +49,7 @@ libgstriff_@GST_API_VERSION@_<wbr>la_LDFLAGS =3D $(GST_L=
IB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--include=3DGstAudi=
o-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--include=3DGstTag-=
@GST_API_<wbr>VERSION@ \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
@@ -99,10 +101,10 @@ index 83d83cb..3bd8fc0 100644<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pkg gstreamer-tag=
-@GST_API_VERSION<wbr>@ \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pkg gstreamer-aud=
io-@GST_API_<wbr>VERSION@ \<br>
=C2=A0diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile=
.am<br>
-index fdd01c1..f5445c1 100644<br>
+index a6f971d..77ebeeb 100644<br>
=C2=A0--- a/gst-libs/gst/rtp/Makefile.am<br>
=C2=A0+++ b/gst-libs/gst/rtp/Makefile.am<br>
-@@ -65,7 +65,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstrtp-@GST_API_VERSIO<br>
+@@ -69,7 +69,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstrtp-@GST_API_VERSIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgstr=
tp-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
@@ -112,10 +114,10 @@ index fdd01c1..f5445c1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-bas=
e-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg-export gstrea=
mer-rtp-@GST_API_VERSION<wbr>@ \<br>
=C2=A0diff --git a/gst-libs/gst/rtsp/Makefile.<wbr>am b/gst-libs/gst/rtsp/M=
akefile.<wbr>am<br>
-index ede5706..9b0b258 100644<br>
+index ceb07f4..db9d0fd 100644<br>
=C2=A0--- a/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
=C2=A0+++ b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
-@@ -72,7 +72,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) =
libgstrtsp-@GST_API_VERS<br>
+@@ -76,7 +76,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) =
libgstrtsp-@GST_API_VERS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGio-2.0=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstSdp-=
@GST_API_<wbr>VERSION@ \<br>
@@ -125,10 +127,10 @@ index ede5706..9b0b258 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-@GS=
T_API_VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-sdp=
-@GST_API_VERSION<wbr>@ \<br>
=C2=A0diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile=
.am<br>
-index a90f30b..0e149b8 100644<br>
+index e197e9b..6e05cc7 100644<br>
=C2=A0--- a/gst-libs/gst/sdp/Makefile.am<br>
=C2=A0+++ b/gst-libs/gst/sdp/Makefile.am<br>
-@@ -32,7 +32,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstsdp-@GST_API_VERSIO<br>
+@@ -34,7 +34,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstsdp-@GST_API_VERSIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --add-include-path=
=3D`PKG_<wbr>CONFIG_PATH=3D&quot;$(GST_PKG_CONFIG_<wbr>PATH)&quot; $(PKG_CO=
NFIG) --variable=3Dgirdir gstreamer-@GST_API_VERSION@` \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgsts=
dp-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
@@ -138,10 +140,10 @@ index a90f30b..0e149b8 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg-export gstrea=
mer-sdp-@GST_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --output $@ \<br>
=C2=A0diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile=
.am<br>
-index c534a4d..cafafd3 100644<br>
+index 0247c33..c86515b 100644<br>
=C2=A0--- a/gst-libs/gst/tag/Makefile.am<br>
=C2=A0+++ b/gst-libs/gst/tag/Makefile.am<br>
-@@ -45,7 +45,7 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgsttag-@GST_API_VERSIO<br>
+@@ -66,7 +66,7 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgsttag-@GST_API_VERSIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgstt=
ag-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
@@ -151,10 +153,10 @@ index c534a4d..cafafd3 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-bas=
e-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg-export gstrea=
mer-tag-@GST_API_VERSION<wbr>@ \<br>
=C2=A0diff --git a/gst-libs/gst/video/Makefile.<wbr>am b/gst-libs/gst/video=
/Makefile.<wbr>am<br>
-index 5d31fa1..ac64eb3 100644<br>
+index 9fc1ccf..0f8455f 100644<br>
=C2=A0--- a/gst-libs/gst/video/Makefile.<wbr>am<br>
=C2=A0+++ b/gst-libs/gst/video/Makefile.<wbr>am<br>
-@@ -116,7 +116,7 @@ GstVideo-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION_S=
CANNER) libgstvideo-@GST_API_VE<br>
+@@ -124,7 +124,7 @@ GstVideo-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION_S=
CANNER) libgstvideo-@GST_API_VE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgstv=
ideo-@GST_<wbr>API_VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
@@ -163,6 +165,3 @@ index 5d31fa1..ac64eb3 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-@GS=
T_API_VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-bas=
e-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg-export gstrea=
mer-video-@GST_API_<wbr>VERSION@ \<br>
--- <br>
-2.6.2<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/0001-gstreamer-<wbr>gl.pc.in-don-t-append-GL_<wbr>CFLAGS-to-CFLAGS.=
patch b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-ba=
se/0001-gstreamer-<wbr>gl.pc.in-don-t-append-GL_<wbr>CFLAGS-to-CFLAGS.patch=
<br>
new file mode 100644<br>
index 0000000000..251dc172cb<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0001-gstreamer-<wbr>gl.pc.in-don-t-append-GL_<wbr>CFLAGS-to-CFLAGS.patch<b=
r>
@@ -0,0 +1,29 @@<br>
+From 61a672e79c8cb1aeeeda4c968997c5<wbr>77ac73a8f3 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Fri, 12 May 2017 16:47:12 +0300<br>
+Subject: [PATCH] <a href=3D"http://gstreamer-gl.pc.in" rel=3D"noreferrer" =
target=3D"_blank">gstreamer-gl.pc.in</a>: don&#39;t append GL_CFLAGS to CFL=
AGS<br>
+<br>
+Dependencies&#39; include directories should not be added in this way;<br>
+it causes problems when cross-compiling in sysroot environments.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">m=
axin.john@intel.com</a>&gt;<br>
+---<br>
+ pkgconfig/<a href=3D"http://gstreamer-gl.pc.in" rel=3D"noreferrer" target=
=3D"_blank">gstreamer-gl.pc.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/pkgconfig/<a href=3D"http://gstreamer-gl.pc.in" rel=3D"norefe=
rrer" target=3D"_blank">gstreamer-gl.pc.in</a> b/pkgconfig/<a href=3D"http:=
//gstreamer-gl.pc.in" rel=3D"noreferrer" target=3D"_blank">gstreamer-gl.pc.=
in</a><br>
+index dc672a9..8c290ba 100644<br>
+--- a/pkgconfig/<a href=3D"http://gstreamer-gl.pc.in" rel=3D"noreferrer" t=
arget=3D"_blank">gstreamer-gl.pc.in</a><br>
++++ b/pkgconfig/<a href=3D"http://gstreamer-gl.pc.in" rel=3D"noreferrer" t=
arget=3D"_blank">gstreamer-gl.pc.in</a><br>
+@@ -13,4 +13,4 @@ Version: @VERSION@<br>
+ Requires: gstreamer-video-@GST_API_<wbr>VERSION@ gstreamer-base-@GST_API_=
<wbr>VERSION@ gstreamer-@GST_API_VERSION@<br>
+ <br>
+ Libs: -L${libdir} -lgstgl-@GST_API_VERSION@<br>
+-Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_<wbr>API_VERSION@/incl=
ude @GL_CFLAGS@<br>
++Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_<wbr>API_VERSION@/incl=
ude<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr>with-PKG_CONF=
.patch b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-b=
ase/0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr>with-PKG_CONF.pat=
ch<br>
index 6616e2cf0d..dc15d93eb0 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr>with-PKG_CONF.patch<=
br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr>with-PKG_CONF.patch<=
br>
@@ -1,16 +1,17 @@<br>
-From 990b653c7b6de1937ec759019982d6<wbr>c5f15770f7 Mon Sep 17 00:00:00 200=
1<br>
+From f523721e453febfb3f62f3ba1e9fef<wbr>b31dcec471 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
-Date: Mon, 26 Oct 2015 16:38:18 +0200<br>
-Subject: [PATCH 2/4] Makefile.am: prefix calls to pkg-config with<br>
+Date: Thu, 5 Apr 2018 10:26:25 +0800<br>
+Subject: [PATCH] Makefile.am: prefix calls to pkg-config with<br>
=C2=A0 PKG_CONFIG_SYSROOT_DIR<br>
<br>
=C2=A0Upstream-Status: Pending [review on oe-core maillist]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
+Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">an=
uj.mittal@intel.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 gst-libs/gst/allocators/<wbr>Makefile.am |=C2=A0 4 ++--<br>
=C2=A0 gst-libs/gst/app/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++=
--<br>
=C2=A0 gst-libs/gst/audio/Makefile.am=C2=A0 =C2=A0 =C2=A0 | 12 ++++++------=
<br>
- gst-libs/gst/fft/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br=
>
=C2=A0 gst-libs/gst/pbutils/Makefile.<wbr>am=C2=A0 =C2=A0 | 12 ++++++------=
<br>
=C2=A0 gst-libs/gst/riff/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++=
++----<br>
=C2=A0 gst-libs/gst/rtp/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++=
++----<br>
@@ -18,13 +19,13 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0 gst-libs/gst/sdp/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++=
--<br>
=C2=A0 gst-libs/gst/tag/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++=
++----<br>
=C2=A0 gst-libs/gst/video/Makefile.am=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++---=
-<br>
- 11 files changed, 38 insertions(+), 38 deletions(-)<br>
+ 10 files changed, 36 insertions(+), 36 deletions(-)<br>
<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/allocators/Makefile.<wbr>=
am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/allocators/<wbr>Makefil=
e.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/allocators/Makefile.<wbr>am<=
br>
-@@ -36,7 +36,7 @@ GstAllocators-@GST_API_VERSION<wbr>@.gir: $(I<br>
+diff --git a/gst-libs/gst/allocators/<wbr>Makefile.am b/gst-libs/gst/alloc=
ators/<wbr>Makefile.am<br>
+index 1ecc950..d6417ac 100644<br>
+--- a/gst-libs/gst/allocators/<wbr>Makefile.am<br>
++++ b/gst-libs/gst/allocators/<wbr>Makefile.am<br>
+@@ -39,7 +39,7 @@ GstAllocators-@GST_API_VERSION<wbr>@.gir: $(INTROSPECTIO=
N_SCANNER) libgstallocators-@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --c-include &quot;g=
st/allocators/allocators.h&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_builddir)/g=
st-libs \<br>
@@ -33,7 +34,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/allocato=
rs/Makefile.<wbr>am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgsta=
llocators-@<wbr>GST_API_VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libtool=3D&quot;$=
(LIBTOOL)&quot; \<br>
-@@ -60,7 +60,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
+@@ -63,7 +63,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.<wbr>typeli=
b)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(sr=
cdir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir) \<br>
@@ -42,11 +43,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/alloca=
tors/Makefile.<wbr>am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER_OPTS) $&lt; -o $(@F)<br>
<br>
=C2=A0 CLEANFILES =3D $(BUILT_GIRSOURCES) $(typelibs_DATA)<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/app/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/app/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/app/Makefile.am<br>
-@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPE<br>
+diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am<b=
r>
+index 5bfd606..6441674 100644<br>
+--- a/gst-libs/gst/app/Makefile.am<br>
++++ b/gst-libs/gst/app/Makefile.am<br>
+@@ -51,8 +51,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstapp-@GST_API_VERSIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --c-include &quot;g=
st/app/app.h&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_builddir)/g=
st-libs \<br>
@@ -57,11 +58,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/app/Ma=
kefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgsta=
pp-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/audio/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/audio/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/audio/Makefile.am<br>
-@@ -167,12 +167,12 @@ GstAudio-@GST_API_VERSION@.<wbr>gir: $(INTROS<br>
+diff --git a/gst-libs/gst/audio/Makefile.<wbr>am b/gst-libs/gst/audio/Make=
file.<wbr>am<br>
+index 7fb65f2..5379f79 100644<br>
+--- a/gst-libs/gst/audio/Makefile.<wbr>am<br>
++++ b/gst-libs/gst/audio/Makefile.<wbr>am<br>
+@@ -174,12 +174,12 @@ GstAudio-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION=
_SCANNER) libgstaudio-@GST_API_VE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_builddir)/g=
st-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --c-include &quot;g=
st/audio/audio.h&quot; \<br>
@@ -78,7 +79,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/audio/Ma=
kefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library-path=3D&q=
uot;$(top_<wbr>builddir)/gst-libs/gst/tag/&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
-@@ -201,8 +201,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
+@@ -208,8 +208,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.<wbr>type=
lib)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(sr=
cdir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D&quo=
t;$(top_builddir)/<wbr>gst-libs/gst/tag/&quot; \<br>
@@ -89,33 +90,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/audio/=
Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER_OPTS) $&lt; -o $(@F)<br>
<br>
=C2=A0 CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typelibs_DATA)<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/fft/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/fft/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/fft/Makefile.am<br>
-@@ -63,7 +63,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--c-include &quot;g=
st/fft/fft.h&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)/gst=
-libs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(top_builddir)/g=
st-libs \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --add-include-path=3D`PK=
G_<wbr>CONFIG_PATH=3D&quot;$(GST_PKG_CONFIG_<wbr>PATH)&quot; $(PKG_CONFIG) =
--variable=3Dgirdir gstreamer-@GST_API_VERSION@` \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --add-include-path=3D$(P=
KG_<wbr>CONFIG_SYSROOT_DIR)`PKG_<wbr>CONFIG_PATH=3D&quot;$(GST_PKG_CONFIG_<=
wbr>PATH)&quot; $(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_API_VERSIO=
N@` \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--library=3Dlibgstf=
ft-@GST_API_<wbr>VERSION@.la \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libtool=3D&quot;$=
(LIBTOOL)&quot; \<br>
-@@ -87,7 +87,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_COM=
PILER) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--includedir=3D$(sr=
cdir) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--includedir=3D$(bu=
ilddir) \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D`PKG_CONF=
IG_PATH=3D<wbr>&quot;$(GST_PKG_CONFIG_PATH)&quot; $(PKG_CONFIG) --variable=
=3Dgirdir gstreamer-@GST_API_VERSION@` \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(PKG_CON=
FIG_<wbr>SYSROOT_DIR)`PKG_CONFIG_PATH=3D&quot;<wbr>$(GST_PKG_CONFIG_PATH)&q=
uot; $(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_API_VERSION@` \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_COM=
PILER_OPTS) $&lt; -o $(@F)<br>
- <br>
- CLEANFILES =3D $(BUILT_GIRSOURCES) $(typelibs_DATA)<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/pbutils/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/pbutils/Makefile.<wbr>a=
m<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/pbutils/Makefile.am<br>
-@@ -85,14 +85,14 @@ GstPbutils-@GST_API_VERSION@.<wbr>gir: $(INTR<br>
+diff --git a/gst-libs/gst/pbutils/<wbr>Makefile.am b/gst-libs/gst/pbutils/=
<wbr>Makefile.am<br>
+index 35a6e44..49d6894 100644<br>
+--- a/gst-libs/gst/pbutils/<wbr>Makefile.am<br>
++++ b/gst-libs/gst/pbutils/<wbr>Makefile.am<br>
+@@ -88,14 +88,14 @@ GstPbutils-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION=
_SCANNER) libgstpbutils-@GST_AP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --c-include &quot;g=
st/pbutils/pbutils.h&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_builddir)/g=
st-libs \<br>
@@ -134,7 +113,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/pbutil=
s/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library-path=3D&q=
uot;$(top_<wbr>builddir)/gst-libs/gst/tag/&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library-path=3D&q=
uot;$(top_<wbr>builddir)/gst-libs/gst/video/&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library-path=3D&q=
uot;$(top_<wbr>builddir)/gst-libs/gst/audio/&quot; \<br>
-@@ -125,8 +125,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
+@@ -128,8 +128,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.<wbr>type=
lib)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(sr=
cdir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir) \<br>
@@ -145,11 +124,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/pbut=
ils/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D&quo=
t;$(top_builddir)/<wbr>gst-libs/gst/tag/&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D&quo=
t;$(top_builddir)/<wbr>gst-libs/gst/video/&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D&quo=
t;$(top_builddir)/<wbr>gst-libs/gst/audio/&quot; \<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/riff/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/riff/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/riff/Makefile.am<br>
-@@ -42,8 +42,8 @@ libgstriff_@GST_API_VERSION@_<wbr>la_LDFLAGS<br>
+diff --git a/gst-libs/gst/riff/Makefile.<wbr>am b/gst-libs/gst/riff/Makefi=
le.<wbr>am<br>
+index e66ef4f..c8c588a 100644<br>
+--- a/gst-libs/gst/riff/Makefile.<wbr>am<br>
++++ b/gst-libs/gst/riff/Makefile.<wbr>am<br>
+@@ -43,8 +43,8 @@ libgstriff_@GST_API_VERSION@_<wbr>la_LDFLAGS =3D $(GST_L=
IB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--c-include &quot;g=
st/riff/riff.h&quot; \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-include-path=
=3D$(builddir)<wbr>/../tag \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-include-path=
=3D$(builddir)<wbr>/../audio \<br>
@@ -160,7 +139,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/riff/M=
akefile.am<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--library=3Dlibgstr=
iff-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--include=3DGstAudi=
o-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--include=3DGstTag-=
@GST_API_<wbr>VERSION@ \<br>
-@@ -74,8 +74,8 @@ libgstriff_@GST_API_VERSION@_<wbr>la_LDFLAGS<br>
+@@ -75,8 +75,8 @@ libgstriff_@GST_API_VERSION@_<wbr>la_LDFLAGS =3D $(GST_L=
IB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--includedir=3D$(bu=
ilddir) \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--includedir=3D$(bu=
ilddir)/../<wbr>tag \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--includedir=3D$(bu=
ilddir)/../<wbr>audio \<br>
@@ -171,11 +150,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/riff=
/Makefile.am<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_COM=
PILER_OPTS) $&lt; -o $(@F)<br>
=C2=A0 #<br>
=C2=A0 #CLEANFILES =3D $(BUILT_GIRSOURCES) $(typelibs_DATA)<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtp/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/rtp/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtp/Makefile.am<br>
-@@ -61,8 +61,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPE<br>
+diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am<b=
r>
+index 77ebeeb..9aee788 100644<br>
+--- a/gst-libs/gst/rtp/Makefile.am<br>
++++ b/gst-libs/gst/rtp/Makefile.am<br>
+@@ -64,8 +64,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstrtp-@GST_API_VERSIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --c-include &quot;g=
st/rtp/rtp.h&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_builddir)/g=
st-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
@@ -186,7 +165,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtp/Ma=
kefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgstr=
tp-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
-@@ -89,8 +89,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
+@@ -92,8 +92,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.<wbr>typeli=
b)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(sr=
cdir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir) \<br>
@@ -197,11 +176,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtp/=
Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER_OPTS) $&lt; -o $(@F)<br>
<br>
=C2=A0 CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typelibs_DATA)<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtsp/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/rtsp/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtsp/Makefile.am<br>
-@@ -68,7 +68,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSP<br>
+diff --git a/gst-libs/gst/rtsp/Makefile.<wbr>am b/gst-libs/gst/rtsp/Makefi=
le.<wbr>am<br>
+index db9d0fd..79027cb 100644<br>
+--- a/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
++++ b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
+@@ -71,7 +71,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) =
libgstrtsp-@GST_API_VERS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_builddir)/g=
st-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --add-include-path=
=3D$(builddir)<wbr>/../sdp \<br>
@@ -210,7 +189,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtsp/M=
akefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgstr=
tsp-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGio-2.0=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
-@@ -98,7 +98,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
+@@ -101,7 +101,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.<wbr>type=
lib)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(sr=
cdir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir)/../<wbr>sdp \<br>
@@ -219,11 +198,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtsp=
/Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER_OPTS) $&lt; -o $(@F)<br>
<br>
=C2=A0 CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typelibs_DATA)<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/sdp/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/sdp/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/sdp/Makefile.am<br>
-@@ -30,7 +30,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPE<br>
+diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am<b=
r>
+index 6e05cc7..c7cf514 100644<br>
+--- a/gst-libs/gst/sdp/Makefile.am<br>
++++ b/gst-libs/gst/sdp/Makefile.am<br>
+@@ -31,7 +31,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgstsdp-@GST_API_VERSIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --warn-all \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --c-include &quot;g=
st/sdp/sdp.h&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
@@ -232,7 +211,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/sdp/Ma=
kefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgsts=
dp-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libtool=3D&quot;$=
(LIBTOOL)&quot; \<br>
-@@ -54,7 +54,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
+@@ -55,7 +55,7 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.<wbr>typeli=
b)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(sr=
cdir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir) \<br>
@@ -241,11 +220,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/sdp/=
Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER_OPTS) $&lt; -o $(@F)<br>
<br>
=C2=A0 CLEANFILES =3D $(BUILT_GIRSOURCES) $(typelibs_DATA)<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/tag/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/tag/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/tag/Makefile.am<br>
-@@ -59,8 +59,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPE<br>
+diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am<b=
r>
+index c86515b..363e6d2 100644<br>
+--- a/gst-libs/gst/tag/Makefile.am<br>
++++ b/gst-libs/gst/tag/Makefile.am<br>
+@@ -61,8 +61,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) l=
ibgsttag-@GST_API_VERSIO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --c-include &quot;g=
st/tag/tag.h&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_builddir)/g=
st-libs \<br>
@@ -256,7 +235,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/tag/Ma=
kefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgstt=
ag-@GST_API_<wbr>VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
-@@ -87,8 +87,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
+@@ -89,8 +89,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.<wbr>typeli=
b)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(sr=
cdir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir) \<br>
@@ -267,11 +246,11 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/tag/=
Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER_OPTS) $&lt; -o $(@F)<br>
<br>
=C2=A0 CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typelibs_DATA)<br>
-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/video/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst/video/Makefile.am<br>
-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/video/Makefile.am<br>
-@@ -116,8 +116,8 @@ GstVideo-@GST_API_VERSION@.<wbr>gir: $(INTROS<br>
+diff --git a/gst-libs/gst/video/Makefile.<wbr>am b/gst-libs/gst/video/Make=
file.<wbr>am<br>
+index 0f8455f..8c9955c 100644<br>
+--- a/gst-libs/gst/video/Makefile.<wbr>am<br>
++++ b/gst-libs/gst/video/Makefile.<wbr>am<br>
+@@ -119,8 +119,8 @@ GstVideo-@GST_API_VERSION@.<wbr>gir: $(INTROSPECTION_S=
CANNER) libgstvideo-@GST_API_VE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --c-include &quot;g=
st/video/video.h&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/gst=
-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_builddir)/g=
st-libs \<br>
@@ -282,7 +261,7 @@ Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/video/=
Makefile.am<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --library=3Dlibgstv=
ideo-@GST_<wbr>API_VERSION@.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGst-@GS=
T_API_VERSION<wbr>@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --include=3DGstBase=
-@GST_API_<wbr>VERSION@ \<br>
-@@ -144,8 +144,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D<br>
+@@ -147,8 +147,8 @@ typelibs_DATA =3D $(BUILT_GIRSOURCES:.gir=3D.<wbr>type=
lib)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INTROSPECTION_COM=
PILER) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(sr=
cdir) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D$(bu=
ilddir) \<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/0003-riff-add-<wbr>missing-include-directories-<wbr>when-calling-in=
.patch b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-b=
ase/0003-riff-add-<wbr>missing-include-directories-<wbr>when-calling-in.pat=
ch<br>
index 9b66f7f49d..98ffdb1c10 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0003-riff-add-<wbr>missing-include-directories-<wbr>when-calling-in.patch<=
br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0003-riff-add-<wbr>missing-include-directories-<wbr>when-calling-in.patch<=
br>
@@ -1,20 +1,21 @@<br>
-From 3c2c2d5dd08aa30ed0e8acd8566ec9<wbr>9412bb8209 Mon Sep 17 00:00:00 200=
1<br>
+From b9765efb1696e3e2e79f2955f759be<wbr>199fe34882 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 26 Oct 2015 17:29:37 +0200<br>
-Subject: [PATCH 3/4] riff: add missing include directories when calling<br=
>
+Subject: [PATCH] riff: add missing include directories when calling<br>
=C2=A0 introspection scanner<br>
<br>
=C2=A0Upstream-Status: Pending [review on oe-core maillist]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 gst-libs/gst/riff/Makefile.am | 2 ++<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/gst-libs/gst/riff/Makefile.<wbr>am b/gst-libs/gst/riff/M=
akefile.<wbr>am<br>
-index 0a115cc..5057a58 100644<br>
+index c8c588a..c096453 100644<br>
=C2=A0--- a/gst-libs/gst/riff/Makefile.<wbr>am<br>
=C2=A0+++ b/gst-libs/gst/riff/Makefile.<wbr>am<br>
-@@ -39,6 +39,8 @@ libgstriff_@GST_API_VERSION@_<wbr>la_LDFLAGS =3D $(GST_L=
IB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
+@@ -41,6 +41,8 @@ libgstriff_@GST_API_VERSION@_<wbr>la_LDFLAGS =3D $(GST_L=
IB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--strip-prefix=3DGs=
t \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--warn-all \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--c-include &quot;g=
st/riff/riff.h&quot; \<br>
@@ -23,6 +24,3 @@ index 0a115cc..5057a58 100644<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-include-path=
=3D$(builddir)<wbr>/../tag \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-include-path=
=3D$(builddir)<wbr>/../audio \<br>
=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--add-include-path=
=3D$(PKG_<wbr>CONFIG_SYSROOT_DIR)`PKG_<wbr>CONFIG_PATH=3D&quot;$(GST_PKG_CO=
NFIG_<wbr>PATH)&quot; $(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_API_=
VERSION@` \<br>
--- <br>
-2.6.2<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/0003-ssaparse-<wbr>enhance-SSA-text-lines-<wbr>parsing.patch b/meta=
/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base/0003-ssap=
arse-<wbr>enhance-SSA-text-lines-<wbr>parsing.patch<br>
index 9fbebd5700..9e95524057 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0003-ssaparse-<wbr>enhance-SSA-text-lines-<wbr>parsing.patch<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0003-ssaparse-<wbr>enhance-SSA-text-lines-<wbr>parsing.patch<br>
@@ -1,7 +1,7 @@<br>
-From be6163cfa3a255493f9d75bad9541c<wbr>bfe1723fee Mon Sep 17 00:00:00 200=
1<br>
+From 918c96b24d10f61b7455b4cef3bab4<wbr>90849d0d77 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Mingke Wang &lt;<a href=3D"mailto:mingke.wang@freescale.com">mi=
ngke.wang@freescale.com</a>&gt;<br>
=C2=A0Date: Thu, 19 Mar 2015 14:17:10 +0800<br>
-Subject: [PATCH 3/4] ssaparse: enhance SSA text lines parsing.<br>
+Subject: [PATCH] ssaparse: enhance SSA text lines parsing.<br>
<br>
=C2=A0some parser will pass in the original ssa text line which starts with=
 &quot;Dialog:&quot;<br>
=C2=A0and there&#39;s are maybe multiple Dialog lines in one input buffer.<=
br>
@@ -10,13 +10,18 @@ Upstream-Status: Submitted [<a href=3D"https://bugzilla=
.gnome.org/show_bug.cgi?id=3D747496" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bugzilla.gnome.org/<wbr>show_bug.cgi?id=3D747496</a>]<br>
<br>
=C2=A0Signed-off-by: Mingke Wang &lt;<a href=3D"mailto:mingke.wang@freescal=
e.com">mingke.wang@freescale.com</a>&gt;<br>
<br>
+---<br>
+ gst/subparse/gstssaparse.c | 150 ++++++++++++++++++++++++++++++<wbr>+++++=
+++++-----<br>
+ 1 file changed, 134 insertions(+), 16 deletions(-)<br>
+ mode change 100644 =3D&gt; 100755 gst/subparse/gstssaparse.c<br>
+<br>
=C2=A0diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c<=
br>
=C2=A0old mode 100644<br>
=C2=A0new mode 100755<br>
-index 06ecef9..0ab5dce<br>
+index c849c08..4b9636c<br>
=C2=A0--- a/gst/subparse/gstssaparse.c<br>
=C2=A0+++ b/gst/subparse/gstssaparse.c<br>
-@@ -260,6 +260,7 @@ gst_ssa_parse_remove_override_<wbr>codes (GstSsaParse =
* parse, gchar * txt)<br>
+@@ -262,6 +262,7 @@ gst_ssa_parse_remove_override_<wbr>codes (GstSsaParse =
* parse, gchar * txt)<br>
=C2=A0 =C2=A0* gst_ssa_parse_push_line:<br>
=C2=A0 =C2=A0* @parse: caller element<br>
=C2=A0 =C2=A0* @txt: text to push<br>
@@ -24,7 +29,7 @@ index 06ecef9..0ab5dce<br>
=C2=A0 =C2=A0* @start: timestamp for the buffer<br>
=C2=A0 =C2=A0* @duration: duration for the buffer<br>
=C2=A0 =C2=A0*<br>
-@@ -269,27 +270,133 @@ gst_ssa_parse_remove_override_<wbr>codes (GstSsaPar=
se * parse, gchar * txt)<br>
+@@ -271,27 +272,133 @@ gst_ssa_parse_remove_override_<wbr>codes (GstSsaPar=
se * parse, gchar * txt)<br>
=C2=A0 =C2=A0* Returns: result of the push of the created buffer<br>
=C2=A0 =C2=A0*/<br>
=C2=A0 static GstFlowReturn<br>
@@ -169,7 +174,7 @@ index 06ecef9..0ab5dce<br>
=C2=A0 =C2=A0 GST_LOG_OBJECT (parse, &quot;Text : %s&quot;, t);<br>
<br>
=C2=A0 =C2=A0 if (gst_ssa_parse_remove_<wbr>override_codes (parse, t)) {<br=
>
-@@ -307,13 +414,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar =
* txt,<br>
+@@ -309,13 +416,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar =
* txt,<br>
=C2=A0 =C2=A0 gst_buffer_fill (buf, 0, escaped, len + 1);<br>
=C2=A0 =C2=A0 gst_buffer_set_size (buf, len);<br>
=C2=A0 =C2=A0 g_free (escaped);<br>
@@ -196,7 +201,7 @@ index 06ecef9..0ab5dce<br>
<br>
=C2=A0 =C2=A0 ret =3D gst_pad_push (parse-&gt;srcpad, buf);<br>
<br>
-@@ -333,6 +449,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * par=
ent, GstBuffer * buf)<br>
+@@ -335,6 +451,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * par=
ent, GstBuffer * buf)<br>
=C2=A0 =C2=A0 GstClockTime ts;<br>
=C2=A0 =C2=A0 gchar *txt;<br>
=C2=A0 =C2=A0 GstMapInfo map;<br>
@@ -204,7 +209,7 @@ index 06ecef9..0ab5dce<br>
<br>
=C2=A0 =C2=A0 if (G_UNLIKELY (!parse-&gt;framed))<br>
=C2=A0 =C2=A0 =C2=A0 goto not_framed;<br>
-@@ -350,13 +467,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * p=
arent, GstBuffer * buf)<br>
+@@ -352,13 +469,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * p=
arent, GstBuffer * buf)<br>
=C2=A0 =C2=A0 /* make double-sure it&#39;s 0-terminated and all */<br>
=C2=A0 =C2=A0 gst_buffer_map (buf, &amp;map, GST_MAP_READ);<br>
=C2=A0 =C2=A0 txt =3D g_strndup ((gchar *) map.data, map.size);<br>
@@ -220,6 +225,3 @@ index 06ecef9..0ab5dce<br>
<br>
=C2=A0 =C2=A0 if (ret !=3D GST_FLOW_OK &amp;&amp; GST_CLOCK_TIME_IS_VALID (=
ts)) {<br>
=C2=A0 =C2=A0 =C2=A0 GstSegment segment;<br>
--- <br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstreamer-sdp-in-Ma=
.patch b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-b=
ase/0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstreamer-sdp-in-Ma.pat=
ch<br>
index 4adf605460..aaeb611fec 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstreamer-sdp-in-Ma.patch<=
br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstreamer-sdp-in-Ma.patch<=
br>
@@ -1,20 +1,21 @@<br>
-From 4330915d88dc4dd46eb4c28d756482<wbr>b767c2747f Mon Sep 17 00:00:00 200=
1<br>
+From 53b5868491cf99ee797192395dbfeb<wbr>69df23edd2 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 26 Oct 2015 17:30:14 +0200<br>
-Subject: [PATCH 4/4] rtsp: drop incorrect reference to gstreamer-sdp in<br=
>
+Subject: [PATCH] rtsp: drop incorrect reference to gstreamer-sdp in<br>
=C2=A0 Makefile.am<br>
<br>
=C2=A0Upstream-Status: Pending [review on oe-core maillist]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 gst-libs/gst/rtsp/Makefile.am | 1 -<br>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/gst-libs/gst/rtsp/Makefile.<wbr>am b/gst-libs/gst/rtsp/M=
akefile.<wbr>am<br>
-index 4f6d9f8..0afa370 100644<br>
+index 79027cb..2987e23 100644<br>
=C2=A0--- a/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
=C2=A0+++ b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
-@@ -75,7 +75,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) =
libgstrtsp-@GST_API_VERS<br>
+@@ -79,7 +79,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) =
libgstrtsp-@GST_API_VERS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libtool=3D&quot;$=
(LIBTOOL)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gio-2.0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg gstreamer-@GS=
T_API_VERSION@ \<br>
@@ -22,6 +23,3 @@ index 4f6d9f8..0afa370 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pkg-export gstrea=
mer-rtsp-@GST_API_<wbr>VERSION@ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --add-init-section=
=3D&quot;$(<wbr>INTROSPECTION_INIT)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --output $@ \<br>
--- <br>
-2.6.2<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/0004-subparse-<wbr>set-need_segment-after-sink-<wbr>pad-received-GS=
.patch b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-b=
ase/0004-subparse-<wbr>set-need_segment-after-sink-<wbr>pad-received-GS.pat=
ch<br>
deleted file mode 100644<br>
index b924e38824..0000000000<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0004-subparse-<wbr>set-need_segment-after-sink-<wbr>pad-received-GS.patch<=
br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-From ed09c8fd2c9c2b5384b72cc70af372<wbr>8be6694e64 Mon Sep 17 00:00:00 200=
1<br>
-From: Mingke Wang &lt;<a href=3D"mailto:mingke.wang@freescale.com">mingke.=
wang@freescale.com</a>&gt;<br>
-Date: Thu, 19 Mar 2015 14:20:26 +0800<br>
-Subject: [PATCH 4/4] subparse: set need_segment after sink pad received<br=
>
- GST_EVENT_SEGMENT<br>
-<br>
-subparse works in push mode, chain funciton will be called once<br>
-up stream element finished the seeking and flushing.<br>
-if set need_segment flag in src pad event handler, the segment<br>
-event will be pushed earlier, result in the subtitle text will<br>
-be send out to down stream from the beginning.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://bugzilla.gnome.org/show_bug=
.cgi?id=3D747498" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gno=
me.org/<wbr>show_bug.cgi?id=3D747498</a>]<br>
-<br>
-Signed-off-by: Mingke Wang &lt;<a href=3D"mailto:mingke.wang@freescale.com=
">mingke.wang@freescale.com</a>&gt;<br>
-<br>
-diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c<br>
-old mode 100644<br>
-new mode 100755<br>
-index b565e93..7741ccc<br>
---- a/gst/subparse/gstsubparse.c<br>
-+++ b/gst/subparse/gstsubparse.c<br>
-@@ -266,22 +266,20 @@ gst_sub_parse_src_event (GstPad * pad, GstObject * p=
arent, GstEvent * event)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto beach;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 =C2=A0 /* Apply the seek to our segment */<br>
-+=C2=A0 =C2=A0 =C2=A0 gst_segment_do_seek (&amp;self-&gt;segment, rate, fo=
rmat, flags,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start_type, start, stop_type, stop, &a=
mp;update);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 GST_DEBUG_OBJECT (self, &quot;segment after seek: %&=
quot; GST_SEGMENT_FORMAT,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;self-&gt;segment);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Convert that seek to a seeking in bytes at p=
osition 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIXME: could use an index */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gst_pad_push_event (self-&gt;sinkpad,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_event_new_seek (rate, GST_FOR=
MAT_BYTES, flags,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_SEEK_TYPE_SET, =
0, GST_SEEK_TYPE_NONE, 0));<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Apply the seek to our segment */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_segment_do_seek (&amp;self-&gt;segment, r=
ate, format, flags,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start_type, start, stop_type, s=
top, &amp;update);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_DEBUG_OBJECT (self, &quot;segment after s=
eek: %&quot; GST_SEGMENT_FORMAT,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;self-&gt;segment);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;need_segment =3D TRUE;<br>
--=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_WARNING_OBJECT (self, &quot;seek to =
0 bytes failed&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-@@ -1641,8 +1639,10 @@ gst_sub_parse_sink_event (GstPad * pad, GstObject *=
 parent, GstEvent * event)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0gst_event_parse_segment (event, &amp;s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;format =3D=3D GST_FORMAT_TIME)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_event_copy_segment (event, &amp;self=
-&gt;segment);<br>
--=C2=A0 =C2=A0 =C2=A0 GST_DEBUG_OBJECT (self, &quot;newsegment (%s)&quot;,=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_format_get_name (self-&gt;segment.=
format));<br>
-+=C2=A0 =C2=A0 =C2=A0 GST_DEBUG_OBJECT (self, &quot;newsegment (%s) %&quot=
; GST_SEGMENT_FORMAT,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_format_get_name (self-&gt;segment.=
format), &amp;self-&gt;segment);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 self-&gt;need_segment =3D TRUE;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* if not time format, we&#39;ll either start w=
ith a 0 timestamp anyway or<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * it&#39;s following a seek in which case we&#=
39;ll have saved the requested<br>
--- <br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/0009-glimagesink-<wbr>Downrank-to-marginal.patch b/meta/recipes-mul=
timedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base/0009-glimagesink-<wbr=
>Downrank-to-marginal.patch<br>
new file mode 100644<br>
index 0000000000..c81fb0f6aa<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/0009-glimagesink-<wbr>Downrank-to-marginal.patch<br>
@@ -0,0 +1,32 @@<br>
+From c6b37a80806f9128de47f1ccc3f235<wbr>4f8d436bb6 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Thu, 24 Sep 2015 19:47:32 +0300<br>
+Subject: [PATCH] glimagesink: Downrank to marginal<br>
+<br>
+On desktop, where there is good OpenGL, xvimagesink will come up first,<br=
>
+on other platforms, OpenGL can&#39;t be trusted because it&#39;s either so=
ftware (like<br>
+in a VM) or broken (like on embedded)., so let ximagesink come above.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://bugzilla.gnome.org/show_bug=
.cgi?id=3D751684" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gno=
me.org/<wbr>show_bug.cgi?id=3D751684</a>]<br>
+<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ ext/gl/gstopengl.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c<br>
+index a4b2540..0ccaacd 100644<br>
+--- a/ext/gl/gstopengl.c<br>
++++ b/ext/gl/gstopengl.c<br>
+@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugin)<br>
+ #endif<br>
+ <br>
+=C2=A0 =C2=A0if (!gst_element_register (plugin, &quot;glimagesink&quot;,<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_RANK_SECONDARY, gst_gl_image_sink_=
bin_get_type ())) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_RANK_MARGINAL, gst_gl_image_sink_b=
in_get_type ())) {<br>
+=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-- <br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/get-caps-from-<wbr>src-pad-when-query-caps.patch b/meta/recipes-mul=
timedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base/get-caps-from-<wbr>sr=
c-pad-when-query-caps.patch<br>
index c8e6287a55..a4727e23ea 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/get-caps-from-<wbr>src-pad-when-query-caps.patch<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/get-caps-from-<wbr>src-pad-when-query-caps.patch<br>
@@ -1,4 +1,4 @@<br>
-From af0dac26f62aaceb4bf26672091195<wbr>3793e0fc5d Mon Sep 17 00:00:00 200=
1<br>
+From 41de2ec64ab06bb58c82c1659adaa3<wbr>811bc5bcf8 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: zhouming &lt;<a href=3D"mailto:b42586@freescale.com">b42586@fre=
escale.com</a>&gt;<br>
=C2=A0Date: Wed, 14 May 2014 10:16:20 +0800<br>
=C2=A0Subject: [PATCH] ENGR00312515: get caps from src pad when query caps<=
br>
@@ -8,18 +8,19 @@ <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D7=
28312" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.org/<wbr=
>show_bug.cgi?id=3D728312</a><br>
=C2=A0Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: zhouming &lt;<a href=3D"mailto:b42586@freescale.com">b=
42586@freescale.com</a>&gt;<br>
+<br>
=C2=A0---<br>
- gst-libs/gst/tag/gsttagdemux.c |=C2=A0 =C2=A013 +++++++++++++<br>
+ gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++<br>
=C2=A0 1 file changed, 13 insertions(+)<br>
=C2=A0 mode change 100644 =3D&gt; 100755 gst-libs/gst/tag/gsttagdemux.c<br>
<br>
=C2=A0diff --git a/gst-libs/gst/tag/<wbr>gsttagdemux.c b/gst-libs/gst/tag/<=
wbr>gsttagdemux.c<br>
=C2=A0old mode 100644<br>
=C2=A0new mode 100755<br>
-index 9b6c478..ae2294a<br>
+index 8a127c8..71c5d78<br>
=C2=A0--- a/gst-libs/gst/tag/<wbr>gsttagdemux.c<br>
=C2=A0+++ b/gst-libs/gst/tag/<wbr>gsttagdemux.c<br>
-@@ -1769,6 +1769,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * =
parent, GstQuery * query)<br>
+@@ -1759,6 +1759,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * =
parent, GstQuery * query)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
@@ -39,6 +40,3 @@ index 9b6c478..ae2294a<br>
=C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D gst_pad_query_default (pad, parent, que=
ry);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
--- <br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/link-with-<wbr>libvchostif.patch b/meta/recipes-multimedia/<wbr>gst=
reamer/gstreamer1.0-<wbr>plugins-base/link-with-<wbr>libvchostif.patch<br>
new file mode 100644<br>
index 0000000000..d5a7f6bdc2<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/link-with-<wbr>libvchostif.patch<br>
@@ -0,0 +1,45 @@<br>
+From 9866f51e5e0913f1e453eb574618bf<wbr>7432f38cb6 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Wed, 11 Apr 2018 10:46:33 +0800<br>
+Subject: [PATCH] Add -lvchostif to link when using -lEGL on rpi<br>
+<br>
+This is required because libEGL from userland uses sybols<br>
+from this library.<br>
+<br>
+lib/libEGL.so.1.0.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 121: 00000000=
=C2=A0 =C2=A0 =C2=A00 FUNC=C2=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 UND vc_dispman=
x_element_add<br>
+=C2=A0 1552: 00000000=C2=A0 =C2=A0 =C2=A00 FUNC=C2=A0 =C2=A0 GLOBAL DEFAUL=
T=C2=A0 UND vc_dispmanx_element_add<br>
+<br>
+These symbols are provided by libvchostif as seen below<br>
+<br>
+lib/libvchostif.so<br>
+=C2=A0 =C2=A0252: 0000b161=C2=A0 =C2=A0192 FUNC=C2=A0 =C2=A0 GLOBAL DEFAUL=
T=C2=A0 =C2=A0 9 vc_dispmanx_element_add<br>
+=C2=A0 =C2=A0809: 0000b161=C2=A0 =C2=A0192 FUNC=C2=A0 =C2=A0 GLOBAL DEFAUL=
T=C2=A0 =C2=A0 9 vc_dispmanx_element_add<br>
+<br>
+With this explicit link, plugins fail during runtime<br>
+<br>
+(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin &#39=
;/usr/lib/gstreamer-1.0/<wbr>libgstomx.so&#39;: Error relocating /usr/lib/l=
ibgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found<br>
+(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin &#39=
;/usr/lib/gstreamer-1.0/<wbr>libgstopengl.so&#39;: Error relocating /usr/li=
b/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">an=
uj.mittal@intel.com</a>&gt;<br>
+---<br>
+ m4/gst-gl.m4 | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4<br>
+index 1e97240..ab7774c 100644<br>
+--- a/m4/gst-gl.m4<br>
++++ b/m4/gst-gl.m4<br>
+@@ -231,7 +231,7 @@ case $host in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_EGL=3Dyes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_GLES2=3Dyes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_EGL_RPI=3Dyes<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 EGL_LIBS=3D&quot;-lbcm_host -lvcos -lvchiq_arm&quo=
t;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 EGL_LIBS=3D&quot;-lbcm_host -lvchostif -lvcos -lvc=
hiq_arm&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EGL_CFLAGS=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(USE_EGL_RPI, [1], [Use RPi platfor=
m])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0])<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugi=
ns-base/make-gio_unix_2_<wbr>0-dependency-configurable.<wbr>patch b/meta/re=
cipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base/make-gio_uni=
x_2_<wbr>0-dependency-configurable.<wbr>patch<br>
index 413eff0695..23950b67f2 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/make-gio_unix_2_<wbr>0-dependency-configurable.<wbr>patch<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-base=
/make-gio_unix_2_<wbr>0-dependency-configurable.<wbr>patch<br>
@@ -1,4 +1,4 @@<br>
-From 10d2a977ee1d469f0bf9059bb2d0b5<wbr>5fd2eecbac Mon Sep 17 00:00:00 200=
1<br>
+From 7ffa6e3d00e1d8a060f3f4c2bb9a72<wbr>691af05d79 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccu=
rdy@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 20 Jan 2016 13:00:00 -0800<br>
=C2=A0Subject: [PATCH] make gio_unix_2_0 dependency configurable<br>
@@ -17,16 +17,17 @@ instead of AG_GST_CHECK_FEATURE.<br>
=C2=A0Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.co=
m">armccurdy@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 7 +++++++<br>
=C2=A0 1 file changed, 7 insertions(+)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 9c52aeb..26cacd6 100644<br>
+index 12807bc..35a0bf3 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -752,9 +752,16 @@ AC_SUBST(FT2_CFLAGS)<br>
- fi dnl of EXT plugins<br>
+@@ -806,9 +806,16 @@ AM_CONDITIONAL(HAVE_PNG, test &quot;x$HAVE_PNG&quot; =
=3D &quot;xyes&quot;)<br>
+ AM_CONDITIONAL(HAVE_JPEG, test &quot;x$HAVE_JPEG&quot; =3D &quot;xyes&quo=
t;)<br>
<br>
=C2=A0 dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***<br>
=C2=A0+AC_ARG_ENABLE([gio_unix_2_0],<br>
@@ -42,6 +43,3 @@ index 9c52aeb..26cacd6 100644<br>
=C2=A0 AM_CONDITIONAL(USE_GIO_UNIX_2_<wbr>0, test &quot;x$HAVE_GIO_UNIX_2_0=
&quot; =3D &quot;xyes&quot;)<br>
<br>
=C2=A0 dnl *** finalize CFLAGS, LDFLAGS, LIBS<br>
--- <br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-base_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-<wbr>plugins-base_1.12.4.bb</a> b/meta/recipes-multimedia/<wbr>gstre=
amer/<a href=3D"http://gstreamer1.0-plugins-base_1.12.4.bb" rel=3D"noreferr=
er" target=3D"_blank">gstreamer1.0-<wbr>plugins-base_1.12.4.bb</a><br>
deleted file mode 100644<br>
index dd895bbcb1..0000000000<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-base_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
<wbr>plugins-base_1.12.4.bb</a><br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-require gstreamer1.0-plugins-base.inc<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>c54ce9345727175ff66d1=
7b67ff51f<wbr>58 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LIB;md5=3D<wbr>6762ed442b3822387a51c92d928ead<wbr>0d \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://common/coverage/<a href=3D"http://coverage-report.pl" rel=3D"noreferrer"=
 target=3D"_blank">coverag<wbr>e-report.pl</a>;beginline=3D2;<wbr>endline=
=3D17;md5=3D<wbr>a4e1830fce078028c8f09741612726<wbr>07&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"http://gstreamer.freedesktop.org/src/gst-plugins-=
base/gst-plugins-base-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">ht=
tp://gstreamer.freedesktop.<wbr>org/src/gst-plugins-base/gst-<wbr>plugins-b=
ase-${PV}.tar.xz</a> \<br>
-=C2=A0 =C2=A0 file://get-caps-from-src-pad-<wbr>when-query-caps.patch \<br=
>
-=C2=A0 =C2=A0 file://0003-ssaparse-enhance-<wbr>SSA-text-lines-parsing.pat=
ch \<br>
-=C2=A0 =C2=A0 file://0004-subparse-set-need_<wbr>segment-after-sink-pad-<w=
br>received-GS.patch \<br>
-=C2=A0 =C2=A0 file://make-gio_unix_2_0-<wbr>dependency-configurable.patch =
\<br>
-=C2=A0 =C2=A0 file://0001-introspection.m4-<wbr>prefix-pkgconfig-paths-wit=
h-<wbr>PKG_CON.patch \<br>
-&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>b35b04071f69b8ab69a7f3a497ff01<wbr>31&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>4c306b03df0212f1b8903784e29bb3<wbr>49331=
9ba19ebebf13b0c56a1787029<wbr>2282&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/gst-plugins-base-$<wbr>{PV}&quot;<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-<wbr>plugins-base_1.14.0.bb</a> b/meta/recipes-multimedia/<wbr>gstre=
amer/<a href=3D"http://gstreamer1.0-plugins-base_1.14.0.bb" rel=3D"noreferr=
er" target=3D"_blank">gstreamer1.0-<wbr>plugins-base_1.14.0.bb</a><br>
new file mode 100644<br>
index 0000000000..370cd0368c<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
<wbr>plugins-base_1.14.0.bb</a><br>
@@ -0,0 +1,70 @@<br>
+require gstreamer1.0-plugins.inc<br>
+<br>
+LICENSE =3D &quot;GPLv2+ &amp; LGPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>c54ce9345727175ff66d1=
7b67ff51f<wbr>58 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LIB;md5=3D<wbr>6762ed442b3822387a51c92d928ead<wbr>0d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://common/coverage/<a href=3D"http://coverage-report.pl" rel=3D"noreferrer"=
 target=3D"_blank">coverag<wbr>e-report.pl</a>;beginline=3D2;<wbr>endline=
=3D17;md5=3D<wbr>a4e1830fce078028c8f09741612726<wbr>07&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gstreamer.free=
desktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz" rel=3D"nore=
ferrer" target=3D"_blank">http://gstreamer.freedesktop.<wbr>org/src/gst-plu=
gins-base/gst-<wbr>plugins-base-${PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://get-caps-from-src-pad-<wb=
r>when-query-caps.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-ssaparse-enhance-<wb=
r>SSA-text-lines-parsing.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make-gio_unix_2_0-<wbr>de=
pendency-configurable.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-introspection.m4-<wb=
r>prefix-pkgconfig-paths-with-<wbr>PKG_CON.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile.am-don-t-<w=
br>hardcode-libtool-name-when-<wbr>running.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Makefile.am-<wbr>pre=
fix-calls-to-pkg-config-<wbr>with-PKG_CONF.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-riff-add-missing-<wb=
r>include-directories-when-<wbr>calling-in.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-rtsp-drop-<wbr>incor=
rect-reference-to-<wbr>gstreamer-sdp-in-Ma.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0009-glimagesink-<wbr>Dow=
nrank-to-marginal.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gstreamer-gl.pc.<wbr=
>in-don-t-append-GL_CFLAGS-to-<wbr>CFLAGS.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://link-with-libvchostif.<wb=
r>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>370271327dd23110421a9c2927ac98<wbr>9a&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>7e904660ff56e02b036cf7fdfb77a5<wbr>0a540=
828ca9d2614d69ba931772e5b<wbr>6940&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/gst-plugins-base-$<wbr>{PV}&quot;<br>
+<br>
+DEPENDS +=3D &quot;iso-codes util-linux&quot;<br>
+<br>
+inherit gettext<br>
+<br>
+PACKAGES_DYNAMIC =3D+ &quot;^libgst.*&quot;<br>
+<br>
+PACKAGECONFIG_GL ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES=
&#39;, &#39;opengl&#39;, &#39;gles2 egl&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG ??=3D &quot; \<br>
+=C2=A0 =C2=A0 ${GSTREAMER_ORC} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;alsa=
 x11&#39;, d)} \<br>
+=C2=A0 =C2=A0 gio-unix-2.0 ogg pango theora vorbis zlib jpeg \<br>
+=C2=A0 =C2=A0 ${PACKAGECONFIG_GL} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;wa=
yland&#39;, &#39;wayland egl&#39;, &#39;&#39;, d)} \<br>
+&quot;<br>
+<br>
+X11DEPENDS =3D &quot;virtual/libx11 libsm libxrender libxv&quot;<br>
+X11ENABLEOPTS =3D &quot;--enable-x --enable-xvideo --enable-xshm&quot;<br>
+X11DISABLEOPTS =3D &quot;--disable-x --disable-xvideo --disable-xshm&quot;=
<br>
+<br>
+PACKAGECONFIG[alsa]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-al=
sa,--disable-alsa,<wbr>alsa-lib&quot;<br>
+PACKAGECONFIG[cdparanoia]=C2=A0 =C2=A0=3D &quot;--enable-cdparanoia,--<wbr=
>disable-cdparanoia,cdparanoia&quot;<br>
+PACKAGECONFIG[gio-unix-2.0] =3D &quot;--enable-gio_unix_2_0,--<wbr>disable=
-gio_unix_2_0,glib-2.0&quot;<br>
+PACKAGECONFIG[ivorbis]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-ivorbis,--di=
sable-<wbr>ivorbis,tremor&quot;<br>
+PACKAGECONFIG[ogg]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-og=
g,--disable-ogg,<wbr>libogg&quot;<br>
+PACKAGECONFIG[opus]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-op=
us,--disable-opus,<wbr>libopus&quot;<br>
+PACKAGECONFIG[pango]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-pango,-=
-disable-<wbr>pango,pango&quot;<br>
+PACKAGECONFIG[theora]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-theora,=
--disable-<wbr>theora,libtheora&quot;<br>
+PACKAGECONFIG[visual]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-libvisu=
al,--disable-<wbr>libvisual,libvisual&quot;<br>
+PACKAGECONFIG[vorbis]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-vorbis,=
--disable-<wbr>vorbis,libvorbis&quot;<br>
+PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${X11ENABLE=
OPTS},${<wbr>X11DISABLEOPTS},${X11DEPENDS}&quot;<br>
+PACKAGECONFIG[zlib]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-zl=
ib,--disable-zlib,<wbr>zlib&quot;<br>
+PACKAGECONFIG[opengl]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;--enable-opengl,=
--disable-<wbr>opengl,virtual/libgl libglu&quot;<br>
+PACKAGECONFIG[gles2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-gles2,-=
-disable-<wbr>gles2,virtual/libgles2&quot;<br>
+PACKAGECONFIG[egl]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-eg=
l,--disable-egl,<wbr>virtual/egl&quot;<br>
+PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =C2=A0 =3D &quot;--enable-wayland,--di=
sable-<wbr>wayland,wayland-native wayland wayland-protocols libdrm&quot;<br=
>
+PACKAGECONFIG[jpeg]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;,,jpeg&quot=
;<br>
+<br>
+FILES_${MLPREFIX}libgsttag-1.<wbr>0 +=3D &quot;${datadir}/gst-plugins-base=
/<wbr>1.0/license-translations.dict&quot;<br>
+<br>
+do_compile_prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/gst-<w=
br>libs/gst/tag/.libs:${B}/gst-<wbr>libs/gst/video/.libs:${B}/gst-<wbr>libs=
/gst/audio/.libs:${B}/gst-<wbr>libs/gst/rtp/.libs&quot;<br>
+}<br>
+<br>
+FILES_${PN}-dev +=3D &quot;${libdir}/gstreamer-${LIBV}/<wbr>include/gst/gl=
/gstglconfig.h&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.14.1<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000c99af0056b5ff405--
