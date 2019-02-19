Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D771A6BE3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 01:02:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Feb 2019 17:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,385,1544515200"; d="scan'208";a="117209001"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
	by orsmga006.jf.intel.com with ESMTP; 18 Feb 2019 17:02:02 -0800
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.167]) by
	PGSMSX102.gar.corp.intel.com ([169.254.6.107]) with mapi id
	14.03.0415.000; Tue, 19 Feb 2019 09:02:01 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2 v7] test-case-mgmt
Thread-Index: AQHUx3JruwYb6D1IKEyU0QOXDjzg8qXmTjrQ
Date: Tue, 19 Feb 2019 01:02:01 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434818652D@PGSMSX109.gar.corp.intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
	<8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434818607F@PGSMSX109.gar.corp.intel.com>
	<f8f1b23ffe248d9ad469b25ed2226fa426ed152c.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D043481860E7@PGSMSX109.gar.corp.intel.com>
	<f4c88aab6ff934328e03be66ade30d04a679e65f.camel@linuxfoundation.org>
In-Reply-To: <f4c88aab6ff934328e03be66ade30d04a679e65f.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDMxOThjZDItMzc2YS00Y2I4LTllNzItZTY1MjZmNWU4Yzc0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicHZJQ3BtM3BRM0FYek1UNEd0MVljeWRuc0RheHQwajhZaVZQdndwU21iM2ZicGdOeXpqd0htbExUck9QVVhYYiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Tue, 19 Feb 2019 01:02:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UlAsIA0KTm90ZWQsIHRoYW5rcy4gDQoNCkNoZWVycywNCkVlIFBlbmcgDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogTW9uZGF5LCBGZWJydWFyeSAxOCwgMjAx
OSA2OjEyIFBNDQpUbzogWWVvaCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV0gW1BBVENIIDAvMiB2N10gdGVzdC1jYXNlLW1nbXQNCg0KT24gTW9uLCAyMDE5LTAyLTE4
IGF0IDA5OjIwICswMDAwLCBZZW9oLCBFZSBQZW5nIHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHNo
YXJpbmcgb24gdGhlIHNlbGZ0ZXN0IGNvbXBhcmlzb24gY29uc2lkZXJhdGlvbiEgDQo+IA0KPiBJ
IGFncmVlZCB3aXRoIHlvdSB0aGF0IGluIHRoZSBoaWdoIGxldmVsLCBzZWxmdGVzdCBzaG91bGQg
YmUgDQo+IGluZGVwZW5kZW50IG9mIHdoaWNoIEhPU1RfRElTVFJPLCBpdCBzaGFsbCBjb21wYXJl
ZCAyIHNlbGZ0ZXN0IGV2ZW4gDQo+IHdoZW4gdGhlIGhvc3QgZGlzdHJvIGFyZSBkaWZmZXJlbnQu
DQo+IA0KPiBCdXQgaW4gdGhlIGNhc2UgdGhhdCB0aGUgYnVpbGQgaGF2ZSBtdWx0aXBsZSBzZXQg
b2Ygc2VsZnRlc3QgZWFjaCB3aXRoIA0KPiBzbGlnaHRseSBkaWZmZXJlbnQgZW52aXJvbm1lbnRz
IChlZy4gaG9zdCBkaXN0cm8pLCBpbiB0aGF0IGNhc2UsIHdpbGwgDQo+IGl0IGJldHRlciB0byBj
b21wYXJlIHNlbGZ0ZXN0IG1vcmUgY2xvc2VseSBpZiBwb3NzaWJsZSB3aXRoIHNhbWUgaG9zdCAN
Cj4gZGlzdHJvIHVzZWQ/DQoNCkluIGFuIGlkZWFsIHdvcmxkLCB5ZXMuIEluIHJlYWxpdHkgdHJ5
aW5nIHRvIGRvIHRoYXQgYW5kIG1ha2luZyBpdCBjb25kaXRpb25hbCB3aWxsIGNvbXBsaWNhdGUg
dGhlIGNvZGUgZm9yIGxpdHRsZSAicmVhbCIgZW5kIGRpZmZlcmVuY2UgdGhvdWdoPw0KDQpDaGVl
cnMsDQoNClJpY2hhcmQNCg0K

