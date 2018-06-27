Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id C81C865CE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 05:13:42 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id n84-v6so686841oib.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 22:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=14LlD+hS5TwWGE978AlcPc3Yq08Lmf9UA7xcosPFQQY=;
	b=uoIu+5XQ/ysYa23Xhi4tAkKfCynp/mgsXJfMKubiBkWb8Uka+KQ3xGOlKCetgUNQxP
	2RNL5GKxq/EtLhEXo5kXjMqodCouqpyG8NcBWAS0mC+jj0UKIVD/JGUfiTT2CE6MukJo
	wy99iVk2abw0PFSYr5RHueBYQC8X+BrShRwx4MGlCGU+is09h5uVVssxKYlfVNuFYbfE
	nw+gxUKCsVquX4NSRi7ClQK1sfLNsQMYBFzThDsOigs/8R2nptSLciqoJy7aqj6KD/m+
	9XSvXme+k6J8Os42bW5BN224T4mPPRPpgIfJOvbhqon73P9iwioT9pTKAAmfyAfxzOMb
	Jy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=14LlD+hS5TwWGE978AlcPc3Yq08Lmf9UA7xcosPFQQY=;
	b=ZyAvVcBeSQUxDQjhJC6ZAFjpbBhoEQ8jZzzGO2aA1O9isIRFunOA1OYfrO5rGa/tA6
	V0bbHuIzh5+nje4mkroOtq7ODvUQW/s2TFcQvMZ3OYg2S8vEOOArzXCfxDo5T7wRuUGQ
	k5RC7GimOgRfU6bGVW+4uzyxHcR8obTT/VREp2oJS7WDTqnwdfO8HaUx9lzf8s8Ni67z
	or82VNVQ3Pz7k1EJKNCB5SqnsqrZwnQpcYJafKWWme9TroTPSrUpWg6iFbjkSJw+vvop
	f9Rx0j9gCCCg6ofeRTy/0i3xMIijlcor5iCebocfeDRAciCH7ENPhX2DQulYu+ryTwQO
	KoAQ==
X-Gm-Message-State: APt69E2k58HNHKAuxZrq0UhyrEgV5mOfNV4IZT0rGrM5AjYfEDtAF+Z9
	SWCbejbwg69p8GHHqmNfLHNpYOXo
X-Google-Smtp-Source: AAOMgpesSWxaG/OzbhLuBk1fAUYzQFBjrfhp96NtU8vNnU0d1UpwZtKkKXFxpHp3gAmcy2Iy+tNTPg==
X-Received: by 2002:aca:1310:: with SMTP id
	e16-v6mr2320194oii.33.1530076423306; 
	Tue, 26 Jun 2018 22:13:43 -0700 (PDT)
Received: from [192.168.102.35] ([12.12.162.226])
	by smtp.gmail.com with ESMTPSA id
	w10-v6sm1688415oif.41.2018.06.26.22.13.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 22:13:42 -0700 (PDT)
To: Randy Li <ayaka@soulik.info>, openembedded-core@lists.openembedded.org
References: <20180615032226.9899-1-ayaka@soulik.info>
	<20180615032226.9899-2-ayaka@soulik.info>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <3ba4cfab-02b1-ec06-8af1-acbc4b53aa85@gmail.com>
Date: Tue, 26 Jun 2018 22:13:28 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180615032226.9899-2-ayaka@soulik.info>
Subject: Re: [PATCH v3 1/5] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Wed, 27 Jun 2018 05:13:43 -0000
X-Groupsio-MsgNum: 112965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="45DGuE17nKQJwaRdK8Hh9zXPjKHknYFVI"

--45DGuE17nKQJwaRdK8Hh9zXPjKHknYFVI
Content-Type: multipart/mixed; boundary="3zbaqpT0t2Xyjl0Jio3eHBu6aV0mQfN75";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Randy Li <ayaka@soulik.info>, openembedded-core@lists.openembedded.org
Message-ID: <3ba4cfab-02b1-ec06-8af1-acbc4b53aa85@gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/5] arch-armv8a.inc: add tune include for
 armv8
References: <20180615032226.9899-1-ayaka@soulik.info>
 <20180615032226.9899-2-ayaka@soulik.info>
In-Reply-To: <20180615032226.9899-2-ayaka@soulik.info>

--3zbaqpT0t2Xyjl0Jio3eHBu6aV0mQfN75
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/14/18 8:22 PM, Randy Li wrote:
> There are some addtional instructions apart from bare armv8,
> also there is armv8.1, armv8.2.
>=20
> Most the processor would support crc, except X-gene 1.

I have a concern with this approach, since its mirroring the prior arm
art, I think for v8 it would be better to consolidate it around ISA defs

e.g. armv8.4-a, armv8.3-a, armv8.2-a and armv8.1-a and so on.

Moreover current approach is only considering a subset of aarch64
feature modifiers, if we want to go this route we should consider them
all as listed here

https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html#aarch64-feature-m=
odifiers

if there is one outlier then its better to address that in machine or
soc config instead.

>=20
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
>  meta/conf/machine/include/arm/arch-armv8a.inc | 28 +++++++++++++++++++=
++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>=20
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/m=
achine/include/arm/arch-armv8.inc
> deleted file mode 100644
> index 5e832fae6d..0000000000
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ /dev/null
> @@ -1 +0,0 @@
> -require conf/machine/include/arm/arch-arm64.inc
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/=
machine/include/arm/arch-armv8a.inc
> new file mode 100644
> index 0000000000..323d0d7f0f
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -0,0 +1,28 @@
> +DEFAULTTUNE ?=3D "armv8a-crc"
> +
> +TUNEVALID[armv8a] =3D "Enable instructions for ARMv8-a"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', ' -m=
arch=3Darmv8-a', '', d)}"
> +TUNEVALID[simd] =3D "Enable instructions for ARMv8-a Advanced SIMD and=
 floating-point"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd=
', '', d)}"
> +TUNEVALID[crc] =3D "Enable instructions for ARMv8-a Cyclic Redundancy =
Check (CRC)"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc',=
 '', d)}"
> +TUNEVALID[crypto] =3D "Enable instructions for ARMv8-a cryptographic"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+cr=
ypto', '', d)}"
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a',=
 'armv8a:', '' ,d)}"
> +
> +require conf/machine/include/arm/arch-arm64.inc
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "armv8a armv8a-crc armv8a-crc-crypto armv8a-crypto"
> +ARMPKGARCH_tune-armv8a                    ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crypto             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-crypto         ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8a                  =3D "aarch64 armv8a simd"
> +TUNE_FEATURES_tune-armv8a-crc              =3D "${TUNE_FEATURES_tune-a=
rmv8a} crc"
> +TUNE_FEATURES_tune-armv8a-crypto           =3D "${TUNE_FEATURES_tune-a=
rmv8a} crypto"
> +TUNE_FEATURES_tune-armv8a-crc-crypto       =3D "${TUNE_FEATURES_tune-a=
rmv8a-crc} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a            =3D "aarch64 armv8a simd"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8a-crc} crypto"
>=20



--3zbaqpT0t2Xyjl0Jio3eHBu6aV0mQfN75--

--45DGuE17nKQJwaRdK8Hh9zXPjKHknYFVI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWzMc/gAKCRC7BTNVkZ0z
FBmLAJ42WAyi4rAWuIAUycr7vyJFT3Au5wCeOAyyT1AOqwDcFmkCTPVF1YhyCWw=
=YJSI
-----END PGP SIGNATURE-----

--45DGuE17nKQJwaRdK8Hh9zXPjKHknYFVI--
