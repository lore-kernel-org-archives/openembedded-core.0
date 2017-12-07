Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70ADC78594
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1B6D518430;
	Thu,  7 Dec 2017 16:06:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Jn0vS4eFh1Sc; Thu,  7 Dec 2017 16:06:09 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5814C1844F;
	Thu,  7 Dec 2017 16:06:09 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D8651A077;
	Thu,  7 Dec 2017 16:06:09 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3244D1A075;
	Thu,  7 Dec 2017 16:06:09 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu,  7 Dec 2017 16:06:09 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 2655A2A88;
	Thu,  7 Dec 2017 16:06:09 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 7 Dec 2017 16:06:08 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 7 Dec 2017 16:06:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/9] meson: add a recipe and class from meta-oe
Thread-Index: AQHTX5wBKGGyIgUpQUyB1iJT3ucRsqM4GZpg
Date: Thu, 7 Dec 2017 15:06:08 +0000
Message-ID: <b3867bfb39444851865a5d7db3046e55@XBOX02.axis.com>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
	<9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Thu, 07 Dec 2017 15:06:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Alexander Kanavin
> Sent: den 17 november 2017 13:03
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/9] meson: add a recipe and class from meta-oe
>=20
> The original recipe has been provided and improved by:
>=20
> Ross Burton <ross.burton@intel.com>
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Adam C. Foltzer <acfoltzer@galois.com>
> Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Linus Svensson <linussn@axis.com>
>=20
> I have added  patches to fix up gtk-doc and
> gobject-introspection in cross-compilation environments,
> and also change the order of linker arguments to replicate
> autotools more closely (and fix linking errors in some corner
> cases).
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/meson.bbclass                         | 107 +++++++++++++++=
++++
>  ...s-move-cross_args-in-front-of-output_args.patch |  30 ++++++
>  ...ix-issues-that-arise-when-cross-compiling.patch | 113 +++++++++++++++=
++++++
>  ...rospection-determine-g-ir-scanner-and-g-i.patch |  41 ++++++++
>  meta/recipes-devtools/meson/meson_0.43.0.bb        |  20 ++++
>  5 files changed, 311 insertions(+)
>  create mode 100644 meta/classes/meson.bbclass
>  create mode 100644 meta/recipes-devtools/meson/meson/0001-Linker-rules-m=
ove-cross_args-in-front-of-output_args.patch
>  create mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-iss=
ues-that-arise-when-cross-compiling.patch
>  create mode 100644 meta/recipes-devtools/meson/meson/0002-gobject-intros=
pection-determine-g-ir-scanner-and-g-i.patch
>  create mode 100644 meta/recipes-devtools/meson/meson_0.43.0.bb
>=20
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> new file mode 100644
> index 00000000000..64553cd8f3d
> --- /dev/null
> +++ b/meta/classes/meson.bbclass
> @@ -0,0 +1,107 @@
> +inherit python3native
> +
> +DEPENDS_append =3D " meson-native ninja-native"
> +
> +# As Meson enforces out-of-tree builds we can just use cleandirs
> +B =3D "${WORKDIR}/build"
> +do_configure[cleandirs] =3D "${B}"
> +
> +# Where the meson.build build configuration is
> +MESON_SOURCEPATH =3D "${S}"
> +
> +# These variables in the environment override meson's *native* tools set=
tings.
> +# We have to unset them, so that meson doesn't pick up the cross tools a=
nd
> +# use them for native builds.
> +unset CC
> +unset CXX
> +unset AR
> +
> +def noprefix(var, d):
> +    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '=
', 1)

Remove the True argument to d.getVar().

> +
> +MESONOPTS =3D " --prefix ${prefix} \
> +              --bindir ${@noprefix('bindir', d)} \
> +              --sbindir ${@noprefix('sbindir', d)} \
> +              --datadir ${@noprefix('datadir', d)} \
> +              --libdir ${@noprefix('libdir', d)} \
> +              --libexecdir ${@noprefix('libexecdir', d)} \
> +              --includedir ${@noprefix('includedir', d)} \
> +              --mandir ${@noprefix('mandir', d)} \
> +              --infodir ${@noprefix('infodir', d)} \
> +              --sysconfdir ${sysconfdir} \
> +              --localstatedir ${localstatedir} \
> +              --sharedstatedir ${sharedstatedir}"
> +
> +MESON_C_ARGS =3D "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +MESON_LINK_ARGS =3D "${MESON_C_ARGS} ${LDFLAGS}"
> +
> +MESON_HOST_ENDIAN =3D "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be',=
'big', 'little', d)}"
> +MESON_TARGET_ENDIAN =3D "${@bb.utils.contains('TUNE_FEATURES', 'bigendia=
n', 'big', 'little', d)}"
> +
> +EXTRA_OEMESON +=3D "${PACKAGECONFIG_CONFARGS}"
> +
> +MESON_CROSS_FILE =3D ""
> +MESON_CROSS_FILE_class-target =3D "--cross-file ${WORKDIR}/meson.cross"
> +
> +def meson_array(var, d):
> +    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))

Remove True here as well.

//Peter


