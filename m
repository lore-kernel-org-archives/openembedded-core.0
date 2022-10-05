Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25722C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 05:32:23 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web12.20421.1664947935487764374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 22:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qtro7WH4;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-35ad0584879so58911307b3.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8MEF3X2p/3VqXm63gteyVmLoTH3ipgQ5q2WYxDVf2Xs=;
        b=Qtro7WH4MI9AoIGPUafzr7EJeMHNmvBdeOyNviHSFobVMZEz1L/i1/5+HRrxJf2gbI
         kLghjLZh2MplPaUOwb9A4YULnbu75NGZFNPfLY7AonvlSMdd+OLSQMIjtdyiFYroYZNt
         +MPBIlSNewpcNGGwgldwdzNzFqiY2y66Pdw6RpsYsVJUdTCV509LtIu3Kf/aYsngSxBq
         pNLk/cGeJTZTjyaxV8gHBMGTJn5v7vAj4OUQaG/rU6cctFsRUkrRXJ3kGhPX2WKvboNU
         LbeggjE9TpkC4CFHikclYtMYyfI8ipi7WorQQ1HFTxhon74ouCB1WC/2SVAZfN2wofxM
         GDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8MEF3X2p/3VqXm63gteyVmLoTH3ipgQ5q2WYxDVf2Xs=;
        b=giGy0HsxPFF7SknTJdSO4TI+95YGHMjg9GbRXrAtwEeEBTOB+ghdgdn1mnlxB0tBMc
         ZKXzAsQVD7JfgzO9wE8PN9ra9qzNOhaJpkjqBAillrY1JGTZVIDP4S27eQgFhA9G/2F0
         wmolQ7/jgpqG52AJcqnjFoReJzC0XUA0WgkrQgXRUDhWV+u0pxQ5IumKiLDvXiNtSZhZ
         wd6nwzYw/fa5+F33BgJOYaegBstHnRI889hx+OdayGc+rdM1C3FEJZtt7nTmRzt6Oate
         /ZEFj66cw3S67QauqyVbykfII2q4m00XIYtsZgbJnU7H1yh78u/u7Dwk0tWhJOjWikE3
         yOzA==
X-Gm-Message-State: ACrzQf1xlyOUNepQTUSlQll7LUxPEXOA/He1XucqxarTATPUz1iNgS7x
	ApGXrzdFB/4nWQdtDURbZsgtQcc3q/xbGXZplRk=
X-Google-Smtp-Source: 
 AMsMyM4G1d0VP0TXU8DqBjLPmRh6cIo8A7svXts1/DGvbqGur4Fx6e2JPqeuGpIKo9N3rSbQIufaf5irYek3QDiCYcM=
X-Received: by 2002:a81:cc2:0:b0:35b:c180:d440 with SMTP id
 185-20020a810cc2000000b0035bc180d440mr7245577ywm.217.1664947934422; Tue, 04
 Oct 2022 22:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175520.2850089-1-alex@linutronix.de>
In-Reply-To: <20220930175520.2850089-1-alex@linutronix.de>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Tue, 4 Oct 2022 22:32:03 -0700
Message-ID: 
 <CAB=6tBQza_dU6PsUsn4ND4WKE2vxAwa_8Lh3seVck7bC87Hrdw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/2] cargo-update-recipe-crates.bbclass: add
 a class to generate SRC_URI crate lists from Cargo.lock
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000336c1b05ea42e6c4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 05:32:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171440

--000000000000336c1b05ea42e6c4
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 10:55 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

%> Snip %<


> On the other hand, bitbake does not use cargo (and quite possible
> won't ever be able to),
>

Can you elaborate on this?

I only ask because we are using this[1] and this[2] to build this[3] recipe
for hardknott.

1. https://github.com/meta-rust/meta-rust/blob/master/lib/crate.py
2. https://crates.io/crates/cargo-bitbake
3.
https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb?h=kirkstone

..Ch:W..

-- 
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--000000000000336c1b05ea42e6c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Sep 30, 2022 at 10:55 AM Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">%&g=
t; Snip %&lt;<br></div><div class=3D"gmail_quote"><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On the other hand, bitbake does n=
ot use cargo (and quite possible<br>
won&#39;t ever be able to), <br></blockquote><div><br></div><div>Can you el=
aborate on this?<br><br></div><div>I only ask because we are using this[1] =
and this[2] to build this[3] recipe for hardknott.<br></div></div><br><div>=
1. <a href=3D"https://github.com/meta-rust/meta-rust/blob/master/lib/crate.=
py">https://github.com/meta-rust/meta-rust/blob/master/lib/crate.py</a></di=
v><div>2. <a href=3D"https://crates.io/crates/cargo-bitbake">https://crates=
.io/crates/cargo-bitbake</a></div><div>3. <a href=3D"https://git.yoctoproje=
ct.org/poky/tree/meta/recipes-devtools/python/python3-cryptography-vectors_=
36.0.2.bb?h=3Dkirkstone">https://git.yoctoproject.org/poky/tree/meta/recipe=
s-devtools/python/python3-cryptography-vectors_36.0.2.bb?h=3Dkirkstone</a><=
/div><div><br></div><div>..Ch:W..<br></div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><b><span style=3D"=
font-family:monospace">&quot;Perfection must be reached by degrees; she req=
uires the slow hand of time.&quot; - Voltaire</span></b></div></div></div><=
/div>

--000000000000336c1b05ea42e6c4--

