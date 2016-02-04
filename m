Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 596A877156
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:11:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Feb 2016 12:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; 
	d="asc'?scan'208";a="896564078"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2016 12:11:22 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<bda52d72f2448b404f7973ff4d9425ae4da4067e.1454459362.git.anibal.limon@linux.intel.com>
	<6962182.mWZCD3Ya9n@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B3B0E0.6050307@linux.intel.com>
Date: Thu, 4 Feb 2016 14:13:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <6962182.mWZCD3Ya9n@peggleto-mobl.ger.corp.intel.com>
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 27/28] classes/testimage: exportTests simple improvment to use list instead of test expresions.
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
X-List-Received-Date: Thu, 04 Feb 2016 20:11:21 -0000
X-Groupsio-MsgNum: 77535
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="LXdRkmnGEmxHDUkH2vqr3BKGhvI0PvoD0"

--LXdRkmnGEmxHDUkH2vqr3BKGhvI0PvoD0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Ok agreed.

On 02/04/2016 12:34 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 18:30:39 An=EDbal Lim=F3n wrote:
>> It's better to use a list instead if variable isn't match some value.
>>
>> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>> ---
>>  meta/classes/testimage.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.b=
bclass
>> index 57858e6..7fff29f 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -112,7 +112,7 @@ def exportTests(d,tc):
>>      savedata["host_dumper"] =3D {}
>>      for key in tc.__dict__:
>>          # special cases
>> -        if key !=3D "d" and key !=3D "target" and key !=3D "host_dump=
er" and key
>> !=3D "suite": +        if key not in ['d', 'target', 'host_dumper', 's=
uite']:
>>              savedata[key] =3D getattr(tc, key)
>>      savedata["target"]["ip"] =3D tc.target.ip or d.getVar("TEST_TARGE=
T_IP",
>> True) savedata["target"]["server_ip"] =3D tc.target.server_ip or
>> d.getVar("TEST_SERVER_IP", True)
>=20
> Please squash this into the commit where you're adding the "suite" item=
=2E
>=20
> Cheers,
> Paul
>=20


--LXdRkmnGEmxHDUkH2vqr3BKGhvI0PvoD0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWs7DiAAoJEGJqcE9h3glgto0P/RV34YM0lR0prwJVVFcRPk4G
9aPNOpKnLleuJ1DvNQTSR6QOc4uC0o1PBHxqBJwrsBREn8hjy8D9N8vVKkQPILJe
GSr8JgqIksBGS48jGEK73qLFkDLdz8JoKFl5YFLt3eDco74KSGHRZVmzYybETMTi
RpLmrDpg8wDLLXHzsz7Qq6phzIy+jgSA7tUhEs6ThPQtDmtn7zfJevaHmQWJ+tq6
eMf9RiXT9VAwgW3Fwh4y2dIloG60UmwnZj5OBItrFELOGIPoHjiDelPYukPgAuUm
nvP+42H/zMTsV+c+g7FpMoluiQq5ZqrCKsgm8iag9Z7EyFCo1wKjKhNA8V7ZxH+F
9ep4GEccP6lazx+LgSTBQp0q4FOwaECV0mPByJXK+eETNOFRFwXynxXjzoDPoOjq
Xij1EyRGOzUy78eg7UERxHNjO1J3eTgCZ7g4W5b/8DtW0ulaJ8wMF3dgh8IFQHwy
3dUGNdm3dX8+k4eIFrLkOv1P00vSQTwap45WSIpzcc772zJN+ulXqr3c0mnTJv71
EoygqKk1stmQClZmIg05g6TJYRbJT61JQ0o8JvrghnYHQ1VJLnCIcMnWmcSbe7CW
r+7WLSfoITWaLUYl879U5BVKqWLDoM1DJ61PmzTgs2BOyD2Alqecaf622ly8THIG
NVGz7VFnLP/y31D5vWv0
=n+JT
-----END PGP SIGNATURE-----

--LXdRkmnGEmxHDUkH2vqr3BKGhvI0PvoD0--
