Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A305C7EE29
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 20:33:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.24942.1685910807764119267
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 13:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nknyd56b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685910805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NH2nnY6BYiK+pjiu72fj/NPwzDtePrdp06dZ2cACxKs=;
	b=nknyd56bL3+FREhh8IGYxlTURqo+RyybjbyR8vxTKM0fkVuApRXJVDjhoRuZDUm+s/qTxN
	HBWiYfkBY3cnHX470hW2ZRYsDvoNXtfkb5HidvXLgCvC6sUVo36rkiGk71oCRB+Kyrxhnj
	ZjysVrDAqFd1pd3a4HcfwKBUUfDkgWdnmFoiQadYmNHTVSoopN8D6NmPbwO5RzavdlgnOG
	T2e5BpwauoUX9jOi469jlU88OThahxDgaPSeMROdDA3mBNb9Js5D0fQX4SZIdM5U/Uv3zp
	wwAfm77DDKapzX3gndeBYl4r4kx6e4oeQUWpm/t8EIIla6I22Ph7f1u+Q7wB4w==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51BA1FF806;
	Sun,  4 Jun 2023 20:33:25 +0000 (UTC)
Date: Sun, 4 Jun 2023 22:33:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Stefano Babic <sbabic@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libubootenv: upgrade 0.3.3 -> 0.3.4
Message-ID: <20230604203324a71d55c7@mail.local>
References: <20230602112737.28608-1-sbabic@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230602112737.28608-1-sbabic@denx.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 20:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182368

Hello Stefano,

This caused the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7124/step=
s/12/logs/stdio

| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=3D1 cmake --build /home/pokybuild/yocto-worker/qemux86-worl=
d/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/bui=
ld --target all --
| [1/8] cd /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/=
x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/build/src && /home/pokybui=
ld/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/li=
b32-libubootenv/0.3.4-r0/recipe-sysroot-native/usr/bin/cmake -E create_syml=
ink fw_printenv fw_setenv
| [2/8] /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86=
-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/recipe-sysroot-native/usr/bin=
/i686-pokymllib32-linux/i686-pokymllib32-linux-gcc --sysroot=3D/home/pokybu=
ild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/l=
ib32-libubootenv/0.3.4-r0/lib32-recipe-sysroot -DVERSION=3D\"0.3.4\" -Duboo=
tenv_EXPORTS -I/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/w=
ork/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git/src -m32 -fstack-p=
rotector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werr=
or=3Dformat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=
=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-poky=
mllib32-linux/lib32-libubootenv/0.3.4-r0/lib32-recipe-sysroot  -O2 -pipe -g=
 -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=3D/h=
ome/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib=
32-linux/lib32-libubootenv/0.3.4-r0/git=3D/usr/src/debug/lib32-libubootenv/=
0.3.4-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/qemux86-world/b=
uild/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git=3D=
/usr/src/debug/lib32-libubootenv/0.3.4-r0  -fmacro-prefix-map=3D/home/pokyb=
uild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/=
lib32-libubootenv/0.3.4-r0/build=3D/usr/src/debug/lib32-libubootenv/0.3.4-r=
0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/qemux86-world/build/bu=
ild/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/build=3D/usr/=
src/debug/lib32-libubootenv/0.3.4-r0  -fdebug-prefix-map=3D/home/pokybuild/=
yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32=
-libubootenv/0.3.4-r0/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3D/home/p=
okybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-li=
nux/lib32-libubootenv/0.3.4-r0/lib32-recipe-sysroot=3D  -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-poky=
mllib32-linux/lib32-libubootenv/0.3.4-r0/recipe-sysroot-native=3D  -std=3Dg=
nu99 -DNDEBUG -fPIC -MD -MT src/CMakeFiles/ubootenv.dir/uboot_env.c.o -MF s=
rc/CMakeFiles/ubootenv.dir/uboot_env.c.o.d -o src/CMakeFiles/ubootenv.dir/u=
boot_env.c.o -c /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/=
work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git/src/uboot_env.c
| FAILED: src/CMakeFiles/ubootenv.dir/uboot_env.c.o
| /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokym=
llib32-linux/lib32-libubootenv/0.3.4-r0/recipe-sysroot-native/usr/bin/i686-=
pokymllib32-linux/i686-pokymllib32-linux-gcc --sysroot=3D/home/pokybuild/yo=
cto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-l=
ibubootenv/0.3.4-r0/lib32-recipe-sysroot -DVERSION=3D\"0.3.4\" -Dubootenv_E=
XPORTS -I/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x8=
6-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git/src -m32 -fstack-protect=
or-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3D/hom=
e/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32=
-linux/lib32-libubootenv/0.3.4-r0/lib32-recipe-sysroot  -O2 -pipe -g -felim=
inate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=3D/home/pok=
ybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linu=
x/lib32-libubootenv/0.3.4-r0/git=3D/usr/src/debug/lib32-libubootenv/0.3.4-r=
0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/qemux86-world/build/bu=
ild/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git=3D/usr/sr=
c/debug/lib32-libubootenv/0.3.4-r0  -fmacro-prefix-map=3D/home/pokybuild/yo=
cto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-l=
ibubootenv/0.3.4-r0/build=3D/usr/src/debug/lib32-libubootenv/0.3.4-r0  -fde=
bug-prefix-map=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp=
/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/build=3D/usr/src/deb=
ug/lib32-libubootenv/0.3.4-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-w=
orker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubo=
otenv/0.3.4-r0/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3D/home/pokybuil=
d/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib=
32-libubootenv/0.3.4-r0/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3D/home=
/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-=
linux/lib32-libubootenv/0.3.4-r0/recipe-sysroot-native=3D  -std=3Dgnu99 -DN=
DEBUG -fPIC -MD -MT src/CMakeFiles/ubootenv.dir/uboot_env.c.o -MF src/CMake=
Files/ubootenv.dir/uboot_env.c.o.d -o src/CMakeFiles/ubootenv.dir/uboot_env=
=2Ec.o -c /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x=
86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git/src/uboot_env.c
| /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokym=
llib32-linux/lib32-libubootenv/0.3.4-r0/git/src/uboot_env.c:36:10: fatal er=
ror: yaml.h: No such file or directory
|    36 | #include <yaml.h>
|       |          ^~~~~~~~
| compilation terminated.
| [3/8] /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86=
-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/recipe-sysroot-native/usr/bin=
/i686-pokymllib32-linux/i686-pokymllib32-linux-gcc --sysroot=3D/home/pokybu=
ild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/l=
ib32-libubootenv/0.3.4-r0/lib32-recipe-sysroot -DVERSION=3D\"0.3.4\" -I/hom=
e/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32=
-linux/lib32-libubootenv/0.3.4-r0/git/src -m32 -fstack-protector-strong  -O=
2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3D/home/pokybuild/y=
octo-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-=
libubootenv/0.3.4-r0/lib32-recipe-sysroot  -O2 -pipe -g -feliminate-unused-=
debug-types -fcanon-prefix-map  -fmacro-prefix-map=3D/home/pokybuild/yocto-=
worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libub=
ootenv/0.3.4-r0/git=3D/usr/src/debug/lib32-libubootenv/0.3.4-r0  -fdebug-pr=
efix-map=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/=
x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git=3D/usr/src/debug/lib32=
-libubootenv/0.3.4-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/qe=
mux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.=
3.4-r0/build=3D/usr/src/debug/lib32-libubootenv/0.3.4-r0  -fdebug-prefix-ma=
p=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pok=
ymllib32-linux/lib32-libubootenv/0.3.4-r0/build=3D/usr/src/debug/lib32-libu=
bootenv/0.3.4-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/qemux86=
-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r=
0/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3D/home/pokybuild/yocto-worke=
r/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubooten=
v/0.3.4-r0/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild/yo=
cto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-l=
ibubootenv/0.3.4-r0/recipe-sysroot-native=3D  -std=3Dgnu99 -DNDEBUG -MD -MT=
 src/CMakeFiles/ubootenv_static.dir/uboot_env.c.o -MF src/CMakeFiles/uboote=
nv_static.dir/uboot_env.c.o.d -o src/CMakeFiles/ubootenv_static.dir/uboot_e=
nv.c.o -c /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x=
86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git/src/uboot_env.c
| FAILED: src/CMakeFiles/ubootenv_static.dir/uboot_env.c.o
| /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokym=
llib32-linux/lib32-libubootenv/0.3.4-r0/recipe-sysroot-native/usr/bin/i686-=
pokymllib32-linux/i686-pokymllib32-linux-gcc --sysroot=3D/home/pokybuild/yo=
cto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-l=
ibubootenv/0.3.4-r0/lib32-recipe-sysroot -DVERSION=3D\"0.3.4\" -I/home/poky=
build/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux=
/lib32-libubootenv/0.3.4-r0/git/src -m32 -fstack-protector-strong  -O2 -D_F=
ORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -D_T=
IME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3D/home/pokybuild/yocto-w=
orker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubo=
otenv/0.3.4-r0/lib32-recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-=
types -fcanon-prefix-map  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker=
/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv=
/0.3.4-r0/git=3D/usr/src/debug/lib32-libubootenv/0.3.4-r0  -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-po=
kymllib32-linux/lib32-libubootenv/0.3.4-r0/git=3D/usr/src/debug/lib32-libub=
ootenv/0.3.4-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/qemux86-=
world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0=
/build=3D/usr/src/debug/lib32-libubootenv/0.3.4-r0  -fdebug-prefix-map=3D/h=
ome/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib=
32-linux/lib32-libubootenv/0.3.4-r0/build=3D/usr/src/debug/lib32-libubooten=
v/0.3.4-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/qemux86-world=
/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/lib3=
2-recipe-sysroot=3D  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/qemu=
x86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.=
4-r0/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild/yocto-wo=
rker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libuboo=
tenv/0.3.4-r0/recipe-sysroot-native=3D  -std=3Dgnu99 -DNDEBUG -MD -MT src/C=
MakeFiles/ubootenv_static.dir/uboot_env.c.o -MF src/CMakeFiles/ubootenv_sta=
tic.dir/uboot_env.c.o.d -o src/CMakeFiles/ubootenv_static.dir/uboot_env.c.o=
 -c /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pok=
ymllib32-linux/lib32-libubootenv/0.3.4-r0/git/src/uboot_env.c
| /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokym=
llib32-linux/lib32-libubootenv/0.3.4-r0/git/src/uboot_env.c:36:10: fatal er=
ror: yaml.h: No such file or directory
|    36 | #include <yaml.h>
|       |          ^~~~~~~~
| compilation terminated.
| [4/8] /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86=
-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/recipe-sysroot-native/usr/bin=
/i686-pokymllib32-linux/i686-pokymllib32-linux-gcc --sysroot=3D/home/pokybu=
ild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/l=
ib32-libubootenv/0.3.4-r0/lib32-recipe-sysroot -DVERSION=3D\"0.3.4\" -I/hom=
e/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32=
-linux/lib32-libubootenv/0.3.4-r0/git/src -m32 -fstack-protector-strong  -O=
2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3D/home/pokybuild/y=
octo-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-=
libubootenv/0.3.4-r0/lib32-recipe-sysroot  -O2 -pipe -g -feliminate-unused-=
debug-types -fcanon-prefix-map  -fmacro-prefix-map=3D/home/pokybuild/yocto-=
worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libub=
ootenv/0.3.4-r0/git=3D/usr/src/debug/lib32-libubootenv/0.3.4-r0  -fdebug-pr=
efix-map=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/=
x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/git=3D/usr/src/debug/lib32=
-libubootenv/0.3.4-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/qe=
mux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.=
3.4-r0/build=3D/usr/src/debug/lib32-libubootenv/0.3.4-r0  -fdebug-prefix-ma=
p=3D/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pok=
ymllib32-linux/lib32-libubootenv/0.3.4-r0/build=3D/usr/src/debug/lib32-libu=
bootenv/0.3.4-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/qemux86=
-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r=
0/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3D/home/pokybuild/yocto-worke=
r/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-libubooten=
v/0.3.4-r0/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild/yo=
cto-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-l=
ibubootenv/0.3.4-r0/recipe-sysroot-native=3D  -std=3Dgnu99 -DNDEBUG -MD -MT=
 src/CMakeFiles/fw_printenv.dir/fw_printenv.c.o -MF src/CMakeFiles/fw_print=
env.dir/fw_printenv.c.o.d -o src/CMakeFiles/fw_printenv.dir/fw_printenv.c.o=
 -c /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-pok=
ymllib32-linux/lib32-libubootenv/0.3.4-r0/git/src/fw_printenv.c
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/=
x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/temp/run.do_compile.12877:=
153 exit 1 from 'eval ${DESTDIR:+DESTDIR=3D${DESTDIR} }VERBOSE=3D1 cmake --=
build '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-=
pokymllib32-linux/lib32-libubootenv/0.3.4-r0/build' "$@" -- ${EXTRA_OECMAKE=
_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/qemux86-world/bui=
ld/build/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/temp/run=
=2Edo_compile.12877, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/qemux86-world/build/b=
uild/tmp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/temp/run.do_=
compile.12877, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/qemux86-world/build/build/t=
mp/work/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/temp/run.do_compil=
e.12877, line 142
| 	#4: main, /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/wor=
k/x86-pokymllib32-linux/lib32-libubootenv/0.3.4-r0/temp/run.do_compile.1287=
7, line 166
NOTE: recipe lib32-libubootenv-0.3.4-r0: task do_compile: Failed

On 02/06/2023 13:27:37+0200, Stefano Babic wrote:
> Signed-off-by: Stefano Babic <sbabic@denx.de>
> ---
>  .../u-boot/{libubootenv_0.3.3.bb =3D> libubootenv_0.3.4.bb}       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{libubootenv_0.3.3.bb =3D> libubootenv_0.=
3.4.bb} (93%)
>=20
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb b/meta/recipes-=
bsp/u-boot/libubootenv_0.3.4.bb
> similarity index 93%
> rename from meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb
> rename to meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
> index 55f91b6f05..25cdf3b05c 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-2.1-or-later=
=2Etxt;md5=3D4fbd65380cdd255951
>  SECTION =3D "libs"
> =20
>  SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps;branch=
=3Dmaster"
> -SRCREV =3D "108100622160bb0c7ef4b6186230fe1f26402791"
> +SRCREV =3D "4dfb5254fc0540a36e87914bc14644c047ea7678"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182303): https://lists.openembedded.org/g/openembedde=
d-core/message/182303
> Mute This Topic: https://lists.openembedded.org/mt/99283999/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

