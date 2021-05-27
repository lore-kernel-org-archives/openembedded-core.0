Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.2578.1622089362338864723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 21:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=xVPxbjM1;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: s+OCCnQy9GbSkXj91AXPEfmJjY1hpXiHBYSrHSzdH4U2IdC5m7Ig8GUKVnEE9Rox/88fNuZR6g
 NCK/nfRCcJfA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202678176"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; 
   d="scan'208";a="202678176"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 21:22:39 -0700
IronPort-SDR: uPMAQKmh5wBrah7sOjcW6rBVmOd4LH4Ck9Yg4T7F5UgAqZ+7bXEF7rFeCC7pFHmRqankKlk7q5
 69GG7Qcncb3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; 
   d="scan'208";a="465120606"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga004.fm.intel.com with ESMTP; 26 May 2021 21:22:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 26 May 2021 21:22:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 26 May 2021 21:22:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 26 May 2021 21:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF2fJiv4rdJXHWaRU0f3/SIpDof0rRAJq4YcERtrJjRDmar++dpmn3zvrJ1QqzecD0cRLO2YeUWsq5QBqtLXhwAh7kGoAiu6sevV68HUKrgsAQVbXUpKWTXHhzNIoY2ov5qU0E99DIP2u3o7aaGAxIGbDCW1m73ZW3o2nebcWi9dQ7gdIobtc6blsuy7PH6jVBbqsFqvYBb3MDjOMYlytWqqFhgHP1yE0n5TEcOweAl4MxCdkRW9n8StY5m3W/1Nx9XAFRkAfagM/iRMqBvAqgIjvj2MhEbMVt7USID21lvj7g9i+Td6Ns/0YBzOvlRy1+jR3irHVVxmZjHy3ML9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKlKRNj2K7qKy7eXQUkhC9Oxvg1B9xXWGMGsoFXqIh4=;
 b=O0BtSXzT0W+Cdg3nkUfPO8ME3D+euxTFs49aJxXjhJ2eIyu22gx1hlsAGQiwbBK/+VSAVT8fADNi9WUZ+KElxMd61EhhYwcjZZvmgnuSLENjmfqD0PQ4yeBmqkSAXcBG2PsODIEik9rGyzGJ7pXO0gHNq6yunvo6WyaEmbOJLtUOwOfAZMhfB9ZEW5lf2a/OK5orwX7iCixpJ4hqNdgXDzJcBDyBLrNRW14kHsGZfdMjVqafw1ZNnUrBufeRYyK4rCMegscxDxWXwS9vl4mnK/SJpc/IaU/jZfvaE8C54qNE95otFV2Giht/07bjI8AMxatfV6vTyBF41xeapE43LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKlKRNj2K7qKy7eXQUkhC9Oxvg1B9xXWGMGsoFXqIh4=;
 b=xVPxbjM1P5pcxVMwmMb9TBEUEyLkrFFF5a0tMU2UiDpy1FGmzvt/LxqcyP9JChL58cszvvhf7Ni8dGnhGFL2NH514La63zB+1wJhV/REdxzNKoY5wKTSUH8El0oxsTKhnxFWZkxUeIe2EOSIPf7mCkKbucbA8rMMGWA9P3WXu/o=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM8PR11MB5672.namprd11.prod.outlook.com (2603:10b6:8:26::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22; Thu, 27 May 2021 04:22:37 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::dd61:6eea:2371:8d42]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::dd61:6eea:2371:8d42%8]) with mapi id 15.20.4173.023; Thu, 27 May 2021
 04:22:37 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.8.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.8.rc1)
Thread-Index: AQHXUZ3LAPyCB0l5EEimwwCEsbcR66r2vE2A
Date: Thu, 27 May 2021 04:22:37 +0000
Message-ID: <DM8PR11MB5608C12FC36AC055C1A7F7C0E3239@DM8PR11MB5608.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 9edf41e3-7b4b-4ce8-8264-08d920c70f39
x-ms-traffictypediagnostic: DM8PR11MB5672:
x-microsoft-antispam-prvs: <DM8PR11MB56723991C9B1B54BEAE2F8EDE3239@DM8PR11MB5672.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZDaAjCPZ/WdOS8nIBVuBbyUuwZe0Nc5vCYU6RGJaMyCiS7iQCF4DMoRgFtRvNOOK/ilRvJQjvFTlsaNyGFtttN3UwPgoRLpGmlVmqxjb97WlGU74jxHFuCXaDmhmEMXHxeWdDAD/KfbOXhsh7QbYitiYqv6qkLYeXtNfDgdb5QXS10qn38LrFdv3fDVymnXHxfzBksRW3bzN6uKnmfJmojqueuUI6Us2orUuU5U/XlFpNntUzAlgRd2YFyrqI3zc+yunsr69bloizYKFTFw7T7dy2LR5Ym66ymDsgo8j3ttyyvcAOZ8+NqaiVsv01IBWI17ONo6gQda4MRenb0wP6aqOfsxENO6NJLCbKF4W0pA2W6kbIDgfvNd5mdK4IRkUt2ovxuqZ1lqKWbUywitkL4YsUQPPGP69SCeldPXPYO43Rv+D4WiG9Q69abkDA9iG0y29O6kv/egDSJKtLvJ9j7o1cFEfJZnKshvS5LhOnt53bMTp28A9Buatq/CbjuK6ZCtsYe4fqYwvjnnvrnU3wGYLobuWCPl3xFeo5TkvbCTIufqFH+dOww00OM+IVeLNv+TJIKKQg/i0hedzhogDj6EOk1bHxlO3mbBajKg38VhNk6zp16/Gu5SqnlfV9aVBkFm73t5Bm/SQqsDp+H73PxIAAtEgBmlb2nu4antJvHG3zSNpqvRJzivKthvHrgI7MikdWSvVfbqqP+4BP0ea2RSI/03fIf2cbdqO/kVTX1M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(52536014)(2906002)(5660300002)(8936002)(9686003)(76116006)(186003)(8676002)(66476007)(66946007)(83380400001)(966005)(66556008)(64756008)(316002)(66446008)(478600001)(110136005)(33656002)(71200400001)(26005)(15650500001)(86362001)(38100700002)(6506007)(53546011)(7696005)(55016002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?q6hLwcwnrpxabbc8Z5oHVEQjOcm45PUOUPbfBcNcQjTwVUiHPJ7I7HA9EyjC?=
 =?us-ascii?Q?7hafY+/To87WjU4+dfWmv16FFyYGFxqnZL4KVyumlpbojoQ37Wt3fX4D8LTO?=
 =?us-ascii?Q?rzQ1/cO11+Yj+r2gfLGKTZKlIq3K+e1vPhByLtxrAD4XdfxY2ev4kL8Y3rra?=
 =?us-ascii?Q?39Cyy6zRJiPe2S9xSCj0htGlPyE3mluag+cBicDSJghpX2PiWXkxyRdlV8Ml?=
 =?us-ascii?Q?4A++flj66TBSPKAJe4pUfRWJr02735UEQjJy5pWNcCOifLR/poilSumHc8Nt?=
 =?us-ascii?Q?Knv2ica5Oqqya+G2h2la+1WzsMRQTTK/Gh38E77ix27wevKSxH4sgTsMl/+A?=
 =?us-ascii?Q?kXxQBTMaQ8eV/lpNh2jNnMJdPBxBjKK1tr0AfHylwvUtM6qkKN5w5yXG1muq?=
 =?us-ascii?Q?9y1veESYIEhFzMcJTpPoenX8wvylvyi2BGA/AQJUkdarHaKwHz0tBoDam+yq?=
 =?us-ascii?Q?afSLGEdydTnp2qSFpz1rpbs/pn+wIuEF7kduTgiSxVwk/LCzsh2YcTyR9nQz?=
 =?us-ascii?Q?at5mc6AhNqfhniANm49bv506dhOlVotL0PUhYzGclclYDvOjpQqq7laEAh1x?=
 =?us-ascii?Q?Z4FoX29pUnj6rgVyeWbI7Vi65thnoaEHrYBDqppBtuR814TFsdWX6r1FocxC?=
 =?us-ascii?Q?mrzCx+30MtLrx1Nt9q3G3Q9IjkiPMvSxyUuOKyMn4rkNn3iXOX8RVfsMdOS9?=
 =?us-ascii?Q?EdkZ7vFsN5dr9uJMZKzMjIx7YG6TPDceg4LRRGeRCVoC3ugYBHh++FQCdo0T?=
 =?us-ascii?Q?W3aZhuj0oIRojo+i+tidH8eql4DqEystBsms8NW7YctveUV5bQfdfyIcLLzM?=
 =?us-ascii?Q?AekwSTlJYV+dGwKAH6Aso7/NUUxsbw/+pEqcDq8hcoAL0UkN2mkJO/fDAJ+M?=
 =?us-ascii?Q?Degztc64hkpI7pEuWo1zTgVqZXh3ipVhkNDNP4BBDynvaleomctc4bXNrVbS?=
 =?us-ascii?Q?4RrBK61aOgVDLXVdOGnGOKTuEIH4s++Oe8qq6WkC022gcVB38IFBXsdGOtlw?=
 =?us-ascii?Q?/ySRCO8V9divmcxLEu5dDid1BpHq+DJjLlGQZCQFrxw3xFaVW4ZiKKB6ABmZ?=
 =?us-ascii?Q?S6TzOBBdKSvxwvjhHbtmWkEhGV05kwA838DcdHPIrIHtUVkTXgXi+NP86Atk?=
 =?us-ascii?Q?Ucs5UmirrJv3Y1563fXNJDPOvAGZuOEA8gB+epiw+07278gLW09swAXl5CL4?=
 =?us-ascii?Q?iMHgtBSn5usp9kHHN1hLnOJ4AIWfvW/jtVOMUtFFTND/gBStEVHeegBHhfUt?=
 =?us-ascii?Q?WAylPAveWPoTRtkM84aJkEFdQSyihOFjWOIMEmVrujwSvKuCPmi4YbsGzxV4?=
 =?us-ascii?Q?RNnjy58ABOAjEt2GcHDiZApZ?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edf41e3-7b4b-4ce8-8264-08d920c70f39
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2021 04:22:37.4478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aX6cITlZ3ww2HNILNhxCWqzyKdBz1uySfkGA1Vdu2hh/bvNR3UjfslcmtDDoh/k9K/WsSyfStTzS1GA0M9I2cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5672
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.8.r=
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

ETA for completion is next Monday, May 31.

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

