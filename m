Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe0zx-0002ji-W5 for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 10:28:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p658P1ZP028734
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 09:25:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28073-05 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2011 09:24:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p658Otp3028728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 09:24:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201107050854.45178.anders@chargestorm.se>
References: <cover.1309525642.git.anders@chargestorm.se>
	<6E60DDFC-9F26-4239-A322-685CF0597C8D@dominion.thruhere.net>
	<1309559708.20015.566.camel@rex>
	<201107050854.45178.anders@chargestorm.se>
Date: Tue, 05 Jul 2011 09:24:24 +0100
Message-ID: <1309854264.20015.677.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 05 Jul 2011 08:28:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 08:54 +0200, Anders Darander wrote:
> Hi,
> 
> * Richard Purdie Richard Purdie <richard.purdie@linuxfoundation.org> [07/02/11 
> 12:35 AM]:
> > On Fri, 2011-07-01 at 15:32 +0200, Koen Kooi wrote:
> > > Op 1 jul 2011, om 15:08 heeft Anders Darander het volgende geschreven:
> > > > # linux-hotplug or none
> > > > #
> > > > -HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24", 
> > > > "linux-hotplug","",d)} " +HOTPLUG ?= ""
> > > 
> > > I think this one can go completely
> > > 
> > > > #
> > > > # pcmciautils for >= 2.6.13-rc1, pcmcia-cs for others
> > > > #
> > > > -PCMCIA_MANAGER ?= "${@base_contains('MACHINE_FEATURES',
> > > > 'kernel26','pcmciautils','pcmcia-cs',d)} " +PCMCIA_MANAGER ?=
> > > > "pcmciautils"
> > > 
> > > This one can get folded into the task directly
> > 
> > Agreed but I didn't feel it warranted not merging the patches so far.
> > Please send a follow up patch :)
> 
> Before I'll try to look into the comments above, I'd just like to be sure I'm 
> working on the correct version of task-base.bb. Did you leave it out of the 
> merging, awaiting the last fixes, or was it just left out by mistake? (I've 
> just now realised that this patch didn't make it into master).

That was a mistake on my part, sorry...

Cheers,

Richard



