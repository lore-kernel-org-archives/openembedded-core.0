Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 79E7278F5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:44:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z16-v6so3669445wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 06:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mdPz884QvctzTNvfbYKsh4pNsuQRnTjHsTNKKAOfyic=;
	b=SYAfCjEBnT4c1ojQCaSo32Fw7Bco+H3rnm9UBfAuNSExrObRAsP54mE9jYqH71GdDi
	tY466SOyGxerlzHJWKePG6/J0FT9V+dw2hGrYYyXVVTwmYYYhkWnfysO1Pgt7eaA6v3n
	8UKjpEaXCRqaCfBwozc5CRwgYpF+Lj+26qfA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mdPz884QvctzTNvfbYKsh4pNsuQRnTjHsTNKKAOfyic=;
	b=G2ufiyOXCTBNpMphSoLsZTgEPhZujWgvRWt2/EJWxxXz6UYpK3k4WArNXkWSL9CrX0
	+7UHHYAoiVVE2JQO2y+JpNODi3TQSgI1cjIC5VepzjkQJRw36OfxB0Tk7JTBAamj1HcP
	AOJcAnfonFg0DsTwVvxI4pYL1aX5bbU6Ot/j5ObaxI0xYZxZTh/uK7emZdYwbAXOjIBY
	xIpHTosG570wD7aoKGCTq+Rk1O2fY9JaojmASzYi1cv07oZnNSx7YyOOscnisZROpDmd
	514oQDyAClJCzp9M7X+76Vc+via2hS6tTP56aTf2ywOJ/td69XDtO+SCUa2xSIq7ESdZ
	Vl+g==
X-Gm-Message-State: ABuFfogbp2aZpzck1kI0og6iyyv+CGuvhKJKwe8d/2J7zVxDtdhXv2sH
	EeyadVkhUsZ4UI4O5Ami90kLaA==
X-Google-Smtp-Source: ANB0Vdaps8xy6oL2ZvsDf0Mg1k+gxgPmWcG2bDKyYMQnvh55sQGe6Lar89t+S7Tlb8dPr5e6JhfMSg==
X-Received: by 2002:a1c:f11a:: with SMTP id
	p26-v6mr7358181wmh.92.1537796657082; 
	Mon, 24 Sep 2018 06:44:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n4-v6sm7766765wrr.21.2018.09.24.06.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Sep 2018 06:44:16 -0700 (PDT)
Message-ID: <aeea3a8ffd2dac5f295e4357a3058505546fa1dd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mikko.Rapeli@bmw.de
Date: Mon, 24 Sep 2018 14:44:14 +0100
In-Reply-To: <20180924134234.GK9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
	<20180924134234.GK9430@hiutale>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 13:44:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 13:42 +0000, Mikko.Rapeli@bmw.de wrote:
> On Mon, Sep 24, 2018 at 02:38:36PM +0100, richard.purdie@linuxfoundat
> ion.org wrote:
> > I was replying from the perspective of how this should work in
> > general.
> > I agree that for this to work with a kernel recipe we do need the
> > change that started this thread and that is probably a reasonable
> > thing
> > to do.
> 
> Good, then my patch is not going in the wrong direction.
> 
> Remaining problem is if file overwrites will be detected or not so
> that
> accidental overrides of files in linux-libc-headers from kernel
> recipes
> should not be possible...

That is a general problem and the core sstate code shouldn't let that
happen these days so I think that is already covered?

Cheers,

Richard

