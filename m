Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Q2hm3-0003GK-9F
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 11:28:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 36AEA1C185
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 10:26:24 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id eyG0Ei3tuOL8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 10:26:23 +0000 (GMT)
Received: from xora-desktop (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id A12891C108
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 10:26:23 +0000 (GMT)
Received: by xora-desktop (Postfix, from userid 1000)
	id D85AB100523; Thu, 24 Mar 2011 10:26:48 +0000 (GMT)
Date: Thu, 24 Mar 2011 10:26:48 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110324102648.GS2224@xora-desktop.xora.org.uk>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
	<1300896184.3488.17.camel@scimitar>
	<20110323175229.GN2224@xora-desktop.xora.org.uk>
	<1300921337.3018.45.camel@rex>
	<20110323235316.GQ2224@xora-desktop.xora.org.uk>
	<4D8A88FF.8070600@balister.org> <1300926448.3018.69.camel@rex>
	<20110324074926.GR2224@xora-desktop.xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <20110324074926.GR2224@xora-desktop.xora.org.uk>
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
X-List-Received-Date: Thu, 24 Mar 2011 10:28:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 24, 2011 at 07:49:27AM +0000, Graeme Gregory wrote:
> On Thu, Mar 24, 2011 at 12:27:28AM +0000, Richard Purdie wrote:
> > Have either of you ever tried to explain some of the concepts we're
> > dealing with to people who aren't deeply engaged engineers?
> > 
> Yes, everytime I apply for a new job/contract getting quite used to
> explaining it.
> 
> > Having a model showing the kinds of things layers can do is extremely
> > helpful in explaining the concept to people.
> > 
> > Part of OE's problem and the number one complaint about it is that its
> > hard to understand. If as I/others try and put things into terms that
> > others can understand get undermined with this kind of response its just
> > going to further the impression that OE is nice but never going to be
> > useful in the real world.
> > 
> > As for whether that diagram is practical, I actually believe it is in
> > some cases, like the one I described above. Certainly not all but its
> > worth trying to strive to simplify and make things fit simpler models
> > if/when we can. If we don't even bother trying, there is no chance
> > things will improve.
> > 
> 
> You miss my point, Joshua's email reads to me like "our goal is to make OE
> like this diagram" which if true would cripple OE to being incredibly simple
> and non flexible.
> 
> My vision of a seperated out OE is to seperate components out into logical
> boxes. Ie the gnome box, the kde box, the xorg box. Then like we used to do
> with our lego or mecheno sets. When we want to build something we know what
> components we want so we select the boxes that contain those components.
> 
And following up from this the diagram is one possible outcome of the
model I am trying to describe in a very poor manner.

Graeme



