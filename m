Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RP8hz-0000d9-34
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 09:13:03 +0100
Received: by wyg8 with SMTP id 8so54483wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 00:06:44 -0800 (PST)
Received: by 10.180.95.132 with SMTP id dk4mr17840237wib.30.1321085204347;
	Sat, 12 Nov 2011 00:06:44 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v10sm8258100wiy.23.2011.11.12.00.06.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Nov 2011 00:06:43 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sat, 12 Nov 2011 09:06:35 +0100
In-Reply-To: <1321085039.26881.14.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <5050804@linux.intel.com>
	<1321083345-29399-1-git-send-email-Martin.Jansa@gmail.com>
	<1321085039.26881.14.camel@ted>
Message-Id: <B6E31C49-661D-493B-9AA1-9499B35ED9AC@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] default-providers: add alsa to resolve multiple runtime providers
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
X-List-Received-Date: Sat, 12 Nov 2011 08:13:03 -0000
X-Groupsio-MsgNum: 12393
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F08B6D8B-5BE2-4F37-9314-944B88D111F5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F08B6D8B-5BE2-4F37-9314-944B88D111F5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 12 nov. 2011, om 09:03 heeft Richard Purdie het volgende geschreven:

> On Sat, 2011-11-12 at 08:35 +0100, Martin Jansa wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> meta/conf/distro/include/default-providers.inc |    1 +
>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/conf/distro/include/default-providers.inc =
b/meta/conf/distro/include/default-providers.inc
>> index afea5e7..79785fb 100644
>> --- a/meta/conf/distro/include/default-providers.inc
>> +++ b/meta/conf/distro/include/default-providers.inc
>> @@ -19,6 +19,7 @@ VIRTUAL-RUNTIME_update-alternatives ?=3D =
"update-alternatives-cworth"
>> #
>> # Default recipe providers
>> #
>> +PREFERRED_PROVIDER_alsa-lib ?=3D "alsa-lib"
>> PREFERRED_PROVIDER_dbus-glib ?=3D "dbus-glib"
>> PREFERRED_PROVIDER_dbus-glib-native ?=3D "dbus-glib-native"
>> PREFERRED_PROVIDER_gdk-pixbuf ?=3D "gdk-pixbuf"
>=20
> What else is providing "alsa-lib"? This sounds like a bug :/

According to Sau!:

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for runtime libasound (alsa-lib, =
alsa-lib-nativesdk)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libasound
NOTE: multiple providers are available for runtime alsa-conf-base =
(alsa-lib, alsa-lib-nativesdk)
NOTE: consider defining a PREFERRED_PROVIDER entry to match =
alsa-conf-base

regards,

Koen=

--Apple-Mail=_F08B6D8B-5BE2-4F37-9314-944B88D111F5
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6+KQ0ACgkQMkyGM64RGpEPkwCgtOIE8z6zZ4uogdjX3PbNIx9G
zOEAnR3IyGOK0omexlBpyOH14btuqlWC
=yNBg
-----END PGP SIGNATURE-----

--Apple-Mail=_F08B6D8B-5BE2-4F37-9314-944B88D111F5--
