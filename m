Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.437.1587577247067247100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 10:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CQ41d+O9;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id t12so2165263edw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NQXfu8/V6lawHXDoa3/95Z8pcRgV7Umd/F4YbyburR8=;
        b=CQ41d+O9mCqcQJkwI+3R0uOFIvJPkTUFtoin24jMioW/C1Uy07umWwYDXhW73HEOLV
         sg++Ls3dI8zDSGiGrcywYks8+SlW382QgcjctXpDhtd/WkSdhY6zznOxh7FehYtWO/KC
         DHrAmWfSRDgkjAHsm7SUNeFZcJ7AOr6Hw/bbXSBp/6ck/LWHm2OT2CerV5GH3PVnRaTQ
         +1hUmoPj5b6Xq6LKAGtQD5jR6qWCTaoOw/hoEyOD+1kf5Ijtg6Q5QXZ+wD7pVK/aoWtA
         l+OUU0gVyX2OROQ6al1G+3RWRPLOEKu/6nXuitRfEpASCb18uRRmdqsyMdyqfSqCLaag
         iGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NQXfu8/V6lawHXDoa3/95Z8pcRgV7Umd/F4YbyburR8=;
        b=h6dhHosxBIJxJqksvQVF+ba7F9nmi6YQj50yEs0SPSo8xIQBtA5zHMZc6vk7TY2NY+
         1libtkVHbt+FIM9vlDbzrbpfBuO5/6Ku5ANoin+XxI0O7XY37reM9mpqfbbEfysjcLbe
         v2FCenYYsKTR5DBE+j9sIuSxBAutTRHiVhzKZpxb5ZPCunx0biORc6TIz+7ZGKMzcrG1
         60q92Yhdb+dpMDfosKBlwqkbohz2RRafhXptQuLG+mslEtSLjaeHo/2r6gXSOxjbjB77
         elPwsKaBafC6mJfglgmeyfe9cTPA2VV7YEEsR4MStJX3BtZy1IWOuNNoc5korkGfRHzK
         xDXw==
X-Gm-Message-State: AGi0PubG6Jez/tmfzTrwMGVe223lcaN+NRA7KsYCdj2TDGUyqSVe8xLw
	iaPCtlPsj77ploHEW/6UdlrRx80lcRNebD0y+7M=
X-Google-Smtp-Source: APiQypKuCxI4S4fAPLdD8jKUkGQ3t3V3F7nW9je+Ln7822vntD0JnWzb0PbHRR92FhBnejaVFQ1DxzGXAAhJig7n+EU=
X-Received: by 2002:aa7:c3cb:: with SMTP id l11mr23291375edr.129.1587577245426;
 Wed, 22 Apr 2020 10:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200421093732.29192-1-dan.callaghan@opengear.com>
 <CADkTA4NGkRXf-jmvX9TooAEAr9RiA+0dWr01icYAKkp0yZZPCg@mail.gmail.com>
 <1587518872-sup-9466@galangal.danc.bne.opengear.com> <160803E330909B82.23462@lists.openembedded.org>
In-Reply-To: <160803E330909B82.23462@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 22 Apr 2020 13:40:33 -0400
Message-ID: <CADkTA4O8r3geHNUNDNnBpgPp4X6jsQRLRX-pEAWW47XGfYE2Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: copy some more needed files in do_shared_workdir
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Dan Callaghan <dan.callaghan@opengear.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 21, 2020 at 10:39 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Tue, Apr 21, 2020 at 9:32 PM Dan Callaghan
> <dan.callaghan@opengear.com> wrote:
> >
> > Excerpts from Bruce Ashfield's message of 2020-04-21 08:33:34 -04:00:
> > > On Tue, Apr 21, 2020 at 5:37 AM Dan Callaghan
> > > <dan.callaghan@opengear.com> wrote:
> > > >
> > > > We need to copy include/config/auto.conf into ${STAGING_KERNEL_BUILDDIR}
> > > > to avoid module compilation errors like this:
> > > >
> > > >     | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
> > > >     | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
> > > >     |
> > > >     |   ERROR: Kernel configuration is invalid.
> > > >     |          include/generated/autoconf.h or include/config/auto.conf are missing.
> > > >     |          Run 'make oldconfig && make prepare' on kernel src to fix it.
> > > >     |
> > > >     | make[2]: *** [build/tmp-glibc/work-shared/machine/kernel-source/Makefile:641: include/config/auto.conf] Error 1
> > > >
> > > > We also need scripts/basic/fixdep to avoid errors like this:
> > > >
> > > >     | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
> > > >     | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
> > > >     |   CC [M]  build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o
> > > >     | /bin/sh: scripts/basic/fixdep: No such file or directory
> > > >     | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.build:303: build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o] Error 127
> > > >
> > > > And scripts/mod/modpost to avoid errors like this:
> > > >
> > > >     |   Building modules, stage 2.
> > > >     |   MODPOST 1 modules
> > > >     | /bin/sh: scripts/mod/modpost: No such file or directory
> > > >     | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.modpost:92: __modpost] Error 127
> > > >
> > > > Most of the time, the absence of these files is masked by the
> > > > make-mod-scripts recipe's do_configure task, which causes a whole bunch
> > > > of extra files to be built into ${STAGING_KERNEL_BUILDDIR} (including
> > > > these two). Typically make-mod-scripts will be built before any kernel
> > > > modules, and so it didn't matter that do_shared_workdir was missing
> > > > these files.
> > > >
> > >
> > > The design is that, make-mod-scripts is what provides those files, we
> > > don't want to copy them, since it is an ever incomplete list (more so
> > > in the past, but the concept still holds).
> >
> > Okay, I think you're saying that what do_shared_workdir claims to do
> > (populate ${STAGING_KERNEL_BUILDDIR} with whatever files are needed to
> > build kernel modules) should actually be handled by make-mod-scripts
> > instead.
> >
> > Does that mean, do_shared_workdir has no purpose? Or is it doing
> > something else I don't realise?
>
> How would what populates it change the purpose of what it does ?
> Just like our SDK and on target module support, those files are generated
> by the kernel build itself, not copied.
>
> shared-workdir was created to stop slinging around the sheer number of
> files in a kernel build, it was causing us severe build performance issues.
>
> Having the smallest possible list of explicitly copied files is the goal.
> The lists are fragile, and inevitably need constant tweaking. Witness
> the messing around with kernel-devsrc that I have to do, and the only
> reason that is tolerated is to make the minimal possible development
> components.
>
> >
> > > > However the problem will be evident if you do certain sequences of
> > > > tasks, for example a complete build first (so that make-mod-scripts is
> > > > already built), then:
> > > >
> > > >     bitbake linux-yocto my-kernel-module -c clean
> > > >     bitbake my-kernel-module -c install
> > >
> > > Why can't we fix the dependency ? We chased a few of these around when
> > > the mod-scripts recipe was introduced, and this just looks like a
> > > variant we missed.
> >
> > Right, so there *is* already a correct dependency on
> > make-mod-scripts:do_compile. The problem is, in the scenario I gave
> > above, that task is already done and Bitbake is not going to run it
> > again. But in fact, the stuff it left behind in
> > ${STAGING_KERNEL_BUILDDIR} was cleaned out when I cleaned the
> > linux-yocto recipe.
>
> Yes, and that clean is supposed to invalidate things, and trigger the
> re-run.

Hi Dan,

Are you seeing this on master, or some other branch ?

I can run the following on master, as often as I like:

% bitbake linux-yocto hello-mod -c clean; bitbake hello-mod -c install

And I see the required scripts coming and going from the build
artifacts as expected:

build [/home/bruc...-artifacts]> find . -name 'fixdep'
./tools/objtool/fixdep
./scripts/basic/fixdep

# after the clean:
build [/home/bruc...-artifacts]> find . -name 'fixdep'

# after the install
build [/home/bruc...-artifacts]> cd ..
build [/home/bruc...qemux86-64]> cd -
/home/bruce/poky/build/tmp/work-shared/qemux86-64/kernel-build-artifacts
build [/home/bruc...-artifacts]> find . -name 'fixdep'
./tools/objtool/fixdep
./scripts/basic/fixdep

Is there something different with your module recipe than the one in
meta-skeleton ? Can you share it, so I can debug further ?

Bruce

>
> >
> > I guess the real issue is that we have this "shared" work directory
> > which a bunch of different recipes contribute files to, but can be
> > cleaned out by running the "clean" task on any one of several different
> > recipes.
>
> We've solved that issue in the past, I'll have a look on Wednesday to
> see what may have changed and (re)broken it. There may be a bugzilla
> floating around for that, I'll see if I can track it down as well.
>
> Bruce
>
> >
> > --
> > Dan Callaghan <dan.callaghan@opengear.com>
> > Software Engineer
> > Opengear <https://opengear.com/>
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
