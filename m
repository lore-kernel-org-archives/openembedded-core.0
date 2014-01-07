Return-Path: <darren.hart@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 79C556CD86
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 21:32:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jan 2014 13:32:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,620,1384329600"; d="scan'208";a="455066370"
Received: from fmsmsx106.amr.corp.intel.com ([10.19.9.37])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2014 13:32:29 -0800
Received: from fmsmsx153.amr.corp.intel.com (10.19.17.7) by
	FMSMSX106.amr.corp.intel.com (10.19.9.37) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 7 Jan 2014 13:32:28 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.40]) by
	FMSMSX153.amr.corp.intel.com ([169.254.9.56]) with mapi id
	14.03.0123.003; Tue, 7 Jan 2014 13:32:28 -0800
From: "Hart, Darren" <darren.hart@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Thread-Topic: [OE-core] [PATCH] kernel: use oldnoconfig instead of yes '' |
	make oldconfig
Thread-Index: AQHPC7N+ail4eH7Ys0GRGJPgvwBzhpp52kQAgAAMeYCAAAl6AIAAJhmAgAAnjACAABDEAA==
Date: Tue, 7 Jan 2014 21:32:27 +0000
Message-ID: <1389130346.5785.48.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20140107143558.GQ3709@jama> <52CC1B45.9010808@free-electrons.com>
	<20140107155432.GS3709@jama>
	<1389118253.5785.25.camel@dvhart-mobl4.amr.corp.intel.com>
	<52CC645A.5040107@free-electrons.com>
In-Reply-To: <52CC645A.5040107@free-electrons.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.196.146]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 21:32:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <926CBCE5550D3843BB850741DAC49A64@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE0LTAxLTA3IGF0IDIxOjMyICswMTAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90
ZToNCj4gT24gMDcvMDEvMjAxNCAxOToxMSwgSGFydCwgRGFycmVuIHdyb3RlOg0KPiA+IA0KPiA+
IFBsZWFzZSBjaGVjayBmb3IgdGhlIGZ1bmN0aW9uYWxpdHksIG5vdCBLRVJORUxfVkVSU0lPTi4g
VGhlDQo+ID4gS0VSTkVMX1ZFUlNJT04gZG9lc24ndCBhbGxvdyBmb3IgYmFja3BvcnRzIGFuZCBz
dWNoIHdoaWNoIG1pZ2h0IGFkZCB0aGlzDQo+ID4gYWJpbGl0eS4gR3JlcCB0aGUgTWFrZWZpbGUg
Zm9yIHRoZSB0YXJnZXQsIGZvciBleGFtcGxlLCBpZiB0aGUgYWJvdmUgT1INCj4gPiBzdGF0ZW1l
bnQgaXNuJ3QgYWRlcXVhdGUuDQo+ID4gDQo+IA0KPiBJIGd1ZXNzIHRoZSBPUiBpcyBwZXJmZWN0
bHkgZmluZSB0aGVuLiBGb3Igd2hhdGV2ZXIgcmVhc29uIG1ha2UNCj4gb2xkbm9jb25maWcgZmFp
bHMsIHdlJ2xsIGZhbGwgYmFjayB0byB0aGUgb2xkIGJlaGF2aW9yLg0KPiANCj4gPiBBcyBCcnVj
ZSBzdGF0ZWQsIGl0IHNlZW1zIHRoYXQgdGhlIGZpeCB3b3VsZCBiZSB0byB1c2UgdGhlIHVwZGF0
ZWQNCj4gPiBLY29uZmlnLCBub3QgZGVmYXVsdCB0byBzZXR0aW5nIHRoaW5ncyB0byBOTy4gVGhl
IHByb2JsZW0gd2l0aCB0aGF0DQo+ID4gYXBwcm9hY2ggaXMgaXQgZG9lc24ndCBhY2NlcHQgZGVm
YXVsdHMgZm9yIG5vbi1zcGVjaWZpZWQgb3B0aW9ucyAod2hpY2gNCj4gPiB3aGVuIHVwZGF0aW5n
IGtlcm5lbCB2ZXJzaW9ucywgaXMgb2Z0ZW4gdGhlIHByZWZlcnJlZCBhcHByb2FjaCkuDQo+ID4g
DQo+IA0KPiBJIHRoaW5rIHlvdSBnb3QgaXQgd3Jvbmc6DQo+ICAtIEkgYW0gYWxyZWFkeSB1c2lu
ZyBhbiB1cGRhdGVkIGtjb25maWcgKEkgZXZlbiBiYWNrcG9ydGVkIGl0IG9uIHRoZQ0KPiBvbGRl
ciBrZXJuZWwgdmVyc2lvbikNCj4gIC0gbWFrZSBvbGRub2NvbmZpZyBpcyBOT1Qgc2V0dGluZyB0
aGluZ3MgdG8gTk8gYnV0IHRvIHRoZSBkZWZhdWx0IHZhbHVlDQo+IG9mIHRoZSB1bnNwZWNpZmll
ZCBvcHRpb25zIChleGFjdGx5IHdoYXQgd2UgbmVlZCkuIFRoZSBjaG9pY2Ugb2YgdGhlDQo+IG5h
bWUgd2FzIG5vdCB3aXNlIGFuZCBJdCBoYXMgYmVlbiByZW5hbWVkIG9sZGRlZmNvbmZpZyBzaW5j
ZSAzLjcNCj4gDQo+IA0KDQpJIHNlZSAtIHlvdSdyZSByaWdodCwgSSBoYWQgbWlzdW5kZXJzdG9v
ZC4NCg0KLS0gDQpEYXJyZW4gSGFydA0KSW50ZWwgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50
ZXINCllvY3RvIFByb2plY3QgLSBMaW51eCBLZXJuZWwNCg0K

