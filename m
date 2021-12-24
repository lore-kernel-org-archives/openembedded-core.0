Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6222C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 05:46:20 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.42635.1640324780298798057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 21:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oXGkL6H8;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v22so6873170qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 21:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GoursGQoOTiu0Mu0Te8b3id2vZGbpwpwJ1vuBHbxyzA=;
        b=oXGkL6H8RknR4qC3v/uMsopIZwKE3MGeIOL+wurbeYxsZWV7JJQ4AS8CileH2s7aq+
         /eOAyYKobGYfu+Hd9ZtqgGLfjk37eOQmlUY+OADgMGmcVyCtAD5qCGRBm2n/TKIWKb08
         qsvszjXlc6+/6N0svycDEFHytIPhr6W0Odm0p6XezdOfLsCAabvuWfxRNTp5en6syqgR
         4qF4F6GtSOmBsPEcldz3tljPWS1jxDTqz2Krb64D8VWGBac1qcfueAj/OFVqcpmU0p9u
         dAwPKQn25mw03E8lWAf3IJ+P155hnLXbTK/FaOLNbyIQKPBaWiV6ZzRyDtr98iyMiiuY
         o43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GoursGQoOTiu0Mu0Te8b3id2vZGbpwpwJ1vuBHbxyzA=;
        b=2q4Lu4xAmtBXzVViSdm8Z1YMjRSAVYBkKcL+N0RHe/B5H/ZG70T0BHr7JZJlBtAzZV
         X5d0MUR5p7bGPJHvZthwyTLJ7xloPUEX1KARJp8ZLbR2GGx8oNanzsPpr/+Wkgm1tqcv
         kuhiKeJL4oRNPsj1CRhxu4BXu9vQUHL3VjoLD2NtSLWuk9vZWvDy4IjDNYGVLp7cGSk6
         hY6UOgXoMDtqEIn1YX262Pb0kiSc5AQXyEq8ycG1VFawHsyfdk+aODjRzW0Eq7voNWsG
         kRutpiu2GZgUvtq8kGPhUBiibtZq1Q7n2Grs48i8VpwPA3gzCSqjc0pl19I9nO/oYO+Z
         EuMA==
X-Gm-Message-State: AOAM532ltdLz1BST0eaZdppcyaVxrGH3Cmj8c7RlLcMD6JFUDOx/kwSt
	evgSqbW1aDsE4YbLFLGXaBnw+RJ08U/18LTUVm4=
X-Google-Smtp-Source: 
 ABdhPJwePBeeYg73vDfTghmy/iNtflkCwo7LG6KOSkpHxH7A0zSLI6w95fONa9TtLiPVvpwkQGoj3A854kgXOT+dmFc=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr4510755qtf.660.1640324779368;
 Thu, 23 Dec 2021 21:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20211221060046.186189-1-pgowda.cve@gmail.com>
In-Reply-To: <20211221060046.186189-1-pgowda.cve@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Dec 2021 21:45:53 -0800
Message-ID: 
 <CAMKF1sr4ipTgfeBWuUw=0+FLQiAfh-8NTDcoHsW60VHT0Aj22A@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] Add support for Neoverse N2 CPU
To: Pgowda <pgowda.cve@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Anuj Mittal <anuj.mittal@intel.com>, Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 05:46:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159992

lgtm

On Mon, Dec 20, 2021 at 10:00 PM Pgowda <pgowda.cve@gmail.com> wrote:
>
> This patch backports the AArch32 support for Arm's Neoverse N2 CPU.
>
> Upstream-Status: Backport
> [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
>  .../0038-aarch64-neoverse-n2-support.patch    | 88 +++++++++++++++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
> index 5626bf20f0..8fcc53df38 100644
> --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> @@ -74,6 +74,7 @@ SRC_URI = "\
>             file://0002-CVE-2021-35465.patch \
>             file://0003-CVE-2021-35465.patch \
>             file://0004-CVE-2021-35465.patch \
> +           file://0038-aarch64-neoverse-n2-support.patch \
>  "
>  SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
> new file mode 100644
> index 0000000000..3e42266b81
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0038-aarch64-neoverse-n2-support.patch
> @@ -0,0 +1,88 @@
> +From d7e8411f6a333d4054894ad3b23f23415a525230 Mon Sep 17 00:00:00 2001
> +From: Alex Coplan <alex.coplan@arm.com>
> +Date: Fri, 2 Oct 2020 16:06:15 +0100
> +Subject: [PATCH] arm: Add support for Neoverse N2 CPU
> +
> +This patch backports the AArch32 support for Arm's Neoverse N2 CPU to
> +GCC 10.
> +
> +gcc/ChangeLog:
> +
> +       * config/arm/arm-cpus.in (neoverse-n2): New.
> +       * config/arm/arm-tables.opt: Regenerate.
> +       * config/arm/arm-tune.md: Regenerate.
> +       * doc/invoke.texi: Document support for Neoverse N2.
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]
> +
> +Signed-off-by: pgowda <pgowda.cve@gmail.com>
> +---
> + gcc/config/arm/arm-cpus.in    | 12 ++++++++++++
> + gcc/config/arm/arm-tables.opt |  3 +++
> + gcc/config/arm/arm-tune.md    |  5 +++--
> + gcc/doc/invoke.texi           |  6 +++---
> + 4 files changed, 21 insertions(+), 5 deletions(-)
> +
> +diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
> +--- a/gcc/config/arm/arm-cpus.in       2021-12-20 20:24:59.912159845 -0800
> ++++ b/gcc/config/arm/arm-cpus.in       2021-12-20 21:00:04.417003845 -0800
> +@@ -1481,6 +1481,18 @@ begin cpu cortex-a76.cortex-a55
> +  costs cortex_a57
> + end cpu cortex-a76.cortex-a55
> +
> ++# Armv8.5 A-profile Architecture Processors
> ++begin cpu neoverse-n2
> ++  cname neoversen2
> ++  tune for cortex-a57
> ++  tune flags LDSCHED
> ++  architecture armv8.5-a+fp16+bf16+i8mm
> ++  option crypto add FP_ARMv8 CRYPTO
> ++  costs cortex_a57
> ++  vendor 41
> ++  part 0xd49
> ++end cpu neoverse-n2
> ++
> + # V8 M-profile implementations.
> + begin cpu cortex-m23
> +  cname cortexm23
> +diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
> +--- a/gcc/config/arm/arm-tables.opt    2020-07-22 23:35:54.688795958 -0700
> ++++ b/gcc/config/arm/arm-tables.opt    2021-12-20 21:00:04.421003776 -0800
> +@@ -253,6 +253,9 @@ EnumValue
> + Enum(processor_type) String(cortex-m23) Value( TARGET_CPU_cortexm23)
> +
> + EnumValue
> ++Enum(processor_type) String(neoverse-n2) Value( TARGET_CPU_neoversen2)
> ++
> ++EnumValue
> + Enum(processor_type) String(cortex-m33) Value( TARGET_CPU_cortexm33)
> +
> + EnumValue
> +diff --git a/gcc/config/arm/arm-tune.md b/gcc/config/arm/arm-tune.md
> +--- a/gcc/config/arm/arm-tune.md       2020-07-22 23:35:54.684795913 -0700
> ++++ b/gcc/config/arm/arm-tune.md       2021-12-20 21:02:44.630260284 -0800
> +@@ -46,6 +46,6 @@
> +       cortexa73cortexa53,cortexa55,cortexa75,
> +       cortexa76,cortexa76ae,cortexa77,
> +       neoversen1,cortexa75cortexa55,cortexa76cortexa55,
> +-      cortexm23,cortexm33,cortexm35p,
> +-      cortexm55,cortexr52"
> ++      neoversen2,cortexm23,cortexm33,
> ++      cortexm35p,cortexm55,cortexr52"
> +       (const (symbol_ref "((enum attr_tune) arm_tune)")))
> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> +--- a/gcc/doc/invoke.texi      2021-12-20 20:24:59.916159782 -0800
> ++++ b/gcc/doc/invoke.texi      2021-12-20 21:03:41.337290704 -0800
> +@@ -18857,9 +18857,9 @@ Permissible names are: @samp{arm7tdmi},
> + @samp{cortex-m35p}, @samp{cortex-m55},
> + @samp{cortex-m1.small-multiply}, @samp{cortex-m0.small-multiply},
> + @samp{cortex-m0plus.small-multiply}, @samp{exynos-m1}, @samp{marvell-pj4},
> +-@samp{neoverse-n1}, @samp{xscale}, @samp{iwmmxt}, @samp{iwmmxt2},
> +-@samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te}, @samp{fa626te},
> +-@samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
> ++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{xscale}, @samp{iwmmxt},
> ++@samp{iwmmxt2}, @samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te},
> ++@samp{fa626te}, @samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
> +
> + Additionally, this option can specify that GCC should tune the performance
> + of the code for a big.LITTLE system.  Permissible names are:
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159906): https://lists.openembedded.org/g/openembedded-core/message/159906
> Mute This Topic: https://lists.openembedded.org/mt/87872660/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

