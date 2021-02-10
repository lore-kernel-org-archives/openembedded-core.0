Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.429.1612992995420181204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 13:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=tIv4H0O7;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.176, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f176.google.com with SMTP id b24so2674258qtp.13
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 13:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=msp7W9/viqe/lD/7TS2tAqB8aOIxbVFqq+68Dt8+LY4=;
        b=tIv4H0O7GozM9cjpOS8J3MIP6SVUFmDyDW1Qq7NfJNJjCj7O7hXr2J+e5A8g/vs07t
         JtTwVYMBfgqFJfaMQx3ddzDhiCKHsbB4bFxePvdCHNUp69QzLVsNiV2I+QQKwME+6Yry
         kExqjuK8tz9gSKiQVXPdfxZsq0gLohCq+HnFdtWM/Q4DHVuHj8lo0INYl5La/Xp0zPBO
         u4Nh3rj8O8UtQT+q/iHpjdemEInsqIZIwJsb/SNazMZxbd3dbm2hP0IWVKwZvSMZNYHe
         ry8i2NxkiLmpK6f3ujeVzEX/wLKrLBrLgHVJHsEr6xtlXrYLqrnIDiXXRg9d6GZpLFyO
         aDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=msp7W9/viqe/lD/7TS2tAqB8aOIxbVFqq+68Dt8+LY4=;
        b=ZKywHQ0Wa6RA22LQsdXxIwIRW6Qifk+gLmacD+xUUe6p1MUgX+qyI3yhPb8dyDujCK
         aaS6Fv+wAIJ2FyKZLloR0Ms/doBmIG6O5s5uiMkyccNtlP/WszGXlj0N7EfqD3K0qbzC
         C+v5vV3cmeU8/WxtoHEbrvhPYKvrsBCKvQVnTQjXzfBWC8as6w7tXRDqJjXouUKdURy4
         G7GbKC+XhQGJrq4Vj2/F7T2Z8YrtC6FqiwA3DdsaeiWVLhh5iRvuEh92fOYtPuv1vmlr
         repTgaf2qywPt9OQE54eRely0yygpTT8bKJxIhY51ElWMR/aTmSOlE/+rltRt7xaHQmd
         4s9g==
X-Gm-Message-State: AOAM530V2rUn6CQs3MN2SPnWaN4AqKr5MWSIymaqUFbFGO+SIILgSFFk
	NG6XmEE/lm05uoPEN8+/LcFY3nOWGV9F6dyT
X-Google-Smtp-Source: ABdhPJz5C+brsSqREPaKfx8nd324z4KUSyciNJRKrI12Pgni0SzvZL6H+JT5qD8JJueWpRLPNJ5fow==
X-Received: by 2002:ac8:37d1:: with SMTP id e17mr4786129qtc.215.1612992994421;
        Wed, 10 Feb 2021 13:36:34 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id c17sm2097342qtn.71.2021.02.10.13.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 13:36:33 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f42.google.com with SMTP id r13so1617897qvm.11
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 13:36:33 -0800 (PST)
X-Received: by 2002:ad4:528c:: with SMTP id v12mr4843266qvr.32.1612992993645;
 Wed, 10 Feb 2021 13:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20210210111113.17318-1-raymsmithuk@gmail.com> <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
 <CAHS1ALKpm9+5Fa+roQ8ZJ3m3jGa3m=yymWpG8ftfEkVdAk+RqA@mail.gmail.com> <CAHtQpK7rFBrGHUJ2TG-Xke4V-kZc2jJF4hZgO5LtdGef4vNQfA@mail.gmail.com>
In-Reply-To: <CAHtQpK7rFBrGHUJ2TG-Xke4V-kZc2jJF4hZgO5LtdGef4vNQfA@mail.gmail.com>
Date: Wed, 10 Feb 2021 18:36:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKorRTxwsCdJPGT4hzG5cd560EUuOeGzVgnJ6CNLAhxjYQ@mail.gmail.com>
Message-ID: <CAP9ODKorRTxwsCdJPGT4hzG5cd560EUuOeGzVgnJ6CNLAhxjYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Ray Smith <raymsmithuk@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000695aa005bb0232e8"

--000000000000695aa005bb0232e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 10 de fev. de 2021 =C3=A0s 17:21, Andrey Zhizhikin <andrey.z@gmail=
.com>
escreveu:

> On Wed, Feb 10, 2021 at 3:41 PM Ray Smith <raymsmithuk@gmail.com> wrote:
> > On Wed, Feb 10, 2021 at 1:26 PM Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
> >>
> >>
> >> I didn't understand what you mean here. Could you elaborate this?
> >>
> >
> > If you try to build mesa with PACKAGECONFIG "egl gles dri" you get an
> error:
> > ../mesa-20.3.2/meson.build:144:4: ERROR: Problem encountered: building
> OpenGL ES without OpenGL is not supported.
> >
> > This means that in practice you can't get a GLES-only build of mesa, so
> mesa always provides OpenGL (ignoring Vulkan). But for an abstract graphi=
cs
> driver that's not true - many drivers provide GLES but not OpenGL. I'd
> argue that this is an implementation detail (and maybe a minor bug) of
> mesa. If mesa internally requires code from its OpenGL support to build
> GLES, it should silently include that if it's been configured for GLES-on=
ly.
> >
> > I only mention it to be clear that in general "GLES requires OpenGL" is
> not true, even though mesa's build system enforces that.
>
> Should this be clarified with Mesa folks upfront? If you believe that
> this limitation is rather "artificial", then there has to be a proper
> explanation from Mesa developers why OGL is provided when OGLES-only
> is built.
>

Agreed ... I'd rather not drop the check until we hear from upstream the
reasoning behind it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000695aa005bb0232e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 10 de fev. de 2021 =C3=A0s 1=
7:21, Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com">andrey.z@g=
mail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Feb 10, 2021 at 3:41 PM Ray Smith &lt;<a href=3D"mailto:=
raymsmithuk@gmail.com" target=3D"_blank">raymsmithuk@gmail.com</a>&gt; wrot=
e:<br>&gt; On Wed, Feb 10, 2021 at 1:26 PM Otavio Salvador &lt;<a href=3D"m=
ailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@o=
ssystems.com.br</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I didn&#39;t understand what you mean here. Could you elaborate th=
is?<br>
&gt;&gt;<br>
&gt;<br>
&gt; If you try to build mesa with PACKAGECONFIG &quot;egl gles dri&quot; y=
ou get an error:<br>
&gt; ../mesa-20.3.2/meson.build:144:4: ERROR: Problem encountered: building=
 OpenGL ES without OpenGL is not supported.<br>
&gt;<br>
&gt; This means that in practice you can&#39;t get a GLES-only build of mes=
a, so mesa always provides OpenGL (ignoring Vulkan). But for an abstract gr=
aphics driver that&#39;s not true - many drivers provide GLES but not OpenG=
L. I&#39;d argue that this is an implementation detail (and maybe a minor b=
ug) of mesa. If mesa internally requires code from its OpenGL support to bu=
ild GLES, it should silently include that if it&#39;s been configured for G=
LES-only.<br>
&gt;<br>
&gt; I only mention it to be clear that in general &quot;GLES requires Open=
GL&quot; is not true, even though mesa&#39;s build system enforces that.<br=
>
<br>
Should this be clarified with Mesa folks upfront? If you believe that<br>
this limitation is rather &quot;artificial&quot;, then there has to be a pr=
oper<br>
explanation from Mesa developers why OGL is provided when OGLES-only<br>
is built.<br>
</blockquote></div><div><br></div><div>Agreed ... I&#39;d rather not drop t=
he check until we hear from upstream the reasoning behind it.<br></div><br>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" t=
arget=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.o=
ssystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000695aa005bb0232e8--
