Return-Path: <m.a.b.researcher.yocto@gmail.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5827BF7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 13:38:48 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id i12so14385341otp.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=s6YxybIUf2it4rsFbCCt/aGZYempBSZf9wcVHaa1mYs=;
	b=vbq+aWanBoUTF99YQlJJobFpdANAUaSvgkkEg0E2MHSt1PoHa5mJtLMsOym49ULkEz
	gWQ8FabIv945V5jnmC90DrK5oL/hSfo7P8JjNm3SZQZ75kmr0S8wwOdd4m7yf71BePWZ
	cdwMrPok7UbNoWj4TZr3yEVUrzjLHTokVHZ72BVt+seXIXXpipGYSUTlZJX6CZkbw89j
	iUGyMQJTVElaBNVFG37TjJcV0ZFf6tR3uptoFpdUrPwsOfL12IbtOF3ZiIKw8IWWz828
	Yf1AIrD+ADab3jsVYkzpWWwwoMqeyFk2bPafoVDoSBztAxkBj7GQ1MpTKh9PcUobITux
	LRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=s6YxybIUf2it4rsFbCCt/aGZYempBSZf9wcVHaa1mYs=;
	b=UJBbcGXpOF/mZevgwknYJph//vL9XZAOOR3sj2D3Ta0haqhUzIcB9Ks4dbSXr2ghw1
	T+UqZPMqiCUqxc+joOhlkwsN9xYDsT/LF10uff/MEW33ep17nBPLuQzc7q7jOTqbDQfo
	JM7Cy9fvr4USTnoxWHTJnAeMy+MrCkdG44oHTxnQMp+Iw9QRxH4Q/eXI/VB8DzYSV5AS
	w4Mzr+uPXbe//zqPlkYUyyTqdqogtYx8k3PjYVrx1EQdOZtTAXn5ql90rRMC2rJFL38T
	/pihEd1fYLA5GYnDX3B25Yg5MSxDORaE3xXcVdkxar4AjH/gGctBfW2MxhUoMj7cRKrD
	K64A==
X-Gm-Message-State: APjAAAW6UIrXdTQkncnkmEecKadaxET8T0Lj5ycZAWYXfj5Uh6sspgrt
	T8RSg4YUT8MsVyHhiLMHHA48JStoNaD6PrETQ5Ycr+Wuk/WCWg==
X-Google-Smtp-Source: APXvYqy3l2DCuh4gw9TfAoz8v5bPSQ9gXGg11AAWM8+N1lRgwMGAa3fPwiNzm/CBDYY5OJL4rH+MSldNjyU/6iX/U50=
X-Received: by 2002:a9d:5889:: with SMTP id x9mr10288276otg.109.1552916329732; 
	Mon, 18 Mar 2019 06:38:49 -0700 (PDT)
MIME-Version: 1.0
From: Mohammad Ali Boroumand <m.a.b.researcher.yocto@gmail.com>
Date: Mon, 18 Mar 2019 17:08:38 +0330
Message-ID: <CA+ESJVjUaSTmuyLzO7R9AsdgF1DuXJrBhhRhwT9ik3gwwe4ihQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Error in compiling meta-toolchain-qt5
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
X-List-Received-Date: Mon, 18 Mar 2019 13:38:49 -0000
Content-Type: multipart/alternative; boundary="000000000000331fa205845e8233"

--000000000000331fa205845e8233
Content-Type: text/plain; charset="UTF-8"

Hi
I tried to compile meta-toolchain-qt5 for Raspberry Pi Zero since I need Qt
SDK for app developing, but I saw This error:

me@MAB-PC:~/Programs/poky/Builds/RP0$ bitbake meta-toolchain-qt5
Parsing recipes: 100%
|#################################################################################################################|
Time: 0:00:23
Parsing of 2296 .bb files complete (0 cached, 2296 parsed). 3358 targets,
124 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.40.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-18.04"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "raspberrypi0"
DISTRO               = "poky"
DISTRO_VERSION       = "2.6+snapshot-20190318"
TUNE_FEATURES        = "arm armv6 vfp arm1176jzfs callconvention-hard"
TARGET_FPU           = "hard"
meta
meta-poky
meta-yocto-bsp       = "master:47eb3d00e9d6a66aee1283dab29af8117a006d6d"
meta-oe
meta-multimedia
meta-networking
meta-python          = "master:423828d894a5c78ebe5fc527e9aeca66ac1838b1"
meta-raspberrypi     = "master:09c00164d6ad978d444749a89e0a0a3d77a1735e"
meta-qt5             = "master:fb71293f257c6fd02ccc06765a96dbf11d4569a0"

Initialising tasks: 100%
|##############################################################################################################|
Time: 0:00:01
Sstate summary: Wanted 1902 Found 0 Missed 1902 Current 0 (0% match, 0%
complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: qtwayland-5.12.0+gitAUTOINC+1dc85b95ab-r0 do_prepare_recipe_sysroot:
The file /usr/lib/libGLESv2.so.2.0.0 is installed by both mesa-gl and
userland, aborting
ERROR: qtwayland-5.12.0+gitAUTOINC+1dc85b95ab-r0 do_prepare_recipe_sysroot:
ERROR: qtwayland-5.12.0+gitAUTOINC+1dc85b95ab-r0 do_prepare_recipe_sysroot:
Function failed: extend_recipe_sysroot
ERROR: Logfile of failure stored in:
/home/me/Programs/poky/Builds/RP0/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueabi/qtwayland/5.12.0+gitAUTOINC+1dc85b95ab-r0/temp/log.do_prepare_recipe_sysroot.690
ERROR: Task
(/home/me/Programs/poky/meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_prepare_recipe_sysroot)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 5085 tasks of which 0 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /home/me/Programs/poky/meta-qt5/recipes-qt/qt5/qtwayland_git.bb:
do_prepare_recipe_sysroot
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.

I don't know how to solve this error. Could anyone have an Idea?

--000000000000331fa205845e8233
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi</div><div>I trie=
d to compile meta-toolchain-qt5 for Raspberry Pi Zero since I need Qt SDK f=
or app developing, but I saw This error:</div><div><br></div><div> me@MAB-P=
C:~/Programs/poky/Builds/RP0$ bitbake meta-toolchain-qt5<br>Parsing recipes=
: 100% |###################################################################=
##############################################| Time: 0:00:23<br>Parsing of=
 2296 .bb files complete (0 cached, 2296 parsed). 3358 targets, 124 skipped=
, 0 masked, 0 errors.<br>NOTE: Resolving any missing task queue dependencie=
s<br><br>Build Configuration:<br>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.40.0&quot;<br>BUILD_SYS=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-=
linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;ubun=
tu-18.04&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;arm-poky-linux-gnueabi&quot;<br>MACHINE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &=
quot;raspberrypi0&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DISTRO_V=
ERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;2.6+snapshot-20190318&=
quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;=
arm armv6 vfp arm1176jzfs callconvention-hard&quot;<br>TARGET_FPU=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;hard&quot;<br=
>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-poky=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;master:47eb3d00e9d6a66aee1283dab29af8117a006d6d&q=
uot;<br>meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 <br>meta-multimedia=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>me=
ta-networking=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-python=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:423828d894a5c78ebe=
5fc527e9aeca66ac1838b1&quot;<br>meta-raspberrypi=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;master:09c00164d6ad978d444749a89e0a0a3d77a1735e&quot;<br>meta-qt5=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;master:fb71293f257c6fd02ccc06765a96dbf11d4569a0&quot;<br><br>Init=
ialising tasks: 100% |#####################################################=
#########################################################| Time: 0:00:01<br=
>Sstate summary: Wanted 1902 Found 0 Missed 1902 Current 0 (0% match, 0% co=
mplete)<br>NOTE: Executing SetScene Tasks<br>NOTE: Executing RunQueue Tasks=
<br>ERROR: qtwayland-5.12.0+gitAUTOINC+1dc85b95ab-r0
 do_prepare_recipe_sysroot: The file /usr/lib/libGLESv2.so.2.0.0 is=20
installed by both mesa-gl and userland, aborting<br>ERROR: qtwayland-5.12.0=
+gitAUTOINC+1dc85b95ab-r0 do_prepare_recipe_sysroot: <br>ERROR: qtwayland-5=
.12.0+gitAUTOINC+1dc85b95ab-r0 do_prepare_recipe_sysroot: Function failed: =
extend_recipe_sysroot<br>ERROR: Logfile of failure stored in: /home/me/Prog=
rams/poky/Builds/RP0/tmp/work/arm1176jzfshf-vfp-poky-linux-gnueabi/qtwaylan=
d/5.12.0+gitAUTOINC+1dc85b95ab-r0/temp/log.do_prepare_recipe_sysroot.690<br=
>ERROR: Task (/home/me/Programs/poky/meta-qt5/recipes-qt/qt5/qtwayland_git.=
bb:do_prepare_recipe_sysroot) failed with exit code &#39;1&#39;<br>NOTE: Ta=
sks Summary: Attempted 5085 tasks of which 0 didn&#39;t need to be rerun an=
d 1 failed.<br><br>Summary: 1 task failed:<br>=C2=A0 /home/me/Programs/poky=
/meta-qt5/recipes-qt/qt5/qtwayland_git.bb:do_prepare_recipe_sysroot<br>Summ=
ary: There were 3 ERROR messages shown, returning a non-zero exit code.<br>=
</div><div><br></div><div>I don&#39;t know how to solve this error. Could a=
nyone have an Idea?<div class=3D"gmail-adL"><br></div></div></div></div></d=
iv>

--000000000000331fa205845e8233--
