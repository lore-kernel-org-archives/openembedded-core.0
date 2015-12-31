Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id C77C165CBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 08:50:25 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id do7so1938961pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 00:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=BP7SaYZeGjjOYUzFF/WTqZoCOMey0aq0a+rKo+rVHZo=;
	b=ZDHD6qdtRjtb0ejr53utvSIKrwsfDx8LdY3MhRBwHAuh5Z37yRJSOrwvHgYn+DVOFl
	Ci87UYpBu1R6fCEIYLPZCxRyW1D5XH+fHFLzw8DPImLHSMGaXL/Y5vKdX5F5+FRp0lfn
	jgD8c2DDOXcEQAhtHAbqQ5hzBGUWUOcTq66m14tb3RB2alGHEJ1W4cXownEtwKQt+ZXI
	zZ0ygaAvYDmjx6ckdGIiWlrlCmSdX660my496BRmqQ6v8GPhkFZE9u0MeK21eF5Hxbrt
	C3JGtCjtoGUzM1pbfjX7eN9g7NioX0uF1tXLgu2svbD+nA3n15O+fVrk9yf94iUdKCsi
	8+0A==
X-Received: by 10.66.254.39 with SMTP id af7mr23493342pad.43.1451551825994;
	Thu, 31 Dec 2015 00:50:25 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:859a:bd94:9969:6d02?
	([2601:646:8802:5d5c:859a:bd94:9969:6d02])
	by smtp.gmail.com with ESMTPSA id
	i72sm76065978pfj.64.2015.12.31.00.50.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Dec 2015 00:50:25 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <c46aeee4002b37e3f84433f78cbb82278e5d066e.1451382094.git.kai.kang@windriver.com>
Date: Thu, 31 Dec 2015 00:50:20 -0800
Message-Id: <D6F56C56-75BE-40AD-BDDC-AE6F14263057@gmail.com>
References: <cover.1451382094.git.kai.kang@windriver.com>
	<c46aeee4002b37e3f84433f78cbb82278e5d066e.1451382094.git.kai.kang@windriver.com>
To: kai.kang@windriver.com
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Revert "glib-2.0: build dependency cleanup"
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
X-List-Received-Date: Thu, 31 Dec 2015 08:50:25 -0000
X-Groupsio-MsgNum: 75329
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7D9D3369-BDF9-4188-8359-859BF13AE321";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7D9D3369-BDF9-4188-8359-859BF13AE321
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 29, 2015, at 1:43 AM, kai.kang@windriver.com wrote:
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> This reverts commit fcd7494b347423185c883b2897c4908929843a71.
>=20
> It uses command glib-genmarshal to build glib-2.0 which is from
> glibc-2.0-native. If the command doesn't exist on host, build fails

typo 'glib-2.0-native'

> with error:
>=20
> | /bin/sh: --prefix=3Dtest_marshal: command not found
> | make[4]: *** [testmarshal.c] Error 127
>=20
> So add the dependency back.

I ran into the regression as well. So this patch is good.

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> meta/recipes-core/glib-2.0/glib.inc | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib.inc =
b/meta/recipes-core/glib-2.0/glib.inc
> index 86f7e0e..8e4dcd7 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -17,10 +17,10 @@ SECTION =3D "libs"
>=20
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> -DEPENDS =3D "virtual/libiconv libffi zlib"
> -DEPENDS_append =3D " ${@bb.utils.contains('PTEST_ENABLED', '1', ' =
glib-2.0-native dbus', '', d)}"
> +DEPENDS =3D "glib-2.0-native virtual/libiconv libffi zlib"
> +DEPENDS_append_class-target =3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
> DEPENDS_class-native =3D "pkgconfig-native gettext-native =
libffi-native zlib-native"
> -DEPENDS_class-nativesdk =3D "nativesdk-libtool nativesdk-gettext =
nativesdk-libffi nativesdk-zlib"
> +DEPENDS_class-nativesdk =3D "nativesdk-libtool nativesdk-gettext =
nativesdk-libffi nativesdk-zlib ${BPN}-native"
>=20
> PACKAGES =3D+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
>=20
> --
> 2.6.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_7D9D3369-BDF9-4188-8359-859BF13AE321
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaE7FAACgkQuwUzVZGdMxTSFQCff3lumWky4FYpAlZDf8+sbA26
H7cAnAkGKQgoZJcSyb94qXXMvdPxAfaj
=ug6h
-----END PGP SIGNATURE-----

--Apple-Mail=_7D9D3369-BDF9-4188-8359-859BF13AE321--
