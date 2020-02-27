Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9A43360C58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:27:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Stkr0tjnz4M;
	Thu, 27 Feb 2020 14:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582810052;
	bh=gqwAI/y3Fz4C/gsqxKFgI+QVPeHXH1hogsCw5mF3xKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a60Dcdn3JrZQwX7oQFeqRBwqlldqZGQkO7wFnuSNZ9S8ehq6mdDOdOhgJXncyhGX5
	TEY+Z3+yQ+y+L1CTuv/TYrZivUYkLgF1aRRAsP294XDqkdoAzgcBMJypB52Pnc9i0g
	8jUN3TTL5rCzFbts2Af3iMSWmK0DA4z7CCxt3v+Xf7j4DnjcLSoW1Rs/Kf+Gys6XZC
	qP0BJZEsRWxuqXmSZwkNfSitDjKWxbETvB1e4n/6hfvWucYZS1S54mUA2nEFpWTWeF
	F4/vVs5peyGGf2aY/u7lM07tg4f3dcwEsoYSY0oENP41ix407APPOT+vCRGcX35QkH
	8pkUNpA2sUNCN6i+L8GJQfbMJdYG8cLf3z1WZB0XTEsH4VoqVimoOvp2gP3gbs6XpM
	FTm0MJBfq0qh02s4NGmvmseidWKGzK97XVoMOq/Uj72p5cmRrcWKZ4cdwoHMbdtJpn
	Nah8vkOn8VZdQNxjyqKykoD+gRb+7ILpY8XZkEuKOTTHBzfJlHc4dPIQyyNdFcxMOW
	fneVnHeFHVDs3t3hdg6BtgJZdXbxeiLfG63iQOxhPa4HmKyOuyKC3YATnDW+k5eVdv
	wTF4GhSNE+/o7MeflGP5BB2AbuPwOAy8gXZyupr+i6CoIHY4CEX/5Gc4+UBG1RtqHV
	76LJ0vXAhwuC9SGhNIxiX2dA=
Date: Thu, 27 Feb 2020 15:27:29 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20200227132729.GA6240@localhost>
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] nss: Move to meta-oe
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
X-List-Received-Date: Thu, 27 Feb 2020 13:27:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Feb 24, 2020 at 08:32:24AM -0800, akuster808 wrote:
>...
> On 2/23/20 9:17 PM, Adrian Bunk wrote:
> > On Sun, Feb 23, 2020 at 04:25:18PM -0800, Khem Raj wrote:
> >> On Sun, Feb 23, 2020 at 11:34 AM Adrian Bunk <bunk@stusta.de> wrote:
> >>> rpm was the last user in OE-core.
> >> we should also assess external dependencies especially on libraries,
> >> there might be layers which do not depend on meta-oe but use nss
> >> or enable nss packageconfigs in core components like curl.
> >> ...
> > Is providing a crypto library in OE-core without providing security 
> > support better than not shipping it?
> >
> > nss in warrior seems to lack fixes for at least 5 CVEs.
> 
> I don't see how that is relevant to the RFC?
>...

It is a crypto library with a history of unfixed CVEs in supported 
stable Yocto releases.

> - armin

cu
Adrian

