Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id F1F827DBA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:19:41 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hLTbi-0004kC-9C; Tue, 30 Apr 2019 16:19:42 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hLTbh-0001DL-V1; Tue, 30 Apr 2019 16:19:41 +0200
Date: Tue, 30 Apr 2019 16:19:41 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190430141941.6ninp3i7xgg24g57@pengutronix.de>
References: <20190430115323.25661-1-m.felsch@pengutronix.de>
	<b3208cdef64483f1f5f9bb3f334374f3f9f95e3d.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <b3208cdef64483f1f5f9bb3f334374f3f9f95e3d.camel@linuxfoundation.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:18:45 up 101 days, 19:00, 82 users,  load average: 0.00, 0.06,
	0.21
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: fix imx gallium driver
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
X-List-Received-Date: Tue, 30 Apr 2019 14:19:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19-04-30 15:11, Richard Purdie wrote:
> On Tue, 2019-04-30 at 13:53 +0200, Marco Felsch wrote:
> > Since commit [1] the imx-drm driver is covered by the generic kmsro
> > driver. Unfortunatly we need to patch the autotools path too since
> > the
> > switch commit [1] missed some dependencies.
> > 
> > [1] https://gitlab.freedesktop.org/mesa/mesa/commit/ \
> > 	41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  ...Fix-imx-autotools-build-dependencies.patch | 46
> > +++++++++++++++++++
> >  meta/recipes-graphics/mesa/mesa.inc           |  4 +-
> >  meta/recipes-graphics/mesa/mesa_19.0.1.bb     |  1 +
> >  3 files changed, 49 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-graphics/mesa/files/0005-Fix-imx-
> > autotools-build-dependencies.patch
> > 
> > diff --git a/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-
> > build-dependencies.patch b/meta/recipes-graphics/mesa/files/0005-Fix-
> > imx-autotools-build-dependencies.patch
> > new file mode 100644
> > index 0000000000..6cefe70bd8
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-
> > dependencies.patch
> > @@ -0,0 +1,46 @@
> > +From 3e2aeab89fdbd0572d635d3a57a54f3fb99af254 Mon Sep 17 00:00:00
> > 2001
> > +From: Marco Felsch <m.felsch@pengutronix.de>
> > +Date: Tue, 30 Apr 2019 09:45:26 +0200
> > +Subject: [PATCH] Fix imx autotools build dependencies
> > +
> > +Since commit 41a0acd6 ("Switch imx to kmsro and remove the imx
> > winsys")
> > +the imx-drm is covered by kmsro. During the switch some autotools
> > +dependencies are missed. Autotools are marked as deprecated but
> > since
> > +yocto still uses them we need to cover this.
> > +
> > +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> The patch is missing an Upstream-Status: line.

Sorry, it is my first patch for the oe-core community. What did I
forgot?

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

