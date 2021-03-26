Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.9212.1616743618417021944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 00:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=L4f1DYn+;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: EA2K8cGUERiRxei8px4cWHPJggmYG6zIBs0DIkWuKMhheKd+wkUCClvdUNZPjug+BNsCIljoVs
 htbTXoPDe7sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178645746"
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; 
   d="scan'208";a="178645746"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2021 00:26:57 -0700
IronPort-SDR: 8hVHEaCoPyX8ee5kuHQ/SoAuu1pe8fMpbh/vpr2jIXbEo9RAXQFKyqH+tHE1RQhM94ebBv9fXI
 HfNugyVpFsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; 
   d="scan'208";a="416418300"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP; 26 Mar 2021 00:26:57 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 26 Mar 2021 00:26:57 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 26 Mar 2021 00:26:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 26 Mar 2021 00:26:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 26 Mar 2021 00:26:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WreJtnQ+xbAOOIWgXI5rRBHP+sT+1kQEnyGhftNRhby8PLWqneAIYua0n8LvYbj8g6qCM+TeUu6L9KjnGThyA5FthOodg4pfWkcfZTkPiTxWgvE5IgbkjRpVOh3Yx9ItAd+OimeBwfGTNqkA6qHRtmFoZA0W3DMmAvYXzyAKP/H4itxR2ul2RB2odch1WJQdilGyVh/KKWp7M9fYRYUiMpwL18vy5f3iXWKVe8ZfvaRl8UCyL/TkPR2DhlmVInL//2ymg+gAQ4cbN/ohux7RIUn9fS9a69FCKtH+Osc3CQiNM3P0YWynCCy4FK08KTqioLsFcFmnoLmCV5+m0lpQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5WzRyOhc1EUNda4Vnch2MhrUINMcUW88OgF5Tg5zDo=;
 b=MGhIa68x1mPLQwPmbkZoc1Mdeu8KKwCqrflsxXoitsYOCpvLwebSt1Hoe042IGOXJeT6tP/aO6+Fg/4l3u76eKviMeqkAYJPQsBdyKS9b6tPL0ufSMsdngWWJSEJmdweBTd8CC5JJHlNZwNfl7q/J3/jXhtND3RVV7RBtvDl0/aFsZcslSlCMj299KN2rXk2kKIY1dzjSaANPZnq/WsCHBJij4DRCqJCOK3EZPG8P2SMoCBDZJ8h1fESzATCENp++QHM8WmGi4pk95NWq/UM2OF/d0fAsH+0OwO3n57RS7N3RrznMqxs9XHpj9cTyv7k7UV7GEpeWwyNlF3ulPOyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5WzRyOhc1EUNda4Vnch2MhrUINMcUW88OgF5Tg5zDo=;
 b=L4f1DYn+mfLs4bjuInimNceuVSZMnl6K6cO9WxPYPX8Ck6dTBAaAP+VCa0S2YFwSSb0KCV5x4qs7M25EBGHqZkw7Bh8Q80b6YsVI3J/McJZk6n7Hjhy6hWLU07R0qfLCV6IZJDuHP8jARzwmCjLn2xiD+o+Jq3izNpTuwljJwA0=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 07:26:52 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3933.038; Fri, 26 Mar 2021
 07:26:52 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.3_M3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.3_M3.rc2)
Thread-Index: AQHXIGJWw/L2A9Te8EKHl/2FJSTfpKqV4dTw
Date: Fri, 26 Mar 2021 07:26:52 +0000
Message-ID: <BYAPR11MB3624B574C6096DE1F3DCD088E3619@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210324040036.A00F13A03DA@ubuntu2004-ty-2.yocto.io>
In-Reply-To: <20210324040036.A00F13A03DA@ubuntu2004-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 95c467e4-2661-4d28-db49-08d8f0288700
x-ms-traffictypediagnostic: SJ0PR11MB4784:
x-microsoft-antispam-prvs: <SJ0PR11MB47841E2E2C315CA242C763B7E3619@SJ0PR11MB4784.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d/GXuBLRiI9K4+ernfGoRMoFQYNSJFR2tsBE2V73MnFeGddw7RTd4YaosgZOPp0+WnYhF7v7K9MvsHOCZ6wTH+D14GVWgSz7vZZBVWeZQG1DnzQ/oxeWaLxKcVOzl/m0kbvRSGsmx+dxG8dHnG63nM19n8Z3RTD0RCV+G+xFWV/KQFS2L6DD1zvOuTEFRnNfBWcJ4C++I7zSOFqm/OD38UCiWtzj/Z4MiW9BcVmILa3zdS3k0E5hODkJBgSagFZU2I0X2N9BLrq7YokpfQprOKTiL3/H3qr0bjbjktMP6s8RvP480EWoi2n7b7KKWen6lR41zfDN9nFra57rTF/MZsOBqyYk85jYm9EC4oMcYRQLd55yvLanlTogUv2jl4uYVxRe8SbQPXNf07cqkMyfiagxHocWnFLaDEYHH2rSmXHbbgUQmImRIbZJHLpTEwamtdUMHBDFMURbxhf2FdAvR64L+LI+1Y+BH9gRUHD9tGFvckfetaI3aqtTZpO0vs15Qfa7Eiz3zN7iblhfudSI1idih2IznluRFCzZYt78H+xWYcaeOII4J+zXN0Gx+niLwFxj0TI/ORUfBMFp4B4Qa4MTK0Z9cDbSDUzAGJ32tUX9q3U3bAuVoz35zwit8PjUpvDv+qXhRndYaKKwDUBBHR0Vj9Va0ceKKSijUr4mkENzDL3fsASplmux1ejcM3dFSp2dsYpKtICb10rTVcxEGXKGZD/DW7Mil7YY20/SGJo4gGcVCd1BYxPMHmoB7wpJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(346002)(39860400002)(366004)(7696005)(15650500001)(38100700001)(478600001)(8676002)(71200400001)(2906002)(110136005)(316002)(966005)(86362001)(26005)(76116006)(186003)(9686003)(55016002)(83380400001)(33656002)(5660300002)(52536014)(8936002)(6506007)(66446008)(53546011)(66476007)(66556008)(64756008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?VClZoqitP3IsPxMv6kMElMNvE0nJ2PCVyfU+TgqdmsIhI8tShFTcqMySmOa/?=
 =?us-ascii?Q?MZBSzhICMPZ8iNaezGiBMsZKYL4F5iNYR49BpYgQhKDalkaZXgDsqVy90xQ/?=
 =?us-ascii?Q?D9GInJUjpCIuMOdgKJFg4H8HK0sujLN/BkDkfPAAxuwvOWLMJmRzZw8meORg?=
 =?us-ascii?Q?vFC+I0YMrZmWuTpJ6GNKU6QP699RvDc7L9GCRYfelj9t6Gt65yJUxpxq0B3Q?=
 =?us-ascii?Q?E19sMowNWacDK4HzHNa5u4D6ItltwlfJRYzE3TH/VChFjHHoVAlwvXUMaOUN?=
 =?us-ascii?Q?yJhaOAvgZREhAe1VFFuMNn9SWx7RUhcjZpqinXuUh7AjVqfB9icVog+VWhfx?=
 =?us-ascii?Q?LKnoNeUvfrPMHMwXmouAP6JEnYfBvUXz2rDQD8x7n90D4DHXmtx1IgJgggkJ?=
 =?us-ascii?Q?6k+AMq0ssBJs4YaU3lvSyk11hq/Hq7dfFnTQXuw6qIgF+BxX/K9bYk+oQETt?=
 =?us-ascii?Q?P6dHu2X0/pgMLi5F5O9BMQGZto17v3YV+YJHFa0N2zK3+uDKPnLpJ0IB3jDH?=
 =?us-ascii?Q?qynuuarlZmV89aEnYE7YxGARjvVNEXcB9pWJRkgEce1cKcAJbj7jp3GxgxF3?=
 =?us-ascii?Q?edlFMsaNn4Kz8iXEcB355Bj5Xl9HAI8cJbZEc7TCEbd/362opEs+SoyCu2bK?=
 =?us-ascii?Q?0a6D5gGa/+/yxmeS0dk7bnVZ5SToFIH9N3zMdhRT7U6TaHheuWbMvPq9oj2k?=
 =?us-ascii?Q?RYIK3IkJQE0rfRtwABKMvHrsEtlqosuD1+WjK6u4G4KFUQq0oEhqnC7xkuOb?=
 =?us-ascii?Q?YbxMzE9JcaP9a6HoYUSrqBOCkUC04qB9NSwW8077sgRgQPkbD3yxW6/h8Yoo?=
 =?us-ascii?Q?l5JmsmZVHR11DVC7Tx1q7hOQNblSlPn6f6PYag71286emn8fsjbXEPB7T6qg?=
 =?us-ascii?Q?wpzrRq/8vi8DhFVkDDzCfwvueWuRRlwIh+3i9TyewGoOF0AyDGj7/2zo5NKG?=
 =?us-ascii?Q?TGHJb+BDculcLBMxcBAOsNZHPNTvdmThquMMX9MUBKChyyWQ/VvU0FtlcEK3?=
 =?us-ascii?Q?WuEJJZJfEdFH2Fa2+52DPKrXcEA2WHsPKTF7aNjAIB1IKtmWTd/GXtSWiiV7?=
 =?us-ascii?Q?CJEDjIJ0dwEIG7ekXBb2UF52k8MCfMQpRV8xtEU7G2ZGX0TuCxYd9vMVilPK?=
 =?us-ascii?Q?Urr814L8hm7wruzeEIoh893C2gzFg3tWYLlmUnbBQeb8SCH8PAR2p3R+OiY6?=
 =?us-ascii?Q?H7yROeIeavLx+QL3lvbRoSKxzH61pJNPVXW/73FvNI4Dyyt6/4/a2SBD09XQ?=
 =?us-ascii?Q?6E0StF9NgsqtqH+0mUc2P3bNHxP/YhUxaAjDhkGXJf4jyyRA+/RI0oqpJHJ9?=
 =?us-ascii?Q?Ry15at6rbQn+D1vaag1ErZ3G?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c467e4-2661-4d28-db49-08d8f0288700
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 07:26:52.5684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4SxYySqFvMQwH3fK+49hUtVLlsirovqagPmHOaP92+oCbHyXggraC/PUT5wSdyJCnHB+5aryvANzaZIFfnwDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

This is the full report for yocto-3.3_M3.rc2:  
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/=
?h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found:


Bugs verified:

BUG id:14306 - [3.3 M3 rc1] beaglebone poky-alt wic image can not bootup=
=20
   Verified Fixed.    
    
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14306

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 24 March, 2021 12:01 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.3_M3.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.3_M3.rc2) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3_M3.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: ed8e1fd4cf9d5ac8a8203638add99d686b4b3521
> meta-arm: ac1dc0b894642101a80235a920bdc3bbe6d74558
> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
> meta-intel: 6fea44c695730129df8bd744b0e22ccd62a725c2
> meta-kernel: 29329d7cacc71595cecfdd05a455a0cfb164564d
> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
> oecore: 7ae12e4278e98c5b916a1067ae0b48c2da6e82cd
> poky: ea455ca8671d3bc2a1097989bfaabe92f3ca37ab
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

