Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 14AB07D39B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 05:40:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46P8fr5JCXz4q;
	Thu,  5 Sep 2019 07:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567662037;
	bh=KOqlHzqtNWoWzUwGvGc/G1MH/yRKaDmP+cKeajYL2fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chYOwiJxlzXBK5mR682lHX0G+7AlJe9uldBv8UXhnSLYP1k5HSxw0+ywPiWhI7G3e
	21hU+PXrTp9b30OeK1G8w+fVTEOcNtsgjRQZxt4X1SIlJYnKc0YsRxNUB6o8ci8ar3
	Hbut7SxNrwMhdKqXZOuOw+/1oyVdeq6Xazn4R6vZz4A36+70YTUEzxhZvwVpKJ/bRu
	rHQfSHKwmKJtO2H0eU5ktX73SLtpWWdFiP1iNeDVaihqhJHaQkxFZCtyZneeC7j6gL
	VLGxhmE8kKB+FSG5ut04hbo8e0cwIua3G0GtV2QFmIwoQDlke48R6KMhTJYPbSz1tr
	lJcsUU0WEUGmrQS8s3HMmwzUqOi2OMmNb5yksk4Wy9wH2oH5Wvdci0q4fmyEOrICtX
	+mucfccMmhLuv9Da/82+NSxC3FbP599Nsy+MSTPx27u/56w9Bgdx+lg32Mc5G+fPfx
	Ui7QoNGaVvwWo7J1I7NDZYLTgjRfxsq97+lpasvRP/Gac4xzYOkj3SBrhLzlB7hOsV
	IYY+JXWoQhEb34OBGnKYKK+lKaAiAbzz3VF/6/TgJULw+nMd+CvghlD13TDi0qj+sJ
	e+FHaid2K+0ZugPWcSAvQ1Q4nv5NI3w8ZhpR/hX7b2+AIYwchf+QC855Sl/DNw085U
	7bsopgLUVs6YJSyHYFNZCiTU=
Date: Thu, 5 Sep 2019 08:40:33 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190905054033.GC21155@localhost>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
	<20190827180449.GA29638@localhost>
	<5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
	<CALBQxSsXuM+926J=A=2R=X7xPSz4htuFk3pKrJ3Zpj1uK0AXDw@mail.gmail.com>
	<32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
	<20190904202729.GB21155@localhost>
	<0e9d096b-29f7-04ac-d88f-280ca0602c2b@windriver.com>
MIME-Version: 1.0
In-Reply-To: <0e9d096b-29f7-04ac-d88f-280ca0602c2b@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Thu, 05 Sep 2019 05:40:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 04, 2019 at 04:42:41PM -0400, Mark Hatle wrote:
> On 9/4/19 4:27 PM, Adrian Bunk wrote:
> > On Wed, Sep 04, 2019 at 08:07:58AM -0400, Mark Hatle wrote:
> >> On 9/3/19 1:59 PM, Wes Lindauer wrote:
> >> ...
> >>> In reference to "It typically does NOT include the license of things used to
> >>> build the software (such as makefiles, autoconf fragments, etc)".
> >>> Since the only file that is licensed under GPLv3 is a M4 macro, does that mean
> >>> the current patch is still valid? Shouldn't the GPLv3 license be removed from
> >>> this recipe?
> >>
> >> Unless the M4 file is generating/injecting code into the build(very few I've
> >> seen do this),
> >> ...
> > 
> > If the defines in config.h are "code" then many do.
> 
> Is there a license statement at the top of the config.h?  If so, then it counts.

No license statement is required for having copyright.

>...
> >From the latest autoconf source code docs:
>...

What comes from autoconf is GPL-3.0-with-autoconf-exception,
3rd party macros might have any license.

> Or is it just 'facts' (i.e. defines without any creative content)?  Then I don't
> consider it relevant to the source license,

When you argue along the lines of "generating/injecting code into the 
build" that sounds like what many autoconf macros are doing.

> based on statements I've seen elsewhere.
>...

Statements from lawyers, or from random non-lawyers on the internet like 
you and me who might be right or just repeat something incorrect?

The users for whom these questions actually matter most in practice
are lawyers from the "no GPLv3" camp, so their input might be useful.

> --Mark

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


