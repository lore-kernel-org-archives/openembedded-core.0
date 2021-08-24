Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.35086.1629777871055643683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 21:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=DCv+j2P2;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="280947194"
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; 
   d="scan'208";a="280947194"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 21:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; 
   d="scan'208";a="425341450"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 23 Aug 2021 21:04:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 23 Aug 2021 21:04:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 23 Aug 2021 21:04:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 23 Aug 2021 21:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drBPbbJtzNXo5ZlVInQ6HNH8+uhK88D7rLTtMIvVDSGDjT1Q5KCM8dzsS8IgsbIzW1gSKRYmwQZ856qJoLdDNoaJ0eYigSWQPs0Hjq1fgfpiu7dRQgahRutc+4HqRoUqosPqD96QNy6GM2/6Upnn7eoNyf6xDolKRecNQlLiQRGExXQByvJnmhIgckvADBVWSCBwi0CZISn4iPYVh8MNNDC0NlO/6XMJ55mUnYH4GZxHJj4qOLtmeMkfv+XTSp4hsS9FW5MfcwI0QKIYzR5T2UCile1iNZpbH+Zhs+ydH9m7a5YuA3hAZx8SZrLEmCPyEe+9KqCuLpqk0fmkKcJWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYD0i14BNjNwtzAjDPJIPj9KfTZh/8oUY58aG907gzI=;
 b=oDP4fS1I/Si08lc8hUez3x5Dg2ikvkl8xZGfgZzeZyEKXvYRKU9ifJf1Fqo8wYkUHmXqOusWDKjd515EBEKyv2yVYH+sd3RK9Rz2LijJC50PjP1AraEwyXEW8EIKNX8+L/rprarEmm4Nd1lv/ql/kHGgFBg2aPO9mH1rcn+ugg5N9xQgjZEEKOgHbWPH81Wbh+A44NXHWvmxBcTlMJo90Ty+uvwwUCiLF28/HREr1UOCHNfngt6yAFxj9ePEWFIU82ZmLaDowtX/XAw4JVs4/JbhHd+JCXqC0S/TSmMCIshjGW9dH8JIHy4nP6ZwTTq/MruQbcskznmCrpRKxIRVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYD0i14BNjNwtzAjDPJIPj9KfTZh/8oUY58aG907gzI=;
 b=DCv+j2P2IzSEKuHVNlR7b4fxV81QgGu7LQJ+gdo8IiwQKM3HL8TmsCkdPlLfIWVfNKp9n72Yaf6T3cK2T+/RwP4Anptz3Vxni2GdIBCSEATm1VeYJemvI/GxUPeLwlPRWXfzeVuLvW/1dwVcYN8TV+O2XSEj5SBnwwQhWytc/sI=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 04:04:25 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c%8]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 04:04:25 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "joe.slater@windriver.com" <joe.slater@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: Re: [oe-core][hardknott][PATCH 1/1] icu: increase pkgdata command buffer size
Thread-Topic: [oe-core][hardknott][PATCH 1/1] icu: increase pkgdata command
 buffer size
Thread-Index: AQHXmGYWH/iZOUfmoE6tzevt6jt1HKuCCXKA
Date: Tue, 24 Aug 2021 04:04:24 +0000
Message-ID: <6093d42eedfe1d8a6673f78d8ada092af5cc7c2e.camel@intel.com>
References: <20210823212944.159869-1-joe.slater@windriver.com>
In-Reply-To: <20210823212944.159869-1-joe.slater@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9471e58e-a615-4dec-8b25-08d966b442dc
x-ms-traffictypediagnostic: BY5PR11MB3895:
x-microsoft-antispam-prvs: <BY5PR11MB389527E76F269128F7AE5594F8C59@BY5PR11MB3895.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MHzPJh3X2bxwLapVQoFHsJ96vWpYif58zex309m4sdd/dG5KffStTCklnuwWhn9rvpsq1JsMB2rlc4DsKma5/ttezHJX6D6lS/Yhi8D/B+/l3JTogz5F5W7hvdsavg75z/Z4LQUN7+6piB77z5gycjBHLlnHdYQJiwFdzPvF2uBI9U221cBIfpBS6xKPorEoOIjEamThhNoV+J6XZ/mc7qkukMJVzfDXe1GYUKPmzk9HPJ4NRcIIbicwAQrmoebkIa3fnHisivVejpYyR9PsNpDGxgRiHmVImte6W/2stOqQOQsQ2JFPn01E7Ls886asNQSs36q+NnJjMtO2cXMhfq0z1gtpQULe2obAozJn9LzQqegyZtl01oaR8nbnlJI2vSQuQ7dvdhYgTEsY804rLbFfrPPs4VtQ8Sk0LlRezzBbPRWsa7KzrFN3fiBRYmyVY81fWAUncyfCR2o/8exn1YLpzNsuO6sU+JUJAKpPvw8LICcUWI6YUGwjjJvYgxVuvhz108R6LfE9LAz2RXj5JAN9bJmAt3ulepSEl7EDHKC3A2u4OtcuSunM68K17cUnSkAcSnmIxEBopwN1fiRfrsS9griCSqkI7pxrxvRwy3hCVrUSJ7kjWHu8ME7wjka/nDTdi5kBQrZbRW3StAGheyMp1H2lInVcy7hbbqn30na1i9k4RJh0P9BxVP76/o901GR9NviWeS5K/VOuOZlV/UhvoGNhjzeSqlePhFKhUkTRKZBUP5X6bXhpWJofNKJpFEXv3x3RAVDPlCvHCcmoDJ9BEWmF0nHhgCWR/2B7LG5lmXQ608f4LruvL9/i9ixG3qZxKcmEwj5+E0uzz8uEsQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(71200400001)(26005)(6506007)(8936002)(38070700005)(5660300002)(186003)(110136005)(316002)(66946007)(36756003)(64756008)(66446008)(4326008)(2616005)(66476007)(966005)(76116006)(8676002)(83380400001)(86362001)(508600001)(6512007)(122000001)(38100700002)(6486002)(66556008)(91956017);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlpXNGQ3VHI5MXpoSEQ1Wk9BYW54NjBLekM4SXhOckZKUUJkYXM1M3RFOHFN?=
 =?utf-8?B?cGVkVFRpUW9VbjMxbWZad1E1aUx1SzE4di96SXNvbkVGTDkyd0IvOVF0Uld1?=
 =?utf-8?B?MkhsZ1EyV0hYTnRiTEIvSmREZ1YzWXRtWW0wT2M1WTRKRGJydVhWbnIwZ0Js?=
 =?utf-8?B?aFVBOC9LampyNm9kNEtQdG5WR0J3eGUzdXBzblM0TFFEVVkrOG1uYmIxaU45?=
 =?utf-8?B?cUwrVjBVeXdDeWU3b2p1SVBKV0dOazNOM2Qwb0xRelFUSnI2eHhzbWNvdGhz?=
 =?utf-8?B?NkV2azZuamRvanZFK2pHUis0MU5ESGcwYlg5UHVGZTlCU0JJMHVjV3hMeWQ4?=
 =?utf-8?B?akdBNXdUaC85UGVzRHQ1WlB5d1krN3dLK3BuVjczL3QrTWE3bWJxT1pwTGIw?=
 =?utf-8?B?TlpWeEJwb1FFVHVlNVpkWlBtZG5jVmdzOTgxVGRBTlUrSVdLOWJBMTRxSXBx?=
 =?utf-8?B?anRib1czT2RkM0lGYkp2R01VeHplSE94TU0vcE8xZzNiQzhvMjczTE4xZFRw?=
 =?utf-8?B?RXhqOXhkUDFlUFpKaHlHeE8zNjZSb1VhcmVUcTNGQnpBR2lRdHBlYWtobVNh?=
 =?utf-8?B?L2JSV2Vsb1p3MDh2RlozU1Q2djJoQnBMMFBZRkRvZ0MzdTJMWE1kODU3QUlK?=
 =?utf-8?B?UlVaRm0rdkgvWjJQRVl1K2ozUzZLOCs5aDJQNDJqU0hnRXlRV05nVExqZHVN?=
 =?utf-8?B?anNjL2t4bCtRU0NtUmRLWnorakdMV1hFclFMeEVqQjc4TU8zZkd5Zmg3Ti83?=
 =?utf-8?B?V0RJa0hHZHZqV1VEVndYbzR3NWNWTmNiL3JoWTZSS3BjSVVpdDlwT1V6NU0x?=
 =?utf-8?B?YXZhVU16NE15Z0M5TS9LbDM2dkVESVNHVHE0TFltUmszVmwwMEJkVkdKbEIx?=
 =?utf-8?B?TEtaQ01ydlMrZmVYTmd0T1B2ZXJnaHNBUXhGWmtGeUgxRUM1bjZWeXRmbjdF?=
 =?utf-8?B?TEtLS1ZhSW0rQkUvbThMSmI4UmlhdXNZVHgxc1FrMk9odU1VSjRHQ2s0K2Q3?=
 =?utf-8?B?N3NnSk8zRWpBb1U1VkpIdjRqY3VhUGhqRTdFV2RNRzMzVDBSV0FMcmJmS0Iw?=
 =?utf-8?B?d0VRVDZOY0ZpNW1Md2swc0txTFRYTWVzdVRoV3ZCZjJyYTA4TEp0a09RSGU5?=
 =?utf-8?B?Qi9LQlZCY2plNnU3MmpZUnlLQWNuUUFUQXRxU1lQdzlQbXQ1RlRNVkV1Skxu?=
 =?utf-8?B?TUtYTEZtU3JNeTFyN2JPNXBUaVRMWUNReVNHNUJpT2d2MDVTOWZ1cURDOXlD?=
 =?utf-8?B?YmRoUEpFY3FMZEhORUt3TDJVZlJMU1o1dVBYNFl6eDFMNUtQZzYvaEtHR0xl?=
 =?utf-8?B?SmM2US9lMG55aDNPTEhJNTdWcVpxcUpiRmN4aU9PeDZvYkEyeklIaStINkJ1?=
 =?utf-8?B?WkZwZ2FwcE9ZZUczUGhiZGM2QTg1dDN4QTRlUHYvU0l2WWwzVGFHK1ExbmFq?=
 =?utf-8?B?U0t5b2dPcGhNeWhlcUZhRENzc2pXTm1STVMxRzhCcWZpS3dNMm5hVTFDT0ZC?=
 =?utf-8?B?YytrbGJaMkk4THRJRUJCMU82Vno4N2NSOStWc1ZoNG8xaEMzVGt0YjJyL01Q?=
 =?utf-8?B?NVZveHZMY3ZkZGtlQjBQVFZHMXlFTWVORHFWSW5pakZRZVNEMW9aZ0w2RFpp?=
 =?utf-8?B?TmJpYTkxRFp5ZXB1cVN0RUR4b1BSTUhTbWVoTUVQVnJHZ0hGaW9JTkRYN01U?=
 =?utf-8?B?bm1OWU12TkVQQTArYkZsR2VzRHplRjB4QXJhT0g2WVFUcVd4TXR6T2w3RGtt?=
 =?utf-8?Q?Ab3FRbU1/+/VTnH+eoQdABIMoH3k0eCXQl83buM?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9471e58e-a615-4dec-8b25-08d966b442dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 04:04:25.0148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbRh6Y4Nv3uFWZREUs46j5vsViLpNQzXoqk8NfaMF+mSPK05nIWvZSB300eq48ouUW6Oz6bAYN8g9lMsy6LVpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D6754DDE6C27E48BD547AE7F25B5717@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgSm9lLA0KDQpPbiBNb24sIDIwMjEtMDgtMjMgYXQgMTQ6MjkgLTA3MDAsIEpvZSBTbGF0ZXIg
d3JvdGU6DQo+IE1pdGlnYXRlIHBhdGhuYW1lIHRydW5jYXRpb24gd2hlbiBpbnN0YWxsaW5nIGlu
IGEgcHJvamVjdA0KPiB3aXRoIGEgdmVyeSBsb25nIHBhdGhuYW1lLsKgIFRoZSBwYXRjaCBpcyBv
biB0aGUgbWFzdGVyDQo+IGJyYW5jaCwgYnV0IHRoZXkgaGF2ZSBtb3ZlZCB0byBhIGxhdGVyIHZl
cnNpb24gb2YgaWN1DQo+IHNvIHdlIGNhbm5vdCBjaGVycnktcGljay4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+IMKg
Li4ucGtnZGF0YS1pbmNyZWFzZS1jb21tYW5kLWJ1ZmZlci1zaXplLnBhdGNoIHwgNDMgKysrKysr
KysrKysrKysrKysrKw0KPiDCoG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNjguMi5iYsKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRp
b25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9p
Y3UvMDAwMS1wa2dkYXRhLWluY3JlYXNlLQ0KPiBjb21tYW5kLWJ1ZmZlci1zaXplLnBhdGNoDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLXBrZ2Rh
dGEtaW5jcmVhc2UtDQo+IGNvbW1hbmQtYnVmZmVyLXNpemUucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9pY3UvaWN1LzAwMDEtcGtnZGF0YS0NCj4gaW5jcmVhc2UtY29tbWFuZC1idWZmZXIt
c2l6ZS5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5l
YTY4ZTRiZTlmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
aWN1L2ljdS8wMDAxLXBrZ2RhdGEtaW5jcmVhc2UtY29tbWFuZC0NCj4gYnVmZmVyLXNpemUucGF0
Y2gNCj4gQEAgLTAsMCArMSw0MyBAQA0KPiArRnJvbSBhYjZiMWFjZGVlZDc2ODk5ZjgyMjdjMzhh
YjdlNzY3NWM3NjczZmYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiArRnJvbTogSm9lIFNs
YXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPg0KPiArRGF0ZTogVGh1LCA1IEF1ZyAyMDIx
IDA5OjIzOjQ4IC0wNzAwDQo+ICtTdWJqZWN0OiBbUEFUQ0ggMS8xXSBwa2dkYXRhOiBpbmNyZWFz
ZSBjb21tYW5kIGJ1ZmZlciBzaXplDQo+ICsNCj4gK01ha2UgY21kIExBUkdFX0JVRkZFUl9TSVpF
IHRvIGF2b2lkIHBhdGhuYW1lIHRydW5jYXRpb24NCj4gK3doZW4gaW5zdGFsbCBwYXRocyBhcmUg
bG9uZ2VyIHRoYW4gYWJvdXQgMTUwIGNoYXJhY3RlcnMuDQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1
czogUGVuZGluZw0KDQpJIHRoaW5rIHRoZXJlIHdhcyBhIGNvbW1lbnQgZnJvbSBBbGV4IG9uIHRo
ZSBvcmlnaW5hbCBwYXRjaCBmb3IgbWFzdGVyDQpyZXF1ZXN0aW5nIHRoaXMgYmUgc2VudCB1cHN0
cmVhbSBmaXJzdC4gQ2FuIHlvdSBkbyB0aGF0IHBsZWFzZT8NCg0KVGhhbmtzLA0KDQpBbnVqDQoN
Cj4gKw0KPiArU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIu
Y29tPg0KPiArLS0tDQo+ICsgc291cmNlL3Rvb2xzL3BrZ2RhdGEvcGtnZGF0YS5jcHAgfCA2ICsr
Ky0tLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+ICsNCj4gK2RpZmYgLS1naXQgYS9zb3VyY2UvdG9vbHMvcGtnZGF0YS9wa2dkYXRhLmNwcA0K
PiBiL3NvdXJjZS90b29scy9wa2dkYXRhL3BrZ2RhdGEuY3BwDQo+ICtpbmRleCA1YWI2ODJlLi5k
NGI3MGVmIDEwMDY0NA0KPiArLS0tIGEvdG9vbHMvcGtnZGF0YS9wa2dkYXRhLmNwcA0KPiArKysr
IGIvdG9vbHMvcGtnZGF0YS9wa2dkYXRhLmNwcA0KPiArQEAgLTExMzEsMTcgKzExMzEsMTcgQEAg
bm9ybWFsX3N5bWxpbmtfbW9kZToNCj4gKyANCj4gKyBzdGF0aWMgaW50MzJfdCBwa2dfaW5zdGFs
bExpYnJhcnkoY29uc3QgY2hhciAqaW5zdGFsbERpciwgY29uc3QgY2hhcg0KPiAqdGFyZ2V0RGly
LCBVQm9vbCBub1ZlcnNpb24pIHsNCj4gK8KgwqDCoMKgIGludDMyX3QgcmVzdWx0ID0gMDsNCj4g
Ky3CoMKgwqAgY2hhciBjbWRbU01BTExfQlVGRkVSX01BWF9TSVpFXTsNCj4gKyvCoMKgwqAgY2hh
ciBjbWRbTEFSR0VfQlVGRkVSX01BWF9TSVpFXTsNCj4gKyANCj4gK8KgwqDCoMKgIGF1dG8gcmV0
ID0gc25wcmludGYoY21kLA0KPiArLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU01BTExfQlVGRkVS
X01BWF9TSVpFLA0KPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTEFSR0VfQlVGRkVSX01BWF9T
SVpFLA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJjZCAlcyAmJiAlcyAlcyAlcyVzJXMi
LA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhcmdldERpciwNCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwa2dEYXRhRmxhZ3NbSU5TVEFMTF9DTURdLA0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGxpYkZpbGVOYW1lc1tMSUJfRklMRV9WRVJTSU9OXSwNCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpbnN0YWxsRGlyLCBQS0dEQVRBX0ZJTEVfU0VQX1NUUklORywNCj4g
bGliRmlsZU5hbWVzW0xJQl9GSUxFX1ZFUlNJT05dKTsNCj4gK8KgwqDCoMKgICh2b2lkKXJldDsN
Cj4gKy3CoMKgwqAgVV9BU1NFUlQoMCA8PSByZXQgJiYgcmV0IDwgU01BTExfQlVGRkVSX01BWF9T
SVpFKTsNCj4gKyvCoMKgwqAgVV9BU1NFUlQoMCA8PSByZXQgJiYgcmV0IDwgTEFSR0VfQlVGRkVS
X01BWF9TSVpFKTsNCj4gKyANCj4gK8KgwqDCoMKgIHJlc3VsdCA9IHJ1bkNvbW1hbmQoY21kKTsN
Cj4gKyANCj4gKy0tIA0KPiArMi4yOS4yDQo+ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2ljdS9pY3VfNjguMi5iYiBiL21ldGEvcmVjaXBlcy0NCj4gc3VwcG9ydC9pY3Uv
aWN1XzY4LjIuYmINCj4gaW5kZXggMWNhODdmZWVlNC4uMTMwMjEyZDI0NSAxMDA2NDQNCj4gLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV82OC4yLmJiDQo+ICsrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2ljdS9pY3VfNjguMi5iYg0KPiBAQCAtMTA3LDYgKzEwNyw3IEBAIFNSQ19V
UkkgPSAiJHtCQVNFX1NSQ19VUkl9O25hbWU9Y29kZSBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZmlsZTovL2ZpbHRlci5qc29uwqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTov
L2ZpeC1pbnN0YWxsLW1hbngucGF0Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxl
Oi8vMDAwMS1pY3UtQWRkZWQtYXJtZWItc3VwcG9ydC5wYXRjaMKgXA0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZmlsZTovLzAwMDEtcGtnZGF0YS1pbmNyZWFzZS1jb21tYW5kLWJ1ZmZlci1zaXpl
LnBhdGNowqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiDCoA0KPiDCoFNSQ19VUklf
YXBwZW5kX2NsYXNzLXRhcmdldCA9ICJcDQo+IA0KPiANCj4gDQoNCg==
