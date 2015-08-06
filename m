Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5D14C734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 03:53:08 +0000 (UTC)
Received: by pabxd6 with SMTP id xd6so34152333pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 20:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6uKqapkJat7z9r5igC7ND8giND5JRSDpumAAbQt81xA=;
	b=G0/FXBIwyR3X2Ynug027KcBqbc+bbXVVY5wn1JcmxrJOAhZv73i7CJTU8oXaKvWNcZ
	OfjgJGPYTHA5GCPny6Z7sztcr712kdXgrG9GiqkyOD2z8qCsC5PIIH/Eu2rUEzW44vOE
	Rt8XeQNGjEt28A+J6LxKlTWWJKP4MQD5VhI8dcckwPNTZLOSPfDLG/ER3Q0llFXOo6i1
	YrZ3Zy0LLN9k6+MpziNfy03HirzBrqtJyMhc70IVTHUu6U3tOA3C+HoQr2/52sKyA7mT
	+uvG+wjhFIwqlyoeUrHruUy9U3jVWEpqlO1v80PLjA1481vptfhS7LX7v2PqMNLenLfx
	wchQ==
X-Received: by 10.66.119.105 with SMTP id kt9mr26870178pab.86.1438833188959;
	Wed, 05 Aug 2015 20:53:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:ec69:af94:a7e0:6a60?
	([2601:646:8601:4580:ec69:af94:a7e0:6a60])
	by smtp.gmail.com with ESMTPSA id
	fu2sm4591884pdb.32.2015.08.05.20.53.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Aug 2015 20:53:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <0354ab95e1c3afd9ac708ee063c2d2c2f51d5801.1438670283.git.liezhi.yang@windriver.com>
Date: Wed, 5 Aug 2015 20:53:03 -0700
Message-Id: <988FE418-5570-4756-84FA-3E7907B7633E@gmail.com>
References: <cover.1438670283.git.liezhi.yang@windriver.com>
	<0354ab95e1c3afd9ac708ee063c2d2c2f51d5801.1438670283.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] tcmode-default.inc: update BINUVERSION
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
X-List-Received-Date: Thu, 06 Aug 2015 03:53:09 -0000
X-Groupsio-MsgNum: 69021
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B2D7B069-53F9-4953-B013-7A36FA9E6993";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B2D7B069-53F9-4953-B013-7A36FA9E6993
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 3, 2015, at 11:40 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/conf/distro/include/tcmode-default.inc |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/tcmode-default.inc =
b/meta/conf/distro/include/tcmode-default.inc
> index 0abf803..c08fe24 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>=20
> GCCVERSION ?=3D "4.9%"
> SDKGCCVERSION ?=3D "${GCCVERSION}"
> -BINUVERSION ?=3D "2.25"
> +BINUVERSION ?=3D "2.25%=E2=80=9D

squash this into binutils upgrade patch

> GDBVERSION ?=3D "7.9%"
> GLIBCVERSION ?=3D "2.21"
> UCLIBCVERSION ?=3D "0.9.33+git%"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_B2D7B069-53F9-4953-B013-7A36FA9E6993
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXC2iIACgkQuwUzVZGdMxR1aQCfQ1EElzIcRSfaEUhc1z/5L6zg
YDQAn0e7CGbD7L2s/wU5lKd0w/f47ptA
=PL69
-----END PGP SIGNATURE-----

--Apple-Mail=_B2D7B069-53F9-4953-B013-7A36FA9E6993--
