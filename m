Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 208ED60402
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 07:39:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 00:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="44926441"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
	by fmsmga004.fm.intel.com with ESMTP; 10 Apr 2018 00:39:45 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	PGSMSX107.gar.corp.intel.com ([169.254.7.51]) with mapi id
	14.03.0319.002; Tue, 10 Apr 2018 15:39:44 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: runqemu: add tests for qemu
	boot and shutdown
Thread-Index: AQHT0J2269rWynOjOk6YWeUh9FRdC6P5nLjw
Date: Tue, 10 Apr 2018 07:39:44 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E019BE@PGSMSX109.gar.corp.intel.com>
References: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
	<00d1380c-5cd8-b062-1abf-b09b330b04a8@linux.intel.com>
In-Reply-To: <00d1380c-5cd8-b062-1abf-b09b330b04a8@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmY0YmNmMGQtYWY2Yi00MmE0LWE1NTgtZmViZDEzMGFlZWIwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjhnWGkwU3F3WEJ2ZEQ3S0QyZ0tkUzhnS21kdlE3aFg3TG05NnBLK2c1a2s9In0=
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH] oe-selftest: runqemu: add tests for qemu boot and shutdown
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
X-List-Received-Date: Tue, 10 Apr 2018 07:39:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm90ZWQsIEkgdW5kZXJzdG9vZCBpdCBub3cuIExldCBtZSBlbmhhbmNlIHRoZSBjb21tZW50IGlu
IHRoZSBzb3VyY2UgY29kZSBpdHNlbGYuIA0KSXQgbWFrZSBzZW5zZS4gVGhhbmsgeW91IGZvciB5
b3VyIGlucHV0cyEgDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiBbbWFpbHRvOmFsZXhhbmRlci5rYW5hdmluQGxpbnV4LmludGVsLmNvbV0gDQpT
ZW50OiBUdWVzZGF5LCBBcHJpbCAxMCwgMjAxOCAzOjMwIFBNDQpUbzogWWVvaCwgRWUgUGVuZyA8
ZWUucGVuZy55ZW9oQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBvZS1zZWxmdGVzdDogcnVu
cWVtdTogYWRkIHRlc3RzIGZvciBxZW11IGJvb3QgYW5kIHNodXRkb3duDQoNCk9uIDA0LzA5LzIw
MTggMDg6NDMgUE0sIFllb2ggRWUgUGVuZyB3cm90ZToNCj4gUUEgdGVhbSB3ZXJlIHRlc3Rpbmcg
cWVtdSBib290IGltYWdlIGFuZCBzaHV0ZG93biBvbiBlYWNoIHFlbXUgDQo+IGFyY2hpdGVjdHVy
ZSBtYW51YWxseS4gQWRkIGF1dG9tYXRlZCB0ZXN0IHRvIHRlc3QgcWVtdSBib290IG9uDQo+IGV4
dDQgYW5kIG5mcywgZmluYWxseSBjaGVjayB0aGF0IGl0IGNhbiBzaHV0ZG93biBwcm9wZXJseS4N
Cj4gDQo+IE9yaWdpbmFsIHJ1bnFlbXUgdGVzdHMgd2FzIGRlZGljYXRlZCBmb3IgTUFDSElORT1x
ZW11eDg2LTY0IGFuZCBpdCB3YXMgDQo+IHRlc3RpbmcgdmFyaW91cyBsaXZlIGltYWdlIChpc28g
YW5kIGhkZGltZykgd2lsbCBiZSBhYmxlIHRvIGJvb3Qgd2hpbGUgDQo+IGxpdmUgaW1hZ2Ugd2Fz
IG5vdCBzdXBwb3J0ZWQgb24gYWxsIHFlbXUgYXJjaGl0ZWN0dXJlLg0KPiANCj4gVGhlIG5ldyB0
ZXN0cyB3ZXJlIGRlc2lnbmVkIGFzIGEgc2VwYXJhdGUgY2xhc3MgYXMgdGhpcyB0ZXN0cyBmb2N1
cyBvbiANCj4gdGVzdGluZyBxZW11IGJvb3QgYW5kIHNodXRkb3duIG9uIGVhY2ggcWVtdSBhcmNo
aXRlY3R1cmUuDQo+IEZ1cnRoZXJtb3JlLCB0aGlzIHRlc3RzIGZvY3VzIG9uIHRlc3RpbmcgcWVt
dSBjb3VsZCBzaHV0ZG93biBhcyANCj4gZXhwZWN0ZWQuDQoNCjEuIEkgYmVsaWV2ZSB0aGUgY2xv
Y2sgb24gdGhlIG1hY2hpbmUgdGhhdCB5b3UgdXNlIHRvIHNlbmQgdGhlIHBhdGNoZXMgaXNuJ3Qg
c2V0IGNvcnJlY3RseSwgaXQgc2VlbXMgdG8gYmUgc2V2ZXJhbCBob3VycyBpbiB0aGUgcGFzdC4N
Cg0KMi4gV2hhdCBJIG1lYW50IGlzIHRoYXQgeW91IGNvbW1lbnQgdGhlIHNvdXJjZSBjb2RlIGl0
c2VsZiwgbm90IHdyaXRlIGEgbG9uZ2VyIGNvbW1pdCBtZXNzYWdlLiBTbyB0aGF0IGFueW9uZSBy
ZWFkaW5nIHRoZSBhY3R1YWwgZmlsZSBjYW4gcXVpY2tseSBmaWd1cmUgb3V0IHdoeSB0aGVyZSBh
cmUgdHdvIGNsYXNzZXMgYW5kIHdoYXQgdGhleSB0ZXN0LiANCkJhc2ljYWxseSB0YWtlIHRoZSBh
Ym92ZSwgYW5kIHdyaXRlIGl0IGRvd24gYXMgY29tbWVudHMgaW4gdGhlIGFjdHVhbCBmaWxlOyB0
YWtlIHlvdXIgdGltZSB0byB3cml0ZSBhIG5pY2UsIGNsZWFyIGV4cGxhbmF0aW9uIChzaW1pbGFy
IHRvIHdoYXQgd2UgZGlzY3Vzc2VkKS4gVGhlbiB0aGUgY29tbWl0IG1lc3NhZ2UgY2FuIGJlIG1v
cmUgYnJpZWYsIGJhc2ljYWxseSB0aGUgZmlyc3QgcGFyYWdyYXBoIGFib3ZlIGlzIGVub3VnaC4N
Cg0KVGhlIHJlYXNvbiBmb3IgdGhpcyBpcyB0aGF0IGNvbW1pdCBoaXN0b3J5IGlzIGxlc3Mgb2J2
aW91cyBvciBjb252ZW5pZW50IHRvIHVzZSB3aGVuIHlvdSB3YW50IHRvIGZpbmQgZXhwbGFuYXRp
b25zLiBZb3UgY2FuIGNlcnRhaW5seSB1c2UgJ2dpdCBsb2cgPGZpbGVuYW1lPicsIGJ1dCBpdCBj
b21lcyB3aXRoIGxvdHMgb2YgaXJyZWxldmFudCBjb21taXRzLCBhbmQgaWYgdGhlIGNvZGUgd2Fz
IHJlc3RydWN0dXJlZCBpbiB0aGUgcGFzdCwgdGhlbiB0aGUgaGlzdG9yeSBvZiBjaGFuZ2VzIHN0
b3BzIHRoZXJlLg0KDQpBbGV4DQo=

