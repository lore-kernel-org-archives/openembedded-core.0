Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.66.1591810949017456736
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 10:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=K6QtHIPr;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0vpq=7x=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49hvSt2GbSz4J;
	Wed, 10 Jun 2020 19:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591810945;
	bh=9cQ6sdDCQMKu3nEWLyiXPzJZ4+oC9TX7KvLBnOwkoYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6QtHIPreGxLrhPNX/R/jW25ouL4T4mcvhsZ/OfyRmfHbrjN6n1k9kVNLEqYYQ6tE
	 uihZoR6mJ2Gu2j635YBrfTTijJgHbar9Mvy0TgQC4bydyOIiNJf6ZyfNy45CXzaNND
	 hDsYZQxfs1U8jen6E9e3g2Rq9+rpx5cG/0ZtxmeLRDU98U/BTHf5AGi32PjvjGD5nd
	 2PA0T2T4V9N1LxDGt2EjQajEQZMBQ9IhstJzQ0s/ziyWEB76lxJ/Wtxew/EiKl/toP
	 BmpP1nGgUJ3m6cl9QldSQE6k5W3iMX2uh4Q1CeuYX9Z4tkrbrPI5cixEO+vXQDx2Hh
	 LUyzbdK5gfh/CgFXeFypwiqFsOfVLO3BSiP2BmM5ZGsgQeChwgaTPNLjjk/0AWhrQ/
	 7hnGvzmDArSaE/V1OFPhieWBiU/q8rSibe5GL6sL0uPDXmHb3YiaXd3lTuVNTVcSlf
	 S9pay/xvftdPhSDcTpCgW+15XXVZryIytIs/9Bmx0CPMUeGlZsYVGcVcjMQ+qxzJA+
	 OrbsS55tNle22nWzo90TNX7Qk1DYbXUjZoOJYL0Taq3iNnuwc0xgG4jyasq+Ce5Imi
	 TmRqY2tJM+NBchKfLT1yE5IQ4LQcZ+fY/elLm2pXC5UhmtwnFM96ies61j0tnMSjaZ
	 zLp/CXadQGeHWFBAqhRYs19k=
Date: Wed, 10 Jun 2020 20:42:20 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Openembedded-core@lists.openembedded.org, tmark@isc.org,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
Message-ID: <20200610174220.GE24380@localhost>
References: <20200610143520.2727827-1-uvv.mail@gmail.com>
 <20200610160719.GD24380@localhost>
 <15e11034-2d2b-a620-f859-450a2b7ef7de@gmail.com>
MIME-Version: 1.0
In-Reply-To: <15e11034-2d2b-a620-f859-450a2b7ef7de@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 10, 2020 at 06:31:55PM +0200, Vyacheslav Yurkov wrote:
> On 10.06.2020 18:07, Adrian Bunk wrote:
> > On Wed, Jun 10, 2020 at 04:35:20PM +0200, Vyacheslav Yurkov wrote:
> > > ...
> > > BIND9 libraries support a lot of options specifically geared towards
> > > optimizing DNS operations, many of which do not play nicely with
> > > ISC DHCP's "architecture".  It isn't necessarily practical to build
> > > those libraries for both purposes.
> > > ...
> > Providing security support for several different copies of the BIND
> > code would be a nightmare.
> > 
> > cu
> > Adrian
> 
> Right, but I don't think there's a way to build two configurations out of
> one recipe, isn't it?

It is possible.
More common is sharing the sources between two (or more) recipes
with an .inc file.

Unrelated to that, I am a bit suprised why the current Yocto setup
is suddenly a problem. Other distributions like Debian/Ubuntu are
also sharing one build of the BIND libraries between BIND and dhcpd.

> Vyacheslav

cu
Adrian
