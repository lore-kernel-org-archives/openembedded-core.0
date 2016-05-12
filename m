Return-Path: <ismo.puustinen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 54F7A60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 11:17:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2016 04:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="978298613"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2016 04:17:32 -0700
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.133]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.54]) with mapi id
	14.03.0248.002; Thu, 12 May 2016 12:17:31 +0100
From: "Puustinen, Ismo" <ismo.puustinen@intel.com>
To: "stephano.cetola@linux.intel.com" <stephano.cetola@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2 0/2] Create systemd users at build time
Thread-Index: AQHRqkxlcvHHIM/kHU6E1O9g4gO1up+zf2yAgACLJoCAAQ/RgA==
Date: Thu, 12 May 2016 11:17:30 +0000
Message-ID: <1463051851.16808.27.camel@intel.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
	<1462963597.11059.13.camel@intel.com>
	<20160511190439.GA54030@ctaylor1-mobl3.amr.corp.intel.com>
In-Reply-To: <20160511190439.GA54030@ctaylor1-mobl3.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.160]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Create systemd users at build time
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
X-List-Received-Date: Thu, 12 May 2016 11:17:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8A27C5BF961BA4D95697D14274B632C@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTA1LTExIGF0IDEyOjA0IC0wNzAwLCBTdGVwaGFubyBDZXRvbGEgd3JvdGU6
DQo+ID4gSSB0aGluayB0aGlzIGlzIGEgdmFsdWFibGUgZmVhdHVyZS4gSG93ZXZlciwgaGF2ZSB5
b3UgY29uc2lkZXJlZA0KPiA+IGFkZGluZw0KPiA+IHRoZSAibSIgYW5kICJyIiBvcHRpb25zIHRv
bz8gSSB0aGluayB0aGF0IGF0IGxlYXN0ICJtIiB3b3VsZCBiZQ0KPiA+IHdvcnRod2hpbGUgdG8g
aW1wbGVtZW50LCBzaW5jZSBpdCdzIGltcG9ydGFudCB0byBiZSBhYmxlIHRvIGFkZA0KPiA+IHVz
ZXJzDQo+ID4gdG8gZGlmZmVyZW50IGdyb3VwcyBmb3IgcHJpdmlsZWdlIG1hbmFnZW1lbnQuDQo+
DQo+IEkgYWRkZWQgIi0tc3lzdGVtIiB0byBib3RoIHVzZXJhZGQgYW5kIGdyb3VwYWRkLCBhbmQg
SSBiZWxpZXZlIHRoYXQNCj4gaXMNCj4gdGhlIHNhbWUgYXMgIi1yIi4gUGxlYXNlIGNvcnJlY3Qg
bWUgaWYgSSBhbSB3cm9uZyB0aGVyZS4NCj4gDQo+IEkgZG8gbm90IHNlZSBob3cgdGhlICItbSIg
b3B0aW9uIHdvdWxkIGhlbHAgd2l0aCBncm91cHMuIEkgdGhvdWdodA0KPiB0aGF0DQo+IHNpbXBs
eSBhZGRlZCBhIHNrZWxldG9uIGhvbWUgZGlyZWN0b3J5LiBDb3VsZCB5b3UgZ2l2ZSBtZSBhbiBl
eGFtcGxlPw0KDQpJIG1lYW4gdGhhdCB3aGVuIHlvdSBwYXJzZSB0aGUgc3lzdXNlcnMuZCBjb25m
aWd1cmF0aW9uIGZpbGUNCmluwqBjcmVhdGVfc3lzdGVtZF9zeXN1c2VycygpIGZ1bmN0aW9uLCB5
b3Ugb25seSBwYXJzZSB0aGUgbGluZXMNCnN0YXJ0aW5nIHdpdGggJ3UnIGFuZCAnZycuIFlvdSBh
cmUgc2tpcHBpbmcgJ20nIGFuZCAncicuIFNlZToNCg0KaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Au
b3JnL3NvZnR3YXJlL3N5c3RlbWQvbWFuL3N5c3VzZXJzLmQuaHRtbA0KDQpXaGF0IEknbSBhZnRl
ciBpcyBhIGdlbmVyaWMgbWVjaGFuaXNtIGZvciByZWFkaW5nIGFsbCBzeXN1c2Vycy5kLw0KY29u
ZmlndXJhdGlvbiBmaWxlcyBkdXJpbmcgaW1hZ2UgY3JlYXRpb24gYW5kIGNyZWF0aW5nIHRoZSBu
ZWNlc3NhcnkNCnVzZXJzIGFuZCBncm91cHMgZHVyaW5nIHRoYXQgdGltZS4gWW91IGNvdWxkIGFs
c28gc2VwYXJhdGUgbWVjaGFuaXNtDQphbmQgcG9saWN5LCBtZWFuaW5nIHRoYXQgdGhlIGxpc3Qg
b2YgZmlsZXMgdG8gcGFyc2UgY291bGQgY29tZSBmcm9tDQpvdXRzaWRlIG9mIHRoZSBjcmVhdGVf
c3lzdGVtZF9zeXN1c2VycygpIGZ1bmN0aW9uLg0KDQpJc21v

