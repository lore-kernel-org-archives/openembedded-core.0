Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web12.3660.1588064126624932857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 01:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gkhxq0pv;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id m9so6902160uaq.12
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VmaBdJU8ym2zT4M2t0S7EAgv0WZBegExbFdj/03PZ9A=;
        b=Gkhxq0pv0SbB0MpIHWL7nCXSHofeh3PBEBmAxXO8T0EqwVIWvjWU/5beQduejTxm7U
         Qn2jwo90n3P3w7hggldmy/nFyRpse1DgxSGszxVZfBPjSH53BYYb4i4W3kRWkeX/oijf
         kl+KfVWiNgXfRtGJtet+RR9XSqb9K/1R+D4ZA1TtkxDy/I6dzoqg2gwlrjX28+LB2GD2
         LKEdTJq3NVvOFBEhPuhH6B4X+5Hxy1S2RJtsiRFCeZCtsEYRfhlYvc9nK+fsTzWzS8hA
         hzz/TWPGuapWp39EOL3s1dSVnSxKoX7ArkMHs48MCP0cUyajwb5qcUT9nyTVsr3sea6o
         4FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VmaBdJU8ym2zT4M2t0S7EAgv0WZBegExbFdj/03PZ9A=;
        b=n3T70LfxJHasKzPssKEHAd6DIllToMYryk5e294MSS+5x1hYmJRdAcWCp1BFxXPE5i
         Rn/Ojdh+mMdo9BJNXsMFCVO1ndKC1kQC1bZFFxQgy+w9nZ45DvKsaNVa90eNtwqpYMR4
         sPwMoy4tysxr3sjJtNfwMFMf8nXxntObGO9pLRBgBtRs4OitK2S3PP5H0geZ7RAVejKE
         PllzT3NG8Z6fP0E3sU4B4Zl7LIwLaCvvuxWlCp5eOT7/ExuuHPjzGImnyu/pD1oiPVIB
         i1HoU5fQtfBI01iVghehGnBu4Wfrh//4VoNR+pNkH4A+S4vRj6ARRKKOBDKYg9kUOWuW
         1vkw==
X-Gm-Message-State: AGi0PuY0YWfncLazLHDrsQnTd4th+1bLL6B6gjJcP8JvDAzyub0Gwu3d
	9BfGs6nWoo0guzKqRrzUQHI3oCR95/sIt8I9j3k=
X-Google-Smtp-Source: APiQypJKZsHzaHRN4G7Ea1WxIygcKd8/5TdlJXhdxvrt5+dw9EfsjRuTexS/FfIKPVH/XG68To2OsrQPea02XYQ+gpw=
X-Received: by 2002:a67:b64c:: with SMTP id e12mr19321430vsm.94.1588064125776;
 Tue, 28 Apr 2020 01:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587841042.git.alex.kanavin@gmail.com> <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
 <CAMKF1sqcE5Q=NiXaK+ZE1MnR3BwhCzfaFo3f-neLWQK9fT_Kkg@mail.gmail.com>
In-Reply-To: <CAMKF1sqcE5Q=NiXaK+ZE1MnR3BwhCzfaFo3f-neLWQK9fT_Kkg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 28 Apr 2020 10:55:14 +0200
Message-ID: <CANNYZj-f31GWPne1JVVUvZQFtXR1v2QcAOw-P5ANSE2hkr2B9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000018f6dc05a455fe1e"

--00000000000018f6dc05a455fe1e
Content-Type: text/plain; charset="UTF-8"

ERROR: The file /usr/lib/libEGL.so is installed by both mesa-native
and mali-450-native, aborting

This one is on the meta-odroid/recipes-graphics/mali/mali-450_r7p0.bb
I'm afraid. mali-450 contains a prebuilt binary for ARM, and so
shouldn't even be available in -native (or in qemu target, for that
matter, as qemu will likely never emulate that GPU).

Alex


On Tue, 28 Apr 2020 at 03:03, Khem Raj <raj.khem@gmail.com> wrote:

> This causes
>
> https://errors.yoctoproject.org/Errors/Details/409117/
> https://errors.yoctoproject.org/Errors/Details/409060/
>
> for most of qemu machines.
>
> On Sat, Apr 25, 2020 at 12:00 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This will allow better control over native virgl/qemu configurations.
> >
> > Adjust gtk+3/cairo native configurations to actually ignore opengl
> > when building for -native: we do not need it, and it would cause build
> > failures as only a limited subset of mesa-native is currently built.
> >
> > Drop native/nativesdk overrides from virglrenderer/libepoxy recipes
> > as opengl feature is now correctly set for those variants.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/bitbake.conf                                     | 4 ++--
> >  meta/recipes-gnome/gtk+/gtk+3.inc                          | 2 ++
> >  meta/recipes-graphics/cairo/cairo_1.16.0.bb                | 2 ++
> >  meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb           | 2 --
> >  meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 --
> >  5 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 4b544a22cd..6f3536eff4 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -829,8 +829,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
> >
> >  # Normally target distro features will not be applied to native builds:
> >  # Native distro features on this list will use the target feature value
> > -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
> > -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
> > +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
> > +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
> >
> >  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit
> gobject-introspection-data ldconfig"
> >  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> > diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc
> b/meta/recipes-gnome/gtk+/gtk+3.inc
> > index 5d1f59ea1a..6154154004 100644
> > --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> > +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> > @@ -46,6 +46,8 @@ do_compile_prepend() {
> >
> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl
> wayland x11', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl
> x11', 'glx', '', d)}"
> > +PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> > +PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> >
> >  PACKAGECONFIG[x11] =
> "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11
> libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite
> libxfixes"
> >  # this is provided by oe-core patch that removes epoxy/gl dependency
> from a X11 build
> > diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > index b772c2ece2..092c77b826 100644
> > --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > @@ -42,6 +42,8 @@ PACKAGECONFIG ??=
> "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
> xcb', '', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> opengl', 'opengl', '', d)} \
> >                     trace"
> > +PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11 xcb', '', d)}"
> > +PACKAGECONFIG_class-nativesdk =
> "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
> >
> >  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no
> --disable-xlib,${X11DEPENDS}"
> >  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> > diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> > index af9867407e..1aa850d004 100644
> > --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> > +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> > @@ -19,8 +19,6 @@ UPSTREAM_CHECK_URI = "
> https://github.com/anholt/libepoxy/releases"
> >  inherit meson pkgconfig features_check
> >
> >  REQUIRED_DISTRO_FEATURES = "opengl"
> > -REQUIRED_DISTRO_FEATURES_class-native = ""
> > -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> >
> >  PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
> >  PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11
> virtual/libgl"
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > index 1046b8504f..29b12628d0 100644
> > --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > @@ -22,5 +22,3 @@ inherit meson pkgconfig features_check
> >  BBCLASSEXTEND = "native nativesdk"
> >
> >  REQUIRED_DISTRO_FEATURES = "opengl"
> > -REQUIRED_DISTRO_FEATURES_class-native = ""
> > -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> > --
> > 2.26.1
> >
> > 
>

--00000000000018f6dc05a455fe1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr"><pre>ERROR: The file /usr/lib/libEGL.so is installed by both mesa-na=
tive and mali-450-native, aborting<br><br></pre><pre><font face=3D"arial,sa=
ns-serif">This one is on the </font>meta-odroid/recipes-graphics/mali/<a hr=
ef=3D"http://mali-450_r7p0.bb">mali-450_r7p0.bb</a> <font face=3D"arial,san=
s-serif">I&#39;m afraid. mali-450 contains a prebuilt binary for ARM, and s=
o shouldn&#39;t even be available in -native (or in qemu target, for that m=
atter, as qemu will likely never emulate that GPU).<br><br></font></pre><pr=
e><font face=3D"arial,sans-serif">Alex<br></font></pre></div><div dir=3D"lt=
r" class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, 28 Apr 2020 at 03:03, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">This causes<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/409117/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/409117/</a><br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/409060/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/409060/</a><br>
<br>
for most of qemu machines.<br>
<br>
On Sat, Apr 25, 2020 at 12:00 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This will allow better control over native virgl/qemu configurations.=
<br>
&gt;<br>
&gt; Adjust gtk+3/cairo native configurations to actually ignore opengl<br=
>
&gt; when building for -native: we do not need it, and it would cause buil=
d<br>
&gt; failures as only a limited subset of mesa-native is currently built.<=
br>
&gt;<br>
&gt; Drop native/nativesdk overrides from virglrenderer/libepoxy recipes<b=
r>
&gt; as opengl feature is now correctly set for those variants.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 meta/recipes-gnome/gtk+/gtk+3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" =
rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
&gt;=C2=A0 meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrend=
erer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb<=
/a> | 2 --<br>
&gt;=C2=A0 5 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 4b544a22cd..6f3536eff4 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -829,8 +829,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br=
>
&gt;<br>
&gt;=C2=A0 # Normally target distro features will not be applied to native=
 builds:<br>
&gt;=C2=A0 # Native distro features on this list will use the target featu=
re value<br>
&gt; -DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation&quot;<br>
&gt; -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation&quot;<=
br>
&gt; +DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation opengl&qu=
ot;<br>
&gt; +DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation opengl=
&quot;<br>
&gt;<br>
&gt;=C2=A0 DISTRO_FEATURES_BACKFILL =3D &quot;pulseaudio sysvinit gobject-=
introspection-data ldconfig&quot;<br>
&gt;=C2=A0 MACHINE_FEATURES_BACKFILL =3D &quot;rtc qemu-usermode&quot;<br>
&gt; diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/g=
tk+/gtk+3.inc<br>
&gt; index 5d1f59ea1a..6154154004 100644<br>
&gt; --- a/meta/recipes-gnome/gtk+/gtk+3.inc<br>
&gt; +++ b/meta/recipes-gnome/gtk+/gtk+3.inc<br>
&gt; @@ -46,6 +46,8 @@ do_compile_prepend() {<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATUR=
ES&#39;, &#39;opengl wayland x11&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl x11&#39;=
, &#39;glx&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +PACKAGECONFIG_class-native =3D &quot;${@bb.utils.filter(&#39;DISTRO_=
FEATURES&#39;, &#39;x11&#39;, d)}&quot;<br>
&gt; +PACKAGECONFIG_class-nativesdk =3D &quot;${@bb.utils.filter(&#39;DIST=
RO_FEATURES&#39;, &#39;x11&#39;, d)}&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;--enable-x11-backend,--disable-x11=
-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage =
libxrandr libxrender libxcomposite libxfixes&quot;<br>
&gt;=C2=A0 # this is provided by oe-core patch that removes epoxy/gl depen=
dency from a X11 build<br>
&gt; diff --git a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16=
.0.bb" rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> b/meta/reci=
pes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; index b772c2ece2..092c77b826 100644<br>
&gt; --- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" =
rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; +++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" =
rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; @@ -42,6 +42,8 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;D=
ISTRO_FEATURES&#39;, &#39;directfb&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;=
x11 xcb&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;=
, &#39;opengl&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0trace&quot;<br>
&gt; +PACKAGECONFIG_class-native =3D &quot;${@bb.utils.contains(&#39;DISTR=
O_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;<br=
>
&gt; +PACKAGECONFIG_class-nativesdk =3D &quot;${@bb.utils.contains(&#39;DI=
STRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;=
<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;--with-x=3Dyes -enable-xlib,--with=
-x=3Dno --disable-xlib,${X11DEPENDS}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[xcb] =3D &quot;--enable-xcb,--disable-xcb,libxcb&=
quot;<br>
&gt; diff --git a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepox=
y_1.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a> b/me=
ta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4.bb" rel=3D"no=
referrer" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
&gt; index af9867407e..1aa850d004 100644<br>
&gt; --- a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
&gt; +++ b/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
&gt; @@ -19,8 +19,6 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://git=
hub.com/anholt/libepoxy/releases" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/anholt/libepoxy/releases</a>&quot;<br>
&gt;=C2=A0 inherit meson pkgconfig features_check<br>
&gt;<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt; -REQUIRED_DISTRO_FEATURES_class-native =3D &quot;&quot;<br>
&gt; -REQUIRED_DISTRO_FEATURES_class-nativesdk =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[egl] =3D &quot;-Degl=3Dyes, -Degl=3Dno, virtual/e=
gl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;-Dglx=3Dyes, -Dglx=3Dno -Dx11=3Dfa=
lse, virtual/libx11 virtual/libgl&quot;<br>
&gt; diff --git a/meta/recipes-graphics/virglrenderer/<a href=3D"http://vi=
rglrenderer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.=
8.2.bb</a> b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglren=
derer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb=
</a><br>
&gt; index 1046b8504f..29b12628d0 100644<br>
&gt; --- a/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrend=
erer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb<=
/a><br>
&gt; +++ b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrend=
erer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb<=
/a><br>
&gt; @@ -22,5 +22,3 @@ inherit meson pkgconfig features_check<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt; -REQUIRED_DISTRO_FEATURES_class-native =3D &quot;&quot;<br>
&gt; -REQUIRED_DISTRO_FEATURES_class-nativesdk =3D &quot;&quot;<br>
&gt; --<br>
&gt; 2.26.1<br>
&gt;<br>
&gt; <br>
</blockquote></div></div>

--00000000000018f6dc05a455fe1e--
