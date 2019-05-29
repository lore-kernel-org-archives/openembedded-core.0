Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 51CEF6C154
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 07:31:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DMnz5WYLz5l;
	Wed, 29 May 2019 09:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559115064;
	bh=k+AdShnx0Kl4o2JEfroZNGj6GWhIgy2JX2x/7cSk3fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSkAokLEbstf8gacP9ZBpKx3yfUhnfweujd999eApAfXMEazX0rVrwOOozJctv+uT
	bSFGsqkcGWbPE8lYUy7ZrOJAocyBo4qGR5JOnP8sbM4GvWyjY+TLDg3Qp7ysG233Be
	7sRChjKOg60gheS3s7RffH7wUbLDBAEllqsB6bVheUUxhOmMvB38rUB5WIzMBzs6KF
	uqeBa+raGn9zwwhiIgkHeXybYzZ4YBXflKLxKk3XGvHeiSniLQcUCZVcDXXHU9fmR9
	jZUfTuJJ/34OniHDjpsjl3H1E//i/7JzXHGNpd7U9BOWPMVMuFw6VDxnPn0aTcIO8Y
	Z9Y7vu2bpyLUQBom+gYbozUAXYQLR6/vwYgqdoTn5Rlcce2bJXgFe2vQoGspItNTvz
	mDa7DqDkwP4i/qy9NQr7OFECxhvrQocp9aIZKIyEWSJebnk22T5c7iQDVd7387FYPR
	x1XN/ug23LQNo9KzBEdp8QAC7RWSffnM5k1hpRP13771aMhNUIjIYr/VA/TxqXiTPs
	LofPHWm2/wScHndgObtEOAVJCE1KxeyAzbFTX7DPibPZNFVJk2nK0c9nlI/4xlM9We
	VSqypUVmk2wseoLXUlMZRlR1Mnc8FQaVjVnF6tPL6/aXdRkpO9XvEzzxh6kkN2Ug0h
	CD14soPTDFNsgTx6XmaS7OoE=
Date: Wed, 29 May 2019 10:31:01 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190529073101.GB23804@localhost>
References: <20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
	<20190524175859.GB6813@localhost>
	<CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
	<20190524184546.GA12358@localhost>
	<CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
	<20190524202842.GB12358@localhost>
	<CAJ86T=XoVzv5yLq1Hkoy2mXVDAA0rY-h8WboP4OmimLrJwJK0w@mail.gmail.com>
	<20190525072547.GC12358@localhost>
	<CAJ86T=X9grKeXkZMBL0zh6TeTRoyxg_TL3D=ADYvnH_L-6s3nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=X9grKeXkZMBL0zh6TeTRoyxg_TL3D=ADYvnH_L-6s3nw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Wed, 29 May 2019 07:31:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 28, 2019 at 04:10:45PM -0700, Andre McCurdy wrote:
> On Sat, May 25, 2019 at 12:25 AM Adrian Bunk <bunk@stusta.de> wrote:
>...
> > Supporting musl is a real pain across the board,
> > with new issues all the time.
> 
> There are always new issues and bugs to be solved in OE as a
> consequence of trying to keep all packages up to date. Whether the
> issues arising from musl are a real pain or a fun new set of problems
> to solve is mostly a matter of perspective.

Usually someone submits a change, and later gets notified that the 
change was dropped from master-next due to a musl issue.

That's not fun.

And all these compile errors with musl due to header order are a real WTF,
every other library (not limited to C libraries) is now doing headers 
properly so that any order works. No fun in supporting a broken design.

> > For really tiny systems you need both a tiny C library and a tiny init> system, so not properly supporting the combination of both forces users
> > to use alternative options instead of OE.
> >
> > Which minimizes the benefits gained by the pains of supporting musl.
> 
> A modern tiny init system would be nice to have, but it's not
> essential or fair to say that musl is useless without one. Many
> projects, especially tiny ones, manage fine with init scripts and
> custom process management.

I was not asking for "modern".

If init scripts are not default and CI tested with musl,
then init scripts will soon become a broken part of OE.

>...
> A few pragmatic patches applied by OE would go a long way to bridging
> the conflicting goals of the two upstream projects. It's basically the
> approach we've taken already - the question is just one of improving
> the patches we already have (and maybe patching musl to add missing
> functionality instead of only trying to patch systemd to not depend on
> it).

I already tried patching musl in OE.
The change got reverted.

There are people who think that OE-specific patches to musl are not 
acceptable, and that it is better to force everyone in OE to patch 
individual packages all the time instead of adding a not upstreamable
patch to musl.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


