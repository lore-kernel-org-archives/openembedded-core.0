Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D463C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 20:29:43 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.1890.1652300973229136547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dz3m+GzB;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id m12so2980126plb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A2a0FvN45UgtHSoUUksiCvsxbpDLV88PPjrHQ7FuuN0=;
        b=dz3m+GzBINvrrt+LZ0xAEUGiwdH76Wo1HuslXk5hIl2Oi1cQVtLpOKI40tWpCfuBwN
         JthovK2ogs/dWpxs8VmK8C4r688jM9GMsDlAJIIln14b0xJxbz5V1vwYGxnoc3+6L243
         atMa4udUz/FO0/s5MrrfGL5/f4oClYUZlIREN0FCaNoOJ7YITQ3cmHvxf46fRA92YCNI
         iTyK0EOHIfdX9yngSMLVwD0KUHwCm2E0xXoJ/ad9YQalkjGTbFVSyV1fHOjf/Xu5nTGE
         +4EC0rbK+5nes/R0FBT0KyrKx9UJhlDfNiIrXbvJlI0G/jqkPkXlCGeOK3YxBDos8ECE
         K6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A2a0FvN45UgtHSoUUksiCvsxbpDLV88PPjrHQ7FuuN0=;
        b=v+V1MwUsYCLXglc2b1i2jyjbkChg1YZ58Lc1sRfHfKgxTJDYYShcMBuM8l1GHEwKND
         TLXKRc/lrJpWVlSIaZspWyzcYeEZq3e2toMuXs00008HC6gec5R6AmUSIzSsGWBdu0BF
         DO38G9NKyc4daVneGpCrhz54FnwEmaRE/gCv77u0zDUzd33qpIfaMXDs/3DfD2HefjzD
         PjmhpMtNyGqn/m3BpWyHRk2WwF352GFJm7l/eU+lLdc/tRdoB6izdeJrtDU09t73wj89
         h28irqHdiN+jfG1iRjp3CoGgwS7ZH0engTawwFq46ij7mP8yAymKCO+JakjnVsL1lox4
         HPGQ==
X-Gm-Message-State: AOAM531/iVpIGTgLLT0XH/1GsqVYjHGz3+JFfU/bMBg/CgN5/V4wAVtN
	OB5G9L5VVoeE5w8U0Q6aVEv755oIoKlOaVb6OuM=
X-Google-Smtp-Source: 
 ABdhPJzCVAS7n6R0J0z9ZyHW6XInn/cbr4paZqw5n7VPb+HIBxZecK03MKkAffoxUaLZ7jrjMh/PU8xhistm4yEq3r8=
X-Received: by 2002:a17:902:c3cb:b0:15c:e5d2:227e with SMTP id
 j11-20020a170902c3cb00b0015ce5d2227emr26275420plj.13.1652300972549; Wed, 11
 May 2022 13:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220506064155.2106140-1-alex@linutronix.de>
 <20220506064155.2106140-2-alex@linutronix.de>
 <20220506165155.1b255652@melee>
 <16EC8C486B6B2CFD.30531@lists.openembedded.org>
 <CANNYZj97hX5g+za7gnBobM3tN-A=JQdmu4n4Dhx+23e01oTHmQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj97hX5g+za7gnBobM3tN-A=JQdmu4n4Dhx+23e01oTHmQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 11 May 2022 13:29:21 -0700
Message-ID: 
 <CANx9H-AZS6Cyy+aQ7ZtjALqFmxCkaOxVfF5UdhR9tDAcoJL=oA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] python3-setuptools: upgrade 59.5.0 ->
 62.1.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000087e8e205dec24cae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 20:29:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165527

--00000000000087e8e205dec24cae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 1:27 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Fri, 6 May 2022 at 17:03, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > Tim, can you pick this up and get it to mergeable condition?
>

I won=E2=80=99t have any time until after the YP Summit.


> I have a fix for this queued locally, no need to work on it for now.
>
> Alex
>

--00000000000087e8e205dec24cae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 11, 2022 at 1:27 PM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Fri, 6 May 2022 at 17:03, Alexan=
der Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt; Tim, can you pick this up and get it to mergeable condition?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I won=E2=80=99t =
have any time until after the YP Summit.</div><div dir=3D"auto"><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
I have a fix for this queued locally, no need to work on it for now.<br>
<br>
Alex<br>
</blockquote></div></div>

--00000000000087e8e205dec24cae--

