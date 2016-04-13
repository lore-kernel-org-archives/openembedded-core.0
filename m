Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93928607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 15:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5B6B018136;
	Wed, 13 Apr 2016 17:14:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id VHlKZzu6V4bE; Wed, 13 Apr 2016 17:14:10 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 47081180D4;
	Wed, 13 Apr 2016 17:14:10 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 028341611;
	Wed, 13 Apr 2016 17:14:10 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id EB81B766;
	Wed, 13 Apr 2016 17:14:09 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id E9870109D;
	Wed, 13 Apr 2016 17:14:09 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Wed, 13 Apr 2016 17:14:09 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%22]) with mapi id
	15.00.1156.000; Wed, 13 Apr 2016 17:14:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Thread-Topic: [OE-core] [PATCHv2 1/1] Revert "useradd.bbclass: remove
	user/group created by the package in clean* task"
Thread-Index: AQHRlMs4Q4aNfnCqO02M11Hc7D8r4J+GZ5oAgAAl/qCAARAAgIAAKRdQ
Date: Wed, 13 Apr 2016 15:14:09 +0000
Message-ID: <5715165f841f46d0a50fb951acfbf0ac@XBOX02.axis.com>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
	<1460472857.9308.63.camel@linuxfoundation.org>
	<CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
	<4550e71bd1f24135a2f6978294e25f94@XBOX02.axis.com>
	<1460545515.9308.85.camel@linuxfoundation.org>
In-Reply-To: <1460545515.9308.85.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Wed, 13 Apr 2016 15:14:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiAxMyBh
cHJpbCAyMDE2IDEzOjA1DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQ7IE90YXZpbyBTYWx2YWRv
cg0KPiBDYzogT0UgQ29yZSAob3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZykNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0h2MiAxLzFdIFJldmVydCAidXNlcmFk
ZC5iYmNsYXNzOiByZW1vdmUNCj4gdXNlci9ncm91cCBjcmVhdGVkIGJ5IHRoZSBwYWNrYWdlIGlu
IGNsZWFuKiB0YXNrIg0KPiANCj4gSSBhbSBwcmV0dHkgZnJ1c3RyYXRlZCB3aXRoIHRoaXMgdGhy
ZWFkLiBUaGUgcmVhc29ucyBhcmUgcGVyaGFwcyBub3QNCj4gaW1tZWRpYXRlbHkgb2J2aW91cyB0
aG91Z2guDQo+IA0KPiBUaGUgaXNzdWUgaXMgdGhhdCB0aGVyZSBhcmUgb25seSBhIGxpbWl0ZWQg
bnVtYmVyIG9mIHBlb3BsZSB3aG8NCj4gYWN0dWFsbHkgZGl2ZSBpbiBhbmQgdHJ5IGFuZCBmaXgg
c29tZSBvZiB0aGUgdW5kZXJseWluZyAiY29yZQ0KPiBhcmNoaXRlY3R1cmUiIGJ1Z3MuIFRoZXJl
IGlzIHdoYXQgSSBiZWxpZXZlIHRvIGJlIGEgcHJldHR5IGdvb2QgcGF0Y2gNCj4gaGVyZSB3aGlj
aCBkb2VzIGZpeCByZWFsIHdvcmxkIGlzc3VlcyB3aGljaCBoYXZlIGJlZW4gcmVwb3J0ZWQgaW50
byB0aGUNCj4gYnVnemlsbGEgKGl0cyByZWxhdGVkIHRvIGF0IGxlYXN0IHR3byBidWcgcmVwb3J0
cykuIEFzIHN1Y2ggaXQgaGFzIGJlZW4NCj4gc2VlbiBhcyBhIGJ1Z2ZpeC4gSXRzIG5vdyBjbGVh
ciBpdCBkb2VzIGhhdmUgc29tZSBzaWRlIGVmZmVjdHMgd2hpY2gNCj4gd2VyZW4ndCBlbnZpc2Fn
ZWQsIHNvbWUgY2F1c2luZyBpc3N1ZXMgZm9yIGEgc21hbGwgbnVtYmVyIG9mIG1ldGEtb2UNCj4g
cmVjaXBlcywgdGhlIG90aGVycyBicmVha2luZyBhIGNvbXBhbmllcyBpbnRlcm5hbCBjb2RlLg0K
PiANCj4gT3RhdmlvIHdhbnRzIGl0IGRlZmVycmVkIHRvIDIuMiwgUGV0ZXIgd2FudHMgaXQgYWJh
bmRvbmVkIGVudGlyZWx5Lg0KPiANCj4gSWYgSSByZXZlcnQgdGhpcywgUGV0ZXIgaXMgdGhlbiBo
YXBweSBhbmQgaGFzIHplcm8gaW5jZW50aXZlIHRvIGRvDQo+IGFueXRoaW5nIGZ1cnRoZXIuIFRo
ZSBwcmVzc3VyZSBpcyBzdGlsbCBvbiB0aGUgcmVvcGVuZWQgYnVncyB0byB0cnkgYW5kDQo+IGZp
eCB0aGlzIHNvbWVob3cgYW5kIGZhbGxzIGJhY2sgdG8gdGhlIHVzdWFsIHN1c3BlY3RzLiBUaGVy
ZSBpcyBhIHJlYWwNCj4gd29ybGQgdXNhYmlsaXR5IHByb2JsZW0gdGhlcmUuDQoNCkhvbGQgeW91
ciBob3JzZXMuIEkgZGVmaW5pdGVseSBzZWUgdGhlIHByb2JsZW0gdGhlIGNoYW5nZSB0cmllZCB0
byANCmFkZHJlc3MgYXMgb25lIHRoYXQgbmVlZHMgdG8gYmUgZml4ZWQsIGFuZCBJIGFtIGFscmVh
ZHkgbG9va2luZyBhdCANCmhvdyB0byBzb2x2ZSB0aGlzIHByb3Blcmx5IChjdXJyZW50bHkgYmFz
ZWQgb24gbXkgc2Vjb25kIHN1Z2dlc3RlZCANCnNvbHV0aW9uKS4gSG93ZXZlciwgSSBkbyBub3Qg
a25vdyBpZiBJIGNhbiBmaXggaXQgaW4gdGltZSBmb3IgS3JvZ290aC4gDQpXaGljaCBpcyB3aHkg
SSBhZ3JlZSB3aXRoIE90YXZpbyB0aGF0IHRoZSBjaGFuZ2Ugd2FzIGludHJvZHVjZWQgdG9vIA0K
bGF0ZSBpbiB0aGUgcHJvY2VzcywgZXNwZWNpYWxseSBhcyBpdCBjYXVzZXMgYnJlYWthZ2UgZm9y
IGV4aXN0aW5nIA0KdXNlcnMuDQoNCj4gSW4gYSBzaW5nbGUgaXNvbGF0ZWQgY2FzZSwgZmluZSwg
d2UnZCBmaWd1cmUgYSB3YXkgdGhyb3VnaCB0aGlzLiBJDQo+IHRoaW5rIEknbSBzbyBmcnVzdHJh
dGVkIGFzIHdlIHNlZSB0aGlzIGFsbCB0aGUgdGltZS4gTWFraW5nIGEgY2hhbmdlIHRvDQo+IHRo
ZSBjb3JlIGFyY2hpdGVjdHVyZSBpcyBoYXJkIGFuZCBnZXRzIGV2ZXIgaGFyZGVyLCB0aGVuIHdl
IHdvbmRlciB3aHkNCj4gd2UgZG9uJ3QgaGF2ZSBjb250cmlidXRvcnMuIFBhcnQgb2YgdGhpcyBp
cyBoYXZpbmcgc28gbWFueSBkaWZmZXJlbnQNCj4gd29ya2Zsb3dzIGFuZCBjb3JuZXIgY2FzZXMu
DQo+IA0KPiBJIGhhdmUgcHVzaGVkIHZlcnkgaGFyZCB0byBoYXZlIG1vcmUgdGVzdCBjYXNlcywg
dGhlbiBpdHMgZWFzaWVyIHRvDQo+IGRldGVybWluZSBpZiBhIHBhdGNoIGNhdXNlcyByZWdyZXNz
aW9ucy4gQWdhaW4gdGhvdWdoLCBmZXcgcGVvcGxlIGFyZQ0KPiBjb250cmlidXRpbmcgdG8gdGhl
bSBvdXRzaWRlIHRoZSB1c3VhbCBzdXNwZWN0cy4NCg0KSGVyZSBJIG11c3Qgc2hvdyBteSBsYWNr
IG9mIGtub3dsZWRnZS4gSG93IGFuZCB3aGVyZSBzaG91bGQgSSBnbyBhYm91dCANCmFkZGluZyBh
IHJlZ3Jlc3Npb24gdGVzdCB0aGF0IHZlcmlmaWVzIHRoZSBzdXBwb3J0IGZvciB0aGF0IG11bHRp
cGxlIA0KcmVjaXBlcyBjYW4gYWRkIHRoZSBzYW1lIHVzZXIvZ3JvdXA/IFNpbmNlIHRoaXMgZG9l
cyBub3QgdGVzdCBhIA0Kc3BlY2lmaWMgcmVjaXBlLCBidXQgcmF0aGVyIGEgcGFydCBvZiB0aGUg
YnVpbGQgZnJhbWV3b3JrLCBJIGRvIG5vdCANCmtub3cgaWYsIGUuZy4sIHB0ZXN0IGlzIGFwcGxp
Y2FibGUgKG9mIHdoaWNoIEkgaGF2ZSBubyBleHBlcmllbmNlIA0KZWl0aGVyKS4NCg0KPiBJJ20g
dGhlcmVmb3JlIHN0YXJ0aW5nIHRvIHRoaW5rIHRoZSBjb3JyZWN0IGFuc3dlciB0byB0aGlzIHRo
cmVhZCBpcw0KPiBzaW1wbHkgdGhpczoNCj4gDQo+IFRoZSBwYXRjaCBkb2Vzbid0IGJyZWFrIGFu
eSBvZiB0aGUgY3VycmVudCByZWdyZXNzaW9uIHRlc3RzLiBJZiB5b3UNCj4gaGF2ZSB1c2UgY2Fz
ZXMgbGlrZSB0aGlzIHlvdSBjYXJlIGFib3V0LCB5b3UgcmVhbGx5IHNob3VsZCBtYWtlIHN1cmUg
d2UNCj4gaGF2ZSB0ZXN0IGNvdmVyYWdlIGZvciB0aGVtLCBlbHNlIHlvdSBydW4gdGhlIHJpc2sg
b2YgZXhhY3RseSB0aGUNCj4gcHJvYmxlbSB3ZSBoYXZlIGhlcmUuDQo+IA0KPiBJIGhhdmVuJ3Qg
aG9uZXN0bHkgZGVjaWRlZCB3aGF0IHRvIGRvIGJ1dCB0aGlzIGxhdHRlciBjb25jbHVzaW9uIGlz
DQo+IHZlcnkgdGVtcHRpbmcgZnJvbSB3aGVyZSBJJ20gc2l0dGluZy4uLg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==

