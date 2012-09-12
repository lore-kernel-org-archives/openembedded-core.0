Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBm5H-0002me-AJ for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 14:30:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CCHj6x019398;
	Wed, 12 Sep 2012 13:17:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18790-03; Wed, 12 Sep 2012 13:17:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CCHcHT019392
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 13:17:39 +0100
Message-ID: <1347452260.11710.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Sep 2012 13:17:40 +0100
In-Reply-To: <20120912102508.GB8268@jama.jama.net>
References: <1347444916.2122.101.camel@ted>
	<20120912102508.GB8268@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Feature Developement vs. Stablisation and Bug fixing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 12:30:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-12 at 12:25 +0200, Martin Jansa wrote:
> On Wed, Sep 12, 2012 at 11:15:16AM +0100, Richard Purdie wrote:
> > Hi,
> > 
> > I know in the past this has taken some people by surprise. Both OE-Core
> > and the Yocto Project are aiming at release points every six months,
> > roughly October and April. In order to prepare for those there is a
> > period of 6-8 weeks beforehand which is aimed at stabilisation and bug
> > fixing.
> > 
> > We are now entering that window where we need to heavily taper off new
> > features and concentrate on the quality and stability of the release
> > which is scheduled for mid October. I'm not saying no new feature
> > patches will get taken but I will be asking questions like "why is this
> > being worked on?" and "shouldn't this wait until after release?". I'd
> > really like to see effort being focused on bugs now, not enhancements.
> > 
> > I know there are a couple of things which have been worked on for a
> > while and have been slightly delayed which I'd probably lean towards
> > taking (some offline postinstall work spring to mind). I was asked
> > whether I'd take a binutils update in a couple of weeks and the answer
> > is no, I'd very likely not as we're at the point we need to lock in on
> > the toolchain now (and major kernel version).
> > 
> > Does anyone have any questions?
> 
> Is stuff discussed in thread:
> ARM-tuning -- was qemuarm: should it really have TUNE_ARCH armv5te?
> considered new feature or bug?
> 
> In other words: should I try to test and send my proposed changes soon,
> or keep that for next cycle and just stop building qemuarm?

I'd consider this a bugfix but one we probably need to figure out sooner
than later...

Cheers,

Richard



