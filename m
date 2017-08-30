Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10EA677D30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 07:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6942218462;
	Wed, 30 Aug 2017 09:41:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id HT2f4sdUyQER; Wed, 30 Aug 2017 09:41:47 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5D9861845B;
	Wed, 30 Aug 2017 09:41:47 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D84A1A0AE;
	Wed, 30 Aug 2017 09:41:47 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 421E51A0AC;
	Wed, 30 Aug 2017 09:41:47 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 30 Aug 2017 09:41:47 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 3687021CD;
	Wed, 30 Aug 2017 09:41:47 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 30 Aug 2017 09:41:47 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 30 Aug 2017 09:41:47 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Philip Balister <philip@balister.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?W09FLWNvcmVdIOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEF2b2lkIGJ1?=
	=?utf-8?Q?ild_failures_due_to_setscene_errors?=
Thread-Index: AQHTIQIW2fUiW62/K06heB/3BJQcc6KbxxkwgAADuICAALQb4A==
Date: Wed, 30 Aug 2017 07:41:47 +0000
Message-ID: <906d179400764587a86b0b120ce99951@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<20170829200453.2382.2374@do.openembedded.org>
	<36fcdba0fe5f4161b32cc01d9bf87985@XBOX02.axis.com>
	<c752c36a-0b4c-7ab0-5ce1-b98bf8998585@balister.org>
In-Reply-To: <c752c36a-0b4c-7ab0-5ce1-b98bf8998585@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEF2b2lkIGJ1aWxkIGZhaWx1cmVzIGR1ZSB0byBzZXRzY2VuZSBlcnJvcnM=?=
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
X-List-Received-Date: Wed, 30 Aug 2017 07:41:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBQaGlsaXAg
QmFsaXN0ZXINCj4gU2VudDogZGVuIDMwIGF1Z3VzdGkgMjAxNyAwMDozNg0KPiBUbzogUGV0ZXIg
S2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVuZW1iZWRkZWQt
DQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEF2b2lkIGJ1aWxkIGZhaWx1cmVzDQo+IGR1ZSB0
byBzZXRzY2VuZSBlcnJvcnMNCj4gDQo+IE9uIDA4LzI5LzIwMTcgMDQ6MjUgUE0sIFBldGVyIEtq
ZWxsZXJzdGVkdCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogUGF0Y2h3b3JrIFttYWlsdG86cGF0Y2h3b3JrQHBhdGNod29yay5vcGVuZW1iZWRkZWQu
b3JnXQ0KPiA+PiBTZW50OiBkZW4gMjkgYXVndXN0aSAyMDE3IDIyOjA1DQo+ID4+IFRvOiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPj4gQ2M6IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gU3ViamVjdDog4pyX
IHBhdGNodGVzdDogZmFpbHVyZSBmb3IgQXZvaWQgYnVpbGQgZmFpbHVyZXMgZHVlIHRvDQo+IHNl
dHNjZW5lDQo+ID4+IGVycm9ycw0KPiA+Pg0KPiA+PiA9PSBTZXJpZXMgRGV0YWlscyA9PQ0KPiA+
Pg0KPiA+PiBTZXJpZXM6IEF2b2lkIGJ1aWxkIGZhaWx1cmVzIGR1ZSB0byBzZXRzY2VuZSBlcnJv
cnMNCj4gPj4gUmV2aXNpb246IDENCj4gPj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5vcGVu
ZW1iZWRkZWQub3JnL3Nlcmllcy84NTc1Lw0KPiA+PiBTdGF0ZSA6IGZhaWx1cmUNCj4gPj4NCj4g
Pj4gPT0gU3VtbWFyeSA9PQ0KPiA+Pg0KPiA+Pg0KPiA+PiBUaGFuayB5b3UgZm9yIHN1Ym1pdHRp
bmcgdGhpcyBwYXRjaCBzZXJpZXMgdG8gT3BlbkVtYmVkZGVkIENvcmUuDQo+IFRoaXMgaXMNCj4g
Pj4gYW4gYXV0b21hdGVkIHJlc3BvbnNlLiBTZXZlcmFsIHRlc3RzIGhhdmUgYmVlbiBleGVjdXRl
ZCBvbiB0aGUNCj4gcHJvcG9zZWQNCj4gPj4gc2VyaWVzIGJ5IHBhdGNodGVzdCByZXN1bHRpbmcg
aW4gdGhlIGZvbGxvd2luZyBmYWlsdXJlczoNCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gKiBJc3N1
ZSAgICAgICAgICAgICBTZXJpZXMgZG9lcyBub3QgYXBwbHkgb24gdG9wIG9mIHRhcmdldCBicmFu
Y2gNCj4gW3Rlc3Rfc2VyaWVzX21lcmdlX29uX2hlYWRdDQo+ID4+ICAgU3VnZ2VzdGVkIGZpeCAg
ICBSZWJhc2UgeW91ciBzZXJpZXMgb24gdG9wIG9mIHRhcmdldGVkIGJyYW5jaA0KPiA+PiAgIFRh
cmdldGVkIGJyYW5jaCAgbWFzdGVyIChjdXJyZW50bHkgYXQgMjQ1NDAxOTg0NCkNCg0KQWN0dWFs
bHksIHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGdldCBhIGJldHRlciBlcnJvciBtZXNzYWdlIHRo
YXQgDQppbmRpY2F0ZXMgdGhhdCBvbmUgaGFzIG1peGVkIGluIHBhdGNoZXMgZm9yIG90aGVyIHBy
b2plY3RzIHRoYXQgYXJlIA0KcGFydCBvZiBQb2t5PyBXaGVuIHdvcmtpbmcgd2l0aCBQb2t5IGFz
IHRoZSBiYXNpcywgZGlmZmVyZW50aWF0aW5nIA0KYmV0d2VlbiwgZS5nLiwgYml0YmFrZSBhbmQg
T0UtQ29yZSBpcyBub3Qgc29tZXRoaW5nIHRoYXQgY29tZXMgDQpuYXR1cmFsLiBJIGFjdHVhbGx5
IGhhZCB0byB0aGluayBib3RoIG9uY2UgYW5kIHR3aWNlIGJlZm9yZSBJIA0KcmVhbGl6ZWQgdGhh
dCBvbmUgb2YgbXkgcGF0Y2hlcyB3YXMgYWN0dWFsbHkgZm9yIGJpdGJha2UgKGFuZCBqdXN0IA0K
YmFyZWx5IHN0b3BwZWQgbWUgaW4gdGltZSBmcm9tIHNlbmRpbmcgYW4gaXJyaXRhdGVkIG1haWwg
YWJvdXQgd2h5IA0KcGF0Y2h0ZXN0IHdhc24ndCBhY2NlcHRpbmcgbXkgY2hhbmdlcykuDQoNCj4g
PiBBcmdoLCB3aHkgY2FuJ3QgdGhpcyBoYW5kbGUgY29tYmluZWQgYml0YmFrZSBhbmQgT0UtQ29y
ZSBjaGFuZ2VzLA0KPiA+IGkuZS4sIGNoYW5nZXMgZm9yIFBva3kuIE9oIHdlbGwsIHNlcGFyYXRl
IHBhdGNoZXMgY29taW5nIHVwLi4uDQo+IA0KPiBCZWNhdXNlIHBva3kgaXNuJ3QgdGhlIHVwc3Ry
ZWFtIHByb2plY3QuDQo+IA0KPiBQaGlsaXANCg0KV2VsbCwgSSBrbm93IHRoYXQuIEhvd2V2ZXIs
IEkgZG91YnQgd2UgYXJlIHRoZSBvbmx5IG9uZXMgd2hvIHVzZSBQb2t5IA0KYXMgdGhlIGJhc2Ug
Zm9yIG91ciBkaXN0cmlidXRpb24uIFRodXMgUG9reSBpcyBvdXIgZGUgZmFjdG8gdXBzdHJlYW0u
IA0KU28gd2hlbiB3b3JraW5nIG9uIGEgY2hhbmdlIHRoYXQgYWZmZWN0cyBib3RoIEJpdEJha2Us
IE9FLUNvcmUgYW5kIA0KbWF5YmUgZXZlbiB0aGUgT0UgZG9jdW1lbnRhdGlvbiAobm9uZSBvZiB3
aGljaCBpcyB1bmNvbW1vbiksIGhhdmluZyANCnRvIHNwbGl0IHRoZSBjaGFuZ2VzIGluIG11bHRp
cGxlIHN0YWNrcyBhbmQga2VlcGluZyB0cmFjayBvZiB0aGVtIA0KdG9nZXRoZXIgb3ZlciBtdWx0
aXBsZSBwcm9qZWN0cyBpcyBub3QgdmVyeSBlbmNvdXJhZ2luZywgZXNwZWNpYWxseSANCndoZW4g
UG9reSBpcyBkaXN0cmlidXRlZCBhcyBhIHVuaXQuDQoNCkkgYW0gbm90IGFza2luZyBmb3IgdGhp
cyB0byBjaGFuZ2UsIGJ1dCBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZSB0byBiZSANCmFibGUgdG8g
dHJlYXQgUG9reSBhcyBhbiB1cHN0cmVhbSBhbmQgdG8gZGVsaXZlciBjaGFuZ2VzIHRoYXQgc3Bh
biB0aGUgDQppbmRpdmlkdWFsIHByb2plY3RzIGFzIG9uZSBzZXQgb2YgY2hhbmdlcyBhZ2FpbnN0
IFBva3kuDQoNCi8vUGV0ZXINCg0K

