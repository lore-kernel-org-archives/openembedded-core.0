Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1Uckxd-00033S-29
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 01:18:49 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4FN02sv021615
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2013 16:00:02 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.88]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0342.003;
	Wed, 15 May 2013 16:00:02 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] [PATCH 1/1] zlib: put shared libraries in base_libdir
Thread-Index: AQHOUW2KTs0OFuwDAk6jnMjBV1KVjJkGpy4wgACFYwD//6/6oA==
Date: Wed, 15 May 2013 23:00:01 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8436FC7D46@ALA-MBA.corp.ad.wrs.com>
References: <1368574528-28247-1-git-send-email-jslater@windriver.com>
	<1368574528-28247-2-git-send-email-jslater@windriver.com>
	<1368611695.6920.79.camel@phil-desktop.brightsign>
	<519388C2.5000706@windriver.com>
	<007BD92917A2324FA403BCF9A464CF8436FC7C27@ALA-MBA.corp.ad.wrs.com>
	<1368650688.16243.142.camel@pb-ThinkPad-R50e>
In-Reply-To: <1368650688.16243.142.camel@pb-ThinkPad-R50e>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] zlib: put shared libraries in base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 23:18:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbCBCbHVuZGVsbCBb
bWFpbHRvOnBiQHBiY2wubmV0XQ0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAxNSwgMjAxMyAxOjQ1
IFBNDQo+IFRvOiBTbGF0ZXIsIEpvc2VwaA0KPiBDYzogSGF0bGUsIE1hcms7IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0ggMS8xXSB6bGliOiBwdXQgc2hhcmVkIGxpYnJhcmllcyBpbiBiYXNlX2xpYmRpcg0KPiAN
Cj4gT24gV2VkLCAyMDEzLTA1LTE1IGF0IDE5OjUwICswMDAwLCBTbGF0ZXIsIEpvc2VwaCB3cm90
ZToNCj4gPiBZZXMsIHRoaXMgaXMgaXQ6DQo+ID4NCj4gPiBXQVJOSU5HOiBRQSBJc3N1ZTogbGli
cGFtOiAvbGliNjQvc2VjdXJpdHkvcGFtX2NyYWNrbGliLnNvLCBpbnN0YWxsZWQgaW4gdGhlDQo+
IGJhc2VfcHJlZml4LA0KPiA+IHJlcXVpcmVzIGEgc2hhcmVkIGxpYnJhcnkgdW5kZXIgZXhlY19w
cmVmaXgNCj4gPiAoL3Vzcik6IGxpYnouc28uMSA9PiAvdXNyL2xpYjY0L2xpYnouc28uMSAoMHgw
MDAwMDAwMGRlYWQ1MDAwKQ0KPiANCj4gUHJlc3VtYWJseSBwYW1fY3JhY2tsaWIuc28gY2FuJ3Qg
Z28gaW4gL3VzciBkdWUgdG8gcmVhc29ucywgcmlnaHQ/DQoNCk1heWJlIGl0IGNvdWxkLCBidXQg
YWxsIG9mIGl0cyBidWRkaWVzIGFyZSBpbiAvbGliNjQvc2VjdXJpdHkgYW5kIGl0IG1pZ2h0DQpn
ZXQgbG9uZWx5LiAgQXQgbGVhc3Qgd2Uga25vdyB0aGF0IG1vdmluZyBsaWJ6LnNvLiogZG9lcyBu
b3QgY2F1c2UgYW55DQpuZXcgcHJvYmxlbXMgYmVjYXVzZSB0aGF0J3MgaG93IHdlJ3ZlIGJlZW4g
YnVpbGRpbmcgZm9yIGEgbG9uZyB0aW1lLg0KDQpKb2UNCg0KDQo+IA0KPiBwLg0KPiANCg0K


