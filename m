Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2B63B7728F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:31:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2016 14:31:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="41319936"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2016 14:31:34 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454436558.git.anibal.limon@linux.intel.com>
	<01b550d016c48dd518dfdcd8ffb4e1c3255abbbb.1454436558.git.anibal.limon@linux.intel.com>
	<1500430.HvkegzEm32@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B12EA2.5040807@linux.intel.com>
Date: Tue, 2 Feb 2016 16:33:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1500430.HvkegzEm32@peggleto-mobl.ger.corp.intel.com>
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/21] classes/testimage: Fix exportTests function.
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
X-List-Received-Date: Tue, 02 Feb 2016 22:31:38 -0000
X-Groupsio-MsgNum: 77391
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="sKJTUro9em6TrS1OgBO8SanX1xpcrxhWS"

--sKJTUro9em6TrS1OgBO8SanX1xpcrxhWS
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/02/2016 04:30 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 12:09:37 An=EDbal Lim=F3n wrote:
>> With new structure of TestContext now holds suite and variable
>> that contains unittest instances,  it can't be exported using
>> JSON causing and exception.
>>
>> Adds the suite variable for avoid export it.
>>
>> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
>> ---
>>  meta/classes/testimage.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.b=
bclass
>> index 5fafda1..57858e6 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -112,7 +112,7 @@ def exportTests(d,tc):
>>      savedata["host_dumper"] =3D {}
>>      for key in tc.__dict__:
>>          # special cases
>> -        if key !=3D "d" and key !=3D "target" and key !=3D "host_dump=
er":
>> +        if key !=3D "d" and key !=3D "target" and key !=3D "host_dump=
er" and key
>> !=3D "suite": savedata[key] =3D getattr(tc, key)
>=20
> Given how long this is getting we might want to change to:
>=20
>   if key not in ['d', 'target', 'host_dumper', 'suite']:

Good one...

>=20
> Cheers,
> Paul
>=20


--sKJTUro9em6TrS1OgBO8SanX1xpcrxhWS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsS6+AAoJEGJqcE9h3glgBi0P/2Ik+qxvDuzX8BPAFlnwcqE5
S881j/xLAOsiRShSXsj3cMItm0/3TRZGoMHjJL235yD8HzzBpgbVJlhZgz5/iSKy
7H8G30x1HweIr6JupHIurKoGvqMRQc8L8wTN/ho0jFg15kAEqGERGY2eXdVe6KNi
xYgSuuwUqDKYv4GE2exjL7vmjBp/LWcL/ZI0LlyZoqTv1gW7xs3c3SHGckNIVhxi
cnuQH4ZEK7IoLHkOZ/QmqUeSdEqL8jEsq3CN9g3Df2pRhmuqBpJmgMrW3Gar4dP3
kai8ovSPjV8YXxpGn3hCz9Kfl8G9BDKz2GimCjctrDOFbnhdUip0WTYCEmrn2zXc
2y9rK+7i9P0/QqjlDU+YL7XSndD8lesTWSwqpqGzyy6jVWetFZ5WcDQ9DLbDfoRa
aJKJXQbPw2iMQORlmEY4OZJPc/+awvQDGbMNYgNMpbNvkwZggn0nFP19TQg1IQMW
VS0P3LCnR/vcfKHhBjTqlRcMD+12VlBSaNXIXTS8YRAiI3XEW/LTsOLeQI9W+0rl
m6kWjVkr2PcGQ7Bg5m+X/qvgnh4ZNRb/cH/UI6WJ5hkx2/w1AAnMeuTQzxVQiON5
lEC0eisd/ahVCuWgWvH5Hf5HLZn51EBViS+0KJQl8bHn2V2cmU5VsOESbBNru4eS
xEZl1ntjufn0e1aPqZUH
=erQb
-----END PGP SIGNATURE-----

--sKJTUro9em6TrS1OgBO8SanX1xpcrxhWS--
