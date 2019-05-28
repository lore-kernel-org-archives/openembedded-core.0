Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 487887D25F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 07:27:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4S7Q7tw030324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 May 2019 00:26:17 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.163]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Tue, 28 May 2019 00:25:56 -0700
From: "Bai, Haiqing" <Haiqing.Bai@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] make-mod-scripts: Add nostamp flag on
	configure task
Thread-Index: AQHVElZM46JPNLzBtUWha+RBWc5fuaZ/1sWg
Date: Tue, 28 May 2019 07:25:56 +0000
Message-ID: <C2A454FDE6C23F41BD5011E2458C46C9F30CFADA@ALA-MBD.corp.ad.wrs.com>
References: <20190524054915.49751-1-Haiqing.Bai@windriver.com>
	<c44ab1cfbbaa2cb3bbfd6227539a278e7d61b775.camel@linuxfoundation.org>
In-Reply-To: <c44ab1cfbbaa2cb3bbfd6227539a278e7d61b775.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.217]
MIME-Version: 1.0
Subject: Re: [PATCH] make-mod-scripts: Add nostamp flag on configure task
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
X-List-Received-Date: Tue, 28 May 2019 07:27:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29tbWVudHMgYmVsb3csIHRoYW5rcyB5b3VyIHJldmlldy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZ10gDQpTZW50OiAyMDE55bm0NeaciDI15pelIDE6MjkNClRvOiBCYWks
IEhhaXFpbmc7IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCkNjOiBC
cnVjZSBBc2hmaWVsZA0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG1ha2UtbW9kLXNj
cmlwdHM6IEFkZCBub3N0YW1wIGZsYWcgb24gY29uZmlndXJlIHRhc2sNCg0KT24gRnJpLCAyMDE5
LTA1LTI0IGF0IDEzOjQ5ICswODAwLCBIYWlxaW5nIEJhaSB3cm90ZToNCj4gRXJyb3IgYXBwZWFy
cyB3aGlsZSBidWlsZGluZyBvdXQgb2YgdHJlZSBrZXJuZWwgbW9kdWxlDQo+IGFmdGVyIHJlY29t
cGlsaW5nIHRoZSBrZXJuZWw6DQo+IGJpdGJha2UgLWMgY2xlYW5hbGwvY2xlYW5zc3RhdGUgdmly
dHVhbC9rZXJuZWwNCj4gYml0YmFrZSAtYyBjbGVhbmFsbC9jbGVhbnNzdGF0ZSBoZWxsby1tb2QN
Cj4gYml0YmFrZSB2aXJ0dWFsL2tlcm5lbA0KPiBiaXRiYWtlIGhlbGxvLW1vZA0KPiANCj4gRVJS
T1I6IEtlcm5lbCBjb25maWd1cmF0aW9uIGlzIGludmFsaWQuDQo+ICAgICAgICBpbmNsdWRlL2dl
bmVyYXRlZC9hdXRvY29uZi5oIG9yIGluY2x1ZGUvY29uZmlnL2F1dG8uY29uZiBhcmUNCj4gbWlz
c2luZy4NCj4gICAgICAgIFJ1biAnbWFrZSBvbGRjb25maWcgJiYgbWFrZSBwcmVwYXJlJyBvbiBr
ZXJuZWwgc3JjIHRvIGZpeCBpdC4NCj4gZXJyb3I6ICdzdHJ1Y3QgcHRfcmVncycgaGFzIG5vIG1l
bWJlciBuYW1lZCAnZHMnOyBkaWQgeW91IG1lYW4gJ2R4Jz8NCj4gDQo+IG1ha2UtbW9kLXNjcmlw
dHMgbXVzdCBiZSBmb3JjZWQgdG8gcmVidWlsZCBpbiB0aGlzIGNhc2UgdG8gZ2VuZXJhdGUNCj4g
Y29uZmlnIGRhdGEgaW4gJ2tlcm5lbC1idWlsZC1hcnRpZmFjdHMvaW5jbHVkZS9jb25maWcnDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYWlxaW5nIEJhaSA8SGFpcWluZy5CYWlAd2luZHJpdmVyLmNv
bT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMta2VybmVsL21ha2UtbW9kLXNjcmlwdHMvbWFrZS1t
b2Qtc2NyaXB0c18xLjAuYmIgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlLW1vZC1zY3Jp
cHRzL21ha2UtbW9kLQ0KPiBzY3JpcHRzXzEuMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbWFr
ZS1tb2Qtc2NyaXB0cy9tYWtlLW1vZC0NCj4gc2NyaXB0c18xLjAuYmINCj4gaW5kZXggOTdjNThj
NTIzMy4uZjU1MTA0MDcwZCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtl
LW1vZC1zY3JpcHRzL21ha2UtbW9kLXNjcmlwdHNfMS4wLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvbWFrZS1tb2Qtc2NyaXB0cy9tYWtlLW1vZC1zY3JpcHRzXzEuMC5iYg0KPiBAQCAt
MTIsNiArMTIsOCBAQCBTID0gIiR7V09SS0RJUn0iDQo+ICBkb19jb25maWd1cmVbZGVwZW5kc10g
Kz0gInZpcnR1YWwva2VybmVsOmRvX3NoYXJlZF93b3JrZGlyIG9wZW5zc2wtDQo+IG5hdGl2ZTpk
b19wb3B1bGF0ZV9zeXNyb290Ig0KPiAgZG9fY29tcGlsZVtkZXBlbmRzXSArPSAidmlydHVhbC9r
ZXJuZWw6ZG9fY29tcGlsZV9rZXJuZWxtb2R1bGVzIg0KPiAgDQo+ICtkb19jb25maWd1cmVbbm9z
dGFtcF0gPSAiMSINCj4gKw0KPiAgREVQRU5EUyArPSAiYmMtbmF0aXZlIg0KPiAgDQo+ICBFWFRS
QV9PRU1BS0UgPSAiIEhPU1RDQz0iJHtCVUlMRF9DQ30gJHtCVUlMRF9DRkxBR1N9DQo+ICR7QlVJ
TERfTERGTEFHU30iIEhPU1RDUFA9IiR7QlVJTERfQ1BQfSIiDQoNClRoaXMgc291bmRzIGxpa2Ug
YSByZWFsbHkgYmFkIGlkZWEgYW5kIHdpbGwgbWFrZSBhbnl0aGluZyBkZXBlbmRpbmcgb24NCml0
IHJlYnVpbGQgaW4gZXZlcnkgYnVpbGQuDQpbaHFiYWk6ICBBY3R1YWxseSBwYWNrYWdlICdtYWtl
LW1vZC1zY3JpcHRzJyBpcyBhIGJ1aWxkaW5nIHRvb2wgbmVlZGVkIG9ubHkgYnkgZXh0ZXJuYWwg
bW9kdWxlcywgIGlmICdhbnl0aGluZycgICB5b3VyIG1lYW4gaGVyZSBpcyB0aGVzZSBleHRlcm5h
bCAgbW9kdWxlcywgIHRoZW4gdGhlIGFuc3dlciBpcyAneWVzJywNClRoZXNlIGV4dGVybmFsIG1v
ZHVsZXMgZGVwZW5kIG9uICdtYWtlLW1vZC1zY3JpcHRzLicsICAgd2hhdCdzIHRoaXMgcGFja2Fn
ZSBkbyBpcyBhY3R1YWxseSBlcXVhbCB0byAgJ21ha2Ugc2NyaXB0cycuIA0KDQoNCldlIG5lZWQg
dG8gZW5zdXJlIHRoYXQgdGhlc2UgY2xlYW4gY29tbWFuZHMgYXJlIG5vdCBjbGVhbmluZyB0aGlu
Z3Mgb3V0DQpvZiB0aGUgc2hhcmVkIGtlcm5lbCBkaXJlY3RvcnkgdGhhdCB0aGV5IGRvbid0IG93
bi4NCltocWJhaTogU2luY2UgdGhlIHNoYXJlZCBkaXJlY3RvcnkgaXMgJ2tlcm5lbC1idWlsZC1h
cnRpZmFjdHMvaW5jbHVkZS9jb25maWcveHh4Jywga2VybmVsIGlzIHRoZSBvd25lciBvZiBmb2xk
ZXIgYnV0IG5vdCB0aGVzZSBmaWxlcywgICBJIHRoaW5rIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2Ug
Zm9yIGtlcm5lbCB0byBrZWVwcyB0aGVzZSBzdHVmZiB3aGVuIGRvICBjbGVhbi9jbGVhbmFsbCBd
DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=

