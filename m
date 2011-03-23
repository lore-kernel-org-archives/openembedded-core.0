Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2RJ5-00050w-1h for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 17:53:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NGpO2Y002291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 16:51:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01806-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 16:51:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NGpF6Z002283
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 16:51:15 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110323154018.GI2224@xora-desktop.xora.org.uk>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<20110323154018.GI2224@xora-desktop.xora.org.uk>
Date: Wed, 23 Mar 2011 16:51:12 +0000
Message-ID: <1300899072.3018.30.camel@rex>
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
X-List-Received-Date: Wed, 23 Mar 2011 16:53:17 -0000
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
> 
> Obviosuly none of these is an independant layer of its own, and to make a
> complete system you will require a stack of layers with the appropriate
> recipes. This really is where the DISTROs come in as they select the layer
> mix they want.

I don't disagree, I would be interested to explore what would be missing
from oe-core to enable some of these to work though. If it is just one
or two packages it would raise some interesting questions.

Certainly having a requirement of depending on meta-oe might not be
necessary in all cases.

Cheers,

Richard



