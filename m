Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D2A4E6BE39
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 13:19:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a62so8377104wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 05:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=B/d9W7dt+olbGChGSzatm8azOYUsaCPvWN7oldf6Ofk=;
	b=p5sF86LqRNf/zTnz5N334/EqRwih7WBZS0n4WPXKu8lurpk0/deVip15T3Gx0bGn5z
	3L0Aw9Fypvh67TPG8GxM45auhu+LxYLAuDEzrE+KAsYhXgoI63aYMn7kwjL/Myq0wOzt
	4LTIq9U10TveA2sI1S4IdNz3XO1IopvOyggFb2/PmdyDLVLoTace+xx6jfxjHbsxRe9L
	ce+6YnZe9+a6BQlz9Ssy/y58KuLypaGBMId9VsOBlDeIstm7bXbxqHJAuiLmWMpFmNLo
	NVoX/caO/SZWsDYjnwbeWMhKo/Cd6C616LzfiPQEusOMloFXh/NKgSNDO+PhTgL7FltN
	xY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=B/d9W7dt+olbGChGSzatm8azOYUsaCPvWN7oldf6Ofk=;
	b=mRggWpXBd5KwTcwmafyjn3uDUCmGAJyjOaTrWUGMf3FpJ8aejQ7JTT0lEqC9EAPg7b
	mHwNbqOSd2kt73jLzxr+RZTEA4Lp2sX3cZsENYZ1WN1uTDgMkaSIdR6AvI8BoN07Usup
	uthAgLsAhWBzp5bgFimuHDv3wAJlJ7acOuB6ueBHUHIM5IR1653ZTA5Wsz7Gzv7Fi8vs
	JGZpwAjSx8Eqf4Sm1peOltbneMvzK9jJty5YKbMe76uWvk6CbsVgQ1UpW8bCPzZCSq7K
	SrjxNjeydytlLU1Tzry1wvJ0umQc0ydIqRnt0oeGAZg8fxSHLIhyfY0oy8wPpyoRlyFi
	41nQ==
X-Gm-Message-State: AHQUAuYNAO0+Dd3yA9qPe8Tcc6LEFczMCZZY+D2gpNEvfX5R/FSq7ZxQ
	3Y3ksQP4Yme/XB8IzwCPdTM=
X-Google-Smtp-Source: AHgI3IZAwzUC0JPcI7CludvSrM+JqlOkdTBAkcgNO4ViZddp0zzNALcDh+5NXQ7zzaOVt+5nIVJJAQ==
X-Received: by 2002:adf:9083:: with SMTP id i3mr20470811wri.124.1549718381326; 
	Sat, 09 Feb 2019 05:19:41 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c196sm9275249wme.5.2019.02.09.05.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 09 Feb 2019 05:19:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 9 Feb 2019 14:19:42 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190209131942.GD2258@jama>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
	<20190209094419.GC2258@jama>
	<CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
X-List-Received-Date: Sat, 09 Feb 2019 13:19:41 -0000
X-Groupsio-MsgNum: 121006
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iVCmgExH7+hIHJ1A"
Content-Disposition: inline

--iVCmgExH7+hIHJ1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 09, 2019 at 11:06:47AM +0100, Alexander Kanavin wrote:
> On Sat, 9 Feb 2019 at 10:44, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Does it need to depend on mesa directly instead of one of virtual/*
> > providers?
> >
> > It fails to build for targets which use different mesa, e.g. mesa-gl:
> >
> > ERROR: Nothing PROVIDES 'mesa' (but /OE/build/luneos-master/webos-ports=
/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb=
 DEPENDS on or otherwise requires it)
> > mesa was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa-gl, not =
mesa
> > ERROR: Required build target 'virglrenderer' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['virglrenderer', 'mesa']
>=20
> Yes, mesa-gl isn't going to work. Virgl needs the following bits (set
> in mesa recipe):
> PACKAGECONFIG_class-native ?=3D "gbm dri-native egl"
>=20
> dri-native is same as dri, but without drivers to save build time.

OK, then with mesa used in qemux86* it still fails with:

| Making all in vtest
| make[2]: Entering directory '/OE/build/luneos-master/webos-ports/tmp-glib=
c/work/i586-webos-linux/virglrenderer/0.7.0-r0/build/vtest'
| i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-mas=
ter/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/reci=
pe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/src/ga=
llium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/gallium=
/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../git/=
src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux=
/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X11=
_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-w=
ebos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0  =
                    -fdebug-prefix-map=3D/OE/build/luneos-master/webos-port=
s/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=3D =
                     -fdebug-prefix-map=3D/OE/build/luneos-master/webos-por=
ts/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot-na=
tive=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -Werro=
r=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-cast -=
c -o util.o ../../git/vtest/util.c
| i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-mas=
ter/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/reci=
pe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/src/ga=
llium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/gallium=
/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../git/=
src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux=
/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X11=
_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-w=
ebos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0  =
                    -fdebug-prefix-map=3D/OE/build/luneos-master/webos-port=
s/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=3D =
                     -fdebug-prefix-map=3D/OE/build/luneos-master/webos-por=
ts/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot-na=
tive=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -Werro=
r=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-cast -=
c -o vtest_server.o ../../git/vtest/vtest_server.c
| i586-webos-linux-gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-mas=
ter/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/reci=
pe-sysroot -DHAVE_CONFIG_H -I. -I../../git/vtest -I..    -I../../git/src/ga=
llium/drivers/virgl -I../../git/src/gallium/include -I../../git/src/gallium=
/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I../../git/=
src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux=
/virglrenderer/0.7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X11=
_HEADERS   -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-w=
ebos-linux/virglrenderer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0  =
                    -fdebug-prefix-map=3D/OE/build/luneos-master/webos-port=
s/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot=3D =
                     -fdebug-prefix-map=3D/OE/build/luneos-master/webos-por=
ts/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot-na=
tive=3D  -pipe -Wall -Wextra -Werror=3Dimplicit-function-declaration -Werro=
r=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to-pointer-cast -=
c -o vtest_renderer.o ../../git/vtest/vtest_renderer.c
| ../i586-webos-linux-libtool  --tag=3DCC   --mode=3Dlink i586-webos-linux-=
gcc  -m32 -march=3Di586 --sysroot=3D/OE/build/luneos-master/webos-ports/tmp=
-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/recipe-sysroot -I../../=
git/src/gallium/drivers/virgl -I../../git/src/gallium/include -I../../git/s=
rc/gallium/auxiliary -I../../git/src/gallium/drivers -I../../git/include -I=
=2E./../git/src   -I/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586=
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
| i586-webos-linux-libtool: link: i586-webos-linux-gcc -m32 -march=3Di586 -=
-sysroot=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-li=
nux/virglrenderer/0.7.0-r0/recipe-sysroot -I../../git/src/gallium/drivers/v=
irgl -I../../git/src/gallium/include -I../../git/src/gallium/auxiliary -I..=
/../git/src/gallium/drivers -I../../git/include -I../../git/src -I/OE/build=
/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.=
7.0-r0/recipe-sysroot/usr/include/libdrm -DMESA_EGL_NO_X11_HEADERS -O -fno-=
omit-frame-pointer -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/=
OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/virglren=
derer/0.7.0-r0=3D/usr/src/debug/virglrenderer/0.7.0-r0 -fdebug-prefix-map=
=3D/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/virg=
lrenderer/0.7.0-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/OE/build/luneos-=
master/webos-ports/tmp-glibc/work/i586-webos-linux/virglrenderer/0.7.0-r0/r=
ecipe-sysroot-native=3D -pipe -Wall -Wextra -Werror=3Dimplicit-function-dec=
laration -Werror=3Dmissing-prototypes -Wmissing-prototypes -Werror=3Dint-to=
-pointer-cast -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/virgl=
_test_server util.o vtest_server.o vtest_renderer.o  ../src/.libs/libvirglr=
enderer.so -lm -lgbm -lepoxy -pthread
| ../src/.libs/libvirglrenderer.so: error: undefined reference to 'drmPrime=
HandleToFD'
| collect2: error: ld returned 1 exit status
| Makefile:429: recipe for target 'virgl_test_server' failed
| make[2]: *** [virgl_test_server] Error 1
| make[2]: Leaving directory '/OE/build/luneos-master/webos-ports/tmp-glibc=
/work/i586-webos-linux/virglrenderer/0.7.0-r0/build/vtest'
| Makefile:510: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory '/OE/build/luneos-master/webos-ports/tmp-glibc=
/work/i586-webos-linux/virglrenderer/0.7.0-r0/build'
| Makefile:419: recipe for target 'all' failed
| make: *** [all] Error 2
| ERROR: oe_runmake failed

The fix from
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/qem=
u&id=3Dc29d4ccfe0a5f53c49883e55c2c2bb444997b1cf
is still applicable and fixes this.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iVCmgExH7+hIHJ1A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXF7TbQAKCRA3VSO3ZXaA
HE72AJ9lzIIjwC8ejqZ6W9jbmC65iq6x3ACgi+vpSkPbBnQzG5K8S6Jz6dq5I4k=
=pxo5
-----END PGP SIGNATURE-----

--iVCmgExH7+hIHJ1A--
