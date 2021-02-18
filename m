Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.2331.1613620497822527291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=waZDoVYh;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: sPmbJKMo2ZX7ueAqBj+hNgtD+RkK5gjKNIGIJzvUsvd6WQvBTvwy89OBy9R+q3olOoZHXO+Mhl
 hn6kp7deWxeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="170526256"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="170526256"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 19:54:56 -0800
IronPort-SDR: eBbun17DqXg7j3Vonu7YBcuK6ynTwXmiJPaEy1R8aIPVPwEny4XBvjqv+eXEVaCrSLCQSnXuY0
 HhyMvH1IQuMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="427014317"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2021 19:54:56 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Feb 2021 19:54:55 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Feb 2021 19:54:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 17 Feb 2021 19:54:52 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 17 Feb 2021 19:54:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIsJIDgmvMhrP4eL8CVDkqQDyo1Smz0QOm2hWmPfCYmQ34DqgTSw2cS0IwIG0jccNP12LHteKA9/QMfC2BMUoz9gs18Ftv0WckDzie+H9yQ2014zQQ6XLoVroyNoVK+RpPQhkHHR4swWQz8CafdLCrZ4VFVPYz7hst25d3TpZxSCOOkoTNEei7/TJQxKgQLKtW21YwtcIM4P5sTXQ2J6R8AcQOxCBWjEu6HW3rLEVmbqetkX5F+zdS49F1mPE4ryExbXz6JzJ/imZLqDQZJjmdKepkupbDlZKtRTJ/qLLy0T8zz4WgOCmpNDGiK5KF7RZzEG2zOGsxqaHikdzYq+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwNjwlDiN53NPoyHqhlnPVBmb6X/xTHasE0hbuYA418=;
 b=g1tOCaYui4v8Sqzok2QxfLrnf8d2SZMjSFtU/NQmQ3LMHrinAE+8FJFlyoE6GfFNCSyjkYb/rR4UdJWKJVjaZyAXaWS6XBnKOBIQ0aXIAfMur8CL0IvjwC8BL1C7F6yqyRQdPDoQZ56/3+tPET0IkrdpyZeWIYUM7sSG+TLn+CeN0vS6JJwdPHLSoUxb4GEa8TIRzaSXce5FRJzKTtqr4pW43t3bXRh4rFFSK9M7nFkyzFl0Uj9KHnkdBU4T9TNqBRNCaMEB/toD5SDRRIPrWQdV7z8otqp0AfexZFPhn0kHZMU1CkCcYsjWkoIpQboiP5+Q2pGyaIDD/Y4xuHwJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwNjwlDiN53NPoyHqhlnPVBmb6X/xTHasE0hbuYA418=;
 b=waZDoVYhuY2E430scUpCYORpfeQ24KmqOyH/R30bbVno40sY/1TwbX5k4jbdNPS+tmxt7N2vG5C9buqxATrKyfBp80+6kMkKikNj2jmyzM3eM9v9uR/UiF4NOmjqO32Z7GE+3k5N8ew+qX1a9Oq1wXOEUXJaW6uclnysOZL0yNs=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Thu, 18 Feb
 2021 03:54:51 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3868.028; Thu, 18 Feb 2021
 03:54:51 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.2.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.2.2.rc1)
Thread-Index: AQHXBItgdl1jr4MEQU+S6zcoyxPJyqpdSebQ
Date: Thu, 18 Feb 2021 03:54:51 +0000
Message-ID: <BYAPR11MB3624BE9ABC3060582DF54E14E3859@BYAPR11MB3624.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 492ec483-555a-4f2c-f6c9-08d8d3c0f183
x-ms-traffictypediagnostic: BYAPR11MB3447:
x-microsoft-antispam-prvs: <BYAPR11MB3447EE9EBE504FF7E6AB81D2E3859@BYAPR11MB3447.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HPGV8ZddQqHIuZqKgIvylCEoua4ZtEHLRElRvtc66ny3eK0KRfPnXictd9+eAGEPqNCwkKQSWxscE/F4TaMQ4kkwQ74Mc0A6HSB7JWB123bA3OS24S65/CiZq8396Mwc0gylMR5Gv31UIL91+ZwTjYTVdMuLBhwAFCMuZHmPWRdvD0VMwbiS8gkGMHmqx7KwbhOx9Q9zSqhTrCkjTZi5cLxOZn5ZBGk0o8YSS17+3cIOQR0K0JmsgG3kMKQ70viNTJqIDv8jg03OHL9GordKW1oUnEpZNK0yVfgl68RHRYOjb4w5t8J21n33oJTBofVxsnFz3mooytmp26ShFFNwfQkvrw+vg0//NKZUBke87VIvY+Tu//dxgZE23rcPaNZonMxv6RCaoOztWml/BeKeaXB7s4VV5TvPKZ5HjeyMYAeJH1C1ZDzNT7xaYIk5Q6g/Oc3JN2J4tryri8vNkyn62Ig6RYo2bIPZpjBBpsFzWTz0dXjQ1sGcAfMb1qR9fqVc3jZZNbraQFzzRSZQxDp7j1bRPqMaLhjsjG4aypSXs85+qSejX/BK6j4Xzf2TcOffIH+dBI5RuUzONMKjJ8puBTObASy1kN4/YFd275zWgro=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39860400002)(64756008)(83380400001)(66556008)(66476007)(7696005)(66446008)(186003)(55016002)(26005)(33656002)(478600001)(316002)(9686003)(4326008)(53546011)(86362001)(15650500001)(5660300002)(2906002)(66946007)(71200400001)(52536014)(8676002)(6506007)(966005)(110136005)(76116006)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?uqjF6QaPOaOXxKpB0RlCkpSFeUNuzfOZPd2HSp+EiTDvup0zE8TJIJ9ZeM2I?=
 =?us-ascii?Q?z5EdzWZvlponMvZs/+5c40lkdBjO85oSpkCw6gmBc6N+TiwNcOUMn+BCSRhQ?=
 =?us-ascii?Q?KU3qfcBxdB8q8PSxgqXMmes5KmaIEJr2VoJbZVmmkSgJNiB5kQg+K8JDBJd8?=
 =?us-ascii?Q?lq8YwABCvGEyxlfaOyI+XJjHUEt4tQQUWsgvUhBg5t92ox1YdL5YGjERLq7H?=
 =?us-ascii?Q?+F37MtDxDp5R8x4zydb358HTzMNO1k1tOLJ5I7KffrlC7mGWrrITTEL41L5u?=
 =?us-ascii?Q?krOv3HgtY+ei6352e37i9lzcY0f0SkmbMhgouWOFwkvFM4M0MmWoPkt8kPTt?=
 =?us-ascii?Q?Gt+cataBNE6pXbcU5BCq1TwIxCIS3ya8lLusOpe0paoZMPviXdM7TYukiaz5?=
 =?us-ascii?Q?Chxlod2jAirThrTSMHucrB2f4qxoHkfd3XYLBaKxCKFX3Gc0e2/0K/mt96q1?=
 =?us-ascii?Q?rmszvwgNaqNI9RMnnKhvY3xFkSS83MfrozGlS+K0zh1nriAk53u0kMvFPRwh?=
 =?us-ascii?Q?Pxv3H8Br0OjcPVj2oeUUWwoBwjEFmBrrCl6X4Mt9PTKnPi9SoFYnkMyKOOCk?=
 =?us-ascii?Q?I06FEDOq/gJIcL5hpDyRth3LQyjLnUJLr3bEhcc8JAHgK0gsxIpBwT/J3Mhj?=
 =?us-ascii?Q?GVkPHjomwMOY+AhojKqfzcklO5Tz0Q/002uV7Gytlh4vqYpKbEySteN5DVRC?=
 =?us-ascii?Q?Pxj/nZ5ix9iY0lE803V3OgJTgfHhm7ReswEgnuGHBsRf7KESKlea+57iOrq7?=
 =?us-ascii?Q?k5CgUJW7TC/rumDYfkH7XTeCphxeXE3XXFywK89osL4juELRf3L0+Gvb2i11?=
 =?us-ascii?Q?OYWoQjqGDhYn/oL1/rxbjSIGQQw4ge++yZmRfcoG6WtbMDcsFYMluhIwV42H?=
 =?us-ascii?Q?FnzJjouycKHNtz8a4wbH4qMeu8EX5LAOaHtDwZNLSW96tLkdK0j0ZPe8LDmI?=
 =?us-ascii?Q?wCcTegtY4jEdC0qATmqLq6/t0Eix/JEYoElnyy1JNmR0DQa91rrE9gTVr1HX?=
 =?us-ascii?Q?dYYdL3cKr70B2vuBRDxWiol0mq3GeOYBRkNnwViok7QboGT8fE4hRH0IDAby?=
 =?us-ascii?Q?xk2pDgylpCzeTX2h2W63DJfxlQ3mrlv8kHf28uh/TTmfQYvcuC8D8D4Y+l7R?=
 =?us-ascii?Q?VPThucNU5JWad0XfWSauRfozzt1RysC8QoRIuP61daWQlTvj6fTArKV2fkc6?=
 =?us-ascii?Q?wJvlwRBwUJH7vpDr/g42OlqkxPMgTXVktLdqc3JFP9gMWjfoaRdRkpBL2sBv?=
 =?us-ascii?Q?G35U42EwE8hXJCR/1AsanB2zouOted7buOA4bKg712udbClNi/EONSlqgmQk?=
 =?us-ascii?Q?b2IEsE9JBbuLuaICGIx01hgQ?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492ec483-555a-4f2c-f6c9-08d8d3c0f183
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 03:54:51.1324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ax5LAyafeEcX2p1jsvXs6av9HJV8LBOek6CRUbVqumatROBCD7/CCFwlj+IEZjBaLiaT7njRO/fgzhsHbGXw2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.2.2.rc=
1. We are planning to execute following tests for this cycle:

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

ETA for completion is next Monday, February 22.

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
