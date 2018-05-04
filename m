Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id BE75C74CFE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 13:09:23 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id p124-v6so25567280iod.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kIxnpJUKQY6/nc8k+dJsKN7vY/97TnUUk/gHvDVXxo8=;
	b=cy33COfAXvS8dbFhIAgkNLkEBR/wSfTQhtThB0jj8Aur3XjNwjyhRFp0uRenhfS+by
	LG0Mm70sn0j3fqEryv0j8xe7L71SA5wWFvkhbiYkC1l0RPO8MbMlVdmL1cWAcSKui0Zq
	ienji+9DIJWW87eo8LL/Bifz3u4gjOV6rwC9fRG4gk/kSUqelSmIJcPU/r2V+vVE9U60
	WswjGA/GwvzQBXIh+fhh00k5V89bXQVxx1OyuG2QuA9qyObG+6XzOX/enegYwsj1S0lT
	085lcEg39kibjkSXWEEwOKHGFWQisRv/mtemhZQ4MGI8cBsFBerAL2LfI4fdjvPqg1O+
	lFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kIxnpJUKQY6/nc8k+dJsKN7vY/97TnUUk/gHvDVXxo8=;
	b=STNcTL1Udg2GEIZOpN9eIhlnF3Kpck3/RQNhctTypMRdf/WOMC6a988zNcDuziScwN
	oN6DKgyFrPywF0GKJ5/fUsC9T5QQlWUTADnwu2TEAfDWKmoF7h29m0//ySFrNqDuwY0y
	b1/fGwHkMavMN838qF/WkqYvDiKE5+aPYvk7LXBuBilQ73kZkkn0d9BQc2xBv/XF5xfm
	kl5HgRf+oRfOnhALj/typD0PNy4Ubm8spy+LGd5OnaOxeaDC1HOzpmrXJSkPhANSpygS
	YeWbY2HVzR3Q8PBrTMTAEv0aPR31t5bsF019WSzQkedg6WwvXgV6/pZelKe7pc5h3OFt
	m5Eg==
X-Gm-Message-State: ALQs6tCHL55S0wXQhmvF53ICMKRMF/QFKUvVRbo/QP4l5vC1j3xHrYTz
	3cepP+oi/zQ3znlZB3DjUJwCVgy8QbKE3N4OXCDhsA==
X-Google-Smtp-Source: AB8JxZp9qH4rNqIfzrYcUOlV2KY0nH//Cgam+k0bc5V+b4dCQW5IoYkAGMOzTdAonx22FWoSJCPs+qkM/xv618i07bM=
X-Received: by 2002:a6b:b74b:: with SMTP id
	h72-v6mr28871966iof.201.1525439364257; 
	Fri, 04 May 2018 06:09:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Fri, 4 May 2018 06:09:03 -0700 (PDT)
In-Reply-To: <0635df77-73be-ef9e-2952-b1c87743b4f7@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
	<20180503081758.4661-2-anuj.mittal@intel.com>
	<CAJTo0LZqqcDiMQE6-GjaLmYJWQoj_g_ttkz1JR8X25K6uUcHxw@mail.gmail.com>
	<0635df77-73be-ef9e-2952-b1c87743b4f7@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 May 2018 14:09:03 +0100
Message-ID: <CAJTo0LYxbra0DJDJO3xz8iehHJ23U86MbwFgBpD-CF4EuJNw2Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 04 May 2018 13:09:24 -0000
Content-Type: multipart/alternative; boundary="0000000000006eef31056b610767"

--0000000000006eef31056b610767
Content-Type: text/plain; charset="UTF-8"

Aha great.  I suspect that you have GStreamer headers on your host already
and it's picking those up?

Ross

On 4 May 2018 at 14:07, Anuj Mittal <anuj.mittal@intel.com> wrote:

> For some reason, I can't reproduce this, I have g-i enabled. But, it
> looks like we need this:
>
> https://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?h=1.14&id=
> 9261296858cb149767ceac44fd6bd13cc0de0d21
>
> On 05/04/2018 07:52 PM, Burton, Ross wrote:
> >  Couldn't find include 'GstVideo-1.0.gir' (search path:
> > '['/data/poky-tmp/master/work/corei7-64-poky-linux/
> gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot/usr/share/gir-1.0',
> > '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0',
> > '/data/poky-tmp/master/work/corei7-64-poky-linux/
> gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot/usr/share/gir-1.0',
> > '/data/poky-tmp/master/work/corei7-64-poky-linux/
> gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot-native/
> usr/share/gir-1.0',
> > '/usr/share/gir-1.0',
> > '/data/poky-tmp/master/work/corei7-64-poky-linux/
> gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot-native/
> usr/share/gir-1.0']')
> > | Makefile:1506: recipe for target 'GstGL-1.0.gir' failed
> >
> > Turn on gobject-introspection DISTRO_FEATURE if you haven't already.
> >
> > That file is at ./gst-libs/gst/video/GstVideo-1.0.gir in the build tree,
> > so that search path is wrong...
> >
> > Ross
> >
> > On 3 May 2018 at 09:17, Anuj Mittal <anuj.mittal@intel.com
> > <mailto:anuj.mittal@intel.com>> wrote:
> >
> >     * For changes, please see:
> >     https://gstreamer.freedesktop.org/releases/1.14/
> >     <https://gstreamer.freedesktop.org/releases/1.14/>
> >     * OpenGL integration library has moved to -plugins-base, add
> >     PACKAGECONFIG.
> >     * Remove one patch as that has been fixed in a different way
> upstream.
> >     * Merge inc/bb and refresh patches to get rid of fuzz warnings.
> >     * Remove x86 specific cached variables as they're not needed anymore.
> >     * Add jpeg to PACKAGECONFIG and enable it by default.
> >     * Port gstreamer-gl specific patches from -plugins-bad.
> >
> >     Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
> >     <mailto:anuj.mittal@intel.com>>
> >     ---
> >      ...on.m4-prefix-pkgconfig-paths-with-PKG_CON.patch |  12 +-
> >      .../gstreamer/gstreamer1.0-plugins-base.inc        |  50 -------
> >      ...-don-t-hardcode-libtool-name-when-running.patch |  71 +++++-----
> >      ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  29 ++++
> >      ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 151
> >     +++++++++------------
> >      ...ssing-include-directories-when-calling-in.patch |  12 +-
> >      ...3-ssaparse-enhance-SSA-text-lines-parsing.patch |  24 ++--
> >      ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  12 +-
> >      ...t-need_segment-after-sink-pad-received-GS.patch |  69 ----------
> >      .../0009-glimagesink-Downrank-to-marginal.patch    |  32 +++++
> >      .../get-caps-from-src-pad-when-query-caps.patch    |  12 +-
> >      .../link-with-libvchostif.patch                    |  45 ++++++
> >      ...make-gio_unix_2_0-dependency-configurable.patch |  12 +-
> >      .../gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
> >     <http://gstreamer1.0-plugins-base_1.12.4.bb>  |  18 ---
> >      .../gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
> >     <http://gstreamer1.0-plugins-base_1.14.0.bb>  |  70 ++++++++++
> >      15 files changed, 314 insertions(+), 305 deletions(-)
> >      delete mode 100644
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> >      create mode 100644
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_
> CFLAGS-to-CFLAGS.patch
> >      delete mode 100644
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-subparse-set-need_segment-after-sink-
> pad-received-GS.patch
> >      create mode 100644
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0009-glimagesink-Downrank-to-marginal.patch
> >      create mode 100644
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/link-with-libvchostif.patch
> >      delete mode 100644
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.12.4.bb <http://gstreamer1.0-plugins-base_1.12.4.bb>
> >      create mode 100644
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.14.0.bb <http://gstreamer1.0-plugins-base_1.14.0.bb>
> >
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/files/0001-
> introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> >     b/meta/recipes-multimedia/gstreamer/files/0001-
> introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> >     index 2cab87f9ec..1b7f115083 100644
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/files/0001-
> introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/files/0001-
> introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> >     @@ -1,4 +1,4 @@
> >     -From 90916f96262fa7b27a0a99788c69f9fd6df11000 Mon Sep 17 00:00:00
> 2001
> >     +From 2b0436f9a07773fae8c74df902d7024e8bfc3512 Mon Sep 17 00:00:00
> 2001
> >      From: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >      Date: Tue, 24 Nov 2015 16:46:27 +0200
> >      Subject: [PATCH] introspection.m4: prefix pkgconfig paths with
> >     @@ -10,12 +10,13 @@ is later supplied to g-ir-scanner.
> >
> >      Upstream-Status: Pending [review on oe-core list]
> >      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +
> >      ---
> >     - common/m4/introspection.m4 | 12 ++++++------
> >     - 1 file changed, 6 insertions(+), 6 deletions(-)
> >     + common/m4/introspection.m4 | 8 ++++----
> >     + 1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >      diff --git a/common/m4/introspection.m4 b/common/m4/introspection.m4
> >     -index 162be57..217a6ae 100644
> >     +index 162be57..933f979 100644
> >      --- a/common/m4/introspection.m4
> >      +++ b/common/m4/introspection.m4
> >      @@ -54,14 +54,14 @@ m4_define([_GOBJECT_
> INTROSPECTION_CHECK_INTERNAL],
> >     @@ -37,6 +38,3 @@ index 162be57..217a6ae 100644
> >              INTROSPECTION_INIT="extern void gst_init(gint*,gchar**);
> >     gst_init(NULL,NULL);"
> >           fi
> >           AC_SUBST(INTROSPECTION_SCANNER)
> >     ---
> >     -2.6.2
> >     -
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> >     deleted file mode 100644
> >     index 08130c1da4..0000000000
> >     --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base.inc
> >     +++ /dev/null
> >     @@ -1,50 +0,0 @@
> >     -require gstreamer1.0-plugins.inc
> >     -
> >     -SRC_URI_append = "\
> >     -
> >     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
> \
> >     -
> >     file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
> \
> >     -
> >     file://0003-riff-add-missing-include-directories-when-calling-in.patch
> \
> >     -
> >     file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
> \
> >     -"
> >     -
> >     -LICENSE = "GPLv2+ & LGPLv2+"
> >     -
> >     -DEPENDS += "iso-codes util-linux zlib"
> >     -
> >     -inherit gettext
> >     -
> >     -PACKAGES_DYNAMIC =+ "^libgst.*"
> >     -
> >     -PACKAGECONFIG ??= " \
> >     -    ${GSTREAMER_ORC} \
> >     -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
> >     -    gio-unix-2.0 ogg pango theora vorbis \
> >     -"
> >     -
> >     -X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
> >     -X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
> >     -X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
> >     -
> >     -PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,
> alsa-lib"
> >     -PACKAGECONFIG[cdparanoia]   =
> >     "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
> >     -PACKAGECONFIG[gio-unix-2.0] =
> >     "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
> >     -PACKAGECONFIG[ivorbis]      =
> >     "--enable-ivorbis,--disable-ivorbis,tremor"
> >     -PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
> >     -PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,
> libopus"
> >     -PACKAGECONFIG[pango]        = "--enable-pango,--disable-
> pango,pango"
> >     -PACKAGECONFIG[theora]       =
> >     "--enable-theora,--disable-theora,libtheora"
> >     -PACKAGECONFIG[visual]       =
> >     "--enable-libvisual,--disable-libvisual,libvisual"
> >     -PACKAGECONFIG[vorbis]       =
> >     "--enable-vorbis,--disable-vorbis,libvorbis"
> >     -PACKAGECONFIG[x11]          =
> >     "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
> >     -
> >     -EXTRA_OECONF += " \
> >     -    --enable-zlib \
> >     -"
> >     -
> >     -CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no
> >     ac_cv_header_xmmintrin_h=no"
> >     -
> >     -FILES_${MLPREFIX}libgsttag-1.0 +=
> >     "${datadir}/gst-plugins-base/1.0/license-translations.dict"
> >     -
> >     -do_compile_prepend() {
> >     -        export
> >     GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-
> libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-
> libs/gst/rtp/.libs"
> >     -}
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-
> when-running.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-
> when-running.patch
> >     index 094bdac846..128c7f8cb6 100644
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-
> when-running.patch
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-
> when-running.patch
> >     @@ -1,16 +1,18 @@
> >     -From f1d9652351e7754c63003104eceb526af424c7e0 Mon Sep 17 00:00:00
> 2001
> >     +From 4d6ea58f96b9744af8d899ddca22c2695ac74b5b Mon Sep 17 00:00:00
> 2001
> >      From: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     -Date: Fri, 20 Nov 2015 16:53:04 +0200
> >     -Subject: [PATCH 1/4] Makefile.am: don't hardcode libtool name when
> >     running
> >     +Date: Thu, 5 Apr 2018 10:15:08 +0800
> >     +Subject: [PATCH] Makefile.am: don't hardcode libtool name when
> running
> >       introspection tools
> >
> >      Upstream-Status: Pending [review on oe-core maillist]
> >      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
> >     <mailto:anuj.mittal@intel.com>>
> >     +
> >      ---
> >       gst-libs/gst/allocators/Makefile.am | 2 +-
> >       gst-libs/gst/app/Makefile.am        | 2 +-
> >       gst-libs/gst/audio/Makefile.am      | 2 +-
> >     - gst-libs/gst/fft/Makefile.am        | 2 +-
> >     + gst-libs/gst/gl/Makefile.am         | 2 +-
> >       gst-libs/gst/pbutils/Makefile.am    | 2 +-
> >       gst-libs/gst/riff/Makefile.am       | 2 +-
> >       gst-libs/gst/rtp/Makefile.am        | 2 +-
> >     @@ -21,10 +23,10 @@ Signed-off-by: Alexander Kanavin
> >     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>
> >       11 files changed, 11 insertions(+), 11 deletions(-)
> >
> >      diff --git a/gst-libs/gst/allocators/Makefile.am
> >     b/gst-libs/gst/allocators/Makefile.am
> >     -index 9361bf9..bc7f53a 100644
> >     +index 1957d28..1ecc950 100644
> >      --- a/gst-libs/gst/allocators/Makefile.am
> >      +++ b/gst-libs/gst/allocators/Makefile.am
> >     -@@ -38,7 +38,7 @@ GstAllocators-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstallocators-@
> >     +@@ -42,7 +42,7 @@ GstAllocators-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstallocators-@
> >
> >     --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> >     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> >                     --library=libgstallocators-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >     @@ -34,10 +36,10 @@ index 9361bf9..bc7f53a 100644
> >                     --pkg-export gstreamer-allocators-@GST_API_VERSION@
> \
> >                     --output $@ \
> >      diff --git a/gst-libs/gst/app/Makefile.am
> >     b/gst-libs/gst/app/Makefile.am
> >     -index 6d6de8d..dcc2fe0 100644
> >     +index 52f6ad3..5bfd606 100644
> >      --- a/gst-libs/gst/app/Makefile.am
> >      +++ b/gst-libs/gst/app/Makefile.am
> >     -@@ -53,7 +53,7 @@ GstApp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
> >     +@@ -56,7 +56,7 @@ GstApp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
> >                     --library=libgstapp-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     @@ -47,10 +49,10 @@ index 6d6de8d..dcc2fe0 100644
> >                     --pkg gstreamer-base-@GST_API_VERSION@ \
> >                     --pkg-export gstreamer-app-@GST_API_VERSION@ \
> >      diff --git a/gst-libs/gst/audio/Makefile.am
> >     b/gst-libs/gst/audio/Makefile.am
> >     -index 275d222..2374196 100644
> >     +index 2922245..7fb65f2 100644
> >      --- a/gst-libs/gst/audio/Makefile.am
> >      +++ b/gst-libs/gst/audio/Makefile.am
> >     -@@ -116,7 +116,7 @@ GstAudio-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
> >     +@@ -184,7 +184,7 @@ GstAudio-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >                     --include=GstTag-@GST_API_VERSION@ \
> >     @@ -59,24 +61,24 @@ index 275d222..2374196 100644
> >                     --pkg gstreamer-@GST_API_VERSION@ \
> >                     --pkg gstreamer-base-@GST_API_VERSION@ \
> >                     --pkg-export gstreamer-audio-@GST_API_VERSION@ \
> >     -diff --git a/gst-libs/gst/fft/Makefile.am
> >     b/gst-libs/gst/fft/Makefile.am
> >     -index 09b3d68..f545354 100644
> >     ---- a/gst-libs/gst/fft/Makefile.am
> >     -+++ b/gst-libs/gst/fft/Makefile.am
> >     -@@ -65,7 +65,7 @@ GstFft-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
> >     -
> >      --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> >     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> >     -               --library=libgstfft-@GST_API_VERSION@.la \
> >     +diff --git a/gst-libs/gst/gl/Makefile.am
> b/gst-libs/gst/gl/Makefile.am
> >     +index a3bbc94..16f829f 100644
> >     +--- a/gst-libs/gst/gl/Makefile.am
> >     ++++ b/gst-libs/gst/gl/Makefile.am
> >     +@@ -192,7 +192,7 @@ GstGL-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
> >                     --include=Gst-@GST_API_VERSION@ \
> >     +               --include=GstBase-@GST_API_VERSION@ \
> >     +               --include=GstVideo-@GST_API_VERSION@ \
> >      -              --libtool="$(top_builddir)/libtool" \
> >      +              --libtool="$(LIBTOOL)" \
> >                     --pkg gstreamer-@GST_API_VERSION@ \
> >     -               --pkg-export gstreamer-fft-@GST_API_VERSION@ \
> >     -               --output $@ \
> >     +               --pkg gstreamer-base-@GST_API_VERSION@ \
> >     +               --pkg gstreamer-video-@GST_API_VERSION@ \
> >      diff --git a/gst-libs/gst/pbutils/Makefile.am
> >     b/gst-libs/gst/pbutils/Makefile.am
> >     -index 64d5eb0..91dc214 100644
> >     +index ae51993..35a6e44 100644
> >      --- a/gst-libs/gst/pbutils/Makefile.am
> >      +++ b/gst-libs/gst/pbutils/Makefile.am
> >     -@@ -99,7 +99,7 @@ GstPbutils-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
> >     +@@ -103,7 +103,7 @@ GstPbutils-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
> >                     --include=GstTag-@GST_API_VERSION@ \
> >                     --include=GstVideo-@GST_API_VERSION@ \
> >                     --include=GstAudio-@GST_API_VERSION@ \
> >     @@ -86,10 +88,10 @@ index 64d5eb0..91dc214 100644
> >                     --pkg gstreamer-tag-@GST_API_VERSION@ \
> >                     --pkg gstreamer-video-@GST_API_VERSION@ \
> >      diff --git a/gst-libs/gst/riff/Makefile.am
> >     b/gst-libs/gst/riff/Makefile.am
> >     -index 83d83cb..3bd8fc0 100644
> >     +index fb53f06..e66ef4f 100644
> >      --- a/gst-libs/gst/riff/Makefile.am
> >      +++ b/gst-libs/gst/riff/Makefile.am
> >     -@@ -47,7 +47,7 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> >     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
> >     +@@ -49,7 +49,7 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> >     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
> >       #             --include=GstAudio-@GST_API_VERSION@ \
> >       #             --include=GstTag-@GST_API_VERSION@ \
> >       #             --include=Gst-@GST_API_VERSION@ \
> >     @@ -99,10 +101,10 @@ index 83d83cb..3bd8fc0 100644
> >       #             --pkg gstreamer-tag-@GST_API_VERSION@ \
> >       #             --pkg gstreamer-audio-@GST_API_VERSION@ \
> >      diff --git a/gst-libs/gst/rtp/Makefile.am
> >     b/gst-libs/gst/rtp/Makefile.am
> >     -index fdd01c1..f5445c1 100644
> >     +index a6f971d..77ebeeb 100644
> >      --- a/gst-libs/gst/rtp/Makefile.am
> >      +++ b/gst-libs/gst/rtp/Makefile.am
> >     -@@ -65,7 +65,7 @@ GstRtp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
> >     +@@ -69,7 +69,7 @@ GstRtp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
> >                     --library=libgstrtp-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     @@ -112,10 +114,10 @@ index fdd01c1..f5445c1 100644
> >                     --pkg gstreamer-base-@GST_API_VERSION@ \
> >                     --pkg-export gstreamer-rtp-@GST_API_VERSION@ \
> >      diff --git a/gst-libs/gst/rtsp/Makefile.am
> >     b/gst-libs/gst/rtsp/Makefile.am
> >     -index ede5706..9b0b258 100644
> >     +index ceb07f4..db9d0fd 100644
> >      --- a/gst-libs/gst/rtsp/Makefile.am
> >      +++ b/gst-libs/gst/rtsp/Makefile.am
> >     -@@ -72,7 +72,7 @@ GstRtsp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
> >     +@@ -76,7 +76,7 @@ GstRtsp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
> >                     --include=Gio-2.0 \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstSdp-@GST_API_VERSION@ \
> >     @@ -125,10 +127,10 @@ index ede5706..9b0b258 100644
> >                     --pkg gstreamer-@GST_API_VERSION@ \
> >                     --pkg gstreamer-sdp-@GST_API_VERSION@ \
> >      diff --git a/gst-libs/gst/sdp/Makefile.am
> >     b/gst-libs/gst/sdp/Makefile.am
> >     -index a90f30b..0e149b8 100644
> >     +index e197e9b..6e05cc7 100644
> >      --- a/gst-libs/gst/sdp/Makefile.am
> >      +++ b/gst-libs/gst/sdp/Makefile.am
> >     -@@ -32,7 +32,7 @@ GstSdp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
> >     +@@ -34,7 +34,7 @@ GstSdp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
> >
> >     --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> >     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> >                     --library=libgstsdp-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >     @@ -138,10 +140,10 @@ index a90f30b..0e149b8 100644
> >                     --pkg-export gstreamer-sdp-@GST_API_VERSION@ \
> >                     --output $@ \
> >      diff --git a/gst-libs/gst/tag/Makefile.am
> >     b/gst-libs/gst/tag/Makefile.am
> >     -index c534a4d..cafafd3 100644
> >     +index 0247c33..c86515b 100644
> >      --- a/gst-libs/gst/tag/Makefile.am
> >      +++ b/gst-libs/gst/tag/Makefile.am
> >     -@@ -45,7 +45,7 @@ GstTag-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
> >     +@@ -66,7 +66,7 @@ GstTag-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
> >                     --library=libgsttag-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     @@ -151,10 +153,10 @@ index c534a4d..cafafd3 100644
> >                     --pkg gstreamer-base-@GST_API_VERSION@ \
> >                     --pkg-export gstreamer-tag-@GST_API_VERSION@ \
> >      diff --git a/gst-libs/gst/video/Makefile.am
> >     b/gst-libs/gst/video/Makefile.am
> >     -index 5d31fa1..ac64eb3 100644
> >     +index 9fc1ccf..0f8455f 100644
> >      --- a/gst-libs/gst/video/Makefile.am
> >      +++ b/gst-libs/gst/video/Makefile.am
> >     -@@ -116,7 +116,7 @@ GstVideo-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
> >     +@@ -124,7 +124,7 @@ GstVideo-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
> >                     --library=libgstvideo-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     @@ -163,6 +165,3 @@ index 5d31fa1..ac64eb3 100644
> >                     --pkg gstreamer-@GST_API_VERSION@ \
> >                     --pkg gstreamer-base-@GST_API_VERSION@ \
> >                     --pkg-export gstreamer-video-@GST_API_VERSION@ \
> >     ---
> >     -2.6.2
> >     -
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_
> CFLAGS-to-CFLAGS.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_
> CFLAGS-to-CFLAGS.patch
> >     new file mode 100644
> >     index 0000000000..251dc172cb
> >     --- /dev/null
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_
> CFLAGS-to-CFLAGS.patch
> >     @@ -0,0 +1,29 @@
> >     +From 61a672e79c8cb1aeeeda4c968997c577ac73a8f3 Mon Sep 17 00:00:00
> 2001
> >     +From: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +Date: Fri, 12 May 2017 16:47:12 +0300
> >     +Subject: [PATCH] gstreamer-gl.pc.in <http://gstreamer-gl.pc.in>:
> >     don't append GL_CFLAGS to CFLAGS
> >     +
> >     +Dependencies' include directories should not be added in this way;
> >     +it causes problems when cross-compiling in sysroot environments.
> >     +
> >     +Upstream-Status: Pending
> >     +
> >     +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +Signed-off-by: Maxin B. John <maxin.john@intel.com
> >     <mailto:maxin.john@intel.com>>
> >     +---
> >     + pkgconfig/gstreamer-gl.pc.in <http://gstreamer-gl.pc.in> | 2 +-
> >     + 1 file changed, 1 insertion(+), 1 deletion(-)
> >     +
> >     +diff --git a/pkgconfig/gstreamer-gl.pc.in
> >     <http://gstreamer-gl.pc.in> b/pkgconfig/gstreamer-gl.pc.in
> >     <http://gstreamer-gl.pc.in>
> >     +index dc672a9..8c290ba 100644
> >     +--- a/pkgconfig/gstreamer-gl.pc.in <http://gstreamer-gl.pc.in>
> >     ++++ b/pkgconfig/gstreamer-gl.pc.in <http://gstreamer-gl.pc.in>
> >     +@@ -13,4 +13,4 @@ Version: @VERSION@
> >     + Requires: gstreamer-video-@GST_API_VERSION@
> >     gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
> >     +
> >     + Libs: -L${libdir} -lgstgl-@GST_API_VERSION@
> >     +-Cflags: -I${includedir}
> >     -I${libdir}/gstreamer-@GST_API_VERSION@/include @GL_CFLAGS@
> >     ++Cflags: -I${includedir}
> >     -I${libdir}/gstreamer-@GST_API_VERSION@/include
> >     +--
> >     +2.7.4
> >     +
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-
> with-PKG_CONF.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-
> with-PKG_CONF.patch
> >     index 6616e2cf0d..dc15d93eb0 100644
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-
> with-PKG_CONF.patch
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-
> with-PKG_CONF.patch
> >     @@ -1,16 +1,17 @@
> >     -From 990b653c7b6de1937ec759019982d6c5f15770f7 Mon Sep 17 00:00:00
> 2001
> >     +From f523721e453febfb3f62f3ba1e9fefb31dcec471 Mon Sep 17 00:00:00
> 2001
> >      From: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     -Date: Mon, 26 Oct 2015 16:38:18 +0200
> >     -Subject: [PATCH 2/4] Makefile.am: prefix calls to pkg-config with
> >     +Date: Thu, 5 Apr 2018 10:26:25 +0800
> >     +Subject: [PATCH] Makefile.am: prefix calls to pkg-config with
> >       PKG_CONFIG_SYSROOT_DIR
> >
> >      Upstream-Status: Pending [review on oe-core maillist]
> >      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
> >     <mailto:anuj.mittal@intel.com>>
> >     +
> >      ---
> >       gst-libs/gst/allocators/Makefile.am |  4 ++--
> >       gst-libs/gst/app/Makefile.am        |  4 ++--
> >       gst-libs/gst/audio/Makefile.am      | 12 ++++++------
> >     - gst-libs/gst/fft/Makefile.am        |  4 ++--
> >       gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
> >       gst-libs/gst/riff/Makefile.am       |  8 ++++----
> >       gst-libs/gst/rtp/Makefile.am        |  8 ++++----
> >     @@ -18,13 +19,13 @@ Signed-off-by: Alexander Kanavin
> >     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>
> >       gst-libs/gst/sdp/Makefile.am        |  4 ++--
> >       gst-libs/gst/tag/Makefile.am        |  8 ++++----
> >       gst-libs/gst/video/Makefile.am      |  8 ++++----
> >     - 11 files changed, 38 insertions(+), 38 deletions(-)
> >     + 10 files changed, 36 insertions(+), 36 deletions(-)
> >
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/allocators/
> Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
> >     -@@ -36,7 +36,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(I
> >     +diff --git a/gst-libs/gst/allocators/Makefile.am
> >     b/gst-libs/gst/allocators/Makefile.am
> >     +index 1ecc950..d6417ac 100644
> >     +--- a/gst-libs/gst/allocators/Makefile.am
> >     ++++ b/gst-libs/gst/allocators/Makefile.am
> >     +@@ -39,7 +39,7 @@ GstAllocators-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstallocators-@
> >                     --c-include "gst/allocators/allocators.h" \
> >                     -I$(top_srcdir)/gst-libs \
> >                     -I$(top_builddir)/gst-libs \
> >     @@ -33,7 +34,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
> >                     --library=libgstallocators-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --libtool="$(LIBTOOL)" \
> >     -@@ -60,7 +60,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     +@@ -63,7 +63,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
> >                     $(INTROSPECTION_COMPILER) \
> >                     --includedir=$(srcdir) \
> >                     --includedir=$(builddir) \
> >     @@ -42,11 +43,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
> >                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> >
> >       CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/app/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
> >     -@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPE
> >     +diff --git a/gst-libs/gst/app/Makefile.am
> >     b/gst-libs/gst/app/Makefile.am
> >     +index 5bfd606..6441674 100644
> >     +--- a/gst-libs/gst/app/Makefile.am
> >     ++++ b/gst-libs/gst/app/Makefile.am
> >     +@@ -51,8 +51,8 @@ GstApp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
> >                     --c-include "gst/app/app.h" \
> >                     -I$(top_srcdir)/gst-libs \
> >                     -I$(top_builddir)/gst-libs \
> >     @@ -57,11 +58,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
> >                     --library=libgstapp-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/audio/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
> >     -@@ -167,12 +167,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROS
> >     +diff --git a/gst-libs/gst/audio/Makefile.am
> >     b/gst-libs/gst/audio/Makefile.am
> >     +index 7fb65f2..5379f79 100644
> >     +--- a/gst-libs/gst/audio/Makefile.am
> >     ++++ b/gst-libs/gst/audio/Makefile.am
> >     +@@ -174,12 +174,12 @@ GstAudio-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
> >                     -I$(top_srcdir)/gst-libs \
> >                     -I$(top_builddir)/gst-libs \
> >                     --c-include "gst/audio/audio.h" \
> >     @@ -78,7 +79,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
> >                     --library-path="$(top_builddir)/gst-libs/gst/tag/" \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     -@@ -201,8 +201,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     +@@ -208,8 +208,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.
> typelib)
> >                     --includedir=$(srcdir) \
> >                     --includedir=$(builddir) \
> >                     --includedir="$(top_builddir)/gst-libs/gst/tag/" \
> >     @@ -89,33 +90,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
> >                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> >
> >       CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/fft/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
> >     -@@ -63,7 +63,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPE
> >     -               --c-include "gst/fft/fft.h" \
> >     -               -I$(top_srcdir)/gst-libs \
> >     -               -I$(top_builddir)/gst-libs \
> >     --
> >     --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> >     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> >     -+
> >     --add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_
> CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> >     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> >     -               --library=libgstfft-@GST_API_VERSION@.la \
> >     -               --include=Gst-@GST_API_VERSION@ \
> >     -               --libtool="$(LIBTOOL)" \
> >     -@@ -87,7 +87,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     -               $(INTROSPECTION_COMPILER) \
> >     -               --includedir=$(srcdir) \
> >     -               --includedir=$(builddir) \
> >     --
> >     --includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG)
> >     --variable=girdir gstreamer-@GST_API_VERSION@` \
> >     -+
> >     --includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="
> $(GST_PKG_CONFIG_PATH)"
> >     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> >     -               $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> >     -
> >     - CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/pbutils/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
> >     -@@ -85,14 +85,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTR
> >     +diff --git a/gst-libs/gst/pbutils/Makefile.am
> >     b/gst-libs/gst/pbutils/Makefile.am
> >     +index 35a6e44..49d6894 100644
> >     +--- a/gst-libs/gst/pbutils/Makefile.am
> >     ++++ b/gst-libs/gst/pbutils/Makefile.am
> >     +@@ -88,14 +88,14 @@ GstPbutils-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
> >                     --c-include "gst/pbutils/pbutils.h" \
> >                     -I$(top_srcdir)/gst-libs \
> >                     -I$(top_builddir)/gst-libs \
> >     @@ -134,7 +113,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
> >                     --library-path="$(top_builddir)/gst-libs/gst/tag/" \
> >                     --library-path="$(top_builddir)/gst-libs/gst/video/"
> \
> >                     --library-path="$(top_builddir)/gst-libs/gst/audio/"
> \
> >     -@@ -125,8 +125,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     +@@ -128,8 +128,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.
> typelib)
> >                     $(INTROSPECTION_COMPILER) \
> >                     --includedir=$(srcdir) \
> >                     --includedir=$(builddir) \
> >     @@ -145,11 +124,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
> >                     --includedir="$(top_builddir)/gst-libs/gst/tag/" \
> >                     --includedir="$(top_builddir)/gst-libs/gst/video/" \
> >                     --includedir="$(top_builddir)/gst-libs/gst/audio/" \
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/riff/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
> >     -@@ -42,8 +42,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS
> >     +diff --git a/gst-libs/gst/riff/Makefile.am
> >     b/gst-libs/gst/riff/Makefile.am
> >     +index e66ef4f..c8c588a 100644
> >     +--- a/gst-libs/gst/riff/Makefile.am
> >     ++++ b/gst-libs/gst/riff/Makefile.am
> >     +@@ -43,8 +43,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> >     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
> >       #             --c-include "gst/riff/riff.h" \
> >       #             --add-include-path=$(builddir)/../tag \
> >       #             --add-include-path=$(builddir)/../audio \
> >     @@ -160,7 +139,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
> >       #             --library=libgstriff-@GST_API_VERSION@.la \
> >       #             --include=GstAudio-@GST_API_VERSION@ \
> >       #             --include=GstTag-@GST_API_VERSION@ \
> >     -@@ -74,8 +74,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS
> >     +@@ -75,8 +75,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> >     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
> >       #             --includedir=$(builddir) \
> >       #             --includedir=$(builddir)/../tag \
> >       #             --includedir=$(builddir)/../audio \
> >     @@ -171,11 +150,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
> >       #             $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> >       #
> >       #CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/rtp/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
> >     -@@ -61,8 +61,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPE
> >     +diff --git a/gst-libs/gst/rtp/Makefile.am
> >     b/gst-libs/gst/rtp/Makefile.am
> >     +index 77ebeeb..9aee788 100644
> >     +--- a/gst-libs/gst/rtp/Makefile.am
> >     ++++ b/gst-libs/gst/rtp/Makefile.am
> >     +@@ -64,8 +64,8 @@ GstRtp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
> >                     --c-include "gst/rtp/rtp.h" \
> >                     -I$(top_builddir)/gst-libs \
> >                     -I$(top_srcdir)/gst-libs \
> >     @@ -186,7 +165,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
> >                     --library=libgstrtp-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     -@@ -89,8 +89,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     +@@ -92,8 +92,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
> >                     $(INTROSPECTION_COMPILER) \
> >                     --includedir=$(srcdir) \
> >                     --includedir=$(builddir) \
> >     @@ -197,11 +176,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
> >                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> >
> >       CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/rtsp/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
> >     -@@ -68,7 +68,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSP
> >     +diff --git a/gst-libs/gst/rtsp/Makefile.am
> >     b/gst-libs/gst/rtsp/Makefile.am
> >     +index db9d0fd..79027cb 100644
> >     +--- a/gst-libs/gst/rtsp/Makefile.am
> >     ++++ b/gst-libs/gst/rtsp/Makefile.am
> >     +@@ -71,7 +71,7 @@ GstRtsp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
> >                     -I$(top_builddir)/gst-libs \
> >                     -I$(top_srcdir)/gst-libs \
> >                     --add-include-path=$(builddir)/../sdp \
> >     @@ -210,7 +189,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
> >                     --library=libgstrtsp-@GST_API_VERSION@.la \
> >                     --include=Gio-2.0 \
> >                     --include=Gst-@GST_API_VERSION@ \
> >     -@@ -98,7 +98,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     +@@ -101,7 +101,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.
> typelib)
> >                     --includedir=$(srcdir) \
> >                     --includedir=$(builddir) \
> >                     --includedir=$(builddir)/../sdp \
> >     @@ -219,11 +198,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
> >                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> >
> >       CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/sdp/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
> >     -@@ -30,7 +30,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPE
> >     +diff --git a/gst-libs/gst/sdp/Makefile.am
> >     b/gst-libs/gst/sdp/Makefile.am
> >     +index 6e05cc7..c7cf514 100644
> >     +--- a/gst-libs/gst/sdp/Makefile.am
> >     ++++ b/gst-libs/gst/sdp/Makefile.am
> >     +@@ -31,7 +31,7 @@ GstSdp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
> >                     --warn-all \
> >                     --c-include "gst/sdp/sdp.h" \
> >                     -I$(top_srcdir)/gst-libs \
> >     @@ -232,7 +211,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
> >                     --library=libgstsdp-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --libtool="$(LIBTOOL)" \
> >     -@@ -54,7 +54,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     +@@ -55,7 +55,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
> >                     $(INTROSPECTION_COMPILER) \
> >                     --includedir=$(srcdir) \
> >                     --includedir=$(builddir) \
> >     @@ -241,11 +220,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
> >                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> >
> >       CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/tag/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
> >     -@@ -59,8 +59,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPE
> >     +diff --git a/gst-libs/gst/tag/Makefile.am
> >     b/gst-libs/gst/tag/Makefile.am
> >     +index c86515b..363e6d2 100644
> >     +--- a/gst-libs/gst/tag/Makefile.am
> >     ++++ b/gst-libs/gst/tag/Makefile.am
> >     +@@ -61,8 +61,8 @@ GstTag-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
> >                     --c-include "gst/tag/tag.h" \
> >                     -I$(top_srcdir)/gst-libs \
> >                     -I$(top_builddir)/gst-libs \
> >     @@ -256,7 +235,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
> >                     --library=libgsttag-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     -@@ -87,8 +87,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     +@@ -89,8 +89,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
> >                     $(INTROSPECTION_COMPILER) \
> >                     --includedir=$(srcdir) \
> >                     --includedir=$(builddir) \
> >     @@ -267,11 +246,11 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
> >                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> >
> >       CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
> >     -Index: gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
> >     -===================================================================
> >     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/video/Makefile.am
> >     -+++ gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
> >     -@@ -116,8 +116,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROS
> >     +diff --git a/gst-libs/gst/video/Makefile.am
> >     b/gst-libs/gst/video/Makefile.am
> >     +index 0f8455f..8c9955c 100644
> >     +--- a/gst-libs/gst/video/Makefile.am
> >     ++++ b/gst-libs/gst/video/Makefile.am
> >     +@@ -119,8 +119,8 @@ GstVideo-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
> >                     --c-include "gst/video/video.h" \
> >                     -I$(top_srcdir)/gst-libs \
> >                     -I$(top_builddir)/gst-libs \
> >     @@ -282,7 +261,7 @@ Index:
> >     gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
> >                     --library=libgstvideo-@GST_API_VERSION@.la \
> >                     --include=Gst-@GST_API_VERSION@ \
> >                     --include=GstBase-@GST_API_VERSION@ \
> >     -@@ -144,8 +144,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
> >     +@@ -147,8 +147,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.
> typelib)
> >                     $(INTROSPECTION_COMPILER) \
> >                     --includedir=$(srcdir) \
> >                     --includedir=$(builddir) \
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-riff-add-missing-include-directories-
> when-calling-in.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-riff-add-missing-include-directories-
> when-calling-in.patch
> >     index 9b66f7f49d..98ffdb1c10 100644
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-riff-add-missing-include-directories-
> when-calling-in.patch
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-riff-add-missing-include-directories-
> when-calling-in.patch
> >     @@ -1,20 +1,21 @@
> >     -From 3c2c2d5dd08aa30ed0e8acd8566ec99412bb8209 Mon Sep 17 00:00:00
> 2001
> >     +From b9765efb1696e3e2e79f2955f759be199fe34882 Mon Sep 17 00:00:00
> 2001
> >      From: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >      Date: Mon, 26 Oct 2015 17:29:37 +0200
> >     -Subject: [PATCH 3/4] riff: add missing include directories when
> calling
> >     +Subject: [PATCH] riff: add missing include directories when calling
> >       introspection scanner
> >
> >      Upstream-Status: Pending [review on oe-core maillist]
> >      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +
> >      ---
> >       gst-libs/gst/riff/Makefile.am | 2 ++
> >       1 file changed, 2 insertions(+)
> >
> >      diff --git a/gst-libs/gst/riff/Makefile.am
> >     b/gst-libs/gst/riff/Makefile.am
> >     -index 0a115cc..5057a58 100644
> >     +index c8c588a..c096453 100644
> >      --- a/gst-libs/gst/riff/Makefile.am
> >      +++ b/gst-libs/gst/riff/Makefile.am
> >     -@@ -39,6 +39,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> >     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
> >     +@@ -41,6 +41,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
> >     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
> >       #             --strip-prefix=Gst \
> >       #             --warn-all \
> >       #             --c-include "gst/riff/riff.h" \
> >     @@ -23,6 +24,3 @@ index 0a115cc..5057a58 100644
> >       #             --add-include-path=$(builddir)/../tag \
> >       #             --add-include-path=$(builddir)/../audio \
> >       #
> >      --add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_
> CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
> >     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
> >     ---
> >     -2.6.2
> >     -
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> >     index 9fbebd5700..9e95524057 100644
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> >     @@ -1,7 +1,7 @@
> >     -From be6163cfa3a255493f9d75bad9541cbfe1723fee Mon Sep 17 00:00:00
> 2001
> >     +From 918c96b24d10f61b7455b4cef3bab490849d0d77 Mon Sep 17 00:00:00
> 2001
> >      From: Mingke Wang <mingke.wang@freescale.com
> >     <mailto:mingke.wang@freescale.com>>
> >      Date: Thu, 19 Mar 2015 14:17:10 +0800
> >     -Subject: [PATCH 3/4] ssaparse: enhance SSA text lines parsing.
> >     +Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
> >
> >      some parser will pass in the original ssa text line which starts
> >     with "Dialog:"
> >      and there's are maybe multiple Dialog lines in one input buffer.
> >     @@ -10,13 +10,18 @@ Upstream-Status: Submitted
> >     [https://bugzilla.gnome.org/show_bug.cgi?id=747496
> >     <https://bugzilla.gnome.org/show_bug.cgi?id=747496>]
> >
> >      Signed-off-by: Mingke Wang <mingke.wang@freescale.com
> >     <mailto:mingke.wang@freescale.com>>
> >
> >     +---
> >     + gst/subparse/gstssaparse.c | 150
> >     ++++++++++++++++++++++++++++++++++++++++-----
> >     + 1 file changed, 134 insertions(+), 16 deletions(-)
> >     + mode change 100644 => 100755 gst/subparse/gstssaparse.c
> >     +
> >      diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
> >      old mode 100644
> >      new mode 100755
> >     -index 06ecef9..0ab5dce
> >     +index c849c08..4b9636c
> >      --- a/gst/subparse/gstssaparse.c
> >      +++ b/gst/subparse/gstssaparse.c
> >     -@@ -260,6 +260,7 @@ gst_ssa_parse_remove_override_codes
> >     (GstSsaParse * parse, gchar * txt)
> >     +@@ -262,6 +262,7 @@ gst_ssa_parse_remove_override_codes
> >     (GstSsaParse * parse, gchar * txt)
> >        * gst_ssa_parse_push_line:
> >        * @parse: caller element
> >        * @txt: text to push
> >     @@ -24,7 +29,7 @@ index 06ecef9..0ab5dce
> >        * @start: timestamp for the buffer
> >        * @duration: duration for the buffer
> >        *
> >     -@@ -269,27 +270,133 @@ gst_ssa_parse_remove_override_codes
> >     (GstSsaParse * parse, gchar * txt)
> >     +@@ -271,27 +272,133 @@ gst_ssa_parse_remove_override_codes
> >     (GstSsaParse * parse, gchar * txt)
> >        * Returns: result of the push of the created buffer
> >        */
> >       static GstFlowReturn
> >     @@ -169,7 +174,7 @@ index 06ecef9..0ab5dce
> >         GST_LOG_OBJECT (parse, "Text : %s", t);
> >
> >         if (gst_ssa_parse_remove_override_codes (parse, t)) {
> >     -@@ -307,13 +414,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse,
> >     gchar * txt,
> >     +@@ -309,13 +416,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse,
> >     gchar * txt,
> >         gst_buffer_fill (buf, 0, escaped, len + 1);
> >         gst_buffer_set_size (buf, len);
> >         g_free (escaped);
> >     @@ -196,7 +201,7 @@ index 06ecef9..0ab5dce
> >
> >         ret = gst_pad_push (parse->srcpad, buf);
> >
> >     -@@ -333,6 +449,7 @@ gst_ssa_parse_chain (GstPad * sinkpad,
> >     GstObject * parent, GstBuffer * buf)
> >     +@@ -335,6 +451,7 @@ gst_ssa_parse_chain (GstPad * sinkpad,
> >     GstObject * parent, GstBuffer * buf)
> >         GstClockTime ts;
> >         gchar *txt;
> >         GstMapInfo map;
> >     @@ -204,7 +209,7 @@ index 06ecef9..0ab5dce
> >
> >         if (G_UNLIKELY (!parse->framed))
> >           goto not_framed;
> >     -@@ -350,13 +467,14 @@ gst_ssa_parse_chain (GstPad * sinkpad,
> >     GstObject * parent, GstBuffer * buf)
> >     +@@ -352,13 +469,14 @@ gst_ssa_parse_chain (GstPad * sinkpad,
> >     GstObject * parent, GstBuffer * buf)
> >         /* make double-sure it's 0-terminated and all */
> >         gst_buffer_map (buf, &map, GST_MAP_READ);
> >         txt = g_strndup ((gchar *) map.data, map.size);
> >     @@ -220,6 +225,3 @@ index 06ecef9..0ab5dce
> >
> >         if (ret != GST_FLOW_OK && GST_CLOCK_TIME_IS_VALID (ts)) {
> >           GstSegment segment;
> >     ---
> >     -1.7.9.5
> >     -
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-rtsp-drop-incorrect-reference-to-
> gstreamer-sdp-in-Ma.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-rtsp-drop-incorrect-reference-to-
> gstreamer-sdp-in-Ma.patch
> >     index 4adf605460..aaeb611fec 100644
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-rtsp-drop-incorrect-reference-to-
> gstreamer-sdp-in-Ma.patch
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-rtsp-drop-incorrect-reference-to-
> gstreamer-sdp-in-Ma.patch
> >     @@ -1,20 +1,21 @@
> >     -From 4330915d88dc4dd46eb4c28d756482b767c2747f Mon Sep 17 00:00:00
> 2001
> >     +From 53b5868491cf99ee797192395dbfeb69df23edd2 Mon Sep 17 00:00:00
> 2001
> >      From: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >      Date: Mon, 26 Oct 2015 17:30:14 +0200
> >     -Subject: [PATCH 4/4] rtsp: drop incorrect reference to
> gstreamer-sdp in
> >     +Subject: [PATCH] rtsp: drop incorrect reference to gstreamer-sdp in
> >       Makefile.am
> >
> >      Upstream-Status: Pending [review on oe-core maillist]
> >      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +
> >      ---
> >       gst-libs/gst/rtsp/Makefile.am | 1 -
> >       1 file changed, 1 deletion(-)
> >
> >      diff --git a/gst-libs/gst/rtsp/Makefile.am
> >     b/gst-libs/gst/rtsp/Makefile.am
> >     -index 4f6d9f8..0afa370 100644
> >     +index 79027cb..2987e23 100644
> >      --- a/gst-libs/gst/rtsp/Makefile.am
> >      +++ b/gst-libs/gst/rtsp/Makefile.am
> >     -@@ -75,7 +75,6 @@ GstRtsp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
> >     +@@ -79,7 +79,6 @@ GstRtsp-@GST_API_VERSION@.gir:
> >     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
> >                     --libtool="$(LIBTOOL)" \
> >                     --pkg gio-2.0 \
> >                     --pkg gstreamer-@GST_API_VERSION@ \
> >     @@ -22,6 +23,3 @@ index 4f6d9f8..0afa370 100644
> >                     --pkg-export gstreamer-rtsp-@GST_API_VERSION@ \
> >                     --add-init-section="$(INTROSPECTION_INIT)" \
> >                     --output $@ \
> >     ---
> >     -2.6.2
> >     -
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-subparse-set-need_segment-after-sink-
> pad-received-GS.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-subparse-set-need_segment-after-sink-
> pad-received-GS.patch
> >     deleted file mode 100644
> >     index b924e38824..0000000000
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0004-subparse-set-need_segment-after-sink-
> pad-received-GS.patch
> >     +++ /dev/null
> >     @@ -1,69 +0,0 @@
> >     -From ed09c8fd2c9c2b5384b72cc70af3728be6694e64 Mon Sep 17 00:00:00
> 2001
> >     -From: Mingke Wang <mingke.wang@freescale.com
> >     <mailto:mingke.wang@freescale.com>>
> >     -Date: Thu, 19 Mar 2015 14:20:26 +0800
> >     -Subject: [PATCH 4/4] subparse: set need_segment after sink pad
> received
> >     - GST_EVENT_SEGMENT
> >     -
> >     -subparse works in push mode, chain funciton will be called once
> >     -up stream element finished the seeking and flushing.
> >     -if set need_segment flag in src pad event handler, the segment
> >     -event will be pushed earlier, result in the subtitle text will
> >     -be send out to down stream from the beginning.
> >     -
> >     -Upstream-Status: Submitted
> >     [https://bugzilla.gnome.org/show_bug.cgi?id=747498
> >     <https://bugzilla.gnome.org/show_bug.cgi?id=747498>]
> >     -
> >     -Signed-off-by: Mingke Wang <mingke.wang@freescale.com
> >     <mailto:mingke.wang@freescale.com>>
> >     -
> >     -diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c
> >     -old mode 100644
> >     -new mode 100755
> >     -index b565e93..7741ccc
> >     ---- a/gst/subparse/gstsubparse.c
> >     -+++ b/gst/subparse/gstsubparse.c
> >     -@@ -266,22 +266,20 @@ gst_sub_parse_src_event (GstPad * pad,
> >     GstObject * parent, GstEvent * event)
> >     -         goto beach;
> >     -       }
> >     -
> >     -+      /* Apply the seek to our segment */
> >     -+      gst_segment_do_seek (&self->segment, rate, format, flags,
> >     -+          start_type, start, stop_type, stop, &update);
> >     -+
> >     -+      GST_DEBUG_OBJECT (self, "segment after seek: %"
> >     GST_SEGMENT_FORMAT,
> >     -+          &self->segment);
> >     -+
> >     -       /* Convert that seek to a seeking in bytes at position 0,
> >     -          FIXME: could use an index */
> >     -       ret = gst_pad_push_event (self->sinkpad,
> >     -           gst_event_new_seek (rate, GST_FORMAT_BYTES, flags,
> >     -               GST_SEEK_TYPE_SET, 0, GST_SEEK_TYPE_NONE, 0));
> >     -
> >     --      if (ret) {
> >     --        /* Apply the seek to our segment */
> >     --        gst_segment_do_seek (&self->segment, rate, format, flags,
> >     --            start_type, start, stop_type, stop, &update);
> >     --
> >     --        GST_DEBUG_OBJECT (self, "segment after seek: %"
> >     GST_SEGMENT_FORMAT,
> >     --            &self->segment);
> >     --
> >     --        self->need_segment = TRUE;
> >     --      } else {
> >     -+      if (!ret) {
> >     -         GST_WARNING_OBJECT (self, "seek to 0 bytes failed");
> >     -       }
> >     -
> >     -@@ -1641,8 +1639,10 @@ gst_sub_parse_sink_event (GstPad * pad,
> >     GstObject * parent, GstEvent * event)
> >     -       gst_event_parse_segment (event, &s);
> >     -       if (s->format == GST_FORMAT_TIME)
> >     -         gst_event_copy_segment (event, &self->segment);
> >     --      GST_DEBUG_OBJECT (self, "newsegment (%s)",
> >     --          gst_format_get_name (self->segment.format));
> >     -+      GST_DEBUG_OBJECT (self, "newsegment (%s) %"
> GST_SEGMENT_FORMAT,
> >     -+          gst_format_get_name (self->segment.format),
> &self->segment);
> >     -+
> >     -+      self->need_segment = TRUE;
> >     -
> >     -       /* if not time format, we'll either start with a 0 timestamp
> >     anyway or
> >     -        * it's following a seek in which case we'll have saved the
> >     requested
> >     ---
> >     -1.7.9.5
> >     -
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0009-glimagesink-Downrank-to-marginal.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0009-glimagesink-Downrank-to-marginal.patch
> >     new file mode 100644
> >     index 0000000000..c81fb0f6aa
> >     --- /dev/null
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/0009-glimagesink-Downrank-to-marginal.patch
> >     @@ -0,0 +1,32 @@
> >     +From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00
> 2001
> >     +From: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +Date: Thu, 24 Sep 2015 19:47:32 +0300
> >     +Subject: [PATCH] glimagesink: Downrank to marginal
> >     +
> >     +On desktop, where there is good OpenGL, xvimagesink will come up
> first,
> >     +on other platforms, OpenGL can't be trusted because it's either
> >     software (like
> >     +in a VM) or broken (like on embedded)., so let ximagesink come
> above.
> >     +
> >     +Upstream-Status: Submitted
> >     [https://bugzilla.gnome.org/show_bug.cgi?id=751684
> >     <https://bugzilla.gnome.org/show_bug.cgi?id=751684>]
> >     +
> >     +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     +---
> >     + ext/gl/gstopengl.c | 2 +-
> >     + 1 file changed, 1 insertion(+), 1 deletion(-)
> >     +
> >     +diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
> >     +index a4b2540..0ccaacd 100644
> >     +--- a/ext/gl/gstopengl.c
> >     ++++ b/ext/gl/gstopengl.c
> >     +@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugin)
> >     + #endif
> >     +
> >     +   if (!gst_element_register (plugin, "glimagesink",
> >     +-          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
> >     ++          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
> >     +     return FALSE;
> >     +   }
> >     +
> >     +--
> >     +2.1.4
> >     +
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/get-caps-from-src-pad-when-query-caps.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/get-caps-from-src-pad-when-query-caps.patch
> >     index c8e6287a55..a4727e23ea 100644
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/get-caps-from-src-pad-when-query-caps.patch
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/get-caps-from-src-pad-when-query-caps.patch
> >     @@ -1,4 +1,4 @@
> >     -From af0dac26f62aaceb4bf266720911953793e0fc5d Mon Sep 17 00:00:00
> 2001
> >     +From 41de2ec64ab06bb58c82c1659adaa3811bc5bcf8 Mon Sep 17 00:00:00
> 2001
> >      From: zhouming <b42586@freescale.com <mailto:b42586@freescale.com>>
> >      Date: Wed, 14 May 2014 10:16:20 +0800
> >      Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
> >     @@ -8,18 +8,19 @@ https://bugzilla.gnome.org/show_bug.cgi?id=728312
> >     <https://bugzilla.gnome.org/show_bug.cgi?id=728312>
> >      Upstream-Status: Pending
> >
> >      Signed-off-by: zhouming <b42586@freescale.com
> >     <mailto:b42586@freescale.com>>
> >     +
> >      ---
> >     - gst-libs/gst/tag/gsttagdemux.c |   13 +++++++++++++
> >     + gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
> >       1 file changed, 13 insertions(+)
> >       mode change 100644 => 100755 gst-libs/gst/tag/gsttagdemux.c
> >
> >      diff --git a/gst-libs/gst/tag/gsttagdemux.c
> >     b/gst-libs/gst/tag/gsttagdemux.c
> >      old mode 100644
> >      new mode 100755
> >     -index 9b6c478..ae2294a
> >     +index 8a127c8..71c5d78
> >      --- a/gst-libs/gst/tag/gsttagdemux.c
> >      +++ b/gst-libs/gst/tag/gsttagdemux.c
> >     -@@ -1769,6 +1769,19 @@ gst_tag_demux_pad_query (GstPad * pad,
> >     GstObject * parent, GstQuery * query)
> >     +@@ -1759,6 +1759,19 @@ gst_tag_demux_pad_query (GstPad * pad,
> >     GstObject * parent, GstQuery * query)
> >             }
> >             break;
> >           }
> >     @@ -39,6 +40,3 @@ index 9b6c478..ae2294a
> >           default:
> >             res = gst_pad_query_default (pad, parent, query);
> >             break;
> >     ---
> >     -1.7.9.5
> >     -
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/link-with-libvchostif.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/link-with-libvchostif.patch
> >     new file mode 100644
> >     index 0000000000..d5a7f6bdc2
> >     --- /dev/null
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/link-with-libvchostif.patch
> >     @@ -0,0 +1,45 @@
> >     +From 9866f51e5e0913f1e453eb574618bf7432f38cb6 Mon Sep 17 00:00:00
> 2001
> >     +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> >     +Date: Wed, 11 Apr 2018 10:46:33 +0800
> >     +Subject: [PATCH] Add -lvchostif to link when using -lEGL on rpi
> >     +
> >     +This is required because libEGL from userland uses sybols
> >     +from this library.
> >     +
> >     +lib/libEGL.so.1.0.0
> >
> >
> >                                           121: 00000000     0 FUNC
> >     GLOBAL DEFAULT  UND vc_dispmanx_element_add
> >     +  1552: 00000000     0 FUNC    GLOBAL DEFAULT  UND
> >     vc_dispmanx_element_add
> >     +
> >     +These symbols are provided by libvchostif as seen below
> >     +
> >     +lib/libvchostif.so
> >     +   252: 0000b161   192 FUNC    GLOBAL DEFAULT    9
> >     vc_dispmanx_element_add
> >     +   809: 0000b161   192 FUNC    GLOBAL DEFAULT    9
> >     vc_dispmanx_element_add
> >     +
> >     +With this explicit link, plugins fail during runtime
> >     +
> >     +(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load
> >     plugin '/usr/lib/gstreamer-1.0/libgstomx.so': Error relocating
> >     /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
> >     +(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load
> >     plugin '/usr/lib/gstreamer-1.0/libgstopengl.so': Error relocating
> >     /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
> >     +
> >     +Upstream-Status: Pending
> >     +Signed-off-by: Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>>
> >     +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
> >     <mailto:anuj.mittal@intel.com>>
> >     +---
> >     + m4/gst-gl.m4 | 2 +-
> >     + 1 file changed, 1 insertion(+), 1 deletion(-)
> >     +
> >     +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
> >     +index 1e97240..ab7774c 100644
> >     +--- a/m4/gst-gl.m4
> >     ++++ b/m4/gst-gl.m4
> >     +@@ -231,7 +231,7 @@ case $host in
> >     +                             HAVE_EGL=yes
> >     +                             HAVE_GLES2=yes
> >     +                             HAVE_EGL_RPI=yes
> >     +-                            EGL_LIBS="-lbcm_host -lvcos
> -lvchiq_arm"
> >     ++                            EGL_LIBS="-lbcm_host -lvchostif -lvcos
> >     -lvchiq_arm"
> >     +                             EGL_CFLAGS=""
> >     +                             AC_DEFINE(USE_EGL_RPI, [1], [Use RPi
> >     platform])
> >     +                           ])
> >     +--
> >     +2.7.4
> >     +
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/make-gio_unix_2_0-dependency-configurable.patch
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/make-gio_unix_2_0-dependency-configurable.patch
> >     index 413eff0695..23950b67f2 100644
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/make-gio_unix_2_0-dependency-configurable.patch
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base/make-gio_unix_2_0-dependency-configurable.patch
> >     @@ -1,4 +1,4 @@
> >     -From 10d2a977ee1d469f0bf9059bb2d0b55fd2eecbac Mon Sep 17 00:00:00
> 2001
> >     +From 7ffa6e3d00e1d8a060f3f4c2bb9a72691af05d79 Mon Sep 17 00:00:00
> 2001
> >      From: Andre McCurdy <armccurdy@gmail.com <mailto:
> armccurdy@gmail.com>>
> >      Date: Wed, 20 Jan 2016 13:00:00 -0800
> >      Subject: [PATCH] make gio_unix_2_0 dependency configurable
> >     @@ -17,16 +17,17 @@ instead of AG_GST_CHECK_FEATURE.
> >      Upstream-Status: Pending
> >
> >      Signed-off-by: Andre McCurdy <armccurdy@gmail.com
> >     <mailto:armccurdy@gmail.com>>
> >     +
> >      ---
> >       configure.ac <http://configure.ac> | 7 +++++++
> >       1 file changed, 7 insertions(+)
> >
> >      diff --git a/configure.ac <http://configure.ac> b/configure.ac
> >     <http://configure.ac>
> >     -index 9c52aeb..26cacd6 100644
> >     +index 12807bc..35a0bf3 100644
> >      --- a/configure.ac <http://configure.ac>
> >      +++ b/configure.ac <http://configure.ac>
> >     -@@ -752,9 +752,16 @@ AC_SUBST(FT2_CFLAGS)
> >     - fi dnl of EXT plugins
> >     +@@ -806,9 +806,16 @@ AM_CONDITIONAL(HAVE_PNG, test "x$HAVE_PNG" =
> >     "xyes")
> >     + AM_CONDITIONAL(HAVE_JPEG, test "x$HAVE_JPEG" = "xyes")
> >
> >       dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***
> >      +AC_ARG_ENABLE([gio_unix_2_0],
> >     @@ -42,6 +43,3 @@ index 9c52aeb..26cacd6 100644
> >       AM_CONDITIONAL(USE_GIO_UNIX_2_0, test "x$HAVE_GIO_UNIX_2_0" =
> "xyes")
> >
> >       dnl *** finalize CFLAGS, LDFLAGS, LIBS
> >     ---
> >     -1.9.1
> >     -
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.12.4.bb
> >     <http://gstreamer1.0-plugins-base_1.12.4.bb>
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.12.4.bb
> >     <http://gstreamer1.0-plugins-base_1.12.4.bb>
> >     deleted file mode 100644
> >     index dd895bbcb1..0000000000
> >     ---
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.12.4.bb
> >     <http://gstreamer1.0-plugins-base_1.12.4.bb>
> >     +++ /dev/null
> >     @@ -1,18 +0,0 @@
> >     -require gstreamer1.0-plugins-base.inc
> >     -
> >     -LIC_FILES_CHKSUM =
> >     "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
> >     -
> >     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
> >     -                    file://common/coverage/coverage-report.pl
> >     <http://coverage-report.pl>;beginline=2;endline=17;md5=
> a4e1830fce078028c8f0974161272607"
> >     -
> >     -SRC_URI = " \
> >     -
> >     http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-
> plugins-base-${PV}.tar.xz
> >     <http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-
> plugins-base-${PV}.tar.xz>
> >     \
> >     -    file://get-caps-from-src-pad-when-query-caps.patch \
> >     -    file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
> >     -
> >     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
> \
> >     -    file://make-gio_unix_2_0-dependency-configurable.patch \
> >     -
> >     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> \
> >     -"
> >     -SRC_URI[md5sum] = "b35b04071f69b8ab69a7f3a497ff0131"
> >     -SRC_URI[sha256sum] =
> >     "4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282"
> >     -
> >     -S = "${WORKDIR}/gst-plugins-base-${PV}"
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.14.0.bb
> >     <http://gstreamer1.0-plugins-base_1.14.0.bb>
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.14.0.bb
> >     <http://gstreamer1.0-plugins-base_1.14.0.bb>
> >     new file mode 100644
> >     index 0000000000..370cd0368c
> >     --- /dev/null
> >     +++
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-base_1.14.0.bb
> >     <http://gstreamer1.0-plugins-base_1.14.0.bb>
> >     @@ -0,0 +1,70 @@
> >     +require gstreamer1.0-plugins.inc
> >     +
> >     +LICENSE = "GPLv2+ & LGPLv2+"
> >     +LIC_FILES_CHKSUM =
> >     "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
> >     +
> >     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
> >     +                    file://common/coverage/coverage-report.pl
> >     <http://coverage-report.pl>;beginline=2;endline=17;md5=
> a4e1830fce078028c8f0974161272607"
> >     +
> >     +SRC_URI = " \
> >     +
> >     http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-
> plugins-base-${PV}.tar.xz
> >     <http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-
> plugins-base-${PV}.tar.xz>
> >     \
> >     +            file://get-caps-from-src-pad-when-query-caps.patch \
> >     +            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch
> \
> >     +            file://make-gio_unix_2_0-dependency-configurable.patch
> \
> >     +
> >     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
> \
> >     +
> >     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
> \
> >     +
> >     file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
> \
> >     +
> >     file://0003-riff-add-missing-include-directories-when-calling-in.patch
> \
> >     +
> >     file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
> \
> >     +            file://0009-glimagesink-Downrank-to-marginal.patch \
> >     +
> >     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
> \
> >     +            file://link-with-libvchostif.patch \
> >     +            "
> >     +SRC_URI[md5sum] = "370271327dd23110421a9c2927ac989a"
> >     +SRC_URI[sha256sum] =
> >     "7e904660ff56e02b036cf7fdfb77a50a540828ca9d2614d69ba931772e5b6940"
> >     +
> >     +S = "${WORKDIR}/gst-plugins-base-${PV}"
> >     +
> >     +DEPENDS += "iso-codes util-linux"
> >     +
> >     +inherit gettext
> >     +
> >     +PACKAGES_DYNAMIC =+ "^libgst.*"
> >     +
> >     +PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES',
> >     'opengl', 'gles2 egl', '', d)}"
> >     +PACKAGECONFIG ??= " \
> >     +    ${GSTREAMER_ORC} \
> >     +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
> >     +    gio-unix-2.0 ogg pango theora vorbis zlib jpeg \
> >     +    ${PACKAGECONFIG_GL} \
> >     +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland
> >     egl', '', d)} \
> >     +"
> >     +
> >     +X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
> >     +X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
> >     +X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
> >     +
> >     +PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,
> alsa-lib"
> >     +PACKAGECONFIG[cdparanoia]   =
> >     "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
> >     +PACKAGECONFIG[gio-unix-2.0] =
> >     "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
> >     +PACKAGECONFIG[ivorbis]      =
> >     "--enable-ivorbis,--disable-ivorbis,tremor"
> >     +PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
> >     +PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,
> libopus"
> >     +PACKAGECONFIG[pango]        = "--enable-pango,--disable-
> pango,pango"
> >     +PACKAGECONFIG[theora]       =
> >     "--enable-theora,--disable-theora,libtheora"
> >     +PACKAGECONFIG[visual]       =
> >     "--enable-libvisual,--disable-libvisual,libvisual"
> >     +PACKAGECONFIG[vorbis]       =
> >     "--enable-vorbis,--disable-vorbis,libvorbis"
> >     +PACKAGECONFIG[x11]          =
> >     "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
> >     +PACKAGECONFIG[zlib]         = "--enable-zlib,--disable-zlib,zlib"
> >     +PACKAGECONFIG[opengl]       =
> >     "--enable-opengl,--disable-opengl,virtual/libgl libglu"
> >     +PACKAGECONFIG[gles2]        =
> >     "--enable-gles2,--disable-gles2,virtual/libgles2"
> >     +PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,
> virtual/egl"
> >     +PACKAGECONFIG[wayland]      =
> >     "--enable-wayland,--disable-wayland,wayland-native wayland
> >     wayland-protocols libdrm"
> >     +PACKAGECONFIG[jpeg]         = ",,jpeg"
> >     +
> >     +FILES_${MLPREFIX}libgsttag-1.0 +=
> >     "${datadir}/gst-plugins-base/1.0/license-translations.dict"
> >     +
> >     +do_compile_prepend() {
> >     +        export
> >     GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-
> libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-
> libs/gst/rtp/.libs"
> >     +}
> >     +
> >     +FILES_${PN}-dev +=
> >     "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
> >     --
> >     2.14.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> >
> >
>
>

--0000000000006eef31056b610767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Aha great.=C2=A0 I suspect that you have GStreamer headers=
 on your host already and it&#39;s picking those up?<div><br></div><div>Ros=
s</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 4=
 May 2018 at 14:07, Anuj Mittal <span dir=3D"ltr">&lt;<a href=3D"mailto:anu=
j.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">For some reason, I can&#39;t repro=
duce this, I have g-i enabled. But, it<br>
looks like we need this:<br>
<br>
<a href=3D"https://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?=
h=3D1.14&amp;id=3D9261296858cb149767ceac44fd6bd13cc0de0d21" rel=3D"noreferr=
er" target=3D"_blank">https://cgit.freedesktop.org/<wbr>gstreamer/gst-plugi=
ns-base/<wbr>commit/?h=3D1.14&amp;id=3D<wbr>9261296858cb149767ceac44fd6bd1<=
wbr>3cc0de0d21</a><br>
<span class=3D""><br>
On 05/04/2018 07:52 PM, Burton, Ross wrote:<br>
&gt; =C2=A0Couldn&#39;t find include &#39;GstVideo-1.0.gir&#39; (search pat=
h:<br>
&gt; &#39;[&#39;/data/poky-tmp/master/work/<wbr>corei7-64-poky-linux/<wbr>g=
streamer1.0-plugins-base/1.<wbr>14.0-r0/recipe-sysroot/usr/<wbr>share/gir-1=
.0&#39;,<br>
&gt; &#39;/usr/share/gir-1.0&#39;, &#39;/usr/share/gir-1.0&#39;, &#39;/usr/=
share/gir-1.0&#39;,<br>
&gt; &#39;/data/poky-tmp/master/work/<wbr>corei7-64-poky-linux/<wbr>gstream=
er1.0-plugins-base/1.<wbr>14.0-r0/recipe-sysroot/usr/<wbr>share/gir-1.0&#39=
;,<br>
&gt; &#39;/data/poky-tmp/master/work/<wbr>corei7-64-poky-linux/<wbr>gstream=
er1.0-plugins-base/1.<wbr>14.0-r0/recipe-sysroot-native/<wbr>usr/share/gir-=
1.0&#39;,<br>
&gt; &#39;/usr/share/gir-1.0&#39;,<br>
&gt; &#39;/data/poky-tmp/master/work/<wbr>corei7-64-poky-linux/<wbr>gstream=
er1.0-plugins-base/1.<wbr>14.0-r0/recipe-sysroot-native/<wbr>usr/share/gir-=
1.0&#39;]&#39;)<br>
&gt; | Makefile:1506: recipe for target &#39;GstGL-1.0.gir&#39; failed<br>
&gt; <br>
&gt; Turn on gobject-introspection DISTRO_FEATURE if you haven&#39;t alread=
y.<br>
&gt; <br>
&gt; That file is at=C2=A0./gst-libs/gst/video/<wbr>GstVideo-1.0.gir in the=
 build tree,<br>
&gt; so that search path is wrong...<br>
&gt; <br>
&gt; Ross<br>
&gt; <br>
&gt; On 3 May 2018 at 09:17, Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@=
intel.com">anuj.mittal@intel.com</a><br>
</span><span class=3D"">&gt; &lt;mailto:<a href=3D"mailto:anuj.mittal@intel=
.com">anuj.mittal@intel.com</a>&gt;<wbr>&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0* For changes, please see:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gstreamer.freedesktop.org/releas=
es/1.14/" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.freedeskto=
p.<wbr>org/releases/1.14/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gstreamer.freedesktop.org/re=
leases/1.14/" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.<wbr>f=
reedesktop.org/releases/1.14/</a><wbr>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0* OpenGL integration library has moved to -plugins-=
base, add<br>
&gt;=C2=A0 =C2=A0 =C2=A0PACKAGECONFIG.<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Remove one patch as that has been fixed in a diff=
erent way upstream.<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Merge inc/bb and refresh patches to get rid of fu=
zz warnings.<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Remove x86 specific cached variables as they&#39;=
re not needed anymore.<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Add jpeg to PACKAGECONFIG and enable it by defaul=
t.<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Port gstreamer-gl specific patches from -plugins-=
bad.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:an=
uj.mittal@intel.com">anuj.mittal@intel.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:anuj.mittal@int=
el.com">anuj.mittal@intel.com</a>&gt;<wbr>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...on.m4-prefix-pkgconfig-<wbr>paths-with-PKG=
_CON.patch |=C2=A0 12 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../gstreamer/gstreamer1.0-<wbr>plugins-base.=
inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 -------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...-don-t-hardcode-libtool-<wbr>name-when-run=
ning.patch |=C2=A0 71 +++++-----<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...gl.pc.in-don-t-append-GL_<wbr>CFLAGS-to-CF=
LAGS.patch |=C2=A0 29 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...-prefix-calls-to-pkg-<wbr>config-with-PKG_=
CONF.patch | 151<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...ssing-include-directories-<wbr>when-callin=
g-in.patch |=C2=A0 12 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...3-ssaparse-enhance-SSA-<wbr>text-lines-par=
sing.patch |=C2=A0 24 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...ncorrect-reference-to-<wbr>gstreamer-sdp-i=
n-Ma.patch |=C2=A0 12 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...t-need_segment-after-sink-<wbr>pad-receive=
d-GS.patch |=C2=A0 69 ----------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../0009-glimagesink-<wbr>Downrank-to-margina=
l.patch=C2=A0 =C2=A0 |=C2=A0 32 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../get-caps-from-src-pad-<wbr>when-query-cap=
s.patch=C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../link-with-libvchostif.<wbr>patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 45 +=
+++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0...make-gio_unix_2_0-<wbr>dependency-configur=
able.patch |=C2=A0 12 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-base_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<=
wbr>plugins-base_1.12.4.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-b=
ase_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plu=
gins-<wbr>base_1.12.4.bb</a>&gt;=C2=A0 |=C2=A0 18 ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-=
plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-<=
wbr>plugins-base_1.14.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-base_1.1=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-<w=
br>base_1.14.0.bb</a>&gt;=C2=A0 |=C2=A0 70 ++++++++++<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A015 files changed, 314 insert=
ions(+), 305 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0=
-<wbr>plugins-base.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0=
-<wbr>plugins-base/0001-gstreamer-<wbr>gl.pc.in-don-t-append-GL_<wbr>CFLAGS=
-to-CFLAGS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0=
-<wbr>plugins-base/0004-subparse-<wbr>set-need_segment-after-sink-<wbr>pad-=
received-GS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0=
-<wbr>plugins-base/0009-glimagesink-<wbr>Downrank-to-marginal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0=
-<wbr>plugins-base/link-with-<wbr>libvchostif.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/<wbr>gstreamer/<a hr=
ef=3D"http://gstreamer1.0-plugins-base_1.12.4.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0-<wbr>plugins-base_1.12.4.bb</a> &lt;<a href=3D"htt=
p://gstreamer1.0-plugins-base_1.12.4.bb" rel=3D"noreferrer" target=3D"_blan=
k">http://gstreamer1.0-plugins-<wbr>base_1.12.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"h=
ttp://gstreamer1.0-plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gstreamer1.0-<wbr>plugins-base_1.14.0.bb</a> &lt;<a href=3D"http://gst=
reamer1.0-plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gstreamer1.0-plugins-<wbr>base_1.14.0.bb</a>&gt;<br>
<span class=3D"">&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/files/0001=
-<wbr>introspection.m4-prefix-<wbr>pkgconfig-paths-with-PKG_CON.<wbr>patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/files/0001=
-<wbr>introspection.m4-prefix-<wbr>pkgconfig-paths-with-PKG_CON.<wbr>patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0index 2cab87f9ec..1b7f115083 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/files/0001=
-<wbr>introspection.m4-prefix-<wbr>pkgconfig-paths-with-PKG_CON.<wbr>patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/files/0001=
-<wbr>introspection.m4-prefix-<wbr>pkgconfig-paths-with-PKG_CON.<wbr>patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 90916f96262fa7b27a0a99788c69f9<wbr>fd6df11000=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 2b0436f9a07773fae8c74df902d702<wbr>4e8bfc3512=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Date: Tue, 24 Nov 2015 16:46=
:27 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Subject: [PATCH] introspection.m4: prefix pkg=
config paths with<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -10,12 +10,13 @@ is later supplied to g-ir-scann=
er.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Upstream-Status: Pending [review on oe-core l=
ist]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0- common/m4/introspection.m4 | 12 ++++++------<br>
&gt;=C2=A0 =C2=A0 =C2=A0- 1 file changed, 6 insertions(+), 6 deletions(-)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+ common/m4/introspection.m4 | 8 ++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 4 insertions(+), 4 deletions(-)<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/common/m4/introspection.m4 b/com=
mon/m4/introspection.m4<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 162be57..217a6ae 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 162be57..933f979 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/common/m4/introspection.m4<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/common/m4/introspection.m4<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0@@ -54,14 +54,14 @@ m4_define([_GOBJECT_<wbr>=
INTROSPECTION_CHECK_INTERNAL],<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -37,6 +38,3 @@ index 162be57..217a6ae 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INTROSPECTION_INI=
T=3D&quot;extern void gst_init(gint*,gchar**);<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst_init(NULL,NULL);&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 AC_SUBST(INTROSPECTION_<wbr>SC=
ANNER)<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-2.6.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 08130c1da4..0000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-multimedia/<wbr>gstreamer/gstrea=
mer1.0-<wbr>plugins-base.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,50 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-require gstreamer1.0-plugins.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI_append =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-don-t-<wbr>hardcode-libtool=
-name-when-<wbr>running.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0002-Makefile.am-<wbr>prefix-calls-to-pkg-co=
nfig-<wbr>with-PKG_CONF.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0003-riff-add-missing-<wbr>include-directori=
es-when-<wbr>calling-in.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0004-rtsp-drop-<wbr>incorrect-reference-to-<=
wbr>gstreamer-sdp-in-Ma.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-LICENSE =3D &quot;GPLv2+ &amp; LGPLv2+&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-DEPENDS +=3D &quot;iso-codes util-linux zlib&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-inherit gettext<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGES_DYNAMIC =3D+ &quot;^libgst.*&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG ??=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 ${GSTREAMER_ORC} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_<wbr>=
FEATURES&#39;, &#39;alsa x11&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 gio-unix-2.0 ogg pango theora vorbis=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-X11DEPENDS =3D &quot;virtual/libx11 libsm libxrend=
er libxv&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-X11ENABLEOPTS =3D &quot;--enable-x --enable-xvideo=
 --enable-xshm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-X11DISABLEOPTS =3D &quot;--disable-x --disable-xvi=
deo --disable-xshm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[alsa]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;--enable-alsa,--disable-alsa,<wbr>alsa-lib&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[cdparanoia]=C2=A0 =C2=A0=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-cdparanoia,--<wbr>disable-cdparanoia=
,cdparanoia&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[gio-unix-2.0] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-gio_unix_2_0,--<wbr>disable-gio_unix=
_2_0,glib-2.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[ivorbis]=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-ivorbis,--disable-<wbr>ivorbis,tremo=
r&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[ogg]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;--enable-ogg,--disable-ogg,<wbr>libogg&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[opus]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;--enable-opus,--disable-opus,<wbr>libopus&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[pango]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;--enable-pango,--disable-<wbr>pango,pango&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[theora]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-theora,--disable-<wbr>theora,libtheo=
ra&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[visual]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-libvisual,--disable-<wbr>libvisual,l=
ibvisual&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[vorbis]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-vorbis,--disable-<wbr>vorbis,libvorb=
is&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${X11ENABLEOPTS},${<wbr>X11DISABLEOPTS},${X11=
DEPENDS}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-EXTRA_OECONF +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 --enable-zlib \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-CACHED_CONFIGUREVARS_append_<wbr>x86 =3D &quot; ac=
_cv_header_emmintrin_h=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0ac_cv_header_xmmintrin_h=3Dno&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-FILES_${MLPREFIX}libgsttag-1.<wbr>0 +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${datadir}/gst-plugins-base/<wbr>1.0/license-=
translations.dict&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-do_compile_prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export<br>
&gt;=C2=A0 =C2=A0 =C2=A0GIR_EXTRA_LIBS_PATH=3D&quot;${B}/gst-<wbr>libs/gst/=
tag/.libs:${B}/gst-<wbr>libs/gst/video/.libs:${B}/gst-<wbr>libs/gst/audio/.=
libs:${B}/gst-<wbr>libs/gst/rtp/.libs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-}<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0001-Makefile.am-<wbr>don-t-hardcode-libtool-name-<wbr=
>when-running.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0001-Makefile.am-<wbr>don-t-hardcode-libtool-name-<wbr=
>when-running.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 094bdac846..128c7f8cb6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0001-Makefile.am-<wbr>don-t-hardcode-libtool-name-<wbr=
>when-running.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0001-Makefile.am-<wbr>don-t-hardcode-libtool-name-<wbr=
>when-running.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,16 +1,18 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From f1d9652351e7754c63003104eceb52<wbr>6af424c7e0=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 4d6ea58f96b9744af8d899ddca22c2<wbr>695ac74b5b=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-Date: Fri, 20 Nov 2015 16:53:04 +=
0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH 1/4] Makefile.am: don&#39;t hardco=
de libtool name when<br>
&gt;=C2=A0 =C2=A0 =C2=A0running<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Date: Thu, 5 Apr 2018 10:15:08 +0800<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] Makefile.am: don&#39;t hardcode l=
ibtool name when running<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 introspection tools<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Upstream-Status: Pending [review on oe-core m=
aillist]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:a=
nuj.mittal@intel.com">anuj.mittal@intel.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:anuj.mittal@intel.com"=
>anuj.mittal@intel.com</a>&gt;<wbr>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/allocators/<wbr>Makefile.am | 2=
 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/app/Makefile.am=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/audio/Makefile.<wbr>am=C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- gst-libs/gst/fft/Makefile.am=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ gst-libs/gst/gl/Makefile.am=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/pbutils/Makefile.<wbr>am=C2=A0 =
=C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/riff/Makefile.am=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/rtp/Makefile.am=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -21,10 +23,10 @@ Signed-off-by: Alexander Kanavi=
n<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex.kanavin@gmail.com=
">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.kanavin@gmai=
l.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 11 files changed, 11 =
insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/allocators/<wbr>Mak=
efile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/allocators/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 9361bf9..bc7f53a 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 1957d28..1ecc950 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/allocators/<wbr>Makefile.a=
m<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/allocators/<wbr>Makefile.a=
m<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -38,7 +38,7 @@ GstAllocators-@GST_API_VERSION<w=
br>@.gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstallocators-@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -42,7 +42,7 @@ GstAllocators-@GST_API_VERSION<w=
br>@.gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstallocators-@<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0--add-include-path=3D`PKG_<wbr>CONFIG_PATH=3D&quot;=
$(GST_PKG_CONFIG_<wbr>PATH)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_AP=
I_VERSION@` \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstallocators-@<wbr>GST_API_VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -34,10 +36,10 @@ index 9361bf9..bc7f53a 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg-export gstreamer-allocators-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --output $@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 6d6de8d..dcc2fe0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 52f6ad3..5bfd606 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -53,7 +53,7 @@ GstApp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -56,7 +56,7 @@ GstApp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstapp-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -47,10 +49,10 @@ index 6d6de8d..dcc2fe0 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-base-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg-export gstreamer-app-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/audio/Makefile.<wbr=
>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/audio/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 275d222..2374196 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 2922245..7fb65f2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/audio/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/audio/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -116,7 +116,7 @@ GstAudio-@GST_API_VERSION@.<wb=
r>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -184,7 +184,7 @@ GstAudio-@GST_API_VERSION@.<wb=
r>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstTag-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -59,24 +61,24 @@ index 275d222..2374196 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-@GST_API_VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-base-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg-export gstreamer-audio-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/gst-libs/gst/fft/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/fft/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 09b3d68..f545354 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/gst-libs/gst/fft/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/gst-libs/gst/fft/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -65,7 +65,7 @@ GstFft-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--add-include-path=3D`PKG_<wbr>CONFIG_PATH=3D=
&quot;$(GST_PKG_CONFIG_<wbr>PATH)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_AP=
I_VERSION@` \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--library=3Dlibgstfft-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/gl/Makefile.am b/gst-lib=
s/gst/gl/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index a3bbc94..16f829f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/gl/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/gl/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -192,7 +192,7 @@ GstGL-@GST_API_VERSION@.gir:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--include=3DGstVideo-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --libtool=3D&quot;$(top_builddir)/<wbr>libtool&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --libtool=3D&quot;$(LIBTOOL)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-@GST_API_VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--pkg-export gstreamer-fft-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--output $@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--pkg gstreamer-base-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--pkg gstreamer-video-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/pbutils/<wbr>Makefi=
le.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/pbutils/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 64d5eb0..91dc214 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index ae51993..35a6e44 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/pbutils/<wbr>Makefile.am<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/pbutils/<wbr>Makefile.am<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -99,7 +99,7 @@ GstPbutils-@GST_API_VERSION@.<wb=
r>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -103,7 +103,7 @@ GstPbutils-@GST_API_VERSION@.<=
wbr>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstTag-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstVideo-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstAudio-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -86,10 +88,10 @@ index 64d5eb0..91dc214 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-tag-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-video-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/riff/Makefile.<wbr>=
am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 83d83cb..3bd8fc0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index fb53f06..e66ef4f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -47,7 +47,7 @@ libgstriff_@GST_API_VERSION@_<wb=
r>la_LDFLAGS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -49,7 +49,7 @@ libgstriff_@GST_API_VERSION@_<wb=
r>la_LDFLAGS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--include=3DGstAudio-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--include=3DGstTag-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--include=3DGst-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -99,10 +101,10 @@ index 83d83cb..3bd8fc0 100644<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--pkg gstreamer-tag-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--pkg gstreamer-audio-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index fdd01c1..f5445c1 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index a6f971d..77ebeeb 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -65,7 +65,7 @@ GstRtp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -69,7 +69,7 @@ GstRtp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstrtp-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -112,10 +114,10 @@ index fdd01c1..f5445c1 100644=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-base-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg-export gstreamer-rtp-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/rtsp/Makefile.<wbr>=
am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index ede5706..9b0b258 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index ceb07f4..db9d0fd 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -72,7 +72,7 @@ GstRtsp-@GST_API_VERSION@.gir:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -76,7 +76,7 @@ GstRtsp-@GST_API_VERSION@.gir:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGio-2.0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstSdp-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -125,10 +127,10 @@ index ede5706..9b0b258 100644=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-@GST_API_VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-sdp-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index a90f30b..0e149b8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index e197e9b..6e05cc7 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -32,7 +32,7 @@ GstSdp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -34,7 +34,7 @@ GstSdp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0--add-include-path=3D`PKG_<wbr>CONFIG_PATH=3D&quot;=
$(GST_PKG_CONFIG_<wbr>PATH)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_AP=
I_VERSION@` \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstsdp-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -138,10 +140,10 @@ index a90f30b..0e149b8 100644=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg-export gstreamer-sdp-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --output $@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index c534a4d..cafafd3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 0247c33..c86515b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -45,7 +45,7 @@ GstTag-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -66,7 +66,7 @@ GstTag-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgsttag-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -151,10 +153,10 @@ index c534a4d..cafafd3 100644=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-base-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg-export gstreamer-tag-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/video/Makefile.<wbr=
>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/video/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 5d31fa1..ac64eb3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 9fc1ccf..0f8455f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/video/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/video/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -116,7 +116,7 @@ GstVideo-@GST_API_VERSION@.<wb=
r>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -124,7 +124,7 @@ GstVideo-@GST_API_VERSION@.<wb=
r>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstvideo-@GST_<wbr>API_VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -163,6 +165,3 @@ index 5d31fa1..ac64eb3 100644<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-@GST_API_VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-base-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg-export gstreamer-video-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-2.6.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0001-gstreamer-<wbr>gl.pc.in-don-t-append-GL_<wbr>CFLA=
GS-to-CFLAGS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0001-gstreamer-<wbr>gl.pc.in-don-t-append-GL_<wbr>CFLA=
GS-to-CFLAGS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..251dc172cb<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0001-gstreamer-<wbr>gl.pc.in-don-t-append-GL_<wbr>CFLA=
GS-to-CFLAGS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,29 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 61a672e79c8cb1aeeeda4c968997c5<wbr>77ac73a8f3=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+Date: Fri, 12 May 2017 16:47:12 +=
0300<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] <a href=3D"http://gstreame=
r-gl.pc.in" rel=3D"noreferrer" target=3D"_blank">gstreamer-gl.pc.in</a> &lt=
;<a href=3D"http://gstreamer-gl.pc.in" rel=3D"noreferrer" target=3D"_blank"=
>http://gstreamer-gl.pc.in</a>&gt;:<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0don&#39;t append GL_CFLAGS to CFLA=
GS<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Dependencies&#39; include directories should not b=
e added in this way;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+it causes problems when cross-compiling in sysroot=
 environments.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Pending<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Maxin B. John &lt;=
<a href=3D"mailto:maxin.john@intel.com">maxin.john@intel.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:maxin.john@inte=
l.com">maxin.john@intel.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ pkgconfig/<a href=3D"http://gstreamer-gl.pc.in" r=
el=3D"noreferrer" target=3D"_blank">gstreamer-gl.pc.in</a> &lt;<a href=3D"h=
ttp://gstreamer-gl.pc.in" rel=3D"noreferrer" target=3D"_blank">http://gstre=
amer-gl.pc.in</a>&gt; | 2 +-<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 1 insertion(+), =
1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/pkgconfig/<a href=3D"http://gstreamer=
-gl.pc.in" rel=3D"noreferrer" target=3D"_blank">gstreamer-gl.pc.in</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer-gl.pc.in" re=
l=3D"noreferrer" target=3D"_blank">http://gstreamer-gl.pc.in</a>&gt; b/pkgc=
onfig/<a href=3D"http://gstreamer-gl.pc.in" rel=3D"noreferrer" target=3D"_b=
lank">gstreamer-gl.pc.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer-gl.pc.in" rel=3D"no=
referrer" target=3D"_blank">http://gstreamer-gl.pc.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index dc672a9..8c290ba 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/pkgconfig/<a href=3D"http://gstreamer-gl.pc.=
in" rel=3D"noreferrer" target=3D"_blank">gstreamer-gl.pc.in</a> &lt;<a href=
=3D"http://gstreamer-gl.pc.in" rel=3D"noreferrer" target=3D"_blank">http://=
gstreamer-gl.pc.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/pkgconfig/<a href=3D"http://gstreamer-gl.pc.=
in" rel=3D"noreferrer" target=3D"_blank">gstreamer-gl.pc.in</a> &lt;<a href=
=3D"http://gstreamer-gl.pc.in" rel=3D"noreferrer" target=3D"_blank">http://=
gstreamer-gl.pc.in</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+@@ -13,4 +13,4 @@ Version: @VERSI=
ON@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Requires: gstreamer-video-@GST_API_<wbr>VERSION@<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0gstreamer-base-@GST_API_<wbr>VERSION@ gstreamer-@GS=
T_API_VERSION@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ Libs: -L${libdir} -lgstgl-@GST_API_VERSION@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-Cflags: -I${includedir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-I${libdir}/gstreamer-@GST_<wbr>API_VERSION@/includ=
e @GL_CFLAGS@<br>
&gt;=C2=A0 =C2=A0 =C2=A0++Cflags: -I${includedir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-I${libdir}/gstreamer-@GST_<wbr>API_VERSION@/includ=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.7.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr>=
with-PKG_CONF.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr>=
with-PKG_CONF.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 6616e2cf0d..dc15d93eb0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr>=
with-PKG_CONF.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0002-Makefile.am-<wbr>prefix-calls-to-pkg-config-<wbr>=
with-PKG_CONF.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,16 +1,17 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 990b653c7b6de1937ec759019982d6<wbr>c5f15770f7=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From f523721e453febfb3f62f3ba1e9fef<wbr>b31dcec471=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-Date: Mon, 26 Oct 2015 16:38:18 +=
0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH 2/4] Makefile.am: prefix calls to =
pkg-config with<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Date: Thu, 5 Apr 2018 10:26:25 +0800<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] Makefile.am: prefix calls to pkg-=
config with<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 PKG_CONFIG_SYSROOT_DIR<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Upstream-Status: Pending [review on oe-core m=
aillist]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:a=
nuj.mittal@intel.com">anuj.mittal@intel.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:anuj.mittal@intel.com"=
>anuj.mittal@intel.com</a>&gt;<wbr>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/allocators/<wbr>Makefile.am |=
=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/app/Makefile.am=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/audio/Makefile.<wbr>am=C2=A0 =
=C2=A0 =C2=A0 | 12 ++++++------<br>
&gt;=C2=A0 =C2=A0 =C2=A0- gst-libs/gst/fft/Makefile.am=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/pbutils/Makefile.<wbr>am=C2=A0 =
=C2=A0 | 12 ++++++------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/riff/Makefile.am=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/rtp/Makefile.am=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -18,13 +19,13 @@ Signed-off-by: Alexander Kanavi=
n<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:alex.kanavin@gmail.com=
">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.kanavin@gmai=
l.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/sdp/Make=
file.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/tag/Makefile.am=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/video/Makefile.<wbr>am=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0- 11 files changed, 38 insertions(+), 38 deletions(=
-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 10 files changed, 36 insertions(+), 36 deletions(=
-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/a=
llocators/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/allocators/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/allo=
cators/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -36,7 +36,7 @@ GstAllocators-@GST_API_VERSION<w=
br>@.gir: $(I<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/allocators/<wbr>Makefile=
.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/allocators/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 1ecc950..d6417ac 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/allocators/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/allocators/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -39,7 +39,7 @@ GstAllocators-@GST_API_VERSION<w=
br>@.gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstallocators-@<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --c-include &quot;gst/allocators/allocators.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -33,7 +34,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/allocator=
s/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstallocators-@<wbr>GST_API_VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --libtool=3D&quot;$(LIBTOOL)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -60,7 +60,7 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -63,7 +63,7 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D.<wbr>typelib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -42,11 +43,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/allocator=
s/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER_OPTS) $&lt; -o $(@F)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 CLEANFILES =3D $(BUILT_GIRSOURCES) $(typelib=
s_DATA)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/a=
pp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/app/=
Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(=
INTROSPE<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 5bfd606..6441674 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/app/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -51,8 +51,8 @@ GstApp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --c-include &quot;gst/app/app.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -57,11 +58,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/app/Makef=
ile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstapp-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/a=
udio/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/audio/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/audi=
o/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -167,12 +167,12 @@ GstAudio-@GST_API_VERSION@.<=
wbr>gir: $(INTROS<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/audio/Makefile.<wbr>am<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/audio/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 7fb65f2..5379f79 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/audio/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/audio/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -174,12 +174,12 @@ GstAudio-@GST_API_VERSION@.<=
wbr>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --c-include &quot;gst/audio/audio.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -78,7 +79,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/audio/Mak=
efile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library-path=3D&quot;$(top_<wbr>builddir)/gst-libs/gst/tag/&quot; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -201,8 +201,8 @@ typelibs_DATA =3D $(BUILT_GIRS=
OURCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -208,8 +208,8 @@ typelibs_DATA =3D $(BUILT_GIRS=
OURCES:.gir=3D.<wbr>typelib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D&quot;$(top_builddir)/<wbr>gst-libs/gst/tag/&quot; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -89,33 +90,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/audio/Mak=
efile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER_OPTS) $&lt; -o $(@F)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typeli=
bs_DATA)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/f=
ft/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/fft/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/fft/=
Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -63,7 +63,7 @@ GstFft-@GST_API_VERSION@.gir: $(=
INTROSPE<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--c-include &quot;gst/fft/fft.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0--add-include-path=3D`PKG_<wbr>CONFIG_PATH=3D&quot;=
$(GST_PKG_CONFIG_<wbr>PATH)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_AP=
I_VERSION@` \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0--add-include-path=3D$(PKG_<wbr>CONFIG_SYSROOT_DIR)=
`PKG_<wbr>CONFIG_PATH=3D&quot;$(GST_PKG_CONFIG_<wbr>PATH)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_AP=
I_VERSION@` \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--library=3Dlibgstfft-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--include=3DGst-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--libtool=3D&quot;$(LIBTOOL)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -87,7 +87,7 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(INTROSPECTION_COMPILER) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0--includedir=3D`PKG_CONFIG_PATH=3D<wbr>&quot;$(GST_=
PKG_CONFIG_PATH)&quot; $(PKG_CONFIG)<br>
&gt;=C2=A0 =C2=A0 =C2=A0--variable=3Dgirdir gstreamer-@GST_API_VERSION@` \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0--includedir=3D$(PKG_CONFIG_<wbr>SYSROOT_DIR)`PKG_C=
ONFIG_PATH=3D&quot;<wbr>$(GST_PKG_CONFIG_PATH)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_AP=
I_VERSION@` \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(INTROSPECTION_COMPILER_<wbr>OPTS) $&lt; -o $(@F)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CLEANFILES =3D $(BUILT_GIRSOURCES) $(typelibs_DAT=
A)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/p=
butils/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/pbutils/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/pbut=
ils/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -85,14 +85,14 @@ GstPbutils-@GST_API_VERSION@.<=
wbr>gir: $(INTR<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/pbutils/<wbr>Makefile.am=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/pbutils/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 35a6e44..49d6894 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/pbutils/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/pbutils/<wbr>Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -88,14 +88,14 @@ GstPbutils-@GST_API_VERSION@.<=
wbr>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --c-include &quot;gst/pbutils/pbutils.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -134,7 +113,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/pbutils/M=
akefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library-path=3D&quot;$(top_<wbr>builddir)/gst-libs/gst/tag/&quot; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library-path=3D&quot;$(top_<wbr>builddir)/gst-libs/gst/video/&quot=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library-path=3D&quot;$(top_<wbr>builddir)/gst-libs/gst/audio/&quot=
; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -125,8 +125,8 @@ typelibs_DATA =3D $(BUILT_GIRS=
OURCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -128,8 +128,8 @@ typelibs_DATA =3D $(BUILT_GIRS=
OURCES:.gir=3D.<wbr>typelib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -145,11 +124,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/pbutils/M=
akefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D&quot;$(top_builddir)/<wbr>gst-libs/gst/tag/&quot; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D&quot;$(top_builddir)/<wbr>gst-libs/gst/video/&quot; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D&quot;$(top_builddir)/<wbr>gst-libs/gst/audio/&quot; =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/r=
iff/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/riff/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/riff=
/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -42,8 +42,8 @@ libgstriff_@GST_API_VERSION@_<wb=
r>la_LDFLAGS<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/riff/Makefile.<wbr>am<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index e66ef4f..c8c588a 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -43,8 +43,8 @@ libgstriff_@GST_API_VERSION@_<wb=
r>la_LDFLAGS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--c-include &quot;gst/riff/riff.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--add-include-path=3D$(<wbr>builddir)/../tag \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--add-include-path=3D$(<wbr>builddir)/../audio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -160,7 +139,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/riff/Make=
file.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--library=3Dlibgstriff-@GST_<wbr>API_VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--include=3DGstAudio-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--include=3DGstTag-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -74,8 +74,8 @@ libgstriff_@GST_API_VERSION@_<wb=
r>la_LDFLAGS<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -75,8 +75,8 @@ libgstriff_@GST_API_VERSION@_<wb=
r>la_LDFLAGS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--includedir=3D$(builddir)/../<wbr>tag \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--includedir=3D$(builddir)/../<wbr>audio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -171,11 +150,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/riff/Make=
file.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(INTROSPECTION_COMPILER_<wbr>OPTS) $&lt; -o $(@F)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #CLEANFILES =3D $(BUILT_GIRSOURCES) $(typeli=
bs_DATA)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/r=
tp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtp/=
Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -61,8 +61,8 @@ GstRtp-@GST_API_VERSION@.gir: $(=
INTROSPE<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 77ebeeb..9aee788 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/rtp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -64,8 +64,8 @@ GstRtp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --c-include &quot;gst/rtp/rtp.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -186,7 +165,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtp/Makef=
ile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstrtp-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -89,8 +89,8 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -92,8 +92,8 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D.<wbr>typelib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -197,11 +176,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtp/Makef=
ile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER_OPTS) $&lt; -o $(@F)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typeli=
bs_DATA)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/r=
tsp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/rtsp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtsp=
/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -68,7 +68,7 @@ GstRtsp-@GST_API_VERSION@.gir: $=
(INTROSP<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/rtsp/Makefile.<wbr>am<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index db9d0fd..79027cb 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -71,7 +71,7 @@ GstRtsp-@GST_API_VERSION@.gir:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --add-include-path=3D$(builddir)<wbr>/../sdp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -210,7 +189,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtsp/Make=
file.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstrtsp-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGio-2.0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -98,7 +98,7 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -101,7 +101,7 @@ typelibs_DATA =3D $(BUILT_GIRS=
OURCES:.gir=3D.<wbr>typelib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir)/../<wbr>sdp \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -219,11 +198,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/rtsp/Make=
file.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER_OPTS) $&lt; -o $(@F)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typeli=
bs_DATA)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/s=
dp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/sdp/=
Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -30,7 +30,7 @@ GstSdp-@GST_API_VERSION@.gir: $(=
INTROSPE<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 6e05cc7..c7cf514 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/sdp/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -31,7 +31,7 @@ GstSdp-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --warn-all \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --c-include &quot;gst/sdp/sdp.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -232,7 +211,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/sdp/Makef=
ile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstsdp-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --libtool=3D&quot;$(LIBTOOL)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -54,7 +54,7 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -55,7 +55,7 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D.<wbr>typelib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -241,11 +220,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/sdp/Makef=
ile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER_OPTS) $&lt; -o $(@F)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 CLEANFILES =3D $(BUILT_GIRSOURCES) $(typelib=
s_DATA)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/t=
ag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/tag/=
Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -59,8 +59,8 @@ GstTag-@GST_API_VERSION@.gir: $(=
INTROSPE<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index c86515b..363e6d2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/tag/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -61,8 +61,8 @@ GstTag-@GST_API_VERSION@.gir:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --c-include &quot;gst/tag/tag.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -256,7 +235,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/tag/Makef=
ile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgsttag-@GST_API_<wbr>VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -87,8 +87,8 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -89,8 +89,8 @@ typelibs_DATA =3D $(BUILT_GIRSOU=
RCES:.gir=3D.<wbr>typelib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -267,11 +246,11 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/tag/Makef=
ile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER_OPTS) $&lt; -o $(@F)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 CLEANFILES +=3D $(BUILT_GIRSOURCES) $(typeli=
bs_DATA)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Index: gst-plugins-base-1.12.3/gst-<wbr>libs/gst/v=
ideo/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- gst-plugins-base-1.12.3.orig/<wbr>gst-libs/gst=
/video/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ gst-plugins-base-1.12.3/gst-<wbr>libs/gst/vide=
o/Makefile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -116,8 +116,8 @@ GstVideo-@GST_API_VERSION@.<wb=
r>gir: $(INTROS<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/gst-libs/gst/video/Makefile.<wbr>am<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/video/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 0f8455f..8c9955c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/gst-libs/gst/video/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/gst-libs/gst/video/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -119,8 +119,8 @@ GstVideo-@GST_API_VERSION@.<wb=
r>gir:<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --c-include &quot;gst/video/video.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_srcdir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -I$(top_builddir)/gst-libs \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -282,7 +261,7 @@ Index:<br>
&gt;=C2=A0 =C2=A0 =C2=A0gst-plugins-base-1.12.3/gst-<wbr>libs/gst/video/Mak=
efile.am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --library=3Dlibgstvideo-@GST_<wbr>API_VERSION@.la \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGst-@GST_API_VERSION<wbr>@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --include=3DGstBase-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -144,8 +144,8 @@ typelibs_DATA =3D $(BUILT_GIRS=
OURCES:.gir=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -147,8 +147,8 @@ typelibs_DATA =3D $(BUILT_GIRS=
OURCES:.gir=3D.<wbr>typelib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(INTROSPECTION_COMPILER) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(srcdir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --includedir=3D$(builddir) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0003-riff-add-<wbr>missing-include-directories-<wbr>wh=
en-calling-in.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0003-riff-add-<wbr>missing-include-directories-<wbr>wh=
en-calling-in.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 9b66f7f49d..98ffdb1c10 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0003-riff-add-<wbr>missing-include-directories-<wbr>wh=
en-calling-in.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0003-riff-add-<wbr>missing-include-directories-<wbr>wh=
en-calling-in.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,20 +1,21 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 3c2c2d5dd08aa30ed0e8acd8566ec9<wbr>9412bb8209=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From b9765efb1696e3e2e79f2955f759be<wbr>199fe34882=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Date: Mon, 26 Oct 2015 17:29=
:37 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH 3/4] riff: add missing include dir=
ectories when calling<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] riff: add missing include directo=
ries when calling<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 introspection scanner<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Upstream-Status: Pending [review on oe-core m=
aillist]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/riff/Makefile.am | 2 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/riff/Makefile.<wbr>=
am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 0a115cc..5057a58 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index c8c588a..c096453 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/riff/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -39,6 +39,8 @@ libgstriff_@GST_API_VERSION@_<wb=
r>la_LDFLAGS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -41,6 +41,8 @@ libgstriff_@GST_API_VERSION@_<wb=
r>la_LDFLAGS =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--strip-prefix=3DGst \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--warn-all \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--c-include &quot;gst/riff/riff.h&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -23,6 +24,3 @@ index 0a115cc..5057a58 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--add-include-path=3D$(<wbr>builddir)/../tag \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--add-include-path=3D$(<wbr>builddir)/../audio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--add-include-path=3D$(PKG_<wbr>CONFIG_SYSROO=
T_DIR)`PKG_<wbr>CONFIG_PATH=3D&quot;$(GST_PKG_CONFIG_<wbr>PATH)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0$(PKG_CONFIG) --variable=3Dgirdir gstreamer-@GST_AP=
I_VERSION@` \<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-2.6.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0003-ssaparse-<wbr>enhance-SSA-text-lines-<wbr>parsing=
.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0003-ssaparse-<wbr>enhance-SSA-text-lines-<wbr>parsing=
.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 9fbebd5700..9e95524057 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0003-ssaparse-<wbr>enhance-SSA-text-lines-<wbr>parsing=
.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0003-ssaparse-<wbr>enhance-SSA-text-lines-<wbr>parsing=
.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,7 +1,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From be6163cfa3a255493f9d75bad9541c<wbr>bfe1723fee=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 918c96b24d10f61b7455b4cef3bab4<wbr>90849d0d77=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From: Mingke Wang &lt;<a href=3D"mailto:mingk=
e.wang@freescale.com">mingke.wang@freescale.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingke.wan=
g@freescale.com">mingke.wang@freescale.<wbr>com</a>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Date: Thu, 19 Mar 2015 14:17=
:10 +0800<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH 3/4] ssaparse: enhance SSA text li=
nes parsing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] ssaparse: enhance SSA text lines =
parsing.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0some parser will pass in the original ssa tex=
t line which starts<br>
&gt;=C2=A0 =C2=A0 =C2=A0with &quot;Dialog:&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0and there&#39;s are maybe multiple Dialog lin=
es in one input buffer.<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -10,13 +10,18 @@ Upstream-Status: Submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://bugzilla.gnome.org/show_bug.cgi=
?id=3D747496" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.o=
rg/<wbr>show_bug.cgi?id=3D747496</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugzilla.gnome.org/show_bug.=
cgi?id=3D747496" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnom=
e.org/<wbr>show_bug.cgi?id=3D747496</a>&gt;]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Signed-off-by: Mingke Wang &lt;<a href=3D"mai=
lto:mingke.wang@freescale.com">mingke.wang@freescale.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingke.wang@fre=
escale.com">mingke.wang@freescale.<wbr>com</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ gst/subparse/gstssaparse.c | 150<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++++++++<wbr>++++++++++-----<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 134 insertions(+), 16 deletions(-=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ mode change 100644 =3D&gt; 100755 gst/subparse/gs=
tssaparse.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst/subparse/gstssaparse.c b/gst=
/subparse/gstssaparse.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0old mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0new mode 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 06ecef9..0ab5dce<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index c849c08..4b9636c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst/subparse/gstssaparse.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst/subparse/gstssaparse.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -260,6 +260,7 @@ gst_ssa_parse_remove_override_=
<wbr>codes<br>
&gt;=C2=A0 =C2=A0 =C2=A0(GstSsaParse * parse, gchar * txt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -262,6 +262,7 @@ gst_ssa_parse_remove_override_=
<wbr>codes<br>
&gt;=C2=A0 =C2=A0 =C2=A0(GstSsaParse * parse, gchar * txt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0* gst_ssa_parse_push_line:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0* @parse: caller element<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0* @txt: text to push<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -24,7 +29,7 @@ index 06ecef9..0ab5dce<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0* @start: timestamp for the buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0* @duration: duration for the buffer<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -269,27 +270,133 @@ gst_ssa_parse_remove_overri=
de_<wbr>codes<br>
&gt;=C2=A0 =C2=A0 =C2=A0(GstSsaParse * parse, gchar * txt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -271,27 +272,133 @@ gst_ssa_parse_remove_overri=
de_<wbr>codes<br>
&gt;=C2=A0 =C2=A0 =C2=A0(GstSsaParse * parse, gchar * txt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0* Returns: result of the push of the c=
reated buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 static GstFlowReturn<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -169,7 +174,7 @@ index 06ecef9..0ab5dce<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 GST_LOG_OBJECT (parse, &quot;Text : %=
s&quot;, t);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 if (gst_ssa_parse_remove_<wbr>overrid=
e_codes (parse, t)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -307,13 +414,22 @@ gst_ssa_parse_push_line (Gst=
SsaParse * parse,<br>
&gt;=C2=A0 =C2=A0 =C2=A0gchar * txt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -309,13 +416,22 @@ gst_ssa_parse_push_line (Gst=
SsaParse * parse,<br>
&gt;=C2=A0 =C2=A0 =C2=A0gchar * txt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 gst_buffer_fill (buf, 0, escaped, len=
 + 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 gst_buffer_set_size (buf, len);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 g_free (escaped);<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -196,7 +201,7 @@ index 06ecef9..0ab5dce<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ret =3D gst_pad_push (parse-&gt;srcpa=
d, buf);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -333,6 +449,7 @@ gst_ssa_parse_chain (GstPad * =
sinkpad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GstObject * parent, GstBuffer * buf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -335,6 +451,7 @@ gst_ssa_parse_chain (GstPad * =
sinkpad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GstObject * parent, GstBuffer * buf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 GstClockTime ts;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 gchar *txt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 GstMapInfo map;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -204,7 +209,7 @@ index 06ecef9..0ab5dce<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 if (G_UNLIKELY (!parse-&gt;framed))<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 goto not_framed;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -350,13 +467,14 @@ gst_ssa_parse_chain (GstPad =
* sinkpad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GstObject * parent, GstBuffer * buf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -352,13 +469,14 @@ gst_ssa_parse_chain (GstPad =
* sinkpad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GstObject * parent, GstBuffer * buf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 /* make double-sure it&#39;s 0-termin=
ated and all */<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 gst_buffer_map (buf, &amp;map, GST_MA=
P_READ);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 txt =3D g_strndup ((gchar *) map.data=
, map.size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -220,6 +225,3 @@ index 06ecef9..0ab5dce<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 if (ret !=3D GST_FLOW_OK &amp;&amp; G=
ST_CLOCK_TIME_IS_VALID (ts)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 GstSegment segment;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-1.7.9.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstrea=
mer-sdp-in-Ma.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstrea=
mer-sdp-in-Ma.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 4adf605460..aaeb611fec 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstrea=
mer-sdp-in-Ma.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0004-rtsp-drop-<wbr>incorrect-reference-to-<wbr>gstrea=
mer-sdp-in-Ma.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,20 +1,21 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 4330915d88dc4dd46eb4c28d756482<wbr>b767c2747f=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 53b5868491cf99ee797192395dbfeb<wbr>69df23edd2=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Date: Mon, 26 Oct 2015 17:30=
:14 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH 4/4] rtsp: drop incorrect referenc=
e to gstreamer-sdp in<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] rtsp: drop incorrect reference to=
 gstreamer-sdp in<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 Makefile.am<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Upstream-Status: Pending [review on oe-core m=
aillist]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 gst-libs/gst/rtsp/Makefile.am | 1 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 1 file changed, 1 deletion(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/rtsp/Makefile.<wbr>=
am<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 4f6d9f8..0afa370 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 79027cb..2987e23 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/rtsp/Makefile.<wbr>am<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -75,7 +75,6 @@ GstRtsp-@GST_API_VERSION@.gir:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -79,7 +79,6 @@ GstRtsp-@GST_API_VERSION@.gir:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0$(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --libtool=3D&quot;$(LIBTOOL)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gio-2.0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg gstreamer-@GST_API_VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -22,6 +23,3 @@ index 4f6d9f8..0afa370 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --pkg-export gstreamer-rtsp-@GST_API_<wbr>VERSION@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --add-init-section=3D&quot;$(<wbr>INTROSPECTION_INIT)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --output $@ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-2.6.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0004-subparse-<wbr>set-need_segment-after-sink-<wbr>pa=
d-received-GS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0004-subparse-<wbr>set-need_segment-after-sink-<wbr>pa=
d-received-GS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index b924e38824..0000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0004-subparse-<wbr>set-need_segment-after-sink-<wbr>pa=
d-received-GS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,69 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From ed09c8fd2c9c2b5384b72cc70af372<wbr>8be6694e64=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From: Mingke Wang &lt;<a href=3D"mailto:mingke.wan=
g@freescale.com">mingke.wang@freescale.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingke.wan=
g@freescale.com">mingke.wang@freescale.<wbr>com</a>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-Date: Thu, 19 Mar 2015 14:20:26 +=
0800<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Subject: [PATCH 4/4] subparse: set need_segment af=
ter sink pad received<br>
&gt;=C2=A0 =C2=A0 =C2=A0- GST_EVENT_SEGMENT<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-subparse works in push mode, chain funciton will b=
e called once<br>
&gt;=C2=A0 =C2=A0 =C2=A0-up stream element finished the seeking and flushin=
g.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-if set need_segment flag in src pad event handler,=
 the segment<br>
&gt;=C2=A0 =C2=A0 =C2=A0-event will be pushed earlier, result in the subtit=
le text will<br>
&gt;=C2=A0 =C2=A0 =C2=A0-be send out to down stream from the beginning.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Upstream-Status: Submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://bugzilla.gnome.org/show_bug.cgi=
?id=3D747498" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.o=
rg/<wbr>show_bug.cgi?id=3D747498</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugzilla.gnome.org/show_bug.=
cgi?id=3D747498" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnom=
e.org/<wbr>show_bug.cgi?id=3D747498</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Signed-off-by: Mingke Wang &lt;<a href=3D"mailto:m=
ingke.wang@freescale.com">mingke.wang@freescale.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mingke.wang@fre=
escale.com">mingke.wang@freescale.<wbr>com</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-diff --git a/gst/subparse/gstsubparse.c b/gst/subp=
arse/gstsubparse.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-old mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0-new mode 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index b565e93..7741ccc<br>
&gt;=C2=A0 =C2=A0 =C2=A0---- a/gst/subparse/gstsubparse.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+++ b/gst/subparse/gstsubparse.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -266,22 +266,20 @@ gst_sub_parse_src_event (Gst=
Pad * pad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GstObject * parent, GstEvent * event)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto beach;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 /* Apply the seek to our seg=
ment */<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 gst_segment_do_seek (&amp;se=
lf-&gt;segment, rate, format, flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start_type, st=
art, stop_type, stop, &amp;update);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 GST_DEBUG_OBJECT (self, &quo=
t;segment after seek: %&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0GST_SEGMENT_FORMAT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;self-&gt;=
segment);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Convert that seek to=
 a seeking in bytes at position 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIXME: could us=
e an index */<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gst_pad_push_ev=
ent (self-&gt;sinkpad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_event=
_new_seek (rate, GST_FORMAT_BYTES, flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GST_SEEK_TYPE_SET, 0, GST_SEEK_TYPE_NONE, 0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Apply the seek to =
our segment */<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_segment_do_seek (=
&amp;self-&gt;segment, rate, format, flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start_t=
ype, start, stop_type, stop, &amp;update);<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_DEBUG_OBJECT (sel=
f, &quot;segment after seek: %&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0GST_SEGMENT_FORMAT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;se=
lf-&gt;segment);<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;need_segment=
 =3D TRUE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_WARNING_OBJE=
CT (self, &quot;seek to 0 bytes failed&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -1641,8 +1639,10 @@ gst_sub_parse_sink_event (G=
stPad * pad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GstObject * parent, GstEvent * event)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0gst_event_parse_segment=
 (event, &amp;s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;format =3D=3D=
 GST_FORMAT_TIME)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_event_copy_s=
egment (event, &amp;self-&gt;segment);<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 GST_DEBUG_OBJECT (self, &quo=
t;newsegment (%s)&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_format_get=
_name (self-&gt;segment.format));<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 GST_DEBUG_OBJECT (self, &quo=
t;newsegment (%s) %&quot; GST_SEGMENT_FORMAT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_format_get=
_name (self-&gt;segment.format), &amp;self-&gt;segment);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+<br>
&gt;=C2=A0 =C2=A0 =C2=A0-+=C2=A0 =C2=A0 =C2=A0 self-&gt;need_segment =3D TR=
UE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* if not time format, =
we&#39;ll either start with a 0 timestamp<br>
&gt;=C2=A0 =C2=A0 =C2=A0anyway or<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * it&#39;s following a=
 seek in which case we&#39;ll have saved the<br>
&gt;=C2=A0 =C2=A0 =C2=A0requested<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-1.7.9.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0009-glimagesink-<wbr>Downrank-to-marginal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0009-glimagesink-<wbr>Downrank-to-marginal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..c81fb0f6aa<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/0009-glimagesink-<wbr>Downrank-to-marginal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,32 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From c6b37a80806f9128de47f1ccc3f235<wbr>4f8d436bb6=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+Date: Thu, 24 Sep 2015 19:47:32 +=
0300<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] glimagesink: Downrank to marginal=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+On desktop, where there is good OpenGL, xvimagesin=
k will come up first,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+on other platforms, OpenGL can&#39;t be trusted be=
cause it&#39;s either<br>
&gt;=C2=A0 =C2=A0 =C2=A0software (like<br>
&gt;=C2=A0 =C2=A0 =C2=A0+in a VM) or broken (like on embedded)., so let xim=
agesink come above.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://bugzilla.gnome.org/show_bug.cgi=
?id=3D751684" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.o=
rg/<wbr>show_bug.cgi?id=3D751684</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugzilla.gnome.org/show_bug.=
cgi?id=3D751684" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnom=
e.org/<wbr>show_bug.cgi?id=3D751684</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a><wbr>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ ext/gl/gstopengl.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl=
.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index a4b2540..0ccaacd 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/ext/gl/gstopengl.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/ext/gl/gstopengl.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugi=
n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0if (!gst_element_register (plugin, &q=
uot;glimagesink&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_RANK_SECON=
DARY, gst_gl_image_sink_bin_get_type ())) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_RANK_MARGI=
NAL, gst_gl_image_sink_bin_get_type ())) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.1.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/get-caps-from-<wbr>src-pad-when-query-caps.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/get-caps-from-<wbr>src-pad-when-query-caps.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index c8e6287a55..a4727e23ea 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/get-caps-from-<wbr>src-pad-when-query-caps.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/get-caps-from-<wbr>src-pad-when-query-caps.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From af0dac26f62aaceb4bf26672091195<wbr>3793e0fc5d=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 41de2ec64ab06bb58c82c1659adaa3<wbr>811bc5bcf8=
 Mon Sep 17 00:00:00 2001<br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From: zhouming &lt;<a href=3D"mai=
lto:b42586@freescale.com">b42586@freescale.com</a> &lt;mailto:<a href=3D"ma=
ilto:b42586@freescale.com">b42586@freescale.com</a>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Date: Wed, 14 May 2014 10:16=
:20 +0800<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Subject: [PATCH] ENGR00312515: get caps from =
src pad when query caps<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -8,18 +8,19 @@ <a href=3D"https://bugzilla.gnome=
.org/show_bug.cgi?id=3D728312" rel=3D"noreferrer" target=3D"_blank">https:/=
/bugzilla.gnome.org/<wbr>show_bug.cgi?id=3D728312</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://bugzilla.gnome.org/show_bug.=
cgi?id=3D728312" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnom=
e.org/<wbr>show_bug.cgi?id=3D728312</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Upstream-Status: Pending<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Signed-off-by: zhouming &lt;<a href=3D"mailto=
:b42586@freescale.com">b42586@freescale.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:b42586@freescal=
e.com">b42586@freescale.com</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0- gst-libs/gst/tag/gsttagdemux.c |=C2=A0 =C2=A013 +=
++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 mode change 100644 =3D&gt; 100755 gst-libs/g=
st/tag/gsttagdemux.c<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/gst-libs/gst/tag/<wbr>gsttagdemu=
x.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/gst-libs/gst/tag/<wbr>gsttagdemux.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0old mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0new mode 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0-index 9b6c478..ae2294a<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 8a127c8..71c5d78<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/gst-libs/gst/tag/<wbr>gsttagdemux.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/gst-libs/gst/tag/<wbr>gsttagdemux.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0-@@ -1769,6 +1769,19 @@ gst_tag_demux_pad_query (Gs=
tPad * pad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GstObject * parent, GstQuery * query)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -1759,6 +1759,19 @@ gst_tag_demux_pad_query (Gs=
tPad * pad,<br>
&gt;=C2=A0 =C2=A0 =C2=A0GstObject * parent, GstQuery * query)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -39,6 +40,3 @@ index 9b6c478..ae2294a<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D gst_pad_query_d=
efault (pad, parent, query);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-1.7.9.5<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/link-with-<wbr>libvchostif.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/link-with-<wbr>libvchostif.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..d5a7f6bdc2<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/link-with-<wbr>libvchostif.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,45 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 9866f51e5e0913f1e453eb574618bf<wbr>7432f38cb6=
 Mon Sep 17 00:00:00 2001<br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0+From: Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com">raj.khem@gmail.com</a> &lt;mailto:<a href=3D"mailto:raj.=
khem@gmail.com">raj.khem@gmail.com</a>&gt;&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+Date: Wed, 11 Apr 2018 10:4=
6:33 +0800<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] Add -lvchostif to link when using=
 -lEGL on rpi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+This is required because libEGL from userland uses=
 sybols<br>
&gt;=C2=A0 =C2=A0 =C2=A0+from this library.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+lib/libEGL.so.1.0.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 121: 00000000=C2=A0 =C2=A0 =C2=A00 FUNC=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0GLOBAL DEFAULT=C2=A0 UND vc_dispmanx_element_add<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 1552: 00000000=C2=A0 =C2=A0 =C2=A00 FUNC=C2=
=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 UND<br>
&gt;=C2=A0 =C2=A0 =C2=A0vc_dispmanx_element_add<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+These symbols are provided by libvchostif as seen =
below<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+lib/libvchostif.so<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0252: 0000b161=C2=A0 =C2=A0192 FUNC=C2=
=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A0 9<br>
&gt;=C2=A0 =C2=A0 =C2=A0vc_dispmanx_element_add<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0809: 0000b161=C2=A0 =C2=A0192 FUNC=C2=
=A0 =C2=A0 GLOBAL DEFAULT=C2=A0 =C2=A0 9<br>
&gt;=C2=A0 =C2=A0 =C2=A0vc_dispmanx_element_add<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+With this explicit link, plugins fail during runti=
me<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+(gst-plugin-scanner:571): GStreamer-WARNING **: Fa=
iled to load<br>
&gt;=C2=A0 =C2=A0 =C2=A0plugin &#39;/usr/lib/gstreamer-1.0/<wbr>libgstomx.s=
o&#39;: Error relocating<br>
&gt;=C2=A0 =C2=A0 =C2=A0/usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add=
: symbol not found<br>
&gt;=C2=A0 =C2=A0 =C2=A0+(gst-plugin-scanner:571): GStreamer-WARNING **: Fa=
iled to load<br>
&gt;=C2=A0 =C2=A0 =C2=A0plugin &#39;/usr/lib/gstreamer-1.0/<wbr>libgstopeng=
l.so&#39;: Error relocating<br>
&gt;=C2=A0 =C2=A0 =C2=A0/usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add=
: symbol not found<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Pending<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com">raj.khem@gmail.com</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:a=
nuj.mittal@intel.com">anuj.mittal@intel.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:anuj.mittal@intel.com"=
>anuj.mittal@intel.com</a>&gt;<wbr>&gt;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ m4/gst-gl.m4 | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 1e97240..ab7774c 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/m4/gst-gl.m4<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/m4/gst-gl.m4<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -231,7 +231,7 @@ case $host in<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_EGL=3Dyes<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_GLES2=3Dyes<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HAVE_EGL_RPI=3Dyes<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_LIBS=3D&quot;-lbcm_hos=
t -lvcos -lvchiq_arm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_LIBS=3D&quot;-lbcm_hos=
t -lvchostif -lvcos<br>
&gt;=C2=A0 =C2=A0 =C2=A0-lvchiq_arm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EGL_CFLAGS=3D&quot;&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE(USE_EGL_RP=
I, [1], [Use RPi<br>
&gt;=C2=A0 =C2=A0 =C2=A0platform])<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.7.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/make-gio_unix_2_<wbr>0-dependency-configurable.<wbr>pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/make-gio_unix_2_<wbr>0-dependency-configurable.<wbr>pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 413eff0695..23950b67f2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/make-gio_unix_2_<wbr>0-dependency-configurable.<wbr>pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1=
.0-<wbr>plugins-base/make-gio_unix_2_<wbr>0-dependency-configurable.<wbr>pa=
tch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-From 10d2a977ee1d469f0bf9059bb2d0b5<wbr>5fd2eecbac=
 Mon Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From 7ffa6e3d00e1d8a060f3f4c2bb9a72<wbr>691af05d79=
 Mon Sep 17 00:00:00 2001<br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From: Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Date: Wed, 20 Jan 2016 13:00=
:00 -0800<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Subject: [PATCH] make gio_unix_2_0 dependency=
 configurable<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -17,16 +17,17 @@ instead of AG_GST_CHECK_FEATURE=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Upstream-Status: Pending<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Signed-off-by: Andre McCurdy &lt;<a href=3D"m=
ailto:armccurdy@gmail.com">armccurdy@gmail.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:armccurdy@gmail=
.com">armccurdy@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 <a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt; | 7 +++=
++++<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 1 file changed, 7 insertion=
s(+)<br>
&gt; <br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0diff --git a/<a href=3D"http://configu=
re.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D=
"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure=
.ac</a>&gt; b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">http://configure.ac</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-index 9c52aeb..26cacd6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 12807bc..35a0bf3 100644<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0--- a/<a href=3D"http://configure.ac" =
rel=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http:/=
/configure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"=
noreferrer" target=3D"_blank">configure.ac</a> &lt;<a href=3D"http://config=
ure.ac" rel=3D"noreferrer" target=3D"_blank">http://configure.ac</a>&gt;<br=
>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-@@ -752,9 +752,16 @@ AC_SUBST(FT2=
_CFLAGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- fi dnl of EXT plugins<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -806,9 +806,16 @@ AM_CONDITIONAL(HAVE_PNG, test=
 &quot;x$HAVE_PNG&quot; =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;xyes&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ AM_CONDITIONAL(HAVE_JPEG, test &quot;x$HAVE_JPEG&=
quot; =3D &quot;xyes&quot;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 dnl *** gio-unix-2.0 for tests/check/pipelin=
es/tcp.c ***<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0+AC_ARG_ENABLE([gio_unix_2_0]<wbr>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -42,6 +43,3 @@ index 9c52aeb..26cacd6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 AM_CONDITIONAL(USE_GIO_UNIX_2_<wbr>0, test &=
quot;x$HAVE_GIO_UNIX_2_0&quot; =3D &quot;xyes&quot;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 dnl *** finalize CFLAGS, LDFLAGS, LIBS<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0-1.9.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-base_1.12.4.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0-<wbr>plugins-base_1.12.4.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-b=
ase_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plu=
gins-<wbr>base_1.12.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-base_1.12.4.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0-<wbr>plugins-base_1.12.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-base_1.1=
2.4.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-<w=
br>base_1.12.4.bb</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index dd895bbcb1..0000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-base_1.12.4.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0-<wbr>plugins-base_1.12.4.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-b=
ase_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plu=
gins-<wbr>base_1.12.4.bb</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,18 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-require gstreamer1.0-plugins-base.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D<wbr>c54ce9345727175ff66=
d17b67ff51f<wbr>58 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://COPYING.LIB;md5=3D<wbr>6762ed442b3822387a51c=
92d928ead<wbr>0d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 file://common/coverage/<a href=3D"http://coverage-repo=
rt.pl" rel=3D"noreferrer" target=3D"_blank">coverag<wbr>e-report.pl</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://coverage-report.pl" re=
l=3D"noreferrer" target=3D"_blank">http://coverage-report.pl</a>&gt;;<wbr>b=
eginline=3D2;endline=3D17;md5=3D<wbr>a4e1830fce078028c8f09741612726<wbr>07&=
quot;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer.freedesktop.org/src/gst=
-plugins-base/gst-plugins-base-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_=
blank">http://gstreamer.freedesktop.<wbr>org/src/gst-plugins-base/gst-<wbr>=
plugins-base-${PV}.tar.xz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer.freedesktop.org/src=
/gst-plugins-base/gst-plugins-base-${PV}.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">http://gstreamer.freedesktop.<wbr>org/src/gst-plugins-base/gst-=
<wbr>plugins-base-${PV}.tar.xz</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 file://get-caps-from-src-pad-<wbr>wh=
en-query-caps.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 file://0003-ssaparse-enhance-<wbr>SS=
A-text-lines-parsing.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0004-subparse-set-need_<wbr>segment-after-si=
nk-pad-<wbr>received-GS.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 file://make-gio_unix_2_0-<wbr>depend=
ency-configurable.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-introspection.m4-<wbr>prefix-pkgconfig-=
paths-with-<wbr>PKG_CON.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI[md5sum] =3D &quot;<wbr>b35b04071f69b8ab69a=
7f3a497ff01<wbr>31&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<wbr>4c306b03df0212f1b8903784e29bb3<wbr>49331=
9ba19ebebf13b0c56a1787029<wbr>2282&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-S =3D &quot;${WORKDIR}/gst-plugins-base-$<wbr>{PV}=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0-<wbr>plugins-base_1.14.0.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-b=
ase_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plu=
gins-<wbr>base_1.14.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0-<wbr>plugins-base_1.14.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-base_1.1=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plugins-<w=
br>base_1.14.0.bb</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..370cd0368c<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D=
"http://gstreamer1.0-plugins-base_1.14.0.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0-<wbr>plugins-base_1.14.0.bb</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0-plugins-b=
ase_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0-plu=
gins-<wbr>base_1.14.0.bb</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,70 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+require gstreamer1.0-plugins.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+LICENSE =3D &quot;GPLv2+ &amp; LGPLv2+&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D<wbr>c54ce9345727175ff66=
d17b67ff51f<wbr>58 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://COPYING.LIB;md5=3D<wbr>6762ed442b3822387a51c=
92d928ead<wbr>0d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 file://common/coverage/<a href=3D"http://coverage-repo=
rt.pl" rel=3D"noreferrer" target=3D"_blank">coverag<wbr>e-report.pl</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://coverage-report.pl" re=
l=3D"noreferrer" target=3D"_blank">http://coverage-report.pl</a>&gt;;<wbr>b=
eginline=3D2;endline=3D17;md5=3D<wbr>a4e1830fce078028c8f09741612726<wbr>07&=
quot;<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer.freedesktop.org/src/gst=
-plugins-base/gst-plugins-base-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_=
blank">http://gstreamer.freedesktop.<wbr>org/src/gst-plugins-base/gst-<wbr>=
plugins-base-${PV}.tar.xz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer.freedesktop.org/src=
/gst-plugins-base/gst-plugins-base-${PV}.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">http://gstreamer.freedesktop.<wbr>org/src/gst-plugins-base/gst-=
<wbr>plugins-base-${PV}.tar.xz</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://g=
et-caps-from-src-pad-<wbr>when-query-caps.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0=
003-ssaparse-enhance-<wbr>SSA-text-lines-parsing.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://m=
ake-gio_unix_2_0-<wbr>dependency-configurable.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-introspection.m4-<wbr>prefix-pkgconfig-=
paths-with-<wbr>PKG_CON.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-don-t-<wbr>hardcode-libtool=
-name-when-<wbr>running.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0002-Makefile.am-<wbr>prefix-calls-to-pkg-co=
nfig-<wbr>with-PKG_CONF.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0003-riff-add-missing-<wbr>include-directori=
es-when-<wbr>calling-in.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0004-rtsp-drop-<wbr>incorrect-reference-to-<=
wbr>gstreamer-sdp-in-Ma.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0=
009-glimagesink-<wbr>Downrank-to-marginal.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-gstreamer-gl.pc.<wbr>in-don-t-append-GL=
_CFLAGS-to-<wbr>CFLAGS.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://l=
ink-with-libvchostif.<wbr>patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI[md5sum] =3D &quot;<wbr>370271327dd23110421=
a9c2927ac98<wbr>9a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<wbr>7e904660ff56e02b036cf7fdfb77a5<wbr>0a540=
828ca9d2614d69ba931772e5b<wbr>6940&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+S =3D &quot;${WORKDIR}/gst-plugins-base-$<wbr>{PV}=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+DEPENDS +=3D &quot;iso-codes util-linux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+inherit gettext<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGES_DYNAMIC =3D+ &quot;^libgst.*&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG_GL ?=3D &quot;${@bb.utils.contains(&=
#39;DISTRO_<wbr>FEATURES&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;opengl&#39;, &#39;gles2 egl&#39;, &#39;&#39;, =
d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG ??=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 ${GSTREAMER_ORC} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_<wbr>=
FEATURES&#39;, &#39;alsa x11&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 gio-unix-2.0 ogg pango theora vorbis=
 zlib jpeg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 ${PACKAGECONFIG_GL} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_<wb=
r>FEATURES&#39;, &#39;wayland&#39;, &#39;wayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0egl&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+X11DEPENDS =3D &quot;virtual/libx11 libsm libxrend=
er libxv&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+X11ENABLEOPTS =3D &quot;--enable-x --enable-xvideo=
 --enable-xshm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+X11DISABLEOPTS =3D &quot;--disable-x --disable-xvi=
deo --disable-xshm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[alsa]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;--enable-alsa,--disable-alsa,<wbr>alsa-lib&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[cdparanoia]=C2=A0 =C2=A0=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-cdparanoia,--<wbr>disable-cdparanoia=
,cdparanoia&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[gio-unix-2.0] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-gio_unix_2_0,--<wbr>disable-gio_unix=
_2_0,glib-2.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[ivorbis]=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-ivorbis,--disable-<wbr>ivorbis,tremo=
r&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[ogg]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;--enable-ogg,--disable-ogg,<wbr>libogg&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[opus]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;--enable-opus,--disable-opus,<wbr>libopus&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[pango]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;--enable-pango,--disable-<wbr>pango,pango&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[theora]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-theora,--disable-<wbr>theora,libtheo=
ra&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[visual]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-libvisual,--disable-<wbr>libvisual,l=
ibvisual&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[vorbis]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-vorbis,--disable-<wbr>vorbis,libvorb=
is&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${X11ENABLEOPTS},${<wbr>X11DISABLEOPTS},${X11=
DEPENDS}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[zlib]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;--enable-zlib,--disable-zlib,<wbr>zlib&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[opengl]=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-opengl,--disable-<wbr>opengl,virtual=
/libgl libglu&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[gles2]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-gles2,--disable-<wbr>gles2,virtual/l=
ibgles2&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[egl]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;--enable-egl,--disable-egl,<wbr>virtual/egl&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =C2=A0 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-wayland,--disable-<wbr>wayland,wayla=
nd-native wayland<br>
&gt;=C2=A0 =C2=A0 =C2=A0wayland-protocols libdrm&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[jpeg]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;,,jpeg&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+FILES_${MLPREFIX}libgsttag-1.<wbr>0 +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${datadir}/gst-plugins-base/<wbr>1.0/license-=
translations.dict&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+do_compile_prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 export<br>
&gt;=C2=A0 =C2=A0 =C2=A0GIR_EXTRA_LIBS_PATH=3D&quot;${B}/gst-<wbr>libs/gst/=
tag/.libs:${B}/gst-<wbr>libs/gst/video/.libs:${B}/gst-<wbr>libs/gst/audio/.=
libs:${B}/gst-<wbr>libs/gst/rtp/.libs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+FILES_${PN}-dev +=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${libdir}/gstreamer-${LIBV}/<wbr>include/gst/=
gl/gstglconfig.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.14.1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0______________________________<wbr>________________=
_<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedd=
ed-core@lists.openembedded.org">Openembedded-core@<wbr>lists.openembedded.o=
rg</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.<wbr>org/mailman/listinfo/<wbr>openembedded-core</a>&gt;<=
br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div><br></div>

--0000000000006eef31056b610767--
