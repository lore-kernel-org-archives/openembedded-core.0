Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0E04C6A99C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 16:50:34 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2013 09:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1029,1363158000"; d="scan'208";a="265971399"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2013 09:50:35 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 9 Jul 2013 17:50:34 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.147]) with mapi id
	14.03.0123.003; Tue, 9 Jul 2013 17:50:34 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: Colin Walters <walters@verbum.org>
Thread-Topic: [OE-core] [RFC PATCH v2 3/8] lib/oeqa/utils/sshcontrol.py:
	helper module for running remote commands
Thread-Index: AQHOeWD/BrPBPBKx30yVlhb1U7XZBZlZteCAgALProA=
Date: Tue, 9 Jul 2013 16:50:34 +0000
Message-ID: <1373388681.30881.3.camel@firebird.rb.intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
	<a29e7a16581e848d017a56de42e4ee751639d529.1373013888.git.stefanx.stanacar@intel.com>
	<1373234131.5334.17.camel@localhost>
In-Reply-To: <1373234131.5334.17.camel@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH v2 3/8] lib/oeqa/utils/sshcontrol.py: helper module for running remote commands
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
X-List-Received-Date: Tue, 09 Jul 2013 16:50:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FE2D3E4CA67CD408781A87F8B5A0F2A@intel.com>
Content-Transfer-Encoding: base64

SGkgQ29saW4sDQoNCk9uIFN1biwgMjAxMy0wNy0wNyBhdCAxNzo1NSAtMDQwMCwgQ29saW4gV2Fs
dGVycyB3cm90ZToNCj4gT24gRnJpLCAyMDEzLTA3LTA1IGF0IDEyOjI3ICswMzAwLCBTdGVmYW4g
U3RhbmFjYXIgd3JvdGU6DQo+IA0KPiA+ICsgICAgICAgIGFjdHVhbGNtZCA9ICJzc2ggLW8gVXNl
cktub3duSG9zdHNGaWxlPS9kZXYvbnVsbCAtbyBTdHJpY3RIb3N0S2V5Q2hlY2tpbmc9bm8gLWwg
cm9vdCAlcyAnJXMnIiAlIChzZWxmLmhvc3QsIGNtZCkNCj4gDQo+IFRoaXMgaXMgZ29pbmcgdG8g
ZmFpbCBpZiBjbWQgY29udGFpbnMgYSBzaW5nbGUgcXVvdGUuICBQZXJzb25hbGx5LCBJDQo+ICph
bHdheXMqIHBhc3MgYXJvdW5kIHN1YnByb2Nlc3MgYXJndW1lbnRzIGFzIGFuIGFycmF5LiAgQW55
dGhpbmcgZWxzZSBpcw0KPiBnb2luZyB0byBsZWFkIHRvIHF1b3RpbmcgcHJvYmxlbXMuDQo+IA0K
PiANCj4gDQoNCllvdSdyZSByaWdodCwgSSBqdXN0IHNlbnQgYSBwYXRjaCB0aGF0IGRyb3BzIHRo
YXQgYW5kIGRvZXNuJ3QgdXNlIHNobGV4DQphbnltb3JlLg0KDQpUaGFua3MsDQpTdGVmYW4NCg==

