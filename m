Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSo2P-0006Wp-0W
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 11:57:17 +0100
Received: by faat2 with SMTP id t2so227337faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 02:50:46 -0800 (PST)
Received: by 10.180.20.134 with SMTP id n6mr18114014wie.49.1321959046216;
	Tue, 22 Nov 2011 02:50:46 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ep13sm16198554wbb.8.2011.11.22.02.50.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 02:50:45 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 22 Nov 2011 11:50:40 +0100
In-Reply-To: <1321957632.3457.6.camel@mattotaupa>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
	<1321952894.3457.3.camel@mattotaupa>
	<3B1350D1-672D-47EB-9BB1-29E2F292F67B@dominion.thruhere.net>
	<1321957632.3457.6.camel@mattotaupa>
Message-Id: <F8D21CD9-EF14-407B-9A3F-0C602759411E@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 22 Nov 2011 10:57:18 -0000
X-Groupsio-MsgNum: 12709
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3FDB183D-7C2A-43C2-95A6-3063DD678CC7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3FDB183D-7C2A-43C2-95A6-3063DD678CC7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 22 nov. 2011, om 11:27 heeft Paul Menzel het volgende geschreven:

> Am Dienstag, den 22.11.2011, 11:19 +0100 schrieb Koen Kooi:
>> Op 22 nov. 2011, om 10:08 heeft Paul Menzel het volgende geschreven:
>=20
>>> Am Montag, den 21.11.2011, 19:12 +0100 schrieb Koen Kooi:
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>> meta/recipes-devtools/libjson/libjson_0.9.bb |   13 +++++++++++++
>>>> 1 files changed, 13 insertions(+), 0 deletions(-)
>>>> create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>>>>=20
>>>> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb =
b/meta/recipes-devtools/libjson/libjson_0.9.bb
>>>> new file mode 100644
>>>> index 0000000..4d609a6
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/libjson/libjson_0.9.bb
>>>> @@ -0,0 +1,13 @@
>>>> +DESCRIPTION =3D "JSON-C - A JSON implementation in C"
>>>> +
>>>> +LICENSE =3D "MIT/X11"
>>>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D30a276a476b02c2dcd0849bde417fb17"
>>>=20
>>> please add at least the field `HOMEPAGE` as it is done in OE-classic
>>> [1].
>>>=20
>>>> +SRC_URI =3D =
"http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"
>>=20
>> Since the homepage can be derived from SRC_URI, is it really needed?
>=20
> I always thought these metadata fields are used by interfaces like
> package managers to allow people to know more about the =
package/program.

You are right, I've modified the patch and will show up in v2.

regards,

Koen=

--Apple-Mail=_3FDB183D-7C2A-43C2-95A6-3063DD678CC7
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7LfoMACgkQMkyGM64RGpH9vwCcDq8AfTy1FayIa+jSz4/s38xE
w30AoLMNclLV8ydtM4P06FrL1vNpMclN
=P4lO
-----END PGP SIGNATURE-----

--Apple-Mail=_3FDB183D-7C2A-43C2-95A6-3063DD678CC7--
