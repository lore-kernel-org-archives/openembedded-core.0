Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1QCxE9-0005E9-6W
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 18:59:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 61053A4A7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 17:57:14 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 8zRyh1Jj7NT4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 17:57:13 +0100 (BST)
Received: from xora-desktop (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 4FFCCA4A7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 17:57:13 +0100 (BST)
Received: by xora-desktop (Postfix, from userid 1000)
	id B179110043E; Thu, 21 Apr 2011 17:57:11 +0100 (BST)
Date: Thu, 21 Apr 2011 17:57:11 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110421165711.GA25621@xora-desktop.xora.org.uk>
References: <201104211704.37707.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <201104211704.37707.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 21 Apr 2011 16:59:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2011 at 05:04:37PM +0100, Paul Eggleton wrote:
> Hi all,
> 
> I've discussed the possibility with a few people on IRC of creating a meta-
> handheld layer for support of older handheld devices - this would include 
> Zaurus, iPAQ, SimPad, etc; possibly even EZX phones if they aren't in a layer 
> of their own. These machines share a fair amount of commonality and I don't 
> think that they will all survive if each one has to be put into a BSP of its 
> own. Response so far seems to be positive but I'd like to hear thoughts from 
> others on this.
> 
> I have access to many of these devices, and this is something I am prepared to 
> maintain on my own time, although I would appreciate help from others. I have 
> the basis of a layer from what was left in oe-core and meta-extras but quite a 
> lot of it would need to be brought over from OE.
> 
> If people agree that this is a good idea, the next question would be where to 
> host it - is this something that could be within the meta-oe repository?
> 
Grabbing all of these barely supported machines into their own layer sounds
like a good plan to me.

Id suggest just hosting it on gitorious, if its inside OE then there is the
magic assumption from the public that they should work (which is what happens
now). Then people get really dissapointed when I tell them getting it to work
is likely to be a hard slog.

Graeme



