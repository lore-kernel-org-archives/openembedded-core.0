Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 64F06605BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 15:03:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 28 Sep 2016 08:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,410,1470726000"; 
	d="asc'?scan'208";a="1057789761"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by orsmga002.jf.intel.com with ESMTP; 28 Sep 2016 08:03:58 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1475019786-20996-1-git-send-email-anibal.limon@linux.intel.com>
	<57EB044C.3070505@linux.intel.com>
	<CAMKF1so-JOz85vVL0+OPXH2NUmvUkCWkPf+uCn-GUCtfLZjiog@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57EBDC0E.9030108@linux.intel.com>
Date: Wed, 28 Sep 2016 10:04:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so-JOz85vVL0+OPXH2NUmvUkCWkPf+uCn-GUCtfLZjiog@mail.gmail.com>
Cc: 00moses.alexander00@gmail.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 28 Sep 2016 15:03:57 -0000
X-Groupsio-MsgNum: 87621
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="gN6SVVQ12g6A55rwlfcvxplOmAerCLLuc"

--gN6SVVQ12g6A55rwlfcvxplOmAerCLLuc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 09/27/2016 08:24 PM, Khem Raj wrote:
> On Tue, Sep 27, 2016 at 4:44 PM, An=C3=ADbal Lim=C3=B3n
> <anibal.limon@linux.intel.com> wrote:
>> For apply this patch we need to host the db-6.0.35 tarball into yp
>> sources mirror because oracle page ask for login in order to download
>> the source.
>=20
> why do they ask for login ? is there some disclaimer that needs to be
> accepted before download ?

That's right, for be able to build i need to put into my own source
mirror for download.

>=20
>>
>>         alimon
>>
>> On 09/27/2016 06:43 PM, An=C3=ADbal Lim=C3=B3n wrote:
>>> This is a minor upgrade that fix an issue related to multiple
>>> rpm instances querying the database [1].
>>>
>>> The bugfixes related are,
>>>
>>> - Fixed a bug that may lead to a crash when opening multiple environm=
ents
>>> in a multi-threaded program.
>>> - Fixed a bug where closing a panic environment raised access violati=
on
>>>   and crashed the program.
>>>
>>> For see the complete list of changes mainly bugfixes between
>>> 6.0.30 and 6.0.35 [2].
>>>
>>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10157#c0
>>> [2] http://download.oracle.com/otndocs/products/berkeleydb/html/chang=
elog_6_0.html#idp503384
>>>
>>> [YOCTO #10157]
>>>
>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>>> ---
>>>  meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>  rename meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} (96%=
)
>>>
>>> diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-supp=
ort/db/db_6.0.35.bb
>>> similarity index 96%
>>> rename from meta/recipes-support/db/db_6.0.30.bb
>>> rename to meta/recipes-support/db/db_6.0.35.bb
>>> index 072cbdf..4a3b72f 100644
>>> --- a/meta/recipes-support/db/db_6.0.30.bb
>>> +++ b/meta/recipes-support/db/db_6.0.35.bb
>>> @@ -26,8 +26,8 @@ SRC_URI =3D "http://download.oracle.com/berkeley-db=
/db-${PV}.tar.gz \
>>>             file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch \
>>>             "
>>>
>>> -SRC_URI[md5sum] =3D "ad28eb86ad3203b5422844db179c585b"
>>> -SRC_URI[sha256sum] =3D "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f=
4d33d54516f3f6a20fd2"
>>> +SRC_URI[md5sum] =3D "c65a4d3e930a116abaaf69edfc697f25"
>>> +SRC_URI[sha256sum] =3D "24421affa8ae436fe427ae4f5f2d1634da83d3d55a5a=
d6354a98eeedb825de55"
>>>
>>>  # Exclude NC versions which lack AES encryption
>>>  UPSTREAM_CHECK_REGEX =3D "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
>>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


--gN6SVVQ12g6A55rwlfcvxplOmAerCLLuc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJX69wRAAoJEGJqcE9h3glgM1EP/jSdoO4bALXoxDhTIccXsvC1
dQkeKBRX9albdn5rY9Pdqo6ZaIi0AvbTYJocGokG9dyTnsPdJlezj1cVgcTcnYaz
HNM1ZRobfvWiFOzr70vZt3UaHxJA9LFjOJrd8THMSy6X8t5/Z3uQMeG6mXNBSW0q
ddF67THSIn4rub54/fSM541HRR6H9UGKYK6k5q14Zas70V8Er/ZF9iS/patMLmW5
HmksxMMxkIS0Vo91fHA/KxGutXgJziKcwZdWLquKmL+UlKkj6PZexA0mECNSn8T/
0+BFxdjJ2wNv2dnvjgsR5XTfVcuPAkXrwZDbB+amCiJ5HdejFmG4T9lbPBjwSaPW
zTxoPgG2cmdJkcn9mY1X47IHgvGn0c/aBf2QpQafKguoPTfV3HmLO7H1GZYmhNER
CzsdGjWBdNK8t3RBMi2uzaKNkCbBgmOit86XOYX6MWabT4W2XoOvHAdu9XQ9uS/+
bpCBXZHylCUAjLxhQZnhzisDpc+dUWgtsNrCFJPOlUgeZNm3bjSlENRP3G6vVBqe
NMV+Wp0ryn0/j7HM3bPJrvkGuefp9C8LCbR3mswg+6FwrcGlZBv0G4FSrETpJ/hR
fwXK064hg3rP/+OtSRJBcfy8lApOjvVCo8+w1nYb7YnoiRPJ0glNfss0Utlp3rYS
vXB6S8wepQveMXAgVVUz
=iCts
-----END PGP SIGNATURE-----

--gN6SVVQ12g6A55rwlfcvxplOmAerCLLuc--
