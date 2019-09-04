Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7377A60273
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 20:27:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46NwNh161Kz5v;
	Wed,  4 Sep 2019 22:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567628852;
	bh=XPUIJEOAyKkE5etuNxL3l8i6Zo4ZaNYpikQqrgmErAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7h+mOjzQlfdYxv/6oz1mvl4zzpxZo5FUVvASRjTyZgEX6pXbdMSb3cE8jSb8R4pa
	cFKw/gK3TnYwNMF2b48V4obysHSKmYRJGjjtalT20ERQX9or30Kuliq+DdYAvul3bT
	3OUDTO6PkaxIZ0d8FIp0HiaCyHq7ftsaTh5Ti1nJLlLPSbSCGJ7iRfqVFTNkZR8WLM
	aGbjDTP2TYCjVGFwE/8JYOUBIxrx15jD8UmCLR9OJDADm2OluCTs7VqHIasoK9EGS1
	teCRljPdvgh/lpli5KH9yLHyk6iBE1OrBuySk1trgkD0rcTbJqvEqgniHPEASk/8Z6
	nYxwAs51zyYXbalqTQbd0fkuQ7KDinqFOlDLlFGsopjw/6/YoyzQSXtohOI/D8/d8q
	kgAqyesBYnnjckqWkpLolvpeKyOSZYGQKUPmbhfX+ABGSumZTWU17glaoXc1gPwvqY
	IIbWh785Ic5fl0F/LN/hJ9+CRXIPyXmjJqUpNwEaO7J9FIg/HJwjJlmDBNSvWeMLgS
	aW4tWCtLdnYnljstUZ57Pm88ocC19E5DCWNev646MtA4iP62pbxmlGjxHYE6Qq1E7r
	t9gwQcLi/0MismD4bWbhXXta+plHN/lwFQIIZz8v+avKbk0OukA3xGq3OfQybkcyc3
	huRv8xA4ZDCASmTQ+mA+M+Go=
Date: Wed, 4 Sep 2019 23:27:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190904202729.GB21155@localhost>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
	<20190827180449.GA29638@localhost>
	<5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
	<CALBQxSsXuM+926J=A=2R=X7xPSz4htuFk3pKrJ3Zpj1uK0AXDw@mail.gmail.com>
	<32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
MIME-Version: 1.0
In-Reply-To: <32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
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
X-List-Received-Date: Wed, 04 Sep 2019 20:27:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 04, 2019 at 08:07:58AM -0400, Mark Hatle wrote:
> On 9/3/19 1:59 PM, Wes Lindauer wrote:
>...
> > In reference to "It typically does NOT include the license of things used to
> > build the software (such as makefiles, autoconf fragments, etc)".
> > Since the only file that is licensed under GPLv3 is a M4 macro, does that mean
> > the current patch is still valid? Shouldn't the GPLv3 license be removed from
> > this recipe?
> 
> Unless the M4 file is generating/injecting code into the build(very few I've
> seen do this),
>...

If the defines in config.h are "code" then many do.

> --Mark

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


