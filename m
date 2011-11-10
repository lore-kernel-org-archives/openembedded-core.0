Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ROUw6-0007NO-Sl
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 14:44:58 +0100
Received: by wwf25 with SMTP id 25so490332wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 05:38:42 -0800 (PST)
Received: by 10.180.5.234 with SMTP id v10mr8656856wiv.44.1320932321373;
	Thu, 10 Nov 2011 05:38:41 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id i8sm4875289wie.11.2011.11.10.05.38.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 05:38:40 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1320931250.1165.18.camel@ted>
Date: Thu, 10 Nov 2011 14:38:33 +0100
Message-Id: <A8FB2C52-B689-46AF-9D24-D1EEBA2B19CF@dominion.thruhere.net>
References: <1320929044-13077-1-git-send-email-koen@dominion.thruhere.net>
	<1320931250.1165.18.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] hicolor-icon-theme 0.12: add BBCLASSEXTEND=native for xfce tools
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
X-List-Received-Date: Thu, 10 Nov 2011 13:44:59 -0000
X-Groupsio-MsgNum: 12307
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A0ECDD8D-D0D7-4042-83AD-B27428971574";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A0ECDD8D-D0D7-4042-83AD-B27428971574
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 10 nov. 2011, om 14:20 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-11-10 at 13:44 +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    2 ++
>> 1 files changed, 2 insertions(+), 0 deletions(-)
>>=20
>> diff --git =
a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb =
b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
>> index 759c9d8..aeb89c9 100644
>> --- =
a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
>> +++ =
b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
>> @@ -5,6 +5,8 @@ BUGTRACKER =3D "https://bugs.freedesktop.org/"
>> LICENSE =3D "GPLv2"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Df08a446809913fc9b3c718f0eaea0426"
>>=20
>> +BBCLASSEXTEND =3D "native"
>> +
>> SECTION =3D "unknown"
>> inherit gnome allarch
>=20
> This is interesting dilemma since this is an allarch recipe. What =
issue
> were you seeing to need this? Could we add the allarch sysroot =
directory
> to PATH to resolve this instead? We could add a PROVIDES
> "hicolor-icon-theme-native" too...

XFCE needs some native tools to run, one of which has hicolor-icon-theme =
in its depends. Without this patch you can't build xfce. Andreas might =
know more about this.

regards,

Koen=

--Apple-Mail=_A0ECDD8D-D0D7-4042-83AD-B27428971574
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6709oACgkQMkyGM64RGpH/7ACgjfw4mAyCcuZuj4IYFDwhY7JS
MVYAoKg2N+8b8iaaK0dHA+bYbWmswsdq
=b2ar
-----END PGP SIGNATURE-----

--Apple-Mail=_A0ECDD8D-D0D7-4042-83AD-B27428971574--
