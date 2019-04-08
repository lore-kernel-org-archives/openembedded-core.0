Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D0D3B6D409
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 15:04:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44dDGb733Yz96;
	Mon,  8 Apr 2019 17:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554735864;
	bh=KImrk0BGe8rkvZUuuHmXiBZCHB8AucoQD6h2EEXsI/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJYj/2quEvTsIJBsZOvb1QUBaFgu5awxQd3yEn6f3pBISZ/2fpADSy97ZU70BE63v
	QysEVbplJCtwGAFSskM066w7jDrh9qIUU2VVa02Nm3jGUpIMBVFJcVI32Eoeaphr93
	8onee/dfWoFWj53UY2MVi0QqwyNjzxH4ufp3dbNmfS394KzGVUnHoUGjmXABoOh8yC
	XNVEbyqoB9t5cQv/fGAqfrwnUPji5/lTg1kT+giRMv/njZmAJrVUOxw7Zs2h6Pc2d/
	v9wXnYK8fDa0826d+qe59TMm30LnLlhoBcPk3w2O733ggDqW9wY6vM1s4VKLrUWG7U
	ldT7Odlti0ZR5z8ZJvt7hKkdR+5kKqsKGPR1D+nhKmUjHpYRrFRahaN8JuNRr3LOzz
	M0nggVLYTiPgeasJaLDzeruHtdIsGiOeOuhrkT9girTQj7XblJB+4VzgBTnYC5lnPO
	vq3uYYJvwFMvPuSMXbdumI9MmE3+fuZr7+knRXxufW1VEPAOYgMmlpAxVFKAd2rDdC
	qiPLW43RBPf/f4W8LoqvP+hvz1XvTopPc0SHqRwTbhYKExLC5ZtFoI8zZdF+rLE4rl
	kSzJRposLVRcZY45vunHKvWHj/A7PKS6hRMKbb+1Fy9NLismndY8lqBDEyJFGRiajP
	oicb2xUUquXOsdu4tLasYtSY=
Date: Mon, 8 Apr 2019 18:04:21 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190408150421.GA12521@localhost>
References: <20190408120856.18831-1-bunk@stusta.de>
	<73e3496c-7f9a-28fd-e1f2-426a847fcfe5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <73e3496c-7f9a-28fd-e1f2-426a847fcfe5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnutls: upgrade 3.6.5 -> 3.6.7
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
X-List-Received-Date: Mon, 08 Apr 2019 15:04:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 08, 2019 at 08:08:08PM +0530, akuster808 wrote:
> 
> 
> On 4/8/19 5:38 PM, Adrian Bunk wrote:
> > This is a new upstream release from the same stable branch
> > bringing new features and bugfixes (including CVE fixes).
> >
> > COPYING changed http -> https.
> >
> > configure no longer has a --without-libunistring-prefix option.
> 
> Here is the same comment post earlier:
> 
> this was regressing when attempted to be removed last time see
> https://git.openembedded.org/openembedded-core/commit/?id=d8d32b5a58eea161711e3539c4530682de551ede
> 
> Does it work when libunstring is installed on build host now ?
>...

Works for me, and the option no longer exists.

This seems to be part of a a change to drop compatibility with
ancient autoconf in gnulib, which might have fixed the original 
cross-building problem?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


