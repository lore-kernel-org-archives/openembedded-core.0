Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSnYN-0003e9-9U
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 11:26:16 +0100
Received: by wwp14 with SMTP id 14so31880wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 02:19:44 -0800 (PST)
Received: by 10.227.205.9 with SMTP id fo9mr11692616wbb.6.1321957184575;
	Tue, 22 Nov 2011 02:19:44 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v6sm6490279wix.1.2011.11.22.02.19.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 02:19:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 22 Nov 2011 11:19:38 +0100
In-Reply-To: <1321952894.3457.3.camel@mattotaupa>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
	<1321952894.3457.3.camel@mattotaupa>
Message-Id: <3B1350D1-672D-47EB-9BB1-29E2F292F67B@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC][PATCH 1/2] libjson: add 0.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Nov 2011 10:26:16 -0000
X-Groupsio-MsgNum: 12705
Content-Type: multipart/signed;
	boundary="Apple-Mail=_551B9D2B-96CF-4E93-97D7-31011105607F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_551B9D2B-96CF-4E93-97D7-31011105607F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 22 nov. 2011, om 10:08 heeft Paul Menzel het volgende geschreven:

> Dear Koen,
>=20
>=20
> Am Montag, den 21.11.2011, 19:12 +0100 schrieb Koen Kooi:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-devtools/libjson/libjson_0.9.bb |   13 +++++++++++++
>> 1 files changed, 13 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>>=20
>> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb =
b/meta/recipes-devtools/libjson/libjson_0.9.bb
>> new file mode 100644
>> index 0000000..4d609a6
>> --- /dev/null
>> +++ b/meta/recipes-devtools/libjson/libjson_0.9.bb
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION =3D "JSON-C - A JSON implementation in C"
>> +
>> +LICENSE =3D "MIT/X11"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D30a276a476b02c2dcd0849bde417fb17"
>=20
> please add at least the field `HOMEPAGE` as it is done in OE-classic
> [1].
>=20
>> +SRC_URI =3D "http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"

Since the homepage can be derived from SRC_URI, is it really needed?

regards,

Koen=

--Apple-Mail=_551B9D2B-96CF-4E93-97D7-31011105607F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7LdzwACgkQMkyGM64RGpGnbQCfdnWP1tKk3navEM6YkoKv96v0
K7YAniClhm9jJ7PbdnSA1FkB7LvQTEnG
=qkdv
-----END PGP SIGNATURE-----

--Apple-Mail=_551B9D2B-96CF-4E93-97D7-31011105607F--
