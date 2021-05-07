Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.7256.1620375661042849944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 01:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=TkOSr2vZ;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: EuWJpzrZrgMhK94ZjGPzX3YMmr6eA7RQnmHVEt74sq5PyiARMPzvdRXNpCf0+ISytUGKHBsul1
 vuvK0/SeKzzw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="259955512"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="scan'208";a="259955512"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 01:20:59 -0700
IronPort-SDR: mxAjxPTua7atIESUudrqv5TFkxVUKwPvqm7M0tHmiKZMMmdonnTIV5maMFbJjGITc2tjiSwNjF
 iR0aKhh56gNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; 
   d="scan'208";a="620025423"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP; 07 May 2021 01:20:59 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 7 May 2021 01:20:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 7 May 2021 01:20:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 7 May 2021 01:20:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 7 May 2021 01:20:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLBWaE6zySsMbsr+cOYVPPZ+tq6W7EoysGTL6JAAHlgmiTCACqlC1FfX3aoNYOWB8mHTi+ouhrFtDtzMaMF8gGTmz1cRIu9JDFJcLo+lwQNOJo0GQTrrjyHjCNlIEan96Xz3SBGM7UqiqOdPSuxDkz0lTS8ilZR7UM3YxarQGxjeyggJB2Q6SP8bN2Qgd9/ibeV82eE4M0Z9KJctewUWAqhhLkEh1QUdFCNxm8llL+nJoKeWV9lLEItamKtKZBFoH4iUd2Z5o354/IkVlsdhDYh1FrQERtP3XH3KVrYNNQ0etBTdQzoG29Fg/nyeCyCxyliwwzEwblNo2hou0k6Mlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr1TT1TUdztL1jULi7eshEFVjTynO4cL3fjsZFeJrvE=;
 b=T/8olug5u31o8HDsokW4VjouuqlWhHJBaOCsShokHqPQjctUNfjEEP/kteobOHPWIBvEHTtXbJjpq9NHMoG5lx9jpkretyX3UYOz5ZwcJHeDPJqWfl7J6kDzW7Vmjhai8Y2n5qZJDdEgSI6TxPK0NUhA0pjuORpa1MGXsK88TmrrBl9dMsjd9+Mygl/WXEfuHDxJg5crjN6/AUUbvBbyrGxQ17XRc3HUykIqK4rLiQKLhEOWTqEOvsWc0BXXCjYXFHgbCcYpodK7xZLa2Hl93ca4No9gzExxSj0S/xOC+aL/mu2DylTYxrRvBsjUUQ6+CcwKdh4uZWe/fJP4G7KFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr1TT1TUdztL1jULi7eshEFVjTynO4cL3fjsZFeJrvE=;
 b=TkOSr2vZmYE/xph0Ey3poQTokh/QLrD0etJoyd4Jx6cAWm1zaNi2jqayB+nDi4J/Q5OjO0J+epBQ/pC3Tj/X/K+k1HqIxL3iaskwYSnq0+TGEaLfQX3S3lYHzLrKjhnZwYIGO8R7EWwThtYW0Oq8gZsKHPIwPbthsXjA7c5gAVU=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 08:20:57 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::ed3d:ed46:9fd1:3d10]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::ed3d:ed46:9fd1:3d10%5]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 08:20:57 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.2.4.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.2.4.rc1)
Thread-Index: AQHXQpH3CbxwtyK+T0q+NGow23tKRKrXrm6g
Date: Fri, 7 May 2021 08:20:57 +0000
Message-ID: <BYAPR11MB3624A2D3E98CF8AEAC230F01E3579@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210506160550.3455E3A0321@ubuntu2004-ty-2.yocto.io>
In-Reply-To: <20210506160550.3455E3A0321@ubuntu2004-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 925af456-54b1-40b7-73f6-08d911310a57
x-ms-traffictypediagnostic: SJ0PR11MB4829:
x-microsoft-antispam-prvs: <SJ0PR11MB4829428E7753DAAD2B7800CDE3579@SJ0PR11MB4829.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G+2AsvTWfd5wwapgTZQEcZenE8rprE2NrHvj9sTIISWdQYchHKhDnfOusu/qEylL8u8Fm/DWEiaaKoJJu9UZJdhekkz9toXKwhe+t/5CWid6YUd6k1SDS1PR/UchHKW+bQOAWkimQoNKXGrwWDu6SHadl80lNsaSbDIVYfddH+u7vDeH3HwREqlBMzHS3yHqtIh2HS9EFu9dP/uS27Kt4f+4na7NX4jHf8byW34iOTdkUoUgUZL22wsUxAxCzrPIiiARov8zHDvRmit13AnwPu56FTFi4wMwMjQGcbuPgq4lEUR0v5K441Vkzxc9UmfYpdmfojPJ5WopnujDiPpYX8JmufIC2N+LB99gEYRcwYrthLxluN4VyLZ/qjFln5T2V5X+/0jrmP/oOCYmbnN82k5zHhGYp/T9iz6+D/5C+dMreK5rcdPUQDbi5eXV2bfIKjxibKjn7L8cz+4T+oCbQXSfCtmiyNx4aPnOccz7ONBUGWehOLjFbI2plvbjCSAiXMj4ZrJk+H4i7WA4pG0n2iwNLiCNCxb45+FyjQj4BY3wSK/JC4oI2i/ia5Q9G/fhOGM8aeh7oNJPu8I1w7C3paY0dxvRMh1P8f/zwI730aMTZNoyNDMwgBxFgfgRou6PDlH621l5qXOhsJ+mdfIeAtZFlkhJt5BqlQuoprgdiBR9EExxnXZvdJmbG9xmQ4d7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(39850400004)(396003)(346002)(7696005)(38100700002)(186003)(83380400001)(52536014)(76116006)(122000001)(478600001)(64756008)(53546011)(66446008)(966005)(66946007)(66556008)(9686003)(55016002)(5660300002)(6506007)(71200400001)(86362001)(8676002)(33656002)(316002)(26005)(2906002)(15650500001)(66476007)(8936002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?KizcEt81De0LW26MFcmT752lp4KeA26n9ELrcCAl/HfplqHpwRWehg8cgeTt?=
 =?us-ascii?Q?kQjO3H/qkapM+9zHcSuFLjHiEwU/8Ey88BkKXv5HA4DBEeby4qPuT9k3Gm7L?=
 =?us-ascii?Q?hSQ127+7q4p7jGTHwH3EerrEdyAMIpIeVwl6fxXkzukqvG0l6+CN773uXCYe?=
 =?us-ascii?Q?Rni6ULVZSEjlCOds84j9NRhgGVhhWkU33ZxOoUcOmQKL9HB/avlPckpakGNW?=
 =?us-ascii?Q?rLE8NZiAIvJovS8Y7VNcbkLWwQD5whr94SMIogxxkgrLkN6bCLWh4JqBM9OD?=
 =?us-ascii?Q?qAyl1/SKQuZLwlg2ae3u/TJSRr3wcxQLFEeA+K61RH2XcLqZFCLMJjUtiagC?=
 =?us-ascii?Q?40GkvQAgMKH9N6C4FDPK/xogXJR//KGK2Z7tKXGfFkhoQkj/WQdQLUTn3E5F?=
 =?us-ascii?Q?KAsyHClkwS2+BFX1FoSxuxz5EbdVHYpO8GHDN72p8JbDlE9go6f5Lq3kA8lP?=
 =?us-ascii?Q?oxxtNLbN5eIN1o2E86CRmTCTIqKROmhcq76GgghvwX62cERJDbe64Uf9s0rN?=
 =?us-ascii?Q?fv/gXtKLzkP9P7fchvzTgMJjtaWzNDLgt3AohbiFYsOD+KExEXHKp4WRe7Ay?=
 =?us-ascii?Q?1XK3HPyh4C6vZ24YNVYO8YuuSlGy96FoxM+KaQ5JFUbyBHY3ACipJMeK6iTq?=
 =?us-ascii?Q?q0ruRgfpNqQJ8NB8SG0dWiwMuk+aBkoLfB5kql+CftaIZ/VY1fXPsJwF/4RE?=
 =?us-ascii?Q?j84qspes/1Fvxa/5gJtyALx2pbYHpwGPcOqnRrOY5EBg35Ly+BqkAmWS+mud?=
 =?us-ascii?Q?A/8ss4wQJkXUkM5LRM7+t4iBainh44OdoJl0CBzWdQhiIaio49yluXeR7YQ4?=
 =?us-ascii?Q?jNFKAjN1MyVAna0ws1IKqd3fVqzxtIh4Ms9ikPShfY9cloTJgoc+zmX3W1Jk?=
 =?us-ascii?Q?iNbEHJfgTvinsg5ZVvUzWY1dan2B0wx5hUheykJ0D336ddotRjxfKX7Pgm4q?=
 =?us-ascii?Q?1SEHbWgiWJ+4dHObc26NgAHLQaxNZbkJFTXfHVwC9jcCVixAW8jf6eZXH+A9?=
 =?us-ascii?Q?sAvcdS+W742CN7j40ORplDmd4EuZiqoANemZMx9FqFhGwu3EUT0KsoaopaDX?=
 =?us-ascii?Q?99NyMrUbpO1gTnOcMXo+xR1JX3P23C8TfgfjnL/WMONd3PTjpvRRZCHpAT5L?=
 =?us-ascii?Q?PQEAMYuTlFXd5b2sd1k6Ijq/8yZmlkzlCOvL9smUVc3Oc7YGhsBgd4EnryLw?=
 =?us-ascii?Q?D/wbswIEsCc6iikpheeFV1yXK8+OWklX6IHo0RqSNSWMKUMKZ2dizC2dBoMN?=
 =?us-ascii?Q?IazhhjsS9jYGpFXCh6HHaXL7hTdqiTcLIi8i1fRnx18aK+3SDDelq2BIUIwf?=
 =?us-ascii?Q?WgaR22BxPiMHj49+X2teGARN?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925af456-54b1-40b7-73f6-08d911310a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 08:20:57.3409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWQw5vv7pMTX951aR4gs2mIAbESAZdvNadnn/e8FAJhgXqr3+SeYHxGSAIjOa/ViiYy8ugduupGOCYpDDiKiuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.2.4.r=
c1. We are planning to execute following tests for this cycle:

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

ETA for completion is next Wednesday, 12 May

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Friday, 7 May, 2021 12:06 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.2.4.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.2.4.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: e05d79a6ed92c9ce17b90fd5fb6186898a7b3bf8
> meta-arm: 39bc4076b2d9a662111beaa0621ee9c1e37f56ea
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: c325d3e2eab9952dc175a38f31b78fecdcdd0fcc
> meta-kernel: 4b288396eff43fe9b1a233aed1ce9b48329a2eb6
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: d47b7cdc3508343349f3bb3eacb2dc3227dd94d2
> poky: 60c8482769f38a4db6f38d525405c887794511a9
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

