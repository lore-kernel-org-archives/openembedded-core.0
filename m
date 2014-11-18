Return-Path: <mohd.azril.ahmad@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id BC0DB72041
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 03:13:05 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so3160462qcy.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 19:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=vXD1lEPjGxAJuaITBbV5CTBO9gSj5OqcC8M9Av1b6so=;
	b=G/Ez8OVPDcivcS8k4vSeHXQlQ4T2C2a4lUfQYPizdtln5WTJXn7COqgbkkmrCdz7xu
	RkO/FA8yTbR12MCvVhgbtQLtmhvushWGhMsf8tgla4WPLgw8O258aF55lhVHoC9Cf/MD
	LzQ/usC3OIZNJLfnTU1sFBq1eM9vv3VP1icN++4ZA3rnBfH0tefmMQUQuRE613n7jUnN
	9s+ET0va5kKgr0qMR0JiwBOFGk9ExOmNHe0NbLdNV3unY3lJMrHyajJe7sDV7457IBri
	Lu0LJ6jCwkPbTdiBgAHN0axwNnGOeYXHQnaVoUmeCq/0l1kSwE54o8uX/jgHVG19snTK
	AQLg==
MIME-Version: 1.0
X-Received: by 10.229.87.202 with SMTP id x10mr39635573qcl.23.1416280386458;
	Mon, 17 Nov 2014 19:13:06 -0800 (PST)
Received: by 10.140.109.118 with HTTP; Mon, 17 Nov 2014 19:13:06 -0800 (PST)
Date: Tue, 18 Nov 2014 11:13:06 +0800
Message-ID: <CAJzb4Mj_WeUq0eZAj47Ok3MJ-i0_Gu9DO2YJyEM1EpCVOaexsw@mail.gmail.com>
From: Mohd Azril Ahmad <mohd.azril.ahmad@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: luajit : Installation fails once enable multilib environment
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
X-List-Received-Date: Tue, 18 Nov 2014 03:13:13 -0000
Content-Type: multipart/alternative; boundary=001a113376de565b0e05081979cf

--001a113376de565b0e05081979cf
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm looking for solution regarding the luajit installation fails once I
enable the intel corei7 64-bit with multilib environment where this doesn't
happen on normal setup (non-multilib).

Below are my local config and error log :

local.conf :
-------------------------------------------------------
MACHINE ??= "valleyisland-64"
...
### Enabling Multi-lib ####
require conf/multilib.conf
DEFAULTTUNE = "corei7-64"
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "corei7-32"

luajit 2.0.3 installation error :
-----------------------------------------------------------------------------
Build Configuration:
BB_VERSION        = "1.22.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Fedora-20"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "valleyisland-64"
DISTRO            = "poky"
DISTRO_VERSION    = "1.6.2"
TUNE_FEATURES     = "m64 corei7"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp    = "daisy:30b8d9378b8260e452552b806610dc9b6fe0b69f"
meta-intel
meta-valleyisland = "daisy:d9eaf5edeb848671db0a7ac864850833af82bef2"
meta-oe
meta-python
meta-networking
meta-multimedia
meta-gnome
meta-efl          = "master:a4bdcbdbca05bbb4a452e06982038f0a38bcb91f"
meta-browser      = "master:1ed7500cc43706165ccac8daccba47124e63d3eb"
meta-mycustom     = "<unknown>:<unknown>"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_install (log file is located at
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/temp/log.do_install.24577)
ERROR: Logfile of failure stored in:
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/temp/log.do_install.24577
Log data follows:
| DEBUG: Executing shell function do_install
| NOTE: make -j 8 CROSS=x86_64-poky-linux- TARGET_CFLAGS=
--sysroot=/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/sysroots/valleyisland-64
-m64 -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2 TARGET_LDFLAGS=
--sysroot=/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/sysroots/valleyisland-64
TARGET_SHLDFLAGS=
--sysroot=/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/sysroots/valleyisland-64
HOST_CC=gcc
DESTDIR=/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image
install
| ==== Installing LuaJIT 2.0.3 to /usr ====
| mkdir -p
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/bin
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/include/luajit-2.0
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/man/man1
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/pkgconfig
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/luajit-2.0.3/jit
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/lua/5.1
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/lua/5.1
| cd src && install -m 0755 luajit
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/bin/luajit-2.0.3
| cd src && test -f libluajit.a && install -m 0644 libluajit.a
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/libluajit-5.1.a
|| :
| rm -f
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/bin/luajit
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/libluajit-5.1.so.2.0.3
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/
libluajit-5.1.so
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/
libluajit-5.1.so
| cd src && test -f libluajit.so && \
|   install -m 0755 libluajit.so
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/libluajit-5.1.so.2.0.3
&& \
|   ldconfig -n
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib
&& \
|   ln -sf libluajit-5.1.so.2.0.3
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/
libluajit-5.1.so && \
|   ln -sf libluajit-5.1.so.2.0.3
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/
libluajit-5.1.so || :
| cd etc && install -m 0644 luajit.1
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/man/man1
| cd etc && sed -e "s|^prefix=.*|prefix=/usr|" -e
"s|^multilib=.*|multilib=lib|" luajit.pc > luajit.pc.tmp && \
|   install -m 0644 luajit.pc.tmp
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/pkgconfig/luajit.pc
&& \
|   rm -f luajit.pc.tmp
| cd src && install -m 0644 lua.h lualib.h lauxlib.h luaconf.h lua.hpp
luajit.h
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/include/luajit-2.0
| cd src/jit && install -m 0644 bc.lua v.lua dump.lua dis_x86.lua
dis_x64.lua dis_arm.lua dis_ppc.lua dis_mips.lua dis_mipsel.lua bcsave.lua
vmdef.lua
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/luajit-2.0.3/jit
| ln -sf luajit-2.0.3
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/bin/luajit
| ==== Successfully installed LuaJIT 2.0.3 to /usr ====
| rmdir: failed to remove
'/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua/5.*':
No such file or directory
| rmdir: failed to remove
'/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua':
No such file or directory
| WARNING:
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/temp/run.do_install.24577:1
exit 1 from
|   rmdir
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/lua/5.*
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/lua
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua/5.*
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua
| ERROR: Function failed: do_install (log file is located at
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/temp/log.do_install.24577)
ERROR: Task 4138
(/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/meta-openembedded/meta-oe/recipes-devtools/luajit/
luajit_2.0.3.bb, do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2406 tasks of which 2397 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
-----------------------------------------------------------------

Seems that it fails on looking for the correct path ?
...
...
rmdir: failed to remove
'/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua/5.*':
No such file or directory
| rmdir: failed to remove
'/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua':
No such file or directory
...
...

--001a113376de565b0e05081979cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi all,<br><br></div>I&#39;m look=
ing for solution regarding the luajit installation fails once I enable the =
intel corei7 64-bit with multilib environment where this doesn&#39;t happen=
 on normal setup (non-multilib).<br><br></div>Below are my local config and=
 error log :<br><br></div>local.conf :<br>---------------------------------=
----------------------<br>MACHINE ??=3D &quot;valleyisland-64&quot;<br>...<=
br>### Enabling Multi-lib ####<br>require conf/multilib.conf<br>DEFAULTTUNE=
 =3D &quot;corei7-64&quot;<br>MULTILIBS =3D &quot;multilib:lib32&quot;<br>D=
EFAULTTUNE_virtclass-multilib-lib32 =3D &quot;corei7-32&quot;<br><br></div>=
luajit 2.0.3 installation error :<br>--------------------------------------=
---------------------------------------<br>Build Configuration:<br>BB_VERSI=
ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.22.0&quot;<br>BUIL=
D_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-linu=
x&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0 =3D &quot;Fedora-20&quot;<br>TARGET_=
SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-poky-linux&q=
uot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;valleyisland-64&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DISTRO_VERSION=C2=
=A0=C2=A0=C2=A0 =3D &quot;1.6.2&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;m64 corei7&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;&quot;<br>meta<br>meta-yocto<br>meta-yocto-bsp=C2=A0=
=C2=A0=C2=A0 =3D &quot;daisy:30b8d9378b8260e452552b806610dc9b6fe0b69f&quot;=
<br>meta-intel<br>meta-valleyisland =3D &quot;daisy:d9eaf5edeb848671db0a7ac=
864850833af82bef2&quot;<br>meta-oe<br>meta-python<br>meta-networking<br>met=
a-multimedia<br>meta-gnome<br>meta-efl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D &quot;master:a4bdcbdbca05bbb4a452e06982038f0a38bcb91=
f&quot;<br>meta-browser=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:1ed7=
500cc43706165ccac8daccba47124e63d3eb&quot;<br>meta-mycustom=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;&lt;unknown&gt;:&lt;unknown&gt;&quot;<br><br>NOTE: Prep=
aring runqueue<br>NOTE: Executing SetScene Tasks<br>NOTE: Executing RunQueu=
e Tasks<br>ERROR: Function failed: do_install (log file is located at /MOUN=
T/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/l=
uajit/2.0.3-r0/temp/log.do_install.24577)<br>ERROR: Logfile of failure stor=
ed in: /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-=
poky-linux/luajit/2.0.3-r0/temp/log.do_install.24577<br>Log data follows:<b=
r>| DEBUG: Executing shell function do_install<br>| NOTE: make -j 8 CROSS=
=3Dx86_64-poky-linux- TARGET_CFLAGS=3D --sysroot=3D/MOUNT/EXT/YOCTO_BUILDER=
/YOCTO_SOURCE/TEST_BUILD/tmp/sysroots/valleyisland-64=C2=A0 -m64 -march=3Dc=
orei7 -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2 TARGET_LDFLAGS=3D --sysroot=
=3D/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/sysroots/valleyisla=
nd-64 TARGET_SHLDFLAGS=3D --sysroot=3D/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE=
/TEST_BUILD/tmp/sysroots/valleyisland-64 HOST_CC=3Dgcc=C2=A0 DESTDIR=3D/MOU=
NT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/=
luajit/2.0.3-r0/image install<br>| =3D=3D=3D=3D Installing LuaJIT 2.0.3 to =
/usr =3D=3D=3D=3D<br>| mkdir -p /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_=
BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/bin /MOUNT/EX=
T/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luaji=
t/2.0.3-r0/image/usr/lib /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/t=
mp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/include/luajit-2.0 /=
MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-lin=
ux/luajit/2.0.3-r0/image/usr/share/man/man1 /MOUNT/EXT/YOCTO_BUILDER/YOCTO_=
SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/l=
ib/pkgconfig /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/core=
i7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/luajit-2.0.3/jit /MOUNT/EX=
T/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luaji=
t/2.0.3-r0/image/usr/share/lua/5.1 /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TE=
ST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/lua/5.=
1<br>| cd src &amp;&amp; install -m 0755 luajit /MOUNT/EXT/YOCTO_BUILDER/YO=
CTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/u=
sr/bin/luajit-2.0.3<br>| cd src &amp;&amp; test -f libluajit.a &amp;&amp; i=
nstall -m 0644 libluajit.a /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD=
/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/libluajit-5.1.=
a || :<br>| rm -f /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work=
/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/bin/luajit /MOUNT/EXT/YOCTO=
_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3=
-r0/image/usr/lib/libluajit-5.1.so.2.0.3 /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOU=
RCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/=
<a href=3D"http://libluajit-5.1.so">libluajit-5.1.so</a> /MOUNT/EXT/YOCTO_B=
UILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r=
0/image/usr/lib/<a href=3D"http://libluajit-5.1.so">libluajit-5.1.so</a><br=
>| cd src &amp;&amp; test -f libluajit.so &amp;&amp; \<br>|=C2=A0=C2=A0 ins=
tall -m 0755 libluajit.so /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/=
tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/libluajit-5.1.s=
o.2.0.3 &amp;&amp; \<br>|=C2=A0=C2=A0 ldconfig -n /MOUNT/EXT/YOCTO_BUILDER/=
YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image=
/usr/lib &amp;&amp; \<br>|=C2=A0=C2=A0 ln -sf libluajit-5.1.so.2.0.3 /MOUNT=
/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/lu=
ajit/2.0.3-r0/image/usr/lib/<a href=3D"http://libluajit-5.1.so">libluajit-5=
.1.so</a> &amp;&amp; \<br>|=C2=A0=C2=A0 ln -sf libluajit-5.1.so.2.0.3 /MOUN=
T/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/l=
uajit/2.0.3-r0/image/usr/lib/<a href=3D"http://libluajit-5.1.so">libluajit-=
5.1.so</a> || :<br>| cd etc &amp;&amp; install -m 0644 luajit.1 /MOUNT/EXT/=
YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/=
2.0.3-r0/image/usr/share/man/man1<br>| cd etc &amp;&amp; sed -e &quot;s|^pr=
efix=3D.*|prefix=3D/usr|&quot; -e &quot;s|^multilib=3D.*|multilib=3Dlib|&qu=
ot; luajit.pc &gt; luajit.pc.tmp &amp;&amp; \<br>|=C2=A0=C2=A0 install -m 0=
644 luajit.pc.tmp /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work=
/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib/pkgconfig/luajit.pc &am=
p;&amp; \<br>|=C2=A0=C2=A0 rm -f luajit.pc.tmp<br>| cd src &amp;&amp; insta=
ll -m 0644 lua.h lualib.h lauxlib.h luaconf.h lua.hpp luajit.h /MOUNT/EXT/Y=
OCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2=
.0.3-r0/image/usr/include/luajit-2.0<br>| cd src/jit &amp;&amp; install -m =
0644 bc.lua v.lua dump.lua dis_x86.lua dis_x64.lua dis_arm.lua dis_ppc.lua =
dis_mips.lua dis_mipsel.lua bcsave.lua vmdef.lua /MOUNT/EXT/YOCTO_BUILDER/Y=
OCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/=
usr/share/luajit-2.0.3/jit<br>| ln -sf luajit-2.0.3 /MOUNT/EXT/YOCTO_BUILDE=
R/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/ima=
ge/usr/bin/luajit<br>| =3D=3D=3D=3D Successfully installed LuaJIT 2.0.3 to =
/usr =3D=3D=3D=3D<br>| rmdir: failed to remove &#39;/MOUNT/EXT/YOCTO_BUILDE=
R/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/ima=
ge/usr/lib64/lua/5.*&#39;: No such file or directory<br>| rmdir: failed to =
remove &#39;/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei=
7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua&#39;: No such file or d=
irectory<br>| WARNING: /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp=
/work/corei7-64-poky-linux/luajit/2.0.3-r0/temp/run.do_install.24577:1 exit=
 1 from<br>|=C2=A0=C2=A0 rmdir /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_B=
UILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/share/lua/5.* =
/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-li=
nux/luajit/2.0.3-r0/image/usr/share/lua /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOUR=
CE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64=
/lua/5.* /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-6=
4-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua<br>| ERROR: Function faile=
d: do_install (log file is located at /MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE=
/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/temp/log.do_insta=
ll.24577)<br>ERROR: Task 4138 (/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/meta-o=
penembedded/meta-oe/recipes-devtools/luajit/<a href=3D"http://luajit_2.0.3.=
bb">luajit_2.0.3.bb</a>, do_install) failed with exit code &#39;1&#39;<br>N=
OTE: Tasks Summary: Attempted 2406 tasks of which 2397 didn&#39;t need to b=
e rerun and 1 failed.<br>Waiting for 0 running tasks to finish:<br><br>Summ=
ary: 1 task failed:<br>----------------------------------------------------=
-------------<br><br></div>Seems that it fails on looking for the correct p=
ath ?<br>...<br>...<br>rmdir: failed to remove &#39;/MOUNT/EXT/YOCTO_BUILDE=
R/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei7-64-poky-linux/luajit/2.0.3-r0/ima=
ge/usr/lib64/lua/5.*&#39;: No such file or directory<br>| rmdir: failed to =
remove &#39;/MOUNT/EXT/YOCTO_BUILDER/YOCTO_SOURCE/TEST_BUILD/tmp/work/corei=
7-64-poky-linux/luajit/2.0.3-r0/image/usr/lib64/lua&#39;: No such file or d=
irectory<br>...<br>...<br></div>

--001a113376de565b0e05081979cf--
