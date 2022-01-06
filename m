Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26A6C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 10:41:40 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.7078.1641465699425089954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 02:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oDhPVYO+;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id p37so3420985uae.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 02:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pCG9ReYaYfKwu8F6NZoEduk+evCT2UU5H9GlTlrvrCA=;
        b=oDhPVYO+t9x29DhHmdAaVfNfgwul5Cx75KcM2PuX6PcfJtCQZFeySi/J2Xlu9ho1Pm
         yg6CZcoFHVpaNhZYLzqt/Et0oG3CiZlhAoUtHVJbUkNy0ZQC9g7W8Ifl2Uc8/NiI8XlZ
         ZEyobzir1YNDb1aaGfC59sxDGAaAD4WQaYXmDQ0J2gMLj6ReZLEpcM+THtQxX5DmDps8
         QlabkP8w6B0/6gLK9gYPKibo7kjUT4Gs9afg/KU7zf9Bt0iGTVR1vh5RvICjoeCfCtgn
         FG1favOCZsEHzREIYZXwanM6nkHW4iCrHeHW5erWUepma122xfS/VMGtt/Xe9qvOE+/q
         1DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pCG9ReYaYfKwu8F6NZoEduk+evCT2UU5H9GlTlrvrCA=;
        b=XDMbK9Q90MBUG75vjkh7KU/9Iv97kQZfvoiytN9cf2b4ikl6Pxmbx0Bw4qlGE0ZCnW
         CJ+I2AmlJkGxtxLQKvxoj/4ypS3CWOGLhQXzcGB6AC6KXXiVJ9zdHbsqKZLgw0O+v8YM
         LpufcFr+xLmSZybVekUIGQAhPbfD17eQbjdKuFh9OuCQVcNILHaYCsQugpnVwXbL5iLf
         T8uC+jBnTx6joiVG9b9f+I43VMnJxK/WJodtTMfPQUmmIb0mm1Rd5QcQoeDqTaUJJN/P
         v0uxvyoITst95z8r32h7lDyGx9cFeg91dW8CMpGGFM3x7wk5rxhwTLDJXmPGxa/2fijd
         OzBw==
X-Gm-Message-State: AOAM5334wHnwP+PLe0pzQD8YzfHvYv/U9toffbhYS+plxhIyYRp79mIg
	wb2sbdfp70MZwktyS95WiIoZCq/DyecYeNHA/QOljbkdrBE=
X-Google-Smtp-Source: 
 ABdhPJy//VtEG1uVDQRGwTjhjr5YZUsFn4nob40oXe2eW1XRFl/r0rfFTI1aT2kw11JwwUb6l7FqCFMpprJxMiFRh2I=
X-Received: by 2002:a67:e3cd:: with SMTP id k13mr18246306vsm.59.1641465698523;
 Thu, 06 Jan 2022 02:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20211221104136.191831-1-pgowda.cve@gmail.com>
In-Reply-To: <20211221104136.191831-1-pgowda.cve@gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 6 Jan 2022 16:11:28 +0530
Message-ID: 
 <CALY49869bb2zvqnNNJVbLi-5BbOYnE_Dt1xsc5khv3H8GBre4g@mail.gmail.com>
Subject: Re: [hardknott][PATCH] AArch64 support for Arm's Neoverse N2 CPU
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>,
 Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 10:41:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160226

Hi,

Gentle ping on this patch.

Thanks,
Pgowda

On Tue, Dec 21, 2021 at 4:11 PM pgowda <pgowda.cve@gmail.com> wrote:
>
> The patch backports the AArch64 support for Arm's Neoverse N2 CPU
> Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommi=
tdiff;h=3D9428e9267435a62f672e2ba42df46432c021a9cf]
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
>  .../gcc/0039-arm64-neoverse-n2-support.patch  | 60 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-=
support.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-10.2.inc
> index 5626bf20f0..89158258d7 100644
> --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> @@ -74,6 +74,7 @@ SRC_URI =3D "\
>             file://0002-CVE-2021-35465.patch \
>             file://0003-CVE-2021-35465.patch \
>             file://0004-CVE-2021-35465.patch \
> +           file://0039-arm64-neoverse-n2-support.patch \
>  "
>  SRC_URI[sha256sum] =3D "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff=
146c855fe16c1d8c"
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support=
.patch b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
> new file mode 100644
> index 0000000000..b3e0f396bd
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
> @@ -0,0 +1,60 @@
> +From 9428e9267435a62f672e2ba42df46432c021a9cf Mon Sep 17 00:00:00 2001
> +From: Alex Coplan <alex.coplan@arm.com>
> +Date: Tue, 29 Sep 2020 17:09:09 +0100
> +Subject: [PATCH] aarch64: Add support for Neoverse N2 CPU
> +
> +This patch backports the AArch64 support for Arm's Neoverse N2 CPU to
> +GCC 10.
> +
> +gcc/ChangeLog:
> +
> +       * config/aarch64/aarch64-cores.def: Add Neoverse N2.
> +       * config/aarch64/aarch64-tune.md: Regenerate.
> +       * doc/invoke.texi: Document AArch64 support for Neoverse N2.
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
itdiff;h=3D9428e9267435a62f672e2ba42df46432c021a9cf]
> +
> +Signed-off-by: pgowda <pgowda.cve@gmail.com>
> +---
> + gcc/config/aarch64/aarch64-cores.def | 3 +++
> + gcc/config/aarch64/aarch64-tune.md   | 2 +-
> + gcc/doc/invoke.texi                  | 4 ++--
> + 3 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/a=
arch64-cores.def
> +--- a/gcc/config/aarch64/aarch64-cores.def     2020-07-22 23:35:17.32038=
4289 -0700
> ++++ b/gcc/config/aarch64/aarch64-cores.def     2021-12-21 01:08:45.51847=
2342 -0800
> +@@ -135,6 +135,9 @@ AARCH64_CORE("zeus", zeus, cortexa57, 8_
> + /* Qualcomm ('Q') cores. */
> + AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_F=
OR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01, -=
1)
> +
> ++/* Armv8.5-A Architecture Processors.  */
> ++AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR=
_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_=
SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_=
FL_MEMTAG, neoversen1, 0x41, 0xd49, -1)
> ++
> + /* ARMv8-A big.LITTLE implementations.  */
> +
> + AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53, 8=
A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_LIT=
TLE (0xd07, 0xd03), -1)
> +diff --git a/gcc/config/aarch64/aarch64-tune.md b/gcc/config/aarch64/aar=
ch64-tune.md
> +--- a/gcc/config/aarch64/aarch64-tune.md       2020-07-22 23:35:54.68479=
5913 -0700
> ++++ b/gcc/config/aarch64/aarch64-tune.md       2021-12-21 01:09:56.82925=
2050 -0800
> +@@ -1,5 +1,5 @@
> + ;; -*- buffer-read-only: t -*-
> + ;; Generated automatically by gentune.sh from aarch64-cores.def
> + (define_attr "tune"
> +-      "cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thun=
derx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81=
,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vulc=
an,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cortexa=
65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeontx2t=
96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thunderx3t=
110,zeus,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73cortexa35,c=
ortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55"
> ++      "cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thun=
derx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81=
,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vulc=
an,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cortexa=
65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeontx2t=
96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thunderx3t=
110,zeus,neoversen2,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73=
cortexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55"
> +       (const (symbol_ref "((enum attr_tune) aarch64_tune)")))
> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> +--- a/gcc/doc/invoke.texi      2021-12-21 00:50:18.345426447 -0800
> ++++ b/gcc/doc/invoke.texi      2021-12-21 01:11:18.547853686 -0800
> +@@ -17010,8 +17010,8 @@ performance of the code.  Permissible va
> + @samp{cortex-a57}, @samp{cortex-a72}, @samp{cortex-a73}, @samp{cortex-a=
75},
> + @samp{cortex-a76}, @samp{cortex-a76ae}, @samp{cortex-a77},
> + @samp{cortex-a65}, @samp{cortex-a65ae}, @samp{cortex-a34},
> +-@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor},
> +-@samp{neoverse-e1},@samp{neoverse-n1},@samp{qdf24xx}, @samp{saphira},
> ++@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor}, @samp{neover=
se-e1},
> ++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{qdf24xx}, @samp{saphira},
> + @samp{phecda}, @samp{xgene1}, @samp{vulcan}, @samp{octeontx},
> + @samp{octeontx81},  @samp{octeontx83},
> + @samp{octeontx2}, @samp{octeontx2t98}, @samp{octeontx2t96}
> --
> 2.31.1
>

