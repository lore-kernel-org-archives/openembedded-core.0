Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.3809.1617258192850405347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 23:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=CpLJlQXD;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: WdhKkAkWbNJVG2MFN3WTZDZ/CjwSFZQ5MnFL63rrl2Ni+fnwBIVMU3/RFc0CW1BV3cKX2HrvzS
 042H3C3EnuoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="172194794"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="172194794"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 23:23:11 -0700
IronPort-SDR: OiXIuAOTN/CHE/hzXWnZPdiESLxlvZLkljtbBRR0ZikQsqnT1I8i1YteICrvdjJGVeAYz2b7l+
 7141MGYcb80Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="596204646"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga005.jf.intel.com with ESMTP; 31 Mar 2021 23:23:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 23:23:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 31 Mar 2021 23:23:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 31 Mar 2021 23:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZqa3sGoEeVdK+uhXcA31vJxYM9nrYCt79cQe/3WtSZAuDu0rDcaZvIQPRpx3qT3+RGnydZ7NRjk6lba8G9dc/S4uOmnPFxB6EaF2xJnm+wtcw4ciV4BqXfP80qN8FeD8yNLPe/R55VeAvl5IENBU5epGjku3bO32pp2BEoMCRMMrBlgvwDUYrRSEyEeKNQH/L7DJMxPk6T0oTC8aruVwfGmRxDzJ2bgmdn+6HPoslKuig+zp4lxdhv4c8FQ824kXHKx0ZfWl6We7vNePp0vTHuNF45N2FaPAP4My1KGmKz+BH/LjMue1AZ6oE/tRRZVZy7xYHb8M8d0kixfOOgWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcyYk2Qd32+CLkOJSVNsvuopRHrsTd1YOZMF0kNCqZY=;
 b=SNbv3rsut6wIBE6juia1XjRxYz1AhNM4wl+z1jeyK2IHuIZSuQOrZzqSWJp40UfZ/6/AHANNK1ZGd+zn1Pa7TafRVCdfoW83UmteZAuedb7O69Q0qkqrYyi+I9nH/xJoJN+hvNhVFsNalBI28Gm8hT893wO3263LQn6vxBIHtBsXHB3vt7PQT73rW2Gd59wzq6Zp3ydTRL/voJP1yWoku1ONZt3OrO75/kFcG/9jUOd1ow/kxTOE2vHnK2pEFaTVqEgGMu3OVXb3CgkvfQCoyIgZvT0qjMg3MGXzjLEFY/eXm9hmG7W9LWqyHDF3iuQ1LNWL+U8NMnq6AETN+0AAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcyYk2Qd32+CLkOJSVNsvuopRHrsTd1YOZMF0kNCqZY=;
 b=CpLJlQXDIwZiMiaK04y6ptL0E+E/xHlAID1Iy8BqATyzrOlxIiifYGTCJbHbPQVTV7OD8Rev1oWZxAXGHFfVBVeFffT0mAq55pKu8N/HJpo2llLWwvbpWqY+ydHqh57YE/ji89oeZGUQVBheIwE/wM+9S2YR65iALiRpfGPDi+0=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 06:23:10 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 06:23:10 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.2.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.2.3.rc1)
Thread-Index: AQHXJE57LjP72qvC6EeczLw76qHg3qqfNiXw
Date: Thu, 1 Apr 2021 06:23:10 +0000
Message-ID: <BYAPR11MB36243440966ACEEA5740684FE37B9@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210329034900.510C02A08D8@ubuntu1804-ty-2.yocto.io>
In-Reply-To: <20210329034900.510C02A08D8@ubuntu1804-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 99919a1a-8442-4d6f-5aaf-08d8f4d69f42
x-ms-traffictypediagnostic: SJ0PR11MB4928:
x-microsoft-antispam-prvs: <SJ0PR11MB4928BE95056122C6DE9909D5E37B9@SJ0PR11MB4928.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LBRPJEXez4Du6dfzgg5nQnkBMgiFUoAlJkEWrswWvl+b/NfKjD8QpHLeG6TWXS1U+ZtMv0ddvt8JEay4Yi/Fo4sLEEAXsbmTVHZOjts3VpIkV27nCaGsY/XG9JLc+yuSoQ4WFEXDD9nuArre6z+F2I7q558i6MZWCDJQuKnDbAqxDXxQ5zYQxCLtHMEKkJSa6866E0CfhBTxpnmBOMFz8oYchUHfkWXKWviFPjuxosHgQyfpOUWzojAS8P2inwwsiy8Ei/GiGbp3dtVbRdvj6QfhsBKPZbtpzj73yEyysTiOaUmNLfVAYqhkNmMl5RlIPpWmOfTO5QkpP+wncxyfi5f7hH71Lmh8t+aqE3B4ykACedRaNtzqurJQoPIBwvJN6YfLs5Ii3du7eZ9YODfM3VmoKWrmFoJslLxscI7U4wQckza85l90fTcs5v+ic7cNg7opmMg+d6PPPv/lZcpszbEtc/JHNiyM6GssB7xO0k328Rx1TKEq0W2bIVCJavjdcvv+MoYXc12L24WsOqnH6cePz6ulWe5FxcjkqkneFGganYqo2isDNpu3hZMj27pFC7UOLY8/1p/ZSrVx5ygnDJvc7kobv6+nWIAGMlFczKyR0agXrpgiAyONGnD/2x393GTOWqW8Js+OTSr8STZ3jXDHYBocbaV5SEjKyhgXo8ommlHpoDTugex3K4RN33/6W3b5FiHLf/TfcrSkKPJNvxpnKGcSuGN+0zF0jWfzRL4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(366004)(346002)(39860400002)(76116006)(66946007)(86362001)(38100700001)(64756008)(9686003)(66556008)(316002)(55016002)(71200400001)(52536014)(8936002)(8676002)(53546011)(6506007)(966005)(15650500001)(186003)(478600001)(83380400001)(5660300002)(7696005)(66476007)(26005)(2906002)(33656002)(66446008)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eeHLq62SeqgiDji4gqgtLQFBwRPOls+EG/28o3pMQvxqjcc4usNMrgQwBU8y?=
 =?us-ascii?Q?rLPRuv8ffgPWFZ7BUpMULwIV7BxuSRRW1rcp+6K3ErfLTY5s3ighJTBDM7la?=
 =?us-ascii?Q?yyvWh0ceQdFQDEHHQMuCvbrymE2q6YPZorkLq0URYejP921FRcPFEGBTkRhc?=
 =?us-ascii?Q?SE4UMK5m+tkf+rxRYK/Y2aqZAy0P/MoQGLh+/WvFJOzdCKYnNLxYCJDEqlil?=
 =?us-ascii?Q?MHRPotj3jdbHR0oSgBLEiqE4ZS0BhPgLUrwn5VHjZ1ITHPJwFxd+YR3Uvg7J?=
 =?us-ascii?Q?wXqL3OqGy6dPCABnG9HriDqx07MTn/hTm/b8vTwd2IqIqgVer2b/d3c9Q4VG?=
 =?us-ascii?Q?iWgECU6p9bFsPIHwnoS//KwU9+W7JHfWMwuQAr7t9kOhX3S78O97PhDa9htk?=
 =?us-ascii?Q?IL6FOWXenSItD/8YxrZce3k6GWofUC+zSqIwRJsLHhRDxfeUlKGDlaGqErh4?=
 =?us-ascii?Q?qBE8d8ydkC3YqHJ0FdS/9XkfiWN29IMry3XNgbkS1yo7LZsQGnavCJZw4eAv?=
 =?us-ascii?Q?9lF8nEbnBKuKc5PxTZexPJhGLNlzYmFujEuEKbzHjsu8hs19WSwlnsQV928E?=
 =?us-ascii?Q?7nIaZk1notlQ+5+GMXSf7PL7ysxd6xWpugWGpI1JnjI6Nlz5DmhMimMveVNL?=
 =?us-ascii?Q?1esP/+LMjScWvK5IDoURlCRdJQXAaFmpNcXJfqpyv+fkr6XIHNc84TuHp8Tr?=
 =?us-ascii?Q?U29L47GtXPoh719Mk6pD5kvdrExZsdxOVj88m/GIiVLcCHUpvUqqhaKpvRm6?=
 =?us-ascii?Q?4oT+isaZEuvE5BtT000PVV6ePEI4dRupYTPR6/r0Pk2TOgppLQ5bFLiJjWfe?=
 =?us-ascii?Q?6TbcKtGgca2gjmPrPRbhe2x0VnYRkHW2492TJP+KMxAZgBYgo5dgSlYdmPIU?=
 =?us-ascii?Q?WvyIQnhBsRcy3pyjCWiOCCiHBVZA5L/5PSlhNX9q3bjxvp6vUHcKZu1uHmcF?=
 =?us-ascii?Q?AKp5nPhRJxJGe+3Z7KP5owRLcR2HkakIIwAni5V5KvJ6zVZ660N0IshQeIOw?=
 =?us-ascii?Q?fcnPLY46gAAl0dcCpNHsQiDNx4ObdG+xueDzOmA49COr/pXCWX72HNcXZ42B?=
 =?us-ascii?Q?7312jq7a+8J2wbkuMBOkZ1K11eXOJWlMLhlk0ZQ8uswrVTtSfhZUQHO6HKKt?=
 =?us-ascii?Q?IYZeWAD6kU/8HUl7JsAzHYPZLlrkrzWnc/JtpL7iGnyd0urA5LvxPNJBNoVT?=
 =?us-ascii?Q?qB3IQ2RzI6GBHHrOOzVadJtUqZPxoIw023u2Tpope1wDYkK+cpWaGWDmy5UP?=
 =?us-ascii?Q?zatP9H6BXW1ovyZaVUISqtEsLrw5G4C7lR3JrQ1fxyopsLITHIaSJpC9A0Fj?=
 =?us-ascii?Q?rV0xdtKyFhsZezIOYp1IC3Sp?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99919a1a-8442-4d6f-5aaf-08d8f4d69f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 06:23:10.3970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCpXdvY2sH/DWWrOvpuAhnLmZNWM/xwGQIKxzZSdp2C5QjH9QdwtjfMrPpTzLyq9I0JnI2yhZEXXI/SpkpEO9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,

This is the full report for yocto-3.2.3.rc1:  
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/=
?h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.=20

No new issues found


Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, 29 March, 2021 11:49 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.2.3.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.2.3.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 5d02c98489d3a5836676b9c3fb3bd0157449db2b
> meta-arm: e219ef606e297b98512887c96522d8d8c536bd6b
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 76e0a427e58d068d0758fa052d2d1548067cf592
> meta-kernel: 29329d7cacc71595cecfdd05a455a0cfb164564d
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: fdae970656cc421c542af9856bc9ae038c61db13
> poky: 08665a81dcd41069eed1468f1587abe6b5893471
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

