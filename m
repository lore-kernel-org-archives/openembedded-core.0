Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCu5g-0003Na-K0
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 16:47:45 +0100
Received: by mail-pb0-f51.google.com with SMTP id un15so4575529pbc.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Hj46UHj91YfgzsRMGWh0RYscDJn00T8gL8M2nf6+1vs=;
	b=MihKNYpojGvcOFbIm303XI6zth8+70w3UV1uxP0NaSGV7G4ZBtPclIziZFanY0IAk0
	GAmn/ogokbnzfXygLEX7jfSzqgs56bR0di8DXHYdb6TRcxAS2oRjJPvPQDy5/UO8/gPX
	DgScjctotSCIe5eQFuqdrKVzBdyS1OCB2lH6YN0eRl2ltdeGZkxyqCKUoWpN+Uut2WGG
	rPC6bgneC2cxqLSKHAo4ZinalN7etHw5Ri0F3CVkZuRSbkaMMSontdPxtsWujq6JRw2q
	H/7B6Q7buunfo9Ng8FpMYPBNVs1MkWbRi1RagyeVQC9qP5JV1ZdlXV3G1l1KH6Ta+dHk
	HnDw==
X-Received: by 10.68.135.136 with SMTP id ps8mr37580064pbb.2.1362497471243;
	Tue, 05 Mar 2013 07:31:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hs8sm27093162pbc.27.2013.03.05.07.31.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 07:31:09 -0800 (PST)
Date: Tue, 5 Mar 2013 16:30:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Message-ID: <20130305153031.GC12023@jama.dyndns-home.com>
References: <1362497257-23984-1-git-send-email-bogdan.a.marinescu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1362497257-23984-1-git-send-email-bogdan.a.marinescu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gmp: updated to 5.1.0a
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
X-List-Received-Date: Tue, 05 Mar 2013 15:47:47 -0000
X-Groupsio-MsgNum: 36253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline

--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 05:27:37PM +0200, Bogdan Marinescu wrote:
> ---
>  .../gmp/{gmp-5.1.0 =3D> gmp-5.1.0a}/187b7b1646ee.patch            |    0
>  .../gmp/{gmp-5.1.0 =3D> gmp-5.1.0a}/configure.patch               |    0
>  .../{gmp-5.1.0 =3D> gmp-5.1.0a}/obsolete_automake_macros.patch    |    0
>  meta/recipes-support/gmp/{gmp_5.1.0.bb =3D> gmp_5.1.0a.bb}        |    7=
 +++----
>  4 files changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/gmp/{gmp-5.1.0 =3D> gmp-5.1.0a}/187b7b1646ee=
=2Epatch (100%)
>  rename meta/recipes-support/gmp/{gmp-5.1.0 =3D> gmp-5.1.0a}/configure.pa=
tch (100%)
>  rename meta/recipes-support/gmp/{gmp-5.1.0 =3D> gmp-5.1.0a}/obsolete_aut=
omake_macros.patch (100%)
>  rename meta/recipes-support/gmp/{gmp_5.1.0.bb =3D> gmp_5.1.0a.bb} (71%)

v1 was already applied, you don't need to rename them, just return PR
and set it to r2.

> diff --git a/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch b/meta=
/recipes-support/gmp/gmp-5.1.0a/187b7b1646ee.patch
> similarity index 100%
> rename from meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
> rename to meta/recipes-support/gmp/gmp-5.1.0a/187b7b1646ee.patch
> diff --git a/meta/recipes-support/gmp/gmp-5.1.0/configure.patch b/meta/re=
cipes-support/gmp/gmp-5.1.0a/configure.patch
> similarity index 100%
> rename from meta/recipes-support/gmp/gmp-5.1.0/configure.patch
> rename to meta/recipes-support/gmp/gmp-5.1.0a/configure.patch
> diff --git a/meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.=
patch b/meta/recipes-support/gmp/gmp-5.1.0a/obsolete_automake_macros.patch
> similarity index 100%
> rename from meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.p=
atch
> rename to meta/recipes-support/gmp/gmp-5.1.0a/obsolete_automake_macros.pa=
tch
> diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bb b/meta/recipes-support=
/gmp/gmp_5.1.0a.bb
> similarity index 71%
> rename from meta/recipes-support/gmp/gmp_5.1.0.bb
> rename to meta/recipes-support/gmp/gmp_5.1.0a.bb
> index 6591ebe..b5d6842 100644
> --- a/meta/recipes-support/gmp/gmp_5.1.0.bb
> +++ b/meta/recipes-support/gmp/gmp_5.1.0a.bb
> @@ -3,13 +3,12 @@ LICENSE=3D"LGPLv3&GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
>  		    file://version.c;endline=3D18;md5=3Dd8c56b52b9092346b9f93b4da65ef7=
90"
> =20
> -PR =3D "r1"
> -
>  SRC_URI_append =3D " file://use-includedir.patch \
>                     file://gmp_fix_for_x32.patch \
>                     file://187b7b1646ee.patch \
>                     file://obsolete_automake_macros.patch \
>                     "
> +S =3D "${WORKDIR}/gmp-5.1.0"
> =20
> -SRC_URI[md5sum] =3D "362cf515aff8dc240958ce47418e4c78"
> -SRC_URI[sha256sum] =3D "dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8be9a31811=
64ad2fad5eefc796"
> +SRC_URI[md5sum] =3D "cf6d7cb5915f29ce0fc41d042205c080"
> +SRC_URI[sha256sum] =3D "ed5239a62aeaba6cfc8d50ec36fb59215618f98c248d4bb0=
5ca9bccd990794dc"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlE2D5cACgkQN1Ujt2V2gBzf8gCgmQ+Vx7lm+oTEalSa+McKjPKw
mYAAliabDBZWIfCQJicM6QITAHQWPBE=
=ci58
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
