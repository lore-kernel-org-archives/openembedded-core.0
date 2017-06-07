Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACBAF78145
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4576818293;
	Wed,  7 Jun 2017 18:11:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id PUpt8iONiwjJ; Wed,  7 Jun 2017 18:11:28 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2F3D21816A;
	Wed,  7 Jun 2017 18:11:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E4FE1A0C5;
	Wed,  7 Jun 2017 18:11:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 132691A0C2;
	Wed,  7 Jun 2017 18:11:28 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  7 Jun 2017 18:11:28 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 075B42B12;
	Wed,  7 Jun 2017 18:11:28 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 7 Jun 2017 18:11:27 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Wed, 7 Jun 2017 18:11:27 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as overrides
Thread-Index: AQHS36NSGTWZJyr3a0+CXI7+JCHKWaIZkFKg
Date: Wed, 7 Jun 2017 16:11:27 +0000
Message-ID: <13cfc543313a4c59bb8c9688c91db3c4@XBOX02.axis.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<7942e5efccf0ee4fa360948d892b4508e3f1f00c.1496849345.git-series.patrick.ohly@intel.com>
In-Reply-To: <7942e5efccf0ee4fa360948d892b4508e3f1f00c.1496849345.git-series.patrick.ohly@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Wed, 07 Jun 2017 16:11:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Patrick Ohly
> Sent: den 7 juni 2017 17:32
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] bitbake.conf: DISTRO_FEATURES as
> overrides
>=20
> As discussed in "[Openembedded-architecture] Yocto Compatible 2.0 +
> signature changes", changes in .bbappend must depend on some explicit
> configuration change, typically selecting a distro feature.
>=20
> For _append and _remove, adding an override that is set only when the
> corresponding entry is in DISTRO_FEATURES achieves that:
>=20
>   DISTRO_FEATURES =3D " ... my-distro-feature ... "
>=20
>   do_install_append_my-distro-feature () {
>        ...
>   }
>=20
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/conf/bitbake.conf | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3ad905c..ca6501e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -713,7 +713,7 @@ DISTRO_NAME ??=3D "OpenEmbedded"
>  #
>  # This works for  functions as well, they are really just environment
> variables.
>  # Default OVERRIDES to make compilation fail fast in case of build
> system misconfiguration.
> -OVERRIDES =3D "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-
> ${BUILD_OS}:pn-
> ${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevari
> able"
> +OVERRIDES =3D "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-
> ${BUILD_OS}:pn-
> ${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}${DISTROFEATURESOVERRIDES}:
> ${CLASSOVERRIDE}:forcevariable"
>  OVERRIDES[vardepsexclude] =3D "MACHINEOVERRIDES"
>  CLASSOVERRIDE ?=3D "class-target"
>  DISTROOVERRIDES ?=3D "${@d.getVar('DISTRO') or ''}"
> @@ -722,6 +722,21 @@ MACHINEOVERRIDES[vardepsexclude] =3D "MACHINE"
>=20
>  FILESOVERRIDES =3D
> "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
>=20
> +# Turns certain DISTRO_FEATURES into overrides of the same name
> +# or (optionally) some other name. Ensures that these special
> +# distro features remain set also for native and nativesdk
> +# recipes, so that these overrides can also be used there.
> +#
> +# Beware that this part of OVERRIDES changes during parsing, so usage
> +# of these overrides should be limited to .bb and .bbappend files,
> +# because then DISTRO_FEATURES is final.
> +DISTRO_FEATURES_OVERRIDES ??=3D ""
> +DISTRO_FEATURES_OVERRIDES[doc] =3D "A space-separated list of <feature>
> entries. \
> +Each entry is added to OVERRIDES with the <feature> name if <feature>
> is in DISTRO_FEATURES."
> +DISTRO_FEATURES_FILTER_NATIVE_append =3D " ${DISTRO_FEATURES_OVERRIDES}"
> +DISTRO_FEATURES_FILTER_NATIVESDK_append =3D "
> ${DISTRO_FEATURES_OVERRIDES}"
> +DISTROFEATURESOVERRIDES =3D "${@ ''.join([':' + x for x in
> (set(d.getVar('DISTRO_FEATURES_OVERRIDES').split()) &
> set((d.getVar('DISTRO_FEATURES') or '').split()))]) }"
> +
>  ##################################################################
>  # Include the rest of the config files.
>  ##################################################################
> --
> git-series 0.9.1

Rather than requiring that the wanted DISTRO_FEATURES that should be=20
available as overrides are defined in DISTRO_FEATURES_OVERRIDES (which=20
should not be confused with the similarly named DISTROFEATURESOVERRIDES=20
variable that you also add...), why not add them all but with a prefix.=20
I.e., similar to how package names are available as overrides prefixed=20
with "pn-", how about all distro features are made available as=20
overrides with a "df-" prefix?

//Peter


