Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 370FC719D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 19:29:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 03 Oct 2016 12:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,291,1473145200"; 
	d="asc'?scan'208";a="886301975"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.33]) ([10.219.5.33])
	by orsmga003.jf.intel.com with ESMTP; 03 Oct 2016 12:29:21 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1475522247-9924-1-git-send-email-anibal.limon@linux.intel.com>
	<10109248.sKfs07qT7T@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57F2B1C7.4070305@linux.intel.com>
Date: Mon, 3 Oct 2016 14:30:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <10109248.sKfs07qT7T@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [PATCH] db: Remove unneeded PR
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
X-List-Received-Date: Mon, 03 Oct 2016 19:29:21 -0000
X-Groupsio-MsgNum: 87827
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="IQWtahSCqbXKaaJ42brB6xKLEI1940dHl"

--IQWtahSCqbXKaaJ42brB6xKLEI1940dHl
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 10/03/2016 02:25 PM, Paul Eggleton wrote:
> On Mon, 03 Oct 2016 14:17:27 An=EDbal Lim=F3n wrote:
>> The PR is not need so remove it after upgrade to 6.0.35.
>>
>> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>> ---
>>  meta/recipes-support/db/db_6.0.35.bb | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/db/db_6.0.35.bb
>> b/meta/recipes-support/db/db_6.0.35.bb index 32afbe8..ecb1bee 100644
>> --- a/meta/recipes-support/db/db_6.0.35.bb
>> +++ b/meta/recipes-support/db/db_6.0.35.bb
>> @@ -15,8 +15,6 @@ LICENSE =3D "AGPL-3.0"
>>  VIRTUAL_NAME ?=3D "virtual/db"
>>  RCONFLICTS_${PN} =3D "db3"
>>
>> -PR =3D "r1"
>> -
>>  # Note, when upgraded to 6.1.x, a patch in RPM will need to be remove=
d to
>> activate db 6.1 support. SRC_URI =3D
>> "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz \
>> file://arm-thumb-mutex_db5.patch \
>=20
> I think it's too late to do this unfortunately - it needs to be done at=
 the=20
> same time as the upgrade.

I sent a PATCHv3 [1] removing the PR but unfortunately was not integrated=
=2E

[1]
http://lists.openembedded.org/pipermail/openembedded-core/2016-September/=
127027.html

Cheers,
	alimon

>=20
> Cheers,
> Paul
>=20


--IQWtahSCqbXKaaJ42brB6xKLEI1940dHl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJX8rHMAAoJEGJqcE9h3glgrBsP/3CTm4vvddRbgj/Ef9ZoOUJp
RvL+hc2hOCQc6m7pnC/+UKH8JKcYxiHTf558DZKZEbuTH73F+2v8auNwMBTufOBI
f69lcOzFfldw4pMWn6iy2Dsr85y7zko5uDdFfwzaRKxZ5aOXDuP7alTdKQkw3XRs
+MDc7D8w1uOY1HuTKyiaFPKn6lIvohJp/zjh9QVCYG9ls6waF+6TLp/TwUj/rqgE
hnv5PEiBq1Yf91ckc5r4y3DeObPJBBF4NabLraCxTgzHqtV9FMtm3Obj3JUg+4Na
xJadAxUJbY85/9XMSJndPNyqauCzsB9uJmNIp1q1pccY5epAQo0Id957lTlPIK/Y
XHBG24y3qVI1W1DmPAAH2r2GLgdo9l6LKquVtd10cLjMr5PnXY+OE/MUHgD7HbpT
EE9gTbp86qw1BjSx427fSLSEPDzw/khfjRg2eh5wuujBVMONEnJwcDch6+T5gBXQ
dBvEK0CwW67SgUbzn7+LCs0veaN8PZ3T7Jrf5kda4/0OFjcRleFvxQBZZJS6yPu5
uMaza8n56U6vFNwgwKOmHllcn+gLmOlKbfVz5kVcshbdwW+IAVvlGrZkaK71p/mL
xL+opjuaZjNBWxC/b6CLLU42APA/OCoMztkLzec6x7L415e/R+1Bk102gBVmzbzM
iD2dNCGfKbiDalyY2Jl6
=iafC
-----END PGP SIGNATURE-----

--IQWtahSCqbXKaaJ42brB6xKLEI1940dHl--
