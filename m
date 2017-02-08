Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 55D6A719B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 22:31:44 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2017 14:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; 
	d="asc'?scan'208";a="62822074"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.117])
	([10.219.128.117])
	by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2017 14:31:32 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
	<6ce58472f6ceb0f6e59a215dbbc8343b187931b4.1484667160.git.jose.a.lamego@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <d0dd2aed-a01e-e13a-1bd6-52b1fe06ee07@linux.intel.com>
Date: Wed, 8 Feb 2017 16:31:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <6ce58472f6ceb0f6e59a215dbbc8343b187931b4.1484667160.git.jose.a.lamego@linux.intel.com>
Subject: Re: [PATCH 2/3] python3-pip: Remove pth file creation at recipe level
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
X-List-Received-Date: Wed, 08 Feb 2017 22:31:45 -0000
X-Groupsio-MsgNum: 93047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="TSG93DeKmDhBlCPa4OslXVsIlXJpmQPVn"

--TSG93DeKmDhBlCPa4OslXVsIlXJpmQPVn
Content-Type: multipart/mixed; boundary="ru8cnX2XHIlKc9hgS2aRoHHeTPo2VAFA1";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <d0dd2aed-a01e-e13a-1bd6-52b1fe06ee07@linux.intel.com>
Subject: Re: [OE-core] [PATCH 2/3] python3-pip: Remove pth file creation at
 recipe level
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
 <6ce58472f6ceb0f6e59a215dbbc8343b187931b4.1484667160.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <6ce58472f6ceb0f6e59a215dbbc8343b187931b4.1484667160.git.jose.a.lamego@linux.intel.com>

--ru8cnX2XHIlKc9hgS2aRoHHeTPo2VAFA1
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Ping.

On 01/17/2017 09:42 AM, Jose Lamego wrote:
> Handling of installed eggs is now performed at the distutils3 bbclass.
>=20
> This change removes the pth file creation at recipe level.
>=20
> [YOCTO #8673]
>=20
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  meta/recipes-devtools/python/python3-pip_9.0.1.bb | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3-pip_9.0.1.bb b/meta/r=
ecipes-devtools/python/python3-pip_9.0.1.bb
> index 6ac94bb..9dce107 100644
> --- a/meta/recipes-devtools/python/python3-pip_9.0.1.bb
> +++ b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
> @@ -31,9 +31,6 @@ do_install_append() {
> =20
>      # Install as pip3 and leave pip2 as default
>      rm ${D}/${bindir}/pip
> -
> -    # Installed eggs need to be passed directly to the interpreter via=
 a pth file
> -    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTH=
ON_SITEPACKAGES_DIR}/${SRCNAME}-${PV}.pth
>  }
> =20
>  RDEPENDS_${PN} =3D "\
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--ru8cnX2XHIlKc9hgS2aRoHHeTPo2VAFA1--

--TSG93DeKmDhBlCPa4OslXVsIlXJpmQPVn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYm5xFAAoJEFJAtowlSEbnf0MH/j6nXtyaR42YP/56gwtmifb5
oGy/r1UQd7wozGkF3X1d9LAwhZz12EEQRMi/Ehdk7SIlRnjw0w/HG+/w8epxNduG
8jXLeutZPNJlNmIor5OMdA3zeOZgqiXpAAMK+ZZ1mraeMdjmAjmU6iez4AkP69FO
b/aCKuO6xrXxvmhhWihTk14FcThNMPxNkd/n6QDuvHtRsbFcJUuWzL5pSPfIFeZa
ldBZOTe9KK7L5WGYHpSIYm7YmIORNVFRYFvncXGm0IeQ0eDXcuL8G0/DLEP/Qv9e
k5EppVrTEiIbjHjR1RgdKqfAd+Y1od21W5P4rsrdGdR9WFCYe6uyxjcxkt0HejI=
=Fglb
-----END PGP SIGNATURE-----

--TSG93DeKmDhBlCPa4OslXVsIlXJpmQPVn--
