Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.4347.1631691218016618283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 00:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=dGYonSTp;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="221911090"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; 
   d="scan'208";a="221911090"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 00:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; 
   d="scan'208";a="698159334"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2021 00:33:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 00:33:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 00:33:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 00:33:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 00:33:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJQ2wDyDRbgl+cG6MJGL/lJluUC72g3lYyQ4mXYe2F5zg5UYm+BL5/72lujVdXUFspKITWwJApUNu2XpPzys1Q0Yd2DkrMkID7HOnFAAd7ELfGuvdkaKb9J72Fr/u8igeJweLkYZX9K7/7RaZqlmu4PPq6cxu1leBb+U/hPTPI3MyPTN1EHVH+VOR5B6AapRu5XNdBPw/K1rO1tm0T8xhtE2bLVtAcmVmEtB8iAJ1JS+JWraNupnl14TxybAz4qzUihc0xblKz3Ngk1ecp6vLV48tgzTxH/NUAFumD61XJPaXCgBDGhAJlOh7RzMFsDkzp8BUMV9dOUtDnUy4XamHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7pyerf+5ipfNtHLER31uV8nMlzqpvsTpTjciJM5ZLYk=;
 b=fbA0Z76+jgau6x2ATuzIJIk8+G9sC5lLhRwyyHTHoXcwXOHtFT2clB0Z0fGWxOuTC3fGaFEN1C9yM3C2FTLQtRSIyT6AbEWk3olmgaiiccHu/aXQjcWaHjh7ZFLKFVVKEppC9q20n6MAxU+QZONqsJLNH5I/StnDtOqkoZe6QlOzTizqYex83zPQGzlyK5uT0BlWI/GHDE1vVgAqdOsPQznpXnWN/f2/Q8XWrnLZqGp0ABf3wBnyvM5l9Uo4mt6PguHbQUOhxpdf346ptuxiuPfCzHRbs1Oup0fmdrRA8rRp7mrZ1/j1WtzYX4XqHQAk3JG9lQ6jrZuDNT6cDxegLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pyerf+5ipfNtHLER31uV8nMlzqpvsTpTjciJM5ZLYk=;
 b=dGYonSTpHOUgtQxpVLjcb8BNjdOM89D7J5lDDls1Kh6Xka4aUFfb1GgbHYCuXj808/uDB5i/t8jVomWVrgk6t17t7fypsrNRpus2aHL6TbQvpyuR1UNhk046LfXSQnMhhz82ezfFiP2JWYmi+oba6s+sgK/fvurcnXqUwrlT1kk=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 07:33:33 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c%8]) with mapi id 15.20.4500.018; Wed, 15 Sep 2021
 07:33:33 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.3.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.3.3.rc2)
Thread-Index: AQHXpbVH6sWIQWJtO0yz1L11rcG/qKuku0zw
Date: Wed, 15 Sep 2021 07:33:33 +0000
Message-ID: <BN9PR11MB5372A2F3298A6F0E66F2C360BBDB9@BN9PR11MB5372.namprd11.prod.outlook.com>
References: <32334a100a5bd0c20239e42a463e5604f00345ec.camel@linuxfoundation.org>
In-Reply-To: <32334a100a5bd0c20239e42a463e5604f00345ec.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4635f455-4573-4de3-3b0d-08d9781b1f58
x-ms-traffictypediagnostic: BN9PR11MB5276:
x-microsoft-antispam-prvs: <BN9PR11MB5276A049631722B535622292BBDB9@BN9PR11MB5276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ajX3jSC92HhUZXKYsP1r9fis10RujHXz9VneNvNBaRnAQaHHJ+ACUc4csGve23PAd4Ktp+ZCxRe54pVAA1b0U0IiXjNaXDNFoFIRFHBh3BQOe17u9og9mv2a2y8Eo7G6LCGvtncDk37X3uynvJ/IliSFhR1AgXzA3h41T1zwkCuqjCFUoAYBr0cO6+o7y3reBfO6cPyY+klAiyaPFo/QVd12knaWc3kxco3DEikSSGTfI3+o1O8HTQWulCba/UbdVomcHmJ11sWHn7fFujmhdy3BJVD0XlhrE8SzWSziw70Q+7gSosQ4rhbi8OHC4g8jUKkT6eRCVo65EYRTm6wiHegOaWcpoIj3G64vxyckHDERJVC+OTOG4TP+a/1NZ4ZQfsVOW2XiLTmyUCGlMD/uhmuhDaCDdpUApfzz2U6ki08m56locyZN1MzM1P/YCsn8pSeDTQMho9UQTtW9cuq3/2fgxRrkS87RbYnxiWbJmS2aon0aWGG7m1RjaYNLELYCDh7PHdEg29GWuazhECvHT6jD+pBQUQoJpvn/YpGgsO286EbOg9XoohLKAVvtzkYHW3dgiIc7Mvfo/3CKltrl40xwJ4RBhbmymq/JQDOIife39YftyXWIL6hsU/FKNeI84M5ErXLS1m4bn3Fer6IAVbORZOIdPFlXWtJiSn0iVwKJkYjCOk2JIe5dzUA8jMlb96+3ZrNVhSw5BnOBeEBv6ApKR9AairWjlVy9HDWLqf2S54rCwmecVXm6e9p+pWzEN8ooawbmhNHkkqBq/9DSa0E5YrMz7nizrCuGdwVSMuACfzyWYGl2wSx+Hp5OZak+9J3sAtlbWYJO6Gb9EY4Jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(86362001)(38100700002)(66446008)(26005)(9686003)(66556008)(66476007)(64756008)(83380400001)(122000001)(76116006)(8676002)(66946007)(186003)(6506007)(8936002)(316002)(110136005)(53546011)(38070700005)(7696005)(33656002)(5660300002)(52536014)(55016002)(15650500001)(478600001)(2906002)(966005)(71200400001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUtiZGVtajlKSlhBV0oxRzdMUktjR1FrL2tmZERMbzBYODk5Smk0N2swYWJj?=
 =?utf-8?B?dkpGUnBIVEUwTFhzYmo0ZjB6TGFvV2wzL20xZHp0SndyY3VrQVYydnMwL3FG?=
 =?utf-8?B?bnpvOWI0dlhNRWFnOC92M2RCK1pEeUl6UC9SYW9FMGVWZUpjblZHZFFLY1g1?=
 =?utf-8?B?YlNKWm5ndHluYWRjL3k1QTM1SERwN09ycVgyck91dkNJdlAwUkNXZHFxTTRn?=
 =?utf-8?B?YWQzYTE3b0xRNlNzQjBaM25Tek94NHg5bm5xcGRMZ3V1d3AweU03ZWNBUzM3?=
 =?utf-8?B?ZGlORG8rZGdZTTZJaWNkdktjMjdXTVdGT1VoZnV3UXR1SmVKMTZYVXgydm1O?=
 =?utf-8?B?UldrYVFza3JqbytqSjZueWFuUVdRUndMOHh5S2QxSldHMmVCRCt3ZzRyQnJK?=
 =?utf-8?B?UFFxdFpnaWRPb1BPUVZocGl4bzNMSWNQWDhjT2hWTjZsRVJxZ0JnWEVQcVBH?=
 =?utf-8?B?WmI0WkxRRHNtZDhVUisyUWFBaU9HSjZ6dWJVYUVvQjJjQmtqZHJVbnowWXht?=
 =?utf-8?B?NVBwaXFabml0Sjh5Z3lkNTNHNHBkWlBSeFBSTWV3SEFpajNyZThXNEticTh6?=
 =?utf-8?B?eDVlYXB0SS96WUx0THd5S3VmR1M4MlFDaFlNWmdqU2JHcFhWZEhpVzRlK1pK?=
 =?utf-8?B?dmNOdW5BckJBZTAyaFovaHMySUhCZStQWncxQ21OZWVWdHRGV3g1Qk4wamVs?=
 =?utf-8?B?ZkRTU1BPTGJsN2R6N1BIa09seFFLd1lLL3ZUd0V6b0NyMTlObEdSMm9USzRO?=
 =?utf-8?B?Mm94eSt4d0VNekJVSFJuL00vUDFoMUdFWExmWi93Q1RydGwxaWJQeTNoYnR3?=
 =?utf-8?B?VXZNT2k2TmYrV3BmRk1kZ0Fvc3ZDVDBLeXRMSXppekZHbll1bkZSN1B2cnVx?=
 =?utf-8?B?WENPRWhUUEJwSXkrMElUZWJrd084RHZQQ2ZnYXJOaTZ2dmFXcE1UbnhlVjZl?=
 =?utf-8?B?dDd5OEVobE9rVE1JVld4UXkreUJ0U25vL3U1Z3JsV3kveC82Q0hIa1NxbVYw?=
 =?utf-8?B?K0ZFOW04RTFUZ05JdUMvVGk4NnR0M0JBeDlaM0kwd1JwamthUVhvMmFyZDBP?=
 =?utf-8?B?MUZ2ZjhvMGVqZnB6QTM2VXQ5Vm91ZjBxQi9DcnMzRUpWei85TkNOQ0xWRHRp?=
 =?utf-8?B?QmhVd1VlMW13TmxyV2hsYXYvVjlFaDByT3lSUVlPdTRXSDNZaDhXU3RicW81?=
 =?utf-8?B?eGlLL0drem9jWHNuOFlxVjVzNzVtOXp6cEVyL2Yxakl5ZHh4TlYrOHpHQVNu?=
 =?utf-8?B?Z2pkQTFHTkdpUFh4eDZMb2VCR3R6TmR0aHdBbjFWRDBxVDNHcCsyWDF0Zk1k?=
 =?utf-8?B?R3N1dUFoRlNjNzdiQ3M5bzlJSVhNVnJsTlNXZXZ4WWlVT1VJZzR5L20rWW41?=
 =?utf-8?B?aGNyamkveFNmUlF4aVlJRTVYaXFvZkRnTEJrOXdLL2RxcEI1MmVjWHlmbFlq?=
 =?utf-8?B?SVJlbnVwVUwzSE91YnFZR29xaGFVQ3JIemxZaFUwc2crRC80R1pmNXkyLzVr?=
 =?utf-8?B?Zm9xRGEweGdNdjJ3UkNQSEN1TGRnQlhPeFpGTjBJazVCMU1xNERlVGFwdHFp?=
 =?utf-8?B?NTQva29jc3NoQzIvVFFMb2RYTWtuQUtKYlZZcmlMa1dRb25jOHQ2VSt5dXV1?=
 =?utf-8?B?bXVUTXRwbmhncG9lTFpLTFVqMTBHTXVCbzQ0TjZ4VnAwa05sSWNHMjlCRDJW?=
 =?utf-8?B?UlZFOVViT3pndkNqSjdITGFSL0tkYzRyNVRNRHBZQlFkR21RaVVmYzdUaERJ?=
 =?utf-8?Q?GeUvtCr0OaAM2m+5d4qmoy7uxAQ/DA77wZUFKu3?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4635f455-4573-4de3-3b0d-08d9781b1f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 07:33:33.3319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuvTELRKHK+GUOwbG/Aly/MLO2HNc3Ho58HWOhaP3UYo4QLjKye1Cy4QDaCjRsOuIPgVY721BG3ZzGR3qWHjiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
Return-Path: jay.shen.teoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gYWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4zLjMucmMy
OiAgDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9jdG8tdGVz
dHJlc3VsdHMtY29udHJpYi90cmVlLz9oPWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQoNCj09PT09
PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8gaGlnaCBtaWxlc3RvbmUgZGVmZWN0cy4gDQoNCjEgaXNz
dWUgZm91bmQgDQogICANCkJVRyBpZDoxNDQ5MSAtIHN0YXAuU3RhcFRlc3QudGVzdF9zdGFwIGZh
aWx1cmUNCiAgDQogIA0KPT09PT09PSBCdWdzID09PT09PT09DQpodHRwczovL2J1Z3ppbGxhLnlv
Y3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTE0NDkxDQoNClRoYW5rcywNCkpheQ0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlv
bkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0NCj4gbm90aWZpY2F0aW9uQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBG
cmlkYXksIDEwIFNlcHRlbWJlciwgMjAyMSA0OjAwIEFNDQo+IFRvOiA8eW9jdG9AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IENjOiBxYS1i
dWlsZC1ub3RpZmljYXRpb24gPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnPg0KPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmljYXRp
b24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZA0KPiAoeW9jdG8tMy4zLjMucmMyKQ0K
PiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tMy4zLjMucmMyKSB3YXMgY29tcGxl
dGVkIG9uIHRoZSBhdXRvYnVpbGRlciBhbmQgaXMNCj4gYXZhaWxhYmxlIGF0Og0KPiANCj4gDQo+
ICAgICBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by0zLjMu
My5yYzINCj4gDQo+IA0KPiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiANCj4gYml0YmFrZTog
YzdiNTA2ZDExZGY3OGNmYzQ2MTBkYjY1Nzg3NDVlYWE2MjIwYjEzYQ0KPiBtZXRhLWFnbDogNjAz
NDRlZmE3YTUwZGMyNTQ4ZmM0YjVkNjhiNWFkNGQ2MGM0MDIzYQ0KPiBtZXRhLWFybTogYmE4MmVh
OTIwYTNhNDMyNDRhMGE3MmJkNzQ4MTdlMmYwMGY0YTFhZg0KPiBtZXRhLWF3czogMTcxYWEyY2Y0
ZDEyZmY0ODc3ZTkxMDRiNmVjNDZiZTU0MTI4ZTNkOA0KPiBtZXRhLWdwbHYyOiA5ZTExOWYzMzNj
YzhmNTNiZDNjZjY0MzI2ZjgyNmRiYzZjZTNkYjBmDQo+IG1ldGEtaW50ZWw6IDVjNGE2YjAyZjY1
MGE5OWE1ZWM1NTU2MTQ0M2ZjZjg4MGE4NjNkMTkNCj4gbWV0YS1taW5ndzogNDIyYjk2Y2IyYjYx
MTY0NDJiZTFmNDBkZmI1YmQ3NzQ0N2QxMjE5ZQ0KPiBtZXRhLW9wZW5lbWJlZGRlZDogN2JkN2Ux
ZGE5MDM0ZTcyY2E0MjYyZGJhNTVmNzBiMmIyMzQ5OWFhZQ0KPiBvZWNvcmU6IDU2N2RkMzVkODkz
YzVkODk2OWQ0MWYyNjNhMjRkYThmYmFlM2ZjMmYNCj4gcG9reTogMGEyY2E5ZDYwZjM4NTE1MTVh
NzlkNWFhOWRkZDhiNDA2OWI1YTIwNg0KPiANCj4gDQo+IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRl
ZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6
Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCj4g
DQoNCg==
