Return-Path: <frieder.schrempf@kontron.de>
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE4490123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 12:17:12 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by skedge04.snt-world.com (Postfix) with ESMTPS id 9A56B67A8C6;
	Thu, 19 Sep 2019 14:17:11 +0200 (CEST)
Received: from sntmail14r.snt-is.com (10.203.32.184) by sntmail11s.snt-is.com
	(10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5;
	Thu, 19 Sep 2019 14:17:11 +0200
Received: from sntmail14r.snt-is.com ([fe80::c8f3:eae9:52c2:11a8]) by
	sntmail14r.snt-is.com ([fe80::c8f3:eae9:52c2:11a8%3]) with mapi id
	15.01.1713.004; Thu, 19 Sep 2019 14:17:11 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [warrior][PATCH] uboot: fixes to uboot-extlinux-config
	attribute values
Thread-Index: AQHVaXsQ4FzNqdi46kOze0zy2ww9cacy09UA
Date: Thu, 19 Sep 2019 12:17:11 +0000
Message-ID: <0fcd6a5b-4f6d-9709-4f2f-266723f4a569@kontron.de>
References: <20190912150214.29180-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190912150214.29180-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 9A56B67A8C6.A1142
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
	Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, wpage@polysync.io
X-Spam-Status: No
Cc: Will Page <wpage@polysync.io>
Subject: Re: [warrior][PATCH] uboot: fixes to uboot-extlinux-config attribute values
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
X-List-Received-Date: Thu, 19 Sep 2019 12:17:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D16187895A282449C911E734874854D@snt-world.com>
Content-Transfer-Encoding: base64

Q2FuIHRoaXMgcGF0Y2ggYmUgcGlja2VkIHVwIGZvciB3YXJyaW9yLCBwbGVhc2U/DQpJJ20gbm90
IGFibGUgdG8gY3JlYXRlIHdvcmtpbmcgZXh0bGludXggY29uZmlncyB3aXRoIG11bHRpcGxlIGxh
YmVscy4NCg0KVGhhbmtzLA0KRnJpZWRlcg0KDQpPbiAxMi4wOS4xOSAxNzowMiwgU2NocmVtcGYg
RnJpZWRlciB3cm90ZToNCj4gRnJvbTogV2lsbCBQYWdlIDx3cGFnZUBwb2x5c3luYy5pbz4NCj4g
DQo+IFRoZSB3YXkgdGhpcyBjbGFzcyB1c2VzIG92ZXJyaWRlcyB0byBzdXBwb3J0IGdlbmVyYXRp
b24gb2YgbXVsdGlwbGUNCj4gc2VjdGlvbnMgaXMgc3ViamVjdCB0byB0d28gZGlmZmVyZW50IGlz
c3VlczogMSkgbGFiZWxzIHRoYXQgY29uZmxpY3QNCj4gd2l0aCBleGlzdGluZyBvdmVycmlkZSBu
YW1lcyBjYXVzaW5nIHRoZSB2YWx1ZSBmb3IgdGhlIGNvbmZsaWN0aW5nIGxhYmVsDQo+IHRvIGJl
IHNldCBmb3IgYWxsIGxhYmVscywgYW5kIDIpIHJldXNpbmcgdGhlIG92ZXJyaWRlIGxpc3QgdGhy
b3VnaCBlYWNoDQo+IGl0ZXJhdGlvbiwgcHJlcGVuZGluZyBlYWNoIG5ldyBsYWJlbCB0byB0aGUg
bGlzdCBvZiBvdmVycmlkZXMgbWFrZXMNCj4gZWFybGllciBsYWJlbHMnIHZhbHVlIHRha2UgcHJl
Y2VkZW5jZSBvdmVyIGxhdGVyIGxhYmVscywgbWFraW5nIGxhdGVyDQo+IGxhYmVscyB2aXJ0dWFs
bHkgaW1wb3NzaWJsZSB0byBjdXN0b21pemUuDQo+IA0KPiBUaGUgZmlyc3QgaXNzdWUgaXMgcmVz
b2x2ZWQgYnkgcmVtb3ZpbmcgYWxsIGxhYmVsIG5hbWVzIGZyb20gb3ZlcnJpZGVzDQo+IGJlZm9y
ZSBpdGVyYXRpbmcgb3ZlciBsYWJlbHMuICBUaGUgc2Vjb25kIGlzc3VlIGlzIHJlc29sdmVkIGJ5
DQo+IGdlbmVyYXRpbmcgYSBmcmVzaCBsaXN0IG9mIG92ZXJyaWRlcyB3aXRoIG9ubHkgdGhlIGN1
cnJlbnQgbGFiZWwgYWRkZWQuDQo+IA0KPiBUaGUgY3VycmVudCBsYWJlbCBpcyBhbHNvIGFwcGVu
ZGVkIHRvIHRoZSBsaXN0IG9mIG92ZXJyaWRlcyBpbnN0ZWFkIG9mDQo+IHByZXBlbmRlZCwgd2hp
Y2ggbWFrZXMgaXQgdGhlIGhpZ2hlc3QgcHJpb3JpdHkgb3ZlcnJpZGUuICBUaGlzIGlzDQo+IG1h
dGNoZXMgdGhlIGJlaGF2aW9yIG9mIGRldnRvb2wtc291cmNlLmJiY2xhc3MsIHdoaWNoIHNpbWls
YXJseQ0KPiBtb25rZXktcGF0Y2hlcyBvdmVycmlkZXMuDQo+IA0KPiBDbG9zZXMgaHR0cHM6Ly9i
dWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzQ2OSAuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBXaWxsIFBhZ2UgPHdwYWdlQHBvbHlzeW5jLmlvPg0KPiBTaWduZWQtb2Zm
LWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4N
Cj4gLS0tDQo+ICAgbWV0YS9jbGFzc2VzL3Vib290LWV4dGxpbnV4LWNvbmZpZy5iYmNsYXNzIHwg
MTMgKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3Vib290LWV4dGxp
bnV4LWNvbmZpZy5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3Vib290LWV4dGxpbnV4LWNvbmZpZy5i
YmNsYXNzDQo+IGluZGV4IGI1YjFhODFkZmMuLmY0YmY5NGJlMDQgMTAwNjQ0DQo+IC0tLSBhL21l
dGEvY2xhc3Nlcy91Ym9vdC1leHRsaW51eC1jb25maWcuYmJjbGFzcw0KPiArKysgYi9tZXRhL2Ns
YXNzZXMvdWJvb3QtZXh0bGludXgtY29uZmlnLmJiY2xhc3MNCj4gQEAgLTEwNCwxMyArMTA0LDE2
IEBAIHB5dGhvbiBkb19jcmVhdGVfZXh0bGludXhfY29uZmlnKCkgew0KPiAgICAgICAgICAgICAg
ICAgICBpZiBkZWZhdWx0Og0KPiAgICAgICAgICAgICAgICAgICAgICAgY2ZnZmlsZS53cml0ZSgn
REVGQVVMVCAlc1xuJyAlIChkZWZhdWx0KSkNCj4gICANCj4gLSAgICAgICAgICAgIGZvciBsYWJl
bCBpbiBsYWJlbHMuc3BsaXQoKToNCj4gKyAgICAgICAgICAgICMgTmVlZCB0byBkZWNvbmZsaWN0
IHRoZSBsYWJlbHMgd2l0aCBleGlzdGluZyBvdmVycmlkZXMNCj4gKyAgICAgICAgICAgIGxhYmVs
X292ZXJyaWRlcyA9IGxhYmVscy5zcGxpdCgpDQo+ICsgICAgICAgICAgICBkZWZhdWx0X292ZXJy
aWRlcyA9IGxvY2FsZGF0YS5nZXRWYXIoJ09WRVJSSURFUycpLnNwbGl0KCc6JykNCj4gKyAgICAg
ICAgICAgICMgV2UncmUga2VlcGluZyBhbGwgdGhlIGV4aXN0aW5nIG92ZXJyaWRlcyB0aGF0IGFy
ZW4ndCB1c2VkIGFzIGEgbGFiZWwNCj4gKyAgICAgICAgICAgICMgYW4gb3ZlcnJpZGUgZm9yIHRo
YXQgbGFiZWwgd2lsbCBiZSBhZGRlZCBiYWNrIGluIHdoaWxlIHdlJ3JlIHByb2Nlc3NpbmcgdGhh
dCBsYWJlbA0KPiArICAgICAgICAgICAga2VlcF9vdmVycmlkZXMgPSBsaXN0KGZpbHRlcihsYW1i
ZGEgeDogeCBub3QgaW4gbGFiZWxfb3ZlcnJpZGVzLCBkZWZhdWx0X292ZXJyaWRlcykpDQo+ICAg
DQo+IC0gICAgICAgICAgICAgICAgb3ZlcnJpZGVzID0gbG9jYWxkYXRhLmdldFZhcignT1ZFUlJJ
REVTJykNCj4gLSAgICAgICAgICAgICAgICBpZiBub3Qgb3ZlcnJpZGVzOg0KPiAtICAgICAgICAg
ICAgICAgICAgICBiYi5mYXRhbCgnT1ZFUlJJREVTIG5vdCBkZWZpbmVkJykNCj4gKyAgICAgICAg
ICAgIGZvciBsYWJlbCBpbiBsYWJlbHMuc3BsaXQoKToNCj4gICANCj4gLSAgICAgICAgICAgICAg
ICBsb2NhbGRhdGEuc2V0VmFyKCdPVkVSUklERVMnLCBsYWJlbCArICc6JyArIG92ZXJyaWRlcykN
Cj4gKyAgICAgICAgICAgICAgICBsb2NhbGRhdGEuc2V0VmFyKCdPVkVSUklERVMnLCAnOicuam9p
bihrZWVwX292ZXJyaWRlcyArIFtsYWJlbF0pKQ0KPiAgIA0KPiAgICAgICAgICAgICAgICAgICBl
eHRsaW51eF9jb25zb2xlID0gbG9jYWxkYXRhLmdldFZhcignVUJPT1RfRVhUTElOVVhfQ09OU09M
RScpDQo+ICAgDQo+IA==

