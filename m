Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2A74C7ED59
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 15:20:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45s7j45pxjz56;
	Sun, 21 Jul 2019 17:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563722425;
	bh=GtEk/Jy6gksVj2uF/BV02L94IUFGz+i/67PQL1bArx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6vP+SGz1e0jNSCwt0ZOKpekDY8pIjlJJi2bu4gI+7yLZvRMdbrLL+r9xMi2k+YKO
	nme/xuP8zM0y2glXqdJuGZxtg69VPt8s8MlqvKg32As40Nw8bpEGS25LLY/PVEXC8q
	0B1CYFj1w5wyJre2I8sYRlGGBMOUhC/jSTmwNWeyDgO9ES1G50H/e44JqT8urN6fBv
	VgD1kKbx+jVUMaZL3JivBHd6gxVZL/VXc4ksfPhomK3GLnSY7/Fs6Q17PZJhTkb/QQ
	m1n7Nmu6LnIVgioIqBUIveTd3IaIFG2jhJzZBQSubLpYhRdPxC3nCklN7V9PVJHqL3
	6gvvBodSch2pHC4c6o9diqd/rHIICWBkLKoU2V2s63Mn/bJFg3zH/0NSbB5DHoTYgv
	BgJCQtJulOpxWiSiT+5FR8SMFTKxvDrtW1ud2SihMsnR/zQ8PMPMMOh+om98u713kC
	eIHkOYlSv2rM6mGEHp05eAjiZrjvWiHsvb8j+VqAMSWtU33jeG1fhi5f9lRoEB+RoJ
	/eqj4qF+vP4Ft7eCHBe0xHv+jvpCHi3oLmPVe9Q6bpoc9rORmPq3dvBQtnx6UFbucj
	8UlhpUcVQtoedVwFtuKTEjuOT+dP42P5jDEyF6uGckpegCLXne+N8+3VWNQ13KTko0
	xwYqoEEnpx41Cm9+OVSORnYs=
Date: Sun, 21 Jul 2019 18:20:22 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190721152022.GA5474@localhost>
References: <20190720180058.10672-1-raj.khem@gmail.com>
	<20190720180058.10672-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190720180058.10672-3-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 3/4] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Sun, 21 Jul 2019 15:20:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jul 20, 2019 at 11:00:57AM -0700, Khem Raj wrote:
>...
> ++#if !defined(FNM_EXTMATCH)
> ++# define FNM_EXTMATCH (0)
> ++#endif
>...

As already said in [1] this is expected to result in broken code,
and the upstream testsuite also confirms this.

cu
Adrian

[1] 
http://lists.openembedded.org/pipermail/openembedded-core/2019-May/282787.html

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


