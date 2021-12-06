Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34E4C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 23:29:07 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.59939.1638833347066021230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=apWuZts2;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id m25so12522469qtq.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QI38QoRWCOVSa4HRcFy+U6olg3ZiYMaYDFvvvPBULpw=;
        b=apWuZts2X/01kfKh0cIHJ8baMdL3f/X1tZtC+/BGYUf5n2h12hy928nD+hbQgWo87C
         7kDzbmbCxqBJKbjez2SnNHsh5lRwkJ2CFZ9GnucepkfevLa3gj3nC1S5LjpdZBu/H0eF
         9ApNEMlG0Cs70sxPbmq2vbJ6LMe4xhUiHUUMlbHAKM6yJOTl0BIrUkjqAW9KT5ZK9JzQ
         OcqLmHtMbAUM9efQrPy9L8DA65Am6InWtUgn33iDsunQVkn20UcdLUlmJtHNx6ewjOWW
         1AD9/TBvhjrR+VR/E41sDl8M7PNbOAVPyyMwXLND0NRmVM3g6yeWU4i80tMwAcg5KD4w
         6jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QI38QoRWCOVSa4HRcFy+U6olg3ZiYMaYDFvvvPBULpw=;
        b=O/eFTWjzYLSBQ530XCIqbCcn7fsHAmJbUEO+vArhjQ9+687W8kFlLr0LmVkGjUJNMC
         yS+NQyu8xfTp1Rp+yExE9/DKcM85/FoB6cuwzvUvE89PqAXEScMQNtxMotE7IxVtWQ75
         4mF/n3cb+nNsiRGrOxWCgFggk4Rye035FJE+BQe8eBxa0Ui1ujDU01Ld1mmRvD5KBKi4
         DjTauQgmeh2yQiWddnYRUaTNjdiN1JARmKt7mDI5zUs2Dv0CGjOQRwQIvaaEUtsEuGqW
         ylJcOP0be01dmIaLrEQIAMNQ/efgvvnxWPLA9JqtJnQti7WOPufE50qMhlndxWohlwEH
         880w==
X-Gm-Message-State: AOAM5322239wjLWElaFi9kNOOia8mdgT6xmsdvzlMVdcpp6TGu3kXhXz
	NlRl9/peml586gZBWJ6jdVgr5TLn2E5/8pGunHw=
X-Google-Smtp-Source: 
 ABdhPJxlsB7bIeVtebEKTcYDhI2Owcc4FRhF8BCrig8yYJQUIljhrtiFIrq0p9xAEE7g4UtRLOzjkYVtjd77U48PgLE=
X-Received: by 2002:a05:622a:1386:: with SMTP id
 o6mr44057414qtk.64.1638833346085;
 Mon, 06 Dec 2021 15:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20211206221418.2281162-1-raj.khem@gmail.com>
 <fafa300be74d5ab50be74489d5d7725d9863bcda.camel@linuxfoundation.org>
In-Reply-To: 
 <fafa300be74d5ab50be74489d5d7725d9863bcda.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Dec 2021 15:28:55 -0800
Message-ID: 
 <CAMKF1sqK0Nxp3NBggH7br4K7Qyxx6voMk1rUXJpVhuxBTBSrUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Drop fsqrt implementation patches
 for fsl ppc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000070859e05d2829ff8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 23:29:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159276

--00000000000070859e05d2829ff8
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 6, 2021 at 2:51 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I did test such a patch today as well since we discussed it. I'd propose
> this
> commit message since we need to say why:
>
> """
>
> glibc: Drop ppc sqrt optimisations
>
> OpenEmbedded isn't an upstream or a patch repository. These are
> optimisations
> which for reasons unknown were never merged into upstream glibc. We have no
> active ppc maintainers and these patches are at an evolutionary dead end.
> Since they are optimisations, there may be small performance regressions by
> removing them but OE can't carry patches like this indefinitely and these
> appear to have no future.
> """


This sounds good to me. I guess will add it to commit or do you want me to
send v2. This passed my local testing on qemuppc

>
>
> Cheers,
>
> Richard
>
>

--00000000000070859e05d2829ff8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Dec 6, 2021 at 2:51 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I did test su=
ch a patch today as well since we discussed it. I&#39;d propose this<br>
commit message since we need to say why:<br>
<br>
&quot;&quot;&quot;<br>
<br>
glibc: Drop ppc sqrt optimisations<br>
<br>
OpenEmbedded isn&#39;t an upstream or a patch repository. These are optimis=
ations<br>
which for reasons unknown were never merged into upstream glibc. We have no=
<br>
active ppc maintainers and these patches are at an evolutionary dead end.<b=
r>
Since they are optimisations, there may be small performance regressions by=
<br>
removing them but OE can&#39;t carry patches like this indefinitely and the=
se<br>
appear to have no future.<br>
&quot;&quot;&quot;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">This sounds good to me. I guess will add it to commit or do you want me t=
o send v2. This passed my local testing on qemuppc=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000070859e05d2829ff8--

