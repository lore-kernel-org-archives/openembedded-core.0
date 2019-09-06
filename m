Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5860B7F402
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:26:31 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id o11so5774468qkg.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=egoRPzunzAtrMCFIWe1vuSbCFFCV2MBE0g/TEalZ3Ws=;
	b=FHETjWPCoT4L5qmSTjWAGPZgoElgtY2eYyJoc2ZVbErqfEF+VtyMiXQfkvvKvOngQ9
	0OBTm+RQ2ZyrS1XeQAK+OcIGG/iuoMEBr94U4l2LbFNUzwwi9gKHbm08/2Y/AIrmnsOC
	ymu0LXOFk6Gdp4dg0Ot/Ymwh+AkMKA5Qeur2+1IGFo8/P4Yo5YPguSNLA93vhr4o4Mpo
	M2cgI/P7mtXMGei9RRWZ/Z8yslS1Zktv+deUPPyu9S+Qnve2nDmjQIzkXmd/ue/8CLuD
	fgSOPoSphmUgEVzcoDAJrzdFRsY9JM3DIUTE045Vk2ExroqfdA51ZJDq0yqPgHQ13NnY
	boOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=egoRPzunzAtrMCFIWe1vuSbCFFCV2MBE0g/TEalZ3Ws=;
	b=IIAl010puZAS8ZzNdVQO3AYH1oaYOD4g382j7FQlJCJyFu/OTDPsiA5EWF8tAIrYy3
	PX/TATFYVt7KlLhsjqjOrPVVS1f6yV8tp0ZqeLd0+moym8D5LBa9aM54cNut+wih0z7S
	5z53pmIjclTHBj5TQjtgGyV4CvqKBHHFcSULzLGRJ0T1dxfTqHGMB6ust9WTlSrEVE20
	eO+qjq8T6D87uEX6AQbpayXAd4TCQDDFXR1/A9Qi0t+knLPXvve+ev02odA7DszdmXSX
	1ZRzz4aTO6lrbp9tiyTSMPdfPO635SXX24QWIbxBnhpoMZTPYW5Gk6SzbxI0cLmIdmyY
	a9HA==
X-Gm-Message-State: APjAAAXv/AQw+iA3kX8wsSuYtmA6aQkCW+9A3YZq6p3BfOFMqNthfl7O
	I+mV8X+3BozocsmZvI52YuPZOSw/K0xoJtzEOxI=
X-Google-Smtp-Source: APXvYqwST0YU6Nech+kJ1hbtoM/8p8Q9GDObcEgMOq6QpFFSylmR6RAlLyRg64/9dwKEpLGOQRWAOCYPz1rOwDi7Nj8=
X-Received: by 2002:a37:e40b:: with SMTP id y11mr7489781qkf.9.1567779992014;
	Fri, 06 Sep 2019 07:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567765705.git.alex.kanavin@gmail.com>
	<6e77eaadaddda55437eb3fabda41f66eb7d79356.1567765705.git.alex.kanavin@gmail.com>
In-Reply-To: <6e77eaadaddda55437eb3fabda41f66eb7d79356.1567765705.git.alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 07:26:21 -0700
Message-ID: <CAMKF1srkdsYYz+s6Q8es+k-L11fd+FN+99AsFyJ2nZqD0a8diQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
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
X-List-Received-Date: Fri, 06 Sep 2019 14:26:31 -0000
Content-Type: multipart/alternative; boundary="00000000000082a23e0591e339c0"

--00000000000082a23e0591e339c0
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019 at 4:18 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This will allow better control over native virgl/qemu configurations.
>
> Adjust gtk+3/cairo native configurations to actually ignore opengl
> when building for -native: we do not need it, and it would cause build
> failures as only a limited subset of mesa-native is currently built.
>
> Drop native/nativesdk overrides from virglrenderer/libepoxy recipes
> as opengl feature is now correctly set for those variants.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/bitbake.conf                                     | 4 ++--
>  meta/recipes-gnome/gtk+/gtk+3.inc                          | 2 ++
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb                | 2 ++
>  meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb           | 2 --
>  meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb | 2 --
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a0a7f4911e0..d36f4c6ccef 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -824,8 +824,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
>
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
> -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
> +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
> +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
>
>  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit
> gobject-introspection-data ldconfig"
>  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc
> b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 77b6c31536b..2f9e05b1cd4 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -47,6 +47,8 @@ do_compile_prepend() {
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland
> x11', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11',
> 'glx', '', d)}"
> +PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
>

Should we extend distro features to non target recipes as well I wonder
since I might have a development system which has full x11 and capable of
running GTK with X11 but target maybe not will
So is distro feature in someway related in these
Different classes of recipes ?

>
>  PACKAGECONFIG[x11] =
> "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11
> libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite
> libxfixes"
>  # this is provided by oe-core patch that removes epoxy/gl dependency from
> a X11 build
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index f32e9ba1bcd..84c7b0adde9 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -41,6 +41,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
> xcb', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> 'opengl', '', d)}"
> +PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11 xcb', '', d)}"
> +PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11 xcb', '', d)}"
>
>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no
> --disable-xlib,${X11DEPENDS}"
>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> index c8d1650c637..5d7639a929e 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
> @@ -14,8 +14,6 @@ UPSTREAM_CHECK_URI = "
> https://github.com/anholt/libepoxy/releases"
>  inherit meson pkgconfig distro_features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
> -REQUIRED_DISTRO_FEATURES_class-native = ""
> -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
>
>  PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
>  PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
> b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
> index d2b11c103a3..65365eb900a 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
> @@ -17,5 +17,3 @@ inherit autotools pkgconfig distro_features_check
>  BBCLASSEXTEND = "native nativesdk"
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
> -REQUIRED_DISTRO_FEATURES_class-native = ""
> -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000082a23e0591e339c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><br></div></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2019 at 4:18 AM Alexan=
der Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This will allo=
w better control over native virgl/qemu configurations.<br>
<br>
Adjust gtk+3/cairo native configurations to actually ignore opengl<br>
when building for -native: we do not need it, and it would cause build<br>
failures as only a limited subset of mesa-native is currently built.<br>
<br>
Drop native/nativesdk overrides from virglrenderer/libepoxy recipes<br>
as opengl feature is now correctly set for those variants.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 4 ++--<br>
=C2=A0meta/recipes-gnome/gtk+/gtk+3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D=
"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libepoxy_1.5.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb</a> | =
2 --<br>
=C2=A05 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index a0a7f4911e0..d36f4c6ccef 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -824,8 +824,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
<br>
=C2=A0# Normally target distro features will not be applied to native build=
s:<br>
=C2=A0# Native distro features on this list will use the target feature val=
ue<br>
-DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation&quot;<br>
-DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation&quot;<br>
+DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation opengl&quot;<br=
>
+DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation opengl&quot;=
<br>
<br>
=C2=A0DISTRO_FEATURES_BACKFILL =3D &quot;pulseaudio sysvinit gobject-intros=
pection-data ldconfig&quot;<br>
=C2=A0MACHINE_FEATURES_BACKFILL =3D &quot;rtc qemu-usermode&quot;<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc<br>
index 77b6c31536b..2f9e05b1cd4 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+3.inc<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc<br>
@@ -47,6 +47,8 @@ do_compile_prepend() {<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;opengl wayland x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl x11&#39;, &#39;glx&#=
39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATUR=
ES&#39;, &#39;x11&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEA=
TURES&#39;, &#39;x11&#39;, d)}&quot;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Should we extend=
 distro features to non target recipes as well I wonder since I might have =
a development system which has full x11 and capable of running GTK with X11=
 but target maybe not will</div><div dir=3D"auto">So is distro feature in s=
omeway related in these</div><div dir=3D"auto">Different classes of recipes=
 ?</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-x11-backend,--disable-x11-backe=
nd,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxra=
ndr libxrender libxcomposite libxfixes&quot;<br>
=C2=A0# this is provided by oe-core patch that removes epoxy/gl dependency =
from a X11 build<br>
diff --git a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> b/meta/recipes-gr=
aphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D"noreferrer" target=
=3D"_blank">cairo_1.16.0.bb</a><br>
index f32e9ba1bcd..84c7b0adde9 100644<br>
--- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D=
"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
+++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D=
"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
@@ -41,6 +41,8 @@ X11DEPENDS =3D &quot;virtual/libx11 libsm libxrender libx=
ext&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;directfb&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;=
, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;, &#39;openg=
l&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--with-x=3Dyes -enable-xlib,--with-x=3Dn=
o --disable-xlib,${X11DEPENDS}&quot;<br>
=C2=A0PACKAGECONFIG[xcb] =3D &quot;--enable-xcb,--disable-xcb,libxcb&quot;<=
br>
diff --git a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.=
3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.3.bb</a> b/meta/rec=
ipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.3.bb" rel=3D"noreferr=
er" target=3D"_blank">libepoxy_1.5.3.bb</a><br>
index c8d1650c637..5d7639a929e 100644<br>
--- a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libepoxy_1.5.3.bb</a><br>
+++ b/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libepoxy_1.5.3.bb</a><br>
@@ -14,8 +14,6 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.co=
m/anholt/libepoxy/releases" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/anholt/libepoxy/releases</a>&quot;<br>
=C2=A0inherit meson pkgconfig distro_features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
-REQUIRED_DISTRO_FEATURES_class-native =3D &quot;&quot;<br>
-REQUIRED_DISTRO_FEATURES_class-nativesdk =3D &quot;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[egl] =3D &quot;-Degl=3Dyes, -Degl=3Dno, virtual/egl&quo=
t;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;-Dglx=3Dyes, -Dglx=3Dno, virtual/libx11 =
virtual/libgl&quot;<br>
diff --git a/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglren=
derer_0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb=
</a> b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_=
0.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb</a><b=
r>
index d2b11c103a3..65365eb900a 100644<br>
--- a/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb</a><br=
>
+++ b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrenderer_0=
.8.0.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.0.bb</a><br=
>
@@ -17,5 +17,3 @@ inherit autotools pkgconfig distro_features_check<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
-REQUIRED_DISTRO_FEATURES_class-native =3D &quot;&quot;<br>
-REQUIRED_DISTRO_FEATURES_class-nativesdk =3D &quot;&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000082a23e0591e339c0--
