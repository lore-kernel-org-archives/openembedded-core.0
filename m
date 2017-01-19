Return-Path: <saul.wold@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E416471B86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 15:32:30 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2017 07:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,254,1477983600"; d="scan'208";a="55193879"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2017 07:32:30 -0800
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 19 Jan 2017 07:32:29 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.27]) by
	ORSMSX163.amr.corp.intel.com ([169.254.9.132]) with mapi id
	14.03.0248.002; Thu, 19 Jan 2017 07:32:29 -0800
From: "Wold, Saul" <saul.wold@intel.com>
To: "kergoth@gmail.com" <kergoth@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 05/16] gnu-efi: build 64-bit for x32
Thread-Index: AQHScmk+S38G/2xCUEa4O0K0o68Nmg==
Date: Thu, 19 Jan 2017 15:32:28 +0000
Message-ID: <1484839946.5377.209.camel@intel.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
	<f776bb458e8570ec6f6c9fff1dada3ecd7a36090.1483645446.git.chris_larson@mentor.com>
In-Reply-To: <f776bb458e8570ec6f6c9fff1dada3ecd7a36090.1483645446.git.chris_larson@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.102.206]
MIME-Version: 1.0
Cc: "chris_larson@mentor.com" <chris_larson@mentor.com>
Subject: Re: [PATCH 05/16] gnu-efi: build 64-bit for x32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2017 15:32:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <91B5862A2F5F6B47A8CBE83392F1D3C0@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE3LTAxLTA1IGF0IDEyOjQ2IC0wNzAwLCBDaHJpc3RvcGhlciBMYXJzb24gd3Jv
dGU6DQo+IEZyb206IENocmlzdG9waGVyIExhcnNvbiA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+
DQo+IA0KPiBXZSdyZSB0YXJnZXRpbmcgdGhlIHg4Nl82NCBFRkkgQUJJLg0KPiANCkNocmlzLMKg
DQoNCkZpcnN0bHksIHRoYW5rcyBmb3IgYWxsIHRoZSB4MzIgcGF0Y2hlcyENCg0KSSB0cmllZCB0
byBidWlsZCBnbnUtZWZpIGZvciB4MzIgdmlhIGdlbmVyaWN4ODYtNjQgYW5kIHN0aWxsIGdvdCBh
DQpmYWlsdXJlIGFib3V0IG1pc3NpbmcgdGhlIGdudS9zdHVicy02NC5oLiBJIGFtIGJ1aWxkaW5n
IHB1cmUgeDMyLCBpcyBpdA0KcG9zc2libHkgeW91IGJ1aWxkIHgzMiBpbiBhIFRNUERJUiB0aGF0
IGFscmVhZHkgaGFkIGEgNjRiaXQgYnVpbGQ/DQoNClRoZXJlIGlzIGEgZ2VuZXJhdGVkIHN0dWJz
LXgzMi5oLCBidXQgbm90IHRoZSByZXF1aXJlZCAtNjQgdmFyaWFudC4NCg0KQ2FuIHlvdSBjb25m
aXJtIHRoaXMgYnVpbGRzIGNvcnJlY3RseT8NCg0KVGhhbmtzDQoNClNhdSENCg0KPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlciBMYXJzb24gPGNocmlzX2xhcnNvbkBtZW50b3IuY29tPg0KPiAt
LS0NCj4gwqBtZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkvZ251LWVmaV8zLjAuNC5iYiB8IDkgKysr
KysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXzMuMC40LmJiDQo+IGIvbWV0
YS9yZWNpcGVzLWJzcC9nbnUtZWZpL2dudS1lZmlfMy4wLjQuYmINCj4gaW5kZXggOWRkYzRiYS4u
ZTU1YWI3ZiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC9nbnUtZWZpL2dudS1lZmlf
My4wLjQuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWJzcC9nbnUtZWZpL2dudS1lZmlfMy4wLjQu
YmINCj4gQEAgLTUyLDMgKzUyLDEyIEBAIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIg0KPiDCoCMg
Q0ZMQUdTICs9IC1tbm8tbW14IC1tbm8tc3NlDQo+IMKgIyBTbyBhbHNvIHJlbW92ZSAtbWZwbWF0
aD1zc2UgZnJvbSBUVU5FX0NDQVJHUw0KPiDCoFRVTkVfQ0NBUkdTX3JlbW92ZSA9ICItbWZwbWF0
aD1zc2UiDQo+ICsNCj4gK3B5dGhvbiAoKSB7DQo+ICvCoMKgwqDCoGNjYXJncyA9IGQuZ2V0VmFy
KCdUVU5FX0NDQVJHUycsIFRydWUpLnNwbGl0KCkNCj4gK8KgwqDCoMKgaWYgJy1teDMyJyBpbiBj
Y2FyZ3M6DQo+ICvCoMKgwqDCoMKgwqDCoMKgIyB1c2UgeDg2XzY0IEVGSSBBQkkNCj4gK8KgwqDC
oMKgwqDCoMKgwqBjY2FyZ3MucmVtb3ZlKCctbXgzMicpDQo+ICvCoMKgwqDCoMKgwqDCoMKgY2Nh
cmdzLmFwcGVuZCgnLW02NCcpDQo+ICvCoMKgwqDCoMKgwqDCoMKgZC5zZXRWYXIoJ1RVTkVfQ0NB
UkdTJywgJyAnLmpvaW4oY2NhcmdzKSkNCj4gK30NCj4gLS3CoA0KPiAyLjguMA0KPiA=

