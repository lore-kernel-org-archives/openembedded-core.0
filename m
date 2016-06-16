Return-Path: <anujx.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C77760620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 01:55:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2016 18:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,478,1459839600"; d="scan'208";a="1002915401"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2016 18:55:01 -0700
Received: from kmsmsx155.gar.corp.intel.com (172.21.73.106) by
	PGSMSX106.gar.corp.intel.com (10.221.44.98) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 16 Jun 2016 09:54:59 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.41]) by
	KMSMSX155.gar.corp.intel.com ([169.254.15.220]) with mapi id
	14.03.0248.002; Thu, 16 Jun 2016 09:54:59 +0800
From: "Mittal, AnujX" <anujx.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi (Wind River)"
	<liezhi.yang@windriver.com>, akuster808 <akuster808@gmail.com>
Thread-Topic: [PATCH] gcc: make sure header path is set correctly
Thread-Index: AQHRxhyDTo267/ZBFEK3oaK71wsS4Z/rVI5A
Date: Thu, 16 Jun 2016 01:54:57 +0000
Message-ID: <DFCB2C9E62139C41B3FDE8F2B4659331D2E7B8@PGSMSX101.gar.corp.intel.com>
References: <1465895420-1660-1-git-send-email-anujx.mittal@intel.com>
In-Reply-To: <1465895420-1660-1-git-send-email-anujx.mittal@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzk0MDAwMjUtNjM2YS00OWE4LWIxMzktMDIwYzlhNWJkM2I2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6ImVoTXVUUFRCb3VXcHU1UGtPVlVxc1c0TXluM3lacVNwK3ZNamNtMlwvMVBNPSJ9
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Subject: Re: [PATCH] gcc: make sure header path is set correctly
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
X-List-Received-Date: Thu, 16 Jun 2016 01:55:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mittal, AnujX
> Sent: Tuesday, June 14, 2016 5:10 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Mittal, AnujX <anujx.mittal@intel.com>
> Subject: [PATCH] gcc: make sure header path is set correctly
>=20
> We're setting the native header paths in do_configure_prepend,
> and don't need to set them again here.
>=20
> This results in gcc-target not being able to locate the headers
> and not being able to detect glibc version, which in turn
> results in SSP support not getting detected even though it's available
> in libc.
>=20
> Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>

Can this be considered for merge to krogoth and Jethro as well?=20

Please let me know if I should be sending a separate patch for it.

Thanks,

> ---
>  meta/recipes-devtools/gcc/gcc-target.inc | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-
> devtools/gcc/gcc-target.inc
> index a960ed4..37c5c62 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -4,7 +4,6 @@ require gcc-configure-common.inc
>  EXTRA_OECONF_PATHS =3D "\
>      --with-sysroot=3D/ \
>      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> -    --with-native-system-header-
> dir=3D${STAGING_DIR_TARGET}${target_includedir} \
>      --with-gxx-include-dir=3D${includedir}/c++/${BINV} \
>  "
>=20
> --
> 1.9.1


