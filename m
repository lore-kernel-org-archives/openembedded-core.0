Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D6E7176104
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 17:50:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 10 Sep 2015 10:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,506,1437462000"; d="scan'208";a="786814586"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2015 10:50:37 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 10 Sep 2015 10:50:35 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.2.154]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.116]) with mapi id
	14.03.0224.002; Thu, 10 Sep 2015 10:50:34 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] [PATCH] kernel-arch.bbclass: Allow 'baremetal' CPUs
Thread-Index: AQHQ6p49wcfefQ0JH0iJ0ulPegvHAp40YdiAgABSuCCAAIGFgIAA1ZKA
Date: Thu, 10 Sep 2015 17:50:34 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6101E7A63@ORSMSX109.amr.corp.intel.com>
References: <1441761543-10979-1-git-send-email-juro.bystricky@intel.com>
	<1441790471.31676.13.camel@pbcl.net>
	<6E51916E4A1F32428260031F4C7CD2B6101E771D@ORSMSX109.amr.corp.intel.com>
	<1441836049.2948.8.camel@pbcl.net>
In-Reply-To: <1441836049.2948.8.camel@pbcl.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch.bbclass: Allow 'baremetal' CPUs
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
X-List-Received-Date: Thu, 10 Sep 2015 17:50:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm8gYXJndW1lbnQgaGVyZS4gSSBhZ3JlZSB0aGF0IGJhcmVtZXRhbCBidWlsZHMgc2hvdWxkIGJl
L2NvdWxkIGJlIHN0cmVhbWxpbmVkLg0KSW4gcGFydGljdWxhciwgIHRoZSBjb2RlIHNob3VsZCBz
dXBwb3J0IHNlbGYtY29udGFpbmVkIGJhcmVtZXRhbCBDUFUgc3BlY2lmaWMgbWV0YSBsYXllcnMg
DQpzbyB0aGVyZSB3b3VsZCBiZSBubyBuZWVkIHRvIGFkZCBuZXcgKGJhcmVtZXRhbCkgQ1BVcyBp
bnRvIHZhcmlvdXMgdGFibGVzIGluIG1ldGEvc2l0ZWluZm8uYmJjbGFzcw0KYW5kIG1ldGEvaW5z
YW5lLmJiY2xhc3MuDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQ
aGlsIEJsdW5kZWxsIFttYWlsdG86cGJAcGJjbC5uZXRdDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2Vw
dGVtYmVyIDksIDIwMTUgMzowMSBQTQ0KPiBUbzogQnlzdHJpY2t5LCBKdXJvDQo+IENjOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBQdXJkaWUsIFJpY2hhcmQNCj4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGtlcm5lbC1hcmNoLmJiY2xhc3M6IEFsbG93
ICdiYXJlbWV0YWwnIENQVXMNCj4gDQo+IEkgdGhpbmsgd2hhdCBJJ20gc2F5aW5nIGlzIHRoYXQg
dGhlIHdob2xlIEFSQ0ggdGhpbmcgaXMgYSBsaW51eGlzbSB0aGF0IHNob3VsZA0KPiBub3QgYmUg
cG9wcGluZyB1cCBpbiBhIGJhcmVtZXRhbCAob3IgYW55IG90aGVyIG5vbi1saW51eCkgY29uZmln
dXJhdGlvbiwgYW5kDQo+IGhhY2tpbmcgbWFwX2tlcm5lbF9hcmNoKCkgdG8gcmV0dXJuIHNvbWUg
YmVuaWduLWJ1dC1ib2d1cyB2YWx1ZSBzZWVtcw0KPiBsaWtlIHRoZSB3cm9uZyBmaXggZm9yIGl0
LiAgUGFydGljdWxhcmx5IGlmIHRoaXMgaGFja2luZyBpcyBiYXNlZCBvbiB0aGUgdmFsdWUgb2YN
Cj4gVENMSUJDIHdoaWNoLCBjb25jZXB0dWFsbHksIGlzIG5vdCBhbGwgdGhhdCB0aWdodGx5IGJv
dW5kIHRvIGEga2VybmVsLg0KPiANCj4gSWYgdGhlcmUgYXJlIHBsYWNlcyBpbiB0aGUgbWV0YWRh
dGEgdGhhdCAiaW5oZXJpdCBrZXJuZWwtYXJjaCIgaW4gYSBub24tbGludXgtDQo+IHNwZWNpZmlj
IGNvbnRleHQgdGhlbiBJIHRoaW5rIHdlIHNob3VsZCBmaWd1cmUgb3V0IHNvbWUgd2F5IHRvIGVs
aW1pbmF0ZQ0KPiB0aGVtLiAgSW4gdGhlIGxvbmdlciB0ZXJtIEkgdGhpbmsgaXQgd291bGQgbWFr
ZSBzZW5zZSB0byBoYXZlIGEgImtlcm5lbCIgLT4NCj4gImxpbnV4IiByZW5hbWluZyB0byBtYWtl
IHRoZXNlIGFzc3VtcHRpb25zIG1vcmUgZXhwbGljaXQuDQo+IA0KPiBwLg0KPiANCj4gT24gV2Vk
LCAyMDE1LTA5LTA5IGF0IDIxOjI3ICswMDAwLCBCeXN0cmlja3ksIEp1cm8gd3JvdGU6DQo+ID4g
SSB3b3VsZCBub3QgY2FsbCBpdCBhIHJlYWwgYnVnLiBUaGUgY29kZSBqdXN0IHRyaWVzIHRvIGlu
aXRpYWxpemUgQVJDSA0KPiA+ICh3aGljaCBtYXkgbm90IGJlIHVzZWQgZm9yIGJhcmVtZXRhbCBz
aXR1YXRpb25zKS4gVGhlIG5hbWUNCj4gPiAibWFwX2tlcm5lbF9hcmNoIiBpcyBhIGJpdCBtaXNs
ZWFkaW5nIGluIHRoaXMgKGJhcmVtZXRhbCkgY29udGV4dC4NCj4gPg0KPiA+DQo+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUGhpbCBCbHVuZGVsbCBbbWFpbHRv
OnBiQHBiY2wubmV0XQ0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgOSwgMjAxNSAy
OjIxIEFNDQo+ID4gPiBUbzogQnlzdHJpY2t5LCBKdXJvDQo+ID4gPiBDYzogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgUHVyZGllLCBSaWNoYXJkDQo+ID4gPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0ga2VybmVsLWFyY2guYmJjbGFzczogQWxsb3cNCj4g
PiA+ICdiYXJlbWV0YWwnIENQVXMNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIDIwMTUtMDktMDggYXQg
MTg6MTkgLTA3MDAsIEp1cm8gQnlzdHJpY2t5IHdyb3RlOg0KPiA+ID4gPiBBdm9pZCAiRVJST1I6
IGNhbm5vdCBtYXAgPGNwdT4gdG8gYSBsaW51eCBrZXJuZWwgYXJjaGl0ZWN0dXJlIg0KPiA+ID4g
PiBOb3QgYmVpbmcgYWJsZSB0byBtYXAgYSBDUFUgdG8gYSBrZXJuZWwgYXJjaGl0ZWN0dXJlIHNo
b3VsZCBub3QgYmUNCj4gPiA+ID4gdHJlYXRlZCBhcyBhbiBlcnJvciB3aGVuIGJ1aWxkaW5nIGJh
cmVtZXRhbCB0b29sY2hhaW5zIGZvciBDUFUNCj4gPiA+ID4gPGNwdT4gd2hpY2ggZG9lcyBub3Qg
aGF2ZSBhIGtlcm5lbCBzb3VyY2UgdHJlZS4NCj4gPiA+DQo+ID4gPiBXaHkgaXMgbWFwX2tlcm5l
bF9hcmNoKCkgZXZlbiBiZWluZyBpbnZva2VkIGZvciBhIGJhcmVtZXRhbA0KPiA+ID4gY29uZmln
dXJhdGlvbj8gIFRoYXQgc291bmRzIGxpa2UgaXQgaXMgdGhlIHJlYWwgYnVnIGhlcmUuDQo+ID4g
Pg0KPiA+ID4gcC4NCj4gPiA+DQo+ID4NCj4gDQoNCg==

