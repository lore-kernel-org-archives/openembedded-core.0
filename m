Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AA7C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 15:38:12 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.137147.1671118692017223466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 07:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: aehs29@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id d123so5266687iof.6
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 07:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jC9A6R8jEtqXI72wMTjYgzWQUiVr3HcfTSFeZG7a3k=;
        b=QB/4zawd2sqVRZFzRi+4gikJvsFQa2uTL0h5IRmxYUj7m1nR9h9i57vAFLV1CX+b41
         5Rjjwiv8w2kK52ltIRQJMVxgkLipd7hKVI6rvUYkyebuwkwFI+oe5nJlxW5U9hJkXNf2
         bwh4r0TWdd2W9G+WCm3br/9CssTEQ1fLP9O9kEdHEGupOGXbGI3it34bVj9kyqWNn03R
         WPF/yMJZ9Q6WF8QM/YjRR5CJFvaMPZDqFFS1eXG4VMIpDhpVxGjMIPJoXxIjyLJzva2q
         NzLySoxyVTWPPgTd63yPofiCKyLfwYZl3FWPLykXOTuc+4G8jKx9b8qr8FsoT+9dPpYe
         hPqQ==
X-Gm-Message-State: ANoB5pkhfBE0gmw2JNuoW3FNn9thgwNF94Ot3MWmZmFTX2crwxJR2C+T
	ea0daVoL2JD0D9FiwVg3n20OenJ3ub7ZXg==
X-Google-Smtp-Source: AA0mqf44YiW0OoQ2iIzIj1Vv0lCo8qZsAHXY7ElForDTacGViWJ+Fd0ztECOc7ICvsC2E/L/ZkmuUQ==
X-Received: by 2002:a5e:8343:0:b0:6e0:97:2154 with SMTP id y3-20020a5e8343000000b006e000972154mr15953080iom.5.1671118691178;
        Thu, 15 Dec 2022 07:38:11 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id p27-20020a056638217b00b00363dfbb145asm2644889jak.30.2022.12.15.07.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 07:38:10 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id y3so6790078ilq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 07:38:10 -0800 (PST)
X-Received: by 2002:a92:904:0:b0:303:1869:3a84 with SMTP id
 y4-20020a920904000000b0030318693a84mr25619803ilg.37.1671118690545; Thu, 15
 Dec 2022 07:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org> <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
In-Reply-To: <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Thu, 15 Dec 2022 09:38:00 -0600
X-Gmail-Original-Message-ID: <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
Message-ID: <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ed7ca705efdfa365"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 15:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174581

--000000000000ed7ca705efdfa365
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 15, 2022, 3:05 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 15 Dec 2022 at 08:32, Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> > +RUST_VERSION = "1.65.0"
> > +SRC_URI += "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust
> "
>
> Adding a manually set variable adds friction to updates. Can
> RUST_VERSION be set instead with a helper @function from PV?
>

Hey Alex,

I agree, and ideally yes, I tried to set it automatically to PV, but, sadly
it conflicts if we try to include rust-source.inc from a non-rust recipe
(This is necessary for some recipes that need to have rust source available
to them) since it uses the PV set from that recipe instead.


Alejandro


> Alex
>

--000000000000ed7ca705efdfa365
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Dec 15, 2022, 3:05 AM Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Thu, 15 Dec 2022 at 08:32, Al=
ejandro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noref=
errer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt; +RUST_VERSION =3D &quot;1.65.0&quot;<br>
&gt; +SRC_URI +=3D &quot;<a href=3D"https://static.rust-lang.org/dist/rustc=
-$%7BRUST_VERSION%7D-src.tar.xz;name=3Drust" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-s=
rc.tar.xz;name=3Drust</a>&quot;<br>
<br>
Adding a manually set variable adds friction to updates. Can<br>
RUST_VERSION be set instead with a helper @function from PV?<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div><div di=
r=3D"auto">Hey Alex,</div><div dir=3D"auto"><br></div><div dir=3D"auto">I a=
gree, and ideally yes, I tried to set it automatically to PV, but, sadly it=
 conflicts if we try to include rust-source.inc from a non-rust recipe (Thi=
s is necessary for some recipes that need to have rust source available to =
them) since it uses the PV set from that recipe instead.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
Alex<br>
</blockquote></div></div></div>

--000000000000ed7ca705efdfa365--

