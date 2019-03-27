Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D16767D104
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:03:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44TqTs26Fhz5m;
	Wed, 27 Mar 2019 15:03:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553695412;
	bh=szFZLPiwdSIOnmrmk01zcdK916jDcn/5Z1meVn2vCCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3OyU3HG77wbHlCU40Jqb8mH01kR86BbmvXDyj/GOQASbwHTd5zLEhW8ZehhViiNw
	g5uqjUfl2bPWy9xl8Vawp8JvA+pJBJR4WIOKgYUZmuYLCuoOobiUVRZ0dGbuZ9WYIp
	KWcGDQiYJXykAB+lvU21XmjQcUvxEyrIjJUs9JNp/LmWtPS35YFnm95gyLwPjNL/Qi
	90+knbdvy8K6TfUE4l4fkq4KdzRU10bp9FZYCfAoQjxbQNch4j5HwuXs7wd9aKnQLB
	wHmoCmFahljoZSRGggMFoINYCQAH3ORvHpC7qA+miOiyUTHztDDtvFj5B8WzvdeECZ
	BIU0ZBohxjE30sP+vm3zHGMXObc/MJtg1zBQIF6z/4XNSzgMnoILwaf6LdR82Ps4Cv
	5bJbuR6Q5aH6tDH1HkBsJJCc2jJX8Cu5PbGM2v6Jl2ZsqURz5NqG5k04oEK7MO3XnS
	pqNfGO5y70IxTUzDkYsMsFvBzt58aGtrAwf2X95pO5jB130PzFCUPuKpSQcp5vsM4x
	y/3wKmK56aSUD2DJorxMIkDzSg2xB5eQ215q6HjZyJ3Nbgdhwjca+UP7LxybRV20Pi
	mL6oys/m6Z0Ygz1oF1laas80PPFbLWli1JSQB4qa5IhJWkRMt7hWnsHi/R2u8er1bA
	0sH9ONFQCzVVsSFIAGRzwID8=
Date: Wed, 27 Mar 2019 16:03:27 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190327140327.GA21936@localhost>
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
	<20190326102017.GA1929@jama> <20190326104212.GB19885@localhost>
	<20190327133314.GA1598@jama>
MIME-Version: 1.0
In-Reply-To: <20190327133314.GA1598@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Wed, 27 Mar 2019 14:03:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 27, 2019 at 02:33:14PM +0100, Martin Jansa wrote:
> On Tue, Mar 26, 2019 at 12:42:12PM +0200, Adrian Bunk wrote:
>...
> > Not having the release there also loses the ability to use either
> > gcc_%.bbappend or gcc_8.3.0.bbappend, which are suitable for
> > different situations.
> 
> There is usually just one version per recipe and even with _git.bb
> suffix you can easily do gcc_7+git.bb and gcc_8+git.bb if you need to.

Thud contains 8.2 today, but might have 8.3 tomorrow.

A layer might want to append only to one of them,
or have different appends for different versions.

That's trivial with gcc_8.2.bb and gcc_8.3.bb,
and harder with gcc_8+svn.bb.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


