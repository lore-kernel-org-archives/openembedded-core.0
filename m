Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DD93C7F2F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:53:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46K2c14S10z2Y;
	Thu, 29 Aug 2019 14:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567083233;
	bh=stXR41hxmu1edLp9SC0D9MNV5sdFQUVqgMNPWsAnDQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGUlHRVsQQWroJuczOgplu7H8yrVB9BolIlI3BcnkpJNilGN1vkucH3F7wQ6CQD6Q
	21qZ72qgsDUNoQwdWh4lfeCfwk1Fib6RrbtEaV6efZnLrXC2zhSnNEe+Vs+SRPaQYb
	LHEeZzl0O/tEcIiqTVpIwkT+GROwREF4FqqbesV4+vBApWiHeAzlqI0Kt05dT/YI+y
	sHbS63blZN74yTNnS9SrWVGTALPGAthjE6AWpf4gEIVA3+vSNxR0vl6wDONSLGlwoh
	lkseGV5p2n69/2F/KW74wT0U+4zPl8hwqwIOzQP7gHysMs0lz48ZI+heYTM62LB39A
	eb0xAPrRU5EBcVJksqj76T51UZlARKdlBvkMQz6F2a1hg2PgKFi7FYx3mzbFZ8YlRC
	pi21Aop7eObaK1qVa3GU2is/GbkezW6LTUtQapqYr0db4ABsI8/30ef9ESOS6KjSYT
	05QgT3EICeVLOUrmu2VxiJsBC7m34F0YZPtd84UvBsxwvDjTJ8egjVA6K1KCCkN1NK
	PjcmXBr7NuJt3E8uAESNjAnqwGB8j4Vf3w8/aNdD16Lsta75cJo7pjdaV2ybiRDJmU
	u8D22eF1E/eYDct8DSyINhPlxlgF+n6MCFKZXllj6VpzGNfbvfvBBGuq/XfaCCs5Nq
	wd+vgERZQ+qOYGUXgf/RFJMI=
Date: Thu, 29 Aug 2019 15:53:51 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20190829125351.GB32705@localhost>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
	<CADkTA4MBTDFUam5xvwvc0KKO+fX7ZfmBYtoe6_ZdrnspJok7Rw@mail.gmail.com>
	<20190828215810.GF3044@localhost>
	<CADkTA4NbtkgR2LrZC+Srtn-BC+6q=7HQH9S7tbJ3H4u7=HQm7w@mail.gmail.com>
	<20190829063158.GG3044@localhost>
	<CADkTA4NXYy0jnZg6=S_W=3znH9M1hidYw8MDwqOqQCGESq8p=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NXYy0jnZg6=S_W=3znH9M1hidYw8MDwqOqQCGESq8p=g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Thu, 29 Aug 2019 12:53:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 29, 2019 at 08:23:58AM -0400, Bruce Ashfield wrote:
> On Thu, Aug 29, 2019 at 2:32 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Wed, Aug 28, 2019 at 06:06:04PM -0400, Bruce Ashfield wrote:
> > > On Wed, Aug 28, 2019 at 5:58 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Wed, Aug 28, 2019 at 04:11:43PM -0400, Bruce Ashfield wrote:
> > > > >...
> > > > > There's zero risk to these, and no reason to sit on them.
> > > >
> > > > What range of LTS kernels is covered by the "zero risk"?
> > >
> > > It has nothing to do with LTS kernels.
>...
> > How do your changes interact with a BSP layer that provides
> > the upstream maintained LTS kernel 4.4?
> 
> As mentioned in other parts of the threads, we test against the
> reference kernel's in master. Other versions can either bbappend, or
> send patches. That's unfortunately how it has to be.

It is an unexpected meaning of "zero risk" when this excludes 
breakages with kernels other than the ones in master.

One of the non-python changes to perf blew up the build for me even when 
trying with a kernel that is only a few months behind on the 4.19 branch,
so there's some patches for me to send next month.

> Cheers,
> 
> Bruce

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


