Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id E6D926FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 22:10:07 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id g133so90810114ywb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 15:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lz1rAL4sIDVw8RUnD4gCv3yW7B8uX5g/KlVywsCJVX0=;
	b=LtYWcUsfee40TifJhdYOeyozptTQJ2GOi8nxyuN3bslIynXjrnB2jlEMyNe7/smng8
	0auXWTF+kKtdsEXNciT9kGLQo7P+k5R3Gri/MPkDw/ozhhjtHA5lsixshCB5e0BeSeVe
	KZOhFp1+Qv55mqwXojw6rRbEvbCQQwSeDGk4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lz1rAL4sIDVw8RUnD4gCv3yW7B8uX5g/KlVywsCJVX0=;
	b=gNGmh4V+TNgbs4NL+mnt71ms/8Wu62iq/YKPCQ/eb4cR+EQGJUfvJG/3bQMi63WMjJ
	wEL/cEUPGfxo2rSPF+zH9gTr3sU/6azUqiv4BBVEaApw567NxY33Y9TDo8YAvzJC3i+I
	Xs2Pmq6TlVhggFP56Xr9i48/s7HiMEhCgo7ubPSZRJQENGjrCXUtfvM0amiGyHDKQbmU
	sGjHgJWw3+uLikWe5qB7dZfNbWa1fS8rmspLPVXxu6QW9DTCf/H9g8V53h1KMC12QOH/
	5xz2dIBmBR0X85KHQyeauqJslzDvXyfn2DNh9OLVobaRy2HDT5WZEOPEdtAZWg0rSCwL
	SDKQ==
X-Gm-Message-State: AOPr4FUKRXzVMLxXvlkiMOGjfp7XGgKBss4kW3b1fsEhiHVhOkn0OISAOB4/ZgNX7XcK5g==
X-Received: by 10.13.221.142 with SMTP id g136mr7157947ywe.59.1461795008629;
	Wed, 27 Apr 2016 15:10:08 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:a8f1:8916:9925:ea71])
	by smtp.gmail.com with ESMTPSA id
	c196sm3073007ywb.24.2016.04.27.15.10.07
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 15:10:07 -0700 (PDT)
Date: Wed, 27 Apr 2016 18:10:05 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160427221005.GA19598@bill-the-cat>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Yocto Project <yocto@yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Wed, 27 Apr 2016 22:10:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2016 at 10:53:52AM -0700, Khem Raj wrote:
> thanks I think most of them come to these categories. So any help in
> fixing them is welcome.
> 
> 1. kernel older than 4.4, backport needed fixed into these branches or
> move to newer kernels.
> 2. uboot dont have gcc6 compiler header files, backport the needed fixes

9b2c282b348dfe966bbba967dc7a45ce817cce50 from mainline.

> 2. meta-qt4 needs to use gnu++98
> 3. gcc6 providing its own stdlib.h in libstdc++
> 4. gcc6 swtiching to gnu++14 for C++ as default.
> 5. GPLv2-only versions of recipes are simply old will need fixing
> 
> I will take a stab at fixing the nativesdk recipes which is mostly due
> to stdlib.h issue.

Please do, I'd like to see some SDKs so I can get more U-Boot testing
done with gcc-6 :)

-- 
Tom

