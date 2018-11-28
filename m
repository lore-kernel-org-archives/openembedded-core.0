Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC726C51F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 08:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7F84E18550;
	Wed, 28 Nov 2018 09:04:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qBXWtUl3QjQQ; Wed, 28 Nov 2018 09:04:15 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 87AB7183D8;
	Wed, 28 Nov 2018 09:04:15 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70CE51A06F;
	Wed, 28 Nov 2018 09:04:15 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 652741A06D;
	Wed, 28 Nov 2018 09:04:15 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 28 Nov 2018 09:04:15 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 594F322C8;
	Wed, 28 Nov 2018 09:04:15 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 28 Nov 2018 09:04:15 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 28 Nov 2018 09:04:15 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Douglas Royds <douglas.royds@taitradio.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/8] acl: Use install instead of cp
Thread-Index: AQHUhtZzzhLllQlxw0SCknH/dr0Ck6Vk0sog
Date: Wed, 28 Nov 2018 08:04:14 +0000
Message-ID: <533e05c0d3614a888166cb7319b1b3d8@XBOX04.axis.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128045316.24102-6-douglas.royds@taitradio.com>
In-Reply-To: <20181128045316.24102-6-douglas.royds@taitradio.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 5/8] acl: Use install instead of cp
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
X-List-Received-Date: Wed, 28 Nov 2018 08:04:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Douglas Royds
> Sent: den 28 november 2018 05:53
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 5/8] acl: Use install instead of cp
>=20
> Also, hard-tabs begone

Shell-code in OE-Core is expected to be indented using tabs, so don't=20
do this. (For reference, OpenEmbedded uses four spaces to indent=20
shell-code). Additionally, it makes it harder to see what you actually=20
changed.

>=20
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/recipes-support/attr/acl_2.2.52.bb | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-suppo=
rt/attr/acl_2.2.52.bb
> index 8b89de9b42..260975d93e 100644
> --- a/meta/recipes-support/attr/acl_2.2.52.bb
> +++ b/meta/recipes-support/attr/acl_2.2.52.bb
> @@ -27,27 +27,27 @@ require ea-acl.inc
>=20
>  # avoid RPATH hardcode to staging dir
>  do_configure_append() {
> -	sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=3D\\\).*$,\\1\'n=
o\',
> -	${S}/config.status
> +    sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=3D\\\).*$,\\1=
\'no\',
> +    ${S}/config.status
>  }
>=20
>  # libdir should point to .la
>  do_install_append() {
> -	sed -i ${D}${libdir}/libacl.la -e \
> -	    s,^libdir=3D\'${base_libdir}\'$,libdir=3D\'${libdir}\',
> +    sed -i ${D}${libdir}/libacl.la \
> +        -e s,^libdir=3D\'${base_libdir}\'$,libdir=3D\'${libdir}\',
>  }
>=20
>  inherit ptest
>=20
>  do_install_ptest() {
> -	tar -c --exclude=3Dnfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
> -	mkdir ${D}${PTEST_PATH}/include
> -	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildru=
les ${D}${PTEST_PATH}/include/
> -	# Remove any build host references
> -	sed -e "s:--sysroot=3D${STAGING_DIR_TARGET}::g" \
> -	    -e 's:${HOSTTOOLS_DIR}/::g' \
> -	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> -	    -i ${D}${PTEST_PATH}/include/builddefs
> +    tar -c --exclude=3Dnfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
> +    install -d ${D}${PTEST_PATH}/include
> +    install -m 644 ${S}/include/builddefs ${S}/include/buildmacros ${S}/=
include/buildrules ${D}${PTEST_PATH}/include/
> +    # Remove any build host references
> +    sed -e "s:--sysroot=3D${STAGING_DIR_TARGET}::g" \
> +        -e 's:${HOSTTOOLS_DIR}/::g' \
> +        -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +        -i ${D}${PTEST_PATH}/include/builddefs
>  }
>=20
>  RDEPENDS_${PN}-ptest =3D "acl bash coreutils perl perl-module-filehandle
> perl-module-getopt-std perl-module-posix shadow"
> --
> 2.17.1

//Peter


