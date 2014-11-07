Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6226017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 20:54:56 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEO00DZ1SR9RWF1@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 07 Nov 2014 14:54:46 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=TstRX4Tk c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10	a=pMtyAvcPPGguhargPK8A:9 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 740782010D; Fri,
	7 Nov 2014 15:54:45 -0500 (EST)
Date: Fri, 07 Nov 2014 15:54:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20141107205445.GF9512@denix.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
	<20141107194159.GD9512@denix.org>
	<CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 07 Nov 2014 20:54:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Nov 07, 2014 at 08:43:38PM +0000, Burton, Ross wrote:
> On 7 November 2014 19:41, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > > | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word
> > > unexpected (expecting ")")
> > >
> > > I suspect the real problem is:
> > >
> > > $ file fixdep
> > > fixdep: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically
> > > linked (uses shared libs), for GNU/Linux 2.6.32,
> > > BuildID[sha1]=0xb4ea84a189f10b4f3e08fb10f8e490135e2b920c, not stripped
> > >
> > > It appears to have been built using the target compiler, not the host.
> >
> > Ross,
> >
> > I'm a bit lost here - as you said above, this is a target build and yet you
> > say it shouldn't use the target compiler. Can you please explain what you
> > mean?
> 
> 
> Yes, it's building a binary (fixdep) and then executing it.  That binary
> needs to be built with the host compiler (BUILD_CC).
> 
> Easily replicated for me with "MACHINE=qemuarm bitbake u-boot-mkimage".

Ah, got it. Didn't realize, as I build -native version. Give me a sec to fix 
it. BTW, 2014.10 is out and I've been using it for a bit now - planning on 
sending the update soon...

-- 
Denys

