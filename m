Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QJfOU-0001NM-Ll
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:22:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,344,1301900400"; d="scan'208";a="744873158"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 22:19:16 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 13:18:27 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 13:18:26 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 10 May 2011 13:18:25 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 13:18:24 +0800
Thread-Topic: [OE-core] [PATCH 1/1] rsync (GPLv2): fix security
	vulnerability CVE-2007-4091
Thread-Index: AcwOz/BTCetS2spUTeqg50NQfPiGFAAADyxQ
Message-ID: <1865303E0DED764181A9D882DEF65FB69334F4BD88@shsmsx502.ccr.corp.intel.com>
References: <cover.1304995908.git.dexuan.cui@intel.com>
	<29a6f5e598717a6c701495174db9ef4f448e64e7.1304995908.git.dexuan.cui@intel.com>
	<4DC8C6C3.6070000@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6933502FCC3@shsmsx502.ccr.corp.intel.com>
	<4DC8C7A5.5090009@linux.intel.com>
In-Reply-To: <4DC8C7A5.5090009@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] rsync (GPLv2): fix security vulnerability CVE-2007-4091
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 05:22:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

U2F1bCBXb2xkIHdyb3RlOg0KPiBPbiAwNS8wOS8yMDExIDEwOjAzIFBNLCBIZSwgUWluZyB3cm90
ZToNCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206IG9wZW5lbWJlZGRl
ZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPj4+IFttYWlsdG86b3BlbmVt
YmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYNCj4+
PiBPZiBTYXVsIFdvbGQgU2VudDogMjAxMcTqNdTCMTDI1SAxMzowMg0KPj4+IFRvOiBQYXRjaGVz
IGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPj4+IFN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIIDEvMV0gcnN5bmMgKEdQTHYyKTogZml4IHNlY3VyaXR5DQo+Pj4g
dnVsbmVyYWJpbGl0eSBDVkUtMjAwNy00MDkxIA0KPj4+IA0KPj4+IE9uIDA1LzA5LzIwMTEgMDc6
NTQgUE0sIERleHVhbiBDdWkgd3JvdGU6DQo+Pj4+IEZyb206IERleHVhbiBDdWk8ZGV4dWFuLmN1
aUBpbnRlbC5jb20+DQo+Pj4+IA0KPj4+PiBBZGRlZCBhIHBhdGNoIHRvIGZpeA0KPj4+PiBodHRw
Oi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAwNy00MDkx
DQo+Pj4+IA0KPj4+IFRoaXMgaXMgbWlzc2luZyBhIFtZT0NUTyAjYnVnaWRdLCBwbGVhc2UgYWRk
IGFuZCByZXNlbmQuICh1cGRhdGUNCj4+PiBicmFuY2ggDQo+Pj4gaXMgT0spLg0KPj4gDQo+PiBT
YXVsLA0KPj4gCUJlZm9yZSB0aGUgb3RoZXIgdHdvIENWRXMgYXJlIHNwZWNpZmljYWxseSBhZGRy
ZXNzZWQsIEkgZG9uJ3QgdGhpbmsNCj4+IHdlIGNhbiBjYWxsIGEgY2xvc2Ugb24gdGhpcyBidWcu
IA0KPj4gDQo+IFllcywgdGhhdCdzIHRydWUsIGJ1dCBpdCdzIGltcG9ydGFudCB0byBrbm93IHRo
YXQgdGhpcyBwYXRjaA0KPiBhZGRyZXNzZXMgYSBwYXJ0IG9mIHRoYXQgYnVnLg0KSGkgU2F1bCwN
CkkgYWRkZWQgIltZT0NUTyAjOTg0XSBpcyBwYXJ0aWFsbHkgZml4ZWQgYnkgdGhpcyBjb21taXQi
ICBhbmQgZGlkICJnaXQgcHVzaCIganVzdCBub3cuDQpQbGVhc2UgdXNlIHRoZSBzYW1lIGJyYW5j
aCANCmh0dHA6Ly9naXQucG9reWxpbnV4Lm9yZy9jZ2l0L2NnaXQuY2dpL3Bva3ktY29udHJpYi9j
b21taXQvP2g9ZGN1aS9tYXN0ZXImaWQ9ODk4Y2UyZGRmNzc0NjQ2Nzk2YWY1Yzg3MDAxMzA5MTZh
ZmU2ZGJjMQ0KDQoNClRoYW5rcywNCi0tIERleHVhbg0K


