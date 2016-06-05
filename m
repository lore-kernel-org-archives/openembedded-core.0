Return-Path: <marmaduke55@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id A1DB97719B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 21:31:16 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id c66so23543375vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 14:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=9F8vGCCVS5H3RG39c1qqM24o0vnZGDAgdHBsD9zNnDE=;
	b=LDBBcAdIzBuML7jBKZN+pxI+/mXwTEiJ0Jmbn0GuA7gR7vdlxifFINmOVrJmYseVhk
	mDB5o5tJ9vTry3gOyfxV4zjXuSugVVJaR2jQz5XAdbRjl8IBBs0ZqxL9HlAJzIFCWMIU
	mljzi4ftR+BOuvxQRYbIFYjpldeCNS82nwh1hRmN+X9XIvRWf5pTidpA8d+aqtngXOs2
	W8rIFh5R9ftEmrzOhcAGD3rFKWGDBQLLa5GGGpMQDOKpYVI7az655hUBIVWQn10tYEcD
	a3s63LDe7LlpWIJEbAtLBX+EU35AUEmN8qVOrnnM3XmIVjwjhe+2TAz8kYhVDVJSrahs
	jC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=9F8vGCCVS5H3RG39c1qqM24o0vnZGDAgdHBsD9zNnDE=;
	b=lbWJ/uvreN/6G380JBwD3aRXv6BrB9PGvjbura/oDKe6KfMdx6Bcac6oRp7Mv0/i04
	F8g7yTZXshzYC6xKxC34zNES3mmVmm1pTIABrLd7lhmtj6tyxIqal0qNHF2puGHFrdYG
	Agu7tQB0GBwF8lc6PhK5eess1UXcPh/lson2KoTeHAiYU3qS2aA+EFb1tgxlHcjw0/m+
	HBDnc0G+ybljBcMyqp084yBIwwQXwUcPNGfoyN0C8Ew1mGOnzE3OTbgIJDEeSXYoUJ30
	uEMfwKORIF5Cy2HzV5fuw1GfDUTqqoMcGj6vzReWYWZq0E2qzy4eAkP2FSauNOxrfXkO
	X3Bg==
X-Gm-Message-State: ALyK8tI9ezIxL6nUDJYr84YBqz98fwBXt3L/riHO2w3wThy3wGadora/nSDR25MrALAAa53O0o2n69fF+kSsIg==
X-Received: by 10.31.93.199 with SMTP id r190mr6604273vkb.151.1465162276373;
	Sun, 05 Jun 2016 14:31:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.35.175 with HTTP; Sun, 5 Jun 2016 14:31:15 -0700 (PDT)
From: Michael Dangler <marmaduke55@gmail.com>
Date: Sun, 5 Jun 2016 17:31:15 -0400
Message-ID: <CALNhhxT8zu-zXEgMDhtFu98DktWcD9Hy1Ga2J4PLnAWp3NWnzA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Issue with python-imaging
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
X-List-Received-Date: Sun, 05 Jun 2016 21:31:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c092f5605895f05348ead2e

--94eb2c092f5605895f05348ead2e
Content-Type: text/plain; charset=UTF-8

Hello

Hopefully I am in the right place. Not having any luck with building yocto
with ros or even just trying to bitbake python-imaging. Seems the issue
always fails with the following -

Build Configuration:
BB_VERSION        = "1.26.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "pepper"
DISTRO            = "poky"
DISTRO_VERSION    = "1.8"
TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "(nobranch):83aa565d93aacae484976562ef1ae8dbbb6b2bc0"
meta-gnome
meta-oe
meta-xfce
meta-systemd
meta-networking
meta-multimedia
meta-python       = "(nobranch):10d3c8f85280a0bf867a8e4f84bcda81c290d28e"
meta-gumstix      = "(nobranch):8ea631d8ef26cb13102dac0910be52674cb7b395"
meta-gumstix-extras = "(nobranch):15cfa9fcff75d3d95f66cfa190e1b604ff5ea4f6"
meta-ros          = "(nobranch):d465a23c0a96e651419d46b29ab7c0c3663da314"
meta-ti           = "(nobranch):03cb3ff15f3b8535ca409ce682f44ec1b81da0c3"
meta-java         = "(nobranch):66c97ae7461f4c1a13917131787bb76dc34e6b6f"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: QA Issue: python-imaging: The compile log indicates that host
include and/or library paths were used.
         Please check the log
'/home/michael/yocto/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/python-imaging/1.1.7-r5/temp/log.do_compile'
for more information. [compile-host-path]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in:
/home/michael/yocto/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/python-imaging/1.1.7-r5/temp/log.do_package_qa.21754
ERROR: Task 4911 (/home/michael/yocto/poky/meta/recipes-devtools/python/
python-imaging_1.1.7.bb, do_package_qa) failed with exit code '1'
NOTE: Tasks Summary: Attempted 5307 tasks of which 5298 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

And when looking at do_compile -

DEBUG: Executing shell function do_compile
running build
running build_py
running build_ext
Looking in z for ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
'/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libz.so
Looking in jpeg for
['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
'/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libjpeg.so
Looking in tiff for
['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
'/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libtiff.so
Looking in freetype for
['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
'/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libfreetype.so
Looking in tcl86 for
['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
'/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
Looking in tcl8.6 for
['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
'/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libtcl8.6.so
Looking in tk86 for
['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
'/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
Looking in tk8.6 for
['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
'/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libtk8.6.so
building '_imagingtk' extension
creating build/temp.linux-x86_64-2.7/Tk
arm-poky-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mfpu=neon
-mtune=cortex-a8 --sysroot=/home/michael/yocto/build/tmp/sysroots/pepper
-DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g
-feliminate-unused-debug-types -fPIC
-I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/freetype2
-IlibImaging -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib
-I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include
-I/usr/include/tcl8.6
-I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7 -c
_imagingtk.c -o build/temp.linux-x86_64-2.7/_imagingtk.o
cc1: warning: include location "/usr/include/tcl8.6" is unsafe for
cross-compilation [-Wpoison-system-directories]
arm-poky-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mfpu=neon
-mtune=cortex-a8 --sysroot=/home/michael/yocto/build/tmp/sysroots/pepper
-DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g
-feliminate-unused-debug-types -fPIC
-I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/freetype2
-IlibImaging -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib
-I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include
-I/usr/include/tcl8.6
-I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7 -c
Tk/tkImaging.c -o build/temp.linux-x86_64-2.7/Tk/tkImaging.o
cc1: warning: include location "/usr/include/tcl8.6" is unsafe for
cross-compilation [-Wpoison-system-directories]
In file included from
/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7/Python.h:8:0,
                 from libImaging/ImPlatform.h:10,
                 from libImaging/Imaging.h:14,
                 from Tk/tkImaging.c:53:
/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7/pyconfig.h:1182:0:
warning: "_POSIX_C_SOURCE" redefined
 #define _POSIX_C_SOURCE 200112L
 ^
In file included from
/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/stdio.h:27:0,
                 from /usr/include/tcl8.6/tcl.h:138,
                 from /usr/include/tcl8.6/tk.h:19,
                 from Tk/tkImaging.c:51:
/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/features.h:225:0:
note: this is the location of the previous definition
 # define _POSIX_C_SOURCE 200809L
 ^
arm-poky-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mfpu=neon
-mtune=cortex-a8 --sysroot=/home/michael/yocto/build/tmp/sysroots/pepper
-shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -O2 -pipe -g
-feliminate-unused-debug-types build/temp.linux-x86_64-2.7/_imagingtk.o
build/temp.linux-x86_64-2.7/Tk/tkImaging.o
-L/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib
-L/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib -ltcl8.6 -ltk8.6
-lpython2.7 -o build/lib.linux-x86_64-2.7/_imagingtk.so

So am curious if there is a linking problem with tcl8.6. Or if anyone has
seen this issue, the instructions for what I am trying to do was published
over a year ago so am wondering if something has changed. Thank you for any
help or pointing me in the right direction. Am trying to help my grandson
with his robot. Take care.

Cheers, Michael

--94eb2c092f5605895f05348ead2e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello<div><br></div><div>Hopefully I am in the right place=
. Not having any luck with building yocto with ros or even just trying to b=
itbake python-imaging. Seems the issue always fails with the following -=C2=
=A0</div><div><br></div><div><div>Build Configuration:</div><div>BB_VERSION=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.26.0&quot;</div><div>BUILD_SYS =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;</div><div>NATIVELSBST=
RING =C2=A0 =3D &quot;Ubuntu-14.04&quot;</div><div>TARGET_SYS =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &quot;arm-poky-linux-gnueabi&quot;</div><div>MACHINE =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;pepper&quot;</div><div>DISTRO =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky&quot;</div><div>DISTRO=
_VERSION =C2=A0 =C2=A0=3D &quot;1.8&quot;</div><div>TUNE_FEATURES =C2=A0 =
=C2=A0 =3D &quot;arm armv7a vfp neon callconvention-hard cortexa8&quot;</di=
v><div>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;</div>=
<div>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>meta-y=
octo =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;(nobranch):83aa565d93aacae4849765=
62ef1ae8dbbb6b2bc0&quot;</div><div>meta-gnome =C2=A0 =C2=A0 =C2=A0 =C2=A0</=
div><div>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta-xf=
ce =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta-systemd =C2=A0 =C2=A0 =
=C2=A0</div><div>meta-networking =C2=A0=C2=A0</div><div>meta-multimedia =C2=
=A0=C2=A0</div><div>meta-python =C2=A0 =C2=A0 =C2=A0 =3D &quot;(nobranch):1=
0d3c8f85280a0bf867a8e4f84bcda81c290d28e&quot;</div><div>meta-gumstix =C2=A0=
 =C2=A0 =C2=A0=3D &quot;(nobranch):8ea631d8ef26cb13102dac0910be52674cb7b395=
&quot;</div><div>meta-gumstix-extras =3D &quot;(nobranch):15cfa9fcff75d3d95=
f66cfa190e1b604ff5ea4f6&quot;</div><div>meta-ros =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;(nobranch):d465a23c0a96e651419d46b29ab7c0c3663da314&quo=
t;</div><div>meta-ti =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;(nobranch=
):03cb3ff15f3b8535ca409ce682f44ec1b81da0c3&quot;</div><div>meta-java =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;(nobranch):66c97ae7461f4c1a13917131787bb76d=
c34e6b6f&quot;</div><div><br></div><div>NOTE: Preparing RunQueue</div><div>=
NOTE: Executing SetScene Tasks</div><div>NOTE: Executing RunQueue Tasks</di=
v><div>ERROR: QA Issue: python-imaging: The compile log indicates that host=
 include and/or library paths were used.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Please check the log &#39;/home/michael/yocto/build/tmp/work/cort=
exa8hf-vfp-neon-poky-linux-gnueabi/python-imaging/1.1.7-r5/temp/log.do_comp=
ile&#39; for more information. [compile-host-path]</div><div>ERROR: QA run =
found fatal errors. Please consider fixing them.</div><div>ERROR: Function =
failed: do_package_qa</div><div>ERROR: Logfile of failure stored in: /home/=
michael/yocto/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/python-=
imaging/1.1.7-r5/temp/log.do_package_qa.21754</div><div>ERROR: Task 4911 (/=
home/michael/yocto/poky/meta/recipes-devtools/python/<a href=3D"http://pyth=
on-imaging_1.1.7.bb">python-imaging_1.1.7.bb</a>, do_package_qa) failed wit=
h exit code &#39;1&#39;</div><div>NOTE: Tasks Summary: Attempted 5307 tasks=
 of which 5298 didn&#39;t need to be rerun and 1 failed.</div><div>Waiting =
for 0 running tasks to finish:</div></div><div><br></div><div>And when look=
ing at do_compile -=C2=A0</div><div><br></div><div><div>DEBUG: Executing sh=
ell function do_compile=C2=A0</div><div>running build=C2=A0</div><div>runni=
ng build_py=C2=A0</div><div>running build_ext=C2=A0</div><div>Looking in z =
for [&#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;=
/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div=
>Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libz.so=C2=A0<=
/div><div>Looking in jpeg for [&#39;/home/michael/yocto/build/tmp/sysroots/=
pepper/usr/lib&#39;, &#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr=
/lib&#39;]=C2=A0</div><div>Found /home/michael/yocto/build/tmp/sysroots/pep=
per/usr/lib/libjpeg.so=C2=A0</div><div>Looking in tiff for [&#39;/home/mich=
ael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;/home/michael/yocto/=
build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div>Found /home/michael=
/yocto/build/tmp/sysroots/pepper/usr/lib/libtiff.so=C2=A0</div><div>Looking=
 in freetype for [&#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/li=
b&#39;, &#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=
=A0</div><div>Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/l=
ibfreetype.so=C2=A0</div><div>Looking in tcl86 for [&#39;/home/michael/yoct=
o/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;/home/michael/yocto/build/tm=
p/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div>Looking in tcl8.6 for [&#39=
;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;/home/mic=
hael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div>Found /h=
ome/michael/yocto/build/tmp/sysroots/pepper/usr/lib/<a href=3D"http://libtc=
l8.6.so">libtcl8.6.so</a>=C2=A0</div><div>Looking in tk86 for [&#39;/home/m=
ichael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;/home/michael/yoc=
to/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div>Looking in tk8.6=
 for [&#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &#39=
;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div><di=
v>Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/<a href=3D"ht=
tp://libtk8.6.so">libtk8.6.so</a>=C2=A0</div><div>building &#39;_imagingtk&=
#39; extension=C2=A0</div><div>creating build/temp.linux-x86_64-2.7/Tk=C2=
=A0</div><div>arm-poky-linux-gnueabi-gcc -march=3Darmv7-a -mfloat-abi=3Dhar=
d -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/michael/yocto/build/tmp=
/sysroots/pepper -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -fe=
liminate-unused-debug-types -fPIC -I/home/michael/yocto/build/tmp/sysroots/=
pepper/usr/include/freetype2 -IlibImaging -I/home/michael/yocto/build/tmp/s=
ysroots/pepper/usr/lib -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/=
include -I/usr/include/tcl8.6 -I/home/michael/yocto/build/tmp/sysroots/pepp=
er/usr/include/python2.7 -c _imagingtk.c -o build/temp.linux-x86_64-2.7/_im=
agingtk.o=C2=A0</div><div>cc1: warning: include location &quot;/usr/include=
/tcl8.6&quot; is unsafe for cross-compilation [-Wpoison-system-directories]=
=C2=A0</div><div>arm-poky-linux-gnueabi-gcc -march=3Darmv7-a -mfloat-abi=3D=
hard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/michael/yocto/build/=
tmp/sysroots/pepper -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g =
-feliminate-unused-debug-types -fPIC -I/home/michael/yocto/build/tmp/sysroo=
ts/pepper/usr/include/freetype2 -IlibImaging -I/home/michael/yocto/build/tm=
p/sysroots/pepper/usr/lib -I/home/michael/yocto/build/tmp/sysroots/pepper/u=
sr/include -I/usr/include/tcl8.6 -I/home/michael/yocto/build/tmp/sysroots/p=
epper/usr/include/python2.7 -c Tk/tkImaging.c -o build/temp.linux-x86_64-2.=
7/Tk/tkImaging.o=C2=A0</div><div>cc1: warning: include location &quot;/usr/=
include/tcl8.6&quot; is unsafe for cross-compilation [-Wpoison-system-direc=
tories]=C2=A0</div><div>In file included from /home/michael/yocto/build/tmp=
/sysroots/pepper/usr/include/python2.7/Python.h:8:0,=C2=A0</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from libImaging/ImP=
latform.h:10,=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from libImaging/Imaging.h:14,=C2=A0</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from Tk/tkImaging.c:53:=
=C2=A0</div><div>/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/=
python2.7/pyconfig.h:1182:0: warning: &quot;_POSIX_C_SOURCE&quot; redefined=
=C2=A0</div><div>=C2=A0#define _POSIX_C_SOURCE 200112L=C2=A0</div><div>=C2=
=A0^=C2=A0</div><div>In file included from /home/michael/yocto/build/tmp/sy=
sroots/pepper/usr/include/stdio.h:27:0,=C2=A0</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /usr/include/tcl8.6/tcl.h=
:138,=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from /usr/include/tcl8.6/tk.h:19,=C2=A0</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from Tk/tkImaging.c:51:=C2=
=A0</div><div>/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/fea=
tures.h:225:0: note: this is the location of the previous definition=C2=A0<=
/div><div>=C2=A0# define _POSIX_C_SOURCE 200809L=C2=A0</div><div>=C2=A0^=C2=
=A0</div><div>arm-poky-linux-gnueabi-gcc -march=3Darmv7-a -mfloat-abi=3Dhar=
d -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home/michael/yocto/build/tmp=
/sysroots/pepper -shared -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -O2=
 -pipe -g -feliminate-unused-debug-types build/temp.linux-x86_64-2.7/_imagi=
ngtk.o build/temp.linux-x86_64-2.7/Tk/tkImaging.o -L/home/michael/yocto/bui=
ld/tmp/sysroots/pepper/usr/lib -L/home/michael/yocto/build/tmp/sysroots/pep=
per/usr/lib -ltcl8.6 -ltk8.6 -lpython2.7 -o build/lib.linux-x86_64-2.7/_ima=
gingtk.so=C2=A0</div></div><div><br></div><div>So am curious if there is a =
linking problem with tcl8.6. Or if anyone has seen this issue, the instruct=
ions for what I am trying to do was published over a year ago so am wonderi=
ng if something has changed. Thank you for any help or pointing me in the r=
ight direction. Am trying to help my grandson with his robot. Take care.</d=
iv><div><br></div><div>Cheers, Michael</div></div>

--94eb2c092f5605895f05348ead2e--
