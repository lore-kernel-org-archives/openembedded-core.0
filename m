Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 260B77C740
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 15:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 810E618288;
	Sun, 17 Feb 2019 16:04:46 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id WTtvNaGGidvu; Sun, 17 Feb 2019 16:04:45 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id AB6601814A;
	Sun, 17 Feb 2019 16:04:45 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 986D01E060;
	Sun, 17 Feb 2019 16:04:45 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C8101E057;
	Sun, 17 Feb 2019 16:04:45 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sun, 17 Feb 2019 16:04:45 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 80363413;
	Sun, 17 Feb 2019 16:04:45 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sun, 17 Feb 2019 16:04:45 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Sun, 17 Feb 2019 16:04:45 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 2/3] libc-package.bbclass: Use install utility
	to create directories with right permissions
Thread-Index: AdTEK0xGMZDJ1DQcTvO8sjAtRXL8qQASifoAAJa331A=
Date: Sun, 17 Feb 2019 15:04:45 +0000
Message-ID: <390b6cbcc6ed4789920483803133b986@XBOX04.axis.com>
References: <532d6b9d7e8349699b24514c80ef8be9@XBOX04.axis.com>
	<CAMKF1spgmzAczHO27m5B48UKG6qE0N705C-kTUfTpWMdNBNxLw@mail.gmail.com>
In-Reply-To: <CAMKF1spgmzAczHO27m5B48UKG6qE0N705C-kTUfTpWMdNBNxLw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] libc-package.bbclass: Use install utility to create directories with right permissions
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
X-List-Received-Date: Sun, 17 Feb 2019 15:04:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMTQgZmVicnVhcmkgMjAxOSAxNjo1Ng0KPiBUbzogUGV0
ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV0gW1BBVENIIDIvM10gbGliYy1wYWNrYWdlLmJiY2xhc3M6IFVzZSBpbnN0YWxsDQo+IHV0
aWxpdHkgdG8gY3JlYXRlIGRpcmVjdG9yaWVzIHdpdGggcmlnaHQgcGVybWlzc2lvbnMNCj4gDQo+
IE9uIFdlZCwgRmViIDEzLCAyMDE5IGF0IDEwOjA1IFBNIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8
cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLQ0KPiA+ID4gY29yZS1ib3Vu
Y2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBLaGVtIFJhag0KPiA+ID4g
U2VudDogZGVuIDEyIGZlYnJ1YXJpIDIwMTkgMDY6NDgNCj4gPiA+IFRvOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BB
VENIIDIvM10gbGliYy1wYWNrYWdlLmJiY2xhc3M6IFVzZSBpbnN0YWxsDQo+ID4gPiB1dGlsaXR5
IHRvIGNyZWF0ZSBkaXJlY3RvcmllcyB3aXRoIHJpZ2h0IHBlcm1pc3Npb25zDQo+ID4gPg0KPiA+
ID4gQ291bGQgZml4IGlzc3VlcyB3aGVyZSBkaXJzIHdpdGggd3JvbmcgcGVybWlzc2lvbiBpcyBj
cmVhdGVkIHdpdGggbWtkaXIgLXANCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgbWV0YS9jbGFzc2VzL2xp
YmMtcGFja2FnZS5iYmNsYXNzIHwgMiArLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2Ns
YXNzZXMvbGliYy1wYWNrYWdlLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvbGliYy1wYWNrYWdlLmJi
Y2xhc3MNCj4gPiA+IGluZGV4IDBiNGM2NjZhNzQuLjM0MDI1NjM1Y2UgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9tZXRhL2NsYXNzZXMvbGliYy1wYWNrYWdlLmJiY2xhc3MNCj4gPiA+ICsrKyBiL21ldGEv
Y2xhc3Nlcy9saWJjLXBhY2thZ2UuYmJjbGFzcw0KPiA+ID4gQEAgLTYxLDcgKzYxLDcgQEAgTE9D
QUxFVFJFRVNSQyA/PSAiJHtQS0dEfSINCj4gPiA+ICBkb19wcmVwX2xvY2FsZV90cmVlKCkgew0K
PiA+ID4gICAgICAgdHJlZWRpcj0ke1dPUktESVJ9L2xvY2FsZS10cmVlDQo+ID4gPiAgICAgICBy
bSAtcmYgJHRyZWVkaXINCj4gPiA+IC0gICAgIG1rZGlyIC1wICR0cmVlZGlyLyR7YmFzZV9iaW5k
aXJ9ICR0cmVlZGlyLyR7YmFzZV9saWJkaXJ9ICR0cmVlZGlyLyR7ZGF0YWRpcn0gJHRyZWVkaXIv
JHtsb2NhbGVkaXJ9DQo+ID4gPiArICAgICBpbnN0YWxsIC1kICR0cmVlZGlyLyR7YmFzZV9iaW5k
aXJ9ICR0cmVlZGlyLyR7YmFzZV9saWJkaXJ9ICR0cmVlZGlyLyR7ZGF0YWRpcn0gJHRyZWVkaXIv
JHtsb2NhbGVkaXJ9DQo+ID4NCj4gPiBUaGlzIGRvZXMgbm90IGNoYW5nZSBhbnl0aGluZyAoaW5z
dGFsbCAtZCBhbmQgbWtkaXIgLXAgZG9lcyB0aGUgc2FtZQ0KPiA+IHRoaW5nKS4NCj4gPg0KPiA+
ID4gICAgICAgdGFyIC1jZiAtIC1DICR7TE9DQUxFVFJFRVNSQ30ke2RhdGFkaXJ9IC1wIGkxOG4g
fCB0YXIgLXhmIC0gLUMgJHRyZWVkaXIvJHtkYXRhZGlyfQ0KPiA+ID4gICAgICAgIyB1bnppcCB0
byBhdm9pZCBwYXJzaW5nIGVycm9ycw0KPiA+ID4gICAgICAgZm9yIGkgaW4gJHRyZWVkaXIvJHtk
YXRhZGlyfS9pMThuL2NoYXJtYXBzLypnejsgZG8NCj4gPiA+ICAgICAgICAgICAgICAgZ3Vuemlw
ICRpDQo+ID4gPiAgICAgICBkb25lDQo+ID4gPiAgICAgICB0YXIgLWNmIC0gLUMgJHtMT0NBTEVU
UkVFU1JDfSR7YmFzZV9saWJkaXJ9IC1wIC4gfCB0YXIgLXhmIC0gLUMgJHRyZWVkaXIvJHtiYXNl
X2xpYmRpcn0NCj4gPg0KPiA+IFRoaXMgaXMgd2hlcmUgdGhlIHByb2JsZW0gaGFwcGVucy4gV2hl
biB0aGUgZmlsZXMgYXJlIGNvcGllZCBmcm9tDQo+ID4gJHtMT0NBTEVUUkVFU1JDfSwgdGhlIG93
bmVyc2hpcCBvZiAkdHJlZWRpciR7bG9jYWxlZGlyfSBpcyBjaGFuZ2VkIA0KPiA+IHRvIHRoYXQg
b2YgJHtMT0NBTEVUUkVFU1JDfSR7bG9jYWxlZGlyfS4gSG93ZXZlciwgSSBub3cgcmVhbGl6ZWQg
DQo+ID4gdGhhdCB0aGUgcHJvYmxlbSBtYXkgYmUgZHVlIHRvIHRoZSBmYWN0IHRoYXQgSSBoYXZl
IHVzcm1lcmdlIGVuYWJsZWQgDQo+ID4gaW4gRElTVFJPX0ZFQVRVUkVTLCB3aGljaCBjYXVzZXMg
dGhlIGFib3ZlIGxpbmUgdG8gY29weSB0aGluZ3MgaXQgDQo+ID4gd2FzIG5ldmVyIG1lYW50IHRv
IGNvcHksIGluIHRoaXMgY2FzZSAke0xPQ0FMRVRSRUVTUkN9JHtsb2NhbGVkaXJ9LiANCj4gPiBJ
IHRyaWVkIHRvIGp1c3QgcmVtb3ZlIHRoZSBsaW5lIGFsdG9nZXRoZXIgYW5kIHRoZW4gaXQgYnVp
bHQganVzdCANCj4gPiBmaW5lLiBCdXQgSSBkbyBub3Qga25vdyB3aGF0IHRoZSBjb25zZXF1ZW5j
ZXMgYXJlIG9mIHJlbW92aW5nIGl0Li4uDQoNCkl0IHR1cm5lZCBvdXQgdGhhdCB0aGUgY29uc2Vx
dWVuY2UgaXMgdGhhdCBpZiBvbmUgYWN0dWFsbHkgZG9lcyB1c2UgcWVtdSANCnRvIGdlbmVyYXRl
IHRoZSBsb2NhbGUgZmlsZXMsIHRoZW4gaXQgZmFpbHMgd2l0aG91dCB0aGF0IGxpbmUuIEhvd2V2
ZXIsIA0Kc2luY2UgcWVtdSBpcyBub3QgdXNlZCBieSBkZWZhdWx0IGZvciB0aGlzIHNpbmNlIHF1
aXRlIGEgbG9uZyB0aW1lIGFnbywgDQppdCBpcyBub3QgbmVlZGVkIGluIHRoZSBub3JtYWwgY2Fz
ZS4NCiANCj4gPiBJIGd1ZXNzIGl0IGlzIHJlbGF0ZWQgdG8gc2V0dGluZyB1cCBhbiBlbnZpcm9u
bWVudCBmb3IgcWVtdSB0byBydW4gDQo+ID4gaW4sIGJ1dCBzaW5jZSB0aGF0IHNlZW1zIHRvIHdv
cmsgZmluZSB3aXRob3V0IHRoZSBmaWxlcyBjb3BpZWQgYnkgDQo+ID4gdGhlIGFib3ZlIGxpbmUs
IG1heWJlIGl0IGlzIG5vdCBuZWVkZWQ/IE9yIG1heWJlIGl0IGlzIGp1c3Qgbm90IA0KPiA+IG5l
ZWRlZCB3aGVuIGhhdmluZyB1c3JtZXJnZSBpbiBESVNUUk9fRkVBVFVSRVM/IEkgdHJpZWQgdG8g
DQo+ID4gYmFja3RyYWNrIGl0IHRocm91Z2ggdGhlIGNvbW1pdCBsb2dzLCBidXQgaXQgd2FzIGlu
dHJvZHVjZWQgd2l0aCB0aGUNCj4gPiBkb19wcmVwX2xvY2FsZV90cmVlKCkgZnVuY3Rpb24sIHNv
IG5vIGhlbHAgdGhlcmUuDQo+IA0KPiBJIHdvbmRlciBpZiB3ZSBzaG91bGQgdXNlIC0tcHJlc2Vy
dmUgb3B0aW9uIHRvIHRhciAteGYgY2FsbCBoZXJlIGZvcg0KPiBtYWtpbmcgaXQgZXhwbGljaXQu
DQoNCkkgaGF2ZSBhZGRlZCBhIHBhdHRlcm4gdG8gdGhlIHRhciBjb21tYW5kIHRoYXQgdW5wYWNr
cyB0aGUgZmlsZXMgc28gDQpvbmx5IHRoZSBmaWxlcyB0aGF0IGFyZSBuZWVkZWQgYnkgcWVtdSBh
cmUgdW5wYWNrZWQgKHNlZSB0aGUgcGF0Y2ggDQpzZXJpZXMgSSBqdXN0IHNlbnQpLiBUaGF0IHNo
b3VsZCBhdm9pZCB0aGUgcHJvYmxlbS4NCg0KSG93ZXZlciwgSSB3b25kZXIgaWYgYW55b25lIGFj
dHVhbGx5IHNldHMgDQpMT0NBTEVfR0VORVJBVElPTl9XSVRIX0NST1NTLUxPQ0FMRURFRiB0byAw
IChpdCBpcyAxIGJ5IGRlZmF1bHQpLCBhbmQgDQp1c2VzIHFlbXUgdG8gZ2VuZXJhdGUgdGhlIGxv
Y2FsZSBmaWxlcz8gSXQgdGFrZXMgcXVpdGUgYSBsb3QgbG9uZ2VyIA0KKGZvdXIgdGltZXMgb24g
bXkgbWFjaGluZSwgdG90YWxpbmcgbmVhcmx5IGhhbGYgYW4gaG91cikuIE90aGVyd2lzZSwgDQpp
ZiB3ZSByZW1vdmVkIHRoYXQsIHRoZSBjb2RlIGNvdWxkIGJlIHNpbXBsaWZpZWQgYW5kIGF2b2lk
IHRoZSBjb3B5aW5nIA0Kb2YgdGhlc2UgZmlsZXMgaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQo+ID4g
PiAtLQ0KPiA+ID4gMi4yMC4xDQo+ID4NCj4gPiAvL1BldGVyDQoNCi8vUGV0ZXINCg0K

