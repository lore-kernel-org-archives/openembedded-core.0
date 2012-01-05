Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Riqjd-00076z-Ji
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:04:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2012 08:56:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109112646"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 08:56:49 -0800
Received: from orsmsx103.amr.corp.intel.com (10.22.225.130) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 5 Jan 2012 08:56:49 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.229]) by
	ORSMSX103.amr.corp.intel.com ([169.254.2.47]) with mapi id
	14.01.0355.002; Thu, 5 Jan 2012 08:56:48 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] mc: fix configure with automake 1.11.2
Thread-Index: AQHMy7uvJw5XqSIAqEO+zcMj0cX83pX9/jZQ
Date: Thu, 5 Jan 2012 16:56:48 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0147BC@ORSMSX106.amr.corp.intel.com>
References: <cover.1325669461.git.dexuan.cui@intel.com>
	<338da10abcd744ab75dfb184f8f81370727e5653.1325669461.git.dexuan.cui@intel.com>
	<CAGiJk9c52xhqhZz8d07u5mFf54RT+s44aPk11WzRrJ2YYVXUOA@mail.gmail.com>
In-Reply-To: <CAGiJk9c52xhqhZz8d07u5mFf54RT+s44aPk11WzRrJ2YYVXUOA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mc: fix configure with automake 1.11.2
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
X-List-Received-Date: Thu, 05 Jan 2012 17:04:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2FtdWFsLA0KICBUaGFuayB5b3UgZm9yIHRoaXMgdXBkYXRlIG9mIGF1dG9tYWtlIGlzc3VlLiBJ
IGFsc28gbm90aWNlIHRoYXQgdGhlIHBhdGNoIHRvIGZpeCBoYXMgZ29uZSBpbiB0aGUgYXV0b21h
a2UgZGV2ZWxvcG1lbnQgYnJhbmNoLiBJIHdpbGwgYWRkIGl0IHRvIG91ciBhdXRvbWFrZSByZWNp
cGUuDQoNCk5pdGluDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBT
YW11ZWwgU3RpcnR6ZWwgW21haWx0bzpzLnN0aXJ0emVsQGdvb2dsZW1haWwuY29tXQ0KPiBTZW50
OiBUaHVyc2RheSwgSmFudWFyeSAwNSwgMjAxMiA3OjA3IEFNDQo+IFRvOiBQYXRjaGVzIGFuZCBk
aXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBDYzogS2FtYmxlLCBOaXRpbiBB
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gbWM6IGZpeCBjb25maWd1cmUg
d2l0aCBhdXRvbWFrZQ0KPiAxLjExLjINCj4gDQo+IDIwMTIvMS80IERleHVhbiBDdWkgPGRleHVh
bi5jdWlAaW50ZWwuY29tPjoNCj4gPiBBcyBOaXRpbiBzYWlkLCAiYXV0b21ha2UgdmVyc2lvbiAx
LjExLjIgaGFzIG1hZGUgdXNlIG9mIGRpciB2YXJpYWJsZXMNCj4gPiBtb3JlIHN0cmljdCwgdGhl
IHBrZ2xpYmV4ZWMgdmFyIGNhbiBub3QgaGF2ZSBTQ1JJUFRTIHN1ZmZpeC4gVXNpbmcNCj4gcGtn
ZGF0YQ0KPiA+IGluc3RlYWQuIg0KPiA+DQo+IEFjdHVhbGx5IHRoaXMgaXMgYSBBdXRvbWFrZSBp
bmNvbnNpc3RlbmN5LCBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8NCj4gdXNlIHBrZ2xpYmV4ZWMg
d2l0aCBTQ1JJUFRTIHN1ZmZpeCBhcyBzdGF0ZWQgaW4gdGhlIG1hbnVhbCBbMV0uDQo+IEFmdGVy
IGV4cGVyaWVuY2luZyBzb21lIGJ1aWxkIGVycm9ycyBvZiB0aGlzIHR5cGUsIHdoaWxlIGJ1aWxk
aW5nDQo+IGNvbW1vbmx5IHVzZWQgc29mdHdhcmUsIEkgc2VhcmNoZWQgYXJvdW5kIGFuZCB0aGlz
IHRocmVhZCBjYW1lIHRvIG15DQo+IGF0dGVudGlvbjoNCj4gaHR0cDovL2xpc3RzLmdudS5vcmcv
YXJjaGl2ZS9odG1sL2F1dG9tYWtlLzIwMTItMDEvbXNnMDAwMDIuaHRtbA0KPiANCj4gWzFdIEF1
dG9tYWtlIHZhcmlhYmxlIHVuaWZvcm1pdHk6DQo+IGh0dHA6Ly93d3cuZ251Lm9yZy9zb2Z0d2Fy
ZS9hdXRvbWFrZS9tYW51YWwvaHRtbF9ub2RlL1VuaWZvcm0uaHRtbA0KPiANCj4gLS0NCj4gUmVn
YXJkcw0KPiBTYW11ZWwNCg==


