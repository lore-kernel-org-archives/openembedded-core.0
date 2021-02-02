Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.140.1612301979384732108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 13:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q0WEl+nL;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id y18so7285769edw.13
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 13:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tys4V7YG8AEa7UPer5L7FR3PNR+bnSJ5jhEjhGs9Vhs=;
        b=q0WEl+nLrWLH475iYpp4pRl13iQ4NZWGZZu6p/MsLZioCYlQbFPrFus6tu1g/mYl+0
         wkf/rIPAC9LpGt8L1jjTFtTPTvIl104E9i0v6JPbvAdslkWVwtE0PKIw6gq7GRaRsFP1
         ARZb4UiWsLllj3Llcq4SNMwYuzTErTcSfmhiqRLUN59n+jrU4xn2nuCAJ7yXjcNn+KQu
         nvSvPrqJTPFepaljugA7gl8p3YVq+SRI07hxkGYfTzjyPVIfRbPjdJXxwqyw+yqLXZ/f
         2jegjQdhfs+v6tLMLQRjQBkbt2FFpkxol7VdGMiyCDvx6X/aLtGEqor8cNJKUKIbUdvj
         UfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tys4V7YG8AEa7UPer5L7FR3PNR+bnSJ5jhEjhGs9Vhs=;
        b=ZTRQCLPvj7jO5FF5de6SpzaVBuncV//y056CZpe9BIgyrOU2JYeZE/SkRq6+WDPMW9
         4oCxRImJIqHKSVmSkdRrKeW+WD9sFqxEKt9uF3n6tycUoMr32P5kfaFZr1Oqyon4MYNA
         DW3iYIFZZYXeiACQ/vvIHDOXCL7KHmUtHfy0qqdkSHWte0sYzWniWXubj/WnOZM//pza
         vLAsHxRBpLMgeyBlZs+k9F4ryPFeeWAkceW2a9GA9vYewyYjsAkBZsvZZi9BJPdJC/Ca
         xy6iOenLiHReBOMyqgNaO/ECy357KeoIXv25hsG7nqbs7CQkwhCO0r/L8i3P1sTM5Mz6
         9pQA==
X-Gm-Message-State: AOAM530SsXQKt0GzD13tB6rtlQMVMpgPKtlhDgvEM4y3wtEQNTgV5ChY
	Vd8h37KyzVhWw8J1kkGKlfJhIZginu9v6i7petc=
X-Google-Smtp-Source: ABdhPJy6zIwkbOMTkaYh/nBX939D9bZM+HN9nqPqrBIRJvABFOWEvVo2xIGZAbAiZCPueTrOny7r/Hi1Q51N18bSnPA=
X-Received: by 2002:a50:da8b:: with SMTP id q11mr99517edj.352.1612301977747;
 Tue, 02 Feb 2021 13:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20210130071954.2695419-1-raj.khem@gmail.com> <dd06d0409cccb1a4bd6728a8b16e8e46b6fbc115.camel@linuxfoundation.org>
 <CAMKF1sq7Qaw5VOkTRRo4c7=QkjG-uuSRfoV=16FVKvXBXiAz=g@mail.gmail.com> <CAMKF1sp7XgjUjmvio1=jgjhbDUz47sf8u7VGAhxNNQ2S22-qcA@mail.gmail.com>
In-Reply-To: <CAMKF1sp7XgjUjmvio1=jgjhbDUz47sf8u7VGAhxNNQ2S22-qcA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 2 Feb 2021 16:39:26 -0500
Message-ID: <CADkTA4PJW6CP3_Ryn2QiTbY=wMSe4oUO1GvZ20GJTf6hz65cAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] binutils: Upgrade to 2.36 release
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 2, 2021 at 1:56 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Richard and Bruce
>
> I also looked at the x86_64 kernel failure and it seems that objtool
> is crashing and we need to backport a kernel patch into 5.10
> linux-yocto kernel
>
> https://github.com/torvalds/linux/commit/5e6dca82bcaa49348f9e5fcb48df4881f6d6c4ae
>
> Bruce, would you be able to take care of this ?

Yep. I can do the merge.

I have a series of -stable updates ready to go, so this will be
stacked on top of them.

Bruce

>
> Thanks
> -Khem
>
>
> On Sat, Jan 30, 2021 at 11:28 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Jan 30, 2021 at 9:17 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2021-01-29 at 23:19 -0800, Khem Raj wrote:
> > > > Drop backported patches which are already present in 2.36 release
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > Failed in testing:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1806
> > >
> > > Looks to be at least two issues, the 5.10 kernel doesn't build with it
> > > and maybe that nativesdk-binutils also has the parallel make race?
> > >
> >
> > Thanks for trying it out. you are right about nativesdk race and I
> > have fixed it locally and will be in v2
> > the 5.10 kernel issue seems dicey
> >
> > make[3]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
> > kernel/entry/common.o] Segmentation fault (core dumped)
> > make[3]: *** Deleting file 'kernel/entry/common.o'
> >
> > make[4]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
> > arch/x86/kernel/apic/apic.o] Segmentation fault (core dumped)
> > make[4]: *** Deleting file 'arch/x86/kernel/apic/apic.o'
> >
> > I wonder if we can find which binary is causing the segfault. Is it
> > assembler or make or something else.
> >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
