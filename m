Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcmMy-0008IH-85 for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 00:39:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MZd10021814;
	Fri, 1 Jul 2011 23:35:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21446-10; Fri,  1 Jul 2011 23:35:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MZUoe021808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 23:35:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6E60DDFC-9F26-4239-A322-685CF0597C8D@dominion.thruhere.net>
References: <cover.1309525642.git.anders@chargestorm.se>
	<b95079d9c51457835439610ee63c51b1821d3976.1309525642.git.anders@chargestorm.se>
	<6E60DDFC-9F26-4239-A322-685CF0597C8D@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 23:35:08 +0100
Message-ID: <1309559708.20015.566.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v5 7/8] task-base: remove modutils reference.
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
X-List-Received-Date: Fri, 01 Jul 2011 22:39:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 15:32 +0200, Koen Kooi wrote:
> Op 1 jul 2011, om 15:08 heeft Anders Darander het volgende geschreven:
> 
> > Also remove the other kernel24 references.
> > Make everything dependent on kernel26 default.
> > Move the RDEPENDS- and RRECOMMENDS_task-base-kernel26 to _task-base.
> > 
> > Signed-off-by: Anders Darander <anders@chargestorm.se>
> > ---
> > meta/recipes-core/tasks/task-base.bb |   49 ++++++++++-----------------------
> > 1 files changed, 15 insertions(+), 34 deletions(-)
> > 
> >  #
> > # linux-hotplug or none
> > #
> > -HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24",  "linux-hotplug","",d)} "
> > +HOTPLUG ?= ""
> 
> I think this one can go completely
> 
> 
> > #
> > # pcmciautils for >= 2.6.13-rc1, pcmcia-cs for others
> > #
> > -PCMCIA_MANAGER ?= "${@base_contains('MACHINE_FEATURES', 'kernel26','pcmciautils','pcmcia-cs',d)} "
> > +PCMCIA_MANAGER ?= "pcmciautils"
> 
> This one can get folded into the task directly

Agreed but I didn't feel it warranted not merging the patches so far.
Please send a follow up patch :)

Cheers,

Richard



