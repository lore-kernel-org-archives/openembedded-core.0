Return-Path: <marmaduke55@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0F47E771B6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 23:04:56 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id c66so24914120vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Ai+Lwl2Up+MtHhnFrPawSWMV5taoHBSXW7IwP66pYCo=;
	b=HnRvkOwFu/4aeHOkCYWKi2N4HNveXqK2oVuq5/eFQdSvVwQJ99fXHSk6xH61l0m9UQ
	6cxOLQyEZ90GbRA9ncyLNgT2R1wbHPzWGh6uz9KuBQBvfdJU3UpZACHkeuVFBVkbzi4p
	fUvE1/4OoYcdHz2mls4b7bk/DOSYt1ZQghu8pfgINSoM2NOLA88vXmraEBA/qYzmfv7R
	7cD51Z1FBwTSeYZiH9EuM6vXTxPoAZxGW1GjlvIHYrrn0uIqyW+iGa38j6nTf/gAKZI1
	yugTX06rQVdJhhm15ZfXlyCl5Eer2tkfmUPW5lmZRq/F7haDPTLIkRBQYroW47/qiUUz
	Eyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Ai+Lwl2Up+MtHhnFrPawSWMV5taoHBSXW7IwP66pYCo=;
	b=FuT/60Ne98FCSpNtkaMNJUI5+QKkjVxQPv+SKmiKhyGEbGaTk4D9NwJi952Ywcxj1i
	kc7sSiMJVWxFkPYmpGX3C9Sc3NVtMa5b07oruhI2loTlYQnH8rOiZWjeq1gav/TvHTkL
	yr1Rj2NiaiV+oz55wlhZ+l2v6XnbMrNxPtTu7JR2l9vhT5JVmpL0Gu5lg7vwVeMprWko
	5T8Xg/hNrf7fPpPWdOaDFgLDHZ1wpt6GYvT8i8Ar79Pr859SbyjMBVDkOd+yagvaKW7I
	bZs2Kt/FEALmFpOcl/nhjPCk9TlwPxfljlGwP4BaTf29kThDqS2Sc/rTQC4N5ru9rHrG
	F1mA==
X-Gm-Message-State: ALyK8tI9xFNlCkvkOY+cFqdni9g37Nmv2oLxvA7r/fMrQ/QeanBYFHgAuArb7dpm7J27WxaPBb6PLQnO9w/kvg==
X-Received: by 10.31.60.142 with SMTP id j136mr5422059vka.16.1465167897156;
	Sun, 05 Jun 2016 16:04:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.35.175 with HTTP; Sun, 5 Jun 2016 16:04:56 -0700 (PDT)
In-Reply-To: <CALNhhxT8zu-zXEgMDhtFu98DktWcD9Hy1Ga2J4PLnAWp3NWnzA@mail.gmail.com>
References: <CALNhhxT8zu-zXEgMDhtFu98DktWcD9Hy1Ga2J4PLnAWp3NWnzA@mail.gmail.com>
From: Michael Dangler <marmaduke55@gmail.com>
Date: Sun, 5 Jun 2016 19:04:56 -0400
Message-ID: <CALNhhxTwmxcmhg24zW3CayrurHxaWdka54K4OH_ahLcEBkuOsA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Issue with python-imaging
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
X-List-Received-Date: Sun, 05 Jun 2016 23:04:59 -0000
Content-Type: multipart/alternative; boundary=001a114393560be22605348ffc14

--001a114393560be22605348ffc14
Content-Type: text/plain; charset=UTF-8

Hello again,

Seems the python-imaging is no longer in use -

python-imaging: remove unused recipe
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

So removing all reference was easy but causes issues with ros-comm file
rosbag_1.11.16.bb which needs to have python-imaging removed from depends.
Not sure what issues that will have down the road. Guess I should have
checked the index first, apologies.

Cheers, Michael

On Sun, Jun 5, 2016 at 5:31 PM, Michael Dangler <marmaduke55@gmail.com>
wrote:

> Hello
>
> Hopefully I am in the right place. Not having any luck with building yocto
> with ros or even just trying to bitbake python-imaging. Seems the issue
> always fails with the following -
>
> Build Configuration:
> BB_VERSION        = "1.26.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "pepper"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.8"
> TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto        = "(nobranch):83aa565d93aacae484976562ef1ae8dbbb6b2bc0"
> meta-gnome
> meta-oe
> meta-xfce
> meta-systemd
> meta-networking
> meta-multimedia
> meta-python       = "(nobranch):10d3c8f85280a0bf867a8e4f84bcda81c290d28e"
> meta-gumstix      = "(nobranch):8ea631d8ef26cb13102dac0910be52674cb7b395"
> meta-gumstix-extras = "(nobranch):15cfa9fcff75d3d95f66cfa190e1b604ff5ea4f6"
> meta-ros          = "(nobranch):d465a23c0a96e651419d46b29ab7c0c3663da314"
> meta-ti           = "(nobranch):03cb3ff15f3b8535ca409ce682f44ec1b81da0c3"
> meta-java         = "(nobranch):66c97ae7461f4c1a13917131787bb76dc34e6b6f"
>
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: QA Issue: python-imaging: The compile log indicates that host
> include and/or library paths were used.
>          Please check the log
> '/home/michael/yocto/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/python-imaging/1.1.7-r5/temp/log.do_compile'
> for more information. [compile-host-path]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in:
> /home/michael/yocto/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/python-imaging/1.1.7-r5/temp/log.do_package_qa.21754
> ERROR: Task 4911 (/home/michael/yocto/poky/meta/recipes-devtools/python/
> python-imaging_1.1.7.bb, do_package_qa) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 5307 tasks of which 5298 didn't need to be
> rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>
> And when looking at do_compile -
>
> DEBUG: Executing shell function do_compile
> running build
> running build_py
> running build_ext
> Looking in z for ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
> '/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
> Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libz.so
> Looking in jpeg for
> ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
> '/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
> Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libjpeg.so
> Looking in tiff for
> ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
> '/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
> Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libtiff.so
> Looking in freetype for
> ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
> '/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
> Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libfreetype.so
> Looking in tcl86 for
> ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
> '/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
> Looking in tcl8.6 for
> ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
> '/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
> Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libtcl8.6.so
> Looking in tk86 for
> ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
> '/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
> Looking in tk8.6 for
> ['/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib',
> '/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib']
> Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libtk8.6.so
> building '_imagingtk' extension
> creating build/temp.linux-x86_64-2.7/Tk
> arm-poky-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mfpu=neon
> -mtune=cortex-a8 --sysroot=/home/michael/yocto/build/tmp/sysroots/pepper
> -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g
> -feliminate-unused-debug-types -fPIC
> -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/freetype2
> -IlibImaging -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib
> -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include
> -I/usr/include/tcl8.6
> -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7 -c
> _imagingtk.c -o build/temp.linux-x86_64-2.7/_imagingtk.o
> cc1: warning: include location "/usr/include/tcl8.6" is unsafe for
> cross-compilation [-Wpoison-system-directories]
> arm-poky-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mfpu=neon
> -mtune=cortex-a8 --sysroot=/home/michael/yocto/build/tmp/sysroots/pepper
> -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g
> -feliminate-unused-debug-types -fPIC
> -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/freetype2
> -IlibImaging -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib
> -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include
> -I/usr/include/tcl8.6
> -I/home/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7 -c
> Tk/tkImaging.c -o build/temp.linux-x86_64-2.7/Tk/tkImaging.o
> cc1: warning: include location "/usr/include/tcl8.6" is unsafe for
> cross-compilation [-Wpoison-system-directories]
> In file included from
> /home/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7/Python.h:8:0,
>                  from libImaging/ImPlatform.h:10,
>                  from libImaging/Imaging.h:14,
>                  from Tk/tkImaging.c:53:
> /home/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7/pyconfig.h:1182:0:
> warning: "_POSIX_C_SOURCE" redefined
>  #define _POSIX_C_SOURCE 200112L
>  ^
> In file included from
> /home/michael/yocto/build/tmp/sysroots/pepper/usr/include/stdio.h:27:0,
>                  from /usr/include/tcl8.6/tcl.h:138,
>                  from /usr/include/tcl8.6/tk.h:19,
>                  from Tk/tkImaging.c:51:
> /home/michael/yocto/build/tmp/sysroots/pepper/usr/include/features.h:225:0:
> note: this is the location of the previous definition
>  # define _POSIX_C_SOURCE 200809L
>  ^
> arm-poky-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=hard -mfpu=neon
> -mtune=cortex-a8 --sysroot=/home/michael/yocto/build/tmp/sysroots/pepper
> -shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -O2 -pipe -g
> -feliminate-unused-debug-types build/temp.linux-x86_64-2.7/_imagingtk.o
> build/temp.linux-x86_64-2.7/Tk/tkImaging.o
> -L/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib
> -L/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib -ltcl8.6 -ltk8.6
> -lpython2.7 -o build/lib.linux-x86_64-2.7/_imagingtk.so
>
> So am curious if there is a linking problem with tcl8.6. Or if anyone has
> seen this issue, the instructions for what I am trying to do was published
> over a year ago so am wondering if something has changed. Thank you for any
> help or pointing me in the right direction. Am trying to help my grandson
> with his robot. Take care.
>
> Cheers, Michael
>

--001a114393560be22605348ffc14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello again,<div><br></div><div>Seems the python-imaging i=
s no longer in use -=C2=A0</div><div><br></div><div><div>python-imaging: re=
move unused recipe</div><div>Signed-off-by: Alexander Kanavin &lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.intel=
.com</a>&gt;</div><div>Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt;</div></div><div><br></div><div>So removing all reference was easy but c=
auses issues with ros-comm file <a href=3D"http://rosbag_1.11.16.bb">rosbag=
_1.11.16.bb</a> which needs to have python-imaging removed from depends. No=
t sure what issues that will have down the road. Guess I should have checke=
d the index first, apologies.</div><div><br></div><div>Cheers, Michael</div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Ju=
n 5, 2016 at 5:31 PM, Michael Dangler <span dir=3D"ltr">&lt;<a href=3D"mail=
to:marmaduke55@gmail.com" target=3D"_blank">marmaduke55@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello<div><=
br></div><div>Hopefully I am in the right place. Not having any luck with b=
uilding yocto with ros or even just trying to bitbake python-imaging. Seems=
 the issue always fails with the following -=C2=A0</div><div><br></div><div=
><div>Build Configuration:</div><div>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;1.26.0&quot;</div><div>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;x86_64-linux&quot;</div><div>NATIVELSBSTRING =C2=A0 =3D &quot;Ubuntu-=
14.04&quot;</div><div>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-p=
oky-linux-gnueabi&quot;</div><div>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;pepper&quot;</div><div>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;poky&quot;</div><div>DISTRO_VERSION =C2=A0 =C2=A0=3D &q=
uot;1.8&quot;</div><div>TUNE_FEATURES =C2=A0 =C2=A0 =3D &quot;arm armv7a vf=
p neon callconvention-hard cortexa8&quot;</div><div>TARGET_FPU =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot;</div><div>meta =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>meta-yocto =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;(nobranch):83aa565d93aacae484976562ef1ae8dbbb6b2bc0&quot;</=
div><div>meta-gnome =C2=A0 =C2=A0 =C2=A0 =C2=A0</div><div>meta-oe =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta-xfce =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=C2=A0</div><div>meta-systemd =C2=A0 =C2=A0 =C2=A0</div><div>meta-net=
working =C2=A0=C2=A0</div><div>meta-multimedia =C2=A0=C2=A0</div><div>meta-=
python =C2=A0 =C2=A0 =C2=A0 =3D &quot;(nobranch):10d3c8f85280a0bf867a8e4f84=
bcda81c290d28e&quot;</div><div>meta-gumstix =C2=A0 =C2=A0 =C2=A0=3D &quot;(=
nobranch):8ea631d8ef26cb13102dac0910be52674cb7b395&quot;</div><div>meta-gum=
stix-extras =3D &quot;(nobranch):15cfa9fcff75d3d95f66cfa190e1b604ff5ea4f6&q=
uot;</div><div>meta-ros =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;(nobran=
ch):d465a23c0a96e651419d46b29ab7c0c3663da314&quot;</div><div>meta-ti =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;(nobranch):03cb3ff15f3b8535ca409ce68=
2f44ec1b81da0c3&quot;</div><div>meta-java =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;(nobranch):66c97ae7461f4c1a13917131787bb76dc34e6b6f&quot;</div><div><b=
r></div><div>NOTE: Preparing RunQueue</div><div>NOTE: Executing SetScene Ta=
sks</div><div>NOTE: Executing RunQueue Tasks</div><div>ERROR: QA Issue: pyt=
hon-imaging: The compile log indicates that host include and/or library pat=
hs were used.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Please check the =
log &#39;/home/michael/yocto/build/tmp/work/cortexa8hf-vfp-neon-poky-linux-=
gnueabi/python-imaging/1.1.7-r5/temp/log.do_compile&#39; for more informati=
on. [compile-host-path]</div><div>ERROR: QA run found fatal errors. Please =
consider fixing them.</div><div>ERROR: Function failed: do_package_qa</div>=
<div>ERROR: Logfile of failure stored in: /home/michael/yocto/build/tmp/wor=
k/cortexa8hf-vfp-neon-poky-linux-gnueabi/python-imaging/1.1.7-r5/temp/log.d=
o_package_qa.21754</div><div>ERROR: Task 4911 (/home/michael/yocto/poky/met=
a/recipes-devtools/python/<a href=3D"http://python-imaging_1.1.7.bb" target=
=3D"_blank">python-imaging_1.1.7.bb</a>, do_package_qa) failed with exit co=
de &#39;1&#39;</div><div>NOTE: Tasks Summary: Attempted 5307 tasks of which=
 5298 didn&#39;t need to be rerun and 1 failed.</div><div>Waiting for 0 run=
ning tasks to finish:</div></div><div><br></div><div>And when looking at do=
_compile -=C2=A0</div><div><br></div><div><div>DEBUG: Executing shell funct=
ion do_compile=C2=A0</div><div>running build=C2=A0</div><div>running build_=
py=C2=A0</div><div>running build_ext=C2=A0</div><div>Looking in z for [&#39=
;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;/home/mic=
hael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div>Found /h=
ome/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libz.so=C2=A0</div><div=
>Looking in jpeg for [&#39;/home/michael/yocto/build/tmp/sysroots/pepper/us=
r/lib&#39;, &#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;=
]=C2=A0</div><div>Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/l=
ib/libjpeg.so=C2=A0</div><div>Looking in tiff for [&#39;/home/michael/yocto=
/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;/home/michael/yocto/build/tmp=
/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div>Found /home/michael/yocto/bu=
ild/tmp/sysroots/pepper/usr/lib/libtiff.so=C2=A0</div><div>Looking in freet=
ype for [&#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &=
#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div>=
<div>Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/libfreetyp=
e.so=C2=A0</div><div>Looking in tcl86 for [&#39;/home/michael/yocto/build/t=
mp/sysroots/pepper/usr/lib&#39;, &#39;/home/michael/yocto/build/tmp/sysroot=
s/pepper/usr/lib&#39;]=C2=A0</div><div>Looking in tcl8.6 for [&#39;/home/mi=
chael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;/home/michael/yoct=
o/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div>Found /home/micha=
el/yocto/build/tmp/sysroots/pepper/usr/lib/<a href=3D"http://libtcl8.6.so" =
target=3D"_blank">libtcl8.6.so</a>=C2=A0</div><div>Looking in tk86 for [&#3=
9;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;, &#39;/home/mi=
chael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0</div><div>Looking=
 in tk8.6 for [&#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#=
39;, &#39;/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib&#39;]=C2=A0=
</div><div>Found /home/michael/yocto/build/tmp/sysroots/pepper/usr/lib/<a h=
ref=3D"http://libtk8.6.so" target=3D"_blank">libtk8.6.so</a>=C2=A0</div><di=
v>building &#39;_imagingtk&#39; extension=C2=A0</div><div>creating build/te=
mp.linux-x86_64-2.7/Tk=C2=A0</div><div>arm-poky-linux-gnueabi-gcc -march=3D=
armv7-a -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/hom=
e/michael/yocto/build/tmp/sysroots/pepper -DNDEBUG -g -O3 -Wall -Wstrict-pr=
ototypes -O2 -pipe -g -feliminate-unused-debug-types -fPIC -I/home/michael/=
yocto/build/tmp/sysroots/pepper/usr/include/freetype2 -IlibImaging -I/home/=
michael/yocto/build/tmp/sysroots/pepper/usr/lib -I/home/michael/yocto/build=
/tmp/sysroots/pepper/usr/include -I/usr/include/tcl8.6 -I/home/michael/yoct=
o/build/tmp/sysroots/pepper/usr/include/python2.7 -c _imagingtk.c -o build/=
temp.linux-x86_64-2.7/_imagingtk.o=C2=A0</div><div>cc1: warning: include lo=
cation &quot;/usr/include/tcl8.6&quot; is unsafe for cross-compilation [-Wp=
oison-system-directories]=C2=A0</div><div>arm-poky-linux-gnueabi-gcc -march=
=3Darmv7-a -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/=
home/michael/yocto/build/tmp/sysroots/pepper -DNDEBUG -g -O3 -Wall -Wstrict=
-prototypes -O2 -pipe -g -feliminate-unused-debug-types -fPIC -I/home/micha=
el/yocto/build/tmp/sysroots/pepper/usr/include/freetype2 -IlibImaging -I/ho=
me/michael/yocto/build/tmp/sysroots/pepper/usr/lib -I/home/michael/yocto/bu=
ild/tmp/sysroots/pepper/usr/include -I/usr/include/tcl8.6 -I/home/michael/y=
octo/build/tmp/sysroots/pepper/usr/include/python2.7 -c Tk/tkImaging.c -o b=
uild/temp.linux-x86_64-2.7/Tk/tkImaging.o=C2=A0</div><div>cc1: warning: inc=
lude location &quot;/usr/include/tcl8.6&quot; is unsafe for cross-compilati=
on [-Wpoison-system-directories]=C2=A0</div><div>In file included from /hom=
e/michael/yocto/build/tmp/sysroots/pepper/usr/include/python2.7/Python.h:8:=
0,=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from libImaging/ImPlatform.h:10,=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from libImaging/Imaging.h:14,=C2=
=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from Tk/tkImaging.c:53:=C2=A0</div><div>/home/michael/yocto/build/tmp/sy=
sroots/pepper/usr/include/python2.7/pyconfig.h:1182:0: warning: &quot;_POSI=
X_C_SOURCE&quot; redefined=C2=A0</div><div>=C2=A0#define _POSIX_C_SOURCE 20=
0112L=C2=A0</div><div>=C2=A0^=C2=A0</div><div>In file included from /home/m=
ichael/yocto/build/tmp/sysroots/pepper/usr/include/stdio.h:27:0,=C2=A0</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /u=
sr/include/tcl8.6/tcl.h:138,=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /usr/include/tcl8.6/tk.h:19,=C2=A0</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 Tk/tkImaging.c:51:=C2=A0</div><div>/home/michael/yocto/build/tmp/sysroots/=
pepper/usr/include/features.h:225:0: note: this is the location of the prev=
ious definition=C2=A0</div><div>=C2=A0# define _POSIX_C_SOURCE 200809L=C2=
=A0</div><div>=C2=A0^=C2=A0</div><div>arm-poky-linux-gnueabi-gcc -march=3Da=
rmv7-a -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/home=
/michael/yocto/build/tmp/sysroots/pepper -shared -Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed -O2 -pipe -g -feliminate-unused-debug-types build/te=
mp.linux-x86_64-2.7/_imagingtk.o build/temp.linux-x86_64-2.7/Tk/tkImaging.o=
 -L/home/michael/yocto/build/tmp/sysroots/pepper/usr/lib -L/home/michael/yo=
cto/build/tmp/sysroots/pepper/usr/lib -ltcl8.6 -ltk8.6 -lpython2.7 -o build=
/lib.linux-x86_64-2.7/_imagingtk.so=C2=A0</div></div><div><br></div><div>So=
 am curious if there is a linking problem with tcl8.6. Or if anyone has see=
n this issue, the instructions for what I am trying to do was published ove=
r a year ago so am wondering if something has changed. Thank you for any he=
lp or pointing me in the right direction. Am trying to help my grandson wit=
h his robot. Take care.</div><div><br></div><div>Cheers, Michael</div></div=
>
</blockquote></div><br></div>

--001a114393560be22605348ffc14--
