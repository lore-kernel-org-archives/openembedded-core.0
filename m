Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id E9C447E71D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 12:04:48 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbkwr-00012u-Gg; Fri, 14 Jun 2019 14:04:49 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbkwq-0007Hd-Sv; Fri, 14 Jun 2019 14:04:48 +0200
Date: Fri, 14 Jun 2019 14:04:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190614120448.2wg2523qu67la7mh@pengutronix.de>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:43:47 up 27 days, 18:01, 50 users,  load average: 0.00, 0.02, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: kernel@pengutronix.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 12:04:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

On 19-06-14 11:55, Richard Purdie wrote:
> On Thu, 2019-06-13 at 19:54 +0200, Marco Felsch wrote:
> > Most of the time we are compiling for embedded targets which have
> > dedicated hardware combinations. Enabling swrast by default isn't a
> > good
> > solution for such devices because if the hardware render node has an
> > issue or doesn't support a special format/request Mesa will fallback
> > to
> > the software renderer. This will make it harder to debug performance
> > issues.
> > 
> > A better way is to let the user decide if a software renderer is
> > needed e.g. if the system has no hardware renderer or to have such a
> > fallback device. This way the user knows that the software renderer
> > is
> > enabled.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > v3
> > - rebased on current master-next branch
> 
> I think this breaks the autobuilder:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/694

thanks for covering that. Why didn't I get a email? Anyway thats
interessting. IMHO it isn't a good solution to rely on that fact that
the package have some 'random' default enabled drivers. Should we fix
the qemu configs or should I add:

PACKAGECONFIG_append_qemuall = " swrast"

Regards,
  Marco

> Cheers,
> 
> Richard
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

