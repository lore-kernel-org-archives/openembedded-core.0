Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWH8k-0004yN-7U for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 02:05:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5E02UrQ005716
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 01:02:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05388-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 01:02:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5E02KAn005710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 01:02:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=035xAQJS5kwhUGvDiGsanfD_FKQ@mail.gmail.com>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<4DF672F2.2030909@linux.intel.com>
	<49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
	<1308000620.15712.288.camel@rex> <4DF68AD4.1020403@mentor.com>
	<1308004543.15712.297.camel@rex> <4DF692CA.3030000@mentor.com>
	<1308006251.15712.309.camel@rex>
	<BANLkTi=035xAQJS5kwhUGvDiGsanfD_FKQ@mail.gmail.com>
Date: Tue, 14 Jun 2011 01:02:00 +0100
Message-ID: <1308009720.15712.319.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Tue, 14 Jun 2011 00:05:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 23:17 +0000, Otavio Salvador wrote:
> On Mon, Jun 13, 2011 at 23:04, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> > So on the one hand I do understand your concern. I'm personally and
> > Yocto are doing the best we can. On the other I'd suggest if testing
> > certain combinations is this important to you (or Mentor?), stepping up
> > and helping with the testing would be *much* appreciated and it isn't
> > the sole responsibility of myself or Saul.
> ...
> 
> It would be easier and better if people at Yocto could start basing
> their work on oe-core so stuff get tested there instead of Poky. Poky
> would then be an integration point not a base.

Have you looked at the delta recently? Yocto uses OE-Core with the
single addition of the meta-yocto layer which is tiny. Just like
angstrom use the meta-angstrom layer and the meta-oe layer. 

> More then once I got broken trees for stuff that were pushed to
> oe-core and were not working due missing fixes or features that were
> pushed to Poky's bitbake but not to the upstream one.

Again, please look at the delta between upstream bitbake and the one in
poky. All bitbake patches are now landing upstream first. There were
issues, we came up with a plan to address them and we're doing what we
said we would do...

> Doing this would help to improve it a lot. For example meta-intel
> would be already fixed since people would be using it against oe-core
> and would have already noticed the missing machine  definition and
> like.

We *know* the machine definition isn't there, its deliberate. We came up
with a plan to create OE-Core and to get Poky and OE both migrated to
using it. This process is not 100% complete yet although it gets closer
every day.

Cheers,

Richard




