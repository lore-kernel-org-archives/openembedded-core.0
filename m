Return-Path: <anujx.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD226057B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 07:38:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2016 00:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,334,1455004800"; d="scan'208";a="909679764"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2016 00:38:14 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.115]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.10]) with mapi id
	14.03.0248.002; Mon, 14 Mar 2016 15:38:12 +0800
From: "Mittal, AnujX" <anujx.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi (Wind River)"
	<liezhi.yang@windriver.com>
Thread-Topic: [meta-intel][master][jethro][PATCH 1/1] tune-corei7.inc: Fix
	PACKAGE_EXTRA_ARCHS for corei7-32
Thread-Index: AQHRdGmyxBnpaiX770yOMDNKRlK/IJ9Yn4rQ
Date: Mon, 14 Mar 2016 07:38:12 +0000
Message-ID: <DFCB2C9E62139C41B3FDE8F2B4659331CDF7EF@PGSMSX101.gar.corp.intel.com>
References: <1456912541-16297-1-git-send-email-anujx.mittal@intel.com>
	<1456912541-16297-2-git-send-email-anujx.mittal@intel.com>
In-Reply-To: <1456912541-16297-2-git-send-email-anujx.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.205]
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
X-List-Received-Date: Mon, 14 Mar 2016 07:38:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Robert,

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

Can this be merged to Jethro too? Thanks.

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


