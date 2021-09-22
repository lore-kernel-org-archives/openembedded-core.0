Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.1273.1632273786346297509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 18:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=BTiGyRbe;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="309049298"
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; 
   d="scan'208";a="309049298"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 18:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; 
   d="scan'208";a="585215273"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 21 Sep 2021 18:23:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 21 Sep 2021 18:23:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 21 Sep 2021 18:23:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 21 Sep 2021 18:23:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ll0xGkFLNYGwZUYdCzH4bmr/9rrWE+oXABppFCn62P1XPLrghD07ZUeduD3JaBg3HsgPxlAF0Rev9KS8NEZdHmLzSyouQeMkOqzRDSA8mV8VdB4T7kpnNvWITAsoirIPKVolAcR18RY01ZsSNFCU6pLKqiO5QnC46/ZnETsP/3f9D/WHOK5lPLXCqmoE5nCY+F1tPlDDr77WO1FKDk7SYAGBOhNxBUrdpllijbiKBJSyt586E9fYmLesUH2KxVBS0ICpH9VqsT8KHNXLFsfHMdOL8qmX2I2jrZUjBpd0V99Yy4rW4QAR50gmR9rY6c0WnSz10xRgJqH/qMItK1c2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oDRd9XKG/cj7+Ue4GG8CdF5Kw1BU+9RJnGZBd5+4yyw=;
 b=loYK4NqUsHS+mwBl0KHQlo5HUFzZP6qugz/SPx65ms/RsZy1hSDfp8PTMK7OQtwQKnYgakxdO3NJAguDV6pEEkHFSKn3Uo51H7cJ1D4N/ioEdW8ZYtSPod+dRhsowvclWEJCASjXW0xgmb5ZlVhaQb1FGhRYlj5Op2y3Hioh2BDBqvMscrtApiktCTCn2h0rKv/STlMzTKFizvArHuwYZRKXH1j5/eG07mORGbglS7AJj4LpUtM+xZLTWCsF/QNo8Pyz7mCFNGwfqCDHE50HGv6RLKWLltrd0dRNTQbh3HAkVZWcY8zf3NSF3HQJHyHhCMA6zFrSIEkhfG/1uEPu1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDRd9XKG/cj7+Ue4GG8CdF5Kw1BU+9RJnGZBd5+4yyw=;
 b=BTiGyRbedxqLQm1eLRe52mXbC8S+5kUO7rqUFe48xT7VANlaXlIJCK0GQzqijymkL0Vc6iKfJGnFvRd6TGLv30zAI/hdlB74/YJ8s/It3b2UsO4xAsVqpt8+Mnb+IIwHXc99VNBf2gKQDz8TnmL8jzEk7rGqQ09Mkg8rNCb8E9A=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 01:23:04 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4523.019; Wed, 22 Sep 2021
 01:23:04 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [hardknott][PATCH 3/4] externalsrc: Work with reproducible_build
Thread-Topic: [OE-core] [hardknott][PATCH 3/4] externalsrc: Work with
 reproducible_build
Thread-Index: AQHXrsp3Z5hto2XYCUK/1EnvLB3kk6uu1OiAgABuSYA=
Date: Wed, 22 Sep 2021 01:23:04 +0000
Message-ID: <0f8c242eb859b693bc7f49993a1ded4ee575e246.camel@intel.com>
References: <cover.1632216051.git.anuj.mittal@intel.com>
	 <dc225a484c17c261f95adb1ec4f00f9359f10569.1632216051.git.anuj.mittal@intel.com>
	 <037384a156440cd47f71e27c7f89baf72b899cba.camel@linuxfoundation.org>
In-Reply-To: <037384a156440cd47f71e27c7f89baf72b899cba.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99d1f4c4-874a-4db6-cda5-08d97d678692
x-ms-traffictypediagnostic: SJ0PR11MB4800:
x-microsoft-antispam-prvs: <SJ0PR11MB480050B68D77E6F397B8C95EF8A29@SJ0PR11MB4800.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DrKa/pDqNSqm3kBbf45SryiRNL7Sq3hnjPsDcOj6nyPkB1+fFuuAXxR3PNHZC6xTmcbjxIMZ6oEy5i9bK93hHVk4nPpU51nxbfxWYGxsK24hr8v9f4AeK3xUECTpgwpEf/n0Yr+xEqT1uIojWt6GvmV91wcxBK5Td4tBZj77k1HqtXh2KnuL8lFD63g04tw1srdMVKd9JsJgL4RKzDByqKS4HyaQQmcYnF62RyEdOI5RBbSZerSPGrkIVmCPZ7pvV8nNRpL5vltskSD8e/VK5+nSUYE1Q1i7ub0C94BYNWF7vBasZdtyALP2k3h4MQkIs0kYfBMtnVkMz21l7QGEZnLt0Unxg7d1CP1nSoKkCTJq0+T/ppUr26oKBDMsC2dpFS69b1GxzH4olBgi1S15bn35h4T3uAQ8PSRktpNaD1SDyCyakaA7PbrCWCSRUuVdUCvHADQYYN2AG8mmcNUOtxG1+2lhU/MqwPrExLR3NrfMcbOxlzcHuIGlF5kcg2k+YLrBelmtH2XjweZEAJ1Lfm/DuUSJm9ZTBwFPh0vOTK8imV6Zvu+o4KZrv/Bnl56jUKNZ1JrfBid+AbPzjXBM3ekSsRVNuxq1z+GRA2yFsNO5D/RPibqThoccYtIE9Gf0NXubgWSAin0WQTMnfVCXW/XDZvbTGCmBT9UzPja4jid1vXCVx6Koae+duZkvCz+g8pAYPX9h8RlUIPb2mcCuSGwikfDX2dp/WB3Xch4FcujyA4lZ5SIN6U8Z+aI8z/FlPfsiwLWhxgbkCNPTKciW89GcYItkcTCS3/SkyrdeSEM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8676002)(66946007)(6486002)(36756003)(110136005)(122000001)(5660300002)(38070700005)(6506007)(186003)(26005)(8936002)(6512007)(2906002)(38100700002)(86362001)(83380400001)(2616005)(91956017)(71200400001)(76116006)(66476007)(508600001)(966005)(66446008)(64756008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWVqcTVRL0VaMi9VNXJkN3FQMUhpS2pQMGg0SnErYUFEY0UzZnN2NWFzd3Rl?=
 =?utf-8?B?dERxOEV2TFFKYzdCemNZQStIUkg1aE01OTRpT3MwaHZXRjZ0b3VHV1NqZDJu?=
 =?utf-8?B?dDZPTXZlUEtXY21Qc0huNWJ4dGN4VnR5dytPMUxEWlhTWTJYOWlhTDVxZ05K?=
 =?utf-8?B?MjlQc0NEYkg0cFRUTnpqVmV0Z1cwNWhBNmhiNEhTRVJYdThJSGMyMDBlckxo?=
 =?utf-8?B?QjhzREpCK21JWWxQWW4zd3JoY0JpL0JYZFFxNVJrV2g0alQ2Sm9BSkpBMEtK?=
 =?utf-8?B?Vm9PSDVsakFEdEU2NGpYZU5ZdnZIU2h1OHBhQlUyVS9lM1pnR1ovcDB2UUJM?=
 =?utf-8?B?eGhHM21CTmFuYzBtSlg5TlRucEFIT09JZHFxWktRMDJUVVlEQ2JnUlRFeWZW?=
 =?utf-8?B?bkQ4MVczKzVYOTBpaC9EN2RORmZXS1JNcndYU2xldFl6bEFUbURVdlVwYUpI?=
 =?utf-8?B?TDBVSmZQTm9MMXRHb1NxcFRDZXZ4c1RZU05SSUdyOUVrWmJubXVZYTVrS3VT?=
 =?utf-8?B?REI1TXdPbHg2ci85YmlPUm9qeWhSM0JIb2l6VE1UV1JIdkJpTDNRQnVzOFJP?=
 =?utf-8?B?MXNVSnFDS1d1UUljVkk1WFU3MTF0cnhmMkZSSEV4cUp4OWlIWEwyaDB6SGll?=
 =?utf-8?B?Vy9XVCtlU3oxSDNQcS9EaGtOdEFDUStFRW9yTnU5Uis3V1p4ZWozN3V3NU5Y?=
 =?utf-8?B?dzdGc2pnSFVoRVI1aHFkZ2pYbDJaSEtKVTlWUWNlMWlFN3BNbHBXdkhmMlVT?=
 =?utf-8?B?MWE2T1BuK1dkaVF0dGRsZ1NJQ0RSWXNkbW9mTHZnY3hSL08zMVB4M3g5VlVI?=
 =?utf-8?B?QklkUEo5WElxUWtMaFNtSGx2V25OMThTbnB3RHhSL3VlbmNJdFZNVnJKaTdG?=
 =?utf-8?B?RFo4aDdnb1JMQjVlbHF2TmE1WGJTcjNBUFBvS1JLWlRESThuakVzeWF1b2do?=
 =?utf-8?B?T2NnTEpLL0s1cFgyNkQvdU93VU93dDMrOXM0alowLzBBS01Nd1FYaFVMTFZD?=
 =?utf-8?B?YWZQV3QrNm55U2ozNXFONFFFOGZHOFdMRXZ1ZzhodVUxNDFFKzRjTkZGbG9r?=
 =?utf-8?B?bG1RVWVxTWF4Vjh5SUttZ2h0R1VxUXR4aVlTd0pTbEdNeEFDNnZ2K0J1SkJs?=
 =?utf-8?B?UHNYalJBUlhSQ3pKNnNOa0ZQczk1TDdubURsWWY2ZmV2bVk2R3NVanpjOWQv?=
 =?utf-8?B?UzJhYnR0N0dxQW1uSnhIWU5pV0w3NEhhUktLaklWMmlqQVB5b25OK0gzZEFq?=
 =?utf-8?B?T0hGbzdYdU11ci84aHoxcTNHTDV5Z05NajZOTXhhMWN5YU1LamJVaTdtZWxa?=
 =?utf-8?B?NUtJNGVlSTI4Wi9vSit2RFRYQmxmRGROVnU5SFNHb0VBbklGbzRWZmU2OXds?=
 =?utf-8?B?SFEwQTB0R2F5L3ZMbnNuaVZSbXIyLzh2RjNmWjJXWnptQk1ZWVNzYkNGeXIx?=
 =?utf-8?B?MXBjQVdZTWllYUZxSm1PR05DRDhZWVprYWljN25GOEk3ZHhlSE1IZUxuem1V?=
 =?utf-8?B?R0hDbzE4UXZ2UTNXeldaTXMycTMveHlLWEJqajhNQnBtSFlON1lWUlpGN1hu?=
 =?utf-8?B?S2krckljY3hqeUZ6VHU5WDRBb0RhekFFbUVWNVJXdWRzVmk2am1jRThJVGVS?=
 =?utf-8?B?OC8zNGdGTFpYdWRtTFc2WUJZbUoxbG5TcVBiK1JOQXIxSDRZMTY2MFJScmtS?=
 =?utf-8?B?Kzl0OTJXMVBJU1J2QytLM3ZnUkFnSktYY0ZyanMxK2ZrQkZjOXVqa1ZpR2h2?=
 =?utf-8?B?U0wyeHJYeXJsYXowMHpxUmpzMnhERXJuVTUrMEwzbE5GQTJRYWNGalNsMVZk?=
 =?utf-8?B?MldiVXY1WWJObkNGZWp6dz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d1f4c4-874a-4db6-cda5-08d97d678692
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 01:23:04.1680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQ8/IdqLEToCELNn7EWX9zoE9Bw5HBWo5tzXZnD7W8e4uZPoV4y9OSshyfA4EMgVwkSwT5PlRPFXSz61APF5Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B336E4B68DE4F84ABA29FCA0BF1CAFD7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIxLTA5LTIxIGF0IDE5OjQ4ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gV2VkLCAyMDIxLTA5LTIyIGF0IDAxOjAzICswODAwLCBBbnVqIE1pdHRhbCB3cm90ZToN
Cj4gPiBGcm9tOiBNYXJrIEhhdGxlIDxtYXJrLmhhdGxlQHhpbGlueC5jb20+DQo+ID4gDQo+ID4g
RXh0ZXJuYWxzcmMgcmVtb3ZlcyBkb19mZXRjaCwgZG9fdW5wYWNrLCBhbmQgZG9fcGF0Y2guwqAg
VGhlIHN5c3RlbQ0KPiA+IG5vcm1hbGx5DQo+ID4gZGlzY292ZXJzIHRoZSBjb3JyZWN0IHJlcHJv
ZHVjaWJsZSBkYXRlIGFzIGEgcG9zdGZ1bmNzIG9mDQo+ID4gZG9fdW5wYWNrLCBzbyB0aGlzDQo+
ID4gZGF0ZSBpcyBuZXZlciBmb3VuZCwgc28gaXQgZmFsbHMgYmFjayB0byB0aGUgZGVmYXVsdCBl
cG9jaC4NCj4gPiANCj4gPiBJbnN0ZWFkIHdlIGNhbiBtb3ZlIHRoZSBkaXNjb3ZlcnkgZnVuY3Rp
b24gdG8gYSBwcmVmdW5jcyBvbiB0aGUNCj4gPiBlcG9jaA0KPiA+IGRlcGxveSB0YXNrLsKgIFRo
aXMgdGFzayB3aWxsIHJ1biBiZWZvcmUgZG9fY29uZmlndXJlLCBhbmQgc2luY2UgdGhlDQo+ID4g
c291cmNlDQo+ID4gaXMgYWxyZWFkeSBhdmFpbGFibGUgY2FuIHJ1biBzYWZlbHkgYXQgYW55dGlt
ZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIEhhdGxlIDxtYXJrLmhhdGxlQHhpbGlu
eC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFyayBIYXRsZSA8bWFyay5oYXRsZUBrZXJuZWwu
Y3Jhc2hpbmcub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiA+IChjaGVycnkgcGlja2VkIGZyb20gY29t
bWl0DQo+ID4gMGI3ZGQ3MTFhNTRlOTJjZTU0YWJlOTlmNTlmYzY3ZTY4M2Q1MmRmZSkNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+IMKgbWV0YS9jbGFzc2VzL2V4dGVybmFsc3JjLmJiY2xhc3MgfCAxMCArKysrKysrKysr
DQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhL2NsYXNzZXMvZXh0ZXJuYWxzcmMuYmJjbGFzcw0KPiA+IGIvbWV0YS9jbGFz
c2VzL2V4dGVybmFsc3JjLmJiY2xhc3MNCj4gPiBpbmRleCAzZDZiODBiZWUyLi4xZWE5MzhmYjYy
IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9leHRlcm5hbHNyYy5iYmNsYXNzDQo+ID4g
KysrIGIvbWV0YS9jbGFzc2VzL2V4dGVybmFsc3JjLmJiY2xhc3MNCj4gPiBAQCAtMTEwLDYgKzEx
MCwxNiBAQCBweXRob24gKCkgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnRpbnVlDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJiLmJ1aWxkLmRlbHRhc2so
dGFzaywgZCkNCj4gPiDCoA0KPiA+ICvCoMKgwqDCoMKgwqDCoCBpZiBiYi5kYXRhLmluaGVyaXRz
X2NsYXNzKCdyZXByb2R1Y2libGVfYnVpbGQnLCBkKSBhbmQNCj4gPiAnZG9fdW5wYWNrJyBpbiBk
LmdldFZhcigiU1JDVFJFRUNPVkVSRURUQVNLUyIpLnNwbGl0KCk6DQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIyBUaGUgcmVwcm9kdWNpYmxlX2J1aWxkJ3MNCj4gPiBjcmVhdGVfc291cmNl
X2RhdGVfZXBvY2hfc3RhbXAgZnVuY3Rpb24gbXVzdA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICMgYmUgcnVuIGFmdGVyIHRoZSBzb3VyY2UgaXMgYXZhaWxhYmxlIGFuZCBiZWZvcmUgdGhl
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBkb19kZXBsb3lfc291cmNlX2RhdGVfZXBv
Y2ggdGFzay7CoCBJbiB0aGUgbm9ybWFsDQo+ID4gY2FzZSwgaXQncyBhdHRhY2hlZA0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgdG8gZG9fdW5wYWNrIGFzIGEgcG9zdGZ1bmNzLCBidXQg
c2luY2Ugd2UgcmVtb3ZlZA0KPiA+IGRvX3VucGFjayAoYWJvdmUpDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIyB3ZSBuZWVkIHRvIG1vdmUgdGhlIGZ1bmN0aW9uIGVsc2V3aGVyZS7CoCBU
aGUgZWFzaWVzdA0KPiA+IHRoaW5nIHRvIGRvIGlzDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgIyBtb3ZlIGl0IGludG8gdGhlIHByZWZ1bmNzIG9mIHRoZQ0KPiA+IGRvX2RlcGxveV9zb3Vy
Y2VfZGF0ZV9lcG9jaCB0YXNrLg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgVGhpcyBp
cyBzYWZlLCBhcyBleHRlcm5hbHNyYyBydW5zIHdpdGggdGhlIHNvdXJjZQ0KPiA+IGFscmVhZHkg
dW5wYWNrZWQuDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZC5wcmVwZW5kVmFyRmxhZygn
ZG9fZGVwbG95X3NvdXJjZV9kYXRlX2Vwb2NoJywNCj4gPiAncHJlZnVuY3MnLCAnY3JlYXRlX3Nv
dXJjZV9kYXRlX2Vwb2NoX3N0YW1wICcpDQo+ID4gKw0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgZC5w
cmVwZW5kVmFyRmxhZygnZG9fY29tcGlsZScsICdwcmVmdW5jcycsDQo+ID4gImV4dGVybmFsc3Jj
X2NvbXBpbGVfcHJlZnVuYyAiKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgZC5wcmVwZW5kVmFyRmxh
ZygnZG9fY29uZmlndXJlJywgJ3ByZWZ1bmNzJywNCj4gPiAiZXh0ZXJuYWxzcmNfY29uZmlndXJl
X3ByZWZ1bmMgIikNCj4gPiDCoA0KPiANCj4gSSBhbSBhIGxpdHRsZSBjb25jZXJuZWQgYWJvdXQg
dGhpcyBvbmUuIEkgdGhpbmsgaXQgbWF5IGludHJvZHVjZSBhDQo+IHJhY2UuIFdlIHNhdw0KPiB0
aGlzIG9uIHRoZSBhdXRvYnVpbGRlci4NCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9w
cm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODcvYnVpbGRzLzI1OTQvc3RlcHMvMTQvbG9n
cy9zdGRpbw0KPiANCj4gSSBkaWQgcXVpY2tseSBwdXQgdGhpcyBwYXRjaCB0b2dldGhlcjoNCj4g
DQo+IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0LmNnaS9wb2t5LWNvbnRyaWIvY29t
bWl0Lz9oPXJwdXJkaWUvdDIyMiZpZD1iY2Y0NmE1ZjEyYWUxNTcxM2E1MzI5NzM0MmQ4MzQxYjcz
YzE2ZDk0DQo+IA0KPiBidXQgSSBoYXZlbjt0IHRlc3RlZCBpdCBvciB0cmllZCB0byBkZWJ1Zy9j
b25maXJtIGFzIHlldC4NCj4gDQoNCk9oIG9rYXksIEkgd2lsbCBkcm9wIHRoaXMgY2hhbmdlIGZv
ciBub3cgaW4gdGhhdCBjYXNlLg0KDQpUaGFua3MsDQoNCkFudWogDQo=
