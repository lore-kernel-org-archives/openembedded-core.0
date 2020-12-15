Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.7643.1608015242999914570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 22:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=v6PSlxES;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: A3+E195m9DQL0G2s4o/PTeOvAx9uDx8eByRiptmirF48BUcuTllYSaxRcWPfxJuU6UZZHUhoPO
 uTHC7cCygKQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="236420511"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="236420511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 22:54:01 -0800
IronPort-SDR: P3DpeHLcru+abbKPSWWcJvPftWq+gHPdSlqlQxWeKR0sO2eUUupZg8lfUCnPXlIwDfm2dbUEai
 ARtY17TIsb7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="556575483"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2020 22:54:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 22:54:01 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 22:54:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 14 Dec 2020 22:54:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 14 Dec 2020 22:53:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHVevahv8s3lp3mnjLRrGk4vULC/zd6NIRa3ITXIm9SIVrbEYMDcO0EyYK/2PhfQuEndJknhpJLtwAMaO4wfNdBqE8+EgAZZBiEEa7vwLsmDI8D/S/X7HNYLIWJSvDT6GSJx/MC/Uiy7ZmusAMjf1VQWLlbl67tbpMyF9firWjmKUrinbLw4PP798WFyGwqn7br6V7MTsLPJ6Sgi2yC7mM585wGczcVxZthrwKO1LHOyr0C3cFmGyVyzvmCKBQ61kxKzsrDfvpMszANokxm7+k7haRwpVDMUYdM08dtAaYK1kvq6e213jGyxwvXYPCZgQlGe/hxr3BstlYIQmat+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSw1pFvDdeRl7U6xIqaH1xFJDJ1cWGY5VdtC49EIW74=;
 b=XFLE6GOxF/bCNL8LYG5tA7uZ0qFsVSsPLCatpfTit9/BsKK0XMPjcHOdrQ8kyt6RdOxMEW7Q09P5aJhSbc/CCG7ITrR3AmCgYbIN55YDOby0t5z02buQG/ANSjVx65vLgzweGP5+1YgTZigAFrgCj1EdRlpl+y6w++AmKvRwZSC3LFlDqvX+FZtJlEOyaQZopvAlXOffwh1anVqpr8q2TTnqg+xHRejGhMsHaxBJq6wju+RANmp37ykM2tXWSjJ+ORG74GFVw6pqnlWkibHuTVA7dCmydtM3JZEfGzWP6gr7pwoa45SupmoUd2asS02PGXHiYitbhT7kPYUOvG18ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSw1pFvDdeRl7U6xIqaH1xFJDJ1cWGY5VdtC49EIW74=;
 b=v6PSlxESAgXqd4PY/vDZpEePt01ka87bKHH2J/NId0phIbQnvGE0dic2K2nN3qbetlSnJqSrz3ENMfxb4K3tD8oN3NPhPSBkbC+dz/pQfDqH3YiVL2czAzejrEfp9TcHzSj53Gq0527aH6TtK5fP6KKkOtr9XQ051GgFFU/6OHk=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3224.namprd11.prod.outlook.com (2603:10b6:a03:77::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 06:53:57 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::c0d3:471b:c804:8059%6]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 06:53:57 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Teoh, Jay Shen" <jay.shen.teoh@intel.com>, "Chan,
 Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>, "yi.zhao@windriver.com"
	<yi.zhao@windriver.com>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.3_M1.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3_M1.rc2)
Thread-Index: AQHWzrA56w1gjX1yNEyk5wM3632Gy6n3wEqQ
Date: Tue, 15 Dec 2020 06:53:56 +0000
Message-ID: <BYAPR11MB362456FA45B6109A5A27FB89E3C60@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20201210045112.F08ED7E084A@ubuntu1804-ty-3.yocto.io>
In-Reply-To: <20201210045112.F08ED7E084A@ubuntu1804-ty-3.yocto.io>
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
x-ms-office365-filtering-correlation-id: c37b5c66-610c-472f-0114-08d8a0c631e6
x-ms-traffictypediagnostic: BYAPR11MB3224:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB32247B134044AA97A7589A38E3C60@BYAPR11MB3224.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BD3XK3KCXmIO98cj8OHt5QL8pl4S0kVSReTE7QvAQzfokUSQjhPEScITNvFD4pKlu0iX5D9+c6PptwKI0iYkCKwlrRq4AX022zTqNLCxu09FjN6o7h9EACXUpKNAPwjB0dAjeMrx3Sd8O3jyLTeDcfyiLUtV7yxftcf6CAooEGX/3Go3rVIL4o/QZEhNprtiwk6q1eAiRGbpgA/uB9ytg3jxzuB+toq+hq7+qNJtJdKhhRYQY5cesXcUFAn1akAjp9rymeR/gVFZG9E/F0C6t7f/gRuTjvjQQjDasm0rLewZr4Od+UQ19MKk0twJzOVxfU16BYcppBBtN5vDY6eVI9+d7Je1A5HpMY1uzyBfgP160Fqslx87Wa3c6+C0V9rvrN8XJn4HMhETQKdZfpCBSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(7696005)(55236004)(110136005)(966005)(76116006)(186003)(53546011)(8936002)(52536014)(55016002)(508600001)(15650500001)(26005)(66446008)(4326008)(66946007)(66476007)(6506007)(71200400001)(83380400001)(64756008)(2906002)(66556008)(54906003)(86362001)(8676002)(9686003)(5660300002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MxxZBqjnc6RM/i8X/nUf5uq1Ocz5sJfKECkrrIdB4VfXiZtU5fnpiZcHnDsQ?=
 =?us-ascii?Q?Q07A0PQ3LISJRRFjMJ54cHCDphxIYe9qwgFZ5fLQYdp0j5t6dvBeV3bM+8FY?=
 =?us-ascii?Q?F5OCdAd3AHJUbYHSs9r+VMvVlsEgq92DsjmPCmzFt5zkhy/w0ye80YRZPSu3?=
 =?us-ascii?Q?2xDpo6YDQPG/a/dR5yyRWuAgPblWOuIHfdJLgHBQsgwC4etrWEQ+LTr1Dp6U?=
 =?us-ascii?Q?MVB1/+rwsQonDiWM2T1Cq+skvyTlnbuDR4+/DjNvrxCprBBlAMeEZJySWODZ?=
 =?us-ascii?Q?3hTaAeOBpq0Zgurij8EHrOSccppNjRTXwJlKG0V0x3RVGvHKnidvK0WR7C11?=
 =?us-ascii?Q?tba+YEbfQGTBZ9YgEUBZBEbyrSgMdUD5D3nJYgirhWWga63DBeoqcgN0ev99?=
 =?us-ascii?Q?otWJEyALgKFNqkzXVl9F0C3ZZjA3D/3j8Lm2NkjazIlHelzZkkWJSWU72d7N?=
 =?us-ascii?Q?dyLY+mMjQzlG2akqphvidbyaAvIuAPXwl/xzM83swhwifqcvhb+Gy+eYTQVz?=
 =?us-ascii?Q?3TBTrlLYD50z+4u6UFUEhzQMf4yQZl5FwH5GomR7nlBXe1v0O/tUoUzGtnXR?=
 =?us-ascii?Q?gvjN743w3dGwJLj3x6lm7F44dgtq5o2te5K1vKrm38HRm5jMg6GKMWgjXIrF?=
 =?us-ascii?Q?50/h/4ISfMOs3YtapJgtHh/fr6rpoczNRWDEIKati2CELqOWgMciiPrNO3Al?=
 =?us-ascii?Q?lZdj7sjZNoZzIzTX8k273Oz3eYgxuyHvzpHzvKEKSd/8N2xb2ZSJZhCvAb9o?=
 =?us-ascii?Q?GYRQGibyx5eSZKM8dsvT4Yr3rCbjyNH8/2zWdzLIkR9c/j6q/PNKX7AEAm5+?=
 =?us-ascii?Q?rUlO3YLSAneonNmuf3/mm1J6yn7tVfXMPjOStB1gGN3PxCvqIYZznzTKh0qp?=
 =?us-ascii?Q?DULIQL24pyeyV0f1qVZZ6ZS6nAaQP1ttgX3O0VW1pG4sD2UnLsk3+5AhdlFh?=
 =?us-ascii?Q?rlS3Gcjl+IhHFZKSxGcV/snU0/Ci0bPQaGOJAZCVwfI=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37b5c66-610c-472f-0114-08d8a0c631e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 06:53:57.1702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XOFzjWFhqrFZhJlEriyCeszHtxmnPWxP2D1PvYPfy601vQ88uEPzsxnoHAN0R/f1l4v+hEaFx+eTQsnMaC/lpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3224
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,
=20
This is the full report for yocto-3.3_M1.rc2: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No new defects are found.
No high milestone defects.
 =20
Bugs verified:

BUG id:13997 - [QA 3.2 M2 RC1] failure in ptest : libinput.libinput-test-su=
ite
   Verified Fixed.

Existing bugs observed in this release:

BUG id:14051 - [QA 3.2 M3 RC1] failure in ptest : valgrind.drd and valgrind=
.helgrind
	1 ptest passed, 2 ptest failed
       =20
  =20
 =20
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13997
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14051

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Thursday, 10 December, 2020 12:51 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.3_M1.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.3_M1.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3_M1.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 5775d9463ecedf8681cb6c919b240b80fe70f5a3
> meta-arm: 2a530c34199e9aaff2bab1ac53d81f112f34647f
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 7d79beb5093da8adf0f9b106a33d8e0904a50a48
> meta-kernel: e5a0723a3f3dadd880893bccf9bff88a9b46843d
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: a55b01a3a1faf9a52d7edad074c76327f637aaa2
> poky: f36484e88d21346357bd1fa1bef6fdcc42bed54a
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
