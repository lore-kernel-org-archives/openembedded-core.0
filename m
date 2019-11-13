Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id C53AA7F555
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 01:33:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Nov 2019 17:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,298,1569308400"; d="scan'208";a="214207167"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by fmsmga001.fm.intel.com with ESMTP; 12 Nov 2019 17:33:15 -0800
Received: from pgsmsx106.gar.corp.intel.com (10.221.44.98) by
	KMSMSX151.gar.corp.intel.com (172.21.73.86) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 13 Nov 2019 09:33:14 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.88]) by
	PGSMSX106.gar.corp.intel.com ([10.221.44.98]) with mapi id
	14.03.0439.000; Wed, 13 Nov 2019 09:33:14 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH 14/20] OEQA: move manual bash test to runtime
Thread-Index: AQHVmRKlxsWtpW52c0mUqHN+xQK706eHzF+A
Date: Wed, 13 Nov 2019 01:33:14 +0000
Message-ID: <9d163a7dff4c555896f8426e90f3e14d69ac87ea.camel@intel.com>
References: <cover.1573532188.git.akuster808@gmail.com>
	<dbe5d8d0429ddca87fa80f613a8fbab287910696.1573532188.git.akuster808@gmail.com>
In-Reply-To: <dbe5d8d0429ddca87fa80f613a8fbab287910696.1573532188.git.akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.16.42]
MIME-Version: 1.0
Subject: Re: [PATCH 14/20] OEQA: move manual bash test to runtime
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
X-List-Received-Date: Wed, 13 Nov 2019 01:33:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3833B9096C94945A02F24FA88EC6440@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE5LTExLTExIGF0IDIwOjMzIC0wODAwLCBBcm1pbiBLdXN0ZXIgd3JvdGU6DQo+
ICsNCj4gK2NsYXNzIEJzcChPRVNlbGZ0ZXN0VGVzdENhc2UpOg0KPiArICAgIGRlZiB0ZXN0X2Jh
c2hfaW5zdGFsbGVkKHNlbGYpOg0KPiArICAgICAgICAiIiINCj4gKyAgICAgICAgU3VtbWFyeTog
ICAgICAgIFRoZSBwdXJwb3NlIG9mIHRoaXMgdGVzdCBjYXNlIGlzIHRvIHZlcmlmeQ0KPiB0aGF0
IGJhc2ggDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBpbiBleGlzdHMgaW4gdGhlIGltYWdl
LiBUZXN0IGNhbWUgZnJvbQ0KPiBtYW51YWwuDQo+ICsgICAgICAgIEV4cGVjdGVkOiAgICAgICBC
YXNoIGlzIGZvdW5kLg0KPiArICAgICAgICAiIiINCj4gKw0KPiArICAgICAgICBmZWF0dXJlcyA9
ICdJTUFHRV9JTlNUQUxMX2FwcGVuZCA9ICIgYmFzaCJcbicNCj4gKyAgICAgICAgc2VsZi53cml0
ZV9jb25maWcoZmVhdHVyZXMpDQo+ICsgICAgICAgIGJpdGJha2UoJ2NvcmUtaW1hZ2UtbWluaW1h
bCcpDQo+ICsNCj4gKyAgICAgICAgd2l0aCBydW5xZW11KCdjb3JlLWltYWdlLW1pbmltYWwnKSBh
cyBxZW11Og0KPiArICAgICAgICAgICAgcmVzdWx0ID0gcnVuQ21kKCJ3aGljaCBiYXNoIiAsIHNo
ZWxsPVRydWUpDQo+ICsgICAgICAgICAgICBzZWxmLmFzc2VydEVxdWFsKDAsIHJlc3VsdC5zdGF0
dXMsICJDb3VsZG4ndCBmaW5kIGJhc2giKQ0KPiAtLSANCg0KV2UgaGF2ZSBJbmNvbXBhdGlibGVM
aWNlbnNlUGVySW1hZ2VUZXN0cyB0aGF0IHRlc3RzIGZvciBwcmVzZW5jZSBvZg0KYmFzaCB3aGVu
IGRpZmZlcmVudCBMSUNFTlNFIHZhbHVlcyBhcmUgc2V0Lg0KDQpQZXJoYXBzIHdlIGRvbid0IG5l
ZWQgdGhpcyBhbmQgY2FuIGNvbnNpZGVyIHRoaXMgY2FzZSBjb3ZlcmVkIGJ5IHRoYXQNCnRlc3Q/
DQoNClRoYW5rcywNCg0KQW51ag0K

