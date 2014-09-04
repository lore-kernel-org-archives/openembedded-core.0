Return-Path: <georgex.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4069271347
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 09:54:43 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2014 02:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,465,1406617200"; d="scan'208";a="475138362"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by azsmga001.ch.intel.com with ESMTP; 04 Sep 2014 02:54:42 -0700
Received: from irsmsx154.ger.corp.intel.com (163.33.192.96) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 4 Sep 2014 10:54:42 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.24]) by
	IRSMSX154.ger.corp.intel.com ([169.254.12.233]) with mapi id
	14.03.0195.001; Thu, 4 Sep 2014 10:54:42 +0100
From: "Musat, GeorgeX L" <georgex.l.musat@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/2] oeqa/runtime: Automatic test for ptest
Thread-Index: AQHPxrAG9WBtqITBbkaX9hZp7Ksym5vvdT6AgAFIh6A=
Date: Thu, 4 Sep 2014 09:54:41 +0000
Message-ID: <042E875E1B5D414CA9BB78B7D4FA691C13C8B1DC@IRSMSX102.ger.corp.intel.com>
References: <1409663439-1725-1-git-send-email-georgex.l.musat@intel.com>
	<1409663439-1725-2-git-send-email-georgex.l.musat@intel.com>
	<CAJTo0LY333THMi1uvDjRpUd1MuP671CGikrSBCg_OoC8r_9BqQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY333THMi1uvDjRpUd1MuP671CGikrSBCg_OoC8r_9BqQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/runtime: Automatic test for ptest
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
X-List-Received-Date: Thu, 04 Sep 2014 09:54:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSByZW1vdmUgIHRoZSBTbWFydCBjaGFubmVscyBiZWNhdXNlIGl0IGhlbHBzIG1lIHRvIHJldGVz
dCB1c2luZyBzaW1wbGVyZW1vdGUuIEkgdGhpbmsgSSBzaG91bGQgY29tbWVudCB0aGF0IHBhcnQg
YnV0IGxlYXZlIGl0IHRoZXJlIGZvciBmdXR1cmUgdXNlLg0KDQppc1JQTSB0ZXN0IGlzIGJlaW5n
IGRvbmUgaW4gc2V0dXBNb2R1bGUoKToNCiAgICBpZiAicGFja2FnZV9ycG0iICE9IG9lUnVudGlt
ZVRlc3QudGMuZC5nZXRWYXIoIlBBQ0tBR0VfQ0xBU1NFUyIsIFRydWUpLnNwbGl0KClbMF06DQog
ICAgICAgIHNraXBNb2R1bGUoIlJwbSBpcyBub3QgdGhlIHByaW1hcnkgcGFja2FnZSBtYW5hZ2Vy
IikNCg0KSSB3aWxsIGRvIHRoZSByZXN0IG9mIHRoZSBtb2RpZmljYXRpb25zLCB0aGFuayB5b3Ug
Zm9yIHRoZSBzdWdnZXN0aW9ucw0KDQpSZWdhcmRzLA0KTHVjaWFuDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBCdXJ0b24sIFJvc3MgW21haWx0bzpyb3NzLmJ1cnRvbkBpbnRl
bC5jb21dIA0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMDMsIDIwMTQgNjoxNCBQTQ0KVG86
IE11c2F0LCBHZW9yZ2VYIEwNCkNjOiBPRS1jb3JlDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCAyLzJdIG9lcWEvcnVudGltZTogQXV0b21hdGljIHRlc3QgZm9yIHB0ZXN0DQoNCk9uIDIg
U2VwdGVtYmVyIDIwMTQgMTQ6MTAsIEx1Y2lhbiBNdXNhdCA8Z2VvcmdleC5sLm11c2F0QGludGVs
LmNvbT4gd3JvdGU6DQo+ICsgICAgQGNsYXNzbWV0aG9kDQo+ICsgICAgZGVmIHRlYXJEb3duQ2xh
c3Moc2VsZik6DQo+ICsgICAgICAgIHNlbGYucmVwb19zZXJ2ZXIuc3RvcCgpDQo+ICsgICAgICAg
ICNyZW1vdmUgY3JlYXRlZCBjaGFubmVscyB0byBiZSBhYmxlIHRvIHJlcGVhdCB0aGUgdGVzdHMg
b24gc2FtZSBpbWFnZQ0KPiArICAgICAgICAoc3RhdHVzLCByZXN1bHQpID0gb2VSdW50aW1lVGVz
dC50Yy50YXJnZXQucnVuKCdzbWFydCBjaGFubmVsIC0tc2hvdyB8IGdyZXAgIlxbIicsIDApDQo+
ICsgICAgICAgIGZvciB4IGluIHJlc3VsdC5zcGxpdCgiXG4iKToNCj4gKyAgICAgICAgICAgIGlm
IHggbm90IGluIHNlbGYuZXhpc3RpbmdjaGFubmVsczoNCj4gKyAgICAgICAgICAgICAgICBvZVJ1
bnRpbWVUZXN0LnRjLnRhcmdldC5ydW4oJ3NtYXJ0IGNoYW5uZWwgLS1yZW1vdmUgDQo+ICsgJyt4
WzE6LTFdKycgLXknLCAwKQ0KDQpJZiB3ZSdyZSBub3QgcmVtb3ZpbmcgdGhlIHBhY2thZ2VzIHdl
J3ZlIGluc3RhbGxlZCwgd2h5IGRvIHdlIGJvdGhlciByZW1vdmluZyB0aGUgc21hcnQgY2hhbm5l
bHM/DQoNCj4gKyAgICBAc2tpcFVubGVzc1Bhc3NlZCgndGVzdF9zc2gnKQ0KPiArICAgIGRlZiB0
ZXN0X3B0ZXN0cnVubmVyKHNlbGYpOg0KPiArICAgICAgICBzZWxmLmFkZF9zbWFydF9jaGFubmVs
KCkNCj4gKyAgICAgICAgc2VsZi5pbnN0YWxsX3BhY2thZ2VzKHNlbGYuaW5zdGFsbF9jb21wbGVt
ZW50YXJ5KCIqLXB0ZXN0IikpDQo+ICsgICAgICAgIHNlbGYuaW5zdGFsbF9wYWNrYWdlcyhbJ3B0
ZXN0LXJ1bm5lciddKQ0KDQpDYW4ndCB5b3UgY2hlY2sgaWYgdGhlIHB0ZXN0IElNQUdFX0ZFQVRV
UkUgaXMgZW5hYmxlZCBhbmQgaWYgc28sIHNraXAgdGhpcz8NCg0KPiArICAgICAgICBsb2dfcmVz
dWx0c190b19sb2NhdGlvbiA9IG9zLnBhdGguam9pbignLi9yZXN1bHRzJykNCg0KSm9pbmluZyBh
IHNpbmdsZSBpdGVtIGRvZXNuJ3QgZG8gYW55dGhpbmcuDQoNCj4gKyAgICAgICAgaWYgbm90IG9z
LnBhdGguZXhpc3RzKGxvZ19yZXN1bHRzX3RvX2xvY2F0aW9uKToNCj4gKyAgICAgICAgICAgIG9z
Lm1ha2VkaXJzKGxvZ19yZXN1bHRzX3RvX2xvY2F0aW9uKQ0KPiArDQo+ICsgICAgICAgICMgY2xl
YXIgdGhlIHJlc3VsdHMgZGlyZWN0b3J5IGVhY2ggdGltZQ0KPiArICAgICAgICBmb3IgcGF0aCBp
biBvcy5saXN0ZGlyKGxvZ19yZXN1bHRzX3RvX2xvY2F0aW9uKToNCj4gKyAgICAgICAgICAgIG9z
LnJlbW92ZShvcy5wYXRoLmpvaW4obG9nX3Jlc3VsdHNfdG9fbG9jYXRpb24sIHBhdGgpKQ0KDQpJ
J2QgZG8gc29tZXRoaW5nIG1vcmUgbGlrZSBhcyBpdCdzIGEgbG90IGxlc3MgbGluZXMgYW5kIGNs
ZWFyIHRoYXQgeW91J3JlIGRlbGV0aW5nIHRoZSBvbGQgdHJlZSBhbmQgdGhlbiBjcmVhdGluZyBh
IGZyZXNoIG9uZToNCg0KaWYgb3MucGF0aC5leGlzdHMobG9nZGlyKToNCiAgc2h1dGlsLnJtdHJl
ZShsb2dkaXIpDQpvcy5tYWtlZGlycyhsb2dkaXIpDQoNCg0KUm9zcw0K

