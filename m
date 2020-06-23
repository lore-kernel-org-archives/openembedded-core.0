Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.5618.1592914730493943880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 05:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RsRGX/Ul;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id d15so16164928edm.10
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 05:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kpptg+Pf4bey/A57g4gOg8vPgDJCVNGR9iVn40DxiJM=;
        b=RsRGX/Ulv8hGUYW5E/oJv/MyhxTNkkXSOcUFVKJrSbmGdq9vOGhsrSpTBontvtN7BC
         0PlxEx8hGhiUf6cRd7op7UlBoYpKzDpk81+NuFNELcYdVu9jbY0eyb055pi8JAZK53xW
         DZnKvxCGDNynGdcQ7oaMdb6B0ZGWY6YfVnRZFx8bHWcjkrsqauvqFlwlmUvCC9HjRkhf
         mJnKBvv3ylQ4E8v3puTUMrEC7cdPwz6YKDSp9GwnMfdlFCToOsfDjlfpXlCpH4dN8CIx
         zzAT+L90SfrLlPfpwNS/S6P0xyCdSRx6sGtS7D7jiwO9F8C5mo1zvmcc4AuF4GTGlA3b
         IinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kpptg+Pf4bey/A57g4gOg8vPgDJCVNGR9iVn40DxiJM=;
        b=ckJIExEVPkm+FfuvO7ba3uDFn7qsIDxuLAkI5ZVk+JZIvUF9BmnziCpFbzfGfS0DOj
         auA4hzCrwI4mhmjqAAEdwoVjFY5MNjtyp4KiUOtQuLiZZm9/e30pyntTOgEgk/zZSOCf
         jQZIxg0+wIZvhIbKDz2la7hUTAJ63FU3yyJ2ifqyWhIBOduif78Rkmb4L0Skd3QmeLxO
         EL7saFwh9cxupxdXO3L8J9guiIF4Zw6Ag3uCGx1Rl5izf94SpZtaWY64ho0/l22BITrL
         tU79KyjB9iDpZyeQg32ADDJe7g0V9hLFrKhZH1XJ3uIjue+LmCYz5hA5Ymwi1pPuAuLD
         JP7Q==
X-Gm-Message-State: AOAM530DA5YEa3h9Hq7C2qBKdIdtmZnpCxSG070Qge4UvaOSrvDrLver
	yOKZ+hKFb4wWEkcWu/EV5B6Y7ppC3HMwI/YU9ys=
X-Google-Smtp-Source: ABdhPJxdnJLEcdE4gO8UhDp5B9AiB9uL16wHpihyh7L0lPEYYx6kUZ40jAIw3FHuOy7C2SHN+MSppAugS4oiGUcpFVA=
X-Received: by 2002:aa7:de08:: with SMTP id h8mr20973379edv.164.1592914728629;
 Tue, 23 Jun 2020 05:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <1619EF7B69C83A3C.10370@lists.openembedded.org> <9de30c55-f97d-59f7-11a3-0366349102b6@windriver.com>
In-Reply-To: <9de30c55-f97d-59f7-11a3-0366349102b6@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 23 Jun 2020 08:18:37 -0400
Message-ID: <CADkTA4NPL0jU-edpy2r-H0=1v=ugvKr7NQ3ELyKO11i1rDG2vg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 23, 2020 at 4:26 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> ping Bruce

heh. I was waiting to see what Richard thought, since he noticed
something in v2 that I missed :D

I'll have a look at this later today.

Bruce

>
> On 6/19/20 7:47 PM, Xu, Yanfei wrote:
> > From: Yanfei Xu <yanfei.xu@windriver.com>
> >
> > v1->v2->v3:
> > 1.Put the symlink creation at postinstall script instead of build time.
> > 2.Add a postremove script for removing image created in postinstall.
> >
> > Yanfei Xu (1):
> >    classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't
> >      support symlinks
> >
> >   meta/classes/kernel.bbclass | 19 ++++++++++++++++---
> >   1 file changed, 16 insertions(+), 3 deletions(-)
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
