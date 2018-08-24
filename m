Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 44EAC795F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:44:38 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id r3-v6so5816249qte.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WmNl4CHM6/9M/V5xD3fCMPZjuckHH91sZNYXrTnNKC8=;
	b=fL6w0iTKX/PvanbgeCFPx5nMjWTkg/y/tJN61IaOKfL2GZzK8R0rQjMUjLKD+nFT7z
	4mfFfh7GzC6iFqFPLhUym6WWPSre7+cdm6CWB5hsEWsZWBbK98pj/Gi0Sz5uhW8epkyT
	JY79LGtAx4eXPGXQHqvMwsQyzIaSTjb5oG+GdlO3OVq5tlsn6eKOUEpSqliMjPl0vjoN
	IJe2VLfP6XmYRkoisi776FHV5s1Qcpdr2SXO5jBdgsaJv7DOGLU20ELXk1if0482qwfN
	GFtXKDL953pAcLTt9yT4DvacR/xkQpyfIAikl1qr0rH16t/+3OAPMJEi7g2AQEiG5hsQ
	C3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WmNl4CHM6/9M/V5xD3fCMPZjuckHH91sZNYXrTnNKC8=;
	b=EnsSRBHDKpgJomTZbqmeaWwgYYNTj73cA1gWR56paad3BcDtt3MKKB0+V+J35zXCRB
	nBJVv8dk9w1e/kEE40SRnemwo4xwDTkPQ+88BcEAu7g6ynODWC0eeU0fMB25qQ5JWtMe
	zMpMBdD06J1PqvVFEji1sckpwcWXckN/6Ozb4ok8sWYSTsj9Oo7lefQLXASM2ikBh50L
	RmworvFztEL7vxHe+OqDkyeWtZK8PxAaSh1sCASgvg328+7AgLGOYa7cm9WwYOrsSpqy
	SWbvEib5KoYwLo29UL8MG6K8MbZPRX/ke0jAhLzBgpdd+1yqZvUXZWb2tARVThncmFkl
	2KeA==
X-Gm-Message-State: APzg51AYi87i2wZZy3ZJ8MkblCdk6PCAW353iDNbIW5BzpI5f9hJX+H9
	LDchqKDasT9vluPyCknSeK0O2Fs+C3Jinxm0e84=
X-Google-Smtp-Source: ANB0VdbUsyPz4D9EjVLK/7Oh4/LD3kllc0HMr/Fn/fQdeTjuQ51vHsq5alLd0rWjzsAzwDpUhHbNceHt1lw0aZ5P2ag=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr2380827qtq.161.1535125478916; 
	Fri, 24 Aug 2018 08:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale> <20180824144323.GJ20864@hiutale>
	<355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
In-Reply-To: <355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 08:44:28 -0700
Message-ID: <CAMKF1sp1mNw1hj6ujqhCOLBx56CJ9gAdfDusNJjv4oKcmBa-fw@mail.gmail.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 24 Aug 2018 15:44:38 -0000
Content-Type: multipart/alternative; boundary="000000000000db48090574304081"

--000000000000db48090574304081
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 24, 2018 at 8:19 AM Bach, Pascal <pascal.bach@siemens.com>
wrote:

>
> > > Fixes problems which we have also seen on sumo branch. Thanks for this!
> >
> > Sorry, spoke too soon. This fixes compilation on a few recipes in my
> tree but
> > there are still lots failures with the same error message. We had a hacky
> > patch to cmake as a workaround but that too causes some problems:
>
> I have not yet figured out what CMake based projects are affected and why.
> The error seems to happen only for certain projects.
>
> > --- a/Modules/Compiler/GNU.cmake
> > +++ b/Modules/Compiler/GNU.cmake
> > @@ -45,7 +45,7 @@
> >    set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE
> > "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E
> > <SOURCE> > <PREPROCESSED_SOURCE>")
> >    set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE
> > "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -S
> > <SOURCE> -o <ASSEMBLY_SOURCE>")
> >    if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSION_LESS
> > 4) # work around #4462
> > -    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
> > +    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-I ")
> >    endif()
> >
> >    set(_CMAKE_${lang}_IPO_SUPPORTED_BY_CMAKE YES)
> >
> > I wonder what the real fix could be...
> >
>
> This looks similar to another workaround I saw.
> Setting CMAKE_NO_SYSTEM_FROM_IMPORTED to True. I'm also not sure what the
> real fix is.
> The issue is also discussed here:
> https://gitlab.kitware.com/cmake/cmake/issues/16291
>

IIRC this was a defect in cmake

>
> Pascal
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000db48090574304081
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri,=
 Aug 24, 2018 at 8:19 AM Bach, Pascal &lt;<a href=3D"mailto:pascal.bach@sie=
mens.com">pascal.bach@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">=C2=A0<br>
&gt; &gt; Fixes problems which we have also seen on sumo branch. Thanks for=
 this!<br>
&gt; <br>
&gt; Sorry, spoke too soon. This fixes compilation on a few recipes in my t=
ree but<br>
&gt; there are still lots failures with the same error message. We had a ha=
cky<br>
&gt; patch to cmake as a workaround but that too causes some problems:<br>
<br>
I have not yet figured out what CMake based projects are affected and why.<=
br>
The error seems to happen only for certain projects.<br>
<br>
&gt; --- a/Modules/Compiler/GNU.cmake<br>
&gt; +++ b/Modules/Compiler/GNU.cmake<br>
&gt; @@ -45,7 +45,7 @@<br>
&gt;=C2=A0 =C2=A0 set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE<br>
&gt; &quot;&lt;CMAKE_${lang}_COMPILER&gt; &lt;DEFINES&gt; &lt;INCLUDES&gt; =
&lt;FLAGS&gt; -E<br>
&gt; &lt;SOURCE&gt; &gt; &lt;PREPROCESSED_SOURCE&gt;&quot;)<br>
&gt;=C2=A0 =C2=A0 set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE<br>
&gt; &quot;&lt;CMAKE_${lang}_COMPILER&gt; &lt;DEFINES&gt; &lt;INCLUDES&gt; =
&lt;FLAGS&gt; -S<br>
&gt; &lt;SOURCE&gt; -o &lt;ASSEMBLY_SOURCE&gt;&quot;)<br>
&gt;=C2=A0 =C2=A0 if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSIO=
N_LESS<br>
&gt; 4) # work around #4462<br>
&gt; -=C2=A0 =C2=A0 set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} &quot;-isystem &q=
uot;)<br>
&gt; +=C2=A0 =C2=A0 set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} &quot;-I &quot;)<=
br>
&gt;=C2=A0 =C2=A0 endif()<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 set(_CMAKE_${lang}_IPO_SUPPORTED_BY_CMAKE YES)<br>
&gt; <br>
&gt; I wonder what the real fix could be...<br>
&gt; <br>
<br>
This looks similar to another workaround I saw.<br>
Setting CMAKE_NO_SYSTEM_FROM_IMPORTED to True. I&#39;m also not sure what t=
he real fix is.<br>
The issue is also discussed here: <a href=3D"https://gitlab.kitware.com/cma=
ke/cmake/issues/16291" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
kitware.com/cmake/cmake/issues/16291</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">IIRC this was a =
defect in cmake=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Pascal<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000db48090574304081--
