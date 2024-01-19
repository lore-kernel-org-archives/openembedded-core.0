Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8F6C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 19:24:55 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.2988.1705692287872228195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 11:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PjiXWiOp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-337d58942c9so1084027f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705692286; x=1706297086; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uubkPGm7H5EfAYe5Dow1ZrcYkljna5KZ0TAPW16z2Bg=;
        b=PjiXWiOpmiJBhSUf0KzjJnB2/pny+bdFuMJMr/SlZtcjGJpJxitD/OVWN9WUM5gZpi
         1y2Y7A2u/MwAS8Sr1HBwtgVd8XGlLTf1N/L5h7bRMm/OeaRatMTgZcLTdkUOCKCxeEPO
         AC/dQuRS7ZI0mji2TIeqRCo4H7thuNc30HuKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705692286; x=1706297086;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uubkPGm7H5EfAYe5Dow1ZrcYkljna5KZ0TAPW16z2Bg=;
        b=KmuJkrYLg9PbIhZxklpyyPX2btNIQWZ2r8sNmiZc0yuB8XI2CQyb23MSaWIgGma3MK
         GHU8gxYEceXBEVkVjUhnvtNCZs4vNULoT0jGNKRocDOvqUMugpmm8E8G+FBvUfD9YRKh
         bVEl1cRqt9hpLpNkjEa/NF2o+KUY5We49MUL16WiqxUqKdkeF+ssjzhNIBEAAVivXSxM
         9Orfs1YPWxf3w4vvO4pchSuumGfo2KO3yX8Byq8HNbOCBSWUWOf9Vy3tAI1bJUo97eL6
         lvNT5HNp0KpIw/2EJQWQuzrQVTMZH9nR9wC/hYL+Gj7uzUeAcvP6GB0ICEXWHRnU8DQn
         UpIg==
X-Gm-Message-State: AOJu0YyjWTZr1ooCr+6mSRCM46ZLzIAyUa8w+pu0lXsVyWX1tHnwZYKL
	d/IsPGUFEk3L/0a6ukUnYRNkVPOGh8N97CbcGVU6yS/fLTAKB5M1jM9aaOIr7Hs=
X-Google-Smtp-Source: AGHT+IHMf+UyPok6JDImbWSN0y0FU8OAvO7oF4gF5SH2S3YwsxSTYee5WJPebZSi6EPvs6fvGsL7Dw==
X-Received: by 2002:a05:6000:1e81:b0:337:a003:3d6b with SMTP id dd1-20020a0560001e8100b00337a0033d6bmr134387wrb.28.1705692285984;
        Fri, 19 Jan 2024 11:24:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bdad:632e:4428:9197? ([2001:8b0:aba:5f3c:bdad:632e:4428:9197])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm4268099wrv.20.2024.01.19.11.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 11:24:45 -0800 (PST)
Message-ID: <3d768fea662107ded470e7aa3dbd3e2d561e173a.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Thomas Perrot <thomas.perrot@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Cc: thomas.petazzoni@bootlin.com
Date: Fri, 19 Jan 2024 19:24:44 +0000
In-Reply-To: <f9050dd0b2bb0c072f891a5b45cf96bdb7b9a7f0.camel@bootlin.com>
References: <20240117094701.25763-1-thomas.perrot@bootlin.com>
	 <abad3986d80e9eae3e7ed69f1ca466678eea042d.camel@linuxfoundation.org>
	 <f9050dd0b2bb0c072f891a5b45cf96bdb7b9a7f0.camel@bootlin.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 19:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194065

On Fri, 2024-01-19 at 18:48 +0100, Thomas Perrot wrote:
> Hello Richard,
>=20
> On Fri, 2024-01-19 at 17:22 +0000, Richard Purdie wrote:
> > On Wed, 2024-01-17 at 10:47 +0100, Thomas Perrot via
> > lists.openembedded.org wrote:
> > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > >=20
> > > This release has:
> > > - Synopsys DesignWare APB GPIO driver
> > > - Zicntr and Zihpm support
> > > - Console print improvements
> > > - Smepmp support
> > > - Simple FDT based syscon regmap driver
> > > - Syscon based reboot and poweroff driver
> > > - Non-contiguous hpm counters
> > > - Smcntrpmf support
> > > - Full sparse hartid support
> > > - IPI improvements
> > > - RFENCE improvements
> > > - Zkr support
> > > - Andes custom PMU support
> > > Overall, this release mainly adds more ISA extensions, drivers and
> > > other improvements.
> > >=20
> > > https://github.com/riscv-software-src/opensbi/compare/v1.3.1...v1.4
> > >=20
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > This all seems reasonable but why is there a revert below?
>=20
> I reverted it otherwise the following link issue occurs:
>=20
> "build/tmp-glibc/work/riscv64-oe-linux/opensbi/1.4/recipe-sysroot-
> native/usr/bin/riscv64-oe-linux/../../libexec/riscv64-oe-
> linux/gcc/riscv64-oe-linux/13.2.0/ld.bfd:/src/build/tmp-
> glibc/work/riscv64-oe-
> linux/opensbi/1.4/git/build/platform/generic/firmware/fw_dynamic.elf.ld
> :54: undefined section `.dynsym' referenced in expression"

The commit should at least mention the issue.

I'm also not sure that is "Inappropriate", more like "Pending" as in
needs further investigation.

> > > ---
> > > =C2=A0...re-Remove-handling-of-R_RISCV_-32-64.patch | 88
> > > +++++++++++++++++++
> > > =C2=A0.../{opensbi_1.3.bb =3D> opensbi_1.4.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +-
> > > =C2=A02 files changed, 92 insertions(+), 4 deletions(-)
> > > =C2=A0create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Revert=
-
> > > firmware-Remove-handling-of-R_RISCV_-32-64.patch
> > > =C2=A0rename meta/recipes-bsp/opensbi/{opensbi_1.3.bb =3D> opensbi_1.=
4.bb}
> > > (90%)
> > >=20
> > > diff --git a/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-
> > > Remove-handling-of-R_RISCV_-32-64.patch b/meta/recipes-
> > > bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-of-
> > > R_RISCV_-32-64.patch
> > > new file mode 100644
> > > index 000000000000..d14e0b73a9bc
> > > --- /dev/null
> > > +++ b/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-Remove-
> > > handling-of-R_RISCV_-32-64.patch
> > > @@ -0,0 +1,88 @@
> > > +From bfe480929bcc966e1fdf5afdde8d4c22adba7f6f Mon Sep 17 00:00:00
> > > 2001
> > > +From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > +Date: Tue, 16 Jan 2024 15:16:58 +0100
> > > +Subject: [PATCH] Revert "firmware: Remove handling of
> > > R_RISCV_{32,64}"
> > > +
> > > +This reverts commit 2a6d72534d44c39e1de0614970a0dad97b1c41ba.
> > > +
> > > +Upstream-Status: Inappropriate [oe specific]
> > > +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > If we're going to revert an upstream change, we need to say *why*. We
> > need to revert it for some OE specific reason but what is that
> > reason?
> >=20
>=20
> I agree, maybe you have any advice to fix it in another way?

I have no idea, I've copied Khem who might or might know who to talk
to.

Cheers,

Richard

