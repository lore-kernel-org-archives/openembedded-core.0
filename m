Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.804.1626472668740391820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 14:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:34868 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1m4Vq8-008gn7-SM; Fri, 16 Jul 2021 17:57:47 -0400
Date: Fri, 16 Jul 2021 17:57:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to configure an image with *full* debugging info in the libs and binaries?
In-Reply-To: <CAMKF1sq2tj=wBK=OAk4QMniqgzn1_DpPLLQfN=JWMYOWen-zsQ@mail.gmail.com>
Message-ID: <5fc8a0b1-2d9-eed-7a89-602a91d0975@crashcourse.ca>
References: <6d41368-58fa-56e-63c5-7d445550a928@crashcourse.ca> <CAMKF1sq2tj=wBK=OAk4QMniqgzn1_DpPLLQfN=JWMYOWen-zsQ@mail.gmail.com>
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

On Fri, 16 Jul 2021, Khem Raj wrote:

> On Fri, Jul 16, 2021 at 12:10 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   colleague just asked me what it would take to generate an image
> > where the executables and libraries contain all the gdb-related
> > debugging info in the same files (that is, not broken out in the
> > .debug directories).
> >
> >   i pointed out that this would increase the size of the installable
> > target image substantially but, apparently, that is of no concern.
> >
> >   said colleague pointed me here as to what they were perusing:
> >
> > https://developer.ridgerun.com/wiki/index.php?title=Preparing_Yocto_Development_Environment_for_Debugging
> >
> > so, once i finish this current task, i'm going to take a shot at
> > testing whether the following would do it:
> >
> >   # Specifies to build packages with debugging information
> >   DEBUG_BUILD = "1"
> >   # Do not remove debug symbols
> >   INHIBIT_PACKAGE_STRIP = "1"
> >   # OPTIONAL: Do not split debug symbols in a separate file
> >   INHIBIT_PACKAGE_DEBUG_SPLIT= "1"
> >
> > am i on the right track? this seems straightforward enough, i'll just
> > have to confirm those variables still exist, and that they do what i
> > want.
> >
> >   thoughts? is this as simple as i think it should be?
>
> I think you should try
>
> EXTRA_IMAGE_FEATURES_append = " tools-debug dbg-pkgs"

  pretty sure you don't need both "EXTRA_" and "_append". :-)

> this should get you all needed debug info and tools on target
>
> then if you want to make optimization levels to favor debug info
> generation set DEBUG_BUILD = "1"

  i'm ... not convinced (i'll be trying this later), but to be clear,
i don't want separate .debug content, i want a single image with all
the debug info right in the binaries and executables.

  i'll try some things later and we'll see what happens.

rday

