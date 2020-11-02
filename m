Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.26251.1604290686055413326
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 20:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=s5lTwPiG;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: A2iouOr8sx5EseyNPtzyZ0xHkl1wuHHGN8OlSg45rorIXAHKvUVErMdV2ppA3hPbGXd+AjuZBm
 dIEWr83POT9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9792"; a="230465088"
X-IronPort-AV: E=Sophos;i="5.77,443,1596524400"; 
   d="scan'208";a="230465088"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2020 20:18:04 -0800
IronPort-SDR: O5Yux9wpyuFh/b78e+EbhkpFzWzpsTV9e1cN0JbgIC/1mebu3T1tOCwwnRFgQQeZDd3YRLFY8M
 bUTibt/O4tZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,443,1596524400"; 
   d="scan'208";a="351886955"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga008.jf.intel.com with ESMTP; 01 Nov 2020 20:18:04 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 1 Nov 2020 20:18:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 1 Nov 2020 20:18:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 1 Nov 2020 20:17:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1UTHCZlTUDK6D9Ds1HTkb0G8wx+oFqrqlgbGlDDcslZFO4TPyqOaCgceem1NHSl9f3drIi5vPqqH+Ow6M5KIj3KgCbSMPykidQYDOHlXBBDC2pA0au5IZ50ujDXpW60fAf8Ms/rit7rnWK9J6mLz3sLNdYUmdaM3VCzlYW28UKNZyhtYTsJcuRbFQfjdzoNL1TpzqRXEjO/gM7aQ4YMhyzX4JTqisPv4Mxj9sR+9NtzI939uCY9XQrKxFCmwMptFt+R9wEr0U1lnbm2rgcNAVan+PxRJsjBzQuOynCRPl5mViHtvik0A9BeWYTZagGCRtNA61kP2GeLQzJF9a0CmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2xRrMh0BwHpSqxBe8tGKA861KJIT8jhxorLREDvBp0=;
 b=GQP+Tciy7AMAaT1I1MEp4qKsxVGdLXNfDKiJUc5HTOVBh3KE03phOWcXMA5RakYfBxs17/GlHXIFeQR+G0CnzmsZtmI4LbsdkN65o91clAkfD07TAaZa9P/49BzPIhpLRm0u3Xx3HuhpiI+l/eXy1tEPA8Ubw96ol1Aw3AJ8NN3rff1TflwkZ2g0/MaWTsxuIYSeQci8BbmId/RKFFnNPovxV8HSmbQA7vREOKqGxv9jJS+w14ir6tX4OqQUmd0ZaKOu/SDd+cEkMqtLMnvhvvNa0/xs8o8D/G4pJlw4CsdHz+Wobn9h3WNvJJyuqdeJF7Z7z/kk5/BeSZSMUAfymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2xRrMh0BwHpSqxBe8tGKA861KJIT8jhxorLREDvBp0=;
 b=s5lTwPiGgr25mmeOMLYIKZhJE6l+HUo2Xs/aTJ9xk0f4ZcTvByCLXoUDWikj6KqK8wfPUVWtisrURgFfEZ5efWjWX51p2TwIWWKYYcbxUt8Fpv6An4w1fYlqnM8a7pP9OQZkObI/Elv/NUMIn7+tCau2fglEEh7r6GDF0tne5co=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 04:17:36 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::54ff:e9af:311:a985]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::54ff:e9af:311:a985%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 04:17:36 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Chan, Aaron Chun Yew"
	<aaron.chun.yew.chan@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	"Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.2.rc2)
Thread-Topic: QA notification for completed autobuilder build (yocto-3.2.rc2)
Thread-Index: AQHWrDlZmCCjfL8iqUiY+Jvfv3Uf/Km0RTvw
Date: Mon, 2 Nov 2020 04:17:35 +0000
Message-ID: <BYAPR11MB36246B84B23AA53E7D4F5377E3100@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20201027081519.5550F80A5F80@fedora30-ty-1.yocto.io>
In-Reply-To: <20201027081519.5550F80A5F80@fedora30-ty-1.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [60.53.170.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d66bb6bf-3c99-44ed-a8f2-08d87ee63aac
x-ms-traffictypediagnostic: SJ0PR11MB4976:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB49769918805138C35F9EA20EE3100@SJ0PR11MB4976.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JgwsNCMHUpnZ1d2otp9tIiCCgAIOBaxn7WkwLPnYPcPkWdIFXsimq27SN3pU9G3ZXlQeYE2A5SAriZ2XwIZkcf6AbOKp01ktp7/lc+jynul4jVMgPHD8c2MTvAtFx+ik5vMx/kSq8NaGlrK0Q57dao+mjsccVMEs5aLXXgnTtwp/SwjiYIlCMgOM9EmGrPFhwVKg+1u2QtVqJyIwAVfcAW1+c5tPRQw1Q6BlzHXDj2sua7P39guVQMLWVEH4F5tKIQxmQH16+A9Sn4yrfRrKgTJi825Yy1kHME1wj6NLf5s4o5rRwXtcN2Px7ZPOmloe5XFJzkbbgW9w0oKx/EW3Ua/1q7agXyuSOILSTp35eDm8TSDX3HSvdI1dtzmfh5AZiekNDj7CX/pHNwYi/NUT5w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(66556008)(66446008)(8936002)(8676002)(52536014)(9686003)(316002)(83380400001)(110136005)(55016002)(15650500001)(64756008)(5660300002)(54906003)(66476007)(66946007)(7696005)(71200400001)(86362001)(76116006)(966005)(4326008)(6506007)(53546011)(107886003)(2906002)(26005)(33656002)(478600001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: O5ALW4U/sg2mEdt932//oHgHHkEbtld3yeDGRGH4qOnev65wqGbnkw9EYeztt0+wM4E07D8dkpdfUR0HMvO+eo3LkUBZCUNE5NKEnIwMxlPQcxo8exDCvvVZP285Bie3a+L7hDlTNoCVbRe95gtQEWWA2PDa+03tiG0StcRh9++F3hKdvP5p+49R9tSL26ceeVwZarW2mcsHfvZHwNxgRyIDNb8TTwdKMlOZrPGylONMSzZZojZwlsI+5+hdqJmlhJKuhgS+j2sYdO+tAGH2OQFeNCGD6GOHSbv+0JuwX/U8WA5GP9bHMmi5uQBHGQPWe99XFEBv0ntbjahzker7DwgQ3PcyPnvNn/SYkXm4Mz4Vqt9fPOQumxjHYrnfqjsWjnhNhlcLhh9jmH2AqYUBK8FcwelRMoSR0qvH/Q5nc41YQX2ryoueSmXloyQN/F74zgLqX9MSaKwPhEnfBUy2rz/7uTEvv28LcFvsG+5ZUSCo3ptfAjkcp5SysUP+ucTf/VPHS1CYH0GsZU/QiIvlAY8FMrkZ43qw+d5+K8p0yUpZKUr6hZeQqneDv66RxW9jSvJtMbjp7sNd4b4SdYphHQzqh2vPYE+qLIAkEfhTKVG877AbO6F5S87Q+aW3/UEpOtejE3OIInfwXFzhwXrBcg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66bb6bf-3c99-44ed-a8f2-08d87ee63aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 04:17:35.9340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pQS7yr/JjoFxJvCYsuuehl3VzUDDtJ+j8fq6EmZpy1wB2H5yfU3QCnYlbhMRvx3nyFxZxwmuP1CiHPnwrYFvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This is the full report for yocto-3.2.rc2: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No new defects are found.
No high milestone defects.
 =20
Bugs verified:

BUG id:14106 - [QA 3.2 RC1] failure in ptest : glib-2.0.glib/gdatetime.test
   Verified Fixed.

Existing bugs observed in this release:

BUG id:14051 - [QA 3.2 M3 RC1] failure in ptest : valgrind.drd and valgrind=
.helgrind
   Updated with 17 ptests passed, 1 ptest still failing
   No new failures.
  =20
 =20
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14106
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14051


Thanks,
Sangeeta

> -----Original Message-----
> From: Pokybuild User <pokybuild@fedora30-ty-1.yocto.io>
> Sent: Tuesday, 27 October, 2020 4:15 PM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>
> Subject: QA notification for completed autobuilder build (yocto-3.2.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.2.rc2) was completed on the autobuilder a=
nd is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: fec2b85689bba1d26ad6f376bc11cc29bb27cbe5
> meta-arm: 2d3ded053ae0774b9c7254bdc084451438b2150a
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 4ee7bc0ab408db7388374e86920ffa378b7b4535
> meta-kernel: dbf8bdfa6683404e5071feb47ef6aa347cab1b01
> meta-mingw: d2809d7c93bdb46014e1f8b3b0a4f42030078905
> oecore: d3114ca369792201a5316c1ede29eb72f0868d35
> poky: 5d75168a13d00253460020e536b2a87833ec67d2
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
