Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Q2NLG-0003iI-VJ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 13:39:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 58B34A42CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:31:21 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id t4i-kK+rU4CV
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:31:20 +0000 (GMT)
Received: from xora-desktop (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id B5F76A42C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:31:20 +0000 (GMT)
Received: by xora-desktop (Postfix, from userid 1000)
	id AAF36101FC9; Wed, 23 Mar 2011 12:31:30 +0000 (GMT)
Date: Wed, 23 Mar 2011 12:31:30 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110323123130.GE2224@xora-desktop.xora.org.uk>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<1300883099.3018.2.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1300883099.3018.2.camel@rex>
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
X-List-Received-Date: Wed, 23 Mar 2011 12:39:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 23, 2011 at 12:24:59PM +0000, Richard Purdie wrote:
> On Wed, 2011-03-23 at 12:49 +0100, Koen Kooi wrote:
> > I'd like to import the EFL recipes Martin did from meta-shr into the meta-openembedded repo. Before I go bothering Martin about it, what would be the best place to put them?
> > 
> > Inside meta-oe:
> > 
> > meta-openembedded/
> > 	meta-oe/
> > 		recipes-efl
> > 
> > or next to it?
> > 
> > meta-openembedded/
> > 	meta-oe/
> > 	meta-efl/
> 
> I think the latter might be better in this case. A lot depends on who is
> going to maintain them and what the maintainer model is going to be. I
> think keeping things we can logically separate from meta-oe separate is
> a good thing though in general. We need people to start thinking more in
> terms of layers.
> 
I was just about to say all this but Richard obviously types quicker.

Yes I think earlier we start breaking OE into smaller contained chunks
the better.

Graeme



