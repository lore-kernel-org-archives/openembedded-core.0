Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.5953.1616054917329852078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 01:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=a3V+MIsJ;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: J2bOJ57SaYS5xUgOGskpyus91MyCb0y88KJDQWFAEynVQ4G18T/Y10O/lbJeQecsZCVTxVzwU8
 e4IRNC//lSQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="274683728"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; 
   d="scan'208";a="274683728"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 01:08:35 -0700
IronPort-SDR: GP0KjoTedgz5m5vnrrKNQPtHR31tKT9r5Tyzh60sDNNru/4eQo+sm1A97gBMJLlBL9KPDCyn45
 jo4jDU4rFvCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; 
   d="scan'208";a="523176348"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga004.jf.intel.com with ESMTP; 18 Mar 2021 01:08:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 01:08:33 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 01:08:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 18 Mar 2021 01:08:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 18 Mar 2021 01:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NA3bCMYKAsy4O3jvdX2ZXXv2zsdOeoYixi7mtt1HQ8sLEWkJ2kKgxGFjMdY1esmzq1q85dvqNoDZ4/kEXO3DWL9Wc5weD9BzAhLpp/t71GNZ96HUwtjeAXZw+XIbH1j5JEKKBJVdeewB13BacQ+gWxoePwUKITeNe7VnfuenSoBkAlARGVgcVGix5GSxlmPFrjiwOosUNvr5037ufrFk57RozntvzQ55sv1L5xJy6R1rkTl35q8oWRQs0I45Pr6akEBjw+yG/GxJFBbnY37cAgd+/rzauoSYG68mTJHBvCmSu56ebaNwwPCJGRHimnL0pwjuJ8cvZtK9vGFfSWWrfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tS44S2rPh/uC63mz0tlxRDj9YLuP5DEbs4bwBc8retc=;
 b=VS1iCsIzVsucuCm1N+g+t4ghXVJg6dNR6ffaH1uB8AD8eQXHeqSGAC30jUSwDZ7T20q3Wtc6YR25/L+Lt5TJQHIU/6UBoaE2tua01oNVoB5Aq8ve7ck26LBsCjpTo84lHchI3wnwj/3n3i/8zMH7EsLYLtvjRZspWwTQbN1uSGNx1pI3edH/FbhEX3VnbDmH5oZSORo0zTEzVglgjfzzLnJDo10alrQsiYde/FLpAIHvni9mnYEBJW1aaSaGK+j/39aymEG6J812/UXS6mlAN9QSKW+I4OmYKK2YVTDctdwKkbdzFvIsB1vxHNChh83av1h6/W0l3LwYLtZpDvYMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tS44S2rPh/uC63mz0tlxRDj9YLuP5DEbs4bwBc8retc=;
 b=a3V+MIsJ4mdYTDJ0xgSKyTe78+TD8pq1s3N8CxszTBXo5aWKRbhTsn4RSX40aQ28yKpUA41G8wO/8ZqgE5vPA0iOXKRv2Tr/uGHd8PUPlPyhiWZ8uqaKqb9Q4vxhOIrR/QvB2tvtiezUUhqlRfjCC90PTIihAVdvGauRvoOCRKo=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4484.namprd11.prod.outlook.com (2603:10b6:a03:1c3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 08:08:29 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 08:08:29 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.3_M3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3_M3.rc1)
Thread-Index: AQHXGejkaYKvh3VOA0yJJsaa143FVKqJZ6zQ
Date: Thu, 18 Mar 2021 08:08:29 +0000
Message-ID: <BYAPR11MB3624574BF997B1E55A4FA7B8E3699@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210315221559.A925314390F@ubuntu2004-ty-1.yocto.io>
In-Reply-To: <20210315221559.A925314390F@ubuntu2004-ty-1.yocto.io>
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
x-ms-office365-filtering-correlation-id: eb23416c-77fa-43a2-1057-08d8e9e503f2
x-ms-traffictypediagnostic: BY5PR11MB4484:
x-microsoft-antispam-prvs: <BY5PR11MB44843586EB98C93782BC1C2AE3699@BY5PR11MB4484.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LZ9MSFQtKDJrseQzy2zkt4LnGAbtxcCzFqI+sPAkI4uSWrNqGCey4idQ8KNMe3JF87y585wiEc1hY2nDuf8E9KOXdkYVUWxA+iTNvHLTOkMHPd1DKlyvMwmN0asTqWmGP/VRtH4VInddutTS7lpocn81bFXK7vbih2Wf6BhQAZC2E7/SQvHGvYtEK/GqAUj6jj9hmO6c23CybjZooGeoJXPEy4IwYb2pn9iKmK+g98mqC5Peeha9AtIA2YFcZOw98qnV8ir9dE5GynmwjchO0dYxPlIES8qQSPyvHgZ6rtdpOvazdPhUvAzVfweLc7x4HmT3nmgTy1QqQJHek+6idiAnvMN4NixlmGplT7oH1/PDllD/9q+aKgFwuXdadgcqRFnyoqfH8igRkg5FEGpCRMhxFDf+ly+irX5w2Nl38yfaYniX8vw8XbXat8Bf/IlHwqNHMwz2iJPQtmAmo1e+507DcYo6Eedw2GhUnjwcidpmoVEmV8Y+hg0zsYGHUx7zALpO2GuXqvPxw8VSWBXC+BU69Jl3L5bPPKwb7e/NkzaAEIPxPtJkrCuvt32f57JOguf1RYPNugh80rD4GExhji2OXogkhVijmF18oJWFYIlVmR6M+WZhZjwOa5eQ1qnenfd/z/A/axtpLpebMIrsqTBXlTc2XWcH4ViVA38Bnp0gQ7fbqHZAlJmgOJf9iPSGyHTu3qpoDaV6IOZ2Qq62yQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(136003)(346002)(39860400002)(9686003)(33656002)(2906002)(55016002)(66476007)(66446008)(66946007)(66556008)(64756008)(15650500001)(8936002)(478600001)(38100700001)(110136005)(8676002)(316002)(4326008)(6506007)(76116006)(53546011)(5660300002)(26005)(83380400001)(186003)(7696005)(86362001)(52536014)(966005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dWQbjV9J6bjrUv32RhiyN3vd1KJkaVmF0P0kwcVuy9EcXl/wVT8SU9zdn9la?=
 =?us-ascii?Q?7ByvHOxusnqofZvp0AS6dh7oNc/bJ/35WORtwNH8F0BcG95FoQXryvsUzgGI?=
 =?us-ascii?Q?IwbRzZOUEpWFDaQZESbK0OeF0Fa7EBAcDpZFK4joM2DlkeLpwmfAz+R4aM3z?=
 =?us-ascii?Q?nAtJcFRadRP7IBgqCwJZr5HDdDSi6zzDMK3LwZh8GeTJkDwPDVpRhd4tuQWm?=
 =?us-ascii?Q?OM9Qh/ROoDX2mCx8D/8ZkY6o5MtCOSlrSJRZxbywPBx6oU1koUx5S/N5CFGb?=
 =?us-ascii?Q?0PLNqcrKEbil15CQo08qWGe3k6Px1zRUYRDMRBmVrLl/0383ehSDm1Xis28m?=
 =?us-ascii?Q?Xdk3vnfmio2YhZzbUvgKhLTW060NjqAs2FejrQPV0ASyAf+RzUUOkEnmYLoJ?=
 =?us-ascii?Q?iMAeK5tXvVC3RDhI0sn9YMZF3c9J8k8qS2TOmR/rUEeZEa+ei57ZIg9AEE0X?=
 =?us-ascii?Q?Vk6V/GMrx4P7PeJvX4b5gAajj/uTam3rArYQZvv0/A/FMCaYdhQQg6aYlxX6?=
 =?us-ascii?Q?HK8TkVmU81A2GakUZRJvyutldI09KwvRmfGUDjhN4YNnVXzgoJT9lz+nEnGQ?=
 =?us-ascii?Q?JjoXJ4iMblQRXki/bApkQyNUFfD7xbCldsv1OgkG87OyxOjcqTMmDgbNqu1L?=
 =?us-ascii?Q?6Rac2tx6LBNw3SSV3FnlJwI3yQu4fESSyz8TYk1RYtwALaAlSWkGjrWahn5n?=
 =?us-ascii?Q?kOQc6MN0BLtL70ejXi6hllqS6ajU74rkoV929rFm8YLLqnaT9SL1/WF/Sm6J?=
 =?us-ascii?Q?04HjQFPRmsFAmEUl3KY9r+2OsCcN9itgMFpgdwf6dufaV4i8++gBE2bIWUYz?=
 =?us-ascii?Q?IFJFefU00V9ju2JWx3c3375vznzxahRt0RwOk7a3dqxPGwQpYJVib0h65YDD?=
 =?us-ascii?Q?QFgbwCWwuead/0y6g04wxHyXCTH3/PJ1DGYYsIKNX28oDFBAx23ZBxo0j4Yg?=
 =?us-ascii?Q?07edqzmFWNqNiJvUZp5l+w0z3Hk+pedADgaCVX0ejwFA9uTiZTqK39U9S9XW?=
 =?us-ascii?Q?9tgc6hNlB1moLc3VTgFORqO6i31lq8fesTCQmVCUxSNKcvXscAa7mDAF+Q4T?=
 =?us-ascii?Q?klvg7f+cprFPnzcn1Q0aQfPI3h9o1/L9f+UvUg6WgiFQGdcg2qVQykrciUQh?=
 =?us-ascii?Q?OU8o6+fS7yMV4gIZxj0yPVSTHYKoCOcDMVGEBK6tj91fkEbENKmKWiLY3r+U?=
 =?us-ascii?Q?PopYsW3MjQrdVWYYPNhQGdTp7ySdiJteN8qnsZIBIHnKRRWWqDpxaOFaWrrn?=
 =?us-ascii?Q?5VCNhlfFHaxnp6huWPl4Io9GlSiC10hzITO5OysjgUnNhqfTgn0888FrNg4B?=
 =?us-ascii?Q?VIrcaR51vWlrzAqirgHSdYrz?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb23416c-77fa-43a2-1057-08d8e9e503f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 08:08:29.4714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwq+raOAHsuHSsKHAw+rfje5o85SSQh9BYGsXeaXvq+CqTwMMRWq9IuLSD+WT6C99pf9/8XRQCb9ta7oEo5xEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4484
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

This is the full report for yocto-3.3_M3.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

new issue found:

BUG id:14306 - [3.3 M3 rc1] beaglebone poky-alt wic image can not bootup=20

Bugs verified:

BUG id:14203 - [QA 3.3 M2 RC1] failure in ptest : gstreamer1.0.gstreamer-1.=
0/pipelines_seek.test
   Verified Fixed.
   =20
   =20
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14306
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14203



Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Tuesday, 16 March, 2021 6:16 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.3_M3.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.3_M3.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3_M3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 53c30efec4099035d19e6717059dfceff8ff88fd
> meta-arm: a949ebfd06dcae26ca3c625195e1a3ed703b2c6e
> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
> meta-intel: 850940e3e5ebc75328fa75e718235342cb6c2172
> meta-kernel: 29329d7cacc71595cecfdd05a455a0cfb164564d
> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
> oecore: fa1e1fbc082e82e41ccfeae58af97fe048c9aac7
> poky: 9fbbf40317743beacd8ac9d3f602765ed9d9fa6f
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
