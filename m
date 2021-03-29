Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.18209.1617004092263509624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=KsiYEKKT;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: Kdsg9KYEf0iUKDMt2iWV083Yup0Bb4DoRee7oKKrLxWA5B3CNVRWbsjA5rrlZ0HKc9eeMkVoSo
 zYzX5oYT8xUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="252845906"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="252845906"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 00:48:09 -0700
IronPort-SDR: l/hLKNYXN3dMOJZbnY2LGGMgO+wxRUHWrLhJSzFLhHdVo+Ow62bvcEc0UySSgNs8Wii7sYhQ/W
 yOqZlmikZJog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="594989214"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2021 00:48:08 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 00:48:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 29 Mar 2021 00:48:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 29 Mar 2021 00:48:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZ3Ou8yabDrKn/dNM9b8aWLoEKMI9hfzTbzSbobcY3oKqtGOZ9Kynh0oZPqAxH7hkRXTamTH5ruacfdCcNeD7jT6XdaPFbCXTquXK7lt27P5JAEossyUh9ZzeRZpNnfBvjQ6+afrPGsup5FFdQ5qZJNtPUWzS/czSNLFGru8xNQLq1iWxVBUGKayurZxwl9r9ivAJ2DICsA4kd/l4poQ8Y1BLevKF/HMW7BEcQJqZhQu4cAbtfinIMcGNVNC9ha/HBzfz3NYkKA0akJTQcHz40o62A00GM1lhlYFlSDxvOyzAAxc/5ZIQ2kDIOrzQZBRIZW6nGpBssIDsDClXPF3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNN36CvfX/VGMjjaQKqrFR6SX0kmj7NqQZ8+dW3nT3U=;
 b=lzj8/Y9Tejmk570qzQP7Koj6dPme5UwW9Cc7tDdjfxQEYfsKpTRqiODwcWYVuJ9QpwU7KRBPtQ1BpneEcojildoEtxAXoOkqL3fQkcdE3v99Orl/XZeTLlJKDGPPEelt1AeshUf9jR1ulKSeKnv4ERTTFnFtICixlJ1BhbmN5Mt6Idu8GiEzjmgVLQjbi8HtXLIzqNnccEQdZ165n41znWvAYXZocmr+LWzgEbh1oPkO4E01S9dwoPUh5iIEhc/5lI3TJaSBwapN3FXfmgaCO7PGIz45MLK+p5gkPvROj8pFbhmXxp/6+CJAMG5yPNtES+Q08vHJrHQ7lVpsrvwuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNN36CvfX/VGMjjaQKqrFR6SX0kmj7NqQZ8+dW3nT3U=;
 b=KsiYEKKTOv6uX/S1WmM3g6GWPTxACUpQkrz4EivUg2xfk/rxKe9wUbqYFUhO1+yEpnDMcElJYTm2vTEjTGNS9iRdmi8ZS9FPZMszqdxwLd1kjA2RX7lyVuKJR4aPB2LV3ABq9yiujGhg1JLmnuKkKQiq9iUgxB0KpUspURwT8iQ=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 07:48:06 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::92d:48c1:669e:364c%6]) with mapi id 15.20.3933.039; Mon, 29 Mar 2021
 07:48:06 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.2.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.2.3.rc1)
Thread-Index: AQHXJE57LjP72qvC6EeczLw76qHg3qqaltDQ
Date: Mon, 29 Mar 2021 07:48:06 +0000
Message-ID: <BYAPR11MB3624B6FF358B3EF758243FA7E37E9@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210329034900.510C02A08D8@ubuntu1804-ty-2.yocto.io>
In-Reply-To: <20210329034900.510C02A08D8@ubuntu1804-ty-2.yocto.io>
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
x-ms-office365-filtering-correlation-id: 682fc8af-5ccc-4b4b-3777-08d8f286fdb8
x-ms-traffictypediagnostic: BY5PR11MB4323:
x-microsoft-antispam-prvs: <BY5PR11MB4323C9251ECAC1B5F823679FE37E9@BY5PR11MB4323.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AvdD7jyledWQuMY6epL4qSJxMDGuVRQf4pUBLdbHC0ZbEnI4SOmKX7FAhqkIXtZFwvtt8/RRc8P1J0B8bSF91rtdkbhkp4l6BYJPFv8EDrQtnOvWRyiMO6oW7iypiVQ1aZMS+EgkjY1scXVDGh+Vj4sJX2zWk1DtNANs/0GIEF4s9l2ySzZ8r6NDkfXmdRiSgQkZithFHd12Ai+rTEHjuyGsgagycKA/hZjvirkcDIH+7Vv2rBvsq84BQasaj9zaQyYuPF+jN/dD/E32O4XkhJR8UwHgQ4pHtkcxLsLVZ8p1muYfnP36N9DMqJQSj5Isg58tZxrRHJhQP9/IDUfFEHclJa8uMu3AeDJaRtoGI9V2bwTzFYDPLeP0ZwtHvaB0q+VCYnsrKw8uHn+HevtH/fRZKjVs69anjCKo+0gMg6+2TjmAge43UKmn+Oz/G5P/nB2W/VDDVUGm6bZ3IWChJepNSQDMAbOiK4kWXb3nHU0fV0Zt3BMd6MQpQgr5UFsw7LyBOiKdAHrmUW0aMYW3+4Oa3NDYqK4ep3BjjPiuHrU5dnDRfPsgJXCIp72qq6nqm8nuXb9+f9bxD2Ocu/U2QDnn2W5lF6P+SP9BRcPhkUzutaU5A83hg47l0wpkwb+IETnQBdYnYxEB62Lk/gN725yOouJ36+zGLQ9HYHfHoLqQpzHrZVxaQAsgpcT5KqZJz/a6mnWe33KNSVrXiK6l4BVy63qMLlDlOHqxzeGZ2bSto+xA4WwyjtPT+IF+dQww
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(136003)(346002)(39860400002)(66476007)(64756008)(71200400001)(66556008)(66446008)(83380400001)(76116006)(66946007)(316002)(6506007)(53546011)(110136005)(478600001)(7696005)(966005)(52536014)(9686003)(86362001)(5660300002)(38100700001)(8676002)(2906002)(15650500001)(33656002)(186003)(26005)(55016002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OclEux1yIbyVoNBbjlDqHOxGmUEGVq4Y3hRODO+XQKsVkwzHLfChHSIbxiPP?=
 =?us-ascii?Q?p9yqU7DvlYdI7KZzYp3CabtBEqpMrNpp7cVSy9xDFJ7eElKAU63AtVHansnG?=
 =?us-ascii?Q?JJkUqgl6TE5JAiNzdXueZf3xmCGS+fwVPJynKl4j2VfspY4cTOJpo7P7Mq0u?=
 =?us-ascii?Q?a7fEWkWL5ptJam6CgXGO6Ye2GSu7mF9FcSmL4lcyr95yrc4aP2xFT1buK6h0?=
 =?us-ascii?Q?n/7ysgT0LwRr3jrHLjDRRMwtq4eDgkqPYRCxH1TETsAAR48dFeqyJ0QH0SmX?=
 =?us-ascii?Q?11Lm7fd7OqL6vvtvoQqFtNRj2d8JSxyIqmQ8Qcwrom4isbaRDE1VSx2Bi29I?=
 =?us-ascii?Q?ac7c+vNz4ueXzVmUqO/XS0AXagKoUdFe7RSa4cTG2Hz/djnFIO5zNGf52kA+?=
 =?us-ascii?Q?k+NyugOWKqUkWQhzBvP0Q432FH45TxfS96qLm8igfpygNsSe5fTf7OZvMe0M?=
 =?us-ascii?Q?FuVPV1jocpTN/eHTaVS2owRWLS4majHIeCYK5V0/ASizEQ84bSj5DX3EcDH+?=
 =?us-ascii?Q?38TfOOUq9ZJYe1JJIM0blv09LNHtQ2BJ/w/cKIolfZeueNfaJwnHUtoML/XH?=
 =?us-ascii?Q?PS/LNhLgX5F+DoaSL0Rmq0QNQiPz6aeWENhCUGTUtMXdn+xI39V8xZwg0NE7?=
 =?us-ascii?Q?fyqxaCDZI0ClunyCQDoMs9QD9JWOBjxA1YmAfxmE0AZj9lWZpFkOxFwhCPpf?=
 =?us-ascii?Q?+t4/e08UFmi3ZWw8eg4QaqDMyS5g+Hehdd1CDjSAtsoZNFmeTxDBF8vb5zkp?=
 =?us-ascii?Q?qOhQ6XWCv0qOXdoRF40h2zdCsV5OAHjCk1EVvFMo/s8B2vmZMEELQ0DGl++4?=
 =?us-ascii?Q?DGf1hDfwa+RmUSaLDqOLthcSWlxXjN3PD3eqHi2wvUEdiNWedPxNHPG3IJkf?=
 =?us-ascii?Q?95y9HuZ66Kile/GvBvcEaddEuCShgnn7g1f86JOqSAQRGlei6+3xFDS0EdeR?=
 =?us-ascii?Q?bywlBN7aKDY6KVzUjakGgKQfDmqwQ7J4t6hd+43QBDJ64Ie+5MKyXzo2dQtA?=
 =?us-ascii?Q?P7Qtw+BlIlOBIO9dceEfw9hByhmttaD2RWRHqBVODeRAkMnXC+gFCSDTH9VE?=
 =?us-ascii?Q?jf1nssYs9937XQJjkEL/TJGzXS06orYNGgQJisa8UtEHBcMS2lbdrYtFhHSs?=
 =?us-ascii?Q?wpT6UW9pvQVhKEuLHln2N4E6Pvn5dA0A1aSkiY9bMt70QdgJ8nNWZfgqIrJ+?=
 =?us-ascii?Q?8mpvbxF6pTGZ2DuFxGUt1D8Gb7UjluhNaCLTJl+nfyReKJh5K0oFGTq36d4a?=
 =?us-ascii?Q?S9qwNN0krILHLeNWoCu6OQUftBGWJzBEpH+JhLvjiBK0myqrUXN9OgnIZQse?=
 =?us-ascii?Q?MWEjHFW1HF2yNOlqjhUwaVUW?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682fc8af-5ccc-4b4b-3777-08d8f286fdb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 07:48:06.8133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37EJ5UvuuPJD8ZSxsoO0pSSIvASK4v7FRZqkWVvwjhIFraBWrcMXNi8skPxDwJ4R8imyYlu8vXNvn8MZaKAPzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.2.3.r=
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

ETA for completion is next Thursday, April 01

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, 29 March, 2021 11:49 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.2.3.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.2.3.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 5d02c98489d3a5836676b9c3fb3bd0157449db2b
> meta-arm: e219ef606e297b98512887c96522d8d8c536bd6b
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: 76e0a427e58d068d0758fa052d2d1548067cf592
> meta-kernel: 29329d7cacc71595cecfdd05a455a0cfb164564d
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: fdae970656cc421c542af9856bc9ae038c61db13
> poky: 08665a81dcd41069eed1468f1587abe6b5893471
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

