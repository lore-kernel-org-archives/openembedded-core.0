Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.8918.1618916262268842670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 03:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=zYhPG1md;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: o0rKoirsSccH0aKU3b42B0ChMDXnm0xFMBQIsloNMdygTFkmaWxeDvcNvKBB3Jq0KxFNkgbHSr
 xKtEXnz2TL5A==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="216073749"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="216073749"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 03:57:41 -0700
IronPort-SDR: QlyFB0lAVX+RoeEe0t3VRXntMyBYO4l0xPmr9r7ctMgjKDjBd18VTZcNtyBKvZJynKvB8yv0Ss
 mB1Ef4QyQyGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="390957585"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2021 03:57:40 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 20 Apr 2021 03:57:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 20 Apr 2021 03:57:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 20 Apr 2021 03:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbaO1v1lpX8W4RfHxVB3t0Z/DIe1cCahPMidlWncE+55IF9stQQoCLDzLC+gNskEiu1mc81jC1S0VbRinU028LRLcJegl5m6paLZMlDI129a2AzbVhkLhE306h8XsWxcWOsV4AjHqvN+tT6qx54tN2DwcUnKen5jlx5CtC4ET0wpzksXvMJVjzvSkjgBFG+g0I2Bk7CTNxPycreQjO6jb5EJgMyuxJvVnLdqOZT5pKHsbN94lCw04zTd2r43w957TojmQuRFiORx0f9KMF1qZ8H46jQcTl/88yJOdEFLv8JXdjoRl5vtViPcTN2XlIqkEI0UfAlQ6AmSrivRQBs9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWBbRCYtowxr3OVgwlL7gMiYN/i1xjONscGdp0GyZuk=;
 b=CRF/TeaFyJl4k0zzj4CxogNediF3QdRHx7QZaSeFYtO2vd4PkIJVmkwpDW4FW3TBBBNPE+eQq/LloFDZ/x7PlvN6fYbAORIjVPBfpoINQPDigwN9HljKAOlwlpuThnAb8zFnftb2AcHgc9WYVNSOIDRh4oSNM4UrbbE/eB+UC1Ufi2VXAaRpHqdYrZqBtwa2cXTGBe/dJcqCYYgp6dGBE81TVAs4sSI4EFJv6J/3w87sIzq9Lmah5H5Npz4MZO4KmQj5uhFyG7p91rufPlYOScCq/r/qA6oeAQpJkQzYWcIX+bfSmwkYR5xW4ETKU8FLyMSwWTZy7nrqa9LQ0LrJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWBbRCYtowxr3OVgwlL7gMiYN/i1xjONscGdp0GyZuk=;
 b=zYhPG1md1vw7x+/al0dfee6pK5H7S/X2vVW43KN/7q0MJirA/UE15nLCbupB/QtWNflnWNFswOv1lV9e4sOK+ojBWG62BVASwNMV3axPeMjowBwCKpg1Ab/7vOW8m2JH8JL4km9NIjA6rnIwlaOLwQb8TTsWv1t7yze0I4B/H5U=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 10:57:39 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 10:57:39 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.7.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.7.rc1)
Thread-Index: AQHXMK+7MxP69Lpzb0eGZy9C58RNa6q9RnHg
Date: Tue, 20 Apr 2021 10:57:39 +0000
Message-ID: <BYAPR11MB36242823DE493883F2C8C538E3489@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210413215524.AACEEB805C7@ubuntu1804-ty-3.yocto.io>
In-Reply-To: <20210413215524.AACEEB805C7@ubuntu1804-ty-3.yocto.io>
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
x-ms-office365-filtering-correlation-id: c44a0b1b-34b8-402b-cdbe-08d903eb1d86
x-ms-traffictypediagnostic: SJ0PR11MB5039:
x-microsoft-antispam-prvs: <SJ0PR11MB50392C45828C88C9396E6566E3489@SJ0PR11MB5039.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L03htdlwSdcHFfiR8q+QdrMmH1ixlfn4649oB93iw3VU5wFKKRk6smyTHU6XExz0pcIiLy5LZdtTH9LNQ+9kpQxcJAzJneWYa5RL+rf7FuJt8MkLfdYgYzrs9ARAGtoFWo3wsP/TMPD+Rpc+ZShpxGbcSo0DA6v3Vl2w53q5uSyS3R3r0rU4zmqa6Uui+eoAbSha9pnIyC4dV92rBRzLtiBqn3ys8XJiOtk7Q49wELkhMFB0vgSLlAwjjFlLdQGMynhH8szBlX/ZtzgR1BfjjqyIYu/w1S0dmNn3D3tcxcywoVleZyO9jj2YcwykdEDctYwVwmiaVv7WZFMjw8uD7wHUsruq1Ja5KCB5YO5zZXkG7rh1q1162KDvQUinrcRwt6s2ihDKFPDBg1CAQzcUwi/sbheRxdwdl8CmnXW1ffzE8O0roYQoQrUR5LyBnDgwsRydZdXGeHCsQQYaUzlreiR1V8NI11NDHpNri/1lVtM2qIj2fjpvOzIpmBVGIAhgrbQ33AD49SnfT3Y1zEJSawty9t/nXQk41RUMJqzZubDvKnBPJL/rAca+83HjYAeHenRkPV8qwp34YukPJk3qUNf/FRvCHiZZnfR/pDZwEarGGI4I+bG86JP0HDB+DFc6TwWIMUdOcpIYQQoAnBPAfL1LrXyP7VPLuW644EE+8PdKkEBG2FyJHGt/0A5rrhjx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(376002)(39860400002)(396003)(8936002)(76116006)(9686003)(52536014)(966005)(26005)(316002)(55016002)(83380400001)(15650500001)(33656002)(8676002)(7696005)(110136005)(66446008)(38100700002)(53546011)(122000001)(5660300002)(86362001)(186003)(478600001)(6506007)(66556008)(66476007)(64756008)(2906002)(71200400001)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?B3GDl0htebs5V/WgC/OGSEg2BjOH282FThqcKinprIaGFuetGLDPNDwbcUkb?=
 =?us-ascii?Q?YiBu8bDyqE9pkB/i/Xt3GeX35DKra8h1mbo92wZyb0iA68zSpacajczd0EMi?=
 =?us-ascii?Q?VbOP01AKzaLbFr62xIV/SRu9q6b3dZmWrU+pSGAD1lyltSe1lA+sSQkwMGPh?=
 =?us-ascii?Q?iIPsWLxzwx5dqOvbWl4QKeevjaUc4z9tAorz6N4CpivPy7uh7gP9ueRx95+G?=
 =?us-ascii?Q?rueOaO4Ov2mg7z6yLOFKAZwkWMB2fY8xlKy8Iw9dvZ1CKEpoz4DkVb4ruH5S?=
 =?us-ascii?Q?5Cm81TAxeX8yVl/JWX/THxy6bskT+52eE+DYVIXc8vDzB/BntdPF5rBsaXPe?=
 =?us-ascii?Q?vncdzsDnjH4ZvyuWEQog6S13pakWUtdFQqpfOgoW7+65cn5IF6Vl+2TAiuUi?=
 =?us-ascii?Q?nYzIp4au7+CDxJXspClmqJMM1EhSL6zEdJbAp5emBCesJvGCiI65tPXjKp6N?=
 =?us-ascii?Q?Dxlt0cVLXYGq1AwXYZ4leQ4AGhuqfY7iTcl0Ln+gdjpq0PBlLvJDDjaRyeCh?=
 =?us-ascii?Q?VWg9PUOPNbcC9xYnglFSikmgSwjfdMu/q6tlpPDdWKPsopvPOkf9j0AfTLtu?=
 =?us-ascii?Q?PL3KhDczRGF5p1MHthRSqJOYRQ79n3Wjtb0tJ3zxNLOn8ilddNGXydMADzPU?=
 =?us-ascii?Q?IkB7iJotDmw8MKSktlAKTMSeJOecX48H2PcbjilPLM1ZxCQ1gv4nrAjzYaAP?=
 =?us-ascii?Q?R16bG2Qb+zl61jmHEjydDoMdhfxtQS7YA+vZu+o7Sr+II4+viLeVEVjLkihS?=
 =?us-ascii?Q?rl8LtqKSTmxrFoBUf1gF2+ed3VXh5wvSyzYDXkWZr4WJ8Bt1Fz0VOIAf46N7?=
 =?us-ascii?Q?3GJWttyesZT/T0e+9Q3G+gek9Q0h6hD+eQ8l8fczmM2HfzR9ckM5Pag459sA?=
 =?us-ascii?Q?OgcOhXJvhMOOQCtYKemYmQQPzD2ibJTnRGdxyhb44jcZEcasb0HqT/RaGa9j?=
 =?us-ascii?Q?ixhzLCLNJgCnv17OuoWOtMBkVtBznMwrVstRWm6Ax4eBZO/t7aDNYtv9MXEF?=
 =?us-ascii?Q?8HMlv9pxXH1oQqI+Muj7BvW20iuI6RBJt9emY3e0KP+9dZhXT6gZepTlvcj+?=
 =?us-ascii?Q?oZ6DDuS2xrNL/tBzD8RP8d5f1APt4V2hNCOIgnNC67WCcf2aADRzguBle68Y?=
 =?us-ascii?Q?4UValJh2Zg4hUPGYSYBpgRe6oGDFBElbKmfiOEFjrocubdrJ3Ms+psZBTUHu?=
 =?us-ascii?Q?XQMSGWiG8XyNeZXBVsVUwcLYJBxyLWgcMEw42qgMJZB7/IHOlAs1kwOFhED8?=
 =?us-ascii?Q?u5ZA0NlosbY8lwJ/vtgOsHi5rAjTfkPQZqc29CbL3uZKEGtgzKxTW19JPSsc?=
 =?us-ascii?Q?rbOZaR5G2DBtB0aGagJwcqRy?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44a0b1b-34b8-402b-cdbe-08d903eb1d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 10:57:39.6677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0vgUrXY/odQavtO5HIbFptIbtApkasxyGI/irypgBwShxPHfzORMMfeiryyHY8m2uOxAZB7uOMqcWWnPJcuzdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

This is the full report for yocto-3.1.7.rc1:  
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
> Sent: Wednesday, 14 April, 2021 5:55 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.1.7.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.7.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.7.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 017a39ed05d065bf28fd38f91bcde8a098300551
> meta-arm: 1cf8b975e1c40bf8e8c0bf315db5d4cddcb01a7b
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 4bd62a7e154b8c9e8a114f452d3b062d8d058118
> meta-kernel: 29329d7cacc71595cecfdd05a455a0cfb164564d
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: a3de6239e98efafe3668396e69133ffee3d9b27f
> poky: 13f4ddf50eccaeed96a40a5f1a1d4173e677e98a
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

