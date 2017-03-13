Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BDFA771AC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 20:31:08 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 13 Mar 2017 13:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,160,1486454400"; 
	d="asc'?scan'208";a="67035105"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.117])
	([10.219.128.117])
	by orsmga004.jf.intel.com with ESMTP; 13 Mar 2017 13:31:09 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
	<6ce58472f6ceb0f6e59a215dbbc8343b187931b4.1484667160.git.jose.a.lamego@linux.intel.com>
	<d0dd2aed-a01e-e13a-1bd6-52b1fe06ee07@linux.intel.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <11bfb329-072e-65a3-b22c-5247580e044a@linux.intel.com>
Date: Mon, 13 Mar 2017 14:31:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <d0dd2aed-a01e-e13a-1bd6-52b1fe06ee07@linux.intel.com>
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
X-List-Received-Date: Mon, 13 Mar 2017 20:31:08 -0000
X-Groupsio-MsgNum: 94672
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="P5QjXUMhN7XXKk6WFuBK22pmN4BFNR7iT"

--P5QjXUMhN7XXKk6WFuBK22pmN4BFNR7iT
Content-Type: multipart/mixed; boundary="6Q8WGuclmWAGFOSWeObWCJi4I2BBOtFQJ";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <11bfb329-072e-65a3-b22c-5247580e044a@linux.intel.com>
Subject: Re: [OE-core] [PATCH 2/3] python3-pip: Remove pth file creation at
 recipe level
References: <cover.1484667160.git.jose.a.lamego@linux.intel.com>
 <6ce58472f6ceb0f6e59a215dbbc8343b187931b4.1484667160.git.jose.a.lamego@linux.intel.com>
 <d0dd2aed-a01e-e13a-1bd6-52b1fe06ee07@linux.intel.com>
In-Reply-To: <d0dd2aed-a01e-e13a-1bd6-52b1fe06ee07@linux.intel.com>

--6Q8WGuclmWAGFOSWeObWCJi4I2BBOtFQJ
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
>>  meta/recipes-devtools/python/python3-pip_9.0.1.bb | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3-pip_9.0.1.bb b/meta/=
recipes-devtools/python/python3-pip_9.0.1.bb
>> index 6ac94bb..9dce107 100644
>> --- a/meta/recipes-devtools/python/python3-pip_9.0.1.bb
>> +++ b/meta/recipes-devtools/python/python3-pip_9.0.1.bb
>> @@ -31,9 +31,6 @@ do_install_append() {
>> =20
>>      # Install as pip3 and leave pip2 as default
>>      rm ${D}/${bindir}/pip
>> -
>> -    # Installed eggs need to be passed directly to the interpreter vi=
a a pth file
>> -    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYT=
HON_SITEPACKAGES_DIR}/${SRCNAME}-${PV}.pth
>>  }
>> =20
>>  RDEPENDS_${PN} =3D "\
>>
>=20
>=20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--6Q8WGuclmWAGFOSWeObWCJi4I2BBOtFQJ--

--P5QjXUMhN7XXKk6WFuBK22pmN4BFNR7iT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYxwGOAAoJEFJAtowlSEbnHPUH/jvfEfk53sLcMaJ0c2q/Xpdc
Mc9rffpQlGJvi/nj9bKtXCU3MrCEJvs7BbIgZm1zRiwvlecFfYPfYEPGL8OboRF7
0Wa7RjYdAffSrJLQZ5EbQXAwnKBfAhXZ7nlb7hQqVmHUVbABxoXfSRJI2iw9zexR
6Pff3JDQjnkpnBgUbX5VURNEaHSZHvwLLjHMD3hsRW58IpXZBlZvKkMdoLr9mWXo
LczU/c3nLBaj8rCFLw6f0tbqlWngzIsEfmXmvHGarBsaPyaYRuJ2+fOWbMBfyfJx
umpTQgqgC2qzvH0lXZ9apLHVX9MajuIyNi+/8vClfL6oaX/LxNqcPJtAOgrRKBo=
=Kxwl
-----END PGP SIGNATURE-----

--P5QjXUMhN7XXKk6WFuBK22pmN4BFNR7iT--
