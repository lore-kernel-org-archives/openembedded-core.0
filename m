Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4317D65CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 15:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AEA24180E5;
	Tue, 19 Mar 2019 16:44:50 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 0j3M8jYOI08z; Tue, 19 Mar 2019 16:44:49 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 52B9718407;
	Tue, 19 Mar 2019 16:44:49 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30A2A1E06E;
	Tue, 19 Mar 2019 16:44:49 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23C781E06A;
	Tue, 19 Mar 2019 16:44:49 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 19 Mar 2019 16:44:49 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 17B8019CA;
	Tue, 19 Mar 2019 16:44:49 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 19 Mar 2019 16:44:48 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 19 Mar 2019 16:44:48 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4 1/2] openssl: Remove the c_rehash shell
	re-implementation
Thread-Index: AQHU3lvDgB1bmopig0+OwxfujxpnzqYTF6ng
Date: Tue, 19 Mar 2019 15:44:48 +0000
Message-ID: <be5b31d22d21458dbafc7cf1c7b5a14a@XBOX04.axis.com>
References: <20190319135727.31246-1-otavio@ossystems.com.br>
In-Reply-To: <20190319135727.31246-1-otavio@ossystems.com.br>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v4 1/2] openssl: Remove the c_rehash shell	re-implementation
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
X-List-Received-Date: Tue, 19 Mar 2019 15:44:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Otavio Salvador
> Sent: den 19 mars 2019 14:57
> To: OpenEmbedded Core Mailing List <openembedded-
> core@lists.openembedded.org>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Subject: [OE-core] [PATCH v4 1/2] openssl: Remove the c_rehash shell
> re-implementation
>=20
> We had a c_rehash shell re-implementation being used for the native
> package however the ca-certificates now uses the openssl rehash
> internal application so there is no use for the c_rehash anymore.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
> Changes in v4:
> - remove perlnative requirement
>=20
> Changes in v3:
> - remove c_rehash completely
> - fix ca-certificates recipe comment
>=20
> Changes in v2:
> - updated commit log
>=20
>  .../openssl/openssl/openssl-c_rehash.sh       | 222 ------------------
>  .../openssl/openssl_1.1.1a.bb                 |  15 +-
>  .../ca-certificates_20190110.bb               |   2 +-
>  3 files changed, 2 insertions(+), 237 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-c_r=
ehash.sh
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.s=
h b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
> deleted file mode 100644
> index 6620fdcb53..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
> +++ /dev/null
> @@ -1,222 +0,0 @@

[cut]

> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/r=
ecipes-connectivity/openssl/openssl_1.1.1a.bb
> index 4a626a4fcd..c5900ad536 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> @@ -9,11 +9,8 @@ SECTION =3D "libs/network"
>  LICENSE =3D "openssl"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd57d511030c9d66ef5f5966bee5a7=
eff"
>=20
> -DEPENDS =3D "hostperl-runtime-native"
> -
>  SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
> -           file://openssl-c_rehash.sh \
>             file://0001-skip-test_symbol_presence.patch \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://afalg.patch \
> @@ -149,12 +146,6 @@ do_install_append_class-native () {
>  	    SSL_CERT_DIR=3D${libdir}/ssl-1.1/certs \
>  	    SSL_CERT_FILE=3D${libdir}/ssl-1.1/cert.pem \
>  	    OPENSSL_ENGINES=3D${libdir}/ssl-1.1/engines
> -
> -	# Install a custom version of c_rehash that can handle sysroots properl=
y.
> -	# This version is used for example when installing ca-certificates duri=
ng
> -	# image creation.
> -	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
> -	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
>  }
>=20
>  do_install_append_class-nativesdk () {
> @@ -196,7 +187,7 @@ FILES_libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
>  FILES_libssl =3D "${libdir}/libssl${SOLIBS}"
>  FILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
>  FILES_${PN}-engines =3D "${libdir}/engines-1.1"
> -FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
> +FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc"
>  FILES_${PN} =3D+ "${libdir}/ssl-1.1/*"
>  FILES_${PN}_append_class-nativesdk =3D " ${SDKPATHNATIVE}/environment-se=
tup.d/openssl.sh"
>=20

You should remove the following line too:

RDEPENDS_${PN}-misc =3D "perl"

so we actually get rid of the perl dependency.

> @@ -211,7 +202,3 @@ RREPLACES_openssl-conf =3D "openssl10-conf"
>  RCONFLICTS_openssl-conf =3D "openssl10-conf"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> -
> -inherit multilib_script
> -
> -MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_2019011=
0.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
> index b9f57900c8..4c0425302f 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Daeb=
420429b1659507e0a5a1b123e8308
>  DEPENDS =3D ""
>  DEPENDS_class-native =3D "openssl-native"
>  DEPENDS_class-nativesdk =3D "openssl-native"
> -# Need c_rehash from openssl and run-parts from debianutils
> +# Need rehash from openssl and run-parts from debianutils
>  PACKAGE_WRITE_DEPS +=3D "openssl-native debianutils-native"
>=20
>  SRCREV =3D "c28799b138b044c963d24c4a69659b6e5486e3be"
> --
> 2.21.0

//Peter


