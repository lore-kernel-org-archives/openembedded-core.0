Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1TGvuJ-00009v-EU
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 20:00:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8QHlUNd022516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Sep 2012 10:47:30 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.2.76]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0309.002;
	Wed, 26 Sep 2012 10:47:29 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] cmake.bbclass: modify construction of
	compiler flags
Thread-Index: AQHNm8OjZcCrWuKJeEK8IV3OXyof8pec5QoQ
Date: Wed, 26 Sep 2012 17:47:29 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84200BC403@ALA-MBB.corp.ad.wrs.com>
References: <1348609047-4118-1-git-send-email-jslater@windriver.com>
	<1348649261.8662.88.camel@ted>
In-Reply-To: <1348649261.8662.88.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: modify construction of compiler flags
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
X-List-Received-Date: Wed, 26 Sep 2012 18:00:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciAyNiwgMjAxMiAxOjQ4IEFNDQo+IFRvOiBTbGF0ZXIsIEpvc2VwaA0K
PiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY21ha2UuYmJjbGFzczogbW9kaWZ5IGNvbnN0cnVjdGlv
biBvZiBjb21waWxlciBmbGFncw0KPiANCj4gT24gVHVlLCAyMDEyLTA5LTI1IGF0IDE0OjM3IC0w
NzAwLCBKb2UgU2xhdGVyIHdyb3RlOg0KPiA+IFVzZSBDRkxBR1MgaW5zdGVhZCBvZiBDUFBGTEFH
UyBmb3IgQ19GTEFHUyB2YXJpYW50cy4NCj4gPiBBbHNvIHJlbW92ZSBkdXBsaWNhdGUgZmxhZ3Mg
ZnJvbSBfUkVMRUFTRSB2YXJpYW50cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0
ZXIgPGpzbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gPg0KPiA+ICoqKiBOb3RlIC0gdGhpcyBjYW4g
YnJlYWsgdGhpbmdzIHRoYXQgaGF2ZSBuZXZlciByZWFsbHkNCj4gPiAqKiogICAgICAgIGJlZW4g
Y29tcGlsZWQgd2l0aCAtTzIgb3B0aW1pemF0aW9uDQo+IA0KPiBUaGlzIGNoYW5nZSBzYXlzIHdo
YXQgeW91J3JlIGRvaW5nIGJ1dCBub3QgcmVhbGx5IHdoeS4gSG93IGFyZSB0aGluZ3MNCj4gYnJv
a2VuIGFuZCB3aHkgaXMgdGhpcyBhbiBpbXByb3ZlbWVudD8NCg0KVGhlIHNwZWNpZmljIHByb2Js
ZW0gaXMgdGhhdCwgc2luY2UgQ0ZMQUdTIGFyZSBpZ25vcmVkLCB0aGVyZSBpcyBubyBkaWZmZXJl
bmNlDQpiZXR3ZWVuIGRlYnVnICgtTzApIGFuZCBwcm9kdWN0aW9uICgtTzIpIGJ1aWxkcy4gIEl0
IGFsc28gc2VlbXMgY291bnRlci1pbnR1aXRpdmUNCnRoYXQgQ1hYX0ZMQUdTIGFyZSBiYXNlZCBv
biBDWFhGTEFHUywgYnV0IENfRkxBR1MgYXJlIG5vdCBiYXNlZCBvbiBDRkxBR1MuDQoNCkpvZQ0K
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0KPiA+IC0tLQ0KPiA+ICBtZXRhL2Ns
YXNzZXMvY21ha2UuYmJjbGFzcyB8ICAgIDYgKysrLS0tDQo+ID4gIDEgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEvY2xhc3Nlcy9jbWFrZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MNCj4g
PiBpbmRleCBkY2Q5NzRhLi5hYzVjMDQ4IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9j
bWFrZS5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MNCj4gPiBA
QCAtMTksMTAgKzE5LDEwIEBAIE9FQ01BS0VfQ19DT01QSUxFUiA/PSAiYGVjaG8gJHtDQ30gfCBz
ZWQgJ3MvXlwoW14gXSpcKS4qL1wxLydgIg0KPiA+ICBPRUNNQUtFX0NYWF9DT01QSUxFUiA/PSAi
YGVjaG8gJHtDWFh9IHwgc2VkICdzL15cKFteIF0qXCkuKi9cMS8nYCINCj4gPg0KPiA+ICAjIENv
bXBpbGVyIGZsYWdzDQo+ID4gLU9FQ01BS0VfQ19GTEFHUyA/PSAiJHtIT1NUX0NDX0FSQ0h9ICR7
VE9PTENIQUlOX09QVElPTlN9ICR7Q1BQRkxBR1N9Ig0KPiA+ICtPRUNNQUtFX0NfRkxBR1MgPz0g
IiR7SE9TVF9DQ19BUkNIfSAke1RPT0xDSEFJTl9PUFRJT05TfSAke0NGTEFHU30iDQo+ID4gIE9F
Q01BS0VfQ1hYX0ZMQUdTID89ICIke0hPU1RfQ0NfQVJDSH0gJHtUT09MQ0hBSU5fT1BUSU9OU30g
JHtDWFhGTEFHU30gLWZwZXJtaXNzaXZlIg0KPiA+IC1PRUNNQUtFX0NfRkxBR1NfUkVMRUFTRSA/
PSAiJHtTRUxFQ1RFRF9PUFRJTUlaQVRJT059ICR7Q1BQRkxBR1N9IC1ETkRFQlVHIg0KPiA+IC1P
RUNNQUtFX0NYWF9GTEFHU19SRUxFQVNFID89ICIke1NFTEVDVEVEX09QVElNSVpBVElPTn0gJHtD
WFhGTEFHU30gLUROREVCVUciDQo+ID4gK09FQ01BS0VfQ19GTEFHU19SRUxFQVNFID89ICIke0NG
TEFHU30gLUROREVCVUciDQo+ID4gK09FQ01BS0VfQ1hYX0ZMQUdTX1JFTEVBU0UgPz0gIiR7Q1hY
RkxBR1N9IC1ETkRFQlVHIg0KPiA+DQo+ID4gIE9FQ01BS0VfUlBBVEggPz0gIiINCj4gPiAgT0VD
TUFLRV9QRVJMTkFUSVZFX0RJUiA/Pz0gIiINCj4gDQoNCg==


