Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EAF5365C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 23:43:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2016 16:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,407,1470726000"; 
	d="asc'?scan'208";a="1057489509"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2016 16:43:23 -0700
To: openembedded-core@lists.openembedded.org
References: <1475019786-20996-1-git-send-email-anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57EB044C.3070505@linux.intel.com>
Date: Tue, 27 Sep 2016 18:44:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1475019786-20996-1-git-send-email-anibal.limon@linux.intel.com>
Cc: 00moses.alexander00@gmail.com
Subject: Re: [PATCH] db: Upgrade to 6.0.35
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
X-List-Received-Date: Tue, 27 Sep 2016 23:43:25 -0000
X-Groupsio-MsgNum: 87598
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="8IWlf3Um3LOm9fhqT34ClJqFpdfEA607B"

--8IWlf3Um3LOm9fhqT34ClJqFpdfEA607B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

For apply this patch we need to host the db-6.0.35 tarball into yp
sources mirror because oracle page ask for login in order to download
the source.

	alimon

On 09/27/2016 06:43 PM, An=C3=ADbal Lim=C3=B3n wrote:
> This is a minor upgrade that fix an issue related to multiple
> rpm instances querying the database [1].
>=20
> The bugfixes related are,
>=20
> - Fixed a bug that may lead to a crash when opening multiple environmen=
ts
> in a multi-threaded program.
> - Fixed a bug where closing a panic environment raised access violation=

>   and crashed the program.
>=20
> For see the complete list of changes mainly bugfixes between
> 6.0.30 and 6.0.35 [2].
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10157#c0
> [2] http://download.oracle.com/otndocs/products/berkeleydb/html/changel=
og_6_0.html#idp503384
>=20
> [YOCTO #10157]
>=20
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} (96%)
>=20
> diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-suppor=
t/db/db_6.0.35.bb
> similarity index 96%
> rename from meta/recipes-support/db/db_6.0.30.bb
> rename to meta/recipes-support/db/db_6.0.35.bb
> index 072cbdf..4a3b72f 100644
> --- a/meta/recipes-support/db/db_6.0.30.bb
> +++ b/meta/recipes-support/db/db_6.0.35.bb
> @@ -26,8 +26,8 @@ SRC_URI =3D "http://download.oracle.com/berkeley-db/d=
b-${PV}.tar.gz \
>             file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "ad28eb86ad3203b5422844db179c585b"
> -SRC_URI[sha256sum] =3D "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d=
33d54516f3f6a20fd2"
> +SRC_URI[md5sum] =3D "c65a4d3e930a116abaaf69edfc697f25"
> +SRC_URI[sha256sum] =3D "24421affa8ae436fe427ae4f5f2d1634da83d3d55a5ad6=
354a98eeedb825de55"
> =20
>  # Exclude NC versions which lack AES encryption
>  UPSTREAM_CHECK_REGEX =3D "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
>=20


--8IWlf3Um3LOm9fhqT34ClJqFpdfEA607B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJX6wROAAoJEGJqcE9h3glg130P/jLEqNku4aVCTb6Y+wOzMjWA
W6PReaLZ0eYmf/cZTxM8jPHUv/ed3eZuSjafFmBLCwszmatMC+ZWLww+p1wuU+8+
wzqLT4KVTL8/MRkSta8v3DqrSCwh63hE2yFxJTl4sm0Y1qySBOmc1sJv0hAyTgp1
Yfoo7BVvG5+m+c8ZY9L7kRX2pfd01ji5FAaWfRMgQ1y+zwiXqo/hmm65O9ZEiBK+
RKKQX2wwAFKSLurKRBOELPYtUMCeFxzFCgJkrnYzXLejlGCExNCXIETTfv9wtRZe
xlzrfuw1XWAU7wm2OXx4shA+zePJhBWNECWvJ3XofawN1TsxEqGPS2+AQv6JrAo7
TGNSBSnEXrAQSI4YI7o4cAu6Stsk5s9cFqjZ90SZF9vzjKS7Gsmd7gtX6xk/wv9Z
lmxmplpv/NJWHQcA8j1eVRs/tlKdt5NEVLFzQi2ISupKD4kqaCAW52RpfRjYqIod
rVvVvbKtKm6XSx7mPh6f53bgIpT5KmyI7Vsdo3uVoRvluJ41hT9MAtyTaxILApBx
QX2M6LvPaMsMSREn9dg6MnhpbBwOoipdv9xEXkizpTl8bxBfRN5qxF7Q4sfxcQCK
0OwjpoGRBjT9/qdyBXbHLy9I98DNsD+Hsk6/4DfCj3zjFkLvHV+PCp62Upze38Vo
QdckFXJC8cMtaSIi1jBh
=DLus
-----END PGP SIGNATURE-----

--8IWlf3Um3LOm9fhqT34ClJqFpdfEA607B--
