Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.14317.1591279053593141073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 06:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49d6mB2KK9z5tlF;
	Thu,  4 Jun 2020 15:57:30 +0200 (CEST)
Date: Thu, 4 Jun 2020 15:57:28 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][warrior] pseudo: Fix enum typedef
Message-ID: <20200604135728.wce5jsupc6bgwmvi@qschulz>
References: <20200604120349.17455-1-schnitzeltony@gmail.com>
 <faaa5a2d120eacab6825cf079e92aa220dd7b151.camel@linuxfoundation.org>
 <CALbNGRQDVCm4zDJ6NPw=+-mQ8xibCDh+pqjToPcrnXRvJcYOkg@mail.gmail.com>
 <421c9a5c69b54bfb41734e58b89dc66bf9e84c0a.camel@linuxfoundation.org>
 <CALbNGRQyxDXcyKUA3zFYfwRFivLWbqrYyoGSKr4CWRz0Vjo1YA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQyxDXcyKUA3zFYfwRFivLWbqrYyoGSKr4CWRz0Vjo1YA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2020 at 03:49:28PM +0200, Andreas M=FCller wrote:
> On Thu, Jun 4, 2020 at 2:47 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2020-06-04 at 14:18 +0200, Andreas M=FCller wrote:
> > > On Thu, Jun 4, 2020 at 2:11 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Thu, 2020-06-04 at 14:03 +0200, Andreas M=FCller wrote:
> > > > > From: Jacob Kroon <jacob.kroon@gmail.com>
> > > > >
> > > > > 'pseudo_access_t' is a type, so use typedef.
> > > > >
> > > > > Fixes building pseudo with gcc 10 where -fno-common is the
> > > > > default.
> > > > >
> > > > > (Backport of OE-Core rev:
> > > > > a7d519f742aadc9110c2401f359254210a784f6b)
> > > > >
> > > > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.o=
rg
> > > > > >
> > > > > Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com>
> > > >
> > > > Does warrior otherwise work on gcc10 hosts?
> > > Not yet but I am working on it.
> >
> > I think to make a decision on whether we plan to support gcc10 or not
> > we'll need to know the scope of the changes. I'm starting to worry th=
is
> > would be a bit too invasive, particularly as warrior is about to ente=
r
> > community support or EOL depending on whether there is a maintainer.
> >
> I see. Problems for me - job's hat on - are:
>=20
> 1. we're close to release a product based on warrior (and a new
> colleague of mine has just installed Fedora 32 with gcc 10 - that's
> why I ask for it)
> 2. my tests with dunfell were - hmm - not running out of the box exactl=
y.
>=20
> So we should decide to upgrade to dunfell. That is what I use for
> private raspi-images an am very close to happy.
>=20

Dang, I was silently but closely following the discussion hoping to be
able to apply more or less the same patches on top of thud. Same issue
as yours, colleagues moving to Ubuntu 20.04 with gcc 10+. I guess it's
docker time :/ (there'll always be that one client that will not want to
upgrade to newer releases).

Or maybe we can support gcc10 on the community branch once it's EOL (or
doing the job ourselves..). What seems to be the big worry about
supporting gcc10 on warrior/thud? Just so I can explain why we should go
the docker route instead of spending time on making thud (and we still
have krogoth for some...) build with gcc10 and maybe start working on
upgrading those we can to newer releases. Basically what are the
expected big hurdles on the way?

Cheers,
Quentin
