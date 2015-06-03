Return-Path: <kulakarni.krishnakumar@gmail.com>
Received: from mail-vn0-f42.google.com (mail-vn0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7615B7564A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 11:37:47 +0000 (UTC)
Received: by vnbg1 with SMTP id g1so700424vnb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=4tDMx4bswVT6a4P/KGgqQMFlyLe5XDzv9LFIJ26qHcE=;
	b=K6BWTHub9t7PhxCZwBb9LU3j84EVb7l/jQFplUYQL24NjYN+K1jeumBBlEb/fnK/6A
	nzwMaFfdOA0TLT5pOqR4gxakUfHdsGP7qmUOHyBT9UVTyrTf6dfeIzNf+3hZrjdtQip5
	Ych9WwG7XsuglvQscNMp896yytMTvOOg6rRNcP0NE/jKL+X30bEPyWsp/oAqqnRHCp84
	6Ynfq3GKa5RObzt8QwlqqRMM6NduGuzkiH7rW4JHZOKSeTahP2x0gdJJqrGL+k1zg8vL
	KfdfhV5kXuAsWMqmCkUtTiI59y/ukT2jV6YytsL4AHDzHrtOh493qPyrejmnx3bWyNvL
	5jpw==
MIME-Version: 1.0
X-Received: by 10.52.30.201 with SMTP id u9mr45859450vdh.95.1433331468797;
	Wed, 03 Jun 2015 04:37:48 -0700 (PDT)
Received: by 10.52.185.1 with HTTP; Wed, 3 Jun 2015 04:37:48 -0700 (PDT)
Date: Wed, 3 Jun 2015 17:07:48 +0530
Message-ID: <CADQ2m_xJEa1uw8PoVdCn6A8Xt_MPO3R9nhLMn-EHopc0P0+5mw@mail.gmail.com>
From: Krishnakumar Kulkarni <kulakarni.krishnakumar@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: EGL version error while building the weston.
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
X-List-Received-Date: Wed, 03 Jun 2015 11:37:50 -0000
Content-Type: multipart/alternative; boundary=bcaec51ba3ab0b178d05179b7de7

--bcaec51ba3ab0b178d05179b7de7
Content-Type: text/plain; charset=UTF-8

Hi All,

While building weston for toradex board I got the following error.
Kindly help me to solve this issue.

When I gave bitbake core-image-weston

I got the following screenshot.


NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at
/home/test/toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gnueabi/weston/1.4.0-r0/temp/log.do_configure.9123)
ERROR: Logfile of failure stored in:
/home/test/toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gnueabi/weston/1.4.0-r0/temp/log.do_configure.9123
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
|
        .
        .
        .
        .
        .
        .
        .

| checking whether CLOCK_MONOTONIC is declared... yes
| checking for execinfo.h... (cached) yes
| checking for mkostemp... yes
| checking for strchrnul... (cached) yes
| checking for initgroups... (cached) yes
| checking for posix_fallocate... yes
|






*checking for EGL... no| configure: error: Package requirements (egl >=
7.10 glesv2) were not met:| | Requested 'egl >= 7.10' but version of egl is
1| | Consider adjusting the PKG_CONFIG_PATH environment variable if you|
installed software in a non-standard prefix.| *
| Alternatively, you may set the environment variables EGL_CFLAGS
| and EGL_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| Configure failed. The contents of all config.log files follows to aid
debugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/home/test/toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gnueabi/weston/1.4.0-r0/temp/log.do_configure.9123)
ERROR: Task 234
(/home/test/toradex/oe-core/build/../stuff/openembedded-core/meta/recipes-graphics/wayland/
weston_1.4.0.bb, do_configure) failed with exit code '1'
ERROR: Function failed: do_configure (log file is located at
/home/test/toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gnueabi/cogl-1.0/1.16.2-r0/temp/log.do_configure.9122)
ERROR: Logfile of failure stored in:
/home/test/toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gnueabi/cogl-1.0/1.16.2-r0/temp/log.do_configure.9122
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.14
| Copyright (C) 2013 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <
http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|

        .
        .
        .
        .
        .
| checking how to hardcode library paths into programs... immediate
| configure: creating ./config.lt
| config.lt: creating arm-oe-linux-gnueabi-libtool
| checking for cos in -lm... yes
| checking if building for some Win32 platform... no
| checking OpenGL/gl.h usability... no
| checking OpenGL/gl.h presence... no
| checking for OpenGL/gl.h... no
| checking for arm-oe-linux-gnueabi-pkg-config... no
| checking for pkg-config...
/home/test/toradex/oe-core/build/out-eglibc/sysroots/i686-linux/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for arm-oe-linux-gnueabi-pkg-config...
/home/test/toradex/oe-core/build/out-eglibc/sysroots/i686-linux/usr/bin/pkg-config
| checking pkg-config is at least version 0.16... yes
| checking for GLIB - version >= 2.32.0... cross compiling; assumed OK...
| yes (version 2.38.2)







*| checking for WAYLAND_CLIENT... no| configure: error: Package
requirements (wayland-egl >= 1.0.0 wayland-client >= 1.0.0) were not met:|
| No package 'wayland-egl' found| | Consider adjusting the PKG_CONFIG_PATH
environment variable if you| installed software in a non-standard prefix.*|
| Alternatively, you may set the environment variables WAYLAND_CLIENT_CFLAGS
| and WAYLAND_CLIENT_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| Configure failed. The contents of all config.log files follows to aid
debugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/home/test/toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gnueabi/cogl-1.0/1.16.2-r0/temp/log.do_configure.9122)
ERROR: Task 1201
(/home/test/toradex/oe-core/build/../stuff/openembedded-core/meta/recipes-graphics/cogl/
cogl-1.0_1.16.2.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3468 tasks of which 3466 didn't need to be
rerun and 2 failed.
Waiting for 0 running tasks to finish:

Summary: 2 tasks failed:

/home/test/toradex/oe-core/build/../stuff/openembedded-core/meta/recipes-graphics/wayland/
weston_1.4.0.bb, do_configure

/home/test/toradex/oe-core/build/../stuff/openembedded-core/meta/recipes-graphics/cogl/
cogl-1.0_1.16.2.bb, do_configure
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


Thanks,
Krishnakumar kulakarni

--bcaec51ba3ab0b178d05179b7de7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi All,<br><br></div>While buildi=
ng weston for toradex board I got the following error.<br></div>Kindly help=
 me to solve this issue.<br><br></div>When I gave bitbake core-image-weston=
<br><br></div>I got the following screenshot.<br><br><br>NOTE: Preparing ru=
nqueue<br>NOTE: Executing SetScene Tasks<br>NOTE: Executing RunQueue Tasks<=
br>ERROR: Function failed: do_configure (log file is located at /home/test/=
toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gnueabi/weston/=
1.4.0-r0/temp/log.do_configure.9123)<br>ERROR: Logfile of failure stored in=
: /home/test/toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gn=
ueabi/weston/1.4.0-r0/temp/log.do_configure.9123<br>Log data follows:<br>| =
DEBUG: Executing python function sysroot_cleansstate<br>| DEBUG: Python fun=
ction sysroot_cleansstate finished<br>| DEBUG: SITE files [&#39;endian-litt=
le&#39;, &#39;bit-32&#39;, &#39;arm-common&#39;, &#39;common-linux&#39;, &#=
39;common-glibc&#39;, &#39;arm-linux&#39;, &#39;arm-linux-gnueabi&#39;, &#3=
9;common&#39;]<br>| DEBUG: Executing shell function autotools_preconfigure<=
br>| <br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .<br>=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 .<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .<br>=C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .<b=
r>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 .<br><br>| checking whether CLOCK_MONOTONIC is declared... yes<br=
>| checking for execinfo.h... (cached) yes<br>| checking for mkostemp... ye=
s<br>| checking for strchrnul... (cached) yes<br>| checking for initgroups.=
.. (cached) yes<br>| checking for posix_fallocate... yes<br>| <b>checking f=
or EGL... no<br>| configure: error: Package requirements (egl &gt;=3D 7.10 =
glesv2) were not met:<br>| <br>| Requested &#39;egl &gt;=3D 7.10&#39; but v=
ersion of egl is 1<br>| <br>| Consider adjusting the PKG_CONFIG_PATH enviro=
nment variable if you<br>| installed software in a non-standard prefix.<br>=
| </b><br>| Alternatively, you may set the environment variables EGL_CFLAGS=
<br>| and EGL_LIBS to avoid the need to call pkg-config.<br>| See the pkg-c=
onfig man page for more details.<br>| Configure failed. The contents of all=
 config.log files follows to aid debugging<br>| ERROR: oe_runconf failed<br=
>| WARNING: exit code 1 from a shell command.<br>| ERROR: Function failed: =
do_configure (log file is located at /home/test/toradex/oe-core/build/out-e=
glibc/work/armv7ahf-vfp-oe-linux-gnueabi/weston/1.4.0-r0/temp/log.do_config=
ure.9123)<br>ERROR: Task 234 (/home/test/toradex/oe-core/build/../stuff/ope=
nembedded-core/meta/recipes-graphics/wayland/<a href=3D"http://weston_1.4.0=
.bb">weston_1.4.0.bb</a>, do_configure) failed with exit code &#39;1&#39;<b=
r>ERROR: Function failed: do_configure (log file is located at /home/test/t=
oradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-gnueabi/cogl-1.0=
/1.16.2-r0/temp/log.do_configure.9122)<br>ERROR: Logfile of failure stored =
in: /home/test/toradex/oe-core/build/out-eglibc/work/armv7ahf-vfp-oe-linux-=
gnueabi/cogl-1.0/1.16.2-r0/temp/log.do_configure.9122<br>Log data follows:<=
br>| DEBUG: Executing python function sysroot_cleansstate<br>| DEBUG: Pytho=
n function sysroot_cleansstate finished<br>| DEBUG: SITE files [&#39;endian=
-little&#39;, &#39;bit-32&#39;, &#39;arm-common&#39;, &#39;common-linux&#39=
;, &#39;common-glibc&#39;, &#39;arm-linux&#39;, &#39;arm-linux-gnueabi&#39;=
, &#39;common&#39;]<br>| DEBUG: Executing shell function autotools_preconfi=
gure<br>| DEBUG: Shell function autotools_preconfigure finished<br>| DEBUG:=
 Executing python function autotools_copy_aclocals<br>| DEBUG: Python funct=
ion autotools_copy_aclocals finished<br>| DEBUG: Executing shell function d=
o_configure<br>| automake (GNU automake) 1.14<br>| Copyright (C) 2013 Free =
Software Foundation, Inc.<br>| License GPLv2+: GNU GPL version 2 or later &=
lt;<a href=3D"http://gnu.org/licenses/gpl-2.0.html">http://gnu.org/licenses=
/gpl-2.0.html</a>&gt;<br>| This is free software: you are free to change an=
d redistribute it.<br>| There is NO WARRANTY, to the extent permitted by la=
w.<br>|<br><br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .<br>=C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 .<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .<br>=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 .<br>| checking how to hardcode library paths into programs... immediat=
e<br>| configure: creating ./<a href=3D"http://config.lt">config.lt</a><br>=
| <a href=3D"http://config.lt">config.lt</a>: creating arm-oe-linux-gnueabi=
-libtool<br>| checking for cos in -lm... yes<br>| checking if building for =
some Win32 platform... no<br>| checking OpenGL/gl.h usability... no<br>| ch=
ecking OpenGL/gl.h presence... no<br>| checking for OpenGL/gl.h... no<br>| =
checking for arm-oe-linux-gnueabi-pkg-config... no<br>| checking for pkg-co=
nfig... /home/test/toradex/oe-core/build/out-eglibc/sysroots/i686-linux/usr=
/bin/pkg-config<br>| checking pkg-config is at least version 0.9.0... yes<b=
r>| checking for arm-oe-linux-gnueabi-pkg-config... /home/test/toradex/oe-c=
ore/build/out-eglibc/sysroots/i686-linux/usr/bin/pkg-config<br>| checking p=
kg-config is at least version 0.16... yes<br>| checking for GLIB - version =
&gt;=3D 2.32.0... cross compiling; assumed OK...<br>| yes (version 2.38.2)<=
br><b>| checking for WAYLAND_CLIENT... no<br>| configure: error: Package re=
quirements (wayland-egl &gt;=3D 1.0.0 wayland-client &gt;=3D 1.0.0) were no=
t met:<br>| <br>| No package &#39;wayland-egl&#39; found<br>| <br>| Conside=
r adjusting the PKG_CONFIG_PATH environment variable if you<br>| installed =
software in a non-standard prefix.<br></b>| <br>| Alternatively, you may se=
t the environment variables WAYLAND_CLIENT_CFLAGS<br>| and WAYLAND_CLIENT_L=
IBS to avoid the need to call pkg-config.<br>| See the pkg-config man page =
for more details.<br>| Configure failed. The contents of all config.log fil=
es follows to aid debugging<br>| ERROR: oe_runconf failed<br>| WARNING: exi=
t code 1 from a shell command.<br>| ERROR: Function failed: do_configure (l=
og file is located at /home/test/toradex/oe-core/build/out-eglibc/work/armv=
7ahf-vfp-oe-linux-gnueabi/cogl-1.0/1.16.2-r0/temp/log.do_configure.9122)<br=
>ERROR: Task 1201 (/home/test/toradex/oe-core/build/../stuff/openembedded-c=
ore/meta/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.16.2.bb">cogl-1=
.0_1.16.2.bb</a>, do_configure) failed with exit code &#39;1&#39;<br>NOTE: =
Tasks Summary: Attempted 3468 tasks of which 3466 didn&#39;t need to be rer=
un and 2 failed.<br>Waiting for 0 running tasks to finish:<br><br>Summary: =
2 tasks failed:<br>=C2=A0 /home/test/toradex/oe-core/build/../stuff/openemb=
edded-core/meta/recipes-graphics/wayland/<a href=3D"http://weston_1.4.0.bb"=
>weston_1.4.0.bb</a>, do_configure<br>=C2=A0 /home/test/toradex/oe-core/bui=
ld/../stuff/openembedded-core/meta/recipes-graphics/cogl/<a href=3D"http://=
cogl-1.0_1.16.2.bb">cogl-1.0_1.16.2.bb</a>, do_configure<br>Summary: There =
was 1 WARNING message shown.<br>Summary: There were 2 ERROR messages shown,=
 returning a non-zero exit code.<br><br><br></div><div>Thanks,</div><div><d=
iv><div><div><div><div><div><div class=3D"gmail_signature"><div dir=3D"ltr"=
><font face=3D"comic sans ms,sans-serif">Krishnakumar kulakarni<br><br></fo=
nt></div></div></div>
</div></div></div></div></div></div></div>

--bcaec51ba3ab0b178d05179b7de7--
