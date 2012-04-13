Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIqI2-0000sm-Hu
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 01:52:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Apr 2012 16:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88908231"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Apr 2012 16:43:07 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.19.9.53) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 13 Apr 2012 16:43:06 -0700
Received: from fmsmsx152.amr.corp.intel.com ([169.254.7.134]) by
	FMSMSX102.amr.corp.intel.com ([169.254.2.56]) with mapi id
	14.01.0355.002; Fri, 13 Apr 2012 16:43:06 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] grub 1.99: fix build for gcc 4.7
Thread-Index: AQHNGVmrbeIxRq32M0yDQJHCMFvFQ5aZqIAA///CGFA=
Date: Fri, 13 Apr 2012 23:43:00 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C03060012@fmsmsx152.amr.corp.intel.com>
References: <cover.1334308316.git.liezhi.yang@windriver.com>
	<638c4f827223820ee30ff0820df4179d41acfb60.1334308316.git.liezhi.yang@windriver.com>
	<CAMKF1soUx3Ov3Z1jZJpn3=hj_u79j5VaTVEG-S27SMQ8icsUWg@mail.gmail.com>
In-Reply-To: <CAMKF1soUx3Ov3Z1jZJpn3=hj_u79j5VaTVEG-S27SMQ8icsUWg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] grub 1.99: fix build for gcc 4.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 23:52:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gS2hl
bSBSYWoNCj4gU2VudDogRnJpZGF5LCBBcHJpbCAxMywgMjAxMiAxOjIxIFBNDQo+IFRvOiBQYXRj
aGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAxLzFdIGdydWIgMS45OTogZml4IGJ1aWxkIGZvciBnY2MgNC43
DQo+IA0KPiBPbiBGcmksIEFwciAxMywgMjAxMiBhdCAyOjQxIEFNLCBSb2JlcnQgWWFuZw0KPiA8
bGllemhpLnlhbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gVGhlcmUgd2FzIGFuIGVycm9y
IHdoZW4gYnVpbGQgd2l0aCBnY2MgNC43IChGQyAxNyA2NGJpdCk6DQo+ID4gfCBmcy96ZnMvemZz
LmM6IEluIGZ1bmN0aW9uICdnZXRfZmlsZXN5c3RlbV9kbm9kZSc6DQo+ID4gfCBmcy96ZnMvemZz
LmM6MTQ0OTo3OiBlcnJvcjogZGVyZWZlcmVuY2luZyB0eXBlLXB1bm5lZCBwb2ludGVyIHdpbGwN
Cj4gPiB8IGJyZWFrIHN0cmljdC1hbGlhc2luZyBydWxlcyBbLVdlcnJvcj1zdHJpY3QtYWxpYXNp
bmddDQo+ID4gLi4uLi4uDQo+ID4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBl
cnJvcnMNCj4gPg0KPiA+IFdoaWxlIGNvbXBhcmUgdGhlIGNvbXBpbGUgY29tbWFuZCBiZXR3ZWVu
IGdjYyA0LjQuNCBhbmQgZ2NjIDQuNy4wLA0KPiA+IHRoZXkgYXJlIHRoZSBzYW1lIChib3RoIG9m
IHRoZW0gaGF2ZSAtV2FsbCBhbmQgLVdlcnJvciksIGl0IHNlZW1zDQo+IHRoYXQNCj4gPiBnY2MN
Cj4gPiA0LjcuMCBoYXMgY2hhbmdlZCBpdHMgYWxnb3JpdGhtIGZvciB0aGUgc3RyaWN0IGFsaWFz
aW5nIGNoZWNrLCBidXQgSQ0KPiA+IGRpZG4ndCBmaW5kIHRoZSByZWxhdGVkIGluZm9ybWF0aW9u
IGZyb20gaXRzIHJlbGVhc2Ugbm90ZS4NCj4gPg0KPiA+IEFkZCAiLWZuby1zdHJpY3QtYWxpYXNp
bmciIHRvIGdjYydzIG9wdGlvbiB3b3VsZCBmaXggdGhlIHByb2JsZW0sDQo+IHRoaXMNCj4gPiB3
b3VsZCBkaXNhYmxlIHRoZSBvcHRpbWl6YXRpb24gZm9yIHN0cmljdC1hbGlhc2luZy4NCj4gDQo+
IFRoaXMgc2VlbXMgYSBiaXQgbW9yZSB0aGFuIHdoYXRzIG5lZWRlZC4gWW91IGNvdWxkIHRyeSBh
ZGRpbmcgLVduby0NCj4gZXJyb3I9c3RyaWN0LWFsaWFzaW5nIHRvIENGTEFHUw0KPiANCj4gb24g
YW5vdGhlciBub3RlLiBJIGRvIG5vdCBzZWUgdGhpcyBmYWlsaW5nIHdpdGggZ2NjLTQuNyh0YXJn
ZXQNCj4gY29tcGlsZXIpIGhlcmUgd2hlbiBJIGJ1aWxkIGdydWIgZm9yIHFlbXV4ODYgc28gSSBh
bSBhIGJpdCBwdXp6bGVkDQo+IA0KDQoNCktoZW0sDQogIFRoZXJlIGlzIGFub3RoZXIgZ3J1YiBy
ZWNpcGUgaXNzdWUsIGl0IGlzIGJ1aWxkaW5nIHRhcmdldCBiaW5hcmllcyB3aXRoIGRpc3RybyBj
b21waWxlci4gUHJvYmFibHkgYmVjYXVzZSBvZiB0aGF0IHlvdSBkaWQgbm90IHNlZSBpc3N1ZSB3
aXRoIDQuNyBjcm9zcyBjb21waWxlci4gV2UgaGF2ZSBmaXggZm9yIHRoYXQgaXNzdWUgbm93LiAN
Cg0KTml0aW4NCg0KDQoNCj4gPg0KPiA+IFtZT0NUTyAjMjI5MV0NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+IC0tLQ0K
PiA+IMKgbWV0YS9yZWNpcGVzLWJzcC9ncnViL2dydWJfMS45OS5iYiB8IMKgIMKgNyArKysrKyst
DQo+ID4gwqAxIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL2dydWIvZ3J1Yl8xLjk5LmJi
DQo+ID4gYi9tZXRhL3JlY2lwZXMtYnNwL2dydWIvZ3J1Yl8xLjk5LmJiDQo+ID4gaW5kZXggYWM2
NmU4My4uZjQ1YjYzNCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2dydWIvZ3J1
Yl8xLjk5LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWJzcC9ncnViL2dydWJfMS45OS5iYg0K
PiA+IEBAIC0xMiw3ICsxMiw3IEBAIExJQ0VOU0UgPSAiR1BMdjMiDQo+ID4gwqBMSUNfRklMRVNf
Q0hLU1VNID0NCj4gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4MGQ0
N2ZhZTUwNCINCj4gPg0KPiA+IMKgUkRFUEVORFNfJHtQTn0gPSAiZGlmZnV0aWxzIGZyZWV0eXBl
Ig0KPiA+IC1QUiA9ICJyMyINCj4gPiArUFIgPSAicjQiDQo+ID4NCj4gPiDCoFNSQ19VUkkgPSAi
ZnRwOi8vZnRwLmdudS5vcmcvZ251L2dydWIvZ3J1Yi0ke1BWfS50YXIuZ3ogXA0KPiA+IMKgIMKg
IMKgIMKgIMKgIGZpbGU6Ly9ncnViLWluc3RhbGwuaW4ucGF0Y2ggXCBAQCAtMjksNiArMjksMTEg
QEAgaW5oZXJpdA0KPiA+IGdldHRleHQNCj4gPiDCoEVYVFJBX09FQ09ORiA9ICItLXdpdGgtcGxh
dGZvcm09cGMgLS1kaXNhYmxlLWdydWItbWtmb250IC0tDQo+IHRhcmdldD0ke1RBUkdFVF9BUkNI
fSAtLXByb2dyYW0tcHJlZml4PSIiIg0KPiA+DQo+ID4gwqBkb19jb25maWd1cmUoKSB7DQo+ID4g
KyDCoCDCoCMgRml4IGJ1aWxkIGVycm9yIGZvciBnY2MgNC43DQo+ID4gKyDCoCDCoGVjaG8gIkNQ
UEZMQUdTX0RFRkFVTFQgKz0gLWZuby1zdHJpY3QtYWxpYXNpbmciID4+DQo+ID4gKyBjb25mL01h
a2VmaWxlLmNvbW1vbg0KPiA+ICsgwqAgwqAjIEFsc28gbW9kaWZ5IE1ha2VmaWxlLmluLCB3ZSBj
YW4gcmVtb3ZlIHRoaXMgd2hlbiB3ZSBjYW4gcnVuDQo+ID4gKyBhdXRvcmVjb25mDQo+ID4gKyDC
oCDCoHNlZCAtaSAncy9eQ1BQRkxBR1NfREVGQVVMVCA9IFwoLipcKS9DUFBGTEFHU19ERUZBVUxU
ID0NCj4gPiArIC1mbm8tc3RyaWN0LWFsaWFzaW5nIFwxLycgXA0KPiA+ICsgwqAgwqAgwqAgTWFr
ZWZpbGUuaW4gZ3J1Yi1jb3JlL01ha2VmaWxlLmluDQo+ID4gwqAgwqAgb2VfcnVuY29uZg0KPiA+
IMKgfQ0KPiA+DQo+ID4gLS0NCj4gPiAxLjcuMQ0KPiA+DQo+ID4NCj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1jb3Jl
IG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPiBodHRwOi8vbGlzdHMubGludXh0b2dvLm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGlu
Zm8vb3BlbmVtYmVkZGVkLWNvcmUNCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBP
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5s
aW51eHRvZ28ub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K


