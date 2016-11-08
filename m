Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7721A6093D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:44:47 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so20344239pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 09:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=1MgSDREbZD8DKk+IQrwyVPSKQ/IplTq7OiA10FePZQY=;
	b=dgJvZ7pyP/GG36unTEIcYAXPpZthXTwzNOVeFRUdxPyyDiinx628IW2NW1fs/RXadN
	gLCarlvtzYuw/0aSMpdGmZW6zGsB54tWUmpH+cKmdDXoFscAExTNS3EfexcdQIpNISpb
	YKP7kTqQDFK9ik9oB1Z66OgOhQ7NJYVN6kx0ws/QnJr1SZdRoa3Xa6B0O0P6N37b7XJB
	0pmgoqOLgCpaudCXirwa1bKUlDWMeeLObUvcPwi8X44ir0pOtqpamAtQ/MDqTpH+08/q
	O2Z1dtKlQjpRbHlFp2Rkvu6mB4N3tmYkDKkmVkG4cfMDZvAk+pfQESlZ/YrAKkKIh5p4
	XBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=1MgSDREbZD8DKk+IQrwyVPSKQ/IplTq7OiA10FePZQY=;
	b=INLTl73/eXctSdMk36UG6/CA+Lk0jcfq7FrI3AiBbLQvmJs1jwU1QvRSTBn0T9ANVj
	TBOAU1ClcsG+d6Vvh0TYveTRk83wh0cUsCLQetednsYvSxCBYVJvERk23tO8PAQnbDht
	clhpqmeVFxYEgO219/QM5m4N6rH6iwNvE2eYTd55MR77QKSPaC17q9pPxQj57TTJDlUp
	9omz7z0Gbf39Cqvcjf2jCyVwelwOAuoO/GE0qDgah1O/SLECBAzngZYS+tBdJA8krMm2
	zSyT+HKKXl1Yy6xBCHpYfMmqUkLhtWOeROzJrPd8fPEVVT1i0KgqId1zrCtlYNgbhtQn
	Pyaw==
X-Gm-Message-State: ABUngvc3aRvpiSn/SuDQAxeyXYMP9i6Nx54JFfhS/p7AlRhSLS4IHZC5htUxSKO8Hv7PjA==
X-Received: by 10.99.115.16 with SMTP id o16mr20097581pgc.137.1478627088661;
	Tue, 08 Nov 2016 09:44:48 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8af:972a:9de4:9514])
	by smtp.gmail.com with ESMTPSA id
	h85sm49586693pfj.89.2016.11.08.09.44.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 09:44:48 -0800 (PST)
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	openembedded-core@lists.openembedded.org
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <af0a72f7-1591-2626-0c16-f2b85942e66a@gmail.com>
Date: Tue, 8 Nov 2016 09:44:43 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
Subject: Re: [Patch v2 00/14] MIPS: Use MACHINEOVERRIDES and reduce duplication
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
X-List-Received-Date: Tue, 08 Nov 2016 17:44:47 -0000
X-Groupsio-MsgNum: 89166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ipluiJ1O6ofhkqMpbxOuBxa5s70B3IKej"

--ipluiJ1O6ofhkqMpbxOuBxa5s70B3IKej
Content-Type: multipart/mixed; boundary="8CEWKXeKcLHHNEcnP6ikHe7hnvGqDNAL8";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <af0a72f7-1591-2626-0c16-f2b85942e66a@gmail.com>
Subject: Re: [OE-core] [OE-Core][Patch v2 00/14] MIPS: Use MACHINEOVERRIDES
 and reduce duplication
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
In-Reply-To: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>

--8CEWKXeKcLHHNEcnP6ikHe7hnvGqDNAL8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/8/16 9:12 AM, Zubair Lutfullah Kakakhel wrote:
> Hi,
>=20
> This patch series adds a few MACHINEOVERRIDES options in arch-mips
> to reduce duplicate configurations in various recipes.
>=20
> Further info in=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10404
>=20

This series looks good to me.
Thanks for doing this.

> Regards,
> ZubairLK
>=20
> V1 -> V2
> Added more options for endian independent and big/little endian
> Added another patch for o32 in TUNE_FEATURES for MIPS32R6.
>=20
> Zubair Lutfullah Kakakhel (14):
>   arch-mips: Add o32 in TUNE_FEATURES for MIPS32R6
>   arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
>   bitbake.conf: Reduce duplication in MIPS variants
>   fts: Reduce duplication in MIPS variants.
>   glibc: Reduce duplication in MIPS variants
>   packagegroup: Reduce duplication in MIPS variants.
>   gcc-runtime: Reduce duplication in MIPS variants.
>   gdb: Reduce duplication in MIPS variants.
>   mmc-utils: Reduce duplication in MIPS variants.
>   valgrind: Reduce duplication in MIPS variants.
>   ghostscript: Reduce duplication in MIPS variants.
>   ltp: Reduce duplication in MIPS variants.
>   mdadm: Reduce duplication in MIPS variants.
>   webkit: Reduce duplication in MIPS variants.
>=20
>  meta/conf/bitbake.conf                                  | 11 +--------=
--
>  meta/conf/machine/include/mips/README                   |  3 +++
>  meta/conf/machine/include/mips/arch-mips.inc            | 12 +++++++++=
+++
>  meta/conf/machine/include/tune-mips32r6.inc             |  8 ++++----
>  meta/recipes-core/fts/fts.bb                            |  5 +----
>  meta/recipes-core/glibc/glibc-ld.inc                    | 17 ++-------=
--------
>  .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  5 +----
>  .../packagegroups/packagegroup-core-tools-profile.bb    | 10 ++-------=
-
>  meta/recipes-devtools/gcc/gcc-runtime.inc               |  9 +--------=

>  meta/recipes-devtools/gdb/gdb-common.inc                |  7 +------
>  meta/recipes-devtools/mmc/mmc-utils_git.bb              |  4 ++--
>  meta/recipes-devtools/valgrind/valgrind_3.12.0.bb       |  3 +--
>  meta/recipes-extended/ghostscript/ghostscript_9.19.bb   |  3 +--
>  meta/recipes-extended/ltp/ltp_20160126.bb               |  2 +-
>  meta/recipes-extended/mdadm/mdadm_3.4.bb                |  4 ++--
>  meta/recipes-sato/webkit/webkitgtk_2.14.1.bb            |  3 +--
>  16 files changed, 36 insertions(+), 70 deletions(-)
>=20


--8CEWKXeKcLHHNEcnP6ikHe7hnvGqDNAL8--

--ipluiJ1O6ofhkqMpbxOuBxa5s70B3IKej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgiDw8ACgkQuwUzVZGdMxRhCwCdHxSPL/GWi1CN7bmF/AcE4+Od
UowAn0trELUZDkDDCXCbAL4xdJLc3o7f
=5l9y
-----END PGP SIGNATURE-----

--ipluiJ1O6ofhkqMpbxOuBxa5s70B3IKej--
