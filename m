Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7FB7F275
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 21:58:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JfkX15S9zSK;
	Wed, 28 Aug 2019 23:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567029492;
	bh=f3exIu+9/ydqIaxMih/NZm7plFvkCG3e9eHwbJ/8gpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6jFyC0y69CLhADZX3sAfRmYDx0bb4w5+wO40panwoT5NjSfhZ2uOzSDcmcRzbQO/
	2i08cDLuFFSwOaZdqJWKDEFD6O6UqEKaLgEZSxa8webfm/Dc7A5x1Sf/EtZcO1IzSX
	oHQpg8NTAccS44m6l/CtgKLjhMwu0RXVv+xPfrFWJJ3L4aqDEECf9yOnzPsIpxtleB
	0oVBlONjrEcFoOI/dmlYpGBqmA2WWa0C8KcwBtihJe+tcHu7tUcYGhEc68Uds0E6oZ
	z4Mnxpr1avMooupSJb7fdUY82egOSiAfGQc0pm4fYnnJlvE7RhsGye5L0kcefVbqEh
	eWVakleN6EJbAltgU+SDclEtj6hL5d6SKQVJ146fqSFvFgGBmf/ZKnVmbZ5lEbdpxm
	FVaOtVaqGsvphhSLEcxhlkjofIWMjbBXQ5nqF226UQGlNqztPOTyE3QtPrfme/tWPf
	DbT826Dyj9FE6NujFcKfoImCnEOp2cPjIni4uBTm0l62ZpCS2iTD5L3Tl5751zdZGc
	5qLgBtdL52LlImhk6+EPUZvATX+I8p7SewY3NeJXWfmw4q3tiShK2qaJlEPVV9u9+R
	RyuDraXNsq48B/fYE3QFXFlRPfRKKr3xOfF6KF4j12FuqRUnFtiu7Zwmk8+ZMWWgLM
	0TJ3g4eR3C1Iwapzi9Dy8T9o=
Date: Thu, 29 Aug 2019 00:58:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20190828215810.GF3044@localhost>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
	<CADkTA4MBTDFUam5xvwvc0KKO+fX7ZfmBYtoe6_ZdrnspJok7Rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MBTDFUam5xvwvc0KKO+fX7ZfmBYtoe6_ZdrnspJok7Rw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Wed, 28 Aug 2019 21:58:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 28, 2019 at 04:11:43PM -0400, Bruce Ashfield wrote:
>...
> There's zero risk to these, and no reason to sit on them.

What range of LTS kernels is covered by the "zero risk"?

> Bruce

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


