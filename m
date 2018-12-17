Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id A6BF479CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 09:36:51 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id x85-v6so10362531ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 01:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=ifSHoFOQfuKZ9Q4+Fp6DrfL8avyUitK/GhRyS3OCRRQ=;
	b=NTm4giMEGst5L5vprokgfbMC9+CxlXDThTqgBqdUEfqX89r+NYE53DXvK81TgWsT7H
	VB+vwRS1oD8+V//YEfOfzxhYS0pIexT7YJzO5JlnnQ+FARQF5pfwns4N/DyzvdG3+pgc
	AvUHCDJFsRsE35hkeKcDkQcewGmt7FYyMswm689on2Q1oO0cKQ/7cuNM15j2C46WoY2H
	HjDcDgDbYJSGoevBsj5Xc+XAVpC0X010iKrpCnF4iPs9KiBM2BarwTsLq4JxTAdI5K+p
	vR1OhMg3egWyx3nv2NS71opIp/iY42rLSS5WpkV7ATsjBeel69TMu36AwJoSNK5uaVE+
	61bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=ifSHoFOQfuKZ9Q4+Fp6DrfL8avyUitK/GhRyS3OCRRQ=;
	b=R7W3dg0nC7TEgH1J5kZsyA1iAcbiMEiKNggfOAOp46vBVi/OMfz3orVLV0rp5ivF6N
	1Sx15Oz/JatuuUsj4HGiEfJbEQdwK9m3FMCIyL8qklTnlVsvxMbrO1ZUbBHNTcQ0X3TQ
	DRB9zsRw/v45Dos+kDSFaxDFiRFhqmDd/4+zMPf2ZLSRk7aVgPsBl0SQIXPn0kzGgnb+
	XhgTfigDv7sJwn0kl2hq/BU7/F1ghaz9J17uwLFZ2foHUSY7AsKJZu/z++EXhaDRuyLi
	SeBTR1iLnmk72/DQ2Y5JmYZykzTHp8yqluxRQ7Q3tCfw1a045SD9iCJ+D34BE95W+WmK
	JK9A==
X-Gm-Message-State: AA+aEWaq8ZUl4iFLg2mG/ntOhrj9/TbbPOSZ7kEr3msUuMNwpgbtwubt
	7PCrQmB9i1QQI4T/NGvgqr/SmvOE
X-Google-Smtp-Source: AFSGD/U+8SEQNah7pBiCu4toXMi4duvaqu25w9WGIVoohOF7pUU/IoNyi920KkiNfsZp7Qs4OSj42w==
X-Received: by 2002:a2e:9b84:: with SMTP id z4-v6mr6824431lji.93.1545039411775;
	Mon, 17 Dec 2018 01:36:51 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	y11-v6sm2453041ljc.85.2018.12.17.01.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 01:36:50 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-6-git-send-email-serhe.popovych@gmail.com>
	<CAMKF1spGeN_PxOKM5XC5CG6dPFSNv1H+OyDv2P9k6SoK6uAt5g@mail.gmail.com>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <40d476be-b97b-641a-f823-25c9a162324e@gmail.com>
Date: Mon, 17 Dec 2018 11:36:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:51.0) Gecko/20100101
	Firefox/51.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spGeN_PxOKM5XC5CG6dPFSNv1H+OyDv2P9k6SoK6uAt5g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/13] arch-powerpc64.inc: Use elfv2 ABI when building with musl
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
X-List-Received-Date: Mon, 17 Dec 2018 09:36:52 -0000
X-Groupsio-MsgNum: 119277
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ckLYfPTAMkWHLIGgMWd6nLLL0TLsPlI2y"

--ckLYfPTAMkWHLIGgMWd6nLLL0TLsPlI2y
Content-Type: multipart/mixed; boundary="aGu9JvypiX3Z0SLOiAzMHBmScjLi7eMTM";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <40d476be-b97b-641a-f823-25c9a162324e@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 05/13] arch-powerpc64.inc: Use elfv2
 ABI when building with musl
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
 <1544810082-22164-6-git-send-email-serhe.popovych@gmail.com>
 <CAMKF1spGeN_PxOKM5XC5CG6dPFSNv1H+OyDv2P9k6SoK6uAt5g@mail.gmail.com>
In-Reply-To: <CAMKF1spGeN_PxOKM5XC5CG6dPFSNv1H+OyDv2P9k6SoK6uAt5g@mail.gmail.com>

--aGu9JvypiX3Z0SLOiAzMHBmScjLi7eMTM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote:
> On Fri, Dec 14, 2018 at 9:56 AM Serhey Popovych
> <serhe.popovych@gmail.com> wrote:
>>
>> Historically first PowerPC ABI was big-endian only (elfv1 currently). =
It
>> is standard ABI for both 32-bit ppc and 64-bit ppc64 architectures.
>>
>> With PowerPC little-endian support new ABI was introduced (elfv2) and =
it
>> is used primarily with ppc64le target only. While it has support for
>> big-endian it is not commonly used and elfv1 still preferred.
>>
>> Musl does support only elfv2 ABI for both LE and BE and does not have
>> any plans to support elfv1.
>>
>> Since then to build for powerpc64 with musl new ABI should be used. As=

>> expected it is not compatible with elfv1 but that isn't problem as lon=
g
>> as there is no binary distributed software or assembly code written fo=
r
>> elfv1 ABI.
>>
>> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>> ---
>>  meta/conf/machine/include/powerpc/arch-powerpc64.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/me=
ta/conf/machine/include/powerpc/arch-powerpc64.inc
>> index f751c6b..d9916d4 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
>> @@ -7,6 +7,9 @@ TUNECONFLICTS[m64] =3D "m32 nf"
>>  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64=
', '', d)}"
>>  TUNE_ARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'pow=
erpc64', '', d)}"
>>
>> +# musl only supports elfv2 ABI for ppc64
>> +TUNE_CCARGS .=3D "${@['', ' -mabi=3Delfv2']['libc-musl' in d.getVar('=
OVERRIDES').split(':')]}"
>> +
>=20
> I wonder if we should change gcc to use this ABI by default when
> configured for ppc64/musl ?
> This would avoid us adding compiler options here, in bad cases it may
> be that other compilers
> call it out differently.

Good point. This should be easy to do with patch applied for libc-musl
override.

>=20
>>  # user mode qemu doesn't support ppc64
>>  MACHINE_FEATURES_BACKFILL_CONSIDERED_append =3D " ${@bb.utils.contain=
s('TUNE_FEATURES', 'm64', 'qemu-usermode', '', d)}"
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--aGu9JvypiX3Z0SLOiAzMHBmScjLi7eMTM--

--ckLYfPTAMkWHLIGgMWd6nLLL0TLsPlI2y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcF24xAAoJEBTawMmQ61bB3xsH/i/doFAAMOvs+yvUCGyuKii2
54nmS/nJrT80C/DqDe88VaPTzuIdaszlsWl0WF0rvNkZB9UY/QjcTeHo11rTlryP
jqD8wazHV9XF8pP/8D+HFCUh9jF77rga6ziO6H0zi5pBUKFmWThd2lWagrG85Ni+
WU4Jj6vKOLGT4kqGIZmPDy8rOuxA7455rz0QB6c6x+DDQnZhm2TzwdSxDW2q/2Ba
n1v68j6iXavf3ij7DTf8ftjoQ/YYgcm3gy4AR64JlIMShEFo6U5ZmNH17y1wsrTZ
t9dDo/E/Pk+AfNBNQLJAz5pMSsxt5Hdtq8NPDrQm00ALBf7e8mZlhZjsvE/5xhk=
=ayjN
-----END PGP SIGNATURE-----

--ckLYfPTAMkWHLIGgMWd6nLLL0TLsPlI2y--
