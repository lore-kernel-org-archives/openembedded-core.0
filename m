Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9E15F7EC92
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 09:49:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Q66k2Rnpz43;
	Sat, 30 Nov 2019 10:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575107390;
	bh=k3n18/jSLKrrrOHFaUDG/5qWjdEvgmgm+Arp2WWuQ5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSaJliLvw9JMMpQfwU/TzHdXZyc08tjxeV+iZ4m8xg9sJiKce8C6Hl62yvkD8andD
	Kc238mhWqFae8Kpllz76peE/MmExtXTUd1+MA+Erssn3eDHsNEBUXxfl0Ae2hvBD+d
	T3rQewaLe0PfQJtcETAung/CnDG63UMKDLkLR4v+PwF77OFD3jNozbvriO+5COCzeX
	GZjz/AqjuhYG5tEDb0lq3Gcwp2BOb4hIi3IExYW+8GgtLqjB5QMOaNqzC09UXz0tNM
	Gk5SmiIpXCWHL1MPgQnOZNWhbTIsXqNndstk7o+4IiWgIIQzKLmTWDwAs58n4odcP4
	nx5B+/yrLwkWLjC1HGi2bznmBuYEyMJY+MgGvB22KrdEFoMtk3WtF2aGVJQlI1Ka+v
	0gR5C7ziAypsXvqbV7F8VhAZrIsbLVDiQsJsuVCGJnSY552EpvcsL9RbU/TnVzO7lr
	XnZP38vltkyV/MAwIVHQKA+nGuBBFbn/dSCu/gEVxSHHCVk+o2Vnx6jecN2H1kbZ8f
	FT3M3cLmWqLtLqbZoA9eWm578m3eLdsCI/lh0d4ma5iJWGi72qFFBhuXZT66+B4biK
	uLRBY7c46UKU+MLbZqsv7nzBlj6F2SEKQO/VBo5m99m44/f3WkaQQmECPM+1Q84/LI
	KIabKYgTSz8MxwJVJzC3T/4o=
Date: Sat, 30 Nov 2019 11:49:48 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191130094948.GA4526@localhost>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
	<CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
	<CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
	<CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Sat, 30 Nov 2019 09:49:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 19, 2019 at 12:30:41PM +0100, Alexander Kanavin wrote:
> On Tue, 19 Nov 2019 at 08:58, Tim Orling <ticotimo@gmail.com> wrote:
> 
> > I have the beginnings of scripts to generate a meta-python2 layer. Someone
> > with a vested interest in keeping python2 supported will need to step up to
> > maintain it. After bitbake and Oe-core moved to python3, my use of python2
> > has gone to near zero.
> >
> > I intend to move all python2 recipes from meta-python to the new layer.
> > meta-python will become python3 only in 3.1 release timeframe. The bb files
> > and inc files will also be merged, simplifying AUH and devtool usage.
> >
> > Attempts to send python2 patches to meta-python after that shift will be
> > nacked.
> 
> Thanks! There is however a missing part: how close is meta-oe to being
> py2-free? Oe-core is very close (u-boot is the last holdout as noted), but
> I am not sure that we can simply take out py2, and not have half of meta-oe
> fail. For instance (random example) mozjs, a fairly important component,
> still pulls it in, together with a few 3rd party libraries:
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
> 
> It's tempting to force the transition by breaking things, but it also
> antagonizes users.

The problem is not that half of meta-oe would fail, but the few hard cases.

There might be 1 or 2 recipes where the rational solution would be to 
keep Python 2 in meta-oe for one release until a new upstream of these 
recipes solves the problem.

AFAIK for nodejs the choice for Yocto 3.1 will be between a short-term 
stable that can be built with Python 3 but will become EOL shortly after 
Yocto 3.1 releases, and an LTS release with upstream support for 2 more 
years that needs Python 2.

Python 2 is security supportable without upstream support since many
other distributions have committed to do the same, security supporting
Node.js without upstream support might be impossible.

> Alex

cu
Adrian

