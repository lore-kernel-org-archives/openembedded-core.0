Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C8AC433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:03:29 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.10644.1651849405411289254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g3jBp6vP;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id x17so13048647lfa.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5xzoh1X0sdY45swu1q9wuaOIQH6K6rgtPMRC6C2hSYU=;
        b=g3jBp6vP10/0nvZuoenwLC6h0JKcGhFnzAT4iW79tFNr05wpFGFMQzs3/tec/aNKkC
         WkvUgKMf0JjCu4hWorbIqJ3B8ljU9OdrA4BJPxnD4AWdm2WN6WF3GscoKOZGZg9t+Apc
         FJ2YWD+U3McrUP5LDmC8cIJ+lyzN305P25fdiSevvz7s666eATHei2h573tKBkPNqQwj
         TsN5Cps3LNVAJWprjPMDncTxeq+irZv7qGr/y4p4h5E+XZuRXQf0aLBm8thQGaTnAH6x
         Ypov+/1AmxPWXZl2EyIdMgGojuNbrXtfvMEwrZIa5g24V9yKzpsIgL4JhtzbR89lV2K7
         ApSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5xzoh1X0sdY45swu1q9wuaOIQH6K6rgtPMRC6C2hSYU=;
        b=kpVRvOmI+KhC0Lg0hrL3vAZXqerJsBtrg5gArhpd64ynp6FW7HLuuQsHOeZHIAUPDX
         lNCTfe8y53r7VB5IAtQQ1kc7sbdVYvlLfbabNoO8FK47rn2hYecwLR6XdGpQA2b4zNbO
         +JVuB+4LgTLC9K+kkOtjIoq8X2jU7DRCw61uxiNWqxObRPXQxWzM0yybssy0od+b3Zvs
         X1vAvmRlaMItB17/WL/LJZE0KnSrRRS4iRfTgqOyfkke6Wdcjz+U9awSiT70/2aRnkbN
         uxymTVLDlXkWkDG6ZVpkcxSklxUerlHH+qEC5VwobmtH3GkL7CppQMCU2++Yan9Plr9O
         tGGA==
X-Gm-Message-State: AOAM533MFYve+PCYNbneqxlksm9Wz23qft9MjAFIthboamquY0y9x34s
	xuuIu5XQE41FV8LZIDDPWMjqvxLCPUiQCC4L8so=
X-Google-Smtp-Source: 
 ABdhPJydZu8U7jQI+r6/Lwunn6EMirn2sG4ne+itjpN5IhGkTtz2HBfn1RCQ/8d+D8WzFMY1iSX8bh8ei7xm+Klc2xI=
X-Received: by 2002:a05:6512:2353:b0:473:d801:6e3c with SMTP id
 p19-20020a056512235300b00473d8016e3cmr2810564lfu.26.1651849403434; Fri, 06
 May 2022 08:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220506064155.2106140-1-alex@linutronix.de>
 <20220506064155.2106140-2-alex@linutronix.de>
 <20220506165155.1b255652@melee>
In-Reply-To: <20220506165155.1b255652@melee>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 May 2022 17:03:12 +0200
Message-ID: 
 <CANNYZj9w_+MTAKkNL1cRqiUQww3BeEKUiGcya9HU7-Qxv1LoUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] python3-setuptools: upgrade 59.5.0 ->
 62.1.0
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Tim Orling <ticotimo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 15:03:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165339

On Fri, 6 May 2022 at 16:51, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > This was held by numpy rejecting setuptools >= 60.x,
> > however they added a workaround in recent point releases
> > and so the upgrade can proceed.
> >
> This patch causes many AB failures like this:
>
> | error: #error "LONG_BIT definition appears wrong for platform (bad
> gcc/glibc config?)
>
> and this:
>
> | checking for Python.h... no
> | configure: error: python version 3 probe support requested but not
> found
>
> Some logs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/5159/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/45/steps/20/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5204/steps/15/logs/stdio

Thanks Luca, I only ran this through on basic qemux86-64.

Tim, can you pick this up and get it to mergeable condition?

Alex

