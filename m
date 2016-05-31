Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAAF77029
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 09:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5273E18168;
	Tue, 31 May 2016 11:02:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Huu5y-UjSU6k; Tue, 31 May 2016 11:02:40 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id B572118098;
	Tue, 31 May 2016 11:02:40 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id A8EB71AC5;
	Tue, 31 May 2016 11:02:40 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 9DA8F1711;
	Tue, 31 May 2016 11:02:40 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 9B7E09C9;
	Tue, 31 May 2016 11:02:40 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Tue, 31 May 2016 11:02:40 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Tue, 31 May 2016 11:02:40 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Tue, 31 May 2016 11:02:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
Thread-Topic: [OE-core] [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add dirs to
	stage in sysroot
Thread-Index: AQHRt0Y0yJJiMcylGUqM7rkUQXjNFp/LObxQgABMioCAArb7gIADaFiA
Date: Tue, 31 May 2016 09:02:40 +0000
Message-ID: <f7b9b775d2414e5498846f71c964c205@XBOX02.axis.com>
References: <cover.1463042237.git.pkj@axis.com>
	<c044a00c888e3359e64270e57067df9d648f9896.1463042237.git.pkj@axis.com>
	<CALbNGRRogSXXcyLTUvq_CqS41wNqD1EjOXPpdGzH8SSKcAEorw@mail.gmail.com>
	<86b3cfaab1c3407990067447ffd990ed@XBOX02.axis.com>
	<CALbNGRTiZicGG7u=YDPpc2k6OsqgDq8v6t7k1S7BXS+5HWMwoQ@mail.gmail.com>
	<CALbNGRRLrmzAwpOtzcNjmTYzw0A6Ay1k_S0C-1wjSvHrgTJWkA@mail.gmail.com>
In-Reply-To: <CALbNGRRLrmzAwpOtzcNjmTYzw0A6Ay1k_S0C-1wjSvHrgTJWkA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Tue, 31 May 2016 09:02:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZWFzIE3DvGxsZXIgW21h
aWx0bzpzY2huaXR6ZWx0b255QGdvb2dsZW1haWwuY29tXQ0KPiBTZW50OiBkZW4gMjggbWFqIDIw
MTYgMTU6NDINCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdA0KPiBDYzogUGF0Y2hlcyBhbmQgZGlz
Y3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0h2MiAwNS8xNl0gdGNsOiBVc2UgU1lTUk9PVF9ESVJTIHRvIGFkZA0KPiBkaXJzIHRv
IHN0YWdlIGluIHN5c3Jvb3QNCj4gDQo+IE9uIFRodSwgTWF5IDI2LCAyMDE2IGF0IDEwOjE0IFBN
LCBBbmRyZWFzIE3DvGxsZXINCj4gPHNjaG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+IHdyb3Rl
Og0KPiA+IE9uIFRodSwgTWF5IDI2LCAyMDE2IGF0IDM6NDEgUE0sIFBldGVyIEtqZWxsZXJzdGVk
dA0KPiA+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IEFuZHJlYXMgTcO8bGxlciBbbWFpbHRv
OnNjaG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb21dDQo+ID4+PiBTZW50OiBkZW4gMjYgbWFqIDIw
MTYgMTQ6MDANCj4gPj4+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQNCj4gPj4+IENjOiBQYXRjaGVz
IGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiA+Pj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0h2MiAwNS8xNl0gdGNsOiBVc2UgU1lTUk9PVF9ESVJTIHRvIGFk
ZA0KPiA+Pj4gZGlycyB0byBzdGFnZSBpbiBzeXNyb290DQo+ID4+Pg0KPiA+Pj4gT24gVGh1LCBN
YXkgMTIsIDIwMTYgYXQgMTA6MzcgQU0sIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA+Pj4gPHBldGVy
LmtqZWxsZXJzdGVkdEBheGlzLmNvbT4gd3JvdGU6DQo+ID4+PiA+IC0tLQ0KPiA+Pj4gPiAgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrL3RjbF84LjYuNC5iYiB8IDUgKy0tLS0NCj4gPj4+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkNCj4gPj4+ID4N
Cj4gPj4+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2xfOC42
LjQuYmINCj4gYi9tZXRhL3JlY2lwZXMtDQo+ID4+PiBkZXZ0b29scy90Y2x0ay90Y2xfOC42LjQu
YmINCj4gPj4+ID4gaW5kZXggOGU5MmIzZS4uNjFiZTgxZCAxMDA2NDQNCj4gPj4+ID4gLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrL3RjbF84LjYuNC5iYg0KPiA+Pj4gPiArKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGsvdGNsXzguNi40LmJiDQo+ID4+PiA+IEBAIC02OCwx
MCArNjgsNyBAQCBkb19pbnN0YWxsKCkgew0KPiA+Pj4gPiAgICAgICAgIGRvbmUNCj4gPj4+ID4g
IH0NCj4gPj4+ID4NCj4gPj4+ID4gLVNZU1JPT1RfUFJFUFJPQ0VTU19GVU5DUyArPSAidGNsX3N5
c3Jvb3RfcHJlcHJvY2VzcyINCj4gPj4+ID4gLXRjbF9zeXNyb290X3ByZXByb2Nlc3MgKCkgew0K
PiA+Pj4gPiAtICAgICAgIHN5c3Jvb3Rfc3RhZ2VfZGlyICR7RH0ke2JpbmRpcl9jcm9zc3Njcmlw
dHN9DQo+ICR7U1lTUk9PVF9ERVNURElSfSR7YmluZGlyX2Nyb3Nzc2NyaXB0c30NCj4gPj4+ID4g
LX0NCj4gPj4+ID4gK1NZU1JPT1RfRElSUyArPSAiJHtiaW5kaXJfY3Jvc3NzY3JpcHRzfSINCj4g
Pj4+ID4NCj4gPj4+ID4gIFBBQ0tBR0VTID0rICJ0Y2wtbGliIg0KPiA+Pj4gPiAgRklMRVNfdGNs
LWxpYiA9ICIke2xpYmRpcn0vbGlidGNsOC42LnNvLioiDQo+ID4+PiA+IC0tDQo+ID4+PiA+IDIu
MS4wDQo+ID4+PiA+DQo+ID4+PiBUaGlzIG9uZSBicmVha3MgbWV0YS1vZSdzIHBvc3RncmVzcWwu
DQo+ID4+Pg0KPiA+Pj4gQW5kcmVhcw0KPiA+Pg0KPiA+PiBCcmVha3MgaXQgaG93Pw0KPiA+Pg0K
PiA+PiAvL1BldGVyDQo+ID4+DQo+ID4gWWVzIEkgYWdyZWUgSSBjYW5ub3Qgc2VlIHdoYXQncyB3
cm9uZyB3aXRoIHRoaXMgcGF0Y2ggLSB0b2dldGhlciB3aXRoDQo+ID4gbW9kaWZpY2F0aW9ucyBv
ZiBzdGFnaW5nLmJiY2xhc3MgaXQgc2hvdWxkIGRvIHNhbWUgYXMgYmVmb3JlLiBGb3INCj4gdGVz
dA0KPiA+IEkgcmV2ZXJ0ZWQgdGhpcyBwYXRjaCBhbmQgcG9zdGdyZXNxbCBidWlsZHMgZmluZSBh
Z2Fpbi4gSGF2ZSBubyBpZGVhDQo+ID4gd2hhdCdzIGNhdXNpbmcgcG9zdGdyZXNxbCBmYWlsdXJl
DQo+ID4NCj4gPiBTb21lIHR5cG8gSSBkb24ndCBzZWU/DQo+ID4NCj4gVG8gZ2V0IG1vcmUgaW5m
b21hdGlvbiBJDQo+IA0KPiAqIGJ1aWxkIHdpdGggcGF0Y2ggcmV2ZXJ0ZWQNCj4gKiBwdXQgIHN5
c3Jvb3QgdW5kZXIgZ2l0IGNvbnRyb2wNCj4gKiByZW1vdmUgcmV2ZXJ0IGFnYWluDQo+IA0KPiBE
b24ndCBrbm93IHdoeSBidXQgbm93IHdlIHNlZSBhYnNvbHV0ZSBwYXRocyBpbiB0Y2xDb25maWcu
c2g6DQo+IA0KPiAtLS0gYS91c3IvYmluL2Nyb3Nzc2NyaXB0cy90Y2xDb25maWcuc2gNCj4gKysr
IGIvdXNyL2Jpbi9jcm9zc3NjcmlwdHMvdGNsQ29uZmlnLnNoDQo+IEBAIC01Nyw3ICs1Nyw3IEBA
IFRDTF9TSExJQl9DRkxBR1M9Jy1mUElDJw0KPiAgVENMX0NGTEFHU19XQVJOSU5HPSctV2FsbCcN
Cj4gDQo+ICAjIEV4dHJhIGZsYWdzIHRvIHBhc3MgdG8gY2M6DQo+IC1UQ0xfRVhUUkFfQ0ZMQUdT
PScgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcw0KPiAtZmRlYnVn
LXByZWZpeC1tYXA9L2hvbWUvc3VwZXJhbmR5L3RtcC9vZS1jb3JlLQ0KPiBnbGliYy9zeXNyb290
cy9yYXNwYmVycnlwaTIvdXNyL2luY2x1ZGU9L3Vzci9zcmMvZGVidWcvdGNsLzguNi40LXIwDQo+
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9zdXBlcmFuZHkvdG1wL29lLWNvcmUtZ2xpYmMvc3lz
cm9vdHMveDg2XzY0LQ0KPiBsaW51eD0NCj4gLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3N1cGVy
YW5keS90bXAvb2UtY29yZS0NCj4gZ2xpYmMvc3lzcm9vdHMvcmFzcGJlcnJ5cGkyPQ0KPiAgLXBp
cGUgJw0KPiArVENMX0VYVFJBX0NGTEFHUz0nIC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVz
ZWQtZGVidWctdHlwZXMNCj4gLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3N1cGVyYW5keS90bXAv
b2UtY29yZS0NCj4gZ2xpYmMvc3lzcm9vdHMvcmFzcGJlcnJ5cGkyL3Vzci9pbmNsdWRlPS9ob21l
L3N1cGVyYW5keS90bXAvb2UtY29yZS0NCj4gZ2xpYmMvc3lzcm9vdHMvcmFzcGJlcnJ5cGkyL3Vz
ci9zcmMvZGVidWcvdGNsLzguNi40LXIwDQo+IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9zdXBl
cmFuZHkvdG1wL29lLWNvcmUtZ2xpYmMvc3lzcm9vdHMveDg2XzY0LQ0KPiBsaW51eD0NCj4gLWZk
ZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3N1cGVyYW5keS90bXAvb2UtY29yZS0NCj4gZ2xpYmMvc3lz
cm9vdHMvcmFzcGJlcnJ5cGkyPQ0KPiAgLXBpcGUgJw0KPiANCj4gICMgQmFzZSBjb21tYW5kIHRv
IHVzZSBmb3IgY29tYmluaW5nIG9iamVjdCBmaWxlcyBpbnRvIGEgc2hhcmVkDQo+IGxpYnJhcnk6
DQo+ICBUQ0xfU0hMSUJfTEQ9JyR7Q0N9IC1zaGFyZWQgJHtDRkxBR1N9ICR7TERGTEFHU30nDQo+
IEBAIC0xMDQsMTEgKzEwNCwxMSBAQA0KPiBUQ0xfQlVJTERfTElCX1NQRUM9Jy1ML2hvbWUvc3Vw
ZXJhbmR5L3RtcC9vZS1jb3JlLQ0KPiBnbGliYy9zeXNyb290cy9yYXNwYmVycnlwaTIvdXMNCj4g
DQo+ICAjIFN0cmluZyB0byBwYXNzIHRvIGxpbmtlciB0byBwaWNrIHVwIHRoZSBUY2wgbGlicmFy
eSBmcm9tIGl0cw0KPiAgIyBpbnN0YWxsZWQgZGlyZWN0b3J5Lg0KPiAtVENMX0xJQl9TUEVDPSct
TD0vdXNyL2xpYiAtbHRjbDguNicNCj4gK1RDTF9MSUJfU1BFQz0nLUw9L2hvbWUvc3VwZXJhbmR5
L3RtcC9vZS1jb3JlLQ0KPiBnbGliYy9zeXNyb290cy9yYXNwYmVycnlwaTIvdXNyL2xpYg0KPiAt
bHRjbDguNicNCj4gDQo+ICAjIFN0cmluZyB0byBwYXNzIHRvIHRoZSBjb21waWxlciBzbyB0aGF0
IGFuIGV4dGVuc2lvbiBjYW4NCj4gICMgZmluZCBpbnN0YWxsZWQgVGNsIGhlYWRlcnMuDQo+IC1U
Q0xfSU5DTFVERV9TUEVDPSctST0vdXNyL2luY2x1ZGUvdGNsOC42Jw0KPiArVENMX0lOQ0xVREVf
U1BFQz0nLUk9L2hvbWUvc3VwZXJhbmR5L3RtcC9vZS1jb3JlLQ0KPiBnbGliYy9zeXNyb290cy9y
YXNwYmVycnlwaTIvdXNyL2luY2x1ZGUvdGNsOC42Jw0KPiANCj4gICMgSW5kaWNhdGVzIHdoZXRo
ZXIgYSB2ZXJzaW9uIG51bWJlcnMgc2hvdWxkIGJlIHVzZWQgaW4gLWwgc3dpdGNoZXMNCj4gICMg
KCJvayIgbWVhbnMgaXQncyBzYWZlIHRvIHVzZSBzd2l0Y2hlcyBsaWtlIC1sdGNsNy41OyAgIm5v
ZG90cyIgbWVhbnMNCj4gQEAgLTE1Nyw3ICsxNTcsNyBAQA0KPiBUQ0xfQlVJTERfU1RVQl9MSUJf
U1BFQz0nLUwvaG9tZS9zdXBlcmFuZHkvdG1wL29lLWNvcmUtDQo+IGdsaWJjL3N5c3Jvb3RzL3Jh
c3BiZXJyeXANCj4gDQo+ICAjIFN0cmluZyB0byBwYXNzIHRvIGxpbmtlciB0byBwaWNrIHVwIHRo
ZSBUY2wgc3R1YiBsaWJyYXJ5IGZyb20gaXRzDQo+ICAjIGluc3RhbGxlZCBkaXJlY3RvcnkuDQo+
IC1UQ0xfU1RVQl9MSUJfU1BFQz0nLUw9L3Vzci9saWIgLWx0Y2xzdHViOC42Jw0KPiArVENMX1NU
VUJfTElCX1NQRUM9Jy1MPS9ob21lL3N1cGVyYW5keS90bXAvb2UtY29yZS0NCj4gZ2xpYmMvc3lz
cm9vdHMvcmFzcGJlcnJ5cGkyL3Vzci9saWINCj4gLWx0Y2xzdHViOC42Jw0KPiANCj4gICMgUGF0
aCB0byB0aGUgVGNsIHN0dWIgbGlicmFyeSBpbiB0aGUgYnVpbGQgZGlyZWN0b3J5Lg0KPiAgVENM
X0JVSUxEX1NUVUJfTElCX1BBVEg9Jy9ob21lL3N1cGVyYW5keS90bXAvb2UtY29yZS0NCj4gZ2xp
YmMvc3lzcm9vdHMvcmFzcGJlcnJ5cGkyL3Vzci9pbmNsdWRlL2J1aWxkL2xpYnRjbHN0dWI4LjYu
YScNCj4gDQo+IFRoaXMgaXMgdGhlIHN5bXB0b20gYnV0IHdoYXQgaXMgaXQgY2F1c2VkIGJ5Pw0K
PiANCj4gQW5kcmVhcw0KDQpJdCBzZWVtcyB0byBiZSBhbiBpbnRyaWNhdGUgaGlzdG9yeS4gVGhl
IGRpZmZlcmVuY2Ugc3RlbXMgZnJvbSB0aGUgDQp0aGUgb3JkZXIgdGhpbmdzIGFyZSBleGVjdXRl
ZCBpbiBTWVNST09UX1BSRVBST0NFU1NfRlVOQ1MsIHRoZSBmYWN0IA0KdGhhdCB0aGUgdGNsIHJl
Y2lwZSBpbmhlcml0cyBiaW5jb25maWcgYW5kIHRoYXQgaXQgc2V0cyANCkJJTkNPTkZJR19HTE9C
IHRvICIqQ29uZmlnLnNoIi4gDQoNCkJlZm9yZSBteSBjaGFuZ2UsIHRoZSB0Y2xfc3lzcm9vdF9w
cmVwcm9jZXNzKCkgZnVuY3Rpb24gd2FzIGNhbGxlZCANCmFmdGVyIHRoZSBiaW5jb25maWdfc3lz
cm9vdF9wcmVwcm9jZXNzKCkgZnVuY3Rpb24sIGFuZCB0aHVzIG92ZXJ3cm90ZSANCnRoZSB0Y2xD
b25maWcuc2ggdGhhdCB0aGUgbGF0dGVyIGZ1bmN0aW9uIGhhZCBpbnN0YWxsZWQuIEFmdGVyIG15
IA0KY2hhbmdlIHRoZSAiY29ycmVjdCIgdGNsQ29uZmlnLnNoIGlzIGluc3RhbGxlZCBieSBzeXNy
b290X3N0YWdlX2FsbCgpIA0Kd2hpY2ggaXMgcnVuIGJlZm9yZSBiaW5jb25maWdfc3lzcm9vdF9w
cmVwcm9jZXNzKCkgYW5kIHRodXMgdGhlIA0KbGF0dGVyIG5vdyBvdmVyd3JpdGVzIHRoZSAiY29y
cmVjdCIgdGNsQ29uZmlnLnNoIHdpdGggYSAiZmF1bHR5IiANCnZlcnNpb24gKEkgdXNlZCAiY29y
cmVjdCIgYW5kICJmYXVsdHkiIGhlcmUgYXMgSSBndWVzcyBpdCBkZXBlbmRzIA0Kb24gb25lJ3Mg
cG9pbnQgb2YgdmlldywgYW5kIHdoYXQgb25lIGV4cGVjdCBpbmhlcml0aW5nIGJpbmNvbmZpZyB0
byANCmRvLi4uKQ0KDQpJZiBJIGNoYW5nZToNCg0KQklOQ09ORklHX0dMT0IgPSAiKkNvbmZpZy5z
aCINCg0KdG86DQoNCkJJTkNPTkZJR19HTE9CX2NsYXNzLXRhcmdldCA9ICJ0Y2xDb25maWcuc2gi
DQoNCmJvdGggdGhlIGluc3RhbGxlZCBmaWxlcyBpbiB0aGUgc3lzcm9vdHMgYW5kIG9uIHRhcmdl
dCBnbyBiYWNrIHRvIA0KbG9vayBleGFjdGx5IGFzIHRoZXkgZGlkIGJlZm9yZSBteSBjaGFuZ2Ug
KGFuZCBwb3N0Z3Jlc3FsIGJ1aWxkcyANCmFnYWluKS4gQ2hhbmdpbmcgIipDb25maWcuc2giIHRv
ICJ0Y2xDb25maWcuc2giIHdpbGwgYXZvaWQgDQppbnN0YWxsaW5nIGV4dHJhIGZpbGVzIGluIHRo
ZSBzeXNyb290cyAoaXRjbENvbmZpZy5zaCwgdGNsb29Db25maWcuc2ggDQphbmQgdGRiY0NvbmZp
Zy5zaCkgYXMgSSBkbyBub3QgdGhpbmsgdGhhdCB3YXMgaW50ZW5kZWQgd2hlbiB0aGUgdXNlIA0K
b2YgYmluY29uZmlnIHdhcyBpbnRyb2R1Y2VkIGZvciB0Y2wgKGJhc2VkIG9uIHdoYXQgaXMgaW5z
dGFsbGVkIGJ5IA0KZG9faW5zdGFsbCgpKS4NCg0KSSB3aWxsIHNlbmQgYSBwYXRjaCB0byBmaXgg
dGhlIHRjbCByZWNpcGUgYXMgcGVyIGFib3ZlLg0KDQovL1BldGVyDQoNCg==

