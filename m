Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RF6Lz-0007Qy-M8
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 17:40:51 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RF6GR-0005bb-Lh
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 17:35:07 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20111015143444.GD12684@jama.jama.net>
References: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
	<1318674260-8320-2-git-send-email-Martin.Jansa@gmail.com>
	<1318689013.3158.7.camel@lenovo.internal.reciva.com>
	<20111015143444.GD12684@jama.jama.net>
Date: Sat, 15 Oct 2011 15:40:10 +0100
Message-ID: <1318689610.3158.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 2/2] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Sat, 15 Oct 2011 15:40:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-10-15 at 16:34 +0200, Martin Jansa wrote:
> On Sat, Oct 15, 2011 at 03:30:13PM +0100, Phil Blundell wrote:
> > On Sat, 2011-10-15 at 12:24 +0200, Martin Jansa wrote:
> > > * this way we can use
> > >   EXTRA_DRIMODULES_armv4t += ",glamo" in meta-openmoko layer and
> > >   EXTRA_DRIMODULES_armv4t += ",foo" in meta-bar layer without knowledge
> > >   of other modules in other layers in stack
> > 
> > Is this really better than using "DRIMODULES_append_armv4t = ..."?  
> 
> the point is that you don't need to know who is setting swrast there for
> armv4t...

I'm not sure I understand what you're saying there.  Can you be more
concrete?

> > 
> > It's not really true that you can do it without any knowledge of what
> > other layers are doing since if you end up with two competing
> > EXTRA_DRIMODULES_foo overrides then one of them will get lost.
> > 
> 
> so EXTRA_DRIMODULES_append_armv4t should be fine, right?

Well, yes, but in that case it doesn't seem as though the EXTRA_ bit
(and this patch) buys anything.

p.




