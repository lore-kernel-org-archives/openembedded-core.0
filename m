Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2F47ED5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 03:15:16 +0000 (UTC)
IronPort-SDR: lbPnh7Npi6OWUAH1gOazrN+juFoCQl+o0Q31HuHo4AHgu40ty5r0wSUGkTlORdCX47nJYKDz3x
	wT/e8bl69Njy/1EGysFjwFxEa6JUbEXz8EgJUp7Rcq+zYFXFOBiOjn5DUwq8mQFATRrRkPggYu
	Jdd9d1ggX5bq5yq6x+nFKp7kR805cEmfU6RjCVDAt+fbQ8J/mjCMOqBB4z2vyGs63wr4RkUwPn
	1UwTiaj/ktH1wEfKKCGsvMRhKvOQFEmQML1aVaSNaS4Cy/JG/vHkFeqgEvrGOn82j+46dlYBKF
	FyI=
X-IronPort-AV: E=Sophos;i="5.70,340,1574118000"; 
   d="scan'208";a="4558959"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: =?utf-8?B?W09FLWNvcmVdIOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIE9wZW4gZmls?=
	=?utf-8?Q?e_with_O=5FCLOEXEC_to_avoid_fd_leak_(rev3)?=
Thread-Index: AQHVzzG6b1pkNT4PdUOsEXCss9EMr6fy02dw///6GQCAABJvMA==
Date: Mon, 20 Jan 2020 03:15:15 +0000
Message-ID: <f8005a9c8aae479db77809bb1132e04c@XBOX03.axis.com>
References: <1579405812-336202-1-git-send-email-mingli.yu@windriver.com>
	<20200119053240.2276.68036@do> <5E23EC1D.2080407@windriver.com>
	<2583767.pvHsQr8YWX@shodan> <5E250399.1000807@windriver.com>
	<54d24332531b41c2a29671f2181f9458@XBOX03.axis.com>
	<5E2518BC.7090306@windriver.com>
In-Reply-To: <5E2518BC.7090306@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIE9wZW4gZmlsZSB3aXRoIE9fQ0xPRVhFQyB0byBhdm9pZCBmZCBsZWFrIChyZXYzKQ==?=
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
X-List-Received-Date: Mon, 20 Jan 2020 03:15:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBZdSwgTWluZ2xpIDxtaW5nbGku
eXVAd2luZHJpdmVyLmNvbT4NCj4gU2VudDogZGVuIDIwIGphbnVhcmkgMjAyMCAwNDowNA0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBQYXVs
IEVnZ2xldG9uDQo+IDxwYXVsLmVnZ2xldG9uQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBPcGVuIGZpbGUgd2l0aCBPX0NMT0VYRUMN
Cj4gdG8gYXZvaWQgZmQgbGVhayAocmV2MykNCj4gDQo+IE9uIDAxLzIwLzIwIDEwOjI4LCBQZXRl
ciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlLQ0KPiA+PiBib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IE9uIEJlaGFsZiBPZiBZdSwgTWluZ2xpDQo+ID4+IFNlbnQ6IGRlbiAyMCBqYW51YXJp
IDIwMjAgMDI6MzQNCj4gPj4gVG86IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdnbGV0b25AbGludXgu
aW50ZWwuY29tPg0KPiA+PiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUg
Zm9yIE9wZW4gZmlsZSB3aXRoDQo+IE9fQ0xPRVhFQw0KPiA+PiB0byBhdm9pZCBmZCBsZWFrIChy
ZXYzKQ0KPiA+Pg0KPiA+PiBPbiAwMS8yMC8yMCAwOToyOSwgUGF1bCBFZ2dsZXRvbiB3cm90ZToN
Cj4gPj4+IEhpIE1pbmdsaQ0KPiA+Pj4NCj4gPj4+IE9uIFN1bmRheSwgMTkgSmFudWFyeSAyMDIw
IDY6NDE6NDkgUE0gTlpEVCBZdSwgTWluZ2xpIHdyb3RlOg0KPiA+Pj4+IE9uIDAxLzE5LzIwIDEz
OjMyLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID4+Pj4+ID09IFNlcmllcyBEZXRhaWxzID09DQo+ID4+
Pj4+DQo+ID4+Pj4+IFNlcmllczogT3BlbiBmaWxlIHdpdGggT19DTE9FWEVDIHRvIGF2b2lkIGZk
IGxlYWsgKHJldjMpDQo+ID4+Pj4+IFJldmlzaW9uOiAzDQo+ID4+Pj4+IFVSTCAgIDogaHR0cHM6
Ly9wYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9yZy9zZXJpZXMvMjIxMjMvDQo+ID4+Pj4+IFN0YXRl
IDogZmFpbHVyZQ0KPiA+Pj4+Pg0KPiA+Pj4+PiA9PSBTdW1tYXJ5ID09DQo+ID4+Pj4+DQo+ID4+
Pj4+DQo+ID4+Pj4+IFRoYW5rIHlvdSBmb3Igc3VibWl0dGluZyB0aGlzIHBhdGNoIHNlcmllcyB0
byBPcGVuRW1iZWRkZWQgQ29yZS4NCj4gVGhpcw0KPiA+PiBpcw0KPiA+Pj4+PiBhbiBhdXRvbWF0
ZWQgcmVzcG9uc2UuIFNldmVyYWwgdGVzdHMgaGF2ZSBiZWVuIGV4ZWN1dGVkIG9uIHRoZQ0KPiA+
PiBwcm9wb3NlZA0KPiA+Pj4+PiBzZXJpZXMgYnkgcGF0Y2h0ZXN0IHJlc3VsdGluZyBpbiB0aGUg
Zm9sbG93aW5nIGZhaWx1cmVzOg0KPiA+Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiAq
IElzc3VlICAgICAgICAgICAgIFNlcmllcyBkb2VzIG5vdCBhcHBseSBvbiB0b3Agb2YgdGFyZ2V0
IGJyYW5jaA0KPiA+PiBbdGVzdF9zZXJpZXNfbWVyZ2Vfb25faGVhZF0NCj4gPj4+Pj4gICAgICBT
dWdnZXN0ZWQgZml4ICAgIFJlYmFzZSB5b3VyIHNlcmllcyBvbiB0b3Agb2YgdGFyZ2V0ZWQgYnJh
bmNoDQo+ID4+Pj4+ICAgICAgVGFyZ2V0ZWQgYnJhbmNoICBtYXN0ZXIgKGN1cnJlbnRseSBhdCA5
ZDdhNTIxOTcxKQ0KPiA+Pj4+DQo+ID4+Pj4gSGF2ZSBhbHJlYWR5IHJlYmFzZWQgb24gdGhlIG1h
c3RlciBicmFuY2ggb2YNCj4gPj4+PiBodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9j
Z2l0LmNnaS9wc2V1ZG8vLCB3aHkgc3RpbGwgaXNzdWUNCj4gb3V0DQo+ID4+Pj4gdGhlIGFib3Zl
IGlzc3VlPyBBbnkgaGludD8NCj4gPj4+DQo+ID4+PiBJdCdzIGFzc3VtaW5nIHRoYXQgcGF0Y2hl
cyBzZW50IHRvIHRoaXMgbGlzdCBhcmUgZm9yIE9FLUNvcmUgKHdoaWNoDQo+IHRoZXkNCj4gPj4+
IGdlbmVyYWxseSBhcmUpLiBJIHdhc24ndCBhd2FyZSBidXQgYXBwYXJlbnRseSB0aGUgZG9jdW1l
bnRlZCBwbGFjZSB0bw0KPiA+Pj4gc2VuZCBwc2V1ZG8gcGF0Y2hlcyBpcyB0aGlzIGxpc3QsIHNv
IEkgdGhpbmsgaW4gdGhpcyBjYXNlIHlvdSBjYW4ganVzdA0KPiA+Pj4gaWdub3JlIHBhdGNodGVz
dC4NCj4gPj4NCj4gPj4gT2theSwgbWFueSB0aGFua3MgUGF1bCBmb3IgeW91ciBoaW50IQ0KPiA+
Pg0KPiA+PiBUaGFua3MsDQo+ID4+DQo+ID4+Pg0KPiA+Pj4gQ2hlZXJzLA0KPiA+Pj4gUGF1bA0K
PiA+DQo+ID4gQnV0IGl0IGlzIHByb2JhYmx5IGEgZ29vZCBpZGVhIHRvIGluY2x1ZGUgYSAiW3Bz
ZXVkb10iIHRhZyBpbiB0aGUNCj4gc3ViamVjdA0KPiA+IHdoZW4gc2VuZGluZyBwYXRjaGVzIHJl
bGF0ZWQgdG8gcHNldWRvIHRvIHRoaXMgbGlzdCwgYXMgdGhlIGV4cGVjdGF0aW9uDQo+ID4gb3Ro
ZXJ3aXNlIGlzIHRoYXQgdGhleSBhcmUgZm9yIE9FLUNvcmUuDQo+IA0KPiBUaGFua3MgUGV0ZXIh
IEFuZCBhbHJlYWR5IGFkZCB0aGUgInBzZXVkb191dGlsLmMiIHRhZyBpbiB0aGUgc3ViamVjdCBp
bg0KPiB0aGUgdjMsIHBsZWFzZSBjaGVjayB0aGUgbWFpbCB3aXRoIHRoZSBzdWJqZWN0ICJbT0Ut
Y29yZV0gW1BBVENIIHYzXQ0KPiBwc2V1ZG9fdXRpbC5jOiBPcGVuIGZpbGUgd2l0aCBPX0NMT0VY
RUMgdG8gYXZvaWQgZmQgbGVhayIuDQoNClRoYXQgaXMgbm90IHRoZSBzYW1lLiBUaGUgInBzZXVk
b191dGlsLmM6IiBpcyBwYXJ0IG9mIHRoZSBjb21taXQgc3ViamVjdCANCmFuZCB3aWxsIGVuZCB1
cCBpbiB0aGUgR2l0IHJlcG9zaXRvcnkuIEEgIltwc2V1ZG9dIiB0YWcgaXMgZm9yIGFueW9uZSAN
CnNlZWluZyB0aGUgbWFpbCAocG9zc2libHkgaW5jbHVkaW5nIHBhdGNod29yayBhbmQgcGF0Y2h0
ZXN0KSwgbGV0dGluZyANCnRoZW0ga25vdyB0aGF0IHRoaXMgY29tbWl0IGlzIGFib3V0IHBzZXVk
bywgbm90IE9FLUNvcmUgKHNpbWlsYXIgdG8gdGhlIA0KIltQQVRDSCB2M10iIHRhZywgd2hpY2gg
aXMgYWxzbyBpbmZvcm1hdGlvbiBhYm91dCB0aGUgY29tbWl0KS4NCg0KPiBUaGFua3MsDQo+IA0K
PiA+IC8vUGV0ZXINCg0KLy9QZXRlcg0KDQo=

