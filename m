Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C99EA7D30C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 10:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44kdfF6TZ7z3G;
	Wed, 17 Apr 2019 12:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555496710;
	bh=45VUjrW/ba/PUuIxG+hbTeZYbg4qYOSHy6y6x1vt71A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLfFwy5aeI4clXDuWUP+biEdvtoNCtATgO5R5n4fEBWbbZJBUIiqRcbGqKCIobwtt
	AuU4vReN//5Uk276ur/k1yZziCN2yejxjstjCpZ9wUCbfCfaBdNDq/V7mO7EwyMQ31
	UBlI5dmHNQ/3kv4E11UVvprXnOT+YenWKd+/puMaa84JyKwoglZlydfdov6PmXzO+J
	UsAE8nj4Gd5PdYg9OG94Rw0aznMitPQNP9dMQNOkHcBiRQnHb1qd8vWc8tzeKNw67Q
	obDVrfz3SSXoNCaYvCjsiER0IOMcFRhlM2mMnUWLRAaKjYtEtHr269ZqwPEKfgboGr
	m1fxueKfrLbvSIc9rnpc30Kr7ep4CiKwNGApj5CBfkcJh6q3yGclq9VzDtgUekyQJg
	zam0JqYkP3XEwcfl7NXa3UoBoSBy2328rdY927iqa+yqBtrd8hLkzGKKAhj90uBPMW
	+EwkPU/yVYwgaaQoVN4igInTFmuletka8NF4br2defKzIPpwo6TvDLnEJ0DZEA/l5K
	xzbnU0IixRvG/XodfnRRZXU9+sqtE/EHBEtEXP0TRw4o36CDJp9cm9o1J6JW4KH4Pc
	/kTjJ/xrOpiNdSSMZvARlUIdxVlQRdG2SQkI7/DYrYb305J6mSbJTqmydaswWyQtlr
	mNTwDNRX9Asz47jZMMTvoinQ=
Date: Wed, 17 Apr 2019 13:25:07 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Message-ID: <20190417102507.GA3148@localhost>
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
	<b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
	<95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
	<eac500ca51a96c769ab3080bcd78dd93316bea9f.camel@linuxfoundation.org>
	<20190417093520.GA895@localhost>
	<fdc87321d0cba27741ae1b9e1dde703e42683fa2.camel@linuxfoundation.org>
	<20190417095029.GB895@localhost>
	<355BE46A91031048906B695426A8D8E62EA3AE12@DENBGAT9EL2MSX.ww902.siemens.net>
MIME-Version: 1.0
In-Reply-To: <355BE46A91031048906B695426A8D8E62EA3AE12@DENBGAT9EL2MSX.ww902.siemens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 17 Apr 2019 10:25:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 17, 2019 at 09:57:50AM +0000, Bach, Pascal wrote:
> > > > Your "everyone has to install it" worry misses the much bigger
> > > > problem that git-lfs is a relatively new tool and not available in
> > > > distributions like Debian 9 or Ubuntu 16.04.
> > >
> > > Someone could certainly write a native recipe for lfs and add that as
> > > a dependency which would also solve this problem. I'd be quite happy
> > > to see that and it would neatly solve the problems.
> > 
> > This was also my first thought.
> > 
> > It stops being neat once you realize that it requires packaging a 3 digit
> > number of Go libraries.
> 
> I don't think that's how go packaging works. Go usually statically links everything at compile time and bundles the sources with modules.

It is not really static linking, it is more like the "libraries" being 
source files instead of compiled code.

> So from a yocto point of view you only need to create one recipe with everything inside.

Fetching from 100 different git repositories would be plenty of
work to setup and to maintain, no matter how many recipes you use.

Certainly not impossible, but I wouldn't call this neat.

>...
> Pascal
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


