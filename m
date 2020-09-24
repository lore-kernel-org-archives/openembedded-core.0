Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.11571.1600934007621698689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2020 00:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=nYFW1+vB;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: O4NQc+ok/qitnuWrp2lSjhah4d1vQGHjL44ilKmmELZu9yBGtUkaubpG2uQXONdsqdWhH/ltUt
 CId7UiegUZgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="141150065"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="141150065"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 00:53:27 -0700
IronPort-SDR: pYJiGDQJoZ5brGMl397sF22e1HouTCaWdIr7WVB3Flqq6BiJAHDstmgdMRc53sNU8ILBr1fHW0
 WBdwvEib0fog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="322879759"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by orsmga002.jf.intel.com with ESMTP; 24 Sep 2020 00:53:26 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 24 Sep 2020 00:53:26 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 24 Sep 2020 00:53:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 24 Sep 2020 00:53:25 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.58) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 24 Sep 2020 00:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmiALfvVTz9IairpHzzolGloDKKEtW0MaR00KfUEj/yjN3fCtmcQORN+2GruBzZogdbFJPtBplR0VUxBtsj+qaHdyE4FL+IKEVKwqTP84ONVAiOxCkwaG4dmMp3S1Xk5LogFfmpA6ZvN86nPzortRwvKQdKcol2NY3vFg0w6+F66PlRxlKq4crGacq7w1J9ISCqAOfJEM3LrmjN4Go+50K1EKehNJZsPbO0iN7UWTCypZ2dL2d983Q7vWMQPVudD+WYCaTiv7w4YSpPA9pa7gjAzRdwo6OPCKr7l25tHbgjrCiSLyXEPqWC/XjvGR/ggRWiIyRa7B80oNygdd6R7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k00ItXQQSPy/gn0B92VfXPW4+a4BRS87tj+9wq/q+EE=;
 b=TYp8B2OV8U0EJkuijSnJpcHAADDdca9DNLfBd+IREaf6NYGzOLmRr3Wbxq479BkcZzNYk3nB6pwVT/iJTnrD/6/q6/qFvVAECNDdZ1vyHPZzBky46PAoDqCUlZjYrqQSFBvKXcMI1rHr4KQnBEgrzlXW2s+8L0Va9xMAv6yTNhgWFabIIlJzUV1XIYqi40Aap5crT4elgTeU15lQK4cYL3/+jtPhrbLtnWMwo3tCYuzQ4j+yW3/z8d6RyhzczT2GDOBTvC72YqB32ujRd6iO8mNMlM5JzwlaXcAiIZ8uRhqBpyxx9RNUs0wRVY+4buQ8BF1oJH3YwYMCMgkIxf0Fmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k00ItXQQSPy/gn0B92VfXPW4+a4BRS87tj+9wq/q+EE=;
 b=nYFW1+vB+kme5VAacgzZxAtbK7VW8MVw00I3eL0qJ0Aizpv+2tIUZjBrQTcVDX3y4ipWr8gu8Z0k+CTD1RVQwegHHN0Xl3ERM/LsiLwQKqDxKNp2qNaGV5cjQdftliTbSwkTC3VaKmckBZnf1UxwPcXHWKdYMLsJgg3GckV+/6M=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4259.namprd11.prod.outlook.com (2603:10b6:a03:1be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 07:53:21 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::86c:9bbb:7b9f:c30d]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::86c:9bbb:7b9f:c30d%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 07:53:20 +0000
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
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.2_M3.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.2_M3.rc2)
Thread-Index: AQHWkiIAbRWWDKEoxUSfO6Qk6vClN6l3arzg
Date: Thu, 24 Sep 2020 07:53:20 +0000
Message-ID: <BYAPR11MB362456361F2DC186886234DAE3390@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20200924032241.1A6EF3A07BF@ubuntu2004-ty-2.yocto.io>
In-Reply-To: <20200924032241.1A6EF3A07BF@ubuntu2004-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 439e3001-c83d-479d-34a9-08d8605ee814
x-ms-traffictypediagnostic: BY5PR11MB4259:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB42593F12396DE20959467ACAE3390@BY5PR11MB4259.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BRRgF/iGHToQK/vx2BkOI01q5YwyI/Kih9e38geW7t8ocZ/JjQs5skFNNPFeu1coF+sqlp/IdVLuO9D+JGdRjfKFHJ9ZkHqE1X37bj7bXOTKOPEZfrY3fBmV9k24tr9ou3KMDclEN1Cih6b1FnHyasdkcIe3Pf37Oj9hU0QgeuQ84TElLZJPImPfj986tnAam4tkspHwyZFO7g/XhnmU8kcbQsD7JBFBb8VGqdH7Nllg8XHYometGrYZgpYDDz27HEXtBPVr0UOgg1r3vwazh+cmbGpAQgN/vRwbkuDf6+MSSQYEALfL84Dc09navX4Eu8xBnb+x77d8n44ksytO8+AxnVDorGCEM+sSTHNsI/c2UcIg3LaoRQ572Q9iXRY02J1erU7DwmvuCJ2C+VPnRr9rmVssO//j5JDGyU2SglOVwD//yW/EjCdlPS+N4Yug6ByMtmCA3EGlN5Yik0xVqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(316002)(478600001)(8936002)(7696005)(71200400001)(110136005)(33656002)(26005)(54906003)(9686003)(4326008)(83380400001)(186003)(55016002)(966005)(64756008)(66556008)(66446008)(76116006)(66476007)(53546011)(8676002)(6506007)(52536014)(15650500001)(66946007)(5660300002)(2906002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: PzWp3i5fEnn0iluTqzvntzShJOkOUkvd/fNs7+aVGX0Ccgzzx9vN4gM1oZW644sU6o+20Xt+8qZKdSOeeD4HfqyCVAeZtd9Lv0lWqlt0S6k/iC+UwFBT4A3a2PWGZhd5w1XZ+UjhnS5cX/jSR8Ezt+vohHlnowSMNH5XsT39RpRhNQwM6c4v8UQwj2x+NUXnGWGMYZTTaGHkauSljWbweKrxjBlctiKVZAFdpbpiUJDAUrBqIPrO4g6F4J7STP63TLPpMbZzpMTvV2r+dPDj/8f36lpMvTtVgIxYyVthy7g3pmM4pyEFOEOp37ocXZg9ZQw1SL2ayNStoHbF5nUo3Mpgs9POGyfzWsJQ8LOVK5IxMqXNQBNUociZYoAf+MnjEgkyt7fT9/TXYeIGSDlElp8JFMw/dIPYQsaehtWge2af/IJXDrUe+tLiLV2fs29grNM6vVLpIfIvdXsO7/amJQjTiuKtQq+AzpkHCWLZxfhDvni27GFdkIqNCxrm9095IcQGu+1f9VdSrpN1mC8svm4BsD7kpOgWJlP5oSLKaJkjmBEX2NZr8Wtj6WTd3F/ZUBdz2dvOS+G/hqwlIJ+rUWDpC3dGYV4FHCOJXAkR/auljbX5cqXH/yR99MCIPNQrp0ak3k1tyPoxvK5kU6e8Gw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439e3001-c83d-479d-34a9-08d8605ee814
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 07:53:20.8166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E5eRK4SowsEfaj/33c895jxsCdT7EdomUjg4nvvvutBESjFOl8zW16uUvxVIOxW8tZR0hQS836oz6k+mDPJ0kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4259
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.2_M3.r=
c2.
We are planning to execute following tests for this cycle:

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

ETA for completion is next Monday, September 28.

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Thursday, 24 September, 2020 11:23 AM
> To: yocto@lists.yoctoproject.org
> Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.2_M3.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.2_M3.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2_M3.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 27b53186fa67d281d29b2f8e15bcff8dc2557b8a
> meta-arm: c7a1a5f9fd415e3ae1078c2a1d6af9c25e9e6498
> meta-gplv2: a8da8eb127a56561bf633ab53bec57fb5dbba537
> meta-intel: 254e3a79b3a37045f829848e0a5e04801bec1439
> meta-kernel: cb7f0dc5bb1ea0998c8d4fcb486148d4cab575f4
> meta-mingw: f1e1d5a803a48ed70f2b0eaf0ef15ade70479fce
> oecore: e68df923e1bf9e82662ee2619ac9e2f239e8f7be
> poky: 0a243cd21263f498b6eca7c0b168e655dd823e22
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
