Return-Path: <paul.barker.ct@bp.renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DA6CF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 10:23:30 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web11.51475.1727691801369248125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 03:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.171, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="asc'?scan'208";a="220351619"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Sep 2024 19:23:19 +0900
Received: from [10.226.93.43] (unknown [10.226.93.43])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8445E4005649;
	Mon, 30 Sep 2024 19:23:06 +0900 (JST)
Message-ID: <0d659542-af68-4a8c-93bc-c0aedfd5fbe0@bp.renesas.com>
Date: Mon, 30 Sep 2024 11:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master/scarthgap PATCH] meta-ide-support: Mark recipe
 as MACHINE-specific
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
References: <20240905202102.565-1-paul.barker.ct@bp.renesas.com>
 <17F27A4142F288D2.30374@lists.openembedded.org>
 <fd756f4b5ce0b3b2dc38813469a0224047f99a09.camel@linuxfoundation.org>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <fd756f4b5ce0b3b2dc38813469a0224047f99a09.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------F3Y3UsbroZOxxnJ37v5L1rFY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 10:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205113

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------F3Y3UsbroZOxxnJ37v5L1rFY
Content-Type: multipart/mixed; boundary="------------806ImKlhkbpY7vzLabrIJX86";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Message-ID: <0d659542-af68-4a8c-93bc-c0aedfd5fbe0@bp.renesas.com>
Subject: Re: [OE-core] [master/scarthgap PATCH] meta-ide-support: Mark recipe
 as MACHINE-specific
References: <20240905202102.565-1-paul.barker.ct@bp.renesas.com>
 <17F27A4142F288D2.30374@lists.openembedded.org>
 <fd756f4b5ce0b3b2dc38813469a0224047f99a09.camel@linuxfoundation.org>
In-Reply-To: <fd756f4b5ce0b3b2dc38813469a0224047f99a09.camel@linuxfoundation.org>

--------------806ImKlhkbpY7vzLabrIJX86
Content-Type: multipart/mixed; boundary="------------45LCFCA85coOeHjl7D8041Ep"

--------------45LCFCA85coOeHjl7D8041Ep
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 06/09/2024 14:48, Richard Purdie wrote:
> On Thu, 2024-09-05 at 23:40 +0100, Richard Purdie via lists.openembedde=
d.org wrote:
>> On Thu, 2024-09-05 at 21:21 +0100, Paul Barker via lists.openembedded.=
org wrote:
>>> meta-ide-support:do_write_test_data dumps the bitbake data dictionary=
 to
>>> a file using export2json(). As this obviously includes the value of
>>> MACHINE, and other MACHINE-specific variables, the recipe needs to be=

>>> marked as MACHINE-specific.
>>>
>>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>>> ---
>>>  meta/recipes-core/meta/meta-ide-support.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipe=
s-core/meta/meta-ide-support.bb
>>> index d85aa120c08b..7ed422ce4ddb 100644
>>> --- a/meta/recipes-core/meta/meta-ide-support.bb
>>> +++ b/meta/recipes-core/meta/meta-ide-support.bb
>>> @@ -1,6 +1,7 @@
>>>  SUMMARY =3D "Integrated Development Environment support"
>>>  DESCRIPTION =3D "Meta package for ensuring the build directory conta=
ins all appropriate toolchain packages for using an IDE"
>>>  LICENSE =3D "MIT"
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> =20
>>>  DEPENDS =3D "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-=
helper-native unfs3-native cmake-native autoconf-native automake-native m=
eson-native intltool-native pkgconfig-native"
>>>  RM_WORK_EXCLUDE +=3D "${PN}"
>>
>> Something about this is making our toolchain tests unhappy, e.g.:
>>
>> https://valkyrie.yoctoproject.org/#/builders/42/builds/86/steps/12/log=
s/stdio
>>
>> I've not looked into it at all, just reporting what we've need to fix
>> in order to be able to consider merging this.
>=20
> It can be fixed with:
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/s=
elftest/cases/meta_ide.py
> index ffe0d2604d1..5a17ca52ea1 100644
> --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> @@ -20,8 +20,8 @@ class MetaIDE(OESelftestTestCase):
>          bitbake('meta-ide-support')
>          bitbake('build-sysroots -c build_native_sysroot')
>          bitbake('build-sysroots -c build_target_sysroot')
> -        bb_vars =3D get_bb_vars(['MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_I=
MAGE', 'COREBASE'])
> -        cls.environment_script =3D 'environment-setup-%s' % bb_vars['M=
ULTIMACH_TARGET_SYS']
> +        bb_vars =3D get_bb_vars(['MACHINE_ARCH', 'TARGET_VENDOR', 'TAR=
GET_OS', 'DEPLOY_DIR_IMAGE', 'COREBASE'])
> +        cls.environment_script =3D 'environment-setup-%s%s-%s' % (bb_v=
ars['MACHINE_ARCH'], bb_vars['TARGET_VENDOR'], bb_vars['TARGET_OS'])
>          cls.deploydir =3D bb_vars['DEPLOY_DIR_IMAGE']
>          cls.environment_script_path =3D '%s/%s' % (cls.deploydir, cls.=
environment_script)
>          cls.corebasedir =3D bb_vars['COREBASE']
>=20
> Whether that is a good/right fix, I'm not sure...
>=20
> Cheers,
>=20
> Richard
>=20

Hi Richard, Steve,

I see this has been committed as 3be2bc8a9b0c in openembedded-core [1]
for master/Styhead. Thanks for fixing the test case and merging this.

We saw the same issue when running yocto-check-layer in Scarthgap, do
you think this is suitable for backporting?

[1]: https://git.openembedded.org/openembedded-core/commit/?id=3D3be2bc8a=
9b0c9d6a178329c8b451a6bedf255d6c

Thanks,

--=20
Paul Barker
--------------45LCFCA85coOeHjl7D8041Ep
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------45LCFCA85coOeHjl7D8041Ep--

--------------806ImKlhkbpY7vzLabrIJX86--

--------------F3Y3UsbroZOxxnJ37v5L1rFY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZvp8CQUDAAAAAAAKCRDbaV4Vf/JGvR3Z
AP4pvTzqffznTu737pgJAcPo5p5p2k4+cBpDBL1AsUFe9gEA4JHqI/nz+UNDe44VnF05cMZKl9b7
6iQkf+mFxcLKYwM=
=JJg9
-----END PGP SIGNATURE-----

--------------F3Y3UsbroZOxxnJ37v5L1rFY--

