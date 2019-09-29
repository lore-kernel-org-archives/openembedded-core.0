Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CDD307DAD9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 12:30:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46h4cJ4h4fz65;
	Sun, 29 Sep 2019 14:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569760208;
	bh=2KYSVI1/qbBJQC8f1pSL5Hg5nS1jXa6hRFJRh01l9HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxvttYAjCtSo4gUNZQi1avc3wPHyygb1RLxpWkgt+GTYr6CTyWyoMBQ8Rbqn1FZiy
	eKQSo2DV++i/xMkQr2xdYDS1IVppkAT8VWqLXKm0/pMdfK0EyMS/ZLUPdQbifJLnrq
	UnGvFyEICH3WjwVafWO4MWOiJZaEUopkCFFm+adjyW0E+J1BG7Y06dHyo7iE94Wrkg
	5RM/j9F9HwqTBfxI/RkEqT5lRxp4YLwvNGd1Gs2wdAOCeLMx467WbPMJkUXhVTlHwG
	QhjalTAhYdSekxmuGkM6+b3ZryrxYMHC+U/V6nVq8xMNiQ9wEwBtUPLneKEJumT0D3
	AZZtqAP3kfuMipYg3k9UNGB5DT9qXIZijSiGm05kY9DhL3oSVeZLjbBaXN3H6K5hLX
	U4uU0VeGZShlH/CiSrEieIDtFFt3ALDsEokB9uh9RYmL4JOhArcr34GAPPeXkC+eLC
	KJyEhyETdgKRZplWO3rYABmZWrw+cKg+Z+7SK8pFSujCOyHgKearyQWuXK8bttskHn
	IfeidXbZqNkevpkfgayGiuXIZkq4AdLpXeV6L2L0f0/3Qh3vwOE1Q8WAUKcMq04ZfD
	fcayYqIw0mBgOE5nuaQ1D7BUDFP57+szUPM+EOk30wO+CmE4ul2mnuTJ9MOiYxEfD7
	GtwB9Klw0PkWvcZWJH1rybk0=
Date: Sun, 29 Sep 2019 15:30:05 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Joe Slater <joe.slater@windriver.com>
Message-ID: <20190929123005.GA30130@localhost>
References: <20190927181651.72996-1-joe.slater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190927181651.72996-1-joe.slater@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bash-completion: add image feature
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
X-List-Received-Date: Sun, 29 Sep 2019 12:30:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Sep 27, 2019 at 11:16:51AM -0700, Joe Slater wrote:
> Create bc-pkgs image feature to load *-bash-completion packages
> into an image.  The packages are created by the bash-completion
> bbclass but are currently never referenced.
>...
> +COMPLEMENTARY_GLOB[bc-pkgs] = '*-bash-completion'
>...

What about naming it bash-completion-pkgs?

This is not related to meta/recipes-extended/bc,
and descriptive names are easier to understand.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


