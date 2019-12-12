Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 270F57F798
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 11:11:17 +0000 (UTC)
IronPort-SDR: gug9E3A3EJVERD21sBrjDlcd2eDNAZFxNyytRHi1RMNg/a6qPDxxoKoHeVnh59pYk0RFeoAGvY
	hF1FL1fcVMkyGP8J6w8jqqtoWSvXKvpwX9WGOL9W9MTrA9oz2tLzwLjBi6SO2X3k6ojP+x0kVf
	agllhAJrPfNKQ+foQJMUtr7FH8awY0w/X/HmG33Vz4mvOpzt0Ocn0tR2u0z14gUxhqO3nUfCiZ
	DT2Gplho4uTP/2+NpRedfJGO3ndm7IivCombAzGiyqBBWblLR4NGcbOXnKQArbmliZyqbmNMe0
	M1g=
X-IronPort-AV: E=Sophos;i="5.69,305,1571695200"; 
   d="scan'208";a="3523175"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] connman dependency of readline
Thread-Index: AQHVrRS4iSsyKcPrK0mc3DtFanBJiKe0GP6ggAFLLICAAPlzcA==
Date: Thu, 12 Dec 2019 11:11:17 +0000
Message-ID: <c232d64f1bec4cc5a44b515f5ebe6507@XBOX03.axis.com>
References: <8746d8e88a538d8abede3a76718fd594ca895af0.camel@gmail.com>
	<89df20728e824340bd9f7193b01cf978@XBOX03.axis.com>
	<3f2cf400275f8439e1ced2dbb8aaf612ad43229b.camel@gmail.com>
In-Reply-To: <3f2cf400275f8439e1ced2dbb8aaf612ad43229b.camel@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: connman dependency of readline
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
X-List-Received-Date: Thu, 12 Dec 2019 11:11:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1cy5zdG92Z2FhcmRAZ21h
aWwuY29tIDxjbGF1cy5zdG92Z2FhcmRAZ21haWwuY29tPg0KPiBTZW50OiBkZW4gMTEgZGVjZW1i
ZXIgMjAxOSAyMjoxMQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+OyBvZS1jb3JlDQo+IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIGNvbm5tYW4gZGVwZW5kZW5jeSBv
ZiByZWFkbGluZQ0KPiANCj4gPiA+IGl0IGlzIHNldCB0byBhbHdheXMgZGVwZW5kIG9uIHJlYWRs
aW5lIGluIHRoZSBERVBFTkRTIHZhcmlhYmxlLA0KPiA+ID4gZXZlbiB0aG91Z2ggYXMgZmFyIGFz
IEkga25vdyBpdCBpcyBvbmx5IHRoZSBjb25ubWFuY3RsIHdoaWNoIA0KPiA+ID4gZGVwZW5kIG9u
IHJlYWRsaW5lLiBJbiBFWFRSQV9PRUNPTkYgdGhlIC0tZW5hYmxlLWNsaWVudCBpcyANCj4gPiA+
IGhhcmRjb2RlZC4NCj4gPiA+DQo+ID4gPiBUaGUgY2xpZW50IGlzIHRob3VnaCBub3QgaW5jbHVk
ZWQgaW4gdGhlIGltYWdlIHVubGVzcyB5b3UgYWxzbyANCj4gPiA+IGFkZCBjb25ubWFuLWNsaWVu
dC4NCj4gPiA+DQo+ID4gPiBTbyBJIGFtIHRoaW5raW5nIG9uIGNyZWF0aW5nIGEgcGF0Y2ggd2hl
cmUgSSBjcmVhdGUgYQ0KPiA+ID4gUEFDS0FHRUNPTkZJR1tyZWFkbGluZV0gbGlrZSBibHVlejUs
IGFzIEkgd291bGQgbm90IG5lZWQgdGhlIA0KPiA+ID4gY2xpZW50IGFuZCB3aWxsIG5lZWQgbm90
IHRvIGluY2x1ZGUgcmVhZGxpbmUgYmVjYXVzZSBvZiBHUEx2My4NCj4gPg0KPiA+IElmIHJlYWRs
aW5lIGlzIG9ubHkgbmVlZGVkIHRvIGJ1aWxkIHRoZSBjb25ubWFuIGNsaWVudCBhbmQgaXQgaXMN
Cj4gPiBwYWNrYWdlZCBpbiBhIHNlcGFyYXRlIHBhY2thZ2UsIHRoZW4geW91IGFyZSBvbmx5IGFm
ZmVjdGVkIGJ5DQo+ID4gcmVhZGxpbmUncyBHUEwtMy4wIGxpY2Vuc2UgaWYgeW91IGluc3RhbGwg
dGhhdCBwYWNrYWdlLiBJZiB5b3UgZG8NCj4gPiBub3QgaW5zdGFsbCBpdCB5b3UgYXJlIG9rIGV2
ZW4gaWYgcmVhZGxpbmUgaXMgbmVlZGVkIGR1cmluZyB0aGUNCj4gPiBidWlsZC4gU28gdGhlcmUg
c2hvdWxkIG5vdCBiZSBhbnkgcmVhbCBuZWVkIHRvIGRpc2FibGUgdGhlDQo+ID4gYnVpbGRpbmcg
b2YgdGhlIGNsaWVudC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciByZXBseS4gV2FzIGFsc28gbWl4
aW5nIERFUEVORFMgdXAgd2l0aCBSREVQRU5EUyANCj4gaW5zaWRlIG15IGhlYWQuDQo+IA0KPiBC
ZWZvcmUgeW91ciBtYWlsIEkgaGFkIGNyZWF0ZWQgYSBzbWFsbCBwYXRjaCBhbmQgc2VudC4gSSB3
YXMNCj4gY29uc2lkZXJpbmcganVzdCB0byByZXF1ZXN0IGl0IGJlaW5nIGRyb3BwZWQsIGJ1dCBv
biB0aGUgDQo+IG90aGVyIGhhbmQgaXQgbWFrZXMgaXQgcG9zc2libGUgdG8gdXNlDQo+IA0KPiBJ
TkNPTVBBVElCTEVfTElDRU5TRSA9ICJHUEwtMy4wIg0KPiANCj4gd2l0aG91dCBnZXR0aW5nIGJl
bG93IGVycm9yLg0KPiANCj4gRVJST1I6IE5vdGhpbmcgUFJPVklERVMgJ3JlYWRsaW5lJyAoYnV0
IC9vcGVuZW1iZWRkZWQvb2UtDQo+IGNvcmUvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9jb25u
bWFuL2Nvbm5tYW5fMS4zNy5iYiBERVBFTkRTIG9uIA0KPiBvciBvdGhlcndpc2UgcmVxdWlyZXMg
aXQpDQo+IHJlYWRsaW5lIHdhcyBza2lwcGVkOiBpdCBoYXMgYW4gaW5jb21wYXRpYmxlIGxpY2Vu
c2U6IEdQTHYzKw0KPiANCj4gVGhvdWdoIGZpbmUgd2l0aCBtZSBpZiB0aGUgcGF0Y2ggaXMgZHJv
cHBlZC4NCj4gDQo+IEFzIGEgc2lkZSBub3RlLCBpcyB0aGVyZSBhIHdheSBmb3Igc3BlY2lmaW5n
IElOQ09NUEFUSUJMRV9MSUNFTlNFIA0KPiBvbiBhbiBpbWFnZSBsZXZlbCwgYW5kIG5vdCBhcyBo
ZXJlIG9uIHRoZSBidWlsZCBsZXZlbD8gSWYgdGhpcyBpcyANCj4gdGhlIGNhc2UsIHRoZXJlIGlz
IG5vIG5lZWQgZm9yIG15IGNoYW5nZSBhdCBhbGwuDQoNClllcy4gQWJvdXQgdHdvIG1vbnRocyBh
Z28sIEFsZXhhbmRlciBLYW5hdmluIGFkZGVkIHN1cHBvcnQgZm9yIHNldHRpbmcgDQpJTkNPTVBB
VElCTEVfTElDRU5TRSBwZXIgaW1hZ2UgKHNlZSBjb21taXQgZmQ1MDM5NWIgaW4gT0UtQ29yZSk6
DQoNCklOQ09NUEFUSUJMRV9MSUNFTlNFX3BuLWNvcmUtaW1hZ2UtbWluaW1hbCA9ICJHUEwtMy4w
IExHUEwtMy4wIg0KDQo+IFJlZ2FyZHMNCj4gQ2xhdXMNCg0KLy9QZXRlcg0KDQo=

