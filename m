Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 737D26D470
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 23:30:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so34004305wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 15:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=8e0eu64G9nmpmL6Xu7F4LEqBapASodZF+9pDEOBlHbE=;
	b=MrFzskQncyZiCKZD5mHAgrvpW4TSf1yiKk4Se3KfG1VUaugWzxH8s8RQHlvMSLnHX7
	paWC2yDwuI8YYtIEErdekHUGRoLFkCyWWHeHvkG1/tpidKr5mW3mMVN5wuR2IYQX6IfG
	AD/Dpn1Odaw/+iLSOs1iqGMF7PnbqluQM6wHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8e0eu64G9nmpmL6Xu7F4LEqBapASodZF+9pDEOBlHbE=;
	b=k7YUaVvoEiYbr5s4zb556f16KpBtxruz6MPWKmpb04csdNZS83nMRFj49VIDqhec7z
	FW0qqKcCAZtK0sbcHZTEyEc6t9aJag/VUI7s618e8uZQzQH5ZyFiGMhAz3NE1JMeKwCQ
	j5BFPIQ6vHhd02Jeg1I/18vDOvcorala9rEJnoBezXojJkJkDH3DI3aig9AWwf7d15iR
	p6TUQ9Stm+A+Ba4YB+LAfve0W5z2zagshwxRmf5YCB1Mh5k8vyk5wpvB2MOmMu0qRBgT
	hS1PHsbFYchHPKp34jIqrwwcov6kgmzZGtDcf5iLLOJlMkoCvZh4wJeURAP7M7jluaCy
	v9PA==
X-Gm-Message-State: APjAAAWgCD4IbNAqjnmEooSohyualowcOKjsNyw/O6jjF9d3Y84AFFCj
	KCsiOqDnccX9gdRJS3ui85hmQg==
X-Google-Smtp-Source: APXvYqy/m6GpbPykrsBCrXIy/fG18DzXCmi6S1G6RBzTMCZW9/irt5ReTGH7xfUK/cOjJkQSBthd8Q==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr66909888wro.209.1577748629773;
	Mon, 30 Dec 2019 15:30:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n8sm47903281wrx.42.2019.12.30.15.30.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 15:30:29 -0800 (PST)
Message-ID: <fcdc35cf67cbe53ca794ad3fa75547999d0b3746.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Dec 2019 23:30:28 +0000
In-Reply-To: <CAMKF1socNxx-eYHAQ=7Jeftqg4mGTzTUY-7K6ZkxdteH+-waiQ@mail.gmail.com>
References: <20191230084739.19193-1-richard.purdie@linuxfoundation.org>
	<20191230084739.19193-2-richard.purdie@linuxfoundation.org>
	<CAMKF1socNxx-eYHAQ=7Jeftqg4mGTzTUY-7K6ZkxdteH+-waiQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bitbake.conf: Simplify TARGET_SYS/SDK_SYS
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
X-List-Received-Date: Mon, 30 Dec 2019 23:30:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-12-30 at 14:10 -0800, Khem Raj wrote:
> On Mon, Dec 30, 2019 at 12:48 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > As pointed out by Masahiro Yamada <masahiroy@kernel.org>, ('' or
> > 'custom')
> > equates to "custom" and this code seems unecesaarily complicated
> > and unused.
> > 
> > It was likely intended to supress the value if XXX_OS was set to ''
> > but the
> > code doesn't actually do that. Simplify it as we shouldn't have
> > this indirection
> > if we don't need it, its horrible.
> > 
> 
> introduced here in oe classic
> https://git.openembedded.org/openembedded/commit/?id=e485a5d542a24109c8ab97e58916359efc0cd044
> 
> and fixed here
> https://git.openembedded.org/openembedded/commit/?id=ff02b94de71
> 
> downstreamed into poky
> https://git.openembedded.org/openembedded-core/commit/?id=5ad6d9a94a0
> 
> I think oe-core missed the second commit. perhaps it seems that it
> was created out of poky lineage rather than oe classic.
> 
> maybe porting the second commit above would be better option here.

Maybe, except that nobody has complained in 8 years. The expression is
horrible so I'd prefer to drop it if we don't need it. If needed
someone can override the variable anyway...

Cheers,

Richard


