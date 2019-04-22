Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2513A6C3A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 13:15:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v14so14461938wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=z2EqUN2A+ZaDCIvAL0XMgqwyuySxWeigq6tTtqvPFTk=;
	b=AsxQxBXQIGBl8Q395D2+sffFUiblygjn4EcAcRqSfKlNa43UaDDR8FlnKTCr9hNasS
	me6QzbsNz5dLoX83M5wtlqTUQWVAmE39+i5pPvw6NsCDsd4J/2W9RFrmI4Xk4swGTr9k
	kzZm5h92+BC70X1mgaGjwnYF79PGbRkbQ37RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=z2EqUN2A+ZaDCIvAL0XMgqwyuySxWeigq6tTtqvPFTk=;
	b=C8VtE8FzYislOJ2km5Sjqf4IfYUKlNHwwgMXYiYiU+G7zuiYpeAG+QjmI4poa27ppH
	xb8y/8xhPp2nGov1d0vWQ14Rj9ivgPVIGlQ8aiREE5RqU6jiLIZ3nTRRZZUQMgIv7fvQ
	Sw+afjtBeg1QrGd31SiqbGJOHQgl2udf4TMHoeQ+GwvA/I2wMzu8O1I5gx8KCqxEhcIV
	9oHdCRZnBcWequnkkLeVgxUKqDPONSFS57Spwp2ArByuqb+nAehQtt2sS81iSPFiMLVf
	QBbvYXOO2veGtozQly5bcUVaxyVpWCz/EymAzH0Qt3fkiUIq8TAAZ3RBHiUw1FOjatMW
	chDw==
X-Gm-Message-State: APjAAAWqQos5Mxjf1+MSt35jDKYZq5n7ByPupA2u5t5oY/0+z463a6Kj
	dwaopg2nmoHC08MBttTSFya09w==
X-Google-Smtp-Source: APXvYqzhKHwFLCi2OD4QLRzdU5BHZ9xecItaeJwWQZKn46v61aM5a0ZbMqjaTuD0Mq16iuz0h4e4oA==
X-Received: by 2002:a1c:23cc:: with SMTP id j195mr12782210wmj.74.1555938921821;
	Mon, 22 Apr 2019 06:15:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c10sm11240839wru.83.2019.04.22.06.15.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Apr 2019 06:15:21 -0700 (PDT)
Message-ID: <681c0c4b463ce8360c76e5333339bb6feb18e34b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 14:15:19 +0100
In-Reply-To: <d12938fb-ffbd-05e5-c518-96cf7222d9f8@gmail.com>
References: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
	<d12938fb-ffbd-05e5-c518-96cf7222d9f8@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] core-image-sato-ptest-fast: Add 'fast' ptest execution image
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
X-List-Received-Date: Mon, 22 Apr 2019 13:15:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-17 at 09:57 -0700, akuster808 wrote:
> 
> On 4/17/19 8:59 AM, Richard Purdie wrote:
> > Create a common include file which lists recipes that have ptests
> > divided
> > into 'fast' and 'slow' groups. This allows us to include ptests
> > which otherwise
> > may not get included in images and allows us to test the faster
> > running things
> > more regularly.
> > 
> > The new image allows access to these faster executing tests. 'fast'
> > is defined
> > as tests which execute in under 30s roughly speaking.
> Maybe at some point allow recipes to define their own groupings. It
> would lend itself to scaling better.

There isn't anything stopping that, I just wanted something which we
can use for the autobuilder testing and it makes sense to have that
somewhere in OE-Core IMO so everyone can see what we do.

> Can we define the system at ~30 seconds? All these may be fast on a
> 196 core system where as on my laptop all would be slow ; )

The times from the autobuilder. My local build server works out
slightly faster. We're talking about an image either on real hardware
or under KVM acceleration as without that everything is extremely slow.

Cheers,

Richard


