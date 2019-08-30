Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C78C27F3F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:19:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d16so8042110wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rg4OUtYYceK8ErABteVZ6dxlFNflvFPKs12aEcDjpMU=;
	b=Il0k0ePPlggfqDl0EM9JWjFGWtocOJo5yvugnnyNOUJdTWgxpYMUcqgYn7I3mffCHO
	lwyXNiyXEsKuh/gYnkZ3ie+ung4TGPPGq+qfq7UY7BDTqHWgCnCXdZjp2XFnj9Ozxbh1
	OzNMP6cbEnn1NXHyNUsgrLHJCtsN+GrMlGEIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rg4OUtYYceK8ErABteVZ6dxlFNflvFPKs12aEcDjpMU=;
	b=G+zfCuJayEESjkI64uGETHV/8OEM7/KDDCcSBhT4mPXxNLdJufZhJ8l4fiQkIoSnyJ
	EO9nLXI5fCNwftZVTd6oYv79+Ps61Nq8plEG8aGIu0VyS79IqctVtzzqMbsIg6Ad7sWK
	a1w40EPZ/QVA2qKUZTZYMnwxfd+W2tqjA7Ff0O4MBCi1XKq6K+fjnmSrxe7jWM+1Qslh
	25BqbHL3Fjpu5B7iPrHsajXbdg2BMWNaR/KuK+vqdxfvl53AphRQd1AEYxN6l3p8dU4A
	IgvtKmznCnv7JmljzShNrJRcfmMaZ/uFFfcIFJZH8YWsVX7WJxRbbhiAXUIEfN1bjpXW
	XycA==
X-Gm-Message-State: APjAAAWj8095WQgMID1ZxNPt2/OExXK/6EVweEwCJzFAy3zTwVGuZMSz
	ibn6HLYVBbQF0SZHcizFiPqWuQ==
X-Google-Smtp-Source: APXvYqyKsQKiNNdSMG7GAO0S0csUOycTeoTdcFyf/e9RO0OcbSudUlQjEU6LH8leNWjxEvFADbgtrw==
X-Received: by 2002:a1c:c706:: with SMTP id x6mr19892390wmf.104.1567181984388; 
	Fri, 30 Aug 2019 09:19:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f13sm5116428wrq.3.2019.08.30.09.19.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 09:19:43 -0700 (PDT)
Message-ID: <e5738cd26e9f180dd51321db94714e8c880808a4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 17:19:41 +0100
In-Reply-To: <CADkTA4O=5M78CZjuPiNB8G1_dZwDQ0C3PYm126xMbBe+SFrAZA@mail.gmail.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
	<CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
	<CADkTA4ONrm_Xtr9Mcdj359m5xqFqzKTzN8bB=VnRn2PKRxP+Wg@mail.gmail.com>
	<20190829152736.GA4696@joraj-alpa>
	<CADkTA4PybRmDHYumSEjULoaiXKDL9H4oXv6H7jOQv4VfsbOk1g@mail.gmail.com>
	<CADkTA4Mf9u09J=M5xZx518va22xwUDqr=E4Xyq9jn2S2LLPevw@mail.gmail.com>
	<9996bc502efa90a0dfc7d3cfc9612b3ff4faf907.camel@linuxfoundation.org>
	<CADkTA4O=5M78CZjuPiNB8G1_dZwDQ0C3PYm126xMbBe+SFrAZA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] kernel-yocto: misc build / config changes
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
X-List-Received-Date: Fri, 30 Aug 2019 16:19:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-30 at 10:50 -0400, Bruce Ashfield wrote:
> On Fri, Aug 30, 2019 at 10:39 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Thu, 2019-08-29 at 11:32 -0400, Bruce Ashfield wrote:
> > > On Thu, Aug 29, 2019 at 11:31 AM Bruce Ashfield
> > > <bruce.ashfield@gmail.com> wrote:
> > > > On Thu, Aug 29, 2019 at 11:28 AM Jonathan Rajotte-Julien
> > > > <jonathan.rajotte-julien@efficios.com> wrote:
> > > > > > FWIW: lttng-ust builds fine for me with the 5.2 kernel +
> > > > > > 5.2
> > > > > > headers,
> > > > > > it is one of the things I build and test as part of
> > > > > > core-image-kernel-dev.
> > > > > 
> > > > > Even on ppc?
> > > > > 
> > > > 
> > > > yup. I build all arches for core-image-kernel-dev, which
> > > > includes
> > > > all of lttng.
> > > 
> > > but I've recently switched to RP's master-next branch, so
> > > hopefully a
> > > difference in the configs will pop out.
> > 
> > I'll post here about what I'm finding. eudev fails since
> > SO_SNDTIMEO
> > isn't defined. This comes from asm-generic/socket.h which
> > asm/socket.h
> > include.
> > 
> > richard@jet:work/ppce300c3-poky-linux/eudev/3.2.8-
> > r0/build/src/shared$ /media/build1/poky/build/tmp/work/ppce300c3-
> > poky-linux/eudev/3.2.8-r0/recipe-sysroot-native/usr/bin/powerpc-
> > poky-linux/powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=e300c3
> > -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-
> > security -Werror=format-security --
> > sysroot=/media/build1/poky/build/tmp/work/ppce300c3-poky-
> > linux/eudev/3.2.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I.
> > -I../../../eudev-3.2.8/src/shared -I../.. -DUDEV_ROOT_RUN=\"/run\"
> > -include ../../config.h -O2 -pipe -g -feliminate-unused-debug-types 
> > -fmacro-prefix-map=/media/build1/poky/build/tmp/work/ppce300c3-
> > poky-linux/eudev/3.2.8-r0=/usr/src/debug/eudev/3.2.8-r0 -fdebug-
> > prefix-map=/media/build1/poky/build/tmp/work/ppce300c3-poky-
> > linux/eudev/3.2.8-r0=/usr/src/debug/eudev/3.2.8-r0 -fdebug-prefix-
> > map=/media/build1/poky/build/tmp/work/ppce300c3-poky-
> > linux/eudev/3.2.8-r0/recipe-sysroot= -fdebug-prefix-
> > map=/media/build1/poky/build/tmp/work/ppce300c3-poky-
> > linux/eudev/3.2.8-r0/recipe-sysroot-native= -c ../../../eudev-
> > 3.2.8/src/shared/log.c  -fPIC -DPIC -o .libs/log.o
> > ../../../eudev-3.2.8/src/shared/log.c: In function
> > 'create_log_socket':
> > ../../../eudev-3.2.8/src/shared/log.c:128:43: error: 'SO_SNDTIMEO'
> > undeclared (first use in this function); did you mean 'SO_TXTIME'?
> >   128 |         (void) setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &tv,
> > sizeof(tv));
> >       |                                           ^~~~~~~~~~~
> >       |                                           SO_TXTIME
> > 
> > The file:
> > ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot/usr/include/asm-
> > generic/socket.h
> > isn't included.
> > 
> > if I put:
> > 
> > #include <asm-generic/socket.h>
> > 
> > at the top of log.c it will build, everything else doesn't.
> > 
> > Debugging with gcc -e shows its including a different 'interesting'
> > file.
> > 
> > My build has a
> > build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot-
> > native/usr/lib/powerpc-poky-linux/gcc/powerpc-poky-
> > linux/9.2.0/include-fixed/asm-generic/socket.h
> > which looks totally wrong when I compare it to the real asm-
> > generic/socket.h.
> 
> This is similar to what I was seeing on some early qemuppc builds as
> well. fixincludes was tossing out the original file and putting in a
> broken variant. I had to hide the "fixed" files to build. But then it
> stopped happening, so I moved on.
> 
> I'm not familiar with how/when fixincludes fires, so I have no idea
> about any possible races, etc, that could be happening.
> 
> I'll do some more research down that route to see if anything pops
> up.

For the achieves, I've posted a patch which should fix this. Its due to
headers leaking into includes-fixed in gcc which has its dependency on
linux-libc-headers marked as "safe" for various reasons.

We don't need gcc to do this on linux so we can remove them. It
explains Bruce's previous fun here too.

We'll try a new build and see how things look with that fix.

Cheers,

Richard


