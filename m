Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9EAC17F692
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 23:18:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47JJX66dSNz4H;
	Thu, 21 Nov 2019 00:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574291895;
	bh=dblkIWHrZmeOCUgEw/DgecBuutwyA4N2yi2dp0P8WXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEZnDODg2sPx9u+X+yrp4AQwcSbs+YwLuWHp/6sbxc/6TqK9ynHTOqLQonWOki3TV
	7cvtWOnmzFrgNXK9DMqGe9W3/Ihj1ENy+iN3ZOmDR74T0iKX3X7lsyWKyDoMft2Of7
	KPo+hGFwdY3cBcc9AmXjrbAv7mDnvtJpkoGZWPkBgfyhuHqdyh8T8pz8bazRc+18pe
	RrM72Q6TLhKxtdR8MMDlqPLuZS5p/bxIvsOGC2y9QtLnC+IL794DTiakJJqkDunJYG
	eDm2Wl63U9NXyC9dPEcCyrf0YkrIASjeGzkRWgUStG+x3Crp0xc6VKuAdtA1jOw8H9
	Jgn2AWFW8w5dnCAtnsx5TAdvSTlQ6F5hOcFE/71K7FkNKds5Yo06NfaEfirF3gYc8g
	xIMDlACOz53ag3/9/iIZ4Tuei8S6vxNbpULgckeq8ajVE9xv3zVeAsClgU16x39YQQ
	uTYKMk9XmfhHkbiORbK8QiA70hw0K2pg6Zf+YDChE8kONA1L0ikX7CqGrkONdQgFgb
	JcDKda3z6wLaW8lJtpavBIpNEABNgEzQb8cCnOmg99hp1LiTnjTN9otCF3WysPx9bk
	XOKHA/qqQ5IyR34ItaoLEcK+cQ/v/8AHa9WjMUZHUgULQTWDpjkBz4CZjeyS22V28f
	/N2i64E3L1wfnf+eRIi9RIRw=
Date: Thu, 21 Nov 2019 01:18:12 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191120231812.GB3962@localhost>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Wed, 20 Nov 2019 23:18:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 20, 2019 at 11:56:38PM +0100, Alexander Kanavin wrote:
> On Wed, 20 Nov 2019 at 23:32, Phil Blundell <pb@pbcl.net> wrote:
> 
> > However, I think the point still stands that the commit message needs to
> > provide a better description of why the package is being removed.  If you
> > think it represents an ongoing maintenance headache that's already bad and
> > only going to get worse, and this now outweighs its usefulness, let's just
> > say that.  Not all old software is problematic, and not all problematic
> > software is old; the fact that the last release was 20 years ago is an
> > interesting fact but in isolation that doesn't represent a problem.
> > Indeed, compared to some other packages in oe-core, eight patches in
> > total over a 20-year period doesn't seem like that bad of an average.
> >
> 
> Fair enough, I wrote a hasty commit message. Mistakes happen.
> 
> Can I say what my problem is? Here goes: so far, no one in this discussion
> offered actual help with the actual issue. If you need this or that
> functionality from Yocto, please try to place help ahead of complaints and
> criticism.

No, your problem is your way of communication.

It is a very unfriendly way of communication to request help in the form 
patch aiming at immediate removal.

It comes across as if you were just too lazy to even try to fix 
something another patch you are submitting is breaking.

You would have received more constructive answers if you would have 
started with an email describing the non-trivial technical problem
where you need assistance.

> Alex

cu
Adrian

