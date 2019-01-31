Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B80186BCDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 18:26:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43r7wq1LZbzMs;
	Thu, 31 Jan 2019 19:26:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548959196;
	bh=fRs/CXwI2CUc+2lwEsOx9fE9OkBrT7JoyfzVA3q3OkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ReHpOPtxxuVSfGyTLSgAUqV7VhwpG6hGTwoWjU3Yzz/XO3RpglI85V75z2zpFYzz8
	AfPCM0rGByTpyUo1uwTOQ5pPFzEKRpVNJ0/c1OMmrJnh8diSoRvGD4vgcSIvqLUncn
	+1gn8xihsxLyCkHXUjHxZ2vDP4hI5iaZsNz0tA1wlxwG3DdKIHmZETTgdOzos0RHmf
	msSPLarfboc8dqf8uoAHLDcNo2piKSdvXhAzXA+wpmmormwGXupTcKSzFOgz4PlMGT
	kle4s5enIZDMOst/U6e7qf07jZU5B7pVGPmuFiOBXHfdL7Mq82A9uTkJZmAiXiBp6x
	uK9H1X69h96m9LLZwMLliOX/B56p2/+T5HXmv15GPNruO9fLMMj+1XAzWMpI2DDfjc
	Th0dWA/fj08obDkiFSqQrcnN63oOvLJZ3b/8zhuEfi9qLl+682Iuxbq6LSPXZf3t53
	YpOS+ZMeV0yw8BrRaZb1WkQ8IOC6vSSimayA4D3+xztabSrlJEMTRorvq8o2pJlP8B
	F+hX+PX+XhGSipvspZQD22vGCsHk+x/OPCPvUxh7tZxckjr4OKUwKO6z4czPizzio7
	P7a32XMNx6y5td1qofO8nKZNYuz5N7Y5XALRDxe0hVgIFFe1g3eq9/xQVqbtxDmzBP
	gVWreDsCd31ae8fnpRnDWgRw=
Date: Thu, 31 Jan 2019 20:26:33 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190131182633.GC28875@localhost>
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<20190130203129.GB15086@localhost>
	<CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
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
X-List-Received-Date: Thu, 31 Jan 2019 18:26:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 30, 2019 at 02:18:06PM -0800, Khem Raj wrote:
> On Wed, Jan 30, 2019 at 12:31 PM Adrian Bunk <bunk@stusta.de> wrote:
> 
> > On Wed, Jan 30, 2019 at 08:50:02AM -0800, Khem Raj wrote:
> > > On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > This is a tiny but pretty useful tool.
> > > >
> > >
> > > question is, do we need this enabled in default config, or could be add
> > it via
> > > some DISTRO_FEATURE meant for validation etc. May be if you explain your
> > > usecase then we might be able to make a better assessment.
> >
> > Sorry for being too terse.
> >
> > devmem allows reading and writing hardware configuration registers,
> > which is useful both for debugging and for scripts.
> >
> 
> Thanks for the info this seems useful can you also report how much does it
> increase size of busybox

In a -O2 build for arm64 busybox.nosuid grows 4 kB.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


