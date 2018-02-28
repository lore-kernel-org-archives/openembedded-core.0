Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 00EE778890
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:43:00 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id q24so3440174ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 06:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5/kblKOIvjuBqpW6okbB6YHCk/zKy5JTsBk/P6wXvbU=;
	b=XdJyLRtqfKQ12Fr9PhNIZ6lxScn9rwVD/gineccWqLeK/9nNxpFzuFhYcH88XUq5CG
	UAnjd9ZFl9VhNQRw+khPIVDxBaMIaZ5XcN0JPl0w6v0wKuRh7sGqRkRMda7s5KMZOib0
	D3Q+AIAgQyA03cyhgCMyo2C5S6kyVt4xgqYjAc9gklQaCjLYXxEYzpJUir6NNFqwWCdP
	g3Pks1AzlSLCGIvXuWwkHJmsV5KuV2Y+3OaJ+3LkgdOlqZzMN8kHeQ7yiT/+4zafO+Tz
	qukbV5tbUmH5v50qRB3UbBRQU7uTTYTV6GMPr3WOiTZ558/UJZZ8HtCGZ2UpjGyfP7gA
	CPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5/kblKOIvjuBqpW6okbB6YHCk/zKy5JTsBk/P6wXvbU=;
	b=dZIBQeBrRtNt836A4EHPdCPZ/FS/aEwBs1I1Jo58XYf2IaPvGgGGnHDRXJrNHKvcOW
	TeydWF34xzlQu9y5bLhzXEytBWx+V6a0SxaNzdyW/p4J8/BaMblbsO7+r1TPc29a3b52
	bFxNKG2p8RvPYNZCINGEr6yTG5I2dW3ztq4Y+gOt7fi+yV2851v4eQKG/j9tuDRVvcDu
	FcKQseOxKSFptVPxuwDz3w5jMWTwFu+r8nU3QWZBlMk+t/aX/Wum5vgZV9XUeOdlBmci
	wK+UjmrrC64guWvSKJHJLiop50EoGtCJDUDQR+WuUx4XPlgbjRqPtmla1XtoNAbJMj7b
	pg7g==
X-Gm-Message-State: APf1xPDHMLaebZyqgOQ0a2mV7L0HC39qtnHOTD/Ggft39gJ1UMg8NRyi
	5vQguGJ022BjSB7urcBKRp0=
X-Google-Smtp-Source: AG47ELsCWy23+15Or63KYF9VmSfDiHxVYzUavR+VkySjd5quoq7OMtmRQsmpkzdW6e+gDWzzcAF9+g==
X-Received: by 10.107.59.77 with SMTP id i74mr20292135ioa.110.1519828982240;
	Wed, 28 Feb 2018 06:43:02 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	h63sm1757619ith.32.2018.02.28.06.43.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 06:43:01 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1519828981.2806.95.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 08:43:01 -0600
In-Reply-To: <1519827267.3436.9.camel@linuxfoundation.org>
References: <20180227224753.30881-1-JPEWhacker@gmail.com>
	<1519827267.3436.9.camel@linuxfoundation.org>
X-Mailer: Evolution 3.26.5 (3.26.5-1.fc27) 
Mime-Version: 1.0
Subject: Re: [RFC 0/3] Add wildcards to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Wed, 28 Feb 2018 14:43:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-02-28 at 14:14 +0000, Richard Purdie wrote:
> On Tue, 2018-02-27 at 16:47 -0600, Joshua Watt wrote:
> > Wildcard support in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS allows the
> > native
> > tools that were in a hardcoded list to be specified in layer.conf
> > with
> > the other exclusions.
> 
> I was always reluctant to add wildcard support to this but it does
> make
> sense. It worked out ok in the testing I gave it. As we're at feature
> freeze, this would have to go in ASAP.

I was more worried about http://lists.openembedded.org/pipermail/openem
bedded-core/2018-February/147901.html, which looked like it already
landed in master-next (886ffabca). I have no problem waiting for the
next development cycle on this, unless someone *really* wants it.

> 
> Cheers,
> 
> Richard

