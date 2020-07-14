Subject: ERROR: ruby-2.7.1-r0 do_compile: oe_runmake failed
To: openembedded-core@lists.openembedded.org
From: "Pankaj  Vinadrao Joshi" <pankaj.vj@exaleapsemi.com>
X-Originating-Location: Pune, Maharashtra, IN (157.33.182.219)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 14 Jul 2020 12:00:50 -0700
Message-ID: <eDCr.1594753250276030651.DYEC@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="JALjr3wFQmXOjaVU3dS5"

--JALjr3wFQmXOjaVU3dS5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi.
i am trying to build sato-image on RPI but i am getting following error w.=
r.t ruby.i have added ruby & ruby-dev package via image_install,what wrong =
could be happened with this can someone help??

:~/ORASP$ bitbake core-image-sato
Parsing recipes: 100% |###################################################=
###########################################################################=
########################################| Time: 0:02:31
Parsing of 2279 .bb files complete (0 cached, 2279 parsed). 3439 targets, =
132 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.46.0"
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D "ubuntu-18.04"
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "aarch64-oe-linux"
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "raspberrypi4-=
64"
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "exaleap-=
arm-linux"
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "exaleap-arm-linux-r1.0.0"
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "aarch64 cortexa72 crc crypto=
"
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ""
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "mas=
ter:982b7f98b8423236cc986346379b1bde3694f131"
meta-oe
meta-python
meta-networking
meta-multimedia
meta-perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "dunfell:e413c1ef62=
1688e69bb7830bb3151ed23b30b73e"
meta-raspberrypi=C2=A0 =C2=A0 =C2=A0=3D "master:5ac6f013339b0b1ab2d71f9f6a=
f48a186e126c19"
meta-pankaj=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "<unknown>:<unknown>"

Initialising tasks: 100% |################################################=
###########################################################################=
########################################| Time: 0:00:05
Sstate summary: Wanted 1633 Found 0 Missed 1633 Current 973 (0% match, 37%=
 complete)
NOTE: Executing Tasks
ERROR: ruby-2.7.1-r0 do_compile: oe_runmake failed
ERROR: ruby-2.7.1-r0 do_compile: Execution of '/home/pankaj/ORASP/tmp-glib=
c/work/aarch64-oe-linux/ruby/2.7.1-r0/temp/run.do_compile.4394' failed with=
 exit code 1:
BASERUBY =3D /home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.7.1=
-r0/recipe-sysroot-native/usr/bin/ruby --disable=3Dgems
CC =3D aarch64-oe-linux-gcc=C2=A0 -mcpu=3Dcortex-a72+crc+crypto --sysroot=
=3D/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.7.1-r0/recipe=
-sysroot
LD =3D aarch64-oe-linux-ld --sysroot=3D/home/pankaj/ORASP/tmp-glibc/work/a=
arch64-oe-linux/ruby/2.7.1-r0/recipe-sysroot
LDSHARED =3D aarch64-oe-linux-gcc=C2=A0 -mcpu=3Dcortex-a72+crc+crypto --sy=
sroot=3D/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.7.1-r0/re=
cipe-sysroot -shared
CFLAGS =3D -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=
=3D/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.7.1-r0=3D/usr=
/src/debug/ruby/2.7.1-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/home/pankaj/ORASP/tmp-gl=
ibc/work/aarch64-oe-linux/ruby/2.7.1-r0=3D/usr/src/debug/ruby/2.7.1-r0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
-fdebug-prefix-map=3D/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-linux/rub=
y/2.7.1-r0/recipe-sysroot=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/home/pankaj/ORASP/tm=
p-glibc/work/aarch64-oe-linux/ruby/2.7.1-r0/recipe-sysroot-native=3D=C2=A0 =
-fPIC
XCFLAGS =3D -D_FORTIFY_SOURCE=3D2 -fstack-protector-strong -fno-strict-ove=
rflow -fvisibility=3Dhidden -fexcess-precision=3Dstandard -DRUBY_EXPORT -DC=
ANONICALIZATION_FOR_MATHN -I. -I.ext/include/aarch64-linux-gnu -I../ruby-2.=
7.1/include -I../ruby-2.7.1 -I../ruby-2.7.1/enc/unicode/12.1.0
CPPFLAGS =3D
DLDFLAGS =3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,--compress=
-debug-sections=3Dzlib -Wl,-soname,libruby.so.2.7=C2=A0 -L. -Wl,-O1 -Wl,--h=
ash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong -rdynamic -Wl,-exp=
ort-dynamic -fstack-protector-strong
SOLIBS =3D -lz -lpthread -lrt -lrt -ldl -lm
LANG =3D
LC_ALL =3D en_US.UTF-8
LC_CTYPE =3D
MFLAGS =3D -j --jobserver-fds=3D4,5
aarch64-oe-linux-gcc (GCC) 10.1.0
Copyright (C) 2020 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.=C2=A0 There =
is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.

../ruby-2.7.1/revision.h unchanged
generating enc.mk
making srcs under enc
making enc
make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build'
make[1]: Nothing to be done for 'enc'.
make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build'
make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build'
make[1]: Nothing to be done for 'srcs'.
make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build'
generating transdb.h
transdb.h unchanged
making trans
generating makefiles ext/configure-ext.mk
make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build'
make[1]: Nothing to be done for '../ruby-2.7.1/enc/trans'.
make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build'
making encs
make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build'
make[1]: Nothing to be done for 'encs'.
make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build'
ext/configure-ext.mk unchanged
make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/json'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/syslog'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/syslog'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/json'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/digest'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/ripper'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/digest'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/ripper'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/monitor'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/monitor'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/bigdecimal'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/bigdecimal'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/io/console'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/openssl'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/io/console'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/openssl'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/-test-/marshal/compat'
linking shared-object -test-/marshal/compat.so
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/coverage'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/coverage'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/pathname'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/nkf'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/pty'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/pathname'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/nkf'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/pty'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/psych'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/rubyvm'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/rubyvm'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/fiddle'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/fiddle'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/psych'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/date'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/date'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/socket'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/socket'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/-test-/marshal/compat'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build/ext/digest/sha2'
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build/ext/digest/sha2'
make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build'
../ruby-2.7.1/revision.h unchanged
make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build'
make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build'
make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-=
linux/ruby/2.7.1-r0/build'
make[1]: Nothing to be done for 'note'.
make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-l=
inux/ruby/2.7.1-r0/build'
Generating RDoc documentation
uh-oh! RDoc had a problem:

Directory .ext/rdoc already exists, but it looks like it isn't an RDoc dir=
ectory.

Because RDoc doesn't want to risk destroying any of your existing files,
you'll need to specify a different output directory name (using the --op <=
dir>
option)
un with --debug for full backtrace
uncommon.mk:556: recipe for target 'rdoc' failed
make: *** [rdoc] Error 1
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pankaj/ORASP/tmp-glibc/work/aar=
ch64-oe-linux/ruby/2.7.1-r0/temp/log.do_compile.4394

--JALjr3wFQmXOjaVU3dS5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi.<br />i am trying to build sato-image on RPI but i am getting follo=
wing error w.r.t ruby.i have added ruby &amp; ruby-dev package via image_in=
stall,what wrong could be happened with this can someone help??<br /><br />=
:~/ORASP$ bitbake core-image-sato</div>
<div>Parsing recipes: 100% |##############################################=
###########################################################################=
#############################################| Time: 0:02:31</div>
<div>Parsing of 2279 .bb files complete (0 cached, 2279 parsed). 3439 targ=
ets, 132 skipped, 0 masked, 0 errors.</div>
<div>NOTE: Resolving any missing task queue dependencies</div>
<div>&nbsp;</div>
<div>Build Configuration:</div>
<div>BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "1.46.0"</div>
<div>BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "x86_64-linux"=
</div>
<div>NATIVELSBSTRING&nbsp; &nbsp; &nbsp; =3D "ubuntu-18.04"</div>
<div>TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "aarch64-oe-li=
nux"</div>
<div>MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "raspberr=
ypi4-64"</div>
<div>DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "exa=
leap-arm-linux"</div>
<div>DISTRO_VERSION&nbsp; &nbsp; &nbsp; &nbsp;=3D "exaleap-arm-linux-r1.0.=
0"</div>
<div>TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D "aarch64 cortexa72 crc c=
rypto"</div>
<div>TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D ""</div>
<div>meta&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D=
 "master:982b7f98b8423236cc986346379b1bde3694f131"</div>
<div>meta-oe&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-python&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-networking&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-multimedia&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-perl&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "dunfell:e413c=
1ef621688e69bb7830bb3151ed23b30b73e"</div>
<div>meta-raspberrypi&nbsp; &nbsp; &nbsp;=3D "master:5ac6f013339b0b1ab2d71=
f9f6af48a186e126c19"</div>
<div>meta-pankaj&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "&lt;unknown&gt;:&l=
t;unknown&gt;"</div>
<div>&nbsp;</div>
<div>Initialising tasks: 100% |###########################################=
###########################################################################=
#############################################| Time: 0:00:05</div>
<div>Sstate summary: Wanted 1633 Found 0 Missed 1633 Current 973 (0% match=
, 37% complete)</div>
<div>NOTE: Executing Tasks</div>
<div>ERROR: ruby-2.7.1-r0 do_compile: oe_runmake failed</div>
<div>ERROR: ruby-2.7.1-r0 do_compile: Execution of '/home/pankaj/ORASP/tmp=
-glibc/work/aarch64-oe-linux/ruby/2.7.1-r0/temp/run.do_compile.4394' failed=
 with exit code 1:</div>
<div><span style=3D"white-space: pre;"> </span>BASERUBY =3D /home/pankaj/O=
RASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.7.1-r0/recipe-sysroot-native/us=
r/bin/ruby --disable=3Dgems</div>
<div><span style=3D"white-space: pre;"> </span>CC =3D aarch64-oe-linux-gcc=
&nbsp; -mcpu=3Dcortex-a72+crc+crypto --sysroot=3D/home/pankaj/ORASP/tmp-gli=
bc/work/aarch64-oe-linux/ruby/2.7.1-r0/recipe-sysroot</div>
<div><span style=3D"white-space: pre;"> </span>LD =3D aarch64-oe-linux-ld =
--sysroot=3D/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.7.1-r=
0/recipe-sysroot&nbsp;</div>
<div><span style=3D"white-space: pre;"> </span>LDSHARED =3D aarch64-oe-lin=
ux-gcc&nbsp; -mcpu=3Dcortex-a72+crc+crypto --sysroot=3D/home/pankaj/ORASP/t=
mp-glibc/work/aarch64-oe-linux/ruby/2.7.1-r0/recipe-sysroot -shared</div>
<div><span style=3D"white-space: pre;"> </span>CFLAGS =3D -O2 -pipe -g -fe=
liminate-unused-debug-types -fmacro-prefix-map=3D/home/pankaj/ORASP/tmp-gli=
bc/work/aarch64-oe-linux/ruby/2.7.1-r0=3D/usr/src/debug/ruby/2.7.1-r0&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -fde=
bug-prefix-map=3D/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.=
7.1-r0=3D/usr/src/debug/ruby/2.7.1-r0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -fdebug-prefix-map=3D/home/pankaj/OR=
ASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.7.1-r0/recipe-sysroot=3D&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -fdebu=
g-prefix-map=3D/home/pankaj/ORASP/tmp-glibc/work/aarch64-oe-linux/ruby/2.7.=
1-r0/recipe-sysroot-native=3D&nbsp; -fPIC&nbsp;</div>
<div><span style=3D"white-space: pre;"> </span>XCFLAGS =3D -D_FORTIFY_SOUR=
CE=3D2 -fstack-protector-strong -fno-strict-overflow -fvisibility=3Dhidden =
-fexcess-precision=3Dstandard -DRUBY_EXPORT -DCANONICALIZATION_FOR_MATHN -I=
. -I.ext/include/aarch64-linux-gnu -I../ruby-2.7.1/include -I../ruby-2.7.1 =
-I../ruby-2.7.1/enc/unicode/12.1.0</div>
<div><span style=3D"white-space: pre;"> </span>CPPFLAGS =3D&nbsp; &nbsp;</=
div>
<div><span style=3D"white-space: pre;"> </span>DLDFLAGS =3D -Wl,-O1 -Wl,--=
hash-style=3Dgnu -Wl,--as-needed -Wl,--compress-debug-sections=3Dzlib -Wl,-=
soname,libruby.so.2.7&nbsp; -L. -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-nee=
ded -fstack-protector-strong -rdynamic -Wl,-export-dynamic -fstack-protecto=
r-strong&nbsp;&nbsp;</div>
<div><span style=3D"white-space: pre;"> </span>SOLIBS =3D -lz -lpthread -l=
rt -lrt -ldl -lm&nbsp;</div>
<div><span style=3D"white-space: pre;"> </span>LANG =3D&nbsp;</div>
<div><span style=3D"white-space: pre;"> </span>LC_ALL =3D en_US.UTF-8</div=
>
<div><span style=3D"white-space: pre;"> </span>LC_CTYPE =3D&nbsp;</div>
<div><span style=3D"white-space: pre;"> </span>MFLAGS =3D -j --jobserver-f=
ds=3D4,5</div>
<div>aarch64-oe-linux-gcc (GCC) 10.1.0</div>
<div>Copyright (C) 2020 Free Software Foundation, Inc.</div>
<div>This is free software; see the source for copying conditions.&nbsp; T=
here is NO</div>
<div>warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PU=
RPOSE.</div>
<div>&nbsp;</div>
<div>../ruby-2.7.1/revision.h unchanged</div>
<div>generating enc.mk</div>
<div>making srcs under enc</div>
<div>making enc</div>
<div>make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[1]: Nothing to be done for 'enc'.</div>
<div>make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[1]: Nothing to be done for 'srcs'.</div>
<div>make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build'</div>
<div>generating transdb.h</div>
<div>transdb.h unchanged</div>
<div>making trans</div>
<div>generating makefiles ext/configure-ext.mk</div>
<div>make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[1]: Nothing to be done for '../ruby-2.7.1/enc/trans'.</div>
<div>make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build'</div>
<div>making encs</div>
<div>make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[1]: Nothing to be done for 'encs'.</div>
<div>make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build'</div>
<div>ext/configure-ext.mk unchanged</div>
<div>make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/json'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/syslog'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/syslog'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/json'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/digest'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/ripper'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/digest'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/ripper'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/monitor'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/monitor'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/bigdecimal'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/bigdecimal'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/io/console'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/openssl'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/io/console'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/openssl'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/-test-/marshal/compat'</div>
<div>linking shared-object -test-/marshal/compat.so</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/coverage'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/coverage'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/pathname'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/nkf'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/pty'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/pathname'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/nkf'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/pty'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/psych'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/rubyvm'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/rubyvm'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/fiddle'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/fiddle'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/psych'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/date'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/date'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/socket'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/socket'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/-test-/marshal/compat'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build/ext/digest/sha2'</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build/ext/digest/sha2'</div>
<div>make[2]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build'</div>
<div>../ruby-2.7.1/revision.h unchanged</div>
<div>make[2]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[1]: Entering directory '/home/pankaj/ORASP/tmp-glibc/work/aarch6=
4-oe-linux/ruby/2.7.1-r0/build'</div>
<div>make[1]: Nothing to be done for 'note'.</div>
<div>make[1]: Leaving directory '/home/pankaj/ORASP/tmp-glibc/work/aarch64=
-oe-linux/ruby/2.7.1-r0/build'</div>
<div>Generating RDoc documentation</div>
<div>uh-oh! RDoc had a problem:</div>
<div>&nbsp;</div>
<div>Directory .ext/rdoc already exists, but it looks like it isn't an RDo=
c directory.</div>
<div>&nbsp;</div>
<div>Because RDoc doesn't want to risk destroying any of your existing fil=
es,</div>
<div>you'll need to specify a different output directory name (using the -=
-op &lt;dir&gt;</div>
<div>option)</div>
<div>
<div>un with --debug for full backtrace</div>
<div>uncommon.mk:556: recipe for target 'rdoc' failed</div>
<div>make: *** [rdoc] Error 1</div>
<div>WARNING: exit code 1 from a shell command.</div>
<div>&nbsp;</div>
<div>ERROR: Logfile of failure stored in: /home/pankaj/ORASP/tmp-glibc/wor=
k/aarch64-oe-linux/ruby/2.7.1-r0/temp/log.do_compile.4394</div>
</div>
<div>&nbsp;</div>

--JALjr3wFQmXOjaVU3dS5--
