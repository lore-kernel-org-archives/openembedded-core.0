Return-Path: <anujx.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BCE786FF91
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 01:53:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2016 17:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,554,1449561600"; d="scan'208";a="665527698"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2016 17:53:09 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.115]) by
	PGSMSX102.gar.corp.intel.com ([169.254.6.240]) with mapi id
	14.03.0248.002; Tue, 8 Mar 2016 09:53:08 +0800
From: "Mittal, AnujX" <anujx.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-intel][master][jethro][PATCH 1/1] tune-corei7.inc: Fix
	PACKAGE_EXTRA_ARCHS for corei7-32
Thread-Index: AQHRdGmyxBnpaiX770yOMDNKRlK/IJ9O0T9A
Date: Tue, 8 Mar 2016 01:53:07 +0000
Message-ID: <DFCB2C9E62139C41B3FDE8F2B4659331CDE0F8@PGSMSX101.gar.corp.intel.com>
References: <1456912541-16297-1-git-send-email-anujx.mittal@intel.com>
	<1456912541-16297-2-git-send-email-anujx.mittal@intel.com>
In-Reply-To: <1456912541-16297-2-git-send-email-anujx.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Subject: Re: [meta-intel][master][jethro][PATCH 1/1] tune-corei7.inc: Fix PACKAGE_EXTRA_ARCHS for corei7-32
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
X-List-Received-Date: Tue, 08 Mar 2016 01:53:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

> -----Original Message-----
> From: Mittal, AnujX
> Sent: Wednesday, March 02, 2016 5:56 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>; Mittal, A=
nujX
> <anujx.mittal@intel.com>
> Subject: [meta-intel][master][jethro][PATCH 1/1] tune-corei7.inc: Fix
> PACKAGE_EXTRA_ARCHS for corei7-32
>=20
> From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>=20
> Change the name to core2-32 from core2.
>=20
> There's no AVAILTUNES with the name core2. Make sure that we specify the =
correct
> TUNE name so PACKAGE_EXTRA_ARCHS is expanded correctly.
>=20
> [ YOCTO #9197 ]
>=20
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
> ---
>  meta/conf/machine/include/tune-corei7.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/tune-corei7.inc
> b/meta/conf/machine/include/tune-corei7.inc
> index 153a21b..6edfb68 100644
> --- a/meta/conf/machine/include/tune-corei7.inc
> +++ b/meta/conf/machine/include/tune-corei7.inc
> @@ -21,7 +21,7 @@ AVAILTUNES +=3D "corei7-32"
>  TUNE_FEATURES_tune-corei7-32 =3D "${TUNE_FEATURES_tune-x86} corei7"
>  BASE_LIB_tune-corei7-32 =3D "lib"
>  TUNE_PKGARCH_tune-corei7-32 =3D "corei7-32"
> -PACKAGE_EXTRA_ARCHS_tune-corei7-32 =3D
> "${PACKAGE_EXTRA_ARCHS_tune-core2} corei7-32"
> +PACKAGE_EXTRA_ARCHS_tune-corei7-32 =3D
> "${PACKAGE_EXTRA_ARCHS_tune-core2-32} corei7-32"
>  QEMU_EXTRAOPTIONS_corei7-32 =3D " -cpu Nehalem,check=3Dfalse"
>=20
>  AVAILTUNES +=3D "corei7-64"
> --
> 1.9.1


