Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043B9C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:17:18 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web12.11697.1660051028428936670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 06:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HNgFQUfe;
 spf=pass (domain: gmail.com, ip: 209.85.161.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id
 n16-20020a4a9550000000b0043568f1343bso2104747ooi.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 06:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=jqgVoyRc9Fmc4S41x9CfFdyY4Bl3VXO1FAO67UecFdw=;
        b=HNgFQUfeVOB7tauZvJTFHnYJfS29KyIdTn1lYrY4mQ2C9dbQyfCf2bXzk1pQKn3KvC
         aAmMMIvwCjGselkVFVLuRVBP+JoMFjHZBvcywOHqD+lh5bAOrzIExqLKxdaLajDLwpHs
         C3e2hplLGJPEAno/Ge1L6nxGjV+Y3amdzASB/WTux7OVidEVEAUSMNdWRj5JbFgu7tU+
         Sv8EMJmtaGX/oVnQdrdT3Hz4WpL8hudIVeQsoZawuFM+ldNj/q0OssOQFlAgiF2ikNh7
         Jb+Sn6LiBOXFI++lzLSYeuMw36pBqPxjVqeWVwFvU8vaH173Nmwoq8dKYnrRW2pbp4Z6
         Ud8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=jqgVoyRc9Fmc4S41x9CfFdyY4Bl3VXO1FAO67UecFdw=;
        b=zoz1kuqMxD4HkELm9QHjV+F+17hUVLdfzkezxliksAD0/ZeddkwVTFab8t1x4hnBQX
         vzKkZVuv3pvgX+Fob4xO9vZgNwsnBJ9Ytr4LVVGsfNqDkrSOMyup/0i/GGJ6L9Wrfaif
         nUBguPCeErm/sqFirnAMR+qG6Hv9QcfTbgM0B5JCCq9Lsr76ze+tR5ZbJ0FvrAczV280
         pZ9pOHTOdY4b8TIO6p8h7idoFDLzMQeYck+qjuYWRE1DuYR9x0CMLgNJzM/3UilYQWAd
         CnHJ7bhKR0VRnHSqqvgeR5nT4GrvDqnA3BV/Vw+p77kvwizbH8O48dy8Cx51GLGS6078
         SaJA==
X-Gm-Message-State: ACgBeo1SJ2aycnYytPR5/bSsQPANzhd+WfN4fFgM5hlMspU+h62pT3UF
	ztE0v7xExWmm4wfUMs7nOH08YIQNu9sooBdGDVM=
X-Google-Smtp-Source: 
 AA6agR62OfCj0Eg2A9MQ96Ycnx2SA14FNGnmQK6TZiDww8EK67pJImTE9NbUjeZEO0H8oZYpB6cfxhsD7DlELHzfmiQ=
X-Received: by 2002:a4a:3312:0:b0:448:9102:ef64 with SMTP id
 q18-20020a4a3312000000b004489102ef64mr437369ooq.63.1660051026134; Tue, 09 Aug
 2022 06:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220809111449.192321-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220809111449.192321-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 09:16:54 -0400
Message-ID: 
 <CADkTA4MBRL7JuLA8D32K1_CcyDMcRO=hfJyghPHyUZtwKw-nqA@mail.gmail.com>
Subject: Re: [PATCH] kern-devsrc: Drop auto.conf creation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 13:17:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169148

On Tue, Aug 9, 2022 at 7:14 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> After this commit in the mainline kernel, the quoting is different in auto.conf
> compared to .config:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=129ab0d2d9f38b9d43df35235fc66c6740d6928b
>
> We therefore can't just copy one over the other or it leads to syntax/quoting
> errors. We end up running make prepare anyway in all our tests so drop
> this copy for fix 5.19 kernels.

It is safe to stop doing this manipulation now.

But I am curious, I was running on-target tests for 5.19+ and didn't
have any issues, what is breaking that I managed to miss ?

There is a risk that if the .cmd files start regenerating because of
this missing, or the different timestamp, that we'll have issues. But
putting it through the AB should show us if that is true.

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index a38d35e82ae..46d706b955f 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -308,9 +308,6 @@ do_install() {
>      # external modules can be built
>      touch -r $kerneldir/build/Makefile $kerneldir/build/include/generated/uapi/linux/version.h
>
> -    # Copy .config to include/config/auto.conf so "make prepare" is unnecessary.
> -    cp $kerneldir/build/.config $kerneldir/build/include/config/auto.conf
> -
>      # make sure these are at least as old as the .config, or rebuilds will trigger
>      touch -r $kerneldir/build/.config $kerneldir/build/include/generated/autoconf.h 2>/dev/null || :
>      touch -r $kerneldir/build/.config $kerneldir/build/include/config/auto.conf* 2>/dev/null || :
> --
> 2.34.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

