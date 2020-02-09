Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED866060A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 06:05:19 +0000 (UTC)
IronPort-SDR: +oC7io5xoAJbQu9OU3/nOHnj/u8z1OT7LnrAFFZHDNyxtKCGyW7Ou7pGsucslItjLEndwX/8m+
	ssN5JUtzNzG0zsW2LT0UovrTHdAIKbm9HN4LLpQklxGbXfBuu8FQqC5rWuQVuqFBqYK82HYGTa
	JkGc0tkB5NDdb7OGYplAKlpDJZenCKeZTHcn/euYhRTqYxJTZ6MQgxbZe8VN+lgvzj4AddzG9E
	0qdNMbCULX3ZqNFJ3OcIkiHF9voRFG3YTTnVQkAq6AeNwQAmw5kGhouJilCf/TH9GBcU0eTwMT
	v+E=
X-IronPort-AV: E=Sophos;i="5.70,420,1574118000"; 
   d="scan'208";a="5082200"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Thread-Topic: [OE-core] [OE-Core][PATCH] rootfs: Make BUILDNAME a weak default
	in reproducible_build_simple
Thread-Index: AQHV3diSdwFFEc9j1UCE9OFDquN7sagSYb0A
Date: Sun, 9 Feb 2020 06:05:18 +0000
Message-ID: <9fa587c116f94151a80e97e14c678e1e@XBOX03.axis.com>
References: <20200118054107.101203-1-alex.kiernan@gmail.com>
	<9242b01969234918b10a8d1c2f494590@XBOX03.axis.com>
	<CAO5Uq5RQ0-X48v_B1CdvCOem14uuZ_4GjyJmfmhtYDP-8A6hWQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5RQ0-X48v_B1CdvCOem14uuZ_4GjyJmfmhtYDP-8A6hWQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs: Make BUILDNAME a weak default in reproducible_build_simple
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
X-List-Received-Date: Sun, 09 Feb 2020 06:05:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEtpZXJuYW4gPGFsZXgu
a2llcm5hbkBnbWFpbC5jb20+DQo+IFNlbnQ6IGRlbiA3IGZlYnJ1YXJpIDIwMjAgMTg6MDQNCj4g
VG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBD
Yzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtPRS1Db3JlXVtQQVRDSF0gcm9vdGZzOiBNYWtlIEJVSUxETkFNRSBhIHdl
YWsNCj4gZGVmYXVsdCBpbiByZXByb2R1Y2libGVfYnVpbGRfc2ltcGxlDQo+IA0KPiBPbiBGcmks
IEZlYiA3LCAyMDIwIGF0IDQ6MjcgUE0gUGV0ZXIgS2plbGxlcnN0ZWR0DQo+IDxwZXRlci5ramVs
bGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmUtDQo+ID4gPiBib3VuY2VzQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4IEtpZXJuYW4NCj4gPiA+IFNlbnQ6
IGRlbiAxOCBqYW51YXJpIDIwMjAgMDY6NDENCj4gPiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBbT0UtY29yZV0gW09FLUNvcmVd
W1BBVENIXSByb290ZnM6IE1ha2UgQlVJTEROQU1FIGEgd2Vhaw0KPiBkZWZhdWx0DQo+ID4gPiBp
biByZXByb2R1Y2libGVfYnVpbGRfc2ltcGxlDQo+ID4gPg0KPiA+ID4gMTFlNDUwODJhZDAwICgi
cm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzOiBpbXByb3ZlIGJpbmFyeQ0KPiA+ID4gcmVwcm9k
dWNpYmlsaXR5IikgZml4ZWQgYmluYXJ5IHJlcHJvZHVjaWJpbGl0eSBvZiAvZXRjL3ZlcnNpb24s
IGJ1dA0KPiB3aXRoDQo+ID4gPiB0aGUgbW92ZSB0byByZXByb2R1Y2liaWx0eSBpbiBhbGwgYnVp
bGRzLCBzZXR0aW5nIC9ldGMvdmVyc2lvbiB0bw0KPiA+ID4gYW55dGhpbmcgb3RoZXIgdGhhbiB0
aGUgZGVmYXVsdCBmaXhlZCB0aW1lc3RhbXAgaXMgdHJpY2t5IGJlY2F1c2UNCj4gPiA+IHJvb3Rm
c19yZXByb2R1Y2libGUoKSBydW5zIHZlcnkgbGF0ZS4NCj4gPiA+DQo+ID4gPiByb290ZnMucHkg
dXNlcyBCVUlMRE5BTUUgaWYgc2V0IGZvciAvZXRjL3ZlcnNpb24sIHNvIGludHJvZHVjZSBhIHdl
YWsNCj4gPiA+IGRlZmF1bHQgZm9yIEJVSUxETkFNRSBvZiAiUkVQUk9EVUNJQkxFX1RJTUVTVEFN
UF9ST09URlMiLCB3aGVuDQo+IGVuYWJsaW5nDQo+ID4gPiByZXByb2R1Y2libGUgYnVpbGRzIGhl
bmNlIGFsbG93aW5nIEJVSUxETkFNRSB0byBiZSBvdmVycmlkZGVuDQo+IGVsc2V3aGVyZS4NCj4g
PiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEtpZXJuYW4gPGFsZXgua2llcm5hbkBnbWFp
bC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+DQo+ID4gPiAgbWV0YS9jbGFzc2VzL3JlcHJvZHVjaWJs
ZV9idWlsZF9zaW1wbGUuYmJjbGFzcyB8IDEgKw0KPiA+ID4gIG1ldGEvY2xhc3Nlcy9yb290ZnMt
cG9zdGNvbW1hbmRzLmJiY2xhc3MgICAgICAgfCA1IC0tLS0tDQo+ID4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9jbGFzc2VzL3JlcHJvZHVjaWJsZV9idWlsZF9zaW1wbGUuYmJjbGFzcw0KPiBi
L21ldGEvY2xhc3Nlcy9yZXByb2R1Y2libGVfYnVpbGRfc2ltcGxlLmJiY2xhc3MNCj4gPiA+IGlu
ZGV4IGQwODQyZjBmOTAyYS4uMTUzYTA3NjA3MjE5IDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0YS9j
bGFzc2VzL3JlcHJvZHVjaWJsZV9idWlsZF9zaW1wbGUuYmJjbGFzcw0KPiA+ID4gKysrIGIvbWV0
YS9jbGFzc2VzL3JlcHJvZHVjaWJsZV9idWlsZF9zaW1wbGUuYmJjbGFzcw0KPiA+ID4gQEAgLTcs
NSArNyw2IEBAIGV4cG9ydCBQRVJMX0hBU0hfU0VFRCA9ICIwIg0KPiA+ID4gIGV4cG9ydCBTT1VS
Q0VfREFURV9FUE9DSCA/Pz0gIjE1MjA1OTg4OTYiDQo+ID4gPg0KPiA+ID4gIFJFUFJPRFVDSUJM
RV9USU1FU1RBTVBfUk9PVEZTID8/PSAiMTUyMDU5ODg5NiINCj4gPiA+ICtCVUlMRE5BTUUgPz89
ICIke1JFUFJPRFVDSUJMRV9USU1FU1RBTVBfUk9PVEZTfSINCj4gPg0KPiA+IENhbiB3ZSBwbGVh
c2UgcmV2ZXJ0IHRoaXMgY2hhbmdlPyAgVGhpcyBicmVha3MgKGFsbD8pIG90aGVyIHVzYWdlcw0K
PiA+IG9mICR7QlVJTEROQU1FfS4gRS5nLiwgdGhlIGluZm9ybWF0aW9uIGluIHRtcC9idWlsZHN0
YXRzIGlzIHRvdGFsbHkNCj4gPiB1c2VsZXNzIG5vdyBzaW5jZSBhbGwgYnVpbGRzIGVuZCB1cCBp
biB0aGUgc2FtZSBkaXJlY3RvcnkNCj4gPiAidG1wL2J1aWxkc3RhdHMvMTUyMDU5ODg5NiIsIG92
ZXJ3cml0aW5nIGVhY2ggb3RoZXIuLi4NCj4gPg0KPiANCj4gKzE7IEknZCBhZ3JlZSB0aGF0IHNl
ZW1zIHJhdGhlciBtb3JlIGJyb2tlbiB0aGFuIHRoZSBwcm9ibGVtIEkgd2FzDQo+IHRyeWluZyB0
byBmaXggaGVyZS4NCj4gDQo+IC0tDQo+IEFsZXggS2llcm5hbg0KDQpJIGd1ZXNzIHlvdSBjYW4g
YWNoaWV2ZSB3aGF0IHlvdSBvcmlnaW5hbGx5IHdhbnRlZCBieSBpbnRyb2R1Y2luZyBzb21lIG5l
dyANCnZhcmlhYmxlLCBidXQgSSB3aWxsIHNlbmQgYSBwYXRjaCB0byByZXZlcnQgdGhlIGFib3Zl
IGNoYW5nZSBmb3Igbm93Lg0KDQovL1BldGVyDQoNCg==

