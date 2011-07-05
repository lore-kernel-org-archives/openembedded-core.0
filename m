Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QdzaY-0000lI-TJ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 08:58:31 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Tue, 5 Jul 2011
	08:54:41 +0200
From: Anders Darander <anders@chargestorm.se>
Organization: ChargeStorm AB
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2011 08:54:44 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.39-2-amd64; KDE/4.6.4; x86_64; ; )
References: <cover.1309525642.git.anders@chargestorm.se>
	<6E60DDFC-9F26-4239-A322-685CF0597C8D@dominion.thruhere.net>
	<1309559708.20015.566.camel@rex>
In-Reply-To: <1309559708.20015.566.camel@rex>
MIME-Version: 1.0
Message-ID: <201107050854.45178.anders@chargestorm.se>
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Tue, 05 Jul 2011 06:58:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi,

* Richard Purdie Richard Purdie <richard.purdie@linuxfoundation.org> [07/02/11 
12:35 AM]:
> On Fri, 2011-07-01 at 15:32 +0200, Koen Kooi wrote:
> > Op 1 jul 2011, om 15:08 heeft Anders Darander het volgende geschreven:
> > > # linux-hotplug or none
> > > #
> > > -HOTPLUG ?= "${@base_contains("MACHINE_FEATURES", "kernel24", 
> > > "linux-hotplug","",d)} " +HOTPLUG ?= ""
> > 
> > I think this one can go completely
> > 
> > > #
> > > # pcmciautils for >= 2.6.13-rc1, pcmcia-cs for others
> > > #
> > > -PCMCIA_MANAGER ?= "${@base_contains('MACHINE_FEATURES',
> > > 'kernel26','pcmciautils','pcmcia-cs',d)} " +PCMCIA_MANAGER ?=
> > > "pcmciautils"
> > 
> > This one can get folded into the task directly
> 
> Agreed but I didn't feel it warranted not merging the patches so far.
> Please send a follow up patch :)

Before I'll try to look into the comments above, I'd just like to be sure I'm 
working on the correct version of task-base.bb. Did you leave it out of the 
merging, awaiting the last fixes, or was it just left out by mistake? (I've 
just now realised that this patch didn't make it into master).

Regards,
Anders


