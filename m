Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8E9C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 23:59:39 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.2902.1652140771166993182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 16:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bnlKFgna;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id n10so2183246qvi.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 16:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OefUoJINz8ggjw/n4zbDSkiCi5H67/Y46OEq90CkdmU=;
        b=bnlKFgnatUx3T73Nodzx5MG2EY2kTOI9H4y0asARWSE5Mn1mbwDWLK6oVgBQBIeu9w
         Uqx6jsWUm+3devg+2TbjjqZWxH0jJ29IwWWtRA3vrUk4OkKlg5eFxa6LHlEy66zguF/K
         fQT8TdT2zYBJRbp+BpR2YbC/roqKHvgjWHCDdbJezTJXZVVTwq68hI/LUfY1I3qOrBds
         ZVFHhzEKJ0oB6Nh3LeRaFxsWKGulAc7ebTcnHE2g/j/r4nF8d8I7LZJiF7lqsk0kXurh
         miV0CWaIvrvJKCfBJosps0jXjpOP1JZ7fUAEKK5gagHCMHoSumlRDlREko9u0J0vJiw+
         m1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OefUoJINz8ggjw/n4zbDSkiCi5H67/Y46OEq90CkdmU=;
        b=WeMDb/igjAa9HfQzn0E/RH8wuWfmkRQnaHHkaCB6f3y+/u5dCio1CReM3y/iHoFTxx
         9IwAKgwl58KK/g+ib2htFA5Q0QknNwuu5o0JyPvatvHRghAJrcTcqo5I+eHrOuoalLWI
         IPiwIjM/hnrtvxJBPSSHI/tZ0/WSfo6iVCz2c53TmAZX6OVYiEuvFk+DslWJKjD4acjE
         MbsACtus2KZhtlCnIIU9WHG6X4D2TJFnlbWhrgMXMiWBH3TWUBUrg41wbz0pqctiYjZp
         NZOnmj+9hMO1ftlP/twtJ/50PttnibNcQRa7yn0M7ZQMUH+zYRVqilfL+pn6LEVGVG+S
         647A==
X-Gm-Message-State: AOAM530KRNvlj6Is6x684PHIp09SX6b30zWoe3/9sqiAtTo6ncgbRnV8
	ZTnRGM0wK8AFnBy8v5GjDhgMtHmr02msxC8rNAkqDQK9MEo=
X-Google-Smtp-Source: 
 ABdhPJyoUNcGgEHHu8B5R8PF3dm3v0+llqlhZ+RJlSy2QbUV9C5kMoArQ0fZMFcxwM3zM0EegzFmtJU0PMhBxqE1k8M=
X-Received: by 2002:ad4:5dca:0:b0:45a:c70d:294e with SMTP id
 m10-20020ad45dca000000b0045ac70d294emr16034702qvh.16.1652140770077; Mon, 09
 May 2022 16:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220508003820.1120893-1-raj.khem@gmail.com>
 <20220509233931.2d4bbf0b@melee>
In-Reply-To: <20220509233931.2d4bbf0b@melee>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 May 2022 16:59:02 -0700
Message-ID: 
 <CAMKF1sofg6oc_gKhWZ_RtVqLiH5ZwwfLvO9Y+2=dAfMRSAonmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: upgrade 11.3 -> 12.1
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 23:59:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165407

On Mon, May 9, 2022 at 2:39 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> Il giorno Sat,  7 May 2022 17:38:20 -0700
> "Khem Raj" <raj.khem@gmail.com> ha scritto:
>
> > Major gcc release with lot of changes [2]
> >
> > - Add patch to re-shuffle include of sched.h to fix build on musl
> > - porting guide to gcc 12 [1]
> > - Fix version in maintainers entry
> >
> > [1] https://gcc.gnu.org/gcc-12/porting_to.html
> > [2] https://gcc.gnu.org/gcc-12/changes.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> We have a xen-tools build failure on meta-virt with this patch applied:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/60/steps/13/logs/stdio
>
> and the same build succeeds without that patch:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/61/steps/13/logs/stdio

yeah this has been taken care in meta-virtualization/master this
morning. So please give it another
spin.

>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

