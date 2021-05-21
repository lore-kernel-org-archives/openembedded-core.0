Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.11105.1621613074657657881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 09:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K5zKABdt;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id w15so24546821ljo.10
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 09:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=raFH5izIafhfHhtkc+KlQSA2QzOMYx/aS027JnPijMQ=;
        b=K5zKABdtt/f5aN/EUoiQNlRPWPZ60OC23FpUmwX9QilOzhltTfxHsd2hr7UoO7tj1T
         C6Rhtv1q7vqS9DhI8VSHgyH4bxs/tJQAaJl0SHSMJqL3CthGGpRtnOr98FK5VyUEIC+m
         g3eJrHiVfH5NvJBbyhmJwRpiK3dCUb+WWMOAKj9roHqqXvy0Vf116G/mFKeDL+tu7AVA
         xZb90ZPIrBatE6PFRptC0pIHUpopvhdibTsmTIm84AqSmp9SLAqTy+LbbWoExDcFWzXW
         yphpVfnykzihqHwZAKVxPh6EBnS+H7sdgki3BceaD68VzYM/IQcd4m5+llXAA+pmy6oo
         lLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=raFH5izIafhfHhtkc+KlQSA2QzOMYx/aS027JnPijMQ=;
        b=BSPIYG4+dDg8RB5zGQ+ibdifdyn+PdX7i0XABmK9Su7RhDW3IHARF1vE7GTlkD0VKk
         b15F8CxUE0I1tkA/wXrUFVkRe10MiH132WXzoXDFRtgZijaiYs8uJUoTSMDL7BdCV9yN
         H//RYwR6Xdxt/2KgiXjA1VvFFCPZQkE4q63EYkTl3o0MEogxXho+A6SVS32a4Umw9FtY
         DeDkRk1BI+xkf4ZcokqUBaL0ObfW2tF2dGy/DK2Mwrt103Dk+GKtR6MUsVJyTUVOUXus
         r6pdqBF4upe22EfF8Wacpd9xcpbGG2Quh9bcFV3dBwfWR39Wq2ekaDjAZ7XKxRnAnfmI
         XA9Q==
X-Gm-Message-State: AOAM531nBJ1SnV1jTfsaTtxHsHMs4c7GvkB/oVSHCvFx1cxbNjZu2zOX
	BV6DmcwjjDjxZU0BdTfIE+4usa2viSRfqlsrvVI=
X-Google-Smtp-Source: ABdhPJwJymctkAqCG1Wr31Z+E0lCO3tNnQhMb08XyPQq+8OF6cYMi8U5lQz6xrqgmkdSUay8aC0w/qf/D+gMMvP1pWA=
X-Received: by 2002:a05:651c:38d:: with SMTP id e13mr7476593ljp.226.1621613072783;
 Fri, 21 May 2021 09:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210521122032.196712-1-liu.ming50@gmail.com> <74350fb1207d2596a5fe555461392408147f78ae.camel@linuxfoundation.org>
 <CADkTA4PmzCobkfMARy-xMerRdNH-ZiR_g0VFjw_bjsAqUOHvLg@mail.gmail.com>
In-Reply-To: <CADkTA4PmzCobkfMARy-xMerRdNH-ZiR_g0VFjw_bjsAqUOHvLg@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Fri, 21 May 2021 18:04:20 +0200
Message-ID: <CAHtQpK4WVpSVZd=6bHnJ0R=tgke-L-UFz0RJP+_G3GtZwPaEMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: fix wrong separators
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ming Liu <liu.ming50@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 21, 2021 at 4:44 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, May 21, 2021 at 10:28 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2021-05-21 at 14:20 +0200, Ming Liu wrote:
> > > From: Ming Liu <liu.ming50@gmail.com>
> > >
> > > Change to use '-' rather than '@' as separators.
> >
> > Why? The commit message needs more information.
> >
>
> I had exactly the same question/comment!

I guess this comes from the attempt to fix CVE-2021-27138, which was
already addressed in U-Boot with commit 3f04db891a35 ("image: Check
for unit addresses in FITs").

`@` is prohibied, so the `-` should be used instead.

I believe it would throw the build error, somethign like this:
| ./tools/mkimage: verify_header failed for FIT Image support with exit
| code 1

I do agree though - commit message should state this reason for this change.

>
> Bruce
>
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
Regards,
Andrey.
