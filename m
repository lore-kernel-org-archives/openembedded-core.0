Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC40605BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 15:34:29 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2016 08:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,410,1470726000"; 
	d="asc'?scan'208";a="14145300"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2016 08:34:29 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1475019786-20996-1-git-send-email-anibal.limon@linux.intel.com>
	<57EB044C.3070505@linux.intel.com>
	<CAMKF1so-JOz85vVL0+OPXH2NUmvUkCWkPf+uCn-GUCtfLZjiog@mail.gmail.com>
	<57EBDC0E.9030108@linux.intel.com>
	<CAMKF1sp=M1ZQE7_bv==qkqaG3RKX7QOt0LDeDUmbaQNC0pKwyA@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57EBE336.8010008@linux.intel.com>
Date: Wed, 28 Sep 2016 10:35:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp=M1ZQE7_bv==qkqaG3RKX7QOt0LDeDUmbaQNC0pKwyA@mail.gmail.com>
Cc: Alexandru Moise <00moses.alexander00@gmail.com>,
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
X-List-Received-Date: Wed, 28 Sep 2016 15:34:30 -0000
X-Groupsio-MsgNum: 87624
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WwHdpgViIdGNGx6M8VaktOsinKPT2SXv9"

--WwHdpgViIdGNGx6M8VaktOsinKPT2SXv9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 09/28/2016 10:26 AM, Khem Raj wrote:
> We need to understand that disclaimer may be its requiring every one wh=
o is
> distributing it to accept it.

There is no LICENSE changes in that upgrade the last license changes was
in the version 6.0.20 to AGPL-3 [1].

Also another option is to point to gentoo distfiles mirror for get the
source.

	alimon

[1]
http://download.oracle.com/otndocs/products/berkeleydb/html/changelog_6_0=
=2Ehtml#idp509784

>=20
> On Sep 28, 2016 8:04 AM, "An=C3=ADbal Lim=C3=B3n" <anibal.limon@linux.i=
ntel.com>
> wrote:
>=20
>>
>>
>> On 09/27/2016 08:24 PM, Khem Raj wrote:
>>> On Tue, Sep 27, 2016 at 4:44 PM, An=C3=ADbal Lim=C3=B3n
>>> <anibal.limon@linux.intel.com> wrote:
>>>> For apply this patch we need to host the db-6.0.35 tarball into yp
>>>> sources mirror because oracle page ask for login in order to downloa=
d
>>>> the source.
>>>
>>> why do they ask for login ? is there some disclaimer that needs to be=

>>> accepted before download ?
>>
>> That's right, for be able to build i need to put into my own source
>> mirror for download.
>>
>>>
>>>>
>>>>         alimon
>>>>
>>>> On 09/27/2016 06:43 PM, An=C3=ADbal Lim=C3=B3n wrote:
>>>>> This is a minor upgrade that fix an issue related to multiple
>>>>> rpm instances querying the database [1].
>>>>>
>>>>> The bugfixes related are,
>>>>>
>>>>> - Fixed a bug that may lead to a crash when opening multiple
>> environments
>>>>> in a multi-threaded program.
>>>>> - Fixed a bug where closing a panic environment raised access viola=
tion
>>>>>   and crashed the program.
>>>>>
>>>>> For see the complete list of changes mainly bugfixes between
>>>>> 6.0.30 and 6.0.35 [2].
>>>>>
>>>>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10157#c0
>>>>> [2] http://download.oracle.com/otndocs/products/berkeleydb/
>> html/changelog_6_0.html#idp503384
>>>>>
>>>>> [YOCTO #10157]
>>>>>
>>>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com=
>
>>>>> ---
>>>>>  meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>  rename meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} (9=
6%)
>>>>>
>>>>> diff --git a/meta/recipes-support/db/db_6.0.30.bb
>> b/meta/recipes-support/db/db_6.0.35.bb
>>>>> similarity index 96%
>>>>> rename from meta/recipes-support/db/db_6.0.30.bb
>>>>> rename to meta/recipes-support/db/db_6.0.35.bb
>>>>> index 072cbdf..4a3b72f 100644
>>>>> --- a/meta/recipes-support/db/db_6.0.30.bb
>>>>> +++ b/meta/recipes-support/db/db_6.0.35.bb
>>>>> @@ -26,8 +26,8 @@ SRC_URI =3D "http://download.oracle.com/
>> berkeley-db/db-${PV}.tar.gz \
>>>>>             file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch =
\
>>>>>             "
>>>>>
>>>>> -SRC_URI[md5sum] =3D "ad28eb86ad3203b5422844db179c585b"
>>>>> -SRC_URI[sha256sum] =3D "608e4b1cf390e9bf54c0ef00c5bd9c
>> a76d36e2261b9f4d33d54516f3f6a20fd2"
>>>>> +SRC_URI[md5sum] =3D "c65a4d3e930a116abaaf69edfc697f25"
>>>>> +SRC_URI[sha256sum] =3D "24421affa8ae436fe427ae4f5f2d16
>> 34da83d3d55a5ad6354a98eeedb825de55"
>>>>>
>>>>>  # Exclude NC versions which lack AES encryption
>>>>>  UPSTREAM_CHECK_REGEX =3D "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
>>>>>
>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>
>>
>=20


--WwHdpgViIdGNGx6M8VaktOsinKPT2SXv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJX6+M4AAoJEGJqcE9h3glgp/MP/0Smw+G5EqtLq0BUOtfnwESL
SN9yBWIsXlPHy3NlbBFR8xsnu30EYYt5d1fwBv43W5nXufDUJfAzusIQifO+euWn
ZWolPaxnk/BfymDB51H0s7friv9GEvJlPby0D2R8t0wwmVpkjEh/82TFUk5yCEPx
k+TOQJzymYxM/rIUXcQ/95JXarUGIF5IRyUWNov/79qWIkz7RNE9LoZ7SaxabsnN
8q9RBiO6KsjyycRXf4c0NuAyaD6e+K4sY4AkLtuJgboUGVEvLGrTwey2dl7XFd9P
ubjC9ZniTGNIhMxyOczM08i61pmI6xUsI4Ym/2rjwHSO/ilSvszhfK0RlPSjDboD
6+dh5DUgkZIwGo3wrPtGd66Fy7ObjJdwUgogDL/e7DmuHA5bmN+Lpd44Q4UClQEo
yEH8LDpZZbukwYhCkgn8t8b6yZPfeWmX5KVbK6HauQr+SPcYhEgyJw5PF9TDgEeV
XkPygHs738TsBOuUIDcALxyhsHb1ovHah9kSVeg+vKE9Tl6+Ct/BZtFo+h05Kntb
gnHc4tSufqshI58UzvOFi//xtUk2IE6H/0xhhMQXvwCJHDHDhYW2NMnROflCVbEN
M+6gzJydrJT2Jok26zAEQHyYmKgcrwXyjD4SXRS40db3Dj1A+GumSsv+jF/P8qe4
Sj9LA1BR7rblo/Kafkul
=j/Lj
-----END PGP SIGNATURE-----

--WwHdpgViIdGNGx6M8VaktOsinKPT2SXv9--
