Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amery@geeks.cl>) id 1U13Bz-00089E-QE
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 00:05:16 +0100
Received: by mail-ve0-f174.google.com with SMTP id c13so2491500vea.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 14:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=HyMco7x+7MivJ9RQRIYx46g4Yfp5VrgJy0CgEnMx6C0=;
	b=lEYbmzb0kV1xBLcH0hZD69zQdYLqG1YyHybr9VrZaLM6xVmUrVo5QLypPzFKnwUq5M
	Vnzn/wiaG6ncPdiOBRFGQH+FFl75N9s4MKRf+ZmNC06wR3u2xcgg/Dc9ubcdlF9F5vF9
	WOHUvso7R+SPaizaeOqabbiCj/nAcpd50yxlLiivRlz+N2E/riPXFXTo0T5p74+5j2WI
	uS+WBpJJ4F9wRu6OaKOHBhQIEhj/kKiROMEDCWB/bfrqgLLiaG2u5n1/D5AgsrlUtoTB
	uvilvxtNEf1HCBjFTkFxfttsmd5RaefYXOZOrX4tJRrMgGZ09Ut+rUQ+wFLUJ2Z8HmdR
	mp/g==
X-Received: by 10.58.132.170 with SMTP id ov10mr5377022veb.57.1359672572134;
	Thu, 31 Jan 2013 14:49:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.52.231.165 with HTTP; Thu, 31 Jan 2013 14:49:12 -0800 (PST)
From: Alejandro Mery <amery@geeks.cl>
Date: Thu, 31 Jan 2013 23:49:12 +0100
Message-ID: <CACB0nks-pBNDmYPPJ3vtPSEmri8Yeh7pJ-X229K6taXNx_DOow@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQlxA6Lwx6uEkaVXgPBJMGcEcPAdUlUBh0/87PXLa5MWft19l8j0giECA8nn76oeSNtv7WDk
Subject: can't build distro-less beagleboard/uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 23:05:16 -0000
Content-Type: multipart/alternative; boundary=047d7b6da8f8ac44fa04d49d7080

--047d7b6da8f8ac44fa04d49d7080
Content-Type: text/plain; charset=UTF-8

Hi, I'm trying to make a custom uclibc based distro over oe-core's master,
it's going fine for x86 but for my armv7a board uclibc fails to compile.
and as suggested on IRC I reproduced it for a distro-less
beagleboard/uclibc too. The host is ubuntu 12.04/64 with linaro arm
toolchain installed, but I suppose that's not relevant at all.

Same issue happens with default uclibc and with 0.9.33.

log.do_compile: http://sprunge.us/BRWH
conf/bblayers.conf: http://sprunge.us/NhHZ
conf/local.conf: http://sprunge.us/cHED

any pointer would be greatly appreaciated. thank you.

build output follows:

$ bitbake core-image-minimal
Loading cache: 100%
|###########################################################################################################################################################################################|
ETA:  00:00:00
Loaded 1913 entries from dependency cache.

Build Configuration:
BB_VERSION        = "1.17.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-oe-linux-uclibceabi"
MACHINE           = "beagleboard"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta-oe
toolchain-layer
meta-efl
meta-gnome        = "master:d6d009b2625d6bcc7152d700fce2fdfecd3e0bd7"
meta-browser      = "master:e037c1461d884084bbd06138a1fc448dfb0555bf"
meta-ti           = "master:3eb71003af3ebb025285493721332111ac581a42"
meta              = "master:1489a69cecb1dcc3502a4c24beaea81e6ca6dacc"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile (see
/x/oe-beagleboard/tmp-uclibc/work/armv7a-vfp-neon-oe-linux-uclibceabi/uclibc/0.9.33-r8.3/temp/log.do_compile.26374
for further information)
ERROR: Logfile of failure stored in:
/x/oe-beagleboard/tmp-uclibc/work/armv7a-vfp-neon-oe-linux-uclibceabi/uclibc/0.9.33-r8.3/temp/log.do_compile.26374
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make STRIPTOOL=true LD=arm-oe-linux-uclibceabi-ld
--sysroot=/x/oe-beagleboard/tmp-uclibc/sysroots/beagleboard-tcbootstrap
 HOSTCC=gcc  HOST_CFLAGS=-isystem/x/oe-beagm
| arm-oe-linux-uclibceabi-gcc  -march=armv7-a     -mthumb-interwork
-mfloat-abi=softfp -mfpu=neon
 --sysroot=/x/oe-beagleboard/tmp-uclibc/sysroots/beagleboard-tcbootstrap -c
libpthread/nptl/sysdeps/p
| In file included from ./libc/sysdeps/linux/arm/sysdep.h:24:0,
|                  from ./include/bits/atomic.h:23,
|                  from ./include/atomic.h:51,
|                  from
./libpthread/nptl/sysdeps/unix/sysv/linux/arm/lowlevellock.h:25,
|                  from ./libpthread/nptl/descr.h:30,
|                  from ./libpthread/nptl/pthreadP.h:27,
|                  from
libpthread/nptl/sysdeps/unix/sysv/linux/gen_lowlevelrobustlock.c:2:
| ./include/bits/arm_asm.h:6:1: error: expected identifier or '(' before
'.' token
| make: ***
[libpthread/nptl/sysdeps/unix/sysv/linux/gen_lowlevelrobustlock.s] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see
/x/oe-beagleboard/tmp-uclibc/work/armv7a-vfp-neon-oe-linux-uclibceabi/uclibc/0.9.33-r8.3/temp/log.do_compile.26374
for further information)
ERROR: Task 33 (/x/oe-beagleboard/../oe-core/meta/recipes-core/uclibc/
uclibc_0.9.33.bb, do_compile) failed with exit code '1'
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /x/oe-beagleboard/../oe-core/meta/recipes-core/uclibc/uclibc_0.9.33.bb,
do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.



TIA,
Alejandro Mery

--047d7b6da8f8ac44fa04d49d7080
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I&#39;m trying to make a custom uclibc based distro ov=
er oe-core&#39;s master, it&#39;s going fine for x86 but for my armv7a boar=
d uclibc fails to compile. and as suggested on IRC I reproduced it for a di=
stro-less beagleboard/uclibc=C2=A0too. The host is ubuntu 12.04/64 with lin=
aro arm toolchain installed, but I suppose that&#39;s not relevant at all.<=
div>

<br></div><div>Same issue happens with default uclibc and with 0.9.33.</div=
><div><br></div><div style>log.do_compile:=C2=A0<a href=3D"http://sprunge.u=
s/BRWH">http://sprunge.us/BRWH</a></div><div style>conf/bblayers.conf: <a h=
ref=3D"http://sprunge.us/NhHZ">http://sprunge.us/NhHZ</a><br>

</div><div style>conf/local.conf:=C2=A0<a href=3D"http://sprunge.us/cHED">h=
ttp://sprunge.us/cHED</a><br></div><div><br></div><div style>any pointer wo=
uld be greatly appreaciated. thank you.</div><div style><br></div><div styl=
e>
build output follows:</div>
<div style><br></div><div><div><div>$ bitbake core-image-minimal</div><div>=
Loading cache: 100% |######################################################=
###########################################################################=
##########################################################| ETA: =C2=A000:0=
0:00</div>

<div>Loaded 1913 entries from dependency cache.</div><div><br></div><div>Bu=
ild Configuration:</div><div>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;1.17.0&quot;</div><div>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x8=
6_64-linux&quot;</div><div>NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-12.04&qu=
ot;</div>

<div>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-oe-linux-uclibceab=
i&quot;</div><div>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;beag=
leboard&quot;</div><div>DISTRO_VERSION =C2=A0 =C2=A0=3D &quot;oe-core.0&quo=
t;</div><div>TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;armv7a vfp neon&quot;</d=
iv>

<div>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;</div><d=
iv>meta-oe</div><div>toolchain-layer</div><div>meta-efl</div><div>meta-gnom=
e =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:d6d009b2625d6bcc7152d700fce2f=
dfecd3e0bd7&quot;</div><div>meta-browser =C2=A0 =C2=A0 =C2=A0=3D &quot;mast=
er:e037c1461d884084bbd06138a1fc448dfb0555bf&quot;</div>

<div>meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:3eb71003af=
3ebb025285493721332111ac581a42&quot;</div><div>meta =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:1489a69cecb1dcc3502a4c24beaea81=
e6ca6dacc&quot;</div><div><br></div><div>NOTE: Resolving any missing task q=
ueue dependencies</div>

<div>NOTE: Preparing runqueue</div><div>NOTE: Executing SetScene Tasks</div=
><div>NOTE: Executing RunQueue Tasks</div><div>ERROR: Function failed: do_c=
ompile (see /x/oe-beagleboard/tmp-uclibc/work/armv7a-vfp-neon-oe-linux-ucli=
bceabi/uclibc/0.9.33-r8.3/temp/log.do_compile.26374 for further information=
)</div>

<div>ERROR: Logfile of failure stored in: /x/oe-beagleboard/tmp-uclibc/work=
/armv7a-vfp-neon-oe-linux-uclibceabi/uclibc/0.9.33-r8.3/temp/log.do_compile=
.26374</div><div>Log data follows:</div><div>| DEBUG: Executing shell funct=
ion do_compile</div>

<div>| NOTE: make STRIPTOOL=3Dtrue LD=3Darm-oe-linux-uclibceabi-ld --sysroo=
t=3D/x/oe-beagleboard/tmp-uclibc/sysroots/beagleboard-tcbootstrap =C2=A0HOS=
TCC=3Dgcc =C2=A0HOST_CFLAGS=3D-isystem/x/oe-beagm</div><div>| arm-oe-linux-=
uclibceabi-gcc =C2=A0-march=3Darmv7-a =C2=A0 =C2=A0 -mthumb-interwork -mflo=
at-abi=3Dsoftfp -mfpu=3Dneon =C2=A0--sysroot=3D/x/oe-beagleboard/tmp-uclibc=
/sysroots/beagleboard-tcbootstrap -c libpthread/nptl/sysdeps/p</div>

<div>| In file included from ./libc/sysdeps/linux/arm/sysdep.h:24:0,</div><=
div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./=
include/bits/atomic.h:23,</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from ./include/atomic.h:51,</div><div>| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./libpthread/np=
tl/sysdeps/unix/sysv/linux/arm/lowlevellock.h:25,</div>

<div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from .=
/libpthread/nptl/descr.h:30,</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./libpthread/nptl/pthreadP.h:27,</div><div=
>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from libpt=
hread/nptl/sysdeps/unix/sysv/linux/gen_lowlevelrobustlock.c:2:</div>

<div>| ./include/bits/arm_asm.h:6:1: error: expected identifier or &#39;(&#=
39; before &#39;.&#39; token</div><div>| make: *** [libpthread/nptl/sysdeps=
/unix/sysv/linux/gen_lowlevelrobustlock.s] Error 1</div><div>| ERROR: oe_ru=
nmake failed</div>

<div>| ERROR: Function failed: do_compile (see /x/oe-beagleboard/tmp-uclibc=
/work/armv7a-vfp-neon-oe-linux-uclibceabi/uclibc/0.9.33-r8.3/temp/log.do_co=
mpile.26374 for further information)</div><div>ERROR: Task 33 (/x/oe-beagle=
board/../oe-core/meta/recipes-core/uclibc/<a href=3D"http://uclibc_0.9.33.b=
b">uclibc_0.9.33.bb</a>, do_compile) failed with exit code &#39;1&#39;</div=
>

<div>Waiting for 0 running tasks to finish:</div><div><br></div><div>Summar=
y: 1 task failed:</div><div>=C2=A0 /x/oe-beagleboard/../oe-core/meta/recipe=
s-core/uclibc/<a href=3D"http://uclibc_0.9.33.bb">uclibc_0.9.33.bb</a>, do_=
compile</div>

<div>Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.</div></div><div><br><div><br></div><div><br></div><div>TIA,</div><div>A=
lejandro Mery<br><div><div><br></div><div><br></div></div></div></div>
</div>
</div>

--047d7b6da8f8ac44fa04d49d7080--
