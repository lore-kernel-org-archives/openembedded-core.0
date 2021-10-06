Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E37C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 11:20:09 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.10473.1633519207964912560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iEnukO86;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id x7so8465276edd.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/miCOuOEBEJlvZ6UseNnpSNzgP5oyo8F3pircrlRTc=;
        b=iEnukO86IdeOj5qJnTIeCrvBaTfJT8mbYXtFSaVFSz912eW/5qcqLqelRX/rQl3KnA
         XkOB+hwLRXpDwLOIB3bPy5ql3SlPmRPmCgnU0b9QvOsEMaSXgO/slvXGrNiYoFyW42fz
         N+H3y+xWkp8nvZJLl91VNwJaooaVHauNHL3UO8GiXBxR9TSqbMYTC3AWfSJFoT+rkkRU
         BdWwDrYxKJBFvSfYpCjSwv3h8dJtd8zpAVFcCnGPMcPDzl5huucKqjMA96wYC8TM/5HV
         zTEI8NKAcBncuJmAPUcXrCODtTvS0okIXyVEeI5eFcV3noDpxNvHD6v2QOwkEgVXiVsl
         XO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/miCOuOEBEJlvZ6UseNnpSNzgP5oyo8F3pircrlRTc=;
        b=Fpa0B5eUjvrWuaFD0T1lnn8Nzmbq5VHPfpNFyWjBhZaTJSMl2Rggg87DZ5JRv8koK7
         mG7ONJ/PQEcr+7X7t8f5TzXIe1JHVYZz2O9Mcm2tffR4asQI1K2+ik/C/0zXPo0+Lah8
         18Fg4ZXHVz1htqZ/rqS6SALXIOXeajNh50uIqLNWoS6GGo3W9TYNnP+aG5XHyicP/zSp
         qvzYxXid0unqfMrW0ZvALawO890yStC89PppYLpPM8RqVay+R5QbxAxWXTXM45ltWSsN
         SelAb/2CKZTL8B/fW95rpsY5gIVHTPc/Evph2Qb6Uw5+a3MFuZaghWiEVkPiEnyvvtWg
         xULw==
X-Gm-Message-State: AOAM531rLVGclBR5Hj2bxhklxwgDN0/DBwUAROZjiDlkBrhzZsojDyFT
	7P5PuAvzTq1BTBnrUizvbeS2bodFDYNrnOzjL/M=
X-Google-Smtp-Source: 
 ABdhPJx36WPxv25Fy8V7NyLDvlNJWf52DcmiDCtxIwgcTEn1ZqYmSulgj0KJfAD5DkLfzGuTydx7Y+r7eXu4kYII34o=
X-Received: by 2002:a17:906:fca5:: with SMTP id
 qw5mr9217812ejb.315.1633519206125;
 Wed, 06 Oct 2021 04:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
 <CAAnfSTsLvK-Hm47UNQ7M6iB34P73t3cb11PM3qRGVUGfSuJfRA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTsLvK-Hm47UNQ7M6iB34P73t3cb11PM3qRGVUGfSuJfRA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Oct 2021 08:19:55 -0300
Message-ID: 
 <CADkTA4N-dCkAOe1=soaHUgBfoS8r=FEsCaYiki0WP_SsK4EWfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 11:20:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156690

On Wed, Oct 6, 2021 at 7:42 AM Ross Burton <ross@burtonini.com> wrote:
>
> I should have put this in the commit message, but here's the failure
> when using an external toolchain:
>
> 2021-10-05 12:52:14 - INFO - | HOSTCXX
> scripts/gcc-plugins/arm_ssp_per_task_plugin.so
> 2021-10-05 12:52:14 - INFO - | In file included from
> /builds/engineering/yocto/meta-arm/work/build/tmp/work-shared/fvp-base-arm32/kernel-source/scripts/gcc-plugins/gcc-common.h:103,
> 2021-10-05 12:52:14 - INFO - | from
> /builds/engineering/yocto/meta-arm/work/build/tmp/work-shared/fvp-base-arm32/kernel-source/scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
> 02021-10-05 12:52:14 - INFO - |
> /builds/persist/toolchains/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf/bin/../lib/gcc/arm-none-linux-gnueabihf/10.3.1/plugin/include/builtins.h:23:10:
> fatal error: mpc.h: No such file or directory
> 2021-10-05 12:52:14 - INFO - | #include <mpc.h>
> 2021-10-05 12:52:14 - INFO - | ^~~~~~~
> 2021-10-05 12:52:14 - INFO - | compilation terminated.

Aha. Yes, that does tell the story. I knew it had to be a compilation
failure, since that is how I picked up the other DEPENDS.

Did we want to tweak the commit message and add linux-yocto-dev to the
patch ? I can have go at that if you want.

Bruce

>
> On Wed, 6 Oct 2021 at 11:12, Ross Burton <ross@burtonini.com> wrote:
> >
> > On Wed, 6 Oct 2021 at 11:10, Ross Burton <ross@burtonini.com> wrote:
> > > This depends on CONFIG_GCC_PLUGINS which I don't believe is enabled in
> > > any of the default configurations.  meta-arm builds a few kernels with
> > > defconfig, which does.
> >
> > Sorry, brain still not warmed up yet.
> >
> > CONFIG_GCC_PLUGINS needs to be enabled, but the real difference is
> > that using the normal GCC pulls libmpc into the sysroot via implicit
> > dependencies.  If you use an external toolchain (like
> > meta-arm-toolchain) this doesn't happen, and the dependency needs to
> > be explicit.
> >
> > Ross



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

