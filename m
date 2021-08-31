Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.3372.1630403618988256927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 02:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aQoru580;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id j12so30630467ljg.10
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 02:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Q/dy8+22vCPRI9a5PM18tU0hGn0asdAxMHZlto7PZQ=;
        b=aQoru580b8sLGLKDN20CDr46JvtcEEj1O4vqRI/raDIMvFJoxobxRu8oBJaLGhfcYX
         q5u8WJq9I4rqYCWT2sQl4KvYSzAYavbh7nmxflGeEWUuVvhF5RRQCuJz0GGve0w53FGX
         33XceckuzZbxXJNiQiXZhgyVVoK9SyBSNAPW5e0vBZ0GbVKg5X8Dks9QDLYhZgCEuGX/
         iR1qXjWXq+bUIESO2TxwXiDXVTq5Dt7/w+R4X/K8uJ6Pv14PA0PLeNM1p2KBecER6xOg
         IHlrMJW3I+IDtPfgQzzqW1kONisOfHI4JtmX3hx7RnWxiw/be7OBg1CrveFZql10iHu+
         +gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Q/dy8+22vCPRI9a5PM18tU0hGn0asdAxMHZlto7PZQ=;
        b=n1R/5iG09hNiNMa32V594h5/jeKGbg6Gy7yo3Q5J2Vd+2sEA9FhuW7fF81XkZ32RnD
         0EbrJ4nd2SNPB+I6/pvyNvI5qupMY8YBgxSXYyQ7DsgjVhAWI2Eew/IWTuxlX0vebg/O
         1yumC+giATsfmvviZJVl0Tp5bSOK4S+k542L+aUcWS/9UMcMNcVkuDuoIPFMrKjjd1vK
         ncXhVoBr8WqJLQLcdqZmvLGTBorsE8He318ig7w2hdbtaOYoZLX3MIpBRHOAgZwQkXet
         o4ggp4M599wLWW3Br4LY6Iq6qukWoIYotk0ZIl3anBrVsLvadk0sXDdBirH4dtutanWC
         EWGw==
X-Gm-Message-State: AOAM533vN5vXpbRoHCqoe7JdzjXjpoHbSBB+aAqxIsx6vVIRrY/9pqGo
	QjNLJGNLJbZpiRPp6FEWNHwsyOl8ZzOOiMA9Kp8=
X-Google-Smtp-Source: ABdhPJy/Ua/HaGXawCGyzpqVysC0vGmDQYA7QIiSpG64U+1G/L5n0UoWSoKTjUePatDIECTaFRcUdTN6oni4h4Ic7Bw=
X-Received: by 2002:a05:651c:10a2:: with SMTP id k2mr24548116ljn.262.1630403617020;
 Tue, 31 Aug 2021 02:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210830200540.9888-1-andrey.z@gmail.com> <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
 <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com> <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
In-Reply-To: <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 31 Aug 2021 11:53:02 +0200
Message-ID: <CAHtQpK7ZEwk08C3OJFZnkk30XaGw=iyr7HcJLfsRkQ2otGyrWA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Bruce,

On Mon, Aug 30, 2021 at 11:12 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Mon, Aug 30, 2021 at 4:55 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > Hello Richard,
> >
> > On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > > > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > > > build time instead of shipping them") uses perl to generate assembler
> > > > files for crypto functionality, which relies on the integer.pm module to
> > > > be provided.
> > > >
> > > > Add this module to FILES and export it for build system.
> > > >
> > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > index ab19a8d0be0..7a07b3f4911 100644
> > > > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> > > >                 ${libdir}/perl5/${PV}/strict.pm \
> > > >                 ${libdir}/perl5/${PV}/warnings.pm \
> > > >                 ${libdir}/perl5/${PV}/warnings \
> > > > +               ${libdir}/perl5/${PV}/integer.pm \
> > > >                 ${libdir}/perl5/${PV}/vars.pm \
> > > >                 ${libdir}/perl5/site_perl \
> > > >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
> > >
> > > Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> > > than adding to the main perl package?
> >
> > Good point! Now that I look at it - this does look a bit too intrusive
> > (even though it did serve the purpose).
> >
> > I'm just not sure if I can craft it to RDEPENDS in kernel class instead...
> >
> > This is definitely required by newer kernel builds (>= 5.14), but I'm
> > no expert in how those dependencies are set in kernel class. Would
> > need to look a bit deeper there.
>
> Doing it consistently is the challenge, so we tend to not set them in
> the classes themselves.

Understood. Now I see the reason why I didn't observe any of those
dependencies in the kernel classes themselves.

>
> You have to check both the architecture and the version for many of
> the depends/rdepends.
>
> Which is why I tend to carry dependencies like this in the individual
> recipes, since the version is known and the arch is an easy check.

This is not a problem for me, as I can add it to the layer kernel
recipe. What I believe the problem might be is that after kernel
migration, eventually all BSP layers would have the same RDEPENDS
defined in their respective kernel recipes. This does call for some
unification imho, but I'm not sure how this can be properly done.

The other thing here is: the same Perl module would be required in the
SDK in order to build Kernels >= 5.14 standalone.
I was planning to include it into RDEPENDS of
nativesdk-packagegroup-sdk-host, but contemplating now if this is a
proper way of doing it. I see that the package group contains flex and
bison for kernel builds, so adding perl integer module there seems
quite logical to me. Unless there are good reasons not to do it this
way.

>
> I had some roughed out patches to start moving some of the
> dependencies into the classes, just to make creating custom recipes a
> bit easier, but I didn't complete them to my satisfaction and can't
> see to track them down at the moment.
>
> Bruce
>
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
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
