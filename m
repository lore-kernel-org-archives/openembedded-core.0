Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RlKuh-0000qQ-82
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 14:41:55 +0100
Received: by werm13 with SMTP id m13so1506212wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 05:34:24 -0800 (PST)
Received: by 10.216.131.234 with SMTP id m84mr1593405wei.11.1326375264296;
	Thu, 12 Jan 2012 05:34:24 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id m13sm5774241wbh.0.2012.01.12.05.34.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 05:34:23 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120112121949.GB3452@jama.jama.net>
Date: Thu, 12 Jan 2012 14:34:17 +0100
Message-Id: <48CE4DDF-8D48-43D4-A294-0E69A6D64608@dominion.thruhere.net>
References: <1326369146-4369-1-git-send-email-koen@dominion.thruhere.net>
	<20120112121949.GB3452@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus.inc: s/INC_PR/PR/ to fix PR bump after dbus-launch-helper permission change
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
X-List-Received-Date: Thu, 12 Jan 2012 13:41:55 -0000
X-Groupsio-MsgNum: 15871
Content-Type: multipart/signed;
	boundary="Apple-Mail=_06F01411-69FD-4B7D-A199-69D2505EFE20";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_06F01411-69FD-4B7D-A199-69D2505EFE20
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 12 jan. 2012, om 13:19 heeft Martin Jansa het volgende geschreven:

> On Thu, Jan 12, 2012 at 12:52:26PM +0100, Koen Kooi wrote:
>> The dbus recipes don't use INC_PR so it didn't get rebuilt after the =
previous commit to fix the launch helper permissions
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-core/dbus/dbus.inc |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/dbus/dbus.inc =
b/meta/recipes-core/dbus/dbus.inc
>> index 2a25256..489e8db 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -10,7 +10,7 @@ DEPENDS =3D "expat virtual/libintl =
${@base_contains('DISTRO_FEATURES', 'x11', '${X
>> DEPENDS_virtclass-native =3D "expat-native virtual/libintl-native"
>> DEPENDS_virtclass-nativesdk =3D "expat-nativesdk =
virtual/libintl-nativesdk virtual/libx11"
>>=20
>> -INC_PR =3D "r1"
>> +PR =3D "r1"
>=20
> Can we move it to dbus_1.4.16.bb too? or change dbus_1.4.16.bb to use
> INC_PR, I can imagine someone reusing meta/recipes-core/dbus/dbus.inc =
in
> his layer won't notice that there is PR now.

I don't mind either way, I just want the fixed dbus package in the =
binary feeds :)=

--Apple-Mail=_06F01411-69FD-4B7D-A199-69D2505EFE20
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk8O4VoACgkQMkyGM64RGpFHyQCggloRKCZRJsHBrczg3RjN2r80
6QcAn0Bn+tDfy/WcFK3L+/YPVw4Af9Wm
=4E5s
-----END PGP SIGNATURE-----

--Apple-Mail=_06F01411-69FD-4B7D-A199-69D2505EFE20--
