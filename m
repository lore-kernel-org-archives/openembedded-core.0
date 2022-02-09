Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12698C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:36:34 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.29978.1644428192765447750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mwX6AWh1;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id k4so2390333qvt.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Muor/qAy68+e2FqyPFVC+llF2ZEbQW7fXjOfM+UMWfU=;
        b=mwX6AWh1mWxkglvrlPQJFS7VYIolg15OieZPlCEPAh8uSw+bVst/N6ECzkLtE7PIC9
         y2Y3zyUFRMi6Gxehd+RGtefZ7pJ3kuevHyFys/vIuvTWnz9TtI9R5R2bZvIASith3Cvi
         FtLp0IxKvO3lKchUd1lGwnuE2z3yPuWG/ueWdC0n7rO4QWWUmqBSRR6yGqfI3b9Zb6/Z
         0iOhRwQ/wgR+OcVV+JoqgG5W8lXqEjKySAbrjf/bEbI2phYhxRL73ktrr/1yuwdntWqN
         BAiGk1zzB73tGZKgLawpPtaA3GcEF49i+pxvaNEA4Fr3vSKqr5G8G2yDmC9psGJU8ecH
         QWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Muor/qAy68+e2FqyPFVC+llF2ZEbQW7fXjOfM+UMWfU=;
        b=hhpPJY7h7vfrqfnWsY4RVYSsUbWWrwL2gRg3SOfdby42G5TV63w5BbnkBcU6CUBgb6
         yw+fGqbjn/AQCIjwmDKio6HLjVKeGSIHwD0xXcsSfMRvqFWE1BmitYCNIJsoD4w8r0if
         xS3d61QuktgJbNRlJA9w4qInnQk5jZGvb1iZ5zb7iqq8vJugICAkpfDgMmZH0J6T+E5t
         WS0euCRIgtGU519wR0m0v8xU+ZXwoZK7k1Jq6NmCWf2BO4EAzDGjHY5chIs35Js9JDwc
         IcscH2wGtnNfBTO2T4DK41PmQ9gtVNiFwMTmp879WycW5HXe/b4Cr7Ee1INk1QxCF7dx
         xTKw==
X-Gm-Message-State: AOAM533CzoWyDdTmV6QRZdFDiquwtbVIs7WfCG9qojEcA72YUgQxVAFU
	DjsoOUu82EXzoeyLum8qfb/xSj1/VVQODrwyknI=
X-Google-Smtp-Source: 
 ABdhPJyufSnAj684mHbHIJmVpyBFhNJcf1qQIxe+KbUHvLo+VMwAoHO7+BOzUPMVU7BGrT+42HL+fr8L9bK+x0O3wXc=
X-Received: by 2002:a05:6214:27e8:: with SMTP id
 jt8mr2338521qvb.110.1644428191711;
 Wed, 09 Feb 2022 09:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20220208225310.1685131-1-raj.khem@gmail.com>
 <038723a3f16f3260abafc5e6f60bc780f91b5328.camel@linuxfoundation.org>
In-Reply-To: 
 <038723a3f16f3260abafc5e6f60bc780f91b5328.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2022 09:36:05 -0800
Message-ID: 
 <CAMKF1sro4VT43L+M-=pL8kzabmjdHHkWQagkWSLuG+ZqoAQQhg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161578

On Wed, Feb 9, 2022 at 5:48 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-02-08 at 14:53 -0800, Khem Raj wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Package /usr/bin/ld.so in a separate package
> >
> > ld.so is a new tool which is added as a symlink to original dynamic
> > linker so make it available with same name across architectures which is
> > useful to leveral features like  --preload, --audit, and --list-diagnostics
> > more accessible to end users
> >
>
> There is still a QA error with this for multilib:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4735/steps/11/logs/stdio
>

yeah, I think I needed to add multilib prefix and also rename the
symlink so they can coexist.
I have made this change and pushed the update to kraj/poky-next

> Cheers,
>
> Richard
>
>
>
>

