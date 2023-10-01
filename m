Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CC2E748ED
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 13:20:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.59536.1696166439152245247
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 06:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iL1z/+2Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-406618d0991so18041425e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696166437; x=1696771237; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kr+hd8bxQ8NHtaHESIu3v4vfKl49DLRSon9bvYYdCzU=;
        b=iL1z/+2Q2WcYhGzn0NNMulIhbVyY3FDlXW0E9fHxQnKvly7HOv3fMs2TSOPIBz16U0
         wO0i/DQs5MgTSoZRjx5G5cWua0W1bqPUt+O/mXXQKa+xoxVT5pJQd1qWUCDOvIVV/Rlh
         QueyeiNn2t+r1tw4bEbMV4sm1e1wPv6Fl/F1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696166437; x=1696771237;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kr+hd8bxQ8NHtaHESIu3v4vfKl49DLRSon9bvYYdCzU=;
        b=Q49C7e5cHIni5CXH4NWHl4f6yK+ikDJESci/dqHHI+7pDn2i6SVD8U/g2nv3sS7EqO
         6+m5nXYHuuxd+oPYx5wP36FF64X25JWyqB+fMELT1ZAYlK2KunxUrffN3eRIBVlkEFLg
         vgmJoD9TmgN2El48QdErt5EOuOU1h9ZFAwe7arx/+7G/Tt23e9lcZPISO0ATn9MVr3Ad
         oaf3STfm+vSDQsjWJhAA+MYOuq3bIzQEBzEr/pCNouRcbDPEQPbrEc+9+h7WSJbJ2kQ/
         nPUTnBjlMsKKatLFxgSrACUGKTBRtKauFrr1X30z+qe/zaK0bUia0Gjm5vQn/GUe/PAl
         JvZg==
X-Gm-Message-State: AOJu0YzAlhO4J0PKa4Pky+juMFMcgng1Cg+T5JY0wxAsYwten2XG1/PD
	LdO9l0iSHgLqG5bpyRIE1DxEww==
X-Google-Smtp-Source: AGHT+IH4BbpgAYSDNmkCDn1A1cdp40MuzlvwbAbaw9Qm62d8nR+39W9ryYseX4N7bVSvglJPyBfRuA==
X-Received: by 2002:a05:600c:220d:b0:405:3455:567e with SMTP id z13-20020a05600c220d00b004053455567emr7519654wml.5.1696166437461;
        Sun, 01 Oct 2023 06:20:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba85:d0c7:3f23:eb3d? ([2001:8b0:aba:5f3c:ba85:d0c7:3f23:eb3d])
        by smtp.gmail.com with ESMTPSA id q9-20020a7bce89000000b003fefcbe7fa8sm5250082wmj.28.2023.10.01.06.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:20:37 -0700 (PDT)
Message-ID: <0b6cdab5a79dd36ed88f25de594529ee99d8c3ea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 00/10] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 01 Oct 2023 14:20:36 +0100
In-Reply-To: <1789F42963592BBC.31348@lists.openembedded.org>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
	 <1789F42963592BBC.31348@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 13:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188485

On Sun, 2023-10-01 at 11:13 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2023-09-29 at 16:04 -0400, bruce.ashfield@gmail.com wrote:
> > Given where we are in the release cycle, this clearly is NOT a typical
> > consolidated pull request.
> >=20
> > I've done what normally takes about three weeks in about 4 days.
> >=20
> > With 6.4 going EOL before expected upstream, it really isn't a suitable
> > reference kernel for the release.
> >=20
> > So we've decided to take on the task of getting 6.5 ready and available=
,
> > and at the same time moving the -dev kernel to v6.6. The -dev kernel
> > testing for 6.5 was critical for this, since I already knew the core
> > was sane.
> >=20
> > Also we've never shipped purposely mismatched libc-headers in the relea=
se,
> > so I also took the leap to update the libc-headers to match.
> >=20
> > I've already sent fixes to meta-oe, and there's a btrfs update in this
> > series to fix breakage that I found in the tightly coupled packages.
> >=20
> > I've built and booted core-image-kernel-dev, core-image-minimal, core-i=
mage-sato
> > for both glibc and musl for all the supported architectures.
> > There will be some things that break regardless, but this needs the
> > better coverage of the AB.
> >=20
> > If this causes too much problems, our choices are to ship 6.4 EOLd, or
> > fall all the way back to 6.1.
> >=20
> > I'll remove 6.4 from master once we've figured out the fallout from
> > this kernel, and which direction we are going.
>=20
> I've merged this series which seemed to work fine. Given the time
> constraints, I thought I'd throw some 6.5 testing at the autobuilder.
> It ran into two issues. One was cryptodev, I have a patch for that in
> master-next. The other were entropy boot failures on arm kvm:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5512/st=
eps/12/logs/stdio
>=20
> [    0.796831] Key type id_resolver registered
> [    0.797581] Key type id_legacy registered
> [    0.798724] Key type cifs.idmap registered
> [    0.808070] jitterentropy: Initialization failed with host not complia=
nt with requirements: 9
> [    0.809690] xor: measuring software checksum speed
> [    0.811307]    8regs           : 12333 MB/sec
> [    0.812862]    32regs          : 12322 MB/sec
> [    0.814885]    arm64_neon      :  7851 MB/sec
> [    0.815626] xor: using function: 8regs (12333 MB/sec)
>=20
>=20
> -----------------------
> Central error: [    0.808070] jitterentropy: Initialization failed with h=
ost not compliant with requirements: 9
> ***********************
>=20
> I did find this in google:
>=20
> https://lore.kernel.org/linux-arm-kernel/68c6b70a-8d6c-08b5-46ce-24360747=
9d5c@i2se.com/T/
>=20
> which does bisect to a change.
>=20
> I'll rerun the autobuilder testing with the cryptodev patch and see if
> anything else transpires.

In case anyone else tries to trace it, the dependency chain for
jitterentropy looks like:

CONFIG_CRYPTO_JITTERENTROPY
CONFIG_CRYPTO_DRBG
CONFIG_CRYPTO_DRBG_MENU
CONFIG_CRYPTO_RNG_DEFAULT
CONFIG_CRYPTO_ECC
CONFIG_CRYPTO_ECDH
CONFIG_BT

i.e. bluetooth ultimately stops you making jitterentropy a module.

Cheers,

Richard

