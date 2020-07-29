Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.686.1596003776368173129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 23:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=d934Sm1i;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: 4pdXahDpGPXvBQkgpeF6uBySE1r0VRKtPXLKHeh1+bnd6aFPlKgaEjAlHQiDOZ6DblwISQLg0l
 RTa/3RR+Q7Bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="169483971"
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; 
   d="scan'208";a="169483971"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 23:22:55 -0700
IronPort-SDR: ZrbEy5KDunoyEyhcybcJW6O2UNggD9RkFyqPKuyAUdDlcRM31qZ5UDxeWmCh3lFml4MmmS70Z5
 xqVr9toKMDYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; 
   d="scan'208";a="273800595"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2020 23:22:55 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jul 2020 23:22:55 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX102.amr.corp.intel.com (10.18.124.200) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jul 2020 23:22:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 28 Jul 2020 23:22:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2NkkPfoLrseIUmVQkDBRzjt0IL+D3bFTT/zXUQk8jUxlcll9XwXirZMPnlSAqvRcHxWwpM+JKQmZ860DHR5PUxRXMEp324gxgagbhH+8VSDDqjRCK5kI7ke5amhxJX+QUf0+H/oE0Njw96gs87NGtjHzUhA1xKn9Rsg5rcwRjvfm3dDaJWIGAShFKckjkAm05bQbCzeFDd517aC/PKCe+5o41MFwvkxtzgKXjIx2q7FDKKuHEWG6AN3P61bsdcOapatfefPHLpI0ZuI4btUuRBiTkk9WjMtqq05gx0sTaf/MQ8xKUuHpTCAGnHF3OShhsG4unrCgOiKhF/CNklouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=613syjA8OqwDU4OEgnlSuqeTpihifMdrZgVrvEM8aQc=;
 b=M5mkYzvi3vYITPocsu7eRwptIv4p3xR3ubwgyopxYoUJg9JNSFRUU69VHepr+EMdEm/8AYFO+AhjAttz3pYR0huXew95nPIj06rj44cJTBP9OQ+ilaTpHC16N58v1ozsu9FcA1iMS4MD+ZxgPBBApJoIKRdQ7dQvkWxKYSv+eGd03xqwR1km82mo4tEP5uNg+MOl8hY0rrXkQtZBZhOca1xNH3VIZxHDg9EFabS2P5gVOHuaf651Qcgz8V+IA+7W8lKKSX4kkCY5ovU2WrYtAGborQH0dxG73RzXVpp7g2kkVWgveny/d4ql2d0h8MSbNdsgKhHMb1DhOh42Ki20NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=613syjA8OqwDU4OEgnlSuqeTpihifMdrZgVrvEM8aQc=;
 b=d934Sm1i8gGuVtc4Vrl4IsiqYcTQdIu15m8oOa4VEDgFLo9S4nh/OlTnHFN1bdJIfRn7789IkVVLqwYKpxG6giQXQLRmMQSYF0/pe23GSDjVvSr2XMBeMkPX5y2fJQ6GbffLxQhH93m4NlHay4powj1Z8fOZTCkNiOvdoDlGaic=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4273.namprd11.prod.outlook.com (2603:10b6:a03:1c9::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 06:22:53 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::341a:eb30:746f:e614]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::341a:eb30:746f:e614%7]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 06:22:53 +0000
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
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.1.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.2.rc1)
Thread-Index: AQHWYZA1MMfE3iel5kWpkbIYRDRksKkeHX9g
Date: Wed, 29 Jul 2020 06:22:53 +0000
Message-ID: <BYAPR11MB36243A6E3626563BFF30D22CE3700@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20200724075804.747FD280D94@debian10-ty-1.yocto.io>
In-Reply-To: <20200724075804.747FD280D94@debian10-ty-1.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [60.48.233.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50dc4a91-f83a-4219-b876-08d83387d3bf
x-ms-traffictypediagnostic: BY5PR11MB4273:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB427301BCA0985AD508D97681E3700@BY5PR11MB4273.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mwp/3jYGFbXXQu/DYyr6ziesOIV2uJP/AdG95nQTcgzbTvsFt0N3jo6qZAMxgq8I2Ig4u6+t28SXp2V+ZfwlZpqwIXxU3xN7AYlYRx//JjbsZc/XbqqSH826Z2qAoAeKiNPWONOrikgqpq4ml9JyYq1KP/Ll4QvMDp/lcd8KRkNNCUK6WabumM2YBuu7cSbGbk8zk9wD10HQ1ZJwkC5Sov4icRu3giYmVf+hvazxM1+sAUx2XlRtfQKiagNSF95iU+dNeop7izTw5bFM/et+f1jN5zBMbqWsw55HFnuvI3I5Apb6qeilDl/aaSO1MmdDzfxQIK2dj4jeLoDad0hArmzL6I63u3okty1s6Dox+OohDCDibVZZJkP6EmgUfE8Iqys/3G3yR2cLXFjIAnYRPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(478600001)(71200400001)(54906003)(2906002)(110136005)(55016002)(66946007)(76116006)(316002)(86362001)(52536014)(186003)(26005)(33656002)(5660300002)(966005)(66446008)(53546011)(6506007)(66556008)(66476007)(83380400001)(64756008)(8936002)(15650500001)(8676002)(7696005)(9686003)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: fOUlKx5M0XXtKY8bxM7UgPFR+HqYEPmEQsVkoh5B6b//SxaQex7XtleCgf/P3099yFv2ueRd2QLjHHcK3sG42hyZbKenREutlhwiSZ1OH2kPJ366OU4iU04JlNiLbRjndOTytB24/htYQPkipseub3DrtJxuiMdYnzIjoZB229iWfwbVFquLdPMCB/bi/n3qPa71hhl51InGEMDxFC2QdEKuwRvZylxwKSlufdBmAjuK+uoE+vr7CGzgd4iAcrmXMLws3rtadlegsSL5SLx2QX1i+ohH3NjbgXp1HIQ7mhfApGEMvIPDoD73PSGHijyBhKCaZvD0Mog85cJrtVmoRxa48WJKofBQxl+hPovHt0gqW5VpZcuHxLGjqRkcdrcG6sthNr1UpPkL80e5wSASwm7D4sJ+VMVknSdqX+pgNUJVg6VGIsCDVlOC7pxhrj36U4DD8+oTvniPed23g7B6PIhY24N7vo2JBvbfmiroa9RHre7Y6Vigr++hgC2HnD5Z
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50dc4a91-f83a-4219-b876-08d83387d3bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 06:22:53.8274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPbYdtrOtHLSTpjlqK2Z2UuBLTX3pJx50rvFALt2DC5Ei2nEh+q9LS2XvImVrVNN8kMVzujvktURg03s3Qd9AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4273
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

This is the QA report for yocto-3.1.2.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects. =20
No new defects are found in this cycle.

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Friday, 24 July, 2020 3:58 PM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>;
> steve@sakoman.com
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.1.2.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.2.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: cc11dfa4eb3616547a8a3909f89da0cc4f35dc57
> meta-arm: 4812a66527e88ebdc5351d5dbd63765abe4abf62
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 77831443738885d33bfa3a738fe6c4f0361e4892
> meta-kernel: 58a589c5aad5417abd099a961e3c1a5b083cdb90
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: ea886d57db917a41a0d106a15e1e96c72d6407b0
> poky: 569b1f5d67c57de957e243997c53ec2f81dc8dfe
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
