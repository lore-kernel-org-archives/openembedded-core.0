Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9379C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 10:41:18 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web08.7020.1641465674944426715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 02:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a0lKGsVn;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id i5so3399794uaq.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqqAznxZPFFleVWfMlPwQTi5XN9NRrWfUfZkY3dboqg=;
        b=a0lKGsVnvcil/43/YxwyWUzN5yCfbvUdXrW5djcSQWppJmCJSw0I2XNbfm8ZyDXMG6
         FbEOfBJ9U9jxPAwmRagwlUPzUjgNjCfB2DaxuzSZptj6Z1HsztUJIt58mU6K4Vsicfw9
         35I6d5kJ23pEsDiodTacJETe7inh/sP9wOrRLWmNEKWTi7pl0b7BQsLDOtdSkd+YxuT6
         cRWX0h6/ny/gkRGhYqmzttv5XkADFDRaIdhOl131jPJw+HqWBEVOPE2bFX4tADq+l6D6
         +ANhSmZ7GbxjHzMMANfmC/kqLfe7QyboT8SlMI2hw41yebTIuvjHKlrY7MFlyIeUmZtU
         7tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqqAznxZPFFleVWfMlPwQTi5XN9NRrWfUfZkY3dboqg=;
        b=hyoTX/NXOgKNhebxEov0YsoePfaraIOfVHaqYe9syEQXjp7M7lWMCXxVLbGM6SgJY5
         ldABooNoeIyDO9hSZE1Aj6YWfuk96U1LWxsS0HCQgm+QGOovP8sofLmuLwEl0DZ0MU73
         YYvOoRwy72WmYj8mf7y5RcLS1JKOR2STwjfIgjReQsSny94shnkF7u/wunxMArlX2N6H
         XJYzilQpekJDC9bA/YeBYtE7fk4nkeEzatP2wwIf26pGaBIkMHWFP1xCW1uM2+Ynje3o
         IPC+xzxooghF+XXMi3XN49h0SDE/wdLkEtf2ih1L7GbwRt0e2uJyWqFVqtn/duSVHBt9
         lQtw==
X-Gm-Message-State: AOAM533PYh6ySJmduI/Lha5oy1wh2EhohU3+e0IqK9mKzeqHqGJW87IJ
	Ev/LUJthbEvlSdNt1YYi/59bdYhxGxKsAdgmW5w=
X-Google-Smtp-Source: 
 ABdhPJyCuymIp0PKAjb041jBfe9liJ+EocFvbyxplq1luFutWMYWemF3oE/rwFR3MItuREHLDg69GL90J1KrAL8RE6I=
X-Received: by 2002:a67:d51e:: with SMTP id l30mr18554330vsj.1.1641465674051;
 Thu, 06 Jan 2022 02:41:14 -0800 (PST)
MIME-Version: 1.0
References: <20211221060046.186189-1-pgowda.cve@gmail.com>
 <CAMKF1sr4ipTgfeBWuUw=0+FLQiAfh-8NTDcoHsW60VHT0Aj22A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr4ipTgfeBWuUw=0+FLQiAfh-8NTDcoHsW60VHT0Aj22A@mail.gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 6 Jan 2022 16:11:04 +0530
Message-ID: 
 <CALY49877uAYWZMS8Wx=-WvqNWkjTAyif2a3pnLrSag196frqYQ@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] Add support for Neoverse N2 CPU
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Anuj Mittal <anuj.mittal@intel.com>, Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 10:41:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160225

Hi,

Gentle ping on this patch.

Thanks,
Pgowda

On Fri, Dec 24, 2021 at 11:16 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> lgtm
>
> On Mon, Dec 20, 2021 at 10:00 PM Pgowda <pgowda.cve@gmail.com> wrote:
> >
> > This patch backports the AArch32 support for Arm's Neoverse N2 CPU.
> >
> > Upstream-Status: Backport
> > [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
> >  .../0038-aarch64-neoverse-n2-support.patch    | 88 +++++++++++++++++++
> >  2 files changed, 89 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
> > index 5626bf20f0..8fcc53df38 100644
> > --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> > @@ -74,6 +74,7 @@ SRC_URI = "\
> >             file://0002-CVE-2021-35465.patch \
> >             file://0003-CVE-2021-35465.patch \
> >             file://0004-CVE-2021-35465.patch \
> > +           file://0038-aarch64-neoverse-n2-support.patch \
> >  "
> >  SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
> > new file mode 100644
> > index 0000000000..3e42266b81
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
> > @@ -0,0 +1,88 @@
> > +From d7e8411f6a333d4054894ad3b23f23415a525230 Mon Sep 17 00:00:00 2001
> > +From: Alex Coplan <alex.coplan@arm.com>
> > +Date: Fri, 2 Oct 2020 16:06:15 +0100
> > +Subject: [PATCH] arm: Add support for Neoverse N2 CPU
> > +
> > +This patch backports the AArch32 support for Arm's Neoverse N2 CPU to
> > +GCC 10.
> > +
> > +gcc/ChangeLog:
> > +
> > +       * config/arm/arm-cpus.in (neoverse-n2): New.
> > +       * config/arm/arm-tables.opt: Regenerate.
> > +       * config/arm/arm-tune.md: Regenerate.
> > +       * doc/invoke.texi: Document support for Neoverse N2.
> > +
> > +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]
> > +
> > +Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > +---
> > + gcc/config/arm/arm-cpus.in    | 12 ++++++++++++
> > + gcc/config/arm/arm-tables.opt |  3 +++
> > + gcc/config/arm/arm-tune.md    |  5 +++--
> > + gcc/doc/invoke.texi           |  6 +++---
> > + 4 files changed, 21 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
> > +--- a/gcc/config/arm/arm-cpus.in       2021-12-20 20:24:59.912159845 -0800
> > ++++ b/gcc/config/arm/arm-cpus.in       2021-12-20 21:00:04.417003845 -0800
> > +@@ -1481,6 +1481,18 @@ begin cpu cortex-a76.cortex-a55
> > +  costs cortex_a57
> > + end cpu cortex-a76.cortex-a55
> > +
> > ++# Armv8.5 A-profile Architecture Processors
> > ++begin cpu neoverse-n2
> > ++  cname neoversen2
> > ++  tune for cortex-a57
> > ++  tune flags LDSCHED
> > ++  architecture armv8.5-a+fp16+bf16+i8mm
> > ++  option crypto add FP_ARMv8 CRYPTO
> > ++  costs cortex_a57
> > ++  vendor 41
> > ++  part 0xd49
> > ++end cpu neoverse-n2
> > ++
> > + # V8 M-profile implementations.
> > + begin cpu cortex-m23
> > +  cname cortexm23
> > +diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
> > +--- a/gcc/config/arm/arm-tables.opt    2020-07-22 23:35:54.688795958 -0700
> > ++++ b/gcc/config/arm/arm-tables.opt    2021-12-20 21:00:04.421003776 -0800
> > +@@ -253,6 +253,9 @@ EnumValue
> > + Enum(processor_type) String(cortex-m23) Value( TARGET_CPU_cortexm23)
> > +
> > + EnumValue
> > ++Enum(processor_type) String(neoverse-n2) Value( TARGET_CPU_neoversen2)
> > ++
> > ++EnumValue
> > + Enum(processor_type) String(cortex-m33) Value( TARGET_CPU_cortexm33)
> > +
> > + EnumValue
> > +diff --git a/gcc/config/arm/arm-tune.md b/gcc/config/arm/arm-tune.md
> > +--- a/gcc/config/arm/arm-tune.md       2020-07-22 23:35:54.684795913 -0700
> > ++++ b/gcc/config/arm/arm-tune.md       2021-12-20 21:02:44.630260284 -0800
> > +@@ -46,6 +46,6 @@
> > +       cortexa73cortexa53,cortexa55,cortexa75,
> > +       cortexa76,cortexa76ae,cortexa77,
> > +       neoversen1,cortexa75cortexa55,cortexa76cortexa55,
> > +-      cortexm23,cortexm33,cortexm35p,
> > +-      cortexm55,cortexr52"
> > ++      neoversen2,cortexm23,cortexm33,
> > ++      cortexm35p,cortexm55,cortexr52"
> > +       (const (symbol_ref "((enum attr_tune) arm_tune)")))
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +--- a/gcc/doc/invoke.texi      2021-12-20 20:24:59.916159782 -0800
> > ++++ b/gcc/doc/invoke.texi      2021-12-20 21:03:41.337290704 -0800
> > +@@ -18857,9 +18857,9 @@ Permissible names are: @samp{arm7tdmi},
> > + @samp{cortex-m35p}, @samp{cortex-m55},
> > + @samp{cortex-m1.small-multiply}, @samp{cortex-m0.small-multiply},
> > + @samp{cortex-m0plus.small-multiply}, @samp{exynos-m1}, @samp{marvell-pj4},
> > +-@samp{neoverse-n1}, @samp{xscale}, @samp{iwmmxt}, @samp{iwmmxt2},
> > +-@samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te}, @samp{fa626te},
> > +-@samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
> > ++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{xscale}, @samp{iwmmxt},
> > ++@samp{iwmmxt2}, @samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te},
> > ++@samp{fa626te}, @samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
> > +
> > + Additionally, this option can specify that GCC should tune the performance
> > + of the code for a big.LITTLE system.  Permissible names are:
> > --
> > 2.31.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159906): https://lists.openembedded.org/g/openembedded-core/message/159906
> > Mute This Topic: https://lists.openembedded.org/mt/87872660/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

