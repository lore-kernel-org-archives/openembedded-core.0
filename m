Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35657C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 14:28:46 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.9296.1641479325000395783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 06:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BdZ4TEf5;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id p1so4548890uap.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 06:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fj4pY/IgtesZecFc/SKsT0BPTCq/pxD/QT9wGkBMEPM=;
        b=BdZ4TEf5TgZNKsRuOVr6i16opZqXWctGQxDarzfltNQCuW3s3ByLlCCHzwnS0vxWEN
         zXZyOogukaI445RmL0wGHWNQKJwD60DCQtFX2GElt/cw+HwJglxx5+VIxbLUMWikIyXZ
         VDtQNdjeziEghw32CcgFW9TN+/H6UTvXLuF9166Ck5LE3lP08W/pr3zS8SR2LgpTHnCr
         CoFfo9mPD1vgujoeY/kcOJNhJ46J+9EDsbnEzH/ehcGieHu19N2wMEGKiONfK+KQ2h7Y
         3oGd0EsGTPPGqydAMI/gqBlml/n4wWbwSj4md0vNSU7wk4a6e3lY741UgSm1t/z4G7El
         pAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fj4pY/IgtesZecFc/SKsT0BPTCq/pxD/QT9wGkBMEPM=;
        b=dhI42sFdw7I8C5dvWTxkHa9L934MVEM3JhUXn58QwBdJ9XJYHiYQdxrzyXiUYcqiIL
         z/gvu9tPcgURKhizQ8ROAhDaAM1WNbHEd/+BfUC1HcVw8uMeyPE+ANTo+bGFTO8oguCP
         KPCAHhW3eYs6g+/b8dgVvX041UCAS46xKD4oaBugZPD+WmVmjvNPHCxWo5ZpXcjgTN/Z
         nq3/3bD/wkanWBjRgUD1Y5mqL3krJvegptDg2WKHb6kkSOGBdv8xRuLsbzkMVS+yhvIh
         i+/t7FHNbJ+7o0nlMOJ6Vxo/8mk+pc/FS+IaNmunZKL2RSLNHn9Rng9KKg+dr5dnn9V+
         Xn+A==
X-Gm-Message-State: AOAM5304ajJFxgMxRPgDa3raMDfJ0ZxH0XHYXAapol97mJl4aVJBKSpS
	QnkuRUIh0YIAuRbbevXFr8FQ8omTdeatDJZDL5c=
X-Google-Smtp-Source: 
 ABdhPJweB1f6J4/MEn2sao+uq/Qc52wnq3oQ/R0iSoEm+VnD5rzmPCzeyIRfj/Q8F3Zt0wd9AmJicKjgNLCfTt3C58k=
X-Received: by 2002:a67:f799:: with SMTP id j25mr18385973vso.75.1641479323999;
 Thu, 06 Jan 2022 06:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20211221104136.191831-1-pgowda.cve@gmail.com>
 <CALY49869bb2zvqnNNJVbLi-5BbOYnE_Dt1xsc5khv3H8GBre4g@mail.gmail.com>
 <c20b76295b096cfbb1c0cd38f0721e59935c241f.camel@intel.com>
In-Reply-To: <c20b76295b096cfbb1c0cd38f0721e59935c241f.camel@intel.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 6 Jan 2022 19:58:34 +0530
Message-ID: 
 <CALY4986Em3QVGkHQeXmrXOsGsd9yL77MLkH5bzf8Wmcn8K0ehA@mail.gmail.com>
Subject: Re: [hardknott][PATCH] AArch64 support for Arm's Neoverse N2 CPU
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>,
 "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 14:28:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160235

Hi Anuj,

Thanks very much for the information.

Regards,
Pgowda

On Thu, Jan 6, 2022 at 7:57 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2022-01-06 at 16:11 +0530, pgowda cve wrote:
> > Hi,
> >
> > Gentle ping on this patch.
> >
>
> I will take this and rest of gcc patches in next week's merge request.
>
> Thanks,
>
> Anuj
>
> > Thanks,
> > Pgowda
> >
> > On Tue, Dec 21, 2021 at 4:11 PM pgowda <pgowda.cve@gmail.com> wrote:
> > >
> > > The patch backports the AArch64 support for Arm's Neoverse N2 CPU
> > > Upstream-Status: Backport
> > > [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f
> > > 672e2ba42df46432c021a9cf]
> > >
> > > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-10.2.inc        |  1 +
> > >  .../gcc/0039-arm64-neoverse-n2-support.patch  | 60
> > > +++++++++++++++++++
> > >  2 files changed, 61 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/gcc/gcc/0039-arm64-
> > > neoverse-n2-support.patch
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-
> > > devtools/gcc/gcc-10.2.inc
> > > index 5626bf20f0..89158258d7 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> > > @@ -74,6 +74,7 @@ SRC_URI = "\
> > >             file://0002-CVE-2021-35465.patch \
> > >             file://0003-CVE-2021-35465.patch \
> > >             file://0004-CVE-2021-35465.patch \
> > > +           file://0039-arm64-neoverse-n2-support.patch \
> > >  "
> > >  SRC_URI[sha256sum] =
> > > "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-
> > > support.patch b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-
> > > n2-support.patch
> > > new file mode 100644
> > > index 0000000000..b3e0f396bd
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-
> > > support.patch
> > > @@ -0,0 +1,60 @@
> > > +From 9428e9267435a62f672e2ba42df46432c021a9cf Mon Sep 17 00:00:00
> > > 2001
> > > +From: Alex Coplan <alex.coplan@arm.com>
> > > +Date: Tue, 29 Sep 2020 17:09:09 +0100
> > > +Subject: [PATCH] aarch64: Add support for Neoverse N2 CPU
> > > +
> > > +This patch backports the AArch64 support for Arm's Neoverse N2 CPU
> > > to
> > > +GCC 10.
> > > +
> > > +gcc/ChangeLog:
> > > +
> > > +       * config/aarch64/aarch64-cores.def: Add Neoverse N2.
> > > +       * config/aarch64/aarch64-tune.md: Regenerate.
> > > +       * doc/invoke.texi: Document AArch64 support for Neoverse
> > > N2.
> > > +
> > > +Upstream-Status: Backport
> > > [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f
> > > 672e2ba42df46432c021a9cf]
> > > +
> > > +Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > > +---
> > > + gcc/config/aarch64/aarch64-cores.def | 3 +++
> > > + gcc/config/aarch64/aarch64-tune.md   | 2 +-
> > > + gcc/doc/invoke.texi                  | 4 ++--
> > > + 3 files changed, 6 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/gcc/config/aarch64/aarch64-cores.def
> > > b/gcc/config/aarch64/aarch64-cores.def
> > > +--- a/gcc/config/aarch64/aarch64-cores.def     2020-07-22
> > > 23:35:17.320384289 -0700
> > > ++++ b/gcc/config/aarch64/aarch64-cores.def     2021-12-21
> > > 01:08:45.518472342 -0800
> > > +@@ -135,6 +135,9 @@ AARCH64_CORE("zeus", zeus, cortexa57, 8_
> > > + /* Qualcomm ('Q') cores. */
> > > + AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,
> > > AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC,
> > > saphira,   0x51, 0xC01, -1)
> > > +
> > > ++/* Armv8.5-A Architecture Processors.  */
> > > ++AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A,
> > > AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 |
> > > AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 |
> > > AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG,
> > > neoversen1, 0x41, 0xd49, -1)
> > > ++
> > > + /* ARMv8-A big.LITTLE implementations.  */
> > > +
> > > + AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53,
> > > cortexa53, 8A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57,
> > > 0x41, AARCH64_BIG_LITTLE (0xd07, 0xd03), -1)
> > > +diff --git a/gcc/config/aarch64/aarch64-tune.md
> > > b/gcc/config/aarch64/aarch64-tune.md
> > > +--- a/gcc/config/aarch64/aarch64-tune.md       2020-07-22
> > > 23:35:54.684795913 -0700
> > > ++++ b/gcc/config/aarch64/aarch64-tune.md       2021-12-21
> > > 01:09:56.829252050 -0800
> > > +@@ -1,5 +1,5 @@
> > > + ;; -*- buffer-read-only: t -*-
> > > + ;; Generated automatically by gentune.sh from aarch64-cores.def
> > > + (define_attr "tune"
> > > +-
> > > "cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunde
> > > rx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thund
> > > erxt81,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thund
> > > erx2t99p1,vulcan,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa
> > > 76ae,cortexa77,cortexa65,cortexa65ae,ares,neoversen1,neoversee1,oct
> > > eontx2,octeontx2t98,octeontx2t96,octeontx2t93,octeontx2f95,octeontx
> > > 2f95n,octeontx2f95mm,tsv110,thunderx3t110,zeus,saphira,cortexa57cor
> > > texa53,cortexa72cortexa53,cortexa73cortexa35,cortexa73cortexa53,cor
> > > texa75cortexa55,cortexa76cortexa55"
> > > ++
> > > "cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunde
> > > rx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thund
> > > erxt81,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thund
> > > erx2t99p1,vulcan,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa
> > > 76ae,cortexa77,cortexa65,cortexa65ae,ares,neoversen1,neoversee1,oct
> > > eontx2,octeontx2t98,octeontx2t96,octeontx2t93,octeontx2f95,octeontx
> > > 2f95n,octeontx2f95mm,tsv110,thunderx3t110,zeus,neoversen2,saphira,c
> > > ortexa57cortexa53,cortexa72cortexa53,cortexa73cortexa35,cortexa73co
> > > rtexa53,cortexa75cortexa55,cortexa76cortexa55"
> > > +       (const (symbol_ref "((enum attr_tune) aarch64_tune)")))
> > > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > > +--- a/gcc/doc/invoke.texi      2021-12-21 00:50:18.345426447 -0800
> > > ++++ b/gcc/doc/invoke.texi      2021-12-21 01:11:18.547853686 -0800
> > > +@@ -17010,8 +17010,8 @@ performance of the code.  Permissible va
> > > + @samp{cortex-a57}, @samp{cortex-a72}, @samp{cortex-a73},
> > > @samp{cortex-a75},
> > > + @samp{cortex-a76}, @samp{cortex-a76ae}, @samp{cortex-a77},
> > > + @samp{cortex-a65}, @samp{cortex-a65ae}, @samp{cortex-a34},
> > > +-@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor},
> > > +-@samp{neoverse-e1},@samp{neoverse-n1},@samp{qdf24xx},
> > > @samp{saphira},
> > > ++@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor},
> > > @samp{neoverse-e1},
> > > ++@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{qdf24xx},
> > > @samp{saphira},
> > > + @samp{phecda}, @samp{xgene1}, @samp{vulcan}, @samp{octeontx},
> > > + @samp{octeontx81},  @samp{octeontx83},
> > > + @samp{octeontx2}, @samp{octeontx2t98}, @samp{octeontx2t96}
> > > --
> > > 2.31.1
> > >
>

