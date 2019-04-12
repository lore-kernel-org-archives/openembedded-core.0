Return-Path: <daniel.thompson@linaro.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF787DC9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 13:16:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g3so11877394wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 06:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oh5S9RyP9RtMtr0NPqLA74eENKJjr7CDo9sujp1YTeM=;
	b=DXgDY8H2xYRWVrgXSchuzFyglLIoA0T9hmuadTh/iYZudN9QoTtyxjfmoA8Xe0eaU/
	GhO5wVrO8FMSFC4/BfciBBR7QhVUGhvZkXmYupRoWB+4FBYDLrhRLupwwEdf6wJA9DGk
	nfG2fV4BbbvHsLHn0VlLC6QDa1hKZw0iJahd5hoY98RU2drYpUoxqzodyuNHmj5aB95b
	CBN1n3yfRTccxsw1dJQqOkPuDkrt/SmYLxgLWSA7Goim2LqBEJSC3gz5OMNA7qvaBHd3
	z74TCBNfMo4W4YSgLuUu8pTB1qqTrdjOlYQiw5NiFG0v81sWnd8EDzaZxYeD4RK5Rwet
	dRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oh5S9RyP9RtMtr0NPqLA74eENKJjr7CDo9sujp1YTeM=;
	b=mWZ5UeIco1SSFfpZXuN11vqL4dMWd/hjXUcdl/5xpBRypl6QQMoXVwfELxwoFkrXlc
	oSaMqUSb5T0FUZClABrLBttrHSd8aTRwkW1yAUKxWfR3VXNR4UXg0ADhiiBGkxg2Yl/O
	/+Gjj7obaMr1s4hCUqPI98f04U8/PJ7Ju/1zIrbWGaoFV4pnxsV+D4oWA+hxrFWx7UlG
	nOQaoMAveTp9fNPkdn+z8zpX8R91HPE/z6w9xE4RXAdksxRn1dnbS9s/AHBa8wtvUJ5V
	67C535X0HJUvHMZoWUVxZnQiFn5VxNV/b68obnCPh+FsjUl5GFNcSk3ls8YpswLi++0w
	nmrg==
X-Gm-Message-State: APjAAAU9zOyqV0Ey49y91H1b42d3DBObL7aO4xUMg9BtaTtlDEaqqLO2
	8PyzWIkUzv/svJZZ45QTcr6ZZKbAyypU9Q==
X-Google-Smtp-Source: APXvYqyVflXzCCYkvrHRrY+rGrMJgYYNp/f1fbhY6MW9w+DM9hbnHt2Iar8CQlh4TBKpp0h8526vYA==
X-Received: by 2002:adf:fc51:: with SMTP id e17mr36843481wrs.243.1555074978683;
	Fri, 12 Apr 2019 06:16:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
	[86.9.19.6]) by smtp.gmail.com with ESMTPSA id
	z140sm20529066wmc.27.2019.04.12.06.16.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Apr 2019 06:16:17 -0700 (PDT)
Date: Fri, 12 Apr 2019 14:16:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190412131616.2mwd5qefxrvlxaw3@holly.lan>
References: <20190412123046.17510-1-daniel.thompson@linaro.org>
	<5b21542499899b2465a2b1f581faba726351e58d.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <5b21542499899b2465a2b1f581faba726351e58d.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 12 Apr 2019 13:16:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 12, 2019 at 01:39:52PM +0100, Richard Purdie wrote:
> On Fri, 2019-04-12 at 13:30 +0100, Daniel Thompson wrote:
> > Currently go-native bootstraps without any dependency on the host go
> > compiler by building go-1.4 (the last version written in C) and using
> > that to build a more recent version of go. This does not work on host
> > architectures, such as arm64, that are not supported by go-1.4. To
> > support these host architectures we must rely on an existing host go
> > compiler and use that to build go-native instead.
> > 
> > Rather than add arm64 specific code that forces the use of the host
> > go
> > compiler, we use an architecture neutral approach based on adopting
> > the
> > host go compiler if it is both recent enough and the output of `go
> > env
> > GOROOT` passes basic sanity testing.
> > 
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >  meta/conf/bitbake.conf                 |  4 +++
> >  meta/recipes-devtools/go/go-native.inc | 38
> > ++++++++++++++++++++++++--
> >  2 files changed, 39 insertions(+), 3 deletions(-)
> 
> Whilst this is quite a creative approach it isn't deterministic and I
> can see this introducing bugs which are hard to track down :(

I guess I can't disagree too strongly... the version check and bbplain
message about the go toolchain we adopted were intended to mitigate
this by at least making the selected go toolchain conspicious (and thus
a git blame would probably draw flames towards me).

We could make things fully deterministic by downloading go compiler
binaries (rather than source) if the host architecture is not supported
by go-1.4. Is this feasible or should I continue trying to adopt the
host go compiler for these architectures?


> I think we need to make this a specific configuration option.

I guess we could wrap this up in a config option although I hope
it is ok to have per-architecture defaults so the config option is
always sane out-of-the-box.


Daniel.

