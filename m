Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C7A766B238
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 12:43:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Nov 2013 04:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="429474406"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2013 04:43:17 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 4 Nov 2013 12:43:00 +0000
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.83]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.252]) with mapi id
	14.03.0123.003; Mon, 4 Nov 2013 12:43:00 +0000
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] Modify buildstats to be merged inside
	buildhistory
Thread-Index: AQHO1yMA7piYtXtwoUy6tS8UNnpUwpoQrCCAgAK2L7CAAWx5AIAAAIOggAADqoCAAC2rAIAABYeAgAABWkA=
Date: Mon, 4 Nov 2013 12:42:59 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A1AA18C@IRSMSX103.ger.corp.intel.com>
References: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
	<33115ABC4887814E8A92A08FBC93416B0A1AA0B0@IRSMSX103.ger.corp.intel.com>
	<1383557479.6271.105.camel@ted> <2223625.X3ey4vb7tr@helios>
	<1383568473.6271.117.camel@ted>
In-Reply-To: <1383568473.6271.117.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Mon, 04 Nov 2013 12:43:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBNb25k
YXksIE5vdmVtYmVyIDA0LCAyMDEzIDI6MzUgUE0NCj4gVG86IFBhdWwgRWdnbGV0b24NCj4gQ2M6
IFN0b2ljZXNjdSwgQ29ybmVsaXVYOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBNb2RpZnkgYnVpbGRzdGF0
cyB0byBiZSBtZXJnZWQgaW5zaWRlDQo+IGJ1aWxkaGlzdG9yeQ0KPiANCj4gT24gTW9uLCAyMDEz
LTExLTA0IGF0IDEyOjE0ICswMDAwLCBQYXVsIEVnZ2xldG9uIHdyb3RlOg0KPiA+IE9uIE1vbmRh
eSAwNCBOb3ZlbWJlciAyMDEzIDA5OjMxOjE5IFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiA+IFRo
ZSBiYXNpYyBpZGVhIHdpdGggYnVpbGRoaXN0b3J5IGlzIHRvIG9ubHkga2VlcCB0aGUgbGF0ZXN0
IHZlcnNpb24gb2YNCj4gPiBkYXRhIHN0b3JlZCB3aXRoaW4gaXQsIG9uIHRoZSBhc3N1bXB0aW9u
IHRoYXQgeW91IGNvdWxkIGFsd2F5cyBnZXQNCj4gPiBwcmV2aW91cyB2ZXJzaW9ucyBmcm9tIHRo
ZSBnaXQgaGlzdG9yeTsgdGhpcyBhbHNvIG1ha2VzIGNvbXBhcmlzb25zIHRvDQo+ID4gcHJldmlv
dXMgdmVyc2lvbnMgc3RyYWlnaHRmb3J3YXJkLg0KPiANCj4gVGhpcyBtYWtlcyBzZW5zZSBmb3Ig
YWJzb2x1dGUgdmFsdWUgZGF0YS4gVGhlIHRhc2sgYnVpbGQgc3RhdGlzdGljcyBhcmUgbm90DQo+
IGVudGlyZWx5ICJhYnNvbHV0ZSIgZGF0YSB0aG91Z2ggYW5kIGhhdmluZyB0byB0cmF2ZXJzZSBt
YW55IGNoZWNrb3V0cw0KPiB0cnlpbmcgdG8gYnVpbGQgdXAgc2F5ICJhdmVyYWdlIHRhc2sgdGlt
aW5nIiBtaWdodCBiZSBwcm9ibGVtYXRpYy4NCj4gDQo+ID4gQXMgZmFyIGFzIHRpbWVzdGFtcHMg
Z28sIEJVSUxETkFNRSBkb2VzIGdvIGludG8gdGhlIGNvbW1pdCBtZXNzYWdlOyBpZg0KPiA+IGl0
IGhlbHBzIHdlIHJlY29yZCB0aGUgbWV0YWRhdGEgcmV2aXNpb25zIGNvcnJlc3BvbmRpbmcgdG8g
dGhlIGJ1aWxkDQo+ID4gaW4gdGhlIGJ1aWxkaGlzdG9yeSByZXBvIGFzIHdlbGwgKGluIGEgIm1l
dGFkYXRhLXJldnMiIGZpbGUpLg0KPiANCj4gQ3VycmVudGx5IHRoZSBtYWluIHVzZSBvZiB0aGUg
ZGF0YSBpcyB0byBzYXkgInZpc3VhbGlzZSB0aGlzIGJ1aWxkIg0KPiB3aGVyZSB5b3UncmUgYnVp
bGRpbmcgYSB0YXJnZXQgb3Igc2V0IG9mIHRhcmdldHMuIFdlIG5hbWUgdGhlIGJ1aWxkIGFmdGVy
IHRoZQ0KPiBmaXJzdCBpdGVtIGluIHRoZSBsaXN0IG9mIGJ1aWxkIHRhcmdldHMuDQo+IA0KPiBU
aGUgbG9nZ2VkIGRhdGEgaXMgdXNlZnVsIGJvdGggYXMgcGFydCBvZiBhIHNldCB3aGljaCBhcmUg
dmlld2VkIHRvZ2V0aGVyIGFuZA0KPiBpbmRpdmlkdWFsbHkgb24gYSB0YXNrIGJhc2lzIHNvIHNl
ZSBob3cgbXVjaCBDUFUvRGlzayBhIGdpdmVuIHRhc2sgdXNlcyBhbmQNCj4gaG93IHRoYXQgY2hh
bmdlcyBvdmVyIHRpbWUuDQo+IA0KPiBUaGUgdHJpY2t5IHBhcnQgaXMgZmlyc3RseSB0aGF0IHdl
IHNob3VsZCByZWFsbHkgdXNlIGEgdHJ1ZSBidWlsZG5hbWUsIHNlY29uZGx5DQo+IHRoYXQgd2Ug
bmVlZCBib3RoIHRoZSBzZXQgb2YgZGF0YSBhbmQgZGF0YSBwZXIgdGFyZ2V0Lg0KPiANCj4gSWYg
d2UganVzdCBsb2dnZWQgZGF0YSBwZXIgdGFyZ2V0LCB3ZSBjb3VsZCBvdmVyd3JpdGUgYW55IHBy
ZXZpb3VzIGRhdGEgYnV0DQo+IHRoYXQgd291bGQgYnJlYWsgdXNhZ2UgYXMgYSBzZXQuDQo+IA0K
PiA+IElmIHdlIGRvIHdhbnQgdG8ga2VlcCB0aGUgYnVpbGRzIHNwbGl0IG91dCBpbiBzZXBhcmF0
ZSBwZXItYnVpbGQNCj4gPiBkaXJlY3RvcmllcyB0aGVuIHdoYXQgYXJlIHdlIGdhaW5pbmcgYnkg
dHJ5aW5nIHRvIHB1c2ggYnVpbGRzdGF0cyBpbnRvDQo+ID4gYnVpbGRoaXN0b3J5IGluIHRoZSBm
aXJzdCBwbGFjZT8NCj4gDQo+IFdlIGhhdmUgYSBuZWVkIHRvIGJlIGFibGUgdG8gbWVyZ2UgYW5k
IHN0b3JlIGJ1aWxkIHN0YXRpc3RpYyBkYXRhIHdoaWNoIGJ1aWxkDQo+IGhpc3RvcnkgYWxyZWFk
eSBkb2VzIHdlbGwuIFRoZSBxdWVzdGlvbiBpcyB3aGV0aGVyIGl0IG1ha2VzIHNlbnNlIHRvIHVz
ZSB0aGUNCj4gc2FtZSBtZWNoYW5pc20gb3Igbm90IHNpbmNlIHRoZXJlIGFyZSBjb21tb25hbGl0
aWVzIGFuZCBkaWZmZXJlbmNlcy4NCj4gSGF2aW5nIHR3byBkYXRhIHN0b3JhZ2Ugc3lzdGVtcyBh
bmQgcmVwb3NpdG9yaWVzIGRvZXNuJ3QgbWFrZSBhIGxvdCBvZg0KPiBzZW5zZS4NCj4gDQo+IEkn
bSBub3Qgc3VyZSB0aGlzIG1ha2VzIGEgc29sdXRpb24gbXVjaCBjbGVhcmVyIGJ1dCBpdCBkb2Vz
IGhvcGVmdWxseSBiZXR0ZXINCj4gZXhwbGFpbiB0aGUgY2hhbGxlbmdlLg0KDQpXZSBjb3VsZCB1
c2UgYWRkIGNvZGUgdG8gYnVpbGRoaXN0b3J5LWRpZmYgYW5kIG1ha2UgaXQgcmV0dXJuIGNvbXBh
cmlzb24gYnVpbGRzdGF0cyBkYXRhIGZvciBhIHNldCBvZiBidWlsZHMgPw0KVXN1YWxseSBwZW9w
bGUgbG9vayBhdCBzdGF0aXN0aWNzIGZvciBhIGNlcnRhaW4gdGFzayBhdCBhIHRpbWUgYW5kIHN1
Y2ggYSB0b29sIGNvdWxkIGFjdHVhbGx5IG1ha2UgdGhpbmdzIGVhc2llci4NCg0KUmVnYXJkcywN
CkNvcm5lbGl1DQoNCg==

