Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADE2A7F260
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:50:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y8so22369510wrn.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ubg8a1jwtHM3os3/+w0y8DaaCfNcpfFSACBUrWUZiHo=;
	b=OYs/vekelag4mKBstyFfwMx8xqpUIYJUDwBQNnlEpM1PxC+ElTn2Mji409LjO5fkou
	aNHeciShG3N6e9RKBJGfsSFbC8sOeBSMII+m1tP5JNB0VwNjqtrA/TAKWavW4CCZJA0l
	D1PM+yS00+uw/oVz4nnFj+WK95BdMnJAzGyIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ubg8a1jwtHM3os3/+w0y8DaaCfNcpfFSACBUrWUZiHo=;
	b=Lkgi/dUpSxFbU4sBVZjbuehyEpF2ki3IpN7tYQgWjonlZKiRKvY3iwQzRZMUQUXozG
	ZM7QsRKdz5sloR8F+cHkbeFT5e/flNSnTnPIkEwruhm1a9YagUoPLhqWmywhkfZROxrQ
	bUwJY/WxLkdrQ0XXR8n1WL06KFLWHr7I8LLz5kiwO42gVlkeZGnxGYf9WoBbCicWIiUi
	Z4WPO/aYU2/0fm+aDY6DLuzY52tLxHBOZ7D20qeOl0LYmjUKCZpaJslwmcBnYLwMNS58
	Ql7LO8BO89WCUYfzoDoinnvh1JgUVR9OCo06jTsZQPl9rgSRgDmLB5cYR2eNBsLN27tj
	yj7A==
X-Gm-Message-State: APjAAAXuD0ygI2MeSW/nFGsXdsUK5jFhK0LDDxYyW/R5oYuVGtjjHarU
	8ncrRlXIxMh3o+183+9oFK2tdg==
X-Google-Smtp-Source: APXvYqyvGyvnu4g9WCwov5jEb268rFhhrSUKfRleplObp1QuQuxm6r63XWtNuqIWQJfiy4bg0JHo0Q==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr34644278wrt.79.1567623037475; 
	Wed, 04 Sep 2019 11:50:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t25sm2840638wmj.29.2019.09.04.11.50.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 11:50:36 -0700 (PDT)
Message-ID: <0f8a4a800e70afe1eef8875571dbb50e1dc8f865.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>, Wes Lindauer
	<wesley.lindauer@gmail.com>
Date: Wed, 04 Sep 2019 19:50:35 +0100
In-Reply-To: <32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
	<20190827180449.GA29638@localhost>
	<5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
	<CALBQxSsXuM+926J=A=2R=X7xPSz4htuFk3pKrJ3Zpj1uK0AXDw@mail.gmail.com>
	<32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Wed, 04 Sep 2019 18:50:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-09-04 at 08:07 -0400, Mark Hatle wrote:
> On 9/3/19 1:59 PM, Wes Lindauer wrote:
> > Mark,
> > 
> > In reference to "It typically does NOT include the license of
> > things used to
> > build the software (such as makefiles, autoconf fragments, etc)".
> > Since the only file that is licensed under GPLv3 is a M4 macro,
> > does that mean
> > the current patch is still valid? Shouldn't the GPLv3 license be
> > removed from
> > this recipe?
> 
> Unless the M4 file is generating/injecting code into the build(very
> few I've
> seen do this), then I would say it's not under GPLv3 at all.  (And I
> wouldn't
> have included GPLv3 in the LICENSE statement.)
> 
> But we need more consensus then just me saying so.
> 
> This may be a good question for the OE-TSC to ensure that we have
> clarification
> on this issue, and it's not just me saying I think one way or
> another.

Not sure it needs to go to the TSC, we just need a patch which clearly
says why the LICENSE statement is incorrect. I don't think the original
patch in the series was clear about why GPLv3 didn't apply but if the
commit message is improved, its probably fine.

Cheers,

Richard


