Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.10284.1624639000449234902
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 09:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=T0SpAuLC;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id t11-20020a1cc30b0000b02901cec841b6a0so6721763wmf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 09:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Q86NUXF+sNdicq9nKpo4zfJl2ROyOYqIbMsdzdESTc=;
        b=T0SpAuLChWc/cRLjwmb0V4p6LsoWwAU9z92G4Dsi6TDlOs61gzRnLh4xaKGjB7eWeP
         DD6m8znUF+MofD+nIA+gY/8OOGPq1m67mDEfkVwj/la49f/0RndGFzzgv18P7W76guaQ
         /BjG0LtGrv+CAmg61IJezqfQotx/n5p/leDcfZ1jnO4+D5paI394cRStlOkgW1dykl+F
         dcNQt2ydUK0rgX40uKgLv/Lb6eIBIrJNAGROLxifhqtCeUPIVLEvLSUpH8U+rGAodPxN
         TH2XUKTaeLSKogPv+/LLmodJBEKexmhGhcWTOSiFwxmsq0R6do5x/aK7oZyvo8jUA+uT
         nQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Q86NUXF+sNdicq9nKpo4zfJl2ROyOYqIbMsdzdESTc=;
        b=hyxH2e/A0+ZBUQt1St6l2p6whxF3ZHeJO82JJbpoR6e9M79iu9nT8H36f4DJFaYe1R
         bb/G2YH9vJd09pfLWx4fV760kC19DOv3AWC3Waxtd6nMS5Z3Y5M24g/Ph09+ksEmtvfG
         eLlZ3wsKa5ll8tTpLR5Vr5JiP77UjQ7ACwodbqFIUwxBiXcVORP3kpLHn7SC3ysrWBtW
         9kqJeFzllfkiGacWRlSHMorJaM57khUzNpMfje1Rj6dXY38y/Gbx4EJ/LosifKfFxnjI
         5SEPaUs787tuNPXgVPQY+356kL5z3LXV4odsq9KMjxN40nipU5XgQlr9sIOFTcpUuPuH
         RKXg==
X-Gm-Message-State: AOAM531dY0GBQexDeXvoKd74O0hpZiGQbYPLspPkFX19JxWIyCdMPFwB
	D7TDhUmexBFfShXt0Y5D0I2zMjaGQDrCtm0IhMqLrg==
X-Google-Smtp-Source: ABdhPJyMkEU4570rTiHKNi840iN4tpao/2stCxuqVbJ+ltCkgpcWvipGNTQ1X5vxkGW9AwrQpJUK2yIEDxfDyj+DbK4=
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr11804458wmb.130.1624638998886;
 Fri, 25 Jun 2021 09:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210622112126.2026646-1-alex.kanavin@gmail.com> <20210622112126.2026646-10-alex.kanavin@gmail.com>
In-Reply-To: <20210622112126.2026646-10-alex.kanavin@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 25 Jun 2021 17:36:28 +0100
Message-ID: <CAAnfSTuUEK+huOm1WFyFEQctejRWi4pP8Tu6fwMuCmA9rk7s=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/19] gdbm: upgrade 1.19 -> 1.20
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

A ptest failed in perl with this upgrade in:

gdbm_firstkey: Item not found at ../../t/lib/dbmt_common.pl line 52.
Compilation failed in require at t/gdbm.t line 6.

This might be related?

Ross

On Tue, 22 Jun 2021 at 12:21, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} (90%)
>
> diff --git a/meta/recipes-support/gdbm/gdbm_1.19.bb b/meta/recipes-support/gdbm/gdbm_1.20.bb
> similarity index 90%
> rename from meta/recipes-support/gdbm/gdbm_1.19.bb
> rename to meta/recipes-support/gdbm/gdbm_1.20.bb
> index cd2617b130..51f9d17e49 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.19.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.20.bb
> @@ -13,8 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
>             file://ptest.patch \
>            "
>
> -SRC_URI[md5sum] = "aeb29c6a90350a4c959cd1df38cd0a7e"
> -SRC_URI[sha256sum] = "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
> +SRC_URI[sha256sum] = "3aeac05648b3482a10a2da986b9f3a380a29ad650be80b9817a435fb8114a292"
>
>  inherit autotools gettext texinfo lib_package ptest
>
> --
> 2.31.1
>
>
> 
>
