Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47EC579465
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 09:58:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2018 01:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,478,1534834800"; d="scan'208";a="90421392"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
	by orsmga008.jf.intel.com with ESMTP; 08 Nov 2018 01:58:27 -0800
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.19]) by
	KMSMSX156.gar.corp.intel.com ([169.254.1.197]) with mapi id
	14.03.0415.000; Thu, 8 Nov 2018 17:58:26 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oeqa/runtime: Add tests for gstreamer CLI
Thread-Index: AQHUdz2bDDSXEWe5Zk+YGImEGJdvz6VFpFng
Date: Thu, 8 Nov 2018 09:58:25 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434811D081@KMSMSX155.gar.corp.intel.com>
References: <1541664141-55191-1-git-send-email-ee.peng.yeoh@intel.com>
	<ce512328cae84cc48d77dc907b54fb3f452f7f3d.camel@linuxfoundation.org>
In-Reply-To: <ce512328cae84cc48d77dc907b54fb3f452f7f3d.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNWQzNDAwN2MtNmNkYy00MDg4LWJhZWItMjEwMzJhMDM0NDNiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVlFJWlwvbTFJREJTZWxtVmM1WGgxSEV5ellqcEhvN1RjbjhuUHNiaUUwUllrR2VYYWxLcGNweFh2czI3WXZGZ1QifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa/runtime: Add tests for gstreamer CLI
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
X-List-Received-Date: Thu, 08 Nov 2018 09:58:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCAmIENoZW5RaSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGlucHV0cyENCkkgaGFk
IHN1Ym1pdHRlZCB2MiBwYXRjaCB0aGF0IGluY2x1ZGUgdGhlIEBPRUhhc1BhY2thZ2UgZGVjb3Jh
dG9yLg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIGFueSBtb3JlIHF1ZXN0aW9uIG9yIGlucHV0LiAN
Cg0KVGhhbmtzLA0KRWUgUGVuZyANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IFJpY2hhcmQgUHVyZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Z10gDQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgOCwgMjAxOCA0OjMzIFBNDQpUbzogWWVvaCwg
RWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBvZXFhL3J1
bnRpbWU6IEFkZCB0ZXN0cyBmb3IgZ3N0cmVhbWVyIENMSQ0KDQpPbiBUaHUsIDIwMTgtMTEtMDgg
YXQgMTY6MDIgKzA4MDAsIFllb2ggRWUgUGVuZyB3cm90ZToNCj4gV2Ugc2hvdWxkIG5vdCBiZSBm
aW5kaW5nIEdTdHJlYW1lciBpc3N1ZXMgcmlnaHQgYXJvdW5kIHJlbGVhc2UgdGltZSANCj4gYnV0
IHRoYXQncyB3aGF0IHdlIHNlZW0gdG8gZG8uDQo+IA0KPiBQb3J0IGdzdHJlYW1lciB0ZXN0cyBm
cm9tIEludGVsIFJlZiBLaXQuDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9pbnRlbC1pb3Qt
cmVma2l0L2Jsb2IvbWFzdGVyL21ldGEtaW90cWEvDQo+IGxpYi9vZXFhL3J1bnRpbWUvbXVsdGlt
ZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyX2NsaS5weQ0KPiANCj4gQWRkIHRlc3RzIGZvciBnc3Ry
ZWFtZXIgY29tbWFuZGxpbmUgdG9vbHMgKGdzdC1pbnNwZWN0LTEuMCAmIA0KPiBnc3QtbGF1bmNo
LTEuMCkuDQo+IA0KPiBbWU9DVE8gIzExNDE4XQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWVvaCBF
ZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwuY29tPg0KPiAtLS0NCj4gIG1ldGEvbGliL29lcWEv
cnVudGltZS9jYXNlcy9nc3RyZWFtZXIucHkgfCAxMSArKysrKysrKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL2xpYi9v
ZXFhL3J1bnRpbWUvY2FzZXMvZ3N0cmVhbWVyLnB5DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9s
aWIvb2VxYS9ydW50aW1lL2Nhc2VzL2dzdHJlYW1lci5weQ0KPiBiL21ldGEvbGliL29lcWEvcnVu
dGltZS9jYXNlcy9nc3RyZWFtZXIucHkNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMC4uM2FkZWViNQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvbGliL29lcWEv
cnVudGltZS9jYXNlcy9nc3RyZWFtZXIucHkNCj4gQEAgLTAsMCArMSwxMSBAQA0KPiArZnJvbSBv
ZXFhLnJ1bnRpbWUuY2FzZSBpbXBvcnQgT0VSdW50aW1lVGVzdENhc2UNCj4gKw0KPiArY2xhc3Mg
R3N0cmVhbWVyQ2xpVGVzdChPRVJ1bnRpbWVUZXN0Q2FzZSk6DQo+ICsNCj4gKyAgICBkZWYgdGVz
dF9nc3RfaW5zcGVjdF9jYW5fbGlzdF9hbGxfcGx1Z2lucyhzZWxmKToNCj4gKyAgICAgICAgc3Rh
dHVzLCBvdXRwdXQgPSBzZWxmLnRhcmdldC5ydW4oJ2dzdC1pbnNwZWN0LTEuMCcpDQo+ICsgICAg
ICAgIHNlbGYuYXNzZXJ0RXF1YWwoc3RhdHVzLCAwLCAnZ3N0LWluc3BlY3QtMS4wIGRvZXMgbm90
IGFwcGVhcg0KPiB0byBiZSBydW5uaW5nLicpDQo+ICsNCj4gKyAgICBkZWYgdGVzdF9nc3RfbGF1
bmNoX2Nhbl9jcmVhdGVfdmlkZW9fcGlwZWxpbmUoc2VsZik6DQo+ICsgICAgICAgIHN0YXR1cywg
b3V0cHV0ID0gc2VsZi50YXJnZXQucnVuKCdnc3QtbGF1bmNoLTEuMCAtdiBmYWtlc3JjDQo+IHNp
bGVudD1mYWxzZSBudW0tYnVmZmVycz0zICEgZmFrZXNpbmsgc2lsZW50PWZhbHNlJykNCj4gKyAg
ICAgICAgc2VsZi5hc3NlcnRFcXVhbChzdGF0dXMsIDAsICdnc3QtbGF1bmNoLTEuMCBkb2VzIG5v
dCBhcHBlYXINCj4gdG8gYmUgcnVubmluZy4nKQ0KDQpUaGlzIGxvb2tzIGdvb2QgYW5kIEkgbGlr
ZSB0aGUgaWRlYSBvZiB0aGlzIGEgbG90IGJ1dCBJIHRoaW5rIGl0IG5lZWRzIHNvbWUga2luZCBv
ZjoNCg0KQE9FSGFzUGFja2FnZShbJzxzb21lcGFja2FnZT4nXSkNCg0KZGVjb3JhdG9yIHNvIHdl
IGtub3cgd2hlcmUgdGhlIHRlc3QgbmVlZHMgdG8gcnVuPw0KDQpDaGVlcnMsDQoNClJpY2hhcmQN
Cg0K

