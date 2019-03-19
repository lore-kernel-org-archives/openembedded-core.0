Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C5E6665CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 15:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4570618510;
	Tue, 19 Mar 2019 16:37:01 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id I8_7ksyGubZY; Tue, 19 Mar 2019 16:36:59 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4D0F91810B;
	Tue, 19 Mar 2019 16:36:59 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B1D31A084;
	Tue, 19 Mar 2019 16:36:59 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FE5C1A040;
	Tue, 19 Mar 2019 16:36:59 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 19 Mar 2019 16:36:59 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 23B481952;
	Tue, 19 Mar 2019 16:36:59 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 19 Mar 2019 16:36:58 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 19 Mar 2019 16:36:58 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 19 Mar 2019 16:36:58 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jiang Lu <lu.jiang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core 2/2] glib-networking:enable glib-networking
	complie as native package
Thread-Index: AQHU3ilnjq2fW+Df6kCE28s+8vdF+6YTFbRQ
Date: Tue, 19 Mar 2019 15:36:58 +0000
Message-ID: <613c27767a004365b122b1352321d88e@XBOX04.axis.com>
References: <20190319075451.18823-1-lu.jiang@windriver.com>
	<20190319075451.18823-3-lu.jiang@windriver.com>
In-Reply-To: <20190319075451.18823-3-lu.jiang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [oe-core 2/2] glib-networking:enable glib-networking	complie as native package
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
X-List-Received-Date: Tue, 19 Mar 2019 15:37:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Jiang Lu
> Sent: den 19 mars 2019 08:55
> To: lu.jiang@windriver.com; openembedded-core@lists.openembedded.org
> Subject: [OE-core] [oe-core 2/2] glib-networking:enable glib-networking
> complie as native package
>=20
> Enable glib-networking compile as a native package, for it is depended
> by
> libsoup.
>=20
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  .../glib-networking/glib-networking_2.58.0.bb | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/meta/recipes-core/glib-networking/glib-
> networking_2.58.0.bb b/meta/recipes-core/glib-networking/glib-
> networking_2.58.0.bb
> index f3190e1cae..35b4a3fa76 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> @@ -29,3 +29,34 @@ FILES_${PN} +=3D "\
>                  "
>  FILES_${PN}-dev +=3D "${libdir}/gio/modules/libgio*.la"
>  FILES_${PN}-staticdev +=3D "${libdir}/gio/modules/libgio*.a"
> +
> +# Make sure we compile with ca-certificates support enabled.
> +PACKAGECONFIG_append =3D " ca-certificates"
> +
> +DEPENDS +=3D "ca-certificates"
> +RDEPENDS_${PN} +=3D "ca-certificates"
> +
> +# We need native version for ostree-/flatpak-native.
> +BBCLASSEXTEND =3D "native"
> +# OE-core's relocatable.bbclass assumes that every package which
> +# ends up creating a ${libdir}/pkgconfig directory in its sysroot
> +# will always also install .pc-files there and tries to uncondi-
> +# tionally update paths in those files using globbing that fails
> +# if no such files are present. This presumption is not true for
> +# glib-networking which happens to create a directory by dereferencing
> +# a GIO pkgconfig variable which in turn is defined relative to
> +# the pkgconfig directory (${pcfiledir}/../...), causing pkgconfig
> +# to get created.

How about fixing relocatable_native_pcfiles() in relocatable.bbclass=20
instead so that it ignores empty pkgconfig directories?

> +#
> +# Could be worked around in the upatream recipe but since that
> +# does not provide/create native versions of the package and since
> +# this problem is related to native packages, we work around it here.
> +#
> +do_install_append_class-native () {
> +    for _pc in ${D}${libdir}/pkgconfig/*.pc; do
> +        case $_pc in
> +            *'*.pc') rm -fr ${D}${libdir}/pkgconfig;;
> +            *.pc)    break;;
> +        esac
> +    done

Why complicate things? Just remove the directory if it exists=20
and is empty:

	rmdir ${D}${libdir}/pkgconfig 2>/dev/null || :

> +}
> --
> 2.17.1

//Peter


