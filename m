Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B1ECAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 20:24:18 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.2952.1757967858039857091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 13:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4nfJotH;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-724b9ba6e65so30806967b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757967857; x=1758572657; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnLUlWI2egJ+Ttmm/GPEvUDoTNd7I1NP9VWrQOioANs=;
        b=d4nfJotH059id95FJnBM0RwOnXkAppVVXSPcNvZy0OqoDi06dFK3T09arZ6oBYDeWR
         oymwX7azmAukdv4UkFgWyfWFf0vdrBgvXervyfN7diRXQSxQjrIUXHgr1ccoHu4yN/PU
         +CIRlzz2usbiASs75+kNtugex7FWNX0bLrjq713yiHRk3Y7xxrPJdX1D8c6Aqr2i90rB
         EOaa6KTjAJS5SBt/gbbpiXhsFSx3RXVrW1HrzBKVn4JLUFfe0SlLpA4sESV6mravnX1E
         ZPzPd2i7DepuF+MvLDK9Dc9CKtiAdPopU/ynfvInfg32w+MM38VbgmkzSFbJII4rwa3K
         Vbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757967857; x=1758572657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnLUlWI2egJ+Ttmm/GPEvUDoTNd7I1NP9VWrQOioANs=;
        b=XGCwyxviq/EnUc+cWRYGY2QM+36YFymT68yIuj6YxXNSfh46UWJtfcyipzXF5czLw3
         Nz/w9SK0Y9Y7YcPU4A3gB50QpywArsxjsUOqF5ROZTR6wZ5k+9+hhY2ofbbcmbXFh8II
         QfjQwqoB72ZlJW2EJthGlypRzdDySRmSCXJQ61/7/OUJwKH3QNjvSDDqNrXq7wHZ1nbQ
         OZToMq8ntEcb1A0KYPyhHz+iKqqa864ugui9sM8bDN0AYwNOx8D7FB9thuxR64uKZk3v
         51MA1imv+HpFvn/xbB8rIZPp8mvq2ZtzMAzjBMYSksrK3trorqREp4LHFWgKb49/fp19
         voSg==
X-Gm-Message-State: AOJu0YzfAl7aglT0Pbs/G7KozzdOVFB+M7nPuGHFwJEKMO6/+a0oZuBu
	0Y/Erluho7+XZJeVFMQkWMzdMnTShdT8z9NH1XTNRfdbYakiCl0RIPxxDFxvVb8m3iEk6qgjDVd
	LFiH69OvB5dkvOwz/nFH+6nK4am+yowY=
X-Gm-Gg: ASbGncs52nhAD74wVeSqbIpjdhbZSGwH5DbgpwR+8BvNzMv7k/4luRYzKlkQI70i8NJ
	vWurAyGfNenFpXMwsgNDDhN8RXGW5Dnse0v0T5z6iodusjD+2e/yMTuoNmi0Ksn4+JgJtK5L5yI
	1MI1a4wa4u560pQfDsdI3soo2NXmu2QzcZ3NX8FhdqsYYQBKdOhTDR9IT5yt6Xm9VgXcDZDeXxq
	jnJnn6C3zQJ3WfY/c0f1T3LSjCetsmAMk0BHwRYpVvOdcCMcspDdngaBp52GVXi1gWti8wdR7k8
	N5E8pqyKTM99X3rR1v7Ze/w1z7HjvoIYdWNscoZ5wvzryMMdJu5CawKFCAYouPUskeLf
X-Google-Smtp-Source: AGHT+IFp7ak2KaMUNfqHx0jirdP8hdnSEOKOzP0tTIx3q3ohPikDonkg2HlsyP0BF/7cIi8MESl+Ro6sTIihxlNDxGU=
X-Received: by 2002:a05:690c:b13:b0:722:6dab:3565 with SMTP id
 00721157ae682-73062ca55bcmr117138987b3.17.1757967856998; Mon, 15 Sep 2025
 13:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250911120855.2268283-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20250911120855.2268283-1-Harish.Sadineni@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Sep 2025 13:23:50 -0700
X-Gm-Features: Ac12FXyYny20vpyLia5WXoul09TqdM8J2JLv-oMDQsZXr3GVxtcbylctnNk6ysI
Message-ID: <CAMKF1srWBq3io0+s1WAap2n4ER7-40386kOjp6B1TmucEVSmXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nativesdk-packagegroup-sdk-host: add
 nativesdk-gprofng package to RDEPENDS
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 20:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223507

On Thu, Sep 11, 2025 at 5:09=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
> following error:
> $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
> ./x86_64-poky-linux-gp-display-html --help
> Can't locate bigint.pm in @INC (you may need to install the bigint module
>

This means we are missing a rdep on perl-module-bigint, please add that ins=
tead.

> The patch from below link will fix this issue but only when
> nativesdk-gprofng is installed.
> https://lists.openembedded.org/g/openembedded-core/message/204681
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
ost.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index c1d3c25060..5374067bab 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -30,6 +30,7 @@ RDEPENDS:${PN} =3D "\
>      nativesdk-bison \
>      nativesdk-flex \
>      nativesdk-perl-module-integer \
> +    nativesdk-gprofng \
>      "
>
>  RDEPENDS:${PN}:darwin =3D "\
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223272): https://lists.openembedded.org/g/openembedde=
d-core/message/223272
> Mute This Topic: https://lists.openembedded.org/mt/115186510/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

