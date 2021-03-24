Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.136])
 by mx.groups.io with SMTP id smtpd.web12.181.1616605412943857338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=dsHn3z8B;
 spf=pass (domain: microsoft.com, ip: 40.107.5.136, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7LdOgFX4KRo30zxz09KQKnyVp78LIo8PTr7td+P+5BDqRc6N5KIHxeLAhCqZXCL8GXNd5umXZc73zySSMNDYFtq5rZ/UonmvxQTsjiLUKZVUmBhks6GdxgsbXrMNQvlN+VnMIHLWVX1yB5ijoXvs8KZqUeIqjquGPjpLcXKnk/7utPrSHEKk3IbOPj8tJm9WYjNcZPh8gIJxwwIj6tDpzrMgUY2gp+LQzCWVSwA0w06hz8H30yEvn8SRH1BaCvHeMBhyrWeSnrxaFO4YdVWMHRzcnGvh/ucGHoWz1BF4t8dAjEIDMWr7R6q362IohtdhpGmYh8eYUiVwvsp6WxRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCEST2kzSyM+EARfOPPev9AyqWrorx/YXKEFmz4Pua8=;
 b=O6PdfggOdBtS7Tz9GPUILlh6HVLRxH9/ZhEQ90Sbg18IF0gSTv4vn5aXplvhinhChci8KUbbOly8TGdQfiJ+XyTA4NZKUvoScAYPWk2QvO6UuRmuqL5RUfeGm8KSlxhK/xbpV+1ZXZsu80XiLkNVKYwS6rolTJPl9A9M02RGcuR58LVEbt4JJPj+3XP3AQhNg3BAQ2fYGC0yznZCMcaZZoWU/8T01saqueL/u/wnGTvTTc2Nwlqwnk5NbwJJiD+2dhOXPKJMho8RnXaE9Ht+5jHKbSMD7ulJJkdeT9Dx20ucWD+G3CDqeiU1mZqU1FrqAQL+TGsnMk0fDu2UAoyCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCEST2kzSyM+EARfOPPev9AyqWrorx/YXKEFmz4Pua8=;
 b=dsHn3z8B8Pqx3adt9Nnk+/p2EUadZzEYguWJEUUn8Af9kEAt1uNkwCMlMxefdeEKrrvqSgT36t2CXkbR9bxZvHH2t7H3HWag6u/SOYDSRPDSxcOFmLptrpklV6Lme3M4zZQIw1ib97Ib0cj/wkxRc2UOgTKWl+DYfvjtlsXKGkg=
Received: from AM7PR83MB0436.EURPRD83.prod.outlook.com (2603:10a6:20b:1bf::20)
 by AM7PR83MB0452.EURPRD83.prod.outlook.com (2603:10a6:20b:1b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.1; Wed, 24 Mar
 2021 17:03:29 +0000
Received: from AM7PR83MB0436.EURPRD83.prod.outlook.com
 ([fe80::80f1:c543:e12:19f]) by AM7PR83MB0436.EURPRD83.prod.outlook.com
 ([fe80::80f1:c543:e12:19f%4]) with mapi id 15.20.3999.013; Wed, 24 Mar 2021
 17:03:29 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"scott.branden@broadcom.com" <scott.branden@broadcom.com>,
	"martin.jansa@gmail.com" <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "bluelightning@bluelightning.org"
	<bluelightning@bluelightning.org>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
Thread-Topic: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe
 to allow bootstrapping
Thread-Index: AQHXIM+cNIrwxBOSpEyiDZSzXc28JA==
Date: Wed, 24 Mar 2021 17:03:29 +0000
Message-ID: <999621be325d671cabd9a7b9ef270176a87889b8.camel@microsoft.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
	 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
	 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
	 <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
	 <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
	 <20210315135555.hlkwmj4yj5ugw2he@jama>
	 <166C88B2CBAB1BAF.20509@lists.openembedded.org>
	 <eb829949abe227556ae2d4ef8c0e11f6141508d9.camel@linuxfoundation.org>
	 <c9335d1e-e133-1c1c-65f1-13fac6b6b43d@broadcom.com>
In-Reply-To: <c9335d1e-e133-1c1c-65f1-13fac6b6b43d@broadcom.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d290ef0e-4c89-41e1-4c54-08d8eee6bf92
x-ms-traffictypediagnostic: AM7PR83MB0452:
x-microsoft-antispam-prvs: 
 <AM7PR83MB0452284A87A8C06CDBA5ABCFF1639@AM7PR83MB0452.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 arFwxfbIyPG10pTDEgPr+Vvo3M3U90DFsafyE0cKTxIr6N6ZkDmn9oiijawFzQ9shjh2A2ctv4FbOXPeUGeJ442Bhe7AqzEhXtsmZ83c0pbRs/bgkpbmd6C/gDvBm3raSjk/gxz302VR4xfd66EjwanGpVYUhOPP8SmoSTazByA4OBJTRk8MkxLQ285sINXrdLuHf1l0YhHHGDRnlmXRzssTfHuQH6DHOmxVUXpcKzNufJg9uN/qFU+Y9ayFin42pM2sVCZ+M99T76ymFqiH25yQxBuLKKT+VCxMKXOD8EqOQHMr+HNahhvM+rOcmfhTXqpje6syv1UvqV/Tfce2IkPIyfa2Z/cpuOfvQkkJxgp/NE5eIkJxHH3P0WUTq/Hu7LugnpcFVMKv3//hvFrDtWcuOz+Q9TjsJbOl2IR2U5Ww7jy2BfC3XA41gfpkJ/BbHuiQmxzh3MoYgLcM0uWNnPDpOJ9e2LooKR12z33ZQg8KR4YXgrF7fxO6nV1NzbXIS1Mc5vrGDFEzjM1fEEdE/3UgCKhC5cSg/BfeudcIp8i6iHgrTNxfoUxyCDBD6NMKpgYaMqBKf3w/MPApBm/oH+sHRrlfuVXIGnMGodbhg1tb7ARaR4uA1YXROrztI06jqDvTQVXUh4tpG5svku9gdKb1nDLAFCn6uRKuoc4xLQpOcaV3AGUQ65Otx061pgh4axzAcJGrg6GVAaEG9STpIqcNd/1ra1+kTr8L7LDnSPured9nqKtcbFAJJwUJ/dwHO4VihayS1h8FSpJ9zW0WXA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR83MB0436.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(76116006)(5660300002)(66446008)(66946007)(26005)(66556008)(186003)(6512007)(8676002)(8936002)(38100700001)(64756008)(66476007)(4326008)(2616005)(53546011)(6506007)(6486002)(86362001)(316002)(110136005)(71200400001)(2906002)(82950400001)(478600001)(82960400001)(54906003)(966005)(10290500003)(36756003)(83380400001)(20673002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?eFRFMGJUZWhmdDgrQXhXVFpOOWRFNDErekhJQUFuOUNxVENRcndsYmpQcEpY?=
 =?utf-8?B?TDJuYUlpT2sxL3kyRWZDVWc3SGF4dEZ3REthNDMwTllsVXZHb3Y0N2dKVzlR?=
 =?utf-8?B?N0hlcGZFbUN2azRDZVRnNlZTVGRFQmN1eG5namZzaFAwbFVYYi9pVUxCWHFG?=
 =?utf-8?B?cmdqbE1tUVRGNy9WWEMybFpwR2N5TEV6TFhBMUowMmpMTkkvWGVpWkJ5OXRZ?=
 =?utf-8?B?NU1ZWno0ZmczTWlpSXloWW9mSDNlcnZ2RFA0SExqSVRHVzhNdjZKM1pzVjdN?=
 =?utf-8?B?RkZ6SytZdVN2WS9JbUpaZEQ5cVVRdHk0NFc4WkM1QVdCQ1BUVFNUL2xhSXk0?=
 =?utf-8?B?QkpXd1hPWkM0NHUxUzhHcEQ5N1lDdXZIY2FSdFBzSnJYSWl5UVduUWtDUXZo?=
 =?utf-8?B?VDVUeVl5Z1gwUnRyV1Ewam1hcVlUOHgvVDJRUHJLaVNDUklBWmlhUGlGVEMx?=
 =?utf-8?B?aTQrWi8rM0lrZEZ3QVJ6bGxtc2FmaEo4cGQ2QzZTUGtkcE14RWdZRGhFTml4?=
 =?utf-8?B?SEMrQ0VnYjBBeW5sMEdRaDA2VzZiamhKWHpTTW8wcXg2WlBqbmp4L2xSamZV?=
 =?utf-8?B?ZFMyUGFyVVlickUyS2lkOGhFZ0NVUFY4ZG9xQ2Nzd1huVGQ4WkFLVlMycFpC?=
 =?utf-8?B?ME1BUE9CYk54eXY5ek1vVmxHVU5XVVJwQzlkMTFraFpPNjVOMTlSVGlzOHBM?=
 =?utf-8?B?WDI2QnRZaHBOQzZDSU5VZmNQTG52R3FVeUJ2aXBNOGdCT09ZeTloSTRXWHFO?=
 =?utf-8?B?eFB2Y2lIaEI3T3V4Z2pBTzFHa0JITHJ4MEJuU1dmc3JlZStDaFZ6ZjFTNVNy?=
 =?utf-8?B?aUFobFZBUkxmNEJodzMxc1BNSDVYV3VkQUdQVFpQeHdHaVZtQ2JUL1lkS2JB?=
 =?utf-8?B?ZEZvOGQyMjVSZy85WUNWMTlCejJLaUtYZjRwOUxicHg0SmZDT2gvZG1vcWc0?=
 =?utf-8?B?WlcybE9jcGFpUVp4L0NESHdiWXd3ekZyOWkxVjVCWDUrWXBWQm5RampMeXk4?=
 =?utf-8?B?S0RKMzVyOUo0NG04WlJhYUxoRlY3M24wSkQ4cU1BMTRzSVEwWFZGdlZ1QWlm?=
 =?utf-8?B?N2ZmdFQ2NDVmUHlGKzZjRzNTZzE2NjRiUHYwVmx0dEFTbXBSRG5OQUFFWUpl?=
 =?utf-8?B?NDdGQWd1UkFDYzR0QzM0YjdxUTBBcjFKZlR0aC90YmpMcmVDa1BXVktaYTZj?=
 =?utf-8?B?ZGZGcmhKZVZHOGR2ZVl3T3d3ZW1IK2prRENXbzFFdXpiV2JHRzFqNU0raG5i?=
 =?utf-8?B?Nk0xQ2RTaFpwUjZjcVM0bmhULzE2bkN1aFo0L0RnZndXVEY3WklIQ3psWWx4?=
 =?utf-8?B?UE9XV3F4alc4bVpTYVJWTmtqZDBhYzgzamRNM2JkSjlrbHI3S21TcWk3eXJT?=
 =?utf-8?B?eCswak9zSWhlZ1ExZGZRY1RHbXVuR2JRa0phRFhlbGtXYVMwUFRtdnd4cCtt?=
 =?utf-8?B?bXNKWVdIU3VEeEdxWkQ3R3p1Q0ZCQUZaNExGWTRHVTcvSW1XMExXcWZxZVhO?=
 =?utf-8?B?WE5WVktxbEVQaHR0UjhadEFxU2w5RHpuakpZc29SQUo0RUhYKzdBcWk4Tzhs?=
 =?utf-8?B?YURpc0dPMmo1R2VhaGh4dU0rRHdJSUk5dk9kcElrd0VoV1U0TzdpMUVwQkZ5?=
 =?utf-8?B?SlVoMjEzRXpOQUhLaHNHaVp6VjVzVEllTzM1WVgycmVBczRCNVdoaVV5RnE2?=
 =?utf-8?B?c2lEa3Fvc29oYllwNlFkaXplZzVkWnZhSFNnc0diUE1DRGFPTnM1Y2ZTZlVI?=
 =?utf-8?Q?XRVvunMADfHE44dm9mA5YZhyITwUnDZjViULDGN?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR83MB0436.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d290ef0e-4c89-41e1-4c54-08d8eee6bf92
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 17:03:29.5515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cD5u5MHYC7Kw4Y0JvvIsBKD+evXgmM+/4eGaDTA+NngyiGetUWW0r/zBKRStYBH4dF5Qp9XFwqWndawWiOfsgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR83MB0452
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <160F4416FE7BD24AB0268D9EE1823302@EURPRD83.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIxLTAzLTI0IGF0IDA5OjUyIC0wNzAwLCBTY290dCBCcmFuZGVuIHdyb3RlOg0K
PiBJIGhhdmUgbm90IGRlYnVnZ2VkIHlldCwgYnV0IEkgc3VzcGVjdCB0aGlzIGNoYW5nZSBpcyBj
YXVzaW5nIHRoZSBmb2xsb3dpbmcgZmFpbHVyZSBpZiBJIG1lcmdlIHRoZSBsYXRlc3QgcG9reSBp
bnRvIG91ciBidWlsZHM6DQo+IA0KPiBFUlJPUjogbWM6aG9zdDp1dGlsLWxpbnV4LXV1aWQtMi4z
Ni4yLXIwIGRvX3BhY2thZ2U6IFFBIElzc3VlOiB1dGlsLWxpbnV4LXV1aWQ6IEZpbGVzL2RpcmVj
dG9yaWVzIHdlcmUgaW5zdGFsbGVkIGJ1dCBub3Qgc2hpcHBlZCBpbiBhbnkgcGFja2FnZToNCj4g
ICAvdXNyL2xpYi9kZWJ1Zw0KPiAgIC91c3IvbGliL2RlYnVnL3Vzcg0KPiAgIC91c3IvbGliL2Rl
YnVnL3Vzci9saWINCj4gICAvdXNyL2xpYi9kZWJ1Zy91c3IvbGliL2xpYnV1aWQuc28uMS4zLjAu
ZGVidWcNCj4gUGxlYXNlIHNldCBGSUxFUyBzdWNoIHRoYXQgdGhlc2UgaXRlbXMgYXJlIHBhY2th
Z2VkLiBBbHRlcm5hdGl2ZWx5IGlmIHRoZXkgYXJlIHVubmVlZGVkLCBhdm9pZCBpbnN0YWxsaW5n
IHRoZW0gb3IgZGVsZXRlIHRoZW0gd2l0aGluIGRvX2luc3RhbGwuDQo+IHV0aWwtbGludXgtdXVp
ZDogNCBpbnN0YWxsZWQgYW5kIG5vdCBzaGlwcGVkIGZpbGVzLiBbaW5zdGFsbGVkLXZzLXNoaXBw
ZWRdDQo+IEVSUk9SOiBtYzpob3N0OnV0aWwtbGludXgtdXVpZC0yLjM2LjItcjAgZG9fcGFja2Fn
ZTogRmF0YWwgUUEgZXJyb3JzIGZvdW5kLCBmYWlsaW5nIHRhc2suDQo+IEVSUk9SOiBMb2dmaWxl
IG9mIGZhaWx1cmUgc3RvcmVkIGluOiAvaGRkL3lvY3RvL2dlbngvcG9reS9idWlsZC90bXAvd29y
ay9jb3JlMi02NC1wb2t5LWxpbnV4L3V0aWwtbGludXgtdXVpZC8yLjM2LjItcjAvdGVtcC9sb2cu
ZG9fcGFja2FnZS4zMTc1Mw0KPiBFUlJPUjogVGFzayAobWM6aG9zdDovaGRkL3lvY3RvL2dlbngv
cG9reS9idWlsZC8uLi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtdXVp
ZF8yLjM2LjIuYmI6ZG9fcGFja2FnZSkgZmFpbGVkIHdpdGggZXhpdCBjb2RlICcxJw0KDQpJdCBt
b3N0IGNlcnRhaW5seSBpcyAtIGlzIC91c3IvbGliL2RlYnVnIGNvbmZpZ3VyYWJsZSBvciBzdXBw
b3J0ZWQ/DQpDdXJyZW50bHkgd2UgaGF2ZToNCg0KRklMRVNfdXRpbC1saW51eC1saWJ1dWlkLWRi
ZyA9ICIvdXNyL3NyYyAke2xpYmRpcn0vLmRlYnVnIg0KDQpJJ2xsIHNlbmQgYSBwYXRjaCB0byBl
eHRlbmQgaXQgYW5kIGluY2x1ZGUgL3Vzci9saWIvZGVidWcgdG9vDQoNCj4gT24gMjAyMS0wMy0x
NSAyOjUxIHAubS4sIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAyMS0wMy0x
NSBhdCAxMzo1NyArMDAwMCwgUmljaGFyZCBQdXJkaWUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgd3JvdGU6DQo+ID4gPiBPbiBNb24sIDIwMjEtMDMtMTUgYXQgMTQ6NTUgKzAxMDAsIE1hcnRp
biBKYW5zYSB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCBNYXIgMTUsIDIwMjEgYXQgMTI6MjE6MzdQ
TSArMDAwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4gPiA+ID4gT24gTW9uLCAyMDIxLTAz
LTE1IGF0IDExOjUwICswMDAwLCBMdWNhIEJvY2Nhc3NpIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24g
TW9uLCAyMDIxLTAzLTE1IGF0IDEwOjQ5ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4g
PiA+ID4gPiA+ID4gT24gTW9uLCAyMDIxLTAzLTE1IGF0IDEwOjQ0ICswMDAwLCBMdWNhIEJvY2Nh
c3NpIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IE9uIFN1biwgMjAyMS0wMy0xNCBhdCAyMjoxMCAr
MDAwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiBUaHUsIDIw
MjEtMDMtMTEgYXQgMTU6MDkgKzAwMDAsIGx1Y2EuYm9jY2Fzc2lAZ21haWwuY29tIHdyb3RlOg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiBGcm9tOiBMdWNhIEJvY2Nhc3NpIDxsdWNhLmJvY2Nhc3NpQG1p
Y3Jvc29mdC5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBS
ZWNlbnRseSB1dGlsLWxpbnV4IGdhaW5lZCBhbiAob3B0aW9uYWwpIGJ1aWxkIGRlcGVuZGVuY3kg
b24gbGliY3J5cHRzZXR1cC4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gQnV0IGxpYmNyeXB0c2V0dXAg
YnVpbGQtZGVwZW5kcyBvbiB1dGlsLWxpbnV4IGZvciBibGtpZCAob3B0aW9uYWwsIGNhbiBiZSBk
aXNhYmxlZCkNCj4gPiA+ID4gPiA+ID4gPiA+ID4gYW5kIHV1aWQgKG1hbmRhdG9yeSkuDQo+ID4g
PiA+ID4gPiA+ID4gPiA+IFNwbGl0IG91dCB1dGlsLWxpbnV4LXV1aWQgaW4gYSBkaWZmZXJlbnQg
cmVjaXBlIHRvIGJyZWFrIHRoZSBjeWNsZS4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiA+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9rYXJlbHphay91dGlsLWxpbnV4L3B1bGwv
ODk4DQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhIEJvY2Nhc3NpIDxsdWNhLmJvY2Nhc3NpQG1pY3Jvc29mdC5jb20+DQo+ID4gPiA+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IFVuZm9ydHVuYXRlbHkgSSBub3RpY2VkIHdl
IGhhZCBhIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gaW4gYnVpbGR0aW1lcyBpbiANCj4gPiA+ID4g
PiA+ID4gPiA+IHJlY2VudCBjaGFuZ2VzLiBUaGUgY2xvc2VzdCBJIGhhdmUgdGhpcyBuYXJyb3dl
ZCBkb3duIHRvIHNvIGZhcjoNCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4g
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0by5pby9wdWIvbm9uLXJlbGVhc2UvMjAyMTAzMTQtMTQv
dGVzdHJlc3VsdHMvYnVpbGRwZXJmLXVidW50dTE2MDQvcGVyZi11YnVudHUxNjA0X21hc3Rlcl8y
MDIxMDMxNDE4MTgzMV9kNDI0ODdiZjUyLmh0bWwNCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiA+ID4gc3VnZ2VzdHMgaXQgbWF5IGJlIHRoaXMgY2hhbmdlLiBJIGhhdmUgbW9yZSB0
ZXN0cyBxdWV1ZWQgdG8gY29uZmlybQ0KPiA+ID4gPiA+ID4gPiA+ID4gdGhhdCBkZWZpbml0aXZl
bHksIGlmIHNvIHdlJ2xsIGhhdmUgdG8gZmlndXJlIG91dCB3aHkgYXMgdGhpcyBzaG91bGRuJ3QN
Cj4gPiA+ID4gPiA+ID4gPiA+IHJlYWxseSBoYXBwZW4sIGl0cyBhbiA4JSByZWdyZXNzaW9uIDoo
Lg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFZlcnkgc3RyYW5nZSB0aGF0IGEg
c2luZ2xlIHJlY2lwZSBjb3VsZCBkbyB0aGF0IC0gaXMgdGhlcmUgc29tZXRoaW5nDQo+ID4gPiA+
ID4gPiA+ID4gd3JvbmcgaW4gdGhlIG5ldyAuYmIgdGhhdCBJIG1pc3NlZCBhbmQgY291bGQgY2F1
c2UgdGhpcz8NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IEknbSB3b25kZXJpbmcgaWYg
aXQgaXMgYmVjYXVzZSB3ZSdyZSBidWlsZGluZyB1dGlsLWxpbnV4IHR3aWNlIG5vdyBhbmQNCj4g
PiA+ID4gPiA+ID4gdGhlcmUgaXMgc29tZSBrZXkgY2hva2UgcG9pbnQgaW4gdGhlIGRlcGVuZGVu
Y3kgY2hhaW4uIEkgaGF2ZSBubyBldmlkZW5jZQ0KPiA+ID4gPiA+ID4gPiBmb3IgdGhhdCB5ZXQs
IGl0IGlzIGp1c3Qgc3BlY3VsYXRpb24gdGhvdWdoLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiBXaXRoIHRoZSBhdXRvY29uZiBvcHRpb25zIEkndmUgc2V0LCBvbiBteSBsYXB0b3AgaXQgdGFr
ZXMgMzJzIHRvIGRvDQo+ID4gPiA+ID4gPiBjb25maWd1cmUgKyBtYWtlIC1qMi4gTW9zdCBvZiB0
aGF0IGlzIGF1dG9jb25mIC0gbWFrZSAtajIgdGFrZXMgOHMuDQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IE9ubHkgMyBsaWJyYXJpZXMgYXJlIGJ1aWx0IHdpdGggdGhpcyBjb21iaW5hdGlvbjog
bGliY29tbW9uLmEsDQo+ID4gPiA+ID4gPiBsaWJ0Y29sb3JzLmEsIGFuZCBsaWJ1dWlkLmEvc28u
IE5vIGV4ZWN1dGFibGVzIG9yIGFueXRoaW5nIGVsc2UgaXMNCj4gPiA+ID4gPiA+IGJ1aWx0LiBJ
dCBkb2Vzbid0IGxvb2sgbGlrZSBsaWJ0Y29sb3JzIGlzIGFjdHVhbGx5IG5lZWRlZCwgSSdsbCBz
ZWUgaWYNCj4gPiA+ID4gPiA+IEkgY2FuIHByZXBhcmUgYSBwYXRjaCB0byBza2lwIGl0LCBidXQg
SSBkb24ndCB0aGluayBpdCB3aWxsIGJ1eSBtb3JlDQo+ID4gPiA+ID4gPiB0aGFuIDFzLCBpdCdz
IGp1c3QgdHdvIG9iamVjdCBmaWxlcy4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhlIGdv
b2QgbmV3cyBpcyB0aGF0IG1lc29uIHN1cHBvcnQgaXMgYWJvdXQgdG8gbGFuZCB1cHN0cmVhbSwg
d2hpY2gNCj4gPiA+ID4gPiA+IHNob3VsZCBiZSBzaWduaWZpY2FudGx5IGZhc3RlciB0aGFuIGF1
dG9jb25mICsgbWFrZToNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL2thcmVsemFrL3V0aWwtbGludXgvY29tbWl0cy90b3BpYy9tZXNvbg0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IE1lc29uIGRlZmluaXRlbHkgaW1wcm92ZXMgdGhlIHNwZWVkISBJIHdhcyB3b25k
ZXJpbmcgaWYgaXQgd2FzIGZyb20NCj4gPiA+ID4gPiBjb25maWd1cmUgZm9yIGV4YW1wbGUuDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gSSBub3cgaGF2ZSBtb3JlIHBlcmZvcm1hbmNlIHRlc3QgcmVz
dWx0cyBpbiAodGFrZXMgdGltZSB0byBpbnRlcmxlYXZlIA0KPiA+ID4gPiA+IHRoZW0gd2l0aCB0
ZXN0aW5nIG9mIG1hc3Rlcik6DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gaHR0cHM6Ly9hdXRvYnVp
bGRlci55b2N0by5pby9wdWIvbm9uLXJlbGVhc2UvMjAyMTAzMTUtMS90ZXN0cmVzdWx0cy9idWls
ZHBlcmYtdWJ1bnR1MTYwNC9wZXJmLXVidW50dTE2MDRfbWFzdGVyXzIwMjEwMzE1MDA1MDQ4XzZi
YjE2MjE4MTUuaHRtbA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGFuZCBJIHRoaW5rIHRoaXMgbWVh
bnMgaXQgaXNuJ3QgZnJvbSB0aGUgdXRpbC1saW51eCBjaGFuZ2UgYnV0IG9uZSBvZiANCj4gPiA+
ID4gPiBhbm90aGVyIHRocmVlLiBJJ20gbm90IGVudGlyZWx5IGNvbnZpbmNlZCB0aG9zZSBjaGFu
Z2VzIGNvdWxkIGRvIHRoaXMNCj4gPiA+ID4gPiBidXQgaXQgaXMgd2hhdCB0aGUgZGF0YSBzYXlz
LiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJJ3ZlIHF1ZXVlZCBtb3JlIGJpc2VjdGlvbiB0byBu
YXJyb3cgaXQgZG93biBmcm9tIHRoZXJlLi4uDQo+ID4gPiA+IA0KPiA+ID4gPiBCVFc6IHRoaXMg
c3BsaXQgYWxzbyBuZWVkcyBtYW51YWwgY2xlYW51cCBpbiB0aGUgVE1QRElSLCByaWdodD8NCj4g
PiA+IA0KPiA+ID4gSXQgc2hvdWxkbid0LiBUaGUgc3lzdGVtIHNob3VsZCBzcG90IHRoYXQgdXRp
bC1saW51eCBoYXMgY2hhbmdlZCBhbmQgdW5pbnN0YWxsDQo+ID4gPiBpdCBmcm9tIHRoZSBzeXNy
b290cyBhcyBpdCBnb2VzLiBUaGVyZSBpcyBzb21ldGhpbmcgbm90IHdvcmtpbmcgcmlnaHQgdGhl
cmUgOigNCj4gPiANCj4gPiBJIHdhcyB3cm9uZyBhYm91dCB0aGF0LCB0aGUgc3lzdGVtIGRvZXNu
J3QgaGF2ZSBjb2RlIGZvciB0aGlzLCBpdCBoYXMgY29kZSBmb3INCj4gPiB0aGUgc3lzcm9vdHMg
YnV0IG5vdCBmb3Igb3RoZXIgc3N0YXRlIHRhc2tzLg0KPiA+IA0KPiA+IEkgdGhpbmsgdGhpcyBp
cyBhbiBvdmVyc2lnaHQgYW5kIHdlIG5lZWQgdG8gc2ltcGxpZnkgdGhpbmdzIGFuZCBtYWtlIHRo
aXMgY2xlYW51cA0KPiA+IGhhcHBlbiBwcmUtYnVpbGQsIG11Y2ggbGlrZSB0aGUgInVucmVhY2hh
YmxlIiB0YXNrcyBjbGVhbnVwIGhhcHBlbnMgdG9kYXkuIElmIHdlDQo+ID4gZG8gbWFrZSB0aGlz
IGhhcHBlbiwgd2UgcHJvYmFibHkgbmVlZCB0byBhZGQgcGFyYWxsZWxpc20gYXMgdGhlIG51bWJl
ciBvZiBzdGFsZQ0KPiA+IHNzdGF0ZSB0YXNrcyBiZWluZyBjbGVhbmVkIGNvdWxkIGJlIHN1YnN0
YW50aWFsLg0KPiA+IA0KPiA+IENoZWVycywNCj4gPiANCj4gPiBSaWNoYXJkDQo+ID4gDQo+ID4g
DQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQo+ID4gDQoN
Cg==
