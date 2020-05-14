Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.13825.1589467720174409421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 07:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t/hcO+vG;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id c24so3038367qtw.7
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rTaj4tzd1YC+N7ApZHK8VvxTuVfrk5LbQdl1uxiKwWs=;
        b=t/hcO+vGFKOjXVtuvM2nDzdPXoDNv+536r+eanlAt8xGAJUHQEPW+SaTga66y7Z9+b
         QM5kHm42ga4URz4A+vc+hbRJc2apFEKNfjqaGUleahRGZQhdMESPEAmZChoIp5b0XNsu
         YAywNWuVXRPmcA9usxe+g7r5H2DYUZtPl2CjZHbpYgnVMQ/Hbw2vqdy54veHoyAlDW/J
         BfTPLQ62eAsGGTINDwSFJDpnZ+4bmiOw5c94CsYnxS5yrDinPJ3BYk0hM7XXKQJUb+Ec
         x5ksKlzJleZTkeHhS9POod5qQYHYLWgAZQUvtm6BxhpQtqOtBGAZKoyVcr7HjqYhH7y0
         HP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rTaj4tzd1YC+N7ApZHK8VvxTuVfrk5LbQdl1uxiKwWs=;
        b=gpDf+MLOhdnLMBPzEPMND5ONoctHzgR/4rIu6QPuV0l39hAkm9Zf05gij/+tTJs6jc
         tgl8ac7LrpfuIwIdb0rGVZjiWSa8pCicVRapooR4tuhNpwwoFqW5O2k+sJkoosa1rTpj
         m8Xw/iv0sK8brSlkvCStHGZLCwyS0UnJ4R4bRL2kj3ZXUDjBUFmg5E9E+mkcsZwg6Eu8
         83aoNdl5XLaMWurcpzGqEu2cG6HyMqwr5c8drYMGiv0+9VMbhFSN8grL72SpqnXOFJjM
         eFeH6zMHHWMpx/kIwpY13NsvZFSJ3kCbX8xMW2UQkP7q2/09Id0pKsSJ8BoPHBa81IlL
         h+KQ==
X-Gm-Message-State: AOAM530/k6uxisQgLY61O7pOnHQaGfhlVLzOT+A3oAJ/JbzaHGQ6HpB+
	AJ6EMve4Lt6gSquGANW9jUqzAT3NUkpBsBe78k+iXRx8
X-Google-Smtp-Source: ABdhPJyu6tx1CIK/QtwW9JGh3/hPhCgbwVFQFkJwYKA71s6uZlCszWXPmesppUJspU7UKQNJQsC7dcFWgVpD6ab7Gjc=
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr4813222qtp.293.1589467719076;
 Thu, 14 May 2020 07:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200511182812.441561-1-raj.khem@gmail.com> <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514073821.GA16323@localhost> <CAMKF1sp0G_fz0Jjf5z4=qR5rTVK-miTABZjdkQn2FK2Ypm4v2g@mail.gmail.com>
 <20200514131606.GA17383@localhost> <CAMKF1sp_XsD7FSSogPWbYVNTV7uzOr9Ci15g3KgA7dbi7dkb_g@mail.gmail.com>
 <20200514140715.GA20289@localhost>
In-Reply-To: <20200514140715.GA20289@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 14 May 2020 07:48:28 -0700
Message-ID: <CAMKF1sqscoZndYWRRCb9J2bBKr7Js78dqu_a89rV_Nn9=O5yPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c712b005a59ccaea"

--000000000000c712b005a59ccaea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 7:07 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Thu, May 14, 2020 at 06:56:07AM -0700, Khem Raj wrote:
> > On Thu, May 14, 2020 at 6:16 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > > On Thu, May 14, 2020 at 05:47:48AM -0700, Khem Raj wrote:
> > > > On Thu, May 14, 2020 at 12:38 AM Adrian Bunk <bunk@stusta.de> wrote=
:
> > > > > On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrote:
> > > > > > This was added recently, but it seems be chewing more than what
> it
> > > > > > should and causes non glibc packages also depend on it.
> > > > > >...
> > > > >
> > > > > Is this only valgrind (there is a upstream bug open for that),
> > > > > or were there more recipes with a problem?
> > > >
> > > > Just valgrind but problem can happen with static linking with no
> default
> > > > libs in general
> > >
> > > No, it cannot.
> > > The relevant part of "no default libs" is not linking with libc.
> > >
> > > Linking statically with libgcc and then providing own implementations
> > > of all libc functions used by libgcc instead of linking with libc is
> > > not a common situation.
> >
> > Take a look At what=E2=80=99s going on in valgrind memcheck build if yo=
u are
> > interested perhaps you will find something which is not yet understood
>
> Memcheck links statically with libgcc, and it does not link with libc.


Ok what happens when you link it with libc


>
> This is not a general static linking problem,
> normal userspace code links with libc (shared or static).
>
> cu
> Adrian
>

--000000000000c712b005a59ccaea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 14, 2020 at 7:07 AM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Thu, May 14, 2020 at 06:56:07AM -0700, Khem Raj wrote:=
<br>
&gt; On Thu, May 14, 2020 at 6:16 AM Adrian Bunk &lt;<a href=3D"mailto:bunk=
@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, May 14, 2020 at 05:47:48AM -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; On Thu, May 14, 2020 at 12:38 AM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; On Mon, May 11, 2020 at 11:28:12AM -0700, Khem Raj wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt; This was added recently, but it seems be chewing m=
ore than what it<br>
&gt; &gt; &gt; &gt; &gt; should and causes non glibc packages also depend o=
n it.<br>
&gt; &gt; &gt; &gt; &gt;...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Is this only valgrind (there is a upstream bug open for=
 that),<br>
&gt; &gt; &gt; &gt; or were there more recipes with a problem?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Just valgrind but problem can happen with static linking wit=
h no default<br>
&gt; &gt; &gt; libs in general<br>
&gt; &gt;<br>
&gt; &gt; No, it cannot.<br>
&gt; &gt; The relevant part of &quot;no default libs&quot; is not linking w=
ith libc.<br>
&gt; &gt;<br>
&gt; &gt; Linking statically with libgcc and then providing own implementat=
ions<br>
&gt; &gt; of all libc functions used by libgcc instead of linking with libc=
 is<br>
&gt; &gt; not a common situation.<br>
&gt; <br>
&gt; Take a look At what=E2=80=99s going on in valgrind memcheck build if y=
ou are<br>
&gt; interested perhaps you will find something which is not yet understood=
<br>
<br>
Memcheck links statically with libgcc, and it does not link with libc.</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok what happens when =
you link it with libc=C2=A0</div><div dir=3D"auto"><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><br>
<br>
This is not a general static linking problem,<br>
normal userspace code links with libc (shared or static).<br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--000000000000c712b005a59ccaea--
