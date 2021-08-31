Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.4308.1630410887940169456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 04:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XpLNQjxo;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id c8so25336451lfi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 04:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/S7ri+lyC9JPEHCDB9KoCq6b85hZeXGghQ+5U/WDTm0=;
        b=XpLNQjxoQ1tOvnYBXhP8fLxsqUH8FTtF3rs2UOazWiV6NFEI5bllykq5EMFQhUTcss
         +Bi6bjOeFw01zdDudgb8DwABYjUgycxH9b8Vo/NRpIRZ+s3M/AUfu6vmpgJ+MNwINV5/
         NlH5zA5FILz9vcqfMFwXg2a4Aio9WStl9vDNd5T2W516OuB+XJCeV1x4AkGhBFwVs8NS
         iIz83IVMhQZXYf9BWTx6CO8TiU4H/HxuikA+OFrqy7xujNMsseqlNp+STbZxDMlqfOyH
         n8mMi5bEZ7D+DagtfGFl9WJv49GbunOM+QJIXCU9uGjz1MYHjn6U/ndrCdXz9QuT0pJy
         RJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/S7ri+lyC9JPEHCDB9KoCq6b85hZeXGghQ+5U/WDTm0=;
        b=JctCt5MShv0uUcgJ6amXdp4WnrfIqmYxCKGEQuG9Jd4I9PtR+oVepUNMLWgBL+zQ4k
         OIJzq7iLNCNZBWfIIgG3xOeiTMrkShH0UwZosJ6Zub0mr+RXIioy3ynKdQxtNvqE+VfD
         qyjhgfmPot8gk0q8j69j+NS+iMUuYULI/OaQ1WrG+FMIrXCEk/GjYSzqK3H6+QEHHhih
         ehS+kMb/3J9y5P6e8eU/vquoz1/03jTsA7yU/JNuUzVzw0Fjv3QMROl5wkFKWB2ZEK5d
         tZQn+8MONCgf3Pe4o5XXGotfdpMczHgu+pp6AFPjikqg94WmiiwkWMi3OpAsgc5RcRiM
         +Pwg==
X-Gm-Message-State: AOAM531UBo4GZSKw98yxxAh1Zy3Ee4do8pTAwoctN69Veu0QmrEZh4E0
	JjY0iQBOvAlTZzVw+L5eWJks6lSuptsdsskS8Co=
X-Google-Smtp-Source: ABdhPJybs8rctJ+pTmQzbiBmpF0ec821jWsap2O9DVIlKpzBmfxbr6b4UCcDtgSadV8IsacrPINOVDpF9cWE969otVQ=
X-Received: by 2002:a05:6512:3e0b:: with SMTP id i11mr20798488lfv.45.1630410885914;
 Tue, 31 Aug 2021 04:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210830200540.9888-1-andrey.z@gmail.com> <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
 <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
 <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
 <CAHtQpK7ZEwk08C3OJFZnkk30XaGw=iyr7HcJLfsRkQ2otGyrWA@mail.gmail.com> <afbd6b7ad0506d4888bdeb17b1ec6f9c12cb4785.camel@linuxfoundation.org>
In-Reply-To: <afbd6b7ad0506d4888bdeb17b1ec6f9c12cb4785.camel@linuxfoundation.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 31 Aug 2021 13:54:11 +0200
Message-ID: <CAHtQpK7qEHh=43RtOmwgxEXKghZPHucy9bMQosAbEe63PWt=PQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Tue, Aug 31, 2021 at 12:03 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-08-31 at 11:53 +0200, Andrey Zhizhikin wrote:
> > Hello Bruce,
> >
> > On Mon, Aug 30, 2021 at 11:12 PM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Mon, Aug 30, 2021 at 4:55 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > >
> > > > Hello Richard,
> > > >
> > > > On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > > > > > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > > > > > build time instead of shipping them") uses perl to generate assembler
> > > > > > files for crypto functionality, which relies on the integer.pm module to
> > > > > > be provided.
> > > > > >
> > > > > > Add this module to FILES and export it for build system.
> > > > > >
> > > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > > ---
> > > > > >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > index ab19a8d0be0..7a07b3f4911 100644
> > > > > > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> > > > > >                 ${libdir}/perl5/${PV}/strict.pm \
> > > > > >                 ${libdir}/perl5/${PV}/warnings.pm \
> > > > > >                 ${libdir}/perl5/${PV}/warnings \
> > > > > > +               ${libdir}/perl5/${PV}/integer.pm \
> > > > > >                 ${libdir}/perl5/${PV}/vars.pm \
> > > > > >                 ${libdir}/perl5/site_perl \
> > > > > >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
> > > > >
> > > > > Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> > > > > than adding to the main perl package?
> > > >
> > > > Good point! Now that I look at it - this does look a bit too intrusive
> > > > (even though it did serve the purpose).
> > > >
> > > > I'm just not sure if I can craft it to RDEPENDS in kernel class instead...
> > > >
> > > > This is definitely required by newer kernel builds (>= 5.14), but I'm
> > > > no expert in how those dependencies are set in kernel class. Would
> > > > need to look a bit deeper there.
> > >
> > > Doing it consistently is the challenge, so we tend to not set them in
> > > the classes themselves.
> >
> > Understood. Now I see the reason why I didn't observe any of those
> > dependencies in the kernel classes themselves.
> >
> > >
> > > You have to check both the architecture and the version for many of
> > > the depends/rdepends.
> > >
> > > Which is why I tend to carry dependencies like this in the individual
> > > recipes, since the version is known and the arch is an easy check.
> >
> > This is not a problem for me, as I can add it to the layer kernel
> > recipe. What I believe the problem might be is that after kernel
> > migration, eventually all BSP layers would have the same RDEPENDS
> > defined in their respective kernel recipes. This does call for some
> > unification imho, but I'm not sure how this can be properly done.
> >
> > The other thing here is: the same Perl module would be required in the
> > SDK in order to build Kernels >= 5.14 standalone.
> > I was planning to include it into RDEPENDS of
> > nativesdk-packagegroup-sdk-host, but contemplating now if this is a
> > proper way of doing it. I see that the package group contains flex and
> > bison for kernel builds, so adding perl integer module there seems
> > quite logical to me. Unless there are good reasons not to do it this
> > way.
>
> Isn't the kernel-devsrc recipe the place this should be added? You'd need that
> to be building the kernel on target?

This is needed to build kernel on the host using standalone SDK.

To my knowledge, Perl (as a base package) is already provided in the
SDK, but required module is not. This makes the tooling incomplete and
breaks the build when kernel is upgraded to latest versions.

I've just tried it, and adding it to kernel-devsrc did not solve the
missing module issue.

>
> Cheers,
>
> Richard
>


--
Regards,
Andrey.
