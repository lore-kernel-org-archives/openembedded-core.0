Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web11.2234.1594839267302528736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 11:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=YYMNCAQK;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1968; q=dns/txt; s=iport;
  t=1594839267; x=1596048867;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mK93pPK3Lo/+YCCfInRVSfiYPV3Y+lB3dp5gWEYZ8zY=;
  b=YYMNCAQKyQBIHEHcNlCejzMkwlcIq8u6yknXzFwAAg+S5a6iiNhTv2QJ
   zC4I8b7CgGvm/n55ABYa7hleMKTeX688E8d9ZGdomh2aAH55Z8LOBk/6X
   s70tQ4hY6t0begH6SJrbDBg+XKkS/0znDJSdvw/ZEt7dRzCjwWGIWIQsN
   Q=;
IronPort-PHdr: =?us-ascii?q?9a23=3AeQdZsxA+5UkmOI6jfjOXUyQJPHJ1sqjoPgMT9p?=
 =?us-ascii?q?ssgq5PdaLm5Zn5IUjD/qw00A3GWIza77RPjO+F+6zjWGlV55GHvThCdZFXTB?=
 =?us-ascii?q?YKhI0QmBBoG8+KD0D3bZuIJyw3FchPThlpqne8N0UGF8P3ZlmUqXq3vnYeHx?=
 =?us-ascii?q?zlPl9zIeL4UofZk8Ww0bW0/JveKwVFjTawe/V8NhKz+A7QrcIRx4BlL/U8?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C1AABxUA9f/5tdJa1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIFKgVJRB4FHLyyEM4NGA41JmF6CUwNVCwE?=
 =?us-ascii?q?BAQwBAS0CBAEBhEwCF4FyAiQ4EwIDAQELAQEFAQEBAgEGBG2FWwELhXABAQE?=
 =?us-ascii?q?DEhERDAEBNwEPAgEIGAICJgICAjAVEAIEDgUihVADLgGfMAKBOYhhdoEygwE?=
 =?us-ascii?q?BAQWFPxiCDgkUeioBgmmDVYYzGoFBP4QhPoQ9gxaCYJJLomgKgl2ZWyGfOpF?=
 =?us-ascii?q?2nnoCBAIEBQIOAQEFgWojgVdwFYMkUBcCDY4eg3GKVnQ3AgYIAQEDCXyPLQE?=
 =?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.75,356,1589241600"; 
   d="scan'208";a="530453604"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jul 2020 18:54:26 +0000
Received: from XCH-RCD-005.cisco.com (xch-rcd-005.cisco.com [173.37.102.15])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 06FIsQQs013696
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 15 Jul 2020 18:54:26 GMT
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by XCH-RCD-005.cisco.com
 (173.37.102.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Jul
 2020 13:54:25 -0500
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xhs-rcd-002.cisco.com
 (173.37.227.247) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Jul
 2020 13:54:25 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-001.cisco.com (64.101.210.228) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 15 Jul 2020 14:54:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd4obKxMzESiQTAaFy1KFn9TMPAZaSXQkYanyCvcHPcFkqLFdLJANyxOPYkdUO4WZX47IKSLjv1IbMsYrRnoh+kcGMmz0eQ7NApjZxV+hF5h36sWOKYpgilX+bL/FQszN3pkz34zKGXhnyWyMwTbwKL7YP2wNKxA+i20x4cEDlrVrBBlskrKmqBhddQmdOsrbWnik+KGmMllBhNMZDwIROCG8d/qZMZinevQWnSui1LWngmfHxb9M67Llh5C0lAXxqluTLUvebBPTO2l3j4L4oJx374fNgaesFd/6eACDyuNCcGTewWxhi7MdlOnsvpyfMnJsOeFBCy2hMOxXOGr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK93pPK3Lo/+YCCfInRVSfiYPV3Y+lB3dp5gWEYZ8zY=;
 b=AA1dU5gXbQNGuaioubqnKm9RbV7QDViTwNwdt6NN1N+70abGZjxuyPMEzFz0/qeh5Tzm0nrAdWHRIKUcmvSYLf1atG4LAbx2yx6sAGZU3kekufzMP0kKd6xx4vunVTFaFKipPfWdmLg4elm58qBv2OqsrP3ii55Ct798hTY8tK7NdCRQ+V+ddHoTII3X5ZkpV3ZEzyS3Dbb/KgEeyxCnXwWpN/KBcc31J6Al3dl83k5u4nRzLJAJEqAsX8ya+yMfYh0a84JUC7gxsUG39n+pt8FEUA6aKG+3hEHsvuhyqbqkfeppjUVstDbvUUOjA8DJ7PZisabt2JIFyvCgHKengg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK93pPK3Lo/+YCCfInRVSfiYPV3Y+lB3dp5gWEYZ8zY=;
 b=Cae9BzrYBiAlaCWUy6g3nGbzJj5YSnJTkkjg+HeYCgbLaCyWuMsT86hZa3T1VqWz1tvabVBHeo5AQiDJH15ORnaY17bUeRU5sT0jWp2ZbphUlffpoGfEPSFtA5om1e5o1NKRWBl017t/FfzfsMnYApOvOHOjTArt+zQPawYyBMg=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BYAPR11MB2695.namprd11.prod.outlook.com (2603:10b6:a02:c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 18:54:23 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 18:54:23 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [PATCH] qemu: use host pkg-config only when host provides sdl
Thread-Topic: [OE-core] [PATCH] qemu: use host pkg-config only when host
 provides sdl
Thread-Index: AQHWWJRxH/6t7cQ1402drhAd4BrpmakIX86AgACEY4CAAAP+AIAAGVwA
Date: Wed, 15 Jul 2020 18:54:23 +0000
Message-ID: <b2d458f64f65890e3fa30644b4c18f7dcd74dddf.camel@cisco.com>
References: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
	 <20200712213551.2206605-1-takondra@cisco.com>
	 <CANNYZj8QBo7X5qoq3yse8rO3qh47_zTWkm6hkRUng2hHmj+c_w@mail.gmail.com>
	 <0cef3914ade47872815423de749d0885759d24e8.camel@cisco.com>
	 <CANNYZj-5OJTK7OZ0MHvdiHuWdEAykbG0SKbkxaQjYQpqkgQzqw@mail.gmail.com>
In-Reply-To: <CANNYZj-5OJTK7OZ0MHvdiHuWdEAykbG0SKbkxaQjYQpqkgQzqw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5117a05a-641f-41fa-6266-08d828f07d40
x-ms-traffictypediagnostic: BYAPR11MB2695:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB269524F36F91FA405D3BA140C87E0@BYAPR11MB2695.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o6IF1zzsIrE2st4uFIhP6OghhZE442aPybZmpQ0/IAbMndG12Qbl0mDg9cqiYYZNYOyMzxrp863erVRmjoNHMK0LtDvvLFLhN5I0Z6jz3mowN58bfBVzNzQM1PEeWW+bg/MiY8V+pWnPGMEX0mZprAm+hC3HT9UFdV0YeFa0e9PsHx0do4cBDe6soz+Wv6ESgRrMHSleEux8UlbnckO1l8ij3xZEPfUwVMpim5Z2DUaGbNaRek2ygVbNpeEVgXvieoVD4TQ3E/k8rTjWtSnHL8xalFy9YypwFitVeb9hhHDnrX4GArm0BR91opE4Tpeg5oEMXPyNRL/Xx1UHKmspJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(71200400001)(186003)(316002)(6916009)(2906002)(6506007)(66446008)(66556008)(66476007)(83380400001)(64756008)(5660300002)(54906003)(478600001)(76116006)(2616005)(8676002)(6486002)(8936002)(86362001)(6512007)(4326008)(66946007)(107886003)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: dhDITD/EDteTucVMNIf2LCNpXeISG4wOpyTClDk8oUI5HOYBQCzZ/c3Yg5pxfFyhg0H6bnaKdrf44eSF3Br/dG8cXO6QtsxeTrTX3zB25mZZZ/hwsa0osefYTCN8M3eb7fK2n80WhVxC2TZX9FVPy80foV5vTNZgKNoP/How7EhG/K1U4fWzdQt1gI/jFKI95q8WMkzyMNu0jhcDoHoHHTRJT5R35ATw5JxvKArAjk4fZF9tVy4OqWgn1tehtOeoihEjHo0RTJPWRXZvnAcN1EZO5x4DMaf2FlEmrGYoIIhq3r/gYhfsyHsU99O93jVsv5thssoJV5MEezqCqmcPP5Av90lLSErrggnIaj51L/phCq+904biAqIaIl3PSdIitC5vcJdh7LtITi25amYEjnJg00gS5fxiMTGs1aEdcAPBIiue36wzHwzOeRxAKmJcM5XHtqnE1FyIXk2Lc1jZF3x6IXjfHTSjBF38eHT/0NjEJZjxPpvWLUwp7pngkr8P04ZFN8YtVsMAV2YWBGUsYQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5117a05a-641f-41fa-6266-08d828f07d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 18:54:23.0399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BwNdEzmrOh6ypX+xi2XgvuwbGB0sqiPzQ8lBNHk/LFx2IYHZakkX8Y4i+8OZzU+M1Gd7tE1X6wja0zovvcSlbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2695
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.15, xch-rcd-005.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEABFEE1854658478FBF627C2CD99E9C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA3LTE1IGF0IDE5OjIzICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gV2VkLCAxNSBKdWwgMjAyMCBhdCAxOTowOSwgVGFyYXMgS29uZHJhdGl1ayAodGFr
b25kcmEpIDwNCj4gdGFrb25kcmFAY2lzY28uY29tPiB3cm90ZToNCj4gPiBUaGlzIHNwZWNpZmlj
IHhrYmNvbW1vbiBpc3N1ZSB3YXMgaGl0IG9uIFpldXMgYnJhbmNoLiBZb3UgYXJlDQo+ID4gcmln
aHQsIG9uDQo+ID4gRHVuZmVsbCBhbmQgbWFzdGVyIHRoZSBjb21taXQgM2YxZmQxNWNmMGRmICgi
cWVtdS1zeXN0ZW0tbmF0aXZlOg0KPiA+IGRpc2FibGUgb3B0aW9ucyBub3QgaW5jbHVkZWQgaW4g
ZXh0ZW5kZWQgdGFyYmFsbCIpIHdpbGwgaGlkZSB0aGlzDQo+ID4gaXNzdWUuIEJ1dCB0aGUgaXNz
dWUgaXMgc3RpbGwgdGhlcmUuIE9uZSB3aWxsIGhhdmUgdG8ga2VlcCBhZGRpbmcNCj4gPiBQQUNL
QUdFQ09ORklHIG9wdGlvbnMgZm9yIGVhY2ggY29uZmlndXJhdGlvbiB0aGF0IGNhbiBiZSBvdXQg
b2YNCj4gPiBzeW5jDQo+ID4gYmV0d2VlbiBob3N0IGFuZCBidWlsZHRvb2xzIHRhcmJhbGwuDQo+
IA0KPiBCdXQgdGhhdCBtZWFucyB3ZSBoYXZlIGEgbm9uLWRldGVybWluaXNtIHByb2JsZW06IGlm
IHFlbXUgaXMgcGlja2luZw0KPiB1cCB0aGluZ3MgZnJvbSB0aGUgaG9zdCB3aXRob3V0IGJlaW5n
IGV4cGxpY2l0bHkgdG9sZCB0byBkbyBzbywgdGhlbg0KPiB0aGUgcmlnaHQgZml4IGlzIGluZGVl
ZCB0byBhZGQgdGhlIG1pc3NpbmcgUEFDS0FHRUNPTkZJR3Mgc28gdGhvc2UNCj4gdGhpbmdzIGFy
ZSBlaXRoZXIgZXhwbGljaXRseSBlbmFibGVkIG9yIGV4cGxpY2l0bHkgZGlzYWJsZWQuICBUaGlz
DQo+IHBhdGNoIHNlZW1zIHRvIGJlIHdvcmtpbmcgYXJvdW5kIHRoZSBub24tZGV0ZXJtaW5pc20s
IHJhdGhlciB0aGFuDQo+IGFkZHJlc3NpbmcgaXQuDQoNClBBQ0tBR0VDT05GSUcgaW1wcm92ZXMg
ZGV0ZXJtaW5pc20sIGJ1dCBpdCBpcyBub3Qgc3VmZmljaWVudC4gSXQgaXMgbm90DQpmZWFzaWJs
ZSB0byBtYWtlIHN1cmUgdGhhdCBQQUNLQUdFQ09ORklHcyBjb3ZlciBhbGwgY29uZmlndXJhdGlv
bnMuDQpUaGVyZSB3aWxsIGJlIGFsd2F5cyBzb21ldGhpbmcgdGhhdCBzbGlwcyB0aHJvdWdoLiBJ
IHRoaW5rDQphY2tub3dsZWRnaW5nIHRoaXMgZmFjdCB3YXMgb25lIG9mIHRoZSByZWFzb25zIGZv
ciByZWNpcGUtc3BlY2lmaWMNCnN5c3Jvb3RzLg0KDQpXZSB1c2UgYnVpbGR0b29scyB0YXJiYWxs
IHRvIGJldHRlciBpc29sYXRlIE9FIGJ1aWxkIGZyb20gaG9zdA0KZW52aXJvbm1lbnQgYW5kIGlt
cHJvdmUgZGV0ZXJtaW5pc20uIEhvc3QgcGtnLWNvbmZpZyBvcGVucyBhIGJpZyBob2xlDQpmb3Ig
bm9uLWRldGVybWluaXNtIGFuZCBwbHVnZ2luZyBpdCB3aXRoIFBBQ0tBR0VDT05GSUdzIHNlZW1z
IGZyYWdpbGUuDQo=
