Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C98C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 08:18:22 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web08.8995.1656490702337114527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 01:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nqdaKnGH;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id r15so5442743uaf.13;
        Wed, 29 Jun 2022 01:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IHARH70W41JuFwWkmES+zLItm2jxi3mRnfMUXI9Qleo=;
        b=nqdaKnGH3vHYzQ7W0IZhoXmmBRE1SepYXwxApehKHWJpTx6ZB48pepCfoWSlam2XNg
         L7i5gGNLg8jZGUHoyOnNvLhzBxgjFbczTxBvLOBbvKF5h0GYiAUtp7yiEDEmW+ZqbZvS
         r/TQjcYrfdvEAv5hZ97VocsMTy7n3h+8COqZqIHVRM3Be2hGPa/UYSEDpqBCdlMdxmZD
         mrzqvr/yBq3kV4/cWiq5BWAST+8/Pn+jspesxNm/GMft+FBiUsKvHQU9J3VIQZ1FmHGk
         e2SbYnDbutKB63LYgSw9imQQeCrdgf/c8bmZgjDY/DwASb3EPsOJr1v4boYgMgOPC5U1
         gfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IHARH70W41JuFwWkmES+zLItm2jxi3mRnfMUXI9Qleo=;
        b=SAljqbkaD7Lyhp1dl/GZ/JVrnbu0YQ5qs9OPbXDRryXmqnDG+0gpj2v0EoVHQg56AQ
         taqFWfEQsGjWKhuRIn4qJts9rEjjnGot8A7TR1Gl1p+Km7Iy9EVjorjf1pZob0Tbfo7n
         kkbTduJNUXVkyREzqPXXWAcXSt0iCS04s3d/AI9/nzuqKv6pppesWDPeJ0wdW6I5LX9+
         DwhlKY8ZrgqgTgmXqAHKjQGt4GuYokZXyBTYJ7cF69KHmK9T7atdNdtTVwEh+OWgGKmz
         vDh58SFnYpEcDlSTBNfCvfd5EVV2P1VGi7cOhNJVaQ0+7gfAmebRQMjQTMLhLnRwsvGg
         96bQ==
X-Gm-Message-State: AJIora/tScs5ohzIz8ljDPsuLiYhXFWMZ7vqsAGpldiLCTBXKLG5AsWL
	06ilZx86vFTV9jERa8Ngdc1f862vroXElOC9j1c=
X-Google-Smtp-Source: 
 AGRyM1snfKcZdx01ok6ApNwQ6tx3gmrVxSc1Z2FNe0Jbj8fRRpnDtieeFdh3XUgcYHP5RlLxR6d3RtPOAzbmyGvlylw=
X-Received: by 2002:ab0:300b:0:b0:381:f97a:eb24 with SMTP id
 f11-20020ab0300b000000b00381f97aeb24mr603756ual.13.1656490701306; Wed, 29 Jun
 2022 01:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220524225603.50d60963@melee>
 <20220525043258.8949-1-pgowda.cve@gmail.com>
 <16F24A16BC7F056F.12338@lists.openembedded.org>
 <20220531150529.705390b9@melee>
 <CALY4986aY-X5V2-fcOU+3bovF=kB9t7Uvrh8b_rcqH-pQE9J-w@mail.gmail.com>
 <a3fa5681be1c935b9137ad5c1a8de1c311d0c346.camel@linuxfoundation.org>
In-Reply-To: 
 <a3fa5681be1c935b9137ad5c1a8de1c311d0c346.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Wed, 29 Jun 2022 13:48:10 +0530
Message-ID: 
 <CALY4984nxJD1Nj8WwweQQ8LkwRFvOg0XBwAWvNUoufc0EnLFPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 08:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167369

Hi Richard,

Thanks very much for pointing that out.
I could reproduce the issue on the docker host that does not contain zlib-devel.
Trying to analyse the issue on dependency of zlib.
It would be helpful if you could give some pointers on zlib dependency
as it would have been seen in other recipes as well.
It would help us in fixing the issue appropriately.

Thanks,
Pgowda

On Mon, Jun 6, 2022 at 2:21 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-06-03 at 18:37 +0530, pgowda cve wrote:
> > Hi Luca,
> >
> > Regarding the issue
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14818
> >
> > I ran the Oe-Selftest for Rust as well as completed packages and did
> > not come across any issues.
> > a@yow-fedora-builder1 build]$ uname -a
> > Linux yow-fedora-builder1 5.16.18-200.fc35.x86_64 #1 SMP PREEMPT Mon
> > Mar 28 14:10:07 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
> >
> > The log of tests can be seen as follows:-
> > The command used to run the test was as mentioned in the Bugzilla.
> > oe-selftest -a -t machine -t toolchain-system -j 15
> >
> > test_libatomic: PASSED (113.76s)
> > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > gcc.GccLibGompSelfTestSystemEmulated.test_libgomp: PASSED (637.21s)
> > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > gcc.GccLibItmSelfTestSystemEmulated.test_libitm: PASSED (133.31s)
> > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > gcc.GccLibStdCxxSelfTestSystemEmulated.test_libstdcxx: PASSED
> > (2546.63s)
> > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > gcc.GxxCrossSelfTestSystemEmulated.test_cross_gxx: PASSED (744.56s)
> > 2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
> > glibc.GlibcSelfTestSystemEmulated.test_glibc: PASSED (1101.43s)
> > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > meta_ide.MetaIDE.test_meta_ide_can_build_cpio_project: PASSED (54.33s)
> > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > meta_ide.MetaIDE.test_meta_ide_can_compile_c_program: PASSED (0.19s)
> > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > meta_ide.MetaIDE.test_meta_ide_had_installed_meta_ide_support: PASSED
> > (0.01s)
> > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > runqemu.QemuTest.test_qemu_can_shutdown: PASSED (45.98s)
> > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > rust.RustSelfTestSystemEmulated.test_rust: PASSED (8381.70s)
> > 2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
> > gcc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (3.92s)
> > 2022-06-03 08:39:22,336 - oe-selftest - INFO - SUMMARY:
> > 2022-06-03 08:39:22,336 - oe-selftest - INFO - oe-selftest () - Ran 16
> > tests in 19613.479s
> > 2022-06-03 08:39:22,336 - oe-selftest - INFO - oe-selftest - OK - All
> > required tests passed (successes=15, skipped=1, failures=0, errors=0)
> >
> > I also ran the Rust Oe-Selftest individually and did not find any issues.
> > Can you please share the environment file so that I can reproduce and
> > fix the issue?
>
> There isn't any magic environment we can share here I'm afraid. We
> don't know why it happens on some autobuilder workers and not on
> others, this is something we need to investigate and fix. This is one
> of the challenges of these "intermittent" issues.
>
> The errors seem to relate to zlib so it may be worth looking at whether
> host headers influence the rust build and those may be causing some
> kind of determinism issue. You may have to build the binaries one a
> system with the headers, then run them on a system without for example.
>
> Cheers,
>
> Richard
>
>
>

