Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.14861.1606451982957056402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2020 20:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=X7MPzo/W;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: GquNLZLS1+NQ2pmiurPs29VglLm4k2a4/eHWpkwwroZDjekKqGV5wtFwkN7lcneMBRSRDs2x12
 x5e+3JglmwdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="169790281"
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; 
   d="scan'208";a="169790281"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 20:39:41 -0800
IronPort-SDR: lT8VuonhSn8hqXmVSgfW/8vxPZwldsjmnFteoIIIkrzauOnsrk1WhOyyKraQzNk6O+I3cNtAiZ
 +nsnBot8TCRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; 
   d="scan'208";a="333556614"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP; 26 Nov 2020 20:39:41 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 26 Nov 2020 20:39:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 26 Nov 2020 20:39:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 26 Nov 2020 20:39:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 26 Nov 2020 20:39:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sch4ObjT5/cKom33lrqe+IkriqDCyU7XemmDL4enylYz+gRZzCva2h6mTHhyY9L7CrsD0Fy46VIIOnzQ3RU374mpzVAxv+9F6WFjYUqg7H4ybaQ/mW+pmJYce900VSXX86gQq2EQGJrXO6ueENV4TvPNwwnBQfPBeKdBUNrPQS3pG/+Z81zcSy1W6alKBLthKDBOwl4sYsUDeEuRKzPXbg2OfAEPdkqcwHPJNAJZfFkevlC/0mGMM72H/BM22yKRBT+D5bkXwTyhwlIvzr132jzbsqSQacbap//n8k+7yAgo3uy9mAX3nm4TBfy/OgaxdOoIchNqVVXFpoU0+gjhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHI5B1TTlePIWZZj+2bq2aldRlxXJkXq8jokNG1Mrkk=;
 b=gMst4M0yKohTpJHYJ+vtm3/GOYAKJZrmu36rkHw4HdJWR1J7LotqrKUlx85HiqYNWzNp6jQ4Gie9vCbG6Y8oKwROcbPxLPDIyYRy6TMP858KtiCYaq1X1+b8+VvYuCUNJtoikbCFAyXtm5EyD9KAAVT9SWfJm0PdLguGY67hCZL5ZFnJCji8CURLSQtNy8dXiCwLMDm4HmBE6RT+7wnbD6RFRzmWsC0U55kCDA1kkpKZ6llrzKV3F+MvesklvqVnEwZxWx62BEywBpPAPzBwYs9xERqxbQ/lZoj3mv2bP0EomVGDD28VF2QSnVnyMXS8tvLx1SClAQgP7EFQjeE77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHI5B1TTlePIWZZj+2bq2aldRlxXJkXq8jokNG1Mrkk=;
 b=X7MPzo/W7xqJ1vje8IjWIKHA5PyJjCNemNW3aMbzUPkuYUD8tsuvK8GkZfuJO9qYSnIqaoQMwI6xvjRHRmQrGmOimyUtVvjKrdAhxv7JBSXwbjGP77+aZwOlQWIJoHFcaLfQPGXGbGKX1wknInEH6/ko0oP9HLTGsBX4gcnanIs=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Fri, 27 Nov
 2020 04:39:34 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059%6]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 04:39:34 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, "Chan,
 Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"akuster808@gmail.com" <akuster808@gmail.com>, "sjolley.yp.pm@gmail.com"
	<sjolley.yp.pm@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.1.4.rc1)
Thread-Topic: QA notification for completed autobuilder build
 (yocto-3.1.4.rc1)
Thread-Index: AQHWw6qnEFCDcmXBKECEKcZGa+5dhKnbZZtw
Date: Fri, 27 Nov 2020 04:39:34 +0000
Message-ID: <BYAPR11MB3624FFF97B58CA217ED5D7F0E3F80@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20201126041423.5FD5F86048A@debian10-ty-2.yocto.io>
In-Reply-To: <20201126041423.5FD5F86048A@debian10-ty-2.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [42.189.150.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5da00625-9a98-4198-d053-08d8928e70b0
x-ms-traffictypediagnostic: SJ0PR11MB5136:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB5136414E669CAAECC8170D0EE3F80@SJ0PR11MB5136.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bBNzHQoLNBlrruVrpXHE1G2YjQwrDQdnixL4cFBS8a9zj67UMHXgUY2aQAscjt91a0VELfjmdGa8vGBAYO0dM9p4VEgIz2ZU1DEcyZFbKFudQ0/bNn/lb/o4bo5bI+62k5K4bgUYA86qM1n+Z0dG91CAszoLcWOtxFrDzHOTFFcsQM1kpBOUmRse6qZ2+lcw0KraCj8fhl2lCR3iAAIF9t46iV5gydcPrgT6GDQXtMILbnF0a3rB5h3eHHJs7nx+FHi+PC99BE+lDwMq2Zk0dCUPASrTpxz2XQF98XQMtRLcQFJ9aUYuHbQQ4ClWHMpMX8IJHQNAhyRXUMWs2twdOEhooU4O/RarLMlKzFLwezAnIRQxkL8fTDTS4O4GIfbxVADaGbuNITYorMPTD9m82Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(15650500001)(110136005)(316002)(2906002)(54906003)(966005)(33656002)(8936002)(4326008)(26005)(66446008)(66476007)(66556008)(52536014)(66946007)(55016002)(8676002)(6506007)(76116006)(7696005)(53546011)(186003)(478600001)(71200400001)(83380400001)(5660300002)(64756008)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LruJ4C55xDNea4pP2H5J6wM0lo5KZW5hBj2V4fV6ONPlemG1QNzNggAMedR8?=
 =?us-ascii?Q?W/6dGql4feJTxF700jVigCH2ekUkzqev/qK56GvJV/2x2k+MDfElBTyupZnM?=
 =?us-ascii?Q?AG5EX+IrYcMn3CPqs7GEuHSpe9uzHGdi5xCWZf20W2qqMlxPRHjNTnRg36fP?=
 =?us-ascii?Q?LI8gQSoeT08FvU78wrM4+BY28d6sK7jyQ/tvg/Gl4VWejyqyl/L9+kKaXQ77?=
 =?us-ascii?Q?+wo8O6x42u930JPRZiCZkh5cI+cTdYO6ugg3Vbuc7QNizpjVH8lOmuEk1TfU?=
 =?us-ascii?Q?eHt/GqHN4f8bP1jQZBBJEKYC4LNxlUmTQsiHtwSNnHSglCqHjxjDqiFAjpS6?=
 =?us-ascii?Q?KqoyarBpxhDUlTgDB88eq1sHF5orpkqpViHIjN+LE3eDJZSQ/jYE4rhoKvmf?=
 =?us-ascii?Q?a1hLZW2K5mOHEEi8tq2bXJ+7DXp7R7ta95KLtHypkre//kjEVYkQ49ApekHs?=
 =?us-ascii?Q?ZLRfOdmdBIueJKRaudQrFshupi9jIL0eFYTxJ5V9b0WUvYpLGmaTKDnoWL1n?=
 =?us-ascii?Q?G1mdIZPq+evpSozsgWbSolheXg0txwEle43BMjg+06nL8JqjYm2Kcrsz2mgn?=
 =?us-ascii?Q?NtRUyUF414V2GWQ6CRd6v7kUKe28xjgQPx3yW1ei3J7eLI/XQb7RUFo5Aqge?=
 =?us-ascii?Q?8ZoishCYqed5S+3NyQDA8dKWu5AP8S8gAk1D1tmvRONeorWttOoH7Cf7QseT?=
 =?us-ascii?Q?MDR8rAoqLbLUZS3V1bMfO8cieldOaDTTTTZ0jl6ZuvzuOHQu3sPy9vq9DYoc?=
 =?us-ascii?Q?+eXOa0oqqTcD5wijWkcaRJ++nLdkn0MijK/tfzDgx5UxSIrHOAR7OmFqDAgK?=
 =?us-ascii?Q?TBVcmsZGtp/p2njT55Jmp8JYMi044iXDzpTd7n2POi76V1V9Vlpwtxnn1AI7?=
 =?us-ascii?Q?SZz9G4/iNvgVZuooFIjxBWj7h9ywRwGd0PdvpWo0wUszYSi0wy3VgNvSkEKH?=
 =?us-ascii?Q?UtYCaezu2maBbwHR3dpquOi9CBFTw//iEkhg9sCEehA=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da00625-9a98-4198-d053-08d8928e70b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2020 04:39:34.5642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSG0ROG60ykWX8Q3ecY2uWM3UfKTUYubXStL82tPRAfVoNxGnCJK7qOyO7yWcTGVnKssRMFx6dS1C6wUoTEOjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.4.rc=
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

ETA for completion is next Tuesday, December 01.

Thanks,
Sangeeta

> -----Original Message-----
> From: Pokybuild User <pokybuild@debian10-ty-2.yocto.io>
> Sent: Thursday, 26 November, 2020 12:14 PM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>;
> Chan, Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>;
> steve@sakoman.com
> Subject: QA notification for completed autobuilder build (yocto-3.1.4.rc1=
)
>=20
>=20
> A build flagged for QA (yocto-3.1.4.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 89fc9450abefd682266efcbfa031d1ef115ff1a7
> meta-arm: e18ee052f75da60655fb434ff24a463a8fb36781
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 541c7256c1b6acba35d1116a1483b6594d189e3a
> meta-kernel: f9d30c65d08c9cef20d6487a7aff0fff40acc823
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: b885888df67eb5cdb3b82f4f0a07369a449e223b
> poky: 424296bf9bb4bae27febf91bce0118df09ce5fa1
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
