Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q2QYT-00031C-2N
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 17:05:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Mar 2011 09:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,231,1299484800"; d="scan'208";a="407264296"
Received: from unknown (HELO [10.255.16.108]) ([10.255.16.108])
	by azsmga001.ch.intel.com with ESMTP; 23 Mar 2011 09:03:10 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20110323154018.GI2224@xora-desktop.xora.org.uk>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
Date: Wed, 23 Mar 2011 16:03:04 +0000
Message-ID: <1300896184.3488.17.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 (2.32.2-1.fc14) 
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Wed, 23 Mar 2011 16:05:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-23 at 15:40 +0000, Graeme Gregory wrote:
> On Wed, Mar 23, 2011 at 08:19:31AM -0700, Khem Raj wrote:
> > On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > > Hi,
> > >
> > > I'd like to import the EFL recipes Martin did from meta-shr into the meta-openembedded repo. Before I go bothering Martin about it, what would be the best place to put them?
> > >
> > > Inside meta-oe:
> > >
> > > meta-openembedded/
> > >        meta-oe/
> > >                recipes-efl
> > 
> > Can efl we layered directly on top of oe-core  ? i.e. without needing meta-oe
> > in that case its better to be an independent layer. otherwise I would say put
> > them under recipes-efl
> > 
> That is certainly not how I see layers being built up. I am expecting
> in future us to have things like.
> 
> meta-gnome
> meta-kde
> meta-efl
> meta-lxde
> meta-xorg

Me too, in fact I think this image from the Yocto Project website
succinctly portrays the goal:
http://www.yoctoproject.org/sites/default/files/yocto-layers_1.png

Possibly less the meta-yocto but you get the point.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



