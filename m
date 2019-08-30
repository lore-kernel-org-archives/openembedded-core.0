Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 200667CE12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 14:50:55 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h15so6720064ljg.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g+HUuc9+jASXMCwnFKq7J+En1yu9mTJOHotciTlEWv4=;
	b=kmpW3KXdfa9f43tTAhBjVYD2jWBPZRUHZ9DNGesGprL0Pi/zE2XGLMhKMCgNdC4q5s
	yzfZkXxWZoDV2BZDHmsKNWDoiZK2+reAplUw5/ACYvcUPiq/PexKan3Qm9Rjynnh9Z+z
	5tc6eHi4QMdwWGtnDpdhukdYdbvoegwwAjPcShfZ7aD4qbho2ZDNOq87I6f7lGmRzab4
	DmiSyWLtyG57NR61qFYG7MP1jnfuTIMwsYnuw8DSi5KE6jLvVjGump6VRefNJ5NU56oB
	vVKdWLLFfSaadYu41NQTsirFd9NLrQlZBY9qKWRECbXvynS1lnAT1Qstmr4VaXpRd1bU
	D5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g+HUuc9+jASXMCwnFKq7J+En1yu9mTJOHotciTlEWv4=;
	b=iISXYc6KOlMkcF0bn3Vv21ETC/wRQGC2s2Q5LC8S5YGLHQrslHv49p8vvdNO0iKS+i
	cN9C/D8/w9byTAVMn099FLWAvXzy+UIxAy+0hCJv8FBpbFfsaar+vw+GIuVr+qgmk0Y2
	GZ6EHUxCk2qYVfQNoSfMZB23RTviKk9FzTufD/R3W/3qH3ItsSwQmjo3vm7SiZlR6Z3K
	ZbnNt973+ltsfhGDL18HKn0XaWbrq9l9n3osKmfA/cowqKw4t7BOlk67ZuQYKg2XycrJ
	qoOgqKrMMvXKlkKOkm11ANjtD0CjL3BHUf5YyQ/1EcAwWZ0h1Xsu9P1db0vSliKHe3mj
	JpQg==
X-Gm-Message-State: APjAAAXhiz3vhdKpTiei1Js3xz5k2Q8P0oaXZEVqip6lNfK2sab5/k0h
	e/r7/isqc4bMA1Z99WN85hgWH23yV+GDSQV/12Y=
X-Google-Smtp-Source: APXvYqwvSewspv5M7rYuymBriuWvCdQO8Pk4RB68mFSK0rxg0HXMT+QwF6phlc86XzoWZOR0xyShm5HmrLT1ZZyilnw=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr8539605ljo.87.1567176656214; 
	Fri, 30 Aug 2019 07:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
	<CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
	<CADkTA4ONrm_Xtr9Mcdj359m5xqFqzKTzN8bB=VnRn2PKRxP+Wg@mail.gmail.com>
	<20190829152736.GA4696@joraj-alpa>
	<CADkTA4PybRmDHYumSEjULoaiXKDL9H4oXv6H7jOQv4VfsbOk1g@mail.gmail.com>
	<CADkTA4Mf9u09J=M5xZx518va22xwUDqr=E4Xyq9jn2S2LLPevw@mail.gmail.com>
	<9996bc502efa90a0dfc7d3cfc9612b3ff4faf907.camel@linuxfoundation.org>
In-Reply-To: <9996bc502efa90a0dfc7d3cfc9612b3ff4faf907.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 10:50:44 -0400
Message-ID: <CADkTA4O=5M78CZjuPiNB8G1_dZwDQ0C3PYm126xMbBe+SFrAZA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Fri, 30 Aug 2019 14:50:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2019 at 10:39 AM <richard.purdie@linuxfoundation.org> wrote=
:
>
> On Thu, 2019-08-29 at 11:32 -0400, Bruce Ashfield wrote:
> > On Thu, Aug 29, 2019 at 11:31 AM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > > On Thu, Aug 29, 2019 at 11:28 AM Jonathan Rajotte-Julien
> > > <jonathan.rajotte-julien@efficios.com> wrote:
> > > > > FWIW: lttng-ust builds fine for me with the 5.2 kernel + 5.2
> > > > > headers,
> > > > > it is one of the things I build and test as part of
> > > > > core-image-kernel-dev.
> > > >
> > > > Even on ppc?
> > > >
> > >
> > > yup. I build all arches for core-image-kernel-dev, which includes
> > > all of lttng.
> >
> > but I've recently switched to RP's master-next branch, so hopefully a
> > difference in the configs will pop out.
>
> I'll post here about what I'm finding. eudev fails since SO_SNDTIMEO
> isn't defined. This comes from asm-generic/socket.h which asm/socket.h
> include.
>
> richard@jet:work/ppce300c3-poky-linux/eudev/3.2.8-r0/build/src/shared$ /m=
edia/build1/poky/build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-=
sysroot-native/usr/bin/powerpc-poky-linux/powerpc-poky-linux-gcc -m32 -mhar=
d-float -mcpu=3De300c3 -fstack-protector-strong -D_FORTIFY_SOURCE=3D2 -Wfor=
mat -Wformat-security -Werror=3Dformat-security --sysroot=3D/media/build1/p=
oky/build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot -DHAV=
E_CONFIG_H -I. -I../../../eudev-3.2.8/src/shared -I../.. -DUDEV_ROOT_RUN=3D=
\"/run\" -include ../../config.h -O2 -pipe -g -feliminate-unused-debug-type=
s -fmacro-prefix-map=3D/media/build1/poky/build/tmp/work/ppce300c3-poky-lin=
ux/eudev/3.2.8-r0=3D/usr/src/debug/eudev/3.2.8-r0 -fdebug-prefix-map=3D/med=
ia/build1/poky/build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0=3D/usr/sr=
c/debug/eudev/3.2.8-r0 -fdebug-prefix-map=3D/media/build1/poky/build/tmp/wo=
rk/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot=3D -fdebug-prefix-map=
=3D/media/build1/poky/build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/re=
cipe-sysroot-native=3D -c ../../../eudev-3.2.8/src/shared/log.c  -fPIC -DPI=
C -o .libs/log.o
> ../../../eudev-3.2.8/src/shared/log.c: In function 'create_log_socket':
> ../../../eudev-3.2.8/src/shared/log.c:128:43: error: 'SO_SNDTIMEO' undecl=
ared (first use in this function); did you mean 'SO_TXTIME'?
>   128 |         (void) setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeo=
f(tv));
>       |                                           ^~~~~~~~~~~
>       |                                           SO_TXTIME
>
> The file:
> ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot/usr/include/asm-generi=
c/socket.h
> isn't included.
>
> if I put:
>
> #include <asm-generic/socket.h>
>
> at the top of log.c it will build, everything else doesn't.
>
> Debugging with gcc -e shows its including a different 'interesting' file.
>
> My build has a
> build/tmp/work/ppce300c3-poky-linux/eudev/3.2.8-r0/recipe-sysroot-native/=
usr/lib/powerpc-poky-linux/gcc/powerpc-poky-linux/9.2.0/include-fixed/asm-g=
eneric/socket.h
> which looks totally wrong when I compare it to the real asm-generic/socke=
t.h.

This is similar to what I was seeing on some early qemuppc builds as
well. fixincludes was tossing out the original file and putting in a
broken variant. I had to hide the "fixed" files to build. But then it
stopped happening, so I moved on.

I'm not familiar with how/when fixincludes fires, so I have no idea
about any possible races, etc, that could be happening.

I'll do some more research down that route to see if anything pops up.

Bruce

>
> Why this is in the toolchain I don't know and I'll have to investigate fu=
rther.
>
> I worry it depends on which MACHINE you have set when you build gcc-cross=
-powerpc.
>
> So we have some progress/a lead but more to be done.
>
> Cheers,
>
> Richard
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

