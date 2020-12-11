Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.2379.1607663566851416892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 21:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=WEFBSrAR;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: IOOKNLCoSARa3GIZurs/O6gruCVdhLhTbzyr0pNBjKfQPV/YN1Hlnjdw4FDealK7/0bmwZVSWt
 dqHpKzFD5z/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174495411"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="174495411"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 21:12:45 -0800
IronPort-SDR: IW4VoGNK0JfoDMJdbHTfx9SlscaZoc3VtvBOGlUmGC/NptBJFOrVM8zeFDQG5TlNroI8YCZXOs
 0xvzIO0OAy6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; 
   d="scan'208";a="365255961"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2020 21:12:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Dec 2020 21:12:44 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Dec 2020 21:12:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Dec 2020 21:12:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 10 Dec 2020 21:12:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adE60/qoUrRk6YTpnKqDH6r/2GwzuIPK4qqjfxCHZsqCbZMFU7/xrX+gL/Szhh11Oy0tJY1tzIH6ejs6ic/GbhCorU2puThQKpaVcknTohOAJePJp/zH54iBBgvzAKYl9i/VGgoyADWFl6P1wB5X+tgBUIQlrn+8txIyqRXZrzOH0X3RSC/mEem+Qq0xT7VCDh+isdbW+s2aAZM/92xcvxLNYCA0xWDvc3e9m39M+y7e2hJ7dyDwDse4Ez2gq6Xg1EncTtedkRMdQRo6ia0A9vJaWXEJJ/EDZUhAPL/NBFiugQaLyrvmS5ehuq+HnfSefCpCO8swJjhmu/PtC2eQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCIdFmWKhuoGUXxUaNvTOiDDukcTID9ykaN2zrj83HE=;
 b=LijmvwxIE5KBmtzr346ufmeqfcFEZybxRiTkUqcrihQIC5FPG9NrBjezmdVoazogl6b2XdV7jJpqXmn4My7DD6OocVKJ129T3Jr0PIMmrNjRNw7iFPJyOnMITorL1rtxQaalqKmRjHXZpOHPMaqrD6TqSCWQTE1ysKsw10wepHKcQKquwilyGnM56ZV9nyl0LuoN3de11VeBqPzcipXDX7c/s/qVPrWFTT2aCsICPn+mKYORr8E3V6CD5zipjJl+OECvgNod9RQf+OZmAX8mteFamO4cG9L4e+ar21jHjUXhHpAW0F8puhm1MvzHCaIDu0/ByIwOYIs47IYL3exB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCIdFmWKhuoGUXxUaNvTOiDDukcTID9ykaN2zrj83HE=;
 b=WEFBSrARL+MQHSxckVVeh1/i3wQgPempBkrdQEfJp7QCsMIZluMffbyGP5TXvwibCF7hysM5JTa1H+iskqLvy4RyOL3D4pSDadkY58cfwqKN/4bQV9vSE2I7gols0BBzi9j/SgkvAN18Qimzfgd2wybsdM7Hg9W60hrwsYGcvBY=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 05:12:33 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059%6]) with mapi id 15.20.3654.015; Fri, 11 Dec 2020
 05:12:33 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Chan, Aaron Chun Yew"
	<aaron.chun.yew.chan@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	"Teoh, Jay Shen" <jay.shen.teoh@intel.com>, "Tummalapalli, Vineela"
	<vineela.tummalapalli@intel.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.2.1.rc2)
Thread-Topic: QA notification for completed autobuilder build
 (yocto-3.2.1.rc2)
Thread-Index: AQHWzPA5Xbk8VGXNK0e2T/ugmkaAyKnxXjvQ
Date: Fri, 11 Dec 2020 05:12:33 +0000
Message-ID: <BYAPR11MB3624F05F4513CDAC27E2E1F3E3CA0@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20201207232504.27A422A066A@ubuntu1804-ty-2.yocto.io>
In-Reply-To: <20201207232504.27A422A066A@ubuntu1804-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 05f0cb36-3537-4964-75ad-08d89d935dcd
x-ms-traffictypediagnostic: BYAPR11MB3063:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3063787E34E1E8916FD9A5E7E3CA0@BYAPR11MB3063.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pXvNzBKxDTDO+6avf6IR21n4PZw4balkGGZNm4B64XmNGFfVe7WP15u4I30Qtq2Xwl8WsW90pXn0fYv2/P7kFW/G8tjhtEvR2E5AEPULbc0UQi0Zr1YTmFRvIzcEuQ+G8/aDxdsh1aEG6h5MgmQzUTZ+mFwAg6UkR6Tl5moSEI9M/X74UPOR2rgB0l/JkSXHw6YrAzFWr6elcIqgShT5dD/aDm6KA7jFFUTeVbaQz2zOjxl/sj2vKkkGPsRxuaQv7QIjkmy8IwW+ZHxEkQptnIc/CD4aPLJlrM5j/08ZXeJgmKxGNDmDuGA2hTA8oAABsIC9OF/QeFlIcx4yix3cwmw+RsVtEvNlsfcKYz/ll+G8XPko+7R+rQMuShpooBKdlYQvUgonf5jwcWGPC5yMKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(66476007)(66946007)(4326008)(66556008)(64756008)(76116006)(9686003)(33656002)(8676002)(2906002)(508600001)(86362001)(966005)(71200400001)(66446008)(110136005)(107886003)(53546011)(55236004)(6506007)(52536014)(7696005)(15650500001)(5660300002)(55016002)(8936002)(186003)(26005)(83380400001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?71d+I+niTByw6BH5dn82jwPByC5XHwPnpXMjeJm32C2tEisk8bhMSSA2uKFy?=
 =?us-ascii?Q?gP7gO7xy0ssd8xn2XF4jZVm1rrKhLg9jyd75qBAiWmHOuxkV7eNWJMubRUO+?=
 =?us-ascii?Q?tAQwzcTXtzuUE4q+uiObCz5olHkahDZrtVztRH+z1wUdReSzsu763+nthAGy?=
 =?us-ascii?Q?HNfLjzNR93B4TVBDlp1p7l2aJJCZ2ikJTtCauuuNXMr6mlq3HQ5glp6kQL4H?=
 =?us-ascii?Q?o6aK31Ow4iXspxW05s+Jj8JFOkKHxTfu+1fVbksFoFQ2UjFur2UKw9kGA0kE?=
 =?us-ascii?Q?69xinjXnubb9OQ4kvjz0dL7nZkTZEc9SpVT1fZgPtC2cOnxHx4kg6fhGlD/h?=
 =?us-ascii?Q?WkCuvbbtN0lL5C2iEoTuTjldwRgAKBIDTJD1rM8cgYI6474OaCngpcYGgl0z?=
 =?us-ascii?Q?MoapwgMsfwPmDR9X3WE35eIAMbtORyFMXWk1Uf/brhxK1CwSTP16lgRUogqr?=
 =?us-ascii?Q?NAy0/DXOsNlHUaTMIsvZ0lvOUMnVgrws3LEoz+qG0kNHLlD6B3CaXK5nIQRP?=
 =?us-ascii?Q?iQPC1+6CyK/JXQsQKEXEHc3TTS5vn7UsDyFRPRGFnNjqv1IMdZBC2zTRPB3i?=
 =?us-ascii?Q?FtGOupRECEVRij0q+ff6Q3uTI7W99zIOiFe9zx4oVh0bniKHmR+sTPPlFgKi?=
 =?us-ascii?Q?KnjxbSz6pa273MfPy8ZWp+vXMo3SjFg9TdzzjKeIOroYy0pBOhdnG1cKnKeu?=
 =?us-ascii?Q?8j/b9gl49l2F08ZluBLMTrb38/flv/hAEltlfJ+zldONhA6AXxoIx98tvEQf?=
 =?us-ascii?Q?hnFpkyceCaahc/xMicMa66KlAUykclXkyai35u4BQ9DcgfHF+xrw4ImwLpRf?=
 =?us-ascii?Q?ld3ksKJ2fSO26lrGTXbL1o1ETpFd+rrYlbh7EYS4U2IT6XWs21eQ9n0sXpOy?=
 =?us-ascii?Q?+rDdv/AmCMRZCj6x+rdB3379pbrY5ZB3p0c+4Y6jaSdI9q6phAwSKFpZm1u3?=
 =?us-ascii?Q?RXZ5d0QeG5brclcJsPOtuYAW4gl+yz+U5dokHmw/Pko=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f0cb36-3537-4964-75ad-08d89d935dcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 05:12:33.0935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3CkO+Hs3kgtiJ9pQjXM55m5GIGKXTG6KMLCrCzPrQFYIJ6l8D+ox+xwT+aL7XFo3/HvCP8o7Hv2aeUcCOvsdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3063
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,

This is the full report for yocto-3.2.1.rc2: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.=20

No new issues found=20

  =20
Existing bugs observed in this release:

BUG id:14051 - [QA 3.2 M3 RC1] failure in ptest : valgrind.drd and valgrind=
.helgrind
 =20
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14051


Thanks,
Sangeeta

> -----Original Message-----
> From: Pokybuild User <pokybuild@ubuntu1804-ty-2.yocto.io>
> Sent: Tuesday, 8 December, 2020 7:25 AM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>
> Subject: QA notification for completed autobuilder build (yocto-3.2.1.rc2=
)
>=20
>=20
> A build flagged for QA (yocto-3.2.1.rc2) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.1.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: fec2b85689bba1d26ad6f376bc11cc29bb27cbe5
> meta-arm: afa281b7a997bf265bfe221d1693a8a5bd4a243d
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 5492270c796daf8b7a7cc9cd93880c2bb25523c0
> meta-kernel: f9d30c65d08c9cef20d6487a7aff0fff40acc823
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: d11ab9cb77bf91f939035417b757773a5d80242c
> poky: 943ef2fad8428f002850e3655a3312e13d0dcb2c
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
