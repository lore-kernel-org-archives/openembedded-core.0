Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.598.1601999824696212587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 08:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mfe@pengutronix.de)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1kPpKp-00033I-2r; Tue, 06 Oct 2020 17:57:03 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1kPpKn-0005Et-G2; Tue, 06 Oct 2020 17:57:01 +0200
Date: Tue, 6 Oct 2020 17:57:01 +0200
From: "Marco Felsch" <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Revert "kernel.bbclass: make dependency on lzop-native conditional"
Message-ID: <20201006155701.f3reuvkwpczicss7@pengutronix.de>
References: <20201005141838.8559-1-m.felsch@pengutronix.de>
 <7b89c7a13fa964cd4ce706137bbc41592431fea3.camel@linuxfoundation.org>
 <20201006142607.axiegefkixioktnf@pengutronix.de>
 <d988f9d69fdbc8fde674b0e2041d92a6807e26a9.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <d988f9d69fdbc8fde674b0e2041d92a6807e26a9.camel@linuxfoundation.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:52:52 up 326 days,  7:11, 353 users,  load average: 0.25, 0.12,
 0.09
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20-10-06 15:27, Richard Purdie wrote:
> On Tue, 2020-10-06 at 16:26 +0200, Marco Felsch wrote:
> > On 20-10-06 14:27, Richard Purdie wrote:
> > > On Mon, 2020-10-05 at 16:18 +0200, Marco Felsch wrote:
> > > > This reverts commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd.
> > > > 
> > > > This commit breaks compiling if no initramfs is used because the
> > > > kernel image can be compressed too using lzo.
> > > 
> > > Can we detect if the kernel is due to be compressed with lzo
> > > through
> > > any of our configuration variables?
> > 
> > I thought about it too.. We need to grep the .config and check if the
> > Kconfig was set either by the defconfig we are providing or by some
> > inheritance.
> 
> Grepping the .config isn't an option as we need to determine this at
> parse time.

That was my conclusion too.

> I did wondering the kernel type/output name style variables
> would tell us but it sounds like that isn't the case :(

Nope you can't, e.g. arm compressed images are always named
zImage.

Regards,
  Marco
