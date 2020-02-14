Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F257160676
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:18:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w12so11090880wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=VNDFS51AVoTlzLPPNmYD224DQO5QFZGoF8qkeXy6h5s=;
	b=dVkR8wZvyQMXI4KwZp4rJo53EyTL2nBbwsd6pLL1t+KG6XyePlkTODn1FfY5kSzctY
	5pOb/Wf2YR9CGXZd/fNbw+4FRl1fjCs7fGl9EA5Qv6UiDA24XraX1VxSEEzmzvPSfaZP
	yqR4RXNQ5j5ZMmW9120DiXkFoFEXFs4qPpx7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VNDFS51AVoTlzLPPNmYD224DQO5QFZGoF8qkeXy6h5s=;
	b=T3Emx/22coxqA0rJ82qYE38ooRWKd4g94iGkk2XJ/YVjayQROBZ73dfQ/4t283uwdF
	YivbAuRO5YwcFEba+wD1g0at1b9OEpvNVkE76CU5t/CTCf9aqBORyRB940BMyzNh1hxp
	EKVchF5zOq9xIUglE5A9pQuC/gg241i4VjixD7/IrVVd6diAEYOifSwb+oio1urjFPH9
	nC/JmTeH/tbTwOk1fM5w84kwrHd7BQC4ovnn1ahlahTt39sJqBr6SYh9leR2CPZBAoqp
	TM9pkJ6uRm1pxchTcaPSI/4dcOOEBJlf22FvpvkQmCFOgN+XVxvb94L/5ZV1X/jNwHPl
	GbQg==
X-Gm-Message-State: APjAAAWKKwHYxXJW8h6Ci2sgCJeYbJpOq6FFFhe3Io0R4ixNvwh1h6GR
	q7rOcb+SuJtomeEYgY6Q52Ee2w==
X-Google-Smtp-Source: APXvYqxCrXDHyUfezeMn+BMsWrR6HJORi6jM0Bki9JdeYYzD60w0csBcaTdpGCHW1yIL1OxSKX/4TA==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr4394178wrn.168.1581689910566; 
	Fri, 14 Feb 2020 06:18:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id j5sm7513225wrw.24.2020.02.14.06.18.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 06:18:29 -0800 (PST)
Message-ID: <15849ef67fdb2877d200a39259d9503664244d7b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 14:18:28 +0000
In-Reply-To: <CAJdd5Gb565Y-9GhHSb9JJZgPijd_zBCbAgBNSRHQ3U=YsX65eA@mail.gmail.com>
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
	<20200212031435.792802-4-JPEWhacker@gmail.com>
	<CAMKF1srqz+B9YEHCvMcsZRiWa5AvjD7H-ef7pQjd8baWsHWNAQ@mail.gmail.com>
	<CAJdd5Gb565Y-9GhHSb9JJZgPijd_zBCbAgBNSRHQ3U=YsX65eA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] recipes-support: Add diffoscope recipe
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
X-List-Received-Date: Fri, 14 Feb 2020 14:18:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-14 at 07:15 -0600, Joshua Watt wrote:
> 
> 
> On Fri, Feb 14, 2020, 12:34 AM Khem Raj <raj.khem@gmail.com> wrote:
> > Hi Joshua
> > 
> > I think it needs to be ignored on musl
> > 
> > 15:37:23 ERROR: Nothing RPROVIDES 'squashfs-tools' (but
> > /mnt/jenkins/workspace/Yocto-world-musl/sources/openembedded-
> > core/meta/recipes-support/diffoscope/diffoscope_136.bb
> > RDEPENDS on or otherwise requires it)
> > 15:37:23 squashfs-tools was skipped: incompatible with host
> > aarch64-yoe-linux-musl (not in COMPATIBLE_HOST
> 
> Would an RRECOMMENDS fix it?

I merged your patch and one of mine to follow it adding a
COMPATIBLE_HOST entry.

I see Khem is fixing some other software so we may end up not needing
it but we can remove later.

Cheers,

Richard


