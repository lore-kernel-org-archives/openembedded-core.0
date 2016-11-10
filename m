Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 04FCD60777
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 10:01:33 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id F06AEA001D0;
	Thu, 10 Nov 2016 11:02:10 +0100 (CET)
Received: from [172.16.25.229] ([172.16.25.229])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016111011013385-52712 ;
	Thu, 10 Nov 2016 11:01:33 +0100 
To: "Burton, Ross" <ross.burton@intel.com>
References: <1478257606-15637-1-git-send-email-s.mueller-klieser@phytec.de>
	<CAJTo0Lb1-FjGzvxn6Lsc6Lme4LB6=Rs8rv_vggS8SkXPHRcduw@mail.gmail.com>
From: =?UTF-8?Q?Stefan_M=c3=bcller-Klieser?= <s.mueller-klieser@phytec.de>
Organization: PHYTEC Messtechnik GmbH
Message-ID: <5824457E.9040002@phytec.de>
Date: Thu, 10 Nov 2016 11:01:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb1-FjGzvxn6Lsc6Lme4LB6=Rs8rv_vggS8SkXPHRcduw@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 10.11.2016 11:01:33,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 10.11.2016 11:01:33
X-TNEFEvaluated: 1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: fix build
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
X-List-Received-Date: Thu, 10 Nov 2016 10:01:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07.11.2016 16:00, Burton, Ross wrote:
> On 4 November 2016 at 11:06, Stefan M=C3=BCller-Klieser <
> s.mueller-klieser@phytec.de> wrote:
>=20
>> This fixes the mkimage build for situations where HOSTCC and friends
>> need to be overridden and the u-boot makefile defaults don't work.
>>
>=20
> I applied this on top of the u-boot upgrades and it still breaks:
>=20
> make -f ./scripts/Makefile.build obj=3Dtools
>   x86=5F64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=
=3Dsse
> -msse4.2 --sysroot=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-64
> -Wp,-MD,tools/.bin2header.d -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/work/corei7-64-poky-linu=
x/u-boot-mkimage/2016.09.01-r0=3D/usr/src/debug/u-boot-mkimage/2016.09.01-r0
> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/x86=5F64-linux=
=3D
> -fdebug-prefix-map=3D/data/poky-master/tmp-glibc/sysroots/intel-corei7-64=
=3D
>  -fstack-protector-strong -pie -fpie -D=5FFORTIFY=5FSOURCE=3D2 -Wformat
> -Wformat-security -Werror=3Dformat-security   -DCONFIG=5FFIT=5FSIGNATURE =
-include
> ./include/libfdt=5Fenv.h -idirafterinclude -idirafter./arch/sandbox/inclu=
de
> -I./lib/libfdt -I./tools -DCONFIG=5FSYS=5FTEXT=5FBASE=3D0 -DUSE=5FHOSTCC
> -D=5F=5FKERNEL=5FSTRICT=5FNAMES -D=5FGNU=5FSOURCE  -o tools/bin2header
> tools/bin2header.c
> ...
> cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \
> tools/bin2header license=5Fgzip > ./include/license.h
> /bin/sh: 2: tools/bin2header: not found
> tools/Makefile:256: recipe for target 'include/license.h' failed
>=20
> Looks like HOSTCC isn't being set correctly.

Ok, this bin2header issue seems to be unrelated, as Marek sent a v1 upstrea=
m, fixing
the execution path. I am not in a hurry with the oe-core, so please ignore =
the patch.
I will send it upstream first.

Stefan

>=20
> Ross
>=20

