Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.4423.1614046366976481520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 18:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=tf+bLM9U;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: Ov7YpW8cZDEpcKPb9nTcAWLtz15iXwLg7LevtVrkkFGCB4r0MccBNhTdinRiRycynLzhNbprKK
 Aitqvnu7xAXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="269614151"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; 
   d="scan'208";a="269614151"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 18:12:46 -0800
IronPort-SDR: M62vTHW4mtEI+A4vYx3Gvnie5UDXxjWvRqBkjV2Zc7dVrfL4eyHpsi/0hk87sDfFo8MMbh7Mkd
 HmdPtC0Ubcpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; 
   d="scan'208";a="370000328"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2021 18:12:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Feb 2021 18:12:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 22 Feb 2021 18:12:45 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 22 Feb 2021 18:12:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUzY+sIFDsPP2U/KF5EJFPfmw/in1u2KRyuWQ1Z/VBCbYqIKfNWYX2eFfsAgteyu4/LM5TTPpW0MHcuzIVNWWVJwf1adq731yL3RVD//OOKXwZy1Pd2HGaHG3XdgqSsedyKTdelSJ6ZIbOZjbbxLGyJMP+dulLMVsImSjLODllV4z9bFnwooebjvgQ1kenAkoHhLTSFZNKWVyED5EnTUXvf696Cct5Ua5Q/nRFj1borKAEv8LEWEEyBwcClM/Vduy2bsiRu81ay8IVoq8faVMNFKSGPeGR57WokT3PmEQYpfh8Wr7d2MVhFCkb0zmROZbBbe/u4NvTM/EjU0VXZW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z41/b8zIfPLNyCDnvNaETw1DEauKTrUa//n9ES+S8MQ=;
 b=WZzsPIGXj+iOOIeDARXTlfHhWv5blwIlLFM33jncrTA/GFlEemtGBuNy/tzAG2dZUxCluDt8mATwDaX2utZ5j7tnDOIl4MPVAAO2wTk9U7Z1ixZzfEpZTyDtZ05WnLPBqt+leiC/VvE8OkEzmWZQpR86kbJeB6cEfBMmU7PoSHpCgVqG5iFAoDw/UX9EcreTWNokFpqgWwrDkzfeZd20ngNSKP40nm5amlYYXLDhWN5KTbFg8OMFU10manQWJ8+DhLQDDxqAe4cFUgjihttyyVgXYXG9awxbTj2fPkGnxmd4FqrxqJbeimvai2EGm0vchRxKWQVtvzqFBuAIlu+wWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z41/b8zIfPLNyCDnvNaETw1DEauKTrUa//n9ES+S8MQ=;
 b=tf+bLM9UQEPkVkbO+pkYaGRW/QOVDiblqtUBSrhTNrs1JP1HijmMUIt4+HZno6eGdO2syZRmjxv1NUZlIb7gpx65BnPiZXt/N3EqDHEIM6Gc6hsVmHIfxtp9qwotJPluwJZEa28MLsbNgkyfUsd978QvohRNt4fxFrovvfoJADc=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4388.namprd11.prod.outlook.com (2603:10b6:a03:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Tue, 23 Feb
 2021 02:12:21 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 02:12:21 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.6.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.6.rc1)
Thread-Index: AQHXCWzi0XsNxpsuI0WZCv6k0vp3bKpk/3iw
Date: Tue, 23 Feb 2021 02:12:21 +0000
Message-ID: <BYAPR11MB3624CBA1A765248CDAC64447E3809@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210222224808.50B89817FA08@fedora32-ty-1.yocto.io>
In-Reply-To: <20210222224808.50B89817FA08@fedora32-ty-1.yocto.io>
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
x-ms-office365-filtering-correlation-id: 18d25c6e-92b8-4e6f-6563-08d8d7a07453
x-ms-traffictypediagnostic: BY5PR11MB4388:
x-microsoft-antispam-prvs: <BY5PR11MB4388A31A9D0C67888460BE5DE3809@BY5PR11MB4388.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dVdTSjMPDFwVHd4aWP5ff6BSO1cCw09ICwDjriJlAxIWOKqup6xOEUbHeWlGRWsDbhwXWtYNsQLKGq8szj5Wz2CHwRM/5uLyDgHJr5MzKQ5hTvSRezd9ZXJZZ67xhpcByGMpIXDId4XNxBX3d97HgQiepEup3ZM7SffzYnSG3huOj/rz9XYnh8hqmD325uL4e1wjqoRdTZlrUAU/skbC9mEYOv0HuljnKU4Mfv+ag8dgX9MXHbYrl+d/nuxWm4EkFtquKhqDUK116VIK9+1hZhFXiDJRlHyDBN2uZb6mr2egk/RxLZR/0tFyUA9jKtCdQAqSXDu+FqRUTJoGHXfUFkSBNLcBDaPcnGn4TMSR+8G8nh8iEhrCJk29NFFGwyhZVZMIfvqJ/gnHH6QoVXii/sB572WV49B73WSQl+t6TysV2jT5/5xxTOcGnMkGUpdfjcvzytDG6vIb6ygNxBR4K1uokWGei//6Sa54naYJQpSSqbcflKiXMSX3cmJ6q1x3s4w9jWWnwkHrHpjKeZwTsKJqbBzpOLo2ThP9w0Q1mcvhqcJDVoAa2Ke0nGXfH7ZiXyFqUbmQ13c8JY8wSm340q/eXnrp2Br+9Do5lTml9t4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(39860400002)(366004)(346002)(15650500001)(4326008)(5660300002)(33656002)(8936002)(76116006)(8676002)(71200400001)(26005)(7696005)(6506007)(478600001)(83380400001)(966005)(53546011)(110136005)(66446008)(186003)(316002)(86362001)(9686003)(55016002)(66946007)(52536014)(64756008)(66556008)(66476007)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9Oq1iRL1xDtB9ujrKg5skRIXtBz2XfPQHZaSmBT6WzRbmKQ31C9f3hO6s6xJ?=
 =?us-ascii?Q?T2FB/OBsJPynfAF/GLrBJfqcsE/yoCj2btO7U/m8RZbzhOkWrn0Cptt8wUXW?=
 =?us-ascii?Q?kIjByL0mvmigKKafILrVJ7/uvImx0ZGmnX+q04MtnFTDnYxUkXkjOJ/gYoy1?=
 =?us-ascii?Q?Izm888aVzbQYw+B5zXECtyRfyyCWZ4GKPy0RFTcQ2/jb1Act02Rx7CmtK2s5?=
 =?us-ascii?Q?zIAMtRHY6Wz5Dmz7DK21x/u51xLzNdDt2B19GtpdWPovYkgbuBw81tcr0FCZ?=
 =?us-ascii?Q?B+GkBfgnXrXAg8+iujwBpyQrhQ0LbrhAOzYXCwRb1xhT8qPBPL6NFRNihxBg?=
 =?us-ascii?Q?u8gX2fbRS4JQl8egT0uHRSA6wVbr0xe1S8cac9MpjPgB02HJTDWxpMaryqQV?=
 =?us-ascii?Q?zLgozYs5dzw+e1BBcJLQ8ExxYiJl9jR9n4Qh7p3p/ji4Dv9AEgCqJ6XXsA+b?=
 =?us-ascii?Q?9XGdgqD7EH7mdQ/MjiRx6+ShVmq/kheg9jV/8JqpCmIGw6BXyHHo+Uzwzmja?=
 =?us-ascii?Q?GyA6FVJHGbhF4coktx8BxqlWvhpPK++LSZzSOKn259jTi2jVQVchAaCH3v2O?=
 =?us-ascii?Q?5djmC1DsbUDmoJj449ybmVbOlOKw2n/OZj+VLkNGoU8LTBthK5IBVgJOS6dF?=
 =?us-ascii?Q?BSI+BlJ1vogqopVSGCIYEFgPRC5vs4mjZSRVRwJBC+jVkXct/8fhuwfwG3FM?=
 =?us-ascii?Q?CTvqVVbMN6/AO2DWw1MTJ3/IeS6Vmn3+mIabmBhpm36/UFB7RFLybElxpKMJ?=
 =?us-ascii?Q?I5o37Mq9ozRoRgqsBtKAwCpYn/0ijcY6csApPpmxBkAcjKPG9zM41rjcsq5+?=
 =?us-ascii?Q?2XkwyZAgRzAlmeT/LfXr81ExQ2FBWFlIhEO28MhKipkgADkyM93/BYqTTPOf?=
 =?us-ascii?Q?0xLpqdTQIjCBSfT7yvvbRcB2IWa6f26yHV28SPoCA1WZ0xbQaALispZ+NiSS?=
 =?us-ascii?Q?k3lrmY6Z5LtWYairhN+TDGZXuR7miOYxqatEXfa8cw7MINZm7mcOIlkE1qfZ?=
 =?us-ascii?Q?WDz+DIxlp0knXHWEYMbmcUWFMj5KjVtD8+Hdpzi0B9KLl28dDSC2Hj1UApcb?=
 =?us-ascii?Q?G34XXqHWGWrX1jWVkOe7UdEy49B4eBn+bzQK/XJtFFeQg9BcTD0xjbWMJ4l1?=
 =?us-ascii?Q?MHy51mIef+oLXFZW4XYGJti8pDVaKzdWpMZiUW/IcERyB7lO/yABSnqkIiN6?=
 =?us-ascii?Q?zcmBGTzW7Zm4BAdJwzp2qA/xcOujV3cdkxQ/0+0Nn3uFW2xs1noofHTo4f1V?=
 =?us-ascii?Q?LSpMvRQPOfSs303JzGg1TZmqDS8iHCX4iKJNt6BiNojqJ6MgIrBud7yZRoaO?=
 =?us-ascii?Q?zCvfVarLaDGA1DUj60RpzfLI?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d25c6e-92b8-4e6f-6563-08d8d7a07453
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:12:21.8747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQRFRdEXa7VUqwFXADCz0Nw+4uinzNt5Z0fmmaermmZ03qCUC0YDu0MZrII5nc2/as3gKZv/ehDtiRCxmdHnGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4388
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.6.r=
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

ETA for completion is next Thursday, February 25.

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, 23 February, 2021 6:48 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.1.6.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.6.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.6.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: fa94374baea75a94e3a488126ca7d8e241a77acd
> meta-arm: 02c660521619ddb7a9495d65403aaa2636747ce8
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 4bd62a7e154b8c9e8a114f452d3b062d8d058118
> meta-kernel: f793168bd19af3d8c5a260dd35f387ed9a31794b
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: a8debddd6cbdd70db74e096d72f97fbee008ee63
> poky: a13bda44fcda4e79e9aed39ca1495eabecb6a7b7
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

