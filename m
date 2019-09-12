Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 05B067E6FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 23:12:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2019 16:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,498,1559545200"; d="scan'208";a="200843140"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2019 16:12:55 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.57]) by
	PGSMSX104.gar.corp.intel.com ([169.254.3.196]) with mapi id
	14.03.0439.000; Fri, 13 Sep 2019 07:12:54 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "dbaryshkov@gmail.com"
	<dbaryshkov@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/9] uefi.bbclass: add bbclass holding
	configuration for UEFI applications
Thread-Index: AQHVab+b2j6V4hr6ik+j58iQ7tDhXw==
Date: Thu, 12 Sep 2019 23:12:54 +0000
Message-ID: <59fae086ca25abd545f80067c6824c752bce0f86.camel@intel.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.128.98]
MIME-Version: 1.0
Cc: "dmitry_eremin-solenikov@mentor.com" <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [PATCH 1/9] uefi.bbclass: add bbclass holding configuration for UEFI applications
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
X-List-Received-Date: Thu, 12 Sep 2019 23:12:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <259387854BA71247B0250A51A60A1228@intel.com>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCk9uIFdlZCwgMjAxOS0wOS0xMSBhdCAxMjoyOSArMDMwMCwgZGJhcnlzaGtvdkBn
bWFpbC5jb20gd3JvdGU6DQo+IEZyb206IERtaXRyeSBFcmVtaW4tU29sZW5pa292IDxkbWl0cnlf
ZXJlbWluLXNvbGVuaWtvdkBtZW50b3IuY29tPg0KPiANCj4gQ3JlYXRlIG5ldyBiYmNsYXNzIGRl
ZmluaW5nIGNvbW1vbiB2YXJpYWJsZXMgZm9yIGFsbCBVRUZJLXJlbGF0ZWQNCj4gcGFja2FnZXMg
KGJvb3Rsb2FkZXJzLCB0ZXN0IGFwcGxpY2F0aW9ucywgZXRjKS4NCg0KSGF2ZSB0aGVzZSBjaGFu
Z2VzIGJlZW4gdGVzdGVkIHVzaW5nIHdpYyBhcyB3ZWxsIHdpdGggbm9uIGRlZmF1bHQNCnZhbHVl
cz8gVGhlcmUgYXJlIHBsYWNlcyBpbiB0aGVyZSBpbiBFRkkgcGx1Z2lucyB3aGVyZSBFRkkvQk9P
VCBpcw0KaGFyZGNvZGVkLiBUaGV5IG1pZ2h0IGhhdmUgdG8gYmUgY2hhbmdlZCBhcyB3ZWxsIC4u
Lg0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEVyZW1p
bi1Tb2xlbmlrb3YgPA0KPiBkbWl0cnlfZXJlbWluLXNvbGVuaWtvdkBtZW50b3IuY29tPg0KPiAt
LS0NCj4gIG1ldGEvY2xhc3Nlcy91ZWZpLmJiY2xhc3MgfCAyNiArKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhL2NsYXNzZXMvdWVmaS5iYmNsYXNzDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS9jbGFzc2VzL3VlZmkuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy91ZWZpLmJiY2xhc3MNCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kM2ZjNGI2ODY2NzYN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL2NsYXNzZXMvdWVmaS5iYmNsYXNzDQo+IEBA
IC0wLDAgKzEsMjYgQEANCj4gKyMgTG9jYXRpb24gb2YgRUZJIGZpbGVzIGluc2lkZSBFRkkgU3lz
dGVtIFBhcnRpdGlvbg0KPiArRUZJRElSID89ICIvRUZJL0JPT1QiDQo+ICsNCj4gKyMgUHJlZml4
IHdoZXJlIEVTUCBpcyBtb3VudGVkIGluc2lkZSByb290ZnMuIFNldCB0byBlbXB0eSBpZiBwYWNr
YWdlDQo+IGlzIGdvaW5nDQo+ICsjIHRvIGJlIGluc3RhbGxlZCB0byBFU1AgZGlyZWN0bHkNCj4g
K0VGSV9QUkVGSVggPz0gIi9ib290Ig0KPiArDQo+ICsjIExvY2F0aW9uIGluc2lkZSByb290ZnMu
DQo+ICtFRklfRklMRVNfUEFUSCA9ICIke0VGSV9QUkVGSVh9JHtFRklESVJ9Ig0KPiArDQo+ICsj
IERldGVybWluZSBuYW1lIG9mIGJvb3Rsb2FkZXIgaW1hZ2UNCj4gK3B5dGhvbiBfX2Fub255bW91
cyAoKSB7DQo+ICsgICAgaW1wb3J0IHJlDQo+ICsgICAgdGFyZ2V0ID0gZC5nZXRWYXIoJ1RBUkdF
VF9BUkNIJykNCj4gKyAgICBpZiB0YXJnZXQgPT0gIng4Nl82NCI6DQo+ICsgICAgICAgIGltYWdl
ID0gImJvb3R4NjQuZWZpIg0KPiArICAgIGVsaWYgcmUubWF0Y2goJ2kuODYnLCB0YXJnZXQpOg0K
PiArICAgICAgICBpbWFnZSA9ICJib290aWEzMi5lZmkiDQo+ICsgICAgZWxpZiByZS5tYXRjaCgn
YWFyY2g2NCcsIHRhcmdldCk6DQo+ICsgICAgICAgIGltYWdlID0gImJvb3RhYTY0LmVmaSINCj4g
KyAgICBlbGlmIHJlLm1hdGNoKCdhcm0nLCB0YXJnZXQpOg0KPiArICAgICAgICBpbWFnZSA9ICJi
b290YXJtLmVmaSINCj4gKyAgICBlbHNlOg0KPiArICAgICAgICBpbWFnZSA9ICJib290VU5LTk9X
Ti5lZmkiDQo+ICsgICAgZC5zZXRWYXIoIkVGSV9CT09UX0lNQUdFIiwgaW1hZ2UpDQo+ICt9DQo+
IC0tIA0KPiAyLjIzLjANCj4gDQo=

