Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0D7671AD8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 10:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 438171833F;
	Mon,  4 Sep 2017 12:22:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id jcJ1clbNdDpH; Mon,  4 Sep 2017 12:22:32 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 26C0F18401;
	Mon,  4 Sep 2017 12:22:32 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9D7F1E078;
	Mon,  4 Sep 2017 12:22:31 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E50C1E070;
	Mon,  4 Sep 2017 12:22:31 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  4 Sep 2017 12:22:31 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 9286C2754;
	Mon,  4 Sep 2017 12:22:31 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 4 Sep 2017 12:22:31 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Mon, 4 Sep 2017 12:22:31 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <git@andred.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] useradd-staticids: don't create username-group
	if	gid is specified
Thread-Index: AQHTJWF4toec1K4qAk+f6bkPzn7VpKKkgswg
Date: Mon, 4 Sep 2017 10:22:31 +0000
Message-ID: <101285eff0324932a48ca1002532fee5@XBOX02.axis.com>
References: <20170904093726.11472-1-git@andred.net>
In-Reply-To: <20170904093726.11472-1-git@andred.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] useradd-staticids: don't create username-group if	gid is specified
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
X-List-Received-Date: Mon, 04 Sep 2017 10:22:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBBbmRyw6kg
RHJhc3ppaw0KPiBTZW50OiBkZW4gNCBzZXB0ZW1iZXIgMjAxNyAxMTozNw0KPiBUbzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBbT0UtY29yZV0g
W1BBVENIXSB1c2VyYWRkLXN0YXRpY2lkczogZG9uJ3QgY3JlYXRlIHVzZXJuYW1lLQ0KPiBncm91
cCBpZiBnaWQgaXMgc3BlY2lmaWVkDQo+IA0KPiBGcm9tOiBBbmRyw6kgRHJhc3ppayA8YWRyYXN6
aWtAdHljb2ludC5jb20+DQo+IA0KPiBBZGRpbmcgZGlzdGNjIHRvIGFuIGltYWdlLCBhbmQgaGF2
aW5nIHN0YXRpY2lkcyBlbmFibGVkLA0KPiBkb2Vzbid0IHdvcmsgYXMgaXQgY2F1c2VzIGEgYSBz
dXBlcmZsdW91cyAnZGlzdGNjJyBncm91cA0KPiBiZWluZyBhZGRlZCB1c2luZyBhIGNvbmZsaWN0
aW5nICBHSUQsIHRodXMgZmFpbGluZyB0aGUNCj4gYnVpbGQ6DQo+ICB8IEVSUk9SOiBkaXN0Y2Mt
My4yLXIwIGRvX3ByZXBhcmVfcmVjaXBlX3N5c3Jvb3Q6IGRpc3RjYzogZ3JvdXBhZGQgY29tbWFu
ZCBkaWQgbm90IHN1Y2NlZWQuDQo+IA0KPiBDb21wYXJlZCB0byBvdGhlciByZWNpcGVzLCB0aGUg
ZGlzdGNjIHJlY2lwZSBvbmx5DQo+IHNwZWNpZmllcyAtLWdpZCBmb3IgdGhlIHByaW1hcnkgZ3Jv
dXAsIGFuZCBkb2Vzbid0IHNwZWNpZnkNCj4gLS1uby11c2VyLWdyb3VwLCBidXQgd2hlbiAtLWdp
ZCBpcyBnaXZlbiwgaXQgZG9lc24ndCBtYWtlDQo+IHNlbnNlIHRvIGNyZWF0ZSBhIG1hdGNoaW5n
IHVzZXJuYW1lLWdyb3VwIGluIGFkZGl0aW9uLA0KPiBldmVuIGlmIC0tbm8tdXNlci1ncm91cCB3
YXMgbm90IHNwZWNpZmllZCwgYW5kICd1c2VyYWRkJw0KPiBhY3R1YWxseSBjb21wbGFpbnMgaWYg
LS1naWQgYW5kIC0tdXNlci1ncm91cCBhcmUgZ2l2ZW4NCj4gYm90aC4NCj4gDQo+IElmIG9ubHkg
LS1naWQgaXMgZ2l2ZW4sIHRoZSBjdXJyZW50IGNvZGUgaW4gaGVyZQ0KPiBlZmZlY3RpdmVseSBi
ZWhhdmVzIGFzIGlmIC0tdXNlci1ncm91cCB3YXMgc3BlY2lmaWVkLA0KPiB0YWtpbmcgdGhlIGdy
b3VwLWlkIG9mIHRoZSB1c2VybmFtZS1ncm91cCBmcm9tIHRoZQ0KPiAtLWdpZCBwYXJhbWV0ZXIu
IFRoaXMgY2F1c2VzIHRoZSBlcnJvciBhYm92ZSwgYXMgd2UgdHJ5DQo+IHRvIGFkZCBhIG5ldyBn
cm91cCAoZGlzdGNjKSB3aXRoIGFuIGV4aXN0aW5nIGdyb3VwLWlkDQo+IChub2dyb3VwKS4NCj4g
DQo+IFRoaXMgaXMgY29udHJhcnkgdG8gdGhlIGNvbW1lbnQgaW4gdGhpcyBmaWxlIGp1c3QgYWJv
dmUsDQo+IGNvbnRyYXJ5IHRvIHdoYXQgdXNlcmFkZCBjYW4gZG8sIGNvbnRyYXJ5IHRvIGJlaGF2
aW91cg0KPiB3aXRob3V0IHRoZSB1c2VyYWRkLXN0YXRpY2lkcyBiYmNsYXNzLCBhbmQgbm9uLWlu
dHVpdGl2ZS4NCj4gDQo+IENoYW5nZSB0aGUgY29kZSBzdWNoIHRoYXQgYSB1c2VybmFtZS1ncm91
cCBpcyBvbmx5IGNyZWF0ZWQNCj4gaWYgYWN0dWFsbHkgcmVxdWVzdGVkLCBvZiBpZiBhIHByaW1h
cnkgZ3JvdXAgdXNpbmcgLS1naWQNCj4gd2FzICpub3QqIHNwZWNpZmllZC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhZHJhc3ppa0B0eWNvaW50LmNvbT4NCj4gLS0tDQo+
ICBtZXRhL2NsYXNzZXMvdXNlcmFkZC1zdGF0aWNpZHMuYmJjbGFzcyB8IDIgKy0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEvY2xhc3Nlcy91c2VyYWRkLXN0YXRpY2lkcy5iYmNsYXNzIGIvbWV0YS9jbGFzc2Vz
L3VzZXJhZGQtc3RhdGljaWRzLmJiY2xhc3MNCj4gaW5kZXggY2U0YWM2MmFiNS4uMWI2MWE4YmY5
YiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFzc2VzL3VzZXJhZGQtc3RhdGljaWRzLmJiY2xhc3MN
Cj4gKysrIGIvbWV0YS9jbGFzc2VzL3VzZXJhZGQtc3RhdGljaWRzLmJiY2xhc3MNCj4gQEAgLTEw
Miw3ICsxMDIsNyBAQCBkZWYgdXBkYXRlX3VzZXJhZGRfc3RhdGljX2NvbmZpZyhkKToNCj4gICAg
ICAgICAgICAgICMgU28gaWYgdGhlIGltcGxpY2l0IHVzZXJuYW1lLWdyb3VwIGNyZWF0aW9uIGlz
IG9uLCB0aGVuIHRoZSBpbXBsaWNpdCBncm91cG5hbWUgKExPR0lOKQ0KPiAgICAgICAgICAgICAg
IyBpcyB1c2VkLCBhbmQgd2UgZGlzYWJsZSB0aGUgdXNlcl9ncm91cCBvcHRpb24uDQo+ICAgICAg
ICAgICAgICAjDQo+IC0gICAgICAgICAgICB1c2VyX2dyb3VwID0gdWFhcmdzLnVzZXJfZ3JvdXAg
aXMgTm9uZSBvciB1YWFyZ3MudXNlcl9ncm91cCBpcyBUcnVlDQo+ICsgICAgICAgICAgICB1c2Vy
X2dyb3VwID0gdWFhcmdzLmdpZCBpcyBOb25lIG9yIHVhYXJncy51c2VyX2dyb3VwIGlzIFRydWUN
Cg0KSG1tLCBJIGJlbGlldmUgdGhhdCBzaG91bGQgYmU6DQoNCiAgICAgICAgICAgIHVzZXJfZ3Jv
dXAgPSB1YWFyZ3MuZ2lkIGlzIE5vbmUgYW5kIHVhYXJncy51c2VyX2dyb3VwIGlzIE5vbmUgb3Ig
dWFhcmdzLnVzZXJfZ3JvdXAgaXMgVHJ1ZQ0KDQpJLmUuLCBpZiBuZWl0aGVyIC0tZ2lkIG5vciAt
LXVzZXItZ3JvdXAgaXMgc3BlY2lmaWVkLCB0aGVuIGl0IHNob3VsZCANCnRyZWF0IGl0IGFzIGlm
IC0tdXNlci1ncm91cCB3YXMgc3BlY2lmaWVkLg0KDQo+ICAgICAgICAgICAgICB1YWFyZ3MuZ3Jv
dXBuYW1lID0gdWFhcmdzLkxPR0lOIGlmIHVzZXJfZ3JvdXAgZWxzZSB1YWFyZ3MuZ2lkDQo+ICAg
ICAgICAgICAgICB1YWFyZ3MuZ3JvdXBpZCA9IGZpZWxkWzNdIG9yIHVhYXJncy5naWQgb3IgdWFh
cmdzLmdyb3VwbmFtZQ0KPiANCj4gLS0NCj4gMi4xNC4xDQoNCi8vUGV0ZXINCg0K

