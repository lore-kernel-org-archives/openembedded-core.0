Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37E927EEA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 00:53:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6Q0r2VR019201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2019 17:53:12 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.115]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000;
	Thu, 25 Jul 2019 17:52:51 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] oeqa: small modification to
	oe_syslog
Thread-Index: AQHVQyfR0y8CVw1kEEucGsE3h1PQ2qbcU3yA//+8/sA=
Date: Fri, 26 Jul 2019 00:52:50 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84FA850A09@ALA-MBD.corp.ad.wrs.com>
References: <20190725203037.33849-1-joe.slater@windriver.com>
	<fd395b9f9d74daabab0d2a3c3f37c8a486fd0bce.camel@linuxfoundation.org>
In-Reply-To: <fd395b9f9d74daabab0d2a3c3f37c8a486fd0bce.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.116.242]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] oeqa: small modification to oe_syslog
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
X-List-Received-Date: Fri, 26 Jul 2019 00:53:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB0aG91Z2h0IG9mIHRoYXQsIGJ1dCBJIHRoaW5rIHRoZSBwYWNrYWdlIG1pZ2h0IGJlIHZhcmlh
YmxlIGFuZCB3ZSB3b3VsZCBoYXZlIHRvIGxpc3QgYWxsIHRoZSBwb3NzaWJsZXMsIHdoaWNoIHJl
cXVpcmVzIG1vbml0b3JpbmcuICBJZiAibG9nZ2VyIiBpc24ndCBvbiB0aGUgcGF0aCwgd2UgY291
bGQgdGFrZSB0aGUgcG9zaXRpb24gdGhhdCB0aGUgdGVzdCBpcyBwb2ludGxlc3MgYW5kIG5vdCB3
b3JyeSBhYm91dCB3aGVyZSBpdCBtaWdodCBoYXZlIGNvbWUgZnJvbS4NCg0KSm9lDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgSnVseSAyNSwgMjAxOSAy
OjQ1IFBNDQpUbzogU2xhdGVyLCBKb3NlcGggPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV0gW29lLWNvcmVdW1BBVENIIDEvMV0gb2VxYTogc21hbGwgbW9kaWZpY2F0aW9uIHRvIG9l
X3N5c2xvZw0KDQpPbiBUaHUsIDIwMTktMDctMjUgYXQgMTM6MzAgLTA3MDAsIEpvZSBTbGF0ZXIg
d3JvdGU6DQo+IFNraXAgbG9nZ2VyIHRlc3QgaWYgbG9nZ2VyIGlzIG5vdCBhIGNvbW1hbmQuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+
DQo+IC0tLQ0KPiAgbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL29lX3N5c2xvZy5weSB8IDIg
KysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvb2Vfc3lzbG9nLnB5IA0KPiBiL21ldGEvbGli
L29lcWEvcnVudGltZS9jYXNlcy9vZV9zeXNsb2cucHkNCj4gaW5kZXggM2E4MjcxYS4uMDRmODM0
NSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL29lX3N5c2xvZy5w
eQ0KPiArKysgYi9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvb2Vfc3lzbG9nLnB5DQo+IEBA
IC04Myw2ICs4Myw4IEBAIGNsYXNzIFN5c2xvZ1Rlc3RDb25maWcoT0VSdW50aW1lVGVzdENhc2Up
Og0KPiAgICAgIGRlZiB0ZXN0X3N5c2xvZ19sb2dnZXIoc2VsZik6DQo+ICAgICAgICAgIHN0YXR1
cywgb3V0cHV0ID0gc2VsZi50YXJnZXQucnVuKCdsb2dnZXIgZm9vYmFyJykNCj4gICAgICAgICAg
bXNnID0gIkNhbid0IGxvZyBpbnRvIHN5c2xvZy4gT3V0cHV0OiAlcyAiICUgb3V0cHV0DQo+ICsg
ICAgICAgIGlmIHN0YXR1cyA9PSAxMjc6DQo+ICsgICAgICAgICAgICBzZWxmLnNraXBUZXN0KCJX
ZSBjYW5ub3QgdGVzdCBsb2dnZXIgYmVjYXVzZSBpdCBpcyBub3QgDQo+ICsgdGhlcmUuIikNCj4g
ICAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChzdGF0dXMsIDAsIG1zZz1tc2cpDQo+ICANCj4gICAg
ICAgICAgIyBUaGVyZSBpcyBubyB3YXkgdG8gZmx1c2ggdGhlIGxvZ2dlciB0byBkaXNrIGluIGFs
bCBjYXNlcw0KDQpTaG91bGQgd2Ugbm90IGJlIG1hcmtpbmcgdXAgdGhlIHRlc3QgdG8gc2tpcCBp
ZiB0aGUgYXBwcm9wcmlhdGUgcGFja2FnZSBpc24ndCBpbiB0aGUgaW1hZ2U/DQoNCkNoZWVycywN
Cg0KUmljaGFyZA0KDQo=

