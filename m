Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.42531.1622457014005071919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 03:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=fFlNocTs;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: LVRdmnfWCfjWUQJ2p/5m5AOFTGCdfh5gYZxQEZS88QCZ8c3y15ff7+4Yn9GcX7SYQJnbffqZws
 baITsX90+IMA==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="190698738"
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; 
   d="scan'208";a="190698738"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2021 03:30:13 -0700
IronPort-SDR: rhyBqs9bkTtwFPKABX2/cheIxfPvSGMq+BCd8n5ekHZtE6Jy+HDPnxJFtcUIC3gL0d0ipkTfZG
 bRjYZ2vdqXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; 
   d="scan'208";a="398930204"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga003.jf.intel.com with ESMTP; 31 May 2021 03:30:12 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 31 May 2021 03:30:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 31 May 2021 03:30:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 31 May 2021 03:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3AM37E2jGzbmmVcnysdp4dR7w99wnYVBCFG7L5/MHYCN+rkYW2LHbu69qICtrpRehSk+3pnij38kyM0u0IfE+KvewxPPhUb82tzaPgR8tJvupQow+sWZcSiqTziqLxgDnuNpW/P45TypaAQpAbsK20F+IwmpfALc08WcvIsAFlOkC2aHapG7q1rZkV0fJYXHcBM0OzMkXVXcDQItAE/kdU+CKk++DHcF4a8dbg5v66B/AIJHynQngu/TyfrmG599U39vJYDS2KwlF4aYTnyT0v85hOYc4ruxcKeTIVQ0xwqpgA+qF3T3V/Ei4vBtCDct3t2UmNYFsuWnrwy+MlJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12YxbAj2Jk+IYBOdhpIeDZ4Bdb6RMWBU1ganIikgkiU=;
 b=B0Woqv2pQsGn0FP3Gv0lSXVZ54REBYVA1IQP/2bXMdNBbHeAldtE9oQKaH+Jlcl/54PsOc8G8ztokbz+q6szCluF4fNyKnLq705LLfCWzXmZKa8RH+oZwgs+trE0kKrgZUUj+jMI5xUjbjDHRSavbfccOUEZUaKHJtsz1nKNbuwNBSGqNsvlYJ7JQdju90yuiCZkPx/nUOjeIn9HpATGduHu1hgpKRXoISsxzku0t5r56nlwuHpyfXE+qSM7eBVfV71xRysZhFtKmkGApAfbeP3fXEvHbvBfXzGX3p2K12+ENuMLfhm3G41/meELTZ6TNB+gATPX+/57AabB4nBa5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12YxbAj2Jk+IYBOdhpIeDZ4Bdb6RMWBU1ganIikgkiU=;
 b=fFlNocTspuOjXCBb1ImX799GJTc8mzMrXs/j+PCx1nFd2v7GlVXzlVM+tLvXyz+oa5IbXQifVgwvoH1SZjHHicOS3Jgb+Uo8FlF9aQ/VNAJWBziF9XP6dxzzNnNBVbZiNyX5ws8aPnS2FOzRQX47y4h2TQAT50MSAuwVl/2uCxs=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM8PR11MB5576.namprd11.prod.outlook.com (2603:10b6:8:37::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21; Mon, 31 May 2021 10:29:04 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::dd61:6eea:2371:8d42]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::dd61:6eea:2371:8d42%8]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 10:29:04 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.8.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.8.rc1)
Thread-Index: AQHXUZ3LAPyCB0l5EEimwwCEsbcR66r9a13w
Date: Mon, 31 May 2021 10:29:03 +0000
Message-ID: <DM8PR11MB560880597DDF3F82AB631158E33F9@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <20210525193955.E45B54B5A3@centos8-ty-2.yocto.io>
In-Reply-To: <20210525193955.E45B54B5A3@centos8-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 05fae0a7-2429-40df-10a6-08d9241ee9d1
x-ms-traffictypediagnostic: DM8PR11MB5576:
x-microsoft-antispam-prvs: <DM8PR11MB5576C4ACB9B3C4587582CACBE33F9@DM8PR11MB5576.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QmXLcEboADsLMYJmR07M5oKVNe42ytBxXA5DjVlfX82RdVef52ekAGx2kwtcV30oTJlmZfZVXyaYdXIbFFc2jKX9f9tCEf5DCoYbrH2y0WGHbZ9KqdxCenl4zR5eMo0edStk/Q6jqq5MB9H3kvEZ5FKnyKH1TatR31w2Rr2lEJXUEvteDzWvzRqZ5gaOpUQxNZ8Ui06Y4MVB/YCJxfwuv+uZ/wKzoSWBafOJMdg5vYJjPgWWCEbma0TuJ0RzfkFMmek6oqjBl97kGpdBZJt4eHuAaHbPMvMhp65SHKh3CbgOjiNgDl0QNBoXnoPXqBMMX3B+I7b0b4RRmRSsLuYGzn1MhVqWCFTqCtfU/7gnBgJVJrYByCLpzE81TegTwvTMBTzhHNJddjS0JyAhtPxlsoaP6qVk8DWHRJvurrUzQ6Vur22qDJI/RbsV6wQAOc9RVeF1CJJX670f/xm6dcYAJIgmI/L5iZtaPzD9FQmF0cVlMd+0Vzw7+0RRmJxScX8hQ6RK8NzG8jHlMofZt1+0z8u6aVjdifKNDGtkVh5I9JcpLG3xI+7IFmqPIHsUD59wgH6C4wosXD14BMUMigtu58HvlbC46oO9rNCOcVx6tZD2mdk1AfrU2AwQXJ16Wv+42Jeqn2EdR/Oun9sEvCVx52vNH3dlGEb7JzBdwk0VCz5gQXEFx2Xj9TDehJYzCPuTk023MHfl17q1Hlv0Drk8n9FLf4f20hdIyr1EgBqjjpJpLb7PceuRVNKb5aZj0ZwwqGEThJQ8v0Cib1noIQ0qHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(346002)(396003)(136003)(376002)(966005)(53546011)(76116006)(66476007)(8936002)(64756008)(66446008)(478600001)(66556008)(2906002)(86362001)(5660300002)(71200400001)(110136005)(122000001)(15650500001)(8676002)(6506007)(66946007)(316002)(7696005)(55016002)(26005)(9686003)(83380400001)(52536014)(186003)(33656002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?k5i9QdxVvFHokWFAJ65YSHncfTpptXQ+UbPjJvw5b8w2CiKZN1vLhRZnfp0M?=
 =?us-ascii?Q?j1hTowpxoPUYsN5sHpFjRD6ORwFaL/OuYb9cjYzgdQCC4fs9Gh5DDnvRkL+M?=
 =?us-ascii?Q?WqsyAPVx0hXXdTBi3cvWqf++ME1ZkqkC7CT6rsSHE0krFzgHuFvbqQ6LFF/u?=
 =?us-ascii?Q?J5gf18WrebKcUJ7FiuOiXamU0yjyvPcfcxpfj/tzVfM/x++iqT/oRU2Ap/Yg?=
 =?us-ascii?Q?EkWpt33KiWPKeowZDeL2ipGLzOQDLLYg7uNkb7/4GBrGnwwDWUb019Bk+I0A?=
 =?us-ascii?Q?VROtttdeL+2eUb64zkno037oQRy3hvab4jgKN685zFYb4NjufC3VZ8kCHq3M?=
 =?us-ascii?Q?HEXl0/4GmXyG4YSaaKIutCecL/hiCQyp3ImdivYtzpCCoCpj/JKsVXWEkSrL?=
 =?us-ascii?Q?o9xqr6/vTOD5a7Gx7k3rIE8LMc1IDJjnfjgKXM+m90wiM9kqMD6s6nPJM0ZS?=
 =?us-ascii?Q?vdlHp7gqbRRnIaUaYi1oRehQ3nRYkswdphxHP9ErHGQJ6kCtoihRjX6vxUdp?=
 =?us-ascii?Q?ytiiHzTKAHyTL1OErJicdXZS1f/lQ6yS2CLRbeTKGenGAlrf8MtkczpncpCw?=
 =?us-ascii?Q?9K2BYQsgKUcqkuRvxX4oRgAFYZYYnNA2pNrh72B6xwuvJUw0TbppzlMCu3Ce?=
 =?us-ascii?Q?cD/97cIPvNDD6FRWyryJRl6DhVNsPE2bkBqMPCVABguQRp1cMlxXC01L9/i8?=
 =?us-ascii?Q?NxdyqkkzOhYMOwyHb3sGSN49n51lglPkSmfRGH/c2Dnp4fDJnzTNyiofrZlp?=
 =?us-ascii?Q?b/jnnUWt/dzeLOpPbXHKCxbAVhs5SM6wkznLmGkoCx0HIOMZX9U3nwxeSPVq?=
 =?us-ascii?Q?XMtSNP7da7VeYvGWvuL2PpnNf7mKKcsa4I0wzxXvXTSDOlC8sMgwMy7r5Cj/?=
 =?us-ascii?Q?D+g2Uid7IIdhCahoqMSBX1vO1wPa2tjgnOu3xsdccMDwk3WeUuxQPYTgxKOC?=
 =?us-ascii?Q?3toMPbfkf5sv2X7QNOomURAhFZpPfhuA5j4yUnpoguwUinycCFJK9Bblsihx?=
 =?us-ascii?Q?oUOvWbCyvMN+Wa18X1kEy9PLNRkyd86h5xlFtzALJ129quDr9/rJFfHxJqik?=
 =?us-ascii?Q?D5RBFBnP3x4K5gCTGuPmDAdSa8uQayoYv4yhjERp2cjTMGNpKKpr/T8+3tVB?=
 =?us-ascii?Q?ciWTxh312r4sTxqYk3r3QEEw9+jQTHT0RTtf3Tw34RGSxFrpMEJJuqNfprTP?=
 =?us-ascii?Q?d57DxM6nj9Cjutvod635uwQJBDCz4nVtPYSxNeGnbE/lq6tS9Wp4pQXc/SWI?=
 =?us-ascii?Q?BYUWHr2oNmafe+mQn6/YrmwfCIg2nZMjwAxfCC613Qfnu3hE1Z70a+0VP2o6?=
 =?us-ascii?Q?HrzMkDSbfHgcls7SIflNwNtY?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fae0a7-2429-40df-10a6-08d9241ee9d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 10:29:03.8693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NTjE9S29oVaEVUE4NhqaIrk0bjInC0N+LK3Sk4FPO/jDRKsGoFqV1KRdsXb9GaqdzN14LNIzHUDyIUl2UhAagw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5576
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

This is the full report for yocto-3.1.8.rc1:  
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/=
?h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

1 new issue found:

BUG id:14414 - [QA 3.1.8 RC1] failure in ptest : strace.printstrn-umoven.g=
en.test=20
    =20
    
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14414

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 26 May, 2021 3:40 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er
> build (yocto-3.1.8.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.8.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.8.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 078f3164dcb1de7a141bec3a8fd52631d0362631
> meta-arm: 9dadb61b36fdd09a39d8cb755fa29d03928a1116
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 2fb89eb85dea00de9446c1cf44ba6a5586f42c84
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> oecore: ecd636154e7cfc1349a7cfd8026a85eafa219535
> poky: 6ebb33bdaccaeadff0c85aab27acf35723df00d8
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

