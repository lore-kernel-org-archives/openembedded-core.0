Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.27042.1590717458142793420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 18:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CwPAyCt4;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id g18so713471qtu.13
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 18:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8CMDJg914tHrAId/cAdBFJ/J8NDSf2czU3uQeoorg3s=;
        b=CwPAyCt4aXbpFPU1nZU3OgfAHrjEmBSL3OsoPWGqGkw9MR11ullkrEauRy5y/7MJk2
         ITcoBtrUTg3H9E65CsV5uFSS8+01Se56a9Y9KUHF0j/UfiRNhDTZpV9UXKa/Y/BMoGOT
         urS1ZOaBEKU8esMkP0F7D34dDRZ5SXiKAr8PNUaCH4a2W/PsW9QQskjTzmYHY3Fi6s+2
         CZrGJJEyoo22GtYIccesVoFjXBII+Haij+7O2E6bRKB+j03WS/JtmpshmMBiEF9NfULh
         oZCj1AhZhoekVEkkC6DXU6AzEKIM+9zSuBCJp+xK/3EHDy+Z3WPCz5BIGfEmZg6taMJT
         yc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8CMDJg914tHrAId/cAdBFJ/J8NDSf2czU3uQeoorg3s=;
        b=iCduNLeSRlBcDvWYC6ITFjfOfCCQ9a2cmcLqMGsT8/0/bxYuwl/YIJLvPy3J4Yvgmv
         xYkeIE52d9YlDHsMbWSPfqpBAlVOrDwXyLlQmpkJQ2mQ0HrxLwgrRJCJE3IgF2CKWF8Y
         XX6zm1JnOskUQhKFdjYk/WGFXgqoz8axTGS/1k+PqUtf1gb59L2j/gvS80+tYRHBlRur
         evAR+KUbXoHKm6bhRET9Hjf06z7XmyzntmHeAo29l6XJi63DH4uWg7xb2b+V9sypb33E
         ueDW++uIH0rSqkegrDPo9i9jO5l5wud+Z7c+IBNPwy/mloDyoMZihMk62+IieomW/2ls
         BKOg==
X-Gm-Message-State: AOAM530NKTGNsVjGp66NpczYii+zdCJpq9O9mSuVHIV44T47R50FhHJL
	wACpZcAEWrjGPNirx92nZT79xPCRqrxpn63ABro=
X-Google-Smtp-Source: ABdhPJwGQyrwBjz0Yu1QJIQnXqDdCyuUqZYH/ns3MuGvOlXw3qYGFwb/25wS9oYW4LgMUZHPCFmiUSeeQRRxbTHmutU=
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr6326936qto.285.1590717457033;
 Thu, 28 May 2020 18:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134844.105405-1-trevor.gamblin@windriver.com>
In-Reply-To: <20200527134844.105405-1-trevor.gamblin@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 28 May 2020 18:57:10 -0700
Message-ID: <CAMKF1soY7W40VRw-puspRKkmQ0FEiFk35=W_z=uz93Hj2mWVxA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] llvm: upgrade 9.0.1 -> 10.0.0
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 6:48 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index d24ed761bf..787cc3adcf 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -19,9 +19,9 @@ inherit cmake pkgconfig
>
>  PROVIDES += "llvm${PV}"
>
> -MAJOR_VERSION = "9"
> +MAJOR_VERSION = "10"
>  MINOR_VERSION = "0"
> -PATCH_VERSION = "1"
> +PATCH_VERSION = "0"
>

It also needs updating LLVMVERSION in
meta/conf/distro/include/tcmode-default.inc
secondly, I would suggest to wait for 10.0.1 which is releasing in a weeks time.

>  PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>
> @@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"
>  LLVM_DIR = "llvm${LLVM_RELEASE}"
>
>  BRANCH = "release/${MAJOR_VERSION}.x"
> -SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
> +SRCREV = "d32170dbd5b0d54436537b6b75beaf44324e0c28"
>  SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
>             file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
>             file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
> --
> 2.24.1
>
> 
