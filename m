Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3886B7BEAD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:48:55 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id l14so828806ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H9N0Nj1JtODccvHnyHWh7i5Soch1qte4os0UeAQL/bM=;
	b=DX5ctVdxzhqN9peRsYbm+m25z5s8aJSSMzqH5edOT7wLWTlr/I+OLZXcSVI/kEovvv
	bXk6LEt1P0X/dE00z5Bv3WhYpAWCLqIPual26ZMStLKg2N2pp6DK7BFq6IGa7uFEFEyF
	MV5duoafCL9rI1wCven4AZg/+BwxGza5j0zVt1YZL3l6Lrv4HXA569BMO1t6gDOxhqr5
	0Ayndduen8Qi9CiGn4wd/DC2zd2ojmZCW4i8vO5/MUxIDNN0aEdXhL+fuPK9OTiGJJXN
	JxwSp8t5FlFZ+1ZORHS4NMf6wSd9j/vmsTxlMAW4HXg9nfO6XdHYQx5m6BlR0u60Qdvd
	FNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H9N0Nj1JtODccvHnyHWh7i5Soch1qte4os0UeAQL/bM=;
	b=TxaSUOW4xAotPVWoakSA6UJRObpF2zoVft22VvWxDFuXxhsL4kHeGEkpLT5p2XSe+h
	qkuAvCnMRzfg4GwOToAQRJis7WHBuWuiP7kIk9QlmRUNfVE9KRsit5x5COcYclVxr1aY
	xnzZJDgLr/UyyxxBJBWVXJOpGvMJt3xMiVwTDuce4zFIRc0uX/4EG3LO4AO6tlTo0aBQ
	ST6AHiDIAR1N/NI5KyfXrxiieGjcuFJR7hCPStF80nNeCHqSEBBDnp09eZWkniN0wGVn
	Q8sCMuF9VkitGws5KBDlf3PcP8gqDomyT8U8tv2MreBB6q0iRTK0wu4wsqEfPeU63yrX
	ICUw==
X-Gm-Message-State: AJcUukcITh+Vq1cirdD8tP4Gnfixl5OjxztcNY2NpuPKMSuxcZgYVLLF
	W60JFal4wybFoS4LAwbwfxIONjZ7WgCgnGwJM3p+VTGn
X-Google-Smtp-Source: ALg8bN6xFiSBtFS53RsVIrAu9DwjTFJcK1n8lmRq/TfNZHL0OXE/EVMKWyi5CXE/Cd3ILiRgnhKgUZhdtBuNb8YbtrQ=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr13105357iom.201.1546879737147;
	Mon, 07 Jan 2019 08:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20190107163823.31816-1-ross.burton@intel.com>
	<20190107163823.31816-7-ross.burton@intel.com>
	<4d020a2be7a89c50d6f29cdabc298d7c2bd80de7.camel@gmail.com>
In-Reply-To: <4d020a2be7a89c50d6f29cdabc298d7c2bd80de7.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2019 16:48:45 +0000
Message-ID: <CAJTo0LZT5V=2FYmfLjeGfRdqfkT9MRGcRNVTbk9nA9t9WkPVxg@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] oeqa/sdk: add test to exercise Meson
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
X-List-Received-Date: Mon, 07 Jan 2019 16:48:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jan 2019 at 16:45, Joshua Watt <jpewhacker@gmail.com> wrote:
> FWIW: I know that is in the same style as the assimp test, but I always
> thought the test should have been called the "cmake" test, since that
> is what we actually care about (not specifically that it can build
> assimp; any cmake package could have been used AFAIK).
>
> Perhaps this should break that trend and be called the "meson" test?

My worry was that in the future we'd add another recipe that used
cmake/meson to exercise some other codepaths, and then we'd have the
cmake.py and cmake2.py.

At least by using the upstream name, it's clear what is actually being tested.

Ross

