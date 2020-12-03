Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.4494.1607032471462569789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 13:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OiXEJaTp;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id t8so3693948iov.8
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 13:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v5WYudSwv6AQu7qJK+KHJOsQeiCUhT+qOsg6lqGJMLQ=;
        b=OiXEJaTpnQ3Clbixb8v5YuEv3TXTs+JMDYm8uu6hPa3MQ5aZenCQaQzTLcQXXCxI4D
         d+iKIOCawP7XRAORSA9CWzmldR7RhAO9ly9aybQ+/AHPgUplJf6Y1MOt8py0VNkAfGv+
         0viMG9g/yFMVsdZ0a76W7DxucyVkK/80CM8wKpV7pFF19+YSW63mKdVly7swFs1HXPbY
         q+8jefjRWDNmR6W4yZF/013VaLv74vJfLtpcLd1Ml1qPjI6YZCHqvdYIX7ft9BsDG/Yz
         RsomkL11wyLmWWVNOi3Bf2MB+A/RkVMohZLBT1aSciiJmdo1mCnTkpwAq6SL1s8WSM9F
         dDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v5WYudSwv6AQu7qJK+KHJOsQeiCUhT+qOsg6lqGJMLQ=;
        b=qf9lD2vIawatrO1w+ndZ8C8Mj9yfZNBzVYmS64UfKZsue1A/J2yzSCE3MiBE+H19Vv
         I4Han1BTOl7qc26B44SMKegVSMzaRtuRB0pfHUR6JIQQPfg2Jrr7ZvGrX9H2mnB+Ek/N
         VlqoBdPsnepuK7omjdn7F6dFO5cwknnClv9DWoldGFrfb4lzVJuoSkA2C2tb/Wo59w7P
         RbxyuTGwj7/5KJ1BMpt8oR2kTzDGrKlW3ecuMhKfAry3a9u/QhQe40WVFiMzws7NE4By
         mubSJuNWDWCcEyIrUSxGPTQnktV3JhbsG8XlgC//FKXnS739DNze9YI5tAyRRTJIIEjd
         C3rA==
X-Gm-Message-State: AOAM533BdIqxzUsWsOLpqVJFJU36gCp1i0stlicgdM+TlleGNSSKfXw9
	mbqJDENvbhFsaytORG3aQe2hWAuH25p1lpyJWLY=
X-Google-Smtp-Source: ABdhPJz+rWOvonULsoghuMpTpPyELknitQNw0YsQu56bDqeoeeniUBJEuZEV4it9oSTRoi2lt3KD2Jh9wU6oc22TX4o=
X-Received: by 2002:a5d:8356:: with SMTP id q22mr1755188ior.50.1607032470886;
 Thu, 03 Dec 2020 13:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20201203133526.2075-1-twoerner@gmail.com> <CAMKF1sqDGwjkour8X=F9YPmFNY=nyPvFb8q8O9YvVxQGMsJK_w@mail.gmail.com>
In-Reply-To: <CAMKF1sqDGwjkour8X=F9YPmFNY=nyPvFb8q8O9YvVxQGMsJK_w@mail.gmail.com>
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Thu, 3 Dec 2020 16:54:19 -0500
Message-ID: <CAHUNapQssKQy9Cmf=wcQXJ7BOHD-Z5cj2V5+vKT0CaOshM73aA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa.inc: add dispmanx support
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000091df4705b59667cc"

--00000000000091df4705b59667cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 3, 2020 at 2:01 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Dec 3, 2020 at 5:35 AM Trevor Woerner <twoerner@gmail.com> wrote:
> > -ANY_OF_DISTRO_FEATURES_class-target =3D "opengl vulkan"
> > +ANY_OF_DISTRO_FEATURES_class-target =3D "opengl vulkan dispmanx"
> >
>
> dispmanx is only supported by userland graphics and we do have a
> machine feature knob for that
> this addition seems not common enough to warrant inclusion in OE-Core.
> I would suggest to keep it
> in meta-raspberrypi via a bbappend using the machine feature check


I agree with you 100%, and I resisted the idea of a new DISTRO_FEATURE too.
However=E2=80=A6 Adding "dispmanx" as a new DISTRO_FEATURE here was done al=
most
entirely in order to support the changes I made to
meta-openembedded's meta-oe/recipes-benchmarks/glmark2. I don't think that
the kind of changes needed over there are possible to do in a bbappend in a
BSP layer (?).

--00000000000091df4705b59667cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 3, 2020 at 2:01 PM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Dec 3, 2020 at 5:35 AM Trevor Woerner &lt;<a href=3D"mai=
lto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt; wrote:=
<br>&gt; -ANY_OF_DISTRO_FEATURES_class-target =3D &quot;opengl vulkan&quot;=
<br>
&gt; +ANY_OF_DISTRO_FEATURES_class-target =3D &quot;opengl vulkan dispmanx&=
quot;<br>
&gt;<br>
<br>
dispmanx is only supported by userland graphics and we do have a<br>
machine feature knob for that<br>
this addition seems not common enough to warrant inclusion in OE-Core.<br>
I would suggest to keep it<br>
in meta-raspberrypi via a bbappend using the machine feature check</blockqu=
ote><div><br></div><div>I agree with you 100%, and I resisted the idea of a=
 new=C2=A0DISTRO_FEATURE too. However=E2=80=A6 Adding &quot;dispmanx&quot; =
as a new DISTRO_FEATURE here was done almost entirely in order to support t=
he changes I made to meta-openembedded&#39;s=C2=A0meta-oe/recipes-benchmark=
s/glmark2. I don&#39;t think that the kind of changes needed over there are=
 possible to do in a bbappend in a BSP layer (?).</div></div></div>

--00000000000091df4705b59667cc--
