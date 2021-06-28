Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web12.10545.1624883786655761096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 05:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J4892lit;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id j8so9957327vsd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7A8Sj15ZrlxTy5YJQc1gJDfARlXHl2J/e7SwYaIhHMg=;
        b=J4892lith2GiSnoFaHN4S4jI8ivLCc1cZ8FAcTMwsMQdVlVSnLT97tg0imuFRf3MUT
         pqGPmIuxPyuJhjAUAZX0QS0dZtZkhBs+L0Wqyv9BNr9FQLSRYZiAK1313eho3hgP7mqu
         C7BANXIMR33/U2Bm8tsY9GOX958p9YB5OBBEc3rZUADlQw3HqtmASMt9j3SQw1Zc7sNO
         XbyRc722x3BP7NOktq2iXvY7iIxtHtP6f9wwhTg/r3Yia2U21YNVMEMw0XdI+BJkP9AR
         5bDZX+tIJBx2uum/siXwBhqqexkj2fPbc/p0zVFhYH/OJrA19kq6OUBLySuJ/X+TCFvG
         i/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7A8Sj15ZrlxTy5YJQc1gJDfARlXHl2J/e7SwYaIhHMg=;
        b=WVMzUoZ5a/a6w9jYXu5ai2OAbNa5rzY8tO8309e0WQWKWhkat/a88GOCeQs6kzadQS
         CfPcFo8J3gZahi6RnqROENtn/pZ8H4Ez4If1MTuw3d/P10kP9kzr9ES7SN7CrUOq4RtM
         DixF7csEVkrd4usNiMFW6UN5LjmWNLchZytjUP2owkN5s76HQTLdERxV5xcfIZcI8PTp
         4toxYQGyM8XKIwbsTbShsJScf7/LlbX8Mj+hbdw6zplpyMNZo/eUlDKaVJgK8aHv3MPz
         I9mvswh4eNNZ3DOHxWJVFbY2MUlFswJTMmoTTduSTCYWA0x5lVTkivqJSgzcR0QRKg1B
         3YJw==
X-Gm-Message-State: AOAM533+HXdhUvK+ltwbqonu38Zxpezh+Fxp80ZYEHPCijWaCiZSg8Iw
	VTIWZ7mx6Bm9R36flLmtTxiK7vTrNtxB3S6g7/A=
X-Google-Smtp-Source: ABdhPJxAOFK/IkNTCim1mnv0iBt0PT04DALL3M+nmw7Claz5rAzglK3yIyAA41qmHrtxjXd94BdcCbvh6G9LkCDUBpY=
X-Received: by 2002:a05:6102:3a09:: with SMTP id b9mr1000879vsu.51.1624883785802;
 Mon, 28 Jun 2021 05:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <CANNYZj_yZHkpbGKPaec_x4AQDQ8jR_rLk1mroBZxn6JCpQ9WbQ@mail.gmail.com> <CAAQYJAspv72aL7J_fYri+vk_OfL=PDNCvGk9C6O=CisB3dEPeg@mail.gmail.com>
In-Reply-To: <CAAQYJAspv72aL7J_fYri+vk_OfL=PDNCvGk9C6O=CisB3dEPeg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 28 Jun 2021 14:36:13 +0200
Message-ID: <CANNYZj-XL7NB0S=3bTv9DMvhbMTmUfJFK627YAqQ4for3QMDqA@mail.gmail.com>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000daa79905c5d2bc3c"

--000000000000daa79905c5d2bc3c
Content-Type: text/plain; charset="UTF-8"

What I am saying is, can you discuss this with upstream first please?

Alex

On Mon, 28 Jun 2021 at 14:08, Andrea Adami <andrea.adami@gmail.com> wrote:

> On Mon, Jun 28, 2021 at 1:00 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Seems like an upstream problem rather than a Yocto one?
>
> Indeed,
>
> from
> https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/14.0/
> "
> One difference from Autotools is that the --disable-neon-opt option
> for disabling NEON optimizations doesn't have a counterpart in Meson
> due to how Meson's NEON detection works. NEON will always be enabled
> if the compiler supports it, but even if the target machine doesn't
> support NEON, that shouldn't be a problem, because PulseAudio disables
> NEON at run-time if the processor doesn't support it.
> "
> Upstream *thinks* this is not an issue because all will be fine at runtime
> :)
>
> Cheers
> A.A:
>
> >
> > Alex
> >
> > On Mon, 28 Jun 2021 at 12:02, Andrea Adami <andrea.adami@gmail.com>
> wrote:
> >>
> >> Hello,
> >>
> >> during a core-image-sato build for armv4 I got one single build
> >> failure with pulseaudio.
> >>
> >> This happens after commit 80bbea0 pulseaudio: switch build system from
> >> Autotools to Meson. In the commit text it is evidenced:
> >>
> >> "
> >> With Meson there's no option for disabling Neon optimizations if the
> >> compiler supports Neon. If -mfpu is set in CC or CFLAGS, it's ignored,
> >> because the build system adds -mfpu=neon at the end of the compiler
> >> command line, overriding any earlier -mfpu options. This shouldn't be
> >> a problem, because PulseAudio detects at runtime whether the CPU
> >> supports Neon instructions.
> >> "
> >>
> >> At the moment to build pulseaudio for armv4/5 I have reverted to using
> >> autotools.
> >>
> >>
> >> There was around a patch but has not been merged.
> >> https://lists.openembedded.org/g/openembedded-core/message/146375
> >>
> >> Maybe a v2 will be accepted?
> >>
> >> Cheers
> >> A.A.
> >>
> >> 
> >>
>

--000000000000daa79905c5d2bc3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What I am saying is, can you discuss this with upstre=
am first please?</div><div><br></div><div>Alex<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 28 Jun 2021=
 at 14:08, Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.com">andre=
a.adami@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Mon, Jun 28, 2021 at 1:00 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Seems like an upstream problem rather than a Yocto one?<br>
<br>
Indeed,<br>
<br>
from<br>
<a href=3D"https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/14.0=
/" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop.org/wiki/So=
ftware/PulseAudio/Notes/14.0/</a><br>
&quot;<br>
One difference from Autotools is that the --disable-neon-opt option<br>
for disabling NEON optimizations doesn&#39;t have a counterpart in Meson<b=
r>
due to how Meson&#39;s NEON detection works. NEON will always be enabled<b=
r>
if the compiler supports it, but even if the target machine doesn&#39;t<br=
>
support NEON, that shouldn&#39;t be a problem, because PulseAudio disables=
<br>
NEON at run-time if the processor doesn&#39;t support it.<br>
&quot;<br>
Upstream *thinks* this is not an issue because all will be fine at runtime=
 :)<br>
<br>
Cheers<br>
A.A:<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 28 Jun 2021 at 12:02, Andrea Adami &lt;<a href=3D"mailto:andr=
ea.adami@gmail.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; during a core-image-sato build for armv4 I got one single build<b=
r>
&gt;&gt; failure with pulseaudio.<br>
&gt;&gt;<br>
&gt;&gt; This happens after commit 80bbea0 pulseaudio: switch build system=
 from<br>
&gt;&gt; Autotools to Meson. In the commit text it is evidenced:<br>
&gt;&gt;<br>
&gt;&gt; &quot;<br>
&gt;&gt; With Meson there&#39;s no option for disabling Neon optimizations=
 if the<br>
&gt;&gt; compiler supports Neon. If -mfpu is set in CC or CFLAGS, it&#39;s=
 ignored,<br>
&gt;&gt; because the build system adds -mfpu=3Dneon at the end of the comp=
iler<br>
&gt;&gt; command line, overriding any earlier -mfpu options. This shouldn&=
#39;t be<br>
&gt;&gt; a problem, because PulseAudio detects at runtime whether the CPU<=
br>
&gt;&gt; supports Neon instructions.<br>
&gt;&gt; &quot;<br>
&gt;&gt;<br>
&gt;&gt; At the moment to build pulseaudio for armv4/5 I have reverted to =
using<br>
&gt;&gt; autotools.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; There was around a patch but has not been merged.<br>
&gt;&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/146375" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/146375</a><br>
&gt;&gt;<br>
&gt;&gt; Maybe a v2 will be accepted?<br>
&gt;&gt;<br>
&gt;&gt; Cheers<br>
&gt;&gt; A.A.<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--000000000000daa79905c5d2bc3c--
