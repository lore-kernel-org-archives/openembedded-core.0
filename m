Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7984C64990
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 14:37:09 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web08.24766.1661438226575503366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hK43vM0S;
 spf=pass (domain: gmail.com, ip: 209.85.128.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-33dc345ad78so34829407b3.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 07:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3XYhuiDgYvmM3jIdvMQ6CXOVPhnZTqRPXs+zt0Koc4E=;
        b=hK43vM0S+i/yJMCcTiJ+EbtTKFzVxlchM0VuTgZe28AOWftNd2fLDbMr4N9aG+5FQp
         EBonPY8P54HZmIeZHBNZtRoEqzTp6PyH9BrwaHRRK67KZ57iC6O5euye57ZX899srvfp
         iBjavGGbT+8M6gbIs+9PgC2cZD/LZb93OOZosJo88T+7zsEeKAUaeL1gn8XRqQUWqKkv
         RD0ul9xXFPI7pp2NiGrAJgDFGmQx9IcbKZX8Ie74/L2tcJZVPEVIfDmsdXSDELCq2WtW
         xXg0aWBE4H0iJvE2D8iSIGykajplDCbqHmA3Ool6rKporEr+x55yANpcuHoNLhp/Ss9h
         2n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3XYhuiDgYvmM3jIdvMQ6CXOVPhnZTqRPXs+zt0Koc4E=;
        b=06K3ALtAJvZv/MX2z4GNIKivNFNxytx3pCuv0W1AIr9klHGnXGWMRXc4Xj5zV6McMA
         Y2ZQHNFQH/Z2LPwcSdvOPdRBxEVK1Ytp/7koPsztfpV/+Sl6iknLwyxVKc2dUYcyESrz
         rvC7IuOzVbysGNO0uNIjaSjNwewvNoeyituyMPLY1DGaJ55Qv/9+DhBSzVmtD28ak2U+
         rfIyTJQgZ4jQ31wSF0e2BoInlyS4uXDI44K+zKhAHid7OMhTCnaIfOJwBiadtWzs4Cdr
         GDoTp30/t6vqdjgFseQ/2FiHPHrfC3ePeRJLNziv5XwwhlStMumm975SzDLXfysFTNzA
         kNBQ==
X-Gm-Message-State: ACgBeo2B5Mtq1l+sPuaPflt0S9OzugnpUfZ2OIA2KKAv7CyCIP6g0+yo
	5FETA0joB29nkDMYRD00/i4/ywH7J2pXbotVp1s=
X-Google-Smtp-Source: 
 AA6agR70DvayMGWfISV9NZfThQkfJ1/Q8qPILgEq181oRmvKOpYL+oFaU6R0RRZRiDvDwOtK5mddZzi80bJcUq3j8As=
X-Received: by 2002:a05:6902:192:b0:695:7e89:ed5b with SMTP id
 t18-20020a056902019200b006957e89ed5bmr3508114ybh.226.1661438225129; Thu, 25
 Aug 2022 07:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220823180151.3321962-1-raj.khem@gmail.com>
 <20220823180151.3321962-3-raj.khem@gmail.com>
 <20220824185224.370c44bf@booty>
 <CAMKF1src=s9CWjps=i1PBNw=Q6BuEwE=FpJi9O9R2en3A+3BCA@mail.gmail.com>
 <20220825120248.66f9b613@booty>
In-Reply-To: <20220825120248.66f9b613@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 07:36:38 -0700
Message-ID: 
 <CAMKF1sq3K0E2tFkpoXSjNL7D+5bXNADBbq4f3mpvJDsC2dP-BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] ccache: Upgrade to 4.6.2
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 14:37:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169876

On Thu, Aug 25, 2022 at 3:02 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> On Wed, 24 Aug 2022 09:57:13 -0700
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > On Wed, Aug 24, 2022 at 9:52 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > >
> > > Hi Khem,
> > >
> > > On Tue, 23 Aug 2022 11:01:51 -0700
> > > "Khem Raj" <raj.khem@gmail.com> wrote:
> > >
> > > > Fix build with musl
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > AB testing with these 3 patches I got an error in test_ccache_tool. Not
> > > sure these patches are guilty, but they are the only ones
> > > ccache-related.
> > >
> > > Maybe you can have a look?
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4037/steps/15/logs/stdio
> > >
> >
> > drop the upgrade patch
> >
> > [3/3] ccache: Upgrade to 4.6.2
> >
> >  and see if that helps. We dont really need that for gcc 12 issue.
>
> My build with the first two patches + the gcc 12.2.0 upgrade succeeded.

yeah thats good, I did the patches that way, recipe upgrade was
optional for the gcc issue.

> Thanks!
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

