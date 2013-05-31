Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36D6B6163F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 22:51:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4VMp2Vv012145
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2013 15:51:02 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 31 May 2013 15:51:00 -0700
Message-ID: <51A9294F.1090101@windriver.com>
Date: Fri, 31 May 2013 17:50:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: gcc 4.8 - ICE
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
X-List-Received-Date: Fri, 31 May 2013 22:51:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

Ran into an internal compiler failure w/ the new gcc 4.8 today.

[2013-05-31 16:14:50.182327000-04:00] TARGET_SYS        =3D "powerpc-wrs-li=
nux-gnuspe"
[2013-05-31 16:14:50.186375000-04:00] TUNE_FEATURES     =3D "m32 spe ppce50=
0v2"
[2013-05-31 16:14:50.187385000-04:00] TARGET_FPU        =3D "ppc-efd"

When building glibc:

> [2013-05-31 16:42:54.446880000-04:00] | In file included from ../sysdeps/=
ieee754/ldbl-128ibm/strtold_l.c:54:0:
> [2013-05-31 16:42:54.447811000-04:00] | ./strtod_l.c: In function '____st=
rtold_l_internal':
> [2013-05-31 16:42:54.448680000-04:00] | ./strtod_l.c:1778:1: error: unrec=
ognizable insn:
> [2013-05-31 16:42:54.449632000-04:00] |  }
> [2013-05-31 16:42:54.450515000-04:00] |  ^
> [2013-05-31 16:42:54.452037000-04:00] | (insn 6830powerpc-wrs-linux-gnusp=
e-gcc  -m32 -mcpu=3D8548 -mabi=3Dspe -mspe -mfloat-gprs=3Ddouble --sysroot=
=3D/home/nxadm/nx/yow-blade14.2/builds-2013-05-31-155519/fsl-p2020_small/bi=
tbake_build/tmp/sysroots/fsl-p2020-tcbootstrap a64l.c -c -std=3Dgnu99 -fgnu=
89-inline  -O2 -Wall -Winline -Wwrite-strings -fmerge-all-constants -fround=
ing-math -g -pipe -mhard-float -Wstrict-prototypes -mlong-double-128  -fpic=
       -I../include -I/home/nxadm/nx/yow-blade14.2/builds-2013-05-31-155519=
/fsl-p2020_small/bitbake_build/tmp/work/ppce500v2-wrs-linux-gnuspe/eglibc/2=
.17-r3/build-powerpc-wrs-linux-gnuspe/stdlib -I/home/nxadm/nx/yow-blade14.2=
/builds-2013-05-31-155519/fsl-p2020_small/bitbake_build/tmp/work/ppce500v2-=
wrs-linux-gnuspe/eglibc/2.17-r3/build-powerpc-wrs-linux-gnuspe -I../ports/s=
ysdeps/unix/sysv/linux/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/powerp=
c/powerpc32/e500/fpu -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e=
500/nptl -I../ports/sysdeps/unix/sy
sv/linux/powerpc/powerpc32/e500 -I../sysdeps/unix/sysv/linux/powerpc/powerp=
c32/fpu/nptl -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu -I../sysdep=
s/powerpc/powerpc32/fpu -I../nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32=
 -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../sysdeps/unix/sys=
v/linux/powerpc/powerpc32 -I../nptl/sysdeps/unix/sysv/linux/powerpc -I../po=
rts/sysdeps/unix/sysv/linux/powerpc -I../sysdeps/unix/sysv/linux/powerpc -I=
../sysdeps/ieee754/ldbl-128ibm -I../sysdeps/ieee754/ldbl-opt -I../nptl/sysd=
eps/unix/sysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../por=
ts/sysdeps/unix/sysv/linux -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I=
../sysdeps/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/unix/sy=
sv -I../sysdeps/unix/sysv -I../sysdeps/unix/powerpc -I../nptl/sysdeps/unix =
-I../ports/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sys=
deps/powerpc/powerpc32/e500 -I../ports/sysdeps/powerpc/powerpc32 -I../sysde=
ps/powerpc/powerpc32 -I.
./sysdeps/wordsize-32 -I../sysdeps/powerpc/fpu -I../nptl/sysdeps/powerpc -I=
../ports/sysdeps/powerpc -I../sysdeps/powerpc -I../sysdeps/ieee754/dbl-64 -=
I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic -I../n=
ptl -I../ports  -I.. -I../libio -I. -nostdinc -isystem /home/nxadm/nx/yow-b=
lade14.2/builds-2013-05-31-155519/fsl-p2020_small/bitbake_build/tmp/sysroot=
s/x86_64-linux/usr/lib/ppce500v2-wrs-linux-gnuspe.gcc-cross-initial/gcc/pow=
erpc-wrs-linux-gnuspe/4.8.0/include -isystem /home/nxadm/nx/yow-blade14.2/b=
uilds-2013-05-31-155519/fsl-p2020_small/bitbake_build/tmp/sysroots/x86_64-l=
inux/usr/lib/ppce500v2-wrs-linux-gnuspe.gcc-cross-initial/gcc/powerpc-wrs-l=
inux-gnuspe/4.8.0/include-fixed -isystem /home/nxadm/nx/yow-blade14.2/build=
s-2013-05-31-155519/fsl-p2020_small/bitbake_build/tmp/sysroots/fsl-p2020/us=
r/include  -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSH=
ARED     -o /home/nxadm/nx/yow-blade14.2/builds-2013-05-31-155519/fsl-p2020=
_small/bitbake_build/tmp
/work/ppce500v2-wrs-linux-gnuspe/eglibc/2.17-r3/build-powerpc-wrs-linux-gnu=
spe/stdlib/a64l.os -MD -MP -MF /home/nxadm/nx/yow-blade14.2/builds-2013-05-=
31-155519/fsl-p2020_small/bitbake_build/tmp/work/ppce500v2-wrs-linux-gnuspe=
/eglibc/2.17-r3/build-powerpc-wrs-linux-gnuspe/stdlib/a64l.os.dt -MT /home/=
nxadm/nx/yow-blade14.2/builds-2013-05-31-155519/fsl-p2020_small/bitbake_bui=
ld/tmp/work/ppce500v2-wrs-linux-gnuspe/eglibc/2.17-r3/build-powerpc-wrs-lin=
ux-gnuspe/stdlib/a64l.os
> [2013-05-31 16:42:54.453775000-04:00] | powerpc-wrs-linux-gnuspe-gcc  -m3=
2 -mcpu=3D8548 -mabi=3Dspe -mspe -mfloat-gprs=3Ddouble --sysroot=3D/home/nx=
adm/nx/yow-blade14.2/builds-2013-05-31-155519/fsl-p2020_small/bitbake_build=
/tmp/sysroots/fsl-p2020-tcbootstrap l64a.c -c -std=3Dgnu99 -fgnu89-inline  =
-O2 -Wall -Winline -Wwrite-strings -fmerge-all-constants -frounding-math -g=
 -pipe -mhard-float -Wstrict-prototypes -mlong-double-128  -fpic       -I..=
/include -I/home/nxadm/nx/yow-blade14.2/builds-2013-05-31-155519/fsl-p2020_=
small/bitbake_build/tmp/work/ppce500v2-wrs-linux-gnuspe/eglibc/2.17-r3/buil=
d-powerpc-wrs-linux-gnuspe/stdlib -I/home/nxadm/nx/yow-blade14.2/builds-201=
3-05-31-155519/fsl-p2020_small/bitbake_build/tmp/work/ppce500v2-wrs-linux-g=
nuspe/eglibc/2.17-r3/build-powerpc-wrs-linux-gnuspe -I../ports/sysdeps/unix=
/sysv/linux/powerpc/powerpc32/e500/fpu -I../ports/sysdeps/powerpc/powerpc32=
/e500/fpu -I../ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500/nptl -I=
../ports/sysdeps/unix/sysv/linux/p
owerpc/powerpc32/e500 -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu/np=
tl -I../sysdeps/unix/sysv/linux/powerpc/powerpc32/fpu -I../sysdeps/powerpc/=
powerpc32/fpu -I../nptl/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../port=
s/sysdeps/unix/sysv/linux/powerpc/powerpc32 -I../sysdeps/unix/sysv/linux/po=
werpc/powerpc32 -I../nptl/sysdeps/unix/sysv/linux/powerpc -I../ports/sysdep=
s/unix/sysv/linux/powerpc -I../sysdeps/unix/sysv/linux/powerpc -I../sysdeps=
/ieee754/ldbl-128ibm -I../sysdeps/ieee754/ldbl-opt -I../nptl/sysdeps/unix/s=
ysv/linux -I../nptl/sysdeps/pthread -I../sysdeps/pthread -I../ports/sysdeps=
/unix/sysv/linux -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps=
/unix/inet -I../nptl/sysdeps/unix/sysv -I../ports/sysdeps/unix/sysv -I../sy=
sdeps/unix/sysv -I../sysdeps/unix/powerpc -I../nptl/sysdeps/unix -I../ports=
/sysdeps/unix -I../sysdeps/unix -I../sysdeps/posix -I../ports/sysdeps/power=
pc/powerpc32/e500 -I../ports/sysdeps/powerpc/powerpc32 -I../sysdeps/powerpc=
/powerpc32 -I../sysdeps/
wordsize-32 -I../sysdeps/powerpc/fpu -I../nptl/sysdeps/powerpc -I../ports/s=
ysdeps/powerpc -I../sysdeps/powerpc -I../sysdeps/ieee754/dbl-64 -I../sysdep=
s/ieee754/flt-32 -I../sysdeps/ieee754 -I../sysdeps/generic -I../nptl -I../p=
orts  -I.. -I../libio -I. -nostdinc -isystem /home/nxadm/nx/yow-blade14.2/b=
uilds-2013-05-31-155519/fsl-p2020_small/bitbake_build/tmp/sysroots/x86_64-l=
inux/usr/lib/ppce500v2-wrs-linux-gnuspe.gcc-cross-initial/gcc/powerpc-wrs-l=
inux-gnuspe/4.8.0/include -isystem /home/nxadm/nx/yow-blade14.2/builds-2013=
-05-31-155519/fsl-p2020_small/bitbake_build/tmp/sysroots/x86_64-linux/usr/l=
ib/ppce500v2-wrs-linux-gnuspe.gcc-cross-initial/gcc/powerpc-wrs-linux-gnusp=
e/4.8.0/include-fixed -isystem /home/nxadm/nx/yow-blade14.2/builds-2013-05-=
31-155519/fsl-p2020_small/bitbake_build/tmp/sysroots/fsl-p2020/usr/include =
 -D_LIBC_REENTRANT -include ../include/libc-symbols.h  -DPIC -DSHARED     -=
o /home/nxadm/nx/yow-blade14.2/builds-2013-05-31-155519/fsl-p2020_small/bit=
bake_build/tmp/work/ppce
500v2-wrs-linux-gnuspe/eglibc/2.17-r3/build-powerpc-wrs-linux-gnuspe/stdlib=
/l64a.os -MD -MP -MF /home/nxadm/nx/yow-blade14.2/builds-2013-05-31-155519/=
fsl-p2020_small/bitbake_build/tmp/work/ppce500v2-wrs-linux-gnuspe/eglibc/2.=
17-r3/build-powerpc-wrs-linux-gnuspe/stdlib/l64a.os.dt -MT /home/nxadm/nx/y=
ow-blade14.2/builds-2013-05-31-155519/fsl-p2020_small/bitbake_build/tmp/wor=
k/ppce500v2-wrs-linux-gnuspe/eglibc/2.17-r3/build-powerpc-wrs-linux-gnuspe/=
stdlib/l64a.os
> [2013-05-31 16:42:54.454738000-04:00] |  6829 6775 190 (set (mem/c:TI (pl=
us:SI (reg:SI 10 10)
> [2013-05-31 16:42:54.455558000-04:00] |                 (const_int 976 [0=
x3d0])) [14 %sfp+976 S16 A128])
> [2013-05-31 16:42:54.456545000-04:00] |         (reg:TI 5 5)) ./strtod_l.=
c:203 -1
> [2013-05-31 16:42:54.457357000-04:00] |      (nil))
> [2013-05-31 16:42:54.458191000-04:00] | ./strtod_l.c:1778:1: internal com=
piler error: in extract_insn, at recog.c:2150

I suspect the ppce500v2 tuning hasn't been used much, but it appears to tri=
gger=20
the failure case.

Should I enter a bug for this issue in the YP bugzilla?  I can also attempt=
 to=20
file a bug w/ gnu this weekend or early next week.

--Mark

