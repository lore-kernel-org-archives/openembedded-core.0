Return-Path: <aehs29@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 551447FC0C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 01:01:14 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 15so21222587lfr.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 17:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rQEiYrjnjEj12G9fdW97uQdTlvzAysbBkR1j7A26eJA=;
	b=pZygLbFxgKR6+UvyZRU2UHlhES22QpEjJ69RtK5s08PAkSqLtGgdxfC32qMpv+WfWd
	8ctVdlxOnNot7Ki7Eyt/PY2swNPULAoQsZ8YeYsDaQKyLtg43kxv3cOEx2q+RGkRRP5I
	vSxs1wtyYbjdSRC2G47b+r5jwGjO/i2j+wP0Lcd8Zf/j2KvZr99atSnmsJl9XNKKYBjB
	Z21EsLgJL55iVEBJeZEncv5FzmK7dXVvYazj0jGsyKBYYXkp8AQWB7j3gVGJ7emL1Aki
	TromfcEXyhYXWjV53NdDzEKjtOfvA4rJfzFgIyS7rLZ8N9s1nMYkd6AHq9AJDUfd8dWD
	hMfg==
X-Gm-Message-State: APjAAAUQc59SlIhe+C0xcrowgVS1EGbteE/WXFK/WL3ruzc5ihsIiQ6Q
	3GC5jgX+yZ4oZyEcEIf6UA0aA2r/jMKV/Q==
X-Google-Smtp-Source: APXvYqwqa7okbaUbX71XVgw1hXhl+GHCdWWDQc0cOJWm5DHEF81+QLKxviW0EmravrOkORaTSDZ24w==
X-Received: by 2002:ac2:5e6c:: with SMTP id a12mr2712692lfr.32.1579395675369; 
	Sat, 18 Jan 2020 17:01:15 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
	[209.85.167.50]) by smtp.gmail.com with ESMTPSA id
	b14sm14270593lff.68.2020.01.18.17.01.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 18 Jan 2020 17:01:14 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id f24so107810lfh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 17:01:14 -0800 (PST)
X-Received: by 2002:ac2:5216:: with SMTP id a22mr9171594lfl.18.1579395674353; 
	Sat, 18 Jan 2020 17:01:14 -0800 (PST)
MIME-Version: 1.0
References: <1579382560-2540-1-git-send-email-alejandro@enedino.org>
	<1579382560-2540-2-git-send-email-alejandro@enedino.org>
	<4d2cae78a231b62d03bdf88f0e0514220faff21e.camel@linuxfoundation.org>
In-Reply-To: <4d2cae78a231b62d03bdf88f0e0514220faff21e.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Sat, 18 Jan 2020 17:01:03 -0800
X-Gmail-Original-Message-ID: <CAHMutrYxautheb5edBNiZ6ccN+5oSwTLpHqHMCmmTQQdwvA-2g@mail.gmail.com>
Message-ID: <CAHMutrYxautheb5edBNiZ6ccN+5oSwTLpHqHMCmmTQQdwvA-2g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] newlib: Enable building libstdc++ for newlib based toolchains
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
X-List-Received-Date: Sun, 19 Jan 2020 01:01:15 -0000
Content-Type: multipart/alternative; boundary="000000000000213665059c73b6e3"

--000000000000213665059c73b6e3
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Jan 2020 at 15:25, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-01-18 at 13:22 -0800, Alejandro Enedino Hernandez
> Samaniego wrote:
> > Some baremetal applications might require support from libstdc++.
> >
> > On newlib based toolchains, libstdc++ can be built as a static
> > library that applications can then link against it.
> >
> > Pass libsdtc++-(static)dev to LIBC_DEPENDENCIES allowing the
> > library to be present for cross compilation as well as on
> > sdk builds.
> >
> > This also requires to modify the gcc-runtime recipe to
> > explictly build only libsdtc++ correctly.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> > alejandro@enedino.org>
> > ---
> >  meta/conf/distro/include/tclibc-newlib.inc | 7 +++----
> >  meta/recipes-devtools/gcc/gcc-runtime.inc  | 6 ++++++
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/tclibc-newlib.inc
> > b/meta/conf/distro/include/tclibc-newlib.inc
> > index 896c0b1..8338003 100644
> > --- a/meta/conf/distro/include/tclibc-newlib.inc
> > +++ b/meta/conf/distro/include/tclibc-newlib.inc
> > @@ -25,12 +25,11 @@ LIBC_DEPENDENCIES = "\
> >      libgloss-dbg \
> >      libgcc-dev \
> >      libgcc-dbg \
> > +    libstdc++-dev \
> > +    libstdc++-staticdev \
> >      "
> >
> > -# compilerlibs defaults to gcc-runtime, but we get runtime from
> > libgloss
> > -# we set ASSUME_PROVIDED because we cant set PREFERRED_PROVIDER
> > -# for compilerlibs since its overridden by tcmode-default
> > -ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}compilerlibs
> > virtual/crypt"
> > +ASSUME_PROVIDED += "virtual/crypt"
> >
> >  # Its useful to be able to extend newlib, but we dont provide a
> > native variant of libgloss
> >  NEWLIB_EXTENDED ?=  "libgloss libgcc"
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > index d3f8ae8..f035fbd 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -17,6 +17,9 @@ EXTRA_OECONF_PATHS = "\
> >  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
> >  EXTRA_OECONF_append = " --cache-file=${B}/config.cache"
> >
> > +EXTRA_OECONF_remove_libc-newlib = "--enable-symvers=gnu"
> > +EXTRA_OECONF_append_libc-newlib = " --with-newlib"
> > +
>
> I really don't like using remove in core. Can we restructure this so
> that symvers is set something like:
>
> SYMVERS_CONF = " --enable-clocale=gnu"
> SYMVERS_CONF_libc-newlib = ""
> EXTRA_OECONF_append += "${SYMVERS_CONF}"
>
> ?
>

Hey Richard,

Absolutely agree, I will send a v2 with these changes.

Alejandro

>
> >  # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
> >  EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
> >
> > @@ -33,6 +36,9 @@ RUNTIMELIBITM_riscv64 = ""
> >  RUNTIMELIBSSP ?= ""
> >  RUNTIMELIBSSP_mingw32 ?= "libssp"
> >
> > +# Only build libstdc++ for newlib
> > +RUNTIMETARGET_libc-newlib = "libstdc++-v3"
> > +
> >  RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic
> > ${RUNTIMELIBITM} \
> >      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'],
> > 'libquadmath', '', d)} \
> >  "
>
> Convention is top put the overridden version under the original.
>

Will change this as well



>
> Cheers,
>
> Richard
>
>

--000000000000213665059c73b6e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace;font-size:large"><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 18 Jan 2020 at 15:25,=
 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sat, 2020-01-18 at 13:22 -0800, Alejand=
ro Enedino Hernandez<br>
Samaniego wrote:<br>
&gt; Some baremetal applications might require support from libstdc++.<br>
&gt; <br>
&gt; On newlib based toolchains, libstdc++ can be built as a static<br>
&gt; library that applications can then link against it.<br>
&gt; <br>
&gt; Pass libsdtc++-(static)dev to LIBC_DEPENDENCIES allowing the<br>
&gt; library to be present for cross compilation as well as on<br>
&gt; sdk builds.<br>
&gt; <br>
&gt; This also requires to modify the gcc-runtime recipe to<br>
&gt; explictly build only libsdtc++ correctly.<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<br>
&gt; <a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@e=
nedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/tclibc-newlib.inc | 7 +++----<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 | 6 ++++++<br>
&gt;=C2=A0 2 files changed, 9 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/tclibc-newlib.inc<br>
&gt; b/meta/conf/distro/include/tclibc-newlib.inc<br>
&gt; index 896c0b1..8338003 100644<br>
&gt; --- a/meta/conf/distro/include/tclibc-newlib.inc<br>
&gt; +++ b/meta/conf/distro/include/tclibc-newlib.inc<br>
&gt; @@ -25,12 +25,11 @@ LIBC_DEPENDENCIES =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libgloss-dbg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libgcc-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libgcc-dbg \<br>
&gt; +=C2=A0 =C2=A0 libstdc++-dev \<br>
&gt; +=C2=A0 =C2=A0 libstdc++-staticdev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -# compilerlibs defaults to gcc-runtime, but we get runtime from<br>
&gt; libgloss<br>
&gt; -# we set ASSUME_PROVIDED because we cant set PREFERRED_PROVIDER<br>
&gt; -# for compilerlibs since its overridden by tcmode-default<br>
&gt; -ASSUME_PROVIDED +=3D &quot;virtual/${TARGET_PREFIX}compilerlibs<br>
&gt; virtual/crypt&quot;<br>
&gt; +ASSUME_PROVIDED +=3D &quot;virtual/crypt&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Its useful to be able to extend newlib, but we dont provide a<=
br>
&gt; native variant of libgloss<br>
&gt;=C2=A0 NEWLIB_EXTENDED ?=3D=C2=A0 &quot;libgloss libgcc&quot;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; index d3f8ae8..f035fbd 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; @@ -17,6 +17,9 @@ EXTRA_OECONF_PATHS =3D &quot;\<br>
&gt;=C2=A0 EXTRA_OECONF_append_linuxstdbase =3D &quot; --enable-clocale=3Dg=
nu&quot;<br>
&gt;=C2=A0 EXTRA_OECONF_append =3D &quot; --cache-file=3D${B}/config.cache&=
quot;<br>
&gt;=C2=A0 <br>
&gt; +EXTRA_OECONF_remove_libc-newlib =3D &quot;--enable-symvers=3Dgnu&quot=
;<br>
&gt; +EXTRA_OECONF_append_libc-newlib =3D &quot; --with-newlib&quot;<br>
&gt; +<br>
<br>
I really don&#39;t like using remove in core. Can we restructure this so<br=
>
that symvers is set something like:<br>
<br>
SYMVERS_CONF =3D &quot; --enable-clocale=3Dgnu&quot;<br>
SYMVERS_CONF_libc-newlib =3D &quot;&quot;<br>
EXTRA_OECONF_append +=3D &quot;${SYMVERS_CONF}&quot;<br>
<br>
?<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-family:monospace;font-size:large">Hey Richard,</div><br></div><div cl=
ass=3D"gmail_default" style=3D"font-family:monospace;font-size:large">Absol=
utely agree, I will send a v2 with these changes.</div><div class=3D"gmail_=
default" style=3D"font-family:monospace;font-size:large"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace;font-size:large">Alejan=
dro</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu<br>
&gt;=C2=A0 EXTRA_OECONF_append_arm =3D &quot; libat_cv_have_ifunc=3Dno &quo=
t;<br>
&gt;=C2=A0 <br>
&gt; @@ -33,6 +36,9 @@ RUNTIMELIBITM_riscv64 =3D &quot;&quot;<br>
&gt;=C2=A0 RUNTIMELIBSSP ?=3D &quot;&quot;<br>
&gt;=C2=A0 RUNTIMELIBSSP_mingw32 ?=3D &quot;libssp&quot;<br>
&gt;=C2=A0 <br>
&gt; +# Only build libstdc++ for newlib<br>
&gt; +RUNTIMETARGET_libc-newlib =3D &quot;libstdc++-v3&quot;<br>
&gt; +<br>
&gt;=C2=A0 RUNTIMETARGET =3D &quot;${RUNTIMELIBSSP} libstdc++-v3 libgomp li=
batomic<br>
&gt; ${RUNTIMELIBITM} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;FORTRAN&#39;, [&#39;=
,fortran&#39;,&#39;,f77&#39;],<br>
&gt; &#39;libquadmath&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 &quot;<br>
<br>
Convention is top put the overridden version under the original.<br></block=
quote><div>=C2=A0</div><div><div class=3D"gmail_default" style=3D"font-fami=
ly:monospace;font-size:large">Will change this as well</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000213665059c73b6e3--
