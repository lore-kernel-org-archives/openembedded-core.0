Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1440F71C90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 21:49:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 12 Jan 2017 13:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,220,1477983600"; d="scan'208";a="1082331010"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2017 13:49:52 -0800
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 12 Jan 2017 13:49:53 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.23]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.181]) with mapi id
	14.03.0248.002; Thu, 12 Jan 2017 13:49:53 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] sanity.bbclass: Improved error message
Thread-Index: AQHSbQoP5VMSpQnqo06MUlKLxw3qbaE15XKA//97XCA=
Date: Thu, 12 Jan 2017 21:49:52 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6118F323E@ORSMSX112.amr.corp.intel.com>
References: <1484249086-36492-1-git-send-email-juro.bystricky@intel.com>
	<1484257321.4367.238.camel@linuxfoundation.org>
In-Reply-To: <1484257321.4367.238.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH] sanity.bbclass: Improved error message
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
X-List-Received-Date: Thu, 12 Jan 2017 21:49:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm8gcHJvYmxlbS4gV2lsbCBzZW5kIGluIHBhdGNoIFYyIHNob3J0bHkuDQoNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5
IDEyLCAyMDE3IDE6NDIgUE0NCj4gVG86IEJ5c3RyaWNreSwgSnVybyA8anVyby5ieXN0cmlja3lA
aW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gQ2M6IGp1cm9ieXN0cmlja3lAaG90bWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
c2FuaXR5LmJiY2xhc3M6IEltcHJvdmVkIGVycm9yIG1lc3NhZ2UNCj4gDQo+IE9uIFRodSwgMjAx
Ny0wMS0xMiBhdCAxMToyNCAtMDgwMCwgSnVybyBCeXN0cmlja3kgd3JvdGU6DQo+ID4gV2hlbiBh
IG5vbi1leGlzdGluZyBNQUNISU5FIGlzIHNwZWNpZmllZCwgc2FuaXR5IGNoZWNrIGlzc3Vlcw0K
PiA+IHRoZSBmb2xsb3dpbmcgbWVzc2FnZToNCj4gPg0KPiA+IMKgwqDCoMKgUGxlYXNlIHNldCBh
IHZhbGlkIE1BQ0hJTkUgaW4geW91ciBsb2NhbC5jb25mIG9yIGVudmlyb25tZW50DQo+ID4NCj4g
PiBIb3dldmVyLCBNQUNISU5FIGNhbiBhbHNvIGJlIHNldCBpbiBtdWx0aWNvbmZpZyAuY29uZiBm
aWxlKHMpLg0KPiA+IEhlbmNlIHdlIG1heSBoYXZlIHNldmVyYWwgZGlmZmVyZW50IE1BQ0hJTkUg
c2V0dGluZ3Mgd2l0aGluIG9uZQ0KPiA+IChtdWx0aWNvbmZpZykgYnVpbGQsIHNvIHRoZSBwcmVz
ZW50IGVycm9yIG1lc3NhZ2UgaXMgZmFpcmx5DQo+ID4gYW1iaWd1b3VzLg0KPiA+DQo+ID4gVGhp
cyBwYXRjaCByZW1lZGllcyB0aGlzIGJ5IGV4cGxpY2l0bHkgbmFtaW5nIHRoZSBvZmZlbmRpbmcg
TUFDSElORQ0KPiA+IGFuZA0KPiA+IGFkZGluZyBjb25mL211bHRpY29uZmlnLyouY29uZiB0byB0
aGUgbGlzdCBvZiBwbGFjZXMgd2hlcmUgdGhpcw0KPiA+IGVycm9uZW91cw0KPiA+IE1BQ0hJTkUg
ZGVmaW5pdGlvbiBjb3VsZCBoYXZlIG9yaWdpbmF0ZWQuDQo+ID4NCj4gPiDCoMKgwqDCoEludmFs
aWQgTUFDSElORT14eXouIFBsZWFzZSBzZXQgYSB2YWxpZCBNQUNISU5FIGluIHlvdXINCj4gPiBs
b2NhbC5jb25mLCBjb25mL211bHRpY29uZmlnLyouY29uZiBvciBlbnZpcm9ubWVudA0KPiANCj4g
Q2FuIHdlIGNoYW5nZSB0aGlzIHRvOg0KPiANCj4gIk1BQ0hJTkU9eHl6IGlzIGludmFsaWQuIFBs
ZWFzZSBzZXQgYSB2YWxpZCBNQUNISU5FIGluIHlvdXIgbG9jYWwuY29uZiwNCj4gZW52aXJvbm1l
bnQgb3Igb3RoZXIgY29uZmlndXJhdGlvbiBmaWxlLiINCj4gDQo+IEkgZG9uJ3Qgd2FudCB0byBo
YXZlIHRvIGxpc3QgYWxsIHRoZSBwb3NzaWJsZSBwbGFjZXMgeW91IGNvdWxkIHNldA0KPiBNQUNI
SU5FLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K

