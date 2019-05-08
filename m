Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 472F07DEA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C734F18525
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:46:09 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CwebNRRrqa3T
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:46:08 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C75341850D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:46:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B66611A06B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:46:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA2FD1A040
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:46:08 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:46:08 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 9E9112C47
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:46:08 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 8 May 2019 22:46:08 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 8 May 2019 22:46:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [master][warrior][PATCH] systemd: Use PACKAGECONFIG
	definition to depend on libnss-myhostname
Thread-Index: AdUF3whlluP2/CK+QXGE9CY4te/epg==
Date: Wed, 8 May 2019 20:46:08 +0000
Message-ID: <8b54668a7b384c489842b3c25c1bf3bf@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [master][warrior][PATCH] systemd: Use PACKAGECONFIG definition to depend on libnss-myhostname
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
X-List-Received-Date: Wed, 08 May 2019 20:46:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 12 april 2019 18:15
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [master][warrior][PATCH] systemd: Use PACKAGECONFIG
> definition to depend on libnss-myhostname
>=20
> Rather than adding the dependency on libnss-myhostname to
> RDEPENDS_${PN} if the myhostname PACKAGECONFIG is set, add the runtime
> dependency to myhostname's PACKAGECONFIG definition.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> This is just a clean up of the last commit to systemd.
>=20
> meta/recipes-core/systemd/systemd_241.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-
> core/systemd/systemd_241.bb
> index 3a58f44a3b..562cdc3316 100644
> --- a/meta/recipes-core/systemd/systemd_241.bb
> +++ b/meta/recipes-core/systemd/systemd_241.bb
> @@ -144,7 +144,7 @@ PACKAGECONFIG[lz4] =3D "-Dlz4=3Dtrue,-Dlz4=3Dfalse,lz=
4"
>  PACKAGECONFIG[machined] =3D "-Dmachined=3Dtrue,-Dmachined=3Dfalse"
>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native
> xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>  PACKAGECONFIG[microhttpd] =3D "-Dmicrohttpd=3Dtrue,-
> Dmicrohttpd=3Dfalse,libmicrohttpd"
> -PACKAGECONFIG[myhostname] =3D "-Dnss-myhostname=3Dtrue,-Dnss-
> myhostname=3Dfalse"
> +PACKAGECONFIG[myhostname] =3D "-Dnss-myhostname=3Dtrue,-Dnss-
> myhostname=3Dfalse,,libnss-myhostname"
>  PACKAGECONFIG[networkd] =3D "-Dnetworkd=3Dtrue,-Dnetworkd=3Dfalse"
>  PACKAGECONFIG[nss] =3D "-Dnss-systemd=3Dtrue,-Dnss-systemd=3Dfalse"
>  PACKAGECONFIG[nss-mymachines] =3D "-Dnss-mymachines=3Dtrue,-Dnss-
> mymachines=3Dfalse"
> @@ -547,7 +547,6 @@ FILES_${PN}-dev +=3D "${base_libdir}/security/*.la
> ${datadir}/dbus-1/interfaces/ $
>  RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev
> (=3D ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
>  RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-
> getty-generator', '', 'systemd-serialgetty', d)}"
>  RDEPENDS_${PN} +=3D "volatile-binds update-rc.d systemd-conf"
> -RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'myhostname',
> 'libnss-myhostname', '', d)}"
>=20
>  RRECOMMENDS_${PN} +=3D "systemd-extra-utils \
>                        systemd-compat-units udev-hwdb \
> --
> 2.12.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

