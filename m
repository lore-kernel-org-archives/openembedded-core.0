Return-Path: <embedded@die-kriestens.de>
Received: from outbound1.flatbooster.com (outbound1.flatbooster.com
	[84.200.50.201])
	by mail.openembedded.org (Postfix) with ESMTP id AB2F4601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 06:03:21 +0000 (UTC)
Received: from localhost (outbound1.flatbooster.com [127.0.0.1])
	by outbound1.flatbooster.com (Postfix) with ESMTP id D04B06D63E88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 08:03:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outbound1.flatbooster.com
Received: from outbound1.flatbooster.com ([127.0.0.1])
	by localhost (outbound1.flatbooster.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 1mvTP4_Sn63V
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 08:03:21 +0200 (CEST)
Received: from rex23.flatbooster.com (rex23b.flatbooster.com [93.186.195.156])
	by outbound1.flatbooster.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 08:03:20 +0200 (CEST)
Received: from [10.53.55.146] (e-251-121.hrz.tu-chemnitz.de [134.109.251.121])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: web130220p1)
	by rex23.flatbooster.com (Postfix) with ESMTPSA id 59CE21B2F9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 08:03:20 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Daniel Kriesten <embedded@die-kriestens.de>
X-Mailtags-Timestamp: 2016-06-30 08:03:19 +0200
In-Reply-To: <CAJTo0LbuTrNE4kemiZK_yEqUFo4CN9TJJLZzqwTjzVK=xuK1MA@mail.gmail.com>
Date: Thu, 30 Jun 2016 08:03:19 +0200
X-Mailtags-Version: 4
Message-Id: <D94025A2-518C-4CC8-AE9C-93DB39CDD687@die-kriestens.de>
References: <1586B03B-3244-4FB3-82F7-803CFD983532@die-kriestens.de>
	<CAJTo0LbuTrNE4kemiZK_yEqUFo4CN9TJJLZzqwTjzVK=xuK1MA@mail.gmail.com>
X-Mailtags: {"mailTagsProject":"Mailingliste"}
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: Building Perl-5.22.1-r0 on Arch Linux fails with QA Issue
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
X-List-Received-Date: Thu, 30 Jun 2016 06:03:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sorry. I thought it=E2=80=99s more like a RTFM-answer. So here is the =
error message.

Oh - well. Thanks for bringing me thus far. while reproducing the error, =
I see a difference as well. Here is the from ssl-community. It complains =
about uudmap. When building for i586, the message was a different one. =
Reproducing that one will take some hours.

---------- >8 ----------
WARNING: Host distribution "Arch-rolling" has not been validated with =
this version of the build system; you may possibly experience unexpected =
failures. It is recommended that you use a tested distribution.
Loading cache: 100% =
|#########################################################################=
#########| ETA:  00:00:00
Loaded 2197 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.30.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "universal"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "imx6q-elo"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.1"
TUNE_FEATURES     =3D "arm armv7a vfp thumb neon       =
callconvention-hard       cortexa9"
TARGET_FPU        =3D "hard"
meta
meta-poky         =3D "HEAD:4376fb851791a1fb514873ad239d516dd7159341"
meta-oe
meta-multimedia   =3D "HEAD:247b1267bbe95719cd4877d2d3cfbaf2a2f4865a"
meta-fsl-arm      =3D "HEAD:3f34509381092a893b8efe4451018b8d67a5abf6"
meta-fsl-arm-extra =3D "HEAD:698cf389aa446244a39b597fbf58be1d55096500"
meta-fsl-demos    =3D "HEAD:7e4237db1f48cbbde776b17a66d71def14e3809e"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks

ERROR: perl-5.22.1-r0 do_package: objcopy failed with exit code 256 (cmd =
was 'arm-poky-linux-gnueabi-objcopy' --only-keep-debug =
'/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/corte=
xa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/ge=
nerate_uudmap' =
'/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/corte=
xa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/.d=
ebug/generate_uudmap'):
=
arm-poky-linux-gnueabi-objcopy:/home/krid/Develop/Yocto/fsl-community-bsp/=
build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0=
/package/usr/lib/perl/ptest/generate_uudmap: File format not recognized
ERROR: perl-5.22.1-r0 do_package: Function failed: split_and_strip_files
ERROR: Logfile of failure stored in: =
/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortex=
a9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/temp/log.do_package.31441
ERROR: Task 1126 =
(/home/krid/Develop/Yocto/fsl-community-bsp/sources/poky/meta/recipes-devt=
ools/perl/perl_5.22.1.bb, do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1436 tasks of which 1414 didn't need to =
be rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  =
/home/krid/Develop/Yocto/fsl-community-bsp/sources/poky/meta/recipes-devto=
ols/perl/perl_5.22.1.bb, do_package
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
---------- 8< ----------


> Am 29.06.2016 um 21:47 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 29 June 2016 at 20:24, Daniel Kriesten <embedded@die-kriestens.de> =
wrote:
> ERROR: QA Issue: Architecture did not match (=E2=80=A6) on =
work/i586-poky-linux/perl/5.22.1-r0/packages=E2=80=A6
>=20
> Can you fill in the ... so we're not guessing what the error actually =
is?
>=20
> Ross


--=20
Daniel Kriesten
daniel@die-kriestens.de
http://www.die-kriestens.de


