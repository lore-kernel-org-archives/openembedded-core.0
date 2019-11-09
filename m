Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B09CD7E31D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2019 22:05:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a15so10735098wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2019 14:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=6kZkvAoWPyEaeyq7sBPcym8p5LuBzTnv1mZBO2wAXTE=;
	b=afFcz69E85s8fOFVXrnLZCxnQf9iFG76Ebaj/7pnrmzX/DXgp9bHKeiMNpyA/qQDzc
	/QZgqEAz1yNyRzMrB9x15w3F5a3MmecfSC76kWdn1BF1eZV4zeXfdneajgez/nFKa32j
	h/3JSDeKiCHF4aFzOP4aOz1IyqcE/O6hovZ78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6kZkvAoWPyEaeyq7sBPcym8p5LuBzTnv1mZBO2wAXTE=;
	b=cCmOgmX6ZshK3nLgKlkvwRO8+ClLHMNsGZFiHD3EeHCb4yyCqS9x0AVy/ixwsDEnwm
	KMggkMScAST5WuIBJEX8Si4RAIG0/r2ZjH4YHS7cMIf89XRxNvWRkddGU2PBQNwmixUe
	0Bcgyj5nWV1fog7SoinAHJpN533Ip8dvGuRX4OZ+m9mtFNmAnAEdeYCdbAloeMO83EhV
	izNvz9Gg5+7bNlcKKCE1xiyLx9UkGxEQ41XLxpIasCCVIhjzhbwjvr1m+x+rPDzd0Ic0
	QG5LqwyW/pcMNo+druQLuEezCZ41LyxyugShcjKPTpRnG5Fa2OZStJ2U7h+OptThIJdz
	b/2g==
X-Gm-Message-State: APjAAAUjeOd58M6e3dPRWmGFllzhA2hkR/ISXuhWp5Bgj5cQFV86Y43h
	VBDimZussEC9wqx80eqSjpQlPQ==
X-Google-Smtp-Source: APXvYqwAlkHtQO8JpV+UAOMdTOSR+tpVCtfX7NjUFTjw3AW2/ZsJk+22nVbqdsGz34IS7EMie3wlFQ==
X-Received: by 2002:adf:9344:: with SMTP id 62mr15313371wro.262.1573337124091; 
	Sat, 09 Nov 2019 14:05:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a6sm7315392wrh.69.2019.11.09.14.05.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 09 Nov 2019 14:05:23 -0800 (PST)
Message-ID: <b3c2b3459bc731eb44ea7247d52f2a8179b443d9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>
Date: Sat, 09 Nov 2019 22:05:22 +0000
In-Reply-To: <20191109203026.GA8956@localhost>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
	<CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
	<20191108202438.GA21138@localhost>
	<023265d217840d956c5e54d12591d7cfdd0442b5.camel@linuxfoundation.org>
	<20191109203026.GA8956@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Sat, 09 Nov 2019 22:05:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-11-09 at 22:30 +0200, Adrian Bunk wrote:
> On Fri, Nov 08, 2019 at 11:07:04PM +0000, Richard Purdie wrote:
> > On Fri, 2019-11-08 at 22:24 +0200, Adrian Bunk wrote:
> > > Especially when looking at the arm64 situation I am wondering
> > > whether the best option might be to throw away the tunes mess and
> > > let
> > > the user write the compiler options directly.
> > 
> > OE once did that. I think anyone who lived through it would say
> > that
> > the current situation *is* an improvement over a free-for-all.
> > 
> > This is mainly as at least we're now consistent whereas before the
> > same
> > thing had different names in each BSP.
> 
> The BSPs should not invent names for anything, all a BSP should do
> would be to set some kind of
>   TARGET_CFLAGS += "-mcpu=cortex-a53+crc+crypto+sm4+nosimd"

What is the name of the package feed these binaries would go into?

> > I don't know what the answer is but I don't want to go back to
> > that!
> 
> As of gcc 9 there are for arm64[1]:
> 
> 6 -march= architecture levels (8.0 to 8.5)
> 35 -mtune= tune options
> 22 modifiers for -march= and -mtune=
> 3 different ABIs (aarch64, aarch64-ilp32, armv7)
> 
> Even ignoring the tunes you already have
>   6 * 2^22
> different architecture+modifier combinations.
> 
> Not all combinations are valid, but another can of worms are the
> definitions what is valid and what is default amd what gets
> indirectly
> enabled, e.g.
>   fp16fml
>     Enable FP16 fmla extension. This also enables FP16 extensions
> and 
>     floating-point instructions. This option is enabled by default
> for 
>     -march=armv8.4-a. Use of this option with architectures prior to 
>     Armv8.2-A is not supported.
> 
> It can be recursive:
>   Feature crypto implies aes, sha2, and simd, which implies fp. 
>   Conversely, nofp implies nosimd, which implies nocrypto, noaes and
> nosha2. 

I'd advocate that we add the combinations which people need and use.
The tune structure doesn't require every combination be there.

Cheers,

Richard




