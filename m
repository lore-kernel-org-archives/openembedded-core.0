Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D261379CCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 15:24:57 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n32so12493272qte.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 07:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+dMqnOsi8digTjWhPfe2jDn1OfMFN4kg930X9ITFEEM=;
	b=bH4YhhVjHDwwYKg+FTO1di8Him5TRDYfmtyNFvJTIMXhIhzBG0kACUzKKJHTqAsmra
	RxgHVUzaF5iIzrZ4lwkiqGW7dKCoU0VBbRMXoZyi5GnTESqtDzPI/MYiHWWGP1uZlVUX
	n1NJbPbOgjT4BM3IeqZUBLlxBMqhpjwZ7LB0clSaLA/sE2eapQ9o65AVeYCVc2xs3flZ
	YpQLOBOUVF4L8KP9AAMexbS/gYesjiibIx63NLIwIe7kAJ8Tx9Yw1ln7jlFlK8SSFGsM
	jjo865yOj26bCwlX5/xe5ejW6e3nn4+O2MlR+r+LVvNDicM2vYl3jIx1BmuqFH2u27lo
	lwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+dMqnOsi8digTjWhPfe2jDn1OfMFN4kg930X9ITFEEM=;
	b=J3uMv99YHde6TZuKh72Pnv+cbg60Vkkbn3xR1TOrN/uifYA/E1Lqv+yigIODKnSjD6
	sVKo5PZ6T/3K9TlQ2adkb+nh+U2ivvg8LoomiU+V6o4p44c9wzKWZPVRswtYmh0VFaLe
	nSk29gq/f11uYIXbjjlLY2yzQEPvVxCx2pj9oY5mjrStkzTvmsWlPAVFuQjruutvhnQ4
	bBqZCFVMcZTUSAeLAIKqSVW3EVAtSxOqNNRYwbViPj5tJaju9FiPnSUiDJjLnj6xp0FV
	T0RlPY/SWQZBmlcpMbVXLPQ1BPg6jaE7rIKJGit1J0+PFyXfdKCB8YmQ/rfhQ3jnAWR+
	MHXQ==
X-Gm-Message-State: AHQUAuYVbnrmILbeEtMFVjwo6JyL5yEh9fJxUQb6qP1X5ZI+jT0NyOZY
	9DnMuVk+HUyONBO6SgQPiGaQvRXLTEt28Jkp+Rw=
X-Google-Smtp-Source: AHgI3IZrrZqrlp9Rm4giNCwEzuetyTpM5+qisrdSnMXQ/dPK4pbTKcPaH03yGL33rZkBVxmRukErIR4twsLlkTwayC0=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr19165347qtn.253.1549898697589; 
	Mon, 11 Feb 2019 07:24:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
	<20190209094419.GC2258@jama>
	<CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
	<20190209131942.GD2258@jama>
	<CAMKF1sqARPtVioVjYi5SLZBVn0j5juK_4a3a_3z7kNqoDiDYgA@mail.gmail.com>
In-Reply-To: <CAMKF1sqARPtVioVjYi5SLZBVn0j5juK_4a3a_3z7kNqoDiDYgA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Feb 2019 07:24:30 -0800
Message-ID: <CAMKF1sqmPww=SXwTxFuHQLQe7txJWer92_RGQqxJzJV+70Qzcg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Mon, 11 Feb 2019 15:24:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

here is a build failure with -fuse-ld=3Dgold

https://errors.yoctoproject.org/Errors/Details/222046/

On Sat, Feb 9, 2019 at 9:23 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> dump ld.bfd generated .so and see if this symbol is present
>
> On Sat, Feb 9, 2019 at 5:20 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >
> > On Sat, Feb 09, 2019 at 11:06:47AM +0100, Alexander Kanavin wrote:
> > > On Sat, 9 Feb 2019 at 10:44, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > > > Does it need to depend on mesa directly instead of one of virtual/*
> > > > providers?
> > > >
> > > > It fails to build for targets which use different mesa, e.g. mesa-g=
l:
> > > >
> > > > ERROR: Nothing PROVIDES 'mesa' (but /OE/build/luneos-master/webos-p=
orts/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_gi=
t.bb DEPENDS on or otherwise requires it)
> > > > mesa was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa-gl, =
not mesa
> > > > ERROR: Required build target 'virglrenderer' has no buildable provi=
ders.
> > > > Missing or unbuildable dependency chain was: ['virglrenderer', 'mes=
a']
> > >
> > > Yes, mesa-gl isn't going to work. Virgl needs the following bits (set
> > > in mesa recipe):
> > > PACKAGECONFIG_class-native ?=3D "gbm dri-native egl"
> > >
> > > dri-native is same as dri, but without drivers to save build time.
> >
> > OK, then with mesa used in qemux86* it still fails with:
> >
> > | Making all in vtest
> > | make[2]: Entering directory '/OE/build/luneos-master/webos-ports/tmp-=
glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build/vtest'
> > | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos=
-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/=
recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/sr=
c/gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/gal=
lium/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../=
git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-l=
inux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO=
_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types=
 -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i5=
86-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-=
r0                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos-=
ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=
=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos=
-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroo=
t-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -W=
error=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-ca=
st -c -o util.o ../../git/vtest/util.c
> > | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos=
-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/=
recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/sr=
c/gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/gal=
lium/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../=
git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-l=
inux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO=
_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types=
 -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i5=
86-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-=
r0                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos-=
ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=
=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos=
-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroo=
t-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -W=
error=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-ca=
st -c -o vtest_server.o ../../git/vtest/vtest_server.c
> > | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos=
-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/=
recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/sr=
c/gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/gal=
lium/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../=
git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-l=
inux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO=
_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types=
 -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i5=
86-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-=
r0                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos-=
ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=
=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos=
-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroo=
t-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -W=
error=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-ca=
st -c -o vtest_renderer.o ../../git/vtest/vtest_renderer.c
> > | ../i586-webos-linux-libtool  --tag=3DCC   --mode=3Dlink i586-webos-li=
nux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-master/webos-ports=
/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot -I..=
/../git/src/gallium/drivers/virgl -I../../git/src/gallium/include -I../../g=
it/src/gallium/auxiliary -I../../git/src/gallium/drivers -I../../git/includ=
e -I../../git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i5=
86-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DM=
ESA_EGL_NO_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-d=
ebug-types -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-gli=
bc/work/i586-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrende=
rer/0.7.0-r0                      -fdebug-prefix-map=3D/OE/build/luneos-mas=
ter/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/reci=
pe-sysroot=3D                      -fdebug-prefix-map=3D/OE/build/luneos-ma=
ster/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/rec=
ipe-sysroot-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-decl=
aration -Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-=
pointer-cast  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o virgl_test_=
server util.o vtest_server.o vtest_renderer.o ../src/libvirglrenderer.la
> > | i586-webos-linux-libtool: link: i586-webos-linux-gcc -m32 -march=3Di5=
86 --sysroot=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webo=
s-linux/virglrenderer/0.7.0-r0/recipe-sysroot -I../../git/src/gallium/drive=
rs/virgl -I../../git/src/gallium/include -I../../git/src/gallium/auxiliary =
-I../../git/src/gallium/drivers -I../../git/include -I../../git/src -I/OE/b=
uild/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrendere=
r/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X11_HEADERS -O -=
fno-omit-frame-pointer -g -feliminate-unused-debug-types -fdebug-prefix-map=
=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/virg=
lrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0 -fdebug-prefix-m=
ap=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/vi=
rglrenderer/0.7.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/OE/build/luneo=
s-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0=
/recipe-sysroot-native=3D -pipe -Wall -Wextra -Werror=3Dimplicit-function-d=
eclaration -Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-=
to-pointer-cast -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/vir=
gl_test_server util.o vtest_server.o vtest_renderer.o  ../src/.libs/libvirg=
lrenderer.so -lm -lgbm -lepoxy -pthread
> > | ../src/.libs/libvirglrenderer.so: error: undefined reference to 'drmP=
rimeHandleToFD'
> > | collect2: error: ld returned 1 exit status
> > | Makefile:429: recipe for target 'virgl_test_server' failed
> > | make[2]: *** [virgl_test_server] Error 1
> > | make[2]: Leaving directory '/OE/build/luneos-master/webos-ports/tmp-g=
libc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build/vtest'
> > | Makefile:510: recipe for target 'all-recursive' failed
> > | make[1]: *** [all-recursive] Error 1
> > | make[1]: Leaving directory '/OE/build/luneos-master/webos-ports/tmp-g=
libc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build'
> > | Makefile:419: recipe for target 'all' failed
> > | make: *** [all] Error 2
> > | ERROR: oe_runmake failed
> >
> > The fix from
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/qemu&id=3Dc29d4ccfe0a5f53c49883e55c2c2bb444997b1cf
> > is still applicable and fixes this.
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

