Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A033C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 18:52:26 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web09.528.1662663137468345637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VpVlBS6J;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-127dca21a7dso19535087fac.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uOy/QDZWqRkIUM16lDv8EKQmrAjkVAvYzQSSCOYQSQI=;
        b=VpVlBS6JK8TvfCEsYzOq+EjctB0/dnhLJ7EPnrcOnLcARf+7CPQrP2yTc0rQz1Bhkl
         tnXKBkaB2S4GJi9mSe1kA48bsgiCfzokzxuFykRQGc1yhbD/ySDNKgDbs3VRfPOrTNYU
         rTQ3ZM9maND6dAAHZ4IIM0dmQgr4qSANXe76kzoe7XOOtJ2X/wcCnjI9NLVk8FKmawvb
         x/fMZeH7rXSarh9Wd3uRsEC4vlXe+IGl3z97JdxGsd7i9pO2cX14hD9Ij5YaaLUOVZzo
         hm/GSelruXpFQV5HsJCYqWaVzGaPdATGGiQUM5/j4Bt1rYhxbWsQzfrihh0DfH1AfZbQ
         dWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uOy/QDZWqRkIUM16lDv8EKQmrAjkVAvYzQSSCOYQSQI=;
        b=tLe9yWC8hsv2/fwN8YmZLUIbKZ4ed3hnznnnik8ySmQTrhjtSIbzJDc1/rHBD6/Z1v
         T7sbiGBgR3F2aWR08ugGDfaOcrwuN4VW2wVbOnN2sODvXWN+bwoFNRyj8LmnKJSMkQeP
         1o412tEUxU2i+iSDRVFd10v8Bmfj7HPhcbTjSWHXbwk4g7aZv6V6OE7XVNl48CT5L9nK
         eblPNJ7cKIGnlu8m5LkE4rj0bDidaWAlc95Ereo2uLq7K5cgAqfDUguDcKIWTcz57Ppu
         YTk5RGoc0lSdYL5uD/XZD7Gip250OGreEFHtZHvhI6xchDKyVTDuy0nAprVUzuTGEH0+
         NLwQ==
X-Gm-Message-State: ACgBeo0TWgQr01vZJz375WkWaHYkY8/Sj2KVXHTmmAudHoM/Q6bDqqPQ
	vXEzSf+EDkjIuajMepL6pimD9/AiiPwj8oFxgHU=
X-Google-Smtp-Source: 
 AA6agR5Xgj9g4wAynRClgGu6+pqSQWAe2Xy7bcY5dHChT6HSSP8fHGyeIznaScOq9WcDwkLyLG5SRqxdHGm/7BVKW3o=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr2655935oae.262.1662663136759; Thu, 08
 Sep 2022 11:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220907231417.3274392-1-raj.khem@gmail.com>
 <YxnzAV6GoTKNwboH@mail.local>
In-Reply-To: <YxnzAV6GoTKNwboH@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Sep 2022 11:51:50 -0700
Message-ID: 
 <CAMKF1sqmm6O26wF56iuJySBfMFrWacXqz8Kd5ZsEHq9g5v=JPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Do not package
 gprofng.rc
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 18:52:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170471

Thanks Alex,

sent a v2 which should address it.

On Thu, Sep 8, 2022 at 6:49 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> This caused failures similar to this one:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4110/steps/14/logs/stdio
>
> Full list here:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4203
>
> On 07/09/2022 16:14:16-0700, Khem Raj wrote:
> > This file is already packaged via nativesdk-gprofng and can cause
> > populate SDK conflicts
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > index 4e8f10c1c4..c18468ad50 100644
> > --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > @@ -23,10 +23,9 @@ do_install () {
> >       rm -f ${D}${libdir}/libiberty*
> >       rm -f ${D}${libdir}/libopcodes*
> >       rm -f ${D}${includedir}/*.h
> > +        rm -f ${D}${sysconfdir}/gprofng.rc
> >
> >       cross_canadian_bindirlinks
> >  }
> >
> > -FILES:${PN} += "${sysconfdir}/gprofng.rc"
> > -
> >  BBCLASSEXTEND = ""
> > --
> > 2.37.3
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170433): https://lists.openembedded.org/g/openembedded-core/message/170433
> > Mute This Topic: https://lists.openembedded.org/mt/93537151/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

