Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8656077F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 09:10:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2013 02:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,993,1363158000"; d="scan'208";a="365200557"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2013 02:10:39 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 4 Jul 2013 10:10:33 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.91]) with mapi id
	14.03.0123.003; Thu, 4 Jul 2013 10:10:33 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [RFC PATCH 0/8] Proposed implementation of a new
	runtime tests framework
Thread-Index: AQHOeILrcwLWYJTQdUCYO7FoI3Sxd5lUKxWA
Date: Thu, 4 Jul 2013 09:10:33 +0000
Message-ID: <1372929075.29785.16.camel@firebird.rb.intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
	<51D51B64.6030809@linux.intel.com>
In-Reply-To: <51D51B64.6030809@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/8] Proposed implementation of a new runtime tests framework
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
X-List-Received-Date: Thu, 04 Jul 2013 09:10:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <72383506182D1A45ADAADE9653B94AB7@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFdlZCwgMjAxMy0wNy0wMyBhdCAyMzo1MSAtMDcwMCwgU2F1bCBXb2xkIHdyb3RlOg0K
PiBUaXJlZCB0aGlzIG91dCB0b2RheSBhbmQgZ290IHRoZSBmb2xsb3dpbmc6DQo+ID4gRVJST1I6
IEZ1bmN0aW9uIGZhaWxlZDogRmFpbGVkIHRvIHN0YXJ0IHFlbXUuIFlvdSBzaG91bGQgY2hlY2sg
dGhlIHRhc2sgbG9nIGFuZCB0aGUgcWVtdSBib290IGxvZyAocWVtdSBsb2cgaXMgL3Nydi9zc2Qv
c2d3L2J1aWxkcy93b3JsZC90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFn
ZS1zYXRvLzEuMC1yMC90ZXN0aW1hZ2UvcWVtdV9ib290X2xvZy4yMDEzMDcwNDA2NTAwMSkNCj4g
PiBFUlJPUjogTG9nZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjogL3Nydi9zc2Qvc2d3L2J1aWxk
cy93b3JsZC90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1zYXRvLzEu
MC1yMC90ZW1wL2xvZy5kb190ZXN0aW1hZ2UuMTgzNTQNCj4gPiBMb2cgZGF0YSBmb2xsb3dzOg0K
PiA+IHwgREVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fdGVzdGltYWdlDQo+ID4g
fCBOT1RFOiBUZXN0IG1vZHVsZXMgIFsnb2VxYS5ydW50aW1lLnBpbmcnLCAnb2VxYS5ydW50aW1l
LnNzaCcsICdvZXFhLnJ1bnRpbWUuY29ubm1hbicsICdvZXFhLnJ1bnRpbWUucnBtJywgJ29lcWEu
cnVudGltZS5zbWFydCcsICdvZXFhLnJ1bnRpbWUueG9yZycsICdvZXFhLnJ1bnRpbWUuZG1lc2cn
XQ0KDQpPbiBhIHNlY29uZCBsb29rLCB0aGlzIHNob3VsZG4ndCBiZSBub25lOg0KDQo+ID4gfCBO
T1RFOiBESVNQTEFZIHZhbHVlOiBOb25lDQoNCkJlY2F1c2UgdGhpcyBoYXBwZW5zOg0KDQo+ID4g
fCBSdW5uaW5nIHFlbXUtc3lzdGVtLXg4Nl82NC4uLg0KPiA+IHwgL3Nydi9zc2Qvc2d3L2J1aWxk
cy93b3JsZC90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9iaW4vcWVtdS1zeXN0ZW0teDg2
XzY0IC1rZXJuZWwgL3Nydi9zc2Qvc2d3L2J1aWxkcy93b3JsZC90bXAvZGVwbG95L2ltYWdlcy9i
ekltYWdlLXFlbXV4ODYtNjQuYmluIC1uZXQgbmljLHZsYW49MCAtbmV0IHRhcCx2bGFuPTAsaWZu
YW1lPXRhcDAsc2NyaXB0PW5vLGRvd25zY3JpcHQ9bm8gLWhkYSAvc3J2L3NzZC9zZ3cvYnVpbGRz
L3dvcmxkL3RtcC9kZXBsb3kvaW1hZ2VzL2NvcmUtaW1hZ2Utc2F0by1xZW11eDg2LTY0LmV4dDMg
LXNob3ctY3Vyc29yIC11c2IgLXVzYmRldmljZSB3YWNvbS10YWJsZXQgLXZnYSB2bXdhcmUgLW5v
LXJlYm9vdCAtc25hcHNob3QgLXNlcmlhbCB1bml4Oi90bXAvcWVtdWNvbm5lY3Rpb24uMTgzNTQs
c2VydmVyLG5vd2FpdCAtbSAxMjggLS1hcHBlbmQgInZnYT0wIHV2ZXNhZmIubW9kZV9vcHRpb249
NjQweDQ4MC0zMiByb290PS9kZXYvaGRhIHJ3IG1lbT0xMjhNIGlwPTE5Mi4xNjguNy4yOjoxOTIu
MTY4LjcuMToyNTUuMjU1LjI1NS4wIG9wcm9maWxlLnRpbWVyPTEgY29uc29sZT10dHlTMCINCj4g
PiB8IENvdWxkIG5vdCBpbml0aWFsaXplIFNETChObyBhdmFpbGFibGUgdmlkZW8gZGV2aWNlKSAt
IGV4aXRpbmcNCg0KQ2FuIHlvdSBleHBvcnQgRElTUExBWSBiZWZvcmUgcnVubmluZyB0aGUgdGFz
az8gQnV0IGRvbid0IHVzZQ0KRElTUExBWT1sb2NhbGhvc3Q6MSB1c2UgRElTUExBWT06MSAoc2Vl
IG15IG90aGVyIG1haWwpLg0KDQoNCkNoZWVycywgDQpTdGVmYW4NCg0K

