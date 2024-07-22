Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76ADC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 09:22:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.14278.1721640156005478829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 02:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YzQlpmWl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42726d6eca5so29378825e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721640154; x=1722244954; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AChxlrSPR4An3j8xuRqtgKfrIOTFX1nBCTGDrh0zYc8=;
        b=YzQlpmWl8bfFfbXJyrHbMs0hejyzkb+I+RZ21vSbWmEDgHLxJbFrdep2yn6iQxiHgM
         s5wBSJVbrtSirNkdXPdqrcoI3mSvYS5f4q6ZTLAdVStkcjQHWCHD6hN8KV/PExzQWsUi
         rD7Kw72yTCVHu2VZUdrHiAWBYPZVGgDpmZE30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721640154; x=1722244954;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AChxlrSPR4An3j8xuRqtgKfrIOTFX1nBCTGDrh0zYc8=;
        b=o9esGyAVITK2KR9OvJJlU+QZ6OnQv8tNxFOtVG00xiKxIwYLCt/CQVXYUrl9ptQEnl
         raBbcQT5cvD+tctkj7uH1q40Xuyk9PPTW4mJPjOflqSPKJfVtKad1EtQ4V8anf8cRPIt
         pn0nVQMVJsipHfdQGhQnCcx5FVbYv7gzG+m8VuLqrVPLDZWZ5gmhjDwsfYkWckXbQuBy
         4Nvdbk5VRvfReeyYU80I9qU/GDNSOUWfg/LjH/8TnkPWq1yWwg/RA7xN7ETmE+8d9T2N
         lCqOgif84kYSlvsYjOcpm73lek6yTTJh1elRqev/O4t7rg9L9Nwuom/A21WY/FnaYK8p
         2CTg==
X-Forwarded-Encrypted: i=1; AJvYcCUWZDGH5ktEb9cvpRqV34pb50QzDHl/RIwZK/V1yZ2mra2UBzu4albeW55T/7EeBmC8IXZLwgX2X6uZELzNvfzVsqDwaRlcDJkjgcKIcmBi9dGMGil69nBv
X-Gm-Message-State: AOJu0YwyjR2UZxPrj3Za09Zhu+/NbBnxKVexq7gcWzC7c7YSVrrpRU3M
	ET2xCxh8eCiUsPbXplOy7S/c5X75Y2sPCmfDtKp13toQJxdP168IRILSwMEk64w=
X-Google-Smtp-Source: AGHT+IG+Yv2sAP/9tyFu7ZFZbem/gFlrxxEVHoWhPbAHdziggqEF1K1k51u5Cuq/IA239NnZU8ZUuw==
X-Received: by 2002:a05:600c:45ce:b0:426:63b4:73b0 with SMTP id 5b1f17b1804b1-427dc578924mr40479675e9.34.1721640154215;
        Mon, 22 Jul 2024 02:22:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ff2:149f:b661:e63c? ([2001:8b0:aba:5f3c:1ff2:149f:b661:e63c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a947fasm146594755e9.43.2024.07.22.02.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:22:33 -0700 (PDT)
Message-ID: <f4d52025ba8c00ceaf60819d21ebf62532e8b535.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFT][PATCH 1/2] glibc: Upgrade to 2.40
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2024 10:22:33 +0100
In-Reply-To: <20240721180336.2642270-1-raj.khem@gmail.com>
References: <20240721180336.2642270-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 09:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202312

On Sun, 2024-07-21 at 11:03 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> Major new features:
>=20
> * The <stdbit.h> header type-generic macros have been changed when using
> =C2=A0 GCC 14.1 or later to use __builtin_stdc_bit_ceil etc. built-in fun=
ctions
> =C2=A0 in order to support unsigned __int128 and/or unsigned _BitInt(N) o=
perands
> =C2=A0 with arbitrary precisions when supported by the target.
>=20
> * The GNU C Library now supports a feature test macro _ISOC23_SOURCE to
> =C2=A0 enable features from the ISO C23 standard.=C2=A0 Only some feature=
s from
> =C2=A0 this standard are supported by the GNU C Library.=C2=A0 The older =
name
> =C2=A0 _ISOC2X_SOURCE is still supported.=C2=A0 Features from C23 are als=
o enabled
> =C2=A0 by _GNU_SOURCE, or by compiling with the GCC options -std=3Dc23,
> =C2=A0 -std=3Dgnu23, -std=3Dc2x or -std=3Dgnu2x.
>=20
> * The following ISO C23 function families (introduced in TS
> =C2=A0 18661-4:2015) are now supported in <math.h>.=C2=A0 Each family inc=
ludes
> =C2=A0 functions for float, double, long double, _FloatN and _FloatNx, an=
d a
> =C2=A0 type-generic macro in <tgmath.h>.
>=20
> =C2=A0 - Exponential functions: exp2m1, exp10m1.
>=20
> =C2=A0 - Logarithmic functions: log2p1, log10p1, logp1.
>=20
> * A new tunable, glibc.rtld.enable_secure, can be used to run a program
> =C2=A0 as if it were a setuid process. This is currently a testing tool t=
o allow
> =C2=A0 more extensive verification tests for AT_SECURE programs and not m=
eant to
> =C2=A0 be a security feature.
>=20
> * On Linux, the epoll header was updated to include epoll ioctl definitio=
ns
> =C2=A0 and the related structure added in Linux kernel 6.9.
>=20
> * The fortify functionality has been significantly enhanced for building
> =C2=A0 programs with clang against the GNU C Library.
>=20
> * Many functions have been added to the vector library for aarch64:
> =C2=A0=C2=A0=C2=A0 acosh, asinh, atanh, cbrt, cosh, erf, erfc, hypot, pow=
, sinh, tanh
>=20
> * On x86, memset can now use non-temporal stores to improve the performan=
ce
> =C2=A0 of large writes. This behaviour is controlled by a new tunable
> =C2=A0 x86_memset_non_temporal_threshold.
>=20
> Deprecated and removed features, and other changes affecting compatibilit=
y:
>=20
> * Architectures which use a 32-bit seconds-since-epoch field in struct
> =C2=A0 lastlog, struct utmp, struct utmpx (such as i386, powerpc64le, rv3=
2,
> =C2=A0 rv64, x86-64) switched from a signed to an unsigned type for that
> =C2=A0 field.=C2=A0 This allows these fields to store timestamps beyond t=
he year
> =C2=A0 2038, until the year 2106.=C2=A0 Please note that applications are=
 still
> =C2=A0 expected to migrate off the interfaces declared in <utmp.h> and
> =C2=A0 <utmpx.h> (except for login_tty) due to locking and session manage=
ment
> =C2=A0 problems.
>=20
> * __rseq_size now denotes the size of the active rseq area (20 bytes
> =C2=A0 initially), not the size of struct rseq (32 bytes initially).
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Thanks Khem. I ran this through the autobuilder and there were only two
failures. One expected as it tests the buildtools libc which doesn't
work until we upgrade uninative. The other looks to be an intermittent
qemuarm failure. From my perspective I think we're looking good to
merge this!

Cheers,

Richard

