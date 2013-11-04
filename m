Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F41396D136
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 09:24:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Nov 2013 01:24:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="384305264"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by azsmga001.ch.intel.com with ESMTP; 04 Nov 2013 01:24:28 -0800
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.83]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.89]) with mapi id
	14.03.0123.003; Mon, 4 Nov 2013 09:24:27 +0000
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] Modify buildstats to be merged inside
	buildhistory
Thread-Index: AQHO1yMA7piYtXtwoUy6tS8UNnpUwpoQrCCAgAK2L7CAAWx5AIAAAIOg
Date: Mon, 4 Nov 2013 09:24:26 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A1AA0B0@IRSMSX103.ger.corp.intel.com>
References: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
	<1383329237.6271.62.camel@ted>
	<33115ABC4887814E8A92A08FBC93416B0A1A9E54@IRSMSX103.ger.corp.intel.com>
	<1383556582.6271.98.camel@ted>
In-Reply-To: <1383556582.6271.98.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Mon, 04 Nov 2013 09:24:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBNb25k
YXksIE5vdmVtYmVyIDA0LCAyMDEzIDExOjE2IEFNDQo+IFRvOiBTdG9pY2VzY3UsIENvcm5lbGl1
WA0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gTW9kaWZ5IGJ1aWxkc3RhdHMgdG8gYmUgbWVyZ2Vk
IGluc2lkZQ0KPiBidWlsZGhpc3RvcnkNCj4gDQo+IE9uIFN1biwgMjAxMy0xMS0wMyBhdCAxMToz
NyArMDAwMCwgU3RvaWNlc2N1LCBDb3JuZWxpdVggd3JvdGU6DQo+ID4gPiA+ICtCVUlMRFNUQVRT
X0JBU0UgPSAiJHtCVUlMREhJU1RPUllfRElSfS9idWlsZHN0YXRzIg0KPiA+ID4gPiAgQk5GSUxF
ID0gIiR7QlVJTERTVEFUU19CQVNFfS8uYnVpbGRuYW1lIg0KPiA+ID4gPiAgREVWRklMRSA9ICIk
e0JVSUxEU1RBVFNfQkFTRX0vLmRldmljZSINCj4gPiA+DQo+ID4gPiBzbyB3aGVuIGJ1aWxkaGlz
dG9yeSBpcyB1c2VkLCBidWlsZHN0YXRzIGF1dG9tYXRpY2FsbHkgYmVjb21lcyBwYXJ0IG9mIGl0
Pw0KPiA+ID4NCj4gPiA+ID4gQEAgLTMzLDcgKzMzLDcgQEAgZGVmIHNldF9ibihlKToNCj4gPiA+
ID4NCj4gPiA+ID4gIGRlZiBnZXRfYm4oZSk6DQo+ID4gPiA+ICAgICAgd2l0aCBvcGVuKGUuZGF0
YS5nZXRWYXIoJ0JORklMRScsIFRydWUpKSBhcyBmOg0KPiA+ID4gPiAtICAgICAgICBibiA9IGYu
cmVhZGxpbmUoKQ0KPiA+ID4gPiArICAgICAgICBibiA9IHN0cihmLnJlYWRsaW5lKCkpLnNwbGl0
KCIvIilbMF0NCj4gPiA+ID4gICAgICByZXR1cm4gYm4NCj4gPiA+ID4NCj4gPiA+ID4gIGRlZiBz
ZXRfZGV2aWNlKGUpOg0KPiA+ID4gPiBAQCAtMTc1LDYgKzE3NSwxMCBAQCBweXRob24gcnVuX2J1
aWxkc3RhdHMgKCkgew0KPiA+ID4gPiAgICAgICAgICAjIHNldCB0aGUgYnVpbGRuYW1lDQo+ID4g
PiA+DQo+ID4gPg0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIw0KPiA+ID4gIyMjIyMjIyMjIw0KPiA+ID4gPiAgICAgICAgICB0
cnk6DQo+ID4gPiA+ICsgICAgICAgICAgICBiYi51dGlscy5yZW1vdmUoZS5kYXRhLmdldFZhcign
QlVJTERTVEFUU19CQVNFJywNCj4gPiA+ID4gKyBUcnVlKSwNCj4gPiA+ID4gKyByZWN1cnNlPVRy
dWUpDQo+ID4gPg0KPiA+ID4NCj4gPiA+IERvIHdlIG5lZWQgdG8gcmVtb3ZlIHRoaXM/DQo+ID4g
Pg0KPiA+DQo+ID4gQnkgcmV3b3JraW5nIHRoZSBidWlsZHN0YXRzIGRpcmVjdG9yeSBzdHJ1Y3R1
cmUgdG8gbm90IHVzZSB0aGUgYnVpbGQNCj4gPiBkYXRlIHRvIHNlcGFyYXRlIGJ1aWxkcywgaWYg
d2UgZG9uJ3QgcmVtb3ZlIGJ1aWxkc3RhdHMgZWFjaCB0aW1lIHdlDQo+ID4gbWFrZSBhIG5ldyBi
dWlsZCB0aGUgaW5mb3JtYXRpb24gZnJvbSBtdWx0aXBsZSBidWlsZHMgd2lsbCBtZXJnZSBhbmQN
Cj4gPiB0b29scyBsaWtlIGJ5Ym9vdGNoYXJ0Z3V5LnB5IHdpbGwgbm90IHdvcmsgYW55bW9yZSB3
aXRoIGJ1aWxkc3RhdHMuDQo+IA0KPiBJJ2QgaGF2ZSBleHBlY3RlZCB0aGF0IHNlcGFyYXRlIGRp
cmVjdG9yaWVzIGZvciBlYWNoIGJ1aWxkIGFyZSBzdGlsbA0KPiBtYWludGFpbmVkLiBUZXN0aW5n
IGxvY2FsbHkgaGVyZSwgSSBjYW4gdXNlIHB5Ym9vdGNoYXJ0Z3VpIGluIHRoZSBmb3JtOg0KPiAN
Cj4gc2NyaXB0cy9weWJvb3RjaGFydGd1aS9weWJvb3RjaGFydGd1aS5weSBidWlsZC90bXAvYnVp
bGRzdGF0cy9jb3JlLWltYWdlLQ0KPiBzYXRvLXFlbXV4ODYvMjAxMzA5MzAyMTU1Lw0KPiANCj4g
YW5kIEknZCBoYXZlIHRob3VnaHQgYSBzaW1pbGFyIGNvbW1hbmQgd291bGQgc3RpbGwgd29yayBp
biBidWlsZGhpc3Rvcnkgc2luY2UNCj4gd2UnZCBzdGlsbCBoYXZlIHRoZSB0aW1lc3RhbXBlZCBk
aXJlY3RvcnkgdGhlcmU/DQo+IA0KDQpUaGUgdGltZXN0YW1wZWQgZGlyZWN0b3J5IHdhcyByZW1v
dmVkIGluIG9yZGVyIHRvIHJlZHVjZSBidWlsZGhpc3RvcnkgZ2l0IG5vaXNlLiANCkNyZWF0aW5n
IGEgbmV3IGRpcmVjdG9yeSBmb3IgZWFjaCBidWlsZCB3aWxsIGFsc28gaW5jcmVhc2UgdGhlIGdp
dCByZXBvIHNpemUgZHJhbWF0aWNhbGx5DQpJbiB0aW1lLg0KDQpJZiB3ZSBjaG9vc2UgdG8gbm90
IHVzZSB0aGUgdGltZXN0YW1wZWQgZGlyZWN0b3J5LCB3ZSBuZWVkIHRvIGRlbGV0ZSB0aGUgYnVp
bGRzdGF0cyANCmRhdGEgZWFjaCBidWlsZCBiZWNhdXNlLCBpbiBjb250cmFzdCB0byBidWlsZGhp
c3RvcnksIGJ1aWxkc3RhdHMgZGF0YSBpcyByZWxldmFudCB3aGVuDQpjb21waWxlZCBhcyBhIHdo
b2xlLiBUaGlzIGlzIGFsc28gaG93IHB5Ym9vdGNoYXJ0IGludGVycHJldHMgaXQuDQoNCj4gQ2hl
ZXJzLA0KPiANCj4gUmljaGFyZA0KDQpSZWdhcmRzLA0KQ29ybmVsaXUNCg0K

