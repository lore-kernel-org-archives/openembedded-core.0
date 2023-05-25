Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91A8C77B7C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 02:16:05 +0000 (UTC)
Subject: Re: [PATCH V2] kbd: Add ptest support
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 May 2023 19:16:00 -0700
References: <CAMKF1spsN31-Cz9kJZ5FFEnj8naj5FGO7hvrY=tzCfZxgZhdYA@mail.gmail.com>
In-Reply-To: <CAMKF1spsN31-Cz9kJZ5FFEnj8naj5FGO7hvrY=tzCfZxgZhdYA@mail.gmail.com>
Message-ID: <2625.1684980960246183159@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="J7Jv3ERKhIhaMMU1Vmua"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 02:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181701

--J7Jv3ERKhIhaMMU1Vmua
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I tried to build it with

>=20
> TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "i686-oe-linux"
> MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "qemux86"
>=20

but there is no error in=C2=A0do_compile_ptest_base.

>=20
> make[1]: Entering directory
> '/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linu=
x/kbd/2.5.1-r0/build/tests/helpers'
>=20
> i686-oe-linux-gcc=C2=A0 -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmat=
h=3Dsse
> --sysroot=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2=
-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot
> -DHAVE_CONFIG_H -I. -I../../../kbd-2.5.1/tests/helpers -I../..=C2=A0=20
> -I../../../kbd-2.5.1/src/libcommon -I../../../kbd-2.5.1/src/libkeymap
> -I../../../kbd-2.5.1/src/libkbdfile -DDATADIR=3D\"/usr/lib/kbd/ptest/test=
s\"
> -DBUILDDIR=3D\"/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/co=
re2-32-oe-linux/kbd/2.5.1-r0/build/tests/helpers\"
> -O2 -D_FORTIFY_SOURCE=3D2=C2=A0 -O2 -pipe -g -feliminate-unused-debug-typ=
es
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot-native=3D
> -Waggregate-return -Wall -Wcast-align -Wconversion -Wdisabled-optimizatio=
n
> -Wextra -Wmissing-declarations -Wmissing-format-attribute
> -Wmissing-noreturn -Wmissing-prototypes -Wpointer-arith -Wredundant-decls
> -Wshadow -Wstrict-prototypes -Wwrite-strings -c -o libkeymap-bkeymap.o
> ../../../kbd-2.5.1/tests/helpers/libkeymap-bkeymap.c
> ...
> libtool: link:=C2=A0 echo "local: *; };" >> .libs/libtswrap.ver
> libtool: link:=C2=A0 i686-oe-linux-gcc=C2=A0 -m32 -march=3Dcore2 -mtune=
=3Dcore2 -msse3
> -mfpmath=3Dsse
> --sysroot=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2=
-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot
> -shared=C2=A0 -fPIC -DPIC=C2=A0 .libs/ioctl.o=C2=A0 =C2=A0-ldl=C2=A0 -m32=
 -march=3Dcore2 -mtune=3Dcore2
> -msse3 -mfpmath=3Dsse
> --sysroot=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2=
-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot
> -g -O0 -O2 -O2 -g
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot-native=3D
> -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D
> -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D
> -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot-native=3D
> -Wl,-soname -Wl,libtswrap.so.1 -Wl,-version-script -Wl,.libs/libtswrap.ve=
r
> -o .libs/libtswrap.so.1.0.0
> libtool: link: (cd ".libs" && rm -f "libtswrap.so.1" && ln -s
> "libtswrap.so.1.0.0" "libtswrap.so.1")
> libtool: link: (cd ".libs" && rm -f "libtswrap.so" && ln -s
> "libtswrap.so.1.0.0" "libtswrap.so")
> libtool: link: i686-oe-linux-gcc-ar cr .libs/libtswrap.a=C2=A0 ioctl.o
> libtool: link: i686-oe-linux-gcc-ranlib .libs/libtswrap.a
> libtool: link: ( cd ".libs" && rm -f "libtswrap.la" && ln -s
> "../libtswrap.la" "libtswrap.la" )
> make[1]: Leaving directory
> '/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linu=
x/kbd/2.5.1-r0/build/tests/libtswrap'
>=20
>=20

Maybe the gcc is different.
Could you share your build steps?

--J7Jv3ERKhIhaMMU1Vmua
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I tried to build it with&nbsp;<br /><br />
<blockquote>
<div>TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "i686-oe-linux"=
</div>
<div>MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "qemux86"<=
/div>
</blockquote>
<div>but there is no error in&nbsp;do_compile_ptest_base.&nbsp;&nbsp;</div>
<br />
<blockquote>
<div>make[1]: Entering directory '/AGL-WORK/Yocto/oe-core/build-genericx86/=
tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/build/tests/helpers'</div>
<div>i686-oe-linux-gcc&nbsp; -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfp=
math=3Dsse --sysroot=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/w=
ork/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../=
../../kbd-2.5.1/tests/helpers -I../..&nbsp; &nbsp;-I../../../kbd-2.5.1/src/=
libcommon -I../../../kbd-2.5.1/src/libkeymap -I../../../kbd-2.5.1/src/libkb=
dfile -DDATADIR=3D\"/usr/lib/kbd/ptest/tests\" -DBUILDDIR=3D\"/AGL-WORK/Yoc=
to/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/b=
uild/tests/helpers\"&nbsp; &nbsp; -O2 -D_FORTIFY_SOURCE=3D2&nbsp; -O2 -pipe=
 -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-=
core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5=
.1=3D/usr/src/debug/kbd/2.5.1-r0&nbsp; -fdebug-prefix-map=3D/AGL-WORK/Yocto=
/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/kbd=
-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0&nbsp; -fmacro-prefix-map=3D/AGL-WORK/Y=
octo/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0=
/build=3D/usr/src/debug/kbd/2.5.1-r0&nbsp; -fdebug-prefix-map=3D/AGL-WORK/Y=
octo/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0=
/build=3D/usr/src/debug/kbd/2.5.1-r0&nbsp; -fdebug-prefix-map=3D/AGL-WORK/Y=
octo/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0=
/recipe-sysroot=3D&nbsp; -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build=
-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D=
&nbsp; -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-gl=
ibc/work/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot-native=3D&nbsp; -Wag=
gregate-return -Wall -Wcast-align -Wconversion -Wdisabled-optimization -Wex=
tra -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -W=
missing-prototypes -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prot=
otypes -Wwrite-strings -c -o libkeymap-bkeymap.o ../../../kbd-2.5.1/tests/h=
elpers/libkeymap-bkeymap.c</div>
...
<div>libtool: link:&nbsp; echo "local: *; };" &gt;&gt; .libs/libtswrap.ver<=
/div>
<div>libtool: link:&nbsp; i686-oe-linux-gcc&nbsp; -m32 -march=3Dcore2 -mtun=
e=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/AGL-WORK/Yocto/oe-core/build-g=
enericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot -sha=
red&nbsp; -fPIC -DPIC&nbsp; .libs/ioctl.o&nbsp; &nbsp;-ldl&nbsp; -m32 -marc=
h=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/AGL-WORK/Yocto/=
oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/reci=
pe-sysroot -g -O0 -O2 -O2 -g -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/b=
uild-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/=
usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/bui=
ld-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/us=
r/src/debug/kbd/2.5.1-r0 -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build=
-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/=
debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-gener=
icx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/=
kbd/2.5.1-r0 -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/=
tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D -fmacro-pre=
fix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2-32-=
oe-linux/kbd/2.5.1-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/AGL-WORK/Yoct=
o/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/re=
cipe-sysroot-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmac=
ro-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/cor=
e2-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug=
-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2=
-32-oe-linux/kbd/2.5.1-r0/kbd-2.5.1=3D/usr/src/debug/kbd/2.5.1-r0 -fmacro-p=
refix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2-3=
2-oe-linux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-=
map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-l=
inux/kbd/2.5.1-r0/build=3D/usr/src/debug/kbd/2.5.1-r0 -fdebug-prefix-map=3D=
/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-glibc/work/core2-32-oe-linux/k=
bd/2.5.1-r0/recipe-sysroot=3D -fmacro-prefix-map=3D/AGL-WORK/Yocto/oe-core/=
build-genericx86/tmp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysro=
ot=3D -fdebug-prefix-map=3D/AGL-WORK/Yocto/oe-core/build-genericx86/tmp-gli=
bc/work/core2-32-oe-linux/kbd/2.5.1-r0/recipe-sysroot-native=3D&nbsp; &nbsp=
;-Wl,-soname -Wl,libtswrap.so.1 -Wl,-version-script -Wl,.libs/libtswrap.ver=
 -o .libs/libtswrap.so.1.0.0</div>
<div>libtool: link: (cd ".libs" &amp;&amp; rm -f "libtswrap.so.1" &amp;&amp=
; ln -s "libtswrap.so.1.0.0" "libtswrap.so.1")</div>
<div>libtool: link: (cd ".libs" &amp;&amp; rm -f "libtswrap.so" &amp;&amp; =
ln -s "libtswrap.so.1.0.0" "libtswrap.so")</div>
<div>libtool: link: i686-oe-linux-gcc-ar cr .libs/libtswrap.a&nbsp; ioctl.o=
</div>
<div>libtool: link: i686-oe-linux-gcc-ranlib .libs/libtswrap.a</div>
<div>libtool: link: ( cd ".libs" &amp;&amp; rm -f "libtswrap.la" &amp;&amp;=
 ln -s "../libtswrap.la" "libtswrap.la" )</div>
<div>make[1]: Leaving directory '/AGL-WORK/Yocto/oe-core/build-genericx86/t=
mp-glibc/work/core2-32-oe-linux/kbd/2.5.1-r0/build/tests/libtswrap'</div>
</blockquote>
<div>Maybe the gcc is different.<br />Could you share your build steps?<br =
/><br /></div>

--J7Jv3ERKhIhaMMU1Vmua--

