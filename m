Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2iDJ-00045P-BR for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 11:56:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2OAsXD2022023
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 10:54:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21780-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 10:54:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2OAsSEp022017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 10:54:29 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110324102648.GS2224@xora-desktop.xora.org.uk>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
	<1300896184.3488.17.camel@scimitar>
	<20110323175229.GN2224@xora-desktop.xora.org.uk>
	<1300921337.3018.45.camel@rex>
	<20110323235316.GQ2224@xora-desktop.xora.org.uk>
	<4D8A88FF.8070600@balister.org> <1300926448.3018.69.camel@rex>
	<20110324074926.GR2224@xora-desktop.xora.org.uk>
	<20110324102648.GS2224@xora-desktop.xora.org.uk>
Date: Thu, 24 Mar 2011 10:54:23 +0000
Message-ID: <1300964063.3018.85.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 24 Mar 2011 10:56:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-24 at 10:26 +0000, Graeme Gregory wrote:
> On Thu, Mar 24, 2011 at 07:49:27AM +0000, Graeme Gregory wrote:
> > On Thu, Mar 24, 2011 at 12:27:28AM +0000, Richard Purdie wrote:
> > > Have either of you ever tried to explain some of the concepts we're
> > > dealing with to people who aren't deeply engaged engineers?
> > > 
> > Yes, everytime I apply for a new job/contract getting quite used to
> > explaining it.
> > 
> > > Having a model showing the kinds of things layers can do is extremely
> > > helpful in explaining the concept to people.
> > > 
> > > Part of OE's problem and the number one complaint about it is that its
> > > hard to understand. If as I/others try and put things into terms that
> > > others can understand get undermined with this kind of response its just
> > > going to further the impression that OE is nice but never going to be
> > > useful in the real world.
> > > 
> > > As for whether that diagram is practical, I actually believe it is in
> > > some cases, like the one I described above. Certainly not all but its
> > > worth trying to strive to simplify and make things fit simpler models
> > > if/when we can. If we don't even bother trying, there is no chance
> > > things will improve.
> > > 
> > 
> > You miss my point, Joshua's email reads to me like "our goal is to make OE
> > like this diagram" which if true would cripple OE to being incredibly simple
> > and non flexible.
> > 
> > My vision of a seperated out OE is to seperate components out into logical
> > boxes. Ie the gnome box, the kde box, the xorg box. Then like we used to do
> > with our lego or mecheno sets. When we want to build something we know what
> > components we want so we select the boxes that contain those components.
> > 
> And following up from this the diagram is one possible outcome of the
> model I am trying to describe in a very poor manner.

Joshua can correct me if I'm wrong but I think his intent in posting it
was to point out that we are trying to split things into building
blocks. Different people visualise things in different ways but the
stack picture shows a possible way you could build some blocks and an
example of the size and shape some of the blocks could take.

Nobody is saying we must have those blocks, only those block and they
must be put together in a particular way. Its just an example which
helps people understand why blocks could be useful, how you might use
them and give people some ideas.

I'd never want to cripple OE or make it non-flexible and neither would
anyone on the Yocto team. The whole point of basing a lot of what we're
doing around OE was due to its flexibility!

Cheers,

Richard




