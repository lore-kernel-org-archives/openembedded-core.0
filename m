Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2090.1589581295466809825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 15:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9E0040C1D;
	Fri, 15 May 2020 22:21:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZx77vuhMyCh; Fri, 15 May 2020 22:21:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7DAA40A93;
	Fri, 15 May 2020 22:21:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B58517314B; Fri, 15 May 2020 18:21:32 -0400 (EDT)
Date: Fri, 15 May 2020 18:21:32 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
Message-ID: <20200515222132.GH11927@denix.org>
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
 <20200430214203.26595-2-schnitzeltony@gmail.com>
 <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
 <160F50EDD3A6B1F2.685@lists.openembedded.org>
 <160F519E3DB5CDF9.29809@lists.openembedded.org>
 <CALbNGRSf9iwrBgGAqZ2GMPOX8hXoZu_JGQ7qt8Y5+M6N7n6ozg@mail.gmail.com>
 <20200515215933.GG11927@denix.org>
 <CALbNGRQRwbEd0QhPEpCPRMWiDCwC8_Owi67opUkrXinRqC7D6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQRwbEd0QhPEpCPRMWiDCwC8_Owi67opUkrXinRqC7D6w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2020 at 12:10:00AM +0200, Andreas M=FCller wrote:
> On Fri, May 15, 2020 at 11:59 PM Denys Dmytriyenko <denis@denix.org> wr=
ote:
> >
> > On Fri, May 15, 2020 at 11:52:23PM +0200, Andreas M?ller wrote:
> > > On Fri, May 15, 2020 at 11:42 PM Andreas M?ller via
> > > lists.openembedded.org
> > > <schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > On Fri, May 15, 2020 at 11:29 PM Andreas M?ller via
> > > > lists.openembedded.org
> > > > <schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > On Fri, May 15, 2020 at 10:30 PM Martin Jansa <Martin.Jansa@gma=
il.com> wrote:
> > > > > >
> > > > > > This seems to be missing features_check inherit, so that REQU=
IRED_DISTRO_FEATURES doesn't prevent it failing in my builds.
> > > > > >
> > > > > > Will send patch shortly.
> > > > > Do I miss something? It was never applied
> > > > >
> > > > > Andreas
> > > > Ahh I did not find it due to Umlaut in my name - it was applied
> > > > indeed. Author is now Andreas M?ller now.
> > > >
> > > > Andreas
> > >
> > > And to turn this completely off-topic: on each mail I send to the l=
ist
> > > I get an email on extra thread with  'Andreas M?ller via
> > > lists.openembedded.org' in it's title.
> >
> > https://en.wikipedia.org/wiki/DMARC
> > https://wiki.list.org/DEV/DMARC
>=20
> what do yo expect me to do

Has nothing to do with your name, but with your mail server and DMARC pol=
icy.

Many of us are in the same situation, and we learned to live with it, if=20
cannot change it. Moreover, layer maintainers actually have to change nam=
es=20
like that back to normal manually before applying patches...


> 1. read gazillion of lines just to sen emails to a mailing list
> 2. change  my name
> 3. stop sending emails
>=20
> Since it had worked for decades I prefer 3.
>=20
> Andreas
>=20
