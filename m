Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC7378875
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:23:12 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id k81-v6so16191316oib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bzTRjdjLrqUsI0OBnY90OBhQ2aSuksifP4V+tDCD1As=;
	b=PnernZzCkrlxrPFl8PhxijwfOJCRRSoC5vakhHgQ0epJf1L22gfbUwZQbWgsUn4S8p
	YrLss4aNBbrwVWLm7+NmUfTne4nUQqxTSaEc6wnmy00+dcdCwbtdBV9MSLo6Arwkj/mR
	UU68lW8uymmZg+yLsqCxq7xhbnpxx1FrGVyr/1zPnlYlItCxNfSeEZ7kHXu+wo+dhFZN
	n2HPPsc+P7lVyMfdTV4pJw0iH1Qo03f7e9/x5ShHD+Th1b0u4qVmB98ZCKyvzlwKavu7
	cweHVtKMszXOknPA/O6rXoTbEQAj3WKMkl/8zk/+5vcRP79JjdsPSEc8jb80RcQBY/7B
	HnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bzTRjdjLrqUsI0OBnY90OBhQ2aSuksifP4V+tDCD1As=;
	b=ArG1mG+JlBZwlW1DzbBXh0PB87F9UWuhmZMVPrTLRaWvQh3eNmb+5fklwhB4wlykjQ
	tqV3hZbg+6Vd6Kuy1SsrfHU0h9e2GIAd7K3fh8w3WO1HEwVY1uqAe4WP1egwu6F250rD
	SuVicqEJnOIgD2FBYkzoJgZHSXPq4Nz8pTEw+0yoQmVV4yOgGOR2CPy1g5qs3mSY1VNL
	JeVgPIToCPS7JgkdybCtGMhZLz88wmzw0P7bDgdKdGSxfRT49SDFt7WE8BWlljf8i594
	N8FzsZnefo/4xfFBp39G6nuRqEKS+9cC+2BMC2boylYIIKL/5l+UaUfXlZH5KQvQweYq
	yp6w==
X-Gm-Message-State: AOUpUlGu3jgrpp++SxhtPBmNFKwezW5uRm/P+VVw8CUaUQEVVS/3gFlS
	VA2jkl6b8WHr4X3Fn+Mhwfe1qE0HoKCE2bGe/TB0jg==
X-Google-Smtp-Source: AAOMgpdzpc14ifw20LzuhQyzidEdqmDpQIMJk7xUA09fdYJhnaNCPpccFavxSfsFoLeSlVByzmP4gBAoYtVUWpodBHU=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr5328785oia.18.1532550191994; 
	Wed, 25 Jul 2018 13:23:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 13:22:51
	-0700 (PDT)
In-Reply-To: <CAMKF1soP0u3xLKb=tjxNrojvQQ2PFx3O6N-aS_W4huuzJBMiFQ@mail.gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
	<20180721162715.12611-3-raj.khem@gmail.com>
	<CAJTo0LbU0UhP6OzHJwJQBcFXw+y3+9f+1BxFiQX3FCbotxOtFQ@mail.gmail.com>
	<CAMKF1soP0u3xLKb=tjxNrojvQQ2PFx3O6N-aS_W4huuzJBMiFQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 21:22:51 +0100
Message-ID: <CAJTo0LYt4MHCf1eUj3xB_B9E6TUZ2FP1kWH7N4gWZEzdzjEinw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libsdl2: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Wed, 25 Jul 2018 20:23:12 -0000
Content-Type: text/plain; charset="UTF-8"

On 25 July 2018 at 21:18, Khem Raj <raj.khem@gmail.com> wrote:
> while I agree its due to a different behavior from pkgconf, the
> solution is not relying on pkgconfig features
> in itself is an improvement IMO unless you say its regressing builds
> when not using pkgconfig

This is a behavioural change between the two and personally I don't
consider this a bug in pkgconfig, so pkgconf should do the same.

Also it turns out that you can override variable lookups with
environment variables in pkgconfig (see
https://git.dereferenced.org/pkgconf/pkgconf/issues/2) so when pkgconf
does this we can override the lookups without needing any patches.

Ross

