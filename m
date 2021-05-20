Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.6189.1621504807949450674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 03:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=qQzJrbLw;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: 32XKijlT9tV4oDdmhpJabtzARjvWBu2zNtp7hUomUYk4xmIjJzbpki65pfMuvnHMumgXKK0K2+
 pqHHfjgN8Yrw==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="222271397"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="222271397"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 03:00:07 -0700
IronPort-SDR: I5B9GtPAGORDWGSYBpAhI7FK8MuH605EmixZvotSo11fz+yl59dd+dZCHDrL1j3t9wzxNnH4P6
 MExbfxsShN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="440327782"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 20 May 2021 03:00:06 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 03:00:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 03:00:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 20 May 2021 03:00:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 20 May 2021 03:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihI/Uf12JP+RxdI/mIL8/3O2GVYbbgikULjo3CiFHVPcYH8CP4JKGs69kFXl3JvuheeIIyA1amBQm9rWiQOBoJEPRS2u3k+ipiWDptuzK6N6aOZAbk2PaVkfkvf34LG6M9fyrQgLamDhoFzzVeboQWzc89fS5doe+ML6lFTJLEJfvBMBJllqJFqB6y3WD3peX0z9J99YQqrx2fBgWmtR3XNjG1GqqPsIA68FuEQP1o+XX2WU05A0r1uJ2I4c7dwYS5+IkL6TfMJwoP+MeFYZjYFwWLFn919XU8UC0uqbcGuMDlT1aUIzkkmErJgJjJ6XSyxZjceixsepxyBrkRPj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy4lwGLGLJFnHNEbC4pvUzQpZ41Uj/+dNnRKOb7ZgXw=;
 b=Sq6c/FhpLeYzezI2KwAwfzbb7KdwzlM12M9nHOq2K+JCE05G7L20Mb0v/54WiCMsRohFdxqTkYALOoOHDMsfnIpSaDPGCrAHqrDuaT6EBenuDdPgGdzawXgR+L6EiykCnuyAaMDDD9IwsLrV+vnCKDxveDkJC6faxKDLzUiwVJp4a+JXBjefY2861ONxBGgyIzKOzNatIjDK12FtnNyTV9RdSvOqx0SYPlqJmu1NECGAzVoKo1SDh/OFpVsw74Iy6Ff610yCCst6w0VKUsAebF4sWQWWmaE9T8Ih30K+mSDqpxqezxt75E7CdV9lHRpZdZLtVf9BVDXh0mqY3kRzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy4lwGLGLJFnHNEbC4pvUzQpZ41Uj/+dNnRKOb7ZgXw=;
 b=qQzJrbLwf/CBkgiOrzToecIT0BsribRUACvQ3hU2LUMVAzUxuoQrN+C+8C0MenSM2ch54/zUs6vUwhM6IVnKr6tpXu7y9p1c5witvCm4o2YKR0QC2EvvXzz5vnm0qL6sS3fqRDiMyqkSPt0+DISWQ7Qqc/ZhV9jbM7AAUN/XPcE=
Received: from SJ0PR11MB5615.namprd11.prod.outlook.com (2603:10b6:a03:305::17)
 by SJ0PR11MB5632.namprd11.prod.outlook.com (2603:10b6:a03:3bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 10:00:05 +0000
Received: from SJ0PR11MB5615.namprd11.prod.outlook.com
 ([fe80::e499:626c:614:d767]) by SJ0PR11MB5615.namprd11.prod.outlook.com
 ([fe80::e499:626c:614:d767%6]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 10:00:05 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.3.1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.3.1.rc1)
Thread-Index: AQHXSyMmcg8sXMWGWkaf2BYw6r8xl6rsJ2pg
Date: Thu, 20 May 2021 10:00:05 +0000
Message-ID: <SJ0PR11MB5615DDEBA43F24A296E46E35E32A9@SJ0PR11MB5615.namprd11.prod.outlook.com>
References: <20210517134703.A30BE280D00@debian10-ty-1.yocto.io>
In-Reply-To: <20210517134703.A30BE280D00@debian10-ty-1.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [60.53.116.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f66f6d23-4ce7-4d17-040a-08d91b760aed
x-ms-traffictypediagnostic: SJ0PR11MB5632:
x-microsoft-antispam-prvs: <SJ0PR11MB5632D5982381C36002A1E262E32A9@SJ0PR11MB5632.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MQ14SxeUyeHL47S2dZXKAFWY5NIVTx2cS6a4MeoRAab/B/4TzWz/51U1uPEE58zKDWKdKuAAzYl/i6svLuKD/0LA/eRH2u7CJuDQ+ATHX0eGSuG7PI8UepUdztvh5J86ajy53kd6PzISQo/5pJwq/dY4zZfKz1nm2DtH2FRHfGztOQ1F/r8qzr74OKOzXTOnivASA3/b0IudOufyOPM2vbd10xuF9zyrNYJFKM8swXVOiiyo8fSxNJZKnkccwrzr70pA9nkZdIGiKVU9ELqJ5DgTZgPTkzd5ndJZle1UlGiHVqZQHKGOOmBhdEtINJH8/dPWYF2GpMkJg/RCQRWIBPfJA2lmibfgAVUVPqU1Ky6fhGW+r9pUdc7VbWQ1pkJzPPZljeuAsRxsObaGoBhWwLfCYIjevEpQGVpNKL4EnI1cMoht/VHIGR0moNht2RA5o3P515R4uY+BmrUrSLTeDUZt6IuGju/Fq33EZm+IjURGhPtju1HBqjtaa3Wq0DAyhjV82uFEX2FS9uJ35ZxD4bTp7izOu+Fc/si13ZSvMH6NwHJ5aLv8gq33nHdblc2gzpZCS8nZLTt4iUfZRXZB2xYATvHJja3bdhJMoDeyjhlWBFBma24gpLkywqADNzt1n+J9JeYJCEYVCRKFJkT5R7sdfrL7BmcUzV2FHsHG/k/MvhuhwmutWAM+v1gkzc1N
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5615.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39860400002)(376002)(346002)(9686003)(66556008)(55016002)(64756008)(66476007)(53546011)(7696005)(83380400001)(122000001)(6506007)(38100700002)(66446008)(8936002)(33656002)(5660300002)(26005)(966005)(86362001)(110136005)(478600001)(71200400001)(2906002)(186003)(316002)(8676002)(52536014)(66946007)(15650500001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dAKDk/JgucKxy+mnAYOZoHYsZaUb8bHmbaOPkpYsjqk/qbCs2mfeXIKRGs4f?=
 =?us-ascii?Q?ZSIHfBb28kxtHM7LBqycFxznR3tOdCtcxJvLV5+49nHjaFx4bb+SlSM+oEIN?=
 =?us-ascii?Q?g88Ze7xtEzBGE4AeVHARHk6yAK/oUxBCapnATWyVKPYiwMw46Gf84WUD8+H/?=
 =?us-ascii?Q?xyELcJa2tJ6jOIsc+IWaWQaog153wLqE1C1SAD3VJHTB7pPJrChPfQTHAH/0?=
 =?us-ascii?Q?rGKRulCxP3xvJ4vglFNfKPu1zB23yOdvz+b0ugcK8zqJ6DU93gXGz5tmJLOZ?=
 =?us-ascii?Q?A/B6PsQvWicWB1KNtyBhpi5oPjCe7F43S29rxhZFiT5uXliOeP5guKnc5vad?=
 =?us-ascii?Q?WrrAP02OjEoWTSzhuI+k3uuittA6VtEWP4GwrMv7KAmumfscum5Cc71uQZfE?=
 =?us-ascii?Q?lsX464IFUlSTu0HNx+G3sJkEMiU8a9zs38nKt05DAkM7Jv8QbyDXyj66Jz74?=
 =?us-ascii?Q?2omJD6ETcjAAQareriGBl6s6UYp8DI27QmlBvGR4mpCwq26PCpkhsCmo79fB?=
 =?us-ascii?Q?Lx06Hc2vPMANsDBCbbolX92n4dLTPlTXxQdVOoUzANOU6LgRO7FzCPoN0vXx?=
 =?us-ascii?Q?cxSrwMlKVVPFmj7QcrKcbmAzbX96Svj1M1VXgpY2QoJsgNh/Gny/DlCT8M+l?=
 =?us-ascii?Q?Erd893sfDvh1H8QQvIHZ+KMHGwTGhOehhoeN2oh6oPCmr5fmQnE4FrjUMk8k?=
 =?us-ascii?Q?5W+L+Q5aQyOhjM8ZV1QEJODaAeqssWLvsAhTNOgrZgjTiDP41CpKrKH/X+Rk?=
 =?us-ascii?Q?bkKPuLYd6JiHQPjGms0htS47wH5aFGjzIaHk3JYFpPHZmezQJ5Lfx+9ug50v?=
 =?us-ascii?Q?lz/ZoD3PBXjXvuSUEMnfdaLKPzwGAGa0l5rWSkwGOteWpDmNv/rI576MBfeS?=
 =?us-ascii?Q?wYzxKy1Q9ydIGDtXXRoWGU7yUdEU9J9ZzfW8z69rwf0yNDkkLFvCR2R6cqJD?=
 =?us-ascii?Q?8uoLpIE+iEBhGWBx7m4khe7Mb998O+LeBg3zK90ajKxwuhxxYr/HKWNwFLbX?=
 =?us-ascii?Q?aA+B3z+sug4p+YsHWFa2sZ//z+swKPNo/Zr/6nYp0SeFkMrMXiT25Fo57Xdx?=
 =?us-ascii?Q?XRQv+6OxGOrxlOcNKSSNju9JvHfV8esfPYcE3PiZMFJxxJ4XfX8K959uuPcD?=
 =?us-ascii?Q?+8+UOvF78McMYoU+K/F26UI6g6yGqnKyZZGvzfGszqoncCcM1gsewz8QiZLS?=
 =?us-ascii?Q?t5KwIbFMb1dSyhuHI3lbO3KJxIbXyb9chd7EGDEAxw/f1Txp1C+/1DqRXOb7?=
 =?us-ascii?Q?0Nqx4YxHZuZLk8mXYmZ+SMy1SoKj49yTeiKGZIakrG+HIaUqiioGop+qGas5?=
 =?us-ascii?Q?nnfvrByl+SUEAUIIOJLbPRQh?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5615.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f66f6d23-4ce7-4d17-040a-08d91b760aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 10:00:05.1837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCC7ScwSFXDXa6c8u0pNKT+a2VFmHts8to5B5D/KQEESGK1KwgJL+VcDvJZKUMnyK2+2Kdi/ExN91XgOFYLoPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5632
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,

This is the full report for yocto-3.3.1.rc1:  
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/=
?h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.


Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, 17 May, 2021 9:47 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.3.1.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.3.1.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3.1.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b67476d4758915db7a5d9f58bc903ae7501a1774
> meta-arm: 7ca13b4f15cc8f51d6c99b40b7ffafeb47dce28e
> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
> meta-intel: 4d5791d9ff515ba1660234b1987eae4d4e90eeca
> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
> oecore: efce6334bf122a64f63d46c1c04e3dbffe298c51
> poky: 05a8aad57ce250b124db16705acec557819905ae
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
>=20
>=20

