Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.28041.1612739625595673411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 15:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nl2j+35z;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id y9so21762773ejp.10
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mqrcPmPRLrmncB4F6JkARBaPSbj9BRExsu0fuvDRt/Y=;
        b=Nl2j+35zhf5oABQ0t83HS+08k46s3NhkiXeo4rXAMzJ3DjL8INR5NI2fsADmnJ+m6u
         tOY2Ff/BP+nlVa/YtV4X+dLSzR5VzX8SoSMQjHyLV1L80sJEL7Vfh9bGsGDOx6DUj20g
         QClONY9aJac6DV68R3zCJ8lXPQwEWV3MikOk9DQV2LQ3uRlew6aLdHjWGOmexQtKnWpA
         u/BAneVqLRvYO7ETVszSIi1Xod0JiSihC+AgnoMpIHAGNBZeYOJ+m72hGBc5M5gfzRHB
         pJrFiXmMYDneHxB4mjVZlQRF2lh28Jwc/HcoIouMsJ1Y7BrwwtNfcFs8DMiY2xZwCIj4
         Ohag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mqrcPmPRLrmncB4F6JkARBaPSbj9BRExsu0fuvDRt/Y=;
        b=r29Yyr3JMAgSQliBc4wYVbR/9Nwt/c0uqekM0Hiftaw+IyZozVrwGL5YxZ4bhTXFoO
         J+XdY/kT5Lwny8cTwV6DeEQaqlO9BGINwN1g17NQRxqlkXrMk+p2ue6p0f/5rAdcWjm/
         cxY8IeET3ooDiX4A6Vz/Y2Zo9YHOBITmruI5mmC1WbqF/cK6L2ynrpOUh4sFuNyG0rUQ
         3CD5jUrlro0HhZ08wRpPCy8YgCBimeh11wHovsdGDR4wXAvg4Ak+oU3tFujMFw2BBGLc
         hI0eq1NQDWaLfGSKnFSw361n6Z7RpbG0vI/2R6I/CxKc6xtY8gVPUhWuy9nK/1cV/w8Q
         UMuw==
X-Gm-Message-State: AOAM531qf/thkxuX0vcJ2cdtngO/3PHNlG23Pv0uO/mSrdqO3RZtHI5N
	DSc7FL19NFHANqE3zSFZ7M0iB1mA00L5t7fQ0xQ=
X-Google-Smtp-Source: ABdhPJymjtAUsv2pEWth7fUa4xqumtAaE4DNDEL0p3tLvSwRWXt3wD58Obyhxtjt1WYjtNrezS80qKGlqqURoEaivzs=
X-Received: by 2002:a17:907:7815:: with SMTP id la21mr13681228ejc.12.1612739623904;
 Sun, 07 Feb 2021 15:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20210207180504.1552900-1-quaresma.jose@gmail.com>
 <20210207180504.1552900-2-quaresma.jose@gmail.com> <f772741f2969f3b3e3ea117fb35c8a39a9a14756.camel@linuxfoundation.org>
 <CANPvuRntP03A8U696D+JoBVtvK=Kp-Dj08Eae5=Sx=CuqpTP4g@mail.gmail.com> <5bd02696955631f07d754eb6a009a8f6f38ce27c.camel@linuxfoundation.org>
In-Reply-To: <5bd02696955631f07d754eb6a009a8f6f38ce27c.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 7 Feb 2021 23:13:34 +0000
Message-ID: <CANPvuRkS1xGjy3TL3-dtLkoVS9LBPYoQKUW2wXaGAkGVzzHVeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] shaderc: add option to skip building the examples
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000065ec6105bac73485"

--00000000000065ec6105bac73485
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 7/02/2021 =C3=A0(s) 23:00:

> On Sun, 2021-02-07 at 22:56 +0000, Jose Quaresma wrote:
> > Hi Richard,
> >
> > I need some help to analyze the log of the compilation.
> > where can i find it? is it possible?
> >
> > The compilation log mentioned on
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1835
> > are
> > /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-
> > linux/shaderc-native/2020.4-r0/temp/log.do_compile.199121
> >
> > On my side it build fine on x86_64 so I don't understand the problem!
>
> That log is included here:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/3034/st=
eps/11/logs/stdio
>
> or here is another:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3056/st=
eps/11/logs/stdio
>
>
I have seen the log of the bitbake but what I liked to access was the log
of the compilation in the WORKDIR of the shaderc.
Is it possible ?

Thank you


> Cheers,
>
> Richard
>
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000065ec6105bac73485
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br style=3D"color:rgb(0,0,0)"></div><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; escreveu no dia domingo, 7/02/2021 =C3=A0(s) 23:00:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2021-02-07 at 22=
:56 +0000, Jose Quaresma wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; I need some help to analyze the log of the compilation.<br>
&gt; where can i find it? is it possible?<br>
&gt; <br>
&gt; The compilation log mentioned on<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/=
builds/1835" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/83/builds/1835</a><br>
&gt; are<br>
&gt; /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-<br>
&gt; linux/shaderc-native/2020.4-r0/temp/log.do_compile.199121<br>
&gt; <br>
&gt; On my side it build fine on=C2=A0x86_64 so I don&#39;t understand the =
problem!<br>
<br>
That log is included here:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/build=
s/3034/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/40/builds/3034/steps/11/logs/=
stdio</a><br>
<br>
or here is another:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/3056/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3056/steps/11/logs/=
stdio</a><br>
<br></blockquote><div dir=3D"ltr"><br></div><div dir=3D"ltr">I have seen th=
e log of the bitbake=C2=A0but what I liked to access was the log of the com=
pilation in the WORKDIR of the shaderc.<div>Is it=C2=A0possible ?</div><div=
><br></div></div><div>Thank you</div><div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000065ec6105bac73485--
