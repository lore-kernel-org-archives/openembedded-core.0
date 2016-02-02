Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8DACB771A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:29:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 13:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; 
	d="asc'?scan'208";a="875506452"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.31]) ([10.219.5.31])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2016 13:29:09 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<b93ea288b5195d2bb5628ee3f820b41d1093f9ac.1454424743.git.anibal.limon@linux.intel.com>
	<1693758.K4BiiZTEt9@peggleto-mobl.ger.corp.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56B1201A.8080602@linux.intel.com>
Date: Tue, 2 Feb 2016 15:31:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1693758.K4BiiZTEt9@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 13/20] oeqa/oetest.py: Fix missing oeqa.runtime import.
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
X-List-Received-Date: Tue, 02 Feb 2016 21:29:36 -0000
X-Groupsio-MsgNum: 77365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="2u6sjqNdnWWmhGSr8mgwICP7vw41Jjbfu"

--2u6sjqNdnWWmhGSr8mgwICP7vw41Jjbfu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Yes, but i think is better to import only the module that we need. :)

On 02/02/2016 03:25 PM, Paul Eggleton wrote:
> On Tue, 02 Feb 2016 09:14:16 An=EDbal Lim=F3n wrote:
>> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>>
>> oeqa.runtime import is used in TestContext to get data fixtures
>> directory.
>>
>> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>> ---
>>  meta/lib/oeqa/oetest.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
>> index 28577ef..16705cc 100644
>> --- a/meta/lib/oeqa/oetest.py
>> +++ b/meta/lib/oeqa/oetest.py
>> @@ -18,7 +18,7 @@ except ImportError:
>>      pass
>>  import logging
>>
>> -import oeqa
>> +import oeqa.runtime
>>  from oeqa.utils.decorators import LogResults, gettag, getResults
>>
>>  logger =3D logging.getLogger("BitBake")
>=20
> Are you sure this actually does anything? Importing the parent module s=
hould=20
> already allow access to child modules, AIUI.
>=20
> Cheers,
> Paul
>=20


--2u6sjqNdnWWmhGSr8mgwICP7vw41Jjbfu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWsSAdAAoJEGJqcE9h3glg+l8P/03/ohdiC2mGQycm4Cg3F31S
PwnrFtxK9r7+UBehA1+Db02R8elfWLZf2DIkYuMQRw483swLp2l2pbDkHMCP4CcL
KGSDaSyHfGhI1GCTJ622P3tZeipiS2h2esAtC9Qtil9JK1eUNjvKxB90PAlqmxA/
CIchy7GTZIqYEfMpxv0gGThmxsLxbpmJu4OFBnv1oXgx7k8dtiHErS7bkrSInSXv
A40yvVUeNcK983Y3Rw18Xcqq+dKbwh0tiN6fr9Qlq0Fi69h8XTWREzf4GZ47wwA+
/gDnU4BbsdqL3PK0vwv8plHzF2eP2rK9eLcRvy6JGefYb6zJ8k+A+5YA2IVIs3rk
iiSgA8TS8Z3ui54rJkrRi+56QSOhP5wOeqy5OMuVfrpiIrgEVIlRwLdz7IJ2mTMO
1kEvOmwi33le2mvm2Jbk0lVRzMc4gqVQDkNwD8h6UPPyBUt/DDvQj//oLHA3HtuF
5HNZhXx8Xa3hPMaPI7VfxLWcIhigsU8PxnwnsoWDLjGkj3jkQ0q++gsXjPi9+9YZ
pUVPR7etTTclSC0FXQ6/BeorMLX8Ee4hnP31ooQck5rz4XAe74YbDVmYQqysZKeY
EWU6T5eIlBz6FtxQrcOzO/rqMJWL10DHGwvD1f3sT+F+344cYB3rPDAaYU2e8xyI
iAmWBoqsgOva8uL0EGk/
=cxbk
-----END PGP SIGNATURE-----

--2u6sjqNdnWWmhGSr8mgwICP7vw41Jjbfu--
