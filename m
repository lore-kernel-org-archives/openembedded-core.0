Return-Path: <raj.khem@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id C7BE377103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:10:46 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id v14so229370483ykd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 22:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+ASfwg/xAIHOVGftbUngxvBV44ToTBI+C0K7LE+mdRA=;
	b=tdWaKiFUQ22qi4yL1+lyI1/u8pzbVMXfTTqvBiEm/LVuokX43uXQ9a9aeq4F3W/hWW
	0qy5Fo7l4BEmNzgIxU/XmvhOpJZvoLGLseQ197BxnnaenTkNdCmvRyHiDiejufIjel5l
	FFIESXsPpCUnrGL8Yh0QxYMgw+UPhzzh2Wxg9rANGifxgSvFNm244SuGIa2ODtKfvYtn
	7+4Vd7kYIbxL7B7emruAc0UI9dVwPSgu66+XjVaiMU/7ICvMffe2Azg8PdI2OGJ2FIQQ
	6EyyUTCB410khUlkTceKg0x728BB32CMvxXGFuL23p4HKTk14IZhtecXwlM7Y3rBeJrO
	Mxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=+ASfwg/xAIHOVGftbUngxvBV44ToTBI+C0K7LE+mdRA=;
	b=WjyU3YNxGPfCc0bsneM44IDqB5thFyWhl2uPmZSY3PKWeCQpwncmI0SdHbMtvE+6qT
	JfGJn4+W6JrrKBWMVY4EBjNJCWJlCra821X4cS3SjpKrOgT+Rp88QlGpOU5s5zXGhjOB
	2hX4iDyJD9SFQcRyIfdnkxYWSBc96aikXcHHZu8iCaT6Dg1rpCur3D1aDsDMIuDDSe0+
	DU+y8NR9N/4TYsVsuLgVsiCfkslwf+2Rwmv5TlACNR4xbt1fe2acCwQzsmFo7UtSlTjr
	fUGupA81kKE+Vrz8hPYNqR+CXApr3a4D9mhmS/cC5wctb0vQzurCBErY3LU8312JB4iJ
	lK+Q==
X-Gm-Message-State: AG10YOQpVifOWWRu8I47l7rndBxtsqzDBO16KqU5+LeL2A8Af5ylD6QtvaWmPopfHQx1PQ==
X-Received: by 10.13.199.132 with SMTP id j126mr13446017ywd.124.1453875046969; 
	Tue, 26 Jan 2016 22:10:46 -0800 (PST)
Received: from ?IPv6:2600:1002:b014:c92e:ed2f:4d62:56d8:d791?
	([2600:1002:b014:c92e:ed2f:4d62:56d8:d791])
	by smtp.gmail.com with ESMTPSA id
	m188sm3799554ywe.46.2016.01.26.22.10.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 22:10:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453835674-14822-1-git-send-email-armccurdy@gmail.com>
Date: Wed, 27 Jan 2016 01:10:44 -0500
Message-Id: <FC045592-3681-470F-9B18-9159A7CFE109@gmail.com>
References: <1453835674-14822-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mtools: keep v3.9.9 recipe in sync with the v4.0.18 version
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
X-List-Received-Date: Wed, 27 Jan 2016 06:10:46 -0000
X-Groupsio-MsgNum: 76948
Content-Type: multipart/signed;
	boundary="Apple-Mail=_20C1C28A-EE96-486D-A626-BD5538F0973C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_20C1C28A-EE96-486D-A626-BD5538F0973C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 26, 2016, at 2:14 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Changes are mostly cosmetic, but also include one important fix
> to support builds using musl libc.

Looks ok. I haven=E2=80=99t fixed the GPL2-only recipes yet.

>=20
>  =
http://git.openembedded.org/openembedded-core/commit/?id=3D9f5eb272784d3be=
17e7fe8e7cab511bd4086ba1e
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-devtools/mtools/mtools_3.9.9.bb | 36 =
+++++++++++++++-------------
> 1 file changed, 19 insertions(+), 17 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb =
b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
> index c284a71..26d52a9 100644
> --- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
> +++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
> @@ -1,16 +1,15 @@
> -# mtools OE build file
> -# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights =
Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> SUMMARY =3D "Utilities to access MS-DOS disks without mounting them"
> -DESCRIPTION =3D "Mtools is a collection of utilities for accessing =
MS-DOS disks from Unix without mounting them."
> +DESCRIPTION =3D "Mtools is a collection of utilities to access MS-DOS =
disks from GNU and Unix without mounting them."
> HOMEPAGE =3D "http://www.gnu.org/software/mtools/"
> +SECTION =3D "optional"
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D92b58ec77696788ce278b044d2a8e9d3"
> PR =3D "r6"
>=20
> -RDEPENDS_${PN} =3D "glibc-gconv-ibm850"
> -RRECOMMENDS_${PN} =3D "\
> +DEPENDS +=3D "virtual/libiconv"
> +
> +RDEPENDS_${PN}_libc-glibc =3D "glibc-gconv-ibm850"
> +RRECOMMENDS_${PN}_libc-glibc =3D "\
> 	glibc-gconv-ibm437 \
> 	glibc-gconv-ibm737 \
> 	glibc-gconv-ibm775 \
> @@ -26,24 +25,22 @@ RRECOMMENDS_${PN} =3D "\
> 	glibc-gconv-ibm866 \
> 	glibc-gconv-ibm869 \
> 	"
> -
> -#http://mtools.linux.lu/mtools-${PV}.tar.gz
> -SRC_URI =3D =
"http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
> -	file://mtools-makeinfo.patch \
> -	file://mtools.patch \
> -	file://no-x11.patch \
> -	file://fix-broken-lz.patch \
> -"
> -
> SRC_URI[md5sum] =3D "3e68b857b4e1f3a6521d1dfefbd30a36"
> SRC_URI[sha256sum] =3D =
"af083a73425d664d4607ef6c6564fd9319a0e47ee7c105259a45356cb834690e"
>=20
> -S =3D "${WORKDIR}/mtools-${PV}"
> +#http://mtools.linux.lu/mtools-${PV}.tar.gz
> +SRC_URI =3D =
"http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
> +           file://mtools-makeinfo.patch \
> +           file://mtools.patch \
> +           file://no-x11.patch \
> +           file://fix-broken-lz.patch"
>=20
> inherit autotools texinfo
>=20
> EXTRA_OECONF =3D "--without-x"
>=20
> +LDFLAGS_append_libc-uclibc =3D " -liconv "
> +
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> PACKAGECONFIG ??=3D ""
> @@ -54,3 +51,8 @@ do_install_prepend () {
>     mkdir -p ${D}/${bindir}
>     mkdir -p ${D}/${datadir}
> }
> +
> +do_install_append_class-native () {
> +    create_wrapper ${D}${bindir}/mcopy \
> +        GCONV_PATH=3D${libdir}/gconv
> +}
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_20C1C28A-EE96-486D-A626-BD5538F0973C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaoX2QACgkQuwUzVZGdMxTVPACfY9uHnXqGIf2lFQfMWFAd6WcW
d6wAnjFHyUCrwMhlkH88L8Ig113c+QKT
=zbiq
-----END PGP SIGNATURE-----

--Apple-Mail=_20C1C28A-EE96-486D-A626-BD5538F0973C--
