Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.13332.1596389814032976955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2020 10:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hd9/u7j3;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id v22so14868723edy.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2020 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KHz/DqeNSBdk4BbjOmRUcj3Hm1wFda9Gii8o2itA0Cg=;
        b=hd9/u7j331GNywvOqJISWWyW837LTqdv3DF7t+wtHSAN1+2+4pgigSUD2gca3vkZ0M
         csjL4tYMgQih2C1ZGoa6Mpp5ZuNJnIgm2BCV8+nv5bEqakLBJc68GA0mCYBAGBeEvNAn
         tZcZql2mEjjLdSkog5wUG0WCcDdZ1VBMuwMVNynZf//1m/GCiYiNIMKav+X/F/Fi6tCd
         veOx/C1kuTy42kWf8VLw0CdkEdH+2fig/bb5hoXThdn1B4JrsxH+I2lDYb4DQg8UedBk
         oxYrhXp2b6wZBU55c4zp7jAlDjHX6DtEJQPnjvsl9N2dGw8ucBAVCGZPGRVSr0xlG3Na
         vG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KHz/DqeNSBdk4BbjOmRUcj3Hm1wFda9Gii8o2itA0Cg=;
        b=PNWElpSagvI+faDPk1SI+xr7E45aJl5zNpF3I7Bv0lqLGw5YV5rag3wHnA15VA7oQv
         s8uyAmb8lYlK4dpWX9kHsINWCwVx4ru0rhed1fU2HEa2EXQwUWO2esBPnxKXWdxRd+98
         ptfn17UpZHhervfBOfyOJk3Ncc5EjeElEWYb2qfXl3WTCNlcN39Wi/bjRkZZvCaEby9D
         q77C/Uh+uENvqKySUQb2RgnVccEy5uPgGoOFGuY4Rugi3YTbzV7KYJeH+pzWCznZ6E+a
         xEa9BSAcrJ3dNdDdJva9YMTRnmLuN/E6hImCQWvTlubRv9ex1oJdtpaLH7Gc6nWPkGcH
         rDnQ==
X-Gm-Message-State: AOAM5323nPYYWZw9MtYqBvp4LuktB0CZN7Zasv16KlaXNDibIo8pehF5
	joOwyXD5JocTPWXawZevJrnR/4pw64O+8ORQZhQ=
X-Google-Smtp-Source: ABdhPJwRD9pPqYFSkEUd0VYy9Lv8nr6lN0U+E5XNE6/7Dc9+Gl6dqBstCAcTLxviE6qqsGXJasEzkNr3qrX+m/Ts64k=
X-Received: by 2002:a50:ec90:: with SMTP id e16mr12843827edr.234.1596389812575;
 Sun, 02 Aug 2020 10:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200730075343.2118722-1-raj.khem@gmail.com> <b239d09f8e3d55103fb5aef84b2aebf5b13a8817.camel@linuxfoundation.org>
 <CAMKF1sop58PPx6M8Xc4GrfvS9AvOHrVe_GwgEDk8_2-3FXDZ6w@mail.gmail.com>
In-Reply-To: <CAMKF1sop58PPx6M8Xc4GrfvS9AvOHrVe_GwgEDk8_2-3FXDZ6w@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 2 Aug 2020 13:36:41 -0400
Message-ID: <CADkTA4NNSg3+K7qQq_6tHzJzzD_7cmdQEuVz5XEujK3vT0xF6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.35 release
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b3a09005abe87786"

--000000000000b3a09005abe87786
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 2, 2020 at 1:48 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Aug 1, 2020 at 3:12 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2020-07-30 at 00:53 -0700, Khem Raj wrote:
> > > assembler supports dwarf-5 format line numbers
> > > linker has -M -MP gcc-like option
> > >
> > > for detailed release notes see [1]
> > >
> > > [1] https://lists.gnu.org/archive/html/info-gnu/2020-07/msg00008.html
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > This patch looks to be the cause of the perf failures you mentioned to
> > me on irc:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1225
> >
>
> I looked into the error a bit, it seems we need to backport a kernel
> patch [1] to get this fixed
>
> Bruce, Can you please schedule this backport and perhaps send kernel
> updates for master which this patch
>

I've grabbed the change.

Monday is a holiday here, but I'll try and get my next series out at the
latest Tuesday.

Bruce



> in
>
> [1]
> https://github.com/torvalds/linux/commit/39efdd94e314336f4acbac4c07e0f37bdc3bef71
>
> Thanks
> -Khem
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b3a09005abe87786
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Aug 2, 2020 at 1:48 AM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Aug 1, 2020 at 3:1=
2 AM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 2020-07-30 at 00:53 -0700, Khem Raj wrote:<br>
&gt; &gt; assembler supports dwarf-5 format line numbers<br>
&gt; &gt; linker has -M -MP gcc-like option<br>
&gt; &gt;<br>
&gt; &gt; for detailed release notes see [1]<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://lists.gnu.org/archive/html/info-gnu/2020-0=
7/msg00008.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org=
/archive/html/info-gnu/2020-07/msg00008.html</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This patch looks to be the cause of the perf failures you mentioned to=
<br>
&gt; me on irc:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/=
builds/1225" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/83/builds/1225</a><br>
&gt;<br>
<br>
I looked into the error a bit, it seems we need to backport a kernel<br>
patch [1] to get this fixed<br>
<br>
Bruce, Can you please schedule this backport and perhaps send kernel<br>
updates for master which this patch<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">I&#39;ve grabbed the ch=
ange.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Monday is a h=
oliday here, but I&#39;ll try and get my next series out at the latest Tues=
day.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
in<br>
<br>
[1] <a href=3D"https://github.com/torvalds/linux/commit/39efdd94e314336f4ac=
bac4c07e0f37bdc3bef71" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/torvalds/linux/commit/39efdd94e314336f4acbac4c07e0f37bdc3bef71</a><br>
<br>
Thanks<br>
-Khem<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000b3a09005abe87786--
