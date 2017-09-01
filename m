Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75D3678481
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 12:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DE22C18555;
	Fri,  1 Sep 2017 14:00:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id A0duezCWmTuw; Fri,  1 Sep 2017 14:00:14 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 189E31855D;
	Fri,  1 Sep 2017 14:00:14 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 037961E07E;
	Fri,  1 Sep 2017 14:00:14 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC33C1E07D;
	Fri,  1 Sep 2017 14:00:13 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri,  1 Sep 2017 14:00:13 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id DFE5E2450;
	Fri,  1 Sep 2017 14:00:13 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 1 Sep 2017 14:00:13 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 1 Sep 2017 14:00:13 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 1 Sep 2017 14:00:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH v2 0/2] Make source code browsable locally -
	devtool srctree
Thread-Index: AQHTIW7p5GTx9+70vUOVuEZKaHrbLaKdZ8IAgACZTvCAAMTegIABKLcg
Date: Fri, 1 Sep 2017 12:00:13 +0000
Message-ID: <e986d856398445c89fa14558da885793@XBOX02.axis.com>
References: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
	<2d1bb10c-e13c-79d0-4e0e-bd5aa5d99a42@axis.com>
	<CAJ86T=Vfoe5e86OokE3j9dY8Lc0s4A1OAZPwo318mYdFiKTYdA@mail.gmail.com>
	<0fa15a09e9554731a800e4e771e25ab9@XBOX02.axis.com>
	<CAJ86T=XX0-pkH-4jRMq1o3pJbz-iwGcksGuR7oZHkaYgn86new@mail.gmail.com>
In-Reply-To: <CAJ86T=XX0-pkH-4jRMq1o3pJbz-iwGcksGuR7oZHkaYgn86new@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Make source code browsable locally - devtool srctree
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
X-List-Received-Date: Fri, 01 Sep 2017 12:00:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZSBNY0N1cmR5IFttYWls
dG86YXJtY2N1cmR5QGdtYWlsLmNvbV0NCj4gU2VudDogZGVuIDMxIGF1Z3VzdGkgMjAxNyAyMjox
MA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+IENjOiBUb2JpYXMgSGFnZWxib3JuIDxUb2JpYXMuSGFnZWxib3JuQGF4aXMuY29tPjsgT0Ug
Q29yZSBtYWlsaW5nIGxpc3QNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyIDAvMl0gTWFrZSBzb3Vy
Y2UgY29kZSBicm93c2FibGUNCj4gbG9jYWxseSAtIGRldnRvb2wgc3JjdHJlZQ0KPiANCj4gT24g
V2VkLCBBdWcgMzAsIDIwMTcgYXQgMTE6MzIgUE0sIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0
ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPj4NCj4gPj4gSnVzdCBmb3IgcmVm
ZXJlbmNlLCBJIHRoaW5rIHlvdSBjb3VsZCBhY2hpZXZlIHNvbWV0aGluZyBxdWl0ZQ0KPiBzaW1p
bGFyDQo+ID4+IHdpdGg6DQo+ID4+DQo+ID4+ICAgYml0YmFrZSA8eW91ci1pbWFnZT4gLS1ydW5h
bGwgY2xlYW4gICggb3Igcm0gLXJmIHRtcCApDQo+ID4+ICAgYml0YmFrZSA8eW91ci1pbWFnZT4g
LS1ydW5hbGwgcGF0Y2gNCj4gPg0KPiA+IFllcywgYnV0IHRoZSBkcmF3YmFjayB3aXRoIHRoaXMg
aXMgdGhhdCB0byBmaW5kIHRoZSBzb3VyY2UgY29kZSBmb3INCj4gdGhlDQo+ID4gaW5kaXZpZHVh
bCBwYWNrYWdlcywgeW91IGhhdmUgdG8gZGl2ZSBkb3duIGludG8gdG1wL3dvcmsvLi4uIHdoaWNo
DQo+IGNhbg0KPiA+IGJlIHF1aXRlIGRpc2NvdXJhZ2luZyBmb3Igc29tZW9uZSB3aG8gaXMgbm90
IGFuIGV4cGVydCBpbiBiaXRiYWtlLg0KPiBXaGF0DQo+ID4gb3VyIGRldmVsb3BlcnMgcmVxdWVz
dGVkIHdhcyBhIHdheSB0byBnZXQgZWFzeSBhY2Nlc3MgdG8gYWxsIHRoZQ0KPiBzb3VyY2UNCj4g
PiBjb2RlIGJlaW5nIHVzZWQsIHR5cGljYWxseSB0byBiZSBhYmxlIHRvIHNlYXJjaCB0aHJvdWdo
IGl0IGFsbA0KPiBsb29raW5nDQo+ID4gZm9yIHNvbWUgc3BlY2lmaWMgZmVhdHVyZS4NCj4gDQo+
IFJpZ2h0LiBJIHdhc24ndCB0cnlpbmcgdG8gc3VnZ2VzdCB0aGF0IHRoZSB0d28gYXBwcm9hY2hl
cyB3ZXJlDQo+IGNvbXBsZXRlbHkgZXF1aXZhbGVudCwganVzdCBkcmF3aW5nIHNvbWUgYXR0ZW50
aW9uIHRvIHRoZSBiaXRiYWtlDQo+IC0tcnVuYWxsIG9wdGlvbiwgd2hpY2ggd2FzIGFkZGVkIGZh
aXJseSByZWNlbnRseSAoc3BlY2lmaWNhbGx5IHRvDQo+IHNvbHZlIHRoaXMgcHJvYmxlbSkuDQo+
IA0KPiBUaGUgZGlyZWN0b3J5IHN0cnVjdHVyZSBzcGxpdCB1bmRlciB0bXAvd29yayBiZXR3ZWVu
IGFyY2ggYW5kIG1hY2hpbmUNCj4gc3BlY2lmaWMgcmVjaXBlcyBtaWdodCBiZSBhIGxpdHRsZSBj
b25mdXNpbmcgYnV0IG9idmlvdXNseSBzZXJ2ZXMgYQ0KPiBwdXJwb3NlICh0YXJnZXQgYW5kIG5h
dGl2ZSBzb3VyY2VzIG1heSBuZWVkIGRpZmZlcmVudCBzZXRzIG9mIHBhdGNoZXMsDQo+IGV0Yykg
c28gbWF5YmUgd29ydGggdGhlIGVmZm9ydCB0byBleHBsYWluIHRvIGRldmVsb3BlcnMuIEJlbG93
IHRoYXQNCj4gbGV2ZWwgSSBkb24ndCB0aGluayB0aGVyZSBhcmUgbWFueSBzdXJwcmlzZXMgaW4g
dGhlIHBhdGhzIHRvIHRoZQ0KPiBzb3VyY2VzIGRpcmVjdG9yaWVzPw0KDQpXZWxsLCB0aGUgbW9z
dCBjb21tb24gcmVxdWVzdCB3ZSd2ZSBnb3R0ZW4gZnJvbSB0aGUgZGV2ZWxvcGVycyBpcyB0aGF0
IA0KdGhleSB3YW50IHRvIGJlIGFibGUgdG8gc2VhcmNoIHRocm91Z2ggYWxsIHRoZSBzb3VyY2Vz
LCBlLmcuLCB0byBmaW5kIA0Kb3V0IHdoZXJlIGEgcGFydGljdWxhciBmdW5jdGlvbiBpcyB1c2Vk
LiBUaGUgdG1wIGRpcmVjdG9yeSBkb2VzIG5vdCANCmxlbmQgaXRzZWxmIHZlcnkgd2VsbCB0byB0
aGlzLCBnaXZlbiB0aGF0IGl0IGFsc28gY29udGFpbnMgYWxsIGJ1aWxkIA0KdHJlZXMsIGFwcGxp
ZWQgcGF0Y2hlcyBhbmQgb3RoZXIgbWV0YSBpbmZvcm1hdGlvbiB0aGF0IGJpdGJha2UgbmVlZHMu
DQpUaHVzIHRoZSBpZGVhIGZvciB0aGUgcGFyYWxsZWwgdHJlZSB3aXRoIG9ubHkgdGhlIHNvdXJj
ZSByZWZlcmVuY2VzLg0KDQovL1BldGVyDQoNCg==

