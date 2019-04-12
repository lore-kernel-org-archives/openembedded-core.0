Return-Path: <daniel.thompson@linaro.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 703CD7D3DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 14:08:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n25so11201615wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NgMvDqYtu4P3UX17FI2niBToPmyyojNzSwbN+4JgLZM=;
	b=gkD4TrpSAy9rloldSP/Wu5KAmB7mvRadzQFlJ7xENDGa5Nni3tQ5Jrt5gOy2+9aBmi
	n5vPKHXA/Oa5J9gQqNJDN0PE6kHv4pDBjcbGaui4ylmhLWOc/AlaHZZMAiA6R9nyEkSh
	+vn4avOIYDAlMjQNcawVOBoFbWbZU4cqvpsuR0ZADKeg5xVEslOo84M3ab/QlER+fi47
	Qx4gL3+O2Gh4tyX40dq5CDkzsQ53yYWyWaTeKRWZvVilRAW9FZsDs1Zmka5MSyqimvR1
	GML1kG86VWQwDGlc9YeEzKgHf/vQTQ3pn6QKGsh+cWxUQd7SzQ4BkTe7vW9NROTkjyCl
	erbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NgMvDqYtu4P3UX17FI2niBToPmyyojNzSwbN+4JgLZM=;
	b=E0U7iCprCwh+h5UYZ9fF56hxj9VptwG6az9hIrEnkopPwuGZyE/ce86e79u1oQSyz0
	DBDx/GOo/FAx8VtEG3JZPvzkJ+vp1VT52mLn+Sd7k+FeLMJ7sxOTsHFBnLN/uo9s9rzJ
	Zamu6sdXYW41ae0IxECeK5dbVO028csN5UYcqnYjROy813J4O4eZpBPPkqWVkvcw3JIv
	aPiPxZLcNX+UTzN/o5ELk6TSYg1LoRl+mnN9vTLHlj1VevbujkNIFJk2ysWMfTUZp2EQ
	9ebTpGxUuS0Fs0JXv5D6Zkv3GKXBEGdhYZ1jfHLvM6N8ARFMaOytSafIer6DDjkkIwQH
	e2Mg==
X-Gm-Message-State: APjAAAX+i9TL1VN7w7E5cwwktrjdYD/CQPxOglpLnwYpl+I47HyJdPqw
	xDHsvb6U9YPw27Qa8AGzGXSFDg==
X-Google-Smtp-Source: APXvYqxD6Nr9j5PeREMpCl4SG5MlXOlJZBUVZuitCsfzCrLVcQwLmH0A3VO9WFL0575UKCOyIo+2+A==
X-Received: by 2002:a1c:c504:: with SMTP id v4mr11708042wmf.45.1555078121059; 
	Fri, 12 Apr 2019 07:08:41 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
	[86.9.19.6]) by smtp.gmail.com with ESMTPSA id
	i28sm115136448wrc.32.2019.04.12.07.08.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Apr 2019 07:08:40 -0700 (PDT)
Date: Fri, 12 Apr 2019 15:08:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190412140838.mtdif5oxabchkse4@holly.lan>
References: <20190412123046.17510-1-daniel.thompson@linaro.org>
	<5b21542499899b2465a2b1f581faba726351e58d.camel@linuxfoundation.org>
	<20190412131616.2mwd5qefxrvlxaw3@holly.lan>
	<f704cab815c2157a4a26537f0a72c5bef3d59fa0.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <f704cab815c2157a4a26537f0a72c5bef3d59fa0.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 12 Apr 2019 14:08:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 12, 2019 at 02:34:14PM +0100, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2019-04-12 at 14:16 +0100, Daniel Thompson wrote:
> > On Fri, Apr 12, 2019 at 01:39:52PM +0100, Richard Purdie wrote:
> > > On Fri, 2019-04-12 at 13:30 +0100, Daniel Thompson wrote:
> > > Whilst this is quite a creative approach it isn't deterministic and
> > > I can see this introducing bugs which are hard to track down :(
> > 
> > I guess I can't disagree too strongly... the version check and
> > bbplain message about the go toolchain we adopted were intended to
> > mitigate this by at least making the selected go toolchain
> > conspicious (and thus a git blame would probably draw flames towards
> > me).
> 
> Once something makes it into sstate, the message is lost and you don't
> know how it was created. The problems invariably end up on the mailing
> lists/bugzilla with others being on the "front line" for this. Rightly
> or wrongly its just the way it works out.
> 
> > We could make things fully deterministic by downloading go compiler
> > binaries (rather than source) if the host architecture is not
> > supported by go-1.4. Is this feasible or should I continue trying to
> > adopt the host go compiler for these architectures?
> 
> Is the go compiler a standalone binary that can cope with this? I think
> I prefer that to requiring people install host dependencies.

For arm64 there are binaries since go1.8. They should be pretty light
w.r.t. dependencies (close to C library only IIRC) and the archived
releases go back as far as the end of 2013 (go1.2) so links should
be durable.


Daniel.

