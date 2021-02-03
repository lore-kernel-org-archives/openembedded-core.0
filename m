Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.2971.1612315837634918370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 17:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vHSudbcA;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id e15so16470775qte.9
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 17:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lKkL8FNFc9Zx9w+9Kk4gWxQZAsrtJ/d5QT0cP+/E/dM=;
        b=vHSudbcAyTuaN2e7lL5dQM+Qi+D4a2PR52avkkOdnXQxp2VBYMy5kNdo5cLq4mfp57
         A6AlkyqJpuMb+FZXTcP4gww+v0bFQuWP/LpRDITdf8LaHjnXRaeqssJtq179N35JtQ6t
         XPTNRocPhc1jEGY6Zb+tx77/j8dotCwNKwcky/wP6blLRJrvDyONvbGi0LQkD/pKa4Zs
         NtoUYAz7CkFoKb085QI7CswYcq8LuLwFASZX7P+ix2gJUI/xrbRk8pPK5486RHbI50mR
         W1R8DFYkPUJnFBdYWxE+AODnEu59jZ6t2nJgh00+griOKsF7cptUyF4117tS9NtQTP46
         eIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lKkL8FNFc9Zx9w+9Kk4gWxQZAsrtJ/d5QT0cP+/E/dM=;
        b=AOOJ5al9MjnOif25/CEr77K4+BhTF/Ok1PVQ52B1Cw3tPnXEUtCZeLxDU3ReM5Bfvu
         yDCB8s+AaeKM/UhFLQTPhOdeWlJMO4am3fTrZ89GLlLHMZFsegAIfEqgHXq2c0aF34SA
         i6jkWFaI0EAL80Z0NDpL9lXqGdPRE0Igal+uDsZhZAD/ODEIrs1ZHCNcj/ScRQRCvDRj
         EbQ//gwveXXN9FLABaeKAmcC0m0Sf8lrdWD5ECcoqQKnCniMKQVfLWtvkEwuJvceXbJh
         GQhLcE6y2G9XG9zD40vMY+z5wk/Ms9brYG/ZwcOqk96Zhpp44hD/H1YbDsUvtLJfJhKZ
         /XeA==
X-Gm-Message-State: AOAM530OOuqNBRFvME6xM2HxlguS1rGFOnyw5mRmGDtoTriYVCOj4PZi
	8OWburb5ACfmC3AMijA83DXITtxlhxuWugcbHbw=
X-Google-Smtp-Source: ABdhPJzUYoBz//glBwRiC7Q58drNFOmKWARtUwoncc7YCb1fCVFOnvgaaoY1iPpIH3TgpZmzvlPVFNsflhrjwdTa7ag=
X-Received: by 2002:ac8:6f06:: with SMTP id g6mr643159qtv.80.1612315836717;
 Tue, 02 Feb 2021 17:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20210130071954.2695419-1-raj.khem@gmail.com> <dd06d0409cccb1a4bd6728a8b16e8e46b6fbc115.camel@linuxfoundation.org>
 <CAMKF1sq7Qaw5VOkTRRo4c7=QkjG-uuSRfoV=16FVKvXBXiAz=g@mail.gmail.com>
 <CAMKF1sp7XgjUjmvio1=jgjhbDUz47sf8u7VGAhxNNQ2S22-qcA@mail.gmail.com>
 <CADkTA4PJW6CP3_Ryn2QiTbY=wMSe4oUO1GvZ20GJTf6hz65cAw@mail.gmail.com> <CAMKF1sq9FB=_KVaVH0TeV7RarD7wmboH2h=5PvaYHVnOgLDR8w@mail.gmail.com>
In-Reply-To: <CAMKF1sq9FB=_KVaVH0TeV7RarD7wmboH2h=5PvaYHVnOgLDR8w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 2 Feb 2021 17:30:10 -0800
Message-ID: <CAMKF1sq2_jcakyxKO=atEKjJYdB+arT6fNvzidAaUHdJLhsY=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] binutils: Upgrade to 2.36 release
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bruce

We need to backport another patch as well

https://github.com/torvalds/linux/commit/44f6a7c0755d8dd453c70557e11687bb080a6f21

once we have these two patches kernel compiled fine with binutils 2.36

These backport requests need to go to Greg-KH as well.

On Tue, Feb 2, 2021 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Feb 2, 2021 at 1:39 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Tue, Feb 2, 2021 at 1:56 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Hi Richard and Bruce
> > >
> > > I also looked at the x86_64 kernel failure and it seems that objtool
> > > is crashing and we need to backport a kernel patch into 5.10
> > > linux-yocto kernel
> > >
> > > https://github.com/torvalds/linux/commit/5e6dca82bcaa49348f9e5fcb48df4881f6d6c4ae
> > >
> > > Bruce, would you be able to take care of this ?
> >
> > Yep. I can do the merge.
> >
> > I have a series of -stable updates ready to go, so this will be
> > stacked on top of them.
>
> I am still seeing similar failures with 5.10 however linux-yocto-dev works ok.
> there perhaps are more backports needed.
>
> >
> > Bruce
> >
> > >
> > > Thanks
> > > -Khem
> > >
> > >
> > > On Sat, Jan 30, 2021 at 11:28 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Sat, Jan 30, 2021 at 9:17 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, 2021-01-29 at 23:19 -0800, Khem Raj wrote:
> > > > > > Drop backported patches which are already present in 2.36 release
> > > > > >
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > >
> > > > > Failed in testing:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1806
> > > > >
> > > > > Looks to be at least two issues, the 5.10 kernel doesn't build with it
> > > > > and maybe that nativesdk-binutils also has the parallel make race?
> > > > >
> > > >
> > > > Thanks for trying it out. you are right about nativesdk race and I
> > > > have fixed it locally and will be in v2
> > > > the 5.10 kernel issue seems dicey
> > > >
> > > > make[3]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
> > > > kernel/entry/common.o] Segmentation fault (core dumped)
> > > > make[3]: *** Deleting file 'kernel/entry/common.o'
> > > >
> > > > make[4]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
> > > > arch/x86/kernel/apic/apic.o] Segmentation fault (core dumped)
> > > > make[4]: *** Deleting file 'arch/x86/kernel/apic/apic.o'
> > > >
> > > > I wonder if we can find which binary is causing the segfault. Is it
> > > > assembler or make or something else.
> > > >
> > > > > Cheers,
> > > > >
> > > > > Richard
> > > > >
> > > > >
> > > > >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
