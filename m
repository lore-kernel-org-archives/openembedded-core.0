Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1ECC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 11:40:02 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web08.90581.1638358800928980092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 03:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CtjmnTbX;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id az37so48198300uab.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mVGa0m+kHBI6xzvVZYdQ9wEw7GxEaoQoR+NkiJo1RUg=;
        b=CtjmnTbX0GSwEJzxL2SusHCeGqymyBJVhhbdkBJDkhzzHr9CXA96PQi2h6fjZ8xTl0
         JvRRP6CDCl6Y/XG05aD0MtQuhun2cgaDp9JNSSFJH8sf7BridiTALOKk27wstA8+GZ2Y
         Lj1mSj4M0sUibF4PFPlwO0bKQG63fVvFI/IhWAkHcNrjHeJpUng+11oIxH7qqFqcoLcI
         pdf44C4BoZWyHvk9FPj8N13+bitQ5op5lpyEO1j+ihkCiEDpMg+H4d/ZH1317/t6vQ4F
         G1Ql5PXZtXK897rWNX3LXoE0nYuA6iHBT0ijYY4enzYzeTSEaCLHnpsvpjmTor+yc+OL
         Gr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mVGa0m+kHBI6xzvVZYdQ9wEw7GxEaoQoR+NkiJo1RUg=;
        b=BMQ1DJsAMaVXC5F/oLJwiukKeVNjc3Wn4ObGR4Fiy3qpToGU+D0ghlNys74S22mJ2f
         NWxTq+tWlPrD5vtX7unYIcaoe/dsM6SDz8vu5d3Hko7f0Oc+uXckUql1fHyqKygl+WXo
         TJmjqT7kalcfT3qTgcU7rD4dP7Riz5CpQNEN3SREK05Y2cCWPV/iXuWsb65tDVFtctFx
         IHH6S2XcAJZFkeQuSnKeVJDDm2zH0JXop3tTf1z7OYC0aGUl8E4bZkx6t4GI6qYfQUFY
         GWfBwS9sqclwM6Lje0t/KLguYjosCIRscOIdO18xv4k75j7b4wPMBjX/tebE7aZ0DQs0
         dn4w==
X-Gm-Message-State: AOAM531QEHN4GC8tzb53yzSIsAWShJDtpB2Yczl7dXfP66zG4xwYoHZ6
	Dukcwn/8RrkJrAAUMTSuQqJfTvP9V1q2g9h6GRE=
X-Google-Smtp-Source: 
 ABdhPJyeUqpqtXqPmBFX6b6pX0TF0IFYOi4yh1zKl4lFQ1wiOc6xDTFPoVnG7Mc3Z1q4AVuQSro/MCS8FRRA4GUVGVo=
X-Received: by 2002:a9f:218c:: with SMTP id 12mr6055517uac.71.1638358799999;
 Wed, 01 Dec 2021 03:39:59 -0800 (PST)
MIME-Version: 1.0
References: <09c001d7e62a$8837c450$98a74cf0$@gmail.com>
In-Reply-To: <09c001d7e62a$8837c450$98a74cf0$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Dec 2021 12:39:49 +0100
Message-ID: 
 <CANNYZj-dVSOw42YQVJQuJ-FrEQiWuMrpZME4tkePNMc+Cpujbw@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status WW48`21
To: Stephen Jolley <sjolley.yp.pm@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000049e89f05d2142271"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 11:40:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159026

--00000000000049e89f05d2142271
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Nov 2021 at 21:40, Stephen Jolley <sjolley.yp.pm@gmail.com>
wrote:

> We continue to see a reduction in the number of patches in =E2=80=9CPendi=
ng=E2=80=9D
> state. Many thanks to everyone who has taken the time to review patch
> status and handle accordingly, particularly where they were accepted
> upstream. This will significantly benefit the project in the long term.
>
Patches in the Pending State: 412 (32%) [last week 422 (33%)]
>

I went ahead and made a list of top 10 'owners of pending patches'. I have
to stress that this is absolutely not a 'wall of shame' or anything
negative: these patches are in itself significant work, and sending patches
upstream - and crucially, rebasing, fixing CI fails and following up on
upstream feedback - is a significant effort on top, and when yocto project
itself needs to move forward and company management is asking to deliver a
product at the same time, the time for upstreaming may simply not be there.
So  please keep these numbers in mind and try to avoid making them bigger.

109 Khem Raj
29 Richard Purdie
24 Alexander Kanavin
15 unknown
15 Ross Burton
15 Robert Yang
11 Hongxu Jia
10 Martin Jansa
8 Joe Slater
8 Chen Qi

Another interesting statistic is that of 108 people with pending patches,
80 own only one or two patches.

Alex

--00000000000049e89f05d2142271
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 30 Nov 2021 at 21:40, Stephen Jolley &lt;<a href=3D"mailto:s=
jolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap:=
 break-word;" lang=3D"EN-US"><div><span style=3D"font-family:&quot;Arial&qu=
ot;,sans-serif">We continue to see a reduction in the number of patches in =
=E2=80=9CPending=E2=80=9D state. Many thanks to everyone who has taken the =
time to review patch status and handle accordingly, particularly where they=
 were accepted upstream. This will significantly benefit the project in the=
 long term.</span><span style=3D"font-family:&quot;Arial&quot;,sans-serif">=
</span> <br></div></div></blockquote><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div style=3D"overflow-wrap: break-word;" lang=3D"EN-US"><div><=
span style=3D"font-family:&quot;Arial&quot;,sans-serif">Patches in the Pend=
ing State: 412 (32%) [last week 422 (33%)]</span><span style=3D"font-family=
:Consolas"></span></div></div></blockquote></div><div class=3D"gmail_quote"=
><br></div><div class=3D"gmail_quote">I went ahead and made a list of top 1=
0 &#39;owners of pending patches&#39;. I have to stress that this is absolu=
tely not a &#39;wall of shame&#39; or anything negative: these patches are =
in itself significant work, and sending patches upstream - and crucially, r=
ebasing, fixing CI fails and following up on upstream feedback - is a signi=
ficant effort on top, and when yocto project itself needs to move forward a=
nd company management is asking to deliver a product at the same time, the =
time for upstreaming may simply not be there. So=C2=A0 please keep these nu=
mbers in mind and try to avoid making them bigger.<br></div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote">109 Khem Raj<br>29 Richard=
 Purdie<br>24 Alexander Kanavin<br>15 unknown<br>15 Ross Burton<br>15 Rober=
t Yang<br>11 Hongxu Jia<br>10 Martin Jansa<br>8 Joe Slater<br>8 Chen Qi</di=
v><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Another i=
nteresting statistic is that of 108 people with pending patches, 80 own onl=
y one or two patches.<br></div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote">Alex<br></div></div>

--00000000000049e89f05d2142271--

