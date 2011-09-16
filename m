Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1R4WFC-0008IA-Sx
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 13:06:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p8GB0qJ2013301;
	Fri, 16 Sep 2011 12:00:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12365-07; Fri, 16 Sep 2011 12:00:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p8GB0kh6013295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Sep 2011 12:00:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 12:00:47 +0100
In-Reply-To: <20110916101935.GG7445@jama.jama.net>
References: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
	<1316167797.25993.70.camel@ted> <20110916101935.GG7445@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316170848.25993.71.camel@ted>
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC 1/2] gstreamer: sync packaging with OE .dev
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
X-List-Received-Date: Fri, 16 Sep 2011 11:06:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 12:19 +0200, Martin Jansa wrote:
> On Fri, Sep 16, 2011 at 11:09:49AM +0100, Richard Purdie wrote:
> > On Fri, 2011-09-16 at 10:20 +0200, Koen Kooi wrote:
> > > some text here
> > 
> > It took all my restraint to not just reply with:
> > """
> > NAK
> > 
> > <insert reason for NAK here, I can't be bothered to type it>
> > """
> > 
> > We've been around in a few circles with this. The problem is that if we
> > apply this patch we have no clue which gst-plugin from the good, the bad
> > and the ugly provides something you're after to include in an image.
> > This results in bitbake being pretty clueless about whether a given
> > build will succeed or not. In general I'm not a fan of having
> > non-deterministic builds as they tend to annoy users.
> > 
> > If this position isn't acceptable then we'll probably have to move to a
> > situation where we list which plugins each of the packages builds and
> > drop the dyanmic provides. That is a maintenance pain and I don't take
> > that step lightly but I don't see any other options. I'm open to
> > suggestions though.
> 
> Something like:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031739.html
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031740.html
> ?

Yes. I'd probably have written separate .inc files to simplify the
script but I'm thinking along those lines. I'm not particularly happy
about it but I don't see many other options.

Cheers,

Richard



