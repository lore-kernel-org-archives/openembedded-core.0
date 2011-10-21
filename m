Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RH7fa-0004oG-QO
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 07:29:27 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB23.4emm.local ([::1]) with mapi id 14.01.0289.001; Fri, 21 Oct 2011
	01:23:32 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to
	correct location
Thread-Index: AQHMj7C0iQGrQ9GcvUmRjdh+BpmFEJWGRHhA
Date: Fri, 21 Oct 2011 05:23:31 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF1A8959@MBX20.4emm.local>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
	<1319173361-11527-3-git-send-email-raj.khem@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8929@MBX20.4emm.local>
	<CAMKF1soXuZ84hVv9sN+rgR+Fh-o0jaDKKn7BMWs80xikiF7_bQ@mail.gmail.com>
In-Reply-To: <CAMKF1soXuZ84hVv9sN+rgR+Fh-o0jaDKKn7BMWs80xikiF7_bQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] gcc-configure-sdk: Point sysroot to	correct location
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 05:29:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBLaGVtIFJh
ag0KPiBTZW50OiBGcmlkYXksIDIxIE9jdG9iZXIgMjAxMSAxOjE2IFBNDQo+IFRvOiBQYXRjaGVz
IGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSCAzLzNdIGdjYy1jb25maWd1cmUtc2RrOiBQb2ludCBzeXNyb290IHRv
IGNvcnJlY3QNCj4gbG9jYXRpb24NCj4gDQo+IE9uIFRodSwgT2N0IDIwLCAyMDExIGF0IDEwOjEy
IFBNLCBKYW1lcyBMaW1ib3VyaXMNCj4gPGphbWVzQGRpZ2l0YWxtYXR0ZXIuY29tLmF1PiB3cm90
ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogb3BlbmVtYmVk
ZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+IFttYWlsdG86b3Bl
bmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYN
Cj4gT2YNCj4gPj4gS2hlbSBSYWoNCj4gPj4gU2VudDogRnJpZGF5LCAyMSBPY3RvYmVyIDIwMTEg
MTowMyBQTQ0KPiA+PiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiA+PiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIDMvM10gZ2NjLWNvbmZpZ3VyZS1zZGs6
IFBvaW50IHN5c3Jvb3QgdG8gY29ycmVjdA0KPiA+PiBsb2NhdGlvbg0KPiA+Pg0KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiA+PiAtLS0NCj4gPj4g
wqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1jb25maWd1cmUtc2RrLmluYyB8IMKgIMKg
MiArLQ0KPiA+PiDCoDEgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
cygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9n
Y2MtY29uZmlndXJlLXNkay5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+ID4+IGRldnRvb2xzL2djYy9n
Y2MtY29uZmlndXJlLXNkay5pbmMNCj4gPj4gaW5kZXggZGU4MDg3MC4uOThmZDRjMSAxMDA2NDQN
Cj4gPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtY29uZmlndXJlLXNkay5p
bmMNCj4gPj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtY29uZmlndXJlLXNk
ay5pbmMNCj4gPj4gQEAgLTcsNyArNyw3IEBAIFVTRV9OTFMgPSAnJHtAYmFzZV9jb25kaXRpb25h
bCggIlRBUkdFVF9PUyIsICJsaW51eC0NCj4gPj4gdWNsaWJjZWFiaSIsICJubyIsICIiLCBkICl9
Jw0KPiA+PiDCoEVYVFJBX09FQ09ORl9QQVRIUyA9ICItLXdpdGgtbG9jYWwtDQo+ID4+IHByZWZp
eD0ke1NES1BBVEh9L3N5c3Jvb3RzLyR7VEFSR0VUX1NZU30ke3RhcmdldF9leGVjX3ByZWZpeH0g
XA0KPiA+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC0td2l0aC1neHgtaW5j
bHVkZS1kaXI9JHt0YXJnZXRfaW5jbHVkZWRpcn0vYysrIFwNCj4gPj4gwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAtLXdpdGgtYnVpbGQtdGltZS0NCj4gPj4gdG9vbHM9JHtTVEFH
SU5HX0RJUl9OQVRJVkV9JHtwcmVmaXhfbmF0aXZlfS8ke1RBUkdFVF9TWVN9L2JpbiBcDQo+ID4+
IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAtLXdpdGgtc3lzcm9vdD0ke1NES1BB
VEh9L3N5c3Jvb3RzLyR7VEFSR0VUX1NZU30gXA0KPiA+PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLS13aXRoLQ0KPiA+PiBzeXNyb290PSR7U0RLUEFUSH0vc3lzcm9vdHMvJHtU
VU5FX1BLR0FSQ0h9JHtUQVJHRVRfVkVORE9SfS0NCj4gPj4gJHtUQVJHRVRfT1N9IFwNCj4gPj4g
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAtLXdpdGgtYnVpbGQtc3lzcm9vdD0k
e1NUQUdJTkdfRElSX1RBUkdFVH0iDQo+ID4+DQo+ID4+IMKgIw0KPiA+PiAtLQ0KPiA+PiAxLjcu
NS40DQo+ID4+DQo+ID4NCj4gPiBTaG91bGRuJ3QgLS13aXRoLWxvY2FsLXByZWZpeCBiZSBjaGFu
Z2VkIHRvbz8gSSBhbSB0ZXN0aW5nIHdpdGggYm90aA0KPiAke1RBUkdFVF9TWVN9J3MgcmVwbGFj
ZWQuIFdpbGwgcG9zdCByZXN1bHRzIHNob3J0bHkuDQo+IA0KPiB5ZXMgSSB0aGluayBib3RoIHBs
YWNlcyBpdCBzaG91bGQgY2hhbmdlDQo+IA0KDQpPaywgSSd2ZSB0ZXN0ZWQgd2l0aCBib3RoIGNo
YW5nZWQsIGFuZCB0aGUgY29ycmVzcG9uZGluZyBiaW51dGlscyBwYXRjaCwgYW5kIGJvdGggUXQg
YW5kIGtlcm5lbCBjb21waWxlcyBhcmUgd29ya2luZy4NCg0KVGhhbmtzLA0KSmFtZXMNCg0K


