Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.2072.1626999080389203048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 17:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jHhTpcUC;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id k4so7136233qkj.13
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 17:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/DrOGW1DUjPmTFAJHj1ICsqU1KnZY9VcG3bjRzzAhM=;
        b=jHhTpcUC+ju3duvzyfUpQ8DzentnYuwL1aITvb3Z2rgf2g70w9XqhDw4X/KkbekLHu
         0X1ckE168JW+XyI09bMhHErMtrktUAyfyDCKf5odjgeTvpC1NDEhYtXs/t3ZpoCUB62R
         jie2F9CpPv3EoJx8KNieOjsYaW/LIp+qycYZIbyqxSUi+S/ebge9e/gPuoLr3JR5lxJV
         g3aHmOYOg5Lf7bIA4b4KkX3v5EzzsMziG/rV2FBwWcEQY1KhKpvGJdy3HkaPn6xzbx2p
         ZYNyHn1vuskmCp89r/8H2UmfZG3p6RpAHE1lctH+AULIxDDdYLd3YUfhU0kqy8c+x8+Y
         DOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/DrOGW1DUjPmTFAJHj1ICsqU1KnZY9VcG3bjRzzAhM=;
        b=dsF7C1WQc9VQR1Bi1VjFv/R6bP9I+Ypkn6LflcvVbJLqiy1tYoleLZk4tssHoA2qcr
         2Iv1k7qm6/FLTJsPOTRKTsx094dSrB287BDoBMYAtgrPI0j2iV4WUZTxlSQ1OZBBH0vF
         dWxPJ2GkbF1ETKmblehtdShqmFNhfv2MEyOwaF9SIAE82exBrgtZIBHxLEoHHAbjrXnP
         f31i8YzhI9RXQ3QnBkvNAEeQG8rW9W4odAnXdaobNMvsyLttz+UWgbaIViX0xIOwdUOU
         H53e/W47FcJApZurLR6D1solJ2cqTevOMG/LZ2SklurGCi/hTx/lJ9woMzUpi/CrnfAX
         FayQ==
X-Gm-Message-State: AOAM531gdIPkTt7RT0B0b9Q0qRb0tIa+90of68z5IPz0U3ihrMBBI7pt
	9tIQg5696dutDUh7DaBdup2jRKKlILDauWUPSsk=
X-Google-Smtp-Source: ABdhPJz6O3HMbzJcHoWIBQqSpcK4jSQwG+Z4RrRlaQ6lYCwfE9hUl8BzzBFSibjvE7sMnOy0e7+AeMqxJag6dRf5cmk=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr2278571qkg.381.1626999079547;
 Thu, 22 Jul 2021 17:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210704210740.581650-1-raj.khem@gmail.com> <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
 <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com>
 <20210722194912.GH9379@bill-the-cat> <CAMKF1sohpY6hOfaEgG94chqLUtLts2-T7YxQ6+CFn41cJKHdtA@mail.gmail.com>
 <20210723000531.GJ9379@bill-the-cat>
In-Reply-To: <20210723000531.GJ9379@bill-the-cat>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 17:11:09 -0700
Message-ID: <CAMKF1sqakzi0FaDF2K03zd_xkDwqDzPPd-ABEwZB3sD_1kcGkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002fb7d005c7bf3e60"

--0000000000002fb7d005c7bf3e60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 5:05 PM Tom Rini <trini@konsulko.com> wrote:

> On Thu, Jul 22, 2021 at 05:02:16PM -0700, Khem Raj wrote:
> > On Thu, Jul 22, 2021 at 12:49 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > > On Thu, Jul 22, 2021 at 12:34:47PM -0700, Khem Raj wrote:
> > >
> > > > ping^2
> > > >
> > > > Is there any issue with this patch ? If so please let me know
> > >
> > > Note that qemu-ppce500_defconfig would be a good target to use for pp=
c
> >
> > It would be far from what we emulate though as qemuppc machine
> >
> >
> > > for U-Boot, but not ppc64 and wouldn't cover the mac99 machine type O=
E
> > > uses anyhow.
> >
> >
> > Same here
> >
> > We don=E2=80=99t use uboot
> > On these machines so I don=E2=80=99t see any harm in disabling it here =
do you ?
>
> I guess I only high-level wonder why the target in OE is an old powermac
> and not the e500 class machines.  I mean it could be related to how the
> qemu target in U-Boot wasn't that useful for a while, a long while back.
> So no, I don't object to this specific change, but I do wonder why OE
> targets what it targets rather than (what I understand anyhow to be) the
> common use case of qemu for ppc32 systems.  I could just be mistaken
> there, however.


BookE implementation in Qemu was never as robust to emulate full system in
past that=E2=80=99s where we use traditional ppc target here


>
> --
> Tom
>

--0000000000002fb7d005c7bf3e60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jul 22, 2021 at 5:05 PM Tom Rini &lt;<a href=3D"mai=
lto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Thu, Jul 22, 2021 at 05:02:16PM -0700, Khem Raj w=
rote:<br>
&gt; On Thu, Jul 22, 2021 at 12:49 PM Tom Rini &lt;<a href=3D"mailto:trini@=
konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Jul 22, 2021 at 12:34:47PM -0700, Khem Raj wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; ping^2<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is there any issue with this patch ? If so please let me kno=
w<br>
&gt; &gt;<br>
&gt; &gt; Note that qemu-ppce500_defconfig would be a good target to use fo=
r ppc<br>
&gt; <br>
&gt; It would be far from what we emulate though as qemuppc machine<br>
&gt; <br>
&gt; <br>
&gt; &gt; for U-Boot, but not ppc64 and wouldn&#39;t cover the mac99 machin=
e type OE<br>
&gt; &gt; uses anyhow.<br>
&gt; <br>
&gt; <br>
&gt; Same here<br>
&gt; <br>
&gt; We don=E2=80=99t use uboot<br>
&gt; On these machines so I don=E2=80=99t see any harm in disabling it here=
 do you ?<br>
<br>
I guess I only high-level wonder why the target in OE is an old powermac<br=
>
and not the e500 class machines.=C2=A0 I mean it could be related to how th=
e<br>
qemu target in U-Boot wasn&#39;t that useful for a while, a long while back=
.<br>
So no, I don&#39;t object to this specific change, but I do wonder why OE<b=
r>
targets what it targets rather than (what I understand anyhow to be) the<br=
>
common use case of qemu for ppc32 systems.=C2=A0 I could just be mistaken<b=
r>
there, however.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">B=
ookE implementation in Qemu was never as robust to emulate full system in p=
ast that=E2=80=99s where we use traditional ppc target here=C2=A0</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
-- <br>
Tom<br>
</blockquote></div></div>

--0000000000002fb7d005c7bf3e60--
