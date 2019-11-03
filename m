Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 03 Nov 2019 15:24:58 UTC
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id E82EA6D4C6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Nov 2019 15:24:58 +0000 (UTC)
IronPort-SDR: O/zIOXS73vLiiPGGZj9MggsDd1i3DkNCJZTayvl1UvYErMl76uDM49u/ZHX5k7GnCmOq5JZHRM
	fFIs+CLBCIaTSPWYzykm5ts042tmvVuZQZaG51ZUAqI2bSY9yfvr4Xj/0Zp6+tvW55rpmhM+r7
	cl+NR6h77JXeEaRt4WSMKL69eCcCH/bgQb1g5y7AacO9vC89zHITDbUDrUUKzNdquVOzOHY06T
	tiF29TSzLzGI5PdMeMThAUjFD6Y/bIMD6cFwemLZA60q0ugBgQZwgZkJSfF9pAoE9AlnypE9kN
	zHQ=
X-IronPort-AV: E=Sophos;i="5.68,263,1569276000"; 
   d="scan'208";a="2110988"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [warrior][PATCH 0/8] Backport relevant changes from
	Zeus
Thread-Index: AQHVhD8zsfq8DgVlsUSBraPn3NxDL6duJVYAgAuFNXA=
Date: Sun, 3 Nov 2019 15:17:47 +0000
Message-ID: <cd4d358ec6eb43a397764aebee84105c@XBOX03.axis.com>
References: <cover.1571243326.git.pkj@axis.com>
	<c6db1799-ee15-0843-8325-9996e13dd8c6@gmail.com>
In-Reply-To: <c6db1799-ee15-0843-8325-9996e13dd8c6@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [warrior][PATCH 0/8] Backport relevant changes from Zeus
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
X-List-Received-Date: Sun, 03 Nov 2019 15:24:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBha3VzdGVyODA4IDxha3VzdGVy
ODA4QGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDI3IG9rdG9iZXIgMjAxOSAwOToyMA0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVuZW1i
ZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFt3YXJyaW9yXVtQQVRDSCAwLzhdIEJhY2twb3J0IHJlbGV2YW50IGNoYW5nZXMNCj4g
ZnJvbSBaZXVzDQo+IA0KPiBQZXRlciwNCj4gDQo+IA0KPiBPbiAxMC8xNi8xOSA5OjMwIEFNLCBQ
ZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBzZXQgY29udGFpbnMgYmFj
a3BvcnRzIG9mIG91ciBjaGFuZ2VzIGZyb20gWmV1cyB0aGF0IGFyZQ0KPiA+IHJlbGV2YW50IGZv
ciBXYXJyaW9yLg0KPiA+DQo+ID4gLy9QZXRlcg0KPiA+DQo+ID4gVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdA0KPiA3OWE4NTBhMTBhNGI4OGE2ZDIwZDYwN2IzMjI1NDJmOTQ3ODc0
MzIzOg0KPiA+DQo+ID4gICBjb25mL3Bva3k6IGFkZCBGZWRvcmEgMzAgYW5kIE9wZW5zdXNlIExl
YXAgMTUuMSB0byBzdXBwb3J0ZWQNCj4gZGlzdHJpYnV0aW9ucyAoMjAxOS0xMC0xNCAwOTo0OToy
NyArMDEwMCkNCj4gPg0KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Og0KPiA+DQo+ID4gICBnaXQ6Ly9wdXNoLnlvY3RvcHJvamVjdC5vcmcvcG9reS1jb250cmliIHBr
ai93YXJyaW9yX3N5bmMNCj4gDQo+IFRoZSBzZXJpZXMgaXMgY2F1c2luZyBidWlsZCBmYWlsdXJl
cy4NCj4gDQo+IGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMv
Mjc0NzQ4Lw0KPiANCj4gaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0
YWlscy8yNzQ3NTcvDQo+IA0KPiBJIGhhdmUgbm90IGhhZCB0aGUgdGltZSB0byBmaWd1cmUgb3V0
IHdoaWNoIG9uZXMgZ2l2aW5nIEkgaGF2ZSBiZWVuDQo+IHdvcmtpbmcgb24gYSBkaWZmZXJlbnQg
YnVpbGQgZmFpbHVyZS4gU28gaWYgeW91IGNvdWxkIGRvdWJsZSBjaGVjaw0KPiB0aGVtLA0KPiB0
aGF0IHdvdWxkIGJlIGdyZWF0Lg0KPiANCj4gcmVnYXJkcywNCj4gQXJtaW4NCg0KVGhlIHByb2Js
ZW1zIGFyZSBjYXVzZWQgYnkgdGhlICJtZXNvbi5iYmNsYXNzOiBSZW1vdmUgdGhlIE1FU09OXypf
QVJHUyANCnZhcmlhYmxlcyIgY2hhbmdlLiBJIGhhdmUgbm90IGhhZCB0aW1lIHRvIGxvb2sgaW50
byB3aHkgaXQgYnJlYWtzIHlldCwgDQpidXQgSSBjYW4gcmVwcm9kdWNlIGl0IHNvIGl0IHNob3Vs
ZCBob3BlZnVsbHkgbm90IGJlIHRvbyBoYXJkIHRvIGZpZ3VyZSANCml0IG91dCBvbmNlIEkgaGF2
ZSBhIGxpdHRsZSB0aW1lLg0KDQovL1BldGVyDQoNCj4gPiBOaWNsYXMgU3ZlbnNzb24gKDEpOg0K
PiA+ICAgZGV2dG9vbDogZmluaXNoOiBLZWVwIHBhdGNoZXMgb3JkZXJlZCB3aGVuIHVwZGF0aW5n
IGJiYXBwZW5kDQo+ID4NCj4gPiBQZXRlciBLamVsbGVyc3RlZHQgKDcpOg0KPiA+ICAgbWVzb24u
YmJjbGFzczogUmVtb3ZlIHRoZSBNRVNPTl8qX0FSR1MgdmFyaWFibGVzDQo+ID4gICBuYXRpdmVz
ZGstbWVzb246IFJlbW92ZSBzb21lIHVudXNlZCB2YXJpYWJsZXMNCj4gPiAgIGRldnRvb2w6IEF2
b2lkIGZhaWx1cmUgZm9yIHJlY2lwZXMgd2l0aCBTID09IFdPUktESVIgYW5kIG5vIGxvY2FsDQo+
ID4gICAgIGZpbGVzDQo+ID4gICBwYWNrYWdlX3JwbS5iYmNsYXNzOiBSZW1vdmUgYSBtaXNsZWFk
aW5nIGJiLm5vdGUoKQ0KPiA+ICAgdHpkYXRhOiBDb3JyZWN0IHRoZSBwYWNrYWdpbmcgb2YgL2V0
Yy9sb2NhbHRpbWUgYW5kIC9ldGMvdGltZXpvbmUNCj4gPiAgIGRldnRvb2w6IGZpbmlzaDogQWRk
IHN1cHBwb3J0IGZvciB0aGUgLS1uby1jbGVhbiBvcHRpb24NCj4gPiAgIGxpYi9vZS9sc2I6IE1h
a2Ugc3VyZSB0aGUgZGlzdHJvIElEIGlzIGFsd2F5cyBsb3dlcmNhc2VkDQo+ID4NCj4gPiAgbWV0
YS9jbGFzc2VzL21lc29uLmJiY2xhc3MgICAgICAgICAgICAgICAgICAgICAgfCAxNSArKysrKy0t
LS0tLS0tLS0NCj4gPiAgbWV0YS9jbGFzc2VzL3BhY2thZ2VfcnBtLmJiY2xhc3MgICAgICAgICAg
ICAgICAgfCAgNSArKy0tLQ0KPiA+ICBtZXRhL2xpYi9vZS9sc2IucHkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA4ICsrKystLS0tDQo+ID4gIC4uLi9tZXNvbi9uYXRpdmVzZGstbWVz
b25fMC40OS4yLmJiICAgICAgICAgICAgIHwgIDUgLS0tLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3RpbWV6b25lL3R6ZGF0YS5iYiAgICAgICAgfCAgNSArKystLQ0KPiA+ICBzY3JpcHRz
L2xpYi9kZXZ0b29sL3N0YW5kYXJkLnB5ICAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKy0t
LS0tLQ0KPiAtLQ0KPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMyIGRl
bGV0aW9ucygtKQ0KPiA+DQo+IA0KDQo=

