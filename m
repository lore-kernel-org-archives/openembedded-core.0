Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.4584.1615873639890017715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 22:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=UcB5SjLL;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: cFfhJ2fzybKjN91I4kmyfGwx/wKzVeD2pvpD7eVr9jyI3MIKHI8gMiWU9/GlOWXIxR2Pa5W0H3
 ZJfs+acWchvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="169120716"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="169120716"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2021 22:47:18 -0700
IronPort-SDR: tai0TI5YG9dXYj29CC9psyLQ6nkvYpz0iaIARPAXMlv1tzMoZ33dQzGBpkoaePfrULWrG3Orgx
 cW/GH6042B3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
   d="scan'208";a="601710585"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2021 22:47:18 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 22:47:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 15 Mar 2021 22:47:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 15 Mar 2021 22:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOyfg13tSP98lIoXr34Uaps299d/E58z2auEqHkdAm5JuicFGblSMKSTwhaw2980H58kCQbA/RhYKk7+Z1fuO4sxs4NSSrljv7umKClACILg5egXPUKLWdzvFdgmJqas116qfZWLp0N047riW8KPgW6my2ifn+NMBzoaLQCDme4AV61jP74jjnUUX10N+d/wKF+zCHoeoca31lsIxDDV4HDBHKkHGiJ/eu/fDjaU+AeKxwMoonLdDHOGX8/GB+0xZj3RjIm8zHJyg7Q18bP6k752scl7i3yTgOH11XWhP53MHL4TdH1VfbK7fmu00jeZB6nbcUK4Mh+yBaBYmvjhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCoXdKxvRFQmMxOYOuHP4ZCHobfyhLKHRktuqNAJYEU=;
 b=DPl10oksS79s9Hso+HDeAB4CKrD6KF2y70XAJ1Nv091ep76+A9r0vV9Cf+dG5A8i1a3DEaKjwQOSNKlBn/FL4dEuFdf0FtwQEokDgBEc/Q4DlxlbepWXf0rmXWKOr4PEt7Q6MD/kelJEpItc2K3ADSfPmNAVcqo6ADDX+ARYJQObwIlGw/BUFJCW5MSMijD9smiYz1tWruapH1zclcvltDenlL3BJDz2chb2kwJyAs/x6iNDB8eTILbVyljjd6j5tRq1mNnkIxH7UKTf+WRislCELBg11zepZTZDFTXOGRW4AkQ7hv090AmNBQeKVn1Y3aVG0X9jLNo+sNg5pFSR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCoXdKxvRFQmMxOYOuHP4ZCHobfyhLKHRktuqNAJYEU=;
 b=UcB5SjLLNyIgAibIChGI5hVcdBUxALAw+0N+Uay9/tFdGsO5fOAZSFL2c021RCmonnbsDEI5ySv5KKHQ8Hzb28OqcYXBnJa0hyCet7VHVhouLrGP2fNZxa87QGzXO7MzZTTni4qHnuO37+OwIbGXFpYssfcymKC75JdwcZ2yjFY=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 05:47:16 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 05:47:16 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.3_M3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3_M3.rc1)
Thread-Index: AQHXGejkaYKvh3VOA0yJJsaa143FVKqGG3oQ
Date: Tue, 16 Mar 2021 05:47:16 +0000
Message-ID: <BYAPR11MB36247F29B24045D9C59F05C4E36B9@BYAPR11MB3624.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: cbcd07cb-6501-481c-6092-08d8e83ef502
x-ms-traffictypediagnostic: SJ0PR11MB5085:
x-microsoft-antispam-prvs: <SJ0PR11MB50859C231C6FAAD662E07B38E36B9@SJ0PR11MB5085.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FMerczDkH9dEYzWqbT9qNat862u3HKUs6xMWH2JXvj+ljNt9mfLa5Z+RL2kyQZfeZ0AgDAUqMpcxJgQUoMeMCw4PGuAlyxYTcgf0+rog64NJaTLikmKouWtowwGYRHUK/S7BvOWBrCvKdEHpQ2CmMA244qU7MkusTH9oU2XUkJAud/FgbfzihZ1bOb1l9KWbAbIWI1SRyRAQbmtZCmqKRYxXJbdnj/KgQOE6Cegixk6pmbaQfczFfLI+ekQpDoaQ994j5I/Zsur1iYLJ6NPFP9utrchfuCU+XolECVaEbGFobyUHz01/RiRZodoR1wWXWnATWNOX73No82GiNI8/AROMTvRKwa+90bF48fadpzvGRO9+7Y8FlqGBJsvkcjE8SDMRVbc+ZGOWrGihGVzZAf4kPuSz+NIJxL3F0i191xj51r+S/Lp3j8vIzOmOZdnximsJ+xj7ySgvzk9x4SF43gzwXSiT/F1IabWZmPHFq+rQX2aExLHuUmNb8G4dxNgOi4ugFkN1fW/l2FeTlXSMplG4tq9WrUFAW5vvRyqxOCHnCfmu73kqd+nbHdxYZyFi+QTRGwDkg3FRf9ofDYp62wlNUQ/yzJR7ctMB022agBTmqySBsDLX0DVOIR1qWaGLiIdUrmm6J9ixZlgXxePSVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(136003)(366004)(396003)(5660300002)(66446008)(66946007)(4326008)(86362001)(2906002)(8676002)(7696005)(83380400001)(110136005)(9686003)(316002)(71200400001)(66476007)(76116006)(966005)(55016002)(64756008)(26005)(53546011)(478600001)(15650500001)(66556008)(6506007)(186003)(52536014)(8936002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZtsaCJAi+k5OZGtg+wDeci/P5xWJ6dsBl55fUdBVmFqNqg0YSFt0xQrn7FuX?=
 =?us-ascii?Q?NFKwHYmU0LDHOq4Zu30irYAwjtj8cHNlJr68VJn/nstDcVIQCCqQbzl//GNp?=
 =?us-ascii?Q?npeC3kql8wfLL6jlYjXq/f9Hkjq92LImK0UdioEXdqOHMT6pnhkyTRzGyJkq?=
 =?us-ascii?Q?E8vPoDvSK7hJrVHbIKfQqPEr9CFGK/d4t6/G1TMcEyYOFLIMisr2vUwjJinw?=
 =?us-ascii?Q?i7Qnbr36JxykU/hPifBVll2sm6D6NdDxw3HOjoF415kQkEH+NgAQeJdsPtQf?=
 =?us-ascii?Q?au04+TA34FaOGe6qHRH18les7vFYmXsTVuPMOw+cFLhAS4cSRQSD36JhUrKv?=
 =?us-ascii?Q?iRTKZWB8bC632FFboEYq5nEtZAvPDkQJ6xrNMyrNlu+x7Ft80OZCK+svgpRp?=
 =?us-ascii?Q?5aX/RVn9t8Plujiza5qbqdFx0Czfp8W4Ni1g7avDQv+/yKPRzi1vvz9cO2B3?=
 =?us-ascii?Q?42t68XUVyhwYHjjePLAMvldEOLaOn3QDwgDVE0NPYQrz/woDnX20vKmAiZSa?=
 =?us-ascii?Q?NnN3xqMK3KLJNgdHdCRsMnWwUp6Gkux+fR+f8Emu7oPILPKEpKWP/8iqOc1K?=
 =?us-ascii?Q?7MlYBdFVIhCDU84pfI6PBNCG53wgniFc6cRmaEgfRYCZEmnXsqgwbbuouLvH?=
 =?us-ascii?Q?bJW34ipc7OVIk7pDskGXbFx7OLccLoN5Ti3nUIjuzumjhNx5Q2wZbsUZXb/L?=
 =?us-ascii?Q?IgG7NbPiWxCvLoIXMvxnKGo0DEac6FB1ISEw1kOYrWHfjm2qecAMJWn/gTXU?=
 =?us-ascii?Q?t03UrC/77FJ5XkaGvI4NvqM62RlE8sJV4bCGE6lgY3oXOQYDNl/xb2TkcrbE?=
 =?us-ascii?Q?MhtWI1ZBbfq9fb3Ntvq1fKpvZC+7UTYZtSB3eIYAxHKqcKNNi14yHDKLhqk9?=
 =?us-ascii?Q?6vHwCV40NS4qg3X/XN1ZtmTHvlQoMC21F8WvwbjaJhQ62zNMuQ/EVIUGeEPO?=
 =?us-ascii?Q?8/Ixgsr2bvBkIb8JNWQZREpQMDzayMhx+E4Yaja3A0s86OWi7mocpr3tv6OZ?=
 =?us-ascii?Q?kvnD8tFmvxRb3sxDeEJoAQw9sZXomJ9dhsO19e2g8X1AZDIe4m4ckbOBbZEX?=
 =?us-ascii?Q?X1Ng2NM13giUbne6OArmskaWk4HYh7tmt45pVJ/QYAj+BQP3Xd4XXQlAMbLB?=
 =?us-ascii?Q?Bi4Iwlo5KXxuipkhYSEljIekah/ETGnHXUeL8mLb/ckZYRQGrGxjaJmv+YlD?=
 =?us-ascii?Q?c3Gu5SDTNkg2QrFrS3aJGXHqhsZCNIusQN9+KaAGFzlbBVNOnn+ZYzxQ5CX7?=
 =?us-ascii?Q?v8W5+BSvgtS2Fdf+GWuxRcUnSYtthePgUL/dDtldpZ+k8XvyH2vM58+DBEcy?=
 =?us-ascii?Q?DfnEZEywE881Q2Jo/l8XEX+/?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcd07cb-6501-481c-6092-08d8e83ef502
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 05:47:16.7985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZNdyx63fkSnGQJByKg4DOfU6cTbfy5RC5gRCjlf+TVZcIun5WGPY6FKh+pnJjT2G/HTFFCNfI0iLPtH+jE9VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.3_M3.r=
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

ETA for completion is next Thursday, March 21.

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
