Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.81.1612292191158481169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 10:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IqOmW6fh;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id r77so20846204qka.12
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 10:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bvfx4LXY2KUWJoWClx3s9sE1lwYBC9uwc5mFubh0CJ0=;
        b=IqOmW6fhNyrUG7YXshXjGH/o4GKEqSWWn+9eD78nNKZUd0Fh7BAxNzXyvMdZ9iSGfZ
         NNDPyii7/4nMorvEvqmwPFNatfQid0+ay9lKSkSwqEig/jzMIrIv1erqGI+97/7kDLMi
         hpIn8/vhd7AtGtskBfKLs0lURHr1Em3iBlIs/V+XjWbtzBEubNCeNnsIzKv900Xwk0F6
         CVBtAnYuOuzDqpo6Um1pBtNVEHosIWDSs/FAx0uP8kLU/ccImIfb+k5ZAERqItkwL0nY
         /5i+ZrBwyQdEd2Zof1suMGef59id6d28UOdQlZPDjUvt8Hhx8JZNdmJReHUMqTHhh4AL
         K4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bvfx4LXY2KUWJoWClx3s9sE1lwYBC9uwc5mFubh0CJ0=;
        b=Yr8LkM2Um5gNw3QgbLaNby0efjk8aHD/YU29nJtVxVVZ7Fd9Y5yYrqHxOLietRnp/K
         /x0gNBfGHA1N7JHNOQr4PDbGcOmGOFON1UayFX6Me9jnmsKElTVzTQTCGQuvtkMtJmli
         Q2RwFJhtCmBf9SxRaVdYiOfUO5ATS8Bqh/IpqIcQ5vH87bIwUIF+cbnc9fNRSQ8aKiAz
         aZqjc51m+8Dvpc3nScZy6ik5lHfX9CjTNshcOQvrJTfgPkILWyAYh6f2Te6NvOFKQpWa
         Ih1Isquiqld5SQdc5oBXUGpKg5pRJFwAHTJOv/bGU50hQM/dUOJqsXoWeiL8Mag2ci4h
         jIsw==
X-Gm-Message-State: AOAM533c+Od+fPaJiS0QWuQpsb7QowaYYf6J3z9RD/0fvss6slaVf1Uf
	I4oFQ7bph4qf3MmUsylDfWWTa+BWflZXIMnk3Yg=
X-Google-Smtp-Source: ABdhPJxmC/7FGDL/gPV6ZNOmV7NmZUnCWgG2QDp4SWlUX3mGAmRUezwhfu/aABG8SBtpe9ZzgRaseIKav2LAFYMPKfo=
X-Received: by 2002:a05:620a:12e8:: with SMTP id f8mr21746616qkl.337.1612292190195;
 Tue, 02 Feb 2021 10:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20210130071954.2695419-1-raj.khem@gmail.com> <dd06d0409cccb1a4bd6728a8b16e8e46b6fbc115.camel@linuxfoundation.org>
 <CAMKF1sq7Qaw5VOkTRRo4c7=QkjG-uuSRfoV=16FVKvXBXiAz=g@mail.gmail.com>
In-Reply-To: <CAMKF1sq7Qaw5VOkTRRo4c7=QkjG-uuSRfoV=16FVKvXBXiAz=g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 2 Feb 2021 10:56:03 -0800
Message-ID: <CAMKF1sp7XgjUjmvio1=jgjhbDUz47sf8u7VGAhxNNQ2S22-qcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] binutils: Upgrade to 2.36 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard and Bruce

I also looked at the x86_64 kernel failure and it seems that objtool
is crashing and we need to backport a kernel patch into 5.10
linux-yocto kernel

https://github.com/torvalds/linux/commit/5e6dca82bcaa49348f9e5fcb48df4881f6d6c4ae

Bruce, would you be able to take care of this ?

Thanks
-Khem


On Sat, Jan 30, 2021 at 11:28 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Jan 30, 2021 at 9:17 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2021-01-29 at 23:19 -0800, Khem Raj wrote:
> > > Drop backported patches which are already present in 2.36 release
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > Failed in testing:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1806
> >
> > Looks to be at least two issues, the 5.10 kernel doesn't build with it
> > and maybe that nativesdk-binutils also has the parallel make race?
> >
>
> Thanks for trying it out. you are right about nativesdk race and I
> have fixed it locally and will be in v2
> the 5.10 kernel issue seems dicey
>
> make[3]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
> kernel/entry/common.o] Segmentation fault (core dumped)
> make[3]: *** Deleting file 'kernel/entry/common.o'
>
> make[4]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
> arch/x86/kernel/apic/apic.o] Segmentation fault (core dumped)
> make[4]: *** Deleting file 'arch/x86/kernel/apic/apic.o'
>
> I wonder if we can find which binary is causing the segfault. Is it
> assembler or make or something else.
>
> > Cheers,
> >
> > Richard
> >
> >
> >
