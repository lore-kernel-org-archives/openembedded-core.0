Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SCBBN-00007n-21
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 16:46:05 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SCB2h-0002OT-Ge
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 16:37:07 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 15:37:06 +0100
In-Reply-To: <CAMKF1srb0tARAVLZKKvPoUCNQ5PVsBC-AEa0dLiw-3e7GaAEzA@mail.gmail.com>
References: <1332694123-5078-1-git-send-email-raj.khem@gmail.com>
	<1332759689.28414.104.camel@ted>
	<1332759991.14363.1027.camel@phil-desktop>
	<1332760875.28414.107.camel@ted>
	<CAMKF1srb0tARAVLZKKvPoUCNQ5PVsBC-AEa0dLiw-3e7GaAEzA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1332772627.14363.1051.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] tune/armv7: Add -mthumb to TUNE_CCARGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 14:46:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-26 at 07:13 -0700, Khem Raj wrote:
> On Mon, Mar 26, 2012 at 4:21 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2012-03-26 at 12:06 +0100, Phil Blundell wrote:
> >> On Mon, 2012-03-26 at 12:01 +0100, Richard Purdie wrote:
> >> > Looking at this file, if the above is true and armv7 can't do anything
> >> > other than thumb, shouldn't we just delete the non-thumb configurations
> >> > for "armv7"?
> >>
> >> It's not totally obvious to me that having a "lowest common denominator"
> >> configuration for ARMv7 is really all that valuable.  In fact I would be
> >> slightly surprised if anybody is targetting ARMv7-M with OE at all.
> >> What's the use-case for that?
> >
> > I have no idea, it appears the file doesn't make a lot of sense...
> >
> 
> on second thought I think we should delete this tune file since its
> somewhat useless.

Yes, agreed.  It looks like Richard added it originally so, if he
doesn't know ( / has forgotten) what it's good for I would guess that
nobody does.

p.




