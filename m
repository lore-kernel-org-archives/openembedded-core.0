Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0EC6E60D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 21:45:44 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id q108so49573355qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 13:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cDMH/JzcaTcZXSGCgT3p4TWoA2TdIsF6O+YUC/6ywnc=;
	b=cNwhUmweqmsY8mb3Y/IfpFqRPvG2UolHjf8WHuml0/Ork9dL5ZmQsQeRr9B0uP7M5g
	49xNvYvfrTQ2prYo9WHsm0za/n/gNZo8XqbrTaLLoVmHnbEodWZ0zH94z/XnMnJwwVeC
	x18KZ8oJZfVJ4Z1uoEZTooNqULAI5sS4OfUCDv+n7Xd98UMSq/p9peGUJRDxMOikuHYw
	esgJMLiRoYD99sacD6NbxlaJ0CnzRsP2paX2An838IJu98z1r8uHuTorpsk7KKA3zfri
	onjTxQ8tUHDuZxhiBO9q3Ya5MBXwzVw1kxzG2XgBZSBfyumkpJNBYwmkvEBlppViIfqM
	EqlQ==
X-Gm-Message-State: ALoCoQmtXE965xV78qmsERgbicF5wWdI4HdHrgCs9LqbWql9Co4lbyADNL1Xs3dAS3+F61sib765
X-Received: by 10.224.24.132 with SMTP id v4mr46830432qab.17.1422913545677;
	Mon, 02 Feb 2015 13:45:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 13:45:25 -0800 (PST)
In-Reply-To: <80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 21:45:25 +0000
Message-ID: <CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 21:45:49 -0000
Content-Type: multipart/alternative; boundary=001a11c2b49e6fc476050e21e034

--001a11c2b49e6fc476050e21e034
Content-Type: text/plain; charset=UTF-8

On 2 February 2015 at 18:33, Khem Raj <raj.khem@gmail.com> wrote:

> Yeah, I am on archlinux (the other end of spectrum). Nevertheless, I have
> updated the contrib tree which fixes cross-localedef-native compile time
> issue. So you should be good
> to go now.
>

Bad news, glibc is now failing:

| x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
-msse4.2
--sysroot=/data/poky-master/tmp/sysroots/intel-corei7-64-tcbootstrap
dl-open.c -c -std=gnu99 -fgnu89-inline  -O2 -Wall -Werror -Winline
-Wno-error=undef -Wundef -Wwrite-strings -feliminate-unused-debug-types
-fmerge-all-constants -frounding-math -g -pipe -Wstrict-prototypes   -fPIC
 -mno-sse -mno-mmx        -I../include
-I/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf
 -I/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux
 -I../sysdeps/unix/sysv/linux/x86_64/64
 -I../sysdeps/unix/sysv/linux/x86_64  -I../sysdeps/unix/sysv/linux/x86
 -I../sysdeps/unix/sysv/linux/wordsize-64  -I../sysdeps/x86_64/nptl
 -I../sysdeps/unix/sysv/linux/include -I../sysdeps/unix/sysv/linux
 -I../sysdeps/nptl  -I../sysdeps/pthread  -I../sysdeps/gnu
 -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv  -I../sysdeps/unix/x86_64
 -I../sysdeps/unix  -I../sysdeps/posix  -I../sysdeps/x86_64/64
 -I../sysdeps/x86_64/fpu/multiarch  -I../sysdeps/x86_64/fpu
 -I../sysdeps/x86/fpu/include -I../sysdeps/x86/fpu
 -I../sysdeps/x86_64/multiarch  -I../sysdeps/x86_64  -I../sysdeps/x86
 -I../sysdeps/ieee754/ldbl-96  -I../sysdeps/ieee754/dbl-64/wordsize-64
 -I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32
 -I../sysdeps/wordsize-64  -I../sysdeps/ieee754  -I../sysdeps/generic  -I..
-I../libio -I. -nostdinc -isystem
/data/poky-master/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-linux.gcc-cross-initial-x86_64/gcc/x86_64-poky-linux/4.9.2/include
-isystem
/data/poky-master/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-linux.gcc-cross-initial-x86_64/gcc/x86_64-poky-linux/4.9.2/include-fixed
-isystem /data/poky-master/tmp/sysroots/intel-corei7-64/usr/include
 -D_LIBC_REENTRANT -include
/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/libc-modules.h
-DMODULE_NAME=rtld -include ../include/libc-symbols.h  -DPIC -DSHARED
-o
/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf/dl-open.os
-MD -MP -MF
/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf/dl-open.os.dt
-MT
/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf/dl-open.os
| dl-caller.c:1:0: error: SSE instruction set disabled, using 387
arithmetics [-Werror]
|  /* Check whether caller comes from the right place.
|  ^
| dl-open.c:1:0: error: SSE instruction set disabled, using 387 arithmetics
[-Werror]
|  /* Load a shared object at runtime, relocate it, and run its initializer.
|  ^
| cc1: all warnings being treated as errors
| cc1: all warnings being treated as errors

Ross

--001a11c2b49e6fc476050e21e034
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2015 at 18:33, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div>Yeah, I am on archlinux (the other end of s=
pectrum). Nevertheless, I have updated the contrib tree which fixes cross-l=
ocaledef-native compile time issue. So you should be good</div><div>to go n=
ow.</div></blockquote></div><br>Bad news, glibc is now failing:</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gma=
il_extra">| x86_64-poky-linux-gcc =C2=A0-m64 -march=3Dcorei7 -mtune=3Dcorei=
7 -mfpmath=3Dsse -msse4.2 --sysroot=3D/data/poky-master/tmp/sysroots/intel-=
corei7-64-tcbootstrap dl-open.c -c -std=3Dgnu99 -fgnu89-inline =C2=A0-O2 -W=
all -Werror -Winline -Wno-error=3Dundef -Wundef -Wwrite-strings -feliminate=
-unused-debug-types -fmerge-all-constants -frounding-math -g -pipe -Wstrict=
-prototypes =C2=A0 -fPIC =C2=A0-mno-sse -mno-mmx =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-I../include -I/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.2=
1-r0/build-x86_64-poky-linux/elf =C2=A0-I/data/poky-master/tmp/work/corei7-=
64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux =C2=A0-I../sysdeps/unix=
/sysv/linux/x86_64/64 =C2=A0-I../sysdeps/unix/sysv/linux/x86_64 =C2=A0-I../=
sysdeps/unix/sysv/linux/x86 =C2=A0-I../sysdeps/unix/sysv/linux/wordsize-64 =
=C2=A0-I../sysdeps/x86_64/nptl =C2=A0-I../sysdeps/unix/sysv/linux/include -=
I../sysdeps/unix/sysv/linux =C2=A0-I../sysdeps/nptl =C2=A0-I../sysdeps/pthr=
ead =C2=A0-I../sysdeps/gnu =C2=A0-I../sysdeps/unix/inet =C2=A0-I../sysdeps/=
unix/sysv =C2=A0-I../sysdeps/unix/x86_64 =C2=A0-I../sysdeps/unix =C2=A0-I..=
/sysdeps/posix =C2=A0-I../sysdeps/x86_64/64 =C2=A0-I../sysdeps/x86_64/fpu/m=
ultiarch =C2=A0-I../sysdeps/x86_64/fpu =C2=A0-I../sysdeps/x86/fpu/include -=
I../sysdeps/x86/fpu =C2=A0-I../sysdeps/x86_64/multiarch =C2=A0-I../sysdeps/=
x86_64 =C2=A0-I../sysdeps/x86 =C2=A0-I../sysdeps/ieee754/ldbl-96 =C2=A0-I..=
/sysdeps/ieee754/dbl-64/wordsize-64 =C2=A0-I../sysdeps/ieee754/dbl-64 =C2=
=A0-I../sysdeps/ieee754/flt-32 =C2=A0-I../sysdeps/wordsize-64 =C2=A0-I../sy=
sdeps/ieee754 =C2=A0-I../sysdeps/generic =C2=A0-I.. -I../libio -I. -nostdin=
c -isystem /data/poky-master/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-=
linux.gcc-cross-initial-x86_64/gcc/x86_64-poky-linux/4.9.2/include -isystem=
 /data/poky-master/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-linux.gcc-=
cross-initial-x86_64/gcc/x86_64-poky-linux/4.9.2/include-fixed -isystem /da=
ta/poky-master/tmp/sysroots/intel-corei7-64/usr/include =C2=A0-D_LIBC_REENT=
RANT -include /data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0=
/build-x86_64-poky-linux/libc-modules.h -DMODULE_NAME=3Drtld -include ../in=
clude/libc-symbols.h =C2=A0-DPIC -DSHARED =C2=A0 =C2=A0 -o /data/poky-maste=
r/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf/d=
l-open.os -MD -MP -MF /data/poky-master/tmp/work/corei7-64-poky-linux/glibc=
/2.21-r0/build-x86_64-poky-linux/elf/dl-open.os.dt -MT /data/poky-master/tm=
p/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf/dl-op=
en.os</div><div class=3D"gmail_extra">| dl-caller.c:1:0: error: SSE instruc=
tion set disabled, using 387 arithmetics [-Werror]</div><div class=3D"gmail=
_extra">| =C2=A0/* Check whether caller comes from the right place.</div><d=
iv class=3D"gmail_extra">| =C2=A0^</div><div class=3D"gmail_extra">| dl-ope=
n.c:1:0: error: SSE instruction set disabled, using 387 arithmetics [-Werro=
r]</div><div class=3D"gmail_extra">| =C2=A0/* Load a shared object at runti=
me, relocate it, and run its initializer.</div><div class=3D"gmail_extra">|=
 =C2=A0^</div><div class=3D"gmail_extra">| cc1: all warnings being treated =
as errors</div><div class=3D"gmail_extra">| cc1: all warnings being treated=
 as errors</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div></div>

--001a11c2b49e6fc476050e21e034--
