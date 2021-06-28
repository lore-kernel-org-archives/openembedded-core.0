Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.9994.1624881728690313265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 05:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=IVbrerTC;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: sangeeta.jain@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="195088736"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="scan'208";a="195088736"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 05:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="scan'208";a="488874663"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 28 Jun 2021 05:02:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 28 Jun 2021 05:02:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 28 Jun 2021 05:02:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 28 Jun 2021 05:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqXTH+VSJlVJZoMLP31k1V26WMzSQdJBscaAmaeXax9tTXYVQMFEd4Ih8pclpRGrZYGH9ni82kVSIU+eKC11RyokBt7wbEFb5CDymcT9Zg9x4EdO6DM5BkNyExwEkAdOWv0jFE0bAF9yldm7UocQw1ZOBLsZlbQB7pydZ5eKsHTM4wx8Ua+i70+fSOKD5ya1B9UiWhuGX8qmMtpGzCa7GZlypytyZhNiow/P1K3FJe4YZSzK64RdYBiLq0FvLXl3+X+QYxYfHuABhggzr+QMOjLIw8GyKZRrDR+3qEEd5i3InfmJ3Ze6FACt6Xp5da2ri6L4YhSk1TvBishaGoPx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm+PFWcbXBIZDSnODFyT2/BAjtPno0bI3vFYbpri/vE=;
 b=Y5Ej6wD0aA+qv8EvybJ/Fartlas0Sno0oO4tIrxxE9k1NtWnRnvaSH7htkudFZ8K3MBVeLCrFs5oiGfE9dxaAvrApHb0V2p7mgeQSzG7C1MmAMryGfeKee3u1hpyj0x/bDD65ldVb4lWnZUhOfBUaunFwxwZHFKqRQnBycSBP/5/CC3ToxKRuugLarWVHqqIwciudza7LCQlpYYccHtva5sHr6fYacOkwtGW6znpLCgsQWUkVGCk4mRUOGvsLEbmo0mZ7qfOV4Rds6lZBKebuTdSJjG2Bu8MkD/XOZcDUGe3YqATZItJLWGwrOK7nVEXeIsM3BzRlE+z5bNixl+YMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm+PFWcbXBIZDSnODFyT2/BAjtPno0bI3vFYbpri/vE=;
 b=IVbrerTCwG+TJ52Jj0jDnTjTaO6Tfr+SqXqVFhDuqrjtFAXo+hOGKGwZqorMrzJyOycE+QJSOBPdrw2+oCXwfTZLwbaSshjNo+nb7biTR4BOup1iZdv241Pk/berKjH3pMsNbGIMQUjE2WGcNxy9OntiTrrzt2sAwLWkocIq6uE=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM8PR11MB5622.namprd11.prod.outlook.com (2603:10b6:8:36::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18; Mon, 28 Jun 2021 12:02:01 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::5f7:63b4:b18:53d4]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::5f7:63b4:b18:53d4%7]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:02:01 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.9.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.9.rc1)
Thread-Index: AQHXZ4RA5DxeeVP4g0m7ZwPPsemZbKspW3lg
Date: Mon, 28 Jun 2021 12:02:01 +0000
Message-ID: <DM8PR11MB560824FA441D1E2D4EAF11F8E3039@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <20210622163241.330782A0FA2@centos8-ty-1.yocto.io>
In-Reply-To: <20210622163241.330782A0FA2@centos8-ty-1.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [219.95.114.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccbd815e-6daf-4762-67d2-08d93a2c89b5
x-ms-traffictypediagnostic: DM8PR11MB5622:
x-microsoft-antispam-prvs: <DM8PR11MB56226EE243E00C03B3A5964FE3039@DM8PR11MB5622.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: In4+4HTOawzoVF9bMm1PpDpy+oTu0nQ1M7L6hOQ0P0GzPEpXelPNSok9CWgemGRO56/dZhixgGzdtffP3sikENViO1nNDgo/S+mDMyZEzxXRGvF6c0NkB8NCmVTo5iHxsBxfjZDy5g8alIoMLCYYpr39dmApqXYpbY5tXJ9+vs3PgC3eScHKPU9HxwAyq//iReBnPADk0Imn2iiKXL8EfxplVTZWbOroILgBQpvU4YlYQIA0sop09OYSz1zl/qHQk7kBRVA/2BUUI5Ub1uOdjJzgtnIRcV8RCwrOHffKOG61ccR/yo0rpwQvqxyfpy74LcX8JIW/6pROg7veUKfW67RW9nrcOQIAwREQDPujCNXXdUoXJ/gnTDTt4a6tin7tFYCBzHaFkDa2qQVVX6ADpS+3e0frWpZclLlAaDXwZ5u9NG7e3w9amzmWl/hM8dIuZbvzzl9f2bsU1ZUwr+458XsqF7car7ic5XITwJGAd95A9dpPUf7oS+OQYJs2R04u3wBrgW2Rt6/eIFJxPRXhz2ejtNprO5pHkVbABJSwLv940VP2IWg3frlbv7uqKjOpTWV+s3L1MEo9o5BVh83SqrIYJsBHfNQIsfSHy0vlIin7te1ESH0VZ2Eth6SO114vN33sDKm0ul705vmX5sg3Jah7qLU+BqrqDVJmb6BkNBqfAC2h8bdH1GOuyHzN/jUP31SR+8FUmoWIJQhxiQrJbZWfZln+DDkTHD9S7en18tN5LLkeFmLaZaUN3HlamZyu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(376002)(39860400002)(136003)(53546011)(2906002)(5660300002)(6506007)(66946007)(316002)(7696005)(66476007)(122000001)(15650500001)(966005)(76116006)(66556008)(66446008)(64756008)(38100700002)(478600001)(52536014)(110136005)(186003)(83380400001)(8936002)(9686003)(33656002)(86362001)(8676002)(71200400001)(26005)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t//7wl2fW5sBUpYSdufXjJqULjop6QgQIvQQryZUGWnmJDUBGcHFiaF2b/zb?=
 =?us-ascii?Q?SWir9VS/lIQ3gSKQdAwCo/rF52J1o7xFdmgtwkxHCLVRsDMRZFK7Pc2DOOr0?=
 =?us-ascii?Q?wypAlwP+sNOx2u2gTzghLao29BTRhQgROk7sSWVqGy7wPz2gUK+HiL88crDz?=
 =?us-ascii?Q?X4TCQmMPVH+1vD8iZTtZffdZFmob9/eGwD4+GpVy0OKhQ/cxHhx+3w3hqQLD?=
 =?us-ascii?Q?cHWEmX6YZm/7RJhD5QW6/TAWhbted2wq8VI43OyP/W7213a+5tqyTM0t2cwy?=
 =?us-ascii?Q?Ckv8YYCLA9LMJSOOTQcA5KZeUOtmdO2yYUkTl6D4bsCgoxM1pv0/zCqxc5cu?=
 =?us-ascii?Q?rgTZLd7HQS2r93QqRtstmTMg7LEGTKVBmQ/T1oM2eF6FQY7T51gCMMhPy6bt?=
 =?us-ascii?Q?2SsfDqiyp4xai3G3ZENi9Osl+gO5uKaRUAjDWQZuJTiSgoavq7L4goV2Chpc?=
 =?us-ascii?Q?MLlEYyKKHO8iWwfV/ugqjXVXp+GoH7doQ9Z/wxojc8crEz0cMmHjAIXOYyBb?=
 =?us-ascii?Q?hlXTn+/qJ1svdfUkhx6clW5mRMfdDJm3TdU+eXZQrZsmVO6wOwb8DVjVYEzO?=
 =?us-ascii?Q?hiNa4I75qGHzzc2s2ivXNom4j5sNNqVTDCGZbeiPCzHGJJqAIjVm+lpqoMV1?=
 =?us-ascii?Q?aOR2oQh5CTDIZTHYYsGP/enRSwJSuqKKzfBkFdPM8lVWivT0nUvxn0gieZxe?=
 =?us-ascii?Q?nUEBUsjkYhk1a7CsKR88KXfI0X92YpnUsj47H6iTe2/CNYSbWqiVN/S/5GoB?=
 =?us-ascii?Q?6YHC9cuzvl+CI7C9S3LCmYBbNt1Qe0k18wnfqxSCqoSf8Yts4ngWx+erwvsc?=
 =?us-ascii?Q?ASB1GUwIfCMS+G+JyNfBE3tblmCvzuNilT0/PzmY9JP/et0dRDJbU8qP2mWx?=
 =?us-ascii?Q?vv5m4EqbonZxSpGNC2F/p8wG5wpdwWMPTvRHRVoyTq/E5875ZOowoCpAi30S?=
 =?us-ascii?Q?ewUaiCo1aSxNOxD6OPmZ5BVNmBCTAnX/3sEt/CYTx96zX/5Jjsn/wyuTX2J+?=
 =?us-ascii?Q?4dNyJrdpx6PA8UHoai7OT5UTPktU+dzackm9p50/tSzDUqUX99APfRCiieVv?=
 =?us-ascii?Q?9FCkLCS/4/dbfIGiLgUUV+HWCO59t1UtplN3RuOpMTyeBOpMmfvYvdPdhTv2?=
 =?us-ascii?Q?f6Qq72BV4gr9JBY5CIRaUuACo6N48p+Se8dJIEP3sJF0H+cNIkMXk89DEyg2?=
 =?us-ascii?Q?ZMoLU6W4TeUq8lI1yfcZavtd1cf+OA1YG3FNbOxJt/No7nW+Z9RehxJWH7Il?=
 =?us-ascii?Q?wxMdQwbitOMyqlBJoTLTjo2i5OQ0xOEFls7JJ7FsftPn1xEFpYcB+ZTyGuwz?=
 =?us-ascii?Q?hLJHdAC6qCpfOSEkLRJYu7A5?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbd815e-6daf-4762-67d2-08d93a2c89b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 12:02:01.2009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKYZNHFNUxLehkbAsofOcWetODMTFjGvrQDbx/vgeTWmrTtIc/CqiT+7aCH7BTUjPOLVBWZc7Zl/xnBn7RKDBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5622
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

This is the full report for yocto-3.1.9.rc1:  
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/=
?h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 23 June, 2021 12:33 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.1.9.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.9.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.9.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 0e0af15b84e07e6763300dcd092b980086b9b9c4
> meta-arm: 59974ccd5f1368b2a1c621ba3efd6d2c44c126dd
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: d8bf86ae6288ae520b8ddd7209a0b448b9693f48
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: ac8181d9b9ad8360f7dba03aba8b00f008c6ebb4
> poky: 43060f59ba60a0257864f1f7b25b51fac3f2d2cf
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

