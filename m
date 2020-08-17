Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.51234.1597693675513711632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 12:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hjkQLbTI;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 6so13413540qtt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AubHDk5rKcO5pCUI7ZjddcFNrPIwmpWW3curQM0uGW4=;
        b=hjkQLbTIVqhGUZIIuewqP+kC9X7SgHzdzo0FVkdikMArfeSslwCDeg8zP4Fv+sj0xG
         0n5OO+n8GLeH2v1KpFR9uS02orxCWk6sRg5FqlYYz9FcWRHjyXFqxfHCQljky72hAd+P
         Vsc15X7vFsziE8o24BFMDml2LDucZMI8yd5+VTXzlsC9GgfFMQrJ6L+c/hlUVPtKT8u1
         Dekwaca0NiEv0+JBdqTXmK42jCaPuTNK1YjEya2HTsOCDD5tFgFc555XKpwTNOVvqITS
         XfRk+vN3h59BKW5IaB8n5kPiCoYFg9RVWgEClFcI+7jd06dUHxOHvjjcc3QBKDwF4Vkk
         gwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AubHDk5rKcO5pCUI7ZjddcFNrPIwmpWW3curQM0uGW4=;
        b=GHfNSGDQXkYy2bo+Ifer3V0KV3ISsb6/YxNF6cyTpTgBH4Fr59rzHr3VGdGJAHplxd
         wqFV+rYHiMUIGJ/vzOwT1WWK5oQA1d4Dp4SGV9M8+5wiBezMccO1r/sRqXsovP7GKpK9
         CRnE9Q5gdyD6LcuIHq9T/tJxQFBnVFEP6kYKFhHBM2w2MG7BXss+/no6NoyQh4TsXfW8
         wvwhRDJv0lEz/PXmNK2jMF6t7f8D41mqWARmwm+FRVpWNz01Q6a1PfmjMaXktogh1Q7q
         DVE/oXLjp16coj8nAjMH4rVhHd+ykpgRJXb9HZu+jxudmEuSBc9AGn1HarnRnZZtt3gc
         LCGQ==
X-Gm-Message-State: AOAM530bb3AhY8V7/ZQJnB/GyjNCl3FXa91jlSieUKWl/mK7fo1pEk2d
	2cppAiQJqMyMNBdxOKBUYLrXYUHwGGdXXnlIRtI=
X-Google-Smtp-Source: ABdhPJxax+/aq7TUeSfDjvFxfK3Uzm+wRtPROZU7h7uprHtWN7lGTWZFhzLndQZKsPd4RDKBF+ZVGl9ALsVNayilRKw=
X-Received: by 2002:ac8:4097:: with SMTP id p23mr14149007qtl.316.1597693674484;
 Mon, 17 Aug 2020 12:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
 <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
 <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com> <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org>
In-Reply-To: <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 17 Aug 2020 12:47:28 -0700
Message-ID: <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
> >
> >
> > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > > > Bruce,
> > > >
> > > > We need
> > > >
> > > https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > > > backported to 5.4 kernels for perf to build with -fno-common can
> > > you
> > > > queue this in your kernel updates as soon as you can ?
> > >
> > > I think we have other active kernels which will also need it as
> > > even
> > > with Khem's patch we still see failures:
> > >
> >
> > I've taken care of linux-yocto now, I don't think there are any
> > active use cases for those kernels that won't be covered.
>
> I bumped the meta-yocto BSPs with a quickly hacked up patch but we
> still see:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339
>
> so I think there may be another patch we need somewhere...
>
> (which matches what we saw with Khem's _append which also failed).
>

there seems to be concaternation of compiler options without space

| arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option
'-mfpu=neon/include/uapi/asm-generic/errno.h'
| arm-poky-linux-gnueabi-gcc: note: valid arguments to '-mfpu=' are:
auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16
neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2
vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4
vfpv4-d16
| arm-poky-linux-gnueabi-gcc: fatal error: no input files

but it also showed up on x86_64 in one of your prior builds, so I
wonder if its something in kernel build system or is it processing
TUNE_CCARGS in special ways.

> There is still some piece of this we're missing, maybe on non-IA.
>
> Cheers,
>
> Richard
>
