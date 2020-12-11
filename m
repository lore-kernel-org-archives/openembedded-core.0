Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.2416.1607663812768108517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 21:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=amXZmt8t;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: ZtqNL1ZDiYASXfF+9NA2WGK1O/dO2f3A/5mEUjgDpvHohK2hN6xm3cfbDvgYqjNurFL/NOY3kc
 V0QTdTNYYygg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="162138199"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="162138199"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 21:16:51 -0800
IronPort-SDR: jicTKqsrJ0Yav0CuNLg6cTOgSfwoOIRdGT/NCmxbrMOM9yMj3B9HQu170y69PQtaCZoKRliPT7
 FZ8pApQJhk4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="543288352"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 10 Dec 2020 21:16:51 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Dec 2020 21:16:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Dec 2020 21:16:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Dec 2020 21:16:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 10 Dec 2020 21:16:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0gC5T4Fu5evWbqgdsxxa2ta8BvcgbNHhFW+5N2khfrlYIu7Xb/3Gh1Bg9bKbfIcbjqUFXnl69+tDAQVILcYTD0JnFIwFUBm9pRAw4nJQpFaTvOyiph8l8jqntctBf6Qe/rAMTKoFaN8LuIt6wGcOufTb9z0f3ULdvm5OUzq+ATHd2+S2FCamGvBh4StlXBee1IdqvhNmh4A8MbnSapeml4N9zsD0Mg8FQL4w22BwipDwARYkAe432crhilRhDlNHVdgiahcefeuPTbI6XvH+m/wA285xcbTi7kYBADsHLp6ZstYNAvJwe8S2NHoupafauWlOEdFEY4yF5pnGKd/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dSd9b93/ltjdPOStvjln90q56TiZJQ3ESxrrwd7dHQ=;
 b=NdJoKvCiJkhFxd4PBxjdRQ6c8uaPA6CLBpzhLG7ArkUy33CTSih+j6PNPSZeoJBaB18vscLgrEWctc1OMbNm/8MosNnq6zLTFbPHZvvHhi5Qc/8zdRd0Ic8mtJ1YzCDXxePbqN/eU+Qda9dQ6CJw2i/uMw9j9mS+GvYBtXjhmtqjz5bhbesezbzJWc8eq48iy35vD2blzr2Bt0pEVGdiLwkX87RHb289c5v3u65LVcMpyzId1hSF1tJmYLeupBbv+UnwHaywqufKg1znZMsFl8WTJ3hwodWd9EPgxGjwNvcb0udgKeIjcaf58/7TjrSnNzNhcSY6lhv6QrxSKARjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dSd9b93/ltjdPOStvjln90q56TiZJQ3ESxrrwd7dHQ=;
 b=amXZmt8tOdQBxfbh8bO3WSnIWzCaNNgkEd4xmhbosqcgxBKzG6TVA2TYS4Pc9OsWSwcrYuSF8wNAgh9zxuC/NUrMsh9l0Ki7WpFI9M6DqTQl3SByEg1LlPkjzvf23uJKU8VoeVrPZyaiaBoawTjPFU2ZW8gJAbXbP105Z5aEbZY=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 05:16:49 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059%6]) with mapi id 15.20.3654.015; Fri, 11 Dec 2020
 05:16:49 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Teoh, Jay Shen"
	<jay.shen.teoh@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "sjolley.yp.pm@gmail.com"
	<sjolley.yp.pm@gmail.com>, "Sangal, Apoorv" <apoorv.sangal@intel.com>, "Chan,
 Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.3_M1.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3_M1.rc2)
Thread-Index: AQHWzrA56w1gjX1yNEyk5wM3632Gy6nxW3Ag
Date: Fri, 11 Dec 2020 05:16:49 +0000
Message-ID: <BYAPR11MB3624BEF7BBB74FA79F182048E3CA0@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20201210045112.F08ED7E084A@ubuntu1804-ty-3.yocto.io>
In-Reply-To: <20201210045112.F08ED7E084A@ubuntu1804-ty-3.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [175.138.41.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af558f20-ad45-43a0-8571-08d89d93f697
x-ms-traffictypediagnostic: BYAPR11MB3352:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3352A61FDC0AF105EE4498BEE3CA0@BYAPR11MB3352.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wFdGM/NdBSSB9/lKibKhoyaRtH9EMwJUDWmTrSSnUgM9lC2NtOWpn88tX+Uzri5Lj/KPN8W0LQHKpwbcDEAeiW22ElBlHbrxKRyZKFOUCz+bIiBA1xQHK7LN+IrUn3AK0yqR6dxaq3Q8tBXUKFDjZ1wm/Jk//gs9oQ8qiAzxr2u6mYsmhPYwFszCtBhRKASSqm8fbIFOq6rIhepN5FOFuYY+gWfoCTZnQDFrdmfpJSywp5X/BizSjHltpsV0vT3X6RfUcIVb1In0WEvPjPeKMzJ3GOQIhPmBP2bOWlQ4DveuTsaM6raA9i6VnCAicsfZYtBOPHWUWS/8GRZtsI6uipF/MATs/WTvHYTdSYkfHTGLM0Xm12sYF5rb4f66WGjTFzSqreKhRVHvrXyKffYN/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(86362001)(508600001)(8676002)(8936002)(4326008)(66476007)(66556008)(54906003)(66946007)(33656002)(5660300002)(64756008)(52536014)(71200400001)(83380400001)(2906002)(55236004)(15650500001)(9686003)(26005)(66446008)(53546011)(186003)(6506007)(110136005)(966005)(7696005)(55016002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tbImK5qvaWns+rl8E0Uy428IG2e/xniDyflILMHlo01uClL79hAOhiKSVqyv?=
 =?us-ascii?Q?vveLrKmzignr6cfsShDA6CGxwmx+VofQW+0uUIiUfy3r1KGLXst4yU0aRf6Z?=
 =?us-ascii?Q?Vx0z4ay6qaovMsvCfPVjalcO0MDT+Z57APpGMpfjTvsHOm+H2JTgoDujbjpf?=
 =?us-ascii?Q?xdU75INQWcyHk7rLouHWuZN4iNyD4PRWC0UWK/XIEM+sq4nSDRqSbXfdSkdc?=
 =?us-ascii?Q?A9kg4BAAfBvtVHWYJCQuEJGpTKEKRC2qwfvLOyMX/taROc7FrJmX9W37sL6j?=
 =?us-ascii?Q?8G5j+ZhMl4Z3bK9UD3R6FegmFfm3iurSyCKCLG0aYyZR0FP5q2f/2El9sky/?=
 =?us-ascii?Q?bm+ejvaula7ZU5PaJzZJ7PN7wtU9xumeVCfjBJ2k8TcX4ODoYxrUPU5ySdKn?=
 =?us-ascii?Q?G6JqOkIMVVVdgEKGaojELSM3x5vU94YaWgg8CirQUJL4HtOQkJQ2sUcbOTwn?=
 =?us-ascii?Q?knIwYg/gvFlkm4aO4ziM/fnbxcG/e4jojpPds6PZcjnUVoFFN+bbjSk1n7jy?=
 =?us-ascii?Q?icaAG6HKsExQIEuHqbsdtCVZ0QhFL6HgismhmI14QfQSLl3yI1UkTstPeiTq?=
 =?us-ascii?Q?V7e3tJ5gHFd2bDmNMw7D0XfwnjI+opOYWggbPuiQX6Ar2bybwqfJWqpN49y3?=
 =?us-ascii?Q?TnjmlAEf/V2qL7cQPYw6RIeHQOSQ7RllECUx5P8r25zDue0yCNZXXCdKQZgS?=
 =?us-ascii?Q?VUPRBUcBwKi7vgvYCgjAMa8A51HQffwU6jfWwEJcp9hqv3XkrzNZSN6CNMga?=
 =?us-ascii?Q?Xyb0wtPe+ilA9HNJqvgQo5vdEHnG/3RWJH8nZWzQ4pg6hu7kJ3PnxGLHbH26?=
 =?us-ascii?Q?B6FvyGcSqwvexkGO/VDc4m1nw0fMMejobeUgYFZU5EK+kCegKXC+Gn6AB3gP?=
 =?us-ascii?Q?NHwN9Nb0U4juyJClsvJWGDX6/iu9MlEYGx8In9yDOSLSCzv4ly62vjBajD7o?=
 =?us-ascii?Q?xIgMtXpT+ALn/3vWsGsNFHO1wCAUNHU4U42hBwrnzDQ=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af558f20-ad45-43a0-8571-08d89d93f697
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 05:16:49.4774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHiT95MtRtsUtxbGIntCG/hKDC8w8fDffktga01dSoCpNTkYUJHnTpQlV/phFAM1pI7yHfhZ4j3HqRydigp2Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.3_M1.r=
c2. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. Coffee Lake
3. NUC 7
4. NUC 6
5. Edgerouter
6. Beaglebone

ETA for completion is next Friday, December 11.

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Thursday, 10 December, 2020 12:51 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.3_M1.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.3_M1.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3_M1.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 5775d9463ecedf8681cb6c919b240b80fe70f5a3
> meta-arm: 2a530c34199e9aaff2bab1ac53d81f112f34647f
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 7d79beb5093da8adf0f9b106a33d8e0904a50a48
> meta-kernel: e5a0723a3f3dadd880893bccf9bff88a9b46843d
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: a55b01a3a1faf9a52d7edad074c76327f637aaa2
> poky: f36484e88d21346357bd1fa1bef6fdcc42bed54a
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
