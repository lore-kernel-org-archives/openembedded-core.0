Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110F6C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 20:12:34 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.776.1635883952767351577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 13:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IVYkH7r9;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id 19so348629qtt.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r9XII9uMenzhg097GlQx5suLrVwHIOVFIQAK8jQw6oE=;
        b=IVYkH7r9S8+jc4N55oNEr74tkgpKLtXZ9HyBb59Dqvd8CSK+JNkvLEoOZuxbjWKDco
         8WZyUecE0nAJIu9YvSahQmuuaLAnjJQvPJBGc0nVdRkM6Dy7SAm0RjMexQhk6LtvC+K+
         VAMvLCqDfpHBS0KQwdkHF4oIrQ9CG70ScIPhrvL2gG86UAOCO4/7iCTDXRbFAF6FUPJl
         /JP5rmuN9mnYLIkq47UMjWa7HEDmtre3HBupz6/+1o314kcPvzBuvpdVN6UTXjS2u5Tw
         a6znikAwgPB6N8ePe6IVTkuGDzctaQTgVvetO/H4Cy4a26Fb3DIN+4tPYNqDSIvJZ3NM
         Pc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r9XII9uMenzhg097GlQx5suLrVwHIOVFIQAK8jQw6oE=;
        b=vnfqMmErVCSXe42WqLDKj8Kaf1CAYblVUCcAnK2Czl1FUZPz59cf8AGSR4uLFj3Gn1
         sclM1ZB7mzIaYWBXrLeKwjZw5D1MTiP3gXprp4FHzziRzWRoGXtkwmAEZ+B92knZ093J
         r2StnEjURn6o7ISdogwKZNw/8LonXo9TLa3C3Ihh8TalVyS9bLafYQ4eeJxrRjHpxkM1
         K4uu1sHMHoGGupfyJunplTHX3Yxgoi41GvSIpg5ItI60V2THHUqWLKcGRc77+AHmuv+D
         UI7N9C73h7YqdKtvG7IsC2xB76zhzqZDBTi9BFsq9OIagoFXcCsKj/Bq3O0HSeeVuyJ1
         DE6A==
X-Gm-Message-State: AOAM530try65iDuAdcDak9+F2Lvfu7/i0/du3MSFLpIbSdXqoJTGclYS
	HlaQ9t6C+3ib/TqSLpV3KCOHUmAyoOPtSHKcLs4=
X-Google-Smtp-Source: 
 ABdhPJza212ZrP4romF6YCOr0wqWwFydlRLWZI7yS71WP7bVbjzUE3iKJm6xr5H8PC2dD9dioMJO8rFrThNj8gz/t+M=
X-Received: by 2002:a05:622a:13cc:: with SMTP id
 p12mr41541258qtk.227.1635883951679;
 Tue, 02 Nov 2021 13:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211102180233.4104293-1-ross.burton@arm.com>
 <CAMKF1spVJSF9tpjK5nz7WYVB_XXEjXvuXARvXnpTKjOa4S-Brg@mail.gmail.com>
 <CAAnfSTs3mb+KxE+LbMR3Jj-HdKPXQFro0YCx=15vXzPAiVG6XQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTs3mb+KxE+LbMR3Jj-HdKPXQFro0YCx=15vXzPAiVG6XQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2021 13:12:05 -0700
Message-ID: 
 <CAMKF1soAqszOxP5q_FsjTWpcgr1G-8gYCUWC1cAdHx_++3m3pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: silence DeprecationWarnings in
 python3-config
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 20:12:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157815

On Tue, Nov 2, 2021 at 1:06 PM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 2 Nov 2021 at 18:06, Khem Raj <raj.khem@gmail.com> wrote:
> > So shouldn=E2=80=99t we fix python3-config to not use distutils and swi=
tch to setup tools instead ?
> >
> > I am afraid that masking the warning will come biting soon when this is=
 turned into a hard error
>
> That is a much bigger question that needs to be done, but most likely
> involves rewriting large chunks of the cross integration as from what
> I can tell, setuptools doesn't expose sysconfig (and we patch
> distutils.sysconfig).
>
> We can continue hacking the hack, until we solve this properly.  This
> may happen as part of the pyo3 rust/python problem.

I guess, this patch is fine for what it is solving for now, I was
hopeful that converting to not use
distutils would be easy :)

>
> Ross

