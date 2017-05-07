Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1540F601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 May 2017 18:45:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 May 2017 11:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,305,1491289200"; d="scan'208";a="83761615"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
	by orsmga002.jf.intel.com with ESMTP; 07 May 2017 11:45:02 -0700
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.151]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.202]) with mapi id
	14.03.0319.002; Sun, 7 May 2017 19:45:01 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] cross.bbclass: Preserve the bitbake
	configuration
Thread-Index: AQHSxaEkfpzdDN0JQkqsE3IIc8T2RKHpNdmw
Date: Sun, 7 May 2017 18:45:01 +0000
Message-ID: <D3C33C4430ACA6488F343D1125FCCECC382BCB8B@irsmsx110.ger.corp.intel.com>
References: <1493985795-7748-1-git-send-email-amarnath.valluri@intel.com>
	<1493989815.23535.152.camel@linuxfoundation.org>
In-Reply-To: <1493989815.23535.152.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] cross.bbclass: Preserve the bitbake configuration
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
X-List-Received-Date: Sun, 07 May 2017 18:45:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBGcmlk
YXksIE1heSA1LCAyMDE3IDQ6MTAgUE0NCj4gVG86IFZhbGx1cmksIEFtYXJuYXRoIDxhbWFybmF0
aC52YWxsdXJpQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBjcm9zcy5iYmNsYXNz
OiBQcmVzZXJ2ZSB0aGUgYml0YmFrZQ0KPiBjb25maWd1cmF0aW9uDQo+IA0KPiBPbiBGcmksIDIw
MTctMDUtMDUgYXQgMTU6MDMgKzAzMDAsIEFtYXJuYXRoIFZhbGx1cmkgd3JvdGU6DQo+ID4gV2hp
bGUgcHJlcGFyaW5nIHRhcmdldF9saWJkaXIgYW5kIHRhcmdldF9iYXNlX2xpYmRpciB3ZSBzaG91
bGQNCj4gPiBwcmVzZXJ2ZSB0aGUgYml0YmFrZSBjb25maWd1cmF0aW9uIHVzZWQgZm9yICdiYXNl
X2xpYmRpcicgYW5kICdsaWJkaXInDQo+ID4gaW5zdGVhZCBvZiBhc3N1bWluZyAke2Jhc2V8ZXhl
Y31fcHJlZml4LyR7YmFzZWxpYn0sIHdoaWNoIGlzIG5vdCB0cnVlDQo+ID4gaW4gY2FzZSBvZiBt
ZXJnZWQgJy91c3InLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW1hcm5hdGggVmFsbHVyaSA8
YW1hcm5hdGgudmFsbHVyaUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBtZXRhL2NsYXNzZXMv
Y3Jvc3MuYmJjbGFzcyB8IDYgKysrKy0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nl
cy9jcm9zcy5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL2Nyb3NzLmJiY2xhc3MNCj4gPiBpbmRleCA4
NzU3MzAzLi4wMTk1YjI2IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9jcm9zcy5iYmNs
YXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzL2Nyb3NzLmJiY2xhc3MNCj4gPiBAQCAtNTMsOCAr
NTMsMTAgQEAgU1NUQVRFX1NDQU5fQ01EID89DQo+ICIke1NTVEFURV9TQ0FOX0NNRF9OQVRJVkV9
Ig0KPiA+IMKgdGFyZ2V0X2Jhc2VfcHJlZml4IDo9ICIke2Jhc2VfcHJlZml4fSINCj4gPiDCoHRh
cmdldF9wcmVmaXggOj0gIiR7cHJlZml4fSINCj4gPiDCoHRhcmdldF9leGVjX3ByZWZpeCA6PSAi
JHtleGVjX3ByZWZpeH0iDQo+ID4gLXRhcmdldF9iYXNlX2xpYmRpciA9ICIke3RhcmdldF9iYXNl
X3ByZWZpeH0vJHtiYXNlbGlifSINCj4gPiAtdGFyZ2V0X2xpYmRpciA9ICIke3RhcmdldF9leGVj
X3ByZWZpeH0vJHtiYXNlbGlifSINCj4gPiArYmFzZV9saWJkaXJfc3VmZml4IDo9ICIke0BiYXNl
X2xpYmRpci5zcGxpdChiYXNlX3ByZWZpeClbMV0gaWYNCj4gPiBiYXNlX3ByZWZpeCAhPSAiIiBl
bHNlIGJhc2VfbGliZGlyfSINCj4gPiArbGliZGlyX3N1ZmZpeCA6PSAiJHtAbGliZGlyLnNwbGl0
KGV4ZWNfcHJlZml4KVsxXSBpZiBleGVjX3ByZWZpeCAhPQ0KPiA+ICIiIGVsc2UgbGliZGlyfSIN
Cj4gPiArdGFyZ2V0X2Jhc2VfbGliZGlyID0gIiR7dGFyZ2V0X2Jhc2VfcHJlZml4fSR7YmFzZV9s
aWJkaXJfc3VmZml4fSINCj4gPiArdGFyZ2V0X2xpYmRpciA9ICIke3RhcmdldF9leGVjX3ByZWZp
eH0ke2xpYmRpcl9zdWZmaXh9Ig0KPiA+IMKgdGFyZ2V0X2luY2x1ZGVkaXIgOj0gIiR7aW5jbHVk
ZWRpcn0iDQo+IA0KPiBJIHRoaW5rIGJvdGggUm9zcyBhbmQgbXlzZWxmIGhhdmUgZmFpcmx5IHN0
cm9uZyByZXNlcnZhdGlvbnMgYWJvdXQgbWFraW5nDQo+IGNvcmUgY2xhc3MgZmlsZXMgcHJhY3Rp
Y2FsbHkgdW5yZWFkYWJsZSBpbiBwdXJzdWl0IG9mIHRoaXMgIm1lcmdlZCB1c3IiIGdvYWwuDQo+
IA0KPiBXaHkgY2FuJ3QgeW91IHNpbXBseSBhZGQgYSBjb25mL2Rpc3Ryby9pbmNsdWRlL21lcmdl
ZHVzci5pbmMgd2hpY2ggZG9lcw0KPiBzb21ldGhpbmcgbGlrZToNCj4gDQo+IHRhcmdldF9iYXNl
X2xpYmRpcl9jbGFzcy1jcm9zcyA9ICJ4eHgiDQo+IA0KPiA/DQo+IA0KPiBZb3UnZCB0aGVuIGhh
dmUgYSBzaW5nbGUgaW5jbHVkZSBmaWxlIHdoaWNoIGFueW9uZSB3YW50aW5nIHRvIGRvIHRoaXMg
Y2FuDQo+IHNlbGVjdCByYXRoZXIgdGhhbiBjb21wbGljYXRpbmcgZmlsZXMgd2hpY2ggcmVhbGx5
IGRvbid0IG5lZWQgbW9yZQ0KPiBjb21wbGljYXRpb24uDQpXZSBhcmUgdXNpbmcgdGhlIHNpbWls
YXIgY3VzdG9tIGNvbmZpZ3VyYXRpb24gZm9yIGFjaGlldmluZyBtZXJnZWQgL3VzciwgYnV0IGZl
bHQgbGlrZSByZWZlcnJpbmcgYSB1bmRvY3VtZW50ZWQgY2xhc3MgdmFyaWFibGUodGFyZ2V0X2Jh
c2VfbGliZGlyKSBpbiBkaXN0cm8gY29uZmlndXJhdGlvbiBpcyBub3QgcmlnaHQuDQoNCkFuZCB0
aGlzIGZpeCBpcyBub3Qgb25seSBsaW1pdGVkIHRvIG1lcmdlZCB1c3IsIGNyb3NzLmJiY2xhc3Mg
aXMgbm90IHJlc3BlY3RpbmcgdGhlIG1vZGlmaWVkIGJpdGJha2UgY29uZmlndXJhdGlvbihiYXNl
X2xpYmRpcikuIA0KDQotIEFtYXJuYXRoDQo=

