Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FC7C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 14:27:59 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.27799.1684506472731139228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 07:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XxBljslZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 71FE920004;
	Fri, 19 May 2023 14:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684506470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLg1/D95roVTS81kiVZ6tJxPxoLFA+T9erCatEhJCKk=;
	b=XxBljslZ81jxVpGrEht0OKgxakCvKRiyXsN6k/JoLsk8BueZxqrxDXWCre5sWRo4YcziBC
	jhPgQtZ5zMPZ9HBO0t78asnscuyRXtAvI6Rhy05ah/ezRFb0jOKtDrBz6eDA1eqIKAdG/U
	O2v2sFizOBS1H8FtqIGyLQ7/ms+Sob+s7Q85oN3gPenZOJsznpbvRQW2JI2IMdnMQluoO+
	Ww3F+R/vJzGNmuwuLFDrOjxg7EpiuPtkUhHoLH4t9/8vlfP7wmfxdKmf0gVzEJ70HBSYWo
	dVF4cw5v5bTtK9UWt/RB8t5wad04nVeydafpUbzU4pL6NlX8C1ENEnsoHCKH2w==
Date: Fri, 19 May 2023 16:27:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V2] kbd: Add ptest support
Message-ID: <202305191427507b253457@mail.local>
References: <1684284787-11933-1-git-send-email-qiutt@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1684284787-11933-1-git-send-email-qiutt@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 14:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181552

Hello,

This doesn't build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6024/ste=
ps/12/logs/stdio

| make[1]: Entering directory '/home/pokybuild/yocto-worker/genericx86-alt/=
build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/build/tests/libtswrap'
| /bin/bash ../../libtool  --tag=3DCC   --mode=3Dcompile i686-poky-linux-gc=
c  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protect=
or-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D/home=
/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-l=
inux/kbd/2.5.1-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../kbd-2.5.1/t=
ests/libtswrap -I../..   -I../../../kbd-2.5.1/tests/libtswrap -I.   -g -O0 =
-O2 -D_FORTIFY_SOURCE=3D2  -O2 -pipe -g -feliminate-unused-debug-types -fma=
cro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tm=
p/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.=
1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/buil=
d/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debu=
g/kbd/2.5.1-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx8=
6-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/build=3D/usr/sr=
c/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/gen=
ericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/build=3D/=
usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-work=
er/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/rec=
ipe-sysroot=3D  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx8=
6-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=
=3D  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build=
/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot-native=3D  =
-Waggregate-return -Wall -Wcast-align -Wconversion -Wdisabled-optimization =
-Wextra -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretur=
n -Wmissing-prototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-=
prototypes -Wwrite-strings -c -o ioctl.lo ../../../kbd-2.5.1/tests/libtswra=
p/ioctl.c
| libtool: compile:  i686-poky-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FI=
LE_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/genericx86-alt=
/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot -DHAV=
E_CONFIG_H -I. -I../../../kbd-2.5.1/tests/libtswrap -I../.. -I../../../kbd-=
2.5.1/tests/libtswrap -I. -g -O0 -O2 -D_FORTIFY_SOURCE=3D2 -O2 -pipe -g -fe=
liminate-unused-debug-types -fmacro-prefix-map=3D/home/pokybuild/yocto-work=
er/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd=
-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild/y=
octo-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5=
=2E1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fmacro-prefix-map=3D/home/=
pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-li=
nux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/=
home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-po=
ky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-ma=
p=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-=
32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D -fmacro-prefix-map=3D/home/pok=
ybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux=
/kbd/2.5.1-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-=
worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0=
/recipe-sysroot-native=3D -Waggregate-return -Wall -Wcast-align -Wconversio=
n -Wdisabled-optimization -Wextra -Wmissing-declarations -Wmissing-format-a=
ttribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith -Wredundan=
t-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -c ../../../kbd-2.5.1/=
tests/libtswrap/ioctl.c  -fPIC -DPIC -o .libs/ioctl.o
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
| /bin/bash ../../libtool  --tag=3DCC   --mode=3Dlink i686-poky-linux-gcc  =
-m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-=
strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dform=
at-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysroot=3D/home/po=
kybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linu=
x/kbd/2.5.1-r0/recipe-sysroot  -g -O0 -O2 -D_FORTIFY_SOURCE=3D2  -O2 -pipe =
-g -feliminate-unused-debug-types -fmacro-prefix-map=3D/home/pokybuild/yoct=
o-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-=
r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/poky=
build/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/=
kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fmacro-prefix-map=3D=
/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-p=
oky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-=
map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core=
2-32-poky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-p=
refix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/wor=
k/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D=
/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-p=
oky-linux/kbd/2.5.1-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybu=
ild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kb=
d/2.5.1-r0/recipe-sysroot-native=3D  -Waggregate-return -Wall -Wcast-align =
-Wconversion -Wdisabled-optimization -Wextra -Wmissing-declarations -Wmissi=
ng-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith=
 -Wredundant-decls -Wshadow -Wstrict-prototypes -Wwrite-strings -export-sym=
bols-regex ^ioctl -version-info 1:0:0 -rpath /nowhere -Wl,-O1 -Wl,--hash-st=
yle=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/home/pokybuild/yocto-worker=
/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2=
=2E5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D/home/pokybuild/=
yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.=
5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0  -fmacro-prefix-map=3D/home/=
pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-li=
nux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-map=3D=
/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-p=
oky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0  -fdebug-prefix-=
map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core=
2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/home/=
pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-li=
nux/kbd/2.5.1-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild/yo=
cto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.=
1-r0/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now -o libtswrap.la  ioctl.l=
o -ldl
| libtool: link: i686-poky-linux-gcc-nm  .libs/ioctl.o   | sed -n -e 's/^.*=
[	 ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2=
 \2/p' | sed '/ __gnu_lto/d' | sed 's/.* //' | sort | uniq > .libs/libtswra=
p.exp
| libtool: link: /home/pokybuild/yocto-worker/genericx86-alt/build/build/tm=
p/hosttools/grep -E -e "^ioctl" ".libs/libtswrap.exp" > ".libs/libtswrap.ex=
pT"
| libtool: link: mv -f ".libs/libtswrap.expT" ".libs/libtswrap.exp"
| libtool: link: echo "{ global:" > .libs/libtswrap.ver
| libtool: link:  cat .libs/libtswrap.exp | sed -e "s/\(.*\)/\1;/" >> .libs=
/libtswrap.ver
| libtool: link:  echo "local: *; };" >> .libs/libtswrap.ver
| libtool: link:  i686-poky-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -=
msse3 -mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -W=
format -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FIL=
E_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/genericx86-alt/=
build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot -share=
d  -fPIC -DPIC  .libs/ioctl.o   -ldl  -m32 -march=3Dcore2 -mtune=3Dcore2 -m=
sse3 -mfpmath=3Dsse -fstack-protector-strong -O2 --sysroot=3D/home/pokybuil=
d/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/=
2.5.1-r0/recipe-sysroot -g -O0 -O2 -O2 -g -fmacro-prefix-map=3D/home/pokybu=
ild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kb=
d/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky=
-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fmacro-prefix-=
map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core=
2-32-poky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-pr=
efix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work=
/core2-32-poky-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdeb=
ug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp=
/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D -fmacro-prefix-map=
=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-3=
2-poky-linux/kbd/2.5.1-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/poky=
build/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/=
kbd/2.5.1-r0/recipe-sysroot-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--=
as-needed -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/=
build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/=
debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/generi=
cx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/kbd-2.5.1=3D=
/usr/src/debug/kbd/2.5.1-r0 -fmacro-prefix-map=3D/home/pokybuild/yocto-work=
er/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/bui=
ld=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto=
-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r=
0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/home/pokybuild/=
yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.=
5.1-r0/recipe-sysroot=3D -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/=
genericx86-alt/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe=
-sysroot=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-al=
t/build/build/tmp/work/core2-32-poky-linux/kbd/2.5.1-r0/recipe-sysroot-nati=
ve=3D -Wl,-z -Wl,relro -Wl,-z -Wl,now   -Wl,-soname -Wl,libtswrap.so.1 -Wl,=
-version-script -Wl,.libs/libtswrap.ver -o .libs/libtswrap.so.1.0.0
| /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32=
-poky-linux/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../.=
=2E/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ld:.libs/libtswrap.v=
er:2: syntax error in VERSION script
| collect2: error: ld returned 1 exit status

This also warns:

WARNING: kbd-2.5.1-r0 do_package_qa: QA Issue: supports ptests but is not i=
ncluded in oe-core's ptest-packagelists.inc [missing-ptest]


On 17/05/2023 08:53:07+0800, qiutt@fujitsu.com wrote:
> From: Qiu Tingting <qiutt@fujitsu.com>
>=20
> Add a ptest for kbd
> - It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
> - It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(13=
 cases)
>=20
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  meta/recipes-core/kbd/files/run-ptest | 11 +++++
>  meta/recipes-core/kbd/kbd_2.5.1.bb    | 71 ++++++++++++++++++++++++++-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/kbd/files/run-ptest
>=20
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
> index 7662b8f685..943cd8a6ba 100644
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
> View/Reply Online (#181425): https://lists.openembedded.org/g/openembedde=
d-core/message/181425
> Mute This Topic: https://lists.openembedded.org/mt/98939715/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

