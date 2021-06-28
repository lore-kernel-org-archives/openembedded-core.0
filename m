Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web12.255.1624909959754743737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 12:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1lxxJ8-0007qD-B3; Mon, 28 Jun 2021 21:52:38 +0200
Date: Mon, 28 Jun 2021 21:52:38 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
Message-ID: <20210628195238.GG5525@pbcl.net>
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com>
 <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
 <6e2bcb94-8b02-50c1-bf5b-8fc3ce464d91@gmail.com>
 <20210628191055.GF5525@pbcl.net>
 <CAMKF1sr1mXehpm31m_ByS8ytGmQ--Zf42qst+SqPQK1w53f_Sw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr1mXehpm31m_ByS8ytGmQ--Zf42qst+SqPQK1w53f_Sw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 12:42:55PM -0700, Khem Raj wrote:
> On Mon, Jun 28, 2021 at 12:10 PM Phil Blundell <pb@pbcl.net> wrote:
> >
> > On Mon, Jun 28, 2021 at 11:46:08AM -0700, Khem Raj wrote:
> > > I still hope that if we can add a proper neon detection patch to meson
> > > they would be ok to accept it.
> >
> > Why doesn't the runtime detection work in the way that upstream clearly
> > think it ought to?
> 
> probably it does, someone has to test it on device without vfp.
> Currently it is still failing to compile.
> so first that needs to be fixed.

Okay, but if the runtime detection does in fact work then there's no need
for any NEON detection in Meson, right?

p.

