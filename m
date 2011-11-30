Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVonK-0007Ul-Lk
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 19:22:10 +0100
Received: by eaad13 with SMTP id d13so1044405eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 10:15:30 -0800 (PST)
Received: by 10.14.15.229 with SMTP id f77mr414512eef.137.1322676926682;
	Wed, 30 Nov 2011 10:15:26 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a60sm8648388eeb.4.2011.11.30.10.15.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 10:15:25 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322675553.17484.20.camel@ted>
Date: Wed, 30 Nov 2011 19:15:23 +0100
Message-Id: <F9E3D91B-529C-4E90-BF2F-DEB5E372BECE@dominion.thruhere.net>
References: <1322660459-333-1-git-send-email-koen@dominion.thruhere.net>
	<1322675553.17484.20.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] zlib 1.2.5: install pkgconfig file, needed for e.g. modern webkit
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
X-List-Received-Date: Wed, 30 Nov 2011 18:22:10 -0000
X-Groupsio-MsgNum: 13312
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DAAAD353-61A4-4318-B587-9D06BC4E502F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DAAAD353-61A4-4318-B587-9D06BC4E502F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 18:52 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-11-30 at 14:40 +0100, Koen Kooi wrote:
>> Upstream has grown cmake support which would allow us to dump the OE
>> autotools hack, but the cmakefile doesn't install the .pc file either
>> and breaks with zlib-native
>>=20
>> Also remove unused site config file
>=20
> How did you determine this was unused?

By removing it and rebuilding zlib(-native) and zlib dependant apps. In =
case it does turn out to be needed we should switch to cmake. I'm OK =
with having a OE hack for autotools, but a broken OE hack....

regards,

Koen


>=20
> Cheers,
>=20
> Richard
>=20
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-core/zlib/site_config/headers |    1 -
>> meta/recipes-core/zlib/zlib_1.2.5.bb       |   18 ++++++++++++++++--
>> 2 files changed, 16 insertions(+), 3 deletions(-)
>> delete mode 100644 meta/recipes-core/zlib/site_config/headers
>>=20
>> diff --git a/meta/recipes-core/zlib/site_config/headers =
b/meta/recipes-core/zlib/site_config/headers
>> deleted file mode 100644
>> index 5026891..0000000
>> --- a/meta/recipes-core/zlib/site_config/headers
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -zlib.h
>> diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb =
b/meta/recipes-core/zlib/zlib_1.2.5.bb
>> index bca400c..b5756d9 100644
>> --- a/meta/recipes-core/zlib/zlib_1.2.5.bb
>> +++ b/meta/recipes-core/zlib/zlib_1.2.5.bb
>> @@ -7,12 +7,12 @@ LICENSE =3D "Zlib"
>> LIC_FILES_CHKSUM =3D =
"file://zlib.h;beginline=3D4;endline=3D23;md5=3D084e9c30e4e6272c3b057b13c6=
467f3d"
>>=20
>> DEPENDS =3D "libtool-cross"
>> -PR =3D "r1"
>> +PR =3D "r3"
>>=20
>> SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>>            file://configure.ac \
>>            file://Makefile.am \
>> -	   file://fix.inverted.LFS.logic.patch"
>> +           file://fix.inverted.LFS.logic.patch"
>>=20
>> SRC_URI[md5sum] =3D "be1e89810e66150f5b0327984d8625a0"
>> SRC_URI[sha256sum] =3D =
"239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
>> @@ -24,4 +24,18 @@ do_configure_prepend () {
>> 	cp ${WORKDIR}/Makefile.am ${S}/
>> }
>>=20
>> +do_install_append () {
>> +	sed \
>> +		-e 's:@prefix@:${prefix}:' \
>> +		-e 's:@exec_prefix@:${exec_prefix}:' \
>> +		-e 's:@libdir@:${libdir}:' \
>> +		-e 's:@sharedlibdir@:${libdir}:' \
>> +		-e 's:@includedir@:${includedir}:' \
>> +		-e 's:@VERSION@:${PV}:' \
>> +		zlib.pc.in > zlib.pc
>> +
>> +	install -d ${D}${libdir}/pkgconfig
>> +	install -m 0644 zlib.pc ${D}${libdir}/pkgconfig/
>> +}
>> +
>> BBCLASSEXTEND =3D "native nativesdk"
>=20
>=20


--Apple-Mail=_DAAAD353-61A4-4318-B587-9D06BC4E502F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7WcrsACgkQMkyGM64RGpG0zwCgm8ChEt5vY+r1K9QX3nvWNxZp
CJYAnRhEI8kFRZGNjeKguqfI76Pj9Tf8
=vpGF
-----END PGP SIGNATURE-----

--Apple-Mail=_DAAAD353-61A4-4318-B587-9D06BC4E502F--
