Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.17801.1597545702272618001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 19:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lGGLhTU0;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id t23so9969171qto.3
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 19:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bs6UOz0E20engbaBOLvnQ0GHPUF6IVTmO/pgCHYhJkU=;
        b=lGGLhTU0l4Su79Uiz0F0eW8W5Bi+N9UspFS+Umb8xY6pYOv/V2tYhK8vs+QKTsd08i
         v3SbYNAA2GwtZPYgDPcKu8twGJdkr2n5r4tCmV2h+BxyOwy64eKRHSO86rIMAlyAu0D2
         l2ITJZeAYu4d2Wa5zCXWN5Pyh73V4CdJ/LfVj41srPJY7O7wp+c5Jkfm2BichQ5RDDGq
         ykLb8ro4YVjf6SER9GjQ3AiayXqeSiYGyKn2IcqDIDJNYlyKZAwH/chb4swnFU/ANANL
         rjoZFCC7QXCquD7mU8TnO19JkxwTmKUb12VUpdxz6D93GDfhGIA99U87aglcZndidsY0
         xFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bs6UOz0E20engbaBOLvnQ0GHPUF6IVTmO/pgCHYhJkU=;
        b=qCN9yPdDDWGAw2qMxyn4DNUDFnOpkDYj2lih27jMUlUtSweYmPyn1IbJh5SKcL/eHT
         lDsjC3K0gU4Uxxrh8C3VFE0F9EhvkURNr4NIDDLkj39/amRtcX5l3I53E7gOSLPu8rd/
         sYa/qzQ8s/4IwhC7xIxFhwwkwJvGc4Wf7GLumcFwf4mOqz/94Md9Hl4kx3aAveg3KMbK
         x8k4czt8ensHDoBD3QdIWa5w74Cx4XIPEQBEVVaBYR0eqoF93Jqqj8PVo3qxBmXhgqan
         inD66aWNhdfqkzBoNsPRLfkj5JuElcaqkc4dgTqT+O+MrVyfVqLrak1HnISErZ90hY5N
         +2Sw==
X-Gm-Message-State: AOAM532kxxR0wKnQrHILRjVNuji/R+dtv3z99xxYMHNI7pBpCHSnm1P3
	n0zd2pY6hO7sOKrCFIkG0dxPi0p/Uq2Bpv4t5v0=
X-Google-Smtp-Source: ABdhPJwvK7bISJGqJLhm48N/vpwgzGTyUbcQ+I9Coiu5EoDa3DoC66UDasx0ICbU/BOl8/+qNYGE/BsiAp+oaPXQ4K4=
X-Received: by 2002:ac8:faf:: with SMTP id b44mr8216939qtk.190.1597545701335;
 Sat, 15 Aug 2020 19:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org> <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
In-Reply-To: <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 15 Aug 2020 19:41:15 -0700
Message-ID: <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Bruce,

We need https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
backported to 5.4 kernels for perf to build with -fno-common can you
queue this in your kernel updates as soon as you can ?

Thanks
-Khem

On Sat, Aug 15, 2020 at 6:56 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Aug 15, 2020 at 3:10 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2020-08-04 at 23:17 -0700, Khem Raj wrote:
> > > here is a recent build with clang11 which also switched to using
> > > -fno-common and errors are pretty much same you will see with gcc10
> > > with this patch to revert the -fcommon defaults.
> > >
> > > https://errors.yoctoproject.org/Errors/Build/107234/?limit=100
> > >
> > > I was waiting for upstream packages to get fixed before switching the
> > > defaults back to -fno-common.
> >
> > Khem requested I revisit this. I see at least:
> >
> > a) perf failures pretty much everywhere
>
> This is interesting
>
> | x86_64-poky-linux-gcc: error: unrecognized command-line option
> '-m64/include/uapi/asm-generic/errno.h'
>
> I wonder if its some kernel update which is causing this, it seems to
> be missing a space in commandline somewhere
>
> > b) kexec-tools in no-x11 build
>
> I think I dealt with this in meta-oe perhaps we need to use -fcommon in cflags.
>
> > c) cpio build failures in testimage
> >
> cpio needs a patch to build see
> https://git.openembedded.org/openembedded-core/commit/?id=ca6e5511b59b585de793ff6424c7c6ccfcd8e61e
> I guess we need to either patch cpio with this patch on target before
> building or pass -fcommon to the test so this patch is not needed
>
> Thanks for the run, I will try to look into it, I think for cpio build
> failure perhaps we need to pass
>
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1264
> >
> > the world builds haven't completed yet.
> >
> > So looks much better but still a few things need fixes.
> >
> > Cheers,
> >
> > Richard
> >
> >
