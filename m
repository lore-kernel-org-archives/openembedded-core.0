Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 7409060248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 09:35:28 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1hco2x-0006IU-Nh; Mon, 17 Jun 2019 11:35:27 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hco2w-0003xL-4d; Mon, 17 Jun 2019 11:35:26 +0200
Date: Mon, 17 Jun 2019 11:35:26 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190617093526.vjnrh42nxr37by6m@pengutronix.de>
References: <a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
	<f2348016a0867fd986bbe4965dcb88a5b652055f.camel@linuxfoundation.org>
	<99B005A2-CD21-4AA8-B960-54121098F850@gmail.com>
	<c85e93b13ddcbc27c27ac17fdcf97a0d1ffc4020.camel@linuxfoundation.org>
	<CANNYZj-9xUFE0x9D_BpLiqkNitLmXnrv9n8boodZpE5bX-psgw@mail.gmail.com>
	<CAJTo0LZbf2Y6_nN0E8tsVLHKxZAtE6zyqP25nyKk=v6+bQjkHg@mail.gmail.com>
	<CANNYZj9LOQZkawsAPi=Sgsd2_0qTeR=NOn4RxqArA+CmkLSTQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9LOQZkawsAPi=Sgsd2_0qTeR=NOn4RxqArA+CmkLSTQQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:25:46 up 30 days, 15:43, 47 users,  load average: 0.08, 0.06, 0.05
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: kernel@pengutronix.de, OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 17 Jun 2019 09:35:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19-06-14 15:37, Alexander Kanavin wrote:
> On Fri, 14 Jun 2019 at 15:36, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > > Dropping the swrast dependency will not help though, as it is provided
> > by the mesa-megadriver package, which will continue to include swrast as
> > long as it is enabled in the mesa recipe. mesa-megadriver is also pulled in
> > through other dependencies.
> >
> > Won't that stop the build failure on the autobuilder though?
> >
> 
> Yes, I think it would.

So should I change that dependency to virgl since it is a qemu target?
Sorry but I can not see an agreement how we can change this in a 'good'
way for all parties.

My point of view is that it should not be enabled per default. Of course
I should fix the qemu config but I don't wanna fix each meta-layer.
Becuase I think that is the work of meta-layer maintainer.

Regards,
  Marco

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

