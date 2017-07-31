Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 658B1781FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 19:04:22 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q85so27217313pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=9/Leq33MSdei93zz4SU5REQ9qJLDl53Y1Iv/j/dj/UQ=;
	b=C2XxymL211mWlA7uAlhEC+Gj7cuMtthAKPbE26jaa8ioalB54w0cfk9rlYZIHOWiCJ
	Jfm0xSkiRsw//4AuVjhzDF3aKC1cvBwPJ7r/XXdwhs5VEoKJje5yBumG97wzYiO6CYlC
	35TAj6gEYnzVpjpkGITy0jlhNHrIlhs64CtxavF4+3FeKkFnwsNF9FME438S1N0rcXnT
	G/hPZEH/0BYTsXH/0eqh73UB0BMOpsEcy0zci5/uj1qZGjNRSXxVTLTJRmdX44+47W5v
	0eYUhsyrPhUk0AFM2fW1mZjtd7+TiL6CquBBNeA8pGjGQ3O0GCYMv7FFBgObh4cW1Rg/
	HHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=9/Leq33MSdei93zz4SU5REQ9qJLDl53Y1Iv/j/dj/UQ=;
	b=dZ+qhgofcl4JIkQYbNdLf3zAziSUvz1FZznLeotOkMY8HL8XYTzjS6iRTeoRJ+YXf0
	UdWWBBPJFiiNViF28tbAylTjBmXqQB6uXQf0QbvE7v2gp42S1iMRWoXrdwDiRlOxXyAA
	NNvzIQOL63c5QGZdVQ8qf/O/Gh4+Uy3bHb89MS1rI+U5R9GkomrDuXrLNSrUwtxd5SKg
	biikFV2t7noREeeuYisbthTQBIeLrKKfBAMfQLtxZ17QQHw2Vg1tCx5bLDMCmag/qKS8
	k4eVhROcDZNBrFUitzvxIZMxIYxgEs8hjz1ZAOCmCLQqCf91+q52eSGNbVgNav2fE/kt
	HTng==
X-Gm-Message-State: AIVw111lQUKzZ5OBXmOeA2pi2YjAE5/3TpBhP2XOouTxJpBd5xb1MHNt
	W4Kqea7oA0LxubMjrOc=
X-Received: by 10.99.134.194 with SMTP id x185mr16187191pgd.210.1501527863230; 
	Mon, 31 Jul 2017 12:04:23 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:30be:1361:6ee4:77cc])
	by smtp.gmail.com with ESMTPSA id
	c62sm37508738pfe.154.2017.07.31.12.04.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 12:04:22 -0700 (PDT)
To: Mark Hatle <mark.hatle@windriver.com>, akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
	<b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
	<1984b5e8-8d54-4f03-dcdb-b086605b4a91@gmail.com>
	<c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e0e65de3-e49a-b1af-9bd7-67a6d33ba859@gmail.com>
Date: Mon, 31 Jul 2017 12:04:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:55.0)
	Gecko/20100101 Thunderbird/55.0
MIME-Version: 1.0
In-Reply-To: <c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Mon, 31 Jul 2017 19:04:22 -0000
X-Groupsio-MsgNum: 100950
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="obGVh2d3bf9VOcJ48QelbAUVxCkkw1P9X"

--obGVh2d3bf9VOcJ48QelbAUVxCkkw1P9X
Content-Type: multipart/mixed; boundary="R9b7LEUIJt4CSOhoV4H2NMsJ8fKgmXaDp";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>, akuster808 <akuster808@gmail.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <e0e65de3-e49a-b1af-9bd7-67a6d33ba859@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] armv8: update to use armv8-a tune
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
 <1501521367-17192-2-git-send-email-akuster808@gmail.com>
 <b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
 <1984b5e8-8d54-4f03-dcdb-b086605b4a91@gmail.com>
 <c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>
In-Reply-To: <c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>

--R9b7LEUIJt4CSOhoV4H2NMsJ8fKgmXaDp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/31/17 10:51 AM, Mark Hatle wrote:
> On 7/31/17 12:40 PM, akuster808 wrote:
>>
>>
>> On 07/31/2017 10:31 AM, Mark Hatle wrote:
>>> On 7/31/17 12:16 PM, Armin Kuster wrote:
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  meta/conf/machine/include/arm/arch-armv8.inc | 25 +++++++++++++++++=
++++++++
>>>>  1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/con=
f/machine/include/arm/arch-armv8.inc
>>>> index 5e832fa..dc1ba5e 100644
>>>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>>>> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
>>>> @@ -1 +1,26 @@
>>>> +DEFAULTTUNE ?=3D "armv8-a"
>>> do we want the '-a'?  The other arm (7) are of the format armv7a (no =
'-').
>> works for me either way.
>>
>> While we are at it. How would we want =E2=80=98armv8.1-a=E2=80=99, =E2=
=80=98armv8.2-a=E2=80=99, =E2=80=98armv8.3-a'
>> formated as?
>=20
> My preference is to drop the '-'.  As for the '.', I'm not sure.. not s=
omething
> we've run across before.
>=20
> We could just drop it (the '.'), but it really depends on if armv81a wo=
uld
> confuse someone (familiar with arm) or not.

I would suggest to also sync  with other distros and ensure that we dont
do something different. Its very costly later. Since applications get
ported to most common combination

>=20
> --Mark
>=20
>> - armin
>>>
>>> --Mark
>>>
>>>> +
>>>> +TUNEVALID[armv8-a] =3D "Enable instructions for ARMv8-a"
>>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-a', =
' -march=3Darmv8-a', '', d)}"
>>>> +
>>>> +TUNEVALID[crypto] =3D "Enable crypto instructions for ARMv8-a"
>>>> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '=
+crypto', '', d)}"
>>>> +
>>>> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8=
-a', 'armv8a:', '' ,d)}"
>>>> +
>>>>  require conf/machine/include/arm/arch-arm64.inc
>>>> +
>>>> +AVAILTUNES +=3D "armv8-a armv8-a-crypto"
>>>> +ARMPKGARCH_tune-armv8-a ?=3D "armv8-a"
>>>> +
>>>> +# Enable Crypto extension. This also enables Advanced SIMD and floa=
ting-point instructions
>>>> +ARMPKGARCH_tune-armv8-a-crypto ?=3D "armv8-a"
>>>> +
>>>> +TUNE_FEATURES_tune-armv8-a =3D "aarch64 armv8-a"
>>>> +TUNE_FEATURES_tune-armv8-a-crypto =3D "${TUNE_FEATURES_tune-armv8-a=
} crypto"
>>>> +
>>>> +PACKAGE_EXTRA_ARCHS_tune-armv8-a =3D "aarch64 armv8-a"
>>>> +PACKAGE_EXTRA_ARCHS_tune-armv8-a-crypto =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8-a} armv8-a-crypto"
>>>> +
>>>> +BASE_LIB_tune-armv8-a =3D "${BASE_LIB_tune-aarch64}"
>>>> +BASE_LIB_tune-armv8-a-crypto =3D "${BASE_LIB_tune-aarch64}"
>>>>
>>
>=20


--R9b7LEUIJt4CSOhoV4H2NMsJ8fKgmXaDp--

--obGVh2d3bf9VOcJ48QelbAUVxCkkw1P9X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAll/fzQACgkQuwUzVZGdMxS1/QCfYVSDhM+6aa7cTe1xMaOpJQRn
69AAn3lQAn9F629xjWF1feZ/KHZYyGxq
=TCPL
-----END PGP SIGNATURE-----

--obGVh2d3bf9VOcJ48QelbAUVxCkkw1P9X--
