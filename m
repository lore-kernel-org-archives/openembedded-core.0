Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8D47F4DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 11:40:53 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1iMW3R-0000SH-V4; Mon, 21 Oct 2019 13:40:53 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1iMW3R-00080z-4h; Mon, 21 Oct 2019 13:40:53 +0200
Date: Mon, 21 Oct 2019 13:40:53 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20191021114053.cw4ofpinfpwoydwh@pengutronix.de>
References: <20191021094149.uwvkismntthgd7i3@pengutronix.de>
	<20191021102440.GA25961@localhost>
MIME-Version: 1.0
In-Reply-To: <20191021102440.GA25961@localhost>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:40:37 up 156 days, 17:58, 99 users,  load average: 0.07, 0.02,
	0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: kernel@pengutronix.de, openembedded-core@lists.openembedded.org
Subject: Re: Why do we still disable mke2fs 64bit support?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2019 11:40:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19-10-21 13:24, Adrian Bunk wrote:
> On Mon, Oct 21, 2019 at 11:41:49AM +0200, Marco Felsch wrote:
> > Hi,
> > 
> > during a initial system-setup script the mke2fs tools complains about
> > the missing 64bit support:
> > 
> > 8<----------------------------------------------------------------------
> > mke2fs 1.44.5 (15-Dec-2018)
> > 64-bit filesystem support is not enabled.  The larger fields afforded by
> > this feature enable full-strength checksumming. Pass -O 64bit to rectify.
> > 8<----------------------------------------------------------------------
> > 
> > Other build tools e.g. PTXdist or Buildroot don't modify the build-in
> > config. I know in the early days this feature break something but
> > shouldn't we (re-)think this decision?
> 
> Already fixed in zeus:
> https://github.com/openembedded/openembedded-core/commit/f5edce401cfb31ebd0200adaba9a201caf7ea705

Thanks for the link.

Regards,
  Marco 

> > Regards,
> >   Marco
> 
> cu
> Adrian
> 
> -- 
> 
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

