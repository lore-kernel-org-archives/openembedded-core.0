Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFABC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 23:00:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.226.1668553231431590843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 15:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PABvjToo;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id be13so26838061lfb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 15:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqBjB1QcNqp1tBPdHIoHHw+Fu1HpJj6TLZMA1P6CtmI=;
        b=PABvjTooEtVv79V25t/zUETHLtvJE2Pr45zYTTjXbQNasY/zIvFTtoxLi7NbRzP3tL
         fizZQ3JNC2vl6Ibp4ucdX987eftLsztxevytrcivzpgdrfjQYs5YdtjbiG9x1Xv3RgeU
         rw8eFjO9XIV/uYQt/NDXOP+zFVgJU3GpGZLC5IO6JLolabGFstsbnSQ0KbjVFJRyejz+
         XbyCG4KEjBZpKSgfvga5AIvF6CSroOqbB2iezACOWwAL3p5k5g6s3M/ycHHlbwQ5srYz
         GcpLpBd6LiJZiPk61GMTo73TyXhGPS+uw4Eny7p5FVHOZMXt7yugQ4fYSyuGKfNoK9hF
         baXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqBjB1QcNqp1tBPdHIoHHw+Fu1HpJj6TLZMA1P6CtmI=;
        b=TrMMDTogchgVS8A2PRCxdS5rze2Tp7XiSgQTvJzXR5dCqf1szz+OuiLCHa/hn/9sz9
         W+Xt2+o0Hy8CuQjjik48z9DMBp2Wt1W3AKEMec7w7wvB8Fb2QUFStcJtjyDAlljNp81l
         cFQiITSyH6MryR2i1ObxX0jss1CLptJ8N4W1s89tbUOjKQ/xaKPIHheIIX1RkCOscG93
         gROa3edl4w7thh0HvSZkXilML3bTeOkRVqolKX273eOp6yI3Vb+vEY1WzCNuov2f9Yq/
         rpB30dGulyV+urcnNdbWOuNYwSUwjsEIU41PTRReWhjtEd73rAUD16BQnIXaCm8tW7px
         8Ijw==
X-Gm-Message-State: ANoB5pkrqDq3hAZch1je1+5COMqTE482MT1X+GQ8DHws0uufqvLUj9IF
	kZVFt9CnK/iK9gOM/knidMx6+URcOdxfNQ/vCHO2QBz0
X-Google-Smtp-Source: AA0mqf4rBr1ztw/kOWPFO8vGmTKqa542mwK6XTZ7d77wdBestZEUmoWiOhNU6JEzdbDXXoJ10Ac38DohydhROtZ2GLA=
X-Received: by 2002:a05:6512:3d22:b0:4a9:39f4:5793 with SMTP id
 d34-20020a0565123d2200b004a939f45793mr6708196lfv.131.1668553228991; Tue, 15
 Nov 2022 15:00:28 -0800 (PST)
MIME-Version: 1.0
References: <010101847b65242b-7ada2629-2407-4e9f-973b-fbf4ff65a256-000000@us-west-2.amazonses.com>
 <CANx9H-AWcmsiQmEppDvEJCvuFFeZJ9mBw87MEF8sDp8t0N0hQA@mail.gmail.com>
In-Reply-To: <CANx9H-AWcmsiQmEppDvEJCvuFFeZJ9mBw87MEF8sDp8t0N0hQA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Nov 2022 00:00:17 +0100
Message-ID: <CANNYZj9-gPZM0pCORbKUi2f9ogvS-BOucigw=aaPg0F4sTJC7A@mail.gmail.com>
Subject: Re: [OE-core] [AUH] webkitgtk: upgrading to 2.38.2 FAILED
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 23:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173361

Thanks, once you get it all into a shape that can be given to the AB
test matrix, I can add your patches to my branch.

Alex

On Tue, 15 Nov 2022 at 23:51, Tim Orling <ticotimo@gmail.com> wrote:
>
> Ugly working branch
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/at-spi2-core_2.46=
.0
>
> Dropped some patches. Refreshed some patches. Replace atk/at-spi2-atk wit=
h at-spi2-core.
> Fails in do_compile (and all the various configuration options not explor=
ed yet).
>
> On Tue, Nov 15, 2022 at 5:06 AM Auto Upgrade Helper <auh@yoctoproject.org=
> wrote:
>>
>> Hello,
>>
>> this email is a notification from the Auto Upgrade Helper
>> that the automatic attempt to upgrade the recipe *webkitgtk* to *2.38.2*=
 has Failed (devtool error).
>>
>> Detailed error information:
>>
>> The following devtool command failed:  upgrade webkitgtk -V 2.38.2
>> NOTE: Starting bitbake server...
>> NOTE: Reconnecting to bitbake server...
>> NOTE: Retrying server connection (#1)...
>> WARNING: Host distribution "almalinux-8.7" has not been validated with t=
his version of the build system; you may possibly experience unexpected fai=
lures. It is recommended that you use a tested distribution.
>> Loading cache...done.
>> Loaded 1665 entries from dependency cache.
>>
>> Summary: There was 1 WARNING message.
>> WARNING: Host distribution "almalinux-8.7" has not been validated with t=
his version of the build system; you may possibly experience unexpected fai=
lures. It is recommended that you use a tested distribution.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           =3D "2.2.0"
>> BUILD_SYS            =3D "x86_64-linux"
>> NATIVELSBSTRING      =3D "universal"
>> TARGET_SYS           =3D "x86_64-poky-linux"
>> MACHINE              =3D "qemux86-64"
>> DISTRO               =3D "poky"
>> DISTRO_VERSION       =3D "4.1"
>> TUNE_FEATURES        =3D "m64 core2"
>> TARGET_FPU           =3D ""
>> meta
>> meta-poky
>> meta-yocto-bsp       =3D "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14d8=
2b9123e434f"
>> workspace            =3D "master:1a8272f40f071fda3b2039e433cee6fa6e42d78=
3"
>>
>> Initialising tasks...done.
>> Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 20 (100% mat=
ch, 100% complete)
>> NOTE: Executing Tasks
>> NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be r=
erun and all succeeded.
>> NOTE: Writing buildhistory
>> NOTE: Writing buildhistory took: 2 seconds
>> WARNING: Host distribution "almalinux-8.7" has not been validated with t=
his version of the build system; you may possibly experience unexpected fai=
lures. It is recommended that you use a tested distribution.
>> Loading cache...done.
>> Loaded 1665 entries from dependency cache.
>> Parsing recipes...done.
>> Parsing of 888 .bb files complete (886 cached, 2 parsed). 1666 targets, =
36 skipped, 0 masked, 0 errors.
>>
>> Summary: There was 1 WARNING message.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           =3D "2.2.0"
>> BUILD_SYS            =3D "x86_64-linux"
>> NATIVELSBSTRING      =3D "universal"
>> TARGET_SYS           =3D "x86_64-poky-linux"
>> MACHINE              =3D "qemux86-64"
>> DISTRO               =3D "poky"
>> DISTRO_VERSION       =3D "4.1"
>> TUNE_FEATURES        =3D "m64 core2"
>> TARGET_FPU           =3D ""
>> meta
>> meta-poky
>> meta-yocto-bsp       =3D "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14d8=
2b9123e434f"
>> workspace            =3D "master:1a8272f40f071fda3b2039e433cee6fa6e42d78=
3"
>>
>> Initialising tasks...done.
>> Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 16 (100% mat=
ch, 100% complete)
>> NOTE: Executing Tasks
>> NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be re=
run and all succeeded.
>> NOTE: Writing buildhistory
>> NOTE: Writing buildhistory took: 2 seconds
>> DEBUG 5 [Errno 25] Inappropriate ioctl for device
>> Adding changed files:   0% |                                   | ETA:  -=
-:--:--
>> Adding changed files:   0% |                                   | ETA:  -=
-:--:--
>> Adding changed files:   0% |                                    | ETA:  =
0:00:29
>> Adding changed files:   1% |                                    | ETA:  =
0:00:20
>> Adding changed files:   2% |                                    | ETA:  =
0:00:17
>> Adding changed files:   3% |#                                   | ETA:  =
0:00:16
>> Adding changed files:   3% |#                                   | ETA:  =
0:00:15
>> Adding changed files:   4% |#                                   | ETA:  =
0:00:14
>> Adding changed files:   5% |#                                   | ETA:  =
0:00:13
>> Adding changed files:   6% |##                                  | ETA:  =
0:00:13
>> Adding changed files:   6% |##                                  | ETA:  =
0:00:13
>> Adding changed files:   7% |##                                  | ETA:  =
0:00:12
>> Adding changed files:   8% |###                                 | ETA:  =
0:00:12
>> Adding changed files:   9% |###                                 | ETA:  =
0:00:12
>> Adding changed files:   9% |###                                 | ETA:  =
0:00:12
>> Adding changed files:  10% |###                                 | ETA:  =
0:00:12
>> Adding changed files:  11% |####                                | ETA:  =
0:00:11
>> Adding changed files:  12% |####                                | ETA:  =
0:00:11
>> Adding changed files:  13% |####                                | ETA:  =
0:00:11
>> Adding changed files:  13% |####                                | ETA:  =
0:00:11
>> Adding changed files:  14% |#####                               | ETA:  =
0:00:11
>> Adding changed files:  15% |#####                               | ETA:  =
0:00:11
>> Adding changed files:  16% |#####                               | ETA:  =
0:00:11
>> Adding changed files:  16% |######                              | ETA:  =
0:00:10
>> Adding changed files:  17% |######                              | ETA:  =
0:00:10
>> Adding changed files:  18% |######                              | ETA:  =
0:00:10
>> Adding changed files:  19% |######                              | ETA:  =
0:00:10
>> Adding changed files:  19% |#######                             | ETA:  =
0:00:10
>> Adding changed files:  20% |#######                             | ETA:  =
0:00:10
>> Adding changed files:  21% |#######                             | ETA:  =
0:00:10
>> Adding changed files:  22% |#######                             | ETA:  =
0:00:10
>> Adding changed files:  22% |########                            | ETA:  =
0:00:10
>> Adding changed files:  23% |########                            | ETA:  =
0:00:09
>> Adding changed files:  24% |########                            | ETA:  =
0:00:09
>> Adding changed files:  25% |#########                           | ETA:  =
0:00:09
>> Adding changed files:  26% |#########                           | ETA:  =
0:00:09
>> Adding changed files:  26% |#########                           | ETA:  =
0:00:09
>> Adding changed files:  27% |#########                           | ETA:  =
0:00:09
>> Adding changed files:  28% |##########                          | ETA:  =
0:00:09
>> Adding changed files:  29% |##########                          | ETA:  =
0:00:09
>> Adding changed files:  29% |##########                          | ETA:  =
0:00:09
>> Adding changed files:  30% |###########                         | ETA:  =
0:00:09
>> Adding changed files:  31% |###########                         | ETA:  =
0:00:09
>> Adding changed files:  32% |###########                         | ETA:  =
0:00:09
>> Adding changed files:  32% |###########                         | ETA:  =
0:00:08
>> Adding changed files:  33% |############                        | ETA:  =
0:00:08
>> Adding changed files:  34% |############                        | ETA:  =
0:00:08
>> Adding changed files:  35% |############                        | ETA:  =
0:00:08
>> Adding changed files:  35% |############                        | ETA:  =
0:00:08
>> Adding changed files:  36% |#############                       | ETA:  =
0:00:08
>> Adding changed files:  37% |#############                       | ETA:  =
0:00:08
>> Adding changed files:  38% |#############                       | ETA:  =
0:00:08
>> Adding changed files:  39% |##############                      | ETA:  =
0:00:08
>> Adding changed files:  39% |##############                      | ETA:  =
0:00:08
>> Adding changed files:  40% |##############                      | ETA:  =
0:00:08
>> Adding changed files:  41% |##############                      | ETA:  =
0:00:08
>> Adding changed files:  42% |###############                     | ETA:  =
0:00:08
>> Adding changed files:  42% |###############                     | ETA:  =
0:00:07
>> Adding changed files:  43% |###############                     | ETA:  =
0:00:07
>> Adding changed files:  44% |###############                     | ETA:  =
0:00:07
>> Adding changed files:  45% |################                    | ETA:  =
0:00:07
>> Adding changed files:  45% |################                    | ETA:  =
0:00:07
>> Adding changed files:  46% |################                    | ETA:  =
0:00:07
>> Adding changed files:  47% |#################                   | ETA:  =
0:00:07
>> Adding changed files:  48% |#################                   | ETA:  =
0:00:07
>> Adding changed files:  49% |#################                   | ETA:  =
0:00:07
>> Adding changed files:  49% |#################                   | ETA:  =
0:00:07
>> Adding changed files:  50% |##################                  | ETA:  =
0:00:07
>> Adding changed files:  51% |##################                  | ETA:  =
0:00:07
>> Adding changed files:  52% |##################                  | ETA:  =
0:00:06
>> Adding changed files:  52% |###################                 | ETA:  =
0:00:06
>> Adding changed files:  53% |###################                 | ETA:  =
0:00:06
>> Adding changed files:  54% |###################                 | ETA:  =
0:00:06
>> Adding changed files:  55% |###################                 | ETA:  =
0:00:06
>> Adding changed files:  55% |####################                | ETA:  =
0:00:06
>> Adding changed files:  56% |####################                | ETA:  =
0:00:06
>> Adding changed files:  57% |####################                | ETA:  =
0:00:06
>> Adding changed files:  58% |####################                | ETA:  =
0:00:06
>> Adding changed files:  58% |#####################               | ETA:  =
0:00:06
>> Adding changed files:  59% |#####################               | ETA:  =
0:00:06
>> Adding changed files:  60% |#####################               | ETA:  =
0:00:05
>> Adding changed files:  61% |######################              | ETA:  =
0:00:05
>> Adding changed files:  62% |######################              | ETA:  =
0:00:05
>> Adding changed files:  62% |######################              | ETA:  =
0:00:05
>> Adding changed files:  63% |######################              | ETA:  =
0:00:05
>> Adding changed files:  64% |#######################             | ETA:  =
0:00:05
>> Adding changed files:  65% |#######################             | ETA:  =
0:00:05
>> Adding changed files:  65% |#######################             | ETA:  =
0:00:05
>> Adding changed files:  66% |#######################             | ETA:  =
0:00:05
>> Adding changed files:  67% |########################            | ETA:  =
0:00:04
>> Adding changed files:  68% |########################            | ETA:  =
0:00:04
>> Adding changed files:  68% |########################            | ETA:  =
0:00:04
>> Adding changed files:  69% |#########################           | ETA:  =
0:00:04
>> Adding changed files:  70% |#########################           | ETA:  =
0:00:04
>> Adding changed files:  71% |#########################           | ETA:  =
0:00:04
>> Adding changed files:  71% |#########################           | ETA:  =
0:00:04
>> Adding changed files:  72% |##########################          | ETA:  =
0:00:04
>> Adding changed files:  73% |##########################          | ETA:  =
0:00:04
>> Adding changed files:  74% |##########################          | ETA:  =
0:00:03
>> Adding changed files:  75% |###########################         | ETA:  =
0:00:03
>> Adding changed files:  75% |###########################         | ETA:  =
0:00:03
>> Adding changed files:  76% |###########################         | ETA:  =
0:00:03
>> Adding changed files:  77% |###########################         | ETA:  =
0:00:03
>> Adding changed files:  78% |############################        | ETA:  =
0:00:03
>> Adding changed files:  78% |############################        | ETA:  =
0:00:03
>> Adding changed files:  79% |############################        | ETA:  =
0:00:03
>> Adding changed files:  80% |############################        | ETA:  =
0:00:03
>> Adding changed files:  81% |#############################       | ETA:  =
0:00:02
>> Adding changed files:  81% |#############################       | ETA:  =
0:00:02
>> Adding changed files:  82% |#############################       | ETA:  =
0:00:02
>> Adding changed files:  83% |##############################      | ETA:  =
0:00:02
>> Adding changed files:  84% |##############################      | ETA:  =
0:00:02
>> Adding changed files:  85% |##############################      | ETA:  =
0:00:02
>> Adding changed files:  85% |##############################      | ETA:  =
0:00:02
>> Adding changed files:  86% |###############################     | ETA:  =
0:00:02
>> Adding changed files:  87% |###############################     | ETA:  =
0:00:01
>> Adding changed files:  88% |###############################     | ETA:  =
0:00:01
>> Adding changed files:  88% |###############################     | ETA:  =
0:00:01
>> Adding changed files:  89% |################################    | ETA:  =
0:00:01
>> Adding changed files:  90% |################################    | ETA:  =
0:00:01
>> Adding changed files:  91% |################################    | ETA:  =
0:00:01
>> Adding changed files:  91% |#################################   | ETA:  =
0:00:01
>> Adding changed files:  92% |#################################   | ETA:  =
0:00:01
>> Adding changed files:  93% |#################################   | ETA:  =
0:00:01
>> Adding changed files:  94% |#################################   | ETA:  =
0:00:00
>> Adding changed files:  94% |##################################  | ETA:  =
0:00:00
>> Adding changed files:  95% |##################################  | ETA:  =
0:00:00
>> Adding changed files:  96% |##################################  | ETA:  =
0:00:00
>> Adding changed files:  97% |################################### | ETA:  =
0:00:00
>> Adding changed files:  98% |################################### | ETA:  =
0:00:00
>> Adding changed files:  98% |################################### | ETA:  =
0:00:00
>> Adding changed files:  99% |################################### | ETA:  =
0:00:00
>> Adding changed files: 100% |####################################| Time: =
0:00:15
>>
>> INFO: Extracting current version source...
>> INFO: Extracting upgraded version source...
>> INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.38.2.tar.x=
z...
>> INFO: Rebasing devtool onto fc045ed05c0f58aebe55179808336e4990faef9b
>> WARNING: Command 'git rebase fc045ed05c0f58aebe55179808336e4990faef9b' f=
ailed:
>> CONFLICT (modify/delete): Source/cmake/FindGObjectIntrospection.cmake de=
leted in HEAD and modified in e5862811 (FindGObjectIntrospection.cmake: pre=
fix variables obtained from pkg-config with PKG_CONFIG_SYSROOT_DIR). Versio=
n e5862811 (FindGObjectIntrospection.cmake: prefix variables obtained from =
pkg-config with PKG_CONFIG_SYSROOT_DIR) of Source/cmake/FindGObjectIntrospe=
ction.cmake left in tree.
>>
>> ERROR: Execution of 'git checkout devtool' failed with exit code 1:
>> error: you need to resolve your current index first
>> Source/cmake/FindGObjectIntrospection.cmake: needs merge
>>
>>
>>
>> Please review the attached files for further information and build/updat=
e failures.
>> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter=
_bug.cgi?product=3DAutomated%20Update%20Handler
>>
>> Regards,
>> The Upgrade Helper
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#173332): https://lists.openembedded.org/g/openembedd=
ed-core/message/173332
>> Mute This Topic: https://lists.openembedded.org/mt/95042129/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [t=
icotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

