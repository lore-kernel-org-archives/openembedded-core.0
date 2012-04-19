Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SKmj8-0001pd-Mv
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 10:28:30 +0200
Received: by wibhj13 with SMTP id hj13so1302018wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 01:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/lVcdw47I1d2Kvs8w0PYIucYDrsKp/cFpRNWfaIkRn8=;
	b=fee8XOArItcKLPU2n48AyCSekfMM4rx/LWLEGg2duedCx+Y7Qt3kOH0s/Odvij5oyH
	+RkuEqq8MOwmomIs33Xeeu4w63B3JQlP0gtQdehrsZGoy64tJ46KxVFwgtT0T/Q3/gNR
	qlVOMzdqwmt2Je4HS4iuLe7OuXQCJOA7k8llSYOx8gB2PI0KlrTsZiVLq+MXLegBNn92
	iAkC9HPPGfGjYz2OtcHI4Nayk778MEn47weorxKFAnuWAiZ697rJXVJgXJVLfV/Zh3fF
	3furYqF8e7R2d9ydn/CwV/ndRZxb7sxyhFPjNyPf5Gn8GPXyQvqXYJKft1Djg5XKYG12
	aHnw==
Received: by 10.216.134.2 with SMTP id r2mr767390wei.31.1334823542322;
	Thu, 19 Apr 2012 01:19:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ea6sm40627762wib.5.2012.04.19.01.19.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Apr 2012 01:19:01 -0700 (PDT)
Date: Thu, 19 Apr 2012 10:19:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120419081902.GB3671@jama.jama.net>
References: <1334781049-7980-1-git-send-email-jonas.danielsson@lundinova.se>
	<4F8F43C0.6020608@linux.intel.com>
	<20120419080828.GA8581@jkd-desktop>
	<20120419081315.GA22585@jkd-desktop>
MIME-Version: 1.0
In-Reply-To: <20120419081315.GA22585@jkd-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] bluez4: make alsa support conditional upon DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2012 08:28:30 -0000
X-Groupsio-MsgNum: 21001
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 19, 2012 at 10:13:15AM +0200, Jonas Danielsson wrote:
>=20
>=20
> Do not enable alsa in bluez4 unless it's included in DISTRO_FEATURES.
>=20
> Signed-off-by: Jonas Danielsson <jonas.danielsson@lundinova.se>
> ---
>  meta/recipes-connectivity/bluez/bluez4.inc     |    9 +++++++--
>  meta/recipes-connectivity/bluez/bluez4_4.99.bb |    3 ++-
>  2 files changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-co=
nnectivity/bluez/bluez4.inc
> index fbbe0bf..40e8543 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,9 +7,15 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff=
87c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
>                      file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e \
>                      file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
> -DEPENDS =3D "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
> +DEPENDS =3D "\
> +  udev ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \

this ^ is not needed anymore

> +  libusb dbus-glib glib-2.0 libcheck \
> +  "
>  RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> =20
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa',=
 '', d)}"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> +
>  ASNEEDED =3D ""
> =20
>  SRC_URI =3D "\
> @@ -21,7 +27,6 @@ inherit autotools
> =20
>  EXTRA_OECONF =3D "\
>    --disable-gstreamer \
> -  --enable-alsa \
>    --enable-usb \
>    --enable-tools \
>    --enable-bccmd \
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipe=
s-connectivity/bluez/bluez4_4.99.bb
> index 5033d34..32831e7 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> @@ -1,6 +1,6 @@
>  require bluez4.inc
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI +=3D "file://bluetooth.conf \
>              file://sbc_mmx.patch \
> @@ -19,6 +19,7 @@ do_install_append() {
> =20
>  RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> =20
> +ALLOW_EMPTY_libasound-module-bluez =3D "1"
>  PACKAGES =3D+ "libasound-module-bluez"
> =20
>  FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so ${datadir}/=
alsa"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+PynYACgkQN1Ujt2V2gByRYgCePiFS/GA70p4Ci+elzuu18qwJ
dbEAoJWHkQj6EgCnYXfBRMKqDoUKboNi
=tDRH
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
