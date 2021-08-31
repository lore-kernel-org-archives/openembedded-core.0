Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.5820.1630417905447752084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 06:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kxBkYTIs;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id m28so8456252lfj.6
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/4Wpg1mIQ7ErMiM5BSSwNCX8NhhASJi/PZIfwaeZ4o=;
        b=kxBkYTIsJ113YQl05Gf9w5lZsH1a4J5hl1Kfg1A5g71vJl3outK11RYYkWBS3gplaf
         x1Lp+jQzm34akamDrhzhUdptF8SFkrU5OP1iT358wHLJsR35DYdLHEoeH1o8U1kCk4fc
         HCTmahBLmi8vba+KCgxhZNzIvsSgmqirEkRxomxJaC9FTsc5soXPCnhJQojEA6pgfScP
         BElTyI3AoGv/JEI/nOa7oa7P+gaYzZMfprMrjyVlwHZgaYi72sItXhnK6VFOFPcVWQro
         +CDH95dcojQr2FzdyIDN/Z2RjjrGgmdtqE3YoMAq7qTFMZZ7eKjERchvMaxUvcvl8Mnd
         UpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/4Wpg1mIQ7ErMiM5BSSwNCX8NhhASJi/PZIfwaeZ4o=;
        b=DmRt0qNhgC5xcUnuhoRyYiCzCimghWVMPV9jte1S3IKpsT2k/34uKgVF4tPoVSesBL
         zqRbk1ZnPeUeUxlKFJp6pszZAW6bt8yKdnygWK44t/0ZIWU04N3uRPZVz3LC1NNc72Uo
         FcSeDDZgX+dnZ3Q0GwrqEdKkPCq+lQjHFwnqQFNal7nb5SBCmx3Ym6DJvsBRfepuwIb5
         nB7zRGRqkbcp4PmLELS6BEuOxA2hF8HjIiPfpRCd66o9cea2bqeSOhuHi35I+/dJfl6r
         Duf+ywlZkp/BeWnUNiRHsbTy2eI7YJOLfjiPmRwoBIhFPScDmky/usLI/gAb1alWRabv
         ILMw==
X-Gm-Message-State: AOAM53149KS2a48a6NV+KKHVY2bPu6blt++RTbYppB+97i18ayc3/m6L
	bGW7A3dVtMiVCtdsH6FRot0+5CqafrQ7GO40Zdo=
X-Google-Smtp-Source: ABdhPJzsCnxe+hrEJyudVQ32SZsEaC7DtoFPYsGOHP5LsA2wqHL++88/GvRYELcDOHDglkmxYNluQZuLcbLyFxhI2Fw=
X-Received: by 2002:a05:6512:2315:: with SMTP id o21mr22274182lfu.138.1630417903307;
 Tue, 31 Aug 2021 06:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210830200540.9888-1-andrey.z@gmail.com> <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
 <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
 <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
 <CAHtQpK7ZEwk08C3OJFZnkk30XaGw=iyr7HcJLfsRkQ2otGyrWA@mail.gmail.com>
 <afbd6b7ad0506d4888bdeb17b1ec6f9c12cb4785.camel@linuxfoundation.org>
 <CAHtQpK7qEHh=43RtOmwgxEXKghZPHucy9bMQosAbEe63PWt=PQ@mail.gmail.com>
 <bfca76ca0ec22d42415e45f9d3aa145ab3272461.camel@linuxfoundation.org>
 <16A063FA1B833076.30479@lists.openembedded.org> <CAHtQpK7Gfs36wgX8YqCiGvRPc5Df9MTQtkWpJiJTpdpPN2vhzg@mail.gmail.com>
 <02d11db3a6761d0700fd5256b8283ae5223cd885.camel@linuxfoundation.org>
In-Reply-To: <02d11db3a6761d0700fd5256b8283ae5223cd885.camel@linuxfoundation.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 31 Aug 2021 15:51:08 +0200
Message-ID: <CAHtQpK7u4=BcfO7E1VZhDNcacWC6qL4CHG-njLGfb22S8MpbAw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 31, 2021 at 3:41 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-08-31 at 15:26 +0200, Andrey Zhizhikin wrote:
> > Richard,
> >
> > On Tue, Aug 31, 2021 at 2:29 PM Andrey Zhizhikin via
> > lists.openembedded.org <andrey.z=gmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > On Tue, Aug 31, 2021 at 2:19 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, 2021-08-31 at 13:54 +0200, Andrey Zhizhikin wrote:
> > > > > Hello Richard,
> > > > >
> > > > > On Tue, Aug 31, 2021 at 12:03 PM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Tue, 2021-08-31 at 11:53 +0200, Andrey Zhizhikin wrote:
> > > > > > > Hello Bruce,
> > > > > > >
> > > > > > > On Mon, Aug 30, 2021 at 11:12 PM Bruce Ashfield
> > > > > > > <bruce.ashfield@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Aug 30, 2021 at 4:55 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Hello Richard,
> > > > > > > > >
> > > > > > > > > On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
> > > > > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > > > > >
> > > > > > > > > > On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > > > > > > > > > > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > > > > > > > > > > build time instead of shipping them") uses perl to generate assembler
> > > > > > > > > > > files for crypto functionality, which relies on the integer.pm module to
> > > > > > > > > > > be provided.
> > > > > > > > > > >
> > > > > > > > > > > Add this module to FILES and export it for build system.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > > > > > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > > > > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> > > > > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > > > > index ab19a8d0be0..7a07b3f4911 100644
> > > > > > > > > > > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > > > > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > > > > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> > > > > > > > > > >                 ${libdir}/perl5/${PV}/strict.pm \
> > > > > > > > > > >                 ${libdir}/perl5/${PV}/warnings.pm \
> > > > > > > > > > >                 ${libdir}/perl5/${PV}/warnings \
> > > > > > > > > > > +               ${libdir}/perl5/${PV}/integer.pm \
> > > > > > > > > > >                 ${libdir}/perl5/${PV}/vars.pm \
> > > > > > > > > > >                 ${libdir}/perl5/site_perl \
> > > > > > > > > > >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
> > > > > > > > > >
> > > > > > > > > > Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> > > > > > > > > > than adding to the main perl package?
> > > > > > > > >
> > > > > > > > > Good point! Now that I look at it - this does look a bit too intrusive
> > > > > > > > > (even though it did serve the purpose).
> > > > > > > > >
> > > > > > > > > I'm just not sure if I can craft it to RDEPENDS in kernel class instead...
> > > > > > > > >
> > > > > > > > > This is definitely required by newer kernel builds (>= 5.14), but I'm
> > > > > > > > > no expert in how those dependencies are set in kernel class. Would
> > > > > > > > > need to look a bit deeper there.
> > > > > > > >
> > > > > > > > Doing it consistently is the challenge, so we tend to not set them in
> > > > > > > > the classes themselves.
> > > > > > >
> > > > > > > Understood. Now I see the reason why I didn't observe any of those
> > > > > > > dependencies in the kernel classes themselves.
> > > > > > >
> > > > > > > >
> > > > > > > > You have to check both the architecture and the version for many of
> > > > > > > > the depends/rdepends.
> > > > > > > >
> > > > > > > > Which is why I tend to carry dependencies like this in the individual
> > > > > > > > recipes, since the version is known and the arch is an easy check.
> > > > > > >
> > > > > > > This is not a problem for me, as I can add it to the layer kernel
> > > > > > > recipe. What I believe the problem might be is that after kernel
> > > > > > > migration, eventually all BSP layers would have the same RDEPENDS
> > > > > > > defined in their respective kernel recipes. This does call for some
> > > > > > > unification imho, but I'm not sure how this can be properly done.
> > > > > > >
> > > > > > > The other thing here is: the same Perl module would be required in the
> > > > > > > SDK in order to build Kernels >= 5.14 standalone.
> > > > > > > I was planning to include it into RDEPENDS of
> > > > > > > nativesdk-packagegroup-sdk-host, but contemplating now if this is a
> > > > > > > proper way of doing it. I see that the package group contains flex and
> > > > > > > bison for kernel builds, so adding perl integer module there seems
> > > > > > > quite logical to me. Unless there are good reasons not to do it this
> > > > > > > way.
> > > > > >
> > > > > > Isn't the kernel-devsrc recipe the place this should be added? You'd need that
> > > > > > to be building the kernel on target?
> > > > >
> > > > > This is needed to build kernel on the host using standalone SDK.
> > > > >
> > > > > To my knowledge, Perl (as a base package) is already provided in the
> > > > > SDK, but required module is not. This makes the tooling incomplete and
> > > > > breaks the build when kernel is upgraded to latest versions.
> > > > >
> > > > > I've just tried it, and adding it to kernel-devsrc did not solve the
> > > > > missing module issue.
> > > >
> > > > As far as I recall we don't include perl in our SDKs and rely on the one from
> > > > the host. Which SDK exactly are you using?
> > >
> > > This is then rather strange and confusing...
> > >
> > > I do generate standalone SDK via 'bitbake meta-toolchain', which to my
> > > current understanding should pull only minimal set of toolchain
> > > component into its content. This does include Perl, perhaps through
> > > some dependency resolution.
> > >
> > > Since I use distro from meta-freescale layer - it might be (but less
> > > likely) coming from some dependencies inside of it... I can try to
> > > generate it off Poky distro now to see if it has Perl inside as well.
> >
> > Just to follow-up on this: nativesdk-perl and a bunch of modules are
> > pulled into the SDK by autoconf, which lists them in it's RDEPENDS.
> >
> > This behavior is distro-agnostic, and making Perl to be installed into
> > SDK in any case.
>
> I had a further look and I think I'm confusing nativesdk-buildtools-perl-dummy
> which is included in buildtool-tarball and nativesdk-sdk-provides-dummy which is
> included in wider SDKs. The latter excludes things like bash and env but not
> perl.

Thanks for tracing it out! I had the same conclusion when I looked at
those package groups and runtime dependencies.

I guess if nativesdk-sdk-provides-dummy would exclude Perl, this might
lead to confusing autoconf and eventually break things, at least my
common sense is telling me so. Therefore, it is OK not to exclude it
via nativesdk-sdk-provides-dummy.

>Just to help confuse things, target-sdk-provides-dummy does exclude perl.
>
> I guess that brings us back to nativesdk-packagegroup-sdk-host as the place
> these things are listed (and where autoconf comes from).

OK, then I would send another patch to have the module included there.
This does sound logical to me, and at least in this case it would be a
bit more transparent why Perl is included in the SDK (in contrary to
the obscured dependency of autoconf).

>
> Cheers,
>
> Richard
>
>
>


-- 
Regards,
Andrey.
