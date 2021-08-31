Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.4786.1630412990303340967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 05:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=re0B/zDf;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id h1so31454296ljl.9
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=brFsxSBsStcSrGXpNHW7TN4++9PGHJW2W37vZqcqpCo=;
        b=re0B/zDfN0uWRBQQ1YPtF/qi7HBGwVB4hy1oR6fDySYt5wIoyU9tecTGsdsloYyAFe
         UgD2ChkYtxCPb/vpbNrwImk7yTzOoCe9nf4ev4afUp9Xh43jvcCf3Fbf1F1ZeLPo0iwA
         n9aCVACxtWiD5bhtwA7h1FoM3WUvreJj1Jmbe01Mb0gUJoknRS0o66zfoCGAx76iOith
         IT5oO46bs/jWen3LoY9itZr+c0UVHraGMhJ79Dy78sBRqt/Nkr4i7/jQ22VYURLKvcpY
         6f6HUT+jBI93MRDNn/bqL/jzpKaTg7Ukpnwi82GIeGT7jAbKTNdb92eEHuhC8gxBvYrD
         H2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=brFsxSBsStcSrGXpNHW7TN4++9PGHJW2W37vZqcqpCo=;
        b=eT3x8orgsu2AYb9ek4xzITK/e+Mrb/Zu29wKmykCZtlkxrmsNJBYjwERUXFHE/eJy9
         tzP7N+vqsUpHnD/foHnubtIlHIzjcnEauEFZp+ia2KkpDOxyfT4DeJPV9THSCO3Xq3FI
         7LtOSn8CYuYKLGu0Ioz2i7FtBgPrbKJPPKX9z3sqitgYrQ1wei2AGEv7fSgp3UKkkxHy
         ECPVlza/42OPc19ow48x+98Gi9nmmsXLk/FBmCH0cnv3jtLNuTR5++eIlXFokJ2B+1rl
         nRgytlj6i/h5TIqxwljdo0rdGsApQVXXfJZ8hwcN0T4jGF0ZzYiGhj+HxIgpZ3zjs7wd
         cu0A==
X-Gm-Message-State: AOAM533gvzP98zezsjioYhTSXIPSOJiMUbqOl5668l8o+bKiZavkgyJ2
	wxbBGcHwEFoC9G4cwmGH8LuysbnFi0MGzvIjYv0=
X-Google-Smtp-Source: ABdhPJx/MGnqzQ61ltPbx1u6Zj8s5BcsGFbawe8UlBPS1La2w24l6334c9rfN7PHtUw9bizM/Em0F44KkOMtHX6AAwg=
X-Received: by 2002:a2e:a5c4:: with SMTP id n4mr24740956ljp.331.1630412988255;
 Tue, 31 Aug 2021 05:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210830200540.9888-1-andrey.z@gmail.com> <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
 <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
 <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
 <CAHtQpK7ZEwk08C3OJFZnkk30XaGw=iyr7HcJLfsRkQ2otGyrWA@mail.gmail.com>
 <afbd6b7ad0506d4888bdeb17b1ec6f9c12cb4785.camel@linuxfoundation.org>
 <CAHtQpK7qEHh=43RtOmwgxEXKghZPHucy9bMQosAbEe63PWt=PQ@mail.gmail.com> <bfca76ca0ec22d42415e45f9d3aa145ab3272461.camel@linuxfoundation.org>
In-Reply-To: <bfca76ca0ec22d42415e45f9d3aa145ab3272461.camel@linuxfoundation.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 31 Aug 2021 14:29:13 +0200
Message-ID: <CAHtQpK6KzoKTRRig9Ta3=v5Ky9UANmnr5UuLvkrXTB6QDZuZOQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 31, 2021 at 2:19 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-08-31 at 13:54 +0200, Andrey Zhizhikin wrote:
> > Hello Richard,
> >
> > On Tue, Aug 31, 2021 at 12:03 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2021-08-31 at 11:53 +0200, Andrey Zhizhikin wrote:
> > > > Hello Bruce,
> > > >
> > > > On Mon, Aug 30, 2021 at 11:12 PM Bruce Ashfield
> > > > <bruce.ashfield@gmail.com> wrote:
> > > > >
> > > > > On Mon, Aug 30, 2021 at 4:55 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > > > >
> > > > > > Hello Richard,
> > > > > >
> > > > > > On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
> > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > >
> > > > > > > On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > > > > > > > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > > > > > > > build time instead of shipping them") uses perl to generate assembler
> > > > > > > > files for crypto functionality, which relies on the integer.pm module to
> > > > > > > > be provided.
> > > > > > > >
> > > > > > > > Add this module to FILES and export it for build system.
> > > > > > > >
> > > > > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > > > > ---
> > > > > > > >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > >
> > > > > > > > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > index ab19a8d0be0..7a07b3f4911 100644
> > > > > > > > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> > > > > > > >                 ${libdir}/perl5/${PV}/strict.pm \
> > > > > > > >                 ${libdir}/perl5/${PV}/warnings.pm \
> > > > > > > >                 ${libdir}/perl5/${PV}/warnings \
> > > > > > > > +               ${libdir}/perl5/${PV}/integer.pm \
> > > > > > > >                 ${libdir}/perl5/${PV}/vars.pm \
> > > > > > > >                 ${libdir}/perl5/site_perl \
> > > > > > > >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
> > > > > > >
> > > > > > > Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> > > > > > > than adding to the main perl package?
> > > > > >
> > > > > > Good point! Now that I look at it - this does look a bit too intrusive
> > > > > > (even though it did serve the purpose).
> > > > > >
> > > > > > I'm just not sure if I can craft it to RDEPENDS in kernel class instead...
> > > > > >
> > > > > > This is definitely required by newer kernel builds (>= 5.14), but I'm
> > > > > > no expert in how those dependencies are set in kernel class. Would
> > > > > > need to look a bit deeper there.
> > > > >
> > > > > Doing it consistently is the challenge, so we tend to not set them in
> > > > > the classes themselves.
> > > >
> > > > Understood. Now I see the reason why I didn't observe any of those
> > > > dependencies in the kernel classes themselves.
> > > >
> > > > >
> > > > > You have to check both the architecture and the version for many of
> > > > > the depends/rdepends.
> > > > >
> > > > > Which is why I tend to carry dependencies like this in the individual
> > > > > recipes, since the version is known and the arch is an easy check.
> > > >
> > > > This is not a problem for me, as I can add it to the layer kernel
> > > > recipe. What I believe the problem might be is that after kernel
> > > > migration, eventually all BSP layers would have the same RDEPENDS
> > > > defined in their respective kernel recipes. This does call for some
> > > > unification imho, but I'm not sure how this can be properly done.
> > > >
> > > > The other thing here is: the same Perl module would be required in the
> > > > SDK in order to build Kernels >= 5.14 standalone.
> > > > I was planning to include it into RDEPENDS of
> > > > nativesdk-packagegroup-sdk-host, but contemplating now if this is a
> > > > proper way of doing it. I see that the package group contains flex and
> > > > bison for kernel builds, so adding perl integer module there seems
> > > > quite logical to me. Unless there are good reasons not to do it this
> > > > way.
> > >
> > > Isn't the kernel-devsrc recipe the place this should be added? You'd need that
> > > to be building the kernel on target?
> >
> > This is needed to build kernel on the host using standalone SDK.
> >
> > To my knowledge, Perl (as a base package) is already provided in the
> > SDK, but required module is not. This makes the tooling incomplete and
> > breaks the build when kernel is upgraded to latest versions.
> >
> > I've just tried it, and adding it to kernel-devsrc did not solve the
> > missing module issue.
>
> As far as I recall we don't include perl in our SDKs and rely on the one from
> the host. Which SDK exactly are you using?

This is then rather strange and confusing...

I do generate standalone SDK via 'bitbake meta-toolchain', which to my
current understanding should pull only minimal set of toolchain
component into its content. This does include Perl, perhaps through
some dependency resolution.

Since I use distro from meta-freescale layer - it might be (but less
likely) coming from some dependencies inside of it... I can try to
generate it off Poky distro now to see if it has Perl inside as well.

>
> Cheers,
>
> Richard
>


-- 
Regards,
Andrey.
