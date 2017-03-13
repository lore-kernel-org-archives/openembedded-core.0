Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 03B8F60796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 20:31:19 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 13:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,160,1486454400"; 
	d="asc'?scan'208";a="67035155"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.117])
	([10.219.128.117])
	by orsmga004.jf.intel.com with ESMTP; 13 Mar 2017 13:31:20 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
	<fb56a1c1aaeb6f6cf4b415b029e58124057ef662.1484667160.git.jose.a.lamego@linux.intel.com>
	<0efb730d-3b87-9c1d-8a46-e5572ba29222@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <8673f676-59b8-2543-7afe-5be476cc8298@linux.intel.com>
Date: Mon, 13 Mar 2017 14:31:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <0efb730d-3b87-9c1d-8a46-e5572ba29222@linux.intel.com>
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
X-List-Received-Date: Mon, 13 Mar 2017 20:31:20 -0000
X-Groupsio-MsgNum: 94673
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="hBn3POvsAnaAURlJlRh4WSWV1OFqC9pk7"

--hBn3POvsAnaAURlJlRh4WSWV1OFqC9pk7
Content-Type: multipart/mixed; boundary="Iok5aIQWQkS68KCg4KiERhj6rFXN10T9e";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <8673f676-59b8-2543-7afe-5be476cc8298@linux.intel.com>
Subject: Re: [OE-core] [PATCH 3/3] python3-setuptools: Remove pth file
 creation at recipe level
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
 <fb56a1c1aaeb6f6cf4b415b029e58124057ef662.1484667160.git.jose.a.lamego@linux.intel.com>
 <0efb730d-3b87-9c1d-8a46-e5572ba29222@linux.intel.com>
In-Reply-To: <0efb730d-3b87-9c1d-8a46-e5572ba29222@linux.intel.com>

--Iok5aIQWQkS68KCg4KiERhj6rFXN10T9e
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Ping.

On 02/08/2017 04:31 PM, Jose Lamego wrote:
> Ping.
>=20
> On 01/17/2017 09:42 AM, Jose Lamego wrote:
>> Handling of installed eggs is now performed at the distutils3 bbclass.=

>>
>> This change removes the pth file creation at recipe level.
>>
>> [YOCTO #8673]
>>
>> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
>> ---
>>  meta/recipes-devtools/python/python3-setuptools_31.0.0.bb | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb=
 b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
>> index 65af6f0..b37b381 100644
>> --- a/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
>> +++ b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
>> @@ -7,11 +7,8 @@ inherit distutils3
>> =20
>>  DISTUTILS_INSTALL_ARGS +=3D "--install-lib=3D${D}${PYTHON_SITEPACKAGE=
S_DIR}"
>> =20
>> -# The installer puts the wrong path in the setuptools.pth file.  Corr=
ect it.
>>  do_install_append() {
>> -    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
>>      mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
>> -    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYT=
HON_SITEPACKAGES_DIR}/setuptools.pth
>>  }
>> =20
>>  RDEPENDS_${PN} =3D "\
>>
>=20
>=20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--Iok5aIQWQkS68KCg4KiERhj6rFXN10T9e--

--hBn3POvsAnaAURlJlRh4WSWV1OFqC9pk7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYxwGZAAoJEFJAtowlSEbnv/YH/ihtrFRssHmnVk8qtJITBj5T
f4ChcEc9VdTfdrp6gtyC3Dwtdhb0Hs4y4+fmlMqDtRDsE6d0EqcrXZeUOyMyhutt
6ZrMWkR2nr00wWQ9e3tWb0Uw0sDjvEeajpcaKEdUgYYcjhH1c7x8F1PHFJtYZI3O
dK9dB3EyGAkxrR4YapE99l1TCF0kO697JZ24ZiNOhB/QVlKly7geFLeuUGqJKup1
Ub7tNi53QReYdnQdeedZQObTsQqC8T3wI5xgAa3m85B/7nY3mSG/mElf0k4j7ny0
phIV7tGleue7mC6XRJCx7MWuRqK/eMG+uTfyFg7i5szPiwofhDAsKmeutNgpUGY=
=GAqa
-----END PGP SIGNATURE-----

--hBn3POvsAnaAURlJlRh4WSWV1OFqC9pk7--
