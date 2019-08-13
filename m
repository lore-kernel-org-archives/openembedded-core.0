Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 252977DDCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 14:53:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z1so108040576wru.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=TmOhnRtQYeAmAeiJfwLVITm654lY74jbeWH2ekdxJeY=;
	b=b8FrOBrGCxgIFsZ5+ezTr0aVUmzhkgAYx4ZhwoqbxjY3BQ6dfSXSINkBtqUkDIitVG
	zqtVFnzwhRavmO4WiHAjZJDZQ8/jAfzN45yclBgZoHq83Iq/0s1eG2qwan8sDmkmrD2z
	ecRY3Zn56tNevOfxFj4ydOVvajP19NgFmhLN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TmOhnRtQYeAmAeiJfwLVITm654lY74jbeWH2ekdxJeY=;
	b=VNW5We9UkrqebUHv+gpZWqEF+hpRqAlWZmNSnJp3RYRcj1l/fg+gM/l/D2H+nbxa+j
	mbnvT17rulByYPu7yIXyNuWxzorO5vm1/zdjbE15IQVGczyswl6l8LikhS7Q13gYoTt9
	bCjb0BK8jnkQd1aCwibDax7i5xLrShl9v8FCUYEn8WsCaKFM35/rfXlFlUrw65qE3J4S
	IwOtGklPpdiOZR6rFG3ncQU4oIIr1dLnOQ0bf7ieFziYivtq8oghFx6H+7LoiBmTGjBu
	TZIQ/0KLl5uWr5jGAfHVkipIY85iw00Y+1ZwxECEkMHV3fITfinGGzysDLYTwOU01+C/
	59Zg==
X-Gm-Message-State: APjAAAXiaZ4T46nhWQ71sI2NaCeFdwNk76T78+n7LpbUxrqEVbAf8htf
	SmBrhPIw0yFDNNEb1u49ccxsYA==
X-Google-Smtp-Source: APXvYqwmk1ka/9bArOEhBMvWsXh4i3d3WWKh5jXzaTVou0hcYAFEQh9Wn2jJFaHPMzOnoeMlmzAjfg==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr45973218wrn.54.1565708024858; 
	Tue, 13 Aug 2019 07:53:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a18sm6111505wrt.18.2019.08.13.07.53.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 13 Aug 2019 07:53:44 -0700 (PDT)
Message-ID: <256aef831cc108af53a843eb409f0806cf231838.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 15:53:43 +0100
In-Reply-To: <CAMKF1souyrRrqxV9WKfyTBg6ap3whkdxdvEjs3ovsSaZcm00Lg@mail.gmail.com>
References: <20190812232234.41199-1-raj.khem@gmail.com>
	<9a259359b640fefefd52b5eee616156b75aa0e80.camel@linuxfoundation.org>
	<CAMKF1souyrRrqxV9WKfyTBg6ap3whkdxdvEjs3ovsSaZcm00Lg@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Move content from gcclibdir into libdir
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
X-List-Received-Date: Tue, 13 Aug 2019 14:53:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-13 at 07:36 -0700, Khem Raj wrote:
> On Tue, Aug 13, 2019 at 7:23 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2019-08-12 at 16:22 -0700, Khem Raj wrote:
> > > OE does not use the traditional /usr/lib/gcc prefix to store gcc-
> > > runtime
> > > it basically is moved into libdir, however some newer files were
> > > installed by newer versions of gcc especially libgomp ( omp.h
> > > openacc.h )
> > > into gcclibdir, so we have content in both directories, this
> > > confuses
> > > other tools which are trying to guess the gcc installation and
> > > its
> > > runtime location, since now we have two directories, the tools
> > > either
> > > choose one or other and we get inconsistent behavior, e.g. clang
> > > for
> > > aarch64 uses /usr/lib but same clang for riscv64 chose
> > > /usr/lib/gcc
> > > 
> > > This change ensures that OE ends up with single valid location
> > > for
> > > gcc
> > > runtime files
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-runtime.inc    | 5 +++++
> > >  meta/recipes-devtools/gcc/gcc-runtime_8.3.bb | 3 ++-
> > >  meta/recipes-devtools/gcc/gcc-runtime_9.1.bb | 3 ++-
> > >  3 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > This appears to break mingw:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/925
> > 
> 
> seems   virtual:nativesdk:/home/pokybuild/yocto-worker/meta-
> mingw/build/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb:do_package
> 
> but I cant see which files can you help

They're in the 1b and 2b logs, e.g.:

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/731185/raw

Cheers,

Richard


