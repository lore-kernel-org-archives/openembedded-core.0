Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.105610.1597906825850977479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 00:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X3tg28Uo;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id j187so701536qke.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 00:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=EW9tfhx2zD+69kVaaJ2B5ruFkDrYmhtU4y+hIuoQuq0=;
        b=X3tg28UoNqRVWmQR2463WD6OqqGNyCxCK3i0Gck8YSPTVDSwUv+yJOVyW/mT1kWmRw
         PiYloEL//ekm/cNLiVwADdoR/4LgVEKnoJoIASW0xSYRMCylXzNGBi4VBoDnnoGkeG6f
         glOtm4m5iHwF8PA8eMGX93t1/gA9dVDq0qe2tamn+/a+dGvap5qd0C2WSYBj6YeOwFTJ
         vJHKa2guSABpdeCX+2N2DIHMzHc8oQgvBEkMtPDa9pYZVFozlfhB6j+jAlCrPURvUbSD
         0YxpbSbEuVD3QHVngG05XIYV39w2+6ut6vDkOnXgp9FYk07R5wKViDa1lFDPCl8YyW3c
         dPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=EW9tfhx2zD+69kVaaJ2B5ruFkDrYmhtU4y+hIuoQuq0=;
        b=ZaN5n1pOFcoNei2RxEryKwnMmAvONm6d2Rd6zysvMISRdQEwazZFGRoLvLmWW+TE05
         j5R8WUQKi1UK9VVGGx2ehj0/zQ8+4gv48aU+7Xbdd0ny2NRQZYW4lh6y8e83nQLuvAFG
         Mwu2MMFTLou3MNkEjmFb+cNCT2FkRD9y+FHim5Z/epUaUZdeeoQ8TVZuVIezOmn+VfEK
         ie4m07piKih+iEGuyUQVfKtoeQCK3Uj+nlFqvRH6XVhQUncEWPQMSynlSvIJkvqu295v
         L/RviyLqo/DYB2mRhOyEvVt375ueFgo517wTPqKcBay5JZpNRwUYa7nU7xy+jlyCVImv
         hGpg==
X-Gm-Message-State: AOAM532GAoSJNmYuEWa/5ar6q32qWUN+bHI/gydgpbKZzZngbqBAb8Ne
	+Db/UCjEuDKnb2bUvVtvpFkJ4btqdasENyOLzGnJUoWKOQI=
X-Google-Smtp-Source: ABdhPJyC62EI8nBp9QknKIXa+HsKqushqGI8VRuMuCnB09XrqKynhuR7bJ9AZg/vvKFVq4NreNmYZqbv9wqhLXHBdt8=
X-Received: by 2002:a37:9e91:: with SMTP id h139mr1390126qke.71.1597906824642;
 Thu, 20 Aug 2020 00:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200820065727.2589128-1-raj.khem@gmail.com> <20200820065727.2589128-4-raj.khem@gmail.com>
In-Reply-To: <20200820065727.2589128-4-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 19 Aug 2020 23:59:58 -0700
Message-ID: <CAMKF1spmMoV2hCBaZUwP5DBtxLXLJCxFT1osOZrGmxsJKf7Rnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] gcc-cross-canadian: Stop chown'ing D to root
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Please ignore this one.

On Wed, Aug 19, 2020 at 11:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> We run under pseudo and this should no longer be needed
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index e23b21b68f..a58e7ad576 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -136,8 +136,6 @@ do_install () {
>         cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
>         cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
>
> -       chown -R root:root ${D}
> -
>         cross_canadian_bindirlinks
>
>         for i in linux ${CANADIANEXTRAOS}
> --
> 2.28.0
>
