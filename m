Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcDfL-0000lV-0j
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 11:08:23 +0100
Received: by werm13 with SMTP id m13so894174wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 02:01:21 -0800 (PST)
Received: by 10.216.143.206 with SMTP id l56mr2928612wej.46.1324202481829;
	Sun, 18 Dec 2011 02:01:21 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff1sm21429480wbb.5.2011.12.18.02.01.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 02:01:20 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111218095036.GJ3997@jama.jama.net>
Date: Sun, 18 Dec 2011 11:01:16 +0100
Message-Id: <9D71C9FD-B142-42B1-9485-04AD5AD70AB7@dominion.thruhere.net>
References: <1324200731-10753-1-git-send-email-koen@dominion.thruhere.net>
	<20111218095036.GJ3997@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl 1.2.14: fix packaging
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
X-List-Received-Date: Sun, 18 Dec 2011 10:08:23 -0000
X-Groupsio-MsgNum: 14397
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CB807DC2-2F8D-4ECE-AE37-B154180338CD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CB807DC2-2F8D-4ECE-AE37-B154180338CD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 18 dec. 2011, om 10:50 heeft Martin Jansa het volgende geschreven:

> On Sun, Dec 18, 2011 at 10:32:11AM +0100, Koen Kooi wrote:
>> For some reason the -config script was shipped in ${PN} leading to =
shlibs renaming issues:
>>=20
>> What we want, and how meta-oe used to do it:
>> 	libsdl-1.2-0_1.2.14-r0.0_armv7a.ipk
>>=20
>> Current OE-core status:
>> 	libsdl_1.2.14-r2_armv7a.ipk
>>=20
>> With this commit we get both proper shlib renaming and the -dev =
package now has all the dev files
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    4 +++-
>> 1 files changed, 3 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb =
b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
>> index a28a88a..761995e 100644
>> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
>> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
>> @@ -15,7 +15,7 @@ PROVIDES =3D "virtual/libsdl"
>> DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', =
'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender =
tslib"
>> DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-nativesdk =
libxrender-nativesdk libxext-nativesdk"
>>=20
>> -PR =3D "r2"
>> +PR =3D "r3"
>>=20
>> SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>>            file://configure_tweak.patch \
>> @@ -57,4 +57,6 @@ do_configure_prepend() {
>>         export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
>> }
>>=20
>> +FILES_${PN}-dev +=3D "${bindir}/sdl-config""
>=20
> Looks like extra quote                      ^

indeed and I have a better fix for the packaging problem, v2 coming up.=

--Apple-Mail=_CB807DC2-2F8D-4ECE-AE37-B154180338CD
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7tufAACgkQMkyGM64RGpHyBACcD+qM5OCZHy25KllqFetPR199
yrkAoLkTGAvBJklvLvUHqGpwazx4EjP6
=ozCq
-----END PGP SIGNATURE-----

--Apple-Mail=_CB807DC2-2F8D-4ECE-AE37-B154180338CD--
