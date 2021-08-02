Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.17587.1627895550858010527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 02:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=inzHRVSC;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: sangeeta.jain@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193013655"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193013655"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 02:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="583839886"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2021 02:12:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 02:12:29 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 2 Aug 2021 02:12:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 2 Aug 2021 02:12:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 2 Aug 2021 02:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uv91N4S7Qrm5oRFGMuPvJI6qBvDt1luuoOrQ7OyxgrJtWQlOCJXQzUYuk9yIbTvHw16wANcHGUN+onuNVhXSyEJNEV5gC1JBwkxrtQoZESouAcjxnvVCup9+8IMBghY22aYGLvdzOBzdHkpbb57hFyb6wRknQuU22mv11uOxCiPOczZ812FLWF60CAOoXCmvPtMM1M9w5Vxeih5V6lM/mliVvRH6LZcAeoCX/2cnyVRUs86xtaITopBEqVXhJBNnHv79Pf7er2dWSJqFljE8ipY5RQelTz+NYWoHBV3hheGKsNbTjYePHU+yKTRR2kligeNZC6MEy5QHXMMfEyoWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQjfxwpsc7uGr2ujv5zHh5TqZkNJePP+uwQanzxbaXE=;
 b=eorCsgJ0tpDugGHm4W2Yq9hXfEQZC8EFVivflpyKDtqXXKGPrl/mPrdiHSdCoqrPD9SjSJadEOe6CPrG21ByGyFoYNCozOIXo68b7AeU5ki89HkiqnaqrqGCEJk8bl23D4tMj98gFwIXUQZpeVFXY3JqeCCbnaqq7/V2t0GAGTQWR3ndN4oDowPWYowqIpwSw6ys7A/xgDehqIumaN2N45JCpUgw5ibFWMCqyRK1d3xe1lSjtGF4+4UUIivTiBfnL56oftqSZLqHg4fG3cb+tTJFaOfTakYK4blqORKs9Ksf6hAJKW/WHgQZV3ulJRuk3WhT0C/wnDTxI7yQfykmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQjfxwpsc7uGr2ujv5zHh5TqZkNJePP+uwQanzxbaXE=;
 b=inzHRVSCadCQghxCzKmw8Ke8gbZocaP1AmyhUp8QPSk4xV8CGA9Kg+nu01Mf9wP1H7CVLDATPY3n34A5Qme1IHhYNKceBuqx/DwyrAr337kxdGXjUv4xJXnAll46mBVMiUjImogy3jDe7pIYBkJf0Ctw5eP7Z6TptB0Hnak8iDM=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM4PR11MB5568.namprd11.prod.outlook.com (2603:10b6:5:39a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18; Mon, 2 Aug 2021 09:12:05 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::419f:4e95:48ef:398d]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::419f:4e95:48ef:398d%3]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 09:12:05 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
CC: qa-build-notification <qa-build-notification@lists.yoctoproject.org>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.3.2.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3.2.rc2)
Thread-Index: AQHXgvamrq5hpa/2gE2mOK9XqE2Cx6tf9qQw
Date: Mon, 2 Aug 2021 09:12:05 +0000
Message-ID: <DM8PR11MB5608B209F2534A0B242EE745E3EF9@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <0c60ce5c7e5456d31dc1d89a94451f9d39aa08be.camel@linuxfoundation.org>
In-Reply-To: <0c60ce5c7e5456d31dc1d89a94451f9d39aa08be.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8aa9ea2-aee2-4f86-ab16-08d95595990f
x-ms-traffictypediagnostic: DM4PR11MB5568:
x-microsoft-antispam-prvs: <DM4PR11MB55687ED73054EFEDAE92E912E3EF9@DM4PR11MB5568.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HdDLaVYw4A6bg/1Gk1i+Oct45AFIeBBfyy3XQp7PtSUC1oInhDbgLo+SZh8K3vjZldZ18x0tRB1TuqmV5PBsBiXbJj41kGpk7WrjyAX+BlflZ4FSyk3ohTwca1NiiQGxU+UcaBwftw+EHwdD/ccbnQFr2YF7yuXcIPI4wMVdnhbqk7bqysCcMD9XzB26j/Toh/KFqMTQ0SqGW8sdhfaFYa+1hMkBJ6oQcJlSrUGXrX1N+HkscjFxA+vpDC7Wi1401rUjIPCipPkIxVdk5Fo9bL5Z5r0DyByVVzyaSL0u/pkml3LSKb/ZJ0xOe2p0oAQV5g12HkoAfx7Y13yhMwU3o/vRahO5fl8MLS3ek+EtZXNdzXTGFytUL7NR/QoAQrxRFaCYLHHhrLE5G5nTLHv112gPGfzeYma10PnFS0CWerlTORvsYT1Ii8w2zNw4ZD2QGnXnr7dCFh3YH6cChI8NpYdbHqKdGU9kP6nagvsZZRxO13khun5GTOW4XBWwn7f9NQ2+LmiTs2H+J9+lxlpBFXj82Hkr4U87yoz8BRwayGV6pXNXYtchXAxxkkww7zaIYwqCkWo7iDr8usEcY91UzUjPSQ1tKq6wU4QyjBINe2tE61p5DUDxw9PjrTrSCHR+z0SsG1Ad3bH2Dj2xoRd0OmlU9y3k381kdLWDyTd+Kyw0rDKZeA3NJxSm3vTNE7X83iDJ9C+fmHOPI4FEOyhEIfTsZZtZJfweAMGoRmJsPUHOPG6VoJNzWK8JtxmvkGe2FJvGXYd4MhI2NXphrmm2r370MCnbrXllyepI6LlfXS67Pv4fOzyVRKX4no94XFATMkLiOIhEQO4XxyLoJAJZ73vnaxeHy487bn+yUFLYyYY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(110136005)(66946007)(76116006)(2906002)(55016002)(83380400001)(316002)(66446008)(86362001)(52536014)(71200400001)(508600001)(966005)(33656002)(5660300002)(4326008)(64756008)(66476007)(66556008)(8676002)(8936002)(186003)(38070700005)(53546011)(7696005)(122000001)(26005)(6506007)(38100700002)(15650500001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDh3NDh6SzdMT0dCRDNsWDJ3d2tDQlVJSitDa09NTElQNjRMQUMwUlY1S0NV?=
 =?utf-8?B?bTBIWDRXUG9ZalR2RC9FNGtqZGd1YTVReU01bTJ2emRRV2V6MldNZ3JpNmZy?=
 =?utf-8?B?bDlwUzgrb0lhVW9vd2laNks1RnhVWnZRejVxRUZwcGc5ejlrMFNmaFFnYmhU?=
 =?utf-8?B?eG0rSlh4RVdpUzlsZ05xdXB1ZW13NURPVlRaUjhqZCtsSTZDUjhMWW95dFBW?=
 =?utf-8?B?VktOVXJpamVqK0ZkQVkySmRnMFBSVHBkUXBkdkp5cXNqcWg4Y09Uc2srNEFY?=
 =?utf-8?B?SHNlS0M2ZEdIM1dnM1N0NDFHbklkWmVDcVQ1WEtHNG1lRmZZUzBzb0RlVVIy?=
 =?utf-8?B?UjQrSWpLampXd0k3QXZYdmVSczFqNUtyQzJSMjlIS2RCcmZ0WkJJTFlIK3dS?=
 =?utf-8?B?VDNCU251RTFFV3Y5d1RwTXoydmRPVnB3TytHZ3lWTGxxaktwbXBkdnVsM3Zr?=
 =?utf-8?B?OEZLcmkrWnQ2Yk40V2pDc2xuYVNpaUt3UGtYQkRhR2dOaHVnT1doSWwzVDBs?=
 =?utf-8?B?dzQvT1I0aGNWMlBqdy85RURkWmROcWxsdm9NQ01IYVZZeUN1MERQeHF3cU9s?=
 =?utf-8?B?Z1JHMnoxbjc5dmsybUpCTFlPOHp3Zm5WNHN2a0ZJajhoK2RuanVTcVZyMnhr?=
 =?utf-8?B?OTkvZWJaWE55cHgrWWpzUjNxdXB3WUVVZjdXNS9adnRFdno5TlUzUVlVUjhw?=
 =?utf-8?B?YW1OTm5KVTd5TC92bEpTWlBZdEN3WVpzRUthQkNUSklsaVF2Qm1NTGpwMnYx?=
 =?utf-8?B?UzI4WXVnT1drMlpQekFUOEpWZFJVTTY2MDNnQ3V1a3ZTYjUvSmljMDc1MHJS?=
 =?utf-8?B?Yit4WEJnVUViVnJuNEtySTA4KzJ2NHpBWlVKWUJueHN4RkdaU3d5K2xTSm1x?=
 =?utf-8?B?K01IUkx4OU1DWklORjlJV1l4Mm9pUEd4elFyeEM2UUxTZW1FN0Y2ckdqZHVH?=
 =?utf-8?B?U0p2dXQ4MmVZcS91aGo5V2ptd0M5SkpPQnphek5QTW55OHhHdFc2RklyNCtv?=
 =?utf-8?B?MU9abng4SCtSbmQ4RExScjRMdVAxbkc0ZzMweFJSRmQ4TjhPZXc5WENQbjEr?=
 =?utf-8?B?OXl0eHN2cGE1U2lhOS80VzJGZERYLzBOUHVWWGVhclpNbXRPemdXbVorZktr?=
 =?utf-8?B?MGNpVGVhaFcybkUwRytob01jTVNaNThmT1NnVFVOUFVOcjNhQjRTNE5yZStH?=
 =?utf-8?B?Y3YvbzJyUXlQbGVjMFVaRVIrSW81c0RZalpXVGVBVFY3QkR2Y2tUd1pGZ29Y?=
 =?utf-8?B?MUc5YXZQaURkZGV5dStXUUd3MWlYK2VORXJFWnowTWNFd0VzSUdMN0FKQjNV?=
 =?utf-8?B?Y2Y5NVY0a3AreEhwVTJOQXNyVm5RTkFPZmVycHZmczRjY01mTkVNNGY2N1Ny?=
 =?utf-8?B?ZjVaV205YThXcGJHODY5dXlaalREUGZKRUFTelIyUkxqc0R2bmhrZ0ZTajlC?=
 =?utf-8?B?UndTNy8rM3RRY0FOOHFlN01PZDNsa3gvSVV0QkNOQzdBcVFuV0w1K0lkZWt1?=
 =?utf-8?B?MXVCRmlDZ0tJUTRXN3pWdWNBRHZ6dDNEWXduVTc5L210UlhtMUIveHVvcFU3?=
 =?utf-8?B?b1VPdUdoSGdoODJGUjFEeUdKQktrZ1BWQVlhc2JESkFwUHZ4aEpyTDhHS0Jv?=
 =?utf-8?B?V0dvWjI0aGlpNjZ0eHNqemxMSy9xV2dzMzlPRzNPZzRyZ0JzK3Fzd2E2MXEx?=
 =?utf-8?B?ZWpwbjdITldXbHhETkl4UWx4d1FCY08rWFVwM0w5VTY5d211eC81b3E4dXMx?=
 =?utf-8?Q?11OzTntMrnLLO1I5tOk8mccqcWMcEseC7Jzcwz4?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8aa9ea2-aee2-4f86-ab16-08d95595990f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 09:12:05.5357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lv8ZIKAom53DU++tDFVzLX2bQu3vUG4ybQUbwDo2HTGKO9boBzPgjYHDQVGT2d+tx9cYiPqTNVTKSGlPvloqcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5568
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gYWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4zLjIucmMy
OiAgDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9jdG8tdGVz
dHJlc3VsdHMtY29udHJpYi90cmVlLz9oPWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQoNCj09PT09
PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8gaGlnaCBtaWxlc3RvbmUgZGVmZWN0cy4NCg0KT25lIGV4
aXN0aW5nIGlzc3VlIG9ic2VydmVkIGluIHRoaXMgcmVsZWFzZToNCg0KQnVnIDE0Mzg4IC0gQUIt
SU5UIFBURVNUOiB2YWxncmluZCBmYWlsZWQgaGVsZ3JpbmQvdGVzdHMvaGcwNV9yYWNlMg0KICAN
Cj09PT09PT0gQnVncyA9PT09PT09PQ0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xNDM4OA0KDQpUaGFua3MsDQpTYW5nZWV0YQ0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcg
PHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZg0KPiBPZiBSaWNoYXJkIFB1
cmRpZQ0KPiBTZW50OiBUdWVzZGF5LCAyNyBKdWx5LCAyMDIxIDEwOjUwIFBNDQo+IFRvOiA8eW9j
dG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
DQo+IENjOiBxYS1idWlsZC1ub3RpZmljYXRpb24gPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0
cy55b2N0b3Byb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBbeW9jdG9dIFFBIG5vdGlmaWNhdGlvbiBm
b3IgY29tcGxldGVkIGF1dG9idWlsZGVyIGJ1aWxkICh5b2N0by0NCj4gMy4zLjIucmMyKQ0KPiAN
Cj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tMy4zLjIucmMyKSB3YXMgY29tcGxldGVk
IG9uIHRoZSBhdXRvYnVpbGRlciBhbmQgaXMNCj4gYXZhaWxhYmxlIGF0Og0KPiANCj4gDQo+ICAg
ICBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by0zLjMuMi5y
YzINCj4gDQo+IA0KPiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiANCj4gYml0YmFrZTogNzMx
ZmI1MmViMDMzMzhjMGJkYjJhMjI1NmMyMmM2NGMyMmJjYmFjZQ0KPiBtZXRhLWFnbDogZWUzOTdk
MDk5YmY1ZGI5MWYxNGYzNTdmODc0YTBmYjA3NDIwOGZiZQ0KPiBtZXRhLWFybTogNGUxNGExYzVl
ZTg0ODA4Y2NlYjUzNTRjNmMyNmRkOGViZTY2OTZjZQ0KPiBtZXRhLWF3czogZDY2ZGU2ZWQ4MmZl
NmI4OWUzYjhiMjYyNmY0ZGI2ZjVkN2Q1NzEzZA0KPiBtZXRhLWdwbHYyOiA5ZTExOWYzMzNjYzhm
NTNiZDNjZjY0MzI2ZjgyNmRiYzZjZTNkYjBmDQo+IG1ldGEtaW50ZWw6IDRjN2VlY2YyNTUwZmNh
OTEzNmEzMzI0MDBiZTZkYTM1OGQyNjRjYjYNCj4gbWV0YS1taW5ndzogNDIyYjk2Y2IyYjYxMTY0
NDJiZTFmNDBkZmI1YmQ3NzQ0N2QxMjE5ZQ0KPiBtZXRhLW9wZW5lbWJlZGRlZDogOGZiY2ZiOWYw
MjNlMGVhYjdmMTIyZWIxOTYwN2ExYzc1N2IwZDI0NQ0KPiBvZWNvcmU6IGU0NThjMTU2MjdlN2Iy
NzM5MmQxNThjYmI5NDE3ZjY2NDI0YWE3ZDUNCj4gcG9reTogMzFjNjM5ZWI4NjY0MDU5ZWI0ZWQ3
MTFiZTkxNzNjMjIzYjRjYzk0MA0KPiANCj4gDQo+IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBt
ZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9n
aXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gDQo+IA0KDQo=
