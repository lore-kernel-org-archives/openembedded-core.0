Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C08787EF68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 23:26:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jul 2019 16:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,296,1559545200"; d="scan'208";a="320830151"
Received: from kmsmsx152.gar.corp.intel.com ([172.21.73.87])
	by orsmga004.jf.intel.com with ESMTP; 22 Jul 2019 16:26:30 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.22]) by
	KMSMSX152.gar.corp.intel.com ([169.254.11.92]) with mapi id
	14.03.0439.000; Tue, 23 Jul 2019 07:26:27 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Kai.Kang@windriver.com" <Kai.Kang@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/2] defaultsetup.conf: enable
	select init manager
Thread-Index: AQHVQC5YQSYsIyDN80WWvDB7WGEHmKbWw0oA
Date: Mon, 22 Jul 2019 23:26:26 +0000
Message-ID: <73fdb42fa63f84e7ed6ec52a183bff73edc4272b.camel@intel.com>
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-2-kai.kang@windriver.com>
	<CAJTo0LbmYp-70L=Z_T0jE4xS1mR_vLXKQE18O_EpeEwD6wdroA@mail.gmail.com>
	<a3ee2977ee2d63f1908f110d9273352815ba7d35.camel@linuxfoundation.org>
	<8d6b156e-7d68-e4b8-8688-2c897ebf228a@windriver.com>
In-Reply-To: <8d6b156e-7d68-e4b8-8688-2c897ebf228a@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.21.220]
MIME-Version: 1.0
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] defaultsetup.conf: enable select init manager
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
X-List-Received-Date: Mon, 22 Jul 2019 23:26:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <05E8746326D31247883AF1219E311336@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE5LTA3LTIyIGF0IDA5OjM3ICswODAwLCBLYW5nIEthaSB3cm90ZToNCj4gSSBq
dXN0IHJ1biBvZS1zZWxmdGVzdCAtYSB3aXRoIHRoaXMgcGF0Y2ggYWZ0ZXIgeW91IHVwZGF0ZWQg
dGhlIHBhdGNoDQo+IGluIA0KPiBvZS1jb3JlLiBCdXQgSSBtZXQgc29tZSAoPjE1KSBlcnJvcnMN
Cj4gDQo+IEVSUk9SOiBVbmFibGUgdG8gc3RhcnQgYml0YmFrZSBzZXJ2ZXIgKE5vbmUpDQo+IA0K
PiBCdXQgSSB0aGluayBpdCBzaG91bGQgbm90IGJlIHJlbGF0ZWQgd2l0aCBpbml0IG1hbmFnZXIg
Y2hhbmdlcyBhbmQNCj4gd2lsbCANCj4gY2hhbmdlIGEgYnVpbGQgbWFjaGluZSB0byB0ZXN0Lg0K
PiBEbyB5b3UgaGF2ZSB0ZXN0IGl0IGFnYWluIGluIGF1dG9idWlsZGVyIGFuZCBhbnkgZmFpbHVy
ZSBmb3VuZD8NCj4gVGhhbmtzLg0KDQpOb3Qgc3VyZSBpZiB0aGVzZSBoYXZlIGJlZW4gcmVwb3J0
ZWQgYnV0IHRoZXJlIGFyZSBzb21lIGZhaWx1cmVzIGluDQpydW50aW1lIHRlc3RzIHdoaWNoIGxv
b2sgcmVsYXRlZCB0byB0aGlzIGNoYW5nZToNCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy8zOC9idWlsZHMvODU1L3N0ZXBzLzgvbG9ncy9z
dGVwMWMNCg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9i
dWlsZGVycy81MC9idWlsZHMvODUyL3N0ZXBzLzgvbG9ncy9zdGVwMWMNCg0KaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy83Ni9idWlsZHMvODU2
L3N0ZXBzLzgvbG9ncy9zdGVwMmMNCg0KVGhhbmtzLA0KDQpBbnVqDQo=

