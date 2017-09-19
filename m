Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB26780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 11:26:34 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id s62so2247796ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 04:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kFOksexhHs3nmgPi0fjhlcb0hWTusAnhrWmI2L3S63c=;
	b=MttLqyW62E4YBgx1uFz7NlTFF35OyCrtXdnFhDQCHDwvc/dNJc3Uvzeai7Fq6UdAFI
	5+QK1hmsZWyGSg5ZwmkZ34arC4nKX9S6Y3sTE55cdrlHhNaToSQ0mtyXCUmqdZBCnr0d
	0cRCbjHikCZb4txom//0l2vPAYwDS/i2oh3Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kFOksexhHs3nmgPi0fjhlcb0hWTusAnhrWmI2L3S63c=;
	b=qPevTnwTfPXa7tGRMDppoEWCQ4tyfsNsLyGokNylyudCmmSJBQDqVK4Pg1XL/ZUzP5
	TV+1Q4uaBGBHzdE3Couw6Xd1J/mObKoWhLENR7Y49k4mtewxLSLVyK6lpQ9KnHfegpLo
	zCPBuByH6zetq2yRxxa4b3eJvS7Liu1/R4sXTEJOp57e3UcsYYV9ldBOqBupRVCSfof6
	S/MEARa43npJiWFsGaH5DuTYbz4BPJt0yytNbvFKUX8HzwC3l536Lb+l0wUfFqmgJTs7
	dQRmfbepQpxuwDdZMo3LUWsB3HuDn8fS+9riXXLnXNGzm7T19bwNX2ffdOcI0R2bsucR
	TniA==
X-Gm-Message-State: AHPjjUjxA7odRZHtLY12sGa/lEy/j183VlCOZ/Hk5JQQz9ISsziHTQOc
	9K6vnJoErF+EtYbjkW3nxCmMGQ==
X-Google-Smtp-Source: AOwi7QBzRSnRpMdlvcV7iytMH7WewZA2NEdtrMbqOk16YqDqHCsBn1yIowdd6DCVQxiTUR9Izaq4Xw==
X-Received: by 10.129.49.75 with SMTP id x72mr640117ywx.252.1505820396010;
	Tue, 19 Sep 2017 04:26:36 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	f184sm3885214ywc.19.2017.09.19.04.26.34
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 04:26:35 -0700 (PDT)
Date: Tue, 19 Sep 2017 07:26:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20170919112634.GL17137@bill-the-cat>
References: <20170919054058.20380-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20170919054058.20380-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: marek.vasut@gmail.com,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Fix cross and target builds
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
X-List-Received-Date: Tue, 19 Sep 2017 11:26:35 -0000
X-Groupsio-MsgNum: 103124
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhAUiXSLan16V5i8"
Content-Disposition: inline

--nhAUiXSLan16V5i8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2017 at 02:40:58AM -0300, Otavio Salvador wrote:
>  - The environment tools target has change to envtools;
>  - The HOSTCC variable must be used to set CC for cross;
>  - The ARCH variable must be set for cross;
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb b/meta/re=
cipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> index c2e8f0fb84..21ab5b3e6d 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> @@ -5,13 +5,13 @@ DEPENDS =3D "mtd-utils"
> =20
>  INSANE_SKIP_${PN} =3D "already-stripped"
>  EXTRA_OEMAKE_class-target =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${=
CC} ${CFLAGS} ${LDFLAGS}" HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDF=
LAGS}" V=3D1'
> -EXTRA_OEMAKE_class-cross =3D 'ARCH=3D${TARGET_ARCH} CC=3D"${CC} ${CFLAGS=
} ${LDFLAGS}" V=3D1'
> +EXTRA_OEMAKE_class-cross =3D 'ARCH=3D${ARCH} HOSTCC=3D"${CC} ${CFLAGS} $=
{LDFLAGS}" V=3D0'

Since we're messing with this, U-Boot's build system doesn't take ARCH.
It's one of the variables that you pick in Kconfig, not set so that
arch/$(ARCH)/Kconfig is sourced.  We should drop that.  And the
changelog doesn't say you're going from V=3D1 to V=3D0.

--=20
Tom

--nhAUiXSLan16V5i8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZwP7qAAoJEIf59jXTHXZS+1oP/0h/c5RbwK8z/Fla8Yt1l34w
fy0A9mJgx4400LfKtg+43Y/LZzRfnY/+Ef/erFSbiJ5Xu0nojjpn3AJtJS7EgbR/
5QUWxrsmPRuZ2tOf4AVPu0Xrh+3nTKjUVt3EV4CEkcCa1YNIT/yGSTOOaBcy8DhD
H4C5JmT6BJwaGvytV+Nyp8T1mRPJ75NtC5RUGxWeY9IEYvCKRr7klykWH0jK3nQd
4KVBVQPZIzyu5JAMlzRetuwQoNp+/O2NAAe5Lco+75MgMb64g+UHkUL7+tfeEmIE
nefqZBckItPXkl4+o9IxR2PlS4zxd/lkb0jMg6AK2is93YuZ3JCtlLP+oyVgFHna
UTCjIlblMNVRtkRd394AJ+0wCayfSvbd6oVD36fAM0XjlbG/HM4zTAaTGtjYTqRP
TIpfREuTS7D3kEXmF4YpKsYnRXaT6UM1zsk4gXe2sHMwIPMqyCy1NeGUrxtunoVn
cNSCC4HmRDuqjvJzUbrELn4lxL1wrHXvt7tEf6XUfpIwEljr/fVOix9VWXxkgQJW
KxI/PUcDi+ncEwvSstuTcb2Pa4bLY4xzJUlRCXuFa8HP+Fotbd8NU61Cga9199n5
sTMlMEjIptaCGBeHHw2fgTGptXCiPgZH3Odi2x5peLls6DVu42NwDf3V8oqsJ4N8
pKG/ZNM+5rMUHGEhJiBz
=T+JD
-----END PGP SIGNATURE-----

--nhAUiXSLan16V5i8--
