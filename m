Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.5688.1630417284663012791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 06:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=abkIht4A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t15so21585772wrg.7
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VgxVf2AHSY5qdTu9PHqE4eMR+GfTuhc4nVny8hT402U=;
        b=abkIht4ABVL/AF9GtSHgb4x9I0dQ/zyOVozbQTNXYU8cgGI07vK14WGlKCPJC7k/H6
         Y9YF1hnfYxmSiQzXcF1VRFz48izpk2d7n3UL4lBPl5kSNHeyLbOpdxWoP9D6fRdR6uCg
         6SUqFca55RYt2f2b273Pn+h0TtwXhtIhZrzI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VgxVf2AHSY5qdTu9PHqE4eMR+GfTuhc4nVny8hT402U=;
        b=e6K7yTY/GKFuqv94NPZqmur+xgz69CkmgUP27vuxv8dpi+gdqTLA7uY837YowBvuHq
         +Qz0+FQZpUNBl5mJtBHEJiCwhGFyFWd2ztpapO4qqkrlvlziQGHESFtu85fNIVCKvdCB
         q9oeX5/zK/yJo9u7PonL82Z1+JR5pLh2Ye+4qrqlLj8Rm49r5OpgjIy0lbEBE1ZsJf4W
         D1IVWFOGJTbaiLdBLtdHnVJwLMi/+oJowhfsTp07BI0i2LY5LZ6DdI42lXegYMYZvwYU
         DF0jF8EbhqM3q6u+irMtHIC1z2ScoozRczIv5Sp08EpFitfyXRhHQuMmUM1XJk6+J3p0
         F+VA==
X-Gm-Message-State: AOAM533+rHwBClawMD4DVOvqb13XhQVmotTawyneDOATsSV4PC01ZZ2Q
	On/9x0tzEQLGU7WfV7H//6Cnxg==
X-Google-Smtp-Source: ABdhPJyqCHKamqQvK48Bwjvrkp1NRkxCH5aSWDa16RADPi72ll623YgqgHZngR4Er+cOKcZdrIqxFA==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr31658143wra.258.1630417282643;
        Tue, 31 Aug 2021 06:41:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id z19sm18749597wrg.28.2021.08.31.06.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:41:22 -0700 (PDT)
Message-ID: <02d11db3a6761d0700fd5256b8283ae5223cd885.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Tue, 31 Aug 2021 14:41:21 +0100
In-Reply-To: <CAHtQpK7Gfs36wgX8YqCiGvRPc5Df9MTQtkWpJiJTpdpPN2vhzg@mail.gmail.com>
References: <20210830200540.9888-1-andrey.z@gmail.com>
	 <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
	 <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
	 <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
	 <CAHtQpK7ZEwk08C3OJFZnkk30XaGw=iyr7HcJLfsRkQ2otGyrWA@mail.gmail.com>
	 <afbd6b7ad0506d4888bdeb17b1ec6f9c12cb4785.camel@linuxfoundation.org>
	 <CAHtQpK7qEHh=43RtOmwgxEXKghZPHucy9bMQosAbEe63PWt=PQ@mail.gmail.com>
	 <bfca76ca0ec22d42415e45f9d3aa145ab3272461.camel@linuxfoundation.org>
	 <16A063FA1B833076.30479@lists.openembedded.org>
	 <CAHtQpK7Gfs36wgX8YqCiGvRPc5Df9MTQtkWpJiJTpdpPN2vhzg@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-08-31 at 15:26 +0200, Andrey Zhizhikin wrote:
> Richard,
> 
> On Tue, Aug 31, 2021 at 2:29 PM Andrey Zhizhikin via
> lists.openembedded.org <andrey.z=gmail.com@lists.openembedded.org>
> wrote:
> > 
> > On Tue, Aug 31, 2021 at 2:19 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > On Tue, 2021-08-31 at 13:54 +0200, Andrey Zhizhikin wrote:
> > > > Hello Richard,
> > > > 
> > > > On Tue, Aug 31, 2021 at 12:03 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > 
> > > > > On Tue, 2021-08-31 at 11:53 +0200, Andrey Zhizhikin wrote:
> > > > > > Hello Bruce,
> > > > > > 
> > > > > > On Mon, Aug 30, 2021 at 11:12 PM Bruce Ashfield
> > > > > > <bruce.ashfield@gmail.com> wrote:
> > > > > > > 
> > > > > > > On Mon, Aug 30, 2021 at 4:55 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > > > > > > 
> > > > > > > > Hello Richard,
> > > > > > > > 
> > > > > > > > On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
> > > > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > > > > 
> > > > > > > > > On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > > > > > > > > > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > > > > > > > > > build time instead of shipping them") uses perl to generate assembler
> > > > > > > > > > files for crypto functionality, which relies on the integer.pm module to
> > > > > > > > > > be provided.
> > > > > > > > > > 
> > > > > > > > > > Add this module to FILES and export it for build system.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > > > > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > > > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> > > > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > > > index ab19a8d0be0..7a07b3f4911 100644
> > > > > > > > > > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > > > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > > > > > > > > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> > > > > > > > > >                 ${libdir}/perl5/${PV}/strict.pm \
> > > > > > > > > >                 ${libdir}/perl5/${PV}/warnings.pm \
> > > > > > > > > >                 ${libdir}/perl5/${PV}/warnings \
> > > > > > > > > > +               ${libdir}/perl5/${PV}/integer.pm \
> > > > > > > > > >                 ${libdir}/perl5/${PV}/vars.pm \
> > > > > > > > > >                 ${libdir}/perl5/site_perl \
> > > > > > > > > >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
> > > > > > > > > 
> > > > > > > > > Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> > > > > > > > > than adding to the main perl package?
> > > > > > > > 
> > > > > > > > Good point! Now that I look at it - this does look a bit too intrusive
> > > > > > > > (even though it did serve the purpose).
> > > > > > > > 
> > > > > > > > I'm just not sure if I can craft it to RDEPENDS in kernel class instead...
> > > > > > > > 
> > > > > > > > This is definitely required by newer kernel builds (>= 5.14), but I'm
> > > > > > > > no expert in how those dependencies are set in kernel class. Would
> > > > > > > > need to look a bit deeper there.
> > > > > > > 
> > > > > > > Doing it consistently is the challenge, so we tend to not set them in
> > > > > > > the classes themselves.
> > > > > > 
> > > > > > Understood. Now I see the reason why I didn't observe any of those
> > > > > > dependencies in the kernel classes themselves.
> > > > > > 
> > > > > > > 
> > > > > > > You have to check both the architecture and the version for many of
> > > > > > > the depends/rdepends.
> > > > > > > 
> > > > > > > Which is why I tend to carry dependencies like this in the individual
> > > > > > > recipes, since the version is known and the arch is an easy check.
> > > > > > 
> > > > > > This is not a problem for me, as I can add it to the layer kernel
> > > > > > recipe. What I believe the problem might be is that after kernel
> > > > > > migration, eventually all BSP layers would have the same RDEPENDS
> > > > > > defined in their respective kernel recipes. This does call for some
> > > > > > unification imho, but I'm not sure how this can be properly done.
> > > > > > 
> > > > > > The other thing here is: the same Perl module would be required in the
> > > > > > SDK in order to build Kernels >= 5.14 standalone.
> > > > > > I was planning to include it into RDEPENDS of
> > > > > > nativesdk-packagegroup-sdk-host, but contemplating now if this is a
> > > > > > proper way of doing it. I see that the package group contains flex and
> > > > > > bison for kernel builds, so adding perl integer module there seems
> > > > > > quite logical to me. Unless there are good reasons not to do it this
> > > > > > way.
> > > > > 
> > > > > Isn't the kernel-devsrc recipe the place this should be added? You'd need that
> > > > > to be building the kernel on target?
> > > > 
> > > > This is needed to build kernel on the host using standalone SDK.
> > > > 
> > > > To my knowledge, Perl (as a base package) is already provided in the
> > > > SDK, but required module is not. This makes the tooling incomplete and
> > > > breaks the build when kernel is upgraded to latest versions.
> > > > 
> > > > I've just tried it, and adding it to kernel-devsrc did not solve the
> > > > missing module issue.
> > > 
> > > As far as I recall we don't include perl in our SDKs and rely on the one from
> > > the host. Which SDK exactly are you using?
> > 
> > This is then rather strange and confusing...
> > 
> > I do generate standalone SDK via 'bitbake meta-toolchain', which to my
> > current understanding should pull only minimal set of toolchain
> > component into its content. This does include Perl, perhaps through
> > some dependency resolution.
> > 
> > Since I use distro from meta-freescale layer - it might be (but less
> > likely) coming from some dependencies inside of it... I can try to
> > generate it off Poky distro now to see if it has Perl inside as well.
> 
> Just to follow-up on this: nativesdk-perl and a bunch of modules are
> pulled into the SDK by autoconf, which lists them in it's RDEPENDS.
> 
> This behavior is distro-agnostic, and making Perl to be installed into
> SDK in any case.

I had a further look and I think I'm confusing nativesdk-buildtools-perl-dummy
which is included in buildtool-tarball and nativesdk-sdk-provides-dummy which is
included in wider SDKs. The latter excludes things like bash and env but not
perl. Just to help confuse things, target-sdk-provides-dummy does exclude perl.

I guess that brings us back to nativesdk-packagegroup-sdk-host as the place
these things are listed (and where autoconf comes from).

Cheers,

Richard



