Return-Path: <uol@pengutronix.de>
X-Greylist: delayed 1198 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 29 Mar 2017 17:45:04 UTC
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id E38D277C25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 17:45:04 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <uol@pengutronix.de>) id 1ctHLH-00065M-2j
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Mar 2017 19:25:07 +0200
Received: from uol by pty.hi.pengutronix.de with local (Exim 4.84_2)
	(envelope-from <uol@pengutronix.de>) id 1ctHLG-0003Ef-SD
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Mar 2017 19:25:06 +0200
Date: Wed, 29 Mar 2017 19:25:06 +0200
From: Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170329172506.jgwc676imi7jk3ps@pengutronix.de>
References: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
	<1490742158.13980.296.camel@linuxfoundation.org>
	<2b16b764-38e0-4112-48b4-9e17cbe129c3@berginkonsult.se>
	<1490783069.13980.307.camel@linuxfoundation.org>
	<CAJ86T=VJjTvtwBPvY+jW1+P8tDMMjMJuRgsHTZXSgj=F=vjbxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VJjTvtwBPvY+jW1+P8tDMMjMJuRgsHTZXSgj=F=vjbxA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:22:52 up 4 days, 4:51, 2 users, load average: 0.00, 0.00, 0.00
User-Agent: Mutt/1.6.2-neo (2016-06-11)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Wed, 29 Mar 2017 17:45:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 29, 2017 at 08:23:00AM -0700, Andre McCurdy wrote:
> On Wed, Mar 29, 2017 at 3:24 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Also, in case its not apparent, you can work around this today by
> > providing empty fragment files in your own layer. These would override
> > the default ones in the main recipe if you set it up right.
> 
> Or use SRC_URI_remove = "file://login-utilities.cfg" etc.

But for both suggested approaches you need to know the existance and name of the
config fragment file(s), don't you?

Regards
Ulrich
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

