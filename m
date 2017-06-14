Return-Path: <ismo.puustinen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8B8782EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 09:59:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 03:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="1160338385"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2017 03:00:00 -0700
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.129]) by
	IRSMSX104.ger.corp.intel.com ([163.33.3.159]) with mapi id
	14.03.0319.002; Wed, 14 Jun 2017 10:59:58 +0100
From: "Puustinen, Ismo" <ismo.puustinen@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v3] python3: make readline and gdbm support
	conditional.
Thread-Index: AQHS4PQv/LaTjH1zik+KN89HG7BxtKIjJiWAgADxIgA=
Date: Wed, 14 Jun 2017 09:59:57 +0000
Message-ID: <1497434396.3184.4.camel@intel.com>
References: <20170609074346.23974-1-ismo.puustinen@intel.com>
	<CAJTo0LaFN78k690wh=tLVDzQ54NFmcwitaKczFU=ZoCwsre+1Q@mail.gmail.com>
In-Reply-To: <CAJTo0LaFN78k690wh=tLVDzQ54NFmcwitaKczFU=ZoCwsre+1Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.72]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] python3: make readline and gdbm support conditional.
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
X-List-Received-Date: Wed, 14 Jun 2017 10:00:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB4EE3C0642E5E42B7E128264603BBE4@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE3LTA2LTEzIGF0IDIwOjM2ICswMTAwLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQo+
IElmIGdkYm0gaXNuJ3QgcHJlc2VudCB0aGVuIHRoZSBnZGJtIHBhY2thZ2UgaXNuJ3QgZ2VuZXJh
dGVkIGF0IGFsbCwNCj4gd2hpY2ggaXMgYXMgZXhwZWN0ZWQuIMKgcHl0aG9uMy1yZWFkbGluZSBq
dXN0IGNvbnRhaW5zIHRoZSBybGNvbXBsZXRlcg0KPiBwYWNrYWdlIHdoaWNoIGlzIGJhc2ljYWxs
eSBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgYW5kIGNvdWxkDQo+IGFyZ3VhYmx5IGJlIGRlbGV0
ZWQgaW4gYSBkb19pbnN0YWxsX2FwcGVuZCB0aGF0IGNoZWNrcyB0aGUNCj4gUEFDS0FHRUNPTkZJ
Ry4NCg0KU28sIGlmIEkgdW5kZXJzdGFuZCB0aGlzIGNvcnJlY3RseSwgeW91IHdhbnQgdG8gaGF2
ZSB0aGlzDQpkb19pbnN0YWxsX2FwcGVuZD8NCg0KPiBUaGUgcHJvdmlkZXMvZGVwZW5kcyB3aWxs
IGJlIG5lZWRlZCBzdGlsbCB0aG91Z2gsIHVubGVzcyB3ZSB0ZWFjaCB0aGUNCj4gbWFuaWZlc3Qg
Z2VuZXJhdG9yIHRoYXQgc29tZSBwYWNrYWdlcyBkZXBlbmQgb24gUEFDS0FHRUNPTkZJRyBmbGFn
cy4NCg0KSSB3YXMgdGhpbmtpbmcgdGhlIHNhbWUuIENoYW5naW5nIHRoZSBtYW5pZmVzdCBnZW5l
cmF0b3IgbWlnaHQgYmUNCmNsZWFuZXIgdGhhbiAicGF0Y2hpbmciIHRoZSBtYW5pZmVzdCBmaWxl
IGxpa2UgdGhpcy4gSG93ZXZlciwgaXQgd291bGQNCnNwbGl0IHRoZSBjaGFuZ2VzIGludG8gdGhy
ZWUgcGxhY2VzOiB0aGUgcmVjaXBlIGl0c2VsZiwgdGhlIG1hbmlmZXN0DQpnZW5lcmF0b3IsIGFu
ZCB0aGUgZ2VuZXJhdGVkIG1hbmlmZXN0IGZpbGUuIFRoaXMgd291bGQgbWFrZSBpdCBtb3JlDQpk
aWZmaWN1bHQgZm9yIHNvbWVvbmUgcmVhZGluZyB0aGUgcmVjaXBlIHRvIHVuZGVyc3RhbmQgaG93
IHRoZQ0KbWVjaGFuaXNtIHdvcmtzLiBBbnl3YXksIHBsZWFzZSB0ZWxsIGhvdyB5b3Ugd291bGQg
bGlrZSBtZSB0byBwcm9jZWVkDQpoZXJlOiBkbyB5b3Ugd2FudCB0byBoYXZlIHRoZSBwYXRjaCBh
cyBpdCBpcyBkb25lIG5vdyBvciBkbyB5b3Ugd2FudCB0bw0Kc2VlIHRoZSBnZW5lcmF0b3IgY2hh
bmdlZD8NCg0KSXNtbw==

