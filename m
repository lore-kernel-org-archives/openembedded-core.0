Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6506F61878
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 23:50:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Mar 2020 15:50:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="232436604"
Received: from pgsmsx114.gar.corp.intel.com ([10.108.55.203])
	by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2020 15:50:00 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.77]) by
	pgsmsx114.gar.corp.intel.com ([169.254.4.235]) with mapi id
	14.03.0439.000; Wed, 4 Mar 2020 07:50:00 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] bash: Fix CVE-2019-18276
Thread-Index: AQHV5nEFhVQSrHc3hE6AQYp+F2a3xqggkW6AgBUuTgCAAVorgA==
Date: Tue, 3 Mar 2020 23:49:59 +0000
Message-ID: <5cc81afa618ea969dc3d03f6e7ce356ec08e8efe.camel@intel.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
	,<41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
	<E6F6D39CB834524199A3A6D928AB1465539F327D@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <E6F6D39CB834524199A3A6D928AB1465539F327D@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.180.1]
MIME-Version: 1.0
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Tue, 03 Mar 2020 23:50:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFC6E7B27C94BD47948B4A66BC3BA462@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTAzLTAzIGF0IDAzOjExICswMDAwLCBZdSwgTWluZ2xpIHdyb3RlOg0KPiBI
aSBBbnVqLA0KPiANCj4gSSBhZ3JlZSB0aGUgQmFja3BvcnQgc3RhdHVzIGlzIG5vdCBhY2N1cmF0
ZSBhcyB0aGUgcGF0Y2ggZG9lc24ndCBnbw0KPiB0byBtYXN0ZXIgYnJhbmNoLCBidXQgd2h5IGRv
IHlvdSBzYXkgdGhlIHBhdGNoIGlzIGlycmVsZXZhbnQgdG8gdGhlDQo+IENWRS0yMDE5LTE4Mjc2
LCBjb3VsZCB5b3UgaGVscCB0byBwcm92aWRlIG1vcmUgaW5mbz8NCg0KSSBkaWRuJ3Qgc2F5IHRo
YXQgdGhlIHBhdGNoIHdhcyBpcnJlbGV2YW50IHRvIHRoZSBDVkUuIEkgaGFkIHNhaWQgdGhhdA0K
bm90IGFsbCB0aGUgY2hhbmdlcyB3ZXJlIHJlbGV2YW50LiBJIGJlbGlldmUgdGhlIGdsb2IgY2hh
bmdlcyBpbiB0aGUNCnBhdGNoIHdlcmUgaXJyZWxldmFudC4gVGhvc2UgY2hhbmdlcyBhbHNvIGlu
dHJvZHVjZWQgYSBmYWlsdXJlIGluIGJhc2gNCnB0ZXN0cy4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

