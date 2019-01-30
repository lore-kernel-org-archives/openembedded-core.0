Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 51FCA7C04E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 20:31:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qZlQ6mcQz4N;
	Wed, 30 Jan 2019 21:31:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548880291;
	bh=TA91MhaaEAt1nC47XZoyXCuZ3W5tG8XJHyiOQZxAAmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7Ed/QTPuYBOE5NCiJZU51aWsg3ZUof2h18pO0sf1MTohp/trN8q01KntmofTUoZ/
	LGSAtxT/hswdiam234Et6lyMq9UH+jhcF1TzvP4RQJYr7wkVj27Ifbrdle5wr+sbis
	V1Sq8B3lS/usogdjzExsXDa0eOtzsyQwBkCwcJLfUPriwRwDHYzmA9IzAtSFY9cdrn
	MHFL8RhYQ0lVDn+Bq4mjL9ImdCEx7/94Z/UwqTZveazUxBVZwuc6yOm/7vEgk5AWHt
	vye4DcHArQi1EqV17hx+DKBr2IOPv11cvjka+sj8Jur3/8n9x5t8er6OxI5js6t0um
	/wRDfy4lmnSjeutLTDrfZ5MFuIC2rzqi/7xhiAHjrcxguthhNuM2eQB2mTWmbfPIxn
	2pavAflc0rWv7TNIIl/evL12JDa21i6JQGg5BZJUC49A8YHNDZf3uCRZnPp+jlUkr/
	KA2METIjDserok2KuhKk6JpObVpiwGvCzLFpPJjhrKo9l+LMaHDspUrXQFonoX2M5Y
	eM4GwdRMqAZiuqKs34C7ZKzvUykbRBnkwycaB13CzALZ3NEmRVabFB6uYBWrl42yVM
	otjEBLWOPMuM2oKG0hjjyPWagMrZrrXq9fXHtOf91vINwfcrqfZE1Ajb9wbvpGGsWl
	ka3W6GhPx88bHuCRfP/+pLb8=
Date: Wed, 30 Jan 2019 22:31:29 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190130203129.GB15086@localhost>
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Wed, 30 Jan 2019 20:31:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 30, 2019 at 08:50:02AM -0800, Khem Raj wrote:
> On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > This is a tiny but pretty useful tool.
> >
> 
> question is, do we need this enabled in default config, or could be add it via
> some DISTRO_FEATURE meant for validation etc. May be if you explain your
> usecase then we might be able to make a better assessment.

Sorry for being too terse.

devmem allows reading and writing hardware configuration registers,
which is useful both for debugging and for scripts.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


