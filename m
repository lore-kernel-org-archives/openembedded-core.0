Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3543.1630404192092228170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 03:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TIACBaK+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id q11so26716430wrr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 03:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HFcncsodPIr9scL2qb1+MUMQDszK6o94iFWeK1tNY14=;
        b=TIACBaK+ZpBlrt75pmFhQreDAI946ofqBKtzLi4MMncS09ns07fWZoDNcV4DjJIITx
         wx+LSYcGVgS3XvUJvI/+0+nxodn9J/Y+2NYq/5D+0m/4tg8rX1S+q9gzCt4o6MQCVHwT
         V2hEz1SCo+zrCfKjUpuwQoCh0mMZng8LdmCD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HFcncsodPIr9scL2qb1+MUMQDszK6o94iFWeK1tNY14=;
        b=BqbfxQ/8+VgUMAXLxx9MEGnTyM2Xq6Pkaq2MOnvJLlMujUnnbflBTh+nGnNgtIEAAw
         Gx4Ng0ocyDdPo/LElr9vtFjjQoRnVUwNTN/LhnBS7C197e2sfuKzFgZcYcBggxsUe8QS
         v/HvWV2EsHUJsgeVKuARJ59gqBJ2hj8XnwPvKywNP7DQWTdGciJ2G2sNtD2ANge2/B29
         byQVjSloBC3512Xiaew4YPb2SjHs+TMOJT8ylDD5z+2oCW9/MjTZgKlr1Dva2KV9SjMM
         SgOEiYcXjUD4m/GNEtOLxoolfE+cKVSsmZoaPF1G3RWyWf0pzRzY5oQgtH/vMUQOFv7m
         OExg==
X-Gm-Message-State: AOAM530xEvTEgNpbjThdZz36z2Okwzir0AXu0VDehW80DMAkmjyhlhqJ
	LrDIw9tyCgA2ryx5HBBZ4sXsTw==
X-Google-Smtp-Source: ABdhPJxnAIQt4eXtaTfiMlexR8r6qzvlb1CVNqgOG7eqJNTB7KsvVwWb5zpFC0CJh3W0mZAlwT00qA==
X-Received: by 2002:adf:d1b2:: with SMTP id w18mr22918162wrc.6.1630404190530;
        Tue, 31 Aug 2021 03:03:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id b18sm17985468wrr.89.2021.08.31.03.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 03:03:10 -0700 (PDT)
Message-ID: <afbd6b7ad0506d4888bdeb17b1ec6f9c12cb4785.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Aug 2021 11:03:09 +0100
In-Reply-To: <CAHtQpK7ZEwk08C3OJFZnkk30XaGw=iyr7HcJLfsRkQ2otGyrWA@mail.gmail.com>
References: <20210830200540.9888-1-andrey.z@gmail.com>
	 <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
	 <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
	 <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
	 <CAHtQpK7ZEwk08C3OJFZnkk30XaGw=iyr7HcJLfsRkQ2otGyrWA@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-08-31 at 11:53 +0200, Andrey Zhizhikin wrote:
> Hello Bruce,
> 
> On Mon, Aug 30, 2021 at 11:12 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > 
> > On Mon, Aug 30, 2021 at 4:55 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > 
> > > Hello Richard,
> > > 
> > > On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > 
> > > > On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > > > > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > > > > build time instead of shipping them") uses perl to generate assembler
> > > > > files for crypto functionality, which relies on the integer.pm module to
> > > > > be provided.
> > > > > 
> > > > > Add this module to FILES and export it for build system.
> > > > > 
> > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > ---
> > > > >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > index ab19a8d0be0..7a07b3f4911 100644
> > > > > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> > > > >                 ${libdir}/perl5/${PV}/strict.pm \
> > > > >                 ${libdir}/perl5/${PV}/warnings.pm \
> > > > >                 ${libdir}/perl5/${PV}/warnings \
> > > > > +               ${libdir}/perl5/${PV}/integer.pm \
> > > > >                 ${libdir}/perl5/${PV}/vars.pm \
> > > > >                 ${libdir}/perl5/site_perl \
> > > > >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
> > > > 
> > > > Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> > > > than adding to the main perl package?
> > > 
> > > Good point! Now that I look at it - this does look a bit too intrusive
> > > (even though it did serve the purpose).
> > > 
> > > I'm just not sure if I can craft it to RDEPENDS in kernel class instead...
> > > 
> > > This is definitely required by newer kernel builds (>= 5.14), but I'm
> > > no expert in how those dependencies are set in kernel class. Would
> > > need to look a bit deeper there.
> > 
> > Doing it consistently is the challenge, so we tend to not set them in
> > the classes themselves.
> 
> Understood. Now I see the reason why I didn't observe any of those
> dependencies in the kernel classes themselves.
> 
> > 
> > You have to check both the architecture and the version for many of
> > the depends/rdepends.
> > 
> > Which is why I tend to carry dependencies like this in the individual
> > recipes, since the version is known and the arch is an easy check.
> 
> This is not a problem for me, as I can add it to the layer kernel
> recipe. What I believe the problem might be is that after kernel
> migration, eventually all BSP layers would have the same RDEPENDS
> defined in their respective kernel recipes. This does call for some
> unification imho, but I'm not sure how this can be properly done.
> 
> The other thing here is: the same Perl module would be required in the
> SDK in order to build Kernels >= 5.14 standalone.
> I was planning to include it into RDEPENDS of
> nativesdk-packagegroup-sdk-host, but contemplating now if this is a
> proper way of doing it. I see that the package group contains flex and
> bison for kernel builds, so adding perl integer module there seems
> quite logical to me. Unless there are good reasons not to do it this
> way.

Isn't the kernel-devsrc recipe the place this should be added? You'd need that
to be building the kernel on target?

Cheers,

Richard

