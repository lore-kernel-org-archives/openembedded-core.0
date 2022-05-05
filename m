Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551DEC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 10:25:46 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.9282.1651746336222089788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 03:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I1UOt0YU;
 spf=pass (domain: gmail.com, ip: 209.85.217.45,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id c62so3734647vsc.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2FuVcNlCB4FPQpqCKDxLTacg+sSDIZb8iflrN6Ibfc=;
        b=I1UOt0YUZtYtdIDETX9LPcL7ywOkd7oxnnoJXi7DrpXR/I6OhB0bBdz0/BPGhOyiM0
         Ie8Wo1Diwt9dlFf6OiFcTdNHCG9EB+gWJx3xe0+N5Ef3WQAEvs0Fea6igdMcGWyR7A4m
         QSP1SCme9GINMjMLF3rErGDDr1O6BgmRrqBuksNvA3WoaklvciNO66lGg4GRvfd6Td/A
         lY3ejELE9fDSKUJ7fNSVH7MctEIU4zSwoNr+jvMHnHdxnQun0yoc9bsjdLzz2wkhIb3y
         UyI9hTsWpx1dbiUVeeUpU1SQZ9dgOpezMJMnj6KoRiXwhI06dmOd6BMNTF5pYE8B+0sc
         kPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2FuVcNlCB4FPQpqCKDxLTacg+sSDIZb8iflrN6Ibfc=;
        b=Pd8oAHrExHjad6L61s6dhyMwWDNbZThQwtX78/nelw9CmxkQtcnNtAGQkSZjmWZqt1
         /EDhmhFp+1sobwViT++OqpmL/Pv0GnNiU/cGzHgihXP8/CGW3z0v6Dymsi014nJZdqgb
         4F4UdnGc15066MJSdcC0L5jFz3VZW1jXrzQYgKEozr7gSrqK+ZRnOaXCSEFNN01W3Fpf
         ijYqs9KSdrWlAEauaITcWDu3hktzv7nGbpZyj7S8ORmNE+xIopZOa5k/1P9IMi4LMQ1K
         o/23SIr5nb6y8TqG9yxJS4Zj0A3bN+xhfpcXtCNGiM51CF+dD+c1cRpj5VQurriVvOIJ
         Pr9g==
X-Gm-Message-State: AOAM532u7iONLc3DyFbbKjjEpQb7aaj9gB9RLAFEud10w0/dQovy2IRK
	ub/L8eQW3QcIqDiRoMrfEa+UZY5fR4NIuu/NA1o=
X-Google-Smtp-Source: 
 ABdhPJwIdnAwV16NAReG1D89dfGGEvpDIhtVFGLn3/2bCo3o+KeORANbS23PipIeFo8gDuRDYAWp/0ocdY1ZJTOD4Ps=
X-Received: by 2002:a67:f343:0:b0:32c:c4b7:e238 with SMTP id
 p3-20020a67f343000000b0032cc4b7e238mr7421657vsm.77.1651746335314; Thu, 05 May
 2022 03:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220502080851.40753-1-pgowda.cve@gmail.com>
 <20220502223054.3aa3ecd5@melee>
In-Reply-To: <20220502223054.3aa3ecd5@melee>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 5 May 2022 15:55:25 +0530
Message-ID: 
 <CALY4986U078AV7xgvpCr+Ev7sQDNW1RQymM=iPDgfN1-r29zuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 10:25:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165295

Hi Luca,

Thanks for providing the build error details with the patch.
I did a run of the provided test after applying the patch and found
that it runs successfully.
Please find the details of the log that were run successfully.

============================================================================================
2022-05-05 00:28:57,451 - oe-selftest - INFO - RESULTS -
gcc.GxxCrossSelfTestSystemEmulated.test_cross_gxx: PASSED (1137.41s)
2022-05-05 00:28:57,451 - oe-selftest - INFO - RESULTS -
glibc.GlibcSelfTestSystemEmulated.test_glibc: PASSED (41315.04s)
2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
meta_ide.MetaIDE.test_meta_ide_can_build_cpio_project: PASSED (53.59s)
2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
meta_ide.MetaIDE.test_meta_ide_can_compile_c_program: PASSED (0.35s)
2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
meta_ide.MetaIDE.test_meta_ide_had_installed_meta_ide_support: PASSED
(0.01s)
2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
runqemu.QemuTest.test_qemu_can_shutdown: PASSED (30.84s)
2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
gcc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (4.00s)
2022-05-05 00:28:59,823 - oe-selftest - INFO - SUMMARY:
2022-05-05 00:28:59,824 - oe-selftest - INFO - oe-selftest () - Ran 15
tests in 49960.164s
2022-05-05 00:28:59,824 - oe-selftest - INFO - oe-selftest - OK - All
required tests passed (successes=14, skipped=1, failures=0, errors=0)
============================================================================================

I did a run of the following command in latest Poky sources after
applying the patch:-
oe-selftest -a -t machine -t toolchain-system

pgowda@ala-lpggp3:/pgowda/check$ uname -a
Linux 5.4.0-107-generic #121~18.04.1-Ubuntu SMP Thu Mar 24 17:21:33
UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

The following error was seen in the log provided which triggered the failure.
However, I could not see the issue when I ran the Oe-selftest.

Exception: Failed to setup NFS mount on target ('mount: mounting
192.168.7.13:/home/pokybuild/yocto-worker/qemux86-64/build/build-st-1441279/tmp/work
on /home/pokybuild/yocto-worker/qemux86-64/build/build-st-1441279/tmp/work
failed: Input/output error')

Can you please provide me with the details of the environment to check
and reproduce the issue?

Thanks
Pgowda

On Tue, May 3, 2022 at 2:00 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Pgowda,
>
> Il giorno Mon,  2 May 2022 01:08:51 -0700
> "Pgowda" <pgowda.cve@gmail.com> ha scritto:
>
> > While running lib32-glibc-tests, it fails with the following error
> > as the recipe is not PROVIDED. BBCLASSEXTEND is cleaned in glibc-tests
> > and is not able to recognize the multilibs.
> >
> > ERROR: Nothing PROVIDES 'lib32-glibc-tests'
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
>
> It seems like this patch is triggering some build error:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100/steps/19/logs/stdio
>
>
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

