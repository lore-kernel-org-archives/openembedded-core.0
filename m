Return-Path: <saul.wold@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CA5C477D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 22:55:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2017 15:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,366,1491289200"; d="scan'208";a="1132707923"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2017 15:55:49 -0700
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 19 May 2017 15:55:47 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.59]) by
	ORSMSX115.amr.corp.intel.com ([169.254.4.44]) with mapi id
	14.03.0319.002; Fri, 19 May 2017 15:55:47 -0700
From: "Wold, Saul" <saul.wold@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ed.bartosh@linux.intel.com"
	<ed.bartosh@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v4 7/7] image_types_wic: schedule
	prepare_wic_build correctly
Thread-Index: AQHS0PMN7vhjtu7vQkm/+qBXbnJRKg==
Date: Fri, 19 May 2017 22:55:46 +0000
Message-ID: <1495234544.16942.222.camel@intel.com>
References: <cover.1495028624.git.ed.bartosh@linux.intel.com>
	<b852248822868b543e6bec8c4dbea6d43eb55f1b.1495028624.git.ed.bartosh@linux.intel.com>
In-Reply-To: <b852248822868b543e6bec8c4dbea6d43eb55f1b.1495028624.git.ed.bartosh@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.118.116]
MIME-Version: 1.0
Subject: Re: [PATCH v4 7/7] image_types_wic: schedule prepare_wic_build correctly
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
X-List-Received-Date: Fri, 19 May 2017 22:55:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF028B89AC2C87498A4A12D58BCC5579@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA1LTE3IGF0IDEzOjQ3ICswMDAwLCBFZCBCYXJ0b3NoIHdyb3RlOg0KPiBT
Y2hlZHVsZWQgcHJlcGFyZV93aWNfYnVpbGQgb25seSBpZiB3aWMgYnVpbGQgZW5hYmxlZC4NCj4g
QWRkZWQgZGVwZW5kZW5jaWVzIHRvIGtlcm5lbCBhbmQgZWZpIGJvb3Rsb2FkZXIgZGVwbG95DQo+
IHRhc2tzIG9ubHkgaWYgRUZJIGlzIGVuYWJsZWQuDQo+IA0KPiBUaGlzIHNob3VsZCBmaXggYnVp
bGQgZmFpbHVyZSBvbiBtYWNoaW5lcyB3aXRob3V0DQo+IEVGSSBmdW5jdGlvbmFsaXR5Lg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRWQgQmFydG9zaCA8ZWQuYmFydG9zaEBsaW51eC5pbnRlbC5jb20+
DQo+IC0tLQ0KPiDCoG1ldGEvY2xhc3Nlcy9pbWFnZV90eXBlc193aWMuYmJjbGFzcyB8IDI3ICsr
KysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAtLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFz
c2VzL2ltYWdlX3R5cGVzX3dpYy5iYmNsYXNzDQo+IGIvbWV0YS9jbGFzc2VzL2ltYWdlX3R5cGVz
X3dpYy5iYmNsYXNzDQo+IGluZGV4IGQ4NDMwZTQ5YWMuLjNiNzMyNjFkNWUgMTAwNjQ0DQo+IC0t
LSBhL21ldGEvY2xhc3Nlcy9pbWFnZV90eXBlc193aWMuYmJjbGFzcw0KPiArKysgYi9tZXRhL2Ns
YXNzZXMvaW1hZ2VfdHlwZXNfd2ljLmJiY2xhc3MNCj4gQEAgLTY5LDYgKzY5LDExIEBAIHB5dGhv
biAoKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjIGZpbGUgaW4gcHJv
Y2Vzc193a3NfdGVtcGxhdGUgYXMgd2VsbCwgc28ganVzdCBwdXQNCj4gaXQgaW4NCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCMgYSB2YXJpYWJsZSBhbmQgbGV0IHRoZSBtZXRh
ZGF0YSBkZWFsIHdpdGggdGhlDQo+IGRlcHMuDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBkLnNldFZhcignX1dLU19URU1QTEFURScsIGJvZHkpDQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgwqBiYi5idWlsZC5hZGR0YXNrKCdkb19wcmVwYXJlX3dpY19idWlsZCcsICdkb19pbWFn
ZV93aWMnLA0KPiBOb25lLCBkKQ0KPiArwqDCoMKgwqDCoMKgwqDCoGlmIGQuZ2V0VmFyKCdFRklf
Q0xBU1MnKToNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGQuYXBwZW5kVmFyRmxhZygnZG9f
cHJlcGFyZV93aWNfYnVpbGQnLCAnZGVwZW5kcycsDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCclcyVzOmRvX2RlcGxveSANCj4gdmly
dHVhbC9rZXJuZWw6ZG9fZGVwbG95JyAlIChkLmdldFZhcignTUxQUkVGSVgnKSwNCj4gZC5nZXRW
YXIoJ0VGSV9DTEFTUycpKSkNCg0KRWQswqANCkhhdmUgeW91IHRlc3RlZCB0aGlzIHdpdGggYW55
IGxheWVycz8gwqBJIHRpZWQgcmVjZW50bHkgd2l0aCBtZXRhLQ0KaW50ZWwgYW5kIHRyaXBwZWQg
b3ZlciBhbiBpc3N1ZSB3aXRoIHRoZSBybWMtYm9vdCBub3QgaGF2aW5nIGFuIGFjdHVhbA0KdGFy
Z2V0IGZvciB0aGUgRUZJX0NMQVNTIHRvIGhhdmUgYSBkZXBsb3kgdGFzayBjYXVzZWQgYSBmYWls
dXJlLg0KDQpTYXUhDQoNCj4gwqB9DQo+IMKgDQo+IMKgIw0KPiBAQCAtMTM5LDE5ICsxNDQsMTUg
QEAgcHl0aG9uIGRvX3ByZXBhcmVfd2ljX2J1aWxkKCkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqB3
aXRoIG9wZW4od2tzX2ZpbGUsICd3JykgYXMgZjoNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBmLndyaXRlKHRlbXBsYXRlX2JvZHkpDQo+IMKgDQo+IC3CoMKgwqDCoGlmIGQuZ2V0VmFyKCdV
U0lOR19XSUMnKToNCj4gLcKgwqDCoMKgwqDCoMKgwqAjIEdlbmVyYXRlIHBhcml0aW9uIFVVSUQN
Cj4gLcKgwqDCoMKgwqDCoMKgwqBmcm9tIHV1aWQgaW1wb3J0IHV1aWQ0DQo+IC3CoMKgwqDCoMKg
wqDCoMKgcGFydHV1aWQgPSBzdHIodXVpZDQoKSkNCj4gLcKgwqDCoMKgwqDCoMKgwqBkLnNldFZh
cigiUk9PVEZTX1BBUlRVVUlEIiwgcGFydHV1aWQpDQo+ICvCoMKgwqDCoCMgR2VuZXJhdGUgcGFy
aXRpb24gVVVJRA0KPiArwqDCoMKgwqBmcm9tIHV1aWQgaW1wb3J0IHV1aWQ0DQo+ICvCoMKgwqDC
oHBhcnR1dWlkID0gc3RyKHV1aWQ0KCkpDQo+ICvCoMKgwqDCoGQuc2V0VmFyKCJST09URlNfUEFS
VFVVSUQiLCBwYXJ0dXVpZCkNCj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgwqBpZiBkLmdldFZhcigi
RUZJX0NMQVNTIik6DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwb3B1bGF0ZV9ib290ZnMo
cGFydHV1aWQpDQo+ICvCoMKgwqDCoGlmIGQuZ2V0VmFyKCJFRklfQ0xBU1MiKToNCj4gK8KgwqDC
oMKgwqDCoMKgwqBwb3B1bGF0ZV9ib290ZnMocGFydHV1aWQpDQo+IMKgDQo+IC3CoMKgwqDCoMKg
wqDCoMKgdGVtcGxhdGUgPSBkLmdldFZhcigiX1dLU19URU1QTEFURSIpDQo+IC3CoMKgwqDCoMKg
wqDCoMKgaWYgdGVtcGxhdGU6DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3cml0ZV93a3Nf
dGVtcGxhdGUodGVtcGxhdGUsIGQuZ2V0VmFyKCdXS1NfRlVMTF9QQVRIJykpDQo+ICvCoMKgwqDC
oHRlbXBsYXRlID0gZC5nZXRWYXIoIl9XS1NfVEVNUExBVEUiKQ0KPiArwqDCoMKgwqBpZiB0ZW1w
bGF0ZToNCj4gK8KgwqDCoMKgwqDCoMKgwqB3cml0ZV93a3NfdGVtcGxhdGUodGVtcGxhdGUsIGQu
Z2V0VmFyKCdXS1NfRlVMTF9QQVRIJykpDQo+IMKgfQ0KPiAtDQo+IC1hZGR0YXNrIGRvX3ByZXBh
cmVfd2ljX2J1aWxkIGJlZm9yZSBkb19pbWFnZV93aWMNCj4gLWRvX3ByZXBhcmVfd2ljX2J1aWxk
W2RlcGVuZHNdID0NCj4gIiR7TUxQUkVGSVh9JHtFRklfUFJPVklERVJ9OmRvX2RlcGxveSB2aXJ0
dWFsL2tlcm5lbDpkb19kZXBsb3kiDQo+IC0twqANCj4gMi4xMi4wDQo+IA==

