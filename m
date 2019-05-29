Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E6B0F7E2B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 10:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45DRm03zksz5l;
	Wed, 29 May 2019 12:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559125776;
	bh=v1yxaxBx80kz9Mb3N/kPlJBdoHzwOk0XqFl8Z5SiLP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PA4Q94OnsNFKgUW32JfMlqdToMn02IY3NRRp3OSkfe92kn8uL98Mk1wtb7N9DgLcn
	p7OIFfYyFxp61Il/8aDXDAlH+yPRByOixKFWtkBVmZAVNvHZHZzn0XtwXjJjfFYU02
	tuAEOoW2qhO2eNYp2TttPlskzUxp/Wat3mRNbXa/+DNHpa22CT+XjE7z0xgJS8T7ZE
	D4JhBD/hyObQZcwCbm/aB+XSSPuBf3GfTEYgl4FNiojrwviJu7x2JtFy4V30YkgIjq
	GUwsvNy0JExy9o54PLJFPG1em9butXvEi8LGgqJDBsDArmBCGuGNZBm3JtHY4oLAav
	70sGR+gQuwyDIPCtaSacz4v1BvqzHMcav3QJovXVgjoj2kFRQNmroYcKVyhD+x832N
	DjaCmPuPhP6OBbOUiaoAxORU6htyHGVxt4TS94cDeBo4Kt9D7GrrsNYMwDNwxLouZS
	DpsTNwUqYDWCdFhIbusyYtxBQJIwxYE75HRdaaxDovLmHIiWJ6R7VsrlbMSLfqTXKg
	zSgJFtNUUuTsUxHc6A680YQot3u6S4VsXIatlMoEvjSoIlCswoVzn9B9S6h4NkMEhv
	qRyTzrDfn5LkwyQeywd+UweVCQkuHIX65Cm9Up7IIFu4iusuamOBLaI0UmSflEiV7g
	AlmVww9muxNOpMqwVaaOX9lM=
Date: Wed, 29 May 2019 13:29:34 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190529102934.GA13958@localhost>
References: <20190524175859.GB6813@localhost>
	<CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
	<20190524184546.GA12358@localhost>
	<CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
	<20190524202842.GB12358@localhost>
	<CAJ86T=XoVzv5yLq1Hkoy2mXVDAA0rY-h8WboP4OmimLrJwJK0w@mail.gmail.com>
	<20190525072547.GC12358@localhost>
	<CAJ86T=X9grKeXkZMBL0zh6TeTRoyxg_TL3D=ADYvnH_L-6s3nw@mail.gmail.com>
	<20190529073101.GB23804@localhost>
	<CAMKF1sp8tzV=5y8p=s4A0gwH4NpaW7MDF-Gbbon-QrUJrbgChw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp8tzV=5y8p=s4A0gwH4NpaW7MDF-Gbbon-QrUJrbgChw@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 May 2019 10:29:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 29, 2019 at 11:01:51AM +0200, Khem Raj wrote:
> On Wed, May 29, 2019 at 9:31 AM Adrian Bunk <bunk@stusta.de> wrote:
>...
> > And all these compile errors with musl due to header order are a real WTF,
> > every other library (not limited to C libraries) is now doing headers
> > properly so that any order works. No fun in supporting a broken design.
> 
> I think these are concerns you must raise in musl community, OE is
> downstream where we can experiment but not fix these problems, thy
> should
> be fixed in repsective upstreams as much as possible
> upsttream might have answers or might benefit from this feedback

This doesn't work when the root cause is an intentional design decision
by upstream, and everyone bringing up such a topic again will just be
considered annoying.

Just like asking musl upstream for a __MUSL__ define would not be 
successful, but would be required e.g. for making the musl patch
in webkitgtk upstreamable.

>...
> > > A few pragmatic patches applied by OE would go a long way to bridging
> > > the conflicting goals of the two upstream projects. It's basically the
> > > approach we've taken already - the question is just one of improving
> > > the patches we already have (and maybe patching musl to add missing
> > > functionality instead of only trying to patch systemd to not depend on
> > > it).
> >
> > I already tried patching musl in OE.
> > The change got reverted.
> 
> Its costly to change fundamental APIs in libc which are not accepted
> upstream, especially in libc which will
> go into SDKs and will become default API set solely provided by
> OE thats a huge cost in time.

A macro in a header does not change the ABI or fundamental APIs.

> I suggested
> you to submit the patch upstream musl, I still encourage you to do so.
>...

This was a dead end - musl upstream thinks that software shouldn't  
be doing "loop on EINTR".

At that point the only realistic options are to either patch 
TEMP_FAILURE_RETRY once into musl, or to patch it into all
current and future users.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


