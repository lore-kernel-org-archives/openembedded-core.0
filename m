Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 21FD160053
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 00:43:38 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n85so21342464pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 16:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=1r59EN+aKiL0LLmVx2s2CMzHjwdlakslknQvxB2C/H4=;
	b=wCDNqq0l1KbqIqsGHdNZIjANn1SF69sNLl8o3wT3XOQF6G4jf0eMD4Hc6+eKh6YiGh
	MiBZY5PcuT6AMxZMKpkrlDl2gcldfrFPf8lXX6NQ9pEECh3tsn726UJvQe9CQNEFWCOT
	olukHlgXoxZDOM57k7cUIevI7vdw5wvQhpaBwkKA4wJj5ZXv8IIHgCENaKkolEP5uT9b
	kSM1VoRelgsnPjFbA6CXKUiaIT76bsTyCHGNPg2kvg8I0C0S1LCVhVQduLcLvQbxtM/+
	Ah1x7alkJu7lIBgm9DwxMpK5hVSbPrFN7RYJmE8aM/gsDM9lUkYImnX2l/UkhsN7RdiP
	A1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=1r59EN+aKiL0LLmVx2s2CMzHjwdlakslknQvxB2C/H4=;
	b=mml6V2tTz2lUGugkkMNXCsQiP7AB3zMqSs9YsDjiopFQmX+30qxgwh9HbmJZWymWHr
	O0RE/nyR80qNOXzf8OENo8RnDelYWr5nlQWlXgmqFJC7p3MkW8xGJcBhDny/zzLvRSbc
	0/00G8p2BGEZsAsAbDaaxhdhLYNKF6FDi8RzIGUFyvK9M1b6MtqXbcodZ9jqchiKE1Jl
	JjIs9UFRwywJ1hg2uZVGcCmaWb4s04A4d0QdOvQodS9QdnI64knfp66jBBZvG+XbpbW1
	1qmpZvXMtfFuowHCpWkapgYYD9qiOwp4/j8Y+5Et3l78rpW+bRfU/b0blxoOGvVC8krw
	6WQw==
X-Gm-Message-State: ABUngvei0RgSYDqAI6L/JzHtBUEzfodlbiyjjBlFOwkznvqOAavQZelW8G1WA8P5yW6vgQ==
X-Received: by 10.99.106.200 with SMTP id f191mr22741850pgc.143.1478652220152; 
	Tue, 08 Nov 2016 16:43:40 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8af:972a:9de4:9514])
	by smtp.gmail.com with ESMTPSA id
	r77sm50655947pfa.85.2016.11.08.16.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 16:43:39 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>, Marek Vasut <marex@denx.de>
References: <20161107182006.4207-1-marex@denx.de>
	<CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <03d91527-2e2f-0694-8339-22fe7158880e@gmail.com>
Date: Tue, 8 Nov 2016 16:43:32 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Wed, 09 Nov 2016 00:43:39 -0000
X-Groupsio-MsgNum: 89176
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="CFfkqS14tjbCRmB6bMf4DHEu9SUOch4NI"

--CFfkqS14tjbCRmB6bMf4DHEu9SUOch4NI
Content-Type: multipart/mixed; boundary="U1HghbstbSi1VSRnoelkMBRu42dAu3jJc";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <03d91527-2e2f-0694-8339-22fe7158880e@gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
References: <20161107182006.4207-1-marex@denx.de>
 <CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>

--U1HghbstbSi1VSRnoelkMBRu42dAu3jJc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/8/16 4:15 PM, Burton, Ross wrote:
>=20
> On 7 November 2016 at 18:20, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
>=20
>     -EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D"${TARGET_PREFIX}" CC=3D"${CC} $=
{CFLAGS}
>     ${LDFLAGS}" STRIP=3Dtrue V=3D1'
>     +EXTRA_OEMAKE =3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LD=
FLAGS}"'
>     +EXTRA_OEMAKE_append_class-target =3D 'CROSS_COMPILE=3D"${TARGET_PR=
EFIX}"
>     CC=3D"${CC} ${CFLAGS} ${LDFLAGS}" STRIP=3Dtrue V=3D1'
>     +EXTRA_OEMAKE_append_class-native =3D 'CC=3D"${BUILD_CC} ${BUILD_CF=
LAGS}
>     ${BUILD_LDFLAGS}" STRIP=3Dtrue V=3D1'
>     +EXTRA_OEMAKE_append_class-nativesdk =3D 'CC=3D"${BUILD_CC} ${BUILD=
_CFLAGS}
>     ${BUILD_LDFLAGS}" STRIP=3Dtrue V=3D1'
>=20
>=20
> You're going to start hating u-boot...
>=20
> Fails on the autobuilder if you're building for a 32-bit x86 target on =
a
> 64-bit x86 host:
>=20
> ERROR: QA Issue: Architecture did not match (x86-64, expected x86) on
> /work/i586-poky-linux-musl/u-boot-mkimage/1_2016.09.01-r0/packages-spli=
t/u-boot-mkimage/usr/bin/uboot-mkimage
> [arch]
>=20
> I'm guessing that it is using the host compiler instead of the cross co=
mpiler.

isnt mkimage a host tool ? why are we building it for target ?

>=20
> Ross
>=20
>=20


--U1HghbstbSi1VSRnoelkMBRu42dAu3jJc--

--CFfkqS14tjbCRmB6bMf4DHEu9SUOch4NI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgicToACgkQuwUzVZGdMxQkxQCfQCNr8fmRWkCjIW0P2wlrifiA
DXEAnRf1WKOeNSWI0AbGDdiDN7rtBttn
=ZurY
-----END PGP SIGNATURE-----

--CFfkqS14tjbCRmB6bMf4DHEu9SUOch4NI--
