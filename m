Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B93C7C4A6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 17:23:43 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r21so4017803qkl.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 09:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9+BcZCltZS1MU9Kg77RAlp0LpY7jxUidgfnFtBSjxgw=;
	b=Omv+xOCtwCrjZSxybEVa5Q9jxEIOdX2ySD9FdQwF+LCTIdwoiEAKlMBm7d0gnzM+kg
	8cIp14veRZ54aIg90ugt3W4Ir2BwWsOW2u4TF8JGH+FrVPZc9qm0dXNPCFpE0bYXcaCf
	9n+o5Fo00ZGzgOHVxz3N/pN+hSKhHjdAHfSQzMMergQpIMTCPGUONsDdjTXeztz0LH8t
	47JHEfV4i3v3TBSUPEprOPonrx/7xz/hvOFKN8Tc9Zqq/VzeKv1c4vGAoeoVLX/02PfQ
	vhk0hN4e/SsPh+xXLVSjOUW7xWDQBzR6dDAqDPaZERfWSaHLKkyfllkXSMddUOXPaT9U
	Aawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9+BcZCltZS1MU9Kg77RAlp0LpY7jxUidgfnFtBSjxgw=;
	b=maEFzNiGNgfjyhry1R8RQWO7bSNVPF0ZgjEwHTkPSRuvKyBBS5X/U5B4R8dlI3MfN/
	EhxzNfj967z+zIGjcz10yve7rNhJEOSn+0ciLmL83hVxSmIvGCCYtjs8LENc17tzznJG
	rVtEvbNfrJUUQO0fqxjwVYY3DQX/EGMduavONpQgPNG/P9e+6AT7WweALr+5g90Ii2Qr
	M8tFoFFqlS4fyGNVhMBrgeFO+Wy6qUAyeMBAhpsweWg8KvEZkATSGz8z0cRlSPxpLlFY
	KKrZwdXKD/ZxnNx8kCGiAImOcJzyJfFQhggBIYWGWd26vABIaGERapmtGkSa/e7en2G3
	pG5Q==
X-Gm-Message-State: AHQUAuY+ZBilgb9r7A94jNqGIiKsdsvsexipQ5oulj+6RfpvxCxIRQQv
	NgVonUVV6zuywk7kFVo8xYSkMApbkcGcO1FWiLI=
X-Google-Smtp-Source: AHgI3IaApAWuufWG1odcJVSvk0CW51mlTtmNEjbi+Zk8qvy3D6GusOLbtA7irzGEe+Dayxlppo+szoQiYlCq/Ipq44c=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr20132126qka.206.1549733023756;
	Sat, 09 Feb 2019 09:23:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
	<20190209094419.GC2258@jama>
	<CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
	<20190209131942.GD2258@jama>
In-Reply-To: <20190209131942.GD2258@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Feb 2019 09:23:17 -0800
Message-ID: <CAMKF1sqARPtVioVjYi5SLZBVn0j5juK_4a3a_3z7kNqoDiDYgA@mail.gmail.com>
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
X-List-Received-Date: Sat, 09 Feb 2019 17:23:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dump ld.bfd generated .so and see if this symbol is present

On Sat, Feb 9, 2019 at 5:20 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Sat, Feb 09, 2019 at 11:06:47AM +0100, Alexander Kanavin wrote:
> > On Sat, 9 Feb 2019 at 10:44, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> > > Does it need to depend on mesa directly instead of one of virtual/*
> > > providers?
> > >
> > > It fails to build for targets which use different mesa, e.g. mesa-gl:
> > >
> > > ERROR: Nothing PROVIDES 'mesa' (but /OE/build/luneos-master/webos-por=
ts/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_git.=
bb DEPENDS on or otherwise requires it)
> > > mesa was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa-gl, no=
t mesa
> > > ERROR: Required build target 'virglrenderer' has no buildable provide=
rs.
> > > Missing or unbuildable dependency chain was: ['virglrenderer', 'mesa'=
]
> >
> > Yes, mesa-gl isn't going to work. Virgl needs the following bits (set
> > in mesa recipe):
> > PACKAGECONFIG_class-native ?=3D "gbm dri-native egl"
> >
> > dri-native is same as dri, but without drivers to save build time.
>
> OK, then with mesa used in qemux86* it still fails with:
>
> | Making all in vtest
> | make[2]: Entering directory '/OE/build/luneos-master/webos-ports/tmp-gl=
ibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build/vtest'
> | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-m=
aster/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/re=
cipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/src/=
gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/galli=
um/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../gi=
t/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-lin=
ux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X=
11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types -=
fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586=
-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0=
                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos-po=
rts/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=
=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos=
-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroo=
t-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -W=
error=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-ca=
st -c -o util.o ../../git/vtest/util.c
> | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-m=
aster/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/re=
cipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/src/=
gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/galli=
um/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../gi=
t/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-lin=
ux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X=
11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types -=
fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586=
-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0=
                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos-po=
rts/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=
=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos=
-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroo=
t-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -W=
error=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-ca=
st -c -o vtest_server.o ../../git/vtest/vtest_server.c
> | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-m=
aster/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/re=
cipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/src/=
gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/galli=
um/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../gi=
t/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-lin=
ux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X=
11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types -=
fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586=
-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0=
                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos-po=
rts/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=
=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/webos=
-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroo=
t-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -W=
error=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-ca=
st -c -o vtest_renderer.o ../../git/vtest/vtest_renderer.c
> | ../i586-webos-linux-libtool  --tag=3DCC   --mode=3Dlink i586-webos-linu=
x-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-master/webos-ports/t=
mp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot -I../.=
./git/src/gallium/drivers/virgl -I../../git/src/gallium/include -I../../git=
/src/gallium/auxiliary -I../../git/src/gallium/drivers -I../../git/include =
-I../../git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586=
-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMES=
A_EGL_NO_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-deb=
ug-types -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc=
/work/i586-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrendere=
r/0.7.0-r0                      -fdebug-prefix-map=3D/OE/build/luneos-maste=
r/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe=
-sysroot=3D                      -fdebug-prefix-map=3D/OE/build/luneos-mast=
er/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recip=
e-sysroot-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declar=
ation -Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-po=
inter-cast  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o virgl_test_se=
rver util.o vtest_server.o vtest_renderer.o ../src/libvirglrenderer.la
> | i586-webos-linux-libtool: link: i586-webos-linux-gcc -m32 -march=3Di586=
 --sysroot=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-=
linux/virglrenderer/0.7.0-r0/recipe-sysroot -I../../git/src/gallium/drivers=
/virgl -I../../git/src/gallium/include -I../../git/src/gallium/auxiliary -I=
../../git/src/gallium/drivers -I../../git/include -I../../git/src -I/OE/bui=
ld/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/=
0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X11_HEADERS -O -fn=
o-omit-frame-pointer -g -feliminate-unused-debug-types -fdebug-prefix-map=
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
> | ../src/.libs/libvirglrenderer.so: error: undefined reference to 'drmPri=
meHandleToFD'
> | collect2: error: ld returned 1 exit status
> | Makefile:429: recipe for target 'virgl_test_server' failed
> | make[2]: *** [virgl_test_server] Error 1
> | make[2]: Leaving directory '/OE/build/luneos-master/webos-ports/tmp-gli=
bc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build/vtest'
> | Makefile:510: recipe for target 'all-recursive' failed
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory '/OE/build/luneos-master/webos-ports/tmp-gli=
bc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build'
> | Makefile:419: recipe for target 'all' failed
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
>
> The fix from
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/q=
emu&id=3Dc29d4ccfe0a5f53c49883e55c2c2bb444997b1cf
> is still applicable and fixes this.
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

