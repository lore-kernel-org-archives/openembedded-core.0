Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6649E7F7E9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 01:41:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47ZVcf1r3rz3D;
	Sat, 14 Dec 2019 02:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576287682;
	bh=ZqXPvyHb4X28DOYzY4X0Rka3TsfV3XdB7JW7FZLi41I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUJgc1UIrDlAHh2IjiDkhNve0mh/ofW/j5vMT5WBf9rGCBSWjFcg2Kasvv4Pq/6b/
	DloGHnt3fA2aE1HbWQC10TmDA1Qg43vtWoaYLsbQQJEBl4dT8lXLtHpwd7D71tA11v
	fmp4utaVMgD/wkoruwiaWw5+z7pj47boOXT+ND0pUy2roGzReihfvP0FIIlsZ2+06U
	2R26CmhRuioo89s6nifqn5LagN8yTU9JH+JS05eCcoXekzMOft0UMIfNGfpm9hy0CB
	8DeSGlqlkJcPKHYoedQO0ATlehZtK/HLnpTmMeBdLUjOYt/xHIYofOEjGBUvuekPBr
	2JbfuMOf2TjYkPAx6nojmzRjyzdfKeULMlrY5WEe+VjaOglIrqihVxX2DReQ3C25Mp
	BQPEwk5iH3Z75qF2f75wRpZK0CUAAwKmBPZVojN4JJ2+/Tc44eZ8VMGTqxS4JojEGG
	wC/K8kR9d+2EMUUKMQdfsBYUoD2R70cfM4cGNpcqxBCRSm/Dx0tEpbRxmyOrIsEY+P
	SqMhR8xoRLZ6XBGu3ZIHYOYrsuiIHqN7vj8qUqG7D9vcKayrg5modRQrOWAD0UF6t4
	gLAICEPRDOmO99QUnyr28ObddkmQnkwBynpdQLCzRiJgr1dcy7RvKT5ikvM1G618O/
	mKXyoGYYSgMVzMWAQP7B4fHk=
Date: Sat, 14 Dec 2019 03:41:20 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20191214014120.GD8776@localhost>
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
	<20191213231042.GB8776@localhost>
	<CAJdd5GY4Ld9t1fo1sC2mK7nXuBCi=T39DwstZ5ZnTNFrEp226A@mail.gmail.com>
	<20191214012249.GC8776@localhost>
	<CAJdd5GZT3RcbPFBt7dEbt_c3HLBTiduh_AU8sCSKpNRgheMU+w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5GZT3RcbPFBt7dEbt_c3HLBTiduh_AU8sCSKpNRgheMU+w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa72-cortexa53: Add tune
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
X-List-Received-Date: Sat, 14 Dec 2019 01:41:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Dec 13, 2019 at 07:28:28PM -0600, Joshua Watt wrote:
> On Fri, Dec 13, 2019, 7:22 PM Adrian Bunk <bunk@stusta.de> wrote:
> 
> > On Fri, Dec 13, 2019 at 06:47:33PM -0600, Joshua Watt wrote:
> > > On Fri, Dec 13, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Fri, Dec 13, 2019 at 04:03:09PM -0600, Joshua Watt wrote:
> > > > > Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.  Rockchip
> > > > > RK3399
> > > > >...
> > > > > +TUNE_FEATURES_tune-cortexa72-cortexa53 =
> > "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
> > > > >...
> > > >
> > > > Looking at the gcc sources cortexa72-cortexa53 defaults to crc enabled,
> > > > so TUNE_FEATURES_tune-cortexa72-cortexa53 must contain crc.
> > >
> > > I think that's armv8.1-a, the cortex A72 is only armv8-a (at least
> > > AFAICT), so I think crc would still be an optional feature.
> > >...
> >
> > It is optional for armv8-a, but not for Cortex A53 or A72.
> >
> > What matters in practice is that gcc automatically enables it for
> > cortex-a72.cortex-a53, so the resulting code might not run on
> > armv8-a hardware without support for crc - things will break
> > if the tune features are not 100% aligned with whatever gcc
> > is doing.
> 
> I agree, but I can't find anywhere that says crc is enabled by default when
> the tune is cortexa72.cortexa53. Maybe I'm looking in the wrong location?

https://github.com/gcc-mirror/gcc/blob/master/gcc/config/arm/arm-cpus.in#L1278

> Thanks

cu
Adrian

