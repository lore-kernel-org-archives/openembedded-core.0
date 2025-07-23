Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B49C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 19:15:19 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.23326.1753298113685108651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 12:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fToo/5l/;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-717b580ff2aso2845837b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 12:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753298113; x=1753902913; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBzQDTDax/CtFNj+OhF/C7Pr7dUYGhI+gCi2pJ3TEhM=;
        b=fToo/5l/+FgmmPxdVj4l4uw2FmszEgQRiJG/e+ACM29+3knfMJN3fNBlHptxyQi6k5
         BVAxFzVRR8+jhFmnEn5ts/LARCedaUEwJCQC1UrJbfiL1LHEW1ytoY0mC7zosKeK4xHg
         nSpGJw6UcoRYZoz4oBfEl5MR+H6dy7KL3EN43RAiwqWD0biFu6mngbQFHJBrcUs6a5Dw
         lXnJwRAK1sieiaWWt1Yz0uAdyDUAKVGwPoWi40vgTLCuh5Rj6aw7gKbw+xDtCk2Ajodo
         NTGZLih50z/+wfr8dcxMeZK9rJX/GLl930swjMiRoLMw90Or+SIL+OFT8nMCi/LLDJeV
         MIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753298113; x=1753902913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBzQDTDax/CtFNj+OhF/C7Pr7dUYGhI+gCi2pJ3TEhM=;
        b=GO1mFXZIjBYJgwy+n0wPhZ2+0PgCLV7onDmN1omhOUFpXVZG8/f0JQu7Aw52Dszg5s
         bwB5CgSpjpJLgWe0UO6gmel34osOYqt7mcIyM1HtG7nPwxEMFkjh8RQWh0gnUfe5Iajm
         CltdeeFQ9Yn+5jzAWyMRl6Rv1H+NaHpzlx15gmjlG93J+gUXOjVy21mHcz2Jp7jXwaKR
         yi0tCG54MXXaazzGBikvXxMeq3gTGZfafZMouvj3fAFNyo3hEqVJc4NAmL7Z/H/VST8f
         N8P8cZtFVq2j9FwkE7mciITiq4cEQO9BNrsjY+MyjDlvq96kxYEKQOQXWk00JyMZPZRt
         N00g==
X-Gm-Message-State: AOJu0Yz4QZ88fFqaaSpKGVoq+jiAfP3RKQYDgzzfOjZjW26NXbR3PAmV
	iidGsxJtCW5tG8PS3Frkmugx8Sz/JNySmNP80Wy5m/sjtPJbZDidZEING33JR0bf0ksAqJSFbp0
	kRJx5TqPGqrOyp7VR4tS7zgtSVlpVjRd64JwAXaA=
X-Gm-Gg: ASbGncunVi/9O9vTCMcZVKY3/87vB2ylR6jcr2k2HaE9F8cOhcQbuwDo9fxtogroZFX
	kzs7z5AqqXa0DPga00vdJo1JRbw7qY+b7tOkg0Z71w3/e1uTsLyUNQEb+koZwCvuHxFI8p9MVZ8
	Mle/0C3bYVBOrrEsXjdKP0knkVPNksc6jN54iQoKRzuab+BzCyk7UrjChObnkrb6jpYuxa6NqVC
	JmvCBim5h1I4W1FHHMs5zQ4RkAsECOOOek=
X-Google-Smtp-Source: AGHT+IGNIpsAyl4L0rCZfznMnrkVUkagzJW4qW95f6XJWRfvepPuOn1MZbhE3HW+3IWzXPUiME2wLAiR7Ny5r2CGvS4=
X-Received: by 2002:a05:690c:6c0c:b0:718:38be:b3e4 with SMTP id
 00721157ae682-719b4332ceemr54358557b3.40.1753298112503; Wed, 23 Jul 2025
 12:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250723122448.2250339-1-ross.burton@arm.com> <20250723122448.2250339-2-ross.burton@arm.com>
In-Reply-To: <20250723122448.2250339-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jul 2025 12:14:46 -0700
X-Gm-Features: Ac12FXyCQ8qcL_TuwJnG1KEoEvCMwDDjaFA6bWOe-F6hRxy2UktJ_wZsVCO3Wp0
Message-ID: <CAMKF1soq09as9t9AMeF2Q8My4Zv=op-VxqFS6_fhek8b93neSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] lldb: don't build rpaths into binaries
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 19:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220811

On Wed, Jul 23, 2025 at 5:24=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> LLDB defaults to adding rpaths into the binaries which are then stripped
> by CMake on install.
>
> However, this rpath removal is implemented by editing the binary instead
> of relinking at install time, so the final binary will have an entry in
> the dynstr section which is all nulls but is as long as the build path.
>
> Obviously this breaks reproducibility, so disable the use of rpaths in
> LLDB to remove this problem.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/clang/lldb_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/clang/lldb_git.bb b/meta/recipes-devto=
ols/clang/lldb_git.bb
> index 4eec175ff0e..eafc3cb3128 100644
> --- a/meta/recipes-devtools/clang/lldb_git.bb
> +++ b/meta/recipes-devtools/clang/lldb_git.bb
> @@ -24,6 +24,7 @@ EXTRA_OECMAKE =3D "-DLLDB_INCLUDE_TESTS=3DOFF \
>                   -DLLVM_DIR=3D${STAGING_LIBDIR}/cmake/llvm/ \
>                   -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen =
\
>                   -DLLDB_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/lldb-tbl=
gen \
> +                 -DLLDB_NO_INSTALL_DEFAULT_RPATH=3DON \
>  "

I wonder if using BUILD_WITH_INSTALL_RPATH=3DOFF might make a good choice h=
ere
we do not run lldb from the build tree anyway

>
>  PACKAGECONFIG ??=3D "libedit libxml2 lzma"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220804): https://lists.openembedded.org/g/openembedde=
d-core/message/220804
> Mute This Topic: https://lists.openembedded.org/mt/114302503/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

