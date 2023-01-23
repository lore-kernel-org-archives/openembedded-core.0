Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5A0C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 23:38:36 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.2470.1674517109393897924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 15:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jXq3MpmV;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id o66so11867091oia.6
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 15:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gcQQYR3pp2XLALIYrYxf/qDEm2tcaQBEX6UoHSU/hcQ=;
        b=jXq3MpmVCCS0sxYi2qcZEciKce+MZz0jG4u5uI+Dm1hmMurY5LIIIRK7jsiEfsTG2z
         Kq0Sf3GWRXsqnfVqoP+gf1cpoNRtO5jjYEUmZ7pwKP29UX1wYRIeZIrgxPMaqDY1dHwD
         ARsDlJ8ruRGIA6vy1XEUY5PnjOs1IYAS5EiOuTM8ES7AUwJ0Zo/3fksGnEN4HDsAPiQd
         3gfGzY8zxLFckIf2w7vXrcXvB5L5LRhuZhx3vSjqbrL5sRIbJEOzOASM6mUybz6bNAu5
         ZFZj0o0tsAVPZ0V/OWs2ORZtCTuybzE8yJnzgNg1KjNVJipV4ssv4dhUTKVmfCgySgca
         rqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcQQYR3pp2XLALIYrYxf/qDEm2tcaQBEX6UoHSU/hcQ=;
        b=sSGtN8E7VQmh4URA0mMjq4i50d/x/ytFWB3dsj6AQKdMgwNBiTIGClQrhA5J8F3wNq
         uswqLIYS0xBC1Nv/IU3VfEyMRs/aZsjClJ4LZpsoJSOXr6x/aNQJyeoTQNmXS9T4wmFA
         JEvVxNES31E/LSzQ+ILSaxlp5jFdI3zOKm/4vGts+rJrl4AC3nRXMvVz9JuJG6/q3pBo
         Hi9tceyxilGjyuaC8FfW+4aBSLE5DDt4QewdpSv2NJvHWdk6VY2O/ZzAcFA9Mc16B9x7
         zbnRGo0TSCxOmulYWb7aQYY5RfyNS7f1+1FcgxB7RI0PGyV3NbTc0XsafirkZejsy3/u
         9tKw==
X-Gm-Message-State: AFqh2kqo4xcbqHJ3on0yxSvLyTiOVnPvvMZrVK6ZK3yNpAFKo3kNOqdF
	o27WVqhYEGLBBi1Az3fbCdHZbVBvrvkQdQAE/UM=
X-Google-Smtp-Source: AMrXdXvWt1cjen4CiCMz2qPnbU9PjjyUTchbwPDRfiDzPvwBQ0UeTa18fiRBG101Xj+L9W55nIRHfwOxHLmUcrX03KY=
X-Received: by 2002:a05:6808:120a:b0:364:bd84:ca34 with SMTP id
 a10-20020a056808120a00b00364bd84ca34mr1580555oil.262.1674517107619; Mon, 23
 Jan 2023 15:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20230119042724.1413857-1-raj.khem@gmail.com> <a42ac89e-a844-6790-ad68-d5f7852b4e87@ventanamicro.com>
In-Reply-To: <a42ac89e-a844-6790-ad68-d5f7852b4e87@ventanamicro.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jan 2023 15:38:01 -0800
Message-ID: <CAMKF1so-ZMwLME=bVp+w85RhyP8APxSJ1okcCWxsJ4zkODX6ZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] binutils: Upgrade to 2.40 release
To: Jeff Law <jlaw@ventanamicro.com>
Cc: openembedded-core@lists.openembedded.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alejandro Hernandez <aehs29@gmail.com>, 
	Richard Purdie <rpurdie@rpsys.net>, Nelson Chu <nelson@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 23:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176318

On Thu, Jan 19, 2023 at 9:25 AM Jeff Law <jlaw@ventanamicro.com> wrote:
>
>
>
> On 1/18/23 21:27, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v1 -> v2:
> > - Fix build on mingw
> > - Backport fix to build with --disable-gdb
> [ ... ]
> Note I think this is going to run afoul of grub2 mkimage.
>
> In binutils-2.40 the assembler for risc-v was changed to use CALL_PLT
> relocations rather than CALL relocations.  grub2 does not handle
> CALL_PLT relocations which in turn will cause a failure when
> grub2-mkimage is used on risc-v.
>
> As far as I can tell, the assembler change literally just changes the
> relocation number, they are otherwise treated the same.  So I think
> grub2 can be fixed by just treating R_RISCV_CALL_PLT just like
> R_RISCV_CALL in kern/riscv/dl.c.
>
> Nelson, can you confirm that all your assembler change did was change
> the relocation used in the resultant object?

The binutils change is here
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=70f35d72ef04cd23771875c1661c9975044a749c

I tried something like this

http://sprunge.us/ZjpFCI

I still get
| grub-mkimage: error: relocation 0x13 is not implemented yet.

need to look more.

>
> Jeff

