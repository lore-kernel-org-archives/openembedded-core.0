Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 44D2A7DBA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:22:08 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hLTe4-00051s-Sy; Tue, 30 Apr 2019 16:22:08 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hLTe4-0001Kp-Kv; Tue, 30 Apr 2019 16:22:08 +0200
Date: Tue, 30 Apr 2019 16:22:08 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190430142208.kov74s2bn35aypk4@pengutronix.de>
References: <20190430115323.25661-1-m.felsch@pengutronix.de>
	<20190430115323.25661-2-m.felsch@pengutronix.de>
	<CANNYZj_OAjN7M34TbktARfHm-n5vhFoc6C5f9KYRt2H6e1mYNg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_OAjN7M34TbktARfHm-n5vhFoc6C5f9KYRt2H6e1mYNg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:20:19 up 101 days, 19:02, 82 users,  load average: 0.07, 0.06,
	0.19
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Tue, 30 Apr 2019 14:22:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19-04-30 15:56, Alexander Kanavin wrote:
> On Tue, 30 Apr 2019 at 14:10, Marco Felsch <m.felsch@pengutronix.de> wrote:
> > -GALLIUMDRIVERS = "swrast"
> > +GALLIUMDRIVERS = ""
> > +GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'swrast', ',swrast', '', d)}"
> >  GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
> >  GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
> 
> This adds a leading , to the list of drivers; is that correctly handled?

Sorry it seems that it was a copy'n'paste failure. This should be
fixed..

Regards,
  Marco

> 
> Alex
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

