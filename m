Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.2880.1628243989413322443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 02:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=Oshgxv+r;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: sangeeta.jain@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="275387536"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="275387536"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 02:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="420684798"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 06 Aug 2021 02:59:47 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 6 Aug 2021 02:59:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 6 Aug 2021 02:59:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 6 Aug 2021 02:59:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcNRUsPVY5yh4BteVpXTjATkrAcaAwGb9hSIfOBk5RNr/zbYcjqUBgZS134Q/13VE4MXHA0coBTJYnicUhZOZGs3WTAIWP9uaVUQKzTbgE3E8RwpPeLh+757xL4dAK7srYpcBhqhu0TkqDfhxPFqsVJj1Rg1GVSNWtu4qmXo0niPSj5UpQHDD65QCyHTRzmHw7rTp93Ax6ncj6DaWuNX73rbv1bFjUM5GT4ddHyQmPPqpcyL+IvHbaIeg1f9F3wiknyZXYas2GZ45G5RsEnhLmw7uMSXO4BNN9bNLz7Td7GtUaMr4P0zOCgtW4u8YN70eV2XADlQyMccnnZBd7cMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A38gMMxdXxBOCvgOyFd5N73ZXQg32PE+kMP/jLmCMDo=;
 b=GNekc3O6ZCdmfXOtqc5VfOyL5H1h/oA8Ykb9niX5vjPwLheIpBzqAdWn0/OIxom+YZM+Kbpjkkax51sc6iiF/EBLCIV1B8A4f5wdRS2tkFiiYbI0x3svD1lBLaUw8pBDweYSP4aPZzhqkrKHc4VKSzK3XtsuWmd/mMS/14ui2rDSfdRh0sMXIchIs6FSIeRqCk72Fq5ah4JMiCKrThP61AKJXav8zFxx4VROz6H+wBp7N1MTiUjIB5drOuUwKBMcL1LEGAige0bIfTb91Mmk6xPhhWlLn0jBzJb75RabGDQHoNGPjsAzStiiIfrFX5RuKeSeL50ScCk1HkcBtmoknA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A38gMMxdXxBOCvgOyFd5N73ZXQg32PE+kMP/jLmCMDo=;
 b=Oshgxv+r8gJ2Tkh8zrGVHNCpmU3XPVLCpkgUEu7j4fUAyrr9LC6pNVrBJUXoVEiyGteMfx8LfsHA+qJONzjCIkgCDW6YJ0BNTGVq+pqLPlTN461LtPjhVXJq6xyXl70lmykiiVC4MW0i+ybFMto3F0R6B+EfgJra32eBoy/Nv50=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM8PR11MB5672.namprd11.prod.outlook.com (2603:10b6:8:26::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21; Fri, 6 Aug 2021 09:59:45 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::c5b:1400:5b36:335b]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::c5b:1400:5b36:335b%2]) with mapi id 15.20.4394.017; Fri, 6 Aug 2021
 09:59:45 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.10.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.10.rc1)
Thread-Index: AQHXgzmHWCYcE4G6Pky7P1UuZVeXIqtmTOKA
Date: Fri, 6 Aug 2021 09:59:45 +0000
Message-ID: <DM8PR11MB56088003ABB2B5C13A052CA7E3F39@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <de37e80025dfd59afd14daa355bf6100e70a656d.camel@linuxfoundation.org>
In-Reply-To: <de37e80025dfd59afd14daa355bf6100e70a656d.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e30229f0-5a25-47f5-931a-08d958c0eb97
x-ms-traffictypediagnostic: DM8PR11MB5672:
x-microsoft-antispam-prvs: <DM8PR11MB5672A39582236E3E39389E1EE3F39@DM8PR11MB5672.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ckQ9QgzOUg26VyZRpPZWCOlBbLZGOO4tpBWJUA/6308vrVcGysL1y7PgghSHhmrpdAxDOsRlTiiufShl2tFEFVjQI09qEzZ6yWAVJV0ez09gRF/o0R6IlGu435griPM+6oU9c5JxJD0IXLoOV6nglkXRVTq0N1p1Qs6CYdTxqFsxu640MShWhVQ5ytSJDgRqEafJQC4yr8OI1gFQ0/SZq3rIlNACtMnQKng544hzK7A7aHlmZcUuqk2vmtDc9MumEo65VohBbK2Bw/B/IGV4TKQrpU9h+eL+nVuf0iexkEM1oFA/0o1NW/gPSR8ezoKD5eiwI3ZbPSrep6wOViNdStEu1//m0YXMKkOqGtvth43bMHuaQWVhgQUGgNL0SqoahJpXlo4AxeEUGuI42Xun2CvrMmr/IITea5Jt4GKL4HjCUnGtGGsEd7JVEKvyrFMWKcLZpj1i8XLwFL3meXJkp1XohbAaqLOH5HLnVHrlEti0jdZEdfXGf11JUJKP7ZLXZ/lZM8iwTKJfEg5bF1+YWYlHoK16PexLDytDVLkhWyE7XYnahtUL4G2FcLsED4eOBw4e7rIOdSca7PUudy4nnl4fJs+Cx18p9wxljybPDsoHP2MS3uiLD9FsZwA+d6xZSkQSyDJEOCbTmG2eeQcVX+9k9a4OOr+j0tIIwzmRjKLBkq2WqR3xoHSdV65v7tkjixSyYDiw+FEI6SdvI0KoZKNZEN08uDod6DHD2y6V0Myhbaw62nxDUcl3z5hi94m4PZOhiFWkDaOADl++CHnoMjAnMD0TCr3iEsuHrDTJmFKbqAzkjAbWqnnhx87Qh2jUfgUcEAS/YRNDKLGwtaRzX3IMeTyYCf+isjQgJx7TKRY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(38100700002)(15650500001)(966005)(53546011)(6506007)(7696005)(478600001)(122000001)(2906002)(86362001)(33656002)(9686003)(316002)(55016002)(66946007)(71200400001)(5660300002)(38070700005)(66446008)(64756008)(83380400001)(110136005)(76116006)(8676002)(66476007)(8936002)(66556008)(52536014)(26005)(186003)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE43bGY5bnlCaElRQ1ZFZDRKaEFQMlNiNEpFV1NnQ0EyNytPa1l4WFhaSWhS?=
 =?utf-8?B?Q3lPRC9YSzJOVTMrNFgvU2ZYZXhobDhwaGFvMUs1WERKZk9POHIvTFlHSXE0?=
 =?utf-8?B?bGZPakRrRHhCeWJiU1hSTU80dzJtTjEzaDZNaytGcjBTdXF1N0pNamo1V3lt?=
 =?utf-8?B?cGhvbE9ReFJaZER1dVFsRVBsTWQrVmN0RVllYjE3K0Z2OFBIRG1TalU2U3Ny?=
 =?utf-8?B?WWxvZ2VJZkJKRTg1cGwya05RMGNtaHFycVcxYmFWRWIvU25lNnRwcE9JRHZO?=
 =?utf-8?B?NXM3QU9MekdocTVkT3k0SjZ6L0pmVXhoRG10aVQ2bHBwYm1Ocnl4YnRiT21k?=
 =?utf-8?B?OGI3ckkrTEhZa2l3cEJScUYyTUd6ZXNmLzhQTWFzcFRJTkNSZXNtT0JOTXRl?=
 =?utf-8?B?Mk9HYWdPY1l0Sjl0eHpQcFFiVHBLT1lPTkFsTXlSazVtMHg2M1ZDS1NvWnhk?=
 =?utf-8?B?WEwwaExCRXJLWHNYSzk4Nzl1Y0tsdHdHemFURWFOM0Q4QXl2VkF3dkhJeVpo?=
 =?utf-8?B?NkxZRW12RmRibDRaT1NWcXJjbDNVTXRacDFwTXNxT0xDZzJjQUZ6eEphZkFF?=
 =?utf-8?B?ekp4NS9FS3J1THlobHpzV0UrMTFlQU5Oa0RPd2lVL3pUa0hBRFd5ODk2L2Ux?=
 =?utf-8?B?SVNaVVpwMGRWeEdHcTN4eHJxTlFPY2luaHVKY2hFVjJ4QTI3Qit0NTdWK2l3?=
 =?utf-8?B?UHZPNk03NVlZZy9BMHRVeFNZdmV1NXRhR0NuTTY0d0NIZW9CSk9DTXFwdk1u?=
 =?utf-8?B?OVZvL0JqSy9Md3VQdnFCcUZjUm5rd0M5aFk4Q2U4YVRBN3N4S3pNczZ3TURj?=
 =?utf-8?B?MUZVdGt2NFRTWWQ2Z0R5YTloeVJtd2w0dUtXcU5tSjhzWTlVdnd2MHZ5MFJ0?=
 =?utf-8?B?aUZsYjcyWFNLV2Y4eHJ3emFHNk85NUROYmpMdjlpTUw4YUJNSmZxSGJsU0Vt?=
 =?utf-8?B?eW5maFpGOVYwVnZoQUhtN0ZRMXB4VGlaQWduTUxpOGF6STRWU29sNTdZRUww?=
 =?utf-8?B?SnkvM01hZVREL2E4YWxYMlFFMFZHcmxKUVBWYjRSUWt6czkrc1pZUm5iaXRz?=
 =?utf-8?B?VFBnN2JGTGorYWZ4N3hUOUV4STdwM3BPKzJJT1BFb1Z0eFZkZjFITXBvMTg3?=
 =?utf-8?B?M3dKcWtaR2RvVHg0Q01VQmJoNWFGVStPc2lzS3Jyc1FWYzdtZlhhR1duOWRu?=
 =?utf-8?B?YWpWZWVwYW9xLzg2bWRLL2dYVmM3Ukg5aURFZmgraytCVjF2cUZrdFVyZmo5?=
 =?utf-8?B?ZlVMdXh3dDUwT0FienkvNFgrenZ0S3l2SnJSQmMyekNFbzQyNzZpTjNuekRM?=
 =?utf-8?B?ZldiNHJocmhTQytNUHU1c1k1NUtOWlRveXVjR1kzc2VjREZ4K3JISUdZU0Qv?=
 =?utf-8?B?Y2gySmxaOHdoaTZDbG5RcEJUZG1JM2ZVb2t3bVRyM1JxTm5pOFM0VWFabWZy?=
 =?utf-8?B?V1d3MUVsYlR0S3ZyajJlOHZXOWdzWUY0clVSN0VmODFRbmkwT3BDZU00TEda?=
 =?utf-8?B?bDlJZS9WVmlRdDF3V1ZIekxqZEVtL0gwSkt1REI3V2dmb2lnWnpmb3J6ajUx?=
 =?utf-8?B?STFyaVMwTHh3S2YzWm9mWnpGY05EZEU0NEJiM2FLMUpGK2Y0ZmFLWjBOMmRB?=
 =?utf-8?B?L1VPYzJCb0xLVkd0MzYwZlFaOU5Sa2tSZm9NVmQrN29aQmRkdXdxVWdUMXVK?=
 =?utf-8?B?eXpVaGFuL0hESERyMW55bTlHaFA0dGRxRUxsNVNEc1Avd1JMRVBOZVorQytn?=
 =?utf-8?Q?F0YZH+ry9OTEosBSO3q1segw1vvLluWc+IfYD3+?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30229f0-5a25-47f5-931a-08d958c0eb97
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 09:59:45.8582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gYXnRPoeHudufMvL7z7x+J7fCsloAjWXh/oDRm28DZgjK93A8xHvXgzqwAF7NiZEroBoatWAXcRBa6u91W3O1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5672
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gQWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4xLjEwLnJj
MTogIA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRl
c3RyZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09
PT09IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuDQoNCk9uZSBp
c3N1ZSBvYnNlcnZlZCBpbiB0aGlzIHJlbGVhc2U6DQoNCkJ1ZyAxNDQ4OCAtIEFCLUlOVCBQVEVT
VDogdGNsIHNvY2tldC50ZXN0IGludGVybWl0dGVudCBmYWlsdXJlDQoNCj09PT09PT0gQnVncyA9
PT09PT09PQ0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xNDQ4OA0KDQpUaGFua3MsDQpTYW5nZWV0YQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
IDxxYS1idWlsZC0NCj4gbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJl
aGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBXZWRuZXNkYXksIDI4IEp1bHksIDIwMjEg
Njo0OCBBTQ0KPiBUbzogPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IDx5b2N0b0BsaXN0
cy55b2N0b3Byb2plY3Qub3JnPg0KPiBDYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1idWls
ZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogW3FhLWJ1
aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxk
ZXIgYnVpbGQNCj4gKHlvY3RvLTMuMS4xMC5yYzEpDQo+IA0KPiBBIGJ1aWxkIGZsYWdnZWQgZm9y
IFFBICh5b2N0by0zLjEuMTAucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRlciBh
bmQNCj4gaXMgYXZhaWxhYmxlIGF0Og0KPiANCj4gDQo+ICAgICBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by0zLjEuMTAucmMxDQo+IA0KPiANCj4gQnVpbGQg
aGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IDBlMGFmMTViODRlMDdlNjc2MzMwMGRj
ZDA5MmI5ODAwODZiOWI5YzQNCj4gbWV0YS1hZ2w6IDY4YzAwMjk2MDJlNTM5ZDAwNWMzM2I2YzM2
YmFhMzJlMzRiZjY3YmYNCj4gbWV0YS1hcm06IGI3OWI5MTIyZTBkYzY2Y2EwMzU0MmY4MmZmNGZh
OGViMDUxNzRmNjENCj4gbWV0YS1hd3M6IGQ2NmRlNmVkODJmZTZiODllM2I4YjI2MjZmNGRiNmY1
ZDdkNTcxM2QNCj4gbWV0YS1ncGx2MjogNjBiMjUxYzI1YmE4N2U5NDZhMGNhNGNkYzhkMTdiMWNi
MDkyOTJhYw0KPiBtZXRhLWludGVsOiBkOGJmODZhZTYyODhhZTUyMGI4ZGRkNzIwOWEwYjQ0OGI5
NjkzZjQ4DQo+IG1ldGEtbWluZ3c6IDUyNGRlNjg2MjA1YjVkNjczNjY2MWQ0NTMyZjVmOThmZWU4
NTg5YjcNCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDhmYmNmYjlmMDIzZTBlYWI3ZjEyMmViMTk2MDdh
MWM3NTdiMGQyNDUNCj4gb2Vjb3JlOiA5YWUzMzlhY2U5Mjc0YmU3MWJmZDNiNWU1ZGE2NGRjZWFj
OWZhOTYzDQo+IHBva3k6IDJhODQ4ZTk1MDc0MzE4ZjNhMjQzZGY3YjNmNDA1MTNhMTMxNzNhODIN
Cj4gDQo+IA0KPiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBmcm9tIHRoZSBZb2N0
byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
eW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gDQoNCg==
