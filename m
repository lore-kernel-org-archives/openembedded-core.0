Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 0664C7F7AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 02:28:11 +0000 (UTC)
IronPort-SDR: FqEbxksaC8iaVWclfGR5P5CAd3LjQIEEK9yEVb9OISPmQR728ST3aoZVCCPO9uVyAULQ+C9hI7
	Mb/Tn0i6S3xfEal+MZRfrYXm0TEFRe7avc/F8IGB9nnlNppSHQxlwjgEDmY3X/dsASmfWheUPZ
	Oeaaj4V/vOOVBQuDXmJ3TfoKMTMC5xE8+DPPtCAtFjXlUomGKsymfLyh8tmwzXz3yssRaxvXh8
	FesjjNBCwPOHSsz2qga2ouIZhMD4frLZbLDc3DF3YQ8Ssu7ZkIy5FxJ+uPgNXuRdQVOaU+t5ee
	ZOs=
X-IronPort-AV: E=Sophos;i="5.70,340,1574118000"; 
   d="scan'208";a="4435186"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: =?utf-8?B?W09FLWNvcmVdIOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIE9wZW4gZmls?=
	=?utf-8?Q?e_with_O=5FCLOEXEC_to_avoid_fd_leak_(rev3)?=
Thread-Index: AQHVzzG6b1pkNT4PdUOsEXCss9EMr6fy02dw
Date: Mon, 20 Jan 2020 02:28:12 +0000
Message-ID: <54d24332531b41c2a29671f2181f9458@XBOX03.axis.com>
References: <1579405812-336202-1-git-send-email-mingli.yu@windriver.com>
	<20200119053240.2276.68036@do> <5E23EC1D.2080407@windriver.com>
	<2583767.pvHsQr8YWX@shodan> <5E250399.1000807@windriver.com>
In-Reply-To: <5E250399.1000807@windriver.com>
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
X-List-Received-Date: Mon, 20 Jan 2020 02:28:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlLQ0KPiBib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZdSwgTWluZ2xpDQo+IFNl
bnQ6IGRlbiAyMCBqYW51YXJpIDIwMjAgMDI6MzQNCj4gVG86IFBhdWwgRWdnbGV0b24gPHBhdWwu
ZWdnbGV0b25AbGludXguaW50ZWwuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIOKclyBwYXRjaHRlc3Q6
IGZhaWx1cmUgZm9yIE9wZW4gZmlsZSB3aXRoIE9fQ0xPRVhFQw0KPiB0byBhdm9pZCBmZCBsZWFr
IChyZXYzKQ0KPiANCj4gT24gMDEvMjAvMjAgMDk6MjksIFBhdWwgRWdnbGV0b24gd3JvdGU6DQo+
ID4gSGkgTWluZ2xpDQo+ID4NCj4gPiBPbiBTdW5kYXksIDE5IEphbnVhcnkgMjAyMCA2OjQxOjQ5
IFBNIE5aRFQgWXUsIE1pbmdsaSB3cm90ZToNCj4gPj4gT24gMDEvMTkvMjAgMTM6MzIsIFBhdGNo
d29yayB3cm90ZToNCj4gPj4+ID09IFNlcmllcyBEZXRhaWxzID09DQo+ID4+Pg0KPiA+Pj4gU2Vy
aWVzOiBPcGVuIGZpbGUgd2l0aCBPX0NMT0VYRUMgdG8gYXZvaWQgZmQgbGVhayAocmV2MykNCj4g
Pj4+IFJldmlzaW9uOiAzDQo+ID4+PiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLm9wZW5lbWJl
ZGRlZC5vcmcvc2VyaWVzLzIyMTIzLw0KPiA+Pj4gU3RhdGUgOiBmYWlsdXJlDQo+ID4+Pg0KPiA+
Pj4gPT0gU3VtbWFyeSA9PQ0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBUaGFuayB5b3UgZm9yIHN1Ym1p
dHRpbmcgdGhpcyBwYXRjaCBzZXJpZXMgdG8gT3BlbkVtYmVkZGVkIENvcmUuIFRoaXMNCj4gaXMN
Cj4gPj4+IGFuIGF1dG9tYXRlZCByZXNwb25zZS4gU2V2ZXJhbCB0ZXN0cyBoYXZlIGJlZW4gZXhl
Y3V0ZWQgb24gdGhlDQo+IHByb3Bvc2VkDQo+ID4+PiBzZXJpZXMgYnkgcGF0Y2h0ZXN0IHJlc3Vs
dGluZyBpbiB0aGUgZm9sbG93aW5nIGZhaWx1cmVzOg0KPiA+Pj4NCj4gPj4+DQo+ID4+Pg0KPiA+
Pj4gKiBJc3N1ZSAgICAgICAgICAgICBTZXJpZXMgZG9lcyBub3QgYXBwbHkgb24gdG9wIG9mIHRh
cmdldCBicmFuY2gNCj4gW3Rlc3Rfc2VyaWVzX21lcmdlX29uX2hlYWRdDQo+ID4+PiAgICAgU3Vn
Z2VzdGVkIGZpeCAgICBSZWJhc2UgeW91ciBzZXJpZXMgb24gdG9wIG9mIHRhcmdldGVkIGJyYW5j
aA0KPiA+Pj4gICAgIFRhcmdldGVkIGJyYW5jaCAgbWFzdGVyIChjdXJyZW50bHkgYXQgOWQ3YTUy
MTk3MSkNCj4gPj4NCj4gPj4gSGF2ZSBhbHJlYWR5IHJlYmFzZWQgb24gdGhlIG1hc3RlciBicmFu
Y2ggb2YNCj4gPj4gaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvcHNl
dWRvLywgd2h5IHN0aWxsIGlzc3VlIG91dA0KPiA+PiB0aGUgYWJvdmUgaXNzdWU/IEFueSBoaW50
Pw0KPiA+DQo+ID4gSXQncyBhc3N1bWluZyB0aGF0IHBhdGNoZXMgc2VudCB0byB0aGlzIGxpc3Qg
YXJlIGZvciBPRS1Db3JlICh3aGljaCB0aGV5DQo+ID4gZ2VuZXJhbGx5IGFyZSkuIEkgd2Fzbid0
IGF3YXJlIGJ1dCBhcHBhcmVudGx5IHRoZSBkb2N1bWVudGVkIHBsYWNlIHRvDQo+ID4gc2VuZCBw
c2V1ZG8gcGF0Y2hlcyBpcyB0aGlzIGxpc3QsIHNvIEkgdGhpbmsgaW4gdGhpcyBjYXNlIHlvdSBj
YW4ganVzdA0KPiA+IGlnbm9yZSBwYXRjaHRlc3QuDQo+IA0KPiBPa2F5LCBtYW55IHRoYW5rcyBQ
YXVsIGZvciB5b3VyIGhpbnQhDQo+IA0KPiBUaGFua3MsDQo+IA0KPiA+DQo+ID4gQ2hlZXJzLA0K
PiA+IFBhdWwNCg0KQnV0IGl0IGlzIHByb2JhYmx5IGEgZ29vZCBpZGVhIHRvIGluY2x1ZGUgYSAi
W3BzZXVkb10iIHRhZyBpbiB0aGUgc3ViamVjdCANCndoZW4gc2VuZGluZyBwYXRjaGVzIHJlbGF0
ZWQgdG8gcHNldWRvIHRvIHRoaXMgbGlzdCwgYXMgdGhlIGV4cGVjdGF0aW9uIA0Kb3RoZXJ3aXNl
IGlzIHRoYXQgdGhleSBhcmUgZm9yIE9FLUNvcmUuDQoNCi8vUGV0ZXINCg==

