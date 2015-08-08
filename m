Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id EFE22766F6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Aug 2015 19:49:51 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so38804672pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Aug 2015 12:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ZbCd3Jbao3uAZKX3ofTfZzA4W+DbowFredZprsPCZJU=;
	b=ZjT0MkRIMHxl52G86wzZO7ExHpwyrNqIYk3Herl3XpFrOCcMsEciRkGvK/7BWIDoXG
	wXhLwMpOqvF+KKcCmJzh66ARHmtHP7CHs4J/2PkpSGWL3DX9pkpW2I6OH7z6XyOlUg9g
	M6jteQvmKGEOo1OaXmAwO+xGBM7izL/hK0jLxNY+IKHBzvcoCsY9FJ8qBSCntDR5Hq3B
	TI+z4zCDJ6CPZqLjS5Wfmn0Lv1MyQnW1T7IzoJ1DUnZSOEmJ+3VyVfzbm4We+l9BNw26
	Mua6B7n55l71JnhsttNbsLC2vBWrkQrrfarnocKzjUbMsmflTtlPF7L8toDXlbH31EDn
	OLnw==
X-Received: by 10.70.48.166 with SMTP id m6mr29237458pdn.13.1439063391971;
	Sat, 08 Aug 2015 12:49:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id
	uy6sm14403301pbc.13.2015.08.08.12.49.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 12:49:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <4a887bbeef74190b705f505338811dc71de37e70.1438956967.git.alexander.kanavin@linux.intel.com>
Date: Sat, 8 Aug 2015 12:49:50 -0700
Message-Id: <B5A3F049-0054-4314-8E5E-BCFF4969ECC3@gmail.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
	<cover.1438956967.git.alexander.kanavin@linux.intel.com>
	<4a887bbeef74190b705f505338811dc71de37e70.1438956967.git.alexander.kanavin@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] distcc: update SRC_URI to not use Google Code
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
X-List-Received-Date: Sat, 08 Aug 2015 19:49:52 -0000
X-Groupsio-MsgNum: 69160
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9B2C32F1-9622-434A-9CCF-34196B364864";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9B2C32F1-9622-434A-9CCF-34196B364864
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 7, 2015, at 7:28 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> Google Code is shutting down soon and distcc has moved to github.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
> meta/recipes-devtools/distcc/distcc_3.1.bb | 7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb =
b/meta/recipes-devtools/distcc/distcc_3.1.bb
> index e4b9313..f8879c8 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.1.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
> @@ -17,16 +17,15 @@ PACKAGECONFIG[popt] =3D =
"--without-included-popt,--with-included-popt,popt"
>=20
> RRECOMMENDS_${PN} =3D "avahi-daemon"
>=20
> -SRC_URI =3D "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 =
\
> +SRC_URI =3D "git://github.com/distcc/distcc.git \
>            file://separatebuilddir.patch \
>            file://0001-zeroconf-Include-fcntl.h.patch \
>            file://default \
>            file://distccmon-gnome.desktop \
>            file://distcc \
>            file://distcc.service"
> -
> -SRC_URI[md5sum] =3D "a1a9d3853df7133669fffec2a9aab9f3"
> -SRC_URI[sha256sum] =3D =
"f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724fcd2d53f934ddd89"
> +SRCREV =3D =E2=80=9C9a172d3d20042754a30c0cd9a5d63fd1a8120c31"

it will be good to add PV =3D =E2=80=9C3.1+git${SRCPV}=E2=80=9D here as =
well. You might rename the recipe to distcc_git.bb
then as well.

> +S =3D "${WORKDIR}/git"
>=20
> inherit autotools pkgconfig update-rc.d useradd systemd
>=20
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9B2C32F1-9622-434A-9CCF-34196B364864
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGXV4ACgkQuwUzVZGdMxTIMACggj4zkYj6neD0z9jpZYGGcsR4
ugcAnjGFm5ryDsLdq6HZ1ivQEmgUGuKx
=8f8d
-----END PGP SIGNATURE-----

--Apple-Mail=_9B2C32F1-9622-434A-9CCF-34196B364864--
