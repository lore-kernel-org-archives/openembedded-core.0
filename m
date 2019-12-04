Return-Path: <frieder.schrempf@kontron.de>
X-Greylist: delayed 481 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Dec 2019 16:52:03 UTC
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
	by mail.openembedded.org (Postfix) with ESMTP id 756117F828
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 16:52:03 +0000 (UTC)
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by skedge03.snt-world.com (Postfix) with ESMTPS id 9C5A267A649;
	Wed,  4 Dec 2019 17:44:01 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
	(10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5;
	Wed, 4 Dec 2019 17:44:01 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
	sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
	15.01.1713.004; Wed, 4 Dec 2019 17:44:01 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Tom Hochstein <tom.hochstein@nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
	disable menuconfig logic
Thread-Index: AQHVn9hOKHV1irVtG0aDGZ7QPWajF6eqM5oA
Date: Wed, 4 Dec 2019 16:44:01 +0000
Message-ID: <d25ed9e2-6ff8-355a-1de0-8b51aef9e2c8@kontron.de>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
In-Reply-To: <20191120192419.7352-1-tom.hochstein@nxp.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 9C5A267A649.AF428
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
	Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: openembedded-core@lists.openembedded.org,
	tom.hochstein@nxp.com
X-Spam-Status: No
Subject: Re: [PATCH 1/2] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Wed, 04 Dec 2019 16:52:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AA0924CCDAB034CA98E48283863E8B4@snt-world.com>
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDIwLjExLjE5IDIwOjI1LCBUb20gSG9jaHN0ZWluIHdyb3RlOg0KPiB1LWJvb3Qu
aW5jIHN1cHBvcnRzIHUtYm9vdCByZWNpcGVzIHdpdGggb3Igd2l0aG91dCBtZW51Y29uZmlnIFsx
XS4NCj4gSG93ZXZlciwgcnVubmluZyBkZXZ0b29sIG9uIGEgdS1ib290IHJlY2lwZSB0aGF0IGRv
ZXMgbm90IHN1cHBvcnQgbWVudWNvbmZpZw0KPiByZXN1bHRzIGluIGFuIGVycm9yOg0KPiANCj4g
Y3A6IGNhbm5vdCBzdGF0ICcvaG9tZS9yNjA4NzQvdXBzdHJlYW0vZnNsLXh3YXlsYW5kL3RtcC93
b3JrL2lteDhtbWV2ay1mc2wtbGludXgvdS1ib290LWlteC8yMDE4LjAzLXIwL3UtYm9vdC1pbXgt
MjAxOC4wMy8vLmNvbmZpZyc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gDQo+IFRoZSBw
cm9ibGVtIGlzIHRoZSBkZXZ0b29sIGxvZ2ljIGFzc3VtZXMgdGhhdCBhbnkgcmVjaXBlIHdpdGgg
YSBkb19tZW51Y29uZmlnIHRhc2sNCj4gd2lsbCBnZW5lcmF0ZSBhIC5jb25maWcgaW4gZG9fY29u
ZmlndXJlKCkuDQo+IA0KPiBGaXggdGhlIHByb2JsZW0gYnkgcmVtb3ZpbmcgdGhlIGFzc3VtcHRp
b24gd2l0aCBhIGZsYWcgdGhhdCB0aGUgcmVjaXBlIGNhbiBjb250cm9sLA0KPiBsaWtlIHRoaXM6
DQo+IA0KPiBkb19jb25maWd1cmUoKSB7DQo+ICAgICAgaWYgWyBtZW51Y29uZmlnLXN1cHBvcnRl
ZCBdOyB0aGVuDQo+ICAgICAgICAgIC4uLg0KPiAgICAgIGVsc2UNCj4gICAgICAgICAgREVWVE9P
TF9ESVNBQkxFX01FTlVDT05GSUc9dHJ1ZQ0KPiAgICAgIGZpDQo+IH0NCj4gDQo+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8xMTI3
OGUzYjJjNzViZTgwNjQ1Yjk4NDE3NjNhOTdkYmIzNWRhYWRjDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBUb20gSG9jaHN0ZWluIDx0b20uaG9jaHN0ZWluQG54cC5jb20+DQoNCkknbSBleHBlcmllbmNp
bmcgdGhpcyBpc3N1ZSBzaW5jZSBtb3ZpbmcgdG8gemV1cy4gWW91ciBmaXggaW4gdGhpcyANCnNl
cmllcyB3b3JrcyBmaW5lIGZvciBtZSBhbmQgSSB3b3VsZCByZWFsbHkgbGlrZSB0byBzZWUgdGhp
cyBtZXJnZWQgaW4gemV1cy4NCg0KVGhhbmtzLA0KRnJpZWRlcg0KDQo+IC0tLQ0KPiAgIHNjcmlw
dHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkgfCA2ICsrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc2Ny
aXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weSBiL3NjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRh
cmQucHkNCj4gaW5kZXggOGQ5YzFhMzAyMi4uNjZiZDE0MTVjMyAxMDA2NDQNCj4gLS0tIGEvc2Ny
aXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5weQ0KPiArKysgYi9zY3JpcHRzL2xpYi9kZXZ0b29s
L3N0YW5kYXJkLnB5DQo+IEBAIC05NDAsOCArOTQwLDEwIEBAIGRlZiBtb2RpZnkoYXJncywgY29u
ZmlnLCBiYXNlcGF0aCwgd29ya3NwYWNlKToNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAn
fVxuJykNCj4gICAgICAgICAgICAgICBpZiByZC5nZXRWYXJGbGFnKCdkb19tZW51Y29uZmlnJywn
dGFzaycpOg0KPiAgICAgICAgICAgICAgICAgICBmLndyaXRlKCdcbmRvX2NvbmZpZ3VyZV9hcHBl
bmQoKSB7XG4nDQo+IC0gICAgICAgICAgICAgICAgJyAgICBjcCAke0J9Ly5jb25maWcgJHtTfS8u
Y29uZmlnLmJhc2VsaW5lXG4nDQo+IC0gICAgICAgICAgICAgICAgJyAgICBsbiAtc2ZUICR7Qn0v
LmNvbmZpZyAke1N9Ly5jb25maWcubmV3XG4nDQo+ICsgICAgICAgICAgICAgICAgJyAgICBpZiBb
ICEgJHtERVZUT09MX0RJU0FCTEVfTUVOVUNPTkZJR30gXTsgdGhlblxuJw0KPiArICAgICAgICAg
ICAgICAgICcgICAgICAgIGNwICR7Qn0vLmNvbmZpZyAke1N9Ly5jb25maWcuYmFzZWxpbmVcbicN
Cj4gKyAgICAgICAgICAgICAgICAnICAgICAgICBsbiAtc2ZUICR7Qn0vLmNvbmZpZyAke1N9Ly5j
b25maWcubmV3XG4nDQo+ICsgICAgICAgICAgICAgICAgJyAgICBmaVxuJw0KPiAgICAgICAgICAg
ICAgICAgICAnfVxuJykNCj4gICAgICAgICAgICAgICBpZiBpbml0aWFsX3JldjoNCj4gICAgICAg
ICAgICAgICAgICAgZi53cml0ZSgnXG4jIGluaXRpYWxfcmV2OiAlc1xuJyAlIGluaXRpYWxfcmV2
KQ0KPiA=

