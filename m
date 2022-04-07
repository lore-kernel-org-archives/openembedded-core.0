Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688CCC38A2C
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.3219.1649361386031770739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UtKzeZgn;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id q14so8800335ljc.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Awuo+m758yikU8GaiDDoOK7gLFHe0PX1t1gaV0QX6rI=;
        b=UtKzeZgnjphMmbjON3ocgUtEji9Uf1cKbtJksUXnZmpqRCxUd/MGEt9Dy3HGYDz8g9
         WZkUtozF1EklR8piBsCUKsODLspDwZqzdH+QbdvI/wxXu3k2XvJX6atj5M2GQIAxZkK7
         v0t0S3ifofIvYOjCQO8e2zJpr4R+c5yc2Tsji2j0/lKvGtu6aCcfod+A3PC39dXu3Ip6
         xPb8+r2Bnau7/KHI1p26kNh5yif+5EadVIifNoPVtCbCSOnTMjeRcRnSPV5eIuruDVeF
         njvBP/2wX5VmX+gbmBQkwzrO+as4EfEzT4k2wZ1C18O99DCz0h6U1EQjZPQ6k9H6rqhR
         BQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Awuo+m758yikU8GaiDDoOK7gLFHe0PX1t1gaV0QX6rI=;
        b=798nPRS+g3atTBXS9BgOi3CjwD+AKUHDX0OQbHTrsMT7IXHL4lncAOW4UlfwmFCnOr
         RvPk3GL9ChiAJ6VPu3Z9w7Hn8zMkcMapFyp5rMI8y92HUO7gfVrdcowNKaYLyPAE4WNc
         bAMSJEPmwQsRqCdN12lK4qtArGekM+iNur6/P7nM4wmvtTzOdHe/zLMU1OaRipDKNNec
         +YJoh2u/z2LQb07Z8urZsPjT95vHsbgh9ZkNwLASjMNYQEBrAhld9lyVU/MQPOv69WN2
         KlrFo3LUOSgPU36amWlVXsq7pJ6RNXXJD9phNM9snh9DBnDYnRzQcHo+Dk8JKpNdtPuT
         cuaQ==
X-Gm-Message-State: AOAM531GRLICZONBp7PSyKICnVXIBM4VtrbbFjr1/Z9M1XTD538q0aPy
	C/+uMuc8gcASYgWQBkp2cjcQw9lN0myh1KOzCG8=
X-Google-Smtp-Source: 
 ABdhPJwOVZdRsFdST1C1WmcgH/YLmn6PDm8YOkyp+v41/6fJMmBwVC5B8S4J0w2bVuBMe74lOdsV2KyIPoEExH3QUeQ=
X-Received: by 2002:a2e:888a:0:b0:249:8e84:65b8 with SMTP id
 k10-20020a2e888a000000b002498e8465b8mr9718275lji.56.1649361383912; Thu, 07
 Apr 2022 12:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220407170029.3500874-1-alex@linutronix.de>
 <20220407170029.3500874-15-alex@linutronix.de>
 <CAMKF1sokAXdALgcSES3XFPcMchgOPVD75ZgFY-fXd3zmVFXoWg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sokAXdALgcSES3XFPcMchgOPVD75ZgFY-fXd3zmVFXoWg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Apr 2022 21:56:12 +0200
Message-ID: 
 <CANNYZj8zVRRUjTXqCnxOfsqZr0VOE1YSWMEhUaGRoAsCYtf81Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/17] libgcrypt: upgrade 1.9.4 -> 1.10.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164139

On Thu, 7 Apr 2022 at 21:46, Khem Raj <raj.khem@gmail.com> wrote:
>
> Using -pthread is preferred,to let compiler driver decide the order
> and other dependencies( if any) to be added
> dependending upon platform etc.

I added a chunk to the patch which was already using -lpthread - this
needs to be fixed separately.

