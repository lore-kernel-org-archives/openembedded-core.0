Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 0E29C6B067
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 05:52:35 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hNWYE-0003ci-NX; Mon, 06 May 2019 07:52:34 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hNWYD-0000jY-Ds; Mon, 06 May 2019 07:52:33 +0200
Date: Mon, 6 May 2019 07:52:33 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190506055233.cypkm532h6sgczpu@pengutronix.de>
References: <20190502180916.32114-1-m.felsch@pengutronix.de>
	<20190502180916.32114-5-m.felsch@pengutronix.de>
	<CANNYZj-4tB-if4kC3NZ8UOAujCMDOa-9ePH=j50-9BzOU_OwLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-4tB-if4kC3NZ8UOAujCMDOa-9ePH=j50-9BzOU_OwLg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:50:37 up 107 days, 10:32, 77 users,  load average: 0.04, 0.03,
	0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] mesa: make gallium virgl optional
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
X-List-Received-Date: Mon, 06 May 2019 05:52:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19-05-03 12:17, Alexander Kanavin wrote:
> On Thu, 2 May 2019 at 20:09, Marco Felsch <m.felsch@pengutronix.de> wrote:
> > Same as for the swrast target it isn't a good solution to enable the
> > target per default since we compiling for embedded targets most the
> > time. Make this target optional to save some memory.
> 
> This will probably break virgl oe-selftests as they expect target mesa
> to be configured with virgl.
> Try 'oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk'
> and 'oe-selftest -r
> runtime_test.TestImage.test_testimage_virgl_headless'
> 
> You can address this by setting PACKAGECONFIG_append_qemuall = " virgl".

Thanks for covering that. I will add this line in my v3.

> 
> > Upstream-Status: Submitted [openembedded-core@lists.openembedded.org]
> 
> This is not necessary. It is only used for patches to the recipes that
> live as files in the layer tree.

Oh.. Okay now I got it.

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

