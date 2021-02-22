Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.31952.1613975250521494558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=odg4NmJl;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: 77gh+QZtbcsGwH/+5b2j/ULYNycw/kuJxJIucg6qj06AjZ6wNgf1RzwXqWtYyaAZ0erBFVNbIP
 hrAkLXPEiKXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9902"; a="184460387"
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; 
   d="scan'208";a="184460387"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2021 22:27:29 -0800
IronPort-SDR: DfILk7yyoXnq2sN2Ig23J54xDiPUi0yUhL9418VxosjJ0PLj2lOBpTye7XzVggVHPiRkiygCgt
 WJ4NsQqghm/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,196,1610438400"; 
   d="scan'208";a="389687524"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga008.fm.intel.com with ESMTP; 21 Feb 2021 22:27:29 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 21 Feb 2021 22:27:29 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 21 Feb 2021 22:27:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 21 Feb 2021 22:27:28 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.58) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 21 Feb 2021 22:27:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgEdk5lkt4KIuEVZM/3J/yyeE7dotLjSYuYKYM52sWP01u8SNl5MDm6JC8eTonAXznvkcIhJEQIvdNfZ7lmKEw3FCpTdRm2fBMsxEMU5omQb/HmmsAG1w9SHxgpASp4JGgS92YOW52PitU5i1hCyea/xs77XNpw0a7dyw8HrOWG+8TotgtVmKAZRysQGwxm9vmOV1PKUlx8zRDU9b+p+Fk5my0T/KrjCJwUFowijjYdmpBvmkQDCFRGQDslRJsBYLJZ/LaT5QfLNVSaz6udOpbsnyW5zC689lg5dX7zJZabyZlINbhZtKP9JZmCRxEzXsLHMKPNhHSSSey44iafNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLWXPSlgo6hKCssWWiwCiBhx+SFv6aeI/bZGxhg5g1w=;
 b=GH2nI8fDGbePR5npXwBGwwD7QMgIl7DtW6/XAoY8vuvGGb6wnQ1lQbzSdAto0kcQVsVuRlVuaTWFtkGUfWleELF+MIRdc/QurP3A8Rb030NxAAyZPhFi1gGuUh+iCnqpSRe/YjWSd2p5MDw4Hpsl1137J+Sx/Y7/CojfOptWxdX8fogNzXLErHllI3r4nMpjAFgJ1Hs3+y9VqtsgX9MGBflrVAxkeRiEycTmWf8DfoEmoChqs+Uq1OS8zLSUpetf2eRx1JLTcW5fKDp7gb/ju1GgRg0ikN5H7URtNCq+0eJyqAvqyFAqiQ1tJINYEosAmaLPl+6iPiwGzIy7vJa82Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLWXPSlgo6hKCssWWiwCiBhx+SFv6aeI/bZGxhg5g1w=;
 b=odg4NmJlR0dJ2RNQS6MFzu3EbDEnacfCwGNE8kjmzdaMG8gvyb33rS0Ia6TFCjzRKsse9fLn0pzhxLyjKYg1AL7hewMMjhFXBl0Yi/CXP2pLz6DXiOVlGACrBeC2xRQni3C8nE9K7DwnFDW71UPNUs2cprvz5OsOpJ9gL8HwyUI=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 22 Feb
 2021 06:27:27 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3868.028; Mon, 22 Feb 2021
 06:27:27 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.2.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.2.2.rc1)
Thread-Index: AQHXBItgdl1jr4MEQU+S6zcoyxPJyqpjvlJw
Date: Mon, 22 Feb 2021 06:27:27 +0000
Message-ID: <BYAPR11MB3624A5FB811BD947302967B8E3819@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210216174346.29A0D2A0FA6@centos8-ty-1.yocto.io>
In-Reply-To: <20210216174346.29A0D2A0FA6@centos8-ty-1.yocto.io>
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
x-ms-office365-filtering-correlation-id: 906b92ae-a827-452f-d430-08d8d6faeca8
x-ms-traffictypediagnostic: SJ0PR11MB5165:
x-microsoft-antispam-prvs: <SJ0PR11MB51657768866A41766102B8C1E3819@SJ0PR11MB5165.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CMVPucTM6TRomXN020CIJoeYcruoDvyuF2fP1A6AJZIEhbJCI8IydL+JTXnDJqBnnnjv+yZwMxBGyfCbcH42ptOoitBgB8k/hUxXDA1GDrHqxcdFcq2UEiqoIGafz5wWjgR2m2VeJnHuX96wSebzc+7HObp48zWoX20eThZwxK/1vmuc6gGNU++Hc/SGaycSfPyGAel4x4gHSZdwNd7eEYcrEARfneiI+7bMcHYZlFxXPuYZtHXAw7S6UtmsI9esejR1CS6MkEtbs0Gub6MI6s2TWcL5S5RlI4cRwDob6dpxiQQMi4ddhZsLaHmAXh7bSXJCBT41vRC3h0O0Qampi3P5xEqXLKC6+S39FRJx1CcwugS5Eq1hkXZU1dFwLXjmfBvd7FcBpLrrdHpgS6LPUR2bOTLEidX+aN7bBApye7G+1//ir7Puqtxx7eG7H8ZXEzWN0dZXWoHFqWLoOB4buxEpzsfdmMxilgnYXujUSHi7UY+GE9FEk13gYRKsme7k4lynMoid9R6Lf/IlHw+nJfxCNMSc0nSjdDtYpelnG26QVtxdvYoMygktJtwU/rUBBj0uQsr2xc/z7xhdCMcDIhe2H0YNy9dlE0c6JOjs4ns=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(376002)(136003)(346002)(6506007)(9686003)(53546011)(55016002)(8936002)(8676002)(86362001)(33656002)(83380400001)(2906002)(966005)(52536014)(478600001)(15650500001)(5660300002)(110136005)(186003)(71200400001)(4326008)(66946007)(66446008)(76116006)(66476007)(7696005)(66556008)(64756008)(316002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?uCjqaekcbgAQCbOqzJjbbYxPb4YZDoN0OmVdGe47Ji/tQfxOrWNaOQlwOmWJ?=
 =?us-ascii?Q?1gN3gTxmAJRaMN8jzc7/9I/Y8400Pw/rJwwwnuN/uDXPml9NjiPQPRB+V5nq?=
 =?us-ascii?Q?nUG9a3aXPKL4hbR6gRPFbnQ8w/wwh1by4tlKsqFCHHl8tNmgXQr7EOef2NkZ?=
 =?us-ascii?Q?4DuBTCAF0gEt7yXIupIpkpPNorOutJlvhopNYLRHluLjuM8l7adEaJgPHcBG?=
 =?us-ascii?Q?qdkecMxZIZ+x+TE+/eREcCH7JxBrVNU2XUYiP/uGRabZC8RUC2qfsEOiPPy6?=
 =?us-ascii?Q?uIv/9ukgPD6TAc8PQIYpulnjFG9BaBLs0tiJerOilfB4ox1vsSrS533NOOB/?=
 =?us-ascii?Q?Cp/jPPB2+awqiLkJfvfwiZfqEZ+AGV27nyOkrPueHQJ9VOIaisZFOyjnTa+W?=
 =?us-ascii?Q?aQfxddqaMjNqPtUMD0SbD15pEUU3EOUS1JLXZl/VaGbbKXq0gfINL40fTiW8?=
 =?us-ascii?Q?X32+8YJaUnbmUvlPKBTgCKM48hilISe60Q37jIOI6/NdFaa7sOra+/mjKwry?=
 =?us-ascii?Q?M4S915sTImZaAj8Nh9uovqqxoPiHDwB216lIRsBBKvavgOpETZ7eVoVswNu+?=
 =?us-ascii?Q?nVXZWUNAkUl69LtWeli3+zHyglG5wRdfgHdfdTkbNuDHs7UpIQ+Tz8Pn6Zrc?=
 =?us-ascii?Q?IjCz6/z4lh4UsCh5t5XKElHwHPskgYyc1WRv+sDh7zrAgKv/atCcxdcYhHBD?=
 =?us-ascii?Q?QPcy7W9WlEUWFQxeZhp8IO5hBY+Z1SlXE0B/vxBshTWPREP/hteZukGJAb47?=
 =?us-ascii?Q?L7nvz8gVpunFM+4vuLhn71a0KLqefNEN64ze8HWZFUfT7yUZxYGQIZ6WT6Vv?=
 =?us-ascii?Q?N9MKJEpxN4WNyMpV7kE701BRaWhDh7w8PPlMnzrQw6fnc5aMVtWnA7djAn5T?=
 =?us-ascii?Q?aIbVLtrw4x8S7sCbOM3SJMGaGFBR/Bysb6Lu77Rx/zrgAw+b4gE4OvM/FWo0?=
 =?us-ascii?Q?FYx0j8BR2LJX+zHo0w2uW2Q5ui29CuvoQWUXyjgCZzkYC+NBMoF1DNNgXTUm?=
 =?us-ascii?Q?RqKtcELotOcS9W2EA2zIVzGQnMgz8izxn98S5gNmJr9j9dg76FC+BG/FAu5h?=
 =?us-ascii?Q?xaQP4iFxSn2P5SQwm3NqB5kbmBvz2/rGkBgyuOSiE3/wUaQwVM7ZiHpltcwI?=
 =?us-ascii?Q?6amPCE4OgnU0MVON2RsFt5Kw/6alSblZG66PDxbzoOQvvAP0EPrtSUnuBxFp?=
 =?us-ascii?Q?GM8SOBN8RQ3Vqu/XzDb1vlT0++KrCnT2tR4X6qwwDiC7oSujufGclhg3ewk0?=
 =?us-ascii?Q?UcXL1Vm5OMz1VVLSw0xZQVWeqXAtP3QhlpuDafzI3EIsGZnYkSmC4+dCOLko?=
 =?us-ascii?Q?k69nJtUPMopqISBZ4ZhWNhm4?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906b92ae-a827-452f-d430-08d8d6faeca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 06:27:27.2191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVkmzDTiaozAwU5U7uCUrvhnhlDcAphu3w2xdfWEVYn4SyJgg41JUjdaAy28idiJ/Tqhd9c5TEPTxiWw7oSSjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

This is the full report for yocto-3.2.2.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.=20

No new issues found

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, 17 February, 2021 1:44 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.2.2.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.2.2.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 0a3bf681530bd63fc0036ca81ef868ab53fde56c
> meta-arm: aa63e31b6edb5197764c21434219050ab51f0fbd
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 1d866c58534eb1d317b7a674c6e6c57ab9594fb0
> meta-kernel: f793168bd19af3d8c5a260dd35f387ed9a31794b
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: ebaaee50cb3ac75112827f935c48affaf622ce7f
> poky: d5d6286a66f46f4523e35e0e3f20cd7396195fdc
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
