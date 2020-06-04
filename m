Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.14699.1591279605586530384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 07:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RHLq9H1q;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id g9so4795756edw.10
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v90JbTk8T0rZtgc55Km5udAITs4khhfQFMjyFJHZYcc=;
        b=RHLq9H1qjnehH5dyi2BIsG/S8z3KA2+LgkXcH6GZWyHJq2FLkULX4BXXPfstOCJWEI
         3GSMpjrnMrtPEWJUua4zNsYl1vBFO2QfVNCtMJqKSQFHBWU84wm6kmjSB1XeT5aO57/J
         AdDizL5Hy+h2tt27VPnVx8yhEUA/cXaN0PxvV+P92+XPj6xv2hb1DhAj8qiO7pHurEqd
         erueQBInsw0kheVXpF6IHkvCL3T4aVH8ftJTE18T+aX4xLpDxlHujKpPq3DtFlfUtzTt
         dQuRp2RotAzlNdl9kT4H688Ku/gXtIKwuEMlwGh4fRgwYq5FIWUk0CNIryU2jUIPGBE9
         ijjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v90JbTk8T0rZtgc55Km5udAITs4khhfQFMjyFJHZYcc=;
        b=GIIxJ/CRD3AKuO7ac7sOuNVUj2by44k5caHcz111DNuQLygBvI7VMt2EW4jz80qv5b
         yfPua0y0F29942YnE6I+67p84T8uBB1XEHZbnceA5fxnB+7WvFNP54q5z9kvAT2IFiX7
         MzXWGFC9FOOruZhiQVZ7Myotkbum0ymICn6UZ97K5gIp0Qw5s70tbIkcUmbHbWx2yVpH
         QCKQh9NsxVpE/+DL35Fxt+f1MD6KLWD9Jn2jmT5d8/9ulxxGEO+SoiBU5pOEeOaha4vY
         dJJN4PyzeTT6TTRyHzanaT1fPqrRmmK7YMGIrvsFH0kymRIhJfVd4WQySBHCLW7CFFFs
         ayhA==
X-Gm-Message-State: AOAM532kHLjLvN6ZM3bMREpHcwoUkQepJkFRIjsjp/f925+LPLuS+Hqa
	RFMLt48hSl1n+VhivhtGpquwKnnVnV+rqH6qwdQ=
X-Google-Smtp-Source: ABdhPJwJaVh8v0dEDdqsnvVA3MFpeEE3G14WwkX4Fr76kQ2PPequwmeYlhBx+0tpWTsJEq+nLb1BV5IM5obxR2g93I0=
X-Received: by 2002:a05:6402:1217:: with SMTP id c23mr4452118edw.270.1591279604046;
 Thu, 04 Jun 2020 07:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200604120349.17455-1-schnitzeltony@gmail.com>
 <faaa5a2d120eacab6825cf079e92aa220dd7b151.camel@linuxfoundation.org>
 <CALbNGRQDVCm4zDJ6NPw=+-mQ8xibCDh+pqjToPcrnXRvJcYOkg@mail.gmail.com>
 <421c9a5c69b54bfb41734e58b89dc66bf9e84c0a.camel@linuxfoundation.org>
 <CALbNGRQyxDXcyKUA3zFYfwRFivLWbqrYyoGSKr4CWRz0Vjo1YA@mail.gmail.com> <20200604135728.wce5jsupc6bgwmvi@qschulz>
In-Reply-To: <20200604135728.wce5jsupc6bgwmvi@qschulz>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2020 16:06:33 +0200
Message-ID: <CA+chaQd4bb751gr6igkcemwYS3qNZqg21fR9jTZrjGPRboa_sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][warrior] pseudo: Fix enum typedef
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000089a02605a742a7ef"

--00000000000089a02605a742a7ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe I'm reading RP's reply differently, but I think he just asked to
collect all necessary changes for warrior to support newer host, before
they are accepted.

It doesn't help much when only one smaller issue is fixed and the rest
still needs to be figured out locally and the commit message might even
mislead people in assuming that gcc-10 on host is now supported in
warrior/thud.

FWIW: I've built some smaller thud based images on 20.04 with only small
modifications, e.g. fix for qemu:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/t=
hud&id=3D68475d0255c4089538886d1ee2cab6b6efd62ce1
there aren't probably many issues left, so it just needs someone to test i=
t
more properly and collect all needed fixes to apply them at the same time
or give up if it shows too many difficult to solve issues (I doubt that).

In worst case they might be rejected, but then it would be still useful to
have them in one pull request and share them with other interested parties=
.

Cheers,

On Thu, Jun 4, 2020 at 3:58 PM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> On Thu, Jun 04, 2020 at 03:49:28PM +0200, Andreas M=C3=BCller wrote:
> > On Thu, Jun 4, 2020 at 2:47 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2020-06-04 at 14:18 +0200, Andreas M=C3=BCller wrote:
> > > > On Thu, Jun 4, 2020 at 2:11 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > On Thu, 2020-06-04 at 14:03 +0200, Andreas M=C3=BCller wrote:
> > > > > > From: Jacob Kroon <jacob.kroon@gmail.com>
> > > > > >
> > > > > > 'pseudo_access_t' is a type, so use typedef.
> > > > > >
> > > > > > Fixes building pseudo with gcc 10 where -fno-common is the
> > > > > > default.
> > > > > >
> > > > > > (Backport of OE-Core rev:
> > > > > > a7d519f742aadc9110c2401f359254210a784f6b)
> > > > > >
> > > > > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > > > > Signed-off-by: Richard Purdie <
> richard.purdie@linuxfoundation.org
> > > > > > >
> > > > > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > > >
> > > > > Does warrior otherwise work on gcc10 hosts?
> > > > Not yet but I am working on it.
> > >
> > > I think to make a decision on whether we plan to support gcc10 or no=
t
> > > we'll need to know the scope of the changes. I'm starting to worry t=
his
> > > would be a bit too invasive, particularly as warrior is about to ent=
er
> > > community support or EOL depending on whether there is a maintainer.
> > >
> > I see. Problems for me - job's hat on - are:
> >
> > 1. we're close to release a product based on warrior (and a new
> > colleague of mine has just installed Fedora 32 with gcc 10 - that's
> > why I ask for it)
> > 2. my tests with dunfell were - hmm - not running out of the box exact=
ly.
> >
> > So we should decide to upgrade to dunfell. That is what I use for
> > private raspi-images an am very close to happy.
> >
>
> Dang, I was silently but closely following the discussion hoping to be
> able to apply more or less the same patches on top of thud. Same issue
> as yours, colleagues moving to Ubuntu 20.04 with gcc 10+. I guess it's
> docker time :/ (there'll always be that one client that will not want to
> upgrade to newer releases).
>
> Or maybe we can support gcc10 on the community branch once it's EOL (or
> doing the job ourselves..). What seems to be the big worry about
> supporting gcc10 on warrior/thud? Just so I can explain why we should go
> the docker route instead of spending time on making thud (and we still
> have krogoth for some...) build with gcc10 and maybe start working on
> upgrading those we can to newer releases. Basically what are the
> expected big hurdles on the way?
>
> Cheers,
> Quentin
>=20
>

--00000000000089a02605a742a7ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Maybe I&#39;m reading RP&#39;s reply differently, but I th=
ink he just asked to collect all necessary=C2=A0changes for warrior to supp=
ort newer host, before they are accepted.<div><br></div><div>It doesn&#39;t=
 help much when only one smaller issue is fixed and the rest still needs to=
 be figured out locally and the commit message might even mislead people in=
 assuming that gcc-10 on host is now supported in warrior/thud.</div><div><=
br></div><div>FWIW: I&#39;ve built some smaller thud based images on 20.04 =
with only small modifications, e.g. fix for qemu:</div><div><a href=3D"http=
s://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/thud&a=
mp;id=3D68475d0255c4089538886d1ee2cab6b6efd62ce1">https://git.openembedded.=
org/openembedded-core-contrib/commit/?h=3Djansa/thud&amp;id=3D68475d0255c40=
89538886d1ee2cab6b6efd62ce1</a><br></div><div>there aren&#39;t probably man=
y issues left, so it just needs someone to test it more properly and collec=
t all needed fixes to apply them at the same time or give up if it shows to=
o many difficult to solve issues (I doubt that).</div><div><br></div><div>I=
n worst case they might be rejected, but then it would be still useful to h=
ave them in one pull request and share them with other interested parties.<=
/div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 4, 2020 at 3:58 PM Quenti=
n Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.=
schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Thu, Jun 04, 2020 at 03:49:28PM +0200, Andreas=
 M=C3=BCller wrote:<br>
&gt; On Thu, Jun 4, 2020 at 2:47 PM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_=
blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 2020-06-04 at 14:18 +0200, Andreas M=C3=BCller wrote:<br=
>
&gt; &gt; &gt; On Thu, Jun 4, 2020 at 2:11 PM Richard Purdie<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" t=
arget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; On Thu, 2020-06-04 at 14:03 +0200, Andreas M=C3=BCller=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; From: Jacob Kroon &lt;<a href=3D"mailto:jacob.kro=
on@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &#39;pseudo_access_t&#39; is a type, so use typed=
ef.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Fixes building pseudo with gcc 10 where -fno-comm=
on is the<br>
&gt; &gt; &gt; &gt; &gt; default.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; (Backport of OE-Core rev:<br>
&gt; &gt; &gt; &gt; &gt; a7d519f742aadc9110c2401f359254210a784f6b)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:=
jacob.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mail=
to:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@lin=
uxfoundation.org</a><br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D=
"mailto:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com<=
/a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Does warrior otherwise work on gcc10 hosts?<br>
&gt; &gt; &gt; Not yet but I am working on it.<br>
&gt; &gt;<br>
&gt; &gt; I think to make a decision on whether we plan to support gcc10 o=
r not<br>
&gt; &gt; we&#39;ll need to know the scope of the changes. I&#39;m startin=
g to worry this<br>
&gt; &gt; would be a bit too invasive, particularly as warrior is about to=
 enter<br>
&gt; &gt; community support or EOL depending on whether there is a maintai=
ner.<br>
&gt; &gt;<br>
&gt; I see. Problems for me - job&#39;s hat on - are:<br>
&gt; <br>
&gt; 1. we&#39;re close to release a product based on warrior (and a new<b=
r>
&gt; colleague of mine has just installed Fedora 32 with gcc 10 - that&#39=
;s<br>
&gt; why I ask for it)<br>
&gt; 2. my tests with dunfell were - hmm - not running out of the box exac=
tly.<br>
&gt; <br>
&gt; So we should decide to upgrade to dunfell. That is what I use for<br>
&gt; private raspi-images an am very close to happy.<br>
&gt; <br>
<br>
Dang, I was silently but closely following the discussion hoping to be<br>
able to apply more or less the same patches on top of thud. Same issue<br>
as yours, colleagues moving to Ubuntu 20.04 with gcc 10+. I guess it&#39;s=
<br>
docker time :/ (there&#39;ll always be that one client that will not want =
to<br>
upgrade to newer releases).<br>
<br>
Or maybe we can support gcc10 on the community branch once it&#39;s EOL (o=
r<br>
doing the job ourselves..). What seems to be the big worry about<br>
supporting gcc10 on warrior/thud? Just so I can explain why we should go<b=
r>
the docker route instead of spending time on making thud (and we still<br>
have krogoth for some...) build with gcc10 and maybe start working on<br>
upgrading those we can to newer releases. Basically what are the<br>
expected big hurdles on the way?<br>
<br>
Cheers,<br>
Quentin<br>
<br>
</blockquote></div>

--00000000000089a02605a742a7ef--
