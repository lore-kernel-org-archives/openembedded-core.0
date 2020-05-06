Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.3457.1588760306593160845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 03:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=qA2y5mx8;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=fjce=6u=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49HCGj5hMVz2J;
	Wed,  6 May 2020 12:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588760302;
	bh=8yILpvi5LM96JeCj2dZG7QG1R9wCrUUmqK5Fjx/gsjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qA2y5mx80alnwRjhUWpUwY+27M6t7g54Me9DBp7+2PMtgpb0CqC3z/dm/fBkBKapV
	 5swvyAgEtwI/3EYgRD8yBp5TKMka4Bp7oDUeiqkTdCOVbMGfqzksIFV1u9jzdZsHmN
	 mMBfRSEVVSgT+Djcj0m1jtyPItIja492jmT4y71xQsSnAgBTPjPV0IBs5/Qa7uZMi5
	 9G4sWAAbZo/yvHn3viLuuMoXUXDYXumjC6ZI9Ii5t0AENCgva6QH4uAfRc59Lu4E6W
	 Lc7CIDU/+74Wuj9HF9GGmJPmEThU033py+vVjPom8Gp4udacv1E4+lP927YuMKCMqO
	 IdD8CIwNb/UxSDn2p7Ti/GtDKlCxq2ljIgyGmYAg27lmM04NWESet9FfslgRrS+TeA
	 taSOkk8r0UVODxL9XUdvQ7Vyv9YFhxkfwnwACtpQ9K07iudwrG0rvf4vwl+Mhe2ulC
	 zL8tNryVS1OvNwuAkDJbUDu32HfLjmG5p4tvGCVS+b/bPNegJ2l4DlNvhHLNKU6GvJ
	 mMOVPf+vKw7NPrUJUSfvO634tM33ArQlK9eCZddByvMi2UUCxelC+2Y5Mft8qj27iv
	 lfQzyOc/5A2BOrLBCqQEjTD+oJLMajQsxv8he7sHPj8gxMroN5SCb0uu8cSbOa7DVR
	 +ugeXDZApX1EbKzURyd9j1Y0=
Date: Wed, 6 May 2020 13:18:19 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] dtc: update to 1.6.0
Message-ID: <20200506101819.GA31658@localhost>
References: <20200505115535.141557-1-richard.leitner@skidata.com>
 <20200506071016.GA31672@localhost>
 <20200506071919.GC250994@pcleri>
MIME-Version: 1.0
In-Reply-To: <20200506071919.GC250994@pcleri>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 06, 2020 at 09:19:19AM +0200, Richard Leitner wrote:
> On Wed, May 06, 2020 at 10:10:16AM +0300, Adrian Bunk wrote:
> > On Tue, May 05, 2020 at 01:55:35PM +0200, Richard Leitner wrote:
> > >...
> > > --- a/meta/recipes-kernel/dtc/dtc_1.5.1.bb
> > > +++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
> > > @@ -3,7 +3,7 @@ require dtc.inc
> > >  LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > >  		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
> > >  
> > > -SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
> > > +SRCREV = "v${PV}"
> > >...
> > 
> > It is tempting to use tags, but it is a bad idea.
> > Upstream might move a tag to a different commit.
> > Someone might do a man-in-the-middle attack on a specific user,
> > and there is no other verification of the sources apart from
> > the commit hash.
> 
> Thanks for the info. Is this documented somewhere?

Good question.

> How should I proceed on this patch as it was already applied to
> master-next? Should I send a v2 or a "fix patch"?

v2

A -next branch does break git history, so patches can get removed.

>...
> regards;rl

cu
Adrian
