Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8117478561
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 16:28:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 09:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,304,1498546800"; d="scan'208";a="999199215"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by orsmga003.jf.intel.com with ESMTP; 31 Jul 2017 09:28:06 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 31 Jul 2017 09:28:06 -0700
Received: from fmsmsx106.amr.corp.intel.com ([169.254.5.222]) by
	FMSMSX119.amr.corp.intel.com ([169.254.14.117]) with mapi id
	14.03.0319.002; Mon, 31 Jul 2017 09:28:06 -0700
From: "Ibarra Lopez, Humberto" <humberto.ibarra.lopez@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] multiconfig.py: added testsuite for
	multiconfig
Thread-Index: AQHTBxUBs5qYPqEtRkuoavfWI6Sh9KJooTeAgAWD5EA=
Date: Mon, 31 Jul 2017 16:28:05 +0000
Message-ID: <F187383F84EB304A88D055C30495887946875974@FMSMSX106.amr.corp.intel.com>
References: <cover.1501186507.git.humberto.ibarra.lopez@intel.com>
	<b042029a217b541e652776a7117a35c70c81f4e3.1501186507.git.humberto.ibarra.lopez@intel.com>
	<1501189933.22282.170.camel@linuxfoundation.org>
In-Reply-To: <1501189933.22282.170.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] multiconfig.py: added testsuite for multiconfig
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
X-List-Received-Date: Mon, 31 Jul 2017 16:28:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCBkb2VzIG5vdCBjb25zaWRlciBjdXJyZW50IG11bHRpY29uZmlnIHNldHRpbmdz
LiBJIHRhbGtlZCB3aXRoIEFuaWJhbCBhYm91dCB0aGlzIGFuZCBoZSBzYWlkIHRoaXMgd291bGRu
J3QgYmUgYW4gaXNzdWUgYWZ0ZXIgIzExNDI5LCB3aGljaCBoZSBpcyB3b3JraW5nIG9uLiBKdXN0
IGNoZWNrZWQgdGhhdCBidWcgYW5kIGlzIHN0aWxsIGluIGltcGxlbWVudGF0aW9uLCBzbyBJIGNv
dWxkIHB1dCAxMTQyOSBhcyBhIGRlcGVuZGVuY3kgZm9yIDExNjEyPw0KDQpSZWdhcmRzLA0KDQpI
dW1iZXJ0byANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVy
ZGllIFttYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZ10gDQpTZW50OiBU
aHVyc2RheSwgSnVseSAyNywgMjAxNyA0OjEyIFBNDQpUbzogSWJhcnJhIExvcGV6LCBIdW1iZXJ0
byA8aHVtYmVydG8uaWJhcnJhLmxvcGV6QGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0g
bXVsdGljb25maWcucHk6IGFkZGVkIHRlc3RzdWl0ZSBmb3IgbXVsdGljb25maWcNCg0KT24gVGh1
LCAyMDE3LTA3LTI3IGF0IDE1OjE4IC0wNTAwLCBIdW1iZXJ0byBJYmFycmEgd3JvdGU6DQo+IE11
bHRpY29uZmlnIHdhcyBub3QgYmVpbmcgdGVzdGVkIGF0IGFsbC4gVGhpcyBhZGRzIGEgZmV3IGJh
c2ljIHRlc3RzIA0KPiBmb3IgbXVsdGljb25maWcsIGluY2x1ZGluZyBnbG9iYmluZy4NCj4gDQo+
IFtZb2N0byAjMTE2MTJdDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIdW1iZXJ0byBJYmFycmEgPGh1
bWJlcnRvLmliYXJyYS5sb3BlekBpbnRlbC5jb20+DQoNCklmIEkgcnVuIHRoaXMgc2VsZnRlc3Qg
YW5kIEkgaGF2ZSBzb21lIG11bHRpY29uZmlncyBhbHJlYWR5IGluIG15IGJ1aWxkIGRpcmVjdG9y
eSwgd2hhdCBoYXBwZW5zIHRvIHRoZW0/DQoNCkNoZWVycywNCg0KUmljaGFyZA0K

