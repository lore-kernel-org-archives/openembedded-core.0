Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 122DF7FE5D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 11:46:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47tkpQ57xhz1n;
	Thu,  9 Jan 2020 12:46:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578570367;
	bh=cMSujyDWTqCXwDOF4e8VZlCQbYv83ldCnu9joHbuA28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=osvb1RBQM+CsjiGiYbHh9+OPQue4uUjS4RvRWGOqRYMg1266mUmYR/H2yJk2Mytti
	YbIe99BZvTQdpEBLdjl1xBux/T6JGvEk5EDEGMVBItp5/wMO3mG4f/3CoRncjBf9Yv
	X8gMfluegX8z+MGzCFDSkpXyf6BfeXa6nZtrFfHCoS4fWyLKv5oMTbH0cPAYGe/QxD
	2/mCZPN2ekHW1W0xmsaa49uqxGL0LXDF590ufJ4X/9CcPxNbUYLmYLmueQ6RJQj/dx
	/zt0g9SUGOoSFZqSDscYQMTMlr9aPueLd3clD3fBzcijQE1l3mNH9itMmYu+jjcthS
	MDU5xCYZW7UBZp52Y2LjW593gLTe7aiYRf0D/203lrbaKQMqpJQbzwh9nUe0EfYE7U
	eoDKDJvduhP++wbOMXDtlhD8MqYHMA2S8e77JPdr8yVnLjMhVeWemhwI2YMQtDsVio
	y8oyijzgIN9sNphD89S/9rofrkGVgS7tRLEKrfkCbg9vSeWkjiDH6UK1ejOnrNbiPi
	fpT/krda7v3f1SRIGp+x4GQ32I4bCEXToBc4SP1ddCyPI31u8e+N2VkDVSexDji/5W
	DeXTvbRAAEGMKaC9EPtT4mV6N+daE4jxXMlXBXIJkosmkt/qHVd6Zbftvv0jsZTmt2
	93R04UXrgKBSBxkicA1W47xw=
Date: Thu, 9 Jan 2020 13:46:04 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200109114604.GA29022@localhost>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-14-alex.kanavin@gmail.com>
	<2fc677f1e980e80cd75d8b2e3c926556be06a8ef.camel@linuxfoundation.org>
	<CAMKF1sp2+x5P0368UKgZr6DuFPy-0k1=fR3tnUwSwFdmyiWHqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp2+x5P0368UKgZr6DuFPy-0k1=fR3tnUwSwFdmyiWHqg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/28] libcap: update to 2.30
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
X-List-Received-Date: Thu, 09 Jan 2020 11:46:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 08, 2020 at 05:31:45PM -0800, Khem Raj wrote:
> On Wed, Jan 8, 2020 at 1:22 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  ...-tests-do-not-run-target-executables.patch | 33
> > > +++++++++++++++++++
> > >  .../libcap/{libcap_2.27.bb => libcap_2.30.bb} |  5 +--
> > >  2 files changed, 36 insertions(+), 2 deletions(-)
> > >  create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-
> > > not-run-target-executables.patch
> > >  rename meta/recipes-support/libcap/{libcap_2.27.bb =>
> > > libcap_2.30.bb} (90%)
> >
> > I think this causes iputils to fail to build:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/331
> 
> also
> https://errors.yoctoproject.org/Errors/Details/305696/

https://github.com/iputils/iputils/issues/246

cu
Adrian

