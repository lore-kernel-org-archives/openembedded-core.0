Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6132C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 20:07:15 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.1702.1668629230550668246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 12:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H9hRqnuL;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id b3so31339522lfv.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 12:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdSOX0NM2r9jk8McmJUBaT9+Pai8pua843Vk0uB/Fxs=;
        b=H9hRqnuLe5sWlrPP1PYGSy1bUgRrN0X1bFXVmgkpS6ZqsYlEyC9Bv39v1xNueSoCnS
         maKCwU6KuAI/Fd/qmUEBEqLgLhB6XkvI8tI01FVewrkuV/lPZtONyK0yQWJcDZ2w/qbB
         6pQo/pH7i6jBIBxuaDHn3g1UkhhDWBKr/zazv8aUoOQ7oFyJthOa9Tle4HRy8/uAo92b
         fU6s8ulJX8OivIWMnuF2EvSxgAjaAZuicWorgEYbSuvWyuiyyc4lAENEpGXgRbMKLRSr
         XvCCsCswqO2CiLMzv9qH0bfWIpD3MOdAqO3DNlLu6s8djmpf1DLH+JyWLwTzcZTgKZhE
         5Zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdSOX0NM2r9jk8McmJUBaT9+Pai8pua843Vk0uB/Fxs=;
        b=7w/e6iZX2sigB7vy9knAm02QK8Caz9gr02oAU6wCkxvn3D2JFOCNWf1iBUq6gFJcu0
         zLT2Tw3olr0098l6hN0xnhp9U1GHkJBDwoKoNgy5Ii0I3zuE3HZ/A2sTuzRWEL08vZxp
         lvgFZZMtlhnU+jUaYO39+u1/iypQGUcGPg10IBxQAnZebi2bJXKTaW1i1eb1TigpE0vM
         52pTvp1GJ0J2BZi8fP5JdLUXapPzynU4IsuHDB6g+uKOfYEO3s9g2goy+zjcQ50BkJQ9
         EWBMYESxpaezhSfQHKKdDMMOBOmJdCWx3fqVzSAL/uebLdqe6g2esY4ljD78ehihF5oE
         hVFg==
X-Gm-Message-State: ANoB5pmdYmBJt42kLifgcI0GQmkhibvzOvbekQBRN9xWtGEWtW0/5O/E
	ZMJJO+Ey9qIjXO6wA4Fi8keT0NLTrjTBicp/Ic4=
X-Google-Smtp-Source: AA0mqf6zypFM6jmktgs3E3Aa+nT3BUcYNUr+Yky6ZBAbVWMCy8Jfcde6SaMyEsk4054Yo39ADTF/r1VvyUSbVb2XTDY=
X-Received: by 2002:ac2:41d4:0:b0:4a2:4d53:8294 with SMTP id
 d20-20020ac241d4000000b004a24d538294mr7029417lfi.263.1668629228593; Wed, 16
 Nov 2022 12:07:08 -0800 (PST)
MIME-Version: 1.0
References: <010101847b65242b-7ada2629-2407-4e9f-973b-fbf4ff65a256-000000@us-west-2.amazonses.com>
 <CANx9H-AWcmsiQmEppDvEJCvuFFeZJ9mBw87MEF8sDp8t0N0hQA@mail.gmail.com> <1727E452F4305FA3.4983@lists.openembedded.org>
In-Reply-To: <1727E452F4305FA3.4983@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Nov 2022 21:06:56 +0100
Message-ID: <CANNYZj80=jWwQTZcgL4Ltt9HQbVvKyTR-JAymNSQjui=55aqAw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] webkitgtk: upgrading to 2.38.2 FAILED
To: alex.kanavin@gmail.com
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 20:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173390

I'm looking into webkitgtk now. Once it's sorted you can proceed with
atk I guess.

Alex

On Wed, 16 Nov 2022 at 00:00, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Thanks, once you get it all into a shape that can be given to the AB
> test matrix, I can add your patches to my branch.
>
> Alex
>
> On Tue, 15 Nov 2022 at 23:51, Tim Orling <ticotimo@gmail.com> wrote:
> >
> > Ugly working branch
> > https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/at-spi2-core_2.=
46.0
> >
> > Dropped some patches. Refreshed some patches. Replace atk/at-spi2-atk w=
ith at-spi2-core.
> > Fails in do_compile (and all the various configuration options not expl=
ored yet).
> >
> > On Tue, Nov 15, 2022 at 5:06 AM Auto Upgrade Helper <auh@yoctoproject.o=
rg> wrote:
> >>
> >> Hello,
> >>
> >> this email is a notification from the Auto Upgrade Helper
> >> that the automatic attempt to upgrade the recipe *webkitgtk* to *2.38.=
2* has Failed (devtool error).
> >>
> >> Detailed error information:
> >>
> >> The following devtool command failed:  upgrade webkitgtk -V 2.38.2
> >> NOTE: Starting bitbake server...
> >> NOTE: Reconnecting to bitbake server...
> >> NOTE: Retrying server connection (#1)...
> >> WARNING: Host distribution "almalinux-8.7" has not been validated with=
 this version of the build system; you may possibly experience unexpected f=
ailures. It is recommended that you use a tested distribution.
> >> Loading cache...done.
> >> Loaded 1665 entries from dependency cache.
> >>
> >> Summary: There was 1 WARNING message.
> >> WARNING: Host distribution "almalinux-8.7" has not been validated with=
 this version of the build system; you may possibly experience unexpected f=
ailures. It is recommended that you use a tested distribution.
> >> NOTE: Resolving any missing task queue dependencies
> >>
> >> Build Configuration:
> >> BB_VERSION           =3D "2.2.0"
> >> BUILD_SYS            =3D "x86_64-linux"
> >> NATIVELSBSTRING      =3D "universal"
> >> TARGET_SYS           =3D "x86_64-poky-linux"
> >> MACHINE              =3D "qemux86-64"
> >> DISTRO               =3D "poky"
> >> DISTRO_VERSION       =3D "4.1"
> >> TUNE_FEATURES        =3D "m64 core2"
> >> TARGET_FPU           =3D ""
> >> meta
> >> meta-poky
> >> meta-yocto-bsp       =3D "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14=
d82b9123e434f"
> >> workspace            =3D "master:1a8272f40f071fda3b2039e433cee6fa6e42d=
783"
> >>
> >> Initialising tasks...done.
> >> Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 20 (100% m=
atch, 100% complete)
> >> NOTE: Executing Tasks
> >> NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be=
 rerun and all succeeded.
> >> NOTE: Writing buildhistory
> >> NOTE: Writing buildhistory took: 2 seconds
> >> WARNING: Host distribution "almalinux-8.7" has not been validated with=
 this version of the build system; you may possibly experience unexpected f=
ailures. It is recommended that you use a tested distribution.
> >> Loading cache...done.
> >> Loaded 1665 entries from dependency cache.
> >> Parsing recipes...done.
> >> Parsing of 888 .bb files complete (886 cached, 2 parsed). 1666 targets=
, 36 skipped, 0 masked, 0 errors.
> >>
> >> Summary: There was 1 WARNING message.
> >> NOTE: Resolving any missing task queue dependencies
> >>
> >> Build Configuration:
> >> BB_VERSION           =3D "2.2.0"
> >> BUILD_SYS            =3D "x86_64-linux"
> >> NATIVELSBSTRING      =3D "universal"
> >> TARGET_SYS           =3D "x86_64-poky-linux"
> >> MACHINE              =3D "qemux86-64"
> >> DISTRO               =3D "poky"
> >> DISTRO_VERSION       =3D "4.1"
> >> TUNE_FEATURES        =3D "m64 core2"
> >> TARGET_FPU           =3D ""
> >> meta
> >> meta-poky
> >> meta-yocto-bsp       =3D "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14=
d82b9123e434f"
> >> workspace            =3D "master:1a8272f40f071fda3b2039e433cee6fa6e42d=
783"
> >>
> >> Initialising tasks...done.
> >> Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 16 (100% m=
atch, 100% complete)
> >> NOTE: Executing Tasks
> >> NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be =
rerun and all succeeded.
> >> NOTE: Writing buildhistory
> >> NOTE: Writing buildhistory took: 2 seconds
> >> DEBUG 5 [Errno 25] Inappropriate ioctl for device
> >> Adding changed files:   0% |                                   | ETA: =
 --:--:--
> >> Adding changed files:   0% |                                   | ETA: =
 --:--:--
> >> Adding changed files:   0% |                                    | ETA:=
  0:00:29
> >> Adding changed files:   1% |                                    | ETA:=
  0:00:20
> >> Adding changed files:   2% |                                    | ETA:=
  0:00:17
> >> Adding changed files:   3% |#                                   | ETA:=
  0:00:16
> >> Adding changed files:   3% |#                                   | ETA:=
  0:00:15
> >> Adding changed files:   4% |#                                   | ETA:=
  0:00:14
> >> Adding changed files:   5% |#                                   | ETA:=
  0:00:13
> >> Adding changed files:   6% |##                                  | ETA:=
  0:00:13
> >> Adding changed files:   6% |##                                  | ETA:=
  0:00:13
> >> Adding changed files:   7% |##                                  | ETA:=
  0:00:12
> >> Adding changed files:   8% |###                                 | ETA:=
  0:00:12
> >> Adding changed files:   9% |###                                 | ETA:=
  0:00:12
> >> Adding changed files:   9% |###                                 | ETA:=
  0:00:12
> >> Adding changed files:  10% |###                                 | ETA:=
  0:00:12
> >> Adding changed files:  11% |####                                | ETA:=
  0:00:11
> >> Adding changed files:  12% |####                                | ETA:=
  0:00:11
> >> Adding changed files:  13% |####                                | ETA:=
  0:00:11
> >> Adding changed files:  13% |####                                | ETA:=
  0:00:11
> >> Adding changed files:  14% |#####                               | ETA:=
  0:00:11
> >> Adding changed files:  15% |#####                               | ETA:=
  0:00:11
> >> Adding changed files:  16% |#####                               | ETA:=
  0:00:11
> >> Adding changed files:  16% |######                              | ETA:=
  0:00:10
> >> Adding changed files:  17% |######                              | ETA:=
  0:00:10
> >> Adding changed files:  18% |######                              | ETA:=
  0:00:10
> >> Adding changed files:  19% |######                              | ETA:=
  0:00:10
> >> Adding changed files:  19% |#######                             | ETA:=
  0:00:10
> >> Adding changed files:  20% |#######                             | ETA:=
  0:00:10
> >> Adding changed files:  21% |#######                             | ETA:=
  0:00:10
> >> Adding changed files:  22% |#######                             | ETA:=
  0:00:10
> >> Adding changed files:  22% |########                            | ETA:=
  0:00:10
> >> Adding changed files:  23% |########                            | ETA:=
  0:00:09
> >> Adding changed files:  24% |########                            | ETA:=
  0:00:09
> >> Adding changed files:  25% |#########                           | ETA:=
  0:00:09
> >> Adding changed files:  26% |#########                           | ETA:=
  0:00:09
> >> Adding changed files:  26% |#########                           | ETA:=
  0:00:09
> >> Adding changed files:  27% |#########                           | ETA:=
  0:00:09
> >> Adding changed files:  28% |##########                          | ETA:=
  0:00:09
> >> Adding changed files:  29% |##########                          | ETA:=
  0:00:09
> >> Adding changed files:  29% |##########                          | ETA:=
  0:00:09
> >> Adding changed files:  30% |###########                         | ETA:=
  0:00:09
> >> Adding changed files:  31% |###########                         | ETA:=
  0:00:09
> >> Adding changed files:  32% |###########                         | ETA:=
  0:00:09
> >> Adding changed files:  32% |###########                         | ETA:=
  0:00:08
> >> Adding changed files:  33% |############                        | ETA:=
  0:00:08
> >> Adding changed files:  34% |############                        | ETA:=
  0:00:08
> >> Adding changed files:  35% |############                        | ETA:=
  0:00:08
> >> Adding changed files:  35% |############                        | ETA:=
  0:00:08
> >> Adding changed files:  36% |#############                       | ETA:=
  0:00:08
> >> Adding changed files:  37% |#############                       | ETA:=
  0:00:08
> >> Adding changed files:  38% |#############                       | ETA:=
  0:00:08
> >> Adding changed files:  39% |##############                      | ETA:=
  0:00:08
> >> Adding changed files:  39% |##############                      | ETA:=
  0:00:08
> >> Adding changed files:  40% |##############                      | ETA:=
  0:00:08
> >> Adding changed files:  41% |##############                      | ETA:=
  0:00:08
> >> Adding changed files:  42% |###############                     | ETA:=
  0:00:08
> >> Adding changed files:  42% |###############                     | ETA:=
  0:00:07
> >> Adding changed files:  43% |###############                     | ETA:=
  0:00:07
> >> Adding changed files:  44% |###############                     | ETA:=
  0:00:07
> >> Adding changed files:  45% |################                    | ETA:=
  0:00:07
> >> Adding changed files:  45% |################                    | ETA:=
  0:00:07
> >> Adding changed files:  46% |################                    | ETA:=
  0:00:07
> >> Adding changed files:  47% |#################                   | ETA:=
  0:00:07
> >> Adding changed files:  48% |#################                   | ETA:=
  0:00:07
> >> Adding changed files:  49% |#################                   | ETA:=
  0:00:07
> >> Adding changed files:  49% |#################                   | ETA:=
  0:00:07
> >> Adding changed files:  50% |##################                  | ETA:=
  0:00:07
> >> Adding changed files:  51% |##################                  | ETA:=
  0:00:07
> >> Adding changed files:  52% |##################                  | ETA:=
  0:00:06
> >> Adding changed files:  52% |###################                 | ETA:=
  0:00:06
> >> Adding changed files:  53% |###################                 | ETA:=
  0:00:06
> >> Adding changed files:  54% |###################                 | ETA:=
  0:00:06
> >> Adding changed files:  55% |###################                 | ETA:=
  0:00:06
> >> Adding changed files:  55% |####################                | ETA:=
  0:00:06
> >> Adding changed files:  56% |####################                | ETA:=
  0:00:06
> >> Adding changed files:  57% |####################                | ETA:=
  0:00:06
> >> Adding changed files:  58% |####################                | ETA:=
  0:00:06
> >> Adding changed files:  58% |#####################               | ETA:=
  0:00:06
> >> Adding changed files:  59% |#####################               | ETA:=
  0:00:06
> >> Adding changed files:  60% |#####################               | ETA:=
  0:00:05
> >> Adding changed files:  61% |######################              | ETA:=
  0:00:05
> >> Adding changed files:  62% |######################              | ETA:=
  0:00:05
> >> Adding changed files:  62% |######################              | ETA:=
  0:00:05
> >> Adding changed files:  63% |######################              | ETA:=
  0:00:05
> >> Adding changed files:  64% |#######################             | ETA:=
  0:00:05
> >> Adding changed files:  65% |#######################             | ETA:=
  0:00:05
> >> Adding changed files:  65% |#######################             | ETA:=
  0:00:05
> >> Adding changed files:  66% |#######################             | ETA:=
  0:00:05
> >> Adding changed files:  67% |########################            | ETA:=
  0:00:04
> >> Adding changed files:  68% |########################            | ETA:=
  0:00:04
> >> Adding changed files:  68% |########################            | ETA:=
  0:00:04
> >> Adding changed files:  69% |#########################           | ETA:=
  0:00:04
> >> Adding changed files:  70% |#########################           | ETA:=
  0:00:04
> >> Adding changed files:  71% |#########################           | ETA:=
  0:00:04
> >> Adding changed files:  71% |#########################           | ETA:=
  0:00:04
> >> Adding changed files:  72% |##########################          | ETA:=
  0:00:04
> >> Adding changed files:  73% |##########################          | ETA:=
  0:00:04
> >> Adding changed files:  74% |##########################          | ETA:=
  0:00:03
> >> Adding changed files:  75% |###########################         | ETA:=
  0:00:03
> >> Adding changed files:  75% |###########################         | ETA:=
  0:00:03
> >> Adding changed files:  76% |###########################         | ETA:=
  0:00:03
> >> Adding changed files:  77% |###########################         | ETA:=
  0:00:03
> >> Adding changed files:  78% |############################        | ETA:=
  0:00:03
> >> Adding changed files:  78% |############################        | ETA:=
  0:00:03
> >> Adding changed files:  79% |############################        | ETA:=
  0:00:03
> >> Adding changed files:  80% |############################        | ETA:=
  0:00:03
> >> Adding changed files:  81% |#############################       | ETA:=
  0:00:02
> >> Adding changed files:  81% |#############################       | ETA:=
  0:00:02
> >> Adding changed files:  82% |#############################       | ETA:=
  0:00:02
> >> Adding changed files:  83% |##############################      | ETA:=
  0:00:02
> >> Adding changed files:  84% |##############################      | ETA:=
  0:00:02
> >> Adding changed files:  85% |##############################      | ETA:=
  0:00:02
> >> Adding changed files:  85% |##############################      | ETA:=
  0:00:02
> >> Adding changed files:  86% |###############################     | ETA:=
  0:00:02
> >> Adding changed files:  87% |###############################     | ETA:=
  0:00:01
> >> Adding changed files:  88% |###############################     | ETA:=
  0:00:01
> >> Adding changed files:  88% |###############################     | ETA:=
  0:00:01
> >> Adding changed files:  89% |################################    | ETA:=
  0:00:01
> >> Adding changed files:  90% |################################    | ETA:=
  0:00:01
> >> Adding changed files:  91% |################################    | ETA:=
  0:00:01
> >> Adding changed files:  91% |#################################   | ETA:=
  0:00:01
> >> Adding changed files:  92% |#################################   | ETA:=
  0:00:01
> >> Adding changed files:  93% |#################################   | ETA:=
  0:00:01
> >> Adding changed files:  94% |#################################   | ETA:=
  0:00:00
> >> Adding changed files:  94% |##################################  | ETA:=
  0:00:00
> >> Adding changed files:  95% |##################################  | ETA:=
  0:00:00
> >> Adding changed files:  96% |##################################  | ETA:=
  0:00:00
> >> Adding changed files:  97% |################################### | ETA:=
  0:00:00
> >> Adding changed files:  98% |################################### | ETA:=
  0:00:00
> >> Adding changed files:  98% |################################### | ETA:=
  0:00:00
> >> Adding changed files:  99% |################################### | ETA:=
  0:00:00
> >> Adding changed files: 100% |####################################| Time=
: 0:00:15
> >>
> >> INFO: Extracting current version source...
> >> INFO: Extracting upgraded version source...
> >> INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.38.2.tar=
.xz...
> >> INFO: Rebasing devtool onto fc045ed05c0f58aebe55179808336e4990faef9b
> >> WARNING: Command 'git rebase fc045ed05c0f58aebe55179808336e4990faef9b'=
 failed:
> >> CONFLICT (modify/delete): Source/cmake/FindGObjectIntrospection.cmake =
deleted in HEAD and modified in e5862811 (FindGObjectIntrospection.cmake: p=
refix variables obtained from pkg-config with PKG_CONFIG_SYSROOT_DIR). Vers=
ion e5862811 (FindGObjectIntrospection.cmake: prefix variables obtained fro=
m pkg-config with PKG_CONFIG_SYSROOT_DIR) of Source/cmake/FindGObjectIntros=
pection.cmake left in tree.
> >>
> >> ERROR: Execution of 'git checkout devtool' failed with exit code 1:
> >> error: you need to resolve your current index first
> >> Source/cmake/FindGObjectIntrospection.cmake: needs merge
> >>
> >>
> >>
> >> Please review the attached files for further information and build/upd=
ate failures.
> >> Any problem please file a bug at https://bugzilla.yoctoproject.org/ent=
er_bug.cgi?product=3DAutomated%20Update%20Handler
> >>
> >> Regards,
> >> The Upgrade Helper
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173361): https://lists.openembedded.org/g/openembedde=
d-core/message/173361
> Mute This Topic: https://lists.openembedded.org/mt/95042129/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

