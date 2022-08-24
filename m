Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75EFC32796
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 16:57:43 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.13473.1661360261723669330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hi7ZqjgW;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-3375488624aso446932937b3.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3yoLoaHWkXi3A8LMxSNNLGXl4h7xYn7slZFc8HsqFTA=;
        b=hi7ZqjgWFxaZmHb7joCCgZAf2nleDe1qu2aMJlHjJtRqd5LtArICnOMgO+pYGvZASZ
         oNiETFEg0j5/SfnVoaEtrJOt7TXJI5DdJ9lAQ0dbNwgFP06a4lednDtNNsW1djjSn6ap
         tJFCOns6hrSjgnGAh+SYcSaMre5xua/afFOC16jhA1AufCJlsnkTqramx6HNSOqgigZO
         AefLUNvz1dsHc8C6cntDH4J7X/jRfsIA2uSvn0uj7kfNL3aFFC7uKbLOgnt6MC1nNQv4
         mevS/TpYHqcKP7d5tt9r5IfGFocctkoJKLRHq37aZwHUv3rh3ZfnVYJG+i0hd6MK+ooS
         nujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3yoLoaHWkXi3A8LMxSNNLGXl4h7xYn7slZFc8HsqFTA=;
        b=4TUAuVny2QMTHybsD50BckHAIgMuk33UYI4hmQVAsJn2ksN+cKLkmvDJaFe3jdUe4r
         6X+2x1q8kRAdJOlhNd9+btStbXDsyWFx73lWp2jGJ7K9mz11s+8A4IeK8UG6fxIedE/+
         7E2bVRl67BHSxMw2xBZ6dscRr8BWTDb4j+J4Ll4nY3tzPZ998AP3rYonYMtSxCoRZ3MU
         7KpLhn9JPJJomnrU2SVBxapDwhyS5NIRPMLpKOOTrwhmzLEQWJ4gCjDCqxdPUaBOaJBr
         GmnUsisBrst2tZY6wYeejM14094wdetm7btjf4Jwn5VHvoB6mvQonWsOt12TdIkhEfhj
         /hyQ==
X-Gm-Message-State: ACgBeo0DH95PVDlTjw+2uNq85dgnYS1proF2BxixKuJfeC7htGH0zyMV
	uzUmpHbT7scv6nIr0z8odlCPjXsOZENDOFICCPc=
X-Google-Smtp-Source: 
 AA6agR7N7N/5Ps1vnQVCm0aGC8bkqg3yUBfsjczS8YQL3v54xFW92RiV16m2kiQsFoiU1VZEYm6DfIrhoFmOW9mlxYM=
X-Received: by 2002:a5b:98b:0:b0:695:8398:9f1e with SMTP id
 c11-20020a5b098b000000b0069583989f1emr35086ybq.620.1661360259674; Wed, 24 Aug
 2022 09:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220823180151.3321962-1-raj.khem@gmail.com>
 <20220823180151.3321962-3-raj.khem@gmail.com>
 <20220824185224.370c44bf@booty>
In-Reply-To: <20220824185224.370c44bf@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Aug 2022 09:57:13 -0700
Message-ID: 
 <CAMKF1src=s9CWjps=i1PBNw=Q6BuEwE=FpJi9O9R2en3A+3BCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] ccache: Upgrade to 4.6.2
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 16:57:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169825

On Wed, Aug 24, 2022 at 9:52 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> On Tue, 23 Aug 2022 11:01:51 -0700
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > Fix build with musl
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> AB testing with these 3 patches I got an error in test_ccache_tool. Not
> sure these patches are guilty, but they are the only ones
> ccache-related.
>
> Maybe you can have a look?
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4037/steps/15/logs/stdio
>

drop the upgrade patch

[3/3] ccache: Upgrade to 4.6.2

 and see if that helps. We dont really need that for gcc 12 issue.

> Best regards,
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

