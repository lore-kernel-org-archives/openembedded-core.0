Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EA6C565DD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 17:16:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Apr 2014 10:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,842,1389772800"; d="scan'208";a="519038716"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2014 10:16:03 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 11 Apr 2014 18:16:02 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.26]) with mapi id
	14.03.0123.003; Fri, 11 Apr 2014 18:16:02 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] scripts/send-error-report: simple hack to use proxy
	from the enviroment
Thread-Index: AQHPVZ5iZ9sOJpdz60eDwpG9ElA+jJsMl4OA
Date: Fri, 11 Apr 2014 17:16:01 +0000
Message-ID: <1397236581.17713.28.camel@firebird.rb.intel.com>
References: <1397231695-19060-2-git-send-email-stefanx.stanacar@intel.com>
In-Reply-To: <1397231695-19060-2-git-send-email-stefanx.stanacar@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.160]
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/send-error-report: simple hack to use proxy from the enviroment
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
X-List-Received-Date: Fri, 11 Apr 2014 17:16:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B4804D1C7B9A443B9D051FCAFB8E716@intel.com>
Content-Transfer-Encoding: base64

QWN0dWFsbHkgSSdsbCBzZW5kIHYyIHdoaWNoIHNob3VsZCB3b3JrIGZvciBIVFRQIEJhc2ljIEF1
dGhlbnRpY2F0aW9uDQp0b28uDQoNCg0KT24gRnJpLCAyMDE0LTA0LTExIGF0IDE4OjU0ICswMzAw
LCBTdGVmYW4gU3RhbmFjYXIgd3JvdGU6DQo+IFBlb3BsZSBiZWhpbmQgYSBwcm94eSBjb3VsZG4n
dCBzZW5kIGFuIGVycm9yIHJlcG9ydCB0byBhbiB1cHN0cmVhbSBzZXJ2ZXIsDQo+IHRoaXMgc2hv
dWxkIGZpeCB0aGUgaXNzdWUgaWYgdGhleSB1c2UgYSBwcm94eSB0aGF0IGRvZXNuJ3QgcmVxdWly
ZSBhdXRoZW50aWNhdGlvbiwNCj4gYW5kIGl0J3MgY29ycmVjdGx5IGV4cG9ydGVkIGluIHRoZSBl
bnZpcm9tZW50Lg0KPiBUaGVyZSBhcmUgcHJvYmJhbHkgYmV0dGVyIHdheXMgdG8gZml4IHRoaXMg
KHVybGxpYjIsIHByb3h5IGNvbm5lY3QsDQo+IGEgY29tbWFuZCBsaW5lIG9wdGlvbiBmb3IgcHJv
eHkpIGJ1dCB0aG9zZSByZXF1aXJlIG1vcmUgY2hhbmdlcyB0aGFuDQo+IEkgZmVlbCBjb25mb3J0
YWJsZSBkb2luZyBub3cuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gU3RhbmFjYXIgPHN0
ZWZhbnguc3RhbmFjYXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHNjcmlwdHMvc2VuZC1lcnJvci1y
ZXBvcnQgfCAyNyArKysrKysrKysrKysrKysrKysrKystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvc2VuZC1lcnJvci1yZXBvcnQgYi9zY3JpcHRzL3NlbmQtZXJyb3ItcmVwb3J0DQo+IGlu
ZGV4IDM3MzRiNjEuLjBiY2U4YjYgMTAwNzU1DQo+IC0tLSBhL3NjcmlwdHMvc2VuZC1lcnJvci1y
ZXBvcnQNCj4gKysrIGIvc2NyaXB0cy9zZW5kLWVycm9yLXJlcG9ydA0KPiBAQCAtOCw2ICs4LDI0
IEBADQo+ICANCj4gDQo+ICBpbXBvcnQgaHR0cGxpYiwgdXJsbGliLCBvcywgc3lzLCBqc29uDQo+
ICtmcm9tIHVybGxpYjIgaW1wb3J0IF9wYXJzZV9wcm94eSBhcyBwYXJzZXByb3h5DQo+ICsNCj4g
Kw0KPiArZGVmIGhhbmRsZV9jb25uZWN0aW9uKHNlcnZlciwgZGF0YSk6DQo+ICsgICAgICAgIHBh
cmFtcyA9IHVybGxpYi51cmxlbmNvZGUoeydkYXRhJzogZGF0YX0pDQo+ICsgICAgICAgIGhlYWRl
cnMgPSB7IkNvbnRlbnQtdHlwZSI6ICJhcHBsaWNhdGlvbi9qc29uIn0NCj4gKw0KPiArICAgICAg
ICBpZiBvcy5lbnZpcm9uLmdldCgiaHR0cF9wcm94eSIpIG9yIG9zLmVudmlyb24uZ2V0KCJIVFRQ
X1BST1hZIik6DQo+ICsgICAgICAgICAgICAgICAgcHJveHkgPSBwYXJzZXByb3h5KG9zLmVudmly
b24uZ2V0KCJodHRwX3Byb3h5Iikgb3Igb3MuZW52aXJvbi5nZXQoIkhUVFBfUFJPWFkiKSkNCj4g
KyAgICAgICAgICAgICAgICBpZiBwcm94eVsxXSBvciBwcm94eVsyXToNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIHJhaXNlIEV4Y2VwdGlvbigiaHR0cCBwcm94aWVzIHRoYXQgcmVxdWlyZSBh
dXRoZW50aWNhdGlvbiBhcmUgbm90IHN1cHBvcnRlZCBmb3Igbm93LiIpDQo+ICsgICAgICAgICAg
ICAgICAgY29ubiA9IGh0dHBsaWIuSFRUUENvbm5lY3Rpb24ocHJveHlbM10pDQo+ICsgICAgICAg
ICAgICAgICAgY29ubi5yZXF1ZXN0KCJQT1NUIiwgImh0dHA6Ly8lcy9DbGllbnRQb3N0LyIgJSBz
ZXJ2ZXIsIHBhcmFtcywgaGVhZGVycykNCj4gKyAgICAgICAgZWxzZToNCj4gKyAgICAgICAgICAg
ICAgICBjb25uID0gaHR0cGxpYi5IVFRQQ29ubmVjdGlvbihzZXJ2ZXIpDQo+ICsgICAgICAgICAg
ICAgICAgY29ubi5yZXF1ZXN0KCJQT1NUIiwgIi9DbGllbnRQb3N0LyIsIHBhcmFtcywgaGVhZGVy
cykNCj4gKw0KPiArICAgICAgICByZXR1cm4gY29ubg0KPiAgDQo+IA0KPiAgZGVmIHNlbmREYXRh
KGpzb25fZmlsZSwgc2VydmVyKToNCj4gQEAgLTQ1LDEwICs2Myw3IEBAIGRlZiBzZW5kRGF0YShq
c29uX2ZpbGUsIHNlcnZlcik6DQo+ICAgICAgICAgICAgICByZXR1cm4NCj4gIA0KPiAgICAgICAg
ICB0cnk6DQo+IC0gICAgICAgICAgICBwYXJhbXMgPSB1cmxsaWIudXJsZW5jb2RlKHsnZGF0YSc6
IGRhdGF9KQ0KPiAtICAgICAgICAgICAgaGVhZGVycyA9IHsiQ29udGVudC10eXBlIjogImFwcGxp
Y2F0aW9uL2pzb24ifQ0KPiAtICAgICAgICAgICAgY29ubiA9IGh0dHBsaWIuSFRUUENvbm5lY3Rp
b24oc2VydmVyKQ0KPiAtICAgICAgICAgICAgY29ubi5yZXF1ZXN0KCJQT1NUIiwgIi9DbGllbnRQ
b3N0LyIsIHBhcmFtcywgaGVhZGVycykNCj4gKyAgICAgICAgICAgIGNvbm4gPSBoYW5kbGVfY29u
bmVjdGlvbihzZXJ2ZXIsIGRhdGEpDQo+ICAgICAgICAgICAgICByZXNwb25zZSA9IGNvbm4uZ2V0
cmVzcG9uc2UoKQ0KPiAgICAgICAgICAgICAgcHJpbnQgcmVzcG9uc2Uuc3RhdHVzLCByZXNwb25z
ZS5yZWFzb24NCj4gICAgICAgICAgICAgIHJlcyA9IHJlc3BvbnNlLnJlYWQoKQ0KPiBAQCAtNTks
OCArNzQsOCBAQCBkZWYgc2VuZERhdGEoanNvbl9maWxlLCBzZXJ2ZXIpOg0KPiAgICAgICAgICAg
ICAgICAgIHdpdGggb3BlbigiJXMucmVzcG9uc2UuaHRtbCIgJSBqc29uX2ZpbGUsICJ3IikgYXMg
ZjoNCj4gICAgICAgICAgICAgICAgICAgICAgZi53cml0ZShyZXMpDQo+ICAgICAgICAgICAgICBj
b25uLmNsb3NlKCkNCj4gLSAgICAgICAgZXhjZXB0Og0KPiAtICAgICAgICAgICAgICAgIHByaW50
KCJTZXJ2ZXIgY29ubmVjdGlvbiBmYWlsZWQiKQ0KPiArICAgICAgICBleGNlcHQgRXhjZXB0aW9u
IGFzIGU6DQo+ICsgICAgICAgICAgICAgICAgcHJpbnQoIlNlcnZlciBjb25uZWN0aW9uIGZhaWxl
ZDogJXMiICUgZSkNCj4gIA0KPiAgICAgIGVsc2U6DQo+ICAgICAgICAgIHByaW50KCJObyBkYXRh
IGZpbGUgZm91bmQuIikNCg0K

