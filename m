Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.13853.1594223488801376258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 08:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=KWfom1sC;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B23gx33CBz4b;
	Wed,  8 Jul 2020 17:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594223486;
	bh=B0eMDMIQhOFz2yJPnm7NxST50Bvhfb7NAZFXv4Z+Y0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWfom1sC9sCq1uVCF1vBHnvn5iB1Q+//h2/HgTSzBMcXpeTD+NDzj3mVh2CV65gou
	 NEIWfuUs0EmHSX6jxLVPotVYKhW9g3CU8YWDs1CTSRKRwE6Bctc7+T44OoZymq2U9h
	 gxfPIT7p5vyD8NxNjutjz/+fhKGooJFDB7wEDFiKjEZ0/s5gJjQDhy9u2M3cdX6HwF
	 RC8Myi7JFuZD8tQLTnfa430cEn5bQP2VGdNsGV7B0GwbvjV7vzcOfgWPgG7sfP1EW1
	 MzxEcdYA8MAviRtHoC6YEIBDgewtRkZNRWowax3GaPeAkWFlIm3Q3GFbB4RIn6V1oU
	 Ajylb3CNVa8+T123ftovicdNs9qcJ3a0+S528/Ecv9vVJVG/cDif0FimcO6/XwnEpb
	 8jKBw1EV0Z9Yv/lh6OI5AsFBAvY3t+ZV1YxgGWvsfeUYC+OO3f+e9LaAskEltbWnQ5
	 cokStxhsbzQzcma3RLXWgVic6I1YXZN5+OLa15dBaC28i5DRl6ZrGzOrC+kY1Vyrdj
	 h490HCmXeMKl1tEc1mOb+vE3DnrQ4P03NefaL3PHk7CqMialI5KAbSwCy9QzLmLMra
	 gzZCkVXDNRtRFaLkkKjFIVRE/5biupnXpG7X/NDuzKu3dyMECnJYSA50BXBSJLujvm
	 CCz/fw0zTYFffr4cDGyT+Jvo=
Date: Wed, 8 Jul 2020 18:51:23 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Christian Eggers <ceggers@arri.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Patches are stuck in master-next
Message-ID: <20200708155123.GE5419@localhost>
References: <5614347.lOV4Wx5bFT@n95hx1g2>
 <12184874.L5pGue1uWE@n95hx1g2>
 <20200708142003.GD5419@localhost>
 <18770938.c9i5bXPaRE@n95hx1g2>
 <4b2516f1c16b7eff3fbedf15083bfc7c06aaad36.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <4b2516f1c16b7eff3fbedf15083bfc7c06aaad36.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jul 08, 2020 at 04:35:21PM +0100, Richard Purdie wrote:
> On Wed, 2020-07-08 at 17:07 +0200, Christian Eggers wrote:
> > From Richard I got no response to the question whether
> > potentially every package may be extended for nativesdk/native,
> > or these platforms a reserved for packages required for "building".
> 
> There needs to be a sensible use case for extending them. It doesn't
> come for free and increases parse time for each extension added.

My biggest worry is a different one:

Native is built by the host compiler, and Yocto stable series aim at
supporting hosts with future distributions. Something like "building
dunfell on hosts with gcc 11" is easier when there are fewer recipes
that have to be patched.

> Cheers,
> 
> Richard

cu
Adrian
