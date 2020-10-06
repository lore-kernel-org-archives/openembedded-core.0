Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.15694.1601994371255293659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 07:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mfe@pengutronix.de)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1kPnuq-0006Ow-KH; Tue, 06 Oct 2020 16:26:08 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1kPnup-00029p-DH; Tue, 06 Oct 2020 16:26:07 +0200
Date: Tue, 6 Oct 2020 16:26:07 +0200
From: "Marco Felsch" <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Revert "kernel.bbclass: make dependency on lzop-native conditional"
Message-ID: <20201006142607.axiegefkixioktnf@pengutronix.de>
References: <20201005141838.8559-1-m.felsch@pengutronix.de>
 <7b89c7a13fa964cd4ce706137bbc41592431fea3.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <7b89c7a13fa964cd4ce706137bbc41592431fea3.camel@linuxfoundation.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:24:00 up 326 days,  5:42, 355 users,  load average: 0.10, 0.08,
 0.03
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20-10-06 14:27, Richard Purdie wrote:
> On Mon, 2020-10-05 at 16:18 +0200, Marco Felsch wrote:
> > This reverts commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd.
> > 
> > This commit breaks compiling if no initramfs is used because the
> > kernel image can be compressed too using lzo.
> 
> Can we detect if the kernel is due to be compressed with lzo through
> any of our configuration variables?

I thought about it too.. We need to grep the .config and check if the
Kconfig was set either by the defconfig we are providing or by some
inheritance.

Regards,
  Marco

> 
> Cheers,
> 
> Richard
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
