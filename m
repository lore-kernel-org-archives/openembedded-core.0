Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 200A76FFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 17:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AC65318103;
	Tue, 12 Apr 2016 19:28:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bpb0NJCQy6Nc; Tue, 12 Apr 2016 19:28:17 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id D452E180EB;
	Tue, 12 Apr 2016 19:28:17 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id BE26D1D5;
	Tue, 12 Apr 2016 19:28:17 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id B313E15CF;
	Tue, 12 Apr 2016 19:28:17 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id B0B8D1052;
	Tue, 12 Apr 2016 19:28:17 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Tue, 12 Apr 2016 19:28:17 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Tue, 12 Apr 2016 19:28:17 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%22]) with mapi id
	15.00.1156.000; Tue, 12 Apr 2016 19:28:17 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCHv2 1/1] Revert "useradd.bbclass: remove
	user/group created by the package in clean* task"
Thread-Index: AQHRlMs4Q4aNfnCqO02M11Hc7D8r4J+GZ5oAgAAl/qA=
Date: Tue, 12 Apr 2016 17:28:17 +0000
Message-ID: <4550e71bd1f24135a2f6978294e25f94@XBOX02.axis.com>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
	<1460472857.9308.63.camel@linuxfoundation.org>
	<CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
In-Reply-To: <CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Apr 2016 17:28:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBPdGF2aW8gU2FsdmFkb3IgW21h
aWx0bzpvdGF2aW8uc2FsdmFkb3JAb3NzeXN0ZW1zLmNvbS5icl0NCj4gU2VudDogZGVuIDEyIGFw
cmlsIDIwMTYgMTg6MzYNCj4gVG86IFJpY2hhcmQgUHVyZGllDQo+IENjOiBQZXRlciBLamVsbGVy
c3RlZHQ7IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+
IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIdjIgMS8xXSBSZXZlcnQgInVzZXJhZGQuYmJj
bGFzczogcmVtb3ZlDQo+IHVzZXIvZ3JvdXAgY3JlYXRlZCBieSB0aGUgcGFja2FnZSBpbiBjbGVh
biogdGFzayINCj4gDQo+IE9uIFR1ZSwgQXByIDEyLCAyMDE2IGF0IDExOjU0IEFNLCBSaWNoYXJk
IFB1cmRpZQ0KPiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+
ID4gT24gVHVlLCAyMDE2LTA0LTEyIGF0IDE1OjE4ICswMjAwLCBQZXRlciBLamVsbGVyc3RlZHQg
d3JvdGU6DQo+ID4+IFJlbW92YWwgb2YgdXNlcnMvZ3JvdXAgd2hlbiBjbGVhbnNzdGF0aW5nIGEg
cmVjaXBlIGFzIGltcGxlbWVudGVkIGhlcmUNCj4gPj4gdG90YWxseSBicmVha3Mgd2hlbiBtdWx0
aXBsZSByZWNpcGVzIGluc3RhbGwgdGhlIHNhbWUgdXNlci9ncm91cHMuDQo+ID4+DQo+ID4+IFRo
aXMgcmV2ZXJ0cyBjb21taXQgYjUzMDRjZTQzODY2NmE3NDE4NzQ2ZjRkZGQzMjcwM2FlMzE4ODA4
OS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5r
amVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgbWV0YS9jbGFzc2VzL3NzdGF0
ZS5iYmNsYXNzICB8ICA1IC0tLS0tDQo+ID4+ICBtZXRhL2NsYXNzZXMvdXNlcmFkZC5iYmNsYXNz
IHwgMjkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMzQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBUaGlzIGlzIG9uZSBvZiB0aGVzZSBzaXR1YXRp
b25zIHdoZXJlIHdlIGNhbid0IHdpbi4NCj4gPg0KPiA+IFdpdGhvdXQgdGhpcyBjb2RlLCB0aGVy
ZSBpcyBubyB3YXkgdG8gY2xlYW4gdXAgdGhlc2UgdXNlcnMgb3V0IHRoZQ0KPiA+IHN5c3Jvb3Qu
IEhhdmluZyB0byB0ZWxsIHBlb3BsZSB0byAid2lwZSBUTVBESVIiIHdoZW4gdGhlIHBhcmFtZXRl
cnMNCj4gPiB1c2VkIHRvIGNyZWF0ZSBhIHVzZXIgY2hhbmdlIGZvciBleGFtcGxlIGlzIHJhdGhl
ciBiYWQuIEl0IGFsc28gaGFzIGJhZA0KPiA+IGltcGxpY2F0aW9ucyBmb3IgYnVpbGQgZGV0ZXJt
aW5pc20gYW5kIHRoZSBleHBlY3RhdGlvbiB0aGF0IGEgImNsZWFuIg0KPiA+IHVuZG9lcyB0aGUg
Y2hhbmdlcyBhIHJlY2lwZSBtYWtlcy4NCg0KV2VsbCwgYnVpbGQgZGV0ZXJtaW5pc20gaXMgYWxz
byBicm9rZW4gd2hlbiBpdCBjb21lcyB0byBjcmVhdGluZyANCnVzZXJzIGFuZCBncm91cHMgaWYg
dHdvIHJlY2lwZXMgdHJpZXMgdG8gY3JlYXRlIHRoZSBzYW1lIHVzZXIgKG9yIA0KZ3JvdXApIHdp
dGggZGlmZmVyZW50IGRlZmluaXRpb25zLCBzaW5jZSB0aGUgZmlyc3QgcmVjaXBlIHRoYXQgDQpo
YXBwZW5zIHRvIGJlIGluc3RhbGxlZCB3aW5zLi4uIA0KDQpJbiBvdXIgY2FzZSB3ZSBoYXZlIHNv
bHZlZCB0aGlzIGJ5IHVzaW5nIHRoZSB1c2VyYWRkLXN0YXRpY2lkcy5iYmNsYXNzLCANCndoaWNo
IGFsbG93cyB1cyB0byBoYXZlIGNvbW1vbiBkZWZpbml0aW9ucyBmb3IgdGhlIHVzZXJzLCBpbiBh
ZGRpdGlvbiANCnRvIG9ubHkgdXNlIEdST1VQTUVNU19QQVJBTSB0byBhZGQgdXNlcnMgdG8gZ3Jv
dXBzLiBCdXQgdGhlcmUgc2hvdWxkIA0KcmVhbGx5IGJlIHNvbWUgUUEgd2FybmluZy9lcnJvciB0
byBjYXRjaCB0aGlzIGZyb20gaGFwcGVuaW5nLi4uDQoNCj4gPiBIYXZlIHdlIGV2ZXIgZG9jdW1l
bnRlZCB3ZSBzdXBwb3J0IHRoZSBzYW1lIHVzZXIgYmVpbmcgY3JlYXRlZCBieQ0KPiA+IG11bHRp
cGxlIHJlY2lwZXM/DQoNCkkgYW0gcHJldHR5IHN1cmUgeW91IGhhdmUgbm90IGRvY3VtZW50ZWQg
dGhhdCBpdCBpcyBOT1Qgc3VwcG9ydGVkLi4uIA0KQmVjYXVzZSBpZiBpdCB3YXMgbm90IHN1cHBv
cnRlZCwgdGhlbiBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgZXJyb3JzIA0KaWYgdHdvIHJlY2lwZXMg
dHJpZWQgdG8gaW5zdGFsbCB0aGUgc2FtZSB1c2VyL2dyb3VwLiBBbmQgSSBjYW5ub3QgDQpzZWUg
dGhlIGxvZ2ljIGJlaGluZCBub3QgYWxsb3dpbmcgaXQgKGV4Y2VwdCBiZWNhdXNlIGl0IG1ha2Vz
IGl0IA0KaGFyZCB0byB1bmluc3RhbGwgdXNlcnMgYW5kIGdyb3VwcyksIGJlY2F1c2UgaWYgYSBw
YWNrYWdlIG5lZWRzIGEgDQp1c2VyL2dyb3VwLCB0aGVuIG9mIGNvdXJzZSBpdCBzaG91bGQgYmUg
YWxsb3dlZCB0byBtYWtlIHN1cmUgdGhlIA0KdXNlci9ncm91cCBleGlzdHMuLi4NCg0KPiA+IEkn
bSBvcGVuIHRvIHByb3Bvc2FscyBhYm91dCBob3cgdG8gZml4IHRoaXMgYnV0IGFuIG91dHJpZ2h0
IHJldmVydA0KPiA+IGRvZXNuJ3Qgc2VlbSBsaWtlIHRoZSByaWdodCB0aGluZyB0byBkby4gTWFr
aW5nIGl0IG9wdGlvbmFsIHNvIHlvdSBjYW4NCj4gPiBkaXNhYmxlIGl0IGZvciB5b3VyIG11bHRp
cGxlIHJlY2lwZXMgY2FzZSB3b3VsZCBwZXJoYXBzIGJlIGEgYmV0dGVyDQo+ID4gb3B0aW9uIGZv
ciBleGFtcGxlLg0KDQpNYWtpbmcgaXQgYSBjb25maWd1cmF0aW9uIG9wdGlvbiBkb2VzIG5vdCBz
b3VuZCBsaWtlIGEgZ29vZCBpZGVhIA0KYmVjYXVzZSBoYXZpbmcgbXVsdGlwbGUgcmVjaXBlcyBp
bnN0YWxsIHRoZSBzYW1lIHVzZXIvZ3JvdXAgY2FuIGxlYWQgDQp0byBidWlsZCBlcnJvcnMgYW5k
IHRoYXQgaXMgbm90IHNvbWV0aGluZyB5b3Ugc2hvdWxkIG5lZWQgdG8gY29uZmlndXJlIA0KYXJv
dW5kLg0KDQpPbmUgd2F5IHRvIHNvbHZlIHRoZSBwcm9ibGVtIG9mIGJvdGggY3JlYXRpbmcgdXNl
cnMvZ3JvdXBzIGFuZCBiZWluZyANCmFibGUgdG8gcmVtb3ZlIHRoZW0gaW4gZGV0ZXJtaW5pc3Rp
YyB3YXlzIHdvdWxkIGJlIHRvIG9ubHkgYWxsb3cgdGhlbSANCnRvIGJlIGNyZWF0ZWQgZnJvbSBz
cGVjaWFsIHVzZXIvZ3JvdXAgcmVjaXBlcy4gVGhlbiB0aGUgbm9ybWFsIA0KZGVwZW5kZW5jeSBo
YW5kbGluZyB3b3VsZCBtYWtlIHN1cmUgdGhleSBhcmUgaW5zdGFsbGVkIGFuZCByZW1vdmVkIGFz
IA0KbmVlZGVkLiBUaGUgZHJhd2JhY2sgb2YgY291cnNlIHdvdWxkIGJlIGFsbCB0aGUgZXh0cmEg
cGFja2FnZXMgbmVlZGVkIA0KdG8gY3JlYXRlIHVzZXJzIGFuZCBncm91cHMgKHdoaWNoIGluIG91
ciBjYXNlIHdvdWxkIGJlIGEgY29uc2lkZXJhYmxlIA0KbnVtYmVyIG9mIHBhY2thZ2VzKS4NCg0K
QW4gYWx0ZXJuYXRpdmUgc29sdXRpb24gd291bGQgYmUgdG8gY3JlYXRlIHBhY2thZ2Ugc3BlY2lm
aWMgZmlsZXMgDQpzb21ld2hlcmUgaW4gdGhlIHN5c3Jvb3Qgd2hpY2gga2VlcCB0cmFjayBvZiB3
aGF0IHVzZXJzIGFuZCBncm91cHMgYSANCnBhcnRpY3VsYXIgcGFja2FnZSBoYXMgY3JlYXRlZCwg
aS5lLiwgc29tZXRoaW5nIGxpa2UgDQoidXNlcnMvc3lzdGVtZC10aW1lc3luYy9zeXN0ZW1kIiB3
aGljaCB3b3VsZCBiZSBjcmVhdGVkIGJ5IHRoZSBzeXN0ZW1kIA0KcGFja2FnZSB3aGVuIGl0IGNy
ZWF0ZXMgdGhlIHN5c3RlbWQtdGltZXN5bmMgdXNlci4gVGhhdCB3YXkgaXQgd291bGQgDQpiZSBl
YXN5IHRvIG9ubHkgcmVtb3ZlIHRoZSBzeXN0ZW1kLXRpbWVzeW5jIHVzZXIgd2hlbiANCiJ1c2Vy
cy9zeXN0ZW1kLXRpbWVzeW5jIiBpcyBlbXB0eS4gQSBiZW5lZml0IG9mIHRoaXMgc29sdXRpb24g
aXMgdGhhdCANCml0IHdvdWxkIG9ubHkgcmVxdWlyZSBjaGFuZ2VzIHRvIHVzZXJhZGQuYmJjbGFz
cyBzbyBpdCBjYW4gYmUgDQppbXBsZW1lbnRlZCB3aXRob3V0IGhhdmluZyB0byBjaGFuZ2UgYW55
IHJlY2lwZXMuIEEgbWlub3IgZHJhd2JhY2sgaXMgDQp0aGF0IGl0IHdvdWxkIG5vdCBzb2x2ZSB0
aGUgcHJvYmxlbSBvZiBkaWZmZXJlbnQgcmVjaXBlcyBjcmVhdGluZyB0aGUgDQpzYW1lIHVzZXIg
ZGlmZmVyZW50bHkuDQoNCj4gSSBhbSBub3QgYWdhaW5zdCB0aGUgY2hhbmdlIGJ5IHRoZSB0aW1p
bmc7IGl0IHNob3VsZCBiZSBtZXJnZWQgaW4NCj4gbWFzdGVyIGFzIHNvb24gaXQgaXMgb3BlbiBm
b3IgMi4yIHdvcmsuDQoNCkkgaGF2ZSB0byBhZ3JlZSB3aXRoIHRoaXMuIEFib3ZlIGFyZSB0d28g
c29sdXRpb25zIG9uIGhvdyB0byBtYWtlIA0KdGhpcyB3b3JrLCBidXQgZG9pbmcgaXQgYXQgdGhp
cyBzdGFnZSBvZiB0aGUgcmVsZWFzZSBzY2hlZHVsZSBpcyANCnByb2JhYmx5IGFza2luZyBhIGJp
dCBtdWNoIChlc3BlY2lhbGx5IHRoZSBmaXJzdCBzb2x1dGlvbikuLi4NCg0KLy9QZXRlcg0KDQo=

