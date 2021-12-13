Return-Path: <Jasper.Orschulko@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42443C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 17:41:27 +0000 (UTC)
Received: from mail.irisgmbh.de (mail.irisgmbh.de [81.169.172.79])
 by mx.groups.io with SMTP id smtpd.web08.14310.1639417285649500592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: iris-sensing.com,
 ip: 81.169.172.79, mailfrom: jasper.orschulko@iris-sensing.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.irisgmbh.de (Postfix) with ESMTP id 770F231E034A;
	Mon, 13 Dec 2021 18:41:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at irisgmbh.de
Received: from mail.irisgmbh.de ([127.0.0.1])
	by localhost (s15324379.rootmaster.info [127.0.0.1]) (amavisd-new,
 port 10027)
	with ESMTP; Mon, 13 Dec 2021 18:41:17 +0100 (CET)
Received: from ERDE.irisgmbh.local (unknown [213.61.209.158])
	by mail.irisgmbh.de (Postfix) with ESMTPS id 5E65031E0337;
	Mon, 13 Dec 2021 18:41:17 +0100 (CET)
Received: from ERDE.irisgmbh.local ([172.30.10.11]) by ERDE.irisgmbh.local
 ([172.30.10.11]) with mapi id 14.03.0513.000; Mon, 13 Dec 2021 18:41:16 +0100
From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
To: "sakoman@gmail.com" <sakoman@gmail.com>, "eero.aaltonen@vaisala.com"
	<eero.aaltonen@vaisala.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "martin@mko.dev"
	<martin@mko.dev>, Daniel Baumgart <Daniel.Baumgart@iris-sensing.com>
Subject: Re: [OE-core][dunfell 16/18] cmake: FindGTest: Add target for gmock
 library
Thread-Topic: [OE-core][dunfell 16/18] cmake: FindGTest: Add target for
 gmock library
Thread-Index: AQHX7SOHLP6K9+F0LkKyTWXDRZ6RJ6wqe+iAgAGGQgCABFaHAIAATYWA
Date: Mon, 13 Dec 2021 17:41:15 +0000
Message-ID: <059f8a1a943ea112a3373950b79822125b175865.camel@iris-sensing.com>
References: <cover.1638555254.git.steve@sakoman.com>
	 <80ab29b962cea17a4f2486ad25577bc830cdd8d9.1638555254.git.steve@sakoman.com>
	 <929bdc2257cb8de09bec15e256db812bd83df309.camel@iris-sensing.com>
	 <CAGDS+n=ouuL=LkeunPriDR8PfR6zRPCvfxQ3pwrvEXtfh46R+Q@mail.gmail.com>
	 <0ec498ac13fa81c648f0f608abc6c3d867cd7808.camel@iris-sensing.com>
	 <239c054bb94c0c986865ab0bea221973a2650f37.camel@vaisala.com>
In-Reply-To: <239c054bb94c0c986865ab0bea221973a2650f37.camel@vaisala.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.10.1]
Content-Type: text/plain; charset="utf-8"
Content-ID: <41722669D63C58499486ADDBDA9CDF7B@irisgmbh.local>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 17:41:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159656

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQ0KSGFzaDogU0hBMjU2DQoNCkhpIEVl
cm8sDQoNCm15IGZpcnN0IHJlZmxleCB3YXMgdG8gc2F5LCB0aGF0IEkgZG9uJ3QgYmVsaWV2ZSB0
aGlzIHRvIGJlIG5lY2Vzc2FyeS4NCkFzIHlvdSBhbHJlYWR5IHNhaWQsIHRoZXNlIHZhcmlhYmxl
cyBhcmVuJ3QgZG9jdW1lbnRlZCBhbmQgdGh1cyBJJ2QNCmFyZ3VlIHRoYXQgeW91IGRvbid0IGhh
dmUgdG8gY29uc2lkZXIgdGhlbSBmb3IgbWFpbnRhaW5pbmcgYmFja3dhcmRzDQpjb21wYXRpYmls
aXR5IGR1cmluZyBiYWNrcG9ydHMuIEkgcGVyc29uYWxseSBzZWUgdGhpcyBhcyBhIGJ1ZyBvbiBv
dXINCnBhcnQgYW5kIGFzIGEgY29pbmNpZGVuY2UgdGhhdCBvdXIgc2V0dXAgd29ya2VkIHByZS1w
YXRjaC4NCg0KSG93ZXZlciwgSSdtIG5vdCBzdXJlIFdIWSB0aG9zZSB0d28gdmFyaWFibGVzIHdo
ZXJlIGFjdHVhbGx5IHVzZWQgYnkgdXMNCm9yIHdoZXJlIHRoZXkgb3JpZ2luYXRlZCBmcm9tLiBH
b2luZyBhcyBmYXIgYmFjayBhcyBjbWFrZSAzLjAsIHRoZXNlDQp2YXJpYWJsZXMgd2hlcmUgbmV2
ZXIgZG9jdW1lbnRlZCwgaG93ZXZlciBkb2luZyBhIHF1aWNrIHNlYXJjaCBmb3INCnRob3NlIHJl
dmVhbHMgdGhhdCB0aGV5IGFjdHVhbGx5IGFyZSB1c2VkIGluIG90aGVyIChvbGRlcj8pIHByb2pl
Y3RzLg0KU28gSSdtIG5vdCBxdWl0ZSBzdXJlIGhvdyBtYW55IG90aGVyIHVzZXJzIG1pZ2h0IGJl
IGFmZmVjdGVkIGJ5IHRoaXMuDQpNYXliZSB3ZSBhY3R1YWxseSBTSE9VTEQga2VlcCBzdXBwb3J0
aW5nIHRoZW0gZm9yIHRoZSBMVFMgYnJhbmNoLCBqdXN0DQppbiBjYXNlPw0KDQotIC0tIA0KV2l0
aCBiZXN0IHJlZ2FyZHMNCg0KSmFzcGVyIE9yc2NodWxrbw0KRGV2T3BzIEVuZ2luZWVyDQoNClRl
bC4gKzQ5IDMwIDU4IDU4IDE0IDI2NQ0KRmF4ICs0OSAzMCA1OCA1OCAxNCA5OTkNCkphc3Blci5P
cnNjaHVsa29AaXJpcy1zZW5zaW5nLmNvbQ0KDQrigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg
4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDi
gKIg4oCiIOKAoiDigKIg4oCiDQoNCmlyaXMtR21iSA0KaW5mcmFyZWQgJiBpbnRlbGxpZ2VudCBz
ZW5zb3JzDQpTY2huZWxsZXJzdHJhw59lIDEtNSB8IDEyNDM5IEJlcmxpbg0KDQpodHRwczovL2ly
aXMtc2Vuc2luZy5jb20vDQoNCg0KDQoNCg0KT24gTW9uLCAyMDIxLTEyLTEzIGF0IDE1OjAzICsw
MjAwLCBFZXJvIEFhbHRvbmVuIHdyb3RlOg0KPiBPbiBGcmksIDIwMjEtMTItMTAgYXQgMTg6NDkg
KzAwMDAsIEphc3BlciBPcnNjaHVsa28gd3JvdGU6DQo+ID4gSGVsbG8gZXZlcnlvbmUsDQo+ID4g
DQo+ID4gYWZ0ZXIgc29tZSBkaWdnaW5nIHdlIGlkZW50aWZpZWQgdGhlIGlzc3VlIHRvIGJlIG9u
IG91ciBwYXJ0Lg0KPiA+IFdlIGhhdmUgYmVlbiB1c2luZyAiR1RFU1RfTElCUkFSWSIgYW5kICJH
VEVTVF9NQUlOX0xJQlJBUlkiIGluIG91cg0KPiA+IENNYWtlIHNjcmlwdHMgaW5zdGVhZCBvZiAi
R1RFU1RfTElCUkFSSUVTIiBhbmQNCj4gPiAiR1RFU1RfTUFJTl9MSUJSQVJJRVMiLA0KPiA+IGFz
IGRlc2NyaWJlZCBpbiB0aGUgY21ha2UgZG9jczoNCj4gPiANCj4gaHR0cHM6Ly9jbWFrZS5vcmcv
Y21ha2UvaGVscC92My4xNi9tb2R1bGUvRmluZEdUZXN0Lmh0bWwjcmVzdWx0LXZhcmlhYmxlcw0K
PiANCj4gVGhhbmsgeW91IGZvciBwcm92aWRpbmcgbW9yZSBkZXRhaWxzLg0KPiANCj4gVGhlIGdt
b2NrIHRhcmdldCBjYW4gYmUgYmFja3BvcnRlZCB0byBkdW5mZWxsIGluIGFuIGFsdGVybmF0aXZl
IHdheSwNCj4gYnkNCj4gbGVhdmluZyBvdXQgdGhlDQo+IMKgwqDCoCBmaW5kX3BhY2thZ2UoR1Rl
c3QgUVVJRVQgTk9fTU9EVUxFKQ0KPiANCj4gY2FsbCBhbmQgc3Vic2VxdWVudCBsaW5lcyBhbmQg
bGV0dGluZyB0aGUgRmluZE1vZHVsZSBjcmVhdGUgYWxsIHRoZQ0KPiBkZWZpbml0aW9ucy4gVGhp
cyB3b3VsZCBsZWF2ZSBhbHNvIHRoZSB1bmRvY3VtZW50ZWQgdmFyaWFibGVzIGludGFjdCwNCj4g
aWYgdGhhdCBpcyBkZXNpcmVkLg0KPiANCj4gVGhpcyBzaG91bGQgYmUgYXMgc2ltcGxlIGFzIGRy
b3BwaW5nIHRoZSBsaW5lcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ICMgZmlyc3Qgc3BlY2lmaWNhbGx5IGxvb2sgZm9yIHRoZSBDTWFrZSB2ZXJz
aW9uIG9mIEdUZXN0DQo+IGZpbmRfcGFja2FnZShHVGVzdCBRVUlFVCBOT19NT0RVTEUpDQo+IA0K
PiAjIGlmIHdlIGZvdW5kIHRoZSBHVGVzdCBjbWFrZSBwYWNrYWdlIHRoZW4gd2UgYXJlIGRvbmUs
IGFuZA0KPiAjIGNhbiBwcmludCB3aGF0IHdlIGZvdW5kIGFuZCByZXR1cm4uDQo+IGlmKEdUZXN0
X0ZPVU5EKQ0KPiDCoMKgwqAgc2V0KEdURVNUX0ZPVU5EICR7R1Rlc3RfRk9VTkR9KQ0KPiDCoMKg
wqAgRklORF9QQUNLQUdFX0hBTkRMRV9TVEFOREFSRF9BUkdTKEdUZXN0IEhBTkRMRV9DT01QT05F
TlRTDQo+IENPTkZJR19NT0RFKQ0KPiANCj4gwqDCoMKgIHNldChHVEVTVF9MSUJSQVJJRVPCoMKg
wqDCoMKgIEdUZXN0OjpndGVzdCkNCj4gwqDCoMKgIHNldChHVEVTVF9NQUlOX0xJQlJBUklFUyBH
VGVzdDo6Z3Rlc3RfbWFpbikNCj4gDQo+IMKgwqDCoCBfX2d0ZXN0X2RlZmluZV9iYWNrd2FyZHNf
Y29tcGF0aWJsZV9saWJyYXJ5X3RhcmdldHMoKQ0KPiANCj4gwqDCoMKgIHJldHVybigpDQo+IGVu
ZGlmKCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiANCi0tLS0tQkVHSU4gUEdQIFNJR05BVFVSRS0tLS0tDQoNCmlRRXpCQUVCQ0FBZEZpRUU0V3lQ
TUlDNUFwNCtPb28xWWdxZXcwN1ZNTlVGQW1HM2hic0FDZ2tRWWdxZXcwN1YNCk1OVzZHd2Y4RGNZ
ajBLbHFOU0xwQjN0bHNwbEk0V2FjOW1meEFkL2cyQm9LY3lla1JLMklBck1KS3pOREVoaTYNCkdx
S2FyMHozUWdSWlFyRjU0WDYzL01uaGFxSXlwSGVmKzhZeVVQVlZZaHErSFVaU1hjKzZjM1NqSWRW
QkJKbjgNCkcwNC9weG1vTHliQnZxTW1GY1A2N3FoRmxvam83eVcydmlLOHN0ZFZaNDlWd2ZFM1hJ
cTNmU3hycUU2eFFxMVYNCm5Pb1p3NURSTHFnQ0dwZUI0MU9lYllYRTFiT0lYM1dPZ2s1UHprdWY0
SXE5YkxEb1dnNXpYU3h3MGRqWUNNWlMNCjJFNmtISXdKYXZFVktobVFvQzJJcGlQclo0Y0pRNTdK
WnZJUjk1SHNGa0cvQy9ONnNLWGxKdTJWTElkKzV4ZGINCkl3VWV4R3IzdlVDWEdxclVUV09aRTZr
eGhkbzc0UT09DQo9L015Zg0KLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0tDQo=

