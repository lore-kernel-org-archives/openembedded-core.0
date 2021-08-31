Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.4530.1630412362085709882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 05:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PyawxGus;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso1902539wmc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nOyyMqyvwPI+EgoiMeC+9me08AR9XOFL1CsX7+4Cqe0=;
        b=PyawxGusBMzu+bqwZThap+LL4eE81flnS9WQ7cyPdgLnEWeFHuMaE/qrqbyM7fJV7H
         5CC45hwBCkM2M49R5XrupjkstQ5v0VT3yCy0AaBn83Q9fXeK8TrgXq2E1WUiA8xTrevp
         GDqHcnSyPmpwRAaSXRxOIUwi5ImwaD8oX20yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nOyyMqyvwPI+EgoiMeC+9me08AR9XOFL1CsX7+4Cqe0=;
        b=J5ElMZ/1huWUThRG90SEWLLjNVuqoxtehWHeLqIEImQ4kido02ySL0nhbnAbPOvm+F
         xPwnbV+sDloqOYwX10sgyXWyUxw8cYszMSGS5vYGEPGma+7zuTEvVQ90w2vkaydbEqbo
         aSciBISBNhr5Y0SOJoNJWiHLEh4mnZ0MQd7hYqg0pnrdQs8Y74QHom/028gKl5PkW57O
         hM8N+kYBHxvml3VkkHIUV9h5kw8AqZ5lk/TUCVeFkF5e0dbXRRXNIiKEXVFdL+dz9iPm
         7FMYcbKwGwGMIPslrH+GZEcFJloZIUYBZTbJytcJRTqbHN9HmhZjxSy159OFG2t1Q2Zw
         2v+Q==
X-Gm-Message-State: AOAM531RcV/G4yuxB8ozYAai18DwgFMpExkTrXc4ZVBBrgDB3JsR9cZg
	0Ou8AdlFt8gnd74+pVEjEDwNgg==
X-Google-Smtp-Source: ABdhPJwv8bKp9f6NM7uQdLy1FLlgQ7ye4eVaJ0FEsUKd/CFMxwKUaY4f29Lpvc9uS38KTtBsFZVVlA==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr3999124wma.42.1630412360469;
        Tue, 31 Aug 2021 05:19:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id o23sm6538799wro.76.2021.08.31.05.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 05:19:19 -0700 (PDT)
Message-ID: <bfca76ca0ec22d42415e45f9d3aa145ab3272461.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Tue, 31 Aug 2021 13:19:17 +0100
In-Reply-To: <CAHtQpK7qEHh=43RtOmwgxEXKghZPHucy9bMQosAbEe63PWt=PQ@mail.gmail.com>
References: <20210830200540.9888-1-andrey.z@gmail.com>
	 <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
	 <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
	 <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
	 <CAHtQpK7ZEwk08C3OJFZnkk30XaGw=iyr7HcJLfsRkQ2otGyrWA@mail.gmail.com>
	 <afbd6b7ad0506d4888bdeb17b1ec6f9c12cb4785.camel@linuxfoundation.org>
	 <CAHtQpK7qEHh=43RtOmwgxEXKghZPHucy9bMQosAbEe63PWt=PQ@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-08-31 at 13:54 +0200, Andrey Zhizhikin wrote:
> Hello Richard,
> 
> On Tue, Aug 31, 2021 at 12:03 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Tue, 2021-08-31 at 11:53 +0200, Andrey Zhizhikin wrote:
> > > Hello Bruce,
> > > 
> > > On Mon, Aug 30, 2021 at 11:12 PM Bruce Ashfield
> > > <bruce.ashfield@gmail.com> wrote:
> > > > 
> > > > On Mon, Aug 30, 2021 at 4:55 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > > > 
> > > > > Hello Richard,
> > > > > 
> > > > > On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > 
> > > > > > On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > > > > > > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > > > > > > build time instead of shipping them") uses perl to generate assembler
> > > > > > > files for crypto functionality, which relies on the integer.pm module to
> > > > > > > be provided.
> > > > > > > 
> > > > > > > Add this module to FILES and export it for build system.
> > > > > > > 
> > > > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > > > ---
> > > > > > >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > index ab19a8d0be0..7a07b3f4911 100644
> > > > > > > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> > > > > > >                 ${libdir}/perl5/${PV}/strict.pm \
> > > > > > >                 ${libdir}/perl5/${PV}/warnings.pm \
> > > > > > >                 ${libdir}/perl5/${PV}/warnings \
> > > > > > > +               ${libdir}/perl5/${PV}/integer.pm \
> > > > > > >                 ${libdir}/perl5/${PV}/vars.pm \
> > > > > > >                 ${libdir}/perl5/site_perl \
> > > > > > >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
> > > > > > 
> > > > > > Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> > > > > > than adding to the main perl package?
> > > > > 
> > > > > Good point! Now that I look at it - this does look a bit too intrusive
> > > > > (even though it did serve the purpose).
> > > > > 
> > > > > I'm just not sure if I can craft it to RDEPENDS in kernel class instead...
> > > > > 
> > > > > This is definitely required by newer kernel builds (>= 5.14), but I'm
> > > > > no expert in how those dependencies are set in kernel class. Would
> > > > > need to look a bit deeper there.
> > > > 
> > > > Doing it consistently is the challenge, so we tend to not set them in
> > > > the classes themselves.
> > > 
> > > Understood. Now I see the reason why I didn't observe any of those
> > > dependencies in the kernel classes themselves.
> > > 
> > > > 
> > > > You have to check both the architecture and the version for many of
> > > > the depends/rdepends.
> > > > 
> > > > Which is why I tend to carry dependencies like this in the individual
> > > > recipes, since the version is known and the arch is an easy check.
> > > 
> > > This is not a problem for me, as I can add it to the layer kernel
> > > recipe. What I believe the problem might be is that after kernel
> > > migration, eventually all BSP layers would have the same RDEPENDS
> > > defined in their respective kernel recipes. This does call for some
> > > unification imho, but I'm not sure how this can be properly done.
> > > 
> > > The other thing here is: the same Perl module would be required in the
> > > SDK in order to build Kernels >= 5.14 standalone.
> > > I was planning to include it into RDEPENDS of
> > > nativesdk-packagegroup-sdk-host, but contemplating now if this is a
> > > proper way of doing it. I see that the package group contains flex and
> > > bison for kernel builds, so adding perl integer module there seems
> > > quite logical to me. Unless there are good reasons not to do it this
> > > way.
> > 
> > Isn't the kernel-devsrc recipe the place this should be added? You'd need that
> > to be building the kernel on target?
> 
> This is needed to build kernel on the host using standalone SDK.
> 
> To my knowledge, Perl (as a base package) is already provided in the
> SDK, but required module is not. This makes the tooling incomplete and
> breaks the build when kernel is upgraded to latest versions.
> 
> I've just tried it, and adding it to kernel-devsrc did not solve the
> missing module issue.

As far as I recall we don't include perl in our SDKs and rely on the one from
the host. Which SDK exactly are you using?

Cheers,

Richard

