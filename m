Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.2368.1616569653890584826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 00:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=TQiMKjqD;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: G9yVmyhu6cbXGUfOzAlD3EcE3e4PZRTtRn4I4u//sc64tH2JshxduPWQRXp3NYYV4u8+S2t9ih
 HnFYBpcTrDpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="170614992"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="170614992"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 00:07:32 -0700
IronPort-SDR: AMowEZWDtQ17mqYIQ2DRc+TVw82avjV5D9JQxQw+hpR+ozKpJM27Ib5rh/wiCCtd+rdTHu00sJ
 znldOBOJY5Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="452479108"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga001.jf.intel.com with ESMTP; 24 Mar 2021 00:07:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Mar 2021 00:07:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 24 Mar 2021 00:07:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 24 Mar 2021 00:07:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME7PODVPkbnePiN+/E1K0EpjVAjDs0CEAJ+uVh9b45ylraECl2LCStHwSz28bVTg3IqEQIxeGxFEum9YJdNYX/AmoF0Ky3vtDQPGTPA8PbORlVhGAqGUDmrisK1+mIBKdXEFc3CPQAwTRTzhPgjxA4F4JDLe5kvACqMSLidJJk7ILhwbdm1Q9+OELEG0Cy6Q3ueCM6b+iAlM7ge1+oYf7yc7HzkHwpCB5OpQzzpPoeoo+bkVYyfrhV/56+OOB35wj7V/D1/2UarKcaZF+79wjTksKea15NRZ9bqe2igGdke/QutUgjetxxEwe7WxPHEX2pBbJ2jEZKru0EPNIgFlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o91e074dPEr1P49XAi3v1ysTz9/FDeMhFhJzLgT1jf8=;
 b=ifexNzORspuZvxomvdyiyaNI7dx8KjMukhOrdrcPoZ8q0sPLG6kLmw/wrRHj2ZShX3BJePU2WYKNLgTv6VmGywzlp20x+Ux/H4YYaikaK6FFyjZQs1kCyJ84oYoFlCXruJ4yUzGLzz01B0kuW6On0YMslu+bHodRIRqs479FQZESuKNylj9/TmqEz35Q3eDcJ8QGORcxNEP/tQ3cktE7kAg4V1o6V7+rN3B1VkU6QQmylzhATUeqv7kXx/3z0pc8Mb39NEMDNfRXFIeETU3U41DUIjTYNAws70AK+Pewx5dkXBd2Kvrf0krIpz8pQdVRbTfc5yTHBNFjO0HoaYbggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o91e074dPEr1P49XAi3v1ysTz9/FDeMhFhJzLgT1jf8=;
 b=TQiMKjqDd7YCP3If3kFXFCtklxPETDb/UP8XwTHTjimaIbmLSh2hXeZVSiVEGc6vH3D292tTXJVJ2zgAAOsYU+khmwnBL8Sd7XN8htMtoSqAHls+s6xPWkbTuZP7qHLm0cj6Nb18oC1PVNCwE2uv5TWOHZoTpG7JTtAguM52lck=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 07:07:28 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3933.034; Wed, 24 Mar 2021
 07:07:28 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.3_M3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.3_M3.rc2)
Thread-Index: AQHXIGJWw/L2A9Te8EKHl/2FJSTfpKqSt4pg
Date: Wed, 24 Mar 2021 07:07:27 +0000
Message-ID: <BYAPR11MB3624B837591853DEAAAC7837E3639@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210324040036.A00F13A03DA@ubuntu2004-ty-2.yocto.io>
In-Reply-To: <20210324040036.A00F13A03DA@ubuntu2004-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 49c78f05-38cf-4090-df88-08d8ee937c07
x-ms-traffictypediagnostic: BY5PR11MB4184:
x-microsoft-antispam-prvs: <BY5PR11MB4184F99A6A92861DA6C1582AE3639@BY5PR11MB4184.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MFhTbHPE9bQ5aKzE2B/zAgY5ohwndCQmmW37KfWP7eLfRa/+YgEOJQNWdQREllq5u99BU7tux/1oZihR/ucl5SHfPMK23GkMKABGMwZ84gQhMEmXZ0sw+0vuRSLNT8SCLRbaJDM8bCFp1XWfabu0sgeaDFy8ytSlwyWLlaPye67rcEwJmDVXBCheDJo11LYeFlI41e7981B01ftMen9V/dvINnY7jaix/bva/ZgU2mYaNtYrc72Yw6w8X+1+xKi3HPgr8A9C+HFRMsu9f1J4Yc+2pAprBRYSGPnza7a8F5KyGHKLCdI1uZb2T0M6iapwo4kQcoKFDVVkK17uxioprJpe1wsTtXJ+w96U5BE7bUWiyH3qEFP+Ms9tC9/yaTiXbKISfa7BAzIAkpHSpIlkjqqJ0Y3XxwomDGR4UJRoFyXxgH0kwV+nt/Djz6zSrdYG66pDcsL4Jv+h49nJMZCFv3ut8NcmOSUMwAwdl+FtqGpjz21AqBZrXwrWQJSYmXL7tZK62i84S/Uz7yLTek+JBZgYuR3xMAIKAa3/3aMztkZZLIUmkkcirlsfB1GDi3i3rtp3A8lQQOz2H8nqxfftFpkJ46TsAwmrXYbT7SRi3fK04tQTG+fVk00yGD67v3/TLKYG/XKzOGn2xL8QaiU8qP3iMP56HKm93dUmzsJi1ROR6Fk6Mr1MvGH45pPfR6ziZZdFlwfXuGCWe8EYx3jVnTqdc78DgOtJYZmzsmByI6OVBYdqrFcTRHAnsdXVdW5t
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(39860400002)(396003)(376002)(86362001)(83380400001)(66476007)(6506007)(66446008)(66556008)(66946007)(38100700001)(186003)(33656002)(53546011)(26005)(64756008)(2906002)(76116006)(7696005)(8936002)(52536014)(5660300002)(15650500001)(8676002)(110136005)(55016002)(71200400001)(316002)(478600001)(966005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rGLFEIsVi3FnQVJatA6NzivVzIngojlFdIV+x/waP8ySLE0x8Gg9S0dqXV7E?=
 =?us-ascii?Q?jwDl/A6c3GnXvxxzz9rQm/clwHKzSG/0jghU72r0D1p4ejyML7ujjXODiGSv?=
 =?us-ascii?Q?yeQAt4CIj1OOULO7T8J01PtxltPbVrGhUAfXxW1VpLZBKF6AnMoMeQK0juEX?=
 =?us-ascii?Q?dg9VgPl+epUDaMkaddCATOgHuW8ZQoSK5fX62Mb2wMCZtaGy9JkheFfNLOIE?=
 =?us-ascii?Q?idu6F9UQfxCeHXEbP27t5bLBBTJejXMT0QwRJlUNDdVNLJAuX47Vc6q2/+6/?=
 =?us-ascii?Q?sB54xcK+c5h5bYRx2UCpVTcmJYhEZfpCYj7yLqTM17/Kx6TYups+YUTxvG0y?=
 =?us-ascii?Q?+RRPnir7vrfFUHkelcqhwIDp6zkQb/Sy3LlKYfZkkyxPwOSD7IGsm/0yEfQI?=
 =?us-ascii?Q?tj9KqqKPAmCEBWzfcVir5dG3zW6bDYVU5LZ0iDI0bjcaESwgqv2OgY1uYDEt?=
 =?us-ascii?Q?numGmL2NtI8M6qOO8NE+ewfpZjYL7PIP7XrqVjEU357rEOINu7pJolBGlqjD?=
 =?us-ascii?Q?V3L6FSbVQeLC4LkqhTrsmMYk8sbQjBxcZ8ixg9FfEnKGkVedWGv93rNc3CMc?=
 =?us-ascii?Q?yfiRpXGE4xelfA8uTdnxQ+kPFYqRtwK3q2W1nwVPDM31LDaNSemwmcSHanxW?=
 =?us-ascii?Q?8pSsVhQm0+zsG1INLY8tCa5I4eTsh0oIJdVV6C2aiZsvt6baBRJF90p9fkyh?=
 =?us-ascii?Q?2N9sSJORAkyBHlMFVIZ427JzzAJTP3OsJXbMrrGsveVm/yXeIoKziG0Mo5vT?=
 =?us-ascii?Q?CK4DTPXdyJpLO3iJ0osZOTOX1sjdGAV9hVWZt1sM7VfkmZfLaDh7Ikrb0lGx?=
 =?us-ascii?Q?m3n45HlykuKCSMxskGptbMLdhlNupzfaEt946KxzcciyHwUbkEF7ANm2PwzZ?=
 =?us-ascii?Q?r9pr970chb5otNDzcSewx/pENBUIqFxQrmuIK2iolNpWITb5vbdasW9kQJix?=
 =?us-ascii?Q?OuUnxKVit+L3BY6GUOiSzJ/k1X+ipd4xLBXiurxHW3bOyCwD+FnYDpHQ5MhB?=
 =?us-ascii?Q?Jte7wKBzN2+5eeS00d+LfzsQF3Puy/Yma++OK442gw3y5gbB32qdSM+R7N6+?=
 =?us-ascii?Q?9pLbumqi6owvGdUMRCR/o24EJt41pIpDuY1+ibnEIoaeKAo57pgBedq1iI4K?=
 =?us-ascii?Q?D8t6W09YLl9lkBCSnY28+Z5OmE9+BPhD9wVOPTVYNU9NnGlemXu8R0q2UVTx?=
 =?us-ascii?Q?HzhXFj2FlK1pg8ZMyn2eYpwydSrjuCP3Hlxjf6tMwg92g1P2JVSwSXrxceHL?=
 =?us-ascii?Q?WliwrzknKwPsaXDkpyMqcdMW0+psglMhdLKFlnJC+sjuijV13RWAivnq4tg/?=
 =?us-ascii?Q?YLDwJhzodm/vwX9bo6PQr/1t?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c78f05-38cf-4090-df88-08d8ee937c07
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 07:07:27.9750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LRW+xQEjh4ofHagGDWCKEh+9i/vlWieVdWkW91RQAAWnXWVr7ei51SHKgvU/jAs1cVtAgbO2byMKe7rLXCU15Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.3_M3.=
rc2. We are planning to execute following tests for this cycle:

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

ETA for completion is next Friday, March 26.

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 24 March, 2021 12:01 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.3_M3.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.3_M3.rc2) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3_M3.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: ed8e1fd4cf9d5ac8a8203638add99d686b4b3521
> meta-arm: ac1dc0b894642101a80235a920bdc3bbe6d74558
> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
> meta-intel: 6fea44c695730129df8bd744b0e22ccd62a725c2
> meta-kernel: 29329d7cacc71595cecfdd05a455a0cfb164564d
> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
> oecore: 7ae12e4278e98c5b916a1067ae0b48c2da6e82cd
> poky: ea455ca8671d3bc2a1097989bfaabe92f3ca37ab
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

