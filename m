Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.1386.1623804880252557342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 17:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=LK8ZH6S9;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: KqzwzfP76qV7LayRKG3dMYpyc+4VfKwHagJp7aT4N7e7qHWr3z2BOt8EKLN99DWeVXo4EhVd2V
 Aij+P1bbTykw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="267242327"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; 
   d="scan'208";a="267242327"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2021 17:54:38 -0700
IronPort-SDR: A2e14nyrWvgIXV127/6k/E7r0be/KdNcz1nvQaKPYTtTlaZyxjB40duAq8zxh+O5mstVTSMiJl
 AYVWCG5c9LxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; 
   d="scan'208";a="553868121"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2021 17:54:38 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 17:54:37 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 17:54:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 15 Jun 2021 17:54:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 15 Jun 2021 17:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QH8kbP8zeLD1A1fRr+2MdfAV5r2HetsW/i1SAfP0I/NTjAJYjYJdaFRskvoL4hnFeGgNyZyMqnA2tqadz0ZERtWOkFSe/SAvXRBcSFKkaTxAa2o7MQSaqv1KTrbJ/oUoIi1O26K2vwl0jbEnTwlMjxMRGEfPJcyUwJlzauiFPZV7X6FPQYA1P9l6SOI2DWaV8wAi3h8oGzyAxarRO6QgWI6Er3TMkKjdEu5d7kcs/jCW+sSkwMwsGP2Wcug522PZyB/w610eWLZxgz1U8FrE6ebpVsR4A4WyzEhialzhhSKTx4h+81WGAJWt211xpNq01dl9mTJ9/Af1uD7TMB8sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX9q6qTjCVT5WOHYjfx9raqwWscpk44AH2Ggw3wlx3g=;
 b=camg8rSsnXaVKRzi/IexABb6sqn8i3PWVnrhQ8fi61+rgBVPLhoCdzVCDe9+dMkDhyuYhCNEmMtXt5f5tyODDVkh5j0p9XdS/rObwBZ/6KdlEIL4tPQag8U8I+zKfk1JSn/NL/F043jaD416LSQBQv+AJ7hpzkgTwOEAI+/mFkGM651SfQRCtobMsv/OaoQUTD1aLPP3sdheMinlN1QzOzgJdoHbTfQcu3g8/JV2380mZIuR+oZJ57XuG5n9mhAhsxXpbLygt32CeTNVPUvOyJrtwGCHTLpDRe4Bw+/wNQIM/dYVqO1wlfJ7FYmK83UST2ikmd4WvLdVk5tQA7++5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX9q6qTjCVT5WOHYjfx9raqwWscpk44AH2Ggw3wlx3g=;
 b=LK8ZH6S90+em7Gme+Z0SthQiUSaNN5s1AW+qu5AY+3WiHFZDixPHQ/W1Jml6MjHIUNCSx/7ZElebd0e0+6slujHjAUeWjjeIPLbbmAEslif6KWa0DiOD1nTlhXiRdOe2lCXLyF0zyJjrYCvWWvQXFPbif+3JQt0uxQBBXgmUhns=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM8PR11MB5638.namprd11.prod.outlook.com (2603:10b6:8:27::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Wed, 16 Jun 2021 00:54:36 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::e55d:6603:6fa4:457]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::e55d:6603:6fa4:457%3]) with mapi id 15.20.4219.025; Wed, 16 Jun 2021
 00:54:36 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.4_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4_M1.rc1)
Thread-Index: AQHXX4D1YGxR5dMCbk2lT3jm21lGTKsV1Peg
Date: Wed, 16 Jun 2021 00:54:36 +0000
Message-ID: <DM8PR11MB5608FEE93AB6FD62D95E0875E30F9@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <20210612114901.AD773281114@debian10-ty-1.yocto.io>
In-Reply-To: <20210612114901.AD773281114@debian10-ty-1.yocto.io>
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
x-ms-office365-filtering-correlation-id: 7126531d-d9bb-4d1d-a193-08d93061503e
x-ms-traffictypediagnostic: DM8PR11MB5638:
x-microsoft-antispam-prvs: <DM8PR11MB56385C5A114E91AD21C58EC3E30F9@DM8PR11MB5638.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oh2xiRs0lyXzlGRI9Tb11ms+PUBrGlGxJ0UEoHngEZaB59muBskmWfGlMEuaajR/HjHYptABVU0fOBeOWXj3xzmUPkwVOVfrBy0vDurnKdiax6f2PR1ZwOEV0krHlDFmby2U0ZDyi9o7nJeSadqm8F9x/JkZRnapTOEKRVeuVOBp3VqJpON739Bq1obzzgF0huJAKpFvVwNyqNgs0MjcMkeq115/cmpq0HRjBhT4Y4nM/AK6ZUr+j5B4x8JNGQTmeaUTgcshdytiCKU6oOFGRIPP+lBNQIXDiRYf26dWGaPPhF/1LwmXiKAcDqTOr7mNUOZhzkoDnYC+Ae3AS26+9XNWIaGdJg3ss1wm/7LtOe4C01UhcjR7/7o3YeXyKe5N/lHZg75HF1JGZws1FHlRoavyTY8nvxZvoEzucjnLiVp/7nnQknZ8gJP7h/Be5SY5HasEnKwZE89pulO1O/2DoCr0oee3CLr5cC7pdKCLXvBlrFLCiS6zGEFWSBIm/JPrfOaeuSNz02GJnEQNn7HJDENio8HR7wexK5q1t4cct8OzkSi9d8/1JoC1/KXP256HlZ6s4JgzBXk07j9HwSvS2sGJJd3LbPXOtZTYdvDLUN+SJSMwJrBvRRr0qv7fa0l0036S5J9UnTYpZuKXE7FiEpEJ8+z9e99P3gtqg0uepfy69JDsg64R7+mvoxsjwFFOaNNdaUdXf07+u2ZukeXHMM4uP5ykD8WGbCS37HdWeHdzfQNKceISOTdovid0TUE2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(396003)(346002)(39860400002)(66446008)(64756008)(122000001)(8936002)(2906002)(86362001)(316002)(66556008)(83380400001)(66476007)(38100700002)(66946007)(71200400001)(76116006)(9686003)(33656002)(8676002)(186003)(26005)(5660300002)(7696005)(52536014)(15650500001)(6506007)(478600001)(53546011)(55016002)(110136005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ALBiq3ndHx1Nh5pZz23lgrwXYAaUMhuNGH4+SgVlw4jIpO0DNRawwszMSvNB?=
 =?us-ascii?Q?M0/zEkw9UWTKJrRbP0X2MhUcTb/QWUnW6DB5lVES5RnXk85V0H8DDUEegkqD?=
 =?us-ascii?Q?LjVLzKWG3h/5SLLAGnrUio41DztODLJDY1a8dDowTWWBB9Z/E3R+0aIFVwta?=
 =?us-ascii?Q?TRgK7MRqsE1kSZTku0Pa1NaeuX8rEHPzXd3A9r2iJ5Hh8sx4axzpp1Ai0wjH?=
 =?us-ascii?Q?nLoIBjnLkiB+sPkmGjZ1xTUevcIpcqcXVTgfsIYH4pR6Y2E4Pl0sVFYJIxkT?=
 =?us-ascii?Q?UPGuyA3iDckZ1jTccTllYGZcIx3ZIhExRalRbtOJ/mMgWcBzURGPVnko2IeL?=
 =?us-ascii?Q?/FPldOp/hWirQdmdtZPBrALxij3QuRtR7q/us5RdA6YkC+E12bGMwFX2WG32?=
 =?us-ascii?Q?zZuXfg/n7F+bgKVGzjMS7/L3cNDP93qclh09+Kwct6UBaYZlNxfnYd2RYhzj?=
 =?us-ascii?Q?f8ZxEuYGBNHcl0JfZf6J4IO8C9hF8rX0yCuX1pU6uQ013olS/V4fSSAnzr0V?=
 =?us-ascii?Q?QKHWJDePrCJBDiel8Cq91ddd84+rISJOeXyrTcdo9g756kcN/0tFDs8BHbue?=
 =?us-ascii?Q?uhl7FcyZDNav3Q37uBqJGC32nGotr7Q4KS4A7n+N9F2UavYCufR6YySTl8ZY?=
 =?us-ascii?Q?4/1XhPSw53BswTm7q6/EQ0e+SgQ90tsXNMR/Ikuol0HF72pbSD18J+9dS9f9?=
 =?us-ascii?Q?uNcihSN3sgjtnCXUR61TwrK6aWkrDonNIopEIRAy7sF5PMLOt5M9BxPqthN4?=
 =?us-ascii?Q?dtMDC7sA2yAJvArULxhaaW3UJKLrZULf8un/r0kxRmlrAz9UFu6N812ILVwI?=
 =?us-ascii?Q?6wSBC2N+qIi42QPpVGGAz76x8FLRGIOPpg7qQassIY+ARM48xoJFuT0yvjrV?=
 =?us-ascii?Q?afMkQTOLp2A3XTNegncvwkGfZObosx+FOn59qVNkBVPaV9nTHF4ceFUHvXjL?=
 =?us-ascii?Q?1UHJcfjX7LN2H+tLSZZ3EbB1IjKz3S5om4pDvO748WY7B5fgUZ0kUYo5uiSU?=
 =?us-ascii?Q?+Q1tHsHYVBJHpu9GRoKzBKarOb68e0/CJkUXTyyvpD4J3MkaYpxyBex7FcIr?=
 =?us-ascii?Q?nQ3L4alWE2W+3doEk8ultXFg2J9xq969GNFxQZgfKfASz2JOV06JhhXCvyZg?=
 =?us-ascii?Q?hsizKNCWrpM8IFTjGvyQ5UPHyPULBhXJNJzUdeWKIDZ/8Dc9Xl+/nv+BjKtb?=
 =?us-ascii?Q?VeLr2ICazlOtesBmIbcAfenV7W8mngvyVT1Y3gznnFlZqCPnQcOL8XqOl7sX?=
 =?us-ascii?Q?WPv1e26egSGHMxtUvZFBv5A3FG1dV01uWpLTsmAI1lUKa8Ifc37zDkysWrUB?=
 =?us-ascii?Q?MfVB1InKsKdP/sfInGCtvH3R?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7126531d-d9bb-4d1d-a193-08d93061503e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 00:54:36.4375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /a0UEycFDI4NraEJlletP3vYCG/SPHzQq/Eb/2X4qKBymnzabjpqQrtanSJP02PwQJt9k5tHKwgezf4PcNm4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5638
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.4_M1.=
rc1. We are planning to execute following tests for this cycle:

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

ETA for completion is next Thursday, June 17.

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, 12 June, 2021 7:49 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.4_M1.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.4_M1.rc1) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.4_M1.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 398a1686176c695d103591089a36e25173f9fd6e
> meta-arm: 6c3d62c776fc45b4bae47d178899e84b17248b31
> meta-gplv2: 1ee1a73070d91e0c727f9d0db11943a61765c8d9
> meta-intel: 0937728bcd98dd13d2c6829e1cd604ea2e53e5cd
> meta-mingw: bfd22a248c0db4c57d5a72d675979d8341a7e9c1
> oecore: 3b2903ccc791d5dedd84c75227f38ae4c8d29251
> poky: 59d93693bf24e02ca0f05fe06d96a46f4f0f1bf8
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

