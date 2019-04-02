Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B42BF7D2D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 22:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1D58118580;
	Wed,  3 Apr 2019 00:27:53 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id TQbuA5W__i8T; Wed,  3 Apr 2019 00:27:51 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id BB12B18579;
	Wed,  3 Apr 2019 00:27:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DC761E077;
	Wed,  3 Apr 2019 00:27:51 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 924BC1E074;
	Wed,  3 Apr 2019 00:27:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  3 Apr 2019 00:27:51 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 864EE2DB;
	Wed,  3 Apr 2019 00:27:51 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 3 Apr 2019 00:27:51 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 3 Apr 2019 00:27:51 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 3 Apr 2019 00:27:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/6] Correct and improve the ARM tunings
Thread-Index: AQHU6YqyrSDnjht+pESghZILTcEnfaYpMCwAgAAukoA=
Date: Tue, 2 Apr 2019 22:27:51 +0000
Message-ID: <bc49fe0baf5e40bd8f2f2134d5616800@XBOX04.axis.com>
References: <cover.1554233389.git.pkj@axis.com>
	<8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
In-Reply-To: <8694f4c6a289db1fe45c24bc1ee9139458e09521.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 0/6] Correct and improve the ARM tunings
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
X-List-Received-Date: Tue, 02 Apr 2019 22:27:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDIgYXByaWwgMjAx
OSAyMjoyNw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAwLzZdIENvcnJlY3QgYW5kIGltcHJvdmUgdGhl
IEFSTSB0dW5pbmdzDQo+IA0KPiBPbiBUdWUsIDIwMTktMDQtMDIgYXQgMjE6MzAgKzAyMDAsIFBl
dGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiBUaGVzZSBwYXRjaGVzIGFyZSBpbnRlbmRlZCB0
byBpbXByb3ZlIHRoZSBBUk0gdHVuaW5ncyBhbmQgY2FtZSBhYm91dA0KPiA+IGFmdGVyIEkgaGFk
IHRvIHN0dWR5IHRoZSB0dW5lIGZpbGVzIGEgbG90IG1vcmUgdGhhbiBJIGZpcnN0IGhhZA0KPiA+
IGFudGljaXBhdGVkLi4uDQo+ID4NCj4gPiBUaGUgZmlyc3QgcGF0Y2ggKGFyY2gtYXJtdjhhLmlu
YzogQ29ycmVjdA0KPiA+IFBBQ0tBR0VfRVhUUkFfQVJDSFNfdHVuZS1hcm12OGEtKikgYXZvaWRz
IG9kZCBhcmNoaXRlY3R1cmVzIHN1Y2ggYXMNCj4gPiAiY3JjIiBhbmQgImNyeXB0byIgdG8gYmUg
aW5jbHVkZWQgaW4gUEFDS0FHRV9FWFRSQV9BUkNIUy4NCj4gPg0KPiA+IFRoZSBmb2xsb3dpbmcg
dGhyZWUgcGF0Y2hlcyAod2hlcmUgaSBoYXZlIHNlbnQgdGhlIGxhdHRlciB0d28gdG8gdGhlDQo+
ID4gbGlzdCBiZWZvcmUpIHJlc3RvcmVzIHRoZSAiYXJtdioiIGZlYXR1cmVzIHRvIFRVTkVfRkVB
VFVSRVMgZm9yIGFsbA0KPiA+IEFSTSBiYXNlZCBTb0NzIGFzIGl0IGRvZXMgbm90IG1ha2Ugc2Vu
c2UgdG8gcmVtb3ZlIHRoZW0gZnJvbSB0aGUgU29DDQo+ID4gc3BlY2lmaWMgdHVuZSBmaWxlcyBq
dXN0IHRvIGRldGVybWluZSB3aGV0aGVyIC1tY3B1IG9yIC1tYXJjaCBzaGFsbA0KPiA+IGJlIHVz
ZWQuIFRoaXMgaXMgYmVjYXVzZSB0aGUgU29DcyBzdGlsbCBzdXBwb3J0IHRoZSBhcm12KiBmZWF0
dXJlcw0KPiA+IHNwZWNpZmllZCBpbiB0aGVpciBUVU5FX0ZFQVRVUkVTIGV2ZW4gaWYgdGhleSBh
bHNvIGhhdmUgbW9yZSBzcGVjaWZpYw0KPiA+IFNvQyB0dW5pbmdzLg0KPiANCj4gSXQgZGVwZW5k
cyBob3cgeW91IHZpZXcgVFVORV9GRUFUVVJFUyBhbmQgd2hhdCB0aGUgcHJlc2VuY2Ugb2YgdGhp
bmdzDQo+IHRoZXJlIGlzIGRlZmluZWQgdG8gbWVhbi4NCg0KVGhlIGFzc3VtcHRpb24gSSBtYWRl
IHdhcyB0aGF0IHRoZSBmZWF0dXJlcyBsaXN0ZWQgaW4gVFVORV9GRUFUVVJFUyANCm1hdGNoZXMg
d2hhdCBmZWF0dXJlcyB0aGUgY29tcGlsZXIvbGlua2VyIHdpbGwgbWFrZSB1c2Ugb2Ygd2hlbiAN
CmJ1aWxkaW5nIHRoZSBjb2RlIGFuZCBzb21ldGhpbmcgdGhhdCBjYW4gYmUgY2hlY2tlZCBieSwg
ZS5nLiwgcmVjaXBlcyANCnRvIGVuYWJsZS9kaXNhYmxlIGZ1bmN0aW9uYWxpdHkgdG8gbWF0Y2gg
dGhpcy4gVGhlcmUgYXJlIGV4YW1wbGVzIG9mIA0KdGhpcyBpbiB0aGUgcmVjaXBlcyBpbiBPRS1D
b3JlLCBlLmcuLCB3aGVyZSBUVU5FX0ZFQVRVUkVTIGlzIGNoZWNrZWQgDQp0byBkZXRlcm1pbmUg
d2hhdCBvcHRpb25zIHRvIHBhc3MgdG8gY29uZmlndXJlLg0KDQpFLmcuLCB3aXRoIERFRkFVTFRU
VU5FIHNldCB0byAiYXJtOTI2ZWpzIiwgVFVORV9GRUFUVVJFUyBleHBhbmRzIHRvIA0KImFybSBh
cm12NSB0aHVtYiBkc3AgYXJtOTI2ZWpzIiAod2l0aCBUaHVkIGFuZCBvbGRlciwgb3Igd2l0aCBt
eSANCnBhdGNoZXMgYXBwbGllZCkuIFRvIG1lIHRoaXMgbWVhbnMgdGhhdCBJIGNhbiBhc3N1bWUg
dGhhdCBJIGNhbiB1c2UgDQphbnl0aGluZyB0aGF0IGlzIHNwZWNpZmljIHRvIGVpdGhlciBvZiB0
aG9zZSBmZWF0dXJlcyB3aGVuIEkgZGVjaWRlIA0Kd2hhdCB0byBidWlsZC4gQW5kIGFsdGhvdWdo
IGFybTkyNmVqcyBpbXBsaWVzIGFybXY1LCBoYXZpbmcgdGhlIA0KbGF0dGVyIGFzIGEgc2VwYXJh
dGUgZmVhdHVyZSBtYWtlcyBpdCBwb3NzaWJsZSB0byB3cml0ZSBhIGdlbmVyaWMgDQp0ZXN0IGZv
ciBhcm12NSB3aXRob3V0IGhhdmluZyB0byBrbm93IHRoZSBleGFjdCBTb0MgYW5kIHdoYXQgaXQg
DQpzdXBwb3J0cy4NCg0KPiAiYXJtdjR0IiBpcyBkZWZpbmVkIGluIHRoZSBhcm0gdHVuZSBmaWxl
cyB0byBtZWFuICJhZGQgLW1hcmNoPWFybXY0dCINCj4gd2hpY2ggaXMgdGhlIGNvbnZlbnRpb24g
dXNlZCB0aHJvdWdob3V0IGFsbCB0aGUgdHVuZSBmaWxlcy4NCg0KSSBmYWlsIHRvIHNlZSB3aGVy
ZSBpdCBzYXlzIHRoYXQgdGhlICJhcm12KiIgZmVhdHVyZXMgb2YgVFVORV9GRUFUVUVTIA0KYXJl
IHRvIGJlIHVzZWQgdG8gc2V0IC1tYXJjaCBhbmQgbm90aGluZyBlbHNlLiBUaGF0IHNlZW1zIGxp
a2UgYSB2ZXJ5IA0Kb2RkIGltcGxpY2F0aW9uIG9mIG9uZSBvZiB0aGUgbWFueSBmZWF0dXJlcyBz
cGVjaWZpZWQgaW4gVFVORV9GRUFUVVJFUy4NCg0KSG93ZXZlciwgd2l0aCBteSBwYXRjaGVzIGFw
cGxpZWQsIHRoZSAiYXJtdioiIGZlYXR1cmVzIHN0aWxsIHNheXMgdG8gDQpzZXQgLW1hcmNoLCB1
bmxlc3MgdGhlcmUgaXMgYWxzbyBhIG1vcmUgc3BlY2lmaWMgdHVuZSBmZWF0dXJlLCBlLmcuLCAN
CiJhcm05MjZlanMiLCB3aGljaCBtZWFucyAtbWNwdSB3aWxsIGJlIHVzZWQgaW5zdGVhZC4gSSBk
b24ndCB0aGluayANCmRlY2lkaW5nIGJldHdlZW4gLW1jcHUgYW5kIC1tYXJjaCBzaG91bGQgYmUg
YmFzZWQgb24gdGhlIGV4aXN0ZW5jZSBvciANCm5vbi1leGlzdGVuY2Ugb2YgYSBnaXZlbiBmZWF0
dXJlIGluIFRVTkVfRkVBVFVSRVMsIGJ1dCByYXRoZXIgb24gdGhlIA0KY29udGV4dC4gVGhpcyBh
bHNvIG1hdGNoZXMgaG93IHRoZSBUVU5FX0ZFQVRVUkVTX3R1bmUtYXJtKiB2YXJpYWJsZXMgDQph
cmUgYmVpbmcgZGVmaW5lZCB3aXRoIG1vcmUgc3BlY2lmaWMgdmFyaWFibGVzIHN1Y2ggYXMgDQpU
VU5FX0ZFQVRVUkVTX3R1bmUtYXJtOTI2ZWpzIGJlaW5nIGRlZmluZWQgYmFzZWQgb24gbW9yZSBn
ZW5lcmljIA0KdmFyaWFibGVzIChUVU5FX0ZFQVRVUkVTX3R1bmUtYXJtdjV0ZSBpbiB0aGlzIGNh
c2UpIGFuZCB0aGVuIGFkZGluZyANCnRoZSBtb3JlIHNwZWNpZmljIGZlYXR1cmUocykuDQoNCj4g
SSdtIHN0aWxsIG5vdCBjb252aW5jZWQgdGhpcyBwYXJ0IG9mIHlvdXIgY2hhbmdlcyBpbXByb3Zl
cyB0aGUNCj4gc2l0dWF0aW9uIGFzIGl0IHRoZW4gYnJlYWtzIGFuZCBjb25mdXNlcyB0aGF0IHNp
dHVhdGlvbi4NCg0KQWNjb3JkaW5nIHRvIG15IHZpZXcgdGhlcmUgaXMgbGVzcyBjb25mdXNpb24g
bm93LiBUVU5FX0ZFQVRVUkVTIHlldCANCmFnYWluIGRlc2NyaWJlcyB0aGUgZmVhdHVyZXMgdGhh
dCBhcmUgc3VwcG9ydGVkLg0KDQo+IEknbSBhbHNvIHdvcnJpZWQgeW91J3JlIHdhbnRpbmcgdGhp
cyBhcyB5b3UgaGF2ZSBjb2RlIGVsc2V3aGVyZSB3aGljaA0KPiBpcyB1c2luZyAiYXJtdlgiIHRo
ZXJlIHRvIG1lYW4gc29tZXRoaW5nIGVsc2U/DQoNCkFjdHVhbGx5IHdlJ3JlIG5vdCB1c2luZyBh
bnkgc3VjaCB0ZXN0cy4gSSBkaWQgdGhlIGluaXRpYWwgcmV3b3JrIA0KYmFzZWQgb24gdGhlIG5v
dGlvbiB0aGF0IHRoZSBjaGFuZ2UgdGhhdCBoYWQgZ29uZSBpbnRvIHRoZSB0dW5pbmcgDQpmaWxl
cyBmZWx0IHdyb25nLCB0ZWFyaW5nIG91dCB0aGUgc3RydWN0dXJlIHRoYXQgd2FzIHByZXZpb3Vz
bHkgDQp0aGVyZSBpbiB0aGUgZGVmaW5pdGlvbnMgb2YgdGhlIFRVTkVfRkVBVFVSRVNfdHVuZS1h
cm0qIHZhcmlhYmxlcywgDQphbmQgaG93IGl0IGhhZCBtZXNzZWQgdXAgbXkgdmlldyBvZiB3aGF0
IHRoZSBmZWF0dXJlcyBpbiANClRVTkVfRkVBVFVSRVMgYXJlIHN1cHBvc2VkIHRvIG1lYW4uIEFu
ZCBhZnRlciBoYXZpbmcgc3R1ZGllZCB0aG9zZSANCmZpbGVzIGEgbG90IG1vcmUsIHRoYXQgaW5p
dGlhbCBub3Rpb24gc3RpbGwgaG9sZHMgdHJ1ZSBmb3IgbWUuDQoNCj4gQ2hlZXJzLA0KPiANCj4g
UmljaGFyZA0KDQovL1BldGVyDQoNCg==

