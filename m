Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 666F16AC7B
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:07:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2014 18:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,421,1406617200"; d="scan'208";a="591439553"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2014 18:06:24 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.252]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.108]) with mapi id
	14.03.0195.001; Thu, 28 Aug 2014 18:06:24 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH 1/1] imageconfigurator: a new recipe for
	boottime image configuration
Thread-Index: AQHPwvAuLnAH6mPsWkeiY92+tL7cDZvm522A//+LUzCAAHt7gP//kOtggACEVwD//43DQAAQ1skAAAqBu9A=
Date: Fri, 29 Aug 2014 01:06:24 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7CEBAC89@ORSMSX103.amr.corp.intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
	<CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAAAE@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LYr4r2WBBdPQeQWyHEhKYx_Fc-7DHKbSO57Rnx8_OMTJA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAB24@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LYe3MdLf08HmpY=2FO1XMNi5KmpXdJ-t09Yg2SiMYCWog@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAB9B@ORSMSX103.amr.corp.intel.com>
	<CAP9ODKoabWwGf7=KQHotYYLnnQw8c2A6U-3+=f4W0zmgPRaeHQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoabWwGf7=KQHotYYLnnQw8c2A6U-3+=f4W0zmgPRaeHQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>, "Wold, Saul" <saul.wold@intel.com>,
	OE-core <Openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 29 Aug 2014 01:07:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiANCj4gSSB0aGluayB0aGlzIHJlY2lwZSBpcyBzbWFsbCBlbm91Z2ggc28gSSBkb24ndCB0aGlu
ayBhZGRpbmcgYW5vdGhlciBvbmUgd2lsbCBidXkNCj4gYW55dGhpbmcuLi4NCk90YXZpbywgSSBh
Z3JlZSB3aXRoIHlvdSBoZXJlLg0KDQo+IA0KPiBXaGlsZSBvbiB0aGF0LCBjYW4geW91IGRlc2Ny
aWJlIHNvbWUgdXNlLWNhc2VzIHlvdSBzZWUgd2hpY2ggdGhpcyBjYW4gYmUNCj4gdXNlZCB0byBj
b3Zlcj8NCldlIGhhdmUgY29tbW9uIEJTUHMgaW4gbWV0YS1pbnRlbCBzdWNoIGFzIGludGVsLWNv
cmVpNy02NCBhbmQgaW50ZWwtY29yZTItMzIuIFRoZXNlIGFyZSB0YXJnZXRlZCBmb3IgbXVsdGlw
bGUgcGxhdGZvcm1zLCBidXQgZWFjaCBwbGF0Zm9ybSBuZWVkIGl0J3Mgb3duIGNvbmZpZ3VyYXRp
b24gc2V0dGluZ3MgdG8gbWFrZSBpdCBmdWxseSB1c2VmdWwuIFdpdGggdGhpcyBJbWFnZSBDb25m
aWd1cmF0b3IgdG9vbCwgb25lIGNhbiBzZWxlY3QgdGhlIHRhcmdldCBwbGF0Zm9ybSBhdCBib290
IHRpbWUgdG8gZ2V0IHRoZSBJbWFnZSBjb21wbGV0ZWx5IGNvbmZpZ3VyZWQgZm9yIHRoYXQgcGxh
dGZvcm0uIFRoaXMgYWJpbGl0eSBzaWduaWdpY2FudGx5IGN1dHMgZG93biB0aGUgbnVtYmVyIEJT
UHMgd2UgbmVlZCB0byBtYWludGFpbiBmb3IgdmFyaW91cyBwbGF0Zm9ybXMuIEFuZCBzYW1lIGNh
biBiZSBkb25lIHdpdGggb3RoZXIgYXJjaGl0ZWN0dXJlIEJTUHMuDQoNClRoYW5rcywNCk5pdGlu
DQoNCiAgDQoNCj4gDQo+IC0tDQo+IE90YXZpbyBTYWx2YWRvciAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgTy5TLiBTeXN0ZW1zDQo+IGh0dHA6Ly93d3cub3NzeXN0ZW1zLmNvbS5iciAgICAg
ICAgaHR0cDovL2NvZGUub3NzeXN0ZW1zLmNvbS5icg0KPiBNb2JpbGU6ICs1NSAoNTMpIDk5ODEt
Nzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEgKDM0NykgOTAzLTk3NTANCg==

