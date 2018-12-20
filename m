Return-Path: <ross.burton@intel.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id 58E6C601F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 12:37:46 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id v5so1217883lfe.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 04:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ezDvfohJ+UmdYbHYqPFQ3l4AE8T7JccBAedtOyE3AmA=;
	b=1227hNN8D4ulNTFAU8jR6zrE3x2KKRA0/ug4crc2YBtN8hqWpaXKDWRs+nIc8qytYu
	Zz6wlLty6BswgAqYdYzMGjSzHw8A0WxyyqngEVv8I/qsIQUACpJDfpbFk5g9n9JGyQ6E
	SoUD2WGUgZ4KZTsH2elNy/uhCW0NSdiLf4dnwFntoBr3AdZW60fd3V2YUn94zOfjmjC5
	p8V90Ai69Nk4vOcFXWhZ4dNPdmBcEIXKVtt6DIcXTweeZ9CKqkJFjS2H7+xb/ZvfmE2r
	W++kayuzPfzrdA3tg4YtzQeamWxemMW0supD5PE+4GExdy68iSKmCbkd8EAFB24zlL8d
	2u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ezDvfohJ+UmdYbHYqPFQ3l4AE8T7JccBAedtOyE3AmA=;
	b=WeJkEgGuJ4PzYKZJqHk6UQVBPTSXruK2DgxYLTBjuv5n5PN7UtJY5XV6MreAwM7r5h
	xCA4VAu8dYOaK7KICAgTBxPouWpPT4TcfbNHBx+uR01gF3e5PVF4BZoC1G0Kzk/gOhHc
	q+OkuK3EvAcvswlxuT5EToOziQ65TAA8rhAV3M2SJXxOSrrOAvpTbxq4MJTZFYiipo7U
	bPdfDgGJ2wyG/A7yzsVx/fuMI1tKN6F8NHFxbfC8Wy9MI4P0t8R6cjWrEjd8n+ebGKnS
	MWWAcdbTyb0s6TCKvLJJKtrRq5RuAq2DXYQgIOZjW1jpmjBBRYawduZVX+wskSq/viTz
	SwOw==
X-Gm-Message-State: AA+aEWZWmOiritOVV9uZnWplhzxUf/ACN6Dik/Jv6iMdHwa3ooFhrftV
	mgggVNfYxRuDr3jW68yukjANPBGr3oXAhdGo6t6APw==
X-Google-Smtp-Source: AFSGD/Ux3C7JLSFRZW4dqZpi99l6widquQDxHnuFCwpSVcw6pZi/tUljAbf1FKOHXN/MJfmpqmuQQhdTIo2Mfek5Jok=
X-Received: by 2002:a19:22c2:: with SMTP id i185mr16183461lfi.2.1545309466896; 
	Thu, 20 Dec 2018 04:37:46 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
	<CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
	<CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
In-Reply-To: <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 12:37:33 +0000
Message-ID: <CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Bradley Bishop <bradleyb@fuzziesquirrel.com>, james.feist@linux.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Thu, 20 Dec 2018 12:37:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 01:20, Khem Raj <raj.khem@gmail.com> wrote:
> > That however leads to the question of should we just change the
> > defaults? Does anything break if we use gcc-ar instead of ar?
>
> Dont think that is a good idea in general since gcc-ar is a wrapper
> around normal ar
> passing --plugin=/path/to/lto/plugin/so and that may not be right
> thing to do always.

Well, I built core-image-sato core-image-weston with AR=gcc-ar
RANLIB=gcc-ranlib globally and it worked fine.

As we build the cross gcc we know what is in it.  Other toolchains be
they clang, ICC, or external GCCs, can override AR just like they do
the other variables.

Ross

