Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.4555.1607405776951233163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 21:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=IT1e94NA;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: eb9jdH8JJVLBR2h2PQm4/d26eaCGoqUZaNkn+GIj1XC48aTC/o3jCXIjlD/W20tQKb+tP3pmwa
 5sKHQY/18K/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="161601606"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="161601606"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 21:36:15 -0800
IronPort-SDR: AnaB+gGYSPG2G6A3SmVMa+fizHx/FfzBuMGKEIsx1siTqiE5shT6UeiZnn5XTZM2xRuatM5RuU
 jZThoO7cn6QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; 
   d="scan'208";a="317639732"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2020 21:36:14 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 21:36:14 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 21:36:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 7 Dec 2020 21:36:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 7 Dec 2020 21:36:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxhZHC6/1D08KAWwaZg76lyoAEjXU1PVo++sLJexDxJHXnkrJCFxBUoYCKXnt6xWriA6HbSfRfNkHmlNcgpKR/tLhj/cfEhCD1VZqIfg8cPSxJfBT2i8008RfWT93V+R+DUzx/hArF8GnSReJRxzqO1P9ZoeDLsv9EEEvUDUtiq/+NLKwEvKsQ78FaaZ/ajER0YVeY5SPs6qnJSR98qwDpVD6rsYKzjR0mviMKCGWmAseo4TJuhKr6V2GkyX2bhHha0NxbVmzbXo33tTqSQiKOYX2voIn7WgsnSGgHWmioNRHbK095YWvN7eNMte2N3p+MYi38riGlQeezGEU0bGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oU3J/WPThyu5ZEAfztiIlvON/UvHDjovb1QKFmIdDg=;
 b=jtQlJ+k3jLvkhiqHCODDVZXX0WGEM5Ihiem6B2W0JC3FObQ7YVbES47T5UrNHiJMhoRfxYWXV/3x78Sc2XCDlEqiOVPVYnSer/DzTBDzqpGEBjlnXyBj1VsuuLIr35jr1ReKKL0/UNq9fDI9hhzixx9yODU8TLlnpKOMKSgZIAsUQ4olMG600TtHNE8j1x+xx6iLZ5O4s2OAH6P4ElDURQcJUkSk2ozvD8TuFxD/RqGmPQEnJKB3RCeBNcP50cjfQWkPWXuFwOZeF4sHdB5EHbTf4lmzsGVxMh8TK0LBI3JfA9X6r0T/pwRutndmI/wiXaGY01dF+PPxyCfbOyEz3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oU3J/WPThyu5ZEAfztiIlvON/UvHDjovb1QKFmIdDg=;
 b=IT1e94NAFo0uAf0w6AoCKs/rpQhfrtjkfk0nRGoaHRPqK6GkLVQXcjYDlGtZMwUnZRnVnkmer8zCi2Psuge78bzl++aaOfLnxCgS5aBENN0YDza/KsrOm1mfOLTJEu+0R+1SEp3hT9nhhcuO42TGPwSe3mRZf3LxFTCTDzJjfms=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 05:36:12 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059%6]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 05:36:12 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, "Chan,
 Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"akuster808@gmail.com" <akuster808@gmail.com>, "sjolley.yp.pm@gmail.com"
	<sjolley.yp.pm@gmail.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.2.1.rc2)
Thread-Topic: QA notification for completed autobuilder build
 (yocto-3.2.1.rc2)
Thread-Index: AQHWzPA5Xbk8VGXNK0e2T/ugmkaAyKnsrehA
Date: Tue, 8 Dec 2020 05:36:12 +0000
Message-ID: <BYAPR11MB36244435595B22CC2B791E8BE3CD0@BYAPR11MB3624.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 8d5a8811-6dd3-4d0f-286f-08d89b3b2c8a
x-ms-traffictypediagnostic: BY5PR11MB4370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4370BE6981D2B505C7E20994E3CD0@BY5PR11MB4370.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tc/3yHeB9CipgDxPtyOVsJDHVX/oFfi5uiWdVKHSsvt0sR5L3G+i5rxUwF9TMo/tALpM5k9Eao4+u1jmXebDMraBw4PBp+Uts5B2zLrzssYlv+DAkUHiOIHdGqTu7qCcm3UcTgI7jlQNg2bN3lrcqhEoJWaIMiU9cakfOpQv90vS73Djh3qE06mgxWBF7rmtXY9tnbS23HsdLeV/6VIxvliQBxomY0M1mT/hueiv6GxpNUaituZr5sKGBdbUogkO3T7d8o33/uZ7eZt4dgFphLVKmVqTBiJjjiJ0qqEThekaCz2JywJt81Xb4hvXkydqtxrTkhRaVPjKqYKueECP5gR+k1rGOhz9HEJDa1uMM8WBC+T4Sy0KiuSQEdHk+myCa7e4MpzZyrFFXTj5mEOeuQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(8676002)(9686003)(15650500001)(53546011)(4326008)(186003)(55236004)(6506007)(71200400001)(8936002)(55016002)(83380400001)(33656002)(316002)(966005)(52536014)(7696005)(478600001)(66946007)(5660300002)(110136005)(64756008)(2906002)(76116006)(66556008)(66476007)(54906003)(66446008)(86362001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?14o58+AkqA5dQUb1ZW7vHXoHTWd3VsoAIlzME8X3d42GPQnV3azP8vyqNipk?=
 =?us-ascii?Q?EK7lRIQxj1Jj0ZyOkUvlOi/8PY4FRQ8UiUzP6QabV6pmT578i++Xnjf2tkJr?=
 =?us-ascii?Q?i1OxBw8afaUbS9qybX7vXXIiPmU89745uAaA12e+gCHzB3gjsFCMiXWeG1B4?=
 =?us-ascii?Q?s0cZS3FbziTlVP2wbruUsxtZVMhIBJu/Lz5stvslEmByGL7eVErM7JJCHeVc?=
 =?us-ascii?Q?1p/ZvBUS/gShB5II293ZtEUjhKGnSDzLxatgeR26W0+/itLgic+dTrs8EP5d?=
 =?us-ascii?Q?jEGLns0eY6/dB2xNRF9fHKBcnP4dK5JeqpiitgrljrKzm+jHmWRpY2H3SAoI?=
 =?us-ascii?Q?TVkZH54YuJCsp3U1yZfjhQaNqmVrXsJeaE4BrOT12Me2B+SPN4krwtvu3KDc?=
 =?us-ascii?Q?gHGYuW89qnbbcBKLTr/RAIXmlBrKB0sbqDbMUDVa9LFhLCShNe8tuB3NZ0m1?=
 =?us-ascii?Q?K4QHMtarINovGyUWOxizFGWOJXIsQTtpejo9NshIevpgpD1m/EVo3Ztf0IW6?=
 =?us-ascii?Q?8gOCIGbcmVoH9aGP5z9H6j/+VXBkrIu1VVwlO1UgWPdfadqpoih68GNTakCU?=
 =?us-ascii?Q?fmqbXSNvhC4qm8nzfNub0cipsdM2TkwIulOEkeB16AT8kk/gwQlfOo/MieP3?=
 =?us-ascii?Q?WoOwdLTuAKUUg/hU8ibHCMXw/lndaes60PETzUPY6rHyxTMOHY6/HjL++SgY?=
 =?us-ascii?Q?cH09TsO7xdcX7+I13xJNxqaXX+LxdalIkT3f8LFQPdROgYY7kdiMp2+JNvgn?=
 =?us-ascii?Q?yxHzAepDXQofBKk+t7zJ5mM/wCkFiNaKIJBo/Mu5W4uBgmnGab3Sp0vJ3zLt?=
 =?us-ascii?Q?+Y2FqTxZZoDkT44UWUefNTX6BDjoJPPzYBWp+Jj2iLE0BiPtGdG6tIZU2QFY?=
 =?us-ascii?Q?cZBDKbLuAQb7rCbV48BdkQwrA64nNjMJ7R84FC0w+vv7r5DAPFBG2CFM3W61?=
 =?us-ascii?Q?8vDMcpFUbvKraDEBgK7wkgbwVbLq9T3+ZFW1cus+Ffc=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5a8811-6dd3-4d0f-286f-08d89b3b2c8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 05:36:12.3783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aquCD5NNJdUL2h6wNCRdWqHHFFBwIs1Rx75c2ec8PPd59RGimwZ4SmSuhKk+e44kzOVahQ3+QYE0xo/VtYmgxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.2.1.rc=
2. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. Coffee Lake
3. NUC 7
4. NUC 6
5. Edgerouter
6. Beaglebone

ETA for completion is next Friday, December 11.

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
