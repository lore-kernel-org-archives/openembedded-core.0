Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 228D67DD6A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 14:39:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o184so7704504wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4LM/fIrfGflnL/V+qHZWGCTgFWMxZ3iY8QOU5C8PBqo=;
	b=MYMQkHzz04WN36+nIYY8gvKNGbqXpMyClxfiiGnHlUMc8I5GKCZbtMV/ranyS0SWl8
	qvlifBgarmrqxU8UdwVFdWViceJyiX3SemWWVhlD/bAvkaRaz4YMALFR7v3i3DOvWxEh
	oLV3eO8m3qNtzE1NDz8MjIXhBuDwlmCzkKQj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4LM/fIrfGflnL/V+qHZWGCTgFWMxZ3iY8QOU5C8PBqo=;
	b=XvgtNmrZgc6RM/AF75evpuFTOKN9kz+hyODQHF0wNfDHUaXYfKioH5+l8pgNJkapm7
	5Kek6gghpYXEeeP5zrNPUlPYQul9Nj7ppns/Pcv9fZjK7BFG9lr3o69/0R/fSPX5daxX
	1Q1JxUYes7mh+OxK0Xffn7B0L2BBnwIZzIwVg8MkbbsE6rsvJjTfk2iPA6pIL0h+rwqr
	ij7dpYy2xvlN/zs6hZBqGdO0PZ2M0Pq7NQBIUtMW7SB/UD1mJRtFxX5zEehxJYOgi0v/
	wx7L9JPeF0gm4oQhLMiAgnznhtE+FNppu2jQnIexKxNmqp/p/WxeC4kXfXaH/oG1Wkje
	WSgA==
X-Gm-Message-State: APjAAAVHGcxxLyy/Ud0PYOAX5CFn2eJfRhq1SgJ8P7HcX3fYR+a+63lW
	rx+SJWw4HTjtgqqrZTgGtTFUXg==
X-Google-Smtp-Source: APXvYqyPGoZ7dA0YCKolv6giAEjzexiV99VFmvr1iBr830OQqLtRkfts460+E/LIM5SguLIdJoqS3Q==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr13660564wmi.103.1567175951546;
	Fri, 30 Aug 2019 07:39:11 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t203sm1611555wmf.42.2019.08.30.07.39.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 07:39:10 -0700 (PDT)
Message-ID: <9996bc502efa90a0dfc7d3cfc9612b3ff4faf907.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Jonathan Rajotte-Julien
	<jonathan.rajotte-julien@efficios.com>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Aug 2019 15:39:08 +0100
In-Reply-To: <CADkTA4Mf9u09J=M5xZx518va22xwUDqr=E4Xyq9jn2S2LLPevw@mail.gmail.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
	<CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
	<CADkTA4ONrm_Xtr9Mcdj359m5xqFqzKTzN8bB=VnRn2PKRxP+Wg@mail.gmail.com>
	<20190829152736.GA4696@joraj-alpa>
	<CADkTA4PybRmDHYumSEjULoaiXKDL9H4oXv6H7jOQv4VfsbOk1g@mail.gmail.com>
	<CADkTA4Mf9u09J=M5xZx518va22xwUDqr=E4Xyq9jn2S2LLPevw@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Aug 2019 14:39:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-08-29 at 11:32 -0400, Bruce Ashfield wrote:
> On Thu, Aug 29, 2019 at 11:31 AM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Thu, Aug 29, 2019 at 11:28 AM Jonathan Rajotte-Julien
> > <jonathan.rajotte-julien@efficios.com> wrote:
> > > > FWIW: lttng-ust builds fine for me with the 5.2 kernel + 5.2
> > > > headers,
> > > > it is one of the things I build and test as part of
> > > > core-image-kernel-dev.
> > >=20
> > > Even on ppc?
> > >=20
> >=20
> > yup. I build all arches for core-image-kernel-dev, which includes
> > all of lttng.
>=20
> but I've recently switched to RP's master-next branch, so hopefully a
> difference in the configs will pop out.

I'll post here about what I'm finding. eudev fails since SO_SNDTIMEO
isn't defined. This comes from asm-generic/socket.h which asm/socket.h
include.

richard@jet:work/ppce300c3-poky-linux/eudev/3.2.8-r0/build/src/shared$ /med=
ia/build1/poky/build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sy=
sroot-native/usr/bin/powerpc-poky-linux/powerpc-poky-linux-gcc -m32 -mhard-=
float -mcpu=3De300c3 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wforma=
t -Wformat-security -Werror=3Dformat-security --sysroot=3D/media/build1/pok=
y/build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot -DHAVE_=
CONFIG_H -I. -I../../../eudev-3.2.8/src/shared -I../.. -DUDEV_ROOT_RUN=3D\"=
/run\" -include ../../config.h -O2 -pipe -g -feliminate-unused-debug-types =
-fmacro-prefix-map=3D/media/build1/poky/build/tmp/work/ppce300c3-poky-linux=
/eudev/3.2.8-r0=3D/usr/src/debug/eudev/3.2.8-r0 -fdebug-prefix-map=3D/media=
/build1/poky/build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0=3D/usr/src/=
debug/eudev/3.2.8-r0 -fdebug-prefix-map=3D/media/build1/poky/build/tmp/work=
/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot=3D -fdebug-prefix-map=
=3D/media/build1/poky/build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/re=
cipe-sysroot-native=3D -c ../../../eudev-3.2.8/src/shared/log.c  -fPIC -DPI=
C -o .libs/log.o
../../../eudev-3.2.8/src/shared/log.c: In function 'create_log_socket':
../../../eudev-3.2.8/src/shared/log.c:128:43: error: 'SO_SNDTIMEO' undeclar=
ed (first use in this function); did you mean 'SO_TXTIME'?
  128 |         (void) setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(=
tv));
      |                                           ^~~~~~~~~~~
      |                                           SO_TXTIME

The file:
ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot/usr/include/asm-generic/=
socket.h
isn't included.

if I put:

#include <asm-generic/socket.h>

at the top of log.c it will build, everything else doesn't.

Debugging with gcc -e shows its including a different 'interesting' file.

My build has a=20
build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot-native/us=
r/lib/powerpc-poky-linux/gcc/powerpc-poky-linux/9.2.0/include-fixed/asm-gen=
eric/socket.h
which looks totally wrong when I compare it to the real asm-generic/socket.=
h.

Why this is in the toolchain I don't know and I'll have to investigate furt=
her.

I worry it depends on which MACHINE you have set when you build gcc-cross-p=
owerpc.

So we have some progress/a lead but more to be done.

Cheers,

Richard



