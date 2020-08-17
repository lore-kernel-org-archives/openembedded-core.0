Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.51407.1597694130825335136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 12:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JAQ0Nar5;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id c12so13415528qtn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VC6ANayeesDGJtzKYrfEY8oqCU/QJXt97qsLvY2HNG4=;
        b=JAQ0Nar5xHwOOLuTQedXT9dBA3vIJNM/oPfvwAFjWV5jTNPbby5pp93IlUTHcsbkam
         dXJODbVUoHJNVV90EXuf8/hm7Nk3w07mBtMWOimq1UZhyG6gBgSD7OpO9v6w64N1ZNcM
         48vVPpUrpPGUADbHd1SRWSUd2aEjAt4W4QGm+ZhqnUK+KBzfLPpcB+RGqcRbuCaQDOFv
         mIPwAhwmUuGINy6kupD/0/H3LDWPY/EO6PMRZsOBWWeDsDpfNDrtEz4xdLCCTz4k/nKr
         j1r4yawmG8Zs8KqzgKO2Re23D2AujPv446UbSYQSYsp8o8R68hwziaT5fprdtDr0hwaN
         HDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VC6ANayeesDGJtzKYrfEY8oqCU/QJXt97qsLvY2HNG4=;
        b=XIpiNglSnBJ7BYT+WWY1D/Q2gX6m7bvhLqG7yrl/5ZkldVXDbwKRov/TA5VnnSlVXf
         ooG119CIgAn9JLNoN50Q/1pzblRGY2Pjeh9Vsy7pI7swFC3epLjHUzUdFcnjuoTolDfL
         vYz65rdoCN8nbqSeCz9s61TvjQ+r7yx6SwTq//o9dqv7egSkH7Jdl18xnUvmdS8+xwAU
         bnjvakbBYOxXHggYJynq7+b/aoIgoMvdwrRko5rsMvZ8JH7qwi80IEbwuphLMbPWwmi8
         15goeDXImyY/ImgIB7u3BRtsI3/4MMxGcJMAS1d9xv6XfkGiu4wlsNCtpSIVTFDTCtTJ
         +sLg==
X-Gm-Message-State: AOAM533j5cJjaInUBOT+SsBmZzjBKvpHKmKsV8Ijv4K3Siy1OiS2OzOl
	I5fCidqI3QmilKXTxkeuZWWr50HZBpXwA+DgbHw=
X-Google-Smtp-Source: ABdhPJwsvivOIcIS5GI4hZN84gLJcabYKolXcfYKjaNN45dAvnwK3ABEm1oSx6Apk76uexMSBCopXHsWBG1uO5WHZKk=
X-Received: by 2002:ac8:faf:: with SMTP id b44mr14952734qtk.190.1597694129906;
 Mon, 17 Aug 2020 12:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
 <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
 <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
 <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org> <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com>
In-Reply-To: <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 17 Aug 2020 12:55:03 -0700
Message-ID: <CAMKF1sp71Zc0_4fyUnZCuiE3E56mbv8J5Dp7bo7viNxTVafDTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 17, 2020 at 12:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
> > >
> > >
> > > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > > > > Bruce,
> > > > >
> > > > > We need
> > > > >
> > > > https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > > > > backported to 5.4 kernels for perf to build with -fno-common can
> > > > you
> > > > > queue this in your kernel updates as soon as you can ?
> > > >
> > > > I think we have other active kernels which will also need it as
> > > > even
> > > > with Khem's patch we still see failures:
> > > >
> > >
> > > I've taken care of linux-yocto now, I don't think there are any
> > > active use cases for those kernels that won't be covered.
> >
> > I bumped the meta-yocto BSPs with a quickly hacked up patch but we
> > still see:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339
> >
> > so I think there may be another patch we need somewhere...
> >
> > (which matches what we saw with Khem's _append which also failed).
> >
>
> there seems to be concaternation of compiler options without space
>
> | arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option
> '-mfpu=neon/include/uapi/asm-generic/errno.h'
> | arm-poky-linux-gnueabi-gcc: note: valid arguments to '-mfpu=' are:
> auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16
> neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2
> vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4
> vfpv4-d16
> | arm-poky-linux-gnueabi-gcc: fatal error: no input files
>
> but it also showed up on x86_64 in one of your prior builds, so I
> wonder if its something in kernel build system or is it processing
> TUNE_CCARGS in special ways.
>
> > There is still some piece of this we're missing, maybe on non-IA.
> >

Perhaps these kernel backports might help

https://github.com/torvalds/linux/commit/7597ce89b3ed239f7a3408b930d2a6c7a4c938a1
https://github.com/torvalds/linux/commit/6d1f916265aa615218d341ba5d3fd39dfe931cde

> > Cheers,
> >
> > Richard
> >
