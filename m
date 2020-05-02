Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.10321.1588443394153830857
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 11:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vwq6pMWp;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id u12so5389874vsq.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 11:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kc73ZaGGMfHWlnNoc5YLwqWan2HwjNXpdyyQYF4GXZE=;
        b=Vwq6pMWpJlXxn2SsOpuyjN3mgeYQvrR+528pbQLsMXNhz0PZjXBlyndVlyfkM5Au1q
         7gD2x1dMlaFO/taO1+O2pxdGeshCPaeoevG1Gj5K3vuHL/20/+BDZl/R8WGaTu3Jx0/U
         ZElsICr3Pyhsxe7uxjQFpYcUjcfiVFOgEcGagcc22TuGo3k87NNIjXuKL/rUwfmzPAtB
         mKSkIn/y3nkp/9zYsq+65exJvYRR+rgDBG5YYEjeEimBLbv088ic7yRonLWFOcRVky6X
         Wx6KjqMrmoZEUNxJaIb8lGWb0R2aqzMVasWVPv2JADvltPeyuTEPfV9KlHzuWd0gH6wu
         jVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kc73ZaGGMfHWlnNoc5YLwqWan2HwjNXpdyyQYF4GXZE=;
        b=MaCINLteUyDSx/XcHaM4CiUy+XxMHTXtpu5rOvPQM4wqZ9JXiwXqFuDrarMLxhB9Ax
         yM6AT86sxOsbId7fns519GkuhSTHfcBhnFfELygvZUnvcYnCH7JZtjNOaVV+OXeJ1ClW
         dJYei198ug3U4hqTm0mOZmUlVEXb+Eq8QdG/8Abqgod+i4BjPKoOwewJK2t/HAv3yarl
         Bvn/Mevoes/K2X1cYu6bN03yELsHUgtuju0w9inU363+gTKdba+2jlYimI/SRGgPmlI9
         N8Z/WVJFlTmtgy8WObEgIWdLyPR0IzDnIho59bqBzUjzR/wC3UxDebfEPa7km6dU4SHH
         isTQ==
X-Gm-Message-State: AGi0PubUddMpIw2/boEFatErsC85dpjmjv8BOOhSFarwwEOjWxwurmpY
	MiAHw+uTn43lfO2cZRBNj7uQv0eNUNvbqCaOR2Q=
X-Google-Smtp-Source: APiQypJ70xpHzqSy5OlUbXqKNVEm2guZCnUxls25CbNzO9q+5sjeqDGGhbOO46ZvTGkICB4anfOHLtUv5YO73NDX8tg=
X-Received: by 2002:a67:6889:: with SMTP id d131mr7161967vsc.25.1588443393241;
 Sat, 02 May 2020 11:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095815.2824-1-alex.kanavin@gmail.com> <20200430095815.2824-16-alex.kanavin@gmail.com>
 <2e66b913ad106592755b0a53e2440dd46c21eb4c.camel@linuxfoundation.org>
In-Reply-To: <2e66b913ad106592755b0a53e2440dd46c21eb4c.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 2 May 2020 20:16:21 +0200
Message-ID: <CANNYZj_ofd+w6ERJJHQSeu=H15k9mq3Q0K20GfTXbz0+Pz8G_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] glib-2.0: update 2.62.4 -> 2.64.2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000333b7305a4ae4c2d"

--000000000000333b7305a4ae4c2d
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2020 at 17:00, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-04-30 at 11:58 +0200, Alexander Kanavin wrote:
> > Add a couple of missing ptest dependencies.
>
> That causes problems for non-gplv3:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1848
>

"Missing or unbuildable dependency chain was: ['core-image-minimal',
'packagegroup-core-boot', 'udev', 'glib-2.0', 'python3-dbusmock']"
The offending package is pulled in via ptests RDEPENDS.

This can be addressed either via
DISTRO_FEATURES_remove = "ptest"

or setting license restrictions per-image:
INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"

I prefer the latter - thoughts?

Alex

--000000000000333b7305a4ae4c2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 2 May 2020 at 17:00, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bla=
nk">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, =
2020-04-30 at 11:58 +0200, Alexander Kanavin wrote:<br>
&gt; Add a couple of missing ptest dependencies.<br>
<br>
That causes problems for non-gplv3:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/75/build=
s/1848" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/75/builds/1848</a><br></blockquote><div><br></div=
><div><div>&quot;Missing or unbuildable dependency chain was: [&#39;core-im=
age-minimal&#39;, &#39;packagegroup-core-boot&#39;, &#39;udev&#39;, &#39;gl=
ib-2.0&#39;, &#39;python3-dbusmock&#39;]&quot;</div></div><div>The offendin=
g package is pulled in via ptests RDEPENDS.<br></div><div><br></div><div>Th=
is can be addressed either via</div><div>DISTRO_FEATURES_remove =3D &quot;p=
test&quot; </div><div><br></div><div>or setting license restrictions per-im=
age:</div><div>INCOMPATIBLE_LICENSE_pn-core-image-minimal =3D &quot;GPL-3.0=
 LGPL-3.0&quot;</div><div><br></div><div>I prefer the latter - thoughts?<br=
></div><div>=C2=A0</div><div>Alex<br></div></div></div>

--000000000000333b7305a4ae4c2d--
