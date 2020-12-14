Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.30170.1607919310587456963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 20:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MhNdEg2jwaQqD3fPEySFvCW1bxwRSTQv98ZHGfGCdK3ZvRvJTkF08YygulpG9OdYfe3rLml7ZP
 moc9JXCW/71A==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="174765054"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="174765054"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 20:15:07 -0800
IronPort-SDR: bWmVpwjBN33e5Qgtq2RwCBUTa/w2BYtchCJ4pwUQBpmjltkUfNRNwpQvoQRPlY1e+r2WrFoNQb
 +ERUdvvlTAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="377836554"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga007.jf.intel.com with ESMTP; 13 Dec 2020 20:15:06 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 12:15:05 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Mon, 14 Dec 2020 12:15:05 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Jamaluddin, Khairul Rohaizzat"
	<khairul.rohaizzat.jamaluddin@intel.com>
Subject: Re: [OE-core] [PATCH][gatesgarth] go: 1.15.2 -> 1.15.6
Thread-Topic: [OE-core] [PATCH][gatesgarth] go: 1.15.2 -> 1.15.6
Thread-Index: AQHW0bvfr36q5UO76EejEsOGUS0rxan1ddKA
Date: Mon, 14 Dec 2020 04:15:05 +0000
Message-ID: <057b4601a8f05a8360624234529920945584ea93.camel@intel.com>
References: <1607910781-88071-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <1607910781-88071-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1A4879E5979D14BA303E76B37DE037A@intel.com>
Content-Transfer-Encoding: base64

SGkgS2hhaXJ1bA0KDQpPbiBNb24sIDIwMjAtMTItMTQgYXQgMDk6NTMgKzA4MDAsIEphbWFsdWRk
aW4sIEtoYWlydWwgUm9oYWl6emF0IHdyb3RlOg0KPiBGcm9tOiBLaGFpcnVsIFJvaGFpenphdCBK
YW1hbHVkZGluIDwNCj4ga2hhaXJ1bC5yb2hhaXp6YXQuamFtYWx1ZGRpbkBpbnRlbC5jb20+DQo+
IA0KPiB1cGRhdGUgbWlub3IgdmVyc2lvbiB0byAxLjE1LjYNCj4gDQo+IGdvLTEuMTUuMyBpbmNs
dWRlcyBmaXhlcyB0byBjZ28sIHRoZSBjb21waWxlciwgcnVudGltZSwgdGhlIGdvDQo+IGNvbW1h
bmQsIGFuZCB0aGUgYnl0ZXMsIHBsdWdpbiwgYW5kIHRlc3RpbmcgcGFja2FnZXMuDQo+IGdvLTEu
MTUuNCBpbmNsdWRlcyBmaXhlcyB0byBjZ28sIHRoZSBjb21waWxlciwgbGlua2VyLCBydW50aW1l
LCBhbmQNCj4gdGhlIGNvbXByZXNzL2ZsYXRlLCBuZXQvaHR0cCwgcmVmbGVjdCwgYW5kIHRpbWUg
cGFja2FnZXMuDQo+IGdvLTEuMTUuNSBpbmNsdWRlcyBzZWN1cml0eSBmaXhlcyB0byB0aGUgZ28g
Y29tbWFuZCBhbmQgdGhlIG1hdGgvYmlnDQo+IHBhY2thZ2UuDQoNCm1hc3RlciBoYXMgMS4xNS41
IHNvIEkgd291bGQgbGlrZSB0byBjaGVycnktcGljayB0aG9zZSB1cGRhdGVzIGZyb20NCm1hc3Rl
ciBpbnN0ZWFkLg0KDQo+IGdvLTEuMTUuNiBpbmNsdWRlcyBmaXhlcyB0byB0aGUgY29tcGlsZXIs
IGxpbmtlciwgcnVudGltZSwgdGhlIGdvDQo+IGNvbW1hbmQsIGFuZCB0aGUgaW8gcGFja2FnZS4N
Cg0KSSB3aWxsIGNoZXJyeS1waWNrIDEuMTUuNiB1cGRhdGUgdGhhdCB5b3UndmUgc2VudCBmb3Ig
bWFzdGVyIG9uY2UgdGhhdA0KaXMgbWVyZ2VkIHRoZXJlLg0KDQpUaGFua3MsDQoNCkFudWoNCg0K
PiANCj4gUmVmZXJlbmNlczoNCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZF
LTIwMjAtMjgzNjINCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjAt
MjgzNjYNCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjAtMjgzNjcN
Cj4gaHR0cHM6Ly9nb2xhbmcub3JnL2RvYy9kZXZlbC9yZWxlYXNlLmh0bWwjZ28xLjE1Lm1pbm9y
DQo+IA0KPiBVcGRhdGVzIGluY2x1ZGVzIGZpeCBmb3I6DQo+IENWRS0yMDIwLTI4MzYyDQo+IENW
RS0yMDIwLTI4MzY2DQo+IENWRS0yMDIwLTI4MzY3DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLaGFp
cnVsIFJvaGFpenphdCBKYW1hbHVkZGluIDwgDQo+IGtoYWlydWwucm9oYWl6emF0LmphbWFsdWRk
aW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ28vZ28tMS4x
NS5pbmMgfCA0ICsrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9n
by0xLjE1LmluYyBiL21ldGEvcmVjaXBlcy0NCj4gZGV2dG9vbHMvZ28vZ28tMS4xNS5pbmMNCj4g
aW5kZXggOTdkNzQ4Yi4uYzVlM2ZlMCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dvL2dvLTEuMTUuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nby9nby0x
LjE1LmluYw0KPiBAQCAtMSw3ICsxLDcgQEANCj4gwqByZXF1aXJlIGdvLWNvbW1vbi5pbmMNCj4g
wqANCj4gwqBHT19CQVNFVkVSU0lPTiA9ICIxLjE1Ig0KPiAtR09fTUlOT1IgPSAiLjIiDQo+ICtH
T19NSU5PUiA9ICIuNiINCj4gwqBQViAuPSAiJHtHT19NSU5PUn0iDQo+IMKgRklMRVNFWFRSQVBB
VEhTX3ByZXBlbmQgOj0gIiR7RklMRV9ESVJOQU1FfS9nby0ke0dPX0JBU0VWRVJTSU9OfToiDQo+
IMKgDQo+IEBAIC0xNyw0ICsxNyw0IEBAIFNSQ19VUkkgKz0gIlwNCj4gwqDCoMKgwqAgZmlsZTov
LzAwMDctY21kLWdvLW1ha2UtR09ST09ULXByZWNpb3VzLWJ5LWRlZmF1bHQucGF0Y2jCoFwNCj4g
wqDCoMKgwqAgZmlsZTovLzAwMDgtdXNlLUdPQlVJTERNT0RFLXRvLXNldC1idWlsZG1vZGUucGF0
Y2jCoFwNCj4gwqAiDQo+IC1TUkNfVVJJW21haW4uc2hhMjU2c3VtXSA9DQo+ICIyOGJmOWQwYmNk
ZTI1MTAxMWNhYWUyMzBhNGEwNWQ5MTdiMTcyZWEyMDNmMmE2MmYyYzJmOTUzMzU4OWQ0YjRkIg0K
PiArU1JDX1VSSVttYWluLnNoYTI1NnN1bV0gPQ0KPiAiODkwYmJhNzNjNWUyYjE5ZmZiMTE4MGUz
ODVlYTIyNTA1OWViMDA4ZWI5MWI2OTQ4NzVkZDg2ZWE0ODY3NTgxNyINCj4gDQo+IA0KPiANCg0K
