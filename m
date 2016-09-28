Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6629860684
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 16:58:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 28 Sep 2016 09:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,410,1470726000"; 
	d="asc'?scan'208";a="884754718"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by orsmga003.jf.intel.com with ESMTP; 28 Sep 2016 09:58:04 -0700
To: Julien Gueytat <contact@jgueytat.fr>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1475078770-26139-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LbTrb=-boXa+p6oWxvu9RS1V6hMPKrXBFOOHS0yTmv+Og@mail.gmail.com>
	<57EBF027.9000300@jgueytat.fr>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57EBF6CD.8040107@linux.intel.com>
Date: Wed, 28 Sep 2016 11:58:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <57EBF027.9000300@jgueytat.fr>
Cc: 00moses.alexander00@gmail.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 16:58:04 -0000
X-Groupsio-MsgNum: 87630
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="pSKpXEBBg5s1Bm5frA8SD0s8mvjx0UK2B"

--pSKpXEBBg5s1Bm5frA8SD0s8mvjx0UK2B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 09/28/2016 11:30 AM, Julien Gueytat wrote:
> Related to the db recipe. There are also the patches that needs to be
> regenerated as the same patches are applied for the two current version=
s.
> At least on Ubuntu 16.06 the same patch can't be applied anymore on the=

> two versions as the lines where to apply the patches differs too much.

This is a quite strange, i'm wondering why can't be applied, i expect if
a patch fails in configure/compile stages not at patch apply.

Could you put here the error log please?

	alimon

>
>=20
> Le 28/09/2016 18:24, Burton, Ross a =C3=A9crit :
>>
>> On 28 September 2016 at 17:06, An=C3=ADbal Lim=C3=B3n
>> <anibal.limon@linux.intel.com <mailto:anibal.limon@linux.intel.com>>
>> wrote:
>>
>>     @@ -18,16 +18,15 @@ RCONFLICTS_${PN} =3D "db3"
>>      PR =3D "r1"
>>
>>
>> Remove this PR please.
>>
>>      # Note, when upgraded to 6.1.x, a patch in RPM will need to be
>>     removed to activate db 6.1 support.
>>     -
>>     -SRC_URI =3D "http://download.oracle.com/berkeley-db/db-${PV}.tar.=
gz
>>     <http://download.oracle.com/berkeley-db/db-$%7BPV%7D.tar.gz> \
>>     +SRC_URI =3D "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.g=
z
>>     <http://distfiles.gentoo.org/distfiles/db-$%7BPV%7D.tar.gz> \
>>
>>
>> What is distfiles.gentoo.org <http://distfiles.gentoo.org>'s policy
>> when db-6.0.36 is released?  Could the tarball be deleted the day
>> after we release?  In general we've been either using
>> snapshot.debian.org <http://snapshot.debian.org> or pointing directly
>> at the yoctoproject.org <http://yoctoproject.org> source mirror for
>> tarballs we can't rely upon over time.
>>
>> Ross
>>
>>
>=20
>=20


--pSKpXEBBg5s1Bm5frA8SD0s8mvjx0UK2B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJX6/bQAAoJEGJqcE9h3glgiEUQAI9+zzPcZ/dKibIORfbZP8jL
NqWcvL3whDr4p4PXz45z1i1uO/T4F/KlP9dhcfWkHBTPkIzfrilUfXtqXrZiKHXL
x7zmOJVsdLSIAfuUgKWkzFMWZIyrZQwruaKzgg+SFvi9n1ZYYk8UM7An8O6Xu7zP
LYY2RFKlWW9sf8UDUJauRLW00fF2MHS6wSCs7I8aXw2/9N23zfKpp22pJ79tI7ra
2ZekmwJpT5nFnZKa1VezXRTBctXiG6gZT0NFQz1eryIquTI8+wgFX1Rb8tivZxdf
7eIdHlgmYMxspdkLmrn3jUywXgQVhae95NuVgzlp6LEIZURFJrzH2d993AY/h6YK
tr8dzS5B3cpnNg+iYJN5XTmBYiS0M0CCuYMaPedrKjlGZfIlI1Buco9B9id+c/Ra
JSLnCiFj3foudlFAKQMH1q+g4N0mz6C90POLI0w8KdGfAfO4uqgIJ1liK92ZYRb+
TBNWL32y7Czbqj/ga/L3kiDvZM4rCsHe1r+G9QRtJOlLhY9h058R1tEVTHwcfdCV
Upug7iIONSS20EOZn9rcgaGocFYGTWsWHcayKbcaeHLOZ8gQ+VBdjL60TAF9jQQZ
2dn6fD0xNDM17FRSO7H5pgyQ58JOj3tKWob0lkD98YIpwuhrSvP0oYZcH7LV/QHh
+7DHMf9TIF6yOvDQSZiR
=AZpF
-----END PGP SIGNATURE-----

--pSKpXEBBg5s1Bm5frA8SD0s8mvjx0UK2B--
