Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id CF99A6AD42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 21:11:20 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p60so954458wes.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 14:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vE+qgMMKgYY7W5gdsA8hNuMavDr0CExJ6JMCG2tAt9U=;
	b=GQLy8ZGMv3gAdbxrsUDET09zBbbvLgYjNMS1YavBGmK3kGYCOasxE+2f6p/RDB4ROS
	K6XG2uyxfdtwkWk2LeMD/NdwHWVVNd8UWvPf3zvYZW2UQzVZJLaP6CjLBOOAluieyYL0
	uv7kKZeLEP22/HS9IAe3H6pzmBJ2A21w7wSZjdz3UDe7mgq9PjBjaRAw5OSbaaMaj8XD
	0QYL4Y71aSEU551GJb7i9gnlQPDarxQKwhIUqroNWM1udBIl08NC4nDXKSwlRGPF1u8H
	IRmpLM+MaiVQpxSMOOCiNF0PyUIyZ5GvG1d+Ct3e60y0ezJB4U7mZw+zOPScIIkIlf0s
	pFSA==
MIME-Version: 1.0
X-Received: by 10.194.234.100 with SMTP id ud4mr7492687wjc.44.1372367480739;
	Thu, 27 Jun 2013 14:11:20 -0700 (PDT)
Received: by 10.194.16.136 with HTTP; Thu, 27 Jun 2013 14:11:20 -0700 (PDT)
In-Reply-To: <CAJTo0Laa3ed2qVqbAsMUmnEmispMprkyJJmKr9sTt3XO_7c_vw@mail.gmail.com>
References: <1372174723-24943-1-git-send-email-nicolas.dechesne@linaro.org>
	<20130627180228.GI3261@jama>
	<CAJTo0Laa3ed2qVqbAsMUmnEmispMprkyJJmKr9sTt3XO_7c_vw@mail.gmail.com>
Date: Thu, 27 Jun 2013 23:11:20 +0200
Message-ID: <CA+chaQfOeZGc5bXe=FemuADt5L5AJth4JnofrjrEcKaLHh1EDA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"patches@linaro.org" <patches@linaro.org>
Subject: Re: [dylan][PATCH] mesa: fix EGL compilation without X11 headers
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
X-List-Received-Date: Thu, 27 Jun 2013 21:11:21 -0000
Content-Type: multipart/alternative; boundary=089e01493b6830dd0c04e02934bd

--089e01493b6830dd0c04e02934bd
Content-Type: text/plain; charset=UTF-8

Almost all of them :)

PACKAGECONFIG = "egl gles dri wayland gallium gallium-llvmpipe openvg"


On Thu, Jun 27, 2013 at 11:00 PM, Burton, Ross <ross.burton@intel.com>wrote:

> I'm actively fixing this upstream now, so I will make sure this is sorted.
>  What PACKAGECONFIG are you using?
>
> Ross
>
>
> On Thursday, 27 June 2013, Martin Jansa wrote:
>
>> On Tue, Jun 25, 2013 at 05:38:43PM +0200, Nicolas Dechesne wrote:
>> > Extracted from "d7033f4 mesa: upgrade to 9.1.3", already merged in
>> master:
>> >
>> > --
>> > Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build
>> correctly in
>> > a non-X11 environment.
>> >
>> > Drop fix-egl-compilation-without-x11-headers.patch as they were
>> backports.
>> > --
>> >
>> > The new patch was also backported (trivial) to mesa 9.0.2 which is in
>> > dylan.
>> >
>> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> > ---
>> >  meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   2 +-
>> >  ...ate-NativeDisplayType-depending-on-config.patch | 361
>> +++++++++++++++++++++
>> >  2 files changed, 362 insertions(+), 1 deletion(-)
>> >  create mode 100644
>> meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
>> >
>> > diff --git a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
>> b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
>> > index b88bc42..e2dcfdb 100644
>> > --- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
>> > +++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
>> > @@ -2,7 +2,7 @@ SRC_URI = "
>> ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
>> >             file://0002-cross-compile.patch \
>> >             file://cross-glsl.patch \
>> >             file://dont-fail-if-libX11-isnt-installed.patch \
>> > -           file://fix-egl-compilation-without-x11-headers.patch \
>> > +
>> file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
>> >             "
>>
>> EGL-Mutate-NativeDisplayType-depending-on-config.patch does not cover
>>
>> #include "state_tracker/xlib_sw_winsys.h"
>> in
>> src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c
>>
>> so builds with pipe-loader enabled and without x11 headers are still
>> failing, the same issue is in master.
>>
>> >  SRC_URI[md5sum] = "dc45d1192203e418163e0017640e1cfc"
>> > diff --git
>> a/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
>> b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
>> > new file mode 100644
>> > index 0000000..98c4095
>> > --- /dev/null
>> > +++
>> b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
>> > @@ -0,0 +1,361 @@
>> > +From 7e5846aa52c7cb00b0db9fa393975880371d2620 Mon Sep 17 00:00:00 2001
>> > +From: Daniel Stone <daniel@fooishbar.org>
>> > +Date: Fri, 24 May 2013 17:20:27 +0100
>> > +Subject: [PATCH] EGL: Mutate NativeDisplayType depending on config
>> > +
>> > +If we go through ./configure without enabling X11 anywhere, then set
>> the
>> > +fallback types for EGL NativeDisplay and friends, rather than assuming
>> > +X11/Xlib.
>> > +
>> > +Signed-off-by: Daniel Stone <daniel@fooishbar.org>
>> > +
>> > +Conflicts:
>> > +     configure.ac
>> > +---
>> > + configure.ac                 |   9 +++
>> > + include/EGL/eglplatform.h    | 146
>> -------------------------------------------
>> > + include/EGL/eglplatform.h.in | 146
>> +++++++++++++++++++++++++++++++++++++++++++
>> > + 3 files changed, 155 insertions(+), 146 deletions(-)
>> > + delete mode 100644 include/EGL/eglplatform.h
>> > + create mode 100644 include/EGL/eglplatform.h.in
>> > +
>> > +diff --git a/configure.ac b/configure.ac
>> > +index 682e0a5..a8a485d 100644
>> > +--- a/configure.ac
>> > ++++ b/configure.ac
>> > +@@ -1577,12 +1577,20 @@ fi
>> > +
>> > + EGL_PLATFORMS="$egl_platforms"
>> > +
>> > ++if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
>> > ++    MESA_EGL_NO_X11_HEADERS=0
>> > ++else
>> > ++    MESA_EGL_NO_X11_HEADERS=1
>> > ++fi
>> > ++
>> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep
>> 'x11' >/dev/null 2>&1)
>> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" |
>> grep 'wayland' >/dev/null 2>&1)
>> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep
>> 'drm' >/dev/null 2>&1)
>> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | grep
>> 'fbdev' >/dev/null 2>&1)
>> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep
>> 'null' >/dev/null 2>&1)
>> > +
>> > ++AC_SUBST([MESA_EGL_NO_X11_HEADERS])
>> > ++
>> > + AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2" !=
>> "x")
>> > + AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" !=
>> "x")
>> > +
>> > +@@ -1953,6 +1961,7 @@ CXXFLAGS="$CXXFLAGS $USER_CXXFLAGS"
>> > + dnl Substitute the config
>> > + AC_CONFIG_FILES([configs/current
>> > +             Makefile
>> > ++            include/EGL/eglplatform.h
>> > +             src/egl/Makefile
>> > +             src/egl/drivers/Makefile
>> > +             src/egl/drivers/dri2/Makefile
>> > +diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
>> > +deleted file mode 100644
>> > +index 17fdc61..0000000
>> > +--- a/include/EGL/eglplatform.h
>> > ++++ /dev/null
>> > +@@ -1,146 +0,0 @@
>> > +-#ifndef __eglplatform_h_
>> > +-#define __eglplatform_h_
>> > +-
>> > +-/*
>> > +-** Copyright (c) 2007-2009 The Khronos Group Inc.
>> > +-**
>> > +-** Permission is hereby granted, free of charge, to any person
>> obtaining a
>> > +-** copy of this software and/or associated documentation files (the
>> > +-** "Materials"), to deal in the Materials without restriction,
>> including
>> > +-** without limitation the rights t--
>>
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>

--089e01493b6830dd0c04e02934bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Almost all of them :)<div><br></div><div>PACKAGECONFIG =3D=
 &quot;egl gles dri wayland gallium gallium-llvmpipe openvg&quot;<br></div>=
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu,=
 Jun 27, 2013 at 11:00 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I&#39;m actively fixing this upstream now, s=
o I will make sure this is sorted. =C2=A0What PACKAGECONFIG are you using?<=
div><br>
</div><div>Ross<div><div class=3D"h5"><span></span><br><br>On Thursday, 27 =
June 2013, Martin Jansa  wrote:<br></div></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<div><div class=3D"h5">
On Tue, Jun 25, 2013 at 05:38:43PM +0200, Nicolas Dechesne wrote:<br>
&gt; Extracted from &quot;d7033f4 mesa: upgrade to 9.1.3&quot;, already mer=
ged in master:<br>
&gt;<br>
&gt; --<br>
&gt; Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build co=
rrectly in<br>
&gt; a non-X11 environment.<br>
&gt;<br>
&gt; Drop fix-egl-compilation-without-x11-headers.patch as they were backpo=
rts.<br>
&gt; --<br>
&gt;<br>
&gt; The new patch was also backported (trivial) to mesa 9.0.2 which is in<=
br>
&gt; dylan.<br>
&gt;<br>
&gt; Signed-off-by: Nicolas Dechesne &lt;<a>nicolas.dechesne@linaro.org</a>=
&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-graphics/mesa/mesa-9.0.2.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 2 +-<br>
&gt; =C2=A0...ate-NativeDisplayType-depending-on-config.patch | 361 +++++++=
++++++++++++++<br>
&gt; =C2=A02 files changed, 362 insertions(+), 1 deletion(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-Na=
tiveDisplayType-depending-on-config.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa-9.0.2.inc b/meta/recipes-=
graphics/mesa/mesa-9.0.2.inc<br>
&gt; index b88bc42..e2dcfdb 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc<br>
&gt; @@ -2,7 +2,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org=
/pub/mesa/$%7BPV%7D/MesaLib-$%7BPV%7D.tar.bz2" target=3D"_blank">ftp://ftp.=
freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2</a> \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-cross-compile.pa=
tch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cross-glsl.patch \<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dont-fail-if-libX11-i=
snt-installed.patch \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-egl-compilation-withou=
t-x11-headers.patch \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://EGL-Mutate-NativeDisplayTy=
pe-depending-on-config.patch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
EGL-Mutate-NativeDisplayType-depending-on-config.patch does not cover<br>
<br>
#include &quot;state_tracker/xlib_sw_winsys.h&quot;<br>
in<br>
src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c<br>
<br>
so builds with pipe-loader enabled and without x11 headers are still<br>
failing, the same issue is in master.<br>
<br>
&gt; =C2=A0SRC_URI[md5sum] =3D &quot;dc45d1192203e418163e0017640e1cfc&quot;=
<br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayT=
ype-depending-on-config.patch b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-=
NativeDisplayType-depending-on-config.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..98c4095<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-dep=
ending-on-config.patch<br>
&gt; @@ -0,0 +1,361 @@<br>
&gt; +From 7e5846aa52c7cb00b0db9fa393975880371d2620 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stone &lt;<a>daniel@fooishbar.org</a>&gt;<br>
&gt; +Date: Fri, 24 May 2013 17:20:27 +0100<br>
&gt; +Subject: [PATCH] EGL: Mutate NativeDisplayType depending on config<br=
>
&gt; +<br>
&gt; +If we go through ./configure without enabling X11 anywhere, then set =
the<br>
&gt; +fallback types for EGL NativeDisplay and friends, rather than assumin=
g<br>
&gt; +X11/Xlib.<br>
&gt; +<br>
&gt; +Signed-off-by: Daniel Stone &lt;<a>daniel@fooishbar.org</a>&gt;<br>
&gt; +<br>
&gt; +Conflicts:<br>
&gt; + =C2=A0 =C2=A0 <a href=3D"http://configure.ac" target=3D"_blank">conf=
igure.ac</a><br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 9 +++<br>
&gt; + include/EGL/eglplatform.h =C2=A0 =C2=A0| 146 -----------------------=
--------------------<br>
&gt; + include/EGL/<a href=3D"http://eglplatform.h.in" target=3D"_blank">eg=
lplatform.h.in</a> | 146 +++++++++++++++++++++++++++++++++++++++++++<br>
&gt; + 3 files changed, 155 insertions(+), 146 deletions(-)<br>
&gt; + delete mode 100644 include/EGL/eglplatform.h<br>
&gt; + create mode 100644 include/EGL/<a href=3D"http://eglplatform.h.in" t=
arget=3D"_blank">eglplatform.h.in</a><br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" target=3D"_blank">config=
ure.ac</a> b/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac=
</a><br>
&gt; +index 682e0a5..a8a485d 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac<=
/a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac<=
/a><br>
&gt; +@@ -1577,12 +1577,20 @@ fi<br>
&gt; +<br>
&gt; + EGL_PLATFORMS=3D&quot;$egl_platforms&quot;<br>
&gt; +<br>
&gt; ++if echo &quot;$egl_platforms&quot; | grep &#39;x11&#39; &gt;/dev/nul=
l 2&gt;&amp;1; then<br>
&gt; ++ =C2=A0 =C2=A0MESA_EGL_NO_X11_HEADERS=3D0<br>
&gt; ++else<br>
&gt; ++ =C2=A0 =C2=A0MESA_EGL_NO_X11_HEADERS=3D1<br>
&gt; ++fi<br>
&gt; ++<br>
&gt; + AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo &quot;$egl_platforms&quot=
; | grep &#39;x11&#39; &gt;/dev/null 2&gt;&amp;1)<br>
&gt; + AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo &quot;$egl_platforms&=
quot; | grep &#39;wayland&#39; &gt;/dev/null 2&gt;&amp;1)<br>
&gt; + AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo &quot;$egl_platforms&quot=
; | grep &#39;drm&#39; &gt;/dev/null 2&gt;&amp;1)<br>
&gt; + AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo &quot;$egl_platforms&qu=
ot; | grep &#39;fbdev&#39; &gt;/dev/null 2&gt;&amp;1)<br>
&gt; + AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo &quot;$egl_platforms&quo=
t; | grep &#39;null&#39; &gt;/dev/null 2&gt;&amp;1)<br>
&gt; +<br>
&gt; ++AC_SUBST([MESA_EGL_NO_X11_HEADERS])<br>
&gt; ++<br>
&gt; + AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test &quot;x$HAVE_EGL_DRIVER_DR=
I2&quot; !=3D &quot;x&quot;)<br>
&gt; + AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test &quot;x$HAVE_EGL_DRIVER_GLX=
&quot; !=3D &quot;x&quot;)<br>
&gt; +<br>
&gt; +@@ -1953,6 +1961,7 @@ CXXFLAGS=3D&quot;$CXXFLAGS $USER_CXXFLAGS&quot;=
<br>
&gt; + dnl Substitute the config<br>
&gt; + AC_CONFIG_FILES([configs/current<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Makefile<br>
&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/EGL/eglplatform.h<=
br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src/egl/Makefile<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src/egl/drivers/Makefile<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src/egl/drivers/dri2/Makef=
ile<br>
&gt; +diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h<br=
>
&gt; +deleted file mode 100644<br>
&gt; +index 17fdc61..0000000<br>
&gt; +--- a/include/EGL/eglplatform.h<br>
&gt; ++++ /dev/null<br>
&gt; +@@ -1,146 +0,0 @@<br>
&gt; +-#ifndef __eglplatform_h_<br>
&gt; +-#define __eglplatform_h_<br>
&gt; +-<br>
&gt; +-/*<br>
&gt; +-** Copyright (c) 2007-2009 The Khronos Group Inc.<br>
&gt; +-**<br>
&gt; +-** Permission is hereby granted, free of charge, to any person obtai=
ning a<br>
&gt; +-** copy of this software and/or associated documentation files (the<=
br>
&gt; +-** &quot;Materials&quot;), to deal in the Materials without restrict=
ion, including<br></div></div>
&gt; +-** without limitation the rights t--<div class=3D"im"><br>
Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a>Martin.Jansa@gmail.com=
</a><br>
</div></blockquote></div>
</blockquote></div><br></div>

--089e01493b6830dd0c04e02934bd--
