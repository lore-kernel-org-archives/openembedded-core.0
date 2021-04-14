Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.7753.1618368922934486425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 19:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=IzZ5GuHo;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: UYRL4Vp82aZiZI7HixvCcXYbenVlraYq4ZwhRtg5SYIOy+IFQ+W2x/J7Fgy+jbIru1fgfz1LEF
 +1C6+xQU9IKg==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="191365309"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="191365309"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 19:55:22 -0700
IronPort-SDR: yR1aBH6HKgQ3+dJUyjamNTxSWNoowVHKqiwxgg7sqowao3XXb8A4dowDTIu4ntocyRzfvyUS55
 Ig/k/RzXqqHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="418116961"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2021 19:55:21 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 19:55:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 19:55:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 13 Apr 2021 19:55:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 13 Apr 2021 19:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flU6eQrxMvOQEAI2eP6/UVAL9zq8gqbWNWpmT9HJXTY5kh8vTn+X81wxDUz11b9yH0N977ZfXDj79WtYKpoA3UKnJEeTqQ3QnN1Uzqzr6g+pZC7jCC6gUKqYhwSU+fQ68TNZHQb+ZVjrC63lf3rqMfOe2xGzhCje+FPxO7NMO31WmGtHjb0BYJD0nS729mub/ZhrSELOvrsH+NSqTxkRgFnu6Tgh91PAkHhP/60VLGA5Ziz1OErX04hwHcmDZ3ACdtfk9ffqxrp2ly/E9q4I56B3kHt/rJfZBrEAAV1Xv1PIG2kwkkLgWXcu9KKFWGZ6QGBPb2gZakBjAdLaslyPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1qcge9YYWpLzIhljBlUO++aKd0COWsoUpP5QG9LDEE=;
 b=PXMRKUzTj2A+Bl/RniLQKrcVoo59m7sd0ZTq6Gsgs9WvfIIkwf4TXGwUUEn12epKPqikmJvtY/qcknBjD8OL6K1LhMYy7Rx9vHZdfsQlHNuSrE/QqYOExfP656/Y+2C3jCEAgQsOr/6SU5TBv+5Kp+jiXNa/a8F/zog8OuH0VvE35nVZJ2YDC2tK5x1lJK8w4rRq0A3SPDq92VmgnZiNZpFlGfoQU1lTYv75Og7WNoKdm4jF8yNNDMjvDyA3af3HtW1rw5vkXMg0Wnc0YUSmj03lA6bdJ6J1Z7pQAFQRg/tpzwo0oPhXbCn5I+JaPLCnqimjxWVw7iyTbk42DhahYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1qcge9YYWpLzIhljBlUO++aKd0COWsoUpP5QG9LDEE=;
 b=IzZ5GuHoM6TeubzeAyTx9fML7D3zQJmqCg5jpT0yuQfsU7tNivTOq75DiNOQq2Dq4CtFwkGxkj1u897Sk/iRjnN8e4iPjpfQSqXJiLpekeD4zeEeWigkeN3NzZzlusjEZW1xoQ3UtB4UMqqStRqv7befdrw3WF98pNpCPA8w8aQ=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB3896.namprd11.prod.outlook.com (2603:10b6:a03:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 02:55:20 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 02:55:20 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.7.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.7.rc1)
Thread-Index: AQHXMK+7MxP69Lpzb0eGZy9C58RNa6qzUYUQ
Date: Wed, 14 Apr 2021 02:55:20 +0000
Message-ID: <BYAPR11MB362465365029F0A9560FCFCEE34E9@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210413215524.AACEEB805C7@ubuntu1804-ty-3.yocto.io>
In-Reply-To: <20210413215524.AACEEB805C7@ubuntu1804-ty-3.yocto.io>
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
x-ms-office365-filtering-correlation-id: 20ae8619-875d-44a3-f2d4-08d8fef0bde7
x-ms-traffictypediagnostic: BY5PR11MB3896:
x-microsoft-antispam-prvs: <BY5PR11MB38964304428727D28EE82284E34E9@BY5PR11MB3896.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bH15SsyWApP8iF6+niE4kFVLB3oNtVbJ1ZFqwxKiayPSXRJ8dbhyob3Wo6ffaa7J/rfJ3KJ2gJGASrutHGS81tjWIRy1/NgWWNQVD25iLabwnubJ8LgdSfTrNnmZqO52GMg9BvpAZ3Ebv14GzxvEjdJ9Q1n0LAjkdVCFLr8bpsKsEr2LIsm0Vbc51SNfIJuOn0UJJCWBoAoobdMahSJgVYNCJVjh0/cCf3hNSTdyMgi/3+DqYcdDQuyPzwY5ZBHMa/JHffFBuxELzemjkM0Dk41X/bvdc+DJHZSeUyjvH/+LZxO9W/W4nDmwVWB2q8zJvd3RWQnNojYP5673S7WtJt8foQ0eg4X5E7UkidJ5mhDObLj2Fnpzdi7du6acT6Ef7zNm3G8Pcev0nNqdPndBHwwSrJ9IjjTQvkC/8+jarQ9gj2qVc1FLenwRySQH2krpd8QR+S/7axBk99PWpRWJEuYo2pLS1+TsyEbUYH9A10JLio9EpPEHuaBnSxLuiV/6JeG9XYyD7XwR4b3I1nrimqtqQWgAM3OkRWMoYBbHzizZcFfOnTytQAoHPtmestrg53FwRvnuYTNqPwztA4nQ8jYxTGGLHMklZkE1jQwNBRH2S3YguoBrEEDq+7wQ4JzIREGOnTjdTSiqZf3e9GpnNz/KsX7HNc2IefUjV+07JvL1L6TZPIe6hR9pwqbyO1oj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(396003)(346002)(366004)(316002)(122000001)(38100700002)(2906002)(186003)(478600001)(966005)(15650500001)(66446008)(7696005)(86362001)(110136005)(52536014)(66946007)(9686003)(64756008)(66556008)(8936002)(33656002)(55016002)(53546011)(6506007)(71200400001)(76116006)(5660300002)(26005)(66476007)(83380400001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ViALeGpL5rt/e6qI3TNVjb654gowhc7ulZ1HDf5dsS1LylXxsnYOCCo6ObP1?=
 =?us-ascii?Q?rxqomocjhnOCtYbuiALOeYcN+QGWK1outnqAxguuK85zSZId8PpoUal1KdB+?=
 =?us-ascii?Q?3RydDwJvvG3NKrhxuwiHz7n/V0BHmVN0O/zNfSOt0qDu/W5w4j93oOu23lLU?=
 =?us-ascii?Q?Tj+Kk6g7akZa5PktMdPCdLHhWz1c212pbt5u2nSQeR/pHaBOsE12nNzCWI5x?=
 =?us-ascii?Q?VrjUEcsksIFFMOOVSgfORGyMVZHt2TEaOPIUzpeZ981KVKJEYi61dH7gqw9x?=
 =?us-ascii?Q?m+GurmR7aYA9TwPVW2zK+dorG+JeYKZvA6Unp7za9u3G72D2OTQM931hljm8?=
 =?us-ascii?Q?47lv2FfNrVt3HUp1Ti/zOSO0ajKanpFZXR1GK43zMUZeKDn6Y3iNXdyek5Vb?=
 =?us-ascii?Q?ZZJkymX2Rjt4LlF99wLCFU3zm+aibx3rIGpq/l60tx6Nm6Rpif4A15AAKqiL?=
 =?us-ascii?Q?svTpe6aAxXIe75AYWjUzIhvStx7O93LZpTXye7oRY1wuosWaygXxqZFqYUB2?=
 =?us-ascii?Q?Qv2MAmHxdYr07iFl14PbVDM1rK/A6uved9UledN6cY8s4wDZ+uq2oqSp+MLe?=
 =?us-ascii?Q?bWebUasJG+4pM4zQ16qVf9K4Wh/EBZLO69Hcgr6brLzrF4DYtcCm1fpLWf1z?=
 =?us-ascii?Q?SGe4Bv5KoNYJyX4EPhEY+l1qCSBJ5ptwUtX8v7/So2uj6fDcq8Lj0kkB+pqV?=
 =?us-ascii?Q?sfLI2bocLvrKxaBPs4dROxYL9+M7/yRkgYw+N4EgQLh8wYkPO+eWGcdAVy5K?=
 =?us-ascii?Q?xipEUMadrsDmdMILVwShIFR746r/T0I3UOwvsWhOD9HTaBLovmeICbS7+nth?=
 =?us-ascii?Q?pCDxienCWQJI+dKK95bBB0082LiEYVAyDSG3lHoGgv9IY1jcmkBoq7+tJQod?=
 =?us-ascii?Q?EN7Ve9exnCJdHx4xcA1N/ogOjBVfGjC1L2iRGLEYPv82lpxcz7qCFgeuscz2?=
 =?us-ascii?Q?EHbnSmnifuX4A+K9+H+bGSMOl04qZlLwOijGHIkUngUD3fMKV0cGaGZ5sFGq?=
 =?us-ascii?Q?2skt4MXd+gNb/xkb67vuDJggBGrPxZmrUQG+SUbjGHJkssQqrY9UVfP2kFpn?=
 =?us-ascii?Q?18jDySilzg2sDKc2amtY+BAiKgCw1J/1Od3mdm24uFOmEE4s2bXQcAmVONxG?=
 =?us-ascii?Q?S8Z4qCHtC4sRLNpFO+CX8ZE6VR/qhmxim0dtjhe/6FBr1AfMBr9gKmI5gFcG?=
 =?us-ascii?Q?7ahL1z0i8I7vjy5coE9tRoIAGQnf3jaJw3PdVVVqutHaGJhWDCdgrH6Hvrsd?=
 =?us-ascii?Q?qJ5DONeHMt39LO498bNeFMHO/629r/HuOw/vfYIEfm8EK4qwOHfzwklcIBH5?=
 =?us-ascii?Q?ZtBiaMzjp292j595fUcKMDzc?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ae8619-875d-44a3-f2d4-08d8fef0bde7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 02:55:20.3836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OXPgE3tSkPKcJQkfgMj2rogcz94wJHo98kij79T8zylEUpMqFDlw8V+O1vTZej5/dEDJpR5dnf4AGVjloyowJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3896
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.7.r=
c1 We are planning to execute following tests for this cycle:

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

ETA for completion is next Monday, April 19


Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 14 April, 2021 5:55 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.1.7.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.7.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.7.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 017a39ed05d065bf28fd38f91bcde8a098300551
> meta-arm: 1cf8b975e1c40bf8e8c0bf315db5d4cddcb01a7b
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 4bd62a7e154b8c9e8a114f452d3b062d8d058118
> meta-kernel: 29329d7cacc71595cecfdd05a455a0cfb164564d
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: a3de6239e98efafe3668396e69133ffee3d9b27f
> poky: 13f4ddf50eccaeed96a40a5f1a1d4173e677e98a
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

