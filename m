Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C4D807D419
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 09:29:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Jk543YbDz3L;
	Wed,  5 Jun 2019 11:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559726952;
	bh=E/JLsA9azENl/mklBz1xvtAmsCEq3RJL4tcRAsqW/3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gB+EYAbiNn4smxXcw0hYoNfrPPVpt8Yfhab/YuiL0blU11/c4DpbLvqwOSR2yXx5c
	4sgkc5G50aLCa2v5eID+M6QkYtvRQYvzosco3loTP52aEx1bIRkS/G+jkx+whfBNJp
	0FLZ62J0VVowZH5KgdPcxQqLAxgQFL1EjxyXOF0EJKZpv+E7GdbKxs0FZHMHTjYlFC
	geLZfHJ3FzVPy8D+6x/n0WTLZPdeHy3bD37FFYt8fdvqcsZgvmsLCdmMkYDx83yEXS
	KUyyCSN3np9vP5EW8tuYfD2P+CPh5Da7qNjObAo5KyKq9QcEWE1AlgNIqMHexINEUT
	xdvfTVnopliwWrUoS4ztUK9FUb0wavkdsMEDkIHUZ/ZQPjJJGg0w7MW1XchANiJ9tu
	UrmunutY3iDNbzo7T1rz7zxh70zwyVU0OpgABr7/G4mLS7cbx3cxQ1CS4icjHHdNjp
	S+UwBFTI1Ty9w+Idpb3YxwSM9PZeSovvtA9Hwt3rJPy0am0csQ3eZy3s2upAXBaABk
	ywad6jvOQ7c7wMzVNZ1x9DtRAV3DLoaURqgywtfuW5v+jFpMC6se7PtTiIcjr8F6gb
	W76O4oMXHHB3osY5qoXcLYXumEk8WzLRlOujMr+iA5348gYLeSIbpRXMshId5cQwha
	em0RnY4fUPLfjg1Lzm6OGHlY=
Date: Wed, 5 Jun 2019 12:29:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190605092910.GA26331@localhost>
References: <20190603064703.17474-1-bunk@stusta.de>
	<20190605081831.GA1448@jama>
MIME-Version: 1.0
In-Reply-To: <20190605081831.GA1448@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lrzsz: Add implicit declaration fixes from Debian
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
X-List-Received-Date: Wed, 05 Jun 2019 09:29:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 05, 2019 at 10:18:31AM +0200, Martin Jansa wrote:
> On Mon, Jun 03, 2019 at 09:47:02AM +0300, Adrian Bunk wrote:
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > --
> 
> You need one more dash here, now this v2 comment ended in final commit message
> which I believe wasn't the intention.
> 
> http://git.openembedded.org/openembedded-core/commit/?id=6fa60ac102f6d3977df4236bd5a22680298bdac2
> 
> the same with tcp-wrappers change:
> http://git.openembedded.org/openembedded-core/commit/?id=cd1dc2334fd3e3d1db9be1d26e888051e3f59c5a
>...

Yes thanks, I already noticed my mistake.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


