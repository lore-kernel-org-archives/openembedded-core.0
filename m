Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.29415.1595772116049309832
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 07:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ifjO12sQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id l6so12949758qkc.6
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vDZTnwVQYJdwulZmqdsv0NBsPoggPGU4ItLXn9ylCdM=;
        b=ifjO12sQvmc6Fwv5EmCsJNcQnFL0EB1F4qD0w0hrJ9ar/5izUzXDzFs2ImkWQFFZhg
         nJz5Rzxo5rro1s5TtP3krLH/RMYrG/qqmT8+T9gD6O3L3fq9VE2AcVM4MZX9IhSF7Udr
         3MimTD7qyWoXzwiZVxUhlOGHJ3CrdiYZ3z/0i63A1D0SODii9IY+zlpOz8oRIGwiogq9
         K2PVTQvBz+Hei7LVgYS7qeCCYsDIYMLx2DThcEa9JaUsJeVmkjhMCcat0NzZ1bx5hEgu
         eYoNRk8zyajKZUvTFGcxUjFqoFKhQz9aCwfcxM3A//sPBTF2hLz3L1uyFYhMeM+6+w3k
         ZCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vDZTnwVQYJdwulZmqdsv0NBsPoggPGU4ItLXn9ylCdM=;
        b=BnQb7DJafGrcvXqif2VAXiC5qgBVPjPQMgWi9XrXXpXW55DKROkAiCcAQmYDifa2vW
         mG8WzicBHslXL7Ui9FCuh8cevqgkSEIvcYSg2Yt9psR3Ewhtz58JwRz2sQCmnpcHeYlU
         RldxBPnrofKHfE4f+GBgAaXvMBUN4DKcPbUKSWxBXJyFWpo0jyEfhMThR+cdXLDomgeU
         gyyq72HsDGAugjcp9a/bMtc3BceXXC6h1qdD7gGERvmV+/7dpkyGVvV8F4yK3xqj0uNF
         h5VtpD/JZIKr/kf9HIyiZFnaZlXRuvYlBu0xZGesG9Qfzub4oQvY1V5q4nttTwvXFoBa
         VdyQ==
X-Gm-Message-State: AOAM533kvUdSffm2wGxsNYTYFwfpNh8xrq0iDcwgOzlm8RyEdVlhou0u
	L0c0yyKZJhxFnewkKMeGHG6yWJWa/sN6FvOVPQE=
X-Google-Smtp-Source: ABdhPJxI+iKAGPhqo1dvpJ2Ty9kWxNNhmnRVJmJxZZZKMwBTCmtW/Gu7ODiKG+A+1opahfLpmENjXJp1LUx6UPhRUBU=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr19978677qkp.215.1595772115163;
 Sun, 26 Jul 2020 07:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
 <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
 <1625397D9F68474B.26462@lists.openembedded.org> <65325f6d63b5927ea8f0f7a167119d0ca8dcfd34.camel@iki.fi>
In-Reply-To: <65325f6d63b5927ea8f0f7a167119d0ca8dcfd34.camel@iki.fi>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 26 Jul 2020 07:01:44 -0700
Message-ID: <CAMKF1srEGQnkaZutfPaH5QS_vK8Yx0NeWvWo_10rOQpD7s8=0A@mail.gmail.com>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000111ce805ab58a632"

--000000000000111ce805ab58a632
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2020 at 12:59 AM Tanu Kaskinen <tanuk@iki.fi> wrote:

> On Sun, 2020-07-26 at 09:27 +0300, Tanu Kaskinen wrote:
> > On Mon, 2020-07-20 at 15:26 -0700, Khem Raj wrote:
> > > On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > Hi!
> > > >
> > > > If a recipe provides NEON optimizations, should those be explicitly
> > > > disabled when "neon" is not in TUNE_FEATUERS, even if the software =
is
> > > > able to detect NEON availability at runtime?
> > > >
> > > > I'm currently converting the pulseaudio recipe from Autotools to
> Meson,
> > > > and the old Autotools build system supports disabling NEON
> > > > optimizations but the Meson build system doesn't. So I'm wondering
> if I
> > > > should add the missing feature to the Meson build system, or just l=
et
> > > > the runtime detection do its work.
> > > >
> > > > Is there ever need for disabling NEON optimizations if the CPU
> > > > indicates NEON support? I guess it could be useful for testing the
> "no
> > > > NEON" case (I today found out that dropping "neon" from TUNE_FEATUR=
ES
> > > > doesn't remove NEON support from the qemuarm machine), but otherwis=
e
> it
> > > > seems unnecessary, unless there are CPUs that advertise NEON suppor=
t
> > > > but don't actually support it.
> > > >
> > >
> > > I think the issue will result in a compiler error perhaps when neon i=
s
> > > disabled via
> > > compiler command line which would be the case when neon is not in
> TUNE_FEATURES
> > > the compiler might warn or error out when it finds neon instructions
> > > being compiled via inline
> > > assembly.  you just can try passing something like -mfpu=3Dvfpv3d16 o=
r
> > > some such and see if
> > > compiler/assembler complains during build, if not then perhaps its
> fine.
> >
> > If the last -mfpu is something else than neon, then including
> > arm_neon.h will succeed but compiling neon code will fail.
> >
> > I did some experiments, and what I found was that when I remove neon
> > from TUNE_FEATURES, OE adds -mfpu=3Dvfp to CC, not CFLAGS, so it's very
> > early in the compiler command line. PulseAudio adds -mfpu=3Dneon to
> > CFLAGS when building neon code, and the last -mfpu wins, so the neon
> > code gets built without errors.
> >
> > The configure check in PulseAudio only checks that the compiler accepts
> > -mfpu=3Dneon and #include <arm_neon.h>, it doesn't try to compile any
> > actual neon code. This means that if the user adds -mfpu=3Dvfp (or othe=
r
> > non-neon) to CFLAGS rather than CC, configure will pass but building
> > will fail. Is this something to guard against? A default qemuarm build
> > doesn't do this, so I don't know if this ever happens in OE.
> >
> > I don't know yet how Meson behaves, I'll continue testing...
>
> I tested Meson now. Meson too enables Neon even if -mfpu=3Dvfp is in CC.
> Unlike Autotools, Meson doesn't fail if -mfpu=3Dvfp is added to CFLAGS (I
> tried CFLAGS_append =3D " -mfpu=3Dvfp" in the pulseaudio recipe). Neon is
> enabled in any case.
>
> So, Meson seems pretty safe, although I guess it would be nice not to
> override the user's -mfpu setting. I think this isn't a big problem is
> practice, since runtime detection works.
>
> I haven't tested with a compiler that truly can't build Neon code,
> because I don't know how to do that.


Right. Cpu implementations without neon do exist
 But they are perhaps rare enough and may not use the package too so
chances are slim that we encounter this issue

Qemuarm emulated a cpu with neon so yes it won=E2=80=99t show on qemuarm

>
>
> --
> Tanu
>
> https://www.patreon.com/tanuk
> https://liberapay.com/tanuk
>
>

--000000000000111ce805ab58a632
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 26, 2020 at 12:59 AM Tanu Kaskinen &lt;<a href=
=3D"mailto:tanuk@iki.fi">tanuk@iki.fi</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Sun, 2020-07-26 at 09:27 +0300, Tanu Kaskinen wrote:<b=
r>
&gt; On Mon, 2020-07-20 at 15:26 -0700, Khem Raj wrote:<br>
&gt; &gt; On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen &lt;<a href=3D"mail=
to:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt; wrote:<br>
&gt; &gt; &gt; Hi!<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; If a recipe provides NEON optimizations, should those be exp=
licitly<br>
&gt; &gt; &gt; disabled when &quot;neon&quot; is not in TUNE_FEATUERS, even=
 if the software is<br>
&gt; &gt; &gt; able to detect NEON availability at runtime?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I&#39;m currently converting the pulseaudio recipe from Auto=
tools to Meson,<br>
&gt; &gt; &gt; and the old Autotools build system supports disabling NEON<b=
r>
&gt; &gt; &gt; optimizations but the Meson build system doesn&#39;t. So I&#=
39;m wondering if I<br>
&gt; &gt; &gt; should add the missing feature to the Meson build system, or=
 just let<br>
&gt; &gt; &gt; the runtime detection do its work.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Is there ever need for disabling NEON optimizations if the C=
PU<br>
&gt; &gt; &gt; indicates NEON support? I guess it could be useful for testi=
ng the &quot;no<br>
&gt; &gt; &gt; NEON&quot; case (I today found out that dropping &quot;neon&=
quot; from TUNE_FEATURES<br>
&gt; &gt; &gt; doesn&#39;t remove NEON support from the qemuarm machine), b=
ut otherwise it<br>
&gt; &gt; &gt; seems unnecessary, unless there are CPUs that advertise NEON=
 support<br>
&gt; &gt; &gt; but don&#39;t actually support it.<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; I think the issue will result in a compiler error perhaps when ne=
on is<br>
&gt; &gt; disabled via<br>
&gt; &gt; compiler command line which would be the case when neon is not in=
 TUNE_FEATURES<br>
&gt; &gt; the compiler might warn or error out when it finds neon instructi=
ons<br>
&gt; &gt; being compiled via inline<br>
&gt; &gt; assembly.=C2=A0 you just can try passing something like -mfpu=3Dv=
fpv3d16 or<br>
&gt; &gt; some such and see if<br>
&gt; &gt; compiler/assembler complains during build, if not then perhaps it=
s fine.<br>
&gt; <br>
&gt; If the last -mfpu is something else than neon, then including<br>
&gt; arm_neon.h will succeed but compiling neon code will fail.<br>
&gt; <br>
&gt; I did some experiments, and what I found was that when I remove neon<b=
r>
&gt; from TUNE_FEATURES, OE adds -mfpu=3Dvfp to CC, not CFLAGS, so it&#39;s=
 very<br>
&gt; early in the compiler command line. PulseAudio adds -mfpu=3Dneon to<br=
>
&gt; CFLAGS when building neon code, and the last -mfpu wins, so the neon<b=
r>
&gt; code gets built without errors.<br>
&gt; <br>
&gt; The configure check in PulseAudio only checks that the compiler accept=
s<br>
&gt; -mfpu=3Dneon and #include &lt;arm_neon.h&gt;, it doesn&#39;t try to co=
mpile any<br>
&gt; actual neon code. This means that if the user adds -mfpu=3Dvfp (or oth=
er<br>
&gt; non-neon) to CFLAGS rather than CC, configure will pass but building<b=
r>
&gt; will fail. Is this something to guard against? A default qemuarm build=
<br>
&gt; doesn&#39;t do this, so I don&#39;t know if this ever happens in OE.<b=
r>
&gt; <br>
&gt; I don&#39;t know yet how Meson behaves, I&#39;ll continue testing...<b=
r>
<br>
I tested Meson now. Meson too enables Neon even if -mfpu=3Dvfp is in CC.<br=
>
Unlike Autotools, Meson doesn&#39;t fail if -mfpu=3Dvfp is added to CFLAGS =
(I<br>
tried CFLAGS_append =3D &quot; -mfpu=3Dvfp&quot; in the pulseaudio recipe).=
 Neon is<br>
enabled in any case.<br>
<br>
So, Meson seems pretty safe, although I guess it would be nice not to<br>
override the user&#39;s -mfpu setting. I think this isn&#39;t a big problem=
 is<br>
practice, since runtime detection works.<br>
<br>
I haven&#39;t tested with a compiler that truly can&#39;t build Neon code,<=
br>
because I don&#39;t know how to do that.</blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Right. Cpu implementations without neon do exist</d=
iv><div dir=3D"auto">=C2=A0But they are perhaps rare enough and may not use=
 the package too so chances are slim that we encounter this issue=C2=A0</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Qemuarm emulated a cpu with=
 neon so yes it won=E2=80=99t show on qemuarm=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
-- <br>
Tanu<br>
<br>
<a href=3D"https://www.patreon.com/tanuk" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.patreon.com/tanuk</a><br>
<a href=3D"https://liberapay.com/tanuk" rel=3D"noreferrer" target=3D"_blank=
">https://liberapay.com/tanuk</a><br>
<br>
</blockquote></div></div>

--000000000000111ce805ab58a632--
