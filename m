Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B34C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 19:29:54 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.36.1657567776182025874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 12:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SeNtlB/K;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id i2so2573581qkm.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aFinGLjVTOYLH7w5E/ClzlN1pHKWHuTxVUUJvpPvoyY=;
        b=SeNtlB/K66I6yOWelFTRDmkDkgRYF+opjIBJkTi4bAMy1QqTaMzlg9XhkVHGSRWVPA
         VSlBoKC/MUSzmzuzu7qr4RyPXGC2qHBOdXjBIvj/JIqFfz8VrRI76Y0YXoYO2HMcMVnq
         2b1Wk0loD71yI2n2bvysYGfqBjrhID0DGzaxLiFjCxYZU6zcPLQb7Nt8MghgCURrzFb4
         oiTB/TO3TydSWRHK+ivMeofffYEXKHv15U6KJCWO4ITxfX9/QUYKnShxygq3lEFQPNUs
         TuB/CvcwCw8KPH+JbW9oFhhbVlDX9HAaECF62tXq3WknROc46iTujiijmsjotdh2gdLC
         gHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aFinGLjVTOYLH7w5E/ClzlN1pHKWHuTxVUUJvpPvoyY=;
        b=kDAXvH/msisjD2J4T3Ou55BfZHtWpR8Yr1OSK3WLSOukGmGtvG6J5zbiNdY5z/V1Uq
         G+QFUK8RJgtKFewjTF95QCWFAr2ZBh0MTbezWaMBBaQNfkrytJ9JQTyYTiMXCaP5sl4t
         GDhAEszk0FlBTGZO76yANQ+gW7Z7FM8u2v6HqLUwcVDSpHHJDpubSQdLt+swY7FxCXuZ
         DthxGSulqCkiDVbXxXHkdkENghVNyWhzxmqnxD1EKawfH86wh1aKn+ZtqowlMUHXsBmg
         jCOjrrdq3gdj8o/L+XyDW7r7n4jSXo1DQMgaNJOiPQUwWHMDI0R8DBqy2kro+an/lmbh
         hngQ==
X-Gm-Message-State: AJIora+li8UY6iDo3I9VVWRAahfYk++1W40XymrjpC+8p1FIlw0XbMm1
	qxraYRYXiJV02ZTL/Kj7o5NoX41ppzNwKtgcQW0=
X-Google-Smtp-Source: 
 AGRyM1vsZ6ltjtqQL5yKAykZR7U9u58guNLwkv1hDjBGZFaGrVh/nugtvLKmfCzIvRE0ADJO2C/7FD6cqqVX90bTcRA=
X-Received: by 2002:a05:620a:448a:b0:6af:3a05:f73c with SMTP id
 x10-20020a05620a448a00b006af3a05f73cmr12973777qkp.72.1657567775170; Mon, 11
 Jul 2022 12:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220711083309.1749253-1-sean@geanix.com>
 <CAMKF1sry2PHb52OyVBFSwFnnuHVB4g5rY-te_-BKjq4uQ0onsQ@mail.gmail.com>
 <20220711192740.yqa3kdfkvrxt4hib@Seans-MBP.hadsten>
In-Reply-To: <20220711192740.yqa3kdfkvrxt4hib@Seans-MBP.hadsten>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2022 20:29:24 +0100
Message-ID: 
 <CAMKF1sp1nrf1ZjYt9T9Hxq7mMSmtGzLhXJ_3nJuWBiAhD-Nu4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] zlib: split src_uri into inc file
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e25c405e38c92ca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 19:29:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167880

--0000000000006e25c405e38c92ca
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 11, 2022 at 8:27 PM Sean Nyekjaer <sean@geanix.com> wrote:

> On Mon, Jul 11, 2022 at 07:07:38PM +0100, Khem Raj wrote:
> > We are in process of merging the inc files can you cite reasons why we
> want
> > to split it
> >
>
> @Khem:
> Inside the zlib artifact resides a contrib directory that contains more
> libs, one of them minizip are we using in our project.
>

Is it possible to use packageconfig for enabling this


> /Sean
>

--0000000000006e25c405e38c92ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 11, 2022 at 8:27 PM Sean Nyekjaer &lt;<a href=
=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Mon, Jul 11, 2022 at 07:07:38PM +0100, Khem Raj =
wrote:<br>
&gt; We are in process of merging the inc files can you cite reasons why we=
 want<br>
&gt; to split it<br>
&gt; <br>
<br>
@Khem:<br>
Inside the zlib artifact resides a contrib directory that contains more<br>
libs, one of them minizip are we using in our project.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Is it possible t=
o use packageconfig for enabling this=C2=A0</div><div dir=3D"auto"><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
/Sean<br>
</blockquote></div></div>

--0000000000006e25c405e38c92ca--

