Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 74E6E73FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 01:56:23 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so34424267pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 18:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PItvEdWERdQ/fvYnEnLVhQU976yMPrdbgu8dPJbgESE=;
	b=IJmIlEACSjjWyu7qQ5XyKw+gMrMiLb1z/YWXKoAW6vP2jGWILr40E36p5X6R9iygQV
	c7g0xk0Ec2WlArsBqKQr766tbn7wkalORyFwxVt9CLfDzAmD+t0rVXTsGZ5z/WFD+FxT
	MgleKPAACkr5GwwFV31ymmj2NVpDAedEDkWuvYo2Mq3JpAa2AbYIPpGBd5kJOq8R/gOD
	/aAnRJcNQCkXiTRF9W2N/o2VTGE2Br2t7FN5vj3nmxwOicrYE+4dAKz5Mhb5EIZyp8vo
	3F7GlE1fhL59v7oP+BW3XjqENcpvYj8/Fk0j0rdTgoNiJNUkzquGL7wP+elZ+dO+6eM2
	PyxA==
X-Received: by 10.66.62.201 with SMTP id a9mr33158642pas.101.1431482184615;
	Tue, 12 May 2015 18:56:24 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:c57f:6cbc:3003:2f0a?
	([2601:9:3580:84c:c57f:6cbc:3003:2f0a])
	by mx.google.com with ESMTPSA id pc9sm17505847pdb.6.2015.05.12.18.56.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 18:56:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5552ACB3.8060805@windriver.com>
Date: Tue, 12 May 2015 18:56:18 -0700
Message-Id: <187E6A9D-C952-418F-81BE-76D2E08AFDC3@gmail.com>
References: <cover.1431411478.git.Qi.Chen@windriver.com>
	<3030d69a4aa172f6af394a142075414bba95e61d.1431411478.git.Qi.Chen@windriver.com>
	<6BA6B5A3-7785-4130-AE6E-42436EF2D8A3@gmail.com>
	<5552ACB3.8060805@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/2] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 13 May 2015 01:56:23 -0000
X-Groupsio-MsgNum: 65479
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C336900B-1FE5-4456-B78E-A5223F50DCB9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C336900B-1FE5-4456-B78E-A5223F50DCB9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On May 12, 2015, at 6:45 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>=20
> On 05/13/2015 12:19 AM, Khem Raj wrote:
>>> On May 11, 2015, at 11:19 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>>=20
>>> -	install =
${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PK=
GARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh =
${SDK_OUTPUT}/${SDKPATH}
>>> +	# find latest buildtools-tarball and install it
>>> +	buildtools_path=3D`ls -t1 =
${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PK=
GARCH}-buildtools-nativesdk-standalone-*.sh | head -n1`
>>> +	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
>>>=20
>> why not create a symink instead of poking using wild chars
>=20
> Because it's simpler.

what happens if I touch an older installer ?

>=20
> //Chen Qi


--Apple-Mail=_C336900B-1FE5-4456-B78E-A5223F50DCB9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVSr0YACgkQuwUzVZGdMxQ5jQCfVldjdVyFCmJsiO2IlOlJFy7/
UBoAnjkuNM7Of1p7hEJtaRoDjxCwEr8h
=N71I
-----END PGP SIGNATURE-----

--Apple-Mail=_C336900B-1FE5-4456-B78E-A5223F50DCB9--
