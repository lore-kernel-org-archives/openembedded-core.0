Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.28640.1612742006248038904
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 15:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ITtsce1K;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id i8so21854532ejc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 15:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sDKzrH07mv/EUgxuvVRoyQ04wJSvtwn5KkNofBOyICw=;
        b=ITtsce1KPw1IoUPu6Uo/Eiaqn9kbXgfz2RLgHTihN6yT753vDYhUkCzic9AmFlCE7W
         TT7Byh3D4CS8G20chLrxMLAIVnnndGXIjPot06ytoE5zWjfzajpIm1S1jKC0tJ8vGFH6
         wt0+4jCuTCHXZuA8dQuFKydTtOxEYnJ3LHlz94ovruvBfVacte1XLBvdU57aqIVBmWj8
         fBzshQAlokUlXE6NYMRliK9wOYGRCLvZ1JGk6sPv9kG4tbTehmxOPOGfwr1FePd5A2TZ
         4nxUeE13OKRCP4NOgM4QzZNkgd+xYMsVU7ACuh/TWiOPNXobV+QWbuxbbgbiRjcRmBch
         g2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sDKzrH07mv/EUgxuvVRoyQ04wJSvtwn5KkNofBOyICw=;
        b=g0FNffazlwP58t+c4cy1dApvqcR1T9SaBlZgMvr9NDvnkmTQidv1suSu73HdUIhkmX
         qVmK1XUMDWaPuXQ71DYNl2rhL9DzGkhPG56dshlm+11kNQ0YbB691NErwFkRJIUJ8P0G
         2GmvLQ927mxtISAVelWTlIBuexMDJA5U2iEV7YpWywuJAesnfC08cDg9lLiDnoZKZ1mB
         4ReRMr4QkFMMpUU2OF/rYN1uS5JhYmGxS/HFKmPYsaltLVrb2h2Aa1PiBVB3y6kl/LjT
         GtkibijPHMAMBL5SaPKf1QQGSKSqVFU2dTHVMZvyr+Vzkro1yDA8ZLzDM2xvbtWAKAxC
         LQIg==
X-Gm-Message-State: AOAM531a8EtZFN1Iq+WoyMKdZNJmamNeWKyHGu43n2j692wxgW+zfUpk
	0S+y7fadlrFHU22ZkLpQQ53f5Rvfvz+8zvOqRbA=
X-Google-Smtp-Source: ABdhPJxpRqF+sCePuPHpu/YdO2IgGxRV/vQdQ9Z6ObxfnFji5NCHR7E/f/bJEAdWNjJI+UoNM+kEvsOZk413JVVOaP0=
X-Received: by 2002:a17:907:768e:: with SMTP id jv14mr8073822ejc.453.1612742004572;
 Sun, 07 Feb 2021 15:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20210207180504.1552900-1-quaresma.jose@gmail.com>
 <20210207180504.1552900-2-quaresma.jose@gmail.com> <f772741f2969f3b3e3ea117fb35c8a39a9a14756.camel@linuxfoundation.org>
 <CANPvuRntP03A8U696D+JoBVtvK=Kp-Dj08Eae5=Sx=CuqpTP4g@mail.gmail.com>
 <5bd02696955631f07d754eb6a009a8f6f38ce27c.camel@linuxfoundation.org>
 <CANPvuRkS1xGjy3TL3-dtLkoVS9LBPYoQKUW2wXaGAkGVzzHVeg@mail.gmail.com> <c4eb364acb17db6e7e38a233e539ff0a003a6cb1.camel@linuxfoundation.org>
In-Reply-To: <c4eb364acb17db6e7e38a233e539ff0a003a6cb1.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 7 Feb 2021 23:53:14 +0000
Message-ID: <CANPvuRnbrJjC5+gsUOMSu29MZXD++Z7XABUuzbxCcNj__GLHOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] shaderc: add option to skip building the examples
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004c05ba05bac7c21f"

--0000000000004c05ba05bac7c21f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 7/02/2021 =C3=A0(s) 23:37:

> On Sun, 2021-02-07 at 23:13 +0000, Jose Quaresma wrote:
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> > domingo, 7/02/2021 =C3=A0(s) 23:00:
> > > On Sun, 2021-02-07 at 22:56 +0000, Jose Quaresma wrote:
> > > > Hi Richard,
> > > >
> > > > I need some help to analyze the log of the compilation.
> > > > where can i find it? is it possible?
> > > >
> > > > The compilation log mentioned on
> > > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/183=
5
> > > > are
> > > > /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86_64-
> > > > linux/shaderc-native/2020.4-r0/temp/log.do_compile.199121
> > > >
> > > > On my side it build fine on x86_64 so I don't understand the
> > > problem!
> > >
> > > That log is included here:
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/3034/st=
eps/11/logs/stdio
> > >
> > > or here is another:
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3056/st=
eps/11/logs/stdio
> > >
> > >
> >
> > I have seen the log of the bitbake but what I liked to access was the
> > log of the compilation in the WORKDIR of the shaderc.Is it possible ?
>
> That logfile is printed onto stdout so the log in that file is what you
> see printed on the console in the above logs.
>
> Did you click the magnifying glass on the top right and then search for
> "error:"? You should find the compile output there.
>

On the autobuilder web page I have only see the the bitbake error at the
end of the stdio log.
I downloaded the stdout log and now I can see the shaderc compilation
output.

Many thanks for the help.


>
> Cheers,
>
> Richard
>
>
>
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004c05ba05bac7c21f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia domingo, 7/02/2021 =C3=A0(s) 23:37:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Sun, 2021-02-07 at 23:13 +0000, =
Jose Quaresma wrote:<br>
&gt; <br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no=
 dia<br>
&gt; domingo, 7/02/2021 =C3=A0(s) 23:00:<br>
&gt; &gt; On Sun, 2021-02-07 at 22:56 +0000, Jose Quaresma wrote:<br>
&gt; &gt; &gt; Hi Richard,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I need some help to analyze the log of the compilation.<br>
&gt; &gt; &gt; where can i find it? is it possible?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The compilation log mentioned on<br>
&gt; &gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/83/builds/1835" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/83/builds/1835</a><br>
&gt; &gt; &gt; are<br>
&gt; &gt; &gt; /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86=
_64-<br>
&gt; &gt; &gt; linux/shaderc-native/2020.4-r0/temp/log.do_compile.199121<br=
>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On my side it build fine on=C2=A0x86_64 so I don&#39;t under=
stand the<br>
&gt; &gt; problem!<br>
&gt; &gt; <br>
&gt; &gt; That log is included here:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/40/builds/3034/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/3034/step=
s/11/logs/stdio</a><br>
&gt; &gt; <br>
&gt; &gt; or here is another:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/65/builds/3056/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3056/step=
s/11/logs/stdio</a><br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; I have seen the log of the bitbake=C2=A0but what I liked to access was=
 the<br>
&gt; log of the compilation in the WORKDIR of the shaderc.Is it=C2=A0possib=
le ?<br>
<br>
That logfile is printed onto stdout so the log in that file is what you<br>
see printed on the console in the above logs.<br>
<br>
Did you click the magnifying glass on the top right and then search for<br>
&quot;error:&quot;? You should find the compile output there.<br></blockquo=
te><div><br></div><div>On the autobuilder web page I have only see the the =
bitbake error at the end of the stdio log.</div><div>I downloaded the stdou=
t log and now I can see the shaderc compilation output.</div><div></div><di=
v><br></div><div>Many thanks for the help.</div><div></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000004c05ba05bac7c21f--
