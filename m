Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DF9D971D9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 22:31:49 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP; 08 Feb 2017 14:31:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; 
	d="asc'?scan'208";a="62822135"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.117])
	([10.219.128.117])
	by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2017 14:31:49 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
	<fb56a1c1aaeb6f6cf4b415b029e58124057ef662.1484667160.git.jose.a.lamego@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <0efb730d-3b87-9c1d-8a46-e5572ba29222@linux.intel.com>
Date: Wed, 8 Feb 2017 16:31:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <fb56a1c1aaeb6f6cf4b415b029e58124057ef662.1484667160.git.jose.a.lamego@linux.intel.com>
Subject: Re: [PATCH 3/3] python3-setuptools: Remove pth file creation at recipe level
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
X-List-Received-Date: Wed, 08 Feb 2017 22:31:51 -0000
X-Groupsio-MsgNum: 93048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="cW1FOkrsiUPhr3hbjbP0xgCNsE0lEw9wq"

--cW1FOkrsiUPhr3hbjbP0xgCNsE0lEw9wq
Content-Type: multipart/mixed; boundary="WL2GHSdWSIeOT8sVV226Q8CWwUXlcupxl";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <0efb730d-3b87-9c1d-8a46-e5572ba29222@linux.intel.com>
Subject: Re: [OE-core] [PATCH 3/3] python3-setuptools: Remove pth file
 creation at recipe level
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
 <fb56a1c1aaeb6f6cf4b415b029e58124057ef662.1484667160.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <fb56a1c1aaeb6f6cf4b415b029e58124057ef662.1484667160.git.jose.a.lamego@linux.intel.com>

--WL2GHSdWSIeOT8sVV226Q8CWwUXlcupxl
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
>  meta/recipes-devtools/python/python3-setuptools_31.0.0.bb | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb =
b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
> index 65af6f0..b37b381 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
> @@ -7,11 +7,8 @@ inherit distutils3
> =20
>  DISTUTILS_INSTALL_ARGS +=3D "--install-lib=3D${D}${PYTHON_SITEPACKAGES=
_DIR}"
> =20
> -# The installer puts the wrong path in the setuptools.pth file.  Corre=
ct it.
>  do_install_append() {
> -    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
>      mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
> -    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTH=
ON_SITEPACKAGES_DIR}/setuptools.pth
>  }
> =20
>  RDEPENDS_${PN} =3D "\
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--WL2GHSdWSIeOT8sVV226Q8CWwUXlcupxl--

--cW1FOkrsiUPhr3hbjbP0xgCNsE0lEw9wq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJYm5xVAAoJEFJAtowlSEbndXwH/2MQhLrPC6w4Z5+5NMcxau/Z
9FcNVq6wEMViAzRxCt3qto+O8SM53C88aJXCyVSHGnSoxiBewFNWQh84qXCS7Lm0
TDtuh5KNiHmc2H4b93uHkXxaIq1/gNXm4UICH7m2QpJyv6WEB6AKbG5B9ohd7eoz
TMqq8bPe5j+jTgjm+lNpPUIszH0OPhbpI5jTng4bb+vlwDH+yQwlsmSRvMhTOz3B
dAuvwbvqc2zcaXjL/HWNasVagacLvomtNbtRkNGuufVn5wac398Vk3VpbzVlKrQq
EmmheljpQN+ntJSOgbtJXHfuw3jFwon1BkPJM/LDD2zYDH0ZP4/HDGiWwEUKlSc=
=OR6w
-----END PGP SIGNATURE-----

--cW1FOkrsiUPhr3hbjbP0xgCNsE0lEw9wq--
