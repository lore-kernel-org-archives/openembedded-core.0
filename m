Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2YQe-0003I6-5k for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 01:29:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2O0Ree1015764
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 00:27:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15460-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 00:27:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2O0RVt8015758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2011 00:27:32 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D8A88FF.8070600@balister.org>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
	<1300896184.3488.17.camel@scimitar>
	<20110323175229.GN2224@xora-desktop.xora.org.uk>
	<1300921337.3018.45.camel@rex>
	<20110323235316.GQ2224@xora-desktop.xora.org.uk>
	<4D8A88FF.8070600@balister.org>
Date: Thu, 24 Mar 2011 00:27:28 +0000
Message-ID: <1300926448.3018.69.camel@rex>
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
X-List-Received-Date: Thu, 24 Mar 2011 00:29:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-23 at 19:57 -0400, Philip Balister wrote:
> On 03/23/2011 07:53 PM, Graeme Gregory wrote:
> > On Wed, Mar 23, 2011 at 11:02:17PM +0000, Richard Purdie wrote:
> >> On Wed, 2011-03-23 at 17:52 +0000, Graeme Gregory wrote:
> >>> On Wed, Mar 23, 2011 at 04:03:04PM +0000, Joshua Lock wrote:
> >>>> On Wed, 2011-03-23 at 15:40 +0000, Graeme Gregory wrote:
> >>>> Me too, in fact I think this image from the Yocto Project website
> >>>> succinctly portrays the goal:
> >>>> http://www.yoctoproject.org/sites/default/files/yocto-layers_1.png
> >>>>
> >>>> Possibly less the meta-yocto but you get the point.
> >>>>
> >>> I hope not as thats a truly horrible diagram.
> >>>
> >>> I dont think there is anyway in modern linux to produce a nice neat stack
> >>> like that. Once you move beyond trivial images.
> >>
> >> The diagram is idealised but I think the concepts there are valid, for
> >> example, bring in the meta-linaro layer to use the linaro toolchain,
> >> bring in a BSP layer for a particular piece of hardware support and so
> >> forth. Certainly, a developer is likely to have local tweaks in a layer
> >> of their own on top.
> >>
> >> Why wouldn't that work?
> >>
> > The diagram demonstrates a nice stack, but what about if you want two
> > gui layers. Real life example, gnome and kde have cross dependencies on
> > each other.
> >
> > In a real system you just cant pile up a nice little stack of components. It
> > works more like lego where you have multiple components that fit together
> > depending on multiple components to hold them up.
> >
> > The diagram is overly idealised to the point of zero information, fit for
> > marketing but not engineering.
> 
> At the risk of being blunt, anytime I see a figure that looks that neat, 
> my bs detector goes off.
> 
> Graeme managed to say that much better than I did.

What do you want as a reply here?

a) Lets delete the diagram now, it obviously doesn't cover corner case 
   781.
b) Mark the diagram "FOR MARKETING USE ONLY!"
c) Give up on explaining any of OE to anyone who isn't a highly focused 
   embedded engineer. Its impossible to understand any concept unless 
   you understand all the engineering details.

Have either of you ever tried to explain some of the concepts we're
dealing with to people who aren't deeply engaged engineers?

Having a model showing the kinds of things layers can do is extremely
helpful in explaining the concept to people.

Part of OE's problem and the number one complaint about it is that its
hard to understand. If as I/others try and put things into terms that
others can understand get undermined with this kind of response its just
going to further the impression that OE is nice but never going to be
useful in the real world.

As for whether that diagram is practical, I actually believe it is in
some cases, like the one I described above. Certainly not all but its
worth trying to strive to simplify and make things fit simpler models
if/when we can. If we don't even bother trying, there is no chance
things will improve.

Cheers,

Richard



