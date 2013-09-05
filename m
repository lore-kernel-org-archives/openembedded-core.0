Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1DCBB6C6A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:09:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Sep 2013 06:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="397146268"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2013 06:09:19 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 5 Sep 2013 14:09:04 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.29]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.226]) with mapi id
	14.03.0123.003; Thu, 5 Sep 2013 14:09:03 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] qemu: add recommend of kernel-modules for
	all qemu machines
Thread-Index: AQHOqbqQ05bE9s28XE6nSTag/sc8tJm2P9+AgABqNYCAADTUAIAABw6AgAAoDgA=
Date: Thu, 5 Sep 2013 13:09:02 +0000
Message-ID: <1378386554.27411.14.camel@firebird.rb.intel.com>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
	<1378332114.1059.260.camel@ted>
	<CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
	<20130905071133.GG11500@jama>
	<CAJTo0LZ0vG0w24Wkr2KiwWoEF9bFwyJeBpg4xnfLpYe9ELd+mQ@mail.gmail.com>
	<CAJTo0LaPJjQqR80ZpowVBfjhYFLwqUvFF0wQm+S1VfKWeEDqdg@mail.gmail.com>
In-Reply-To: <CAJTo0LaPJjQqR80ZpowVBfjhYFLwqUvFF0wQm+S1VfKWeEDqdg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Thu, 05 Sep 2013 13:09:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7B5861BFC786048B5C44A5590C7AE61@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFRodSwgMjAxMy0wOS0wNSBhdCAxMTo0NSArMDEwMCwgQnVydG9uLCBSb3NzIHdyb3Rl
Og0KPiBPbiA1IFNlcHRlbWJlciAyMDEzIDExOjIwLCBCdXJ0b24sIFJvc3MgPHJvc3MuYnVydG9u
QGludGVsLmNvbT4gd3JvdGU6DQo+ID4gSSd2ZSBhbHNvIGRlY2lkZWQgdGhhdCBtYXliZSBzeXN0
ZW1kIGlzbid0IGJlaW5nIHF1aXRlIGFzIGNsZXZlciBhcyBpdA0KPiA+IHNob3VsZCBhbmQgbWF5
YmUgZml4aW5nIGl0IHRoZXJlIGlzIHRoZSByZWFsIGZpeC4NCj4gDQo+IHMvc3lzdGVtZC9MaW51
eC8uDQo+IA0KPiBUaGUgYnVnIGlzIHRoYXQgZG9pbmcgYSAiZGYiIG9uIGEgcWVtdSBzeXN0ZW1k
IGltYWdlIHJlc3VsdHMgaW4gaXQNCj4gYXR0ZW1wdGluZyB0byBhdXRvbW91bnQgL3Byb2Mvc3lz
L2ZzL2JpbmZtdF9taXNjLiAgVGhlIGF1dG9tb3VudCB1bml0DQo+IGhhcyBDb25kaXRpb25QYXRo
RXhpc3RzPS9wcm9jL3N5cy9mcy9iaW5mbXRfbWlzYy8gdG8gc3RvcCBpdA0KPiBhdHRlbXB0aW5n
IHRvIGF1dG9tb3VudCB3aGVuIGJpbmZtdCBpcyBkaXNhYmxlZCBidXQgaG9vcmF5IExpbnV4IGlm
DQo+IGJpbmZtdF9taXNjIGlzIGEgbW9kdWxlIHRoYXQgZGlyZWN0b3J5IGV4aXN0cyBldmVuIHdo
ZW4gdGhlIG1vZHVsZQ0KPiBpc24ndCBhY3R1YWxseSBsb2FkZWQsIGdpdmluZyBhIG5vIHN1Y2gg
ZGV2aWNlIGVycm9yIHdoZW4gYWNjZXNzZWQuDQo+IFRoZSBpbnRlbnRpb24gaGVyZSBJIGJlbGll
dmUgaXMgc28gdGhhdCBhbiBhY2Nlc3MgdG8gdGhhdCBkaXJlY3RvcnkNCj4gY2FuIGludm9rZSBh
biBhdXRvbW91bnRlciAoc3lzdGVtZCwgaW4gdGhpcyBjYXNlKSB3aGljaCBjYW4gdGhlbiBsb2Fk
DQo+IHRoZSBtb2R1bGVzIGFuZCBtb3VudCB0aGUgdmlydHVhbCBmaWxlc3lzdGVtLg0KPiANCj4g
VGhlcmUgYXBwZWFyIHRvIGJlIHR3byBvcHRpb25zLg0KPiANCj4gMSkgVGhlIFFBIHNjcmlwdHMg
aWdub3JlIGFueSBiaW5mbXRfbWlzYyB1bml0IG1vdW50cyBmYWlsaW5nDQo+IDIpIHN5c3RlbWQg
UlJFQ09NTUVORFMga2VybmVsLW1vZHVsZS1iaW5mbXQtbWlzYw0KPiANCj4gKHRoZSB0aGlyZCBv
cHRpb24gb2YgdGVhY2hpbmcgc3lzdGVtZCBob3cgdG8gcmVjb2duaXNlIHRoaXMgc2l0dWF0aW9u
DQo+IGFuZCByZWZ1c2UgdG8gc3RhcnQgdGhlIHVuaXQgYXBwZWFycyBpbXBvc3NpYmxlKQ0KPiAN
Cg0KSSBob25lc3RseSBsaWtlIHNlY29uZCBvcHRpb24gbW9yZS4gQW5kIHRoZSB0aGlyZCBldmVu
IGJldHRlciA6KSAoc3VyZQ0KY2hhbmdpbmcgdGhlIHRlc3QgdG8gaWdub3JlIGJpbmZtdF9taXNj
IHVuaXQgZnJvbSBzeXN0ZW1jdGwgLS1mYWlsZWQNCm91dHB1dCBjYW4gYmUgZWFzaWx5IGRvbmUs
IGJ1dCBzZWVtcyBsaWtlIGp1c3QgaGlkaW5nIHRoZSBmYWlsIHRvIG1lKS4NCg0KSSBqdXN0IHRl
c3RlZCB0aGF0IHRoZSB0aGlyZCBvcHRpb24gY2FuIGJlIGRvbmUgKGZvciB0aGlzIGNhc2UgYXQg
bGVhc3QpDQpieSBjaGFuZ2luZyBDb25kaXRpb25QYXRoRXhpc3RzPS9wcm9jL3N5cy9mcy9iaW5m
bXRfbWlzYy8gdG8NCkNvbmRpdGlvbkRpcmVjdG9yeU5vdEVtcHR5PS9wcm9jL3N5cy9mcy9iaW5m
bXRfbWlzYy8gZm9yDQpwcm9jLXN5cy1mcy1iaW5mbXRfbWlzYy5hdXRvbW91bnQgdW5pdCBmaWxl
IGFuZCANCiJkZiIgZG9lc24ndCBjb21wbGFpbiBhcyBpdCBkb2Vzbid0IGF0dGVtcHQgdG8gYXV0
b21vdW50IGFueW1vcmUuIE9uIGENCnN5c3RlbSB3aGljaCBkb2VzIGhhdmUgdGhhdCBtb2R1bGUg
bG9hZGVkIHRoZXJlIGFyZSB0d28gZmlsZXMgdGhlcmUgc28NCnRoYXQncyB3aHkgdGhlIGNvbmRp
dGlvbiB3b3Jrcy4NCg0KQ2hlZXJzLA0KU3RlZmFuDQoNCg0KPiAoQ0NpbmcgU3RlZmFuIGZvciBo
aXMgaW5wdXQpDQo+IA0KPiBUbyBiZSBob25lc3QgSSdtIGxlYW5pbmcgdG93YXJkcyAoMSkgcmln
aHQgbm93IGFzIGJpbmZtdF9taXNjIGlzIG9ubHkNCj4gcmVxdWlyZWQgaW4gc3BlY2lmaWMgc2l0
dWF0aW9ucy4NCj4gDQo+IFJvc3MNCg0K

