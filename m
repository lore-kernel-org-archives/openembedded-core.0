Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVfye-0006gn-8R
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 12:34:04 +0200
Received: by mail-pa0-f42.google.com with SMTP id kl13so2420859pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=9FArobSbHv/uxbxoy8Cv9ey9hXOu70L27RypC2PmwEk=;
	b=u2BjBrN1LvS/3GU3uZSfMDiNf3CPFN4Tf0iW/FPlM0xQpiO1SiB8enVTLPmo2jFJYJ
	fyfOzBw+igLdE7Wn3P5v3cZLDTjTaCY7hItIOMZW0cj+Bp9r4NLR1gQXn1br+mYVtB9S
	2Vx/Tp64MG1JoC83XxLQU368+kBb2Abecu5akKsTVzxZRuyi4xfxzbpDTAguRm1mPDeb
	s8/rW7bakof5JXGCdsj+XLM35zS5EGga6mH6R5hCZTw5WY7lUhQsNBeptmTsvCxq73tQ
	GmOBxWswK9veDgzs1+HYF1CV4RTIkVI0AyAtXd3XB7n78xMAUlvQgSuR8lZa7DUy3g4T
	mmWA==
X-Received: by 10.66.162.67 with SMTP id xy3mr29745421pab.94.1366971378780;
	Fri, 26 Apr 2013 03:16:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	nt2sm4584222pbc.17.2013.04.26.03.16.14 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 03:16:16 -0700 (PDT)
Date: Fri, 26 Apr 2013 12:16:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20130426101627.GM5538@jama.dyndns-home.com>
References: <1366970771-9959-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366970771-9959-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: make tist functionallity a PACKAGECONFIG option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 10:34:05 -0000
X-Groupsio-MsgNum: 38437
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UeXZ3FjlYZvuln/G"
Content-Disposition: inline

--UeXZ3FjlYZvuln/G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2013 at 11:06:11AM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>=20
> Runtime tested on beaglebone armv7a, with and without tist PACKAGECONFIG
>=20
>  meta/recipes-connectivity/connman/connman.inc | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index 589ece8..eb9d145 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,10 +20,7 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>              ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>              "
> =20
> -INC_PR =3D "r19"
> -
> -TIST =3D "--enable-tist"
> -TIST_powerpc =3D ""
> +INC_PR =3D "r20"
> =20
>  EXTRA_OECONF +=3D "\
>      ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant \
> @@ -32,8 +29,8 @@ EXTRA_OECONF +=3D "\
>      --enable-threads \
>      --enable-loopback \
>      --enable-ethernet \
> -    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', =
'--disable-wifi', d)} \
> -    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth =
${TIST}', '--disable-bluetooth', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'wifi', '--enable-wifi', '--disa=
ble-wifi', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'bluetooth', '--enable-bluetooth=
', '--disable-bluetooth', d)} \
>      ${@base_contains('DISTRO_FEATURES', '3g', '--enable-ofono', '--disab=
le-ofono', d)} \
>      --enable-tools \
>      --enable-test \
> @@ -43,6 +40,10 @@ EXTRA_OECONF +=3D "\
>      ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdi=
r=3D${systemd_unitdir}/system/', '--with-systemdunitdir=3D', d)} \
>  "
> =20
> +PACKAGECONFIG ??=3D ""
> +
> +PACKAGECONFIG[tist] =3D "--enable-tist,,"

would you mind to convert wifi, bluetooth and 3g also to PACKAGECONFIGs?

> +
>  INITSCRIPT_NAME =3D "connman"
>  INITSCRIPT_PARAMS =3D "start 05 5 2 3 . stop 22 0 1 6 ."
> =20
> --=20
> 1.8.2.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UeXZ3FjlYZvuln/G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF6U/sACgkQN1Ujt2V2gBx7hACfVSYE4bnmMV+9+EDpc9Il1Kov
4cwAn0+Xp3umvAHAnj530+gCaMdO/ljF
=QcW0
-----END PGP SIGNATURE-----

--UeXZ3FjlYZvuln/G--
