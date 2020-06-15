Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.16500.1592223475751737385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 05:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jko3k-0006GR-I6; Mon, 15 Jun 2020 14:17:52 +0200
Received: from localhost ([127.0.0.1])
	by ptx.hi.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1jko3k-00030P-6q; Mon, 15 Jun 2020 14:17:52 +0200
Message-ID: <d14c6872c68aef73f26a0afdf90917d7b01665cc.camel@pengutronix.de>
Subject: Re: [OE-core][PATCH] classes/buildhistory: capture package config
From: "Jan Luebbe" <jlu@pengutronix.de>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2020 14:17:51 +0200
In-Reply-To: <20200615112937.GF108868@korppu>
References: <20200603081237.1959-1-jlu@pengutronix.de>
	 <20200615112937.GF108868@korppu>
User-Agent: Evolution 3.36.2-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2020-06-15 at 11:29 +0000, Mikko.Rapeli@bmw.de wrote:
> On Wed, Jun 03, 2020 at 10:12:37AM +0200, Jan Luebbe wrote:
> > As the PACKAGECONFIG variable has a large influence on the
> > resulting
> > package sizes and dependencies, it's useful to capture it in the
> > recipe-level buildhistory. This makes it straightforward to analyze
> > the
> > impact of PACKAGECONFIG changes on the resulting image size.
> 
> Thanks, this is a good idea! I would print using full PACKAGECONFIG
> name to avoid any confusion.

Note that Richard has already merged this in master.

I thought it was pretty clear when looking at if from the package
context in the buildhistory. I wouldn't mind renaming it to
PACKAGECONFIG, it there's agreement that it would be clearer.

> And this reminds me that DISTRO_FEATURES isn't logged into
> buildhistory either afaik...

Might be useful, but DISTRO_FEATURES is relatively high-level so
there's usually not much details you can optimize.

Jan

> A generic approach for adding more variables to buildhistory would be
> nice.



