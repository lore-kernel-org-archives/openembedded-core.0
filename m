Return-Path: <embedded@die-kriestens.de>
Received: from outbound1.flatbooster.com (outbound1.flatbooster.com
	[84.200.50.201])
	by mail.openembedded.org (Postfix) with ESMTP id 8C25060111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 08:16:48 +0000 (UTC)
Received: from localhost (outbound1.flatbooster.com [127.0.0.1])
	by outbound1.flatbooster.com (Postfix) with ESMTP id 621216D64A83;
	Fri,  1 Jul 2016 10:16:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outbound1.flatbooster.com
Received: from outbound1.flatbooster.com ([127.0.0.1])
	by localhost (outbound1.flatbooster.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2nclRemThij3; Fri,  1 Jul 2016 10:16:48 +0200 (CEST)
Received: from rex23.flatbooster.com (rex23b.flatbooster.com [93.186.195.156])
	by outbound1.flatbooster.com (Postfix) with ESMTPS;
	Fri,  1 Jul 2016 10:16:47 +0200 (CEST)
Received: from [10.53.10.54] (e-248-163.hrz.tu-chemnitz.de [134.109.248.163])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: web130220p1)
	by rex23.flatbooster.com (Postfix) with ESMTPSA id 25A052674009;
	Fri,  1 Jul 2016 10:16:47 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Daniel Kriesten <embedded@die-kriestens.de>
X-Mailtags-Timestamp: 2016-07-01 10:16:46 +0200
In-Reply-To: <CBCA3234-905B-4408-B26F-B78D1B2A2719@die-kriestens.de>
Date: Fri, 1 Jul 2016 10:16:46 +0200
X-Mailtags-Version: 4
Message-Id: <EB6A5779-7761-4508-8FEC-FFF326614C72@die-kriestens.de>
References: <1586B03B-3244-4FB3-82F7-803CFD983532@die-kriestens.de>
	<CAJTo0LbuTrNE4kemiZK_yEqUFo4CN9TJJLZzqwTjzVK=xuK1MA@mail.gmail.com>
	<D94025A2-518C-4CC8-AE9C-93DB39CDD687@die-kriestens.de>
	<CAJTo0La_VCQ5P1ELePTyLQLU_Zy3rC6z+qh24ZtMcGJ7_FKg3Q@mail.gmail.com>
	<CBCA3234-905B-4408-B26F-B78D1B2A2719@die-kriestens.de>
X-Mailtags: {"mailTagsProject":"Mailingliste"}
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 01 Jul 2016 08:16:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ross,

I found the time to do the x86qemu build with jethro, which gives the QA =
Issue.

---------- >8 ----------
jethro u=3D $ bitbake core-image-base
WARNING: Host distribution "Arch-rolling" has not been validated with =
this version of the build system; you may possibly experience unexpected =
failures. It is recommended that you use a tested distribution.
Parsing recipes: 100% =
|#########################################################################=
##########################################################################=
####################################################| Time: 00:01:22
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1330 targets, =
38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        =3D "1.28.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Arch-rolling"
TARGET_SYS        =3D "i586-poky-linux"
MACHINE           =3D "qemux86"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "2.0.2"
TUNE_FEATURES     =3D "m32 i586"
TARGET_FPU        =3D ""
meta
meta-yocto
meta-yocto-bsp    =3D "jethro:118380bc5d01e52b5edc574abb4176f6e70a54a6"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL =
http://downloads.sourceforge.net/linux-diag/sysfsutils-2.1.0.tar.gz, =
attempting MIRRORS if available
WARNING: QA Issue: Symlink /usr/lib/perl/ptest/hostperl in perl-ptest =
points to TMPDIR [symlink-to-sysroot]
ERROR: QA Issue: Architecture did not match (3 to 62) on =
work/i586-poky-linux/perl/5.22.0-r0/packages-split/perl-ptest/usr/lib/perl=
/ptest/.debug/generate_uudmap [arch]
WARNING: QA Issue: =
/usr/lib/perl/ptest/generate@underscore@uudmap_perl-ptest contained in =
package perl-ptest requires libc.so.6()(64bit), but no providers found =
in its RDEPENDS [file-rdeps]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: =
/home/krid/Develop/Yocto/TUC-L4IVA-Yocto/meta-layers/poky/build-qemux86/tm=
p/work/i586-poky-linux/perl/5.22.0-r0/temp/log.do_package_qa.13360
ERROR: Task 1146 =
(/home/krid/Develop/Yocto/TUC-L4IVA-Yocto/meta-layers/poky/meta/recipes-de=
vtools/perl/perl_5.22.0.bb, do_package_qa) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3181 tasks of which 12 didn't need to be =
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  =
/home/krid/Develop/Yocto/TUC-L4IVA-Yocto/meta-layers/poky/meta/recipes-dev=
tools/perl/perl_5.22.0.bb, do_package_qa
Summary: There were 4 WARNING messages shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit =
code.
---------- 8< ----------

Here is what file says:
jethro u=3D $ file =
tmp/work/i586-poky-linux/perl/5.22.0-r0/packages-split/perl-ptest/usr/lib/=
perl/ptest/.debug/generate_uudmap
=
tmp/work/i586-poky-linux/perl/5.22.0-r0/packages-split/perl-ptest/usr/lib/=
perl/ptest/.debug/generate_uudmap: ELF 64-bit LSB executable, x86-64, =
version 1 (SYSV), dynamically linked, interpreter *empty*, for GNU/Linux =
2.6.32, BuildID[sha1]=3D48ab21d6bc4545ce1c9b695001a5179192c40d9a, not =
stripped

As Arch Linux is currently based on gcc-6.1 (64bit only), I had to =
change that to gcc-multilib (32 and 64 bit). Furthermore, for jethro and =
krogoth, I had to downgrade gcc to 5.3. I could use latest master of =
poky and see, if that works. I don=E2=80=99t know, if it is worth a try.

Regards
	Daniel

> Am 01.07.2016 um 07:49 schrieb Daniel Kriesten =
<embedded@die-kriestens.de>:
>=20
>> Am 30.06.2016 um 18:56 schrieb Burton, Ross <ross.burton@intel.com>:
>>=20
>>=20
>> On 30 June 2016 at 07:03, Daniel Kriesten <embedded@die-kriestens.de> =
wrote:
>> ERROR: perl-5.22.1-r0 do_package: objcopy failed with exit code 256 =
(cmd was 'arm-poky-linux-gnueabi-objcopy' --only-keep-debug =
'/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/corte=
xa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/ge=
nerate_uudmap' =
'/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/corte=
xa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/.d=
ebug/generate_uudmap'):
>> =
arm-poky-linux-gnueabi-objcopy:/home/krid/Develop/Yocto/fsl-community-bsp/=
build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0=
/package/usr/lib/perl/ptest/generate_uudmap: File format not recognized
>>=20
>> Can you run file on the binary that objdump is complaining about?
>> =
(/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/corte=
xa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/ge=
nerate_uudmap)
>=20
> $ file =
/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortex=
a9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/gen=
erate_uudmap
> =
/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortex=
a9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/gen=
erate_uudmap: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), =
dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for =
GNU/Linux 2.6.32, =
BuildID[sha1]=3D48ab21d6bc4545ce1c9b695001a5179192c40d9a, not stripped
>=20
> So this one is build for the host, not the target =E2=80=A6
>=20
> With kind regards
> 	Daniel


--=20
Daniel Kriesten
daniel@die-kriestens.de
http://www.die-kriestens.de



