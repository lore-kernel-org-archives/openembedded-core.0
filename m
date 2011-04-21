Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QCzU1-0006zj-F8 for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 21:24:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3LJLjv2008573
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:21:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08528-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:21:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3LJLa9a008567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:21:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <D92FBC8F-FB70-4551-96DE-5B7AC333DB89@dominion.thruhere.net>
References: <201104211704.37707.paul.eggleton@linux.intel.com>
	<20110421165711.GA25621@xora-desktop.xora.org.uk>
	<D92FBC8F-FB70-4551-96DE-5B7AC333DB89@dominion.thruhere.net>
Date: Thu, 21 Apr 2011 20:21:20 +0100
Message-ID: <1303413680.5518.359.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] meta-handheld
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
X-List-Received-Date: Thu, 21 Apr 2011 19:24:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-21 at 19:27 +0200, Koen Kooi wrote:
> Op 21 apr 2011, om 18:57 heeft Graeme Gregory het volgende geschreven:
> 
> > On Thu, Apr 21, 2011 at 05:04:37PM +0100, Paul Eggleton wrote:
> >> Hi all,
> >> 
> >> I've discussed the possibility with a few people on IRC of creating a meta-
> >> handheld layer for support of older handheld devices - this would include 
> >> Zaurus, iPAQ, SimPad, etc; possibly even EZX phones if they aren't in a layer 
> >> of their own. These machines share a fair amount of commonality and I don't 
> >> think that they will all survive if each one has to be put into a BSP of its 
> >> own. Response so far seems to be positive but I'd like to hear thoughts from 
> >> others on this.
> >> 
> >> I have access to many of these devices, and this is something I am prepared to 
> >> maintain on my own time, although I would appreciate help from others. I have 
> >> the basis of a layer from what was left in oe-core and meta-extras but quite a 
> >> lot of it would need to be brought over from OE.
> >> 
> >> If people agree that this is a good idea, the next question would be where to 
> >> host it - is this something that could be within the meta-oe repository?
> >> 
> > Grabbing all of these barely supported machines into their own layer sounds
> > like a good plan to me.
> > 
> > Id suggest just hosting it on gitorious, if its inside OE then there is the
> > magic assumption from the public that they should work (which is what happens
> > now). Then people get really dissapointed when I tell them getting it to work
> > is likely to be a hard slog.
> 
> I agree with Graeme on the hosting bit. I also have all the devices you mentioned near my desk, so testing should be easy :)

I'm going to disagree, this is exactly the kind of layer fragmentation
I'd not like to see layers cause. Which website do I go to where I can
see a list of layers that exist? Who is going to maintain that list? If
its off on gitorious nobody will be able to easily find it.

The easiest solution is if git.openembedded.org or git.yoctoproject.org
can host the majority of the meta-* repositories.

Equally, I don't really see why this can't be a specific meta- group in
meta-oe. The README can clearly spell out what the expectations of the
layer are...

Cheers,

Richard



