Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DC4516150C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:57:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2020 18:58:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,458,1574150400"; d="scan'208";a="253952857"
Received: from pgsmsx112.gar.corp.intel.com ([10.108.55.201])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2020 18:57:59 -0800
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	PGSMSX112.gar.corp.intel.com (10.108.55.201) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 19 Feb 2020 10:52:54 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.77]) by
	PGSMSX110.gar.corp.intel.com ([169.254.13.200]) with mapi id
	14.03.0439.000; Wed, 19 Feb 2020 10:52:54 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "rpjday@crashcourse.ca"
	<rpjday@crashcourse.ca>
Thread-Topic: [OE-core] what is MACHINE_HWCODECS used for these days?
Thread-Index: AQHV4zdhM/n61yYGTkyEAT5jjcnRaKghUsgA
Date: Wed, 19 Feb 2020 02:52:53 +0000
Message-ID: <504b19d868c02c0ee7a68a8432b166a7578b5c5f.camel@intel.com>
References: <alpine.LFD.2.21.2002140758340.2874577@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002140758340.2874577@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.22.68]
MIME-Version: 1.0
Subject: Re: what is MACHINE_HWCODECS used for these days?
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
X-List-Received-Date: Wed, 19 Feb 2020 02:58:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C63122FF2360B4CB4D16DB3721742D5@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTAyLTE0IGF0IDA4OjA0IC0wNTAwLCBSb2JlcnQgUC4gSi4gRGF5IHdyb3Rl
Og0KPiAgIHdhcyBkb2N1bWVudGluZyB0aGUgdXNlIG9mIFtFWFRSQV9dSU1BR0VfRkVBVFVSRVMs
IGFuZCBub3RpY2VkIHRoYXQNCj4gd2hpbGUgdGhlIG9lLWNvcmUgbGF5ZXIgZGVmaW5lcyBhIHJl
bGF0ZWQgZmVhdHVyZToNCj4gDQo+ICAgY29yZS1pbWFnZS5iYmNsYXNzOkZFQVRVUkVfUEFDS0FH
RVNfaHdjb2RlY3MgPQ0KPiAiJHtNQUNISU5FX0hXQ09ERUNTfSINCj4gICBjb3JlLWltYWdlLmJi
Y2xhc3M6TUFDSElORV9IV0NPREVDUyA/Pz0gIiINCg0KVGhpcyBlbnN1cmVzIHRoYXQgcGFja2Fn
ZXMgaW4gTUFDSElORV9IV0NPREVDUyBhcmUgaW5zdGFsbGVkIGluIHRoZQ0KaW1hZ2UgaWYgaHdj
b2RlY3MgaW4gaW5jbHVkZWQgaW4gSU1BR0VfRkVBVFVSRVMuDQoNClRoYW5rcywNCg0KQW51ag0K
DQo+IA0KPiBpIHNlZSBubyBhY3R1YWwgdXNhZ2Ugb2YgdGhhdCB2YXJpYWJsZSBpbiBvZS1jb3Jl
ICh0aGUgZ2l0IGxvZyBnb2VzDQo+IHdheSBiYWNrIHRvIDIwMTM6DQo+IA0KPiAgIGNvbW1pdCAx
Y2IzNzA1ODdmZDcyZTNmMGY2OTY3ODc0ODEwOGNjNDExNjc2N2ZiDQo+ICAgQXV0aG9yOiBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gICBEYXRl
OiAgIFdlZCBKYW4gMjMgMjE6NTY6MTEgMjAxMyAtMDgwMA0KPiANCj4gICAgIGNvcmUtaW1hZ2U6
IEFkZCBod2NvZGVjcyBJTUFHRV9GRUFUVVJFDQo+IA0KPiAgICAgQ3VycmVudGx5IGhhcmR3YXJl
IGNvZGVjcyBhcmUgYmVpbmcgaW5qZWN0ZWQgaW4gcmF0aGVyIHVnbHkgd2F5cw0KPiBhbmQgZW5k
IHVwDQo+ICAgICBlaXRoZXIgaW4gbm8gb3IgYWxsIGltYWdlcy4gVGhpcyBhZGRzIGEgZGVkaWNh
dGVkIElNQUdFX0ZFQVRVUkUNCj4gZm9yIHRoZW0gYmFzZWQNCj4gICAgIG9uIHRoZSBNQUNISU5F
X0hXQ09ERUNTIHZhcmlhYmxlLiBXZSBtYXkgbmVlZCB0byByZWZpbmUgdGhpcyBpbg0KPiBkdWUg
Y291cnNlDQo+ICAgICBidXQgdGhpcyBwYXRjaCBhdCBsZWFzdCBpbGx1c3RyYXRlcyB0aGUgY29u
Y2VwdC4NCj4gDQo+IGkgbG9va2VkIHRocm91Z2ggb3RoZXIgbGF5ZXJzIG9uIG15IHN5c3RlbSwg
YW5kIGZvdW5kIHNvbWUgcmVmZXJlbmNlcw0KPiBpbiBtZXRhLWludGVsOg0KPiANCj4gY29uZi9t
YWNoaW5lL2ludGVsLWNvcmUyLTMyLmNvbmY6TUFDSElORV9IV0NPREVDUyA/PSAiaW50ZWwtdmFh
cGktDQo+IGRyaXZlciBnc3RyZWFtZXIxLjAtdmFhcGkiDQo+IGNvbmYvbWFjaGluZS9pbnRlbC1j
b3JlaTctNjQuY29uZjpNQUNISU5FX0hXQ09ERUNTID89ICINCj4gJHtAYmIudXRpbHMuY29udGFp
bnMoJ1RVTkVfRkVBVFVSRVMnLCAnbXgzMicsICcnLCAnaW50ZWwtbWVkaWEtZHJpdmVyDQo+IGlu
dGVsLW1lZGlhc2RrJywgZCl9IGludGVsLXZhYXBpLWRyaXZlciBnc3RyZWFtZXIxLjAtdmFhcGki
DQo+IGNvbmYvbWFjaGluZS9pbnRlbC1za3lsYWtlLTY0LmNvbmY6TUFDSElORV9IV0NPREVDUyA/
PSAiaW50ZWwtbWVkaWEtDQo+IGRyaXZlciBpbnRlbC1tZWRpYXNkayBpbnRlbC12YWFwaS1kcml2
ZXINCj4gZ3N0cmVhbWVyMS4wLXZhYXBpIg0KPiANCj4gYnV0IGkgc2VlIG5vdGhpbmcgaW4gKnRo
YXQqIGxheWVyIHRoYXQgYWN0dWFsbHkgZG9lcyBhbnl0aGluZyB3aXRoDQo+IHRoYXQgdmFyaWFi
bGUgYWZ0ZXIgc2V0dGluZyBpdC4gd2hhdCBpcyBpdCB1c2VkIGZvcj8gYW5kIGhvdyBpcyBpdA0K
PiBwcm9jZXNzZWQ/DQo+IA0KPiByZGF5DQo+IA0K

