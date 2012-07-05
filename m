Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SmoO4-0001AP-6E; Thu, 05 Jul 2012 17:54:36 +0200
Received: by wibhq4 with SMTP id hq4so5803126wib.6
	for <multiple recipients>; Thu, 05 Jul 2012 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BJfY3fUS/lCWN28uM9bKJNi7oLf4xyt1Dutryr07u7c=;
	b=lpAK7xS/sexpDhD2UCrO5meFzOjyLvsEDjH3IX8VLDbPrFwc1rjt7dJk8nOmaKh/XM
	3I9Pf4h+xFDuRAKfvvCtm1x3vAfpJ6LWEp94VtDxjbpE2wz9jC8OdwLAg3/kECPOpPzY
	Ti84r0P+JeHsPX7ssI6bNCGR6ttq+2vyPvRbCZqmIJ2x7LPk6FtdPaMVkztQz34jaMkL
	efJrFjmMEcK0sMxMnKHQ4GJ8BC+lBoJJJCm9muk5sNPtCJilnZzVoWYKaJewU5HhGJ7Z
	ejBtdBNOCeo7KdUcZ/vIj6InYOUPDes5NtKj3NI52rAriRDGNHAAUBV1myFD860sUAcD
	yYWA==
Received: by 10.180.98.39 with SMTP id ef7mr353435wib.21.1341503011453;
	Thu, 05 Jul 2012 08:43:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm974696wiy.4.2012.07.05.08.43.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 08:43:29 -0700 (PDT)
Date: Thu, 5 Jul 2012 17:43:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20120705154323.GA3708@jama.jama.net>
References: <20120705132323.579D910333@opal>
MIME-Version: 1.0
In-Reply-To: <20120705132323.579D910333@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : bluez4: update to ver. 4.101
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
X-List-Received-Date: Thu, 05 Jul 2012 15:54:36 -0000
X-Groupsio-MsgNum: 24723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2012 at 01:23:23PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 1b2f6a21dde6045c4604ca5463e6c4db3499ee06
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D1b2f6a21dde6045c4604ca5463e6c4db3499ee06
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Wed Jul  4 14:34:00 2012 +0300
>=20
> bluez4: update to ver. 4.101
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I guess this is new:
WARNING: QA Issue: bluez4: Files/directories were installed but not
shipped
  /usr/share/dbus-1
  /usr/share/dbus-1/system-services
  /usr/share/dbus-1/system-services/org.bluez.service

Cheers,

>=20
> ---
>=20
>  .../{bluez4-4.99 =3D> bluez4-4.101}/bluetooth.conf   |    0
>  .../{bluez4-4.99 =3D> bluez4-4.101}/sbc_mmx.patch    |    0
>  .../bluez/{bluez4_4.99.bb =3D> bluez4_4.101.bb}      |    9 ++++-----
>  3 files changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf b=
/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> similarity index 100%
> rename from meta/recipes-connectivity/bluez/bluez4-4.99/bluetooth.conf
> rename to meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch b/=
meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bluez/bluez4-4.99/sbc_mmx.patch
> rename to meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipe=
s-connectivity/bluez/bluez4_4.101.bb
> similarity index 83%
> rename from meta/recipes-connectivity/bluez/bluez4_4.99.bb
> rename to meta/recipes-connectivity/bluez/bluez4_4.101.bb
> index 32831e7..a2ba66f 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> @@ -1,13 +1,12 @@
>  require bluez4.inc
> =20
> -PR =3D "r2"
> +PR =3D "r0"
> =20
>  SRC_URI +=3D "file://bluetooth.conf \
> -            file://sbc_mmx.patch \
> -           "
> +            file://sbc_mmx.patch"
> =20
> -SRC_URI[md5sum] =3D "570aa10692ed890aa0a4297b37824912"
> -SRC_URI[sha256sum] =3D "d884b9aa5d3d9653c076b7646ca14a3e43eb84bccfe8193c=
49690f802bbd827c"
> +SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
> +SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4=
ad75fe52846f7487"
> =20
>  do_install_append() {
>  	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/1thsACgkQN1Ujt2V2gByMQwCdH5XnjSJL23OxeG5v1bGBzZVp
gZQAoJF82sLoJ15qn+oJD3KXgP2TTcX1
=P3BZ
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
