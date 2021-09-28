Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28BCC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 07:36:56 +0000 (UTC)
Subject: Re: [PATCH] vim: fix CVE-2021-3778
To: openembedded-core@lists.openembedded.org
From: "Minjae Kim" <flowergom@gmail.com>
X-Originating-Location: Goyang-si, Gyeonggi-do, KR (59.6.144.168)
X-Originating-Platform: Windows Chrome 93
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Sep 2021 00:36:55 -0700
References: <16202.1632812323492474010@lists.openembedded.org>
In-Reply-To: <16202.1632812323492474010@lists.openembedded.org>
Message-ID: <17932.1632814615730834966@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qm1bu5w2Fy9J193BdbTV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 07:36:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156408

--qm1bu5w2Fy9J193BdbTV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

When I tried to rebuild this patch on the latest master branch,
I could not get any patch errors as below.

poky/master/poky$ bitbake vim -c cleanall; bitbake vim -C compile
Loading cache: 100% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |####################################################=
###########################################################################=
#######################| Time: 0:00:03
Parsing of 828 .bb files complete (0 cached, 828 parsed). 1469 targets, 44 =
skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.51.1"
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D "universal"
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "x86_64-poky-linux"
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "qemux86-64"
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "poky"
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "3.3+snapshot-a1e31bb8d625bf45=
31347e7cff6de89f104800c7"
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "m64 core2"
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ""
meta
meta-poky
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:a1e31bb8d625bf4531347e=
7cff6de89f104800c7"

Initialising tasks: 100% |#################################################=
###########################################################################=
#######################| Time: 0:00:00
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0%=
 complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun a=
nd all succeeded.
Loading cache: 100% |######################################################=
###########################################################################=
#######################| Time: 0:00:00
Loaded 1469 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.51.1"
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D "universal"
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "x86_64-poky-linux"
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "qemux86-64"
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "poky"
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "3.3+snapshot-a1e31bb8d625bf45=
31347e7cff6de89f104800c7"
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "m64 core2"
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ""
meta
meta-poky
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:a1e31bb8d625bf4531347e=
7cff6de89f104800c7"

NOTE: Tainting hash to force rebuild of task /home/webos_build/upstream/pok=
y/master/poky/meta/recipes-support/vim/vim_8.2.bb, do_compile=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:00
WARNING: /home/webos_build/upstream/poky/master/poky/meta/recipes-support/v=
im/vim_8.2.bb:do_compile is tainted from a forced run=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=
=A0 0:00:00
Initialising tasks: 100% |#################################################=
###########################################################################=
#######################| Time: 0:00:01
Sstate summary: Wanted 10 Local 0 Network 0 Missed 10 Current 549 (0% match=
, 98% complete)
Removing 3 stale sstate objects for arch qemux86_64: 100% |################=
###########################################################################=
#######################| Time: 0:00:00
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 1964 tasks of which 1945 didn't need to be r=
erun and all succeeded.

Summary: There was 1 WARNING message shown.
upstream/poky/master/poky$

Thanks,
Minjae Kim

--qm1bu5w2Fy9J193BdbTV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,<br /><br />When I tried to rebuild this patch on the latest mas=
ter branch,<br />I could not get any patch errors as below.<br /><br />
<div>poky/master/poky$ bitbake vim -c cleanall; bitbake vim -C compile</div=
>
<div>Loading cache: 100% |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| ETA:&nbsp; --:--:--</div>
<div>Loaded 0 entries from dependency cache.</div>
<div>Parsing recipes: 100% |###############################################=
###########################################################################=
############################| Time: 0:00:03</div>
<div>Parsing of 828 .bb files complete (0 cached, 828 parsed). 1469 targets=
, 44 skipped, 0 masked, 0 errors.</div>
<div>NOTE: Resolving any missing task queue dependencies</div>
<div>&nbsp;</div>
<div>Build Configuration:</div>
<div>BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "1.51.1"</div>
<div>BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "x86_64-linux"<=
/div>
<div>NATIVELSBSTRING&nbsp; &nbsp; &nbsp; =3D "universal"</div>
<div>TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "x86_64-poky-li=
nux"</div>
<div>MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "qemux86-6=
4"</div>
<div>DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "poky=
"</div>
<div>DISTRO_VERSION&nbsp; &nbsp; &nbsp; &nbsp;=3D "3.3+snapshot-a1e31bb8d62=
5bf4531347e7cff6de89f104800c7"</div>
<div>TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D "m64 core2"</div>
<div>TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D ""</div>
<div>meta&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</di=
v>
<div>meta-poky&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-yocto-bsp&nbsp; &nbsp; &nbsp; &nbsp;=3D "master:a1e31bb8d625bf453=
1347e7cff6de89f104800c7"</div>
<div>&nbsp;</div>
<div>Initialising tasks: 100% |############################################=
###########################################################################=
############################| Time: 0:00:00</div>
<div>Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% matc=
h, 0% complete)</div>
<div>NOTE: No setscene tasks</div>
<div>NOTE: Executing Tasks</div>
<div>NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be re=
run and all succeeded.</div>
<div>Loading cache: 100% |#################################################=
###########################################################################=
############################| Time: 0:00:00</div>
<div>Loaded 1469 entries from dependency cache.</div>
<div>NOTE: Resolving any missing task queue dependencies</div>
<div>&nbsp;</div>
<div>Build Configuration:</div>
<div>BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "1.51.1"</div>
<div>BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "x86_64-linux"<=
/div>
<div>NATIVELSBSTRING&nbsp; &nbsp; &nbsp; =3D "universal"</div>
<div>TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "x86_64-poky-li=
nux"</div>
<div>MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "qemux86-6=
4"</div>
<div>DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "poky=
"</div>
<div>DISTRO_VERSION&nbsp; &nbsp; &nbsp; &nbsp;=3D "3.3+snapshot-a1e31bb8d62=
5bf4531347e7cff6de89f104800c7"</div>
<div>TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D "m64 core2"</div>
<div>TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D ""</div>
<div>meta&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</di=
v>
<div>meta-poky&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-yocto-bsp&nbsp; &nbsp; &nbsp; &nbsp;=3D "master:a1e31bb8d625bf453=
1347e7cff6de89f104800c7"</div>
<div>&nbsp;</div>
<div>NOTE: Tainting hash to force rebuild of task /home/webos_build/upstrea=
m/poky/master/poky/meta/recipes-support/vim/vim_8.2.bb, do_compile&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| ETA:&nbsp; 0:00:00</div>
<div>WARNING: /home/webos_build/upstream/poky/master/poky/meta/recipes-supp=
ort/vim/vim_8.2.bb:do_compile is tainted from a forced run&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| ETA:&=
nbsp; 0:00:00</div>
<div>Initialising tasks: 100% |############################################=
###########################################################################=
############################| Time: 0:00:01</div>
<div>Sstate summary: Wanted 10 Local 0 Network 0 Missed 10 Current 549 (0% =
match, 98% complete)</div>
<div>Removing 3 stale sstate objects for arch qemux86_64: 100% |###########=
###########################################################################=
############################| Time: 0:00:00</div>
<div>NOTE: Executing Tasks</div>
<div>NOTE: Tasks Summary: Attempted 1964 tasks of which 1945 didn't need to=
 be rerun and all succeeded.</div>
<div>&nbsp;</div>
<div>Summary: There was 1 WARNING message shown.</div>
<div>upstream/poky/master/poky$&nbsp;<br /><br />Thanks,<br />Minjae Kim</d=
iv>
<div>&nbsp;</div>

--qm1bu5w2Fy9J193BdbTV--

