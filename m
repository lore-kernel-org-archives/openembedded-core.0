Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DF2F27D270
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 20:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45nbVF2R21z4C;
	Mon, 15 Jul 2019 22:58:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563224326;
	bh=oe4t2hviJkFz1oY9hn/oKwWlF/cy82W69ems0RY2PuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOzkjl0SY5ZBnbkW/jpcgjWv40Q7OUol7xpbMTRlH9EvX9N9dG/ApY0Zukd3GI+IG
	B7TGg6V0ER4USZ2pwALKiT9eQh3EjFv9uWhowsRfyMgTg3h5PfxGadk4idBQGHPCdP
	FwbUFnNHl2Ff41bjro94tGt865+Vp/si1aJf+CJBvEYr5eOCZXN21RTf31NiTbqyuH
	KipOkbW+AMznbjT6FsBsz4YzfDZ2hU2wfNbIoAmO/ABIZfz0iZUH9DufZ9D2psODPC
	IzfDc55Tt5OyYfBpKxRsqLCpmpQjgbxyr0FMcCe/sD6BkWuQ5dTkpsEp1ze1uIUloM
	RIaXhKBXcGIzBds9gl+5kSvYQ/5qbLGyjnRbC0Xz+y3/WSlg7cmiauVF6xh2TA1ni/
	DAlZRnUJyDBSxgEB9sR5X8NhcmPAhfHtlX3Uq3JWAYPkOE2pjEPVfHv7P+qt4ZjXuT
	nnTOHqvzkWFM5OQ8/S9Ln3FgtCq6W1e8ZoWwvP1Sf11ZWuozAeK8DbRSbnTYsQpNgw
	Gso1UPGYYyAYcYdc8xCBds3GEw1YKQJybth8M/URo9e6lLh+RUrgP++pu9RNnrtcgH
	YyzZeM8dhEA55KE9RgeAyfZVWSl1niRL9ON3pzpZ0piBTqGjXhCq+dzzjWCgWjGrLi
	fLrwGHQZiniMdWtWCqQpLcyw=
Date: Mon, 15 Jul 2019 23:58:42 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <20190715205842.GA14808@localhost>
References: <20190715203857.65119-1-jrey@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20190715203857.65119-1-jrey@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Joseph Reynolds <joseph.reynolds1@ibm.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH] dropbear: new feature: disable-weak-ciphers
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
X-List-Received-Date: Mon, 15 Jul 2019 20:58:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 15, 2019 at 03:38:57PM -0500, Joseph Reynolds wrote:
> Enhances dropbear with a new feature "disable-weak-ciphers", on by default.
> This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers in
> the dropbear ssh server and client.
> 
> Disable this feature if you need to connect to the ssh server from older
> clients.  Additional customization can be done with local_options.h as usual.
>...

Changing the default behaviour in a stable series does not sound 
appropriate to me.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


