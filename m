Return-Path: <uol@pengutronix.de>
X-Greylist: delayed 997 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Jun 2017 09:09:33 UTC
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id E48B377E58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 09:09:33 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
	(envelope-from <uol@pengutronix.de>) id 1dNEu9-0003Ce-AK
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Jun 2017 10:52:57 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.89)
	(envelope-from <uol@pengutronix.de>) id 1dNEu8-00077B-QX
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Jun 2017 10:52:56 +0200
Date: Tue, 20 Jun 2017 10:52:56 +0200
From: Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170620085256.okya3zax2xhdshiz@pengutronix.de>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
	<CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:41:34 up 9 days, 20:39, 134 users,  load average: 40.57, 20.42,
	16.94
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Tue, 20 Jun 2017 09:09:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2017 at 03:37:16PM +0100, Burton, Ross wrote:
> On 7 May 2017 at 02:33, Joshua Watt <jpewhacker@gmail.com> wrote:
> > diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > index 148e6ad..af56404 100644
> > --- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > +++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > @@ -1,22 +1,14 @@
> >  [Unit]
> >  Description=OpenSSH Key Generation
> >  RequiresMountsFor=/var /run
> > -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
> > -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
> > -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
> >
> 
> Can you not continue to use ConditionPathExists to only run this unit if it
> needs to run?  You can prepend the argument with | to make them logical OR
> instead of logical AND, if I'm reading this documentation correctly.

Am I right that if we have a read-write mounted root-FS with already existing
keys in /etc/ssh the service unit will nevertheless be started on _every_ boot
now as the files which are checked for existance in /var/run/ssh are missing?

Best regards
Ulrich
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

