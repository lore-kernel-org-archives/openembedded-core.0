Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.7582.1611030584318794975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 20:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=roGPoBLp;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: vfkKu+yQCoWe13lhkrFQlrfnUx51J3JS8Umi4IwsyKWyVc7yIjDxyRh8cIVcXwTYbFfMkheIGZ
 VGy/z3m6ho2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="165966489"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="165966489"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 20:29:31 -0800
IronPort-SDR: hL1KEr5Oe+cTtViVl1DpsVy809WjAwztopDFuhP1WzqTF7QK6XiOzwyUGE6Kz5dclOsPCoVXlI
 FSooeKczWshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="402234660"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2021 20:29:31 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 Jan 2021 20:29:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 Jan 2021 20:29:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 18 Jan 2021 20:29:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 18 Jan 2021 20:29:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0ExLCnAagXRS/c7Wb00fnqTrVzOlbmjTjpVqo6Nhxm+nql6pjwvP7dOjRpYv8CFJUvMTR1kHUYl5CUYw5MJGlFOX5ItyNgNts5DF1TaNGBe9jMf64TqTuK5FeH/cRgAQRXKxLWWKMAaXYfP68FSVn1oJZ05Lg+MQju65zSLi3WG+Eswf8WdY0oXlNieFQm3iLPjBim1t0waAQBinZIGE56yW8aMmdg+LixXY+G3hZULsh+jUH/s3etHUIC5Hl6pnLaK9N2mug6hxd/ZGb5t2cr0X5lAWGJaylavMm827CewMK+wDTDOJJJTQ3NMEJX84I6594/hmCllDGp/b01NOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uMyL9ofHfugHbxU9TXcxyGAAIM+4+IUm9YpoycGuww=;
 b=XnMVZczy9mqk6zjfZeiOoj6PHRC1B+4Ao3y3NVTB3jLkM1JMFmR3trWxn4NaLIBsUBX3GjbfsAUDHJrORRVPAb1E6IUdO7b0hg2cBgq1RYdk9IjT2CrOuvvE3jNVggyyU4ilWEzXJ8C/9Tz3f2EpgK3QRSRTQZLajH/T579wFeg1ha1A+xFDHJoGcM9+mXIaOWRtVAJgPrhV2BI4XjtQD3fYwnI0VJcQlO/aUaZhWqB5WSdC4vAEfg7mmSWDUBks3pAwcKV4hytpXqw5NYUSVxwhJ67scPNBXBwVWt/SnJyALgjeRrCzgWyHylqcbnkVLoWqo8rpYrO2wCaXpnPqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uMyL9ofHfugHbxU9TXcxyGAAIM+4+IUm9YpoycGuww=;
 b=roGPoBLpEvYi3XbgaxJLsf50i9pfqgaAA7catk7OfZAyeVJhSj0c9K++0nnFR6ZCdG1WyiCFmSuq3QH90CGOpgRoY5MIna0KmAuZBBUX5/ho1k9jJyrfUvrVju+R8hBlnYyJ2tDQMrWL4MHWrN29uInca0ovOB32eG3v+QAR3HM=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Tue, 19 Jan
 2021 04:29:23 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::6417:be76:6b3c:213d]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::6417:be76:6b3c:213d%6]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 04:29:23 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Chan, Aaron Chun Yew"
	<aaron.chun.yew.chan@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	"steve@sakoman.com" <steve@sakoman.com>, "Tummalapalli, Vineela"
	<vineela.tummalapalli@intel.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.1.5.rc1)
Thread-Topic: QA notification for completed autobuilder build
 (yocto-3.1.5.rc1)
Thread-Index: AQHW6dshOp04f8huakuurSyZfnEcpaouY1GA
Date: Tue, 19 Jan 2021 04:29:23 +0000
Message-ID: <BYAPR11MB362411C2FCA348B153EB1A4AE3A30@BYAPR11MB3624.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: a7a91555-59eb-4bb0-a796-08d8bc32cc3c
x-ms-traffictypediagnostic: BYAPR11MB2839:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB283942990126F1DF27562E01E3A30@BYAPR11MB2839.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5k+9tRAx05IrCtjIDVkMuuCqu3dwMwVTQnpWa/Q/CSHHKK98443yz6EPFmcETxm1pkWmalm+GIUQU0AS5sScBht+vj5UErZPhzLHukafHhhdORX9RX8zHpE0kMiHpaSaMJmoBuTfldSvaiWzSzQi3TKrywPB+XBUlIV+4NNVxGKzyXJcg+MQUB5sXE7CNaSga6eW6JdDls5rZH8rJB/OUH9T0zmUR7PBo+7Tgp4BW8kG7JFEPDmdfgGQC7JAIZ38OZ3xkVsAlrBBbUX/gOggG/T+3f5EvdXvd+U2JtKrsWjLMhzwbeqgEU9ESlVy0sGPrDIZvPHbwhhcmbm9PhaAlOx5mVx6Xp89NUMnH2qNu22Xl5Ia+WVzOAG5HNFq6Do1QXKpkYPZM9HVAOP/Az09KZtWJhbrr+acMx+ctbEPkcsdePxE/8bDq1Os/pIvtMAMwOxlyyt5mzklf1q4RWvyGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(316002)(54906003)(26005)(52536014)(186003)(8936002)(110136005)(55016002)(86362001)(966005)(9686003)(478600001)(7696005)(76116006)(66446008)(66476007)(66556008)(66946007)(64756008)(71200400001)(5660300002)(33656002)(4326008)(6506007)(107886003)(8676002)(55236004)(83380400001)(53546011)(15650500001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?R6rFySmBtLLQ7qwpL5zHdh4eAamTCT6xgCKvmt1ynkmDZQe4MZBATDYWzO6E?=
 =?us-ascii?Q?BdeaYO6KtY0g1NfKdBDwVeIJRRfwf/A7mdp2v5Q/VqVk/N859jkrvuLT0RRB?=
 =?us-ascii?Q?TxTvgLKUrRHvQ0iThyKvubEwODxpLAB7jC890APwaKWEoo7muKH9lj3lihCK?=
 =?us-ascii?Q?ljpNyG+CSICW8EM68H7stS/ea+rW467XYUbRByxivS4iqRc7RiQmFkt1YSO8?=
 =?us-ascii?Q?W9fZ1zEYUu8pa6f7K1lYJZJAfRw+rI90cJTdzEcFHoyLcPSeo/YJ9UH17E3q?=
 =?us-ascii?Q?TuPlR9gimWtzGhxw/0pUhV7vgzfBTG2ifvOQ32DH45V1LauzX0xvBSaGzNRO?=
 =?us-ascii?Q?xbADu2c1eqEe3irtCkTf8Y98sas8KUuCRYlVpNC1p77A1DeAY0hVIOE1tKHv?=
 =?us-ascii?Q?lL2h6sJWU2oLYAkueOGwGgRVZkb3pcvnLRZvfXdgA45K5XFlcuaBubsymTQ1?=
 =?us-ascii?Q?6QDZyEtyQPThTgr/6K355ikmtP+FBHmXzpR1AJx+ur05cSEBvd4RBNMuCulm?=
 =?us-ascii?Q?/nKk3i8QvzeqUbT3OVGzCUmojVhcRNdg17iqv4Yb0PA3uR45Uu2CIzJX44mJ?=
 =?us-ascii?Q?s6UsA58ZB2EVqhCYWPl4iDFUP00pnURm7RQabNbcGuyDmuzBZrEmQ1takSb3?=
 =?us-ascii?Q?Va3axiFEmSjP/M51laGT27mU9Pt0JX6Orm+SEkp76cCFOlE85VTREIQGldG6?=
 =?us-ascii?Q?uvhPNiQS/+/fe8eHuO44bqapT4YggZZka7ykxYGsTXPxWa08rZblDtzvg0/A?=
 =?us-ascii?Q?scPL9VYCj+NXqIjNZOzVu7xMjCU253F1DBWxeKDkHUy7O6qSyz+SyHV5MnI4?=
 =?us-ascii?Q?GXfzNpXz5CRXp3BhsTOG1WkLUuJ2sWu+p3sUkISZob3GaV8I1DwE7VFdf5/s?=
 =?us-ascii?Q?vqDhVgZPfDkUWly4ziKJi6FEexiblB2ZedYNAR3B9lZAGiXTRf+TYHfDtufa?=
 =?us-ascii?Q?NsVqrNp2NB6E2dxhbKqNrGeNpJWGt5gMlBV9rsygzA4=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a91555-59eb-4bb0-a796-08d8bc32cc3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 04:29:23.2919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7praCWMAcaON2QLEAgox8obOn+ZeLMtVPhxfdrl9CHhA2exuEC84YNTpLX+fY31LJE0cyMzUad4XUHSjl1pmwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

This is the full report for yocto-3.1.5.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.=20

no new issue found

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
