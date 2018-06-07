Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3388787F9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 14:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5167E184A9;
	Thu,  7 Jun 2018 16:05:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id whlibWyoJdYn; Thu,  7 Jun 2018 16:05:28 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 93456184A0;
	Thu,  7 Jun 2018 16:05:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FAD91A067;
	Thu,  7 Jun 2018 16:05:28 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73B1B1A062;
	Thu,  7 Jun 2018 16:05:28 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu,  7 Jun 2018 16:05:28 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 67A602A3B;
	Thu,  7 Jun 2018 16:05:28 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 7 Jun 2018 16:05:28 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 7 Jun 2018 16:05:28 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 7 Jun 2018 16:05:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>
Thread-Topic: [OE-core] Cherry-pick to Sumo (was: [PATCHv2 1/2]
	oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed
	vars)
Thread-Index: AQHT+01Roqt+tPRN2kqPaTpZgec7haRU2QWw
Date: Thu, 7 Jun 2018 14:05:27 +0000
Message-ID: <8406638238c34c4799a21e8e39a4dd49@XBOX02.axis.com>
References: <058532a438814db98ab5389758a226fd@XBOX02.axis.com>
	<11df0453-3c35-b868-6d96-b23bd675ae9a@gmail.com>
In-Reply-To: <11df0453-3c35-b868-6d96-b23bd675ae9a@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
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
X-List-Received-Date: Thu, 07 Jun 2018 14:05:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBha3VzdGVyODA4IFttYWlsdG86
YWt1c3RlcjgwOEBnbWFpbC5jb21dDQo+IFNlbnQ6IGRlbiAzIGp1bmkgMjAxOCAxNzoxMw0KPiBU
bzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVu
ZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIENoZXJyeS1waWNrIHRvIFN1bW8gKHdhczogW1BBVENIdjIgMS8yXSBvZS0NCj4g
cGtnZGF0YS11dGlsOiBNYWtlIHBhcnNlX3BrZ2RhdGFmaWxlKCkgc3VwcG9ydCBwYWNrYWdlIHN1
ZmZpeGVkIHZhcnMpDQo+IA0KPiBPbiAwNi8wMi8yMDE4IDEyOjQ4IFBNLCBQZXRlciBLamVsbGVy
c3RlZHQgd3JvdGU6DQo+ID4gVGhlc2UgdHdvIHBhdGNoZXMsIGluIGFkZGl0aW9uIHRvICJvZS1w
a2dkYXRhLXV0aWw6IGxvb2t1cC1yZWNpcGUsDQo+ID4gcGFja2FnZS1pbmZvOiBEb24ndCBmaW5p
c2ggcHJlbWF0dXJlbHkiIChjb21taXQgMzJjMmEyZGQpIHRoYXQgaXMNCj4gPiBhbHJlYWR5IG9u
IG1hc3RlciwgbmVlZCB0byBiZSBjaGVycnktcGlja2VkIHRvIHRoZSBzdW1vIGJyYW5jaCBhcyAN
Cj4gPiB3ZWxsLiBXaXRob3V0IHRoZW0sIGBvZS1wa2dkYXRhLXV0aWwgcGFja2FnZS1pbmZvIC4u
LmAgaXMgbW9yZSBvciANCj4gPiBsZXNzIGJyb2tlbi4NCj4gPg0KPiA+IC8vUGV0ZXINCj4gDQo+
IFRoYW5rcyBwZXRlci4gSSBob3BlIHRvIHJlbWVtYmVyIHRvIGJhY2sgcG9ydCB0aGVtIG9uY2Ug
dGhleSBoaXQNCj4gbWFzdGVyLg0KPiANCj4gLWFybWluDQoNClRoZXkgaGF2ZSBoaXQgbWFzdGVy
IG5vdy4gVGhlIGNvbW1pdHMgSSB3YW50IGNoZXJyeS1waWNrZWQgdG8gU3VtbyANCmZyb20gbWFz
dGVyIGFyZToNCg0KMzJjMmEyZGQgb2UtcGtnZGF0YS11dGlsOiBsb29rdXAtcmVjaXBlLCBwYWNr
YWdlLWluZm86IERvbid0IGZpbmlzaCBwcmVtYXR1cmVseQ0KMzhmODI4NDIgb2UtcGtnZGF0YS11
dGlsOiBNYWtlIHBhcnNlX3BrZ2RhdGFmaWxlKCkgc3VwcG9ydCBwYWNrYWdlIHN1ZmZpeGVkIHZh
cnMNCmNkMTk1YmRmIG9lLXBrZ2RhdGEtdXRpbDogcGFja2FnZS1pbmZvOiBSZS1hZGQgc3VwcG9y
dCBmb3IgdGhlIC0tZXh0cmEgb3B0aW9uDQoNCi8vUGV0ZXINCg0K

