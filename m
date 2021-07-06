Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.1154.1625539462019164844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 19:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="196328554"
X-IronPort-AV: E=Sophos;i="5.83,327,1616482800"; 
   d="scan'208";a="196328554"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2021 19:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,327,1616482800"; 
   d="scan'208";a="496320868"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2021 19:44:16 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 6 Jul 2021 10:44:16 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2242.008;
 Tue, 6 Jul 2021 10:44:16 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter@berginkonsult.se"
	<peter@berginkonsult.se>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"liu.ming50@gmail.com" <liu.ming50@gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
Thread-Topic: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
Thread-Index: AQHXbzm0dRf4kFWDY06Zd4FK+4QYDqsw0myAgAEu2YCAAAYyAIACtZeA
Date: Tue, 6 Jul 2021 02:44:15 +0000
Message-ID: <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
References: <20210702115900.19417-1-peter@berginkonsult.se>
	 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
	 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se>
	 <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
In-Reply-To: <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E446A789A55ABC418A8E61F6A2620F2C@intel.com>
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsDQoNCk9uIFN1biwgMjAyMS0wNy0wNCBhdCAxMDoyMSArMDEwMCwgUmljaGFyZCBQ
dXJkaWUgd3JvdGU6DQo+IE9uIFN1biwgMjAyMS0wNy0wNCBhdCAxMDo1OSArMDIwMCwgUGV0ZXIg
QmVyZ2luIHdyb3RlOg0KPiA+IE9uIDIwMjEtMDctMDMgMTY6NTUsIE1pdHRhbCwgQW51aiB3cm90
ZToNCj4gPiA+IE9uIEZyaSwgMjAyMS0wNy0wMiBhdCAxMzo1OSArMDIwMCwgUGV0ZXIgQmVyZ2lu
IHdyb3RlOg0KPiA+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IDEwYWExMjkxOTc5ZmI5MGJlZDFi
ZWI0OWJlNGQ0MDZlZDBlMWU0ZDUuDQo+ID4gPiA+IA0KPiA+ID4gPiBBcyB0aGVyZSBpcyBubyBi
dWlsZCBkZXBlbmRlbmN5IGJldHdlZW4gbGlidWJvb3RlbnYgYW5kIHRoZQ0KPiA+ID4gPiBjb25m
aWd1cmF0aW9uDQo+ID4gPiA+IG9mIHUtYm9vdCB0aGVyZSBpcyBubyByZWFzb24gdG8gY2hlY2sg
Zm9yIFVCT09UX0NPTkZJRyBvcg0KPiA+ID4gPiBVQk9PVF9NQUNISU5FDQo+ID4gPiA+IGJ5IGFk
ZGluZyB0aGUgY2xhc3MgdWJvb3QtY29uZmlnLiBSZXZlcnQgdGhpcyBpbiBvcmRlciB0bw0KPiA+
ID4gPiByZW1vdmUNCj4gPiA+ID4gdXNlbGVzcw0KPiA+ID4gPiB3b3JrYXJvdW5kIGluIGJzcCBs
YXllciAobWV0YS1mcmVlc2NhbGUpLg0KPiA+ID4gVGhpcyB3YXMgYWRkZWQgdG8gYWRkcmVzcyBm
YWlsdXJlcyBpbiB3b3JsZCBidWlsZHM6DQo+ID4gPiANCj4gPiA+IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTQxNzU3DQo+ID4gPiAN
Cj4gPiA+IElmIHRoaXMgaXMgbm90IHJlcXVpcmVkLCB0aGVuIEkgdGhpbmsgd2UnZCBuZWVkIHRv
IGFkZHJlc3MgdGhvc2UNCj4gPiA+IGZhaWx1cmVzLg0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgdGhl
IHBvaW50ZXIgYWJvdXQgdGhlIHJlYXNvbiBmb3IgdGhpcyBwYXRjaC4gSSBzZWFyY2hlZA0KPiA+
IGEgYml0IA0KPiA+IGJ1dCBjb3VsZCBub3QgZmluZCBpdC4NCj4gPiANCj4gPiBDYW4geW91IHBs
ZWFzZSBoZWxwIG1lIGRlZmluZSAnd29ybGQgYnVpbGRzJz8NCj4gDQo+ICJiaXRiYWtlIHdvcmxk
Ig0KPiANCj4gaS5lLiBidWlsZCBldmVyeXRoaW5nDQo+IA0KPiA+IEJ5IHJlYWRpbmcgdGhlIG1h
aWwgdGhyZWFkIG15IHRob3VnaHRzIGFyZSB0aGF0IHRoZSBvYnZpb3VzIHRoaW5nDQo+ID4gaXMg
DQo+ID4gdGhhdCB0aGUgYnVpbGQgaGFzIGEgYmFkIGNvbmZpZ3VyYXRpb24gYXMgdS1ib290IGlz
IHNraXBwZWQuIFRoaXMNCj4gPiBzaG91bGQgDQo+ID4gYmUgdGhlIHRoaW5nIHRvIHNvbHZlLg0K
PiANCj4gTm90IGV2ZXJ5IE1BQ0hJTkUgd2lsbCBzdXBwb3J0IHUtYm9vdCBvciBoYXZlIGEgY29u
ZmlndXJhdGlvbiBmb3IgaXQuDQoNCkRvIHlvdSBoYXZlIGEgZml4IGZvciB0aGlzPyBUaGlzIHBh
dGNoIHdhcyBhcHBsaWVkIGFuZCBub3cgdGhlIHdvcmxkDQpidWlsZHMgZm9yIE1BQ0hJTkVzIG5v
dCBzdXBwb3J0aW5nIHUtYm9vdCBhcmUgZmFpbGluZy4gRG8geW91IG1pbmQgaWYgSQ0Kc2VuZCBh
IHJldmVydCBvZiB5b3VyIHBhdGNoPw0KDQpUaGFua3MsDQoNCkFudWoNCg0K
