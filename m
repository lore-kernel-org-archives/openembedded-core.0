Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 979646013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 15:47:30 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so74586348igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tXYNHFCtC3ksNJZ69K7mEg8gUZ5vDmaeCbnRb2ACGXE=;
	b=gWAMv0UdZZ0WmEO2CnM9yx3icnSJFtGp5PZS2uKR/rSi0SPet7sCXNwzDTbqMwtwcP
	1vI1MoJ07e7O9rNQmLbwstHhTUmgFwGmd7l1fbbePo8cSe6832Vyc1fmSJZ+cWxEsijY
	j5JPv4qvwgxCiQ4oFZfzy34ZKIfGemWtmk8gEiDTBEzSEmbNfd9qHrxaUlrDaWdhTB9W
	PyRjtWI4ZZnlmIQJhiFjMk4TyhVvS/WMqYKlL5092cT8SFNRSzgPZdF9QpP9FElBrlqG
	vs71082sN2R5Nxj+dHAIYP7KJzLu0Ho/kJTM2HaD0f5Jaf8YEsLbu1fJYp3IvmsGJWY3
	bR9A==
X-Received: by 10.42.164.7 with SMTP id e7mr11386388icy.70.1431359252110; Mon,
	11 May 2015 08:47:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 08:47:01 -0700 (PDT)
In-Reply-To: <1431295383.30971.25.camel@linuxfoundation.org>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2015 08:47:01 -0700
Message-ID: <CAMKF1sriNnycqHYmhayqaGs2pD8mKAzrd5YLBVrZei4cYW7TNQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Mon, 11 May 2015 15:47:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 10, 2015 at 3:03 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I like the idea of a common include to handle this a lot better.
>
> FWIW, I tried gcc 5 on the autobuilder. The results were 141 failures so
> far:
>
> http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150
>

linux-yocto 3.14 needs to backport
https://patchwork.ozlabs.org/patch/403787/ for all relvant branches

For some ppc recipes failing with undefined .LCx smbols we need to not use -O2
mips64 is new havent tried and tested those yet

> Cheers,
>
> Richard

