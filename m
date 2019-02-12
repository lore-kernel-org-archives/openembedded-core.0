Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 78EFE6C149
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 11:34:01 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n71so3777750ota.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 03:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i5xJi5FuxQdEMQPfsxE1wlw6UX7jBj6GRa0tX9XvJUk=;
	b=EgFEiEplxLaKuikZjuE49DRAJG5o3LGzH1fMswrzXOXEibL9zB7Wym5XFCoSZ57tsj
	MixafqVAnjrmSBTFztLCqUum6xbaDWySXkAaGOeMjWlSQdUQCA5b/1Z6vYA3shlswIHQ
	VwZXhGEbmUVS/NMOcKYUbgC/ULIJ8mc4gadzLbJZUFyRRBnA1m3L1rmbinB3tdUGJn/N
	n74wtEdHdWbsJEmahgDJIoj3x6dZvFGK7q/v8j7lS6kmxEVV6gOLhP25XqFWRnfOARtZ
	oAPPl7qed6d0jrR4sFmO+ZSUFy4O+ThBpjVhgk3It+6Bhu/sP9QoH0fyMa8Sx9rTkpDP
	rAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i5xJi5FuxQdEMQPfsxE1wlw6UX7jBj6GRa0tX9XvJUk=;
	b=BmwtXeKvpXErPpoOK90zJ5MVZWmsKQe8FwEH/NQBvU2eNrjj857O4q8pnh1jYZbvKn
	3eBSVOtjQCyopJ8Y46nf0NrpJB5tkjMAc5PaiUW0qQG4JiQ2Yz5q6Awqd+kuGNrkYlay
	ZBj4WTtx3bcGh5Bt4+v3ZEPi+5C0h2jwVgVVvAbZhyRhDkLN09lwdnVPQV6BKSvSqlpW
	S5yNpsybpDYbFCXQdPlDVJvrlTinyQ60MiCnvvbflRvF6NAn9kpk9vb99hkSG6JIUIru
	ZBF/LtROihVA0+eejTcsf03Q2QrTJn6ukFFCDMB8FHcRwFGlqcCMoVQ3RQ4emCLYMNTy
	/RgA==
X-Gm-Message-State: AHQUAuYxMn2SVA2R2AWygFxB8OrPSM0J5oetyPEecFO0QSdSxQEwviuH
	0rf0WZTkP4XgJAR63qdm/eJsFO0EKVyj7+T1dcg=
X-Google-Smtp-Source: AHgI3IY883oLAY9D//eSEsPFNmL1aYV/s4Vnpj/t0UDuDJns7DFlKyZvkh16FNyqUA6lg7Ji9uuXSBjCCLUajJ/NuI4=
X-Received: by 2002:a9d:66f:: with SMTP id 102mr3319733otn.293.1549971242442; 
	Tue, 12 Feb 2019 03:34:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
	<20190209094419.GC2258@jama>
	<CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
	<20190209131942.GD2258@jama>
	<CAMKF1sqARPtVioVjYi5SLZBVn0j5juK_4a3a_3z7kNqoDiDYgA@mail.gmail.com>
	<CAMKF1sqmPww=SXwTxFuHQLQe7txJWer92_RGQqxJzJV+70Qzcg@mail.gmail.com>
In-Reply-To: <CAMKF1sqmPww=SXwTxFuHQLQe7txJWer92_RGQqxJzJV+70Qzcg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Feb 2019 12:33:47 +0100
Message-ID: <CANNYZj8hHzm7ESP=xYVirngeX8zCkUNio-Fv5_TO_YJBigVOpQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 12 Feb 2019 11:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anyway, I sent it upstream:
https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/153
and added to my branch on poky-contrib.
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/virgl-g=
tk

Alex

On Mon, 11 Feb 2019 at 16:24, Khem Raj <raj.khem@gmail.com> wrote:
>
> here is a build failure with -fuse-ld=3Dgold
>
> https://errors.yoctoproject.org/Errors/Details/222046/
>
> On Sat, Feb 9, 2019 at 9:23 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > dump ld.bfd generated .so and see if this symbol is present
> >
> > On Sat, Feb 9, 2019 at 5:20 AM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > >
> > > On Sat, Feb 09, 2019 at 11:06:47AM +0100, Alexander Kanavin wrote:
> > > > On Sat, 9 Feb 2019 at 10:44, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> > > > > Does it need to depend on mesa directly instead of one of virtual=
/*
> > > > > providers?
> > > > >
> > > > > It fails to build for targets which use different mesa, e.g. mesa=
-gl:
> > > > >
> > > > > ERROR: Nothing PROVIDES 'mesa' (but /OE/build/luneos-master/webos=
-ports/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_=
git.bb DEPENDS on or otherwise requires it)
> > > > > mesa was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa-gl=
, not mesa
> > > > > ERROR: Required build target 'virglrenderer' has no buildable pro=
viders.
> > > > > Missing or unbuildable dependency chain was: ['virglrenderer', 'm=
esa']
> > > >
> > > > Yes, mesa-gl isn't going to work. Virgl needs the following bits (s=
et
> > > > in mesa recipe):
> > > > PACKAGECONFIG_class-native ?=3D "gbm dri-native egl"
> > > >
> > > > dri-native is same as dri, but without drivers to save build time.
> > >
> > > OK, then with mesa used in qemux86* it still fails with:
> > >
> > > | Making all in vtest
> > > | make[2]: Entering directory '/OE/build/luneos-master/webos-ports/tm=
p-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build/vtest'
> > > | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/lune=
os-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r=
0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/=
src/gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/g=
allium/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../.=
./git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos=
-linux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_=
NO_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-typ=
es -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/=
i586-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.=
0-r0                      -fdebug-prefix-map=3D/OE/build/luneos-master/webo=
s-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysro=
ot=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/web=
os-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysr=
oot-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration =
-Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-=
cast -c -o util.o ../../git/vtest/util.c
> > > | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/lune=
os-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r=
0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/=
src/gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/g=
allium/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../.=
./git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos=
-linux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_=
NO_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-typ=
es -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/=
i586-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.=
0-r0                      -fdebug-prefix-map=3D/OE/build/luneos-master/webo=
s-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysro=
ot=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/web=
os-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysr=
oot-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration =
-Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-=
cast -c -o vtest_server.o ../../git/vtest/vtest_server.c
> > > | i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/lune=
os-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r=
0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/=
src/gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/g=
allium/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../.=
./git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos=
-linux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_=
NO_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-typ=
es -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/=
i586-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.=
0-r0                      -fdebug-prefix-map=3D/OE/build/luneos-master/webo=
s-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysro=
ot=3D                      -fdebug-prefix-map=3D/OE/build/luneos-master/web=
os-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysr=
oot-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration =
-Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-=
cast -c -o vtest_renderer.o ../../git/vtest/vtest_renderer.c
> > > | ../i586-webos-linux-libtool  --tag=3DCC   --mode=3Dlink i586-webos-=
linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-master/webos-por=
ts/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot -I=
../../git/src/gallium/drivers/virgl -I../../git/src/gallium/include -I../..=
/git/src/gallium/auxiliary -I../../git/src/gallium/drivers -I../../git/incl=
ude -I../../git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/=
i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -=
DMESA_EGL_NO_X11_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused=
-debug-types -fdebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-g=
libc/work/i586-webos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglren=
derer/0.7.0-r0                      -fdebug-prefix-map=3D/OE/build/luneos-m=
aster/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/re=
cipe-sysroot=3D                      -fdebug-prefix-map=3D/OE/build/luneos-=
master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/r=
ecipe-sysroot-native=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-de=
claration -Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-t=
o-pointer-cast  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o virgl_tes=
t_server util.o vtest_server.o vtest_renderer.o ../src/libvirglrenderer.la
> > > | i586-webos-linux-libtool: link: i586-webos-linux-gcc -m32 -march=3D=
i586 --sysroot=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-we=
bos-linux/virglrenderer/0.7.0-r0/recipe-sysroot -I../../git/src/gallium/dri=
vers/virgl -I../../git/src/gallium/include -I../../git/src/gallium/auxiliar=
y -I../../git/src/gallium/drivers -I../../git/include -I../../git/src -I/OE=
/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrende=
rer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X11_HEADERS -O=
 -fno-omit-frame-pointer -g -feliminate-unused-debug-types -fdebug-prefix-m=
ap=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/vi=
rglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0 -fdebug-prefix=
-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/=
virglrenderer/0.7.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/OE/build/lun=
eos-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-=
r0/recipe-sysroot-native=3D -pipe -Wall -Wextra -Werror=3Dimplicit-function=
-declaration -Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Din=
t-to-pointer-cast -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/v=
irgl_test_server util.o vtest_server.o vtest_renderer.o  ../src/.libs/libvi=
rglrenderer.so -lm -lgbm -lepoxy -pthread
> > > | ../src/.libs/libvirglrenderer.so: error: undefined reference to 'dr=
mPrimeHandleToFD'
> > > | collect2: error: ld returned 1 exit status
> > > | Makefile:429: recipe for target 'virgl_test_server' failed
> > > | make[2]: *** [virgl_test_server] Error 1
> > > | make[2]: Leaving directory '/OE/build/luneos-master/webos-ports/tmp=
-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build/vtest'
> > > | Makefile:510: recipe for target 'all-recursive' failed
> > > | make[1]: *** [all-recursive] Error 1
> > > | make[1]: Leaving directory '/OE/build/luneos-master/webos-ports/tmp=
-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/build'
> > > | Makefile:419: recipe for target 'all' failed
> > > | make: *** [all] Error 2
> > > | ERROR: oe_runmake failed
> > >
> > > The fix from
> > > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djan=
sa/qemu&id=3Dc29d4ccfe0a5f53c49883e55c2c2bb444997b1cf
> > > is still applicable and fixes this.
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

