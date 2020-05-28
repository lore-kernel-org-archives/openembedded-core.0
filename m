Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web10.22059.1590700280662457632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 14:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jePnX-0003uw-G3; Thu, 28 May 2020 23:10:43 +0200
Date: Thu, 28 May 2020 23:10:43 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Message-ID: <20200528211043.GA14586@pbcl.net>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org>
 <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
 <20200528133912.GB12536@localhost>
 <CAJ86T=WmE-3Q4Y4ezZs56RRbZ21P=tomBHiSpzyyir_j6wV27w@mail.gmail.com>
 <20200528190428.GA996@localhost>
 <CAJ86T=XsWpXH=UwEc+T_vy3ddKK0C0MOghk0hR3SNabQjmnL+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XsWpXH=UwEc+T_vy3ddKK0C0MOghk0hR3SNabQjmnL+Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 12:30:13PM -0700, Andre McCurdy wrote:
> What I was trying to get at is why you felt that bringing up the fact
> the kernel 4.1 was released at around the time gcc 5 was current is
> important?

Agreed, I think this is a red herring.  One of my current targets is
in fact still using Linux 4.9, which I think was roughly contemporary
with GCC 6, and it still builds just fine with at least GCC 8.
Although I think some of our old-timers still carry the emotional
scars associated with gcc 2.8, in reality the days when a compiler
upgrade ought to be expected to break the kernel in anything other
than a trivial way (i.e. new warning or error that's easy to patch)
are long gone.

And, all that said, there is plenty of precedent for OE users
keeping older versions of GCC around in order to support particular
pieces of software that didn't work with newer compilers for
whatever reason.  It's not generally all that difficult, and
anybody who was sufficiently interested could keep the old gcc
version around in a separate layer even after it's deleted from
oe-core.  In fact oe-core did at one point even have an explicit
KERNEL_CCSUFFIX variable which users could set if they wanted
a specific gcc version to go with their kernel, but this was
deleted in 2013 with the justification "kernel compiler is not 
special".

p.
