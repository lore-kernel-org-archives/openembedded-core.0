Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9ADE061A35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:42:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t11so309249wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=k0WQtRSVbL+lB2I3AH0/HVevKNtjwvHmUjTeZb/IxLo=;
	b=LL/M4MN3q7OIbvsocTQmnQi6zcaARAHyJEBX4Yv7WqhIHWOBekGbm3zny+QpkCP/rV
	agFLNLTWjyp/HmGltTxW1TMnB4O7KtvDGrrsMUhYwEzn0v9eZ2tRFuQSoKl91o1rMHM1
	RLyzwAxnU6a/FE6KWopH4yMcV4v4fUipOXG7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=k0WQtRSVbL+lB2I3AH0/HVevKNtjwvHmUjTeZb/IxLo=;
	b=gT9vA8j8LtKjN0MSevFDwMUUsCdeI6i4O1RZgh7GbuDddHyYc+XVhz3Oe33jIuIuir
	LrbVCRimKgkLt9sm5ENytr4aiPlaZ9bmV1rACSKT1fzQwGVERLCSozHkWtqBjb5VE6KC
	MfiU5R2n8WgIe3LpUk8MlFa1B75HMNR4D0SZRIqgUUF91T9XNJC5W4zs5HKS4xp+Lhrb
	7UBBFYWrIsrYxk1tCbQ+ztLZeFF0LC2o6W3RZCojIj7fOAXTo2o9X7qW/l0ZTgsvnqtP
	1/UU5ZKOTvpolo29B7MYJTLceMdVLCf8URninhsxL95SWp0HEPa5NNG6uWCAO1DiqmFY
	nY3Q==
X-Gm-Message-State: APjAAAWTr+p79a5l21Td4tGQBaSr6MuqzQhjsRZQtFvleCt4bqw3GwDx
	81mIEbL5Og7MX70enLAFDEFTnw==
X-Google-Smtp-Source: APXvYqy7cqKZHUnXWgwXNBikNKgp34qQxjzfM1F9BBIXxs6Jq+NzwHzk/GVif9Masevk28rhrTT6Ig==
X-Received: by 2002:a05:6000:108c:: with SMTP id
	y12mr10731506wrw.366.1582983725090; 
	Sat, 29 Feb 2020 05:42:05 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m22sm6574532wmc.41.2020.02.29.05.42.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 05:42:04 -0800 (PST)
Message-ID: <da2bffd2ba22435a66a17044f922ab555d7a3ede.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Feb 2020 13:42:03 +0000
In-Reply-To: <4db943be8cba440551847721156d22f9664cca0a.camel@linuxfoundation.org>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
	<20200229064656.GA4045619@x230>
	<4db943be8cba440551847721156d22f9664cca0a.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 13:42:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 13:22 +0000, Richard Purdie wrote:
> On Sat, 2020-02-29 at 07:46 +0100, Petr Vorel wrote:
> > At least we know, that once we solve this problem, we can remove
> > 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> > 
> > Please, how to reproduce this build locally? Is it:
> > . oe-init-build-env
> > TCLIBC=musl bitbake ltp
> 
> Yes, that should be enough.
> 
> > Or do I need to put something into config files conf/local.conf
> > or conf/bblayers.conf ?
> > 
> > I need to double check if musl-fts is really built and whether the
> > order of
> > -lfts is correct. But all this has been solved even for static
> > build
> > for Buildroot,
> > so I guess it's some issue related to openembedded. Unfortunately,
> > I'm not much
> > experienced in openembedded (stepped in, because nobody else has
> > updated LTP
> > package yet).
> > 
> > Khem, any idea, what can be wrong?
> 
> FWIW I'll run a build here and see if I can spot anything but I'm
> trying to do other things today!

I was able to confirm that fts is in the recipe sysroot and that the
compile step is running "make -j 88 LIBC=musl LIBS=-lfts", i.e. its
being passed in to ltp. Beyond that I'm a little out my depth to know
how/why its not ending up where it should unfortunately. At least the
issue does appear to reproduce though...

Cheers,

Richard


