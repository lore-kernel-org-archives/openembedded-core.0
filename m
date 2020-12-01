Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.7541.1606814128690898097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 01:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=O/bk4wiz;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: FGjxsRsQtDcZx/AF+OaJseMDOaAZTM5cq5msJAS2bkqKvAOM2cYs213YRmzlw/rPex0dfkWTvW
 exzKa8rB6hIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="170230800"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="170230800"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 01:15:22 -0800
IronPort-SDR: EAsJOouOYBZGfA4ZJueKNFs5G5GlR828Pj5H4xSUdxuPNYmTEmWCwiTsGFhsgIleLPeNntN2mT
 70Dwc9gjwxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="329902147"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga003.jf.intel.com with ESMTP; 01 Dec 2020 01:15:22 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Dec 2020 01:15:22 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Dec 2020 01:15:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Dec 2020 01:15:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 1 Dec 2020 01:15:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF9cg7qcYmtsOuaOqGnbimUhRIMPpyBz6FTVnv27KooEI0GNCQFgeRbeW2UfEksyzQTDBBHJF3bLg3+kpqJeu2JEUHaafPN4mUID81jTmWJNL5fur5DYsnT8ExJDnkHTjZbsKHVq+5wMmAULSHZOmd+9gc98Xv/LCqxAVeyJqM34IuF+Vu+pr5Y+XJRd33C0t+PyeMd5w+xrlPkb2pDkzIBio4qYcJQFHU2F1k1Gx/fE/9XR6gZZSA0mJW2x57jO/4q2IXRzQXnG0sMgnOBM6LsIlz0dKvtfsCMRxaxkMppj1S5F/iaGYUKIoMXEgNc7j7dF3KyxHj4TzNyES+v5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfCfs879mvXVu3xGcvzZIhFf1tKaRE2P6wlT2ommtsE=;
 b=Jfmf/JAXeujmQuR933gwqng1ff9MaIn/+mSAUPbDCDJoi7UxpHf/AN9q7IQF4xS4SQB/CDlvwGAm82apq3DIxdI5a90u+5FnMJewAmh5Vx3MjMOt+vAPFKE6bkOFPRXZn4dixvfIRI+iDLAH3krnzMR8K8XiqeuUnh68Zjn1Nh9f6qe+MFgijww45c66487myJwze2fjt3F4Mr8EpWK7cJClKDP2J4z5q2Mn3pmyS96Q+Msh9aXiufCpuoDXh0QwblXqPz0901thSliesc6XlEKUjn82PB1PDqoovsULgHoqEwZZS6B5o6ukv8RAXd87axybLLMg31Hjym/U1jD37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfCfs879mvXVu3xGcvzZIhFf1tKaRE2P6wlT2ommtsE=;
 b=O/bk4wizfdfAWpaO3YmejsfEJs9p9a9Fzz1wCfMCJ7SBNukrHC9QK9DJt+k0SRkEXxVqBjAT0cjsFrB/5pLNYgfPgwxpf71+iBkEoKga87dFVz5WBNaWMBFiXD7z+GAzpNzKHBXe068kz5pkr6kTumY9dt5wfBiBUrGXAbEmS3M=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 1 Dec
 2020 09:15:17 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059%6]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 09:15:17 +0000
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
Thread-Index: AQHWw6qnEFCDcmXBKECEKcZGa+5dhKnh/Vww
Date: Tue, 1 Dec 2020 09:15:16 +0000
Message-ID: <BYAPR11MB3624F3E82A281AAE63E2E9D2E3F40@BYAPR11MB3624.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 0b2fa39b-1695-4b2d-41b7-08d895d99e5e
x-ms-traffictypediagnostic: SJ0PR11MB4974:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4974D78168BD1D8AD32F166DE3F40@SJ0PR11MB4974.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gisuR0FyHBFsYInZKJH1apWtq/Rb1BsZlxI0AhcU3Xme16yg5Tp1zFcRaPij8Ur3vIkjWwdEA9SydVj4UQJOcqRnahEZW/bGI4MzhYUXgkrX7ETEN/7TCXDdwgupgNnFc3aGR9VgZUEgKcf61Mq0TNifrl0Ix4pJkcnEuPGyOW6H9Y/J3Y+7FzpO0f7RXIXMkRgw1MzvTsSyfFEkRJTimR6Kf6fLoiDJ3IVIrmPTfIDVwKIfIN0NKSkqo4Ye5C7r3gwZ/xrnkMnebTG8/mr5vc+qaK+QNmtAoBPe6kNwrilRCFz7Zm0ogtBHoXz/9pGH0nYSRWucKVb0So5wIwRk+fqBhoVknSwAd2mfIBzvp30EOFSdp8NJGfTrqN5bl8Mg/NU0DqIDjBDmlVH8/HUZ/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(8936002)(7696005)(15650500001)(966005)(6506007)(66946007)(86362001)(76116006)(478600001)(8676002)(66446008)(4326008)(66556008)(64756008)(2906002)(66476007)(53546011)(33656002)(9686003)(55016002)(52536014)(71200400001)(186003)(316002)(5660300002)(26005)(83380400001)(54906003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?h2iYnGG6qh3Cpg6kFVwlSv5RPs2xIYvlq4YZExSX+TBXzEwnFHdZIbzau/Af?=
 =?us-ascii?Q?iPdCkllsU8loyEb6MekwA6p0FtZnRU+bCPs+L8wkZc4lccEWjURPAxjctPy8?=
 =?us-ascii?Q?ODoWTQzkHNLTs0NvKwKdTSkYu2VzaS6lMmBP98Suv+7jUGB0xXstJTkxD2yU?=
 =?us-ascii?Q?k/nTmfbgWoxJGTKHNRm25my/tqFxQSKgLqSPMXBol6Qn0KWbMqmqzFMAHu74?=
 =?us-ascii?Q?9j46T4Li0mUhq6uG2F11cMQe20zcbVqhT+/teF5GV8631c5JKxc28Yw12OoE?=
 =?us-ascii?Q?fDgdZkpMT9S151LqIJoXMy0QhH5S7L6pFaitXb8XWSaB6Xqmk2vdcNUxv3yD?=
 =?us-ascii?Q?fs/qeW/SVPMiOyh/IQRMXOdLVTh0EATbswh+VdTTLhwlUgWYIJXcyy3sMPK+?=
 =?us-ascii?Q?6398MDQedOgWxSL2/UzLXTVysZ/iiLkE6vg1KlX/nuWWqc7YVGsstpfv10Ka?=
 =?us-ascii?Q?JmNFqWnIZzRwzXpcGy2KyBzQ7Xac9asnUG0RTEGhswHWkii8EHm5i6C7Q2WQ?=
 =?us-ascii?Q?ia8bRiZzF8woZT1Pn5rp6UBsybnakP3821Eq6LTkwSD8kNPVzeC8U1ypYx6f?=
 =?us-ascii?Q?AoQsxvSeulN+pWV5Yz+wW9nywmMeNs3m6dik9LEM6fVPG58P5aUs6XzXgcas?=
 =?us-ascii?Q?QZemwrAb1ZT/BXGS1GhW30aTHZtlBhq/MD9wivInoBJeWeY7yMiexNwrikLZ?=
 =?us-ascii?Q?a2U4JxSSrWGJyVum7MAx/kKBgVG/F5rtmrm6she8Q7RIlwXc90AgAAPo+JzW?=
 =?us-ascii?Q?XThyjeuV/iP95cExDxHIfTRwNRrghFHqP+bajDAR2rZgstNrQz0cQlXZfqqs?=
 =?us-ascii?Q?HudwvcgAXdmSAT3yTKMfgA3wyyJQaf7dielpHzgl82hjclVY4aw7IQ0yljJA?=
 =?us-ascii?Q?fAUc5FIsxwZunID12TVsubym8j4DlugueFof801BCOLiqbn6fwyvOIViu294?=
 =?us-ascii?Q?ff3xVeqsUeaJq8Idf0aiOMHHo9WpbNjwO/D22cyF9bo=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2fa39b-1695-4b2d-41b7-08d895d99e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 09:15:16.8775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 18eDV1k8eXoRa/z4tMRZUYghsj/SP/zZhIvzE83mWm35dsk30CAK6hwCmxULh+HLGJ/te1Mh8o0kbRjb9mxDwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This is the full report for yocto-3.1.4.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.=20

new issue found=20

BUG id:14138 - [QA 3.1.4 RC1] failure in oe-core manual test: test_bitbake_=
devshell
  =20
Bugs verified:

BUG id:14071 - [QA 3.1.3 RC1] failure in ptest : perl.t/re/pat=20
   Verified Fixed.

Existing bugs observed in this release:

BUG id:14055 - [QA 3.2 M3 RC1] failure in oe-core manual test: test_depende=
ncy_explorer_is_launched
 =20
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14138
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14071
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14055

Thanks,
Sangeeta

> -----Original Message-----
> From: Pokybuild User <pokybuild@debian10-ty-2.yocto.io>
> Sent: Thursday, 26 November, 2020 12:14 PM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>;
> steve@sakoman.com
> Subject: QA notification for completed autobuilder build (yocto-3.1.4.rc1=
)
>=20
>=20
> A build flagged for QA (yocto-3.1.4.rc1) was completed on the autobuilder=
 and is
> available at:
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
