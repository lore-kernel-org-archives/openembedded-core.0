Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA3337C04D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 22:19:12 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a62so2723926wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 14:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Zja8iQu4aO5UtCRg7xFc/QdIARvNbymn+p3+fHC+mcU=;
	b=bENAKu0883Q55aa93rfHPdLQyflPOsfWOn95MCuUvBxpoJMOVrHaISssfqcwtdmFTj
	vbao7+NoPsbwdB1bLKpDINdrhKHLHvWQWWlEcg53o8TpqN7Vo7ugWJNIKJ9N08tQxIzK
	CbN7R9ywl4KYDysGLMkyM2QY64BeSiAd42p5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Zja8iQu4aO5UtCRg7xFc/QdIARvNbymn+p3+fHC+mcU=;
	b=bubD8dQHA7BymM6LxQhfXPfsl5rurHzz1V4zz2+JGKUmesscUu//1369HP2OUhy2Ij
	ROVJD4yV3yVYQUR+5VtT4o+qFk8f4mnq/z3Az+q0/f9Y8GcI8SuHDd3b6w2vIDZvGHQV
	CAb4KtEWy1YWMB6DLulEHO7Tm9FbolIwzBpSG/TYa9anK8zUqJCgJ+0uCtf1WKW61iyM
	OLsT0U+xI9waFirNZxWZSqUDVWi+qJSBNUNANY+AE7Hrttoj6tVIZaofGKS+IiBLNMnp
	tV3MOKbWdhLAe5M8Odk0b7se74EUrENLtFZDDtRvYf+0uam9MkSK0Em2DFklogJxFHSh
	+t+A==
X-Gm-Message-State: AJcUuke8wQRHyn+JzwKnbQt8BW7wE5rKd7qHD4Bj8oMlEXNaZx4j0bnX
	hhhKTlK/Xky+DYjs8fDtswzoqQ==
X-Google-Smtp-Source: ALg8bN5U92BBP6lb2pVFdEUyS5KQgw3aUQuOMaWZwnQCPJ9bemyVIdKsm82J/5+G/thFTUZGHFzwvg==
X-Received: by 2002:a1c:b53:: with SMTP id 80mr12621406wml.121.1547763553309; 
	Thu, 17 Jan 2019 14:19:13 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p5sm22506062wmh.16.2019.01.17.14.19.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Jan 2019 14:19:12 -0800 (PST)
Message-ID: <279b2108baf4002f4349ae1a8f9a0d5ace941ac3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dan Dedrick <dan.dedrick@gmail.com>, Kang Kai <Kai.Kang@windriver.com>
Date: Thu, 17 Jan 2019 22:19:11 +0000
In-Reply-To: <CAO-9+V9nXGn+2fgTcCsxKCD3_tBed6=gSm16ceK7ANs=T8egNA@mail.gmail.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
	<20180913182007.GA1437@jama> <20180913201046.GB1437@jama>
	<20180914112512.GA1369@jama> <20180914141236.GD1369@jama>
	<dabc02da-9972-8e06-6624-a567f8aefe48@windriver.com>
	<CAO-9+V9nXGn+2fgTcCsxKCD3_tBed6=gSm16ceK7ANs=T8egNA@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] allarch: only enable allarch when multilib is not used
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
X-List-Received-Date: Thu, 17 Jan 2019 22:19:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-17 at 11:10 -0500, Dan Dedrick wrote:
> I'm resurrecting this thread because this change negatively affects
> our use of multilib. The use case that this is fixing seems to be a a
> case that would be a better fit for multiconfig than it would
> multilib. My interpretation of the use cases of multilib and
> multiconfig is as follows and someone can correct me if this is
> wrong.

I think the problem here is there is no correct answer which will work
for everyone.

People don't expect that it would build openssl if you build lib32-curl 
and you could certainly get systems where only lib32-openssl was used
or desired.

I don't think its related to multiconfig, its just that people have
different expectations of multilib.

> Multilib allows images to be built that support multiple
> architectures on the same image. Specifically this use case is
> interesting for cases where some library or tool has to be 32-bit
> (for whatever reason might apply) but the rest of the image is 64-
> bit. For example we have a 32-bit library from a third party vendor
> and that vendor won't provide us with a 64-bit version. So we want
> the majority of our system to be 64-bit but need multilib to support
> the subset of our image that needs to be 32-bit. The result is that
> some portion of our image has to be 32-bit but whenever possible we'd
> like to be using the 64-bit packages to reduce duplicating packages
> between 32 and 64 bit.

For your usecase I can see the justification. The fact remains we had
users complaining about this behaviour too though.

> Multiconfig allows for multiple configs and seems well suited to
> cases where there are separate images for each config. So you could
> have a 32-bit image from one config and a 64-bit image from another
> config. If no image cross-contamination is required, as seems to be
> the intent of the request here, then multiconfig can ensure that
> while not reducing the usefulness of allarch. The original scenario
> seemed to follow this pattern where there is a lib32-core-image-sato
> and a core-image-sato.
> 
> In our multilib case we want the behavior from before this change. So
> in the specific use case of 'lib32-curl -> ca-certificate -> openssl'
> we actually want this. The reason behind this being the desired
> behavior is that the main architecture would certainly already
> require openssl so adding the 32-bit version would cause duplication
> and therefore increase our images size unnecessarily. In the past we
> had actually found that installing some duplicate things that
> overlapped like "/usr/bin/openssl" would cause racey behavior where
> sometimes we got the 32-bit version and others we got the 64-bit
> version.
> 
> Additionally the removal of allarch from all multilib builds also
> seem like a poor choice as multilib builds now lose all of the
> benefits that are generally available from allarch.

I never liked that side of this either, however, generically fixing the
problems reported was effectively "impossible" any other way as far as
I could see.

For your use case it should be possible to "coerce" the lib32-X allarch
recipes to prefer the "normal" architecture and get the old behaviour
back? The main cost would be buildtime of two sets of allarch recipes
but that in the scheme of things should be small...

Its a difficult situation which I can see both sides of.

Cheers,

Richard



