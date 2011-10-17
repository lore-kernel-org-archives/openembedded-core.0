Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RFl7J-0003TR-8R for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 13:12:34 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HBDD2b004030 for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 12:13:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zjyKN64bs51a
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 12:13:13 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9HBD9nc004017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 12:13:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2011 12:06:23 +0100
In-Reply-To: <20111017095002.GG12684@jama.jama.net>
References: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
	<1318674260-8320-2-git-send-email-Martin.Jansa@gmail.com>
	<1318689013.3158.7.camel@lenovo.internal.reciva.com>
	<20111015143444.GD12684@jama.jama.net>
	<1318689610.3158.8.camel@lenovo.internal.reciva.com>
	<20111017095002.GG12684@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318849592.21775.0.camel@ted>
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 17 Oct 2011 11:12:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-17 at 11:50 +0200, Martin Jansa wrote:
> On Sat, Oct 15, 2011 at 03:40:10PM +0100, Phil Blundell wrote:
> > On Sat, 2011-10-15 at 16:34 +0200, Martin Jansa wrote:
> > > On Sat, Oct 15, 2011 at 03:30:13PM +0100, Phil Blundell wrote:
> > > > On Sat, 2011-10-15 at 12:24 +0200, Martin Jansa wrote:
> > > > > * this way we can use
> > > > >   EXTRA_DRIMODULES_armv4t += ",glamo" in meta-openmoko layer and
> > > > >   EXTRA_DRIMODULES_armv4t += ",foo" in meta-bar layer without knowledge
> > > > >   of other modules in other layers in stack
> > > > 
> > > > Is this really better than using "DRIMODULES_append_armv4t = ..."?  
> > > 
> > > the point is that you don't need to know who is setting swrast there for
> > > armv4t...
> > 
> > I'm not sure I understand what you're saying there.  Can you be more
> > concrete?
> > 
> > > > 
> > > > It's not really true that you can do it without any knowledge of what
> > > > other layers are doing since if you end up with two competing
> > > > EXTRA_DRIMODULES_foo overrides then one of them will get lost.
> > > > 
> > > 
> > > so EXTRA_DRIMODULES_append_armv4t should be fine, right?
> > 
> > Well, yes, but in that case it doesn't seem as though the EXTRA_ bit
> > (and this patch) buys anything.
> 
> OK, forget this patch.. I've forgot this behavior of _append_armv4t
> syntax.. and I've changed meta-openmoko to use this too.
> 
> can we change x86 and x86-64 examples in mesa-dri.inc to
> DRIDRIVERS_append_x86 = ",i915,i965"
> DRIDRIVERS_append_x86-64 = ",i915,i965"
> so it will work as example for BSP layer maintainers that thay don't
> need to care about setting
> DRIDRIVERS = "swrast"
> for their arch?

I'll take that patch...

Cheers,

Richard



