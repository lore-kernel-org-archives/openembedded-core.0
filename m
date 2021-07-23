Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.2027.1626998548431856132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 17:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WonSAgLg;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id k6so543477qvz.10
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 17:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VZObAIh/K+Sv83d2cRtZQcKxnUCx1KBqoRKu4bLpNMs=;
        b=WonSAgLgjK+QYCWoBRxxs6DaSykr7zsu5s37qIYSadL7HEhRcaTiA7i/OsBf7ruIEG
         8njR8UOcyAuhCHuwrTKAxAyk7MzaqaIThgF85zYr2wntGJMUEaoYXTxve5z+8UqczMJh
         IuGwXR56TrPejCvkmfFEy26msYbqwYDAk0i3N2hZWwBUk/ngCQEbYDFK8s2iOJM9qGpC
         pqfTyJxOR5QREmIa2fSpiljaF1MDWz/9BPU2hWP2f8pMEykX3Hjs7iMWL71C1oK6EdsT
         BExAkikuijD9hP1K5u/J3jUfD3rOqm+CTbue+Pz85qlEoaWJpCy3SfwJDWBF8B8yiuJZ
         gkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZObAIh/K+Sv83d2cRtZQcKxnUCx1KBqoRKu4bLpNMs=;
        b=VtYPtntZESluBUGEz0zcVnHLJptkNgu1VKtmW8Gj1AkS5jdykjHrC9eBZ2VaMGvgRF
         pRb/d8KJwxOkmWCrtEQH0sv11op3xJUl/w6XKZr3P5T+iO/99WqqAN5AKePBggVElEW/
         DQNYoe8GAH40qI5omqmHNM5vkWr6W8eHIMBEAH3Loi8WkzqMwTrp0zXMw+Evw9AbKTEN
         qk+diFC+RWvD+wbJjRl9XyJxKXAQasjPXk3FU1h3un+nzhLLe+Kp/rFCai7avUYxChuh
         T35wR7n3ui9vliJddX7nesUE3z5GBIx4skCE1Vwl8l8vDwMcMwjwWb+ewsnFXk+HIND2
         NbAg==
X-Gm-Message-State: AOAM532GKbtcCyeVsHrM0MTNEfeqBNLwExlqkfNUiFAmmX5n7e8cEqb4
	SRPpE4/kFhH/+sawTi+9tdd1ZdirCukjyUQwejw=
X-Google-Smtp-Source: ABdhPJxV845yWkXhQ+vxqGTobQzWrW9+OwTArC5WmPwUz7avkuLt+xqRMivjOQ5R/APMhhLPay/bkn0Km1Flru0Xq5A=
X-Received: by 2002:a05:6214:1bcf:: with SMTP id m15mr2280686qvc.55.1626998547354;
 Thu, 22 Jul 2021 17:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210704210740.581650-1-raj.khem@gmail.com> <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
 <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com> <20210722194912.GH9379@bill-the-cat>
In-Reply-To: <20210722194912.GH9379@bill-the-cat>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 17:02:16 -0700
Message-ID: <CAMKF1sohpY6hOfaEgG94chqLUtLts2-T7YxQ6+CFn41cJKHdtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000077198f05c7bf1ec4"

--00000000000077198f05c7bf1ec4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 12:49 PM Tom Rini <trini@konsulko.com> wrote:

> On Thu, Jul 22, 2021 at 12:34:47PM -0700, Khem Raj wrote:
>
> > ping^2
> >
> > Is there any issue with this patch ? If so please let me know
>
> Note that qemu-ppce500_defconfig would be a good target to use for ppc


It would be far from what we emulate though as qemuppc machine


> for U-Boot, but not ppc64 and wouldn't cover the mac99 machine type OE
> uses anyhow.


Same here

We don=E2=80=99t use uboot
On these machines so I don=E2=80=99t see any harm in disabling it here do y=
ou ?

>
>
> --
> Tom
>

--00000000000077198f05c7bf1ec4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jul 22, 2021 at 12:49 PM Tom Rini &lt;<a href=3D"ma=
ilto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Thu, Jul 22, 2021 at 12:34:47PM -0700, Khem Raj =
wrote:<br>
<br>
&gt; ping^2<br>
&gt; <br>
&gt; Is there any issue with this patch ? If so please let me know<br>
<br>
Note that qemu-ppce500_defconfig would be a good target to use for ppc</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">It would be far from =
what we emulate though as qemuppc machine=C2=A0</div><div dir=3D"auto"><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
for U-Boot, but not ppc64 and wouldn&#39;t cover the mac99 machine type OE<=
br>
uses anyhow.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Same=
 here=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">We don=E2=80=
=99t use uboot</div><div dir=3D"auto">On these machines so I don=E2=80=99t =
see any harm in disabling it here do you ?</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto"><br>
<br>
-- <br>
Tom<br>
</blockquote></div></div>

--00000000000077198f05c7bf1ec4--
