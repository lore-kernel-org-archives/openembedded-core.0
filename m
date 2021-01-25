Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.33776.1611563245763262560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 00:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=PS40NMKJ;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: 82iC2dffQT1+oAqSMAffB8/mQ1/4Iyhsxb48I49ANz9qmaNw2XQBe718ik7nJYzFl3m2z1Uycw
 s+bzbRpP2N0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="158861508"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="158861508"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 00:27:24 -0800
IronPort-SDR: LZEeW9F04LdH7z3iW/kFV/XdMDsmBWd5z0esdfX6dltfp4Uq0Hnt+0pZs/BLtV6IwCxnBJV6Mk
 hKT+jRRVeOBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="352911324"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2021 00:27:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 25 Jan 2021 00:27:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 25 Jan 2021 00:27:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 25 Jan 2021 00:27:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTj+uJqqouQ1xTwsu+Lxk/rmXBE0GfW9zYfPN9QZsp5W7EVcTnTA/U2MHyH601HN5XeA0sOAodcDYDBAczOJ6uBCns10bozaoOgaIp3Fu/O4xoNOOSbdaTm3Iljl2cl+8Lo+Nj7rMAnEt7mZ3q09LzfcofFBaro5VheNdbH5ncEraF+BC3mcbmb9NRZwIMQXIwiM7TjOHrY929n8H/bH27S4UmKgzRiRi+S8lyakBD9QN1z8TQRJMjKQ+MWmASE51DZxXTNbyOcjmq515ttTY3yR3uHkTCSoP5yNON9L6WCOKxoktXk/cMH+sz2SW4p79Zp25ZdfXCxo4kn0yFDvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZ41efZd5SoORDldwbHp8EB6HmehVRBSX4NWEaHMvRs=;
 b=UJSoXviOcVmfmhfXcs+EEhanPzK7DqUKyQpyyatU3AXcarAJN0XWKqC2x4Z2y/XjVymYqWPO1osfGuetvee63lKLQ8fQ3P5DSeXqjVLBp0x8SF09YNfO9ijh1O6P6IUpcD6+HdttSX63PQFm6nc4VP8C0MYjP8uVfDVYmFmfWvWaefcRK1XAfnTxbKxhC9ZbrgfkzTiO6Sv7ECDQQ0TPWCEzVqQIKHNlAMgPQIcGRd21IdbLTvPM7n1AnaEVa2Q1SWdzbHfCHkFz0ukXZfnd5/YjuotcvdejIyQgVHdIYM/kRp2+0llPgHJGLjFAIsBZtY3aKUvgvwtk8xflJ0OBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZ41efZd5SoORDldwbHp8EB6HmehVRBSX4NWEaHMvRs=;
 b=PS40NMKJK/s0Y3bv37KE9xe6vltC/WC7cKsf44w7VZO3+sBPiGj+rAblxzWTrRjQIo2YM3d1R9E5QFy1NwbngJzgOctUmDaZXJLV5W68aaI3GU8yye+pcb0GP8FYj208wrsWa4RNKJUOEEQwc5EQvkqJ/gItu1CYMsQqra7K9cw=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4008.namprd11.prod.outlook.com (2603:10b6:a03:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 08:27:20 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::6417:be76:6b3c:213d]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::6417:be76:6b3c:213d%6]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 08:27:19 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.3_M2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3_M2.rc1)
Thread-Index: AQHW77MSEJ/pkm+J4ki/SKnSnIwRU6o4CAYA
Date: Mon, 25 Jan 2021 08:27:19 +0000
Message-ID: <BYAPR11MB3624DF7233943B736F924693E3BD9@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210121050529.465241A30A4@debian8-ty-1.yocto.io>
In-Reply-To: <20210121050529.465241A30A4@debian8-ty-1.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [175.138.41.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 656f4675-c25d-43d1-1e87-08d8c10b082c
x-ms-traffictypediagnostic: BY5PR11MB4008:
x-microsoft-antispam-prvs: <BY5PR11MB400871AFF34A471EC95D92C4E3BD9@BY5PR11MB4008.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZcdVXHymlBH3FSwzu37bk3rPxMy+7c4xxOMFK8vLL8XgrTgZ3vUa+ezRbXq94HufsbGwa8O1864oHRG/X/9BSvNAfYSOzGxGxAfvOEHob0kjdIDW3/90xowSjltVOCTQOlls5fyK1X7m9SNKfmajCMzA4rBawBDTOEc/V9TY3aGYHK7+AxTgU3vSLCwpDISSwfURHOVVeIabbc/aEnIAySywlj5XXyaC32PtwuW7ZVA/PTzkfRQBLOPzjfloG1ET8TcxSzku2Y4fYHiwn9ernPWqIf5wn8JZhFTjGewoV6X5zbhhTTts9PRbASAlLpEch6QuQEyrxTVlZDPlW4dPco7Ub2OdLfA+KtZH/Jf0ADTQTP1Yo1QdKq0nr4q4CQdGbnFoUFAAjiNhZNQ0HKUyUFFgsZLlNWDjUTWRaBxUKutDWQWJDY6UYqmDmJ+gl3qzwQjDoxZ6EBCwFALlY48dog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(66946007)(71200400001)(76116006)(316002)(110136005)(7696005)(478600001)(4326008)(26005)(66476007)(2906002)(66446008)(15650500001)(8676002)(55016002)(33656002)(83380400001)(66556008)(966005)(8936002)(186003)(53546011)(55236004)(9686003)(5660300002)(6506007)(86362001)(52536014)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?3Yoz6+3+B0dZ1sQlwF6QSQr9pOUyuUlfyImQbHZGXjwuRPohL6ypBuEnyIQM?=
 =?us-ascii?Q?V99eqOxoUL4wxhBcqtFnntzJHv7htLZB3D/WcxquhIT8RQgfmN7yJa0SsnDm?=
 =?us-ascii?Q?Xee5NI8xz9QvsF1tM+VauRQ2mdaMKw3WgRvYWISD0GjYSUlTDORVA9Y2Y16d?=
 =?us-ascii?Q?R6fzagEJkXfKVsgpXF6JAiSG6wjnyP1WCve3ZFTfbzNB86/YGWDMGsyjCkOJ?=
 =?us-ascii?Q?IJd+HAzQiLfOzxxSrFK8yFDJo0Gde5ajPia8HeUKEmuBZhaUxIPE2UyuX49W?=
 =?us-ascii?Q?MM1dFZh3EtFhu9+1W5B4DSiJcqE8S3VzQT6P2t6XU/Xg1SE86gvFdW7z7PaR?=
 =?us-ascii?Q?danSaQljBv3I1G7t2tMtKZPREHdrHJ4o3Uqh2fUy7mwBMLghMWTwsG6oEQj+?=
 =?us-ascii?Q?Og9iVZjzSg6kQc6r627SJx0luzrHorMV+5mb9DtDDyRWhGHufbFuCgYbdPbl?=
 =?us-ascii?Q?AtrgiAUpBWoaEFer3hpJwQW3TO0ksfaC9n5eQ+9PbWCPinoQco331DeyyoqF?=
 =?us-ascii?Q?3rfEF+qS7nJK8+basdEIuTygLo1pW1xbBM5EQj66aE6jIumfVSuwb0pTT/Sx?=
 =?us-ascii?Q?iB7x7C1jyfqgga1nyi1ACkaTj1zZyjQb5BN8gTdbHAvpanOTWh3HWZ/pgDTp?=
 =?us-ascii?Q?7wkEjR3H5oo+zukh5QNCPc3EXVehvfwKA9Harg7wLJ7nkHQG5pghVdFvR2FL?=
 =?us-ascii?Q?zEBL2EMzPw5GQqlmmTg3QqeQ6AgrMY2g9P8hsYJCqYN6MuUBlzHGlCLMxcYw?=
 =?us-ascii?Q?j9TGaWhMNN4gY6aEy3vwXVY1rjqvfR3zx7IcY7gnmbVBSGP3LV7GZA2+PuKZ?=
 =?us-ascii?Q?inpw+p0QfU0GtR6Ri8MJYF+PPHOFr8gZiTWh/Hhufv/Nd1CNqL02ohRL+1xq?=
 =?us-ascii?Q?e+HRg6SiWN8ZwPfiHnDvn962F84QRn6FNeb+cYH83Wzm+9HS1fjPrwdXrb/+?=
 =?us-ascii?Q?+5myZ/8xaYO1JDuTGADYe0Bd/52jCZV6CH2O63GJkRfQYvRo8k6L4+ZapTSq?=
 =?us-ascii?Q?I3XAP9BAYZ6AuRfgbWEX/PB/4C/tmHTdAdhypZsrzpweEXNQWKiqx8duQJcf?=
 =?us-ascii?Q?7i6NRg9Q?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 656f4675-c25d-43d1-1e87-08d8c10b082c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 08:27:19.7366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LDX1gQAQ9si7fkLl/UpDJAAw84hUo66gO1ClR9AvGRvhH0ONP64uSFgaVowmxgxjCR9oP1qUH/NZYNLfB00Xrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4008
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.3_M2.r=
c1. We are planning to execute following tests for this cycle:

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

ETA for completion is next Thursday, January 28.

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Thursday, 21 January, 2021 1:05 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.3_M2.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.3_M2.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3_M2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 01e901c44ab0f496606b1d45c8953dc54970204c
> meta-arm: a8f32f990a0d9dc1db310892c70d5a994c698b32
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: b4e5d33affeaa223459c0935a853485137b4591d
> meta-kernel: 8349870943ba44bbd688656897372e881f32c741
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: 79821d5a185e25384f5b6b5158b238bbee17c79e
> poky: b5e634644b69a968a93aad0dd0502cf479d3973a
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
