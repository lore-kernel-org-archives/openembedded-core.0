Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id C3D0E60107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 16:13:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 4903B601C8E
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
	<CAHiDW_HmbJRvWjND49gLXCwManmbf2hE8H748mk9+L5RABcYOw@mail.gmail.com>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <564F468A.5040903@collabora.co.uk>
Date: Fri, 20 Nov 2015 17:12:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HmbJRvWjND49gLXCwManmbf2hE8H748mk9+L5RABcYOw@mail.gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] dbus: build with systemd support
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
X-List-Received-Date: Fri, 20 Nov 2015 16:13:02 -0000
X-Groupsio-MsgNum: 73754
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="HHAEBX0cghjmDtjnuo70fHXwqo3noTnXt"

--HHAEBX0cghjmDtjnuo70fHXwqo3noTnXt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20/11/15 17:09, Jussi Kukkonen wrote:
>>  PACKAGECONFIG_class-native =3D ""
>>  PACKAGECONFIG_class-nativesdk =3D ""
>>
>> -# Would like to --enable-systemd but that's a circular
> build-dependency between
>> -# systemd<->dbus
>=20
> Has this issue been somehow resolved since the comment was added?

Yes, systemd doesn't depend on dbus any longer unless explicitly
enabled, as it uses its own dbus library.

--=20
Cheers,
  Andrew


--HHAEBX0cghjmDtjnuo70fHXwqo3noTnXt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWT0aKAAoJEEFnG7NKhJOBQIkQANdBarcI6HkwvzCa3IknN4e2
ICwfmDxh7eshhEaRh4aZTm8TKOmtBaGM7KzBw5hkfaI/BxLfCP6dbK5SV1m2y+Rm
MKuy1XpdmSVhdm4NEu9ybBu7OIGaqBC5cLbeM+BKezKRmTNI28CJb0wauCaiLtN+
bjs9pREbRyBI7vIdLIlyyRXHrThc80hCSvcIHBfFKON/COfiz018ZBwTqwrUMQyL
p2Mbg29vjd9YeMEo4GQbIW6o4ZV3NrT932xx4IM9A6UJeeuohzNyDmy7NUBUZBGI
kfydcKa9+GVxg4z+dvqxNPKQtw9jucZxQnIHHqY81dQxwpZ+fGaQ0AzbnXDQYluK
/STyyzYiVUHfj5wnouhvV3R+tKZlvhuHmEXYgWyXTnf7CXiHbCCXz8hTBhb/D7eD
k6c8rEywiEkT6kOZZMIehiRVICTacunCm2aQqieBq+ioEC7dBKZCaJBPNTJFSfRq
gO+ZXQNLl32fJPzfQUJmIwZBJYYu3CB5QJnU3RSzJz8aa3jzPJ0d7jQFf+C978oI
h7eOEBZDN8yx9CmO32LHVFslQfDueTGQNO0HGtdSVEpcs5rLN679jILI2wNzS+jA
icsUx0Zrobz1d/Hv6WyNQAFuuxP44BdV7+jn9oU4/KQ8qcLe46jMmdLFN8McJYt2
BOozG639kOAmn0EBFKnM
=z2wu
-----END PGP SIGNATURE-----

--HHAEBX0cghjmDtjnuo70fHXwqo3noTnXt--
