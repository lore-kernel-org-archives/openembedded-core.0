Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVgjF-0004BT-Bn
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:22:13 +0200
Received: by mail-pd0-f181.google.com with SMTP id q10so38772pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 04:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=GcB423j1ReP4rHkfxb3a5d7lcSuRB6tgViZh6ejGTtQ=;
	b=sL+t/3Pxr/KShL2MxzInaddVFxVi8eC299GLEaq/ShNXCfE6qBMltFbJI81dMapuyu
	O+14jB0mwa5Y6aeTZbZDPdNXDtsy+u2S52BkIEvPSAMardqee/hD0/6Qtsy5bDIk+aIJ
	saZ/wCYh1kXX6hWt3BZR3Lv+0s2pXWd3pfryJbakVn5H+qHx8MzoXFX0ONlxasJx1AE4
	BXfPRX0pt8iecS5rLcWdXt8UPHIFC7EFqleSk+d1qZWhfzeAuYUiUv2An0zyVC3/ij3N
	1tCEKdDgB5t/+SKNU3aYObpQ2Xy2gQfnJlJkyQZABUAnvQU8cQduFIK/PPTlRH8Hfa9a
	gxMg==
X-Received: by 10.66.221.37 with SMTP id qb5mr30508500pac.75.1366974267983;
	Fri, 26 Apr 2013 04:04:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	kr7sm12283737pab.23.2013.04.26.04.04.25 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 04:04:26 -0700 (PDT)
Date: Fri, 26 Apr 2013 13:04:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20130426110437.GP5538@jama.dyndns-home.com>
References: <1366973665-8779-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366973665-8779-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] connman: add PACKAGECONFIG options
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
X-List-Received-Date: Fri, 26 Apr 2013 11:22:14 -0000
X-Groupsio-MsgNum: 38444
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SavPGzlo48F1Gxyz"
Content-Disposition: inline

--SavPGzlo48F1Gxyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2013 at 11:54:25AM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> - change TIST from being explicitly built, to a PACKAGECONFIG
> - move wifi, 3g and bluetooth to PACKAGECONFIG
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>=20
> Runtime tested on beaglebone armv7a without wifi, 3g or bluetooth support.
>=20
> Runtime tested with and without TIST support.
>=20
>  meta/recipes-connectivity/connman/connman.inc | 26 +++++++++++++--------=
-----
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index 589ece8..5fcffc4 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -13,17 +13,9 @@ LICENSE  =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
>                      file://src/main.c;beginline=3D1;endline=3D20;md5=3Dd=
6a1ac98a6791c5294e8a7f176ecd66d"
> =20
> -# we need to define the depends here, the dynamic stuff is too late
> -DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
> -            ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', ''=
, d)} \
> -            ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant',=
 '', d)} \
> -            ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
> -            "
> +DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls"
> =20
> -INC_PR =3D "r19"
> -
> -TIST =3D "--enable-tist"
> -TIST_powerpc =3D ""
> +INC_PR =3D "r20"
> =20
>  EXTRA_OECONF +=3D "\
>      ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant \
> @@ -32,9 +24,6 @@ EXTRA_OECONF +=3D "\
>      --enable-threads \
>      --enable-loopback \
>      --enable-ethernet \
> -    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', =
'--disable-wifi', d)} \
> -    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth =
${TIST}', '--disable-bluetooth', d)} \
> -    ${@base_contains('DISTRO_FEATURES', '3g', '--enable-ofono', '--disab=
le-ofono', d)} \
>      --enable-tools \
>      --enable-test \
>      --disable-polkit \
> @@ -43,6 +32,17 @@ EXTRA_OECONF +=3D "\
>      ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdi=
r=3D${systemd_unitdir}/system/', '--with-systemdunitdir=3D', d)} \
>  "
> =20
> +PACKAGECONFIG ??=3D "\
> +                   ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', ''=
, d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','blue=
tooth', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', '3g','3g', '', d)=
} \
> +"
> +
> +PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi, wpa-supplicant"
> +PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth, --disable-bluetooth, b=
luez4"
> +PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono"
> +PACKAGECONFIG[tist] =3D "--enable-tist,,"
> +
>  INITSCRIPT_NAME =3D "connman"
>  INITSCRIPT_PARAMS =3D "start 05 5 2 3 . stop 22 0 1 6 ."

There are few DISTRO_FEATURES conditional left, I think it would be
better to use base_contains('PACKAGECONFIG',.. there to be able to
define PACKAGECONFIG =3D "foo" only in .bbappend.

RPROVIDES:
-${@base_contains('DISTRO_FEATURES', 'bluetooth','connman-plugin-bluetooth'=
, '', d)} \
+${@base_contains('PACKAGECONFIG', 'bluetooth','connman-plugin-bluetooth', =
'', d)} \
etc should probably work

Thanks for doing it!

Cheers,

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

--SavPGzlo48F1Gxyz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF6X0UACgkQN1Ujt2V2gBydIgCffDAcBLuNkYhgM+KhLYJNDia5
a5UAn0ukYhtlMl9qOkSxQ5pNcExdv+77
=rD9b
-----END PGP SIGNATURE-----

--SavPGzlo48F1Gxyz--
