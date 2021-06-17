Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.5002.1623920123570539775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 01:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=N5B8ps1+;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: MkQGef4oyDnRg1a0t97G0pjds9c8ZnotQgdEGY9iDEZNzCNUzJ7G6SfU/iJXCVYE1ywBomBB8o
 rb4+7WG8pV3g==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="186708400"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="186708400"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 01:55:21 -0700
IronPort-SDR: QmKF59Tr0CmX67bcrpMl7uoObgLa+Yoye2PHRrfkHmo2Q80TvGKxnM5Q5U8xyaDgfpwQnMPwCx
 8RK+IzOxRgqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="479408249"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2021 01:55:21 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 17 Jun 2021 01:55:20 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 17 Jun 2021 01:55:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 17 Jun 2021 01:55:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 17 Jun 2021 01:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rsl22bUqhVI5gT4hqnbSP/1KfOfEoAe00RtO8YN1Ja0VvlDza45S9vw3c88HJ+gIKtLpV4fo+FpWuFjIKq0T4HMn8tXUkbnxSa8rleB49eaeqncX2b7pDnT3+WERgSYSWLT++mx4VkKi2XcO1yh19yuwNRBVuHebaIuBj0qecERWAG8xt1kJqCy5gNfbxUPDJBm8sqj7Ew4GEcU4vhuPkiJJkxbbspJwXRZVICykm+YgMkknbJ8XtEErJhLu7f25d6kC0afykOsSSQpwDW3ONrqq7skHdbZkcJDtSPrdfgUkOyfk9QwETDoGunWffj/qAkJgxTse4gNB9zV4KEnD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fki+q9Dr9XqKDtkXBnPhhRJoKn0dj5v+0AJ4G4w+Tyk=;
 b=MnY7L/aq90Xenf6Xg5IG8da8H4gQQFYqc3jDZri/JH/yM1gSriszwVanLErWhgsw0VhKLmZq40FSMvPOTyFXxiOWpk0503w+tZoIedUcwOdMa6bmjUo4KEzkE/60UktXsl1jilYgQSH6ilYontL0xScccTA6a85H8Q6j8HzKjEpj4caBW15lcW7lvu0kgnDn1WMitFTvLAGEhzeDgEQgzLZJly2Z7rlOyrtWp92Z2HYTJxDzR1N+onZW3we6yzSVTrPwkjEf7KuZWuFyLnHDumJBONKd4tCiUbbJpJiQgDHYipmPMTieHQCyihcwZAVmI9VjhsaheVDmop+UJyKh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fki+q9Dr9XqKDtkXBnPhhRJoKn0dj5v+0AJ4G4w+Tyk=;
 b=N5B8ps1+tcjK5YXhaIwm+YS/1IQFdh1jLJONmktuLnP2SJXRKfQGubb7B2J0GUN+rvX12+Z7HixpF0lclt4T5Ouy0vCLSfuDdRe3nnesKc9yXtpkxYGqccRS8lpP42YD4GVP9b4bPvhd1BHr3uthOc610qLaA1rexurvtUEYcf4=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM8PR11MB5639.namprd11.prod.outlook.com (2603:10b6:8:24::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Thu, 17 Jun 2021 08:55:18 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::e55d:6603:6fa4:457]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::e55d:6603:6fa4:457%3]) with mapi id 15.20.4219.026; Thu, 17 Jun 2021
 08:55:18 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.4_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4_M1.rc1)
Thread-Index: AQHXX4D1YGxR5dMCbk2lT3jm21lGTKsX7Ybg
Date: Thu, 17 Jun 2021 08:55:18 +0000
Message-ID: <DM8PR11MB5608EDA1B759583F1EB81DF5E30E9@DM8PR11MB5608.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 6ce443c6-4e75-4868-1c72-08d9316da198
x-ms-traffictypediagnostic: DM8PR11MB5639:
x-microsoft-antispam-prvs: <DM8PR11MB563932C68597D0F276F4D662E30E9@DM8PR11MB5639.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iujcVChk5vwN6rRgm70eDtI0dI6ivCvw2nCfZrSmwyf2z2cgud9P6tSJOmuHHsahzKF5+cjhauhbqBEpi1VHC0vxiAuop+UTBwgwmMCs9rnnmUedmpljGy6H48DsS1nzN9xmhmxnr8LGXFGGZqQqIcW3TU63fABuCnNObgnMK/i24Mz6uMATM0uw8p0A4kqSsiyNMemPDeKfyjy/0YY+M61Osp3jcvOU/VPItdIaRLfHuBZRfF8LaolBet9ftPUFXfYrs3AzPHwuMqHyITZmQi3lcq6Qt6l05mJgJ7vrj8UnI1mvLKEglzyaZOu79UAcPWajhssg7SDoG2TMNzNMum5mJ6hY4R1d8x5Vuxm8VdTjdyM8SNDo5SKghiPMqqm26sYXweAT/cvkecZzgFBeUCGiDPN2/6l3te8iYhdj3D63GgXrJ4HetPQ9mX9SRBCiKjvfgiNI5pykP+XKi51v3FgCYEASSavfrjHV3GT/1d6TGHbS815xf6pFHNAa4w06tXtZapKUEfpK7Kjiz4rshgQBH7t/MldZJ2Ud8R331KAh7XlWb73xte2ibI9M1EdlT73GWaYEFo0IMTHF01lLC84ypxVO1MtIjUE97FpXeLcuyKJrD8Y4/f7kBgGzupzzXdsSPIFqrOk906Z86Y13iJOT3jVVmvWNWCY+4rENbYKR0ev5o8P+nfqS67owDGU0OF7R61N9qNm40TSl+DKCVpIFBwdNE30kydEpH1SWaBb82ZtVHlt3fleOrDVYW4bM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(346002)(396003)(376002)(966005)(52536014)(478600001)(2906002)(33656002)(186003)(122000001)(110136005)(5660300002)(7696005)(38100700002)(6506007)(53546011)(83380400001)(76116006)(8936002)(71200400001)(8676002)(66476007)(66556008)(64756008)(66946007)(66446008)(86362001)(26005)(316002)(15650500001)(9686003)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XSeA9MiefwpAXfUb7WIrgI2bbFjbLK2zWbZdDJnKgakaqjkeXQi8m9j0ioQk?=
 =?us-ascii?Q?+HFLhAJePy40ZHefYmwTwqQyljMPY60EtqVtGQJYXUHsxSry3dqtmGX5/2L+?=
 =?us-ascii?Q?zNr00b/Jc7XX/PRdpzUcHup0IcnqKvVn+AvgWRC0k6/S4y1KqwRxQarVsKCA?=
 =?us-ascii?Q?KXQ4AuCg9tH0zgPrQ5kp6kf+WLRlKcxC5gUjjylqVDQqS3HpGhRcJoU0qV9W?=
 =?us-ascii?Q?hnJSYKL3GT+T1HrxTyk6rxGFowDxwL7aA1igGVTzdZfylpNoHqAd8HbInc9+?=
 =?us-ascii?Q?4eHqdm4mG3Qnk/TAX0gEup30pPWEZ0LZU78K7Cq1W3ipozfDUp1SzdPArVnV?=
 =?us-ascii?Q?0bZs4HluF+8MQRoVBhkjsk9MSXEwCjSzp4oNg7lMX3bkH1w72F6OWtC3dmQo?=
 =?us-ascii?Q?gjLWRMB3mju70V5yC3f3hRLKN1+9c8xypAFwES05CgytrR+NQAWRbO3d24I4?=
 =?us-ascii?Q?yMwPj1RDhhgkgOMsYnDS9xd7G2pwL8VtlnLplJv0Rc1w61vQU4Ohnj5pbtDa?=
 =?us-ascii?Q?r5LvSWaWcyRCxWsd8TXicznmsUlmgckkTW1JF8bxE0hwAM8LQUaPJOow5vWu?=
 =?us-ascii?Q?aUnRrazE3jh7b2J37RqEfy1oW3X/tEzaLK7hfD87WOKS0y5i27iYNV7wYZaz?=
 =?us-ascii?Q?Q29/ekFzP/gmThzpWHhHzA+5HNcQoWQjK0cJurPx23WRZE2xlTiqLPKsAiQD?=
 =?us-ascii?Q?mPWyRa8Wf/PUsm59YKDOR7ZTPtb05maa5yM22rdy2oBDcWoAfBLwgvoy6nAk?=
 =?us-ascii?Q?+dtv+025dj6OdCa8ml1uEy7I0AqwTxHRgaesX2k6YGoVCyxJyjmsEUL+EDDa?=
 =?us-ascii?Q?CydgTfxcofd+447H0YSEmBaMUP5KNwFC5r/2IFnXYWABhuU6DO+LENhLiAUj?=
 =?us-ascii?Q?m55JVNI440fHlpclvJaVRc/AmCsVYgRyl1AT/5BL4azqBt1I5mmRe3AKnaxg?=
 =?us-ascii?Q?nhcjL3rpGC55cEkBGjMFj/Fc7m/P1Ien/xeDIW37hZ2Qy2nHcL8ET7fK8CPZ?=
 =?us-ascii?Q?ILw41cD0e3dokWD4kAjo+MsaQeYy8/Mra5y7UHcfHOul0l55DJO5LyB044e8?=
 =?us-ascii?Q?sRD1Hu6uqX+vTt5ubM8i18AVUR0cyVJbnXasOOX+Ji+9BgsIau+i3avtMwtp?=
 =?us-ascii?Q?LwqolKxac1NKZ/cnTUARDtAHGrthn78GeqfWwbc2ECke1BQ3l4x0MKLuuf6l?=
 =?us-ascii?Q?D4tcR/g+lYtYStbaZN+Jw33lSGXHCWfHLL6Li+0CmRO91P6ZWbCpumezP7zE?=
 =?us-ascii?Q?E2uuS8iFVymTH9vRzLgotlHkScJbxiwvTynlMyjQ8QNqgqJ/iAEZEXQQJ+Bt?=
 =?us-ascii?Q?lb2BcoTLm4HgmAokclmwJVES?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce443c6-4e75-4868-1c72-08d9316da198
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 08:55:18.1146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Ct03SSMfAnJE2rIrnlYcBrNVLeNMRlC0p6sEpgWUTJtmIpr3ZgJ0QOl6gpn3Kf63As4XxbAZFXOXunDTPwlhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5639
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

This is the full report for yocto-3.4_M1.rc1:  
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/=
?h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.=20

new issue found=20

BUG id:14434 - [3.4 M1] dmesg: proc: Bad value for 'hidepid' with poky-alt=
cfg distro
  =20
BUG id:14435 - [3.4 M1 beaglebone] Some drm error messages in dmesg
  
  
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?14434
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14435

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

