Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.249.1612302425670511722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 13:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kDPtrBUY;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id r77so21393929qka.12
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 13:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5o8fmJ82iqHlNFQQRwEZBfsOHtgfGWODncHKvRGNLKY=;
        b=kDPtrBUYM3XWAAeH2RbHLLIN8hYA/rTUXYzjq708cgApsgsRunaO6CLEiCgbZLf8Uc
         BfEo77AWxC/lTKX7HLdgo9VPr+R3kiZ5qtpBUma5q34IPcT1Hsngong7hn58jRhN3s+k
         aa8goW3e7YenI1m+KMl+JAQ0dwQG0cRIztMI2Y4ii0AGwewlnLpk6sNXr2MxQ8XkxFyr
         cUToAr+b97fnHrsnA1yzdqHRIyhWE2LBk8aJGKjlJt8n3bCRYUHgiXCMC9BKuvsGzjlf
         ntwRIQqKwdYc5q3mB3PaJmIngN5v8L0HUKIesmjCfcezmOzhnZBOrMTFEfGVszGGl61d
         j1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5o8fmJ82iqHlNFQQRwEZBfsOHtgfGWODncHKvRGNLKY=;
        b=p+St4dPN3kE4VOGRqdiVaumEUwWNpRA/hISp433FDlbXdLUJ0NKtYdCfQkA5axdoUw
         Xj1rsXh9dIuZ4SeCra9a3fLWWFrmDYCAMsPRXkjdM8dEa8AXcRYQKJYkkvXSN+mz4F/4
         9df/NxeSDxt8Qnnf5icKY5bpa11Q/IETuDjX+zTJHm7S+hCzK74G4synsTTrVXs8ck09
         mXRVXZLJMfC86FDN6cjDtY1Tllm7e58Uj1To6gKkMua1FC7Uscjdk9QGjmV6DZ+ttwOh
         VihR5ynHFeOgvGN5dLlhBradqswUS5u4F8cizuuYiX5WJP2usBZWIAyye8tg2S+ZDMvZ
         9LAg==
X-Gm-Message-State: AOAM530h0yJ0+GSoLX2XCQTlBo0igKu4ZEmxCT9sJNG/6mMcAOlWEOin
	uytGSfscqmDYmIP5qt7pRcTHD5F8N2l2O0irwL0=
X-Google-Smtp-Source: ABdhPJx5/yvMuXcGBrr+fcR378wxPhkCL+dLslMFqSQbmWGPm198ZknLyw//AOSTCKAu/26jqurE5YwunCXAY+jpgQ0=
X-Received: by 2002:a05:620a:2211:: with SMTP id m17mr12646386qkh.9.1612302424781;
 Tue, 02 Feb 2021 13:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20210130071954.2695419-1-raj.khem@gmail.com> <dd06d0409cccb1a4bd6728a8b16e8e46b6fbc115.camel@linuxfoundation.org>
 <CAMKF1sq7Qaw5VOkTRRo4c7=QkjG-uuSRfoV=16FVKvXBXiAz=g@mail.gmail.com>
 <CAMKF1sp7XgjUjmvio1=jgjhbDUz47sf8u7VGAhxNNQ2S22-qcA@mail.gmail.com> <CADkTA4PJW6CP3_Ryn2QiTbY=wMSe4oUO1GvZ20GJTf6hz65cAw@mail.gmail.com>
In-Reply-To: <CADkTA4PJW6CP3_Ryn2QiTbY=wMSe4oUO1GvZ20GJTf6hz65cAw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 2 Feb 2021 13:46:37 -0800
Message-ID: <CAMKF1sq9FB=_KVaVH0TeV7RarD7wmboH2h=5PvaYHVnOgLDR8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] binutils: Upgrade to 2.36 release
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 2, 2021 at 1:39 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Feb 2, 2021 at 1:56 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Richard and Bruce
> >
> > I also looked at the x86_64 kernel failure and it seems that objtool
> > is crashing and we need to backport a kernel patch into 5.10
> > linux-yocto kernel
> >
> > https://github.com/torvalds/linux/commit/5e6dca82bcaa49348f9e5fcb48df4881f6d6c4ae
> >
> > Bruce, would you be able to take care of this ?
>
> Yep. I can do the merge.
>
> I have a series of -stable updates ready to go, so this will be
> stacked on top of them.

I am still seeing similar failures with 5.10 however linux-yocto-dev works ok.
there perhaps are more backports needed.

>
> Bruce
>
> >
> > Thanks
> > -Khem
> >
> >
> > On Sat, Jan 30, 2021 at 11:28 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sat, Jan 30, 2021 at 9:17 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, 2021-01-29 at 23:19 -0800, Khem Raj wrote:
> > > > > Drop backported patches which are already present in 2.36 release
> > > > >
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >
> > > > Failed in testing:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1806
> > > >
> > > > Looks to be at least two issues, the 5.10 kernel doesn't build with it
> > > > and maybe that nativesdk-binutils also has the parallel make race?
> > > >
> > >
> > > Thanks for trying it out. you are right about nativesdk race and I
> > > have fixed it locally and will be in v2
> > > the 5.10 kernel issue seems dicey
> > >
> > > make[3]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
> > > kernel/entry/common.o] Segmentation fault (core dumped)
> > > make[3]: *** Deleting file 'kernel/entry/common.o'
> > >
> > > make[4]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
> > > arch/x86/kernel/apic/apic.o] Segmentation fault (core dumped)
> > > make[4]: *** Deleting file 'arch/x86/kernel/apic/apic.o'
> > >
> > > I wonder if we can find which binary is causing the segfault. Is it
> > > assembler or make or something else.
> > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > > >
> > > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
