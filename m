Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web10.606.1624915269621140375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 14:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1lxygm-0008Gp-0r; Mon, 28 Jun 2021 23:21:08 +0200
Date: Mon, 28 Jun 2021 23:21:07 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
Message-ID: <20210628212107.GH5525@pbcl.net>
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com>
 <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
 <6e2bcb94-8b02-50c1-bf5b-8fc3ce464d91@gmail.com>
 <20210628191055.GF5525@pbcl.net>
 <CAMKF1sr1mXehpm31m_ByS8ytGmQ--Zf42qst+SqPQK1w53f_Sw@mail.gmail.com>
 <20210628195238.GG5525@pbcl.net>
 <f66a6a00-1a98-f8dd-e5d0-2c445147d5a7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f66a6a00-1a98-f8dd-e5d0-2c445147d5a7@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 02:10:39PM -0700, Khem Raj wrote:
> well, if we can beat the compiler to not complain about using neon on a
> non-neon system then yes, but changing float ABI to make compiler happy
> seems a bit iffy, since compiler will generate code expecting VFP and that
> could trip the system.

Right, that's a separate issue.  I'm not 100% clear what you mean by "trip
the system" but I think it's probably reasonable to say that no ABI ought
to be changing here.  I think that's orthogonal, though, to the question of
whether Meson ought to be detecting NEON at compile time.

p.

