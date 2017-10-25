Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1F1171B45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 18:24:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9PIOFqg016872
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Oct 2017 11:24:15 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Wed, 25 Oct 2017 11:24:15 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] qemumips64: no qemu-usermode
	for n32
Thread-Index: AQHTTR8s0kMOz2Cf2U6eCCrAriSAYqL0Hs0AgADBOoCAAGWwgP//m4+g
Date: Wed, 25 Oct 2017 18:24:14 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
	<CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
In-Reply-To: <CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.157.209]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Wed, 25 Oct 2017 18:24:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBmb3VuZCB0aGF0IGxpYm4zMi1nb2JqZWN0LWludHJvc3BlY3Rpb24gd291bGQgbm90IGNvbXBp
bGUgd2l0aG91dCB0aGUgcmVtb3ZlLCBidXQgSSBjb3VsZCBjaGVjayBhZ2Fpbi4gICAgICBKb2UN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJlIE1jQ3VyZHkgW21haWx0
bzphcm1jY3VyZHlAZ21haWwuY29tXSANClNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyNSwgMjAx
NyAxMDoxOSBBTQ0KVG86IEFsZXhhbmRlciBLYW5hdmluDQpDYzogU2xhdGVyLCBKb3NlcGg7IE9F
IENvcmUgbWFpbGluZyBsaXN0DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtvZS1jb3JlXVtQQVRD
SCAxLzFdIHFlbXVtaXBzNjQ6IG5vIHFlbXUtdXNlcm1vZGUgZm9yIG4zMg0KDQpPbiBXZWQsIE9j
dCAyNSwgMjAxNyBhdCA0OjE0IEFNLCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleGFuZGVyLmthbmF2
aW5AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gT24gMTAvMjUvMjAxNyAwMjo0MyBBTSwgQW5k
cmUgTWNDdXJkeSB3cm90ZToNCj4+DQo+PiBPbiBUdWUsIE9jdCAyNCwgMjAxNyBhdCA0OjIzIFBN
LCBKb2UgU2xhdGVyIDxqc2xhdGVyQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gcWVt
dS11c2VybW9kZSBpcyBvbmx5IGF2YWlsYWJsZSBmb3IgbWlwczY0IGFuZCBvMzIgY29kZS4NCj4+
DQo+PiBJc24ndCB0aGF0IGFscmVhZHkgaGFuZGxlZCBieSANCj4+IG1ldGEvY29uZi9tYWNoaW5l
L2luY2x1ZGUvbWlwcy9hcmNoLW1pcHMuaW5jDQo+Pg0KPj4gICAgIyB1c2VyIG1vZGUgcWVtdSBk
b2Vzbid0IHN1cHBvcnQgbWlwczY0IG4zMjogIkludmFsaWQgRUxGIGltYWdlIA0KPj4gZm9yIHRo
aXMgYXJjaGl0ZWN0dXJlIg0KPj4gICAgTUFDSElORV9GRUFUVVJFU19CQUNLRklMTF9DT05TSURF
UkVEX2FwcGVuZCA9ICINCj4+ICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdUVU5FX0ZFQVRVUkVTJywg
J24zMicsICdxZW11LXVzZXJtb2RlJywgJycsIGQpfSINCj4NCj4gWWVzLCBidXQgdGhpcyBpcyBy
ZWFsbHkgdW5yZWFkYWJsZSBpc24ndCBpdCA6KSBJIGRvbid0IHNlZSBob3cgYW55b25lIA0KPiBj
b3VsZCBncmFzcCB0aGF0IHRoZSBhYm92ZSBtZWFucyAicmVtb3ZlIHFlbXUtdXNlcm1vZGUgZnJv
bSANCj4gTUFDSElORV9GRUFUVVJFUyBpZg0KPiBuMzIgaXMgaW4gVFVORV9GRUFUVVJFUyIgKHdp
dGhvdXQgZGl2aW5nIGludG8gZG9jdW1lbnRhdGlvbikuDQo+DQo+IEFueSBiZXR0ZXIgd2F5IHRv
IGV4cHJlc3MgdGhpcyB3b3VsZCBiZSBhcHByZWNpYXRlZC4NCg0KWWVzLCBCQUNLRklMTF9DT05T
SURFUkVEIGFsd2F5cyBoYXMgYmVlbiBjb25jZXB0IHdoaWNoIGJhZmZsZXMgYSBsb3Qgb2YgdXNl
cnMgLSBlc3BlY2lhbGx5IHNvIHNpbmNlIHdlIHF1aWV0bHkgcmVkZWZpbmVkIGl0IHRvIG1lYW4g
bm90IG9ubHkgImZ1bmN0aW9uYWxpdHkgd2hpY2ggdXNlZCB0byBhbHdheXMgYmUgZW5hYmxlZCBi
dXQgaXMgbm93IGNvbmZpZ3VyYWJsZSIgYnV0IG5vdyBhbHNvICJmdW5jdGlvbmFsaXR5IHdoaWNo
IHdhcyBub3QgcHJldmlvdXNseSBlbmFibGVkIGJ1dCBpcyBub3cgY29uZmlndXJhYmxlIGFuZCB3
ZSB3YW50IHRvIGVuYWJsZSBieSBkZWZhdWx0IGFuZCBtYWtlIGl0IGRpZmZpY3VsdCBmb3IgdXNl
cnMgdG8gYWNjaWRlbnRhbGx5IGxlYXZlIGRpc2FibGVkIi4NCg==

