Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8014C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:51:15 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.947.1715964666799554807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 09:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MpzGsf8Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c99501317bso207750b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715964666; x=1716569466; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7HUhSNdzTETGyraufDm8I/lVrjVKsdxMxaFtMki1uo=;
        b=MpzGsf8YMkWHyEgA6LL09kTc9K+WqVUYe2hE9U2jsNQhTffUVQbcw2ez3SBblDzqhJ
         lYmrMmDhsQl7OQrxskoTP+8UkDz9XaUTGy9j5BgAS3yFn48NW2yKK5I4UFgWmJyHfCWW
         mjIwuKQevVJPkAuoaFPLgFQRBqewzQ4Hkk76CC/1JDKm3Hi718EF93a7N646tHiIeJ6W
         SHei6qKia3jc0alAp3vbEKhaW48VkJb9SkCYV+mSs+vSnlIEbB7LsSCTDAnjsocfBXxx
         BjP2nKjpes38ZmZpZA+mp5CtDWxD6Dw52fAR6E23cG5tXP/MjmyHsgsGEVcIrayZLhSz
         cONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715964666; x=1716569466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7HUhSNdzTETGyraufDm8I/lVrjVKsdxMxaFtMki1uo=;
        b=GJJ5gCYVbPHNYR7ovDj0tSpisyRWJt7CgTIXcOkR1t3YZP5XYel94j2RS9ZWMycN+l
         X9Q1r23VzBaCYkMGe8azOXWDB+p9I9AJe2qV0mQvnJmT+vWUdvdB6ATK2fFdnWMtGORB
         YdQ3spAl1iwv57CAi1wneU61UDpwcPuE/UX7wJVv+3GxZPJ/5Uo036EqUyf6Ds9lW6ch
         M507P+84nnYaKk18WksDMFfD2C3AqjtDGt/Xh1KlQ1wSs7Zr+I3v0Yk2/XHBD6XZTwMR
         ycsILTKmL7izqLQSIaf6SlUDx5RozkW1VLuC1LVKQ6CWGc7hlmCkCxwniaEqB2S7YzWu
         d3vw==
X-Gm-Message-State: AOJu0YwmDbBy47Y7g1tMwBkFjH18Jox6tdoyYQVTctvRM5G3J8YnZnSE
	3vr6Cimme+aJRQgpHxH8mRvvQAPAhKKHmD/jalN7tebg64PO2PeA4vwJNEnxeQwkA7EdCl5Esbn
	rwo0aM+BVMbR5w4hVhMJIh+dPijOzHUUAJTw=
X-Google-Smtp-Source: AGHT+IGuRN45cvHsd6aTbgTZJoYoHQYC3mJFGsbouUjvk/woa2cgCvJAJktX3MDqKFtQ6OJ0TpLUPFu+meYHbYsZVYo=
X-Received: by 2002:a05:6870:d10d:b0:23e:4c7e:d018 with SMTP id
 586e51a60fabf-24172f6746fmr25790049fac.41.1715964665155; Fri, 17 May 2024
 09:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240517161414.3929890-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20240517161414.3929890-1-sundeep.kokkonda@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 May 2024 09:50:38 -0700
Message-ID: <CAMKF1spghRNSyEU2ZKPbLQAPH8L_W5_ss6D6hZ9-nFusaBQ_zA@mail.gmail.com>
Subject: Re: [PATCH] binutils: stable 2.42 branch updates.
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	harish.sadineni@windriver.com, umesh.kallapa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199524

lgtm

On Fri, May 17, 2024 at 9:14=E2=80=AFAM <sundeep.kokkonda@windriver.com> wr=
ote:
>
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> Below commits on binutils-2.42 stable branch are updated.
> 6224493e457 Re: PR26978, Inconsistency for strong foo@v1 and weak foo@@v1
> d125f967537 hppa: Implement PA 2.0 symbolic relocations for long displace=
ments
> 884fb5373a1 x86/APX: Remove KEYLOCKER and SHA promotions from EVEX MAP4
> d816fda3cbd aarch64: Remove B16B16, SVE2p1 and SME2p1
> cb11047e34a Re: Move bfd_init to bfd.c
> 818bcf40efb print cached error messages using _bfd_error_handler
> 831be495ef1 aarch64: Fix the 2nd operand in gcsstr and gcssttr instructio=
ns.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 3b6f47d4ce..b4d273c9c3 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(=
\d_?)*)"
>
>  CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for version =
2.40 and earlier"
>
> -SRCREV ?=3D "553c7f61b74badf91df484450944675efd9cd485"
> +SRCREV ?=3D "73b22b4481e85635eb978585f405c4433bcc0174"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"
>  SRC_URI =3D "\
>       ${BINUTILS_GIT_URI} \
> --
> 2.43.0
>

