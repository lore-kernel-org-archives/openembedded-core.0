Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 476A372C17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 11:05:41 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so6434623wgh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 03:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1L+mYKUXyLEX2hU1OWm7ZY1fkwCwddvl50CxYAJ63P8=;
	b=L3emk59Si/MRlh7rtl09oCIq9nN2Ku9yFLDqmHN9mgwfPcWkmVoHT/zL8ex+YmHBWQ
	PPwarK4Y7VMJ+2D2B+19bUVpsSbep2LHQxT7P/dwhvRwwH1hc3fb6Z5940i5dgx/ztAg
	zZ+mcg8w2SWN2JY1U43qoaNouzRXzMeHo1bw6Jfc2C2F/VDO3wlHbxBFk40O8AJlsG/F
	M0rLi88ApJrPh7DvWbC5pzjNb1PB+s7vq976NMlKUcEFDNnDGuzJGJwj12lXR1cCKb84
	ROVyCumCF3zCZ6vHJpTjaD+ZQ8loIdRIA1RTTefqQi9yQTa9klx9U5RU3d/kevXLmyZ0
	ylqQ==
X-Received: by 10.180.206.47 with SMTP id ll15mr30820920wic.34.1419246340942; 
	Mon, 22 Dec 2014 03:05:40 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t12sm10326136wju.19.2014.12.22.03.05.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Dec 2014 03:05:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Dec 2014 12:05:41 +0100
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20141222110541.GB2465@jama>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
	<1419199917-27913-3-git-send-email-paul@paulbarker.me.uk>
MIME-Version: 1.0
In-Reply-To: <1419199917-27913-3-git-send-email-paul@paulbarker.me.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] opkg-arch-config: Renamed from opkg-config-base
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
X-List-Received-Date: Mon, 22 Dec 2014 11:05:46 -0000
X-Groupsio-MsgNum: 60757
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline

--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2014 at 10:11:51PM +0000, Paul Barker wrote:
> The name 'opkg-arch-config' is much more descriptive.
>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  meta/conf/layer.conf                                                   |=
 2 +-
>  .../opkg/{opkg-config-base_1.0.bb =3D> opkg-arch-config_1.0.bb}         =
 | 3 ++-
>  meta/recipes-devtools/opkg/opkg.inc                                    |=
 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/opkg/{opkg-config-base_1.0.bb =3D> opkg-arc=
h-config_1.0.bb} (87%)
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index de96548..4fd3a16 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -18,7 +18,7 @@ COREBASE =3D '${@os.path.normpath("${LAYERDIR}/../")}'
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    sysvinit-inittab \
>    shadow-securetty \
> -  opkg-config-base \
> +  opkg-arch-config \
>    netbase \
>    init-ifupdown \
>    connman-conf \
> diff --git a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb b/meta/re=
cipes-devtools/opkg/opkg-arch-config_1.0.bb
> similarity index 87%
> rename from meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
> rename to meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
> index acbe129..f700865 100644
> --- a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
> @@ -1,4 +1,4 @@
> -SUMMARY =3D "Base configuration files for opkg"
> +SUMMARY =3D "Architecture-dependent configuration for opkg"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> @@ -28,3 +28,4 @@ FILES_${PN} =3D "${sysconfdir}/opkg/ "
> =20
>  CONFFILES_${PN} +=3D "${sysconfdir}/opkg/arch.conf"
> =20
> +RREPLACES_${PN} =3D "opkg-config-base"

Is this enough for opkg to automatically replace opkg-config-base with
opkg-arch-config during opkg upgrade?

With older opkg releases you always had to use whole combo
RPROVIDES+RREPLACES+RCONFLICTS.

> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/=
opkg/opkg.inc
> index 56c54b6..991c114 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -38,7 +38,7 @@ EXTRA_OECONF =3D "\
>    --with-opkglibdir=3D${OPKGLIBDIR} \
>  "
> =20
> -RDEPENDS_${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-b=
ase run-postinsts"
> +RDEPENDS_${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} opkg-arch-con=
fig run-postinsts"
>  RDEPENDS_${PN}_class-native =3D ""
>  RDEPENDS_${PN}_class-nativesdk =3D ""
>  RREPLACES_${PN} =3D "opkg-nogpg"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSX+wUACgkQN1Ujt2V2gBy3xgCgp3ZNKay76MQ8fUzLezxo7zly
Px8An3sx5CXJvtwBUCbt+DP10rVkLEGA
=eToR
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
