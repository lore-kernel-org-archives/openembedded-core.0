Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE483C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 22:51:19 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.129.1668552670851535041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 14:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JKJj+c9T;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id n12so39825433eja.11
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 14:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Krk32coslIegt7Lc53m1XIMUL8qhbTdWFnO8uoWsTMY=;
        b=JKJj+c9TYb1acWXMbJVXYVkQ8YEkvvejyUaaA6puuEh8DvF/rrGqinxpWaEVla48nB
         0qlHxx1yMBe0eh7O0M6Ou6rcfJl3ygPkHOYrCJgHaJKpYf+ZggZMxwrom5RwHprQJpb/
         U/m0+8mZT8DXutn4CoobeDg4igybrpB5X1sDQdiEp2NMsZB90K2MPUFF6ezU/TungVfE
         N2cJD2o/KnBBBL63/NW9k2dvEPKLfSTKomcjK1r5Cwqwe12p58GKF4GlKOSYo6nFH3yh
         kmFjulCT9l/ZaHG+0tostP7II1/ouEe5U1SBso9LmwdIAscnRdyflBZZJMbeuHXvJitY
         qMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Krk32coslIegt7Lc53m1XIMUL8qhbTdWFnO8uoWsTMY=;
        b=7l4bgJfYe3sHKksa+VAXc5z1l5RtedKCj6Kcy2Q7DaipxuMEo8YrwYAPDAutp1pnDF
         34lObJ+t15ZoYz+POQzz+uBJqNx+8yzKCb0F3os4L0RIrMRMATtYlSeK/WndeA/ncfR6
         cdyOflFcR/N8kjKzFEqDb30TnZo9G9gu6B5HWW+1ThzhNqc/1m5MKbjbV3hrm+3eLaRi
         J/dawNIlgdIDPi5rL9XQTPCqjHM9xwLW0ONvLtJTJOs2XZ1hNywdm+sf6jXmjZN8Oa9G
         s/KPuyhnL7PAsY5kpgDSTEdeLVtM8W5rLsvTZhXFGYJ3QqzhKaS3BgZI+I/YEy8nHtW+
         xXyQ==
X-Gm-Message-State: ANoB5pmWu2UFWne8o5qC3Qj5ul4Rooc5GBvdHYjz/zeW4FZP7NwwWgmD
	rPFN3s5eKseZmetCK/0yb9CL6p8R4J3ZsPE3Qck=
X-Google-Smtp-Source: AA0mqf5ol3KK9pNH6j8/ldtgwHCvLMh2HQ2E6zqLmkWNzBfuufKAzolSK+dNr4LPKxS/UwZiF2PG73+sT3ECC0AWRiY=
X-Received: by 2002:a17:906:c082:b0:7ad:f43a:cb0a with SMTP id
 f2-20020a170906c08200b007adf43acb0amr15036621ejz.560.1668552669148; Tue, 15
 Nov 2022 14:51:09 -0800 (PST)
MIME-Version: 1.0
References: <010101847b65242b-7ada2629-2407-4e9f-973b-fbf4ff65a256-000000@us-west-2.amazonses.com>
In-Reply-To: <010101847b65242b-7ada2629-2407-4e9f-973b-fbf4ff65a256-000000@us-west-2.amazonses.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 15 Nov 2022 14:50:57 -0800
Message-ID: <CANx9H-AWcmsiQmEppDvEJCvuFFeZJ9mBw87MEF8sDp8t0N0hQA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] webkitgtk: upgrading to 2.38.2 FAILED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000022399a05ed8a3185"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 22:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173360

--00000000000022399a05ed8a3185
Content-Type: text/plain; charset="UTF-8"

Ugly working branch
https://git.yoctoproject.org/poky-contrib/log/?h=timo/at-spi2-core_2.46.0

Dropped some patches. Refreshed some patches. Replace atk/at-spi2-atk with
at-spi2-core.
Fails in do_compile (and all the various configuration options not explored
yet).

On Tue, Nov 15, 2022 at 5:06 AM Auto Upgrade Helper <auh@yoctoproject.org>
wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *webkitgtk* to *2.38.2*
> has Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  upgrade webkitgtk -V 2.38.2
> NOTE: Starting bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)...
> WARNING: Host distribution "almalinux-8.7" has not been validated with
> this version of the build system; you may possibly experience unexpected
> failures. It is recommended that you use a tested distribution.
> Loading cache...done.
> Loaded 1665 entries from dependency cache.
>
> Summary: There was 1 WARNING message.
> WARNING: Host distribution "almalinux-8.7" has not been validated with
> this version of the build system; you may possibly experience unexpected
> failures. It is recommended that you use a tested distribution.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.2.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "4.1"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       =
> "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14d82b9123e434f"
> workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"
>
> Initialising tasks...done.
> Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 20 (100%
> match, 100% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
> WARNING: Host distribution "almalinux-8.7" has not been validated with
> this version of the build system; you may possibly experience unexpected
> failures. It is recommended that you use a tested distribution.
> Loading cache...done.
> Loaded 1665 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 888 .bb files complete (886 cached, 2 parsed). 1666 targets, 36
> skipped, 0 masked, 0 errors.
>
> Summary: There was 1 WARNING message.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.2.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "4.1"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       =
> "tmp-auh-upgrades:bea53ab800f953d65f03cdf5c14d82b9123e434f"
> workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"
>
> Initialising tasks...done.
> Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 16 (100%
> match, 100% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
> DEBUG 5 [Errno 25] Inappropriate ioctl for device
> Adding changed files:   0% |                                   | ETA:
> --:--:--
> Adding changed files:   0% |                                   | ETA:
> --:--:--
> Adding changed files:   0% |                                    | ETA:
> 0:00:29
> Adding changed files:   1% |                                    | ETA:
> 0:00:20
> Adding changed files:   2% |                                    | ETA:
> 0:00:17
> Adding changed files:   3% |#                                   | ETA:
> 0:00:16
> Adding changed files:   3% |#                                   | ETA:
> 0:00:15
> Adding changed files:   4% |#                                   | ETA:
> 0:00:14
> Adding changed files:   5% |#                                   | ETA:
> 0:00:13
> Adding changed files:   6% |##                                  | ETA:
> 0:00:13
> Adding changed files:   6% |##                                  | ETA:
> 0:00:13
> Adding changed files:   7% |##                                  | ETA:
> 0:00:12
> Adding changed files:   8% |###                                 | ETA:
> 0:00:12
> Adding changed files:   9% |###                                 | ETA:
> 0:00:12
> Adding changed files:   9% |###                                 | ETA:
> 0:00:12
> Adding changed files:  10% |###                                 | ETA:
> 0:00:12
> Adding changed files:  11% |####                                | ETA:
> 0:00:11
> Adding changed files:  12% |####                                | ETA:
> 0:00:11
> Adding changed files:  13% |####                                | ETA:
> 0:00:11
> Adding changed files:  13% |####                                | ETA:
> 0:00:11
> Adding changed files:  14% |#####                               | ETA:
> 0:00:11
> Adding changed files:  15% |#####                               | ETA:
> 0:00:11
> Adding changed files:  16% |#####                               | ETA:
> 0:00:11
> Adding changed files:  16% |######                              | ETA:
> 0:00:10
> Adding changed files:  17% |######                              | ETA:
> 0:00:10
> Adding changed files:  18% |######                              | ETA:
> 0:00:10
> Adding changed files:  19% |######                              | ETA:
> 0:00:10
> Adding changed files:  19% |#######                             | ETA:
> 0:00:10
> Adding changed files:  20% |#######                             | ETA:
> 0:00:10
> Adding changed files:  21% |#######                             | ETA:
> 0:00:10
> Adding changed files:  22% |#######                             | ETA:
> 0:00:10
> Adding changed files:  22% |########                            | ETA:
> 0:00:10
> Adding changed files:  23% |########                            | ETA:
> 0:00:09
> Adding changed files:  24% |########                            | ETA:
> 0:00:09
> Adding changed files:  25% |#########                           | ETA:
> 0:00:09
> Adding changed files:  26% |#########                           | ETA:
> 0:00:09
> Adding changed files:  26% |#########                           | ETA:
> 0:00:09
> Adding changed files:  27% |#########                           | ETA:
> 0:00:09
> Adding changed files:  28% |##########                          | ETA:
> 0:00:09
> Adding changed files:  29% |##########                          | ETA:
> 0:00:09
> Adding changed files:  29% |##########                          | ETA:
> 0:00:09
> Adding changed files:  30% |###########                         | ETA:
> 0:00:09
> Adding changed files:  31% |###########                         | ETA:
> 0:00:09
> Adding changed files:  32% |###########                         | ETA:
> 0:00:09
> Adding changed files:  32% |###########                         | ETA:
> 0:00:08
> Adding changed files:  33% |############                        | ETA:
> 0:00:08
> Adding changed files:  34% |############                        | ETA:
> 0:00:08
> Adding changed files:  35% |############                        | ETA:
> 0:00:08
> Adding changed files:  35% |############                        | ETA:
> 0:00:08
> Adding changed files:  36% |#############                       | ETA:
> 0:00:08
> Adding changed files:  37% |#############                       | ETA:
> 0:00:08
> Adding changed files:  38% |#############                       | ETA:
> 0:00:08
> Adding changed files:  39% |##############                      | ETA:
> 0:00:08
> Adding changed files:  39% |##############                      | ETA:
> 0:00:08
> Adding changed files:  40% |##############                      | ETA:
> 0:00:08
> Adding changed files:  41% |##############                      | ETA:
> 0:00:08
> Adding changed files:  42% |###############                     | ETA:
> 0:00:08
> Adding changed files:  42% |###############                     | ETA:
> 0:00:07
> Adding changed files:  43% |###############                     | ETA:
> 0:00:07
> Adding changed files:  44% |###############                     | ETA:
> 0:00:07
> Adding changed files:  45% |################                    | ETA:
> 0:00:07
> Adding changed files:  45% |################                    | ETA:
> 0:00:07
> Adding changed files:  46% |################                    | ETA:
> 0:00:07
> Adding changed files:  47% |#################                   | ETA:
> 0:00:07
> Adding changed files:  48% |#################                   | ETA:
> 0:00:07
> Adding changed files:  49% |#################                   | ETA:
> 0:00:07
> Adding changed files:  49% |#################                   | ETA:
> 0:00:07
> Adding changed files:  50% |##################                  | ETA:
> 0:00:07
> Adding changed files:  51% |##################                  | ETA:
> 0:00:07
> Adding changed files:  52% |##################                  | ETA:
> 0:00:06
> Adding changed files:  52% |###################                 | ETA:
> 0:00:06
> Adding changed files:  53% |###################                 | ETA:
> 0:00:06
> Adding changed files:  54% |###################                 | ETA:
> 0:00:06
> Adding changed files:  55% |###################                 | ETA:
> 0:00:06
> Adding changed files:  55% |####################                | ETA:
> 0:00:06
> Adding changed files:  56% |####################                | ETA:
> 0:00:06
> Adding changed files:  57% |####################                | ETA:
> 0:00:06
> Adding changed files:  58% |####################                | ETA:
> 0:00:06
> Adding changed files:  58% |#####################               | ETA:
> 0:00:06
> Adding changed files:  59% |#####################               | ETA:
> 0:00:06
> Adding changed files:  60% |#####################               | ETA:
> 0:00:05
> Adding changed files:  61% |######################              | ETA:
> 0:00:05
> Adding changed files:  62% |######################              | ETA:
> 0:00:05
> Adding changed files:  62% |######################              | ETA:
> 0:00:05
> Adding changed files:  63% |######################              | ETA:
> 0:00:05
> Adding changed files:  64% |#######################             | ETA:
> 0:00:05
> Adding changed files:  65% |#######################             | ETA:
> 0:00:05
> Adding changed files:  65% |#######################             | ETA:
> 0:00:05
> Adding changed files:  66% |#######################             | ETA:
> 0:00:05
> Adding changed files:  67% |########################            | ETA:
> 0:00:04
> Adding changed files:  68% |########################            | ETA:
> 0:00:04
> Adding changed files:  68% |########################            | ETA:
> 0:00:04
> Adding changed files:  69% |#########################           | ETA:
> 0:00:04
> Adding changed files:  70% |#########################           | ETA:
> 0:00:04
> Adding changed files:  71% |#########################           | ETA:
> 0:00:04
> Adding changed files:  71% |#########################           | ETA:
> 0:00:04
> Adding changed files:  72% |##########################          | ETA:
> 0:00:04
> Adding changed files:  73% |##########################          | ETA:
> 0:00:04
> Adding changed files:  74% |##########################          | ETA:
> 0:00:03
> Adding changed files:  75% |###########################         | ETA:
> 0:00:03
> Adding changed files:  75% |###########################         | ETA:
> 0:00:03
> Adding changed files:  76% |###########################         | ETA:
> 0:00:03
> Adding changed files:  77% |###########################         | ETA:
> 0:00:03
> Adding changed files:  78% |############################        | ETA:
> 0:00:03
> Adding changed files:  78% |############################        | ETA:
> 0:00:03
> Adding changed files:  79% |############################        | ETA:
> 0:00:03
> Adding changed files:  80% |############################        | ETA:
> 0:00:03
> Adding changed files:  81% |#############################       | ETA:
> 0:00:02
> Adding changed files:  81% |#############################       | ETA:
> 0:00:02
> Adding changed files:  82% |#############################       | ETA:
> 0:00:02
> Adding changed files:  83% |##############################      | ETA:
> 0:00:02
> Adding changed files:  84% |##############################      | ETA:
> 0:00:02
> Adding changed files:  85% |##############################      | ETA:
> 0:00:02
> Adding changed files:  85% |##############################      | ETA:
> 0:00:02
> Adding changed files:  86% |###############################     | ETA:
> 0:00:02
> Adding changed files:  87% |###############################     | ETA:
> 0:00:01
> Adding changed files:  88% |###############################     | ETA:
> 0:00:01
> Adding changed files:  88% |###############################     | ETA:
> 0:00:01
> Adding changed files:  89% |################################    | ETA:
> 0:00:01
> Adding changed files:  90% |################################    | ETA:
> 0:00:01
> Adding changed files:  91% |################################    | ETA:
> 0:00:01
> Adding changed files:  91% |#################################   | ETA:
> 0:00:01
> Adding changed files:  92% |#################################   | ETA:
> 0:00:01
> Adding changed files:  93% |#################################   | ETA:
> 0:00:01
> Adding changed files:  94% |#################################   | ETA:
> 0:00:00
> Adding changed files:  94% |##################################  | ETA:
> 0:00:00
> Adding changed files:  95% |##################################  | ETA:
> 0:00:00
> Adding changed files:  96% |##################################  | ETA:
> 0:00:00
> Adding changed files:  97% |################################### | ETA:
> 0:00:00
> Adding changed files:  98% |################################### | ETA:
> 0:00:00
> Adding changed files:  98% |################################### | ETA:
> 0:00:00
> Adding changed files:  99% |################################### | ETA:
> 0:00:00
> Adding changed files: 100% |####################################| Time:
> 0:00:15
>
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.38.2.tar.xz.
> ..
> INFO: Rebasing devtool onto fc045ed05c0f58aebe55179808336e4990faef9b
> WARNING: Command 'git rebase fc045ed05c0f58aebe55179808336e4990faef9b'
> failed:
> CONFLICT (modify/delete): Source/cmake/FindGObjectIntrospection.cmake
> deleted in HEAD and modified in e5862811 (FindGObjectIntrospection.cmake:
> prefix variables obtained from pkg-config with PKG_CONFIG_SYSROOT_DIR).
> Version e5862811 (FindGObjectIntrospection.cmake: prefix variables obtained
> from pkg-config with PKG_CONFIG_SYSROOT_DIR) of
> Source/cmake/FindGObjectIntrospection.cmake left in tree.
>
> ERROR: Execution of 'git checkout devtool' failed with exit code 1:
> error: you need to resolve your current index first
> Source/cmake/FindGObjectIntrospection.cmake: needs merge
>
>
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173332):
> https://lists.openembedded.org/g/openembedded-core/message/173332
> Mute This Topic: https://lists.openembedded.org/mt/95042129/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000022399a05ed8a3185
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ugly working branch</div><div><a href=3D"https://git.=
yoctoproject.org/poky-contrib/log/?h=3Dtimo/at-spi2-core_2.46.0">https://gi=
t.yoctoproject.org/poky-contrib/log/?h=3Dtimo/at-spi2-core_2.46.0</a></div>=
<div><br></div><div>Dropped some patches. Refreshed some patches. Replace a=
tk/at-spi2-atk with at-spi2-core.</div><div>Fails in do_compile (and all th=
e various configuration options not explored yet).<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 15,=
 2022 at 5:06 AM Auto Upgrade Helper &lt;<a href=3D"mailto:auh@yoctoproject=
.org">auh@yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.38.2* ha=
s Failed (devtool error).<br>
<br>
Detailed error information:<br>
<br>
The following devtool command failed:=C2=A0 upgrade webkitgtk -V 2.38.2<br>
NOTE: Starting bitbake server...<br>
NOTE: Reconnecting to bitbake server...<br>
NOTE: Retrying server connection (#1)...<br>
WARNING: Host distribution &quot;almalinux-8.7&quot; has not been validated=
 with this version of the build system; you may possibly experience unexpec=
ted failures. It is recommended that you use a tested distribution.<br>
Loading cache...done.<br>
Loaded 1665 entries from dependency cache.<br>
<br>
Summary: There was 1 WARNING message.<br>
WARNING: Host distribution &quot;almalinux-8.7&quot; has not been validated=
 with this version of the build system; you may possibly experience unexpec=
ted failures. It is recommended that you use a tested distribution.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.2.0&quot;<br=
>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;4.1&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:bea53ab=
800f953d65f03cdf5c14d82b9123e434f&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:1a8272f=
40f071fda3b2039e433cee6fa6e42d783&quot;<br>
<br>
Initialising tasks...done.<br>
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 20 (100% match,=
 100% complete)<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn&#39;t need to be =
rerun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 2 seconds<br>
WARNING: Host distribution &quot;almalinux-8.7&quot; has not been validated=
 with this version of the build system; you may possibly experience unexpec=
ted failures. It is recommended that you use a tested distribution.<br>
Loading cache...done.<br>
Loaded 1665 entries from dependency cache.<br>
Parsing recipes...done.<br>
Parsing of 888 .bb files complete (886 cached, 2 parsed). 1666 targets, 36 =
skipped, 0 masked, 0 errors.<br>
<br>
Summary: There was 1 WARNING message.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.2.0&quot;<br=
>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;4.1&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:bea53ab=
800f953d65f03cdf5c14d82b9123e434f&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:1a8272f=
40f071fda3b2039e433cee6fa6e42d783&quot;<br>
<br>
Initialising tasks...done.<br>
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 16 (100% match,=
 100% complete)<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn&#39;t need to be r=
erun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 2 seconds<br>
DEBUG 5 [Errno 25] Inappropriate ioctl for device<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:29<br>
Adding changed files:=C2=A0 =C2=A01% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:20<br>
Adding changed files:=C2=A0 =C2=A02% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:17<br>
Adding changed files:=C2=A0 =C2=A03% |#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:16<br>
Adding changed files:=C2=A0 =C2=A03% |#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:15<br>
Adding changed files:=C2=A0 =C2=A04% |#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:14<br>
Adding changed files:=C2=A0 =C2=A05% |#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:13<br>
Adding changed files:=C2=A0 =C2=A06% |##=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | ETA:=C2=A0 0:00:13<br>
Adding changed files:=C2=A0 =C2=A06% |##=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | ETA:=C2=A0 0:00:13<br>
Adding changed files:=C2=A0 =C2=A07% |##=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | ETA:=C2=A0 0:00:12<br>
Adding changed files:=C2=A0 =C2=A08% |###=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| ETA:=C2=A0 0:00:12<br>
Adding changed files:=C2=A0 =C2=A09% |###=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| ETA:=C2=A0 0:00:12<br>
Adding changed files:=C2=A0 =C2=A09% |###=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| ETA:=C2=A0 0:00:12<br>
Adding changed files:=C2=A0 10% |###=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| ETA:=C2=A0 0:00:12<br>
Adding changed files:=C2=A0 11% |####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 ETA:=C2=A0 0:00:11<br>
Adding changed files:=C2=A0 12% |####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 ETA:=C2=A0 0:00:11<br>
Adding changed files:=C2=A0 13% |####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 ETA:=C2=A0 0:00:11<br>
Adding changed files:=C2=A0 13% |####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 ETA:=C2=A0 0:00:11<br>
Adding changed files:=C2=A0 14% |#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| ETA:=C2=A0 0:00:11<br>
Adding changed files:=C2=A0 15% |#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| ETA:=C2=A0 0:00:11<br>
Adding changed files:=C2=A0 16% |#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| ETA:=C2=A0 0:00:11<br>
Adding changed files:=C2=A0 16% |######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA=
:=C2=A0 0:00:10<br>
Adding changed files:=C2=A0 17% |######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA=
:=C2=A0 0:00:10<br>
Adding changed files:=C2=A0 18% |######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA=
:=C2=A0 0:00:10<br>
Adding changed files:=C2=A0 19% |######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA=
:=C2=A0 0:00:10<br>
Adding changed files:=C2=A0 19% |#######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=
=C2=A0 0:00:10<br>
Adding changed files:=C2=A0 20% |#######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=
=C2=A0 0:00:10<br>
Adding changed files:=C2=A0 21% |#######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=
=C2=A0 0:00:10<br>
Adding changed files:=C2=A0 22% |#######=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=
=C2=A0 0:00:10<br>
Adding changed files:=C2=A0 22% |########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=
=A0 0:00:10<br>
Adding changed files:=C2=A0 23% |########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=
=A0 0:00:09<br>
Adding changed files:=C2=A0 24% |########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=
=A0 0:00:09<br>
Adding changed files:=C2=A0 25% |#########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=
=A0 0:00:09<br>
Adding changed files:=C2=A0 26% |#########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=
=A0 0:00:09<br>
Adding changed files:=C2=A0 26% |#########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=
=A0 0:00:09<br>
Adding changed files:=C2=A0 27% |#########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=
=A0 0:00:09<br>
Adding changed files:=C2=A0 28% |##########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:=
00:09<br>
Adding changed files:=C2=A0 29% |##########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:=
00:09<br>
Adding changed files:=C2=A0 29% |##########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:=
00:09<br>
Adding changed files:=C2=A0 30% |###########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:0=
0:09<br>
Adding changed files:=C2=A0 31% |###########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:0=
0:09<br>
Adding changed files:=C2=A0 32% |###########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:0=
0:09<br>
Adding changed files:=C2=A0 32% |###########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:0=
0:08<br>
Adding changed files:=C2=A0 33% |############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:0=
8<br>
Adding changed files:=C2=A0 34% |############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:0=
8<br>
Adding changed files:=C2=A0 35% |############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:0=
8<br>
Adding changed files:=C2=A0 35% |############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:0=
8<br>
Adding changed files:=C2=A0 36% |#############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:08=
<br>
Adding changed files:=C2=A0 37% |#############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:08=
<br>
Adding changed files:=C2=A0 38% |#############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:08=
<br>
Adding changed files:=C2=A0 39% |##############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:08<br>
Adding changed files:=C2=A0 39% |##############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:08<br>
Adding changed files:=C2=A0 40% |##############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:08<br>
Adding changed files:=C2=A0 41% |##############=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:08<br>
Adding changed files:=C2=A0 42% |###############=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:08<br>
Adding changed files:=C2=A0 42% |###############=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 43% |###############=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 44% |###############=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 45% |################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 45% |################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 46% |################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 47% |#################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 48% |#################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 49% |#################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 49% |#################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 50% |##################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 51% |##################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:07<br>
Adding changed files:=C2=A0 52% |##################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 52% |###################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 53% |###################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 54% |###################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 55% |###################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 55% |####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 56% |####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 57% |####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 58% |####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 58% |#####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 59% |#####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:06<br>
Adding changed files:=C2=A0 60% |#####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 61% |######################=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 62% |######################=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 62% |######################=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 63% |######################=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 64% |#######################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 65% |#######################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 65% |#######################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 66% |#######################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:05<br>
Adding changed files:=C2=A0 67% |########################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 68% |########################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 68% |########################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 69% |#########################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 70% |#########################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 71% |#########################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 71% |#########################=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 72% |##########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 73% |##########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:04<br>
Adding changed files:=C2=A0 74% |##########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 75% |###########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 75% |###########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 76% |###########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 77% |###########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 78% |############################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 78% |############################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 79% |############################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 80% |############################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | ETA:=C2=A0 0:00:03<br>
Adding changed files:=C2=A0 81% |#############################=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:02<br>
Adding changed files:=C2=A0 81% |#############################=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:02<br>
Adding changed files:=C2=A0 82% |#############################=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:02<br>
Adding changed files:=C2=A0 83% |##############################=C2=A0 =C2=
=A0 =C2=A0 | ETA:=C2=A0 0:00:02<br>
Adding changed files:=C2=A0 84% |##############################=C2=A0 =C2=
=A0 =C2=A0 | ETA:=C2=A0 0:00:02<br>
Adding changed files:=C2=A0 85% |##############################=C2=A0 =C2=
=A0 =C2=A0 | ETA:=C2=A0 0:00:02<br>
Adding changed files:=C2=A0 85% |##############################=C2=A0 =C2=
=A0 =C2=A0 | ETA:=C2=A0 0:00:02<br>
Adding changed files:=C2=A0 86% |###############################=C2=A0 =C2=
=A0 =C2=A0| ETA:=C2=A0 0:00:02<br>
Adding changed files:=C2=A0 87% |###############################=C2=A0 =C2=
=A0 =C2=A0| ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 88% |###############################=C2=A0 =C2=
=A0 =C2=A0| ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 88% |###############################=C2=A0 =C2=
=A0 =C2=A0| ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 89% |################################=C2=A0 =C2=
=A0 | ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 90% |################################=C2=A0 =C2=
=A0 | ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 91% |################################=C2=A0 =C2=
=A0 | ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 91% |#################################=C2=A0 =
=C2=A0| ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 92% |#################################=C2=A0 =
=C2=A0| ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 93% |#################################=C2=A0 =
=C2=A0| ETA:=C2=A0 0:00:01<br>
Adding changed files:=C2=A0 94% |#################################=C2=A0 =
=C2=A0| ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 94% |##################################=C2=A0 |=
 ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 95% |##################################=C2=A0 |=
 ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 96% |##################################=C2=A0 |=
 ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 97% |################################### | ETA:=
=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 98% |################################### | ETA:=
=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 98% |################################### | ETA:=
=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 99% |################################### | ETA:=
=C2=A0 0:00:00<br>
Adding changed files: 100% |####################################| Time: 0:0=
0:15<br>
<br>
INFO: Extracting current version source...<br>
INFO: Extracting upgraded version source...<br>
INFO: Fetching <a href=3D"https://www.webkitgtk.org/releases/webkitgtk-2.38=
.2.tar.xz." rel=3D"noreferrer" target=3D"_blank">https://www.webkitgtk.org/=
releases/webkitgtk-2.38.2.tar.xz.</a>..<br>
INFO: Rebasing devtool onto fc045ed05c0f58aebe55179808336e4990faef9b<br>
WARNING: Command &#39;git rebase fc045ed05c0f58aebe55179808336e4990faef9b&#=
39; failed:<br>
CONFLICT (modify/delete): Source/cmake/FindGObjectIntrospection.cmake delet=
ed in HEAD and modified in e5862811 (FindGObjectIntrospection.cmake: prefix=
 variables obtained from pkg-config with PKG_CONFIG_SYSROOT_DIR). Version e=
5862811 (FindGObjectIntrospection.cmake: prefix variables obtained from pkg=
-config with PKG_CONFIG_SYSROOT_DIR) of Source/cmake/FindGObjectIntrospecti=
on.cmake left in tree.<br>
<br>
ERROR: Execution of &#39;git checkout devtool&#39; failed with exit code 1:=
<br>
error: you need to resolve your current index first<br>
Source/cmake/FindGObjectIntrospection.cmake: needs merge<br>
<br>
<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173332): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173332" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173332</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95042129/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
95042129/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000022399a05ed8a3185--

