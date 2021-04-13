Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.6806.1618307304955507363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 02:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=P0xxiLfP;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: T/a9dkBAiJK5lbnlu0+ra/4XtMXcgAPNd4MITxVUzLWiRz2IVM7HdhVRIYNwc3qLzvHRuENLJW
 ma18MAcdonkA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="255702044"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="255702044"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 02:48:23 -0700
IronPort-SDR: uFYQskt2vJDe0EWCskMtFNZw7h7GPaTq0GvJi1B3DLyeQbSsyuV2QEobUeZJWirTJtPNQ1le/e
 mLtUBZspCCUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="381915454"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2021 02:48:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 02:48:23 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 02:48:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 13 Apr 2021 02:48:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 13 Apr 2021 02:48:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bc+O0ym9CtXx4FK9SqlttxJF28jJU82/bHXrHDsXaC1XWXQjlEfm22HSNhcCf2Lr+nhkdlW7x75eJN4jdeKgVSkkA9u97CJjC0iKurwTpVGdK0VmP8l5scZ/aOzYfLOF6o01hDowXskB/a+Rwk9dKjvgTb7x77Yvsw9gZlRUUoExyXLhD4WnWoIJKGfzi/cMHmqTOwkBiE2udk8f8LG57BqHDGHfZa84hzfMm6vPqSGApX6k+tORg4Py35RfZ/GuGDAhW3GfFNUiDRBHHCbr7bK4e/qhgafpgMhZRqbG2blJPmb2DwlazNSnToVB0xy8mWxidAkOXJIgO3i7xLTM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2r6z3lCT1Ork45b7QuH3uzdOae64FkmMzMfvzljKZs=;
 b=KWRv2+s3Nmf2FIAiYxVkJrJZI/Uv4Z99z5b6SFt+rhxZgn/Y1CLmSuOyIXqaJIn0QkjTS/wSzvff4rdB8IUjUDsPXLMD29YGAfpuPvhP8sdOTssZls5YT5AJftzC1rowUwiaQSdMSG+NeHA7wyZ6kLnmQCrYcKDIY5b/dVSwpkLnruChCRJe/Oy+Gn0gH3rcMDQ4JFY7UW7QZYZih4iSFsLhWSdGfJT5eKObgCpZHJd6QFLKxS9/CP4ugCmvwP93L7CIR17JXhry6ke1/AzHpxIRG0k2uPKxMcrY74WlMTBf4VFnwDQjUHPEvfMbtjiwEm+Ka6XNMpCMcKyudt7TpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2r6z3lCT1Ork45b7QuH3uzdOae64FkmMzMfvzljKZs=;
 b=P0xxiLfPr7pFYurRUTAnc82rLmra1Olv3xXmMH9XO0yumQF2UB24Lje3OJgI3C7JVc/qlMoAdr9EfKeHDisaBWVpf/zq1P5v1/NezRgmBuCaz7FsOIrZaVvCyRxKF1MU04Z+6w9hRitqJnNhIwkSQo1l77Viztr9CilwrngDlhg=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Tue, 13 Apr
 2021 09:48:20 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 09:48:20 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.3.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3.rc2)
Thread-Index: AQHXK6e9kWXlHBZleEKB5fU3CUANp6qyPM2Q
Date: Tue, 13 Apr 2021 09:48:20 +0000
Message-ID: <BYAPR11MB3624ADCD655AB8D038AB418AE34F9@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210407121531.21CDF41B5B@centos7-ty-4.yocto.io>
In-Reply-To: <20210407121531.21CDF41B5B@centos7-ty-4.yocto.io>
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
x-ms-office365-filtering-correlation-id: 5ab18305-e72b-4702-05c0-08d8fe6145af
x-ms-traffictypediagnostic: SJ0PR11MB5071:
x-microsoft-antispam-prvs: <SJ0PR11MB5071DAD43AB6B7E95E19D575E34F9@SJ0PR11MB5071.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ka9QgKzwtb7gYvmwAX4ioYdUiSMnTw4xdrQiZLKV5Kjjhev7LIQT1K3/kV64AIZTNy0NCS05p7NhJkNHnC6+URiNi1NLc5AKj1daTQcCHA0q/nDPQoGQRLHYyEVNT2EJsR9kjPCGxH+ZkRG87vGcNDPlSqJ+YgaOyEDMzNdC/omLxgjphHCyolVZ8o/53eg/c2uF/Evg/BcgpkGmLmvlPwp16IlwYm4e/OGBbJBffIWXr31wl/fynhHR0N61AwIYF5j/RDKhQQzX7RdI/cuRCWTdrBa8VuLovIBZHgxCKt6Woud7eGKfZvOZiZ5WZBGbVi/gyfB4dyFARSsPlIBZ3FFpfuxIs+YUT8wwSYh34azohUytjCN/HBlrp2BnmUTu5HjoKo70rVgdQ+OhEA74AteNETrFUOjaHdWnNFm+4i1hlIXzUkwn5JeeNU8tZoX6lNnQ4DOZOSBtlqDTYzpebqYGqN9gaL9Y/bEOLUn5xageS+R5kvHCcMBTPS4WotuZYr+8hEXLMumg6bHqU5MWtA8gM3xpQFx+FVGnzHD/xCeC+O7TJmpnpahgBxp7cSeOmzlSTeSrnS/T8hLhls92lO1RigIK9myZ9s56lEIkCeNYYqeMJcfM842RiAdd12791S/8GN3Y6bohjdAs5KUZSzGEqWJ3iLqI0ct9g5VEytCCbeHSkOwS/7JYgxO0v9kb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(136003)(346002)(396003)(366004)(71200400001)(5660300002)(15650500001)(186003)(64756008)(122000001)(110136005)(7696005)(26005)(53546011)(83380400001)(2906002)(316002)(38100700002)(66446008)(55016002)(66556008)(76116006)(6506007)(4326008)(8676002)(8936002)(66946007)(66476007)(478600001)(966005)(52536014)(33656002)(86362001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?J6gzoN1OqY/VGPq9aR8ao79MHKeD981K3AKCjEoRWB5K3kH9wjtUp4AIsMmX?=
 =?us-ascii?Q?Z3L+dk6gaukq46B+0dT1a4cJNPWbtGJcoPcoqjzKmJLXUH4pS0haYdjHlHRf?=
 =?us-ascii?Q?X76PcjByUQv6Cdgm2da3ZyCozMorwZdqQGbTD/t7Z2laoNTy/ElUkEYgQSKR?=
 =?us-ascii?Q?F/ciCBeXgfukOch9+pU1e1LA/bDeyxx2S74/KZN3ZFSGgqFLmDOpXnQ0OOq6?=
 =?us-ascii?Q?8j8bSyig1y/sSQRnJ9ORBKCtGBg5l3y4dwD//CRNWeUMDCKVn8cCHx6iY3lD?=
 =?us-ascii?Q?7MEHYeYW4rhjWfFRKiTt/cQms6yfy+oUTfrN6MoXo6eFyj9cQFie6rDQ7N92?=
 =?us-ascii?Q?A9SPBnNGCc9SldPPrbe2M744SwyfWo/QGDU+28wmilMNHlf8GcjutiPss7mx?=
 =?us-ascii?Q?38h0FBtJVBX5EY9ZSEOpi/0eZZDiRiTXhZUx93jLz89b81Nf/hLXj5s/ytmb?=
 =?us-ascii?Q?L3v34ypLZHZ+sVcJks7/zHYrYOmrjQruIboThIlZL1+Nq/v+o3KItB58o6I4?=
 =?us-ascii?Q?6SUcvIlyBgbKVFEnR8/y7oUo7GgdD/PoFfyIxISZOlicelw47nnDoe5fRshi?=
 =?us-ascii?Q?ghShVyOe7kYMWLspu83mDOGmh2OXg58QWjmSSZU7g9cJiQcMyOb+C62ED0xO?=
 =?us-ascii?Q?SCQbbuOiyJWfLH0I+jDYPbvRfP973Z3GKvshX4yZj6MZcgbKbxp8xR9U6nRv?=
 =?us-ascii?Q?XB/dxuP4apBXkAwaDHp7I72W402g2hAvPlQdtSrO1CDoMaCIK4xlHUE0AsOC?=
 =?us-ascii?Q?GjiIiXOgZUjzWbLX7Nh89P9bVSmp08iD3eW3ECZ6bcRxCv499uBkiPf8Rupg?=
 =?us-ascii?Q?9nHZVzms/TTO6FgwE+oN9nosbuyKtrAR2ZuPMAB5xTjDgMxuIR+TvUklP5fK?=
 =?us-ascii?Q?g9RgOs87tV1RNGM3q5XZozjsueeSxmqgHScI7MiE/klKSd6krLnuTwZGLAUy?=
 =?us-ascii?Q?oyfYXPt74TCDBoz7HkrEwcNjHTukDqJkC66hA6KFderYd6QvXJyM42o1zJ8D?=
 =?us-ascii?Q?epwTdIsZjczaoXTOa0fkugiKxeieRLlZ6JrOQ8uBtoV3CVG6SdZZ2qy/vDFK?=
 =?us-ascii?Q?7BTaDUTrp5nN2MdMhtWID7w+/7Ng6ES7Jt65q148m5NljV5VNq0A6cmz6B9L?=
 =?us-ascii?Q?qvrYKGD+pzbbDslwpKUZNdw3JmHVPGWPi0fsc+Hw614naz7LfPaRscLoIbi0?=
 =?us-ascii?Q?wywRLMF4Pp6uG/DQWNpFjt9rKKgDyfJoe0HkNvlaQov/N3bZ6v8I8j731b3z?=
 =?us-ascii?Q?BWMG5IbPAv00VnvZlSlqDvrdAOykB6AFfWvJpGXCUlaU9MZpvfJGyWSh/jji?=
 =?us-ascii?Q?BwOAw2/4W8XqEy04e6TQ2kvT?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab18305-e72b-4702-05c0-08d8fe6145af
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 09:48:20.1959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UIZXOSM2uwZEZwqiSgJuZ9L8pMkw4NXYGcibJOMNMBtOCnfaRGNM7SSRJksOizDjglI7UlLHybo4ylIKGfYZxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,

This is the full report for yocto-3.3.rc2: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.


Thanks,
Sangeeta

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, 7 April, 2021 8:16 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-3=
.3.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.3.rc2) was completed on the autobuilder a=
nd is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: a1848a481e36b729c8e4130c394b1d462d4b488a
> meta-arm: 219fd34b7676ffedd1a1ad3626ec4337391975f4
> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
> meta-intel: 01cfc99a8f960917433a8a46b41bb4febb5b1993
> meta-kernel: 29329d7cacc71595cecfdd05a455a0cfb164564d
> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
> oecore: 14241ed09f9ed317045cf75a6d08416d3579bb8d
> poky: e1839b58ebe05242a52fe050aa9a08140136aa0a
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
