Return-Path: <denis@denix.org>
X-Greylist: delayed 310 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Nov 2014 22:30:18 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7E46265CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 22:30:18 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEO003FPX636DL0@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 07 Nov 2014 16:30:04 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=c/scmq5g c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10	a=19jn3w9vfphBEglkTDAA:9 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 284282010D; Fri,
	7 Nov 2014 17:30:01 -0500 (EST)
Date: Fri, 07 Nov 2014 17:30:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20141107223001.GG9512@denix.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
	<20141107194159.GD9512@denix.org>
	<CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
	<20141107205445.GF9512@denix.org>
MIME-version: 1.0
In-reply-to: <20141107205445.GF9512@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Fri, 07 Nov 2014 22:30:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Nov 07, 2014 at 03:54:45PM -0500, Denys Dmytriyenko wrote:
> On Fri, Nov 07, 2014 at 08:43:38PM +0000, Burton, Ross wrote:
> > On 7 November 2014 19:41, Denys Dmytriyenko <denis@denix.org> wrote:
> > 
> > > > | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word
> > > > unexpected (expecting ")")
> > > >
> > > > I suspect the real problem is:
> > > >
> > > > $ file fixdep
> > > > fixdep: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically
> > > > linked (uses shared libs), for GNU/Linux 2.6.32,
> > > > BuildID[sha1]=0xb4ea84a189f10b4f3e08fb10f8e490135e2b920c, not stripped
> > > >
> > > > It appears to have been built using the target compiler, not the host.
> > >
> > > Ross,
> > >
> > > I'm a bit lost here - as you said above, this is a target build and yet you
> > > say it shouldn't use the target compiler. Can you please explain what you
> > > mean?
> > 
> > 
> > Yes, it's building a binary (fixdep) and then executing it.  That binary
> > needs to be built with the host compiler (BUILD_CC).
> > 
> > Easily replicated for me with "MACHINE=qemuarm bitbake u-boot-mkimage".
> 
> Ah, got it. Didn't realize, as I build -native version. Give me a sec to fix 
> it. BTW, 2014.10 is out and I've been using it for a bit now - planning on 
> sending the update soon...

Ross,

I've just sent an RFC patch to allow building mkimage for the target. I'd like 
to collect feedback for it first, but feel free to squash it with the previous 
patch, if it's accepted (or commit separately - your choice). The update to 
2014.10 will follow shortly, I just want this version to get through first, as 
it has been in limbo for a few months...

-- 
Denys

