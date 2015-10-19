Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 125B876104
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:49:53 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so200986543pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=mE7VgxRP401UavUtO4eKRnbY9DGnPKwl3lLB8wCt5ug=;
	b=jtLmkfL7TXQU9zI1aEhe0msZJzv7ML2lvqp8uvfVXQr6rMCYFRRpDsZbLP0rmfprV4
	YNU38WCFu66VSNKJxL5A3gKv8UK2r6IO9GT3ff86VlQWmDj1TErpnebDPQutAc/2kQq7
	2spZot7rTaGbD1qQldZVPdgjRg9dGcLCNq+PsUQ1ADQwsCSEHnZMBx/GmbeBjd37y6sk
	IhmwAfWjouGx8OOC9rXyRpxdiAT/kJp4ZZoSzSFnI1Iav0bbOjNDouGSl36gNT4fFFA3
	9g8+kEw5P3kBaRBx7DlPz8y+DLOvhSiGT7gtr2sp4M/IYio+MFLS/P3d3A9qZa5HHwoS
	0huw==
X-Received: by 10.69.1.5 with SMTP id bc5mr36797780pbd.151.1445287793557;
	Mon, 19 Oct 2015 13:49:53 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e01a:3e87:ef7c:f8e5?
	([2601:646:8601:4580:e01a:3e87:ef7c:f8e5])
	by smtp.gmail.com with ESMTPSA id
	hq1sm26278095pbb.43.2015.10.19.13.49.52
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 19 Oct 2015 13:49:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20151019201308.GA2872@jama>
Date: Mon, 19 Oct 2015 13:49:44 -0700
Message-Id: <9ADADC90-70F6-4C67-AC97-3FA423B51D98@gmail.com>
References: <1444138615-5618-1-git-send-email-Martin.Jansa@gmail.com>
	<1445277812-3941-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMKF1sqz7-0GYeuqR5foRyhDA4fFOgu1AS6PjscqqD66r3imrA@mail.gmail.com>
	<20151019201308.GA2872@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.3096.4)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][WIP[[PATCH] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi andARMPKGSFX_EABI
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
X-List-Received-Date: Mon, 19 Oct 2015 20:49:54 -0000
X-Groupsio-MsgNum: 72373
Content-Type: multipart/signed;
	boundary="Apple-Mail=_95EEF74F-FA72-4D60-9850-C4FAA2305624";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_95EEF74F-FA72-4D60-9850-C4FAA2305624
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 19, 2015, at 1:13 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Mon, Oct 19, 2015 at 12:40:05PM -0700, Khem Raj wrote:
>> Why doesnt vfpv4 also imply vfp ? Isnt it a super set
>=20
> As it's now adding it to TUNE_FEATURES it would duplicate -mfpu =
options
> with different values, this change should probably cover vfpv3 and
> vfpv3d16 as well as added in:

hard-float shouldn=E2=80=99t be dependent upon which version of FP is in =
use, but -mfpu option will
certainly tell the compiler to use right instructions for =
-mfloat-abi=3Dhard


>=20
> commit f9de9521477a1de8f6a399bcdc8260e28e34dfb3
> Author: Andr=C3=A9 Draszik <git@andred.net>
> Date:   Fri Jul 24 14:14:30 2015 +0100
>=20
>    arch-armv7a.inc, feature-arm-vfp.inc: add tunes for vfpv3 and
> vfpv3d16
>=20
> vfpv4 as separate TUNE_FEATURE was added in:
>=20
> commit e97d152ca13556b41a236c1a4cfb11e77ff857d7
> Author: Kristof Robot <krirobo@gmail.com>
> Date:   Sun Jan 26 10:03:56 2014 +0100
>=20
>    Add Cortex A7 support for NEONv2 & FPv4
>=20
> So you should probably ask Kristof or Andre why they didn't include =
vfp
> as well. I'm just trying to fix missing -mfloat-abi=3Dhard when =
switching from
> vfp to vfpv4.

This needs to be fixed in essence first then your patch won=E2=80=99t be =
required.

>=20
> Regards,
>=20
>> On Oct 19, 2015 11:03 AM, "Martin Jansa" <martin.jansa@gmail.com> =
wrote:
>>=20
>>> * without this change it wasn't possible to use call-convention hard
>>>  together with vfpv4
>>> * also use ' inside quoted values
>>>=20
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>> meta/conf/machine/include/arm/feature-arm-vfp.inc | 9 +++++----
>>> 1 file changed, 5 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc
>>> b/meta/conf/machine/include/arm/feature-arm-vfp.inc
>>> index 13927ff..440950a 100644
>>> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
>>> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
>>> @@ -1,9 +1,10 @@
>>> TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
>>> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp", =
"-vfp", ""
>>> ,d)}"
>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', =
'-vfp', ''
>>> ,d)}"
>>>=20
>>> TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) =
unit."
>>> -ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfpv4",
>>> "-vfpv4", "" ,d)}"
>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4',
>>> '-vfpv4', '' ,d)}"
>>>=20
>>> TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call =
convention,
>>> requires VFP."
>>> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "vfp",
>>> bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "
>>> -mfloat-abi=3Dhard", " -mfloat-abi=3Dsoftfp", d), "" ,d)}"
>>> -ARMPKGSFX_EABI .=3D "${@bb.utils.contains("TUNE_FEATURES", [
>>> "callconvention-hard", "vfp" ], "hf", "", d)}"
>>> +TUNE_CCARGS .=3D "${@bb.utils.contains_any('TUNE_FEATURES', [ =
'vfp',
>>> 'vfpv4' ], bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', =
'
>>> -mfloat-abi=3Dhard', ' -mfloat-abi=3Dsoftfp', d), '' ,d)}"
>>> +ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [
>>> 'callconvention-hard', 'vfp' ], 'hf', '', d)}"
>>> +ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [
>>> 'callconvention-hard', 'vfpv4' ], 'hf', '', d)}"
>>> --
>>> 2.6.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>=20
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


--Apple-Mail=_95EEF74F-FA72-4D60-9850-C4FAA2305624
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYlV28ACgkQuwUzVZGdMxSX8wCbBV35Kj1BpaP2/VcpkLOXhZJN
XYwAnj5ayvQmDaoE008LPJ0s09VpdUyd
=QfwM
-----END PGP SIGNATURE-----

--Apple-Mail=_95EEF74F-FA72-4D60-9850-C4FAA2305624--
