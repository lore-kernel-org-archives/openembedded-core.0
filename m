Return-Path: <saul.wold@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4559A6E672
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 23:03:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Dec 2017 15:03:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,375,1508828400"; d="scan'208";a="11540465"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2017 15:03:26 -0800
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 7 Dec 2017 07:38:12 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.187]) by
	ORSMSX115.amr.corp.intel.com ([10.22.240.11]) with mapi id
	14.03.0319.002; Thu, 7 Dec 2017 07:36:21 -0800
From: "Wold, Saul" <saul.wold@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH 8/8] linux-yocto-dev: update to v4.15+
Thread-Index: AQHTbRYkBIHYL9GOb0y6kdmIJeKoHKMz6G+AgAANH4CAAAQZgIAAAR6AgAMPyACAAS4cAIAAVYeA
Date: Thu, 7 Dec 2017 15:36:21 +0000
Message-ID: <1512660979.9467.87.camel@intel.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<fc66fbd898d637782560e123ec6a87a62dde89fc.1512401707.git.bruce.ashfield@windriver.com>
	<CAMKF1soUD8m1vOyzVwiygp3ib4jCyy7dfdqxde2Y-LG_CXqOTA@mail.gmail.com>
	<ad367df7-795c-20c9-eef3-436f12038f97@windriver.com>
	<1512409179.862.212.camel@linuxfoundation.org>
	<0c894d04-7262-727f-8a64-63939359feb2@windriver.com>
	<CAJTo0LbzN9_7iAOZPqiqQYXxii-+zwwDkSFwrSnFQNmnYXUXJg@mail.gmail.com>
	<CADkTA4N6RfoCyKZGR-zJXkNv-k1zZ+HvFhC8-MpECekLLAVa_g@mail.gmail.com>
In-Reply-To: <CADkTA4N6RfoCyKZGR-zJXkNv-k1zZ+HvFhC8-MpECekLLAVa_g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.8.63]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] linux-yocto-dev: update to v4.15+
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
X-List-Received-Date: Thu, 07 Dec 2017 23:03:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5951042685DB2A43ABAA22683C207BFA@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE3LTEyLTA3IGF0IDA1OjMwIC0wNTAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToN
Cj4gDQo+IA0KPiBPbiBXZWQsIERlYyA2LCAyMDE3IGF0IDExOjI4IEFNLCBCdXJ0b24sIFJvc3Mg
PHJvc3MuYnVydG9uQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gVGhlIGFtZW5kZWQgY29tbWl0
IGhhcyBtaXNtYXRjaGluZyBjb21taXQgbG9nIGFuZCBwYXRjaCAodGFyZ2V0DQo+ID4gZWxmdXRp
bHMgaXMgaW4gdGhlIGNvbW1pdCBsb2cgYnV0IG5vdCB0aGUgcGF0Y2gpLCBhbmQgZG9lc24ndA0K
PiA+IG1lbnRpb24gaW5zdGFsbGluZyB0YXJnZXQgZWxmdXRpbHMgaWYgdGhleSB3YW50IGl0Lg0K
PiA+IA0KPiANCj4gDQo+IEkgZml4ZWQgdXAgdGhlIGNvbW1pdCBsb2cgb24gdGhhdCBwYXRjaCB0
byBtYXRjaCB0aGUgYWN0dWFsIGNvZGUuDQo+IA0KPiBBcyBpdCB0dXJucyBvdXQsIEkgZG9uJ3Qg
c2VlIHRoZSBuZWVkIHRvIGluc3RhbGwgdGFyZ2V0IGVsZnV0aWxzDQo+IGFueW1vcmUsIHNvIEkg
ZGlkbid0DQo+IGluY2x1ZGUgYW55dGhpbmcgYWJvdXQgdGhhdCBpbiB0aGUgbG9nLg0KPiANCj4g
V2Ugc3RpbGwgaGF2ZSBzb21lIGx0dG5nIGJ1aWxkIGlzc3VlcyB3aXRoIHRoZSAtZGV2IGtlcm5l
bCAoZHVlIHRvDQo+IG9ianRvb2wgYmVpbmcNCj4gcmVxdWlyZWQgYW5kIHRoZSBvcGVuc3NsIGhl
YWRlcnMgcmVxdWlyZWQgZm9yIG1ha2luZyB0aGUgc2NyaXB0cyksDQo+IGFuZCB0aG9zZQ0KPiBh
cmUgYmVpbmcgd29ya2VkIG9uIHNlcGFyYXRlbHkuIEhhdmluZyB0aGlzIHVwZGF0ZWQgbGludXgt
eW9jdG8tZGV2DQo+IHJlY2lwZQ0KPiBpbiB0aGUgdHJlZSBnZXRzIHRoZSBrZXJuZWwgYnVpbGRp
bmcgYW5kIGJvb3RpbmcgYW5kIGVuYWJsZXMgdXMgdG8NCj4gd29yayB0aHJvdWdoDQo+IHRoZSBv
dGhlciBpc3N1ZXMgbW9yZSBxdWlja2x5IChub3QgdG8gbWVlbnRpb24sIEkndmUgYWxyZWFkeSBw
dXNoZWQNCj4gNC4xNS1yYzIgdG8NCj4gdGhlIGFjdHVhbCBrZXJuZWwgdHJlZSwgc28geW91IGdl
dCB0aGF0IGZyb20gYSBidWlsZCByZWdhcmRsZXNzKS4NCj4gDQpXaXRoIFJlZ2FyZHMgdG8gdGhl
IG9ianRvb2wsIEkgd2FzIGFsc28gc2VlaW5nIGFuZCBpc3N1ZSB3aXRoIGtlcm5lbC0NCmRldnNy
YywgYW5kIG9ianRvb2wvLmRlYnVnIHNob3dpbmcgdXAgaW4gdGhlIGRldnNyYyBwYWNrYWdlcy1z
cGxpdC4gIEkNCmFtIHRyeWluZyB0byBnZXQgYSBzb2xpZCBzZXQgb2Ygc3RlcHMgdGhhdCByZXBy
b2R1Y2VzIHRoaXMuICBUaGUNCnN0cmFuZ2UgdGhpbmcgd2FzIEkgZGlkIG5vdCBzZWUgdGhlIC5k
ZWJ1ZyBmaWxlcyBpbiB0aGUga2VybmVsIGJ1aWxkDQphcmVhIG9yIGV2ZW4gaW4gdGhlIGtlcm5l
bC1kZXZzcmMvaW1hZ2UgZGlyZWN0b3J5IGJ1dCBpdCB3YXMgc3RyYW5nZWx5DQpzaG93ZWQgdXAg
aW4gcGFja2FnZXMtc3BsaXQgYW5kIGZhaWxlZCBhIFFBIGNoZWNrLg0KDQpTYXUhDQoNCj4gQ2hl
ZXJzLA0KPiANCj4gQnJ1Yw0KPiANCj4gDQo+ICANCj4gPiBSb3NzDQo+ID4gDQo+ID4gT24gNCBE
ZWNlbWJlciAyMDE3IGF0IDE3OjQzLCBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2lu
ZHJpdg0KPiA+IGVyLmNvbT4gd3JvdGU6DQo+ID4gPiBPbiAyMDE3LTEyLTA0IDEyOjM5IFBNLCBS
aWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCAyMDE3LTEyLTA0IGF0IDEyOjI0
IC0wNTAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToNCj4gPiA+ID4gPiBPbiAyMDE3LTEyLTA0IDEx
OjM4IEFNLCBLaGVtIFJhaiB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIE1vbiwgRGVjIDQsIDIwMTcg
YXQgNzozOSBBTSwgQnJ1Y2UgQXNoZmllbGQNCj4gPiA+ID4gPiA+IDxicnVjZS5hc2hmaWVsZEB3
aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT3V0c2lkZSBvZiB0aGUgbm9ybWFs
IHBhdGNoIHJlZnJlc2hlcyBhbmQgYm9vdCBpc3N1ZXMsDQo+ID4gPiA+ID4gPiA+IHRoZXJlIGFy
ZQ0KPiA+ID4gPiA+ID4gPiBuZXcNCj4gPiA+ID4gPiA+ID4gYnVpbGQgdGltZSB0b29scyB3aXRo
aW4gdGhlIGtlcm5lbCB0aGF0IHJlcXVpcmVkIHRoZQ0KPiA+ID4gPiA+ID4gPiBmb2xsb3dpbmcN
Cj4gPiA+ID4gPiA+ID4gZGVwZW5kZW5jaWVzOg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gRm9yIE9SQ19VTldJTkRFUiBzdXBwb3J0IGluIHg4Ni02NDoNCj4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ICAgIERFUEVORFMgKz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdBUkNIJywg
J3g4NicsDQo+ID4gPiA+ID4gPiA+ICdlbGZ1dGlscy0NCj4gPiA+ID4gPiA+ID4gbmF0aXZlIGVs
ZnV0aWxzJywgJycsIGQpfSINCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiAgZG8gd2UgbmVl
ZCBib3RoIHRhcmdldCBhbmQgaG9zdCBlbGZ1dGlscw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
IFl1cC4gVGhlcmUgd2VyZSByZWZlcmVuY2VzIHRvIGJvdGguIFNvbWUgaGFkIHRvIHJ1biBmb3IN
Cj4gPiA+ID4gPiBob3N0Y2MNCj4gPiA+ID4gPiBhbmQgb3RoZXJzIGluIHRoZSB0YXJnZXQgYXJj
aC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gIA0KPiA+ID4gPiBKdXN0IGZvciByZWZlcmVuY2UgdGhp
cyBpcyBwcmV0dHkgYmFkIGZvciBwZXJmb3JtYW5jZSBhcyBpdA0KPiA+ID4gPiBkZWxheXMgdGhl
DQo+ID4gPiA+IGtlcm5lbCBjb21waWxlIHVudGlsIHNvbWUgc3Vic3RhbnRpYWwgcGFydHMgb2Yg
dXNlcnNwYWNlIGJ1aWxkLg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiAgDQo+ID4gPiBPbiBh
IHNlY29uZCBsb29rLCBJIGNhbiBsaWtlbHkgdHVybiBvZmYgdGhlIHRhcmdldCBwYXJ0LCBpZg0K
PiA+ID4gc29tZW9uZQ0KPiA+ID4gd2FudHMgaXQsIHRoZXkgY2FuIGFsd2F5cyBpbnN0YWxsIHRo
ZSBwYWNrYWdlIChvciBpdCBjb3VsZCBiZSBhDQo+ID4gPiByZGVwZW5kcykuDQo+ID4gPiANCj4g
PiA+IEknbGwgYW1lbmQgdGhlIGNvbW1pdCBhbmQgbGVhdmUgaXQgb24gdGhhdCBicmFuY2ggd2l0
aCBqdXN0IHRoZQ0KPiA+ID4gREVQRU5EUyBvbiB0aGUgLW5hdGl2ZSB2ZXJzaW9uLg0KPiA+ID4g
DQo+ID4gPiA+IElzIE9SQ19VTldJTkRFUiB1c2VmdWwgYW5kIGNvbW1vbmx5IHVzZWQ/DQo+ID4g
PiA+IA0KPiA+ID4gIA0KPiA+ID4gVGhlIHVwc3RyZWFtIGtlcm5lbCBjb21taXQgdHVybmVkIGl0
IG9uIGJ5IGRlZmF1bHQsIEkgdHVybmVkIGl0DQo+ID4gPiBvZmYgaW4NCj4gPiA+IHRoZSBrZXJu
ZWwtY2FjaGUsIGJ1dCBJIHdhbnRlZCB0byBtYWtlIHN1cmUgdGhlIGRlcGVuZGVuY3kgd2FzDQo+
ID4gPiBpbiBwbGFjZS4NCj4gPiA+IA0KPiA+ID4gVGhlIGNvbW1pdCBzZXJpZXMgZnJvbSBKb3No
IFBvaW1ib2V1ZiBhbGwgbGVhZCB0byBpdCBiZWluZyBvbiBhcw0KPiA+ID4gdGhlIGRlZmF1bHQg
Y2hvaWNlIChldmVuIHdpdGggYSBzbGlnaHQgb3ZlcmhlYWQpLg0KPiA+ID4gDQo+ID4gPiBCcnVj
ZQ0KPiA+ID4gDQo+ID4gPiANCj4gPiA+ID4gQ2hlZXJzLA0KPiA+ID4gPiANCj4gPiA+ID4gUmlj
aGFyZA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiAgDQo+ID4gPiAtLSANCj4gPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gPiBPcGVuZW1i
ZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCj4gPiANCj4gPiANCj4gPiAtLQ0KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gT3BlbmVt
YmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCj4gPiANCj4gDQo+IA0KPiA=

