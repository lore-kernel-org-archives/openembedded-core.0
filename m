Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDE2D782BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 2B15E1842D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:25:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id W4in6F6eaBIA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 552FF18410
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 389821A0AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DA541A0AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:25:51 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:25:51 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 2219D31E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:25:51 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 29 Aug 2017 22:25:51 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 29 Aug 2017 22:25:50 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 29 Aug 2017 22:25:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgQXZvaWQgYnVpbGQgZmFpbHVy?=
	=?utf-8?Q?es_due_to_setscene_errors?=
Thread-Index: AQHTIQIW2fUiW62/K06heB/3BJQcc6Kbxxkw
Date: Tue, 29 Aug 2017 20:25:50 +0000
Message-ID: <36fcdba0fe5f4161b32cc01d9bf87985@XBOX02.axis.com>
References: <cover.1504036763.git.pkj@axis.com>
	<20170829200453.2382.2374@do.openembedded.org>
In-Reply-To: <20170829200453.2382.2374@do.openembedded.org>
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
X-List-Received-Date: Tue, 29 Aug 2017 20:25:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXRjaHdvcmsgW21haWx0bzpw
YXRjaHdvcmtAcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmddDQo+IFNlbnQ6IGRlbiAyOSBhdWd1
c3RpIDIwMTcgMjI6MDUNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0
ZWR0QGF4aXMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBBdm9pZCBidWlsZCBm
YWlsdXJlcyBkdWUgdG8gc2V0c2NlbmUNCj4gZXJyb3JzDQo+IA0KPiA9PSBTZXJpZXMgRGV0YWls
cyA9PQ0KPiANCj4gU2VyaWVzOiBBdm9pZCBidWlsZCBmYWlsdXJlcyBkdWUgdG8gc2V0c2NlbmUg
ZXJyb3JzDQo+IFJldmlzaW9uOiAxDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsub3BlbmVt
YmVkZGVkLm9yZy9zZXJpZXMvODU3NS8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1t
YXJ5ID09DQo+IA0KPiANCj4gVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoaXMgcGF0Y2ggc2Vy
aWVzIHRvIE9wZW5FbWJlZGRlZCBDb3JlLiBUaGlzIGlzDQo+IGFuIGF1dG9tYXRlZCByZXNwb25z
ZS4gU2V2ZXJhbCB0ZXN0cyBoYXZlIGJlZW4gZXhlY3V0ZWQgb24gdGhlIHByb3Bvc2VkDQo+IHNl
cmllcyBieSBwYXRjaHRlc3QgcmVzdWx0aW5nIGluIHRoZSBmb2xsb3dpbmcgZmFpbHVyZXM6DQo+
IA0KPiANCj4gDQo+ICogSXNzdWUgICAgICAgICAgICAgU2VyaWVzIGRvZXMgbm90IGFwcGx5IG9u
IHRvcCBvZiB0YXJnZXQgYnJhbmNoIFt0ZXN0X3Nlcmllc19tZXJnZV9vbl9oZWFkXQ0KPiAgIFN1
Z2dlc3RlZCBmaXggICAgUmViYXNlIHlvdXIgc2VyaWVzIG9uIHRvcCBvZiB0YXJnZXRlZCBicmFu
Y2gNCj4gICBUYXJnZXRlZCBicmFuY2ggIG1hc3RlciAoY3VycmVudGx5IGF0IDI0NTQwMTk4NDQp
DQoNCkFyZ2gsIHdoeSBjYW4ndCB0aGlzIGhhbmRsZSBjb21iaW5lZCBiaXRiYWtlIGFuZCBPRS1D
b3JlIGNoYW5nZXMsIGkuZS4sIA0KY2hhbmdlcyBmb3IgUG9reS4gT2ggd2VsbCwgc2VwYXJhdGUg
cGF0Y2hlcyBjb21pbmcgdXAuLi4NCg0KPiBJZiB5b3UgYmVsaWV2ZSBhbnkgb2YgdGhlc2UgdGVz
dCByZXN1bHRzIGFyZSBpbmNvcnJlY3QsIHBsZWFzZSByZXBseSB0byB0aGUNCj4gbWFpbGluZyBs
aXN0IChvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnKSByYWlzaW5nIHlv
dXIgY29uY2VybnMuDQo+IE90aGVyd2lzZSB3ZSB3b3VsZCBhcHByZWNpYXRlIHlvdSBjb3JyZWN0
aW5nIHRoZSBpc3N1ZXMgYW5kIHN1Ym1pdHRpbmcgYSBuZXcNCj4gdmVyc2lvbiBvZiB0aGUgcGF0
Y2hzZXQgaWYgYXBwbGljYWJsZS4gUGxlYXNlIGVuc3VyZSB5b3UgYWRkL2luY3JlbWVudCB0aGUN
Cj4gdmVyc2lvbiBudW1iZXIgd2hlbiBzZW5kaW5nIHRoZSBuZXcgdmVyc2lvbiAoaS5lLiBbUEFU
Q0hdIC0+IFtQQVRDSCB2Ml0gLT4NCj4gW1BBVENIIHYzXSAtPiAuLi4pLg0KPiANCj4gLS0tDQo+
IFRlc3QgZnJhbWV3b3JrOiBodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNn
aS9wYXRjaHRlc3QNCj4gVGVzdCBzdWl0ZTogICAgIGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9jZ2l0L2NnaXQuY2dpL3BhdGNodGVzdC1vZQ0KDQovL1BldGVyDQoNCg==

