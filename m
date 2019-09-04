Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 38B3F7EC66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 11:56:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Nj362rjLz56;
	Wed,  4 Sep 2019 13:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567598195;
	bh=fsKj9jmamTlT+wzcf/jxvyRjXEkEg9w6rpnJzhlf7m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGOmtlWncbNZvlyiS26k6+QG+xLF5SCrjtmWcIDtPihy16t/qWR2o2BjumP6cxM59
	v6++TG/rLYPkx/o2m9hMpu79MTDrzzrvd2FqfqFdqDjbvRJS/DQlnXsBiHpbgT+swv
	mWZHmsxrakioJV2PUP94DiXGm9BH4kXGml1dsyduLvs/zAlpX+AzN8Pb6JuB1Fw6jj
	7kw1u6iBIDOUvcJxrxRzqv91jlaswGboff4xJuX1Jp0Y8TUkKjVtfSjJktQQzNmM3i
	3Vd9DbAtV5BYJNzUe/M3C6FReEAa371cOnq2jEQ1M+KOEf2OKibIHangG9pO7Tv4nn
	x85i/6BJ5VIEaFnX20SSvpbzS+63wceOExrexLr+kl9wWw6J3AgX3xlp7c9Cb44oeb
	AM7ych9+vARQPOs2Xhb8kS+RGcznz/23DsSKoXLX8RRZnYnScZppVPMdhuh9E730g4
	O+4QGg59m4mRrbCh3vxE6Q+y2KIjubazsOgqDthv8JgMiK2K+FWv9nj88ZoxI6Mqug
	eDWQw4U+VRkvwo4mK6WI8ocqQf20SMh27TI/hR9e43vJeu9RAo+POUIhFM9uoqWSFo
	purKDrgTpKcm4NQLCJ31nz+IhpcyFHz+GNMZB8ltEmBTGXc7v3/UhV25+kgNcbJG7+
	DHMblOE+cffnYBOHUEXAMOdE=
Date: Wed, 4 Sep 2019 14:56:32 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190904115632.GA17900@localhost>
References: <cover.1567348433.git.akuster808@gmail.com>
	<d000f85c4dfa791e2e764c9d6126bcc13baea01c.1567348433.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d000f85c4dfa791e2e764c9d6126bcc13baea01c.1567348433.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior 18/43] systemd: Backport OpenSSL BUF_MEM fix
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
X-List-Received-Date: Wed, 04 Sep 2019 11:56:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Please drop this one, see
https://github.com/systemd/systemd/pull/12802

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


