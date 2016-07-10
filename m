Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 10 Jul 2016 17:25:07 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8E932601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 17:25:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1bMIF1-0005U2-Ud for openembedded-core@lists.openembedded.org;
	Sun, 10 Jul 2016 19:10:04 +0200
Received: from 112.133.237.57 ([112.133.237.57])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 19:10:03 +0200
Received: from venkateshv377 by 112.133.237.57 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 19:10:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Venkatesh <venkateshv377@gmail.com>
Date: Sun, 10 Jul 2016 16:49:56 +0000 (UTC)
Message-ID: <loom.20160710T184732-108@post.gmane.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
	<20141107194159.GD9512@denix.org>
	<CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
	<20141107205445.GF9512@denix.org> <20141107223001.GG9512@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 112.133.237.57 (Mozilla/5.0 (X11; Ubuntu; Linux x86_64;
	rv:47.0) Gecko/20100101 Firefox/47.0)
Subject: Re: [PATCH] u-boot: update to version 2014.07
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jul 2016 17:25:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko <denis@...> writes:

> 
> On Fri, Nov 07, 2014 at 03:54:45PM -0500, Denys Dmytriyenko wrote:
> > On Fri, Nov 07, 2014 at 08:43:38PM +0000, Burton, Ross wrote:
> > > On 7 November 2014 19:41, Denys Dmytriyenko <denis@...> wrote:
> > > 
> > > > > | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word
> > > > > unexpected (expecting ")")
> > > > >
> > > > > I suspect the real problem is:
> > > > >
> > > > > $ file fixdep
> > > > > fixdep: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically
> > > > > linked (uses shared libs), for GNU/Linux 2.6.32,
> > > > > BuildID[sha1]=0xb4ea84a189f10b4f3e08fb10f8e490135e2b920c, not stripped
> > > > >
> > > > > It appears to have been built using the target compiler, not the host.
> > > >
> > > > Ross,
> > > >
> > > > I'm a bit lost here - as you said above, this is a target build and
yet you
> > > > say it shouldn't use the target compiler. Can you please explain
what you
> > > > mean?
> > > 
> > > 
> > > Yes, it's building a binary (fixdep) and then executing it.  That binary
> > > needs to be built with the host compiler (BUILD_CC).
> > > 
> > > Easily replicated for me with "MACHINE=qemuarm bitbake u-boot-mkimage".
> > 
> > Ah, got it. Didn't realize, as I build -native version. Give me a sec to
fix 
> > it. BTW, 2014.10 is out and I've been using it for a bit now - planning on 
> > sending the update soon...
> 
> Ross,
> 
> I've just sent an RFC patch to allow building mkimage for the target. I'd
like 
> to collect feedback for it first, but feel free to squash it with the
previous 
> patch, if it's accepted (or commit separately - your choice). The update to 
> 2014.10 will follow shortly, I just want this version to get through
first, as 
> it has been in limbo for a few months...
> 


I am encountering this problem while compiling my driver code for beagle
bone black.

scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word unexpected
(expecting ")")
make[2]: *** [/home/venkyvenkatesh/Driver_Compiler/driver_code.o] Error 2
make[1]: *** [_module_/home/venkyvenkatesh/Driver_Compiler] Error 2
make[1]: Leaving directory
`/home/venkyvenkatesh/Driver_Compiler/usr/src/linux-3.14.4.1-bone-armhf.com'
make: *** [all] Error 2





