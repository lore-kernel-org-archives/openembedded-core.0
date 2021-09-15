Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.1831.1631670219105769504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 18:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=D8OebtYV;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="222237677"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="222237677"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 18:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="472226798"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga007.jf.intel.com with ESMTP; 14 Sep 2021 18:43:38 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 18:43:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 18:43:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 18:43:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 14 Sep 2021 18:43:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V05e0BNAKqedCfpvsyMaCY/UdvdLU1I65N+P0SYWi9SQX/8E2LGs7VZMyX7gXHAa06+T69oWR12dDiGbq+T3y4KnWGThT/HHHiG4LFdMpya+sMeXX/9I9p/jnSHYkIaF7i7DXhObyH0emt8SgAOWYiYtJTY+hWQHTBTrmvDCyWvQUHpiZB95vZPSHJ8cdl4MjkYx09D06qhg3ryUribQSSGz7DrRlJqpvMA2kRUzkosfNWWpk/Zcxw5WOakERSH0zNIWpwgYEcgm/B0593w0xg2SZFLyk284Z2whIpaUhe2QQ3sbpjJ9QL2y4Gqc6wP/bfQEWIXAWuWKNR7cOKzlgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=W42zTkCCwI9d/u7/5WMCIN28t/1t0/ifU938N1JMQNM=;
 b=mh8W1Oe3DLgr4Iytixxmrr6tu92ueBTghexf9j4Ju/b7BJuBrBCETFMayPPuSZwIYTWut7Ivbr/dHq1FiTX9tiByKHzSfLDW+quyLbXOxm27YMH+Eiukub0Ofh/Ccj9Y4Rfx4Uk4kTtI5Tjy29Xz8RSKqxjOfGsdQ5YAlvmq0FFMI6bygM3x1wtAk7ErGFy9d1UaMMU2f64LValat2wSUq2VcukvaGgnk5ZO7ISkMtkBapLcm/UTkIWLDLvfAtuTQTryeapLEZDG22DpBhhMpCt88vD9L9M5B3GsGcDqoIxzOqp/aWoQk03t0FYxpkoBXSDKvZIr9H+c6moIFSiyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W42zTkCCwI9d/u7/5WMCIN28t/1t0/ifU938N1JMQNM=;
 b=D8OebtYV0QNpvNCtXu79LCrwAsneHBO87L8vt+dTBbApL0+IFlvDrtsN88CZHGjs31X4EHgXxyxEn1IUWl5p9+N5K4QQGT54nXB6lz2R1K9/gPgvHCQ32NVjkBZThVrTgXRSAls7xpFex+S342yGK6eETuQglO0gRcCp189JZpY=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4242.namprd11.prod.outlook.com (2603:10b6:a03:1c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 01:43:34 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 01:43:34 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] [master] [dunfell] [hardknott] Revert "db: update CVE_PRODUCT"
Thread-Topic: [OE-core] [PATCH] [master] [dunfell] [hardknott] Revert "db:
 update CVE_PRODUCT"
Thread-Index: AQHXqZMc/sJfTQF8e0KV5NS3r+BYVqukSw2AgAAEzoCAAAMtgA==
Date: Wed, 15 Sep 2021 01:43:34 +0000
Message-ID: <6bf6a693e0682fb482ef36d1c3042deea1e11e44.camel@intel.com>
References: <20210914180345.163507-1-steve@sakoman.com>
	 <af688aaba4eb2333f7c5bd3861151914220fe840.camel@intel.com>
	 <CAOSpxdYZLiV0vLpMXpH0TnG0nO3erc9GoG5Soc-PKKWh8s42Vw@mail.gmail.com>
In-Reply-To: <CAOSpxdYZLiV0vLpMXpH0TnG0nO3erc9GoG5Soc-PKKWh8s42Vw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73dd893b-670d-4db8-36db-08d977ea3b00
x-ms-traffictypediagnostic: BY5PR11MB4242:
x-microsoft-antispam-prvs: <BY5PR11MB4242E4FC4636503A4D09A2F7F8DB9@BY5PR11MB4242.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UbBgPIP/m5ML0jkFCxvZ48DGNH0Uw+JfdeJIFDJTGZBVYlj+fpd3eX/uONPMNkhou+mB/QYRj5S5BjhIcpHI0EYTrRfa/oJPV5G//6GRTFiO4WGTDULtQqGBGZBaPwaNQVtOhCFr3/GMr8Phi/bZsas5gkjDIBft2srfbBMNVCI04Lh4zYYbrqe0A2t9s+zWmHRFfyt9sh0h4lu0ZcxPsDc124cwTqfqOLM6WnsSGbcSoQz1lO6Devi1Lb7DpqfgwDvyeAYAs2W+tm/4pmJn90BUGnIyPGRjI8/3f1uKSV1+t/HKjl6YW4EnCVkGV9i+Rg2g7WdIENXxXBA/y3jV6KjGEs2Bgx9t1i3xbF4TLzpT3fiZIWUBMXur4lMnAibGOK8TSAOs9PcnChTF/RkR73KhgLcpCSp4Xm1xYov0nT2tJIZqckjlJADxLQDZ6eXD8RT6LQOSh8RO6Bb6UgymKLKrIIVx19aNlDXyKJFyU2cocwW13GK92HEUOq+e0yVjXu2xcXH9e1CAo8hW289ILV9VQIDfOFZ5ZCFmEijTqZUXoxI9+Fm1f4V9w1Z8TARr30P6S0DI5MDZ/7ApCHcUmWhRPybq00+V3JEKjcdkDKlauZRXGBnbi6+AHfYrlZEbW9fMvBziP5YZ4y5R6S1YwI8p8j5uWlJ/Ya4I+EKQHdsF1SFFLzjNoYJSTdr3v7uBe19shRH5QpZ4XETmePMVplSbTG4Av6Oud1pO7mgyhauloGPAbskUcGB0d0aTpC03tYJ/PZ3uQQ7ANF5l6RZxOUqaQJjyNgSusDGxKYjTLKg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(4326008)(4744005)(2906002)(36756003)(38070700005)(966005)(6916009)(5660300002)(86362001)(186003)(2616005)(8676002)(26005)(6506007)(66946007)(66476007)(76116006)(6486002)(66556008)(316002)(38100700002)(64756008)(66446008)(91956017)(8936002)(478600001)(6512007)(71200400001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3kwb1hSbGU5bm1OaE1LdzI2SzdRMjNnZW9tcjlJTEM5NUk4Z1ExaUh3SmdZ?=
 =?utf-8?B?NWsrOFNSeEx6VERuUk9hd2JHS3ZjRlphT2ZST3ZMN05ROW9YS09rc2JJWHZu?=
 =?utf-8?B?ZVplUmdIbkJiV2J5VzV2ZVdCVFB5aW9XRWo5OUl5MER5NSttVnladjF1TFhQ?=
 =?utf-8?B?aitiZnlFSnN1T254aWxJT2R4Wk9HdDZwMWpja3ZOdm1PQ091OVlKTitnaEU0?=
 =?utf-8?B?SFYwRkVmYVlKdmVOc3dBTFpVOGlTcUhzRllzSVNvMEpxU0xVcFFhYVdBRFFl?=
 =?utf-8?B?T1d5ajZYSlpKek9GTG5CM28zeGpsMEE0MEo3ZnhuNDhRbFkzQjdGWGgvOXVz?=
 =?utf-8?B?dHl1eXFwTm9HVDRuaFpPL2tzNmFLVXcyZHkwdkh1emR0bCs4TThiKy92V1dv?=
 =?utf-8?B?SFY2eER5NVFRakUwOFc5OEFmOWoxMzVMZllhT00yWE1wa3I1bkplUEJUUjZ2?=
 =?utf-8?B?aHpCanRIVjlZUzJpQlFnZmFKaXR5eDRQUmlCT0lQS2hoT0dFWDFPSi9paTlP?=
 =?utf-8?B?WTJnL2xkNXFsYnVpOFc4bE5hZk1GTDlkQW9XUjlPQVppUHo1YnIwNnVSMVI3?=
 =?utf-8?B?c1l6SnJNUHJJUjFySVc4bTZNYkp3ekYzRFNWQVd5VzdwNUlFRFM2OFhLUUNp?=
 =?utf-8?B?bk1PTmdUYzMvcVYvdllqUDVLY1dQVXBOWEp2RHZmbmptOEs4eWI0eDhsWko5?=
 =?utf-8?B?MElVVjlCenU3RzI0TFRhT1AvTlh5MGg2dndqemRxL3A4VGw2N2lubjgzekpR?=
 =?utf-8?B?RkdycU15QWVrYzBPWTJsQlFXb3BXV0llOE9SbEptN0l0eHRzdEhScWlDa1E2?=
 =?utf-8?B?cWpodW5EbjkrZ0JkdnJHc3pHMjk3aEdCb2NpaHR0NCt5c2FCR2FNWmllOGhz?=
 =?utf-8?B?M1ZReEUxbGZpQTRsdnR2Snd1VmdFU3o0L2J5emUvc1R2NzVveHpTYjY1TjMw?=
 =?utf-8?B?N2VZKzNrdGx0ckVTbFdTOFRCS2RmV1RkcXdNa2h6blFoSHBaM0RhRStQMTd6?=
 =?utf-8?B?bVgrZ1NyRk9TUXBoRmZoWFlOL1U0SlZhUEdqcnF3YzIyK1lXL3lBc2pTbTBN?=
 =?utf-8?B?L0JybTlqOWZHN1FQdXpKSkYxUGY4TEtHd3B1czBVMExWU0Y1U0JDakFqRWdT?=
 =?utf-8?B?d3UveEgxZ2s3bHBEUWdxd2VIa3lWeXp0cXZ5amI1SnZQYXJ3S1NsMi9vcWRt?=
 =?utf-8?B?ZngvZ1lDck8wOVJVem9qcEdFaXg3ZWt0WVZJNlJBLzdhdkxLMm9VTGo2bk5R?=
 =?utf-8?B?Mm5uTXRBdHQrVjVtK2FGUkJ2QURwbDVuY2RGWU1iajN5ZDFjbTVsNXUwclFj?=
 =?utf-8?B?MnQyYk1iVkRpSGpTZ29jTVo3MkxvZ09lbk9SbzgwQ295emloeE92blFheUNr?=
 =?utf-8?B?bkZrNnF0Wm5XVS9HUWxhOEhoZGpacW5VOElTREp6QzJ1M2ZXTmhZVVpWT2Nq?=
 =?utf-8?B?K1VjL3U1T3dBUnVWMHozTklBdkNqNVc4R2w2ZDlQMTd3K0s2RndlM0drOXhS?=
 =?utf-8?B?RXdkUDhZUmpZOWd4U1BGdUcrMXl1bUgvSlNNME1IK0taWXJpMDhLMlFpR25G?=
 =?utf-8?B?V243M2NmdGVPK2xHcnd4bWx0RnpRR2NPcHExVDFIZjNlbXIzTW81K1lJRUNt?=
 =?utf-8?B?ZXFqcCt5NEdLdkd0SkRaY2ZYOFp1OTRlZnJhaEhJbFg4REhhN3pCUzZ4emw2?=
 =?utf-8?B?OFVZaGM2NEtWdG5lV3BTMFVjci9hcmk4M1ZWbU84ZE9hVFBwYkQvUmNQM21G?=
 =?utf-8?B?SDFrZC9wRGwweTMwenRWU0syN256c09rR1dRcTAwMVl1dTk1N2R6RnZRWW44?=
 =?utf-8?B?ZEhhRlkvckJhZjJvUmMxZz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dd893b-670d-4db8-36db-08d977ea3b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 01:43:34.4990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmQHxwKdVJbcRAy5ga1KsEaoOdJLk3gvtHh2V/I+G95YC7wIT0bPZi7rwQ0huEp/5zVTGef9LSJbtBMMo8jstw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4242
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9148EB056B243B4088B08EBA43EE7D18@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIxLTA5LTE0IGF0IDE1OjMyIC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0K
PiANCj4gDQo+IE9uIFR1ZSwgU2VwIDE0LCAyMDIxLCAzOjE1IFBNIE1pdHRhbCwgQW51aiA8YW51
ai5taXR0YWxAaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjEtMDktMTQgYXQg
MDg6MDMgLTEwMDAsIFN0ZXZlIFNha29tYW4gd3JvdGU6DQo+ID4gPiBUaGUgQ1ZFIGRhdGFiYXNl
IGNvcnJlY3RseSByZXBvcnRzIENWRXMgZm9yIG9yYWNsZV9iZXJrbGV5X2RiIGFuZA0KPiA+ID4g
YmVya2xleV9kYi7CoCBXZSB1c2UgdGhlIG9yYWNsZV9iZXJrbGV5X2RiIHNvdXJjZSB0cmVlIGFu
ZA0KPiA+ID4gdGhlcmVmb3JlDQo+ID4gPiBzaG91bGQgb25seSBjaGVjayBmb3Igb3JhY2xlX2Jl
cmtlbHlfZGIgQ1ZFcy4gT3RoZXJ3aXNlIHRoZQ0KPiA+ID4gc2Nhbm5lcg0KPiA+ID4gZmFsc2Vs
eSByZXBvcnRzIENWRXMgdGhhdCBhcmUgZml4ZWQgaW4gb3JhY2xlX2JlcmtsZXlfZGINCj4gPiAN
Cj4gPiBBcmVuJ3QgYm90aCB0aGUgc2FtZSB0aGluZz/CoEkgdGhpbmsgdGhpcyByZXZlcnQgaXMg
aW5jb3JyZWN0IGFuZA0KPiA+IHRoZQ0KPiA+IENWRXMgYmVpbmcgZmxhZ2dlZCBhcmUgY29ycmVj
dC4NCj4gPiANCj4gPiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAxNS0y
NTgzDQo+ID4gDQo+ID4gVGhlIENQRSBkYXRhIHNob3dzIG9yYWNsZSBhcyB0aGUgdmVuZG9yIGFu
ZCBiZXJrZWxleV9kYiBhcyBwcm9kdWN0Lg0KPiANCj4gWWVzLCBJIGFncmVlLsKgIFNlZSBteSBy
ZXBseSBmcm9tIGVhcmxpZXIgdG9kYXkgd2hlcmUgSSB3aXRoZHJldyB0aGlzDQo+IHBhdGNoIQ0K
DQpPaCwgdGhpcyBpc24ndCBzaG93aW5nIHVwIGFzIHRocmVhZGVkIHNvIEkgbWlzc2VkIHRoZSBy
ZXBseS4gVGhhbmtzLg0KDQpUaGFua3MsDQoNCkFudWoNCg==
