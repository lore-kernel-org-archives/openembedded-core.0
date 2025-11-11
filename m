Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646F5CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 12:51:28 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16377.1762865484180369568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 04:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id E0117382DB;
	Tue, 11 Nov 2025 13:51:21 +0100 (CET)
Received: from [192.168.178.36] ([84.154.167.115]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vInq6-26tpS40; Tue, 11 Nov 2025 13:51:14 +0100
Date: Tue, 11 Nov 2025 13:51:09 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: bitbake-setup test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <9PBK5T.3N0ESJ8YG4JV3@t-online.de>
In-Reply-To: <CANNYZj_4H-EmTKQSch-7yB=KFoMezya_q4ZjupVJWfv+TdwXvg@mail.gmail.com>
References: <2AUI5T.7ZXVDQ11N5KQ@t-online.de>
	<CANNYZj_4H-EmTKQSch-7yB=KFoMezya_q4ZjupVJWfv+TdwXvg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-xPT+3rixlxiCRvwFmyP/"
X-TOI-EXPURGATEID: 150726::1762865474-397F9A6E-F275B127/0/0 CLEAN NORMAL
X-TOI-MSGID: e73d052d-003c-4677-b4d2-02f2446bf477
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 12:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226161

--=-xPT+3rixlxiCRvwFmyP/
Content-Type: text/plain; charset=iso-8859-4; format=flowed
Content-Transfer-Encoding: quoted-printable

Unfortunately I already cleared those build logs. But the issue is=20
reproducible for me, so I set up a new build like this:

flk@intel-corei7-64:~/bitbake-setup$ bin/bitbake-setup init
Bitbake-setup is using /home/flk/bitbake-builds as top directory=20
("bitbake-setup settings --help" shows how to change it).

A common site.conf file will be created, please edit or replace before=20
running builds
    /home/flk/bitbake-builds/site.conf

Proceed? (y/N): y

Available configurations:
0. oe-nodistro OpenEmbedded - 'nodistro' basic configuration
1. poky-master Poky - The Yocto Project testing distribution=20
configurations and hardware test platforms

Please select one of the above configurations by its number:
1

Available bitbake configurations:
0. poky Poky - The Yocto Project testing distribution
1. poky-with-sstate Poky - The Yocto Project testing distribution with=20
internet sstate acceleration. Use with caution as it requires a=20
completely robust local network with sufficient bandwidth.

Please select one of the above bitbake configurations by its number:
0

Target machines:
0. machine/qemux86-64
1. machine/qemuarm64
2. machine/qemuriscv64
3. machine/genericarm64
4. machine/genericx86-64

Please select one of the above options by its number:
4

Distribution configuration variants:
0. distro/poky
1. distro/poky-altcfg
2. distro/poky-tiny

Please select one of the above options by its number:
1

Run 'bitbake-setup init --non-interactive poky-master poky=20
distro/poky-altcfg machine/genericx86-64' to select this configuration=20
non-interactively.

Initializing a setup directory in
   =20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64
Continue? (y/N): y

Fetching layer/tool repositories into=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/layers
    bitbake
    openembedded-core
    meta-yocto
    yocto-docs

Setting up bitbake configuration in
   =20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build

This bitbake configuration provides:
    Poky - The Yocto Project testing distribution

Usage instructions and additional information are in
    =20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/README

The bitbake configuration files (local.conf, bblayers.conf and more)=20
can be found in
   =20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/conf

To run builds, source the environment using
    .=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/init-build-env

Then I manually cloned meta-intel into=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/layers
and added an entry for it in=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/conf/bblayers.conf

After that, I started compiling intel-media-driver, which immediately=20
failed at do_compile:
ERROR: intel-media-driver-25.1.4-r0 do_compile: Execution of=20
'/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_gener=
icx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/=
run.do_compile.2138089'=20
failed with exit code 1
ERROR: Logfile of failure stored in:=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/l=
og.do_compile.2138089
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=3D1 cmake --build=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/build=20
--target all --
| Change Dir:=20
'/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_gener=
icx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/build=
'
|
| Run Build Command(s): ninja -v -j 32 all
| ninja: fatal: posix_spawn: Argument list too long
|
| WARNING:=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/r=
un.do_compile.2138089:153=20
exit 1 from 'eval ${DESTDIR:+DESTDIR=3D${DESTDIR} }VERBOSE=3D1 cmake=20
--build=20
'/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_gener=
icx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/build=
'=20
"$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build,=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/r=
un.do_compile.2138089,=20
line 153
| 	#2: cmake_do_compile,=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/r=
un.do_compile.2138089,=20
line 147
| 	#3: do_compile,=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/r=
un.do_compile.2138089,=20
line 142
| 	#4: main,=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/r=
un.do_compile.2138089,=20
line 166
ERROR: Task=20
(/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_gener=
icx86-64/layers/meta-intel/recipes-multimedia/libva/intel-media-driver_25.1=
.4.bb:do_compile)=20
failed with exit code '1'

I attempted to circumvent this error by adding the following to the=20
intel-media-driver recipe:

EXTRA_OECMAKE +=3D "-DCMAKE_NINJA_FORCE_RESPONSE_FILE=3DON"

Now compilation started  and failed some time later with a more=20
informative error:
| FAILED: [code=3D1]=20
media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_arra=
y.cpp.o
|=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/recipe=
-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++=20
--sysroot=3D/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-ma=
chine_genericx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/2=
5.1.4/recipe-sysroot=20
@media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_arr=
ay.cpp.o.rsp=20
-MD -MT=20
media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_arra=
y.cpp.o=20
-MF=20
media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_arra=
y.cpp.o.d=20
-o=20
media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_arra=
y.cpp.o=20
-c=20
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/source=
s/intel-media-driver-25.1.4/media_driver/agnostic/common/cm/cm_array.cpp
| x86_64-poky-linux-g++: fatal error: cannot execute=20
'/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_gener=
icx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/recip=
e-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/=
gcc/x86_64-poky-linux/15.2.0/cc1plus':=20
posix_spawn: Argument list too long
| compilation terminated.


This is the directory name I am referring to:=20
'poky-master-poky-distro_poky-altcfg-machine_genericx86-64'
And it would have been even longer if I had decided to use sstate=20
mirror.

On Tue, Nov 11 2025 at 11:23:16 +01:00:00, Alexander Kanavin=20
<alex.kanavin@gmail.com> wrote:
> On Mon, 10 Nov 2025 at 18:37, Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>  I ran some tests with the bitbake-setup tool and noticed a problem=20
>> that is at least partly related to the long name of the setup=20
>> directory.
>>=20
>>  With the default value, compiling intel-media-driver fails with:
>>  posix_spawn: Argument list too long
>>=20
>>  It turns out that this is a known issue when the string length=20
>> reaches MAX_ARG_STRLEN.
>>  <https://github.com/ninja-build/ninja/issues/1261>
>>=20
>>  To verify this assumption, I changed the setup directory name to=20
>> just =C4=81 poky,=C4=81 which avoided the problem. This is an annoying i=
ssue=20
>> and not a satisfactory solution, but perhaps it will help as a bug=20
>> report or if someone else encounters the same problem.
>>=20
>>  Perhaps using response files would help?
>=20
> I'd like to see how you ended up with a directory name that is too
> long for intel-media-driver. Can you share the build logs that pass
> and those that fail?
>=20
> Bitbake-setup does not add that much to the build paths, so trying to
> make it even shorter will not solve the issue properly.
>=20
> Alex


--=-xPT+3rixlxiCRvwFmyP/
Content-Type: text/html; charset=iso-8859-4
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Unfortunately I already cleared th=
ose build logs. But the issue is reproducible for me, so I set up a new bui=
ld like this:</div><div><br></div><div>flk@intel-corei7-64:~/bitbake-setup$=
 bin/bitbake-setup init</div><div>Bitbake-setup is using /home/flk/bitbake-=
builds as top directory ("bitbake-setup settings --help" shows how to chang=
e it).</div><div><br></div><div>A common site.conf file will be created, pl=
ease edit or replace before running builds</div><div>&nbsp; &nbsp; /home/fl=
k/bitbake-builds/site.conf</div><div><br></div><div>Proceed? (y/N): y</div>=
<div><br></div><div>Available configurations:</div><div>0. oe-nodistro	Open=
Embedded - 'nodistro' basic configuration</div><div>1. poky-master	Poky - T=
he Yocto Project testing distribution configurations and hardware test plat=
forms</div><div><br></div><div>Please select one of the above configuration=
s by its number:</div><div>1</div><div><br></div><div>Available bitbake con=
figurations:</div><div>0. poky	Poky - The Yocto Project testing distributio=
n</div><div>1. poky-with-sstate	Poky - The Yocto Project testing distributi=
on with internet sstate acceleration. Use with caution as it requires a com=
pletely robust local network with sufficient bandwidth.</div><div><br></div=
><div>Please select one of the above bitbake configurations by its number:<=
/div><div>0</div><div><br></div><div>Target machines:</div><div>0. machine/=
qemux86-64</div><div>1. machine/qemuarm64</div><div>2. machine/qemuriscv64<=
/div><div>3. machine/genericarm64</div><div>4. machine/genericx86-64</div><=
div><br></div><div>Please select one of the above options by its number:</d=
iv><div>4</div><div><br></div><div>Distribution configuration variants:</di=
v><div>0. distro/poky</div><div>1. distro/poky-altcfg</div><div>2. distro/p=
oky-tiny</div><div><br></div><div>Please select one of the above options by=
 its number:</div><div>1</div><div><br></div><div>Run 'bitbake-setup init -=
-non-interactive poky-master poky distro/poky-altcfg machine/genericx86-64'=
 to select this configuration non-interactively.</div><div><br></div><div>I=
nitializing a setup directory in</div><div>&nbsp; &nbsp; /home/flk/bitbake-=
builds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64</div><div>=
Continue? (y/N): y</div><div><br></div><div>Fetching layer/tool repositorie=
s into /home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine=
_genericx86-64/layers</div><div>&nbsp; &nbsp; bitbake</div><div>&nbsp; &nbs=
p; openembedded-core &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&nbsp; &nb=
sp; meta-yocto &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp=
;</div><div>&nbsp; &nbsp; yocto-docs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>=
Setting up bitbake configuration in</div><div>&nbsp; &nbsp; /home/flk/bitba=
ke-builds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/build</=
div><div><br></div><div>This bitbake configuration provides:</div><div>&nbs=
p; &nbsp; Poky - The Yocto Project testing distribution</div><div><br></div=
><div>Usage instructions and additional information are in</div><div>&nbsp;=
 &nbsp; &nbsp;/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-=
machine_genericx86-64/build/README</div><div><br></div><div>The bitbake con=
figuration files (local.conf, bblayers.conf and more) can be found in</div>=
<div>&nbsp; &nbsp; /home/flk/bitbake-builds/poky-master-poky-distro_poky-al=
tcfg-machine_genericx86-64/build/conf</div><div><br></div><div>To run build=
s, source the environment using</div><div>&nbsp; &nbsp; . /home/flk/bitbake=
-builds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/build/ini=
t-build-env</div><div><br></div><div>Then I manually cloned meta-intel into=
 /home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_gener=
icx86-64/layers</div><div>and added an entry for it in /home/flk/bitbake-bu=
ilds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/build/conf/b=
blayers.conf</div><div><br></div><div>After that, I started compiling intel=
-media-driver, which immediately failed at do_compile:</div><div><div>ERROR=
: intel-media-driver-25.1.4-r0 do_compile: Execution of '/home/flk/bitbake-=
builds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/build/tmp/=
work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/run.do_compile.2138=
089' failed with exit code 1</div><div>ERROR: Logfile of failure stored in:=
 /home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_gener=
icx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/=
log.do_compile.2138089</div><div>Log data follows:</div><div>| DEBUG: Execu=
ting shell function do_compile</div><div>| NOTE: VERBOSE=3D1 cmake --build =
/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_generi=
cx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/build =
--target all --</div><div>| Change Dir: '/home/flk/bitbake-builds/poky-mast=
er-poky-distro_poky-altcfg-machine_genericx86-64/build/tmp/work/core2-64-po=
ky-linux/intel-media-driver/25.1.4/build'</div><div>|&nbsp;</div><div>| Run=
 Build Command(s): ninja -v -j 32 all</div><div>| ninja: fatal: posix_spawn=
: Argument list too long</div><div>|&nbsp;</div><div>| WARNING: /home/flk/b=
itbake-builds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/bui=
ld/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/run.do_compi=
le.2138089:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=3D${DESTDIR} }VERBOSE=
=3D1 cmake --build '/home/flk/bitbake-builds/poky-master-poky-distro_poky-a=
ltcfg-machine_genericx86-64/build/tmp/work/core2-64-poky-linux/intel-media-=
driver/25.1.4/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'</div><div>| WARNING: B=
acktrace (BB generated script):</div><div>| <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>#1: cmake_runcmake_build, /home/flk/bitba=
ke-builds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/build/t=
mp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/run.do_compile.2=
138089, line 153</div><div>| <span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span>#2: cmake_do_compile, /home/flk/bitbake-builds/poky-mast=
er-poky-distro_poky-altcfg-machine_genericx86-64/build/tmp/work/core2-64-po=
ky-linux/intel-media-driver/25.1.4/temp/run.do_compile.2138089, line 147</d=
iv><div>| <span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>=
#3: do_compile, /home/flk/bitbake-builds/poky-master-poky-distro_poky-altcf=
g-machine_genericx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driv=
er/25.1.4/temp/run.do_compile.2138089, line 142</div><div>| <span class=3D"=
Apple-tab-span" style=3D"white-space:pre">	</span>#4: main, /home/flk/bitba=
ke-builds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/build/t=
mp/work/core2-64-poky-linux/intel-media-driver/25.1.4/temp/run.do_compile.2=
138089, line 166</div><div>ERROR: Task (/home/flk/bitbake-builds/poky-maste=
r-poky-distro_poky-altcfg-machine_genericx86-64/layers/meta-intel/recipes-m=
ultimedia/libva/intel-media-driver_25.1.4.bb:do_compile) failed with exit c=
ode '1'</div></div><div><br></div><div>I attempted to circumvent this error=
 by adding the following to the intel-media-driver recipe:</div><div><br></=
div><div>EXTRA_OECMAKE +=3D "-DCMAKE_NINJA_FORCE_RESPONSE_FILE=3DON"</div><=
div><br></div><div>Now compilation started &nbsp;and failed some time later=
 with a more informative error:</div><div><div>| FAILED: [code=3D1] media_d=
river/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_array.cpp.o=
</div><div>| /home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-m=
achine_genericx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/=
25.1.4/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g+=
+ --sysroot=3D/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-=
machine_genericx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver=
/25.1.4/recipe-sysroot @media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/ag=
nostic/common/cm/cm_array.cpp.o.rsp -MD -MT media_driver/CMakeFiles/iHD_drv=
_video_COMMON.dir/agnostic/common/cm/cm_array.cpp.o -MF media_driver/CMakeF=
iles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_array.cpp.o.d -o media_=
driver/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_array.cpp.=
o -c /home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_g=
enericx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/s=
ources/intel-media-driver-25.1.4/media_driver/agnostic/common/cm/cm_array.c=
pp</div><div>| x86_64-poky-linux-g++: fatal error: cannot execute '/home/fl=
k/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/=
build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/recipe-sysroot=
-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_6=
4-poky-linux/15.2.0/cc1plus': posix_spawn: Argument list too long</div><div=
>| compilation terminated.</div></div><div><br></div><div><br></div><div><d=
iv>This is the directory name I am referring to: 'poky-master-poky-distro_p=
oky-altcfg-machine_genericx86-64'</div><div>And it would have been even lon=
ger if I had decided to use sstate mirror.</div></div></div><div id=3D"gear=
y-quote" dir=3D"auto"><br>On Tue, Nov 11 2025 at 11:23:16 +01:00:00, Alexan=
der Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type=3D"ci=
te"><div class=3D"plaintext" style=3D"white-space: break-spaces;">On Mon, 1=
0 Nov 2025 at 18:37, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f=
_l_k@t-online.de</a>&gt; wrote:
<blockquote> I ran some tests with the bitbake-setup tool and noticed a pro=
blem that is at least partly related to the long name of the setup director=
y.

 With the default value, compiling intel-media-driver fails with:
 posix_spawn: Argument list too long

 It turns out that this is a known issue when the string length reaches MAX=
_ARG_STRLEN.
 <a href=3D"https://github.com/ninja-build/ninja/issues/1261">https://githu=
b.com/ninja-build/ninja/issues/1261</a>

 To verify this assumption, I changed the setup directory name to just =C4=
=81 poky,=C4=81 which avoided the problem. This is an annoying issue and no=
t a satisfactory solution, but perhaps it will help as a bug report or if s=
omeone else encounters the same problem.

 Perhaps using response files would help?
</blockquote>
I'd like to see how you ended up with a directory name that is too
long for intel-media-driver. Can you share the build logs that pass
and those that fail?

Bitbake-setup does not add that much to the build paths, so trying to
make it even shorter will not solve the issue properly.

Alex
</div></blockquote></div>
--=-xPT+3rixlxiCRvwFmyP/--


