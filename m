Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71D317ED57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 04:12:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2019 21:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,415,1559545200"; d="scan'208";a="178708908"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by fmsmga008.fm.intel.com with ESMTP; 21 Aug 2019 21:11:51 -0700
Received: from pgsmsx109.gar.corp.intel.com (10.221.44.109) by
	PGSMSX111.gar.corp.intel.com (10.108.55.200) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 22 Aug 2019 12:11:50 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.232]) by
	PGSMSX109.gar.corp.intel.com ([169.254.14.101]) with mapi id
	14.03.0439.000; Thu, 22 Aug 2019 12:11:49 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, "martin.jansa@gmail.com"
	<martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH V2] gcc-runtime: Move content from gcclibdir
	into libdir
Thread-Index: AQHVVCpb5BujuS3p10qY7zAg3xxZhab9Wm0AgAi2kQA=
Date: Thu, 22 Aug 2019 04:11:48 +0000
Message-ID: <7d45802126aa811e2c309761979ed0452f0a1d0a.camel@intel.com>
References: <20190813152835.12578-1-raj.khem@gmail.com>
	<CA+chaQf6EnDHU=9U6q1a2_p=grcyWoy2epYXP+yaZ--qi0eH4Q@mail.gmail.com>
	<CAMKF1sqBFvdWb9XxGaUUZpcJh7zrcNkwBRLj7Ga3K35a+Fb2CA@mail.gmail.com>
In-Reply-To: <CAMKF1sqBFvdWb9XxGaUUZpcJh7zrcNkwBRLj7Ga3K35a+Fb2CA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.183.104]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] gcc-runtime: Move content from gcclibdir into libdir
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
X-List-Received-Date: Thu, 22 Aug 2019 04:12:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FEA5802FA4739469EDD621BAC342758@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE5LTA4LTE2IGF0IDA4OjA4IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
RnJpLCBBdWcgMTYsIDIwMTkgYXQgNTowMCBBTSBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBn
bWFpbC5jb20+DQo+IHdyb3RlOg0KPiA+IEhpLA0KPiA+IA0KPiA+IEkgaGF2ZSBhbiBhcHAgd2hp
Y2ggaW5jbHVkZXMgb21wLmggZnJvbSBnb21wLCBpdCB1c2VkIHRvIGZpbmQgaXQNCj4gPiB3aXRo
b3V0IGFkZGluZyBhbnkgLUkgZm9yIHRoYXQgKHdpdGgganVzdCAtZm9wZW5tcCB0byBlbmFibGUN
Cj4gPiBvcGVubXApLg0KPiA+IA0KPiA+IE5vdyB0aGUgaGVhZGVyIGZpbGUgaXMgaW5jbHVkZWQg
aW4gUlNTOg0KPiA+IGxpYjMyLXJlY2lwZS1zeXNyb290L3Vzci9saWIvYXJtLW9lbWxsaWIzMi1s
aW51eC0NCj4gPiBnbnVlYWJpLzkuMi4wL2luY2x1ZGUvb21wLmgNCj4gPiBidXQgbm8gbG9uZ2Vy
IGZvdW5kIGluIGRlZmF1bHQgc2VhcmNoIGRpcnMuDQo+ID4gDQo+ID4gSXMgdGhpcyBleHBlY3Rl
ZCBvciBzaG91bGQgZ2NjIGJlIGFkanVzdGVkIHRvIHNlYXJjaCBmb3IgaXQNCj4gPiBhdXRvbWF0
aWNhbGx5Pw0KPiA+IA0KPiANCj4gSXQgc2hvdWxkIGhhdmUgYWRqdXN0ZWQgYXV0b21hdGljYWxs
eSBidXQgdGhlc2UgaGVhZGVycyBhcmUgc2VhcmhlZA0KPiByZWxhdGl2ZSB0byBpdHMgb3duIGlu
c3RhbGwgYW5kIG5vdCBzeXNyb290IHJlZWxhdGl2ZQ0KPiBzbyBpdCBtaWdodCBoYXZlIHRvIGJl
IGFkZHJlc3NlZC4gRG9lcyBpdCB3b3JrIHdpdGggbm9ybWFsICgNCj4gbm9uLW11bHRpbGliICkg
Y2FzZSA/DQoNCkl0J3Mgbm90IHdvcmtpbmcgZm9yIG1lIGFzIHdlbGwuIEl0J3MgZWFzeSB0byBy
ZXByb2R1Y2Ugd2hlbiB1c2luZw0KZmluZF9wYWNrYWdlKE9wZW5NUCkgd2l0aCBjbWFrZS4NCg0K
VGhlIHNlYXJjaCBwYXRocyBhbHNvIGRvbid0IGxpc3QgdGhpcyBuZXcgcGF0aCBhbmQgYXJlIGxv
b2tpbmcgZm9yDQpoZWFkZXJzIGluIG9sZCBvbmUuIFdvdWxkIHRoZSBwYXRoIGluIHBhdGNoICIw
MDIwLUVuc3VyZS10YXJnZXQtZ2NjLQ0KaGVhZGVycy1jYW4tYmUtaW5jbHVkZWQucGF0Y2giIGhh
dmUgdG8gYmUgYWRqdXN0ZWQgYXMgd2VsbCB0byBpbmNsdWRlDQp0aGlzIG5ldyBsb2NhdGlvbj8N
Cg0KVGhhbmtzLA0KDQpBbnVqDQo=

