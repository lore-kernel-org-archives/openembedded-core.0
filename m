Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 53D2C65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:50:07 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so26171598pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qNnRZPkP9lJN1m5i3d7GmrP7f5d0JaN2+YR5t4XB6Yw=;
	b=yxxu+0sb1okvot8oBKAItSsVV0WgbZkrkG2Dfy9hlWzmS9vI9mmjHSSA5+9QaVukn4
	knxgGVWTIbYc5JpWqg92swys8tVfV5wkrqkjVkSG2Uv8x51stqAQXXObEGetFcsXUwOU
	dZScwUxeu0xMzc71hZGmcZN8V4Clu3EZ2kEU2Dh4VLpOiT17JkTsQ8QzpaFpChjf8qit
	r+grHWXO5rXeboN0VmS+NEU7opbdFw9JTrJXHzgPUoXrUI1XwW+fHS9c2GiSbGu/klce
	0/l/izgiIbRxP1IoR3zgrdGBBsyVzx+skikly4MpZsf9W8xfipha7D+Xs+mVu9DbtWWS
	Eg8w==
X-Received: by 10.68.228.101 with SMTP id sh5mr29797449pbc.157.1444755007862; 
	Tue, 13 Oct 2015 09:50:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f002:9d80:e725:c0fd?
	([2601:646:8601:4580:f002:9d80:e725:c0fd])
	by smtp.gmail.com with ESMTPSA id
	qy7sm4839149pab.37.2015.10.13.09.50.06
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Oct 2015 09:50:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrCcmX=4bHACTyGpF9BNivvDcBEieTyOcbChHdZr67pkA@mail.gmail.com>
Date: Tue, 13 Oct 2015 09:49:55 -0700
Message-Id: <669CD3FB-176B-4FA7-A944-5C96F19FB381@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
	<32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
	<6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
	<CAMKF1sreATF=J9rh-dK5fbsJt9szaJTmNyOOHg1gC+mVGNBZyg@mail.gmail.com>
	<B1E843F8-C2B2-403A-87E4-1D8AD3E13C63@gmail.com>
	<CAP9ODKrCcmX=4bHACTyGpF9BNivvDcBEieTyOcbChHdZr67pkA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.3096.1)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Tue, 13 Oct 2015 16:50:08 -0000
X-Groupsio-MsgNum: 72125
Content-Type: multipart/signed;
	boundary="Apple-Mail=_43BFF38B-0905-4634-972F-1F5559236A1C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_43BFF38B-0905-4634-972F-1F5559236A1C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 13, 2015, at 4:45 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> Hello Jens and Khem,
>=20
> On Mon, Oct 12, 2015 at 2:54 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>> Am 12.10.2015 um 18:32 schrieb Khem Raj <raj.khem@gmail.com>:
>>> On Mon, Oct 12, 2015 at 9:01 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>> Am 08.10.2015 um 18:40 schrieb Khem Raj <raj.khem@gmail.com>:
>>>> [...]
>>>> During hacking on the fix in meta/conf/machine/ I recognized that =
the expected thump suffix in =
meta/conf/machine/include/tune-arm926ejs.inc
>>>> isn't there and modified the line as
>>>>=20
>>>> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc =
b/meta/conf/machine/include/tune-arm926ejs.inc
>>>> index 335e4e0..a310c9d 100644
>>>> --- a/meta/conf/machine/include/tune-arm926ejs.inc
>>>> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
>>>> @@ -8,4 +8,4 @@ TUNE_CCARGS .=3D =
"${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", " -mtune=3Darm9
>>>> AVAILTUNES +=3D "arm926ejs"
>>>> ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
>>>> TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} =
arm926ejs"
>>>> -PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
>>>> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste arm926ejse"
>>>>=20
>>>=20
>>> this is ok ?
>>=20
>> From
>>=20
>> TUNE_FEATURES=3D"${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
>>=20
>> is ok probably the wrong question ;)
>>=20
>> Setting DEFAULTTUNE to arm926ejs results in expanding PACKAGE_ARCH =
from TUNE_PKGARCH which is combined via
>> =
"${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGS=
FX_ENDIAN}${ARMPKGSFX_FPU}" in
>> meta/conf/machine/include/arm/arch-arm.inc:12
>>=20
>> Since ARMPKGSFX_THUMB is set to "t" (or "t2" on ARMv6+) only when =
thumb code should be generated and
>> ARMPKGSFX_DSP is set to "e" when DSP is featured, both have to be =
recognized.
>>=20
>> The entire construct doesn't feel "ok'ish" - but it works and is more =
or less reliable ...
>=20
> I understand Khem is excitant to include more non-upstreamed patches
> into GCC but I would prefer to have it included and Java working fine
> than a local patch applied forever. :-(

All I am asking is to open a bug with gcc. So to get some opinion on =
impact of patch, workaround of this nature can
be degarading code generation, we do not have any report on that. So =
that my concern was



--Apple-Mail=_43BFF38B-0905-4634-972F-1F5559236A1C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYdNj0ACgkQuwUzVZGdMxQ9lACePHqH1uRns4f/4IqS+bOEydqk
L8sAnRL6lGEX9DKicgkSALpI1anWyMBk
=ksEv
-----END PGP SIGNATURE-----

--Apple-Mail=_43BFF38B-0905-4634-972F-1F5559236A1C--
