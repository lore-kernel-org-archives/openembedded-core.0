Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F316C433F5
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 06:43:39 +0000 (UTC)
Subject: Re: [PATCH] vim: fix 2021-3796
To: openembedded-core@lists.openembedded.org
From: "Minjae Kim" <flowergom@gmail.com>
X-Originating-Location: Seoul, KR (59.6.144.168)
X-Originating-Platform: Windows Chrome 94
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 23 Oct 2021 23:43:38 -0700
References: <YXQw7r4KD+GsihFy@piout.net>
In-Reply-To: <YXQw7r4KD+GsihFy@piout.net>
Message-ID: <25288.1635057818550335478@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="JcqrVGOn6uQ1dwuNDfMO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Oct 2021 06:43:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157322

--JcqrVGOn6uQ1dwuNDfMO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

I updated the patch and I got a build success on my machine as below.
Thanks for notice :)

/poky/master/poky/meta$ bitbake vim -c cleanall; bitbake vim -C compile Loa=
ding cache: 100% |#########################################################=
###########################################################################=
###########################################################################=
###########################################################################=
## Loaded 1478 entries from dependency cache. NOTE: Resolving any missing t=
ask queue dependencies Build Configuration: BB_VERSION =3D "1.52.0" BUILD_S=
YS =3D "x86_64-linux" NATIVELSBSTRING =3D "universal" TARGET_SYS =3D "x86_6=
4-poky-linux" MACHINE =3D "qemux86-64" DISTRO =3D "poky" DISTRO_VERSION =3D=
 "3.4" TUNE_FEATURES =3D "m64 core2" TARGET_FPU =3D "" meta meta-poky meta-=
yocto-bsp =3D "master:912f24b89c51300c05c8eb810c55ce1ad2e6545c" Initialisin=
g tasks: 100% |############################################################=
###########################################################################=
###########################################################################=
##################################################################### Sstat=
e summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0% comp=
lete) NOTE: No setscene tasks NOTE: Executing Tasks NOTE: Tasks Summary: At=
tempted 3 tasks of which 0 didn't need to be rerun and all succeeded. Loadi=
ng cache: 100% |###########################################################=
###########################################################################=
###########################################################################=
###########################################################################=
 Loaded 1478 entries from dependency cache. NOTE: Resolving any missing tas=
k queue dependencies Build Configuration: BB_VERSION =3D "1.52.0" BUILD_SYS=
 =3D "x86_64-linux" NATIVELSBSTRING =3D "universal" TARGET_SYS =3D "x86_64-=
poky-linux" MACHINE =3D "qemux86-64" DISTRO =3D "poky" DISTRO_VERSION =3D "=
3.4" TUNE_FEATURES =3D "m64 core2" TARGET_FPU =3D "" meta meta-poky meta-yo=
cto-bsp =3D "master:912f24b89c51300c05c8eb810c55ce1ad2e6545c" NOTE: Taintin=
g hash to force rebuild of task poky/master/poky/meta/recipes-support/vim/v=
im_8.2.bb, do_compile######################################################=
######### WARNING: poky/master/poky/meta/recipes-support/vim/vim_8.2.bb:do_=
compile is tainted from a forced run#######################################=
################################ Initialising tasks: 100% |################=
###########################################################################=
###########################################################################=
###########################################################################=
###################################### Sstate summary: Wanted 7 Local 0 Net=
work 0 Missed 7 Current 552 (0% match, 98% complete) NOTE: Executing Tasks =
NOTE: Tasks Summary: Attempted 1964 tasks of which 1949 didn't need to be r=
erun and all succeeded. Summary: There was 1 WARNING message shown.

Thanks,
Minjae Kim.

--JcqrVGOn6uQ1dwuNDfMO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi&nbsp;<span style=3D"white-space: pre-wrap;">Alexandre,</span><br /><br /=
><span style=3D"white-space: pre-wrap;">I updated the patch and I got a bui=
ld success on my machine as below.<br /></span>Thanks for notice :)<br /><b=
r /><span style=3D"white-space: pre-wrap;">/poky/master/poky/meta$ bitbake =
vim -c cleanall; bitbake vim -C compile Loading cache: 100% |##############=
###########################################################################=
###########################################################################=
###########################################################################=
############################################# Loaded 1478 entries from depe=
ndency cache. NOTE: Resolving any missing task queue dependencies Build Con=
figuration: BB_VERSION =3D "1.52.0" BUILD_SYS =3D "x86_64-linux" NATIVELSBS=
TRING =3D "universal" TARGET_SYS =3D "x86_64-poky-linux" MACHINE =3D "qemux=
86-64" DISTRO =3D "poky" DISTRO_VERSION =3D "3.4" TUNE_FEATURES =3D "m64 co=
re2" TARGET_FPU =3D "" meta meta-poky meta-yocto-bsp =3D "master:912f24b89c=
51300c05c8eb810c55ce1ad2e6545c" Initialising tasks: 100% |#################=
###########################################################################=
###########################################################################=
###########################################################################=
##################################### Sstate summary: Wanted 0 Local 0 Netw=
ork 0 Missed 0 Current 0 (0% match, 0% complete) NOTE: No setscene tasks NO=
TE: Executing Tasks NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn'=
t need to be rerun and all succeeded. Loading cache: 100% |################=
###########################################################################=
###########################################################################=
###########################################################################=
########################################### Loaded 1478 entries from depend=
ency cache. NOTE: Resolving any missing task queue dependencies Build Confi=
guration: BB_VERSION =3D "1.52.0" BUILD_SYS =3D "x86_64-linux" NATIVELSBSTR=
ING =3D "universal" TARGET_SYS =3D "x86_64-poky-linux" MACHINE =3D "qemux86=
-64" DISTRO =3D "poky" DISTRO_VERSION =3D "3.4" TUNE_FEATURES =3D "m64 core=
2" TARGET_FPU =3D "" meta meta-poky meta-yocto-bsp =3D "master:912f24b89c51=
300c05c8eb810c55ce1ad2e6545c" NOTE: Tainting hash to force rebuild of task =
poky/master/poky/meta/recipes-support/vim/vim_8.2.bb, do_compile###########=
#################################################### WARNING: poky/master/p=
oky/meta/recipes-support/vim/vim_8.2.bb:do_compile is tainted from a forced=
 run#######################################################################=
 Initialising tasks: 100% |################################################=
###########################################################################=
###########################################################################=
###########################################################################=
###### Sstate summary: Wanted 7 Local 0 Network 0 Missed 7 Current 552 (0% =
match, 98% complete) NOTE: Executing Tasks NOTE: Tasks Summary: Attempted 1=
964 tasks of which 1949 didn't need to be rerun and all succeeded. Summary:=
 There was 1 WARNING message shown. </span>
<div><span style=3D"white-space: pre-wrap;"><br />Thanks,<br />Minjae Kim.<=
/span></div>

--JcqrVGOn6uQ1dwuNDfMO--

