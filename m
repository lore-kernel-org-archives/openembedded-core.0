Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB74C7EE24
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:17:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.23.1685485053670581546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 15:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l8yL4cWq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685485051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvWSXF8jU1RieZsZBWpg27vWkO1Bb+0/RSbxGPRArwQ=;
	b=l8yL4cWqjduyEH9CSlLEals5ynTS+GpqHdU9D2bW4Ao77PeDXBCfNRiA9rwBZ0Ez7dqm/U
	kYH5CahZ6DX+g5AQsQrTfO9Go4l/qQIdRXAQGgFow46he2eMZpdozDw0bPi1oGiXkua6os
	FOMLThxb5k7kQIYEgcoFClVmpbXLHY5+BX+V+7O1C2u1DoV5Va5nNB3WIHR8Ht0Emz+0D2
	ItjZBHpIWq5da1Zv8e0+QrKau2CumMII7KQ93OAI7p9QAShVJFB3gJqXklfWPnA6zPr85q
	6KjzQRPVShkP+lJYtTYNd7l98o2Z81J8wmB4mEybPVfYSV/i4Vjx2YKNnv9MBQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D88B20003;
	Tue, 30 May 2023 22:17:31 +0000 (UTC)
Date: Wed, 31 May 2023 00:17:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3] kbd: Add ptest support
Message-ID: <2023053022173136587677@mail.local>
References: <1685430318-27100-1-git-send-email-qiutt@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1685430318-27100-1-git-send-email-qiutt@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181959

Hello,


This still fails to build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6071/ste=
ps/12/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6079/ste=
ps/11/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7219/step=
s/11/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6151/ste=
ps/11/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/7244/step=
s/11/logs/errors


| make[1]: Entering directory '/home/pokybuild/yocto-worker/beaglebone/buil=
d/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/test=
s/libtswrap'
| /bin/bash ../../libtool  --tag=3DCC   --mode=3Dcompile arm-poky-linux-gnu=
eabi-gcc  -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a8 -fstack-protect=
or-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D/home=
/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-pok=
y-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../=
kbd-2.5.1/tests/libtswrap -I../..   -I../../../kbd-2.5.1/tests/libtswrap -I=
=2E   -g -O0 -O2 -D_FORTIFY_SOURCE=3D2  -O2 -pipe -g -feliminate-unused-deb=
ug-types -fcanon-prefix-map  -fmacro-prefix-map=3D/home/pokybuild/yocto-wor=
ker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/=
2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/hom=
e/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-po=
ky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fma=
cro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/wo=
rk/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/src/debug/k=
bd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/b=
uild/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=
=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-=
worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/k=
bd/2.5.1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/home/pokybuild/yocto-w=
orker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kb=
d/2.5.1-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild/yocto-wo=
rker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd=
/2.5.1-r0/recipe-sysroot-native=3D  -Waggregate-return -Wall -Wcast-align -=
Wconversion -Wdisabled-optimization -Wextra -Wmissing-declarations -Wmissin=
g-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith =
-Wredundant-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -c -o ioctl.=
lo ../../../kbd-2.5.1/tests/libtswrap/ioctl.c
| libtool: compile:  arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=3D=
hard -mcpu=3Dcortex-a8 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FI=
LE_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/beaglebone/bui=
ld/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sy=
sroot -DHAVE_CONFIG_H -I. -I../../../kbd-2.5.1/tests/libtswrap -I../.. -I..=
/../../kbd-2.5.1/tests/libtswrap -I. -g -O0 -O2 -D_FORTIFY_SOURCE=3D2 -O2 -=
pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-ma=
p=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf=
-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-=
r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build=
/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/=
src/debug/kbd/2.5.1-r0 -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/be=
aglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-=
r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild=
/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gn=
ueabi/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-=
neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=3D -fmacro-prefix-map=
=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-=
neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=3D -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-=
neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=3D -Waggregate-r=
eturn -Wall -Wcast-align -Wconversion -Wdisabled-optimization -Wextra -Wmis=
sing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-p=
rototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -W=
write-strings -c ../../../kbd-2.5.1/tests/libtswrap/ioctl.c  -fPIC -DPIC -o=
 .libs/ioctl.o
| ../../../kbd-2.5.1/tests/libtswrap/ioctl.c: In function 'print_kbsentry':
| ../../../kbd-2.5.1/tests/libtswrap/ioctl.c:257:55: warning: format '%ld' =
expects argument of type 'long int', but argument 3 has type 'size_t' {aka =
'unsigned int'} [-Wformat=3D]
|   257 |         dprintf(outfd, "\t\tunsigned char kb_string[%ld] =3D {\n"=
, sz);
|       |                                                     ~~^          =
~~
|       |                                                       |          |
|       |                                                       long int   =
size_t {aka unsigned int}
|       |                                                     %d
| /bin/bash ../../libtool  --tag=3DCC   --mode=3Dlink arm-poky-linux-gnueab=
i-gcc  -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a8 -fstack-protector-=
strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dform=
at-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D/home/po=
kybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-l=
inux-gnueabi/kbd/2.5.1-r0/recipe-sysroot  -g -O0 -O2 -D_FORTIFY_SOURCE=3D2 =
 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-pr=
efix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cor=
texa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd=
/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/bui=
ld/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=
=3D/usr/src/debug/kbd/2.5.1-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-=
worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/k=
bd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home=
/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-pok=
y-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-p=
refix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/co=
rtexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=3D  -fmacro-pr=
efix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cor=
texa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=3D  -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cort=
exa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=3D  -Wagg=
regate-return -Wall -Wcast-align -Wconversion -Wdisabled-optimization -Wext=
ra -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wm=
issing-prototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-proto=
types -Wwrite-strings -export-symbols-regex ^ioctl -version-info 1:0:0 -rpa=
th /nowhere -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-m=
ap  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/buil=
d/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/usr=
/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/=
beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.=
1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fmacro-prefix-map=3D/home/po=
kybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-l=
inux-gnueabi/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-pref=
ix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/corte=
xa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1=
-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/bui=
ld/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
=3D  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/bui=
ld/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=
=3D  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/bui=
ld/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-=
native=3D  -Wl,-z,relro,-z,now -o libtswrap.la  ioctl.lo -ldl
| libtool: link: arm-poky-linux-gnueabi-gcc-nm  .libs/ioctl.o   | sed -n -e=
 's/^.*[	 ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)=
$/\1 \2 \2/p' | sed '/ __gnu_lto/d' | sed 's/.* //' | sort | uniq > .libs/l=
ibtswrap.exp
| libtool: link: /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/ho=
sttools/grep -E -e "^ioctl" ".libs/libtswrap.exp" > ".libs/libtswrap.expT"
| libtool: link: mv -f ".libs/libtswrap.expT" ".libs/libtswrap.exp"
| libtool: link: echo "{ global:" > .libs/libtswrap.ver
| libtool: link:  cat .libs/libtswrap.exp | sed -e "s/\(.*\)/\1;/" >> .libs=
/libtswrap.ver
| libtool: link:  echo "local: *; };" >> .libs/libtswrap.ver
| libtool: link:  arm-poky-linux-gnueabi-gcc  -mfpu=3Dneon -mfloat-abi=3Dha=
rd -mcpu=3Dcortex-a8 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -W=
format -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FIL=
E_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/beaglebone/buil=
d/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sys=
root -shared  -fPIC -DPIC  .libs/ioctl.o   -ldl  -mfpu=3Dneon -mfloat-abi=
=3Dhard -mcpu=3Dcortex-a8 -fstack-protector-strong -O2 --sysroot=3D/home/po=
kybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-l=
inux-gnueabi/kbd/2.5.1-r0/recipe-sysroot -g -O0 -O2 -O2 -g -fcanon-prefix-m=
ap -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build=
/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/=
src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/be=
aglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-=
r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fmacro-prefix-map=3D/home/pokyb=
uild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linu=
x-gnueabi/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8h=
f-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 =
-fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tm=
p/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=3D -f=
macro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/=
work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=3D -fde=
bug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/wo=
rk/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=3D=
 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map -fmacro-=
prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/c=
ortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/k=
bd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone/bu=
ild/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/kbd-2.5.=
1=3D/usr/src/debug/kbd/2.5.1-r0 -fmacro-prefix-map=3D/home/pokybuild/yocto-=
worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/k=
bd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/=
pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky=
-linux-gnueabi/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cort=
exa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=3D -fmacro-prefi=
x-map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortex=
a8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot=3D -fdebug-prefix-=
map=3D/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8=
hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native=3D -Wl,-z -Wl=
,relro -Wl,-z -Wl,now   -Wl,-soname -Wl,libtswrap.so.1 -Wl,-version-script =
-Wl,.libs/libtswrap.ver -o .libs/libtswrap.so.1.0.0
| /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-n=
eon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/arm-poky-=
linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnuea=
bi/13.1.1/ld:.libs/libtswrap.ver:2: syntax error in VERSION script
| collect2: error: ld returned 1 exit status
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone/build=
/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/tests=
/libtswrap'
| make[1]: *** [Makefile:390: libtswrap.la] Error 1
| make: *** [Makefile:421: all-recursive] Error 1
| make: Leaving directory '/home/pokybuild/yocto-worker/beaglebone/build/bu=
ild/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/build/tests'
| ERROR: oe_runmake failed

On 30/05/2023 15:05:18+0800, qiutt@fujitsu.com wrote:
> From: Qiu Tingting <qiutt@fujitsu.com>
>=20
> Add a ptest for kbd
> - It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
> - It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(13=
 cases)
>=20
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-core/kbd/files/run-ptest         | 11 +++
>  meta/recipes-core/kbd/kbd_2.5.1.bb            | 71 ++++++++++++++++++-
>  3 files changed, 82 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/kbd/files/run-ptest
>=20
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index faa9bd6983..366c048cc8 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -26,6 +26,7 @@ PTESTS_FAST =3D "\
>      gzip \
>      json-c \
>      json-glib \
> +    kbd \
>      libconvert-asn1-perl \
>      liberror-perl \
>      libgpg-error\
> diff --git a/meta/recipes-core/kbd/files/run-ptest b/meta/recipes-core/kb=
d/files/run-ptest
> new file mode 100644
> index 0000000000..3b154c4d73
> --- /dev/null
> +++ b/meta/recipes-core/kbd/files/run-ptest
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +# Define test work dir
> +WORKDIR=3D@PTEST_PATH@/tests/
> +
> +# Run test
> +cd ${WORKDIR}
> +
> +./testsuite -k unittest | sed -e '/[0-9]:/s/://' \
> +    -e '/ ok/s/^/PASS: /;/ FAILED/s/^/FAIL: /;/ skipped/s/^/SKIP: /' \
> +    -e '/ ok/s/ ok.*//;/ skipped/s/ skipped.*//;/ FAILED/s/ FAILED.*//'
> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/k=
bd_2.5.1.bb
> index 7662b8f685..ba7236f67c 100644
> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> @@ -5,7 +5,7 @@ DESCRIPTION =3D "The kbd project contains tools for manag=
ing Linux console (Linux
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
> -inherit autotools gettext pkgconfig
> +inherit autotools gettext pkgconfig ptest
> =20
>  DEPENDS +=3D "flex-native"
> =20
> @@ -14,6 +14,7 @@ RPROVIDES:${PN} =3D "console-tools"
>  RCONFLICTS:${PN} =3D "console-tools"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
> +           file://run-ptest \
>             "
> =20
>  SRC_URI[sha256sum] =3D "ccdf452387a6380973d2927363e9cbb939fa2068915a6f93=
7ff9d24522024683"
> @@ -45,3 +46,71 @@ ALTERNATIVE:${PN} =3D "chvt deallocvt fgconsole openvt=
 showkey \
>  ALTERNATIVE_PRIORITY =3D "100"
> =20
>  BBCLASSEXTEND =3D "native"
> +
> +do_compile_ptest() {
> +    # update DATADIR in Makefile
> +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \\,=
g' ${B}/tests/libkeymap/Makefile
> +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \\,=
g' ${B}/tests/helpers/Makefile
> +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \\,=
g' ${B}/tests/libkbdfile/Makefile
> +
> +    # recompile tests
> +    oe_runmake -C ${B}/tests/ clean
> +    oe_runmake -C ${B}/tests/
> +}
> +
> +do_install_ptest() {
> +    # install files from build directory
> +    install -d ${D}${PTEST_PATH}/tests/
> +    install --mode=3D755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
> +    install --mode=3D755 ${B}/tests/testsuite ${D}${PTEST_PATH}/tests/
> +    install -d ${D}${PTEST_PATH}/tests/libkeymap/
> +    find ${B}/tests/libkeymap/ -type f -not -name "*.o" -not -name "Make=
file" \
> +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/libkeymap/=
 \;
> +    install -d ${D}${PTEST_PATH}/tests/helpers/
> +    find ${B}/tests/helpers/ -type f -not -name "*.o" -not -name "Makefi=
le" \
> +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/helpers/ \;
> +    install -d ${D}${PTEST_PATH}/tests/libkbdfile/
> +    find ${B}/tests/libkbdfile/ -type f -not -name "*.o" -not -name "Mak=
efile" \
> +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/libkbdfile=
/ \;
> +    install -d ${D}${PTEST_PATH}/src/
> +    install --mode=3D755 ${B}/src/loadkeys ${D}${PTEST_PATH}/src/
> +
> +    # install files from src/data directory
> +    install -d ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
> +    install ${S}/data/keymaps/i386/qwerty/defkeymap.map ${D}${PTEST_PATH=
}/data/keymaps/i386/qwerty/
> +
> +    # install files from src/tests/data directory
> +    install -d ${D}${PTEST_PATH}/tests/data/
> +    install -d ${D}${PTEST_PATH}/tests/data/libkeymap/
> +    install ${S}/tests/data/libkeymap/* ${D}${PTEST_PATH}/tests/data/lib=
keymap/
> +    install -d ${D}${PTEST_PATH}/tests/data/alt-is-meta/
> +    install ${S}/tests/data/alt-is-meta/* ${D}${PTEST_PATH}/tests/data/a=
lt-is-meta/
> +    install -d ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
> +    install ${S}/tests/data/bkeymap-2.0.4/* ${D}${PTEST_PATH}/tests/data=
/bkeymap-2.0.4/
> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
> +    install ${S}/tests/data/dumpkeys-mktable/* ${D}${PTEST_PATH}/tests/d=
ata/dumpkeys-mktable/
> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
> +    install ${S}/tests/data/dumpkeys-fulltable/* ${D}${PTEST_PATH}/tests=
/data/dumpkeys-fulltable/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts/
> +    install ${S}/tests/data/findfile/test_1/consolefonts/* ${D}${PTEST_P=
ATH}/tests/data/findfile/test_1/consolefonts/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/incl=
ude/
> +    install ${S}/tests/data/findfile/test_0/keymaps/test0.map ${D}${PTES=
T_PATH}/tests/data/findfile/test_0/keymaps/
> +    install ${S}/tests/data/findfile/test_0/keymaps/include/* ${D}${PTES=
T_PATH}/tests/data/findfile/test_0/keymaps/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386=
/include/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/include/* ${D}$=
{PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386=
/qwerty/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwerty/* ${D}${=
PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386=
/qwertz/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwertz/* ${D}${=
PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
> +    install ${S}/tests/data/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/test=
s/data/keymaps/i386/qwerty/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
> +    install ${S}/tests/data/keymaps/i386/include/* ${D}${PTEST_PATH}/tes=
ts/data/keymaps/i386/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/include/
> +    install ${S}/tests/data/keymaps/include/* ${D}${PTEST_PATH}/tests/da=
ta/keymaps/include/
> +
> +
> +    # update PTEST_PATH in run-ptest and atconfig
> +    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
> +    sed -i -e 's,${B},${PTEST_PATH},g' -e 's,/\.\./kbd-2.5.1,,g' ${D}${P=
TEST_PATH}/tests/atconfig
> +}
> --=20
> 2.25.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181901): https://lists.openembedded.org/g/openembedde=
d-core/message/181901
> Mute This Topic: https://lists.openembedded.org/mt/99215235/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

