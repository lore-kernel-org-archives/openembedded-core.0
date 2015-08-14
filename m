Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAE876714
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 07:04:23 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so54024906pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 00:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=G6g4x9F7S1O+1ixADVHw3Ua5w15dCX0WINrqwoxKuZE=;
	b=QptYh85S44H1av66ltp5fsx5MbSuEmxF9+zW5XhMk0vq4Rr72yzDT38r/uFT1jGKJd
	uJrG+41JjMJzqjUqeyeiMaIQqusQvP7VGg6QvNZzRSAbIsDWP6shxrv0eRWlM6hGt1nj
	Z28u1G6j+Lqrjj4KipjHX3GdDqR52gH7FVXpkU/5iseqyt8rH1s+ZL8TIcTVZWOsVtcp
	GXoae2f6mn/o18up4O/ktlFPjx8+ixhplUigYz8tNj4YFrfeVfygsQxwQrHOY4SIzInr
	WHUouL6l7OwG4rF2hOfGHyjvOnc1bufhtMXLRJwasJVpvt+cVqWHE4x8dIDT3t48WbFN
	v5PQ==
X-Received: by 10.68.243.103 with SMTP id wx7mr37673460pbc.60.1439535863740;
	Fri, 14 Aug 2015 00:04:23 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:7d4a:3993:27b2:859?
	([2601:646:8601:4580:7d4a:3993:27b2:859])
	by smtp.gmail.com with ESMTPSA id
	de2sm4870042pdb.15.2015.08.14.00.04.22
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Aug 2015 00:04:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <556ECBFD.5020203@denx.de>
Date: Fri, 14 Aug 2015 00:04:17 -0700
Message-Id: <D05B5C6B-063B-43BA-B7BE-6D712238C1D9@gmail.com>
References: <556ECBFD.5020203@denx.de>
To: Stefano Babic <sbabic@denx.de>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ICU not working on powerpc (ppce500v2)
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
X-List-Received-Date: Fri, 14 Aug 2015 07:04:24 -0000
X-Groupsio-MsgNum: 69415
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BA516877-00A5-42D7-8FAE-0E16A7FD6085";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BA516877-00A5-42D7-8FAE-0E16A7FD6085
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 3, 2015, at 2:42 AM, Stefano Babic <sbabic@denx.de> wrote:
>=20
> Hi,
>=20
> I get an issue with icu (54.1, I am testing with Yocto-fido) on powepc
> (I am testing with a p2020rdb from Freescale). Running icuinfo on =
target
> I get:
>=20
> <icuSystemParams type=3D"icu4c">
>    <param name=3D"copyright"> Copyright (C) 2014, International =
Business
> Machines Corporation and others. All Rights Reserved. </param>
>    <param name=3D"product">icu4c</param>
>    <param name=3D"product.full">International Components for Unicode =
for
> C/C++</param>
>    <param name=3D"version">54.1</param>
>    <param name=3D"version.unicode">7.0</param>
>    <param name=3D"platform.number">4000</param>
>    <param name=3D"platform.type">Linux</param>
>    <param name=3D"locale.default">en_US_POSIX</param>
>    <param name=3D"locale.default.bcp47">en-US-u-va-posix</param>
>    <param name=3D"converter.default">US-ASCII</param>
>    <param name=3D"icudata.name">icudt54b</param>
>    <param name=3D"icudata.path"></param>
>  <!-- n=3D"cldr.version" ERROR: U_MISSING_RESOURCE_ERROR -->
>  <!-- n=3D"tz.version" ERROR: U_MISSING_RESOURCE_ERROR -->
>    <param name=3D"tz.default">Universal</param>
>    <param name=3D"cpu.bits">32</param>
>    <param name=3D"cpu.big_endian">1</param>
>    <param name=3D"os.wchar_width">4</param>
>    <param name=3D"os.charset_family">0</param>
>    <param name=3D"os.host">powerpc-unknown-linux-gnuspe</param>
>    <param name=3D"build.build">x86_64-pc-linux-gnu</param>
>    <param name=3D"build.cc">powerpc-linux-gnuspe-gcc -m32 -mcpu=3D8548
> -mabi=3Dspe -mspe -mfloat-gprs=3Ddouble
> =
--sysroot=3D/opt/work/sbabic/eldk/p2020rdb/tmp/sysroots/generic-powerpc-e5=
00v2</param>
>    <param name=3D"build.cxx">powerpc-linux-gnuspe-g++ -m32 -mcpu=3D8548
> -mabi=3Dspe -mspe -mfloat-gprs=3Ddouble
> =
--sysroot=3D/opt/work/sbabic/eldk/p2020rdb/tmp/sysroots/generic-powerpc-e5=
00v2</param>
>    <param name=3D"uconfig.internal_digitlist">1</param>
>    <param name=3D"uconfig.have_parseallinput">1</param>
>    <param name=3D"uconfig.format_fastpaths_49">1</param>
> </icuSystemParams>
>=20
>=20
> ICU Initialization returned: U_INVALID_FORMAT_ERROR
> Plugin file is: /usr/lib/icu/icuplugins54.txt
>=20
> cldr.version and tz.version report errors and even simple tests do not
> work. If I copy all .res files (icu54 directory) and then I set =
ICU_DATA
> to that directory, it works - that means there should be an issue by
> generating libicudata with PowerPc, or at least with e500v2.
>=20
> I did exactly the same tests with an ARM platform (i.MX6), everything
> works as expected. I suspect some issue due to endianess, but checking
> the header in the libicudata it looks correct ( at least the first =
bytes).

I think this is right line to follow, difference it that this ppc config =
is big endian
check the .dat files which eventually fold into the .so they should have =
big endian format
if they don=E2=80=99t then you can regenerate them using icupkg -tb, it =
might be that building the datafiles
in cross environment is not working.

>=20
> I saw :
>=20
> commit f5205c568cb0d29059c4d8c2dc200e435787f5d8
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sat Feb 15 22:04:05 2014 +0000
>=20
>    icu: Disable the default LDFLAGSICUDT for target compile
>=20
>=20
> and, as it looks like ARM related, I have already tried to revert it,
> without any success. Does anyone have a hint ?
>=20
> Best regards,
> Stefano Babic
>=20
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_BA516877-00A5-42D7-8FAE-0E16A7FD6085
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXNkvUACgkQuwUzVZGdMxRaLwCdEtN96GMAOBxhpCZdvi+dfCIc
j1sAn2aBecM7PkNUYVAb8TvIJU7GCATM
=h9cx
-----END PGP SIGNATURE-----

--Apple-Mail=_BA516877-00A5-42D7-8FAE-0E16A7FD6085--
