Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R4WKR-0008UV-Mu
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 13:11:31 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1R4WFR-0000Jq-Ad; Fri, 16 Sep 2011 13:06:21 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 12:06:20 +0100
In-Reply-To: <1316170848.25993.71.camel@ted>
References: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
	<1316167797.25993.70.camel@ted> <20110916101935.GG7445@jama.jama.net>
	<1316170848.25993.71.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1316171181.3510.23.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 16 Sep 2011 11:11:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 12:00 +0100, Richard Purdie wrote:
> On Fri, 2011-09-16 at 12:19 +0200, Martin Jansa wrote:
> > On Fri, Sep 16, 2011 at 11:09:49AM +0100, Richard Purdie wrote:
> > > On Fri, 2011-09-16 at 10:20 +0200, Koen Kooi wrote:
> > > > some text here
> > > 
> > > It took all my restraint to not just reply with:
> > > """
> > > NAK
> > > 
> > > <insert reason for NAK here, I can't be bothered to type it>
> > > """
> > > 
> > > We've been around in a few circles with this. The problem is that if we
> > > apply this patch we have no clue which gst-plugin from the good, the bad
> > > and the ugly provides something you're after to include in an image.
> > > This results in bitbake being pretty clueless about whether a given
> > > build will succeed or not. In general I'm not a fan of having
> > > non-deterministic builds as they tend to annoy users.
> > > 
> > > If this position isn't acceptable then we'll probably have to move to a
> > > situation where we list which plugins each of the packages builds and
> > > drop the dyanmic provides. That is a maintenance pain and I don't take
> > > that step lightly but I don't see any other options. I'm open to
> > > suggestions though.
> > 
> > Something like:
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031739.html
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031740.html
> > ?
> 
> Yes. I'd probably have written separate .inc files to simplify the
> script but I'm thinking along those lines. I'm not particularly happy
> about it but I don't see many other options.

Last time this issue came up we talked about simply merging the -good,
-bad and -base plugins into a single recipe (since there appears to be
no very compelling reason to keep them separate) and just leaving the
-ugly ones on their own.  That still seems to me as though it is the
best way of making a lot of that complexity just go away.  Then
something like Martin's script could be used to figure out the (mostly
static, with a bit of luck) split between -ugly and the rest.

p.




