Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.9556.1603695993687932762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 00:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=ViNmCp/H;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: vTfy5QCXr+BX4+NvXtlkP/Oi6YlRukqJLby99JvBEWPyhOXdH6iazrLmuuEnq0Zqe/9p9D/Rcz
 Etm3GUrSVnQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="185608046"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; 
   d="scan'208";a="185608046"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2020 00:06:29 -0700
IronPort-SDR: zouYlvkVx9e+QrUtnkjiXjYqL6sgl5ODxQ9Dt0Epwzt3cPPB8vToNEVfEHcdNQamPZMkz0+Pol
 t3ST/m3avAyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; 
   d="scan'208";a="360284781"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2020 00:06:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 00:06:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 00:06:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Oct 2020 00:06:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 26 Oct 2020 00:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d82cGcWNE4GfR+fsruyX7Su/0BEHydOnU1lDjEr9i3KRpCdKEomHVhd5ndi4iKz7o2a2nPNp4YXAmEX9No6YtMTyAf/o6M4WOvazkOC8XwvspZQM2e+yicfzIAeCR3/3spcdHQKWLdL348r4BN6gdPIp2YXOqVSfs3jcoNyGbvUq7oor3U+vMRV4AO/qz0o7tu/qgX4yFohbeyb8ffv6H7L8pmZnGMiMl53MeoQDu0zq0kCiXkyv0EVLOO95PQS0ue1sZpe3R4u5vLUGjP8WNloplMiOgtQg68hSWPCxCiyzBIo7+EqdKgXRlRqHum/pRCq2bHQymfDypHYF7YoToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOy5LCIYDcxR2u55+oIBUYUMZdROE5SdBYesaqmaZ3A=;
 b=g/MZksqNECWATyQ8CPttvA/HzoRnDogiAIfbNErByyMlyqJ5UwVz8eWqG8zCE2jOqb8AlaW0aMmsALTPADX2aFzcZQuNEn3j70xoHJHkZx2aykhjy3/GRep5uFAHFMgO1d3x202HvN7146rm1tt+lgXRDj6fa6TzN4XzBVgxMwsft16vOTncmevc917vnO57eLW7miV+NFsFQIdszyaGPlNgn+xY2wvQaiMboYDOXsAJqzo7NOY2fb7Xl9f76jfUfh5LPmC4F0OPDmRICFXVuvTX20+KkymjjDYO2c3FAdNyvRqQXFr2kBCBNoarzozal8x/ykUp2p+0oSQuSy7nCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOy5LCIYDcxR2u55+oIBUYUMZdROE5SdBYesaqmaZ3A=;
 b=ViNmCp/H43g/4NDwsD3eCstXPmOS1BdjM0EtvRZmW0zgZI6HmQathrAr3N3fZte11Br4iKJboCUKuo+7nRuL8Bnddr0XxK8PIFfPhamzJi5f2IWPX0aqpWofyzEvV5UXkPfgq8nDJ5Cm39o7BooLNb9peucusChvtZcIHCHjxFo=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3558.namprd11.prod.outlook.com (2603:10b6:a03:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23; Mon, 26 Oct
 2020 07:06:21 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::54ff:e9af:311:a985]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::54ff:e9af:311:a985%7]) with mapi id 15.20.3499.019; Mon, 26 Oct 2020
 07:06:21 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Chan, Aaron Chun Yew"
	<aaron.chun.yew.chan@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	"Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>, "Teoh, Jay Shen"
	<jay.shen.teoh@intel.com>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.2.rc1)
Thread-Index: AQHWpv8YGcjMroQZV0ScEd/oabnWDqmpfqMg
Date: Mon, 26 Oct 2020 07:06:21 +0000
Message-ID: <BYAPR11MB3624C502B36E80A6A1BBCB41E3190@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20201020163538.0C38244D07F@centos7-ty-4.yocto.io>
In-Reply-To: <20201020163538.0C38244D07F@centos7-ty-4.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [115.133.103.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6451956-1e32-4594-6101-08d8797da4af
x-ms-traffictypediagnostic: BYAPR11MB3558:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB35581DED006CF612DE6B54F4E3190@BYAPR11MB3558.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U9wf4VLS63F7PqOALXLWSPh9/RWUeO43V6w2fJVBU2fxf0lKzq2ND1DzD+MeE/cdkWru7i2DV3hEfePgKHoP+B27WCBFPgP0raMopgfr/xWhjxXek5AMKhUXEMT+/BQ2ZlhVxH4CFr0lHELspcvH5VRqQwCuS5pGbn16211GtrUaSIngWuNwjlb1Ev59RIuXzYWKAMAXrFeXNVOAeSve9RQ0ZquwiWchpX2wco5FTIGUYJNst0XGQNa01I1nj4Li/4a1iNGQzFZ07TWOiKrwu20SVGdyJD/lP4aaiW1KpU6OJnbd1EHjVkePfM/qYboSLO4gM1w4jeHXqwzhPTP19mKMcCzXe1AJy4Dn420apVi7j0UeJFJYCe46uEOPo2T9TH9Xc/nKhUkv8nWTIEXf0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(7696005)(6506007)(2906002)(8676002)(53546011)(4326008)(186003)(107886003)(54906003)(9686003)(52536014)(66556008)(66476007)(316002)(66946007)(66446008)(26005)(64756008)(966005)(55016002)(15650500001)(478600001)(33656002)(86362001)(83380400001)(71200400001)(76116006)(8936002)(110136005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: hPR73BTBVIdXe9pj2d6x+bLW+RvXKTtnjjsqqLJlZpMIykZ6WHyefJywiN/HYl2yx/ppW/PcvJddEuBsmWlipu4iZbZRi37W02bt05flOU9Q7b15UvDmmnh64tCB4pJHhOlGjfZPvP2x+hKtYdhmVUq75an0OGWr0rONmDNnAJhECE4Je1hULkGL/vDfmVV/2YR35oa3N8KbKwbE5IWbsGoPB2G7mhp6Z1LSJMa9UUxWhXamnB5q84v5CEY/M8RSjogECa2trcXvHihPhhq9qw0NBOkO1GQegXS0VrYyEaPpMq840++z8zK2Dq1+S8jhcw9TUrnzXQLbWJIHwY0f+asiKqbHdFvbf+2tWFxkrFFVrhIAsFbfNF8zqIIzSIsPo6XVEaWRczmbxeWxOWDplkhELndm1bfPU321WzEwAqUq0pU+4D56p/F5Lm2OsS4ZUB9vsDWPoIKuam9Zcm2na4YX6W1cjhmNC/69fizfgaaOevq9JgmdIGG+FK1D5lAUgUI+9rdcp/RhDEdfXEfLfYF90d92tQ01kFk9+G9VJT1euuuI10jqyPurUjaWM+VakAGD/OK6LyaYQhLfLkZ4ch0Wtu1Sub9Zw+ODY3wkdGQEmiSx1jaob/GmyxzPO1mB+7aej4kWVW4k2M2gL8rLbA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6451956-1e32-4594-6101-08d8797da4af
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 07:06:21.2295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ZigSS2q3MGO3f1vLC1gTS7LkNKQNqjmQFl2afnXDsrxloaJfI76VXD6oJNxUgD7Ph9Fjb4fr/6cT8xIYWN02w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3558
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This is the full report for yocto-3.2.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No new defects are found.
No high milestone defects.

glib-2.0 ptest failed (BUG id:14106)
 =20
Bugs verified:

BUG id:14050 - [QA 3.2 M3 RC1] failure in ptest : parted component
   Verified Fixed.

Existing bugs observed in this release:

valgrind ptest failed (BUG id:14051)
   Updated with 2 ptests passed and 3 new failures.
 =20
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14106
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14050
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14051

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Wednesday, 21 October, 2020 12:36 AM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>;
> Chan, Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.2.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.2.rc1) was completed on the autobuilder a=
nd
> is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 9345d257ced432adc2d16af20ace58cc7c086aab
> meta-arm: b419151acd2761d0e2723f0d0c0bbbed00c45c5b
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 0e4b3cb01735bdc5ebf50c547927f1f59b0248d2
> meta-kernel: dbf8bdfa6683404e5071feb47ef6aa347cab1b01
> meta-mingw: d2809d7c93bdb46014e1f8b3b0a4f42030078905
> oecore: ea8ba9a15bcec7f5fbce1f40170298f87a808249
> poky: 4e4a302e37ac06543e9983773cdb4caf7728330d
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
