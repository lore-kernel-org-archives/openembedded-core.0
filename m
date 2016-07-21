Return-Path: <anujx.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5012170100
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 03:52:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jul 2016 20:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,397,1464678000"; d="scan'208";a="1010979767"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2016 20:52:33 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.41]) by
	PGSMSX105.gar.corp.intel.com ([169.254.4.204]) with mapi id
	14.03.0248.002; Thu, 21 Jul 2016 11:52:31 +0800
From: "Mittal, AnujX" <anujx.mittal@intel.com>
To: "Yang, Liezhi (Wind River)" <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/6] [jethro] Consolidated pull
Thread-Index: AQHR1ojIfyh5Lki8F0y817kY/A+CzKAiVwgw
Date: Thu, 21 Jul 2016 03:52:31 +0000
Message-ID: <DFCB2C9E62139C41B3FDE8F2B4659331D3778A@PGSMSX101.gar.corp.intel.com>
References: <cover.1467700975.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1467700975.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTJhMWQ5ZDgtZWY5My00N2Y0LTkyNTItZTllMTVhZTYxZjllIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6Ikliek9JRmh5XC9zaHdTaCs1ZDRRYjhkcHVHdEtOd2ptSXZiaWpjcjJXWkMwPSJ9
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] [jethro] Consolidated pull
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
X-List-Received-Date: Thu, 21 Jul 2016 03:52:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just wanted to check - when will these changes be merged in Jethro?

Thanks,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Robert Yang
> Sent: Tuesday, July 05, 2016 2:44 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/6] [jethro] Consolidated pull
>=20
> The following changes since commit
> 1f4bfa33073584c25396d74f3929f263f3df188b:
>=20
>   toasterconf.json: exclude releases Toaster can't build (2016-06-03 13:3=
6:19
> +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-
> contrib/log/?h=3Drbt/jethro-next
>=20
> Anuj Mittal (1):
>   gcc: make sure header path is set correctly
>=20
> Armin Kuster (2):
>   tzcode: update to 2016e
>   tzdata: update to 2016e
>=20
> Enrico Jorns (1):
>   perl-ptest.inc: fix tar call to prevent objcopy failure
>=20
> George McCollister (1):
>   wic: fix path parsing, use last occurrence
>=20
> Nicolas Dechesne (1):
>   bluez5: move btmgmt to common READLINE section
>=20
>  meta/recipes-connectivity/bluez5/bluez5_5.33.bb                  | 2 +-
>  meta/recipes-devtools/gcc/gcc-target.inc                         | 1 -
>  meta/recipes-devtools/perl/perl-ptest.inc                        | 4 ++-=
-
>  .../tzcode/{tzcode-native_2016d.bb =3D> tzcode-native_2016e.bb}    | 9 +=
++++----
>  .../recipes-extended/tzdata/{tzdata_2016d.bb =3D> tzdata_2016e.bb} | 4 +=
+--
>  scripts/lib/wic/plugin.py                                        | 2 +-
>  6 files changed, 11 insertions(+), 11 deletions(-)
>  rename meta/recipes-extended/tzcode/{tzcode-native_2016d.bb =3D> tzcode-
> native_2016e.bb} (67%)
>  rename meta/recipes-extended/tzdata/{tzdata_2016d.bb =3D> tzdata_2016e.b=
b}
> (98%)
>=20
> --
> 2.8.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

