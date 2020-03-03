Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id CA54160F93
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=6582; q=dns/txt; s=axis-central1;
	t=1583242409; x=1614778409;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=qUKMp5QMpwcPH+EsAtS89EfY9H8K83qgMeuwQSe8xy4=;
	b=Hmdwc4t5FW7dgrh0HJSP/643L62MMkCdmGar96thO+AnoQT5OJjqcZsz
	RNPn915FcqZfcovNq1ZwhYltlDOpsuGMbFQCjohgnQ5EyQapTR/uceVj+
	O9FnXCCMf85/4bJi3T0AWWSd0VHHyxiOFbKt6i08X32OT7nd5SIOx69dl
	bznSh3GmVTYPlsP6RVf3IDPGq/CvPtlNnOmLpIfMh9TskJ6frLyY+qK65
	aOS/qlddb8+Lvk45L7jDCE47d3LFEfYITD3Ftm3IleODaEFRlCuY+YY9H
	RKfmFeEaUSX/4DJMYtPXbQSovgaPTEMwaQFsZ72GAdR3bWwxsgb+HBxXy A==;
IronPort-SDR: yzLSxWcpmAmC9ygGJ3nihQ4vCt9ZelZ1PfpU+wuo5Lr9NAdk1uHJIusXQ95Jxre7KW5rl8jser
	G8RTigbSNeCsBhr/pTIA8GTuX5jQrtjrhQa5KA6Hem3093lhaT6A6JNyagRQWPwH0LOfyQCt+d
	V4rMEPmDHpue71ORr5UftM7S+DuowNsT1vZfJT4XhADShsyE4X5T8gfh+GDnO33shCct2wBHf7
	r43cHzLB5j+6TngN3/FyJawZ3f+8vCySzHid129iioNF4tgvyTuIxeg26Np8DxIfmT5FOosQKS
	t48=
X-IronPort-AV: E=Sophos;i="5.70,511,1574118000"; 
   d="scan'208";a="5875527"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>, 'Junling Zheng'
	<zhengjunling@huawei.com>, 'Khem Raj' <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
	MACHINEOVERRIDES
Thread-Index: AQHV8MCOVPC5pfvw0keD/66VlGkIvKg2IGSAgACi7cCAAAMxgIAAFPWQ
Date: Tue, 3 Mar 2020 13:33:28 +0000
Message-ID: <0c22ed9d4f9b473b8a3c7df94b625712@XBOX03.axis.com>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
	<9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
	<41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
	<000501d5f15c$6e210280$4a630780$@neuf.fr>
In-Reply-To: <000501d5f15c$6e210280$4a630780$@neuf.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "wangnan0@huawei.com" <wangnan0@huawei.com>
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 03 Mar 2020 13:33:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Herve Jourdain <herve.jourdain@neuf.fr>
> Sent: den 3 mars 2020 14:05
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; 'Junling Zheng'
> <zhengjunling@huawei.com>; 'Khem Raj' <raj.khem@gmail.com>; openembedded-
> core@lists.openembedded.org
> Cc: wangnan0@huawei.com
> Subject: RE: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
> MACHINEOVERRIDES
>=20
> Hi,
>=20
> Just my 2 cents about this.
> armv8-a is the architecture of the arm core, while aarch64/aarch32 is the
> execution mode on said architecture.
> So I believe that we should have overrides for BOTH the architecture and =
the
> execution mode, as you can have armv8-a executing in 32 bits mode - and b=
tw,

There is still an override for aarch64 even after removing it from=20
MACHINEOVERRIDES. It is provided via ${TRANSLATED_TARGET_ARCH}, which=20
will be either "aarch64" or "aarch64-be". The problem before was that=20
for big endian tunes, both aarch64 and aarch64-be would be overrides.

> the instruction set in 32 bits mode is not exactly the same as armv7-ve, =
so
> in terms of optimization it does help to know you're running on an armv8-=
a
> architecture, even if it's in 32 bits mode.
> There was no such problem before armv8-a architecture, since all previous
> architectures were running in 32 bits mode only. Armv8-a changes that as
> it's a "hybrid", with support for both aarch64 and aarch32.
> I expect later arch to support only aarch64.
>=20
> There is also an additional thing to consider, there is not just one armv=
8-a
> profiles, there already are several, and they shall all be taken into acc=
ount.
> I believe that at this time, the valid ones are armv8.0-a, armv8.1-a,
> armv8.2-a, armv8.3-a  and armv8.4-a.
>=20
> And let me answer before someone asks, yes the gcc compiler DOES provide
> compiler options for all those architectures, with those exact names -
> except armv8.0-a is just named armv8-a (-march=3Darmv8-a or -march=3Darmv=
8.[1,2,3,4]-a).
> So it just makes sense to support them all.
>=20
> So overall, I believe we should support all those arm v8 architectures, a=
nd
> add the corresponding override to the cpu definition files (for instance,=
 as
> Peter mentioned, cortex-a53 is an armv8.0-a. But a cortex-a55 or cortex-a=
75
> would be an armv8.2-a).
>=20
> Finally, the arm architecture is slightly more complex than just armv8.x-=
a,
> since the support for "features" is optional. So at least "crc" and "cryp=
to"
> features should be added, in order to have a "comprehensive" view of the
> armv8 architecture. And yes, the "features" are also supported by the gcc
> compiler.
> So the arm architecture would really be fully defined by
> armv8.x-a+[no]crc+[no]crypto, depending on the underlying SoC and what th=
ey

The crc and crypto features are currently specified in TUNE_FEATURES. Not=20
sure if it is a good idea to include them in MACHINEOVERRIDES as well,=20
but my gut instinct says it is not.

> implemented or not as optional features. And this is probably what should
> end up going into the tune-cortexa53.inc and others (and should be
> override-able, since again not all cortexa53 are created the same).
>=20
> Cheers,
> Herve
>=20
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Peter
> Kjellerstedt
> Sent: 03 March 2020 13:00
> To: Junling Zheng <zhengjunling@huawei.com>; Khem Raj
> <raj.khem@gmail.com>;
> openembedded-core@lists.openembedded.org
> Cc: wangnan0@huawei.com
> Subject: Re: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
> MACHINEOVERRIDES
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-core- bounces@lists.openembedded.org> On Behalf Of
> > Junling Zheng
> > Sent: den 3 mars 2020 04:11
> > To: Khem Raj <raj.khem@gmail.com>; openembedded-
> > core@lists.openembedded.org
> > Cc: wangnan0@huawei.com
> > Subject: Re: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64
> > in MACHINEOVERRIDES
> >
> > On 2020/3/3 2:29, Khem Raj wrote:
> > >
> > >
> > > On 3/2/20 9:11 AM, Junling Zheng wrote:
> > >> Currently, for arch-arm64, poky will append the MACHINEOVERRIDES
> > >> with "aarch64:", which has the higher priority than
> TRANSLATED_TARGET_ARCH.
> > >> So, for aarch64 big endian, the variable '<foo>_aarch64' will
> > >> override not only '<foo>', but also '<foo>_aarch64-be', thus we
> > >> will get an incorrect variable.
> > >>
> > >> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> > >> ---
> > >>   meta/conf/machine/include/arm/arch-arm64.inc | 2 --
> > >>   1 file changed, 2 deletions(-)
> > >>
> > >> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc
> > b/meta/conf/machine/include/arm/arch-arm64.inc
> > >> index 53f4566815..32294bd218 100644
> > >> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> > >> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> > >> @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
> > >>     TUNEVALID[aarch64] =3D "Enable instructions for aarch64"
> > >>   -MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES',
> 'aarch64', 'aarch64:', '' ,d)}"
> > >> -
> > >
> > > if its removed here, where is it being added for other machines,
> > question is, should we treat aarch64 as LE equivalent of aarch64_be
> > > or should be treated as common aarch64 and a new define like
> > > aarch64_le
> > defined.
> > >
> >
> > Currently, for arm64, we have aarch64_be to represent big endian, but
> > no overrides to represent little endian only.
> >
> > So, IMO, we should treat aarch64 as little enaian only, like arm and
> > armeb.
> >
> > >>   # Little Endian base configs
> > >>   AVAILTUNES +=3D "aarch64 aarch64_be"
> > >>   ARMPKGARCH_tune-aarch64 ?=3D "aarch64"
>=20
> Please, before removing "aarch64" from MACHINEOVERRIDES, add "armv8a" or
> similar. This is how it is done for the armv7* based chips. E.g., I would
> expect to see tune-cortexa53.inc have:
>=20
> MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53',
> 'armv8a:', '' ,d)}"
>=20
> Which corresponds to how it is done for armv7*.
>=20
> At least we currently rely on being able to do, e.g.:
>=20
> COMPATIBLE_MACHINE =3D "aarch64|armv7a|armv7ve"
>=20
> and if you remove "aarch64" from MACHINEOVERRIDES, we need a suitable
> substitute.
>=20
> //Peter

//Peter


