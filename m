Return-Path: <daniel.thompson@linaro.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 368CE7D589
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 14:36:08 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t17so25454743wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NGI35KAmcxuPSVqAzV2nMN2JxVGh3v96Ke7fuvIgdfM=;
	b=bRnAgWDisuyyaj8RUnYN0LdhhxZ0XCmzHNaNeIZHXP8/CMOoOYicIrI6qlcXm5uG+Z
	0gej8RrYCBLFcVxGQOmSJRQZhx66gRzILLSnxNgw+A0wL9HXk66pHBP4Ba1VSKWilXNs
	CBW7fksxW4ohzBYy0ju3eqUIDuvkzinBW42ohqg2ANEWWRwXkqV5SB0wcxenUPKTu/s6
	tO5SBfidWg0CsmGkHY5hk2IWangJjwmmzCwwenNJml3sSINc5BQ1MpRfsYxcrCRtEQHk
	3CpMoAjCHsLj62XgCg/9KRsaPgMXDw/xbusvurp0VyiRLHocEtDjhhlDsH+XeJHdNtHP
	3SUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NGI35KAmcxuPSVqAzV2nMN2JxVGh3v96Ke7fuvIgdfM=;
	b=Rm7PSFsUosDev6p1rgLfKJo8Dm+C6w8n6dJO1su1PPdv0gjRUXFX/6fM2ztYZD0Fgz
	y+A1Ob/kE7o6vVtjjBEwhMr1Fd5Xl7UlNoJ4dQb6AiuuHhhLfmzSxpnBwqWH/1sOZExi
	sohN0K0AoySdJz6AYyDIN5NcCDlwaDMdzSw3ibW71VU8AYN/Sk55VgNrgVZIo/IsG2qw
	9o6q6Xj0XeSnJ8ze0hhCRITmOjKaEvKZftQ/apWD8SrgvCmv7rDCH323VwCOkCkQk8ue
	mdRnd0jQJKVG6K1owqDdfcT9M5acQ+K5dFDjd7NnPYlrmJoZ6iVAUZEj9tHmsaaLcxJD
	LFaA==
X-Gm-Message-State: APjAAAXdJJrRe48pvSazOG3OvFVYJxNF/viSSCq9DRtrn5NLX9+3Rcw0
	0TDnX7O6NGvm1uJF7mG9K9A8xK5QL9sdnw==
X-Google-Smtp-Source: APXvYqwTMTX6miw5WU/5Aplrx6y9YqEDuKldSZF6wqtde0IXuX79Y1DzpQf9L/vyrpNCRCJfAjtIeQ==
X-Received: by 2002:adf:f14e:: with SMTP id y14mr5302409wro.276.1556116568786; 
	Wed, 24 Apr 2019 07:36:08 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
	[86.9.19.6]) by smtp.gmail.com with ESMTPSA id
	i17sm17952842wrs.44.2019.04.24.07.36.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 07:36:07 -0700 (PDT)
Date: Wed, 24 Apr 2019 15:36:06 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190424143606.gwjtirpnvjh63rko@holly.lan>
References: <20190412123046.17510-1-daniel.thompson@linaro.org>
	<20190412194507.GB19080@localhost>
MIME-Version: 1.0
In-Reply-To: <20190412194507.GB19080@localhost>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] go: Allow bootstrapping using host go compiler
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
X-List-Received-Date: Wed, 24 Apr 2019 14:36:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 12, 2019 at 10:45:07PM +0300, Adrian Bunk wrote:
> On Fri, Apr 12, 2019 at 01:30:46PM +0100, Daniel Thompson wrote:
> > Currently go-native bootstraps without any dependency on the host go
> > compiler by building go-1.4 (the last version written in C) and using
> > that to build a more recent version of go. This does not work on host
> > architectures, such as arm64, that are not supported by go-1.4. To
> > support these host architectures we must rely on an existing host go
> > compiler and use that to build go-native instead.
> >...
> 
> Why is this the only option for you?

Good point. Not the most accurate use of "must"... more "these
changes".

 
> The clean way to bootstrap go would be by building gccgo and using that 
> as starting point for the bootstrap.
> 
> Haven't tried how trivial or difficult it is to make that work,
> but it sounds more long-term maintainable than having different
> problems depending on what architecture and host distribution
> is used - it doesn't sound like a good idea to have to test
> and maintain all combinations, e.g. whether Go 1.6 on arm64
> in Ubuntu 16.04 manages to bootstrap the latest Go.

Source wise it should work (depending on your level of belief in the go
compatibility promise) since the go compiler is written in go-1.4 but I
agree that code generation bugs in old versions of go tools could make
things less predictable.

I'm suddenly a bit swamped so it could me a long time to look at but
using gccgo to bootstrap is not structurally much more complex than
bootstrapping with go-1.4 and certainly could be more flexible. Sounds
like "the right thing to do" so definitely worth a shot.


Thanks


Daniel.


> -- 
> 
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
> 

