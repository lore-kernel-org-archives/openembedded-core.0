Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web11.194.1590524538946354741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 13:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rvhzZDyI;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: andrey.z@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id c15so878631uar.9
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EYKdmwMUhglWedihkXE2VKQwVFYc5t9wCEhyib5fpQ8=;
        b=rvhzZDyIsSgE6ehvBliFv2TbN9VRL84foE0jYGbHZjRYxMoN/WViwQVp6FENL7miZ8
         XnxRZoMt2ZN1d7igGH6UM4nZy6QRMmyL0gnIp2Sr99p5sVm+1jP6rRHzVPBASuWAPTNl
         n1Ofa6DZyFArmhmN+VCZTJu7RHzXGpfBjXrIxWSOvtGhq7m3fm67NTA6er5o4vmBxUHJ
         3DRWtud3uPwKJY1YMWT/qGJtjNNXm8QqxxpN2o2WEmdOF/QizUVvmi4rypcIrAzxjjf9
         0JvaB4RZ+qC0VELdcJFh1d64MgX2FUHORlN9emoUUiZxF1pgpSd1DGhYY0uIVpOW1Ifo
         x5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EYKdmwMUhglWedihkXE2VKQwVFYc5t9wCEhyib5fpQ8=;
        b=eFzZGTE/rJCBMzris0wqfQVY0b4tQgeXWpky1pAp8Na8pFtEdVL2iEy8iRGEtkj1gH
         cwhWCQjf7JzKt1i3nz6zJMIH33iicgvTvSkAaIud1oRFAV1UShZQpCZEogOHIjaHWJLt
         hspxPVOTQ0UjPK0hBPNtx8M1QT5IIHWqqEJZrHXfvScBHhBo53c9NTNcOFxXmMzWYoYN
         +cxiThHUyN3j47UtUKeCNXzMcBIyCnJa4iVzHDT5TyekKpgnqsxpspsjxO7DLmzN3n6p
         7pUmGfUzICBtMVOUJMo5HH2JvTWo3/MZ0cxkN8cWOCKhtqdP7bvS5a/3pTihjnbDXTU4
         xjHg==
X-Gm-Message-State: AOAM531vh4uNKMcdRg3D7WTOG05JBFZ7NUb1qbbxWvGsGF+d+VguU9IH
	bOYDAAePQ2P1h0XTgH2LVh4yyoYH/9J5sBak5n0=
X-Google-Smtp-Source: ABdhPJwR4KQMydNHcx+0vdIxUU9ploQ4BZzqvg9PgYRdDr8YRBit7iOzDdWpBAdrSKRSDPyeKwx8bnaj499q2u6wwKQ=
X-Received: by 2002:ab0:36d9:: with SMTP id v25mr2207898uau.126.1590524538000;
 Tue, 26 May 2020 13:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
 <eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
 <20191021202444.GB1500@jama> <CADkTA4O1v-GZi-mkt866dpazowHsGZPrjwPuLi_Ry8vxZn8aqA@mail.gmail.com>
 <CAHtQpK7g400jDAUx+tYedCF6c654OQhCT+wZtKm7x3+_Gkr9SQ@mail.gmail.com> <CADkTA4PV6-Oh=s3TTnqCTMfAOytU+=rMWCAqSPpHgieZ7HcLDg@mail.gmail.com>
In-Reply-To: <CADkTA4PV6-Oh=s3TTnqCTMfAOytU+=rMWCAqSPpHgieZ7HcLDg@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 26 May 2020 22:22:07 +0200
Message-ID: <CAHtQpK5bDbibVfHytO5D2ksc-=93pHuSEdYY7+GJzdXFPwGmUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] perf: drop 'include' copy
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 26, 2020 at 2:31 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, May 26, 2020 at 1:44 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > On Mon, Oct 21, 2019 at 10:58 PM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Mon, Oct 21, 2019 at 4:24 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > > >
> > > > On Mon, Oct 21, 2019 at 04:16:18PM -0400, bruce.ashfield@gmail.com wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > The copy of the kernel's top level include directory is not
> > > > > required to build perf. We have both the linux-libc-headers and
> > > > > perf's captured/copied headers for what it requires.
> > > > >
> > > > > The copy of the kernel's headers is leading us to multiple smaller
> > > > > fixes to ensure that the various .h files are in sync. We can
> > > > > remove the copy and all of the sync checks, and perf still builds
> > > > > and executes correctly.
> > > >
> > > > Maybe reorder this before "[OE-core] [PATCH 3/6] perf: fix v5.4+ builds"
> > > > as it removes most of what was possibly incorrectly added there (see 2nd
> > > > review)
> > > >
> > >
> > > I left this here on purpose, since it is only RFC. The other patches
> > > as they appear in the series are required to build against 5.4+, but
> > > this is optional.
> >
> > Look like this patch causes issues with building perf for 4.4.y kernel...
> >
> > I've recently started to upgrade some of BSPs from zeus to dunfell,
> > and kernel 4.4.y fails to build with this patch applied. When I
> > applied changes from Martin in commit
> > [f3515d2d2545cae6b88fe5e86d081f4ef6133bf6] - build went through.
> >
> > I have now the bbappend in the layer, which sets the PERF_SRC to add
> > the "include" folder back but I don't think this is a clean approach.
> >
> > Should this be reverted, or those who has a "dunfell+4.4.y kernel"
> > setup need to use appends to override the PERF_SRC?
>
> If you revert it, you might be trading warnings and breakages for
> newer kernels to fix 4.4. That's the issue with perf, since it builds
> right from the kernel source, it has to serve many different versions
> (and we juggle breaking/fixing that from time to time).

I got the same conclusion that healing one can hurt the other... perf
is a gentle beast, I had my own history with it already.

>
> So any revert would have to then build all of the different kernel
> versions and perf to make sure that we don't trade one breakage for
> another .. and being LTS we need to be extra careful. Since we don't
> have an active 4.4 kernel in that branch, it would have to be ad-hoc
> testing to confirm.

Kernel 4.4 is also LTS and has (had) a very long time span, so I
believe there are some people out there who might still have it in
their Products (industrial applications are pretty conservative guys).
I have to admit that Yocto 3.1 + Kernel 4.4 is a rather strange
combination, but it also has a valid reason to exist.

I guess reverting this patch is not really an option, but this topic
deserves then a bit of documentation somewhere so people can look this
up and have a quick fix for themselves. The question is: where to put
this information?

Honestly, it didn't take me long to find the commit that solved the
build, it took me rather long to figure out why I didn't see changes
from it on the [dunfell]...

>
> What exactly was the build error that you saw ?

Exactly what JaMa had and fixed with his commit, namely a multitude of:
<bitops> error: #include nested too deeply

and some of:

<snip>/perf/1.0-r9/perf-1.0/tools/include/linux/list.h:5:10: fatal
error: ../../../include/linux/list.h: No such file or directory

>
> Bruce
>
>
>
> Bruce
>
> >
> > >
> > > Bruce
> > >
> > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > ---
> > > > >  meta/recipes-kernel/perf/perf.bb | 9 ---------
> > > > >  1 file changed, 9 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> > > > > index 191305969c..5f0ba7c180 100644
> > > > > --- a/meta/recipes-kernel/perf/perf.bb
> > > > > +++ b/meta/recipes-kernel/perf/perf.bb
> > > > > @@ -106,7 +106,6 @@ EXTRA_OEMAKE += "\
> > > > >  EXTRA_OEMAKE_append_task-configure = " JOBS=1"
> > > > >
> > > > >  PERF_SRC ?= "Makefile \
> > > > > -             include \
> > > > >               tools/arch \
> > > > >               tools/build \
> > > > >               tools/include \
> > > > > @@ -248,14 +247,6 @@ do_configure_prepend () {
> > > > >      # so we copy it from the sysroot unistd.h to the perf unistd.h
> > > > >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
> > > > >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
> > > > > -
> > > > > -    # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
> > > > > -    [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
> > > > > -
> > > > > -    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m0644 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
> > > > > -
> > > > > -    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/include/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
> > > > > -    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/include/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
> > > > >  }
> > > > >
> > > > >  python do_package_prepend() {
> > > > > --
> > > > > 2.19.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > >
> > > > --
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > Regards,
> > Andrey.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

-- 
Regards,
Andrey.
