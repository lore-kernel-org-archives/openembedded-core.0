Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id C780979608
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:51:52 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id t39-v6so9852907qtc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9y6YoNn+MppX0q7BnAqMCn38aov2aA4a/auWd3Iz6sE=;
	b=ttT3ATnQluum6t8HLCQ+MVGUiMbWittjl0fSoRijLaqKiUf/h9VtTrQue+lLeq0M9u
	OHs3AyAUQZcmzj/YbqM6HRRmPi3FyT66G/l6PUzpxWBLtZ+1ujFd2XFL/0Ol86qyRFSQ
	nwIMpGUUeOZ0fQ+BarYuX6QGg5dAblvfZmGPtGC+Komu8rdrSLsXZ1mKoJ6FYxdPVdao
	nVQl8KJ1UXKxUeiHnQGU04F163U3vIa0lTR8gLuBC69AeDP7JwDLKBPXn0M1n+oA02nC
	PenXrNRNm8vlreGcmDvJ6lwrceCl/RcV6BO0nTRU5SEPNn/tHYAVRWI0gtn9GHyANIep
	yhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9y6YoNn+MppX0q7BnAqMCn38aov2aA4a/auWd3Iz6sE=;
	b=mp/u8/hMw48n9ch8SpN9u/L6YIM6Rf4dYSqumEdXvwC/PWxm3l8hvP2M6pnMKFSYD+
	F7bZVb8DK3jYdcUa7oFBQ2SwI52h2tyisAqFKYFGvlA6txsH7AL1VCRYae0okAaoQmKe
	2QTbIhStAHDk6D2ESzYD2P8eLezam4EeG5T/NJr1Y3Eb9ZVcZWqTpbe2Qgo9owBXiAXg
	K+tgh+TCC7u5Z3bqc25PgAE1EMDZLHBP83z1XHwDgXTZF5r6kep4hf6QX0PIwN+1WnFY
	AnvO9rL5MhcAmPmM5mspXuPF22oINZMUDvVpoRw8KHJ7CrBADlK5uJ4GbdUaJqC7Gt+L
	3U9g==
X-Gm-Message-State: APzg51D+/w7RqVQB6JzuArx8pR7C4JY9+hGvrI9BnroSD9cQlFG82zrs
	nxZ2oa9ojXH1oK4g87j9rO4cgzc5upQiEiwzl+8=
X-Google-Smtp-Source: ANB0VdaxIawI3zImKn4nG8+NezEL6tq+84ZZ/1aOGztMg+F//dnOvYZ5T7oLsgtd6IPOysEosOYiK6elIMUxiUT+Fe4=
X-Received: by 2002:a0c:f208:: with SMTP id h8-v6mr2400617qvk.55.1535125913398;
	Fri, 24 Aug 2018 08:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale> <20180824144323.GJ20864@hiutale>
	<355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
	<20180824154822.GK20864@hiutale>
In-Reply-To: <20180824154822.GK20864@hiutale>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 08:51:42 -0700
Message-ID: <CAMKF1sqc6fQhZfSKZ80D2dyHL_D=2hRAS1zMFKScP8MpXgQRbA@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake: add CMAKE_SYSROOT to generated toolchain file
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
X-List-Received-Date: Fri, 24 Aug 2018 15:51:52 -0000
Content-Type: multipart/alternative; boundary="000000000000c0f3a80574305a5d"

--000000000000c0f3a80574305a5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2018 at 8:48 AM <Mikko.Rapeli@bmw.de> wrote:

> On Fri, Aug 24, 2018 at 03:10:28PM +0000, Bach, Pascal wrote:
> >
> > > > Fixes problems which we have also seen on sumo branch. Thanks for
> this!
> > >
> > > Sorry, spoke too soon. This fixes compilation on a few recipes in my
> tree but
> > > there are still lots failures with the same error message. We had a
> hacky
> > > patch to cmake as a workaround but that too causes some problems:
> >
> > I have not yet figured out what CMake based projects are affected and
> why.
> > The error seems to happen only for certain projects.
>
> In our case it looks like a library is adding target_include_directories(=
)
> with SYSTEM keyword in its cmake module. Everyone who includes the cmake
> module
> fails to build. This repeats with a handful of cmake modules and causes a=
ll
> of their dependencies to fail build with errors like:
>
> .../recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15: fatal error:
> stdlib.h: No such file or directory
> |  #include_next <stdlib.h>
> |                ^~~~~~~~~~
> | compilation terminated.
>
> or
>
> | cc1plus: warning: include location "/usr/include" is unsafe for
> cross-compilation [-Wpoison-system-directories]
> ...
> .../recipe-sysroot/usr/include/stdlib.h:133:35: error: missing binary
> operator before token
> "("
> |  #if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)
> |                                    ^
>
> So to me it looks like using SYSTEM with target_include_directories()
> is no longer possible with CMake and gcc > 6:
>
>
> https://cmake.org/cmake/help/v3.10/command/target_include_directories.htm=
l?highlight=3Dtarget_include_directories
>

That=E2=80=99s right there is a patch I did  in WebKitgtk recipe in Oe Core=
 you
might want to include similar fixes for this package the patch actually it
a workaround but then I also think using isystem in apps is a bad idea

>
> > > --- a/Modules/Compiler/GNU.cmake
> > > +++ b/Modules/Compiler/GNU.cmake
> > > @@ -45,7 +45,7 @@
> > >    set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE
> > > "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E
> > > <SOURCE> > <PREPROCESSED_SOURCE>")
> > >    set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE
> > > "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -S
> > > <SOURCE> -o <ASSEMBLY_SOURCE>")
> > >    if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSION_LESS
> > > 4) # work around #4462
> > > -    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
> > > +    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-I ")
> > >    endif()
> > >
> > >    set(_CMAKE_${lang}_IPO_SUPPORTED_BY_CMAKE YES)
> > >
> > > I wonder what the real fix could be...
> > >
> >
> > This looks similar to another workaround I saw.
> > Setting CMAKE_NO_SYSTEM_FROM_IMPORTED to True. I'm also not sure what
> the real fix is.
> > The issue is also discussed here:
> https://gitlab.kitware.com/cmake/cmake/issues/16291
>
> Thanks for the ticket link.
>
> -Mikko
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c0f3a80574305a5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri,=
 Aug 24, 2018 at 8:48 AM &lt;<a href=3D"mailto:Mikko.Rapeli@bmw.de">Mikko.R=
apeli@bmw.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri,=
 Aug 24, 2018 at 03:10:28PM +0000, Bach, Pascal wrote:<br>
&gt;=C2=A0 <br>
&gt; &gt; &gt; Fixes problems which we have also seen on sumo branch. Thank=
s for this!<br>
&gt; &gt; <br>
&gt; &gt; Sorry, spoke too soon. This fixes compilation on a few recipes in=
 my tree but<br>
&gt; &gt; there are still lots failures with the same error message. We had=
 a hacky<br>
&gt; &gt; patch to cmake as a workaround but that too causes some problems:=
<br>
&gt; <br>
&gt; I have not yet figured out what CMake based projects are affected and =
why.<br>
&gt; The error seems to happen only for certain projects.<br>
<br>
In our case it looks like a library is adding target_include_directories()<=
br>
with SYSTEM keyword in its cmake module. Everyone who includes the cmake mo=
dule<br>
fails to build. This repeats with a handful of cmake modules and causes all=
<br>
of their dependencies to fail build with errors like:<br>
<br>
.../recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15: fatal error: stdlib=
.h: No such file or directory<br>
|=C2=A0 #include_next &lt;stdlib.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
| compilation terminated.<br>
<br>
or<br>
<br>
| cc1plus: warning: include location &quot;/usr/include&quot; is unsafe for=
 cross-compilation [-Wpoison-system-directories]<br>
...<br>
.../recipe-sysroot/usr/include/stdlib.h:133:35: error: missing binary opera=
tor before token <br>
&quot;(&quot;<br>
|=C2=A0 #if __HAVE_FLOAT16 &amp;&amp; __GLIBC_USE (IEC_60559_TYPES_EXT)<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
<br>
So to me it looks like using SYSTEM with target_include_directories()<br>
is no longer possible with CMake and gcc &gt; 6:<br>
<br>
<a href=3D"https://cmake.org/cmake/help/v3.10/command/target_include_direct=
ories.html?highlight=3Dtarget_include_directories" rel=3D"noreferrer" targe=
t=3D"_blank">https://cmake.org/cmake/help/v3.10/command/target_include_dire=
ctories.html?highlight=3Dtarget_include_directories</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That=E2=80=99s r=
ight there is a patch I did =C2=A0in WebKitgtk recipe in Oe Core you might =
want to include similar fixes for this package the patch actually it a work=
around but then I also think using isystem in apps is a bad idea=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><br>
&gt; &gt; --- a/Modules/Compiler/GNU.cmake<br>
&gt; &gt; +++ b/Modules/Compiler/GNU.cmake<br>
&gt; &gt; @@ -45,7 +45,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0 set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE<br>
&gt; &gt; &quot;&lt;CMAKE_${lang}_COMPILER&gt; &lt;DEFINES&gt; &lt;INCLUDES=
&gt; &lt;FLAGS&gt; -E<br>
&gt; &gt; &lt;SOURCE&gt; &gt; &lt;PREPROCESSED_SOURCE&gt;&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE<br>
&gt; &gt; &quot;&lt;CMAKE_${lang}_COMPILER&gt; &lt;DEFINES&gt; &lt;INCLUDES=
&gt; &lt;FLAGS&gt; -S<br>
&gt; &gt; &lt;SOURCE&gt; -o &lt;ASSEMBLY_SOURCE&gt;&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION V=
ERSION_LESS<br>
&gt; &gt; 4) # work around #4462<br>
&gt; &gt; -=C2=A0 =C2=A0 set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} &quot;-isyst=
em &quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} &quot;-I &qu=
ot;)<br>
&gt; &gt;=C2=A0 =C2=A0 endif()<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 set(_CMAKE_${lang}_IPO_SUPPORTED_BY_CMAKE YES)<br>
&gt; &gt; <br>
&gt; &gt; I wonder what the real fix could be...<br>
&gt; &gt; <br>
&gt; <br>
&gt; This looks similar to another workaround I saw.<br>
&gt; Setting CMAKE_NO_SYSTEM_FROM_IMPORTED to True. I&#39;m also not sure w=
hat the real fix is.<br>
&gt; The issue is also discussed here: <a href=3D"https://gitlab.kitware.co=
m/cmake/cmake/issues/16291" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.kitware.com/cmake/cmake/issues/16291</a><br>
<br>
Thanks for the ticket link.<br>
<br>
-Mikko<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000c0f3a80574305a5d--
