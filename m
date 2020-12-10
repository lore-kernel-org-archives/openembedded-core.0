Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.136])
 by mx.groups.io with SMTP id smtpd.web12.17912.1607623556759680327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 10:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=Mw36rDOG;
 spf=pass (domain: microsoft.com, ip: 40.107.2.136, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2AmJgM4TLxXQNXHOuGe2MB4co8r1IKYpBBsDm9uLGp+WKwLo/Wd2C5x1wcoQw2vVoEHhZ7TCv7/4LLxo+OiXSCy02UKm44vs1HwLM5sF9a84M+V6mgsWT/90CBYXMjiptDMzsayF3JsE1n9vGd+Jegy6kZpUhsx0cIbcttN9byWEL0dDE94h/qYgIsDhcur8+tzxwWTojlro/ikcxGir4JcwhZtja/sKF4vvJQmWl/KXj7aIxx1K8QjyuSji9KjX5Jzg8OiagsGEvSZUk/b0YrRxrvIJUYf877Hh++lErW2OK0rPCsHbIh6vO6jx148sOqvWRqmeDspLM/pJersow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXJ2wco/7Ld+rnzLV9wBsF3Rd9p/TuMT4ecMi/iJsNk=;
 b=bYQje64rcFGa5rB1x/XA84IbB3+8jSixRUdWSDLFj6uo61zuFnO0stURaf8nRtwjGZGE1PYdIR70msJRbODKjlzmv00ewU6uvrFbrbLWmvYSBw3MjVAUjaP6tu4wVledn7t3qA20ujAi1yOx1sc0TaPiX6Ua0eSAIJ+GvS3VOJgK6JcbyKEqqJ8Jvsm1oaSmWGmhB8G4ThW+YzbBF2DNyg32HU6Y5pJZe1Fxkqu/ugUwjIryVsIClmTCsIOERgWTHjBcCVH4Bv0mtLEu9p25mUaNtBulN8CsTz2CCR3BVJvDNTaZeHtoEEPqIg7jASN+QU/lyTVNEizoBC4iQXGACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXJ2wco/7Ld+rnzLV9wBsF3Rd9p/TuMT4ecMi/iJsNk=;
 b=Mw36rDOGyQkCukQepenAtDK6bsjO5K4kV4Cu+z1vR/MfD5rlOagCFqLWApI7amHbuDad1JEZN1YZtKna4tqXnaHPoLd6evq5zFhlpnUubgeXp1hvHES2mwjRoKfo6USHN7Cpv9bJRFZzMyMbihtnUWW0CwWnV2ZPMwd+TlSojfc=
Received: from (2603:10a6:206:25::31) by
 AM7PR83MB0468.EURPRD83.prod.outlook.com (2603:10a6:20b:1b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.5; Thu, 10 Dec
 2020 18:05:54 +0000
Received: from AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::90da:f9ec:91f0:285b]) by AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::90da:f9ec:91f0:285b%3]) with mapi id 15.20.3676.006; Thu, 10 Dec 2020
 18:05:54 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] systemd: update 246 -> 247
Thread-Topic: [OE-core] [PATCH 1/5] systemd: update 246 -> 247
Thread-Index: AQHWzx8ZtS4geH7rYUiROqxtGwVsAA==
Date: Thu, 10 Dec 2020 18:05:54 +0000
Message-ID: <22ce46324e27aacc8cddee2c3f716adae091fbfb.camel@microsoft.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <4b5b304d-9cff-4a61-16b9-6dd8fba58626@gmail.com>
In-Reply-To: <4b5b304d-9cff-4a61-16b9-6dd8fba58626@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b3a6baba-5efb-414a-f62c-08d89d363c92
x-ms-traffictypediagnostic: AM7PR83MB0468:
x-microsoft-antispam-prvs: 
 <AM7PR83MB0468D9BEBD1602D61821904FF1CB1@AM7PR83MB0468.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wfQFZ19J+rF2nxHrJ4euVxXUTamrEIYgnc84cjjTqYHBUJqfrk0mSVnOJKDM30B8BuluFs7mCQYJb6j8OjAHbmFPsZionm38qCzc7mTkZ9MOaFVpd4fi2jr/IV6bSUnxk2oqkeP8Z0SEzJpD2cFxc+NZ6PZEJ/LXljecqdIL0F1Y1G0RYfkJrC+jGD3RGoLdXxG7v23QG8btK22mAWL2vU8KTW5dNP0myBknBo3wXFH6dVUp+fYUVVC+ocX252++aRJXbzFRHMvTEYlWdg2oSc2j6khkSq2DcJpZDH12kAqdLflk/afxZ/Qayc3YkyrISVRhq0b1PySeFJqID92EU1u/gSLd9S9qTLuz5rtDsMOW5ADVS2FIXf3r5oVPQ4CIrSP6C8+h27VuC1VhppuWZA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR83MB0178.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(36756003)(5660300002)(86362001)(2616005)(4001150100001)(10290500003)(316002)(186003)(66556008)(66476007)(64756008)(66446008)(110136005)(71200400001)(4744005)(478600001)(15650500001)(26005)(82960400001)(6506007)(53546011)(66946007)(82950400001)(83380400001)(6512007)(6486002)(8676002)(8936002)(76116006)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?bnFJU0xrS3lrMnU0akhhVnM1aVppVXA2UmF0Q0g0Rkxwd1BNNWI0VStOSEg1?=
 =?utf-8?B?aE5kYVF2dDF4dkFzNm8yOHBJWVVUNDRmU3ZVUmdvcUlJMm1ybWJGUkthWkxD?=
 =?utf-8?B?QlNvZjJjWlAwa2VZdGhUdmZ1dkZ3cEFvUTJiTFc5d3Rvc1h2cHUwaGJvS0RC?=
 =?utf-8?B?Nm5WTFJEeHNTVnh2N1gyQkkwTFdoQmxTK2NoRUNubHJubmhld2lNVGtvQ1px?=
 =?utf-8?B?NkZBbTBYTlBncGo5MmoxaCtENUpLOUhKa0YzNUZiV3BRNDE1YjNIWkxSYjRl?=
 =?utf-8?B?T2JsUG9CZnp5bXZYNUZ6Y25jbU4wUHR0azZWWmlzOHpzUHhZSGZrOTJpM3NJ?=
 =?utf-8?B?NnlLSUtFU29nZXk4T0RSSTJzeDBMbWNpRlJaQnNTNG1Fck1vL0htWUpVaXRn?=
 =?utf-8?B?WWpncmVoZ0FYcEF5bHBKQlFIbTliUGY1cHZSNmlBSkUwL3l2S3BlRjR4bzBh?=
 =?utf-8?B?S1l5WFlqWWk5MURwKzRIbWFOazQ4L083U3dnc2RVK040Tm9UaWVheC9NNDN5?=
 =?utf-8?B?MTlKK1RDTklFM0I5anBkQkZlZ3lrbkRPNGhKYngzNlRxV1U0MDA4dklIZ2Vq?=
 =?utf-8?B?NUpqSURNTTFzY2N5dGRROFBFdEV4ZTltYWtnTnJNdVJTdmoyMDZGcXFzYUNS?=
 =?utf-8?B?Y2Q0d3dnRU1wOWNTLy9DUUtrRjR5NnlscVVMVDQ2UDNscEUzNWswL3lwcHVO?=
 =?utf-8?B?UE1VdzFuTVBKSmhXVXdyZTNObytteGp0NFZJUlFUWHczdmFkWHJjWTJSSDJW?=
 =?utf-8?B?VTdmWERxQjA4SjRoU21TSUhCQlQ0VmpjdXVGeG5FN0pQZ3ZsbGE0cEQ2c3ZT?=
 =?utf-8?B?cStNWWJ3azVwRDg1K0dXcEhYdHp3WXNDVy9HQnBzOVdFYndBeGpmY05PUGZS?=
 =?utf-8?B?OGo0SXRYODBNTFY1dERWTEVqL3QzRlNSVnJIdlVIbWFGUFYvU3phVnkzTmx4?=
 =?utf-8?B?NjBnTlgxdlpZVXJDeE8xMHVzaUd6UkVuV0tJekxWYndPZEljckpnY1oxTjlV?=
 =?utf-8?B?bjVnMFZaYzczV1hvNHY0TmRnc0dvT0JFWFhRWDNjbW9tK3lwd2Y1NXZCMlRl?=
 =?utf-8?B?Tjc2eEdjeG5BTFBhMUREZklaNWFGQU1tNFBSUmQxWXZJOUV2Um5XdS93ejYy?=
 =?utf-8?B?R2hTazlWNGtZTzRxMzFNRTJkNTA3bHVrZ08xVlk4bzBiT0gvd0wzUEo2VFBr?=
 =?utf-8?B?VEd5RFQzaWg4SVpKSjd1bmZ0QmFMd2JEYmlBR0NxZXJ1Nmk2bW93M0RmK0xk?=
 =?utf-8?B?TDl5QXlPWVY2NllaMU5pRWZGOFNpMlk2U2xjbERIZFk2TjU2OVBNTExKUXZ6?=
 =?utf-8?Q?4A1+Ee0bLMtZKJ55dWYIZPsmsSWGYJ91Rf?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR83MB0178.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a6baba-5efb-414a-f62c-08d89d363c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 18:05:54.1615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LC5ZeKq3RxJQti+/prqlDrWmJrxcO4ugh2b7sAKghl/gij9yFU8hSIbmw7pfoHN8WX/HE8iUyq7Xj5f44ywoFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR83MB0468
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6E97086D861694CA904D3F07F7B4C48@EURPRD83.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDA5OjA4IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gDQo+
IE9uIDEyLzEwLzIwIDQ6NTMgQU0sIEx1Y2EgQm9jYXNzaSB3cm90ZToNCj4gPiBGcm9tOiBMdWNh
IEJvY2Nhc3NpIDxsdWNhLmJvY2Nhc3NpQG1pY3Jvc29mdC5jb20+DQo+ID4gDQo+ID4gVXBkYXRl
IHN5c3RlbWQgdG8gdjI0Ny4xLg0KPiA+IEFkZCBydWxlIGZvciBuZXcgb29tZCBkYnVzIGNvbmYg
YW5kIGZvciBuZXcgcGFtLmQNCj4gPiBjb25mIGRpcmVjdG9yeSBpbiAvdXNyL2xpYi4NCj4gPiBE
cm9wIHNlbGludXgtaG9vay1oYW5kbGluZy10by1lbnVtZXJhdGUtbmV4dGhvcC5wYXRjaCwNCj4g
PiBtZXJnZWQgdXBzdHJlYW0uDQo+ID4gQmFja3BvcnQgMDAwMS1tZXNvbi1zZXQtY3h4LXZhcmlh
YmxlLWJlZm9yZS11c2luZy1pdC5wYXRjaA0KPiA+IGZyb20gdjI0Ny1zdGFibGUgdG8gZml4IGJ1
aWxkcyB3aXRob3V0IEMrKy4NCj4gPiBSZWZyZXNoIG11c2wgcGF0Y2hlcy4NCj4gPiANCj4gDQo+
IHBlcmhhcHMgd2UgbmVlZCB0byB1cGRhdGUgc3lzdGVtZC1jb25mIGFuZCBzeXN0ZW1kLWJvb3Qg
cmVjaXBlcyBhcyB3ZWxsIGhlcmUNCg0Kc3lzdGVtZC1ib290IGlzIHVwZGF0ZWQgdG8gdXNlIHRo
ZSBuZXcgbWVzb24gcGF0Y2guIHN5c3RlbWQtY29uZiBkaWRuJ3QNCm5lZWQgaXQsIGF0IGxlYXN0
IGZvciBtZT8gRG9lcyBpdCBmYWlsIHRvIGJ1aWxkIGZvciB5b3U/DQoNCi0tIA0KS2luZCByZWdh
cmRzLA0KTHVjYSBCb2NjYXNzaQ0K
