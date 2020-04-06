Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.682.1586197298232310535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 11:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8F9DA40BA3;
	Mon,  6 Apr 2020 18:21:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLYc9FSbq2h7; Mon,  6 Apr 2020 18:21:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5341C40027;
	Mon,  6 Apr 2020 18:21:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A956D17126C; Mon,  6 Apr 2020 14:21:33 -0400 (EDT)
Date: Mon, 6 Apr 2020 14:21:33 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] couple questions on PACKAGECONFIG (for improving docs)
Message-ID: <20200406182133.GY1578@denix.org>
References: <alpine.LFD.2.21.2004061153450.16686@localhost.localdomain>
 <20200406163831.verkxulxeru3kwsy@qschulz>
 <alpine.LFD.2.21.2004061318090.20608@localhost.localdomain>
 <0ea9d7e55351659c3bc4805537f5a7e74fca7892.camel@linuxfoundation.org>
 <alpine.LFD.2.21.2004061401020.22599@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2004061401020.22599@localhost.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 02:01:45PM -0400, rpjday@crashcourse.ca wrote:
> On Mon, 6 Apr 2020, Richard Purdie wrote:
> 
> > On Mon, 2020-04-06 at 13:58 -0400, rpjday@crashcourse.ca wrote:
> > > On Mon, 6 Apr 2020, Quentin Schulz wrote:
> > >
> > > > On Mon, Apr 06, 2020 at 12:05:15PM -0400, rpjday@crashcourse.ca
> > > > wrote:
> > > > >   wanted to tweak the ref manual entry for PACKAGECONFIG, so a
> > > > > couple
> > > > > issues. first, the ref manual entry:
> > > > >
> > > > > https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
> > > > >
> > > > > says nothing about the possible *sixth* entry, described in
> > > > > base.bbclass as "foo_conflict_packageconfig", so i can add that
> > > > > but
> > > > > i'm open to proper wording since i'd probably screw it up.
> > > > > (i'd add an actual example from poky/ demonstrating this, such
> > > > > as:
> > > > >
> > > > > meta/recipes-support/curl/curl_7.69.1.bb:PACKAGECONFIG[threaded-
> > > > > resolver]
> > > > >   = "--enable-threaded-resolver,--disable-threaded-
> > > > > resolver,,,,ares"
> > > >
> > > > https://media.giphy.com/media/puPeyz4SOYEKY/giphy.gif
> > > > [minion screaming what]
> > > >
> > > > Didn't know about that one :) So PLEASE, document :)
> > >
> > >   yeah, that was one of those cases where i just wanted to match
> > > examples against the actual processing in base.bbclass, and went,
> > > "whoa, what the heck is *that*?" then went looking for examples. in
> > > fact, curl is a nice example, as it contains:
> > >
> > > # 'ares' and 'threaded-resolver' are mutually exclusive
> > > PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-
> > > ares,,,threaded-resolver"
> > > ... snip ...
> > > PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,
> > > --disable-threaded-resolver,,,,ares"
> > >
> > > so that's the obvious example to demonstrate that. i'd never noticed
> > > that before.
> >
> > FWIW it was only added recently within the last month or so. We've not
> > got around to the docs for various reasons but happy to have help
> > there!
> 
>   ok, that explains it ... i'll put something together once i get to
> that point in the manual.

https://git.openembedded.org/openembedded-core/commit/?id=734475b3f86d88a548bc9eb91d836bd1b9335e9f
