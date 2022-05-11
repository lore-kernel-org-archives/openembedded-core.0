Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34AEC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 10:22:01 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.9789.1652264513972747602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 03:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VJVy36/3;
 spf=pass (domain: gmail.com, ip: 209.85.166.181,
 mailfrom: alistair23@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id d3so1093539ilr.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dfJ9l6ubxGqlq4RXq6wAh497oUvWJnJEa1ktoemwLz0=;
        b=VJVy36/30VsToaAM8UoMwfs0sLq/LDEVr/CxAVgfDjrqpQRPvk6OTWVwVbKEADLpRl
         6BAEqiRC0IK//vX+BQFGicl8YQnEI0iLL49+7+DqblmwsOpHrne26awCySPLzTN5G4Nx
         oy5CBlcdBE5as+YRKrysB7cgzyyDeED/BvMYeE+PdrxHqDuOgZb8RL0ZaByheHuzjQ/W
         1kPI2IDArJx64FOAuE1FhQ/Z3RkwrxVMV2sHMBmbWbS0G4xS7ucw+7J65O4PYAMURUT1
         RA88f9oqFz6KDdblZQUV+s95SCGd+NvA4vwlVvbKBEVDwTtlgx8vRsL2LGQTz0rQztAU
         TNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dfJ9l6ubxGqlq4RXq6wAh497oUvWJnJEa1ktoemwLz0=;
        b=nanU/MAl7qeqiCsUu5JHg3Yyl70qmwFm+wskKLEadrr4j5+haAFSrpyM+GJnjLz5zy
         nB3umoQ1pOGQaHlZ6TVtfQ0hpFbgVqNe82PZYi/vlWn4O+iflzyCBw/a8Z+7dF+KZeR6
         SFanStDjsPvPmsozhAkDyNKoGF4eSmw60amJqvAU8BoFkl5VjhX2YPWpao5yCUnOJJOu
         d7IXgKoYNKS193ds9XpZnp//wjmBWzYf243wvvT+cD5lnLLf8grgxyb6t+I8EBvyFx51
         MlWNPCmmyggMcwb57mO3TyAVMZLM6NOsYQxqDvCSjuw77C4gt/zfGz0zi7BHGICtxVd0
         yhLg==
X-Gm-Message-State: AOAM531LRnFRRbgnh9UIv/FwEo/bJwMR/uOUoJCkiZYnlSIwHBLo2+1m
	WvIA8P4XryXr+8gISEaPIeIUEhItD0iFlwjdc41ec2N1nVLUb/bC
X-Google-Smtp-Source: 
 ABdhPJye+CKT312ivV5lfvBIMeHCATuuffd6dFJknzNlbN5HoxC5+C22vHE+sJ3VnsTv5CSyIj190jd/RgrfT1Nw+A8=
X-Received: by 2002:a05:6e02:18cf:b0:2cf:51d1:f694 with SMTP id
 s15-20020a056e0218cf00b002cf51d1f694mr11540195ilu.310.1652264513338; Wed, 11
 May 2022 03:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <c57da822-52c-e74-988-32454f2d30ab@crashcourse.ca>
In-Reply-To: <c57da822-52c-e74-988-32454f2d30ab@crashcourse.ca>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 May 2022 12:21:27 +0200
Message-ID: 
 <CAKmqyKMaVVgg2FOmjmE4NERqNJiCC=5ceNv91Wnxn9RM7j25ew@mail.gmail.com>
Subject: Re: [OE-core] should local.conf.sample include MACHINEs related to
 RISC-V?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 10:22:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165492

On Wed, May 11, 2022 at 12:06 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   just now noticed that while oe-core includes machine definitions for
> qemuriscv*, local.conf.sample does not mention them. is this just an
> oversight?

Yeah, that's just an oversight. If you want you can send a patch :)

Alistair

>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165491): https://lists.openembedded.org/g/openembedded-core/message/165491
> Mute This Topic: https://lists.openembedded.org/mt/91032184/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alistair23@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

