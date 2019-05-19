Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1057D6B5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 08:37:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 456Fkm6rVHz5c;
	Sun, 19 May 2019 10:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558255025;
	bh=qAKYd3u6cCcSwwvefRLgMnhPfSj388kTPoyCRabKPQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRFe4jW4KD+UkyZGg4uVoSpE8ZaVJH3rxh0YR80SpTgRoWIIL7fWBic4b+RYqIrk4
	rRk9g+JZ1+C5JihBAadLbLK7FWq9kHWGliDO5d04lfoGrqiVKaIVrdivLWdsjKaP4w
	GFZ4sw3BBUTcmW2ymZNy9PuiytIzQ4nqD660GmbXYY0wcePSHGbBZimNfsPlQw0Cbo
	iyPHdDoX1UdE8B9cn2vmeP8IHsMbpIimmPGj1vTiC7irhWXRkiECZpVqzH4TWzpPHG
	Woc4XBcXx/wZB6AmE5MiEdLnypg16ZIPdNMvkKVArbY7aNudosENxZNxKeUoOMqb2j
	W8H8I6uSt5c5ixTCPDgoE7MWvP2q+NpbfFc3oBRqAIhRIO2ddZLjMTxQGN6OLEZ3XA
	ziNDryo8/cbxNQfHAA1MuIHIDb5ElPo6Vh4OMlSt8fcwArbNHN9Gd05TUR5nvmMDa6
	oHXDDx0WZxCtoXJfklH/aVNeEJzCk/e1Gc5Kehtq4halX1+1YTrWge97pCjWd5zWe/
	z+UY3U9qXjC/oHuwmY//3G9zE4U3rtYI4EXvIu0wtgKE7uP67S10AmjoKGl9pzGJ8Z
	bFU4ZIvNEWpCbFVW7Kj8pIY0I/8XBawTxxulFR0140KDjVw07HTkuYqk2Dw0NcGym5
	zxCKQtylQg6JxGsKDdBgpBaY=
Date: Sun, 19 May 2019 11:37:02 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190519083702.GA23436@localhost>
References: <20190518172136.11368-1-bunk@stusta.de>
	<c5b0bf78-e579-4f77-c4f2-b16e9ee49eda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c5b0bf78-e579-4f77-c4f2-b16e9ee49eda@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-mdns: Stop trying to build for musl
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
X-List-Received-Date: Sun, 19 May 2019 08:37:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, May 18, 2019 at 09:56:04PM -0700, Khem Raj wrote:
> 
> 
> On 5/18/19 10:21 AM, Adrian Bunk wrote:
> > There's no point in building an NSS module for a C library
> > that doesn't support NSS.
> > 
> 
> Fundamentally this change looks ok however
> have you tried using avahi after this change ?

No.

The RRECOMMENDS in avahi are already _append_libc-glibc,
and libnss-mdns simply cannot work with musl.

How well Avahi works with musl is therefore invariant.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


