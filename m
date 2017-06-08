Return-Path: <ismo.puustinen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCC6781FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:35:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 05:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,314,1493708400"; d="scan'208";a="865866347"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2017 05:35:16 -0700
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.129]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.211]) with mapi id
	14.03.0319.002; Thu, 8 Jun 2017 13:35:16 +0100
From: "Puustinen, Ismo" <ismo.puustinen@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"alexander.kanavin@linux.intel.com" <alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] python3: make readline, gdbm, and db
	support conditional.
Thread-Index: AQHS35T4FenGFKJDF06RYftNXiAgH6IaulIAgAAdGYA=
Date: Thu, 8 Jun 2017 12:35:15 +0000
Message-ID: <1496925313.23488.6.camel@intel.com>
References: <20170607134942.13281-1-ismo.puustinen@intel.com>
	<75435a83-d29b-4b68-3e27-90746b31c970@linux.intel.com>
In-Reply-To: <75435a83-d29b-4b68-3e27-90746b31c970@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.72]
MIME-Version: 1.0
Subject: Re: [PATCH v2] python3: make readline, gdbm, and db support conditional.
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
X-List-Received-Date: Thu, 08 Jun 2017 12:35:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <66EC50CCCC069145ABA3B42320588A20@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE3LTA2LTA4IGF0IDEzOjUxICswMzAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gMDYvMDcvMjAxNyAwNDo0OSBQTSwgSXNtbyBQdXVzdGluZW4gd3JvdGU6DQo+ID4g
VGhlIHRocmVlIGxpYnJhcmllcycgKHJlYWRsaW5lLCBnZGJtLCBhbmQgZGIpIGxpY2Vuc2VzIGJl
bG9uZyB0bw0KPiA+IHRoZQ0KPiA+IEdQTHYzIGZhbWlseS4gQWRkIHRoZW0gdG8gdG8gUEFDS0FH
RUNPTkZJRyBzbyB0aGV5IGNhbiBiZSBzd2l0Y2hlZA0KPiA+IG9mZg0KPiA+IGlmIHRoZSBsaWNl
bnNpbmcgZG9lc24ndCBhbGxvdyB1c2luZyB0aGVtLiBQeXRob24gYnVpbGQgc3lzdGVtDQo+ID4g
YXV0b2RldGVjdHMgdGhlIGRlcGVuZGVuY2llcyBidXQgZG9lc24ndCBhbGxvdyB0aGVtIHRvIGJl
DQo+ID4gZXhwbGljaXRseQ0KPiA+IGRpc2FibGVkLCBzbyBqdXN0IGRlYWwgd2l0aCB0aGUgZGVw
ZW5kZW5jaWVzLg0KPiANCj4gZGIgc2hvdWxkIGJlIHRha2VuIG91dCBmcm9tIHRoaXMgcGF0Y2gs
IGl0J3Mgbm8gbG9uZ2VyIGEgZ3BsdjMNCj4gY29uY2VybsKgDQo+IG5vdyB0aGF0IHdlJ3JlIHBy
b3ZpZGluZyBkYiA1Lnggb25seSA6KQ0KDQpJIGNhbiBsZWF2ZSBkYiBvdXQgb2YgdGhlIHBhdGNo
IHRoZW4uIElzIGRiIDUueCBhIGxvbmctdGVybSBzb2x1dGlvbiBvcg0KZG8gd2UgaGF2ZSB0byBj
aGFuZ2UgdG8gNi54IGF0IHNvbWUgcG9pbnQ/IElzIGFueW9uZSBtYWludGFpbmluZyBkYiA1DQoo
c2VjdXJpdHkgZml4ZXMgZXNwZWNpYWxseSkgYW55bW9yZT8NCg0KSXNtbw==

