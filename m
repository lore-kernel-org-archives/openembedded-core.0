Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.247.1586196110137789199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 11:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:45082 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jLW4B-00Efon-JO; Mon, 06 Apr 2020 14:01:48 -0400
Date: Mon, 6 Apr 2020 14:01:45 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] couple questions on PACKAGECONFIG (for improving docs)
In-Reply-To: <0ea9d7e55351659c3bc4805537f5a7e74fca7892.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2004061401020.22599@localhost.localdomain>
References: <alpine.LFD.2.21.2004061153450.16686@localhost.localdomain>  <20200406163831.verkxulxeru3kwsy@qschulz>  <alpine.LFD.2.21.2004061318090.20608@localhost.localdomain> <0ea9d7e55351659c3bc4805537f5a7e74fca7892.camel@linuxfoundation.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Apr 2020, Richard Purdie wrote:

> On Mon, 2020-04-06 at 13:58 -0400, rpjday@crashcourse.ca wrote:
> > On Mon, 6 Apr 2020, Quentin Schulz wrote:
> >
> > > On Mon, Apr 06, 2020 at 12:05:15PM -0400, rpjday@crashcourse.ca
> > > wrote:
> > > >   wanted to tweak the ref manual entry for PACKAGECONFIG, so a
> > > > couple
> > > > issues. first, the ref manual entry:
> > > >
> > > > https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
> > > >
> > > > says nothing about the possible *sixth* entry, described in
> > > > base.bbclass as "foo_conflict_packageconfig", so i can add that
> > > > but
> > > > i'm open to proper wording since i'd probably screw it up.
> > > > (i'd add an actual example from poky/ demonstrating this, such
> > > > as:
> > > >
> > > > meta/recipes-support/curl/curl_7.69.1.bb:PACKAGECONFIG[threaded-
> > > > resolver]
> > > >   = "--enable-threaded-resolver,--disable-threaded-
> > > > resolver,,,,ares"
> > >
> > > https://media.giphy.com/media/puPeyz4SOYEKY/giphy.gif
> > > [minion screaming what]
> > >
> > > Didn't know about that one :) So PLEASE, document :)
> >
> >   yeah, that was one of those cases where i just wanted to match
> > examples against the actual processing in base.bbclass, and went,
> > "whoa, what the heck is *that*?" then went looking for examples. in
> > fact, curl is a nice example, as it contains:
> >
> > # 'ares' and 'threaded-resolver' are mutually exclusive
> > PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-
> > ares,,,threaded-resolver"
> > ... snip ...
> > PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,
> > --disable-threaded-resolver,,,,ares"
> >
> > so that's the obvious example to demonstrate that. i'd never noticed
> > that before.
>
> FWIW it was only added recently within the last month or so. We've not
> got around to the docs for various reasons but happy to have help
> there!

  ok, that explains it ... i'll put something together once i get to
that point in the manual.

rday
