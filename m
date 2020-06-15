Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web10.22651.1592239288412506125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 09:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O3lz+Ued;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id 190so9703646vsr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QV6Zly3eYB8koaLvXaMTooxsLN7IUa5PTaFOwEhlSJg=;
        b=O3lz+Ued143rRuo2BUPjrwwybAqPS2UOSTeZvXQrHRC559cFkTAeAdOgJQB+jYXfCW
         M4jmqqmsnIeMhsa41lITgR5XFSw73JJjfJZXb6zY7nMjO9A2PnU/csa7AXSFewHckouB
         Wo2ZD638ik6IddFe9k/NzNU/GWM63nSX2wz1fvTYqaZw7cCQjaXu+CNiq1XMc6022aGZ
         1tLlLLPITyUhD78zOCvr43MadnPDGaZy52wcRPrfpYM329F1PziENoIH1NRldrNBUnl3
         MgcapQtoLBQl3IbBFoSqd58s2TyDq6fQ4UXH4WgsDi/eD1dhRf4yWkzPl9aeizXJ4KHe
         PxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QV6Zly3eYB8koaLvXaMTooxsLN7IUa5PTaFOwEhlSJg=;
        b=r1XYaX6Vj6uE54TS92GP8XXjjn2MRuDu2kxih2yzISW2UjHzqZdulQ3/pA+Bf5V6bz
         xB2FKFveHVkRj31UpIR6q07qDVSapAseGkNPA2cJKEhOl8gyyZ90lTmMYnxMup7fRsdR
         HTldAMHy0fe+FFqhiSlYAdghB7taNijK18aSzLSGr0VTRHqyg8kBXIwh15GTkL4UrSer
         H+EpTRGcL2RBFjdNq8QxgoPN2rb2jAA8l+2oY5VqsMmTRzZG58EkqOcCae2LdnY0WzKW
         iS40Qz6OK5hm4dAzqtbDlFa0CifHf0n8YI2oFuChKjBgqXWI7UPk5scfuAtIPPosj7np
         CJuQ==
X-Gm-Message-State: AOAM532kvA+AUIot3/wJYUi0CnJdlKmGZHCilqQlx3JU3n4YCASxFS0u
	A+E+JvEpmjlcVVoyigCAcdoH2PLKXB4cmdLttxM=
X-Google-Smtp-Source: ABdhPJxvQ9hq6eOHEr538X4qABJjku8HI6xCrVd6iZI4r+0JuQRSJw+WWWlckn19VeMMuStI8nAC5W4XzwI91jLO4xg=
X-Received: by 2002:a67:8c09:: with SMTP id o9mr21109438vsd.23.1592239287594;
 Mon, 15 Jun 2020 09:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68814488723D88530BBC17E2A89E0@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <8c4f219514c2d9ca3d29b3f452dfb00df65109aa.camel@linuxfoundation.org>
In-Reply-To: <8c4f219514c2d9ca3d29b3f452dfb00df65109aa.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 15 Jun 2020 18:41:16 +0200
Message-ID: <CANNYZj_78C2rnc=Q3k=4kuU=bocYd9ipH0-59S3pa36qzsJNrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: Add OERequirePackage decorator
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002275a305a82219c5"

--0000000000002275a305a82219c5
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2020 at 16:02, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I can see the use case, I'm a bit torn on whether we should fail in
> these cases, or whether we should enourage people to check the tests
> they expected to run really did.
>
> With the complexity on the autobuilder we've had to rely on the latter,
> comparing that all tests that ran previously, still run.
>

Do we have some kind of tooling to check that tests that are expected to
run, did run, and were not skipped?
This patch came from our internal situation where due to debian renaming,
@OEHasPackage started skipping tests
that it should not have. It wasn't immediately noticed - test logs are
hidden inside the build logs, and the build logs are not
usually looked at if the overall build does not fail.

People were very baffled by that, and it took 'yocto experts' (Konrad :) to
sort the issue.

Alex

--0000000000002275a305a82219c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 15 Jun 2020 at 16:02, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">I can see the use case, I&#=
39;m a bit torn on whether we should fail in<br>
these cases, or whether we should enourage people to check the tests<br>
they expected to run really did.<br>
<br>
With the complexity on the autobuilder we&#39;ve had to rely on the latter,=
<br>
comparing that all tests that ran previously, still run.<br></blockquote><d=
iv><br></div><div>Do we have some kind of tooling to check that tests that =
are expected to run, did run, and were not skipped? <br></div><div>This pat=
ch came from our internal situation where due to debian renaming, @OEHasPac=
kage started skipping tests</div><div>that it should not have. It wasn&#39;=
t immediately noticed - test logs are hidden inside the build logs, and the=
 build logs are not</div><div>usually looked at if the overall build does n=
ot fail.</div><div><br></div><div>People were very baffled by that, and it =
took &#39;yocto experts&#39; (Konrad :) to sort the issue.<br></div><div><b=
r></div><div>Alex<br></div></div></div>

--0000000000002275a305a82219c5--
