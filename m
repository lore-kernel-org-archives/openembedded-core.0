Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SIfpf-0008Vh-Cw
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 14:42:31 +0200
Received: by wgbdr12 with SMTP id dr12so2519506wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5XEu22v5Cqa77NGAf6lkO1x4jwNZjTjEveM8Cf8Tvg4=;
	b=S9w8OSylZCpLh4fKUWPFGDweJw++XyfaAUfzDMEiUDRepIExqGkZF55GFsdB+uI9Kr
	ajTTofyors9wFTBOrcpvUE5YwFzIWKbep90XyBh6jiWX2k3em1GStVpcbi8QjxFkHKsi
	hSpzZilgDwzfg0qLsadhTe3b0ui6pJbJE2iuVHd3zpGl3jL9EsUu7loPOIdyWEFV0XUH
	WjouQyCFNP93MEPrq9TI4ee99nZ8MQm8EBMnE9N8rtp6UGJOfrvDzKXYoLKvMuvSLXHh
	GYqI943W07QHmMhsJchQxR0WCrWS9EHrACQPiq6a9m8vKJmW1oXFM+6hXbQlx6Y9KVbz
	X7wQ==
Received: by 10.216.138.223 with SMTP id a73mr859849wej.86.1334320390223;
	Fri, 13 Apr 2012 05:33:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm7570130wiy.3.2012.04.13.05.33.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 05:33:09 -0700 (PDT)
Date: Fri, 13 Apr 2012 14:33:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120413123309.GD3651@jama.jama.net>
References: <cover.1334313002.git.andrei@gherzan.ro>
	<8ef395eb05e1acafcf4ea012c281911a1f5e71ad.1334313002.git.andrei@gherzan.ro>
MIME-Version: 1.0
In-Reply-To: <8ef395eb05e1acafcf4ea012c281911a1f5e71ad.1334313002.git.andrei@gherzan.ro>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [V5 1/2] gdbm: Package compat libs in gdbm-compat
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
X-List-Received-Date: Fri, 13 Apr 2012 12:42:31 -0000
X-Groupsio-MsgNum: 20702
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2012 at 01:34:18PM +0300, Andrei Gherzan wrote:
> In order to avoid breaking packages which depend on old package name libg=
dbm4 (>=3D 1.10),
> compat libs are packaged into a separate package named gdbm-compat.
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-support/gdbm/gdbm_1.10.bb |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-suppor=
t/gdbm/gdbm_1.10.bb
> index 26b8009..6b68d27 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.10.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D241da1b9fe42e642cbb2c24d5e0c4=
d24"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
> =20
> @@ -25,3 +25,8 @@ do_install_append () {
>      ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
>      ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
>  }
> +
> +PACKAGES =3D+ "${PN}-compat \
> +            "
> +FILES_${PN}-compat =3D "${libdir}/libgdbm_compat${SOLIBS} \
> +                     "
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

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+IHQUACgkQN1Ujt2V2gBx/hwCgmhjdc0AIGbg7LA1FWAOrlzE2
/gcAoIJfxkrhNPyhlfzV6lvEsD1/V/eQ
=Cueu
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
