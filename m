Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8EEB16F60E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Mar 2014 16:19:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2014 09:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,618,1389772800"; d="scan'208";a="496657807"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga002.jf.intel.com with ESMTP; 09 Mar 2014 09:19:29 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Sun, 9 Mar 2014 16:19:28 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.62]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.149]) with mapi id
	14.03.0123.003; Sun, 9 Mar 2014 16:19:28 +0000
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/4] Add gummiboot boot manager alongside
	grub-efi
Thread-Index: AQHPO7Cwr8C7PNAy2Ead60puIO4GzZrY71MA
Date: Sun, 9 Mar 2014 16:19:26 +0000
Message-ID: <1394381972.12559.2.camel@firebird.rb.intel.com>
References: <cover.1394379900.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1394379900.git.stefanx.stanacar@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.156]
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Add gummiboot boot manager alongside grub-efi
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
X-List-Received-Date: Sun, 09 Mar 2014 16:19:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <79A84E9D86EA984CACD068FD659EAB75@intel.com>
Content-Transfer-Encoding: base64

DQpJJ3ZlIGZvcmdvdCB0byBhZGQgdjIgdG8gdGhlIHN1YmplY3QgbGluZXMgOigNCkknbGwgcmVz
ZW5kIHdpdGggdGhhdCBhZGRlZC4NCg0KT24gU3VuLCAyMDE0LTAzLTA5IGF0IDE4OjA0ICswMjAw
LCBTdGVmYW4gU3RhbmFjYXIgd3JvdGU6DQo+IEhlbGxvLA0KPiANCj4gVGhpcyBzZXJpZXMgYWRk
cyByZWNpcGVzIGZvciBndW1taWJvb3QgYW5kIGEgY2xhc3MgYWxsb3dpbmcgaXQgdG8gYmUgdXNl
ZA0KPiBhcyB0aGUgYm9vdCBsb2FkZXIgZm9yIGxpdmUvaGRkaW1nIGltYWdlcy4NCj4gV2l0aG91
dCBjaGFuZ2luZyBFRklfUFJPVklERVIsIHdlIGhhdmUgdGhlIHNhbWUgYmVoYXZpb3VyIGZvciBF
RkkgbWFjaGluZXMuDQo+IFVzaW5nIEVGSV9QUk9WSURFUiA9ICJndW1taWJvb3QiIGFuIGluc3Rh
bGxlZCBpbWFnZSB3aWxsIHVzZSBndW1taWJvb3QgaW5zdGVhZA0KPiBvZiBncnViLWVmaSBhcyBp
dCdzIGJvb3QgbWFuYWdlci4NCj4gDQo+IEkndmUgdGVzdGVkIHRoaXMgb24gRlJJMiwgTlVDIGFu
ZCBtaW5ub3cgKGxpdmUgVVNCIGJvb3QgYW5kIGluc3RhbGwgZnJvbSBVU0IgYW5kIGJvb3QpIA0K
PiB3aXRoICBFRklfUFJPVklERVIgPSAiZ3VtbWlib290IiBhbmQgIEtFUk5FTF9GRUFUVVJFU19h
cHBlbmQgPSAiIGNmZy9lZmktZXh0Ig0KPiBpbiBsb2NhbC5jb25mDQo+IA0KPiBUaGlzIGlzIGEg
cGFydGlhbCBmaXggZm9yIFlCIzQwODIuDQo+IA0KPiBDaGFuZ2VzIGluIFYyOg0KPiAgLSBzcGxp
dCB0aGUgZmlyc3QgcGF0Y2ggaW4gdHdvDQo+ICAtIHVzZWQgJHtCfSBpbnN0ZWFkIG9mICR7U30g
aW4gZ3VtbWlib290IGRvX2RlcGxveQ0KPiAgLSBjaGFuZ2UgdGhlIGZ1bmN0aW9uIG5hbWVzIGlu
IGJvb3RpbWcvZ3J1Yi1lZmkgaW5zdGVhZCBvZiB1c2luZyBhDQo+IHByZWZpeA0KPiANCj4gSSd2
ZSB0ZXN0ZWQgYWdhaW4gdGhlIGNoYW5nZXMgb24gdG9wIG9mIG1hc3Rlci4NCj4gDQo+IENoZWVy
cywNCj4gU3RlZmFuDQo+IA0KPiANCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dCBhYmU0MTdlMjJiMWI1NWM0NDQ0NjBmNzIyY2E0MzRmOWQzODJlZjg3Og0KPiANCj4gICBjbGFz
c2VzL3Vib290LWNvbmZpZzogaWdub3JlIGRvYyB2YXJmbGFnICgyMDE0LTAzLTA3IDE1OjA1OjA5
ICswMDAwKQ0KPiANCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6DQo+
IA0KPiAgIGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY29udHJpYiBzdGVmYW5zL2d1
bW1pYm9vdA0KPiAgIGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0LmNnaS9wb2t5LWNv
bnRyaWIvbG9nLz9oPXN0ZWZhbnMvZ3VtbWlib290DQo+IA0KPiBTdGVmYW4gU3RhbmFjYXIgKDQp
Og0KPiAgIHJlY2lwZXMtYnNwOiBhZGQgZ251LWVmaSByZWNpcGUNCj4gICByZWNpcGVzLWJzcDog
QWRkIGd1bW1pYm9vdCByZWNpcGUNCj4gICBib290aW1nL2dydWItZWZpLmJiY2xhc3M6IGFsbG93
IHVzaW5nIGEgZGlmZmVyZW50IGNsYXNzIGZvciBFRkkgaW1hZ2VzDQo+ICAgY2xhc3NlczogQWRk
IGd1bW1pYm9vdCBjbGFzcw0KPiANCj4gIG1ldGEvY2xhc3Nlcy9ib290LWRpcmVjdGRpc2suYmJj
bGFzcyAgICAgICAgICAgICAgIHwgICA3ICstDQo+ICBtZXRhL2NsYXNzZXMvYm9vdGltZy5iYmNs
YXNzICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArLQ0KPiAgbWV0YS9jbGFzc2VzL2dydWIt
ZWZpLmJiY2xhc3MgICAgICAgICAgICAgICAgICAgICAgfCAgMTIgKy0tDQo+ICBtZXRhL2NsYXNz
ZXMvZ3VtbWlib290LmJiY2xhc3MgICAgICAgICAgICAgICAgICAgICB8IDExNCArKysrKysrKysr
KysrKysrKysrKysNCj4gIC4uLi9nbnUtZWZpL2dudS1lZmkvcGFyYWxsZWwtbWFrZS1hcmNoaXZl
cy5wYXRjaCAgIHwgIDQ4ICsrKysrKysrKw0KPiAgLi4uL2dudS1lZmkvZ251LWVmaS9wYXJhbGxl
bC1tYWtlLnBhdGNoICAgICAgICAgICAgfCAgMjIgKysrKw0KPiAgbWV0YS9yZWNpcGVzLWJzcC9n
bnUtZWZpL2dudS1lZmlfMy4wdS5iYiAgICAgICAgICAgfCAgMzMgKysrKysrDQo+ICBtZXRhL3Jl
Y2lwZXMtYnNwL2d1bW1pYm9vdC9ndW1taWJvb3RfZ2l0LmJiICAgICAgICB8ICAyNSArKysrKw0K
PiAgLi4uL2luaXRyZHNjcmlwdHMvZmlsZXMvaW5pdC1pbnN0YWxsLWVmaS5zaCAgICAgICAgfCAg
NTEgKysrKysrLS0tDQo+ICA5IGZpbGVzIGNoYW5nZWQsIDI5MiBpbnNlcnRpb25zKCspLCAyOSBk
ZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL2NsYXNzZXMvZ3VtbWlib290
LmJiY2xhc3MNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL2dudS1lZmkv
Z251LWVmaS9wYXJhbGxlbC1tYWtlLWFyY2hpdmVzLnBhdGNoDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWJzcC9nbnUtZWZpL2dudS1lZmkvcGFyYWxsZWwtbWFrZS5wYXRjaA0K
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ic3AvZ251LWVmaS9nbnUtZWZpXzMu
MHUuYmINCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL2d1bW1pYm9vdC9n
dW1taWJvb3RfZ2l0LmJiDQo+IA0KPiAtLSANCj4gMS44LjUuMw0KPiANCg0K

