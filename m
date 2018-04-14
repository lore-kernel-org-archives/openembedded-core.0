Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3C9745A7;
	Sat, 14 Apr 2018 21:48:14 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id v13so13973632iob.6;
	Sat, 14 Apr 2018 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5ZJcUfMv2+KCfqzzMrwJHD/KeSKQ5UU+wCh4dcVrqrs=;
	b=ak2ke6q9SaKReLdYK7n3DHCFN1V3CJYY8wsGHrXTNDp/xWT19gpu5PknTq9LbB7wbA
	N0KdFnbdxdDunjRl8e+AHZfW/JZjeKHSMcVWBZ4zA0rdt8LT3UgVbVVC7kAj1pBbeidp
	p13hmq/eeAHcgvjlcBl07UrHjhtls2SV1iKKvQ4NetlrPMbVdHyRBWUluLf4K7a0L7s9
	jSpsKsP0+aE19e1e1i/u1oARv9waEBBcOZs3DxUMm4+ZjuktBZwngnE49I/euhrS1zSH
	H9YCkil7rVuYnRa4IlWDsxRpdWniC4ZOikLXxIvHsw1T7OTJMom8dxDKH1xXPKzMSozc
	sDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5ZJcUfMv2+KCfqzzMrwJHD/KeSKQ5UU+wCh4dcVrqrs=;
	b=nCO73Z25aPUYMyxyHsJbFyvJgyH6x5gJTr396YLQ+/RWfq9ElA32xlYiBf0uZMyDpH
	OVCdElKhf4O9C9RfWqL4wF+gJg3NwNwBUuptMOEDvfyQvOan4pz/kpilPfnwobV3rbNn
	59M6pvkX8N69JQ+wZfQaHcBuaf0sSXm0SSDnTf7OCMNAIh9I1/r6BMlSsnby417iT03Q
	l5zGxAbnQObDY7AVlQ5lSfQCeGU2VHEKMhzA86x58UVhauETnAa4j8qw5e6c5J7dskcE
	oDedbGhMoSF36jKfIkNlAatwbXV1rBaNv2PWAEatxEaXzXrz51VPNuXSrfRJC1fQcG4s
	x/9Q==
X-Gm-Message-State: ALQs6tAXSe0iL9YJWFdjUWqqp4PZqDnFb+tIrNGrlqDDhaJniwhnYRvw
	kbIRaNkYRTt2dCJG0ODTuYQ=
X-Google-Smtp-Source: AIpwx4+MrznOystc0P1gElVePlkFzFiYqvzZVFbNyrhqwMNpd2nZFUc0/2iEeLGS4swMo6H/J6xZAQ==
X-Received: by 10.107.1.6 with SMTP id 6mr17698044iob.125.1523742495875;
	Sat, 14 Apr 2018 14:48:15 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	i12-v6sm2177581itb.7.2018.04.14.14.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Apr 2018 14:48:14 -0700 (PDT)
Date: Sat, 14 Apr 2018 17:48:12 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180414214812.GA25986@linux-uys3>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
	<a04373f5-cb03-25a3-36fa-da92b0cdd71d@gmail.com>
	<1523051813.2942.36.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1523051813.2942.36.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Alexander Kanavin <alexander.kanavin@intel.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] LAYERSERIES
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
X-List-Received-Date: Sat, 14 Apr 2018 21:48:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri 2018-04-06 @ 10:56:53 PM, Richard Purdie wrote:
> To be really clear, "master" is never a value that would appear in
> LAYERSERIES. That would let everyone be lazy and master would match
> everywhere, then this would all be pointless.

So what happens when the master branch of a BSP layer doesn't work with the
last release, but bitbake hasn't been updated with the next release's name?

I.e. the sumo branch of meta-bsp has

	LAYERSERIES_COMPAT_bsp = "sumo"

but what am I supposed to put as the value when meta-bsp's master branch
becomes incompatible with sumo? "master" is not allowed, and "thud" fails too.

At some point between one release and the next something might/will break. In
which case the only thing a BSP's master branch will work with is
openembedded-core's master.

