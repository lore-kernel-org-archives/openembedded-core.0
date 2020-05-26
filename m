Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.49285.1590496277439289217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 05:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jX1/TLHh;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a2so23563218ejb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MRBadqiCaW4OlQCUWllXFJ4wGHFQVhVd+VVeqCnkReA=;
        b=jX1/TLHhO+T49nLzNUwVAJtM91TXjYpc6lRukkr0LLjGZ+lShLXtjjYFIEgGMEVPyR
         k58DVO22IRDTkVDwYaXfo8V40olqRhG4M1Eg8sp5LDC7eA16k6xjejkWDcjqEtd6y3dC
         zicTCSlW6zaJYGzAf8HNlBiUdglpN/XjpJSqSI/f16ImW2iB8swvpTtMS8Q2GypZ9fOR
         G03uBz3AkFBAmjIb4WZVMI57+GAmBwhkyojpD864hF9cFcKVOeiNZUjOP1gXqzxFDZ3a
         2AXKGJNh+z6kBpa8ZQLI3E7tfygc+i8Yh0Q+cCqh5zTg7Azgmyv+nRyvEohjpk+p7HFj
         UUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRBadqiCaW4OlQCUWllXFJ4wGHFQVhVd+VVeqCnkReA=;
        b=G/q4Jh9rVAOLXtTEDYYJk9drPruxlPeN8wqUzdjlDC7q5P6zZhdpFpzxmap5+PHad2
         nfaU6+T+S/RG7aRGJ7qRyv7txYJrk9gpjA7+Evwi5ScqM+jfQzDpzS0sn26pYBMUYSaI
         NiC3soqIeVsRA4Qw2W2MX4ggxuXc5s7hiGG52HQH1bGtdTb7QX+N3/PYdkAL9jV5kXLx
         P9T0fOki8U1yZ22o7wjJkLQ/3UJWPgAB5atMZvPlqqCUTrEGQSzHj01NOF6360CKX+cY
         s/vL6UFE4xYcV1uhwBpXo3ECM9iyEp5S2SzK5Kzp2JnRfLchiXqq5hVlKRhm+AGd4eMF
         y1Jw==
X-Gm-Message-State: AOAM530V5fOM+srHDqTIxjzjgjuTpKd10Au4P1J2FXdEWmDqH53zg1GK
	3G+Y3pwuxTYYVtEhcr5U9/PfXr9cDq4D4uxP4Hw=
X-Google-Smtp-Source: ABdhPJzdsgj6rrJ/fLhyPJxQ/LgJZl085/20WtNoY3OBeAlNBFhqCWInfNnoYT2Wa5LZz03rpb0siPk9P7mZf0e2geI=
X-Received: by 2002:a17:906:4356:: with SMTP id z22mr907358ejm.334.1590496275853;
 Tue, 26 May 2020 05:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
 <eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
 <20191021202444.GB1500@jama> <CADkTA4O1v-GZi-mkt866dpazowHsGZPrjwPuLi_Ry8vxZn8aqA@mail.gmail.com>
 <CAHtQpK7g400jDAUx+tYedCF6c654OQhCT+wZtKm7x3+_Gkr9SQ@mail.gmail.com>
In-Reply-To: <CAHtQpK7g400jDAUx+tYedCF6c654OQhCT+wZtKm7x3+_Gkr9SQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 26 May 2020 08:31:04 -0400
Message-ID: <CADkTA4PV6-Oh=s3TTnqCTMfAOytU+=rMWCAqSPpHgieZ7HcLDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] perf: drop 'include' copy
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 26, 2020 at 1:44 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> On Mon, Oct 21, 2019 at 10:58 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > On Mon, Oct 21, 2019 at 4:24 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > >
> > > On Mon, Oct 21, 2019 at 04:16:18PM -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > The copy of the kernel's top level include directory is not
> > > > required to build perf. We have both the linux-libc-headers and
> > > > perf's captured/copied headers for what it requires.
> > > >
> > > > The copy of the kernel's headers is leading us to multiple smaller
> > > > fixes to ensure that the various .h files are in sync. We can
> > > > remove the copy and all of the sync checks, and perf still builds
> > > > and executes correctly.
> > >
> > > Maybe reorder this before "[OE-core] [PATCH 3/6] perf: fix v5.4+ builds"
> > > as it removes most of what was possibly incorrectly added there (see 2nd
> > > review)
> > >
> >
> > I left this here on purpose, since it is only RFC. The other patches
> > as they appear in the series are required to build against 5.4+, but
> > this is optional.
>
> Look like this patch causes issues with building perf for 4.4.y kernel...
>
> I've recently started to upgrade some of BSPs from zeus to dunfell,
> and kernel 4.4.y fails to build with this patch applied. When I
> applied changes from Martin in commit
> [f3515d2d2545cae6b88fe5e86d081f4ef6133bf6] - build went through.
>
> I have now the bbappend in the layer, which sets the PERF_SRC to add
> the "include" folder back but I don't think this is a clean approach.
>
> Should this be reverted, or those who has a "dunfell+4.4.y kernel"
> setup need to use appends to override the PERF_SRC?

If you revert it, you might be trading warnings and breakages for
newer kernels to fix 4.4. That's the issue with perf, since it builds
right from the kernel source, it has to serve many different versions
(and we juggle breaking/fixing that from time to time).

So any revert would have to then build all of the different kernel
versions and perf to make sure that we don't trade one breakage for
another .. and being LTS we need to be extra careful. Since we don't
have an active 4.4 kernel in that branch, it would have to be ad-hoc
testing to confirm.

What exactly was the build error that you saw ?

Bruce



Bruce

>
> >
> > Bruce
> >
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >  meta/recipes-kernel/perf/perf.bb | 9 ---------
> > > >  1 file changed, 9 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> > > > index 191305969c..5f0ba7c180 100644
> > > > --- a/meta/recipes-kernel/perf/perf.bb
> > > > +++ b/meta/recipes-kernel/perf/perf.bb
> > > > @@ -106,7 +106,6 @@ EXTRA_OEMAKE += "\
> > > >  EXTRA_OEMAKE_append_task-configure = " JOBS=1"
> > > >
> > > >  PERF_SRC ?= "Makefile \
> > > > -             include \
> > > >               tools/arch \
> > > >               tools/build \
> > > >               tools/include \
> > > > @@ -248,14 +247,6 @@ do_configure_prepend () {
> > > >      # so we copy it from the sysroot unistd.h to the perf unistd.h
> > > >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
> > > >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
> > > > -
> > > > -    # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
> > > > -    [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
> > > > -
> > > > -    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m0644 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
> > > > -
> > > > -    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/include/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
> > > > -    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/include/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
> > > >  }
> > > >
> > > >  python do_package_prepend() {
> > > > --
> > > > 2.19.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Regards,
> Andrey.



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
