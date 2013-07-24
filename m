Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D61E60629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 10:04:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jul 2013 03:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,734,1367996400"; d="scan'208";a="350681704"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 03:03:59 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 24 Jul 2013 11:03:57 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.33]) with mapi id
	14.03.0123.003; Wed, 24 Jul 2013 11:03:57 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Thread-Topic: [OE-core] How to solve the make 3.82 issue at sanity check time?
Thread-Index: AQHOiEBR5J1d4yr5vEWgItXFGIJpDJlzYxoAgAAQnQCAAAIzAIAADTaAgAAGDgA=
Date: Wed, 24 Jul 2013 10:03:56 +0000
Message-ID: <1374660286.28370.15.camel@firebird.rb.intel.com>
References: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
	<1374652108.28370.6.camel@firebird.rb.intel.com>
	<CAOHjBZvycJUgtJc0sZdkENH51YHvSGj5P50uMALU95T3+W_RPA@mail.gmail.com>
	<CANyK_8eXoSMdsQFGwzPmnxZrgN_bmFejxoLdLAXqmis=rQ7Cmw@mail.gmail.com>
	<CAOHjBZtoXxaHXFammidVFGwGQz6pCJBKhZe5233Us+bDQPQ9QQ@mail.gmail.com>
In-Reply-To: <CAOHjBZtoXxaHXFammidVFGwGQz6pCJBKhZe5233Us+bDQPQ9QQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Cc: Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: How to solve the make 3.82 issue at sanity check time?
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
X-List-Received-Date: Wed, 24 Jul 2013 10:04:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <841D2325EE1EC141ABF00E4C5C9D6B85@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFdlZCwgMjAxMy0wNy0yNCBhdCAxMTo0MyArMDIwMCwgR2l1c2VwcGUgQ29uZG9yZWxs
aSB3cm90ZToNCj4gSGkgUGF1bCwNCj4gIA0KPiBJIHNhdyBpdCBlYXJseSB0aGlzIG1vcm5pbmcg
KHJlYWRpbmcgdGhlIHByZXZpb3VzIHRocmVhZCkNCj4gYnV0IEkndmUgbm90IHB1dCBpdCBpbiB0
aGUgcmlnaHQgYXR0ZW50aW9uIEkgdGhpbmsuDQo+IE5vdyBJJ3ZlIGluc3RhbGxlZCB0aGUgc2Rr
IHVzaW5nIHRoYXQgc2NyaXB0IGFuZCBhIHJ1biBpcyBzdGlsbA0KPiBvbmdvaW5nLg0KPiBJJ2xs
IGxldCB5b3Uga25vdy4NCj4gSSBhc2sgdGhlIHNhbWUgdG8geW91OiBhcmUgeW91IHN1cmUgdGhl
IEZDMTcgYW5kIGFoZWFkIGhhdmUgc29sdmVkIHRoZQ0KPiBtYWtlIGlzc3VlPw0KPiAgDQoNCkkn
bSBydW5uaW5nIEYxOSBhbmQgZGlkbid0IHJhbiBpbnRvIGFueSBwcm9ibGVtcy4NCg0KSSBhbHNv
IGhhdmUgYW4gRjE4IG1hY2hpbmUgdGhhdCB3b3JrcyB3aGljaCBoYXMNCm1ha2UtMy44Mi0xNC5m
YzE4Lng4Nl82NCAodGhpcyB3YXMgdGhlIHVwZGF0ZSB0aGF0IGZpeGVkIHRoZSBwcm9ibGVtLA0K
cHVzaGVkIHR3byB3ZWVrcyBhZ28pLg0KDQpBbmQgYWNjb3JkaW5nIHRvDQpodHRwczovL2FkbWlu
LmZlZG9yYXByb2plY3Qub3JnL3VwZGF0ZXMvRkVET1JBLTIwMTMtMTEyOTUvbWFrZS0zLjgyLTE0
LmZjMTc/X2NzcmZfdG9rZW49OWUyOTQ5YjAwOTViNTZjMDBiMjE3ZDBiMDBlNzdlMjhkZjJiYjdi
YQ0KYW5kDQpodHRwczovL2FkbWluLmZlZG9yYXByb2plY3Qub3JnL3VwZGF0ZXMvbWFrZT9fY3Ny
Zl90b2tlbj05ZTI5NDliMDA5NWI1NmMwMGIyMTdkMGIwMGU3N2UyOGRmMmJiN2JhDQoNCnRoZSBz
YW1lIHBhdGNoIHdhcyBwdXNoZWQgZm9yIEYxNyBtYWtlIG9uIHRoZSBzYW1lIGRheSBhcyBGMTgs
IHNvIHRoYXQNCnNob3VsZCB3b3JrIHRvby4NCg0KQ2hlZXJzLA0KU3RlZmFuDQoNCg0KPiBNYW55
IHRoYW5rcywNCj4gQ2hlZXJzLg0KPiBHaXVzZXBwZQ0KPiANCj4gMjAxMy83LzI0IFBhdWwgQmFy
a2VyIDxwYXVsQHBhdWxiYXJrZXIubWUudWs+DQo+ICAgICAgICAgT24gMjQgSnVseSAyMDEzIDA5
OjQ3LCBHaXVzZXBwZSBDb25kb3JlbGxpDQo+ICAgICAgICAgPGdpdXNlcHBlLmNvbmRvcmVsbGlA
Z21haWwuY29tPiB3cm90ZToNCj4gICAgICAgICA+IE1hbnkgdGhhbmtzIGZvciB0aGUgcXVpY2sg
cmVwbHkgU3RlZmFuLA0KPiAgICAgICAgID4NCj4gICAgICAgICA+IEZvciBjb21wbGV0aW9uLCBJ
J20gd29ya2luZyBvbiBGQzE2Lg0KPiAgICAgICAgID4gSW5kZWVkIChiZWZvcmUgc2VuZGluZyB0
aGUgbWFpbCkgSSB0cmllZCBkb3dubG9hZGluZyB0aGUNCj4gICAgICAgICBtYWtlIHJwbSBmb3Ig
RkMxNw0KPiAgICAgICAgID4gKHJwbWZpbmQubmV0KSBhbmQgdG8gdXNlIGl0DQo+ICAgICAgICAg
PiAoYWNjb3JkaW5nbHkgdW5wYWNrYWdlZCB1bmRlciBteSBwZXJzb25hbCBkaXJlY3RvcnksDQo+
ICAgICAgICAgdXBkYXRpbmcgdGhlIFBBVEgpIHdpdGgNCj4gICAgICAgICA+IHRoZSBzYW1lIGZh
aWx1cmUuDQo+ICAgICAgICAgPiBDYW4gdGhpcyBzb3VuZCBzdHJhbmdlIGZvciB5b3U/DQo+ICAg
ICAgICAgPiBBcyB5b3Uga25vdywgd2hpY2ggYXJlIHRoZSBtYWtlIHZlcnNpb25zIEZlZG9yYSBo
YXMgcmVsZWFzZWQNCj4gICAgICAgICBmb3IgdGhlDQo+ICAgICAgICAgPiBGQzE3LzE4Pw0KPiAg
ICAgICAgID4NCj4gICAgICAgICA+IEkgdGhpbmsgYXQgdGhlIG1vbWVudCB0aGUgYnVpbGQgb2Yg
dGhlIGJ1aWxkdG9vbHMtdGFyYmFsbA0KPiAgICAgICAgIHdpbGwgYmUgdGhlIHdheQ0KPiAgICAg
ICAgID4gSSdsbCBmb2xsb3csIHRlbXBvcmFyeSBkaXNhYmxpbmcgdGhlIHNhbml0eSBjaGVjay4N
Cj4gICAgICAgICA+DQo+ICAgICAgICAgPiBDaGVlcnMsDQo+ICAgICAgICAgPiBHaXVzZXBwZQ0K
PiAgICAgICAgID4NCj4gICAgICAgICANCj4gICAgICAgICANCj4gICAgICAgICBBcyBzdGF0ZWQg
aW4gYSBwcmV2aW91cyB0aHJlYWQsIHRoZXJlJ3MgYSBzbmFwc2hvdCBvZiB0aGUNCj4gICAgICAg
ICBidWlsZHRvb2xzDQo+ICAgICAgICAgYXQNCj4gICAgICAgICBodHRwOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy9wdWIvbmlnaHRseS9DVVJSRU5UL2J1aWxkdG9vbHMvDQo+ICAgICAg
ICAgd2hpY2ggbWlnaHQgd29yayBmb3IgeW91LiBJdCBzaG91bGQgaW5zdGFsbCBhIGtub3duIGdv
b2Qgc2V0DQo+ICAgICAgICAgb2YgdG9vbHMNCj4gICAgICAgICBpbmNsdWRpbmcgbWFrZS4gVGhp
cyBjb3VsZCBiZSBhIGdvb2QgdGVzdCBmb3IgaXQuDQo+ICAgICAgICAgDQo+ICAgICAgICAgLS0N
Cj4gICAgICAgICBQYXVsIEJhcmtlcg0KPiAgICAgICAgIA0KPiAgICAgICAgIEVtYWlsOiBwYXVs
QHBhdWxiYXJrZXIubWUudWsNCj4gICAgICAgICBodHRwOi8vd3d3LnBhdWxiYXJrZXIubWUudWsN
Cj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg0K

