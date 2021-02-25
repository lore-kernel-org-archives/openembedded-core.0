Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.8382.1614238560471065888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 23:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=xvDppfj3;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: lo5/Yu7R0I8Tsp1xEpG6s/a8PAo/WFZxfq5U1i5QtOxnglNAz4tHpqwcJgzu3aC6k99sEYBLmS
 4r//c25sAEVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="185492017"
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; 
   d="scan'208";a="185492017"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2021 23:35:59 -0800
IronPort-SDR: bjAMn1/J1rHivGekQ1zPiz0A6ENgbftIPt7YfHmTn1JefREfGWj4DVr/dgO3IrMCzdH8FurPwd
 qWnjdHxwGrSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,205,1610438400"; 
   d="scan'208";a="584060699"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga005.jf.intel.com with ESMTP; 24 Feb 2021 23:35:59 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 23:35:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 24 Feb 2021 23:35:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 24 Feb 2021 23:35:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc2434WrHHxs1TQNt1pKiqKGmIji/2FuBu+EPXg1aN8c9b25yOB2pOp2/YggKW8VYOXsSTRtaPz0mI3TJfhCHRYDSa7lXzW3NbSz9btQzt+DPZF7MUmSim6jzMunyuusdqCq1k53KNXkN9xG969xDxRVVGUD/spNxyIN8+OX7zqHQ84uyiYIHD2Pzy5UhpGXkH4IMmGGsI35ZTedIpfRP0Hm/3VsXo4BajAdcZx9jZ//sOAQ05O1pEIovoR4pDYedD3dVTmWcBbLPEKbnksDhBdBcNZc9PY8HmMEmeyrjWx27KzRAQCeiYl/SdK2rF7NFYqMSPCz2l6m7QPfcRbFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW/vaN3jLNtCRwbUMcR9V9PW7TgOSVTafKlajco/wnM=;
 b=N1vnPu1FH3pCd5mKklq6h4zWAvMyztRlW0nPqegdSY+Ri5Suf+o8n9tDNDQE4AMSM2k8aJ1teGywNAHvZFCeeDWsQvaJNYVPgMJzMP6O9//Fl+3IKQ1Pnr+KO0cTeX9P9LVcxO99YHgzKANUxcT5zwI7TzuYO4BIoZjYjOa/8lsu6hZANvL8Cxl45sonrTpWPgEVjHA6V3t/JNNHjML9aT1J9OOQsYyl9S6Nf5PSKR4cXSiotcmcILDf9ZdMrx2e9b4gXINkPsxHHInC8kA7Qx0OxZCFjRVD10Y4uJpzrUEv57GCRfluaEpEVyjViqGXYuqFwSy132oHYDdJ/OpzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW/vaN3jLNtCRwbUMcR9V9PW7TgOSVTafKlajco/wnM=;
 b=xvDppfj31NjB+VDfR3BpZWoCIT/+rcoyI1yuFUbIFpqDknFINCHmaEO9jl8lxTHWN5GBOlVKIRxhUkqsZKqH0R30Ih6BRxexUsWgROK6f3QDwoA+tA0CWHzP1mkBsJf7fg+MV4mo7uDSNMvPwndt+C3HumwVsr8b8yHRIX7sHcc=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB2838.namprd11.prod.outlook.com (2603:10b6:a02:cc::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 07:35:57 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 07:35:57 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.6.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.6.rc1)
Thread-Index: AQHXCWzi0XsNxpsuI0WZCv6k0vp3bKpofqyQ
Date: Thu, 25 Feb 2021 07:35:57 +0000
Message-ID: <BYAPR11MB36240D3D33192AF2180FB382E39E9@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210222224808.50B89817FA08@fedora32-ty-1.yocto.io>
In-Reply-To: <20210222224808.50B89817FA08@fedora32-ty-1.yocto.io>
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
x-ms-office365-filtering-correlation-id: cfeabf5c-91ab-44d8-9892-08d8d95ffdca
x-ms-traffictypediagnostic: BYAPR11MB2838:
x-microsoft-antispam-prvs: <BYAPR11MB2838E1DA0B3BF50B92FB1D40E39E9@BYAPR11MB2838.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sY7GPyEA3JJxBFfZ02TiXKkisXcXRO3knXU9JXXonOS7iUW76VDrD3KhP6d8QlrEcbueugcHXKPMWm0eKuelj2YUlYDc2MOAHtW3aQ8XiGPLhd/0OtqrbinnqeUVDjrkrseYKwPa5tYo6KqCDvXSvugd7/z+E2B6zxEBsPK3Bw/aJknPi/Zc89YVr3NvH8EYW9KXDlsnfYt2wjLWF0JaATq41cDGLXCwooZDSkehfJ2iP2jZImHMd3JknvXCDKq3n72JnBmXHDMKXgppJH2hwSnocMwDcUu3VAxaySAQmyBNPoDtaPxuBsLMjQ1phZDOjgXpg294erUAewVQ9R4ReLVKZ/OJ1ERp017p4T9XGFai2yqyuEBetGmX214Ph2YisnEKK56G9kuux51iOkbRLEMw2FEAc1lFalfQpNNa3FAaw/XMz7xvSXDVT3U03pOUOLl7sAM2zTUSI5+UY8/qg9HZHNz508u6DICXMpNLvjKHZl7x+xoUsy5Fe9fQWe0hktWGkZpru0J+ASlxxUB5RU0+egFm/X8oJGpGUsnHImuGnh+oyHKe/wqGMKaps/uSLbVKKdH7lwcYod9QTGzXm924aXaFJTDZwb4REKo7+ZA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(39860400002)(396003)(136003)(9686003)(76116006)(53546011)(2906002)(66946007)(83380400001)(5660300002)(86362001)(6506007)(966005)(478600001)(4326008)(15650500001)(7696005)(55016002)(71200400001)(186003)(52536014)(316002)(110136005)(8676002)(64756008)(66556008)(66446008)(66476007)(26005)(33656002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?VdCkyxYAJUbH7cYhDgZHTVjK1fBYH3QayeMmWP6tQvzgf2x0Be8fh6T3SFkQ?=
 =?us-ascii?Q?BaLfMaoFo28EpBs3WPghM2JRlau2lkWb6XRLz0xYFqbc4gpGYOFoKcnuU2um?=
 =?us-ascii?Q?HH1XRJrf8bM555aNi2GgrF7eJgu2X0xg5xCYiGHPxZBjQrLlhfbobHUwl2iT?=
 =?us-ascii?Q?nQHSi6phdeJCfkT6BUQf7e13usaeFSICwRzCyW6/yJ71QR7kb+dpjCezPTAS?=
 =?us-ascii?Q?PrLHGNDHT2UlSm5e/BiTVuG+PTARaOyOEgkBGyYdWJhzjbGL2oOTlX30cgYf?=
 =?us-ascii?Q?gYOc5Yhi3S5OKooPtiUqtb4epliv4wCJqRxd8wMDlawQz7Kjj0k62zmeNfE3?=
 =?us-ascii?Q?8rRK28Xdah13T4cesuIkD2h/dwNOcZzHqxj+HWY/ecoZpXIQvapvuVsgd1/+?=
 =?us-ascii?Q?OGg7C+MeA6DOKUGMbF7rGuLk2JiHeAFjWIt2emT00C6KSWqOLTscMgB9ph35?=
 =?us-ascii?Q?jo/wF2f9c5VjIjBuzVne/oHF4cxChJ/hIbKfokb05JCHqV40AX9kxvZ3Oouf?=
 =?us-ascii?Q?A5uMc7w/N7saqKserLteosXlLm+dRvXW8+nP3F2ztsZgeRUIvD8Z9XO+Z6xU?=
 =?us-ascii?Q?cQVTfino31g60CpIUL4yNgZLT2o4kt1Kf1dAiXzH11kzCTOh7H/jLQKNQo2m?=
 =?us-ascii?Q?b+hjkJrQWnBUcWlNx885E7D0Oi4QDi5SXeAv4fHlqPomTEp2DMj/og+lA5/2?=
 =?us-ascii?Q?eV9GRq9iAawK9mR2u+sxQEUV73LFd8tckk8slt5dCuItOxfD9VZ7UuYi8cfK?=
 =?us-ascii?Q?uOP6VoooLVWZeSvpirlAcdLEV7IfJTiwtqbNWAg5m0WXtCOY7tn/Pz74sAux?=
 =?us-ascii?Q?SvGJzZsn7N4Cx4f+gY44W+GJ6bAsOZZTjiI6AW5vpiLSgIJWYVjBmXeb2lja?=
 =?us-ascii?Q?JEuFBRTc7hiujPew75m3MLmTi+xq0lxR8kdR5jZyoYdZsUpxgrC7Y8E0qdGN?=
 =?us-ascii?Q?rlPpQkf7GBTEeT1HJWGwjiAzXA46a15I4kRBc2C3oyPliUxmDbtte63xnTeO?=
 =?us-ascii?Q?B5U/QLjWOXAylzPbVRbQaPJxEVB3s/05zLHJ1yl8UfgKMdoKCBW3RsFquij7?=
 =?us-ascii?Q?mTMEFLMrrR35+IUU9dhuBjuuu81+LDI1u+7FQyAPUumUiMBPWFj+8R8sA/ik?=
 =?us-ascii?Q?y5B5y2LppE1WdDvFVWPD39oM/vvCkghk4UO4Y+BetpGyuoiZHRxIyRLLde26?=
 =?us-ascii?Q?OvIc2qvIW2npIveBLjZ8TF4W3UYPpmEVnEynksl3i/Cj89W0QBUalpIPDvG/?=
 =?us-ascii?Q?VKB7I7/XdyIrrmgrbkn8rDciABPle49IDnNZ54G5UusdStRNu+8yF9jekcuB?=
 =?us-ascii?Q?cjA1bHtAnTMbbo65i7Btdu6T?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfeabf5c-91ab-44d8-9892-08d8d95ffdca
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 07:35:57.4899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eaOay9goxHicqCxGnYWGSaJPH4UKp9ge7IGZggrwoDYQv4W62rTwPdtBnxFTVrwGHCk8IsURkHpF4pwD2AB+2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2838
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

This is the full report for yocto-3.1.6.rc1:  
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/=
?h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.=20

no new issue found

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, 23 February, 2021 6:48 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.1.6.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.6.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.6.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: fa94374baea75a94e3a488126ca7d8e241a77acd
> meta-arm: 02c660521619ddb7a9495d65403aaa2636747ce8
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 4bd62a7e154b8c9e8a114f452d3b062d8d058118
> meta-kernel: f793168bd19af3d8c5a260dd35f387ed9a31794b
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: a8debddd6cbdd70db74e096d72f97fbee008ee63
> poky: a13bda44fcda4e79e9aed39ca1495eabecb6a7b7
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

