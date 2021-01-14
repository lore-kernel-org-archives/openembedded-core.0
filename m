Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.3486.1610597310483701274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 20:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=yf10amZD;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: //WQH4cFQu9SLXj3l9ZQND0WdILzWNoIA+6ajVKEdNaAPXtXTZl+noBfgY5lxIi/WPzgjtsAGM
 W3SymYWKpXQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="174797857"
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; 
   d="scan'208";a="174797857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 20:08:28 -0800
IronPort-SDR: pMTsVFUodM7LJ8WUKwhn4y5MBWiudQjv0SytUEforl5EOzKTUgTa1Q4Ely7DlFkko/rJ+pJiU6
 lMbnD9pj8Dwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; 
   d="scan'208";a="352394873"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2021 20:08:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 Jan 2021 20:08:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 13 Jan 2021 20:08:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 13 Jan 2021 20:08:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR+Olza9CtgYhSrOPNu9VcpDO7UtHhPDS8W1X/wp+XB4Oe0jBG+CPuQspczk6MaIwk5zSqowy7Tds6n3q5bwu3y71W2Y4paHHbD5RL+dUIm+lo9n+GHFuI1XIBnVLXj4hp/pUr2tws2lJXb0yfL+sJwtjn7bsZt6PONTWB6DxXbmCSXqFU9Qt99VWhuuCsd4Ek695UvuMppkxz9ycuED5B3wjEQ8Ppu27hhY1FiHPaPtXq0347VtmX3WryrcpWRpvGaebPTXmdJPx4/TJAVvTe0UK0yMgsS9fiAJqkneV8b1Ypd8EtFAu1KYcGMEaQOwMYRY7ayK7/y2m6dW+0Biag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2pQb+84/DC6yVF8nbXtbxFoQ/Aai1nt1tJ9w4lrQMQ=;
 b=F3nBVXaYOrzsWA3s3hl9RLHjK2B9jZIyZzXlI0rNWbGeVMwdXqMu9rlCOnwk73nIGzATNYv74Bq/TM2r8BDyFCXuUjaGcVJa0JSUHMDWEgJKMk9Fr1BGMETTFDxDo5XkocPqDuswtbg3WidxthGPXFkYm353MpAXi528gFmyVRLfnxu2PuZUNSA0iO0VsX5ZDpG9GMHTpq7+j3+xBMZC2zPx0eRveVzp/QTw0jsF/JwkPPI0HLZ8Ip7N70LqTbBe9ZnkGwZWuwjiMjreqzsSAsODsREgn9RSZJhAYVYrqtLP4xPfJvYGn/mD8Y8SVXH2knVeIDrGeEyWilRHenMEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2pQb+84/DC6yVF8nbXtbxFoQ/Aai1nt1tJ9w4lrQMQ=;
 b=yf10amZDpovgZBhjUAGwWwWTJXREDo3yJ7eTkmk5zik0Ez5JM9ua4OULp4VbEnJ9B9FL+LAzSWs5ziMB3/BHROsvnfzcs58DuUMdTv5lPJV/c+od5XaUvEQl20A8TDI25OLMzrghyMaNKN680ed/lhBjneRPZvlzmmNPM427wMQ=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 04:08:25 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::a181:63bb:4d53:fd3e]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::a181:63bb:4d53:fd3e%4]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 04:08:25 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Chan, Aaron Chun Yew"
	<aaron.chun.yew.chan@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	"steve@sakoman.com" <steve@sakoman.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.1.5.rc1)
Thread-Topic: QA notification for completed autobuilder build
 (yocto-3.1.5.rc1)
Thread-Index: AQHW6dshOp04f8huakuurSyZfnEcpaomgZEQ
Date: Thu, 14 Jan 2021 04:08:25 +0000
Message-ID: <BYAPR11MB3624549B4A15C6B3A77DD20CE3A80@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210113183711.2C0AF5C0221@ubuntu1804-ty.yocto.io>
In-Reply-To: <20210113183711.2C0AF5C0221@ubuntu1804-ty.yocto.io>
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
x-ms-office365-filtering-correlation-id: 387f5685-d253-463e-a0d2-08d8b8420a85
x-ms-traffictypediagnostic: BY5PR11MB4243:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4243C6A538B36C65896102D9E3A80@BY5PR11MB4243.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hBItVK0QV+dfCZ+l6TSzWVhOcIIX65+9Ptuic7p420OPXYYFnmM8V97Lp3uV7u3c6scbPcXEB/SZpImBRRAfC2tMAWLNJYcMKcHDnrHGyfNZxrMXL2qe3dEqgosTgzvhry9BjJEaJ/KnbfyetuuJj7P4mAGt+JyeJ/OvBU06Xwj8IUGxwmpQppwwsONScRGhEIxWTaMK+3oPQRcTQucoVGVJsNR3trirBLETXwTPZpU+iCkUQLDKHifKZRT7ozDaM/cwsg2tLY0rWg89F1urZDaD/8CQq4x68z+sorfgS8TSsYO9g4GGwCmziY9nN6QM98mJa6Kki4zrawOAWqWCYSDHPaK287niax5ed6uTs+1Oyqh9v9MDls34xzz92GeqsXg5JElXlLvMrnWRtKzVSYKkmr15tA59ncwvgtukAzxu/b6ReB116dihgolcH1LNe1LNRoLIrJzTba/stGOYaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(64756008)(66446008)(8676002)(66556008)(966005)(9686003)(83380400001)(478600001)(53546011)(316002)(7696005)(6506007)(8936002)(55016002)(76116006)(4326008)(110136005)(5660300002)(71200400001)(15650500001)(33656002)(52536014)(2906002)(55236004)(54906003)(66476007)(186003)(26005)(66946007)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OmdsLWePxNHukde8pnx4hmfE6wWqhbtzs+LaVkUYmOSk+qd+p11spqx9B2D4?=
 =?us-ascii?Q?QAw3WptFqz+SARbuojynRrGulT4OKfd8PFgkOGHo2hdmobigqdNKP+0/t9lP?=
 =?us-ascii?Q?fmBPVP8ecZDSfFP1ugukDtWxLTvnq9IF/T29qoXC2RDp3c0vrkxTgJuwtOZH?=
 =?us-ascii?Q?9O99Zj+eypoxFp5lwK8iyzUSGhhd9qilgCZCAYPmHOnNL4YWP9SmAsto7UsJ?=
 =?us-ascii?Q?mKLHdn4a1CHw6sHhgGPehYxHqHkSwSxJx46gSIXQYAj5C8Ey6MLKbAT9KxdU?=
 =?us-ascii?Q?qyvApV3GZYgZzyrQzoGxi+g/JVfLl62f0UZIJrnFTKniBi/BRW2AbwxvV3DQ?=
 =?us-ascii?Q?rU1kvD4nIfLkfaVmzfY1XQcHpjjPMrJTWkbqw8EEkR3a8aIxZQ+xsosnzOkl?=
 =?us-ascii?Q?Su7QAypvLUQqqzMhIdRaefzVddZEd9TZ4ZX8QEd4f+TxZQQiq+za6mwkWMzK?=
 =?us-ascii?Q?tdpOcgzpjsheWstpmROU/xOWa6QvAuaA7svX6Ax9EWfQWrgErPuuyWodccwB?=
 =?us-ascii?Q?PhspGOuOwnLMCDhdx8JqC5B+FyPEcrL3W+rYeL/j6uk+zamys2V5MNo05oay?=
 =?us-ascii?Q?Ii/MUXrqlWDIJ9NJ+w8MM8+VwPVXt3MIaLsIUMbXvfXor055YJdP7xRzT4Uz?=
 =?us-ascii?Q?mIBPnK4wDKY9iFPs/opCWAeGhLY/w0lb5QNNLtwvXxnn8ryRnpFKpmGpgr62?=
 =?us-ascii?Q?9+9+OvQT5bsKQm8J/myB0pfn/UEutatsqkHMp2KSZo86/ewoW0MapGEjhFP7?=
 =?us-ascii?Q?1U+V6GpBwc0J/FrLEmzxEfz/vo6cygbS8hBR5utkw3HJXhEqraUFbC4VWe+N?=
 =?us-ascii?Q?C56UqIejZfqvVXr8JIrGFZr1sYCgN5TvXsqipv/YrxCmgNq/Rsxd9ByTW1dN?=
 =?us-ascii?Q?6WkyrxM/WC4BPbV1YEEhgkf/pyqMtTcvq7LV8jBWSsjdghpR708XarGGDtSu?=
 =?us-ascii?Q?FPBDymsxaUfrY5Z1gTbK7pwct4TKJmcrW2v8Y5i1hag=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387f5685-d253-463e-a0d2-08d8b8420a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 04:08:25.5707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCRPeZM9nhHLgyz6JrZLPugqaEa7+h2WUdHRhijCdaY+Fg8lALVIhbPp6Qzbgb7N5W4IfZg+ZAolxhNHve3A9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4243
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.5.rc=
1 We are planning to execute following tests for this cycle:

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

ETA for completion is next Tuesday, January 19.

Thanks,
Sangeeta

> -----Original Message-----
> From: Pokybuild User <pokybuild@ubuntu1804-ty-1.yocto.io>
> Sent: Thursday, 14 January, 2021 2:37 AM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>;
> steve@sakoman.com
> Subject: QA notification for completed autobuilder build (yocto-3.1.5.rc1=
)
>=20
>=20
> A build flagged for QA (yocto-3.1.5.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.5.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: a394eeec6aeb98c6395cb5da2036ce936bdaa0a0
> meta-arm: 9e2ff72858c1744217195ca4a728e0044ac28af1
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 4922e10c7b8169585ff9322b0d913dadc525c68e
> meta-kernel: 8349870943ba44bbd688656897372e881f32c741
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: 72431ee8de5e3a53d259cebf420a7713ac9e1f14
> poky: e32d854e33bc86c2a616df8708e021a098afcf73
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
