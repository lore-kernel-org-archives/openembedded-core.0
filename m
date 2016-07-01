Return-Path: <embedded@die-kriestens.de>
Received: from outbound1.flatbooster.com (outbound1.flatbooster.com
	[84.200.50.201])
	by mail.openembedded.org (Postfix) with ESMTP id 0A18B60111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 05:49:25 +0000 (UTC)
Received: from localhost (outbound1.flatbooster.com [127.0.0.1])
	by outbound1.flatbooster.com (Postfix) with ESMTP id 10BC66D642A5;
	Fri,  1 Jul 2016 07:49:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outbound1.flatbooster.com
Received: from outbound1.flatbooster.com ([127.0.0.1])
	by localhost (outbound1.flatbooster.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id o_mTVcBKjjHQ; Fri,  1 Jul 2016 07:49:24 +0200 (CEST)
Received: from rex23.flatbooster.com (rex23b.flatbooster.com [93.186.195.156])
	by outbound1.flatbooster.com (Postfix) with ESMTPS;
	Fri,  1 Jul 2016 07:49:24 +0200 (CEST)
Received: from [10.53.10.54] (e-248-163.hrz.tu-chemnitz.de [134.109.248.163])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: web130220p1)
	by rex23.flatbooster.com (Postfix) with ESMTPSA id CEAAF1B2A24;
	Fri,  1 Jul 2016 07:49:23 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Daniel Kriesten <embedded@die-kriestens.de>
In-Reply-To: <CAJTo0La_VCQ5P1ELePTyLQLU_Zy3rC6z+qh24ZtMcGJ7_FKg3Q@mail.gmail.com>
Date: Fri, 1 Jul 2016 07:49:23 +0200
Message-Id: <CBCA3234-905B-4408-B26F-B78D1B2A2719@die-kriestens.de>
References: <1586B03B-3244-4FB3-82F7-803CFD983532@die-kriestens.de>
	<CAJTo0LbuTrNE4kemiZK_yEqUFo4CN9TJJLZzqwTjzVK=xuK1MA@mail.gmail.com>
	<D94025A2-518C-4CC8-AE9C-93DB39CDD687@die-kriestens.de>
	<CAJTo0La_VCQ5P1ELePTyLQLU_Zy3rC6z+qh24ZtMcGJ7_FKg3Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Jul 2016 05:49:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Am 30.06.2016 um 18:56 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 30 June 2016 at 07:03, Daniel Kriesten <embedded@die-kriestens.de> =
wrote:
> ERROR: perl-5.22.1-r0 do_package: objcopy failed with exit code 256 =
(cmd was 'arm-poky-linux-gnueabi-objcopy' --only-keep-debug =
'/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/corte=
xa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/ge=
nerate_uudmap' =
'/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/corte=
xa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/.d=
ebug/generate_uudmap'):
> =
arm-poky-linux-gnueabi-objcopy:/home/krid/Develop/Yocto/fsl-community-bsp/=
build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0=
/package/usr/lib/perl/ptest/generate_uudmap: File format not recognized
>=20
> Can you run file on the binary that objdump is complaining about?
> =
(/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/corte=
xa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/ge=
nerate_uudmap)

$ file =
/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortex=
a9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/gen=
erate_uudmap
=
/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortex=
a9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/gen=
erate_uudmap: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), =
dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for =
GNU/Linux 2.6.32, =
BuildID[sha1]=3D48ab21d6bc4545ce1c9b695001a5179192c40d9a, not stripped

So this one is build for the host, not the target =E2=80=A6

With kind regards
	Daniel

--=20
Daniel Kriesten
daniel@die-kriestens.de
http://www.die-kriestens.de


