Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05278C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:38:33 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.138959.1671122306532187339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 08:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: aehs29@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id r72so5373418iod.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKbzYwIu/raoXuIZFOYfNWsLjo4wIkqD0PRiQv7vDzo=;
        b=y0ceY4HfLvtylGeWsCBTNqBZ/LgvA1srYwWXJGSBnZxpzn1ZooYL1XXXScgwLX8uyb
         xLDkWr+0eBAYWqfDQbbRKJ6YPtvxLbKrNbDGWLidheVBHcZAZabQkO7s91ROwe0VDeoi
         r9bZdtxSp0nMPvatqlK00AyEHiO9Bv760fqubZO/fx69pdLvchPrK2bKInZH5V9H+ErX
         djnRmkOH0fHuH7qy87M4SCwwRDe02sd/huEj7c17wxu7qKVgWRLYAmWiEV6AECO9SF9f
         zUc+MNlkuLSKIonBcaZ8jLfT47/bjOLh8fMlURtvyh/Au3waWr+HM+E91ajeDf68hYeK
         L2Wg==
X-Gm-Message-State: ANoB5pk/hn57/yHGOmYGXokMcX9MVGhfnUNJ1vyzoKmWHUnhGaltQetT
	rhdwxneqhWJJD64LH03qce42X4hlPYBbGw==
X-Google-Smtp-Source: AA0mqf7oFcFNaSH06ZYiBlMlQxKq2ogcT76VK0fUAZ6+SCeO0LeXYJg80WcXXok+m6EQdfLOMCZs0w==
X-Received: by 2002:a05:6602:22d5:b0:6e0:7dd:59ac with SMTP id e21-20020a05660222d500b006e007dd59acmr17508028ioe.14.1671122305564;
        Thu, 15 Dec 2022 08:38:25 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id b18-20020a05660214d200b006de16e510b5sm1241301iow.53.2022.12.15.08.38.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 08:38:25 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id b192so5363148iof.8
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:38:25 -0800 (PST)
X-Received: by 2002:a5e:a711:0:b0:6e3:1926:f46e with SMTP id
 b17-20020a5ea711000000b006e31926f46emr1129196iod.162.1671122305167; Thu, 15
 Dec 2022 08:38:25 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com> <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
In-Reply-To: <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Thu, 15 Dec 2022 09:38:14 -0700
X-Gmail-Original-Message-ID: <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
Message-ID: <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000603e2205efe07b53"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 16:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174585

--000000000000603e2205efe07b53
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Dec 2022 at 09:08, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Thu, Dec 15, 2022 at 3:38 PM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> >
> >
> > On Thu, Dec 15, 2022, 3:05 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >>
> >> On Thu, 15 Dec 2022 at 08:32, Alejandro Hernandez Samaniego
> >> <alejandro@enedino.org> wrote:
> >> > +RUST_VERSION = "1.65.0"
> >> > +SRC_URI += "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust
> "
> >>
> >> Adding a manually set variable adds friction to updates. Can
> >> RUST_VERSION be set instead with a helper @function from PV?
> >
> >
> > Hey Alex,
> >
> > I agree, and ideally yes, I tried to set it automatically to PV, but,
> sadly it conflicts if we try to include rust-source.inc from a non-rust
> recipe (This is necessary for some recipes that need to have rust source
> available to them) since it uses the PV set from that recipe instead.
> >
>
> Is this different cargo/rust versions, or something else you have?
>
> Basically I'm on the same page as Alex - updating this recipe is
> already quite painful, making it any worse doesn't seem like a great
> idea, but I guess you could argue that rust/cargo already conflate
> their versions in the current usage.
>

I'm referring to any recipe that could include rust-source.inc, if
RUST_VERSION ?= ${PV} for example,
 for rust recipes that works fine because RUST_VERSION would expand to
1.65.0 today, but lets say
recipe foo_1.0.1.bb needs rust-source.inc to recompile built-in crates, in
that case RUST_VERSION
would expand to 1.0.1 instead.

While I agree its not ideal, in my opinion this approach provides more
consistency with the drawback of
 modifying that variable on upgrades, however I also think that requiring
rust-source.inc is seldom the
case, hence the other option is to keep RUST_VERSION ?= ${PV} and hardcode
it on every recipe that
would require this flow.

Alejandro



>
> --
> Alex Kiernan
>

--000000000000603e2205efe07b53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 15 Dec 2022 =
at 09:08, Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.k=
iernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Thu, Dec 15, 2022 at 3:38 PM Alejandro Hernandez Samanie=
go<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@en=
edino.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Dec 15, 2022, 3:05 AM Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, 15 Dec 2022 at 08:32, Alejandro Hernandez Samaniego<br>
&gt;&gt; &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">ale=
jandro@enedino.org</a>&gt; wrote:<br>
&gt;&gt; &gt; +RUST_VERSION =3D &quot;1.65.0&quot;<br>
&gt;&gt; &gt; +SRC_URI +=3D &quot;<a href=3D"https://static.rust-lang.org/d=
ist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;name=3Drust" rel=3D"noreferrer" ta=
rget=3D"_blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src=
.tar.xz;name=3Drust</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; Adding a manually set variable adds friction to updates. Can<br>
&gt;&gt; RUST_VERSION be set instead with a helper @function from PV?<br>
&gt;<br>
&gt;<br>
&gt; Hey Alex,<br>
&gt;<br>
&gt; I agree, and ideally yes, I tried to set it automatically to PV, but, =
sadly it conflicts if we try to include rust-source.inc from a non-rust rec=
ipe (This is necessary for some recipes that need to have rust source avail=
able to them) since it uses the PV set from that recipe instead.<br>
&gt;<br>
<br>
Is this different cargo/rust versions, or something else you have?<br>
<br>
Basically I&#39;m on the same page as Alex - updating this recipe is<br>
already quite painful, making it any worse doesn&#39;t seem like a great<br=
>
idea, but I guess you could argue that rust/cargo already conflate<br>
their versions in the current usage.<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:=
small">I&#39;m referring to any recipe that could include rust-source.inc, =
if RUST_VERSION ?=3D ${PV} for example,</div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,sans-serif;font-size:small">=C2=A0for rust recipe=
s that works fine because RUST_VERSION would expand to 1.65.0 today, but le=
ts say=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:arial,s=
ans-serif;font-size:small">recipe <a href=3D"http://foo_1.0.1.bb">foo_1.0.1=
.bb</a> needs rust-source.inc to recompile built-in crates, in that case RU=
ST_VERSION=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:ari=
al,sans-serif;font-size:small">would expand to 1.0.1 instead.</div><div cla=
ss=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-ser=
if;font-size:small">While I agree its not ideal, in my opinion this approac=
h provides more consistency with the drawback of</div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,sans-serif;font-size:small">=C2=A0modify=
ing that variable on upgrades, however I also think that requiring rust-sou=
rce.inc is seldom the=C2=A0</div><div class=3D"gmail_default" style=3D"font=
-family:arial,sans-serif;font-size:small">case, hence the other option is t=
o keep RUST_VERSION ?=3D ${PV} and hardcode it on every recipe that=C2=A0</=
div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font=
-size:small">would require this flow.</div></div><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:smal=
l">Alejandro</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div></div>

--000000000000603e2205efe07b53--

