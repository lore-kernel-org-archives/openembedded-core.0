Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A851C41513
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 21:07:43 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.3054.1721077657414054293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 14:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BDgAqetP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-367aa05bf9dso2808768f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721077655; x=1721682455; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+O+Jg4HDY1IdgQnRR2Jbepdz/mPQX172AvBURJ4gGyg=;
        b=BDgAqetP0XB8DPvFRAc6ylLzxpH/EgoN3ETpkHQHSWiFlNlA/+qiqR+O4NNoDbaRDh
         b8Vepp7wThy4Qbbm+FwW5F9UF346HZ0fVk5yZwx0z1ERWg/OSnHFMIBBF5aWnTef9Ism
         w5AHJz0CgJS8wY1xqfQhzk09LLXb7U3jBrscI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721077655; x=1721682455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+O+Jg4HDY1IdgQnRR2Jbepdz/mPQX172AvBURJ4gGyg=;
        b=j2w9ktqD5Su8Lx8lufAy94zY5TnZ2Lc9Nj8jPhk3Q6otd9dWxzeoKZSkL+8p6rKvqj
         cqxprM9jHuwABqe2Z68NKvYbB9YzpadjlweqkK0wz0zK9s0veObQDsHwzSSOpNYwTAGT
         G/p2LH/KhG48CAh/QgYewInu9pGkw06Nv54yGz6+viMkxpXuxHd9j2MXVd3JaU2mAbXZ
         FXnbAadNpXl6qH0x+QZm9HoxNT60fGAueWfjLk5HW/MMZB8rQGKJoWjJArhzLf87tAc6
         9mdZL/5Ogk5F2klYaTVqh9ea7rSEp8cA1I8j11k0ONKNXAkHCZFq73w4II3nIEF7P5cp
         tx+Q==
X-Gm-Message-State: AOJu0YzP/0ebWKlZjfl04/eND2Nn+tDdS5h99xIKMDyFH1+ZLous4jLp
	fWkOyh5/Ry0UMCZ0g4AAJzuVdG8CWY2Tevb7V+EvstSLsr1cibXJmAXS89Fy4Kk=
X-Google-Smtp-Source: AGHT+IGpicuRGSdjWpY6bU1lq9IUMClOptWQbwXGroV99ozYMnu2z23w8+lu7zCiLaRfOg41z1Zgqw==
X-Received: by 2002:a5d:6d09:0:b0:367:4dbb:ed51 with SMTP id ffacd0b85a97d-36825d0b159mr69478f8f.0.1721077655593;
        Mon, 15 Jul 2024 14:07:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4132:3ff0:dd64:6503? ([2001:8b0:aba:5f3c:4132:3ff0:dd64:6503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3bcdsm7360808f8f.3.2024.07.15.14.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 14:07:35 -0700 (PDT)
Message-ID: <330caeaef519ceaf40dceac15ccd00be2ed38d60.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 00/12] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2024 22:07:34 +0100
In-Reply-To: <CAJdd5GaA4tByvK04pNycoApWYHeznYVe=y1ckSWsUVu=jwmjnQ@mail.gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
	 <20240712160304.3514496-1-JPEWhacker@gmail.com>
	 <54c574fdb35ef25b71baaf1e1adfa8bd909a5f39.camel@linuxfoundation.org>
	 <CAJdd5GaA4tByvK04pNycoApWYHeznYVe=y1ckSWsUVu=jwmjnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 21:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202070

On Mon, 2024-07-15 at 14:40 -0600, Joshua Watt wrote:
> On Sat, Jul 13, 2024 at 12:44=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Fri, 2024-07-12 at 09:58 -0600, Joshua Watt via
> > lists.openembedded.org wrote:
> > > This patch series add support for SPDX 3.0 and sets it as the
> > > default.
> > > Currently it is not possible to have SPDX 2.2 and SPDX 3.0
> > > enabled at
> > > the same time
> > >=20
> > > v2: Added tests and addressed feedback
> > > v3: Fixed several oe-selftest and build failures
> > > v4: Fixed silly typo mistake in staging.bbclass
> > > v5: Reworked to make SPDX 3 output reproducible by default.
> > > Variables
> > > =C2=A0=C2=A0=C2=A0 that introduce non-reproducible output are documen=
ted as
> > > such.
> > > v6: Many changes:
> > > =C2=A0 * Fixed bug where building baremetal images would break SPDX
> > > 2.2
> > > =C2=A0 * Most SPDX code is now in python library files instead of
> > > tasks
> > > =C2=A0 * Removed dependency on pacakge_write_* tasks
> > > =C2=A0 * Fixed sstate selftest cases to account for SPDX 3.0 task
> > > names
> >=20
> > This had a lot of failures in testing I'm afraid:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7134
>=20
> This appears to be caused because the SPDX tasks are not running for
> some recipes (e.g. automake). It looks like this like:
>=20
> =C2=A0 do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx
> do_create_package_spdx"
>=20
> is not actually strong enough to make sure the SPDX tasks for
> automake
> run for e.g. core-image-sato-sdk, but I don't know why. I'll keep
> looking, but if anyone happens to know off the top of their head let
> me know

Can you be specific about which tasks you mean when you say "make sure
the SPDX tasks for automake run"? Do you mean do_create_spdx,
do_create_package_spdx or a different one?

Cheers,

Richard

