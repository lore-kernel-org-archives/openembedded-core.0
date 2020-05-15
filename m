Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1736.1589579977397615441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 14:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7023140AB5;
	Fri, 15 May 2020 21:59:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJM9ikmcGcN2; Fri, 15 May 2020 21:59:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 34FDD40A93;
	Fri, 15 May 2020 21:59:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 821AF17314B; Fri, 15 May 2020 17:59:33 -0400 (EDT)
Date: Fri, 15 May 2020 17:59:33 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Andreas M?ller <schnitzeltony@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
Message-ID: <20200515215933.GG11927@denix.org>
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
 <20200430214203.26595-2-schnitzeltony@gmail.com>
 <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
 <160F50EDD3A6B1F2.685@lists.openembedded.org>
 <160F519E3DB5CDF9.29809@lists.openembedded.org>
 <CALbNGRSf9iwrBgGAqZ2GMPOX8hXoZu_JGQ7qt8Y5+M6N7n6ozg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSf9iwrBgGAqZ2GMPOX8hXoZu_JGQ7qt8Y5+M6N7n6ozg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2020 at 11:52:23PM +0200, Andreas M?ller wrote:
> On Fri, May 15, 2020 at 11:42 PM Andreas M?ller via
> lists.openembedded.org
> <schnitzeltony=gmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, May 15, 2020 at 11:29 PM Andreas M?ller via
> > lists.openembedded.org
> > <schnitzeltony=gmail.com@lists.openembedded.org> wrote:
> > >
> > > On Fri, May 15, 2020 at 10:30 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> > > >
> > > > This seems to be missing features_check inherit, so that REQUIRED_DISTRO_FEATURES doesn't prevent it failing in my builds.
> > > >
> > > > Will send patch shortly.
> > > Do I miss something? It was never applied
> > >
> > > Andreas
> > Ahh I did not find it due to Umlaut in my name - it was applied
> > indeed. Author is now Andreas M?ller now.
> >
> > Andreas
> 
> And to turn this completely off-topic: on each mail I send to the list
> I get an email on extra thread with  'Andreas M?ller via
> lists.openembedded.org' in it's title.

https://en.wikipedia.org/wiki/DMARC
https://wiki.list.org/DEV/DMARC


> This is since we moved to new mailing system (forgot details). Did
> send a mail here and there nothing happened... Should look for a
> different name...
> 
> Andreas
