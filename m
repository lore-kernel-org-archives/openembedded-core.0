Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.4280.1611726589606529965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 21:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=cXXozMQt;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: vQ/2yPyVRMpG9atiZc+trmyQ2iomH8yIvZVL+PGR4efqmIV+NBKx8VeSxiZvGwlM+EUtcXX2Yx
 oXAMrWpsC5UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="176511800"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="176511800"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 21:49:47 -0800
IronPort-SDR: Fy6QpYS8imKBkiteATzJszTQR4WTWUqEdGuvsLLuKtdoSRO1M1TG1iEkY042yHZCn6rJRAZ5ib
 51D49ULTdDXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="504798835"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2021 21:49:47 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 26 Jan 2021 21:49:47 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 26 Jan 2021 21:49:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 26 Jan 2021 21:49:46 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 26 Jan 2021 21:49:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/bZej7kdiA9nanVN/VMQoTjfY/r53ya2OjtZwaMDSkXMYR3vukrgpJSMCQwkKe6nSLN2iahXDKSrw7kaMEnkO68t++Hai+R9oID4/FeCkV34zn10Rdw6aoEFEuLIhMXoSy9wcxuSY38jf+KxMAvxeG8miIqoFfDSPvWw6OtickS2Fn3dO4WiMY8Y1FsC1U0RF4KYtRl2KcU7w5kpJekqqP0XsdEs1V5tj8KMAkUBnSqqsfsk8f1ufOxMfY0u4OFM+0vFAh2LMyy5YcuyFpc5Au45gWatSztco4b8XGfQbLfKr6vevo+SMBc3Vg/ucPig9oXKrQs2ov1RssWNKH+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Wq6R3FcEKgtA1ugo+5I6vH2MdoW5I3y5Z7xFLXN2LY=;
 b=Os/1p6aWav+XPapdoKSjdW0CRbEY927SIE5NSzacgO+FG001x0cIx5R6RKpqZXiE0oq2OFUORLs5OEZTzpAIqBb3IQ81qGvekDAvycdL/uOIP0uLWgxAOMjhg3VOIwBbgfEhtOFa4IQjkTRYdbSbK/7PGrPsyXsbZZ/keNf0ov3WNUItwQjUDcc3FXotSMYqIxl/vF2d+7EvE+CB8YSwE9YpyubvEFEw9ca2O09fhFZJ6+nyJag07iMhiUcNYj1YetcBZvirkcCucRLXRkknicAox2BuIXyhZ8AoftfmJfQebH9Gv+vGzKUiOMLN8IJ2C/Zw6nZ7j2km5X1tPAdv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Wq6R3FcEKgtA1ugo+5I6vH2MdoW5I3y5Z7xFLXN2LY=;
 b=cXXozMQtor+30bRT7He1WNliUIihR0prLmEFUbVmNMSGwwyk6/5IbGITQ1zMtpqcbSdRDUJ/TyhN/o5IyGPOPEv5aitnuQr3o6ot58sbIbORTHUSgg9j3p5d4VE4spFYHR587tJVg9MEaMakE4ZSyFHLaoV1Jl1Sg7Y844QIqnY=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Wed, 27 Jan
 2021 05:49:43 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::6417:be76:6b3c:213d]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::6417:be76:6b3c:213d%6]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 05:49:43 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.3_M2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3_M2.rc1)
Thread-Index: AQHW77MSEJ/pkm+J4ki/SKnSnIwRU6o7AKuw
Date: Wed, 27 Jan 2021 05:49:43 +0000
Message-ID: <BYAPR11MB362480C0773B27E427539424E3BB9@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210121050529.465241A30A4@debian8-ty-1.yocto.io>
In-Reply-To: <20210121050529.465241A30A4@debian8-ty-1.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [175.138.41.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eceecf09-bb6a-475f-c492-08d8c287587c
x-ms-traffictypediagnostic: BYAPR11MB3765:
x-microsoft-antispam-prvs: <BYAPR11MB3765F4410940F4C666F04388E3BB9@BYAPR11MB3765.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: azx/BhkNEVdyvUJz//v5AP5ChPz6q1GshTbAodkHtcFAKyFXQlxJcT8yATL6ZgWAeayhRur0fQ0y3VKQhVW1JvgTD23IG+YuUCFvVCH02rMaYdQZzaH4PXq0Du/Z0X16CN6z4XKYGe4lUxfg1q/MLYSkOpLp6PNXOF2z0Nu1pM/S4vdnay8MLnyyf1TmuC/KxNyz4HeOaNv8YwV8ZNFSZ0MuYRDEK/y730AZtssB7Ieo/xZ1KVaEO0RSE2opd6fGNM+JK9ZT+lVvu9SlfzkRvsp1jAXsUhbS7+bFkTRO6HxwzQtIrDjSzoxd22dMSHTMVtKwiG6Xo38goja+1o/VgN66TMBgmpBr7xAKVBuLrb+6azQN9BZDKEaIcrKEHWLkcC3/t1qXeV6kJ7qtiCfAQKJwWDhG/dgLczs9Z/akRbdF9iuh7sOonV3sAF/0Ikt02NPdPc+lSLV4cMcfWHw41Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(52536014)(71200400001)(5660300002)(26005)(83380400001)(186003)(66446008)(86362001)(76116006)(66476007)(66946007)(64756008)(66556008)(316002)(55236004)(53546011)(478600001)(6506007)(966005)(15650500001)(2906002)(7696005)(9686003)(8936002)(110136005)(4326008)(8676002)(55016002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SIZ5rQerBnDwnjHJbn3hwGYq54Rth5U+0Giajd9fZav97ZvTFnqH1QAQWz5X?=
 =?us-ascii?Q?uv2203acYzkU+SvH/cwpf/C8ECcIOrGLqaYmR1qtiQMVHC3UH8XQfdzcJgts?=
 =?us-ascii?Q?6ZHV9q96lJ2ors94LweRku0k1lEYnhfmb9FJ2TpxL+HiwCfdlMgvk6ttuynW?=
 =?us-ascii?Q?ItDmW25L9S4NbRoZ/kpPPOXGO226f1v2bGA/BohufKINrnuC/ql6sFs1yxUK?=
 =?us-ascii?Q?JfTiWy7oqh0rJaESrst6QGgzffuq0WAtzQ0QwGV9uNAwF3+vDdZxv92fQX77?=
 =?us-ascii?Q?HpR0IrLbPYnZmQqbirQn29WMVtPzG01tx6QDRGcLfoDrgWO89b+WXVWH5QwM?=
 =?us-ascii?Q?f4VJdrvan9KV5/DAaXnzuEKMlrR4J2Xw609YgOj6gtCD2LP1orsEWNKR5HqN?=
 =?us-ascii?Q?DcoMSEesWCok8ZasnXqPOFShSfEpVsyXjBFZ+Hgac0ogmrK5ghRTtSjvJDPD?=
 =?us-ascii?Q?cAo1GAbePWd7/vLnxoIfZPjxZ+kQANQoClSuTogKzcU+43C0bFMYEYE4hsri?=
 =?us-ascii?Q?tTtAIRwTzP0Eh6/I+2dTIbUFcMhlNvsWCkbWNX3TWsD3ctcgOuGDEPiuku2P?=
 =?us-ascii?Q?Mm6ivSvL7QX/K0w+bFU1eUx9TEaVAkhyTCrafAafiaRrK7f4jh87cGupZ2YE?=
 =?us-ascii?Q?N6FKEkBXMk2c1xt7I1E5Ap/LUbZ92WozJaEeB5g3bMGxy5wf0AwDk+AG82pg?=
 =?us-ascii?Q?PypCSX/Mavz1SzojB2jNM8WIda81DvK5eWpzKwpi+Ck7Oik15WD6wC1tn1sP?=
 =?us-ascii?Q?0l2+NPOyJfNnM93NdNcKpfPTEqNpW6QPF4BSoQsfKK0TaeL8OW2RNdqKdYt6?=
 =?us-ascii?Q?r3ERl0w/EJDpUYVFufSh2d9rcVMkiJD2sibG2DDWUOs/F7rM69u7Mx+Ifcl8?=
 =?us-ascii?Q?xU0hplPQuRwtsp2wMG3H23Ro2ETG5hLJdFx9Dl/VGtuvM1ImWNHp5MF5C8cA?=
 =?us-ascii?Q?T3bcFiSyhuM/wjmYGee1RTjqOWA6xVg4RgAe3PdxHvl8k7coniwmFja2Jbjy?=
 =?us-ascii?Q?OqK22fX9HHIluJaIolqpOvJRUyEtUll7oANwdpc6k22TPit017rlmGxfeLi1?=
 =?us-ascii?Q?cObAhPsc?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eceecf09-bb6a-475f-c492-08d8c287587c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 05:49:43.2731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ds61CTwcdAEtIFhqTtD4LVUetC0NloYTmCkvSNYTfJv0PjzD3Kj+JZdtb8G7BpX5/CFf5kzJxtes3Fws6c3qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

This is the full report for yocto-3.3_M2.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

new issue found=20

BUG id:14203 - [QA 3.3 M2 RC1] failure in ptest : gstreamer1.0.gstreamer-1.=
0/pipelines_seek.test
   =20
    =20
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14203

Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Thursday, 21 January, 2021 1:05 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.3_M2.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.3_M2.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3_M2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 01e901c44ab0f496606b1d45c8953dc54970204c
> meta-arm: a8f32f990a0d9dc1db310892c70d5a994c698b32
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: b4e5d33affeaa223459c0935a853485137b4591d
> meta-kernel: 8349870943ba44bbd688656897372e881f32c741
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: 79821d5a185e25384f5b6b5158b238bbee17c79e
> poky: b5e634644b69a968a93aad0dd0502cf479d3973a
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
