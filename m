Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1UeSP7-00088P-Dz
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 17:53:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 May 2013 08:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,707,1363158000"; d="scan'208";a="340276121"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 20 May 2013 08:35:19 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.161]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.132]) with mapi id
	14.03.0123.003; Mon, 20 May 2013 16:35:18 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] runqemu: fix networking issues
Thread-Index: AQHOVUJsRiE0WCKdGk+DH3XxdYuHKZkOJBcA
Date: Mon, 20 May 2013 15:35:18 +0000
Message-ID: <1369064142.2210.7.camel@firebird.rb.intel.com>
References: <1369044584-6053-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1369044584-6053-1-git-send-email-laurentiu.palcu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.149]
MIME-Version: 1.0
Subject: Re: [PATCH] runqemu: fix networking issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 15:53:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9ED3F3740FFE04589B13C5346403444@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIE1vbiwgMjAxMy0wNS0yMCBhdCAxMzowOSArMDMwMCwgTGF1cmVudGl1IFBhbGN1IHdy
b3RlOg0KPiBBZnRlciBzd2l0Y2hpbmcgZnJvbSBpZmNvbmZpZyB0byBpcCwgbmV0d29ya2luZyBz
dG9wcGVkIHdvcmtpbmcuIFRoaXMNCj4gY29tbWl0IGNvbnRhaW5zIHRoZSBmb2xsb3dpbmcgZml4
ZXM6DQo+IA0KPiAgKiBzZXQgYSBkZWNlbnQgYnJvYWRjYXN0IGFkZHJlc3MgZm9yIHRoZSB0YXAg
ZGV2aWNlOw0KPiAgKiBicmluZyB1cCB0aGUgZGV2aWNlOw0KPiANCj4gU2lnbmVkLW9mZi1ieTog
TGF1cmVudGl1IFBhbGN1IDxsYXVyZW50aXUucGFsY3VAaW50ZWwuY29tPg0KPiAtLS0NCj4gQXBw
YXJlbnRseSwgdGhlIGF1dG9idWlsZGVyIGhhcyBzb21lIG1hZ2ljIGludG8gaXQgYmVjYXVzZSBh
bGwgdGhlIHNhbml0eSB0ZXN0cw0KPiBzdWNjZWVkZWQuLi4gU28sIEkgZG9uJ3Qga25vdyB3aHkg
QUIgdGVzdHMgc3VjY2VlZGVkIGJ1dCBvbiBteSBtYWNoaW5lLCBhbmQgc2V2ZXJhbA0KPiBvdGhl
cnMsIG5ldHdvcmtpbmcgd2FzIGJyb2tlbiBhbmQgY291bGRuJ3QgY29ubmVjdCBpbnRvIHRoZSBx
ZW11IGltYWdlLiBJZiBJJ20NCj4gbWlzc2luZyBzb21ldGhpbmcsIHBsZWFzZSwgZG8gbm90IGhl
c2l0YXRlIHRvIGNvcnJlY3QgbWUuIFRoaXMgcGF0Y2ggZml4ZXMgdGhlDQo+IGlzc3VlIGZvciBt
ZSB0aG91Z2guDQo+IA0KPiBUaGFua3MsDQo+IExhdXJlbnRpdQ0KPiANCj4gIHNjcmlwdHMvcnVu
cWVtdS1pZnVwIHwgICAgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL3J1bnFlbXUtaWZ1cCBi
L3NjcmlwdHMvcnVucWVtdS1pZnVwDQo+IGluZGV4IDg5NDgxNTMuLjEwOGQ5YTQgMTAwNzU1DQo+
IC0tLSBhL3NjcmlwdHMvcnVucWVtdS1pZnVwDQo+ICsrKyBiL3NjcmlwdHMvcnVucWVtdS1pZnVw
DQo+IEBAIC0xMDAsNyArMTAwLDggQEAgaWYgWyAhIC14ICIkSVBUQUJMRVMiIF07IHRoZW4NCj4g
IGZpDQo+ICANCj4gIG49JFsgKGBlY2hvICRUQVAgfCBzZWQgJ3MvdGFwLy8nYCAqIDIpICsgMSBd
DQo+IC0kSUZDT05GSUcgYWRkciBhZGQgMTkyLjE2OC43LiRuLzMyIGRldiAkVEFQDQo+ICskSUZD
T05GSUcgYWRkciBhZGQgMTkyLjE2OC43LiRuLzMyIGJyb2FkY2FzdCAxOTIuMTY4LjcuMjU1IGRl
diAkVEFQDQo+ICskSUZDT05GSUcgbGluayBzZXQgZGV2ICRUQVAgdXANCj4gIA0KPiAgZGVzdD0k
WyAoYGVjaG8gJFRBUCB8IHNlZCAncy90YXAvLydgICogMikgKyAyIF0NCj4gICRST1VURSBhZGQg
LWhvc3QgMTkyLjE2OC43LiRkZXN0ICRUQVANCg0KVGhpcyBmaXhlcyB0aGUgaXNzdWUgZm9yIG1l
IHRvbywgdGhvdWdodCB0aGVyZSBpcyBzb21ldGhpbmcgdmVyeSBzdHJhbmdlDQpoZXJlLiBMYXN0
IHdlZWsgSSByYW4gbWFzdGVyIGJ1aWxkcyAod2l0aCBuZXdlciBjb21taXRzIHRoYW4gdGhlDQpp
ZmNvbmZpZy0+aXAgY2hhbmdlKSB3aXRob3V0IGV2ZXIgc2VlaW5nIHRoaXMgaXNzdWUuIEJ1dCB0
b2RheSBvbiB0aGUNCnNhbWUgY29tbWl0IHRoYXQgb24gRnJpZGF5IHdvcmtlZCwgSSBnZXQgbm8g
bmV0d29yay4gVGhlIG9ubHkgdGhpbmcgdGhhdA0KY2hhbmdlZCBpcyB0aGF0IG15IG1hY2hpbmUg
cmVib290ZWQgTW9uZGF5IG1vcm5pbmcuLi4gKEkgYmxhbWUgdGhlIGdhbW1hDQpyYXlzKS4gQWxz
byBJIHRoaW5rIFJPVVRFIHRvbyBzaG91bGQgYmUgY2hhbmdlZCB0byB1c2UgaXAgaW5zdGVhZCBv
ZiB0aGUNCm9sZCByb3V0ZSBjb21tYW5kLg0KDQoNClJlZ2FyZHMsDQpTdGVmYW4NCg0KDQoNCg0K


