Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 36C9461619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 09:04:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2013 02:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,785,1367996400"; d="scan'208";a="354775489"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 02:04:17 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 31 Jul 2013 10:04:16 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.218]) with mapi id
	14.03.0123.003; Wed, 31 Jul 2013 10:04:16 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] base-files: remove symbolic link from
	/etc/mtab to /proc/mounts
Thread-Index: AQHOjcqbrrZOX/kC+UyocwWRoTyOPJl+bcSA
Date: Wed, 31 Jul 2013 09:04:14 +0000
Message-ID: <1375261509.2348.4.camel@firebird.rb.intel.com>
References: <1375258783-9009-1-git-send-email-B40290@freescale.com>
	<51F8CEFF.2050406@windriver.com>
In-Reply-To: <51F8CEFF.2050406@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.73]
MIME-Version: 1.0
Subject: Re: [PATCH] base-files: remove symbolic link from /etc/mtab to /proc/mounts
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
X-List-Received-Date: Wed, 31 Jul 2013 09:04:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C664D8A3BE821C40ACDAF4F5433C5247@intel.com>
Content-Transfer-Encoding: base64

DQoNCk9uIFdlZCwgMjAxMy0wNy0zMSBhdCAxNjo0NiArMDgwMCwgQ2hlblFpIHdyb3RlOg0KPiBP
biAwNy8zMS8yMDEzIDA0OjE5IFBNLCBDaHVucm9uZyBHdW8gd3JvdGU6DQo+ID4gICAgICAqSWYg
L2V0Yy9tdGFiIGlzIGEgc3ltbGluayB0byAvcHJvYy9zZWxmL21vdW50cywNCj4gPiAgICAgICBt
b3VudGluZyBmYWlscyBiZWNhdXNlIGFkZG1udGVudCByZXR1cm5zIGFuIGVycm9yLg0KPiA+ICAg
ICAgIEFzIGEgY29uc2VxdWVuY2UsIHRoZSBQcml2YXRlIGRpcmVjdG9yeSBpcyB1bnVzYWJsZQ0K
PiA+ICAgICAgIGJlY2F1c2UgL3Byb2Mvc2VsZi9tb3VudHMgaXMgcmVhZC1vbmx5IGZlYXR1cmUu
DQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGRldGFpbCB5b3VyIGVudmlyb25tZW50IGEgbGl0dGxl
IGJpdD8NCj4gV2hlcmUgZG9lcyB0aGlzIGVycm9yIGNvbWUgZnJvbT8NCj4gDQoNCkknbSBjdXJp
b3MgYXMgd2VsbC4gQWxzbyBjYW4geW91IHBsZWFzZSB0ZXN0IHRoaXMgb24gYSByZWFsIGh3PyBU
cnkgdG8NCmJvb3QgYW5kL29yIGluc3RhbGwgYW4gaW1hZ2Ugb24gYXRvbS1wYywgSSBzdXNwZWN0
IGl0IHdpbGwgZmFpbC4NCg0KVGhhbmtzLA0KU3RlZmFuDQoNCg0KPiBCZXNpZGVzLCBpZiB5b3Un
cmUgZ29pbmcgdG8gbWFrZSB0aGlzIGNoYW5nZSwgcGxlYXNlIHRha2UgYSByZWFkLW9ubHkgDQo+
IHJvb3RmcyBpbnRvIGNvbnNpZGVyYXRpb24uIFRoZXJlIHNob3VsZCBiZSBtb3JlIHRvIGZpeC4N
Cj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gQ2hlbiBRaQ0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBD
aHVucm9uZyBHdW8gPEI0MDI5MEBmcmVlc2NhbGUuY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS9y
ZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzXzMuMC4xNC5iYiB8ICAgIDEgLQ0KPiA+
ICAgMSBmaWxlcyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVz
XzMuMC4xNC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFzZS1maWxlc18zLjAu
MTQuYmINCj4gPiBpbmRleCAwNTRmZWZhLi4xODQzYmRkIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFzZS1maWxlc18zLjAuMTQuYmINCj4gPiArKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXNfMy4wLjE0LmJiDQo+ID4gQEAg
LTEwMCw3ICsxMDAsNiBAQCBkb19pbnN0YWxsICgpIHsNCj4gPiAgIAlpbnN0YWxsIC1tIDA2NDQg
JHtXT1JLRElSfS9ob3N0LmNvbmYgJHtEfSR7c3lzY29uZmRpcn0vaG9zdC5jb25mDQo+ID4gICAJ
aW5zdGFsbCAtbSAwNjQ0ICR7V09SS0RJUn0vbW90ZCAke0R9JHtzeXNjb25mZGlyfS9tb3RkDQo+
ID4gICANCj4gPiAtCWxuIC1zZiAvcHJvYy9tb3VudHMgJHtEfSR7c3lzY29uZmRpcn0vbXRhYg0K
PiA+ICAgfQ0KPiA+ICAgDQo+ID4gICBkb19pbnN0YWxsX2Jhc2VmaWxlc2lzc3VlICgpIHsNCj4g
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9w
ZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg0K

