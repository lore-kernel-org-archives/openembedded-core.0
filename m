Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78733C43217
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 12:57:11 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web12.7889.1652446622253614332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 05:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZBsoWCCx;
 spf=pass (domain: gmail.com, ip: 209.85.217.53,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id u205so8287727vsu.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=esdgaQUAbc0A3V4rBC7o+MdtWroQyqkw4go035pNd0Y=;
        b=ZBsoWCCxF2dnB980ct7vxszpehl4IFsV5/vD5iJWlHad2s0dxQjG5QBlfP4GphFkIA
         txCKVpuRZR/0qR4+Rcsg1lrj4oGyF62/k/x5H6cjwy670fTNCkz53BRlk0NTV1BfghIg
         GNEbgzHMVc3x8O6Bjwu4u165rF1dUAO40tHgoUI2qyV69ZLsbt7YJplXrfOU2UTox1kA
         DRcnCFFiTLRHhP1cD0bktGclmgte7d+Ng0GHU5kwMsJiNRkFqjHIrjwzToUgAW0F3rAv
         kfqSrEVbjLYLrCFyEA+KDf7uow9/+1Ajk6sPKF76DTk7okOF2I46e+BuYJbrJJucIFmN
         4Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=esdgaQUAbc0A3V4rBC7o+MdtWroQyqkw4go035pNd0Y=;
        b=Drd328UYClIB5MdNaLME73ONT8eUeh5it+LzfltkTFXX+gVeN1Rs43nb0YZ7kF1/WO
         qBRo6YaB7Xt3gpsu+Kq80yx2KPnvVrzNmYaBPrin0IbasvF55CWZAXsMoRz0gQAqEiLm
         JCw7QPGuws2+Fk8lYWF711IpEx8vJ3X0vxJvx62uJElNELO9kl1BfuK4X84fECFZdcmR
         x8ymcKIY7Hs5+pl6hm2+OZ+riIrtHi2pYeX8BvmYRb0hxCZUyZgOLry5a21QpS4GoEMX
         mw+h2ywKylYE64jqLb3K92jy8xh7PiCY0Xp6p5tbqvNqoYrdZLbKnqfj2jHROjyLmo7A
         KheQ==
X-Gm-Message-State: AOAM532Bgx0bYUTyeBvyv57plDLFvPwMYPbqSXgfXVuJHI9zIWYlJjHo
	9YieeM5xpyPAMffzf64QeX+y4+dA4WczhMNm7zg=
X-Google-Smtp-Source: 
 ABdhPJxfPbt41k/Yiz3PFu3ZHq+BWPbVV3kBHGUHjQLTOLcfx/Mu5rYMKyIbCcOESulEGWM7lRS1Y+x7331ka3AnenI=
X-Received: by 2002:a05:6102:e12:b0:32d:7291:22fd with SMTP id
 o18-20020a0561020e1200b0032d729122fdmr1955937vst.0.1652446621279; Fri, 13 May
 2022 05:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220502080851.40753-1-pgowda.cve@gmail.com>
 <20220502223054.3aa3ecd5@melee>
 <CALY4986U078AV7xgvpCr+Ev7sQDNW1RQymM=iPDgfN1-r29zuQ@mail.gmail.com>
 <CALY49869zPf6F8UELEue+9BvyToT=W=hGqSRtazXZW+zPO5c=A@mail.gmail.com>
 <215dded4d396c69a484a5404d07499b45af819d0.camel@linuxfoundation.org>
In-Reply-To: 
 <215dded4d396c69a484a5404d07499b45af819d0.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Fri, 13 May 2022 18:26:50 +0530
Message-ID: 
 <CALY4984taQDm3GRxcJBCzGgHAt8jUP6fj8bD7cRe1FmjLkVoUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 12:57:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165559

Hi Richard,

Thanks for the confirmation.

> What you really need is a way to replicate the failure. How did you
> test this locally?

I ran the complete Oe-selftest suite with the latest poky sources
after applying the patch:-
oe-selftest -a -t machine -t toolchain-system

Can you please let me know if I have to export any specific
environment to replicate the failure?

Thanks,
Pgowda

On Fri, May 13, 2022 at 6:15 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-05-13 at 17:58 +0530, Pgowda wrote:
> > Hi Luca,
> >
> > I have checked it again at my end and it seems to be working fine.
> > The error is related to "setup NFS mount on target" and does not seem
> > to be related to the patch.
> > Can the patch be included again while running oe-selftest and checked?
>
> No, it doesn't need to be checked again, it is breaking oe-selftest
> when used to test target machine glibc.
>
> The change in in the glibc ptest recipe and the failure is in
> "glibc.GlibcSelfTestSystemEmulated.test_glibc" i.e. in the glibc tests
> so there is a clear connection between these two things.
>
> We need to work out why it breaks it and fix that. Running it again
> doesn't help us at all.
>
> What you really need is a way to replicate the failure. How did you
> test this locally?
>
> Cheers,
>
> Richard
>
>

