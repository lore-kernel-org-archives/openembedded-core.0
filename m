Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EF2EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 12:48:08 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.7029.1692708478577826905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 05:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=l2GQuHCP;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7921b70c1a5so99347439f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692708478; x=1693313278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAf0FYgr9Wi+iQzEjLQ3z4k6isEj4UL0XTuB5xYEaWs=;
        b=l2GQuHCPBBBveR4bSAfHK3Zk5RybQlJg1zHR5VE1Sk9mgleWap4VdAMILpTUrD3kQK
         htozNkNVFkW12AAdo1llKtpZDd/nBwt4nC26nJ7Ip4J5QN1YICtAZ2Nra+9n5pZ7E8rn
         JVCeDR07E1zhhB26pDEpxsH9TYWD+jE4h4o801n3KpOCD7hkCbEIjrChPAdB7lApwAv4
         x0SuRDQbvppxSRQ34u5OK8mpyz3xvLINx90negHxpJM94J/wGSVVcH00dnS3uGc2qgzy
         AXlaSOBb7JNlq10Cq9+VzhZm+3FzmDdJAURHLqOlOh98YlXIJzXXsJLeRNWGp3GPVKfv
         rbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692708478; x=1693313278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAf0FYgr9Wi+iQzEjLQ3z4k6isEj4UL0XTuB5xYEaWs=;
        b=WA2fdGt0qWi5xpZKpR4rAMdZZXt5JWHQGVms/bIGrQJ7UnsJqg6u5kGJ2GsHpUKgX/
         PUqtHZu45fa7IE1sceFzwL/vZdOHtXAAtR5UXPiBnI6njnGK1EYk6fxm4g7BEa+vQYBC
         UA5HhR0n+UX3Es3s7g8joUWykraxMBp0cgzh31/vbgpVp01BQoJO25NXgaJLNxlHgXpg
         CJUK1oDZMCtg9kWZspo3aguiNngj7XMIxLlsfUqO7SVjTn8I7d1FEh8bd58+S+NGWGxK
         yNMr08EUjACk6FyeOf4xZW9bEr4OROCVxnQJ+frC42hiH3Dk2t4yXFVCyrUyJcrYNJwR
         Rq8g==
X-Gm-Message-State: AOJu0YwUVo99TmjnLX2061cX4SCz6BU/NE6a2a93VSMJebqImMCdVXcV
	RY16eEwWjwlKKFE4JqX+T9uEFEnda+Wu3OMxwSo=
X-Google-Smtp-Source: AGHT+IEI0SzdsMXPJAI80V5MCnTBdLZbmkuBCTUTMiu7F7YuIOUQ7k49P06bLMSIy5Mx9vqzaZ27LbBIHY7/aBCM8Jo=
X-Received: by 2002:a5d:9551:0:b0:783:60f7:ade9 with SMTP id
 a17-20020a5d9551000000b0078360f7ade9mr11677651ios.5.1692708477651; Tue, 22
 Aug 2023 05:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692632563.git.bruce.ashfield@gmail.com> <20230822091344.2301ed50@booty>
In-Reply-To: <20230822091344.2301ed50@booty>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2023 08:47:46 -0400
Message-ID: <CADkTA4N9RaWbvoMCyGSZzpVvh0xOtLt1sVKEPJshX9p9MfW-ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/10] linux-yocto: consolidated pull request
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186508

On Tue, Aug 22, 2023 at 3:13=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Bruce,
>
> On Mon, 21 Aug 2023 11:44:35 -0400
> "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > While we track down the remaining 6.4 boot issues, here is the
> > set of -stable and specific fixes that I've queued in my kernel
> > testing tree.
> >
> > It is possible that some of the 6.4-stable's have fixes for our
> > boot issues, but I didn't see anything obvious.
> >
> > In particular we have the -rt warning fix from PaulG and also
> > a fixup on our isocpus patch.
> >
> > Cheers,
> >
> > Bruce
>
> You're probably already aware of the build failure triggered by this
> patch series:
>
>   stdio: ERROR: linux-yocto-6.4.11+gitAUTOINC+d9483a24c9_9753b44979-r0 do=
_fetch: Fetcher failure: Unable to find revision d9483a24c9ee33b6e566baa523=
3cbd9feaeb5212 in branch yocto-6.4 even from upstream
>

Richard mentioned this on IRC yesterday, I already pushed the
offending branch to git.yoctoproject.org, so it'll be fine now.

> This one is less visible:
>
>   WARNING: linux-yocto-6.4.11+gitAUTOINC+d9483a24c9_9753b44979-r0 do_kern=
el_configcheck: [kernel config]: This BSP contains fragments with warnings:
>
>   [INFO]: the following symbols were not found in the active configuratio=
n:
>        - CONFIG_COMMON_CLK_NPCM8XX

I'll send a fix for this in the next few days, but I'm on vacation and
driving about 14 hours in the next couple of days, so it will be
Thursday or Friday before I get to it.

Bruce

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4440/s=
teps/17/logs/stdio
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

