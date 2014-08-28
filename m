Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D853470EE6
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 22:13:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2014 15:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,420,1406617200"; d="scan'208";a="583123738"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2014 15:13:51 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 28 Aug 2014 15:13:51 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.252]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.35]) with mapi id
	14.03.0195.001; Thu, 28 Aug 2014 15:13:50 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] imageconfigurator: a new recipe for
	boottime image configuration
Thread-Index: AQHPwvAuLnAH6mPsWkeiY92+tL7cDZvm522A//+LUzCAAHt7gP//kOtggACEVwD//43DQA==
Date: Thu, 28 Aug 2014 22:13:50 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7CEBAB9B@ORSMSX103.amr.corp.intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
	<CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAAAE@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LYr4r2WBBdPQeQWyHEhKYx_Fc-7DHKbSO57Rnx8_OMTJA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAB24@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LYe3MdLf08HmpY=2FO1XMNi5KmpXdJ-t09Yg2SiMYCWog@mail.gmail.com>
In-Reply-To: <CAJTo0LYe3MdLf08HmpY=2FO1XMNi5KmpXdJ-t09Yg2SiMYCWog@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: OE-core <Openembedded-core@lists.openembedded.org>, "Hart,
	Darren" <darren.hart@intel.com>, "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] imageconfigurator: a new recipe for boottime image configuration
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
X-List-Received-Date: Thu, 28 Aug 2014 22:13:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiANCj4gSXQgd2lsbCBqdXN0IGJlIGEgbWF0dGVyIG9mIGltYWdlY29uZmlndXJhdG9yIFJSRUNP
TU1FTkRpbmcNCj4gaW1hZ2Vjb25maWd1cmF0b3ItZGF0YSwgYW5kIHRoZW4gaW1hZ2Vjb25maWd1
cmF0b3ItZGF0YSBiZWluZw0KPiBtYWNoaW5lYXJjaCBhbmQgZG9pbmcgdGhlIHBlci1tYWNoaW5l
IG1hZ2ljIGhvd2V2ZXIgaXQgd2FudHMuDQo+IA0KPiBSb3NzDQpJIHNlZS4gVGhhdCBtZWFucyB0
aGUgcmVjaXBlIHdpbGwgYmUgc3BsaXQgaW50byB0d28gcmVjaXBlcy4gSXQgd291bGQgYmUgY29v
bCwgaWYgaXQgY2FuIGJlIGRvbmUgd2l0aCBhIHNpbmdsZSByZWNpcGUuIEJ1dCB0aGF0IHdvdWxk
IG5lZWQgYWJpbGl0eSB0byBtYXJrIGRpZmZlcmVudCBQQUNLQUdFX0FSQ0hTIHRvIGRpZmZlcmVu
dCBwYWNrYWdlcyBvZiB0aGUgc2FtZSByZWNpcGUuDQoNClNwbGl0dGluZyB0aGUgcmVjaXBlIGlu
dG8gdHdvIGhhcyBvdGhlciBjb25zZXF1ZW5jZXMuDQoxLiBUaGUgbm9uLWRhdGEgcmVjaXBlIGlz
IG9mIG5vIHVzZSBpZiB0aGUgZGF0YSByZWNpcGUgaXMgbm90IHByZXNlbnQuDQoyLiBUaGUgZGF0
YSByZWNpcGUgaW4gdGhlIG9lY29yZSBsYXllciB3aWxsIGJlIGVtcHR5LCBzbyBpdCBjYW4gYmUg
ZHJvcHBlZCBmcm9tIHRoZSBvZWNvcmUgbGF5ZXIuDQozLiBXaXRoIHRoYXQgdGhlIDIgcmVjaXBl
cyBnbyBpbiB0d28gc2VwYXJhdGUgbGF5ZXJzIHdoaWNoIG5lZWQgZWFjaCBvdGhlciwgd2hpY2gg
aXMgYW4gYXdrd2FyZCBvcmdhbml6YXRpb24gb2YgcmVjaXBlcy4NCg0KSXMgdGhlcmUgYW55IGJl
dHRlciB3YXkgdG8gYWNoaWV2ZSB0aGUgc2FtZSB3aXRob3V0IHNwbGl0dGluZyB0aGUgcmVjaXBl
IGludG8gMj8NCg0KVGhhbmtzLA0KTml0aW4NCg0KDQoNCg==

