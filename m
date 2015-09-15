Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC896E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:23:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2015 09:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,536,1437462000"; d="scan'208";a="769549102"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2015 09:23:49 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
	ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 15 Sep 2015 09:23:48 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.2.154]) by
	ORSMSX154.amr.corp.intel.com ([169.254.11.4]) with mapi id
	14.03.0224.002; Tue, 15 Sep 2015 09:23:48 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Phil Blundell <pb@pbcl.net>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] libgcc.inc: package baremetal multilib
	libraries
Thread-Index: AQHQ7wpe+BPv7+ECTECB7c0kUU+XLZ48ruMAgAA2YICAAOIa8A==
Date: Tue, 15 Sep 2015 16:23:47 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6101E855C@ORSMSX109.amr.corp.intel.com>
References: <1442247767-7879-1-git-send-email-juro.bystricky@intel.com>
	<7D6F58E5-BF37-4757-8B9A-5C37BAE5ED8E@gmail.com>
	<1442260397.2948.87.camel@pbcl.net>
In-Reply-To: <1442260397.2948.87.camel@pbcl.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcc.inc: package baremetal multilib libraries
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
X-List-Received-Date: Tue, 15 Sep 2015 16:23:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzLCBJIHNlZSB3aGF0IHlvdSBtZWFuLiBJJ2xsIHJlcG9zdCBhIG5ldyBwYXRjaCBhZnRl
ciBJJ3ZlIHRlc3RlZCBpdC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBQaGlsIEJsdW5kZWxsIFttYWlsdG86cGJAcGJjbC5uZXRdDQo+IFNlbnQ6IE1vbmRheSwgU2Vw
dGVtYmVyIDE0LCAyMDE1IDEyOjUzIFBNDQo+IFRvOiBLaGVtIFJhag0KPiBDYzogQnlzdHJpY2t5
LCBKdXJvOyBQdXJkaWUsIFJpY2hhcmQ7IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBsaWJnY2MuaW5j
OiBwYWNrYWdlIGJhcmVtZXRhbCBtdWx0aWxpYiBsaWJyYXJpZXMNCj4gDQo+IE9uIE1vbiwgMjAx
NS0wOS0xNCBhdCAwOTozOCAtMDcwMCwgS2hlbSBSYWogd3JvdGU6DQo+ID4gPiBPbiBTZXAgMTQs
IDIwMTUsIGF0IDk6MjIgQU0sIEp1cm8gQnlzdHJpY2t5IDxqdXJvLmJ5c3RyaWNreUBpbnRlbC5j
b20+DQo+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IFdoZW4gYnVpbGRpbmcgbGliZ2NjIGZvciBiYXJl
bWV0YWwgY3Jvc3MtY29tcGlsZXJzLCBzb21lIGZpbGVzIGFuZA0KPiA+ID4gbGlicmFyaWVzIG1h
eSBiZSBidWlsdCBidXQgbm90IHBhY2thZ2VkLiBUaGlzIHBhdGNoIGZpeGVzIGVycm9ycyBzdWNo
IGFzDQo+IHRoZXNlOg0KPiA+ID4NCj4gPiA+IEVSUk9SOiBRQSBJc3N1ZTogbGliZ2NjOiBGaWxl
cy9kaXJlY3RvcmllcyB3ZXJlIGluc3RhbGxlZCBidXQgbm90IHNoaXBwZWQNCj4gaW4gYW55IHBh
Y2thZ2U6DQo+ID4gPiAgL3Vzci9saWIvYXJtLXBva3ktZWFiaS80LjkuMy90aHVtYg0KPiA+ID4g
IC91c3IvbGliL2FybS1wb2t5LWVhYmkvNC45LjMvZnB1DQo+ID4gPiAgL3Vzci9saWIvYXJtLXBv
a3ktZWFiaS80LjkuMy90aHVtYi9saWJnY292LmENCj4gPiA+ICAvdXNyL2xpYi9hcm0tcG9reS1l
YWJpLzQuOS4zL3RodW1iL2NydG4ubw0KPiA+ID4gIC91c3IvbGliL2FybS1wb2t5LWVhYmkvNC45
LjMvdGh1bWIvY3J0ZW5kLm8NCj4gPiA+ICAvdXNyL2xpYi9hcm0tcG9reS1lYWJpLzQuOS4zL3Ro
dW1iL2NydGJlZ2luLm8NCj4gPiA+ICAvdXNyL2xpYi9hcm0tcG9reS1lYWJpLzQuOS4zL3RodW1i
L2xpYmdjYy5hDQo+ID4gPiAgL3Vzci9saWIvYXJtLXBva3ktZWFiaS80LjkuMy90aHVtYi9jcnRp
Lm8NCj4gPiA+ICAvdXNyL2xpYi9hcm0tcG9reS1lYWJpLzQuOS4zL2ZwdS9saWJnY292LmENCj4g
PiA+ICAvdXNyL2xpYi9hcm0tcG9reS1lYWJpLzQuOS4zL2ZwdS9jcnRuLm8NCj4gPiA+ICAvdXNy
L2xpYi9hcm0tcG9reS1lYWJpLzQuOS4zL2ZwdS9jcnRlbmQubw0KPiA+ID4gIC91c3IvbGliL2Fy
bS1wb2t5LWVhYmkvNC45LjMvZnB1L2NydGJlZ2luLm8NCj4gPiA+ICAvdXNyL2xpYi9hcm0tcG9r
eS1lYWJpLzQuOS4zL2ZwdS9saWJnY2MuYQ0KPiA+ID4gIC91c3IvbGliL2FybS1wb2t5LWVhYmkv
NC45LjMvZnB1L2NydGkubw0KPiA+ID4gUGxlYXNlIHNldCBGSUxFUyBzdWNoIHRoYXQgdGhlc2Ug
aXRlbXMgYXJlIHBhY2thZ2VkLiBBbHRlcm5hdGl2ZWx5DQo+ID4gPiBpZiB0aGV5IGFyZSB1bm5l
ZWRlZCwgYXZvaWQgaW5zdGFsbGluZyB0aGVtIG9yIGRlbGV0ZSB0aGVtIHdpdGhpbg0KPiA+ID4g
ZG9faW5zdGFsbC4gW2luc3RhbGxlZC12cy1zaGlwcGVkXQ0KPiA+ID4NCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEp1cm8gQnlzdHJpY2t5IDxqdXJvLmJ5c3RyaWNreUBpbnRlbC5jb20+DQo+ID4gPiAt
LS0NCj4gPiA+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvbGliZ2NjLmluYyB8IDYgKysrKysr
DQo+ID4gPiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvbGliZ2NjLmluYw0KPiA+ID4gYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2xpYmdjYy5pbmMNCj4gPiA+IGluZGV4IDczOWFkYmQu
Ljk1NzA5ZTQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2xp
YmdjYy5pbmMNCj4gPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvbGliZ2NjLmlu
Yw0KPiA+ID4gQEAgLTI4LDYgKzI4LDEyIEBAIEZJTEVTXyR7UE59LWRldiA9ICJcDQo+ID4gPiAg
ICAgJHtsaWJkaXJ9LyR7VEFSR0VUX1NZU30vJHtCSU5WfS9saWJnY292LmEgXCAiDQo+ID4gPg0K
PiA+ID4gK0ZJTEVTXyR7UE59LWRldl9saWJjLWJhcmVtZXRhbCA9ICJcDQo+ID4gPiArICAgICR7
YmFzZV9saWJkaXJ9LyBcDQo+ID4gPiArICAgICR7bGliZGlyfS8qIFwNCj4gPiA+ICsgICAgJHts
aWJkaXJ9LyR7VEFSR0VUX1NZU30vKiBcDQo+ID4gPiAr4oCdDQo+ID4NCj4gPiB3aHkgbm90IHB1
dCBpdCBpbnRvIGxpYmdjYy1kZXYgaXRzZWxmDQo+IA0KPiBBZ3JlZWQuICBJIHRoaW5rIHRoZSBy
ZWFsIGlzc3VlIGhlcmUgaXMgbm90aGluZyByZWFsbHkgdG8gZG8gd2l0aCBiYXJlbWV0YWwsIGl0
J3MNCj4ganVzdCB0aGF0IHRoZSBleGlzdGluZyBGSUxFU18ke1BOfS1kZXYgcGF0dGVybiBkb2Vz
bid0IGNvbnNpZGVyIG11bHRpbGliIGZvcg0KPiBhbnl0aGluZyBvdGhlciB0aGFuIElBIGFuZCBt
aXBzLg0KPiANCj4gcC4NCj4gDQoNCg==

