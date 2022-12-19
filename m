Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB9FC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 16:30:47 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.26586.1671467440078141179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 08:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: aehs29@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id o8so4997359ilo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 08:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+TghWmyw5Hi8aokr0RGjgtBj8tSZwOsScoNlgbZuwA=;
        b=scHJkfAyqPy0Bp3h/nUJLHoq2eFB+RixBEh3ijVvL1Fq8bIRtYZlTXs9xxloE6+iPe
         eOplXHGSCCNKLN5YeRCZBNG/MepAocEbLzxMJQK0X6iTumzHKPpMMb0672fd0mGyrjfG
         tiRKqXCiUikFN3k/YzLqUy7DCalMdleD0/nGPxCQjbIf3msG1coNFGOESDPiOW6JJkXD
         W77ZABx8yqu9IF8WyjVkigDqRGuypal/4SvyDvpNG4Y9vsmKY0JyV0xw6ATbymlFg6QB
         WOFWQjjckS58Eo43RLN+PNlr9gI2jc0A/+pjQpxId49IfvCl8uEorazzYubkVo4kGiNn
         mgQA==
X-Gm-Message-State: ANoB5plTRikl8VQuO1uZ5IV20Eu2mvMSa2OcmmQrrzbmqP2x+ekwGk1g
	o0djrpEhNExHPV9qufAF6Qay8Z47VDY6EQ==
X-Google-Smtp-Source: AA0mqf55jzLWnxZinrUd84QhI1BRTjIH2NfWEs60UCoZ9eMEhCWsvFuGUoKaCWQWM7wlkwgaU26BCw==
X-Received: by 2002:a05:6e02:17cd:b0:303:8505:ec88 with SMTP id z13-20020a056e0217cd00b003038505ec88mr34559693ilu.3.1671467439170;
        Mon, 19 Dec 2022 08:30:39 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id z90-20020a0293e3000000b00389d81b2f67sm3654591jah.160.2022.12.19.08.30.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 08:30:38 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id z18so4990966ils.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 08:30:38 -0800 (PST)
X-Received: by 2002:a92:c112:0:b0:304:830e:c4e4 with SMTP id
 p18-20020a92c112000000b00304830ec4e4mr4215561ile.275.1671467438603; Mon, 19
 Dec 2022 08:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20221217162057.1377465-1-alejandro@enedino.org> <CAO5Uq5SZNeJWMDBBiT5qV9UF79nO9Garoq+O+NCdza8AnaLiPA@mail.gmail.com>
In-Reply-To: <CAO5Uq5SZNeJWMDBBiT5qV9UF79nO9Garoq+O+NCdza8AnaLiPA@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Mon, 19 Dec 2022 10:30:28 -0600
X-Gmail-Original-Message-ID: <CAHMutraoK0NNkft_q3pD4faSU7V7pWxiyZ6yR=m9wavn55BPhw@mail.gmail.com>
Message-ID: <CAHMutraoK0NNkft_q3pD4faSU7V7pWxiyZ6yR=m9wavn55BPhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] rust: Enable building rust from stable, beta
 and nightly channels
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ee885f05f030d6c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 16:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174820

--000000000000ee885f05f030d6c5
Content-Type: text/plain; charset="UTF-8"

Yes, and no, you're right the std library's might be affected by this in
some way
(at least I believe it might but I haven't seen an actual problem using the
 libstd-rs recipe), either way, if a problem arises its easily solvable
because
that's actually one of the features that comes with this, the build-std
feature
builds the std library as part of the crate compilation process, this way
 you end up with a newly built corresponding std library.

On Mon, Dec 19, 2022, 4:24 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Sat, Dec 17, 2022 at 4:21 PM Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > From: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> >
> > Rust follows the train release model via the stable, beta and nightly
> channels,
> > by default we build rust from the stable channel, however there are
> certain
> > features which are only available in the beta or nightly channels.
> >
> > Make these channels available by setting a RUST_CHANNEL variable which
> defaults
> > to stable making this change transparent to the user.
> >
> > The snapshot version used by rust during its compilation wont
> necessarily match
> > the version being built, specially if were building from an unstable
> channel,
> > to avoid confusion rename this to SNAPSHOT_VERSION and use RUST_VERSION
> for the
> > version to be built, which is automatically defined to PV.
> >
> > Append -beta or -nightly to rusts PV for signature awareness.
> >
> > It is important to note that this does not build rust from the
> beta/nightly
> > published tarball (which today build rust v1.67.0 and v1.68.0
> respectively),
> > instead this builds rust from the current selected version (1.66.0) and
> enables
> > the beta/nightly features for that version.
> >
> > Setting the variable RUST_CHANNEL=nightly results in the following:
> >
> > $ rustc -Vv
> > rustc 1.66.0-nightly
> >
>
> I think there's an existing problem which means you're probably still
> not getting quite what you wanted here... I think libstd-rs build
> ought to be affected by this, but as far as I can tell won't be,
> because we're building it with cargo, not as part of the bootstrap
> process (and I've failed to find any documentation which suggests
> building with cargo is "supported"). I've no idea if that means you
> could end up with something which is subtly broken.
>
> That said, my attempts to switch the way the standard library gets
> built over the weekend failed miserably.
>
> --
> Alex Kiernan
>

--000000000000ee885f05f030d6c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yes, and no, you&#39;re right the std library&#39;s =
might be affected by this in some way=C2=A0</div><div dir=3D"auto">(at leas=
t I believe it might but I haven&#39;t seen an actual problem using the</di=
v><div dir=3D"auto">=C2=A0libstd-rs recipe), either way, if a problem arise=
s its easily solvable because=C2=A0</div><div dir=3D"auto">that&#39;s actua=
lly one of the features that comes with this, the build-std feature</div><d=
iv dir=3D"auto">builds the std library as part of the crate compilation pro=
cess, this way</div><div dir=3D"auto">=C2=A0you end up with a newly built c=
orresponding std library.</div><div dir=3D"auto"><br><div class=3D"gmail_qu=
ote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 19, 202=
2, 4:24 AM Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.=
kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Sat, Dec 17, 2022 at 4:21 PM Alejandro Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noref=
errer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:alejandro@en=
edino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@enedino.org</a>&g=
t;<br>
&gt;<br>
&gt; Rust follows the train release model via the stable, beta and nightly =
channels,<br>
&gt; by default we build rust from the stable channel, however there are ce=
rtain<br>
&gt; features which are only available in the beta or nightly channels.<br>
&gt;<br>
&gt; Make these channels available by setting a RUST_CHANNEL variable which=
 defaults<br>
&gt; to stable making this change transparent to the user.<br>
&gt;<br>
&gt; The snapshot version used by rust during its compilation wont necessar=
ily match<br>
&gt; the version being built, specially if were building from an unstable c=
hannel,<br>
&gt; to avoid confusion rename this to SNAPSHOT_VERSION and use RUST_VERSIO=
N for the<br>
&gt; version to be built, which is automatically defined to PV.<br>
&gt;<br>
&gt; Append -beta or -nightly to rusts PV for signature awareness.<br>
&gt;<br>
&gt; It is important to note that this does not build rust from the beta/ni=
ghtly<br>
&gt; published tarball (which today build rust v1.67.0 and v1.68.0 respecti=
vely),<br>
&gt; instead this builds rust from the current selected version (1.66.0) an=
d enables<br>
&gt; the beta/nightly features for that version.<br>
&gt;<br>
&gt; Setting the variable RUST_CHANNEL=3Dnightly results in the following:<=
br>
&gt;<br>
&gt; $ rustc -Vv<br>
&gt; rustc 1.66.0-nightly<br>
&gt;<br>
<br>
I think there&#39;s an existing problem which means you&#39;re probably sti=
ll<br>
not getting quite what you wanted here... I think libstd-rs build<br>
ought to be affected by this, but as far as I can tell won&#39;t be,<br>
because we&#39;re building it with cargo, not as part of the bootstrap<br>
process (and I&#39;ve failed to find any documentation which suggests<br>
building with cargo is &quot;supported&quot;). I&#39;ve no idea if that mea=
ns you<br>
could end up with something which is subtly broken.<br>
<br>
That said, my attempts to switch the way the standard library gets<br>
built over the weekend failed miserably.<br>
<br>
--<br>
Alex Kiernan<br>
</blockquote></div></div></div>

--000000000000ee885f05f030d6c5--

