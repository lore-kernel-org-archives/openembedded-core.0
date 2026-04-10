Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98219F44868
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:16:03 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155870.1775826955452597462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B/vH219H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b983bb07eso1278370f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775826954; x=1776431754; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8T7ZZqhyotMF0Ly/TXsxkAtQ2hK1aXj/AQVomg3iEtI=;
        b=B/vH219H2YIcYsZGGAGKLwNWBL7aFQhjHERRIB6tdTpeJUcYXdYGvXI4IvWwQZ5M1l
         WAw2nFnzqMEyPYMGcwRAoIA1Dl83CQemmbpAjnf6FJ6QhYy88AA/HsK0MlSE8Kas4JfC
         uyxdJwzJBV1zgrhC4IGcRX/BvgQJ6hNVcFrmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826954; x=1776431754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8T7ZZqhyotMF0Ly/TXsxkAtQ2hK1aXj/AQVomg3iEtI=;
        b=mn0m02rOMtZJM9gEBtdHXFjxkxJy5YMMCsbB4sYnkZQdhlNCUSFs0u34yPpNFBxJOs
         4f5379VnhFLiYCu+lQPJ9doDuO46LcQMb5mWNznroOUZrFHxlYMpmkL+r8C/XUhFSU7j
         3Ji9Bu/FdktLuqZBvWJUM0ye1bWjgNIH+biVMFr3MTCVWX6EGXjV0uwqbyV2fTyWIPf9
         +dzGRWTH5pdjMm0L6ihmbahzVemDl2hDb8W4HfPFeXKSY+m99QPdLq9hZet/iGxh0MGS
         q5X1p1U4lANt4nRZ+hlVKFCKSPpibiZCR+hmVX3VdiJGUZodne3fWnCO68Ou4V8lxpp6
         SQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW34uvkhR3DU30Dz6NPzWESRnEjeTK8R7P1KPuoJVAp2HQYWx+fdisZvbs/t81MgPM++1/C4Mdgo8tSr4bDfDpylw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDichm+vPdCld9/xfRITEmsnDcBfzg4OPQ0mq2m/2rzEh/yK1y
	oN5DqfX1UbAlNwNPG+vSjb5XWpBYGTRDlXx2eaR/EEgsBU6DqbvYsKWdL9KR55MFhvs=
X-Gm-Gg: AeBDieuurj4Nc2pZcxF1ZHdbgw0kQib+lWok23k8Wkjj7j3Qz/qgd/NRQknS4tmMfMA
	pixhGJtRokaFT2qpvc/2jp75K7yTA6Kv6sMkAI5xXXkK4S7kMeDJadnYwff9FKrFgatM5pjtLCS
	NkzYQi7HXsJlIM6WJ+akbSlV/LxZSXzs0h0m7lrSBNXJiyuyZXb2EaLW2sXYd4K+JkTtieNI+tE
	qEqzBER0O2pdZU1SV1KK7IVyF6Yxii4RqtrEypmvWN7p6lB5MrncJ/+jEeiaUbQODKouKD4tB1G
	3Fb8duhl98mixcYIYWHY7NPtqhdnB3A2U6juPOhc2DCMu2tH8CjmFHehge9Vrz+7mDrcsMRPX0K
	PIZbvkGHzjGjInOMarYULus5/wCeP4BVRzNWg9LxL+EGQYhy83FIjdaLLQ465Rz3NARKbTYJDu0
	yTNv/bOpqdCRrK9nLc7DSG/cZc7Sq3eFI8RVR9B/KfLXUhp3G1sBluSeUGDOEU/eBlaUfJiO9ZP
	DcerbvIpi5WI5Pk
X-Received: by 2002:a05:6000:1ac5:b0:43c:dc99:771c with SMTP id ffacd0b85a97d-43d642bf201mr4571392f8f.42.1775826953696;
        Fri, 10 Apr 2026 06:15:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:adab:5ac1:52a7:a200? ([2001:8b0:aba:5f3c:adab:5ac1:52a7:a200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63deba9esm7839947f8f.10.2026.04.10.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:15:53 -0700 (PDT)
Message-ID: <c8e3d16047191a697c26bfdfd7885fa8f560a7dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] db: Pin to use C99 std
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 14:15:52 +0100
In-Reply-To: <20260408044737.696968-1-khem.raj@oss.qualcomm.com>
References: <20260408044737.696968-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235029

On Tue, 2026-04-07 at 21:47 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> GCC-15 has switched to using C23 by default, we have been selectively
> disabling warnings as errors to get by, however with autoconf 2.72 adding
> -std=3Dgnu23 it now gets enabled for every compiler and clang-22 is more
> obidient and has dropped support for K&R C completely. db5 code has a lot
> of K&R C prototypes and it starts to fail vigorously. We can not keep
> working around with out uplifting sources to be compliant with newer C
> standard like C23.
>=20
> Therefore pin the cflags to use C99 standard as this package expects.
>=20
> Drop the code to disable warnings as errors selectively.
>=20
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
> =C2=A0meta/recipes-support/db/db_5.3.28.bb | 9 ++++-----
> =C2=A01 file changed, 4 insertions(+), 5 deletions(-)

This seemed to trigger failures for me, e.g.:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/3538#bb-=
step-15

Cheers,

Richard

