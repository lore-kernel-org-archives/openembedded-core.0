Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEA5C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 12:28:31 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web12.7595.1652444909011378155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 05:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gjsQtlX2;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id d132so4151596vke.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XpJW8gB0M+h4+sKHsZ0Chgu3D/YbcHyx+YK4HtR2psI=;
        b=gjsQtlX2ng5iIQu6iv8FdEd66cLQrRy8BYavGN4Ix7IYYG6MolHZasGZVpNQtMg+HR
         yRcH+UeKyxxKbnoyB51ATLLj5emhpkHydWZ2/+3q2Y54Rl48BT2CCDk9y69Tdqi22MVK
         hsGYuIj8uAl2OmCTh9YHiavYkhi88pJWtqs2RDOIy+qgblDi7YRLBTch9XRmAlb74K2D
         Cy4brc+9INqRTmHIMHE9SpTjokuZMuHruX6XIAV1yjm0/jJh+cTieTLQMwbnx0bFT+sH
         TRccMLPgshQyE96UGG0AqNra4MmtwvxI9zJZjgBi7yffQOd01saAIbZ/VfL05EH5fOFi
         i0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XpJW8gB0M+h4+sKHsZ0Chgu3D/YbcHyx+YK4HtR2psI=;
        b=TxFJGTYqJ/UGe+LnGYKWotxHIJFySI4EMj3eWm6dDoIGgiwOrhgVeL5glhnM8+7D7X
         6Cl2lXqzNgOyvatC0vp6yxE2YjIwnvTjQLOJO07MBIJtz44E6TkHncDe78WosEEz3a6Q
         gL8rhPWxzU7RcwbztdMnpSjq6ZDQkheP1wz6PghCmBtzHX00gsgFbpUN6NqaKCjWA8ZZ
         4TYsUode4siOlJLJq2vvDp7WFtbSRZd0T9m9phkA1Ko1iCJrg03iEKZ6E0hklz3f4XQe
         Wj0qODxCMNm2tVWAyzPYwNqUTPin2cBhrAAtOEQzYI9gkMIg6D3bvVRsdBIW1AykRuHN
         PgcA==
X-Gm-Message-State: AOAM530xSZWCWVJrDI22WBlWehiEc3h4x+EKVga+hnbhlShFrJ5SA6tD
	P0uhC0Uvo38dWvHmtrxDoq6otEKDyGy1YO6VymI=
X-Google-Smtp-Source: 
 ABdhPJz8G7Gx6nMhdKNG7AL9tEYPqgoCT2QB+R4toKjBo2UpgTw4IZqkzmTtVmTUVS82Y0zlz2YqvQFR1cExyEXIsSo=
X-Received: by 2002:ac5:c7a1:0:b0:34e:98f9:88c3 with SMTP id
 d1-20020ac5c7a1000000b0034e98f988c3mr1987831vkn.15.1652444908018; Fri, 13 May
 2022 05:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220502080851.40753-1-pgowda.cve@gmail.com>
 <20220502223054.3aa3ecd5@melee>
 <CALY4986U078AV7xgvpCr+Ev7sQDNW1RQymM=iPDgfN1-r29zuQ@mail.gmail.com>
In-Reply-To: 
 <CALY4986U078AV7xgvpCr+Ev7sQDNW1RQymM=iPDgfN1-r29zuQ@mail.gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Fri, 13 May 2022 17:58:17 +0530
Message-ID: 
 <CALY49869zPf6F8UELEue+9BvyToT=W=hGqSRtazXZW+zPO5c=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 12:28:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165557

Hi Luca,

I have checked it again at my end and it seems to be working fine.
The error is related to "setup NFS mount on target" and does not seem
to be related to the patch.
Can the patch be included again while running oe-selftest and checked?

Thanks,
Pgowda

On Thu, May 5, 2022 at 3:55 PM pgowda cve <pgowda.cve@gmail.com> wrote:
>
> Hi Luca,
>
> Thanks for providing the build error details with the patch.
> I did a run of the provided test after applying the patch and found
> that it runs successfully.
> Please find the details of the log that were run successfully.
>
> ============================================================================================
> 2022-05-05 00:28:57,451 - oe-selftest - INFO - RESULTS -
> gcc.GxxCrossSelfTestSystemEmulated.test_cross_gxx: PASSED (1137.41s)
> 2022-05-05 00:28:57,451 - oe-selftest - INFO - RESULTS -
> glibc.GlibcSelfTestSystemEmulated.test_glibc: PASSED (41315.04s)
> 2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
> meta_ide.MetaIDE.test_meta_ide_can_build_cpio_project: PASSED (53.59s)
> 2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
> meta_ide.MetaIDE.test_meta_ide_can_compile_c_program: PASSED (0.35s)
> 2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
> meta_ide.MetaIDE.test_meta_ide_had_installed_meta_ide_support: PASSED
> (0.01s)
> 2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
> runqemu.QemuTest.test_qemu_can_shutdown: PASSED (30.84s)
> 2022-05-05 00:28:57,452 - oe-selftest - INFO - RESULTS -
> gcc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (4.00s)
> 2022-05-05 00:28:59,823 - oe-selftest - INFO - SUMMARY:
> 2022-05-05 00:28:59,824 - oe-selftest - INFO - oe-selftest () - Ran 15
> tests in 49960.164s
> 2022-05-05 00:28:59,824 - oe-selftest - INFO - oe-selftest - OK - All
> required tests passed (successes=14, skipped=1, failures=0, errors=0)
> ============================================================================================
>
> I did a run of the following command in latest Poky sources after
> applying the patch:-
> oe-selftest -a -t machine -t toolchain-system
>
> pgowda@ala-lpggp3:/pgowda/check$ uname -a
> Linux 5.4.0-107-generic #121~18.04.1-Ubuntu SMP Thu Mar 24 17:21:33
> UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
>
> The following error was seen in the log provided which triggered the failure.
> However, I could not see the issue when I ran the Oe-selftest.
>
> Exception: Failed to setup NFS mount on target ('mount: mounting
> 192.168.7.13:/home/pokybuild/yocto-worker/qemux86-64/build/build-st-1441279/tmp/work
> on /home/pokybuild/yocto-worker/qemux86-64/build/build-st-1441279/tmp/work
> failed: Input/output error')
>
> Can you please provide me with the details of the environment to check
> and reproduce the issue?
>
> Thanks
> Pgowda
>
> On Tue, May 3, 2022 at 2:00 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> >
> > Hi Pgowda,
> >
> > Il giorno Mon,  2 May 2022 01:08:51 -0700
> > "Pgowda" <pgowda.cve@gmail.com> ha scritto:
> >
> > > While running lib32-glibc-tests, it fails with the following error
> > > as the recipe is not PROVIDED. BBCLASSEXTEND is cleaned in glibc-tests
> > > and is not able to recognize the multilibs.
> > >
> > > ERROR: Nothing PROVIDES 'lib32-glibc-tests'
> > >
> > > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> >
> > It seems like this patch is triggering some build error:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100/steps/19/logs/stdio
> >
> >
> >
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

