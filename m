Return-Path: <saul.wold@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCF277D40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:21:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 01 Jun 2017 08:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,280,1493708400"; d="scan'208";a="1155414027"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2017 08:21:52 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.128]) by
	ORSMSX110.amr.corp.intel.com ([169.254.10.175]) with mapi id
	14.03.0319.002; Thu, 1 Jun 2017 08:21:51 -0700
From: "Wold, Saul" <saul.wold@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ed.bartosh@linux.intel.com"
	<ed.bartosh@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v4 0/7] i#10073: generic EFI for wic
Thread-Index: AQHS2urLPzzSZ3xrlEKtwPtZXGDbbA==
Date: Thu, 1 Jun 2017 15:21:51 +0000
Message-ID: <1496330509.6426.82.camel@intel.com>
References: <cover.1495028624.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1495028624.git.ed.bartosh@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.99.93]
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/7] i#10073: generic EFI for wic
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
X-List-Received-Date: Thu, 01 Jun 2017 15:21:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E87BB350B7FB0948BC72BE99EA3744C1@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA1LTE3IGF0IDEzOjQ3ICswMDAwLCBFZCBCYXJ0b3NoIHdyb3RlOg0KPiBI
aSwNCj4gDQo+IFRoaXMgcGF0Y2hzZXQgaXMgYW4gaW1wbGVtZW50YXRpb24gb2YgZ2VuZXJpYyBF
RkkgYXBwcm9hY2ggZm9yIHdpYw0KPiBpbWFnZXMuDQo+IA0KPiBJbnN0ZWFkIG9mIGludHJvZHVj
aW5nIHlldCBhbm90aGVyIHdpYyBwbHVnaW4gaXQgdXNlcyBleGlzdGluZyBBUElzDQo+IGZyb20N
Cj4gRUZJX1BST1ZJREVSIGNsYXNzZXMgdG8gcG9wdWxhdGUgJHtXT1JLRElSfS9ib290ZnMgZGly
ZWN0b3J5IHdpdGggRUZJDQo+IGFydGlmYWN0cw0KPiBhbmQgYm9vdGxvYWRlciBjb25maWd1cmF0
aW9uLiBUaGlzIGRpcmVjdG9yeSBjYW4gYmUgdXNlZCBieSB3aWMNCj4gcm9vdGZzIHBsdWdpbg0K
PiB0byBwdXQgaW50byBib290IHBhcnRpdGlvbiBvZiB0aGUgaW1hZ2UuDQo+IA0KPiBFeGFtcGxl
IGtpY2tzdGFydCBmaWxlIGFuZCAyIHRlc3QgY2FzZXMgd2VyZSBhZGRlZCB0byB3aWMgdGVzdCBz
dWl0ZQ0KPiB0byBiZXR0ZXINCj4gaWxsdXN0cmF0ZSB0aGUgYXBwcm9hY2guDQo+IA0KPiBJIHBl
cnNvbmFsbHkgbGlrZSB0aGlzIGFwcHJvYWNoIG11Y2ggYmV0dGVyIHRoYW4gZHVwbGljYXRpbmcg
b2UgaW1hZ2UNCj4gY3JlYXRpb24NCj4gZnVuY3Rpb25hbGl0eSBpbiB3aWMgcGx1Z2lucy4gVGhp
cyB3YXkgd2UgY2FuIGhhdmUgdGhlIGNvZGUgaW4gb25lDQo+IHBsYWNlIGFuZA0KPiBib290bG9h
ZGVycyBjYW4gYmUgY29uZmlndXJlZCB0aGUgc2FtZSB3YXkgZm9yIG9lIGFuZCB3aWMgaW1hZ2Vz
Lg0KPiANCg0KRWQsDQoNCkkgaGF2ZSBiZWVuIGxvb2tpbmcgYXQgdGhpcyBzZXQgb2YgY2hhbmdl
cyBvdmVyIHRoZSBsYXN0IGZldyBkYXlzLCBhbmQNCndoaWxlIEkgbGlrZSB0aGUgYmFzaWMgYXBw
cm9hY2gsIEkgZG9uJ3QgdGhpbmsgaXQgZ29lcyBmYXIgZW5vdWdoLiDCoEkNCmFtIGxvb2tpbmcg
YXQgaG93IG9uZSB3b3VsZCBjcmVhdGUgYSBnZW5lcmljIGJvb3RmcyB2aWEgYSBERVBMT1lfRElS
DQphbmQgYW4gaW1hZ2UtYm9vdGZzLmJiIHR5cGUgb2YgcmVjaXBlIHRoYXQgZG9lcyB0aGUgYm9v
dGZzIGNvbnN0cnVjdGlvbg0KaW5zdGVhZCBvZiB0aGUgZXhpc3Rpbmcgc3lzdGVtZC1ib290IG9y
IGdydWItZWZpIGJiY2xhc3MgY29uc3RydWN0aW9uLg0KDQpUaGlzIHdpbGwgYWxsb3cgZm9yIG1v
cmUgZmxleGliaWxpdHkgaW4gY3JlYXRpbmcgbGFiZWxzIGZvcg0KYm9vdGxvYWRlcnMsIGRpZmZl
cmVudCB0eXBlcyBvZiBib290IGxvYWRlcnMgd2l0aG91dCBoYXZpbmcgdG8gY3JlYXRlDQpjbGFz
c2VzLiDCoFdlIHNob3VsZCB0aGVuIGJlIGFibGUgdG8gY29uc3RydWN0IHRoZSBlcXVpdmxhbnQg
b2YgaGRkaW1nDQpvciBpc28gaW1hZ2VzIHZpYSBhIHJlY2lwZSB0aGF0IGRlcGVuZHMgb24gdGhl
IHZhcmlvdXMgZG9fZGVwbG95KCkNCnRhc2tzIG9mIHRoZSBpbWFnZXMgZGVwZW5kZW50IGl0ZW1z
IChzeXNsaW51eCwgZ3J1YiwgdmlydHVhbC9rZXJuZWwpDQphbmQgY29uZmlndXJhdGlvbi4NCg0K
SSB0aGluayB3ZSBhcmUgc3RpbGwgdG9vIGxvY2tlZCBpbnRvIHByZXBhcmVfd2ljX2J1aWxkKCkg
Y2FsbGluZw0KYnVpbGRfZWZpX2NmZyBhbmQgZWZpX2Jvb3Rmc19wb3B1bGF0ZSwgd2hpY2ggbWVh
bnMgd2ljIHN0aWxsIG5lZWRzDQprbm93bGVkZ2Ugb2YgdGhlIGJvb3QgbG9hZGVycyBpbnN0ZWFk
IG9mIGp1c3QgaGF2aW5nIGEgcmVjaXBlIHBvcHVsYXRlDQphIGJvb3RmcyBwYXJ0aXRpb24gYW5k
IHdpYyBjcmVhdGluZyB0aGUgcGFydGl0aW9uIGFuZCBjb3B5aW5nIGZpbGVzDQppbnRvIGl0Lg0K
DQpNYXliZSBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLCBzbyBwbGVhc2UgY29ycmVjdCBtZSBpZiBJ
IGFtIHdyb25nLiDCoEkNCmhhdmUgYW4gZXhhbXBsZSBvZiB3aGF0IEkgYW0gdGhpbmtpbmcgb2Yg
aW4gY29udHJpYi9zZ3cvd2ljX3dpcA0KDQpUaGFua3MNCg0KU2F1IQ0KDQoNCj4gQ2hhbmdlcyBp
biB2MjoNCj4gwqAtIGFkZGVkIHBhdGNoOiBmaXhlZCBkZWZhdWx0IHZhbHVlIG9mIEdSVUJfUk9P
VA0KPiDCoC0gZml4ZWQgdHlwbyBpbiBjb21taXQgbWVzc2FnZTogdGltYWdlX3R5cGVzX3dpYyA+
IGltYWdlX3R5cGVzX3dpYw0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gwqAtIHNjaGVkdWxlZCBk
b19wcmVwYXJlX3dpY19idWlsZCBhcyBlYXJsaWVyIGFzIHBvc3NpYmxlDQo+IA0KPiBDaGFuZ2Vz
IGluIHY0Og0KPiDCoC0gZml4ZWQgYnVpbGQgb24gcGxhdGZvcm1zIHRoYXQgZG9uJ3Qgc3VwcG9y
dCBFRkkNCj4gwqAtIGZpeGVkIG5vbi1ncGwzIGJ1aWxkDQo+IMKgLSBmaXhlZCBidWlsZCBmYWls
dXJlIGluIHN5c3RlbWQtYm9vdCBjb2RlIGNhdXNlZCBieSByZXNjaGVkdWxlZA0KPiDCoMKgwqBk
b19wb3B1bGF0ZV9ib290ZnMgdG8gcnVuIGVhcmxpZXINCj4gDQo+IFRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQNCj4gOTIwZTE1OTJmYmE4ZmQ3MTRiOGZkZjg3Zjk3OTJlYmZhMzM3
Nzc5MzoNCj4gDQo+IMKgIHNlbGZ0ZXN0OiBmaXggdGVzdF91bnN1cHBvcnRlZF9zdWJjb21tYW5k
IHRlc3QgY2FzZSAoMjAxNy0wNS0xNw0KPiAxMzozNToyOCArMDAwMCkNCj4gDQo+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4gwqAgZ2l0Oi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcvcG9reS1jb250cmliIGVkL3dpYy93aXANCj4gwqAgaHR0cDovL2dpdC55b2N0
b3Byb2plY3Qub3JnL2NnaXQuY2dpL3Bva3ktY29udHJpYi9sb2cvP2g9ZWQvd2ljL3dpcA0KPiAN
Cj4gRWQgQmFydG9zaCAoNyk6DQo+IMKgIHN5c3RlbWQtYm9vdDogY3JlYXRlIG91dHB1dCBkaXIg
aWYgaXQgZG9lc24ndCBleGlzdA0KPiDCoCBlZmk6IGFkZCBlZmlfYm9vdGZzX3BvcHVsYXRlIEFQ
SQ0KPiDCoCBpbWFnZV90eXBlc193aWM6IGFkZCBkb19wb3B1bGF0ZV9ib290ZnMgdGFzaw0KPiDC
oCBpbWFnZV90eXBlc193aWM6IG1lcmdlZCAyIHRhc2tzDQo+IMKgIG9lLXNlbGZ0ZXN0OiBhZGQg
d2ljIHRlc3RzIGZvciBnZW5lcmljIEVGSQ0KPiDCoCBncnViLWVmaTogZml4ZWQgZGVmYXVsdCB2
YWx1ZSBvZiBHUlVCX1JPT1QNCj4gwqAgaW1hZ2VfdHlwZXNfd2ljOiBzY2hlZHVsZSBwcmVwYXJl
X3dpY19idWlsZCBjb3JyZWN0bHkNCj4gDQo+IMKgbWV0YS1zZWxmdGVzdC93aWMvdGVzdF9nZW5l
cmljX2VmaS53a3MuaW4gfMKgwqA5ICsrKysNCj4gwqBtZXRhL2NsYXNzZXMvZ3J1Yi1lZmkuYmJj
bGFzc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfCAxNCArKystLQ0KPiDCoG1ldGEvY2xhc3Nl
cy9pbWFnZV90eXBlc193aWMuYmJjbGFzc8KgwqDCoMKgwqDCoHwgODUNCj4gKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLQ0KPiDCoG1ldGEvY2xhc3Nlcy9zeXN0ZW1kLWJvb3QuYmJjbGFz
c8KgwqDCoMKgwqDCoMKgwqDCoHzCoMKgOCArKysNCj4gwqBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0
L3dpYy5wecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfCAzNiArKysrKysrKysrKysrDQo+IMKg
NSBmaWxlcyBjaGFuZ2VkLCAxMjYgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtc2VsZnRlc3Qvd2ljL3Rlc3RfZ2VuZXJpY19lZmkud2tz
LmluDQo+IA0KPiAtLcKgDQo+IFJlZ2FyZHMsDQo+IEVkDQo+IA==

