Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C54677D9ED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 09:38:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k16so2362959wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=uUMlaTULfPJOxHTJeY1cq50BIuqoOlfUIB4GCHWvYrI=;
	b=LxMaVCUkSqDlWP3qkeGAHyvzFfrJwZ4rlQy7KnPJgV6rQBNh4ltZCVd3K70a9dyfPz
	vgvWoer5HjQi/9jumtqtkl2Ee0mJtr1iZoHFAUXDCx8EKOexJANt9zJsxiGs7FEHJoTg
	+SG3hJAFSgES9tqMeGBY/gurRztQ5yq/wF5sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uUMlaTULfPJOxHTJeY1cq50BIuqoOlfUIB4GCHWvYrI=;
	b=qquhLFVsk5Lg+Uda9NsCty4azWUXuw4n9DU8Gn4FdDVJQL9v2IJGa/NllCyTOsDv0U
	hWcduTH5yVeuPn1PNySzyfs42c8mh76fKKKrGTyIfbvCK6J4A8burMqDbEjF48xdh4DP
	J9klPCmhGqdIC2/NKYLRbEnw4eVU0cBalehK/WDT7P0tejPlpxHMYusK3x/jU2AsxwlO
	Tkuu0qcXueiqrLbhCy37fh6mo9HEYv4J9Iq09qV0M4ap6r+d0mu6ADKUsdoxfBaiAy7H
	fzwLX69KS7Atenl57JnenaGJa2uyj3HDV2cOLD6OQ9BGkq24SO0qW5d60l0n0yoH5OTs
	zkwQ==
X-Gm-Message-State: APjAAAXado3801E/48djul5rC/H8fOwHyeXy1qmEuQRaJbH3b2MEYv/U
	X3zYg33TZMu9PoG6yPF2xAxzNq/H7ls=
X-Google-Smtp-Source: APXvYqzgm62DzhAwZRLCBbmjyaxXIelW+acH0Cz0hNu/eY0CPQ5qnjNJqelN8s2D2loTGAcFcCaw2w==
X-Received: by 2002:adf:c986:: with SMTP id f6mr1984930wrh.93.1556789899372;
	Thu, 02 May 2019 02:38:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f2sm7178890wmh.3.2019.05.02.02.38.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 02 May 2019 02:38:18 -0700 (PDT)
Message-ID: <c059b05e224a4b30d1c5e0fffd8db83e4de656fe.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 02 May 2019 10:38:16 +0100
In-Reply-To: <CAMKF1sqEcbCW22kAMtDsv8sU8KVv0hkkbJXE0hs_MV7zeY5yXw@mail.gmail.com>
References: <20190430192414.43383-1-raj.khem@gmail.com>
	<593bdf6b788838c82d73a7bd7b8cce01a185ba13.camel@linuxfoundation.org>
	<CAMKF1sqEcbCW22kAMtDsv8sU8KVv0hkkbJXE0hs_MV7zeY5yXw@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] gcc-9.0: Add recipes for upcoming gcc 9.0 release in mid-2019
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
X-List-Received-Date: Thu, 02 May 2019 09:38:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-01 at 20:01 -0700, Khem Raj wrote:
> On Wed, May 1, 2019 at 4:34 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2019-04-30 at 12:24 -0700, Khem Raj wrote:
> > > Its already in RC phase now.
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > 
> > I ran this on the autobuilder:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/429
> > http://errors.yoctoproject.org/Errors/Details/238976/
> > 
> > Basic summary:
> > 
> > a) gcc-source needs a maintainers.inc entry (selftest fail)
> 
> I will fix that in next rev.
> 
> > b) fortran selftest is broken
> 
> some more details on this would be helpful.

"oe-selftest -r buildoptions.ToolchainOptions.test_toolchain_fortran"
should reproduce.

| In file included from ../../../../../../../../work-shared/gcc-9.0.1-r0/official-gcc-7833ad1/libgfortran/runtime/backtrace.c:27:
| ../../../../../../../../work-shared/gcc-9.0.1-r0/official-gcc-7833ad1/libgfortran/../libgcc/gthr.h:148:10: fatal error: gthr-default.h: No such file or directory
|  #include "gthr-default.h"
|           ^~~~~~~~~~~~~~~~
| compilation terminated.
| Makefile:2772: recipe for target 'backtrace.lo' failed

from

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/468206/raw

> 
> > c) mdadm fails to compile
> 
> Yes, this appeared in my builds too but got ignored since recent
> builds are using clang
> but I will look into fixing it.
> 
> > d) runtime test gpp2 fails
> > e) systemd fails to compile
> > f) on target runtime g++ compile tests fail
> 
> The headers include problem is interesting I will see if I can
> reproduce it.

"bitbake core-image-sato-sdk -c testimage"

should reproduce.

> > Build will look a lot happier with the on target C++ headers fixed! Not
> > too bad for a first pass :)
>
> This is because we can build master branch easily for toolchain
> recipes. so a lot of pre-emptive work has happened already

I can imagine there was quite some work in that, nicely done! :)

Cheers,

Richard




