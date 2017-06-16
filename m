Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26DC07835C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 01:57:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5G1viP1006372
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 18:57:45 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Thu, 15 Jun 2017 18:57:44 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "BURTON, ROSS" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] ncurses: add SYSROOT_DESTDIR for
	siteconfig_gencache
Thread-Index: AQHS5dNNSEaLfOMVwkyg0JzsrmjvqKImr43g
Date: Fri, 16 Jun 2017 01:57:43 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B7F1F6C@ALA-MBD.corp.ad.wrs.com>
References: <cover.1496218782.git.jackie.huang@windriver.com>
	<22aa14ac1a926e97fb676743cb1e440ff2aaae1f.1496218782.git.jackie.huang@windriver.com>
	<CAJTo0LbG_JMejjRPoK+g4Kq5+G8eszwPj4+oWcUjhpJ4-7esNg@mail.gmail.com>
In-Reply-To: <CAJTo0LbG_JMejjRPoK+g4Kq5+G8eszwPj4+oWcUjhpJ4-7esNg@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.168]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ncurses: add SYSROOT_DESTDIR for siteconfig_gencache
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
X-List-Received-Date: Fri, 16 Jun 2017 01:57:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiANCj4gDQo+IEZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNv
bV0gDQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDE1LCAyMDE3IDIwOjMxDQo+IFRvOiBIdWFuZywg
SmllIChKYWNraWUpDQo+IENjOiBPRS1jb3JlDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BB
VENIIDEvMl0gbmN1cnNlczogYWRkIFNZU1JPT1RfREVTVERJUiBmb3Igc2l0ZWNvbmZpZ19nZW5j
YWNoZQ0KPiANCj4gDQo+IE9uIDMxIE1heSAyMDE3IGF0IDA5OjI3LCA8amFja2llLmh1YW5nQHdp
bmRyaXZlci5jb20+IHdyb3RlOg0KPiArRVhUUkFTSVRFQ09ORklHID0gIkNGTEFHUz0nJHtDRkxB
R1N9IC1JJHtTWVNST09UX0RFU1RESVJ9JHtpbmNsdWRlZGlyfSciDQo+IA0KPiBXaHkgaXMgdGhp
cyBuY3Vyc2VzIHNwZWNpZmljLCBpdCBzb3VuZHMgbGlrZSBzb21ldGhpbmcgd2hpY2ggd2lsbCBp
bXBhY3QgYWxsIHVzZXJzIG9mIHNpdGVjb25maWc/DQoNCk15IG9yaWdpbmFsIGlzc3VlIGlzIG5v
dCBuY3Vyc2VzIHNwZWNpZmljLCB0aGF0IGlzOg0KQWZ0ZXIgc3dpdGNoaW5nIHRvIFJTUywgdGhl
IHNpdGVjb25maWcgY2FjaGUgZmlsZXMgaW4gQUNMT0NBTERJUiBzZXR1cCBieSBhdXRvdG9vbHMu
YmJjbGFzcyB3YXMgZHJvcHBlZCwgc28gc2VhcmNoaW5nDQp0aGUgcGF0aCBBQ0xPQ0FMRElSIGZv
ciBzaXRlY29uZmlnIGZpbGVzIGVuZGVkIHVwIHdpdGggbm90aGluZywgd2hpY2ggY2F1c2VkIHNv
bWUgcGFja2FnZSAobGlrZSBvcGVuaHBpKSBmYWlsIHRvIGNvbmZpZ3VyZSwgDQpzbyB0aGUgIlBB
VENIIDIvMiIgY2hhbmdlIGl0IGJhY2sgdG8gc2VhcmNoIFNJVEVDT05GSUdfU1lTUk9PVENBQ0hF
Lg0KDQpCdXQgSSBtZXQgdGhlIHNlY29uZCBpc3N1ZSBhZnRlciB0aGUgdGhhdDoNCnV0aWwtbGlu
dXggZGVwZW5kcyBvbiBuY3Vyc2VzIGJ1dCB0aGUgc2l0ZWluZm8gaW4gbmN1cnNlc19jb25maWcg
d2hpY2ggaXMgcG9wdWxhdGVkIHRvIFNJVEVDT05GSUdfU1lTUk9PVENBQ0hFICBpcyBub3QgY29y
cmVjdDoNCmFjX2N2X2hlYWRlcl9jdXJzZXNfaD0ke2FjX2N2X2hlYWRlcl9jdXJzZXNfaD1ub30N
CmFjX2N2X2hlYWRlcl9uY3Vyc2VzX2g9JHthY19jdl9oZWFkZXJfbmN1cnNlc19oPW5vfQ0KDQp0
aGVuIGl0IGZhaWxzIHRvIGJ1aWxkIChpdCBzaG91bGQgYmUgdGhlIHNhbWUgaXNzdWUgZm9yIG90
aGVyIHBhY2thZ2UgdGhhdCBkZXBlbmQgb24gbmN1cnNlcyksIHNvIHRoaXMgcGF0Y2ggaXMgbmVl
ZGVkLg0KQW5kIHRoZSBwYXRjaCB3aWxsIG9ubHkgaW1wYWN0IHRoZSBwYWNrYWdlcyB0aGF0IGRl
cGVuZCBvbiBuY3Vyc2VzLCBmb3IgdGhvc2Ugd2l0aG91dCBkZXBlbmRlbmN5IG9uIG5jdXJzZXMs
IHRoZXJlIA0KaXMgbm8gbmN1cnNlc19jb25maWcgYXQgYWxsIGluIHRoZWlyIG93biByZWNpcGUt
c3lzcm9vdC4NCg0KVGhhbmtzLA0KSmFja2llDQoNCj4gDQo+IFJvc3MNCj4NCg==

