Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC5BC4167B
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 19:12:53 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.643.1650649210644828922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 10:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aTgrTm/R;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id hh4so5998771qtb.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ffn8hdIpVf1KVvv4fh//lMtrbtGzYgpKNlOkv3SOYjQ=;
        b=aTgrTm/RdLd47RQtkQlPuqluGFWKDn4Sq1tV6ivDfDryKFXZcElhfqzdcj1nH245OY
         721u+ilV/skTix2SBXqyNWTYvoFULIIKXMRICshzD5dg2Gubgyq+MSOILkN6wl+apsOr
         mFiGUg3zz3h0f8BOfj+ureq+nQklTMsQD4MlSWyzW2AUIAp6tw/uBpEAREGtcA4VIk/H
         bCyFwmI2BuO/hjpPinF1LQZJ+004tBmS3z3Kk7NZ7boxFrR5cqeSXZ7i7v3esTSLxtaI
         k5FK132oOIv4kyUr6aYQLhCbD2mtN17UhsByBogImim/CgBHdSlOxkiqIolDLsQm2c6D
         WgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffn8hdIpVf1KVvv4fh//lMtrbtGzYgpKNlOkv3SOYjQ=;
        b=0Uy82XAw9ognx/88gWb9Rth2Nrq6f7HvmMVALrE18gQ3ryi/MIMYzzXpO+2Hv9OPgm
         DhiXdraUkH73uO4I2qe9dyWcMOGKxKhi2U0AwggMLFAVcdH5QsCy9J3uws//NFtlLfiP
         Mm4C4i5oJlAKmhpRIDZE7eZ7dNO5NHg/GCsF2H1Ip9e2F2PT+vIKThowoM+VJk/eEWsD
         Uy25I3djymMHUOKJNH3JKmIz4k0CX7oBLAIZ7ixVfitUj9zdrui590udpF+j1eyPjdnd
         07iFIC/m+C5bMsusF8k4c7R4kHiByO8wxx2q58MWilZQAydPnP10onTAiazjVgcooOUN
         bFyQ==
X-Gm-Message-State: AOAM530aqMmJ9cVk8gxJhJDGjiIP0FByrv8mQRoGzNvjGh6SqswngM9h
	EGzjk+s9KVa7WmvzgI0os6GWGy0HyylvCpkCpshr0h2A2TBGAQ==
X-Google-Smtp-Source: 
 ABdhPJxNkqtImMWcwPwslqo3qQ063YJBQi4aQGOE41QnskczQq/EX38lla/n4wTbk5gEVi0pqYZIIl4fqXYlfP29M0k=
X-Received: by 2002:ac8:5ad1:0:b0:2f1:f29b:7371 with SMTP id
 d17-20020ac85ad1000000b002f1f29b7371mr4208850qtd.330.1650649209601; Fri, 22
 Apr 2022 10:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220422061052.2577710-1-raj.khem@gmail.com>
 <20220422141952.7ea98580@melee>
In-Reply-To: <20220422141952.7ea98580@melee>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Apr 2022 10:39:43 -0700
Message-ID: 
 <CAMKF1spdB1d5vKDDog244NFaE7+Qk+WEgscL-cqDnbb6HBXecA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] musl-locales: Add package
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 19:12:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164798

On Fri, Apr 22, 2022 at 5:19 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> Il giorno Thu, 21 Apr 2022 23:10:52 -0700
> "Khem Raj" <raj.khem@gmail.com> ha scritto:
>
> > This package will provide a limited set of localedata for musl based
> > systems. It will fill in into images when IMAGE_LINGUAS variable is
> > set however the choice is limited to the given 13 locales as of now.
> >
> > e.g.
> > IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> >
> > would work fine
> >
> > Default locale can be set by exporting LANG=<locale> in /etc/profile
> > or some such file e.g.
> >
> > export LANG=de_DE.UTF-8
> >
> > This will also help in ptest coverage with musl where some test
> > packages expect locales e.g. pango to name one.
> >
> > Do not empty out IMAGE_LINGUAS forcibly for musl anymore
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> This patch is triggering build failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/5401/steps/13/logs/stdio
>

strange !. I even tried with your master-next branch
poky-contrib/lucaceresoli/master-next
and cherry-picking this patch on top and doing build-appliance-image
build. it does not show
this error. So something is amiss here.

This recipe has COMPATIBLE_HOST = ".*-musl.*"
which means glibc build should not even see it.

> Best regards.
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

