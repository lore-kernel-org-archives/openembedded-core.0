Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.15151.1627871664250178906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 19:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=I9xIC9oe;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="213359916"
X-IronPort-AV: E=Sophos;i="5.84,287,1620716400"; 
   d="scan'208";a="213359916"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2021 19:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,287,1620716400"; 
   d="scan'208";a="501611783"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2021 19:34:23 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 1 Aug 2021 19:34:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Sun, 1 Aug 2021 19:34:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Sun, 1 Aug 2021 19:34:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0DJndVn9cvauTX88kMgG9Rlok5GccLq5+A0yuWCjZTvzc7MAN9SfvSOHvbS9qxQBVNdkjYE9WZC4oPs1SMKTWSIFQ4zHQhD6c+s4gYS0oZha/RGZQx5WLS1MZsuZo9E4LlbHgHzSShmhYVpcQxCNDE1LPj+KIXTs8k5/WDKyWyWUCQzs17Zg5NhqKZbtWu87sLIlR/1DAYWnF7klmgk9IyCs8I2Qa9Twt7YSOrGJWMSZQfbkMdRHjK1MpjWebokK6NL6/hovwc5o87ofi3S26jTGbATjagaUQaIhTD+ii8hBnkpnHLo2G4IyEzrcGxg+tHFv6vke/Aa9QOF0jLeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMVUzTffjHjiQCcHLHoY5w0lAgImhovmPCBL7V4aEac=;
 b=Ou3C7VZeZR6Ll6COIdC3RWpyvwutXGKQVCjr7cAqaA+ZtO1cXd0xw1E0c0XX/Nludo0MrP/GnZyfh/zhut9mlrjOEEINm9eV5TpKUx+80ew+g4icmxdHMQueiDjLRnZE5TTCheOrv/X7CFYbl4jUAagqoZ1okYa4Ef7Y/waJje9RtyQe7cLrvUaML6zfHdburt853D1YNAE+2nriE38GuNYe7E6NL4gT01J5izB+gMiO4VkMDpO6nr4v0P+x8y+P/hZJH9YdI5n1NSzl9OwPZdoRiJFZawXQdV4uNDAsEb04W4RQUyWnagivFF35b+D3qQ1jib/q7PVO30/7VR4cyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMVUzTffjHjiQCcHLHoY5w0lAgImhovmPCBL7V4aEac=;
 b=I9xIC9oeSWbkRSETLdg+aAMBfLLCmEAvqv8TwNhzgDV/hvCb86RMmXn4lKdnvruP5kHqAISNxJ5RNmKIlpmBiHycdT9hnK57dq6AyBR9amtiaIqI2WS+6JbhNeYn/krADXQWB++j+2Ed3eLIRUrPXoWJS7SdlLg+mSSaB5gcT94=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 02:34:21 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::91cb:cf5c:1dab:30cb]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::91cb:cf5c:1dab:30cb%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 02:34:21 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [hardknott][PATCH] archiver.bbclass: fix do_ar_configured failure for kernel
Thread-Topic: [OE-core] [hardknott][PATCH] archiver.bbclass: fix
 do_ar_configured failure for kernel
Thread-Index: AQHXh0ZF9SixUfc76kiUdfAM3eDSm6tffz4A
Date: Mon, 2 Aug 2021 02:34:21 +0000
Message-ID: <981800e16641dd9cd3cdd916da75ea63178440ea.camel@intel.com>
References: <20210802022717.16022-1-changqing.li@windriver.com>
In-Reply-To: <20210802022717.16022-1-changqing.li@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 301b3da4-dae4-44f1-26e4-08d9555e091f
x-ms-traffictypediagnostic: SJ0PR11MB5085:
x-microsoft-antispam-prvs: <SJ0PR11MB50850A59E9D15725277390EDF8EF9@SJ0PR11MB5085.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MxSfTBw+yS4RIbkgL+xg9lHIXtcw3OIwAcrFXRe6Tr8o91P3sBzyUrpab+oov1bX9vimOL/1kOfL9dBMVnq0XZRHynRZGVhaBRo1ThozxnPum3e9Dcp8+mpxtQSbw3nlADfVDH/i9m44GirZneEqwphtYJqG8IWpQNauDimz2d7QRnyrFj6DBM+Y/sIi96Lvv1n4Pr2lRJ2d046EzHjzNmFrL8smXO6LPdLQ6IeuuSeBcPVG1jleoPnBD4q52H6dcIoZ4kFXf2nCF1tqIzYDIxEQ2KGMGP90YZRa8K1cdY66+ReWOgkcmbNliiCX8AgKi8u/BAJq3JzlJg2yt1dK9BfGip8ZlQQ8/4X2H8MFnZjBQwGicZh+0sTg+znqDKrTXOsxlDAArzEJazqm+G7y8ULhSxNCS7sUucjXSpr4T597cRq2wEFfq/HQisi0ffUzmoCNX1RaxSZD/8ujmSEJjj33XqprBGqGg2mGRx6r/jml7+hdLYYPf+ArIrgxJNGSmdhmOlPT8b9n1IWBlKiVbECsgGXbxCXeUeGBLEAji5DRXWhso91g8/BzGV87++oVHEqE60Mze55tFHwOilR6vQwxmh8iFd83TqfCO05LBmRMmARPDEnm5akoUfp9DIhErsg7MfP9y+RpkktychjFnuPsXlmSQo0hWJoFv2kypNklO02d8BZFmnlk7c1AkrDkeEILBX/nK5hRlErofgAxaf9jEh/lA8fTyq+9szGFoymBopYGPIUbkjgXjTdAJhqWIEVKv2oV0TB3AigrgxYgpZItlXa1C2ZTFueq4j+E+7TOGfVDPru4v95E1d/oyTgZX5q8BXVj7sk6tsGPkXvKXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(186003)(2906002)(5660300002)(38100700002)(26005)(2616005)(76116006)(83380400001)(6506007)(66946007)(66476007)(66446008)(122000001)(91956017)(71200400001)(64756008)(66556008)(6486002)(38070700005)(8676002)(478600001)(36756003)(86362001)(966005)(316002)(110136005)(8936002)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGN5T1orWkNhTHZFUzJkNXo1MnArUmpKc2E2eDVVWnFtNFN2MmdlQjdKZHdZ?=
 =?utf-8?B?U0tCUmhsSThOTTJTaERlSm9IM1lLZnF0SlZLS2ZSc2QvN3NSZHZHbHVXYXph?=
 =?utf-8?B?RE5BYkR6ZVNrbFRuSXRGY010eG92aXo1WkVYTVAwL0pCNEltNWJJMzJIeitR?=
 =?utf-8?B?ekZReWR5a0I3WVdNbDJBeHZvS0JGU0QxZkk1dTJLcmZEZWJJdkxPejVRZVZP?=
 =?utf-8?B?TEt0eUhzclBnMzhuMFA0RmM4N25jckg0SXlzYytaaGd4a3lNTld4SGE3Mkpu?=
 =?utf-8?B?c040U0pWMlpacGsyTWQ1RzFqQVpnS1ovRXoxNGpwVTk4V2ZCR1psbVJjTThz?=
 =?utf-8?B?cGV4Q2ZOTnYwK0o2UFBCMzJUcHdUT2huaXN4S0d4MSs0ODNqTzIybWYvWU04?=
 =?utf-8?B?SFlTaHFjdzAwdmtHMWJZYmw3UDhBaGk3YmxqRi8zUkZkVTFoQUx1QVZaT0F3?=
 =?utf-8?B?bTZ5RmovRlhNMzFWR3BMZnhjWXMzalRzS3NlSElNb2o4SFdLWGQ3SERoZzNQ?=
 =?utf-8?B?U2ZuSDBrZ1hqTUl0M2ZIdHNnMzc5V2V6WUdDbUg0aUdzZk1ia3VyWjhRK1ZI?=
 =?utf-8?B?VC9TTlFQQWpsS3JCWTVkUEIvTElvdWI2bzNhQkhndTF0cTFMZ1FBK0F5L3Vw?=
 =?utf-8?B?ZnY4M0ZST1JITnA1MHYvQWg5S3V3TkExd0piZXRNR3pGOGtYa1UvcmNBMU5Q?=
 =?utf-8?B?aXFOZzYrbER3UmlmRjcxUStCc3J0ek1UNnVYV0tFSEowZU9iL29Kd1JQdTFF?=
 =?utf-8?B?OUlXTHREdnFGdWFCQ3JvYndQa2FRZjZGQ05ERGk0ckVETjVkeFdrUk8zOWl6?=
 =?utf-8?B?WHVBRHpnaGhXR3hMSUJSWnZTTGhFYUJ5ZERycjhidkh5RUNYcWJpSFVYUUtR?=
 =?utf-8?B?VjhDb2QzVUthcWdEVzd6NWx0L1VBb1duOCtNRUorU0xxellyQlNQWTNZUEtY?=
 =?utf-8?B?b0F1V2RzeWZLc2ZOdE1HcVYzTHFCY3B1SVFVZXh1UW83ekxWT05zT2N2RTNw?=
 =?utf-8?B?VHl3VmV4MllFTjF5ZnJPSTI1RnpxWkJLUWRPNVVvZ3dRZExFZ2pVS0FpMFM3?=
 =?utf-8?B?MldCa3pOWlFFdjI0eHRhbHVuMSs0Y0ovMENaREtNeFcyZUhrbHBLdDF4TFlQ?=
 =?utf-8?B?ZWYxeFJFUmE5cktYNjRpYTlDYk0wQ0FoV1FFaUVKckZ2Y1AyR1dMTzY2MHBK?=
 =?utf-8?B?aThsYkZXZUd6cnpUa0YwVGF2VkI1cUhXd3ZLM1h2L2FGM1hRQXVwMDlEdGp6?=
 =?utf-8?B?dnViTWpoYTFYRFdMREgxYWlJSnQyVDVwRzRmOUlMRjRObEQrNHRGOUYySkJC?=
 =?utf-8?B?STRsK2RSZ3R5Y3NNNm9yQ3psNm9sV0pLWFVCdjhDdTh5eklkVVpZdWUyTGxl?=
 =?utf-8?B?anpJME5nMTNsS1IzQzBadkpRQ0hUWmJkVVlDbXVzOTR3a2d0MWZudG9VaFpj?=
 =?utf-8?B?bVE2NGxydW1sbkJmbm9keHZraG43MExmdnVUNC81WDRNRzhEMGVZVXVXVG45?=
 =?utf-8?B?WDhkL1l3dTZWZmN3K3FHaWU3RUhaOG16NG1EeWpxbUorUVZFdnNISG9Ma202?=
 =?utf-8?B?NnBkVTIycktZUURrMGZxaGErbWRVaDQ4bTRnUlBwOWdpenMvWkF0eHU0TlQ1?=
 =?utf-8?B?bDV1Q245c3cxa0RtbmNsd0ljZXFUaXRkS3FQa1VHcDloSWxmVUtBbGJycFlp?=
 =?utf-8?B?QkI2bTE3N2JCRUtQNGlFbGdHWWVxckl0VFZFR3h6L2pIM0piQm1MdnhEa1dq?=
 =?utf-8?B?a3Rrdm1nTWtsckE0WjlLVWtEb1VYeVR4OFRGSXRTTmtjejREb0pGMVMrSDFX?=
 =?utf-8?B?WmxmQXZzSG4xMjZuejJzZz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301b3da4-dae4-44f1-26e4-08d9555e091f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 02:34:21.7252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5jv7t1J5HAHgCntrr/8LeYIVbstJgxJSbAQlmZY6bZSyJ+iJWglCNnLKh3zwL2NIunUZsyXG5CS//aK/dyI6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <814A11CE9110D5428A33832BF9E0E5B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

VGhhbmtzLCB0aGlzIGlzIGFscmVhZHkgaW4gbXkgYnJhbmNoIGFuZCB3aWxsIGJlIGluIHRoaXMg
d2VlaydzIHB1bGwNCnJlcXVlc3QuDQoNClRoYW5rcywNCg0KQW51ag0KDQpPbiBNb24sIDIwMjEt
MDgtMDIgYXQgMTA6MjcgKzA4MDAsIENoYW5ncWluZyBMaSB3cm90ZToNCj4gRnJvbTogQ2hhbmdx
aW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiDCoG1l
dGEvY2xhc3Nlcy9hcmNoaXZlci5iYmNsYXNzIHwgNSArKysrLQ0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRh
L2NsYXNzZXMvYXJjaGl2ZXIuYmJjbGFzcw0KPiBiL21ldGEvY2xhc3Nlcy9hcmNoaXZlci5iYmNs
YXNzDQo+IGluZGV4IDkwMDI2ODk3MWMuLmRkMzFkYzBjZDggMTAwNjQ0DQo+IC0tLSBhL21ldGEv
Y2xhc3Nlcy9hcmNoaXZlci5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy9hcmNoaXZlci5i
YmNsYXNzDQo+IEBAIC0yODEsNyArMjgxLDEwIEBAIHB5dGhvbiBkb19hcl9jb25maWd1cmVkKCkg
ew0KPiDCoMKgwqDCoMKgwqDCoMKgICMgJHtTVEFHSU5HX0RBVEFESVJ9L2FjbG9jYWwvbGlidG9v
bC5tNCwgc28gd2UgY2FuJ3QgcmUtcnVuDQo+IHRoZQ0KPiDCoMKgwqDCoMKgwqDCoMKgICMgZG9f
Y29uZmlndXJlLCB3ZSBhcmNoaXZlIHRoZSBhbHJlYWR5IGNvbmZpZ3VyZWQgJHtTfSB0bw0KPiDC
oMKgwqDCoMKgwqDCoMKgICMgaW5zdGVhZCBvZi4NCj4gLcKgwqDCoMKgwqDCoMKgIGVsaWYgcG4g
IT0gJ2xpYnRvb2wtbmF0aXZlJzoNCj4gK8KgwqDCoMKgwqDCoMKgICMgVGhlIGtlcm5lbCBjbGFz
cyBmdW5jdGlvbnMgcmVxdWlyZSBpdCB0byBiZSBvbiB3b3JrLQ0KPiBzaGFyZWQsIHdlDQo+ICvC
oMKgwqDCoMKgwqDCoCAjIGRvbid0IHVucGFjaywgcGF0Y2gsIGNvbmZpZ3VyZSBhZ2FpbiwganVz
dCBhcmNoaXZlIHRoZQ0KPiBhbHJlYWR5DQo+ICvCoMKgwqDCoMKgwqDCoCAjIGNvbmZpZ3VyZWQg
JHtTfQ0KPiArwqDCoMKgwqDCoMKgwqAgZWxpZiBub3QgKHBuID09ICdsaWJ0b29sLW5hdGl2ZScg
b3IgaXNfd29ya19zaGFyZWQoZCkpOg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmIHJ1
blRhc2sodGFzayk6DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByZWZ1bmNz
ID0gZC5nZXRWYXJGbGFnKHRhc2ssICdwcmVmdW5jcycpIG9yICcnDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZvciBmdW5jIGluIHByZWZ1bmNzLnNwbGl0KCk6DQo+IA0KPiAN
Cj4gDQoNCg==
