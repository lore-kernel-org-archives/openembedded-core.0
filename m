Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Q2SG2-0004Yi-61
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 18:54:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 404391404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 17:52:17 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id NrfS+SyP0Yul
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 17:52:16 +0000 (GMT)
Received: from xora-desktop (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 04C04A4832
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 17:52:16 +0000 (GMT)
Received: by xora-desktop (Postfix, from userid 1000)
	id 11898101FCB; Wed, 23 Mar 2011 17:52:30 +0000 (GMT)
Date: Wed, 23 Mar 2011 17:52:30 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110323175229.GN2224@xora-desktop.xora.org.uk>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
	<1300896184.3488.17.camel@scimitar>
MIME-Version: 1.0
In-Reply-To: <1300896184.3488.17.camel@scimitar>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Wed, 23 Mar 2011 17:54:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 23, 2011 at 04:03:04PM +0000, Joshua Lock wrote:
> On Wed, 2011-03-23 at 15:40 +0000, Graeme Gregory wrote:
> > On Wed, Mar 23, 2011 at 08:19:31AM -0700, Khem Raj wrote:
> > > On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > > > Hi,
> > > >
> > > > I'd like to import the EFL recipes Martin did from meta-shr into the meta-openembedded repo. Before I go bothering Martin about it, what would be the best place to put them?
> > > >
> > > > Inside meta-oe:
> > > >
> > > > meta-openembedded/
> > > >        meta-oe/
> > > >                recipes-efl
> > > 
> > > Can efl we layered directly on top of oe-core  ? i.e. without needing meta-oe
> > > in that case its better to be an independent layer. otherwise I would say put
> > > them under recipes-efl
> > > 
> > That is certainly not how I see layers being built up. I am expecting
> > in future us to have things like.
> > 
> > meta-gnome
> > meta-kde
> > meta-efl
> > meta-lxde
> > meta-xorg
> 
> Me too, in fact I think this image from the Yocto Project website
> succinctly portrays the goal:
> http://www.yoctoproject.org/sites/default/files/yocto-layers_1.png
> 
> Possibly less the meta-yocto but you get the point.
> 
I hope not as thats a truly horrible diagram.

I dont think there is anyway in modern linux to produce a nice neat stack
like that. Once you move beyond trivial images.

Graeme



