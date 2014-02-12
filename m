Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2DAAB6E8E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 15:23:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2014 07:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,832,1384329600"; d="scan'208";a="454241049"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2014 07:23:39 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 12 Feb 2014 15:23:38 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.202]) by
	IRSMSX152.ger.corp.intel.com ([163.33.192.66]) with mapi id
	14.03.0123.003; Wed, 12 Feb 2014 15:23:38 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 3/3] flac: upgrade to 1.3.0
Thread-Index: AQHPJ8YN0Dp2E1WZZEaCXIOZ1V85tZqxa6UAgABQj9A=
Date: Wed, 12 Feb 2014 15:23:37 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CFEBF0@IRSMSX105.ger.corp.intel.com>
References: <cover.1392189255.git.cristian.iorga@intel.com>
	<667eb5bde49b6a37e220a73df265b7c52c89ac02.1392189255.git.cristian.iorga@intel.com>
	<CAJTo0LY46wAFj+HmnsCx5jN8bp6G9dmJBJu4TDGYTvfWuCno+w@mail.gmail.com>
In-Reply-To: <CAJTo0LY46wAFj+HmnsCx5jN8bp6G9dmJBJu4TDGYTvfWuCno+w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] flac: upgrade to 1.3.0
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
X-List-Received-Date: Wed, 12 Feb 2014 15:23:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gUm9zcywgYWxsLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQpXaWxsIGNvcnJlY3Qg
dGhlIHR5cG8uDQoNCj4gICAgICAgICAgICAgICAgICAtLXdpdGhvdXQteG1tcy1wcmVmaXggXA0K
PiAgICAgICAgICAgICAgICAgIC0td2l0aG91dC14bW1zLWV4ZWMtcHJlZml4IFwNCg0KVG8gbWUg
aXQgc2VlbXMgdGhhdCB0aGlzIGFyZSBzdGlsbCBuZWNlc3NhcnksIGFzIGl0IHByZXZlbnRzIGZy
b20gbG9va2luZyBmb3IgYW4gZXhpc3RlbnQgeG1tcyBwbGF5ZXIuDQpTbyBJIGxlZnQgdGhvc2Ug
aW4uDQpJIHdpbGwgdHJ5IGFuZCBpZiBubyBhZHZlcnNlIGVmZmVjdCBpcyBzZWVuLCBJIHdpbGwg
cmVtb3ZlIHRob3NlIGFsc28uDQoNClJlZ2FyZHMsDQpDcmlzdGlhbiBJb3JnYQ0KWVANCkludGVs
IENvcnBvcmF0aW9uDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJ1cnRv
biwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0gDQpTZW50OiBXZWRuZXNkYXks
IEZlYnJ1YXJ5IDEyLCAyMDE0IDEyOjMyIFBNDQpUbzogSW9yZ2EsIENyaXN0aWFuDQpDYzogT0Ut
Y29yZQ0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMy8zXSBmbGFjOiB1cGdyYWRlIHRv
IDEuMy4wDQoNCk9uIDEyIEZlYnJ1YXJ5IDIwMTQgMDc6NDEsIENyaXN0aWFuIElvcmdhIDxjcmlz
dGlhbi5pb3JnYUBpbnRlbC5jb20+IHdyb3RlOg0KPiAtIFVwZGF0ZWQgZGVzY3JpcHRpb24sIGJ1
Z3RyYWNrZXIgYW5kIHNvdXJjZTsNCj4gLSBTd2l0Y2hlZCB0byAke0JQfSB2YXJpYWJsZTsNCj4g
LSAwMDAxLU5vLUFsdGlWZWMtb24tU1BFLnBhdGNoLA0KPiBmbGFjLWdjYzQzLWZpeGVzLnBhdGNo
LCBhc20tcGljLnBhdGNoLCBvYnNvbGV0ZV9hdXRvbWFrZV9tYWNyb3MucGF0Y2ggDQo+IHBhdGNo
ZXMgcmVtb3ZlZCwgaW5jbHVkZWQgaW4gdXBzdHJlYW07DQo+IC0gTGljZW5zZXMgY2hlY2tzdW1z
IGNoYW5nZWQgZHVlIHRvIGFkZGVkIGNvcHlyaWdodCBvd25lcnMgYW5kIHN0cmVldCANCj4gYWRy
ZXNzZXMgY2hhbmdlZDsNCj4gLSBiYWNrcG9ydGVkIDEuMy4wIHNwZWNpZmljIGZpeDsNCj4gLSBy
ZW1vdmVkIG9ic29sZXRlIFBQQyBmaXg7DQo+IC0gYWRkZWQgc3VwcG9ydCBmb3IgU1NFIG9wdGlt
aXphdGlvbnMuDQoNCkdvdCB0byBsb3ZlIGEgcGF0Y2ggdGhhdCBpcyA5MCUgcmVtb3ZhbHMhDQoN
Cj4gK0RFU0NSSVBUSU9OID0gIkZMQUMgc3RhbmRzIGZvciBGcmVlIExvc3NsZXNzIEF1ZGlvIENv
ZGVjLCBhIGxvc2xlc3MgYXVkaW8gY29tcHJlc3Npb24gZm9ybWF0LiINCg0KImxvc2xlc3MiIGlz
IGEgdHlwby4NCg0KPiAgUyA9ICIke1dPUktESVJ9L2ZsYWMtJHtQVn0iDQoNClRoaXMgaXMgdGhl
IGRlZmF1bHQgc28geW91IGNhbiByZW1vdmUgdGhpcy4NCg0KPiArICAgICAgICAgICAgICAgIC0t
ZGlzYWJsZS14bW1zLXBsdWdpbiBcDQo+ICAgICAgICAgICAgICAgICAgLS13aXRob3V0LXhtbXMt
cHJlZml4IFwNCj4gICAgICAgICAgICAgICAgICAtLXdpdGhvdXQteG1tcy1leGVjLXByZWZpeCBc
DQoNCkRvZXMgdGhlIGFkZGl0aW9uIG9mIC0tZGlzYWJsZSBtZWFuIHlvdSBjYW4gcmVtb3ZlIHRo
ZSB0d28gLS13aXRob3V0IGFyZ3VtZW50cz8NCg0KUm9zcw0K

