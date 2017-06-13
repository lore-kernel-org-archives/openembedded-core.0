Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24682782DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0C4311848E;
	Tue, 13 Jun 2017 09:56:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id OMxlIKF5hhVR; Tue, 13 Jun 2017 09:56:47 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C095018490;
	Tue, 13 Jun 2017 09:56:46 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 788841E09D;
	Tue, 13 Jun 2017 09:56:46 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D9C11E068;
	Tue, 13 Jun 2017 09:56:46 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 13 Jun 2017 09:56:46 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 61D11792;
	Tue, 13 Jun 2017 09:56:46 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 13 Jun 2017 09:56:46 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Tue, 13 Jun 2017 09:56:46 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 3/8] systemd: chagnes to support merged /usr
Thread-Index: AQHS5BI1m+RZzal0aEibjTaLhGyrCKIia9Gg
Date: Tue, 13 Jun 2017 07:56:46 +0000
Message-ID: <79e824d5a63a459e8913c4066efd8463@XBOX02.axis.com>
References: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
	<1497336760-36835-4-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1497336760-36835-4-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3 3/8] systemd: chagnes to support merged /usr
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
X-List-Received-Date: Tue, 13 Jun 2017 07:56:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Amarnath Valluri
> Sent: den 13 juni 2017 08:53
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3 3/8] systemd: chagnes to support merged

Change "chagnes" to "changes".

> /usr
>=20
> - Disable the split-usr support in systemd when 'usrmerge' DISTRO_FEATURE=
 is
>   enabled.
> - Modify rootprefix to point to ${root_prefix}, rather than ${base_prefix=
}.
> - And fixed firmware path to use ${nonarch_base_libdir} instead of hard-c=
oded
>   '/lib', because when 'usrmege' distro feature enabled this path would b=
e
>   '/usr/lib'.
>=20
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_232.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-
> core/systemd/systemd_232.bb
> index f843c58..22c7254 100644
> --- a/meta/recipes-core/systemd/systemd_232.bb
> +++ b/meta/recipes-core/systemd/systemd_232.bb
> @@ -131,7 +131,7 @@ CACHED_CONFIGUREVARS +=3D
> "ac_cv_path_SULOGIN=3D${base_sbindir}/sulogin"
>=20
>  # Helper variables to clarify locations.  This mirrors the logic in syst=
emd's
>  # build system.
> -rootprefix ?=3D "${base_prefix}"
> +rootprefix ?=3D "${root_prefix}"
>  rootlibdir ?=3D "${base_libdir}"
>  rootlibexecdir =3D "${rootprefix}/lib"
>=20
> @@ -149,10 +149,10 @@ CACHED_CONFIGUREVARS_class-target =3D "\
>  EXTRA_OECONF =3D " --with-rootprefix=3D${rootprefix} \
>                   --with-rootlibdir=3D${rootlibdir} \
>                   --with-roothomedir=3D${ROOT_HOME} \
> -                 --enable-split-usr \
> +                 ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '--=
disable-split-usr', '--enable-split-usr', d)} \

I recommend that you add a PACKAGECONFIG for this instead:

PACKAGECONFIG[usrmerge] =3D "--disable-split-usr,--enable-split-usr"

And add 'usrmerge' to the bb.utils.filter() call in the definition of=20
PACKAGECONFIG.

>                   --without-python \
>                   --with-sysvrcnd-path=3D${sysconfdir} \
> -                 --with-firmware-path=3D/lib/firmware \
> +                 --with-firmware-path=3D${nonarch_base_libdir}/firmware =
\
>                   --with-testdir=3D${PTEST_PATH} \
>                 "
>  # per the systemd README, define VALGRIND=3D1 to run under valgrind
> --
> 2.7.4

//Peter


