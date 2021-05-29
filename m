Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.26376.1622330780595745407
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 16:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:36598 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ln8LU-00GJYX-Bc; Sat, 29 May 2021 19:26:19 -0400
Date: Sat, 29 May 2021 19:26:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] cmake versus autotools in recipe files versus source
In-Reply-To: <CAMKF1soOHDqdXjf4apmAS3Mdxf2DaVQVoJ3GYqwRMpiJbLV+Mw@mail.gmail.com>
Message-ID: <701a5163-d0da-5fae-be35-7454c1ec3f4e@crashcourse.ca>
References: <e2e6ac-a52c-15db-8bc0-367da2c4a23a@crashcourse.ca> <CAMKF1soOHDqdXjf4apmAS3Mdxf2DaVQVoJ3GYqwRMpiJbLV+Mw@mail.gmail.com>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 May 2021, Khem Raj wrote:

> Hi Robert
>
> On Sat, May 29, 2021 at 2:29 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   (yet another in an endless series of dumb questions as i get asked
> > about these things by colleagues and realize i don't know the answer.)
> >
> >   can someone clarify the oddity of recipes whose source contains a
> > CMakeLists.txt file at the top, but whose recipe does not "inherit
> > cmake"?
> >
> >   example: oe-core's "lzo" -- the recipe file contains:
> >
> >   inherit autotools ptest
> >
> > but the unpacked source contains a "CMakeLists.txt" file (as well as
> > autotools stuff).
> >
> >   is that just to give the user the option of building with cmake or
> > autotools?
>
> OE does not get to decide what build system a component will choose
> to use and with time many packages switch their build systems from
> one to other and some add multiple build systems that end user can
> choose to use one over other. What OE does is tries to use most
> stable/robust one that is supported by the particular community and
> developers, in some case they allow an overlap for few releases when
> they are migrating from one to other. So we wait until new system is
> functionally equivalent to prior one.
>
> In example you cited OE is prefering to use autotools over cmake
> when building lzo at the moment if it so happens that CMake is what
> they are moving to and its officially declared as supported them we
> will switch to.

  right, that's what i thought ... while the source itself supports
building with either cmake or autotools, OE chooses the autotools
option, until such time as it decides otherwise.

rday
