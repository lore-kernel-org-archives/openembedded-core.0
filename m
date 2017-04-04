Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86DD671A72
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 07:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 89486181BE;
	Tue,  4 Apr 2017 09:50:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id y4o+GwJh5vJo; Tue,  4 Apr 2017 09:50:07 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 60F5D181A3;
	Tue,  4 Apr 2017 09:50:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F56B1A0A0;
	Tue,  4 Apr 2017 09:50:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 442991A09F;
	Tue,  4 Apr 2017 09:50:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  4 Apr 2017 09:50:07 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 37A7E2896;
	Tue,  4 Apr 2017 09:50:07 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 4 Apr 2017 09:50:07 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 4 Apr 2017 09:50:06 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 4 Apr 2017 09:50:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/3] base-files: profile: Simplify setting
	variables conditionally
Thread-Index: AQHSrJAlpazZVhGxt0GFpn5k25HCEKG01dGQ
Date: Tue, 4 Apr 2017 07:50:06 +0000
Message-ID: <409f79f0b03f4b2a9b13c6505141301b@XBOX02.axis.com>
References: <20170403124827.24735-1-pkj@axis.com>
	<20170403124827.24735-3-pkj@axis.com>
	<1491234317.17259.82.camel@linux.intel.com>
In-Reply-To: <1491234317.17259.82.camel@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] base-files: profile: Simplify setting variables conditionally
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
X-List-Received-Date: Tue, 04 Apr 2017 07:50:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZW9uYXJkbyBTYW5kb3ZhbA0K
PiBbbWFpbHRvOmxlb25hcmRvLnNhbmRvdmFsLmdvbnphbGV6QGxpbnV4LmludGVsLmNvbV0NCj4g
U2VudDogZGVuIDMgYXByaWwgMjAxNyAxNzo0NQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxw
ZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDMvM10g
YmFzZS1maWxlczogcHJvZmlsZTogU2ltcGxpZnkNCj4gc2V0dGluZyB2YXJpYWJsZXMgY29uZGl0
aW9uYWxseQ0KPiANCj4gT24gTW9uLCAyMDE3LTA0LTAzIGF0IDE0OjQ4ICswMjAwLCBQZXRlciBL
amVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gSXQgaXMgcHJlZmVycmVkIHRvIHVzZSBgWyAiJEZPTyIg
XSB8fCAuLi5gIGluc3RlYWQgb2YNCj4gPiBgWyAteiAiJEZPTyIgXSAmJiAuLi5gIGFzIHRoZSBs
YXR0ZXIgbGVhdmVzICQ/IHNldCB0byAxLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
S2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gLS0tDQo+ID4g
IG1ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFzZS1maWxlcy9wcm9maWxlIHwgMTQgKysr
KysrLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLWZp
bGVzL2Jhc2UtZmlsZXMvcHJvZmlsZSBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFz
ZS1maWxlcy9wcm9maWxlDQo+ID4gaW5kZXggY2VhZjE1Zjc5OS4uYTA2MjAyODIyNiAxMDA2NDQN
Cj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXMvcHJvZmls
ZQ0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFzZS1maWxlcy9wcm9m
aWxlDQo+ID4gQEAgLTMsMTUgKzMsMTMgQEANCj4gPg0KPiA+ICBQQVRIPSIvdXNyL2xvY2FsL2Jp
bjovdXNyL2JpbjovYmluIg0KPiA+ICBFRElUT1I9InZpIgkJCSMgbmVlZGVkIGZvciBwYWNrYWdl
cyBsaWtlIGNyb24sIGdpdC1jb21taXQNCj4gPiAtdGVzdCAteiAiJFRFUk0iICYmIFRFUk09InZ0
MTAwIgkjIEJhc2ljIHRlcm1pbmFsIGNhcGFiLiBGb3Igc2NyZWVuIGV0Yy4NCj4gPiArWyAiJFRF
Uk0iIF0gfHwgVEVSTT0idnQxMDAiCSMgQmFzaWMgdGVybWluYWwgY2FwYWIuIEZvciBzY3JlZW4g
ZXRjLg0KPiA+DQo+ID4gLWlmIFsgIiRIT01FIiA9ICJST09USE9NRSIgXTsgdGhlbg0KPiA+IC0J
UEFUSD0kUEFUSDovdXNyL2xvY2FsL3NiaW46L3Vzci9zYmluOi9zYmluDQo+ID4gLWZpDQo+ID4g
LWlmIFsgIiRQUzEiIF07IHRoZW4NCj4gPiAtCSMgd29ya3MgZm9yIGJhc2ggYW5kIGFzaCAobm8g
b3RoZXIgc2hlbGxzIGtub3duIHRvIGJlIGluIHVzZSBoZXJlKQ0KPiA+IC0JUFMxPSdcdUBcaDpc
d1wkICcNCj4gPiAtZmkNCj4gPiArIyBBZGQgL3NiaW4gJiBjbyB0byAkUEFUSCBmb3IgdGhlIHJv
b3QgdXNlcg0KPiA+ICtbICIkSE9NRSIgIT0gIlJPT1RIT01FIiBdIHx8IFBBVEg9JFBBVEg6L3Vz
ci9sb2NhbC9zYmluOi91c3Ivc2Jpbjovc2Jpbg0KPiA+ICsNCj4gPiArIyBTZXQgdGhlIHByb21w
dCBmb3IgYmFzaCBhbmQgYXNoIChubyBvdGhlciBzaGVsbHMga25vd24gdG8gYmUgaW4gdXNlIGhl
cmUpDQo+ID4gK1sgLXogIiRQUzEiIF0gfHwgUFMxPSdcdUBcaDpcd1wkICcNCj4gDQo+IEhlcmUg
eW91IGFyZSB1c2luZyBbIC16IF0gaW5zdGVhZCBvZiBbIF0sIGlzIHRoaXMgaW50ZW5kZWQ/IEkg
ZG8gbm90DQo+IHRoaW5rIHNvIGJhc2VkIG9uIHlvdXIgY29tbWl0IG1lc3NhZ2UuDQoNClllcywg
aXQgaXMgaW50ZW50aW9uYWwgdG8gbWFpbnRhaW4gdGhlIG9yaWdpbmFsIGZ1bmN0aW9uYWxpdHku
IA0KSG93ZXZlciwgSSBtYXkgaGF2ZSB0byB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGEgYml0
LiBJdCB3YXMgDQp3cml0dGVuIHdoZW4gSSBoYWQgb25seSBkb25lIHRoZSBjaGFuZ2UgZm9yIHRo
ZSAkVEVSTSB2YXJpYWJsZS4NCg0KPiA+DQo+ID4gIGlmIFsgLWQgL2V0Yy9wcm9maWxlLmQgXTsg
dGhlbg0KPiA+ICAJZm9yIGkgaW4gL2V0Yy9wcm9maWxlLmQvKi5zaDsgZG8NCj4gPiAtLQ0KPiA+
IDIuMTIuMA0KDQovL1BldGVyDQoNCg==

