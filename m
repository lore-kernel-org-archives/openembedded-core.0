Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98BC3771B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 19:02:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Feb 2016 11:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; d="scan'208";a="891963640"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2016 11:02:12 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.159]) by
	ORSMSX104.amr.corp.intel.com ([169.254.4.171]) with mapi id
	14.03.0248.002; Mon, 22 Feb 2016 11:02:09 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] buildstats.bbclass: Don't assume
	/proc/<pid>/io present
Thread-Index: AQHRa4Eij7irNPt0mkusi6PGsVQEYZ811HOAgAKYfJA=
Date: Mon, 22 Feb 2016 19:02:09 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6117EE357@ORSMSX112.amr.corp.intel.com>
References: <1455932242-852-1-git-send-email-juro.bystricky@intel.com>
	<1455932242-852-2-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spv9JiMA4CZnnFE=3TAxF_e_dOAAnntVYH5E9V+GFQ0qA@mail.gmail.com>
In-Reply-To: <CAMKF1spv9JiMA4CZnnFE=3TAxF_e_dOAAnntVYH5E9V+GFQ0qA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildstats.bbclass: Don't assume /proc/<pid>/io present
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
X-List-Received-Date: Mon, 22 Feb 2016 19:02:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBhZ3JlZSwgdGhlIG1lc3NhZ2UgY2FuIGJlIGNvbmZ1c2luZywgYXMgdGhlcmUgY2FuIGJlIHNv
bWUgYW1iaWd1aXR5IGFzIHRvIHdoaWNoIGtlcm5lbA0Kd2FzIGltcGxpZWQgYnkgdGhlIHdhcm5p
bmcuDQoNClJpZ2h0IG5vdyBpdCBzYXlzOg0KV0FSTklORzogVGhlIExpbnV4IGtlcm5lbCB3YXMg
bm90IGNvbmZpZ3VyZWQgdG8gcHJvdmlkZSAuLi4uDQpBcyB5b3Ugc3VnZ2VzdGVkLCBJIHdpbGwg
Y2hhbmdlIGl0IHRvOg0KV0FSTklORzogVGhlIExpbnV4IGtlcm5lbCBvbiB5b3VyIGJ1aWxkIGhv
c3Qgd2FzIG5vdCBjb25maWd1cmVkIHRvIHByb3ZpZGUuLi4NCg0KVGhhbmtzDQoNCkp1cm8NCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0bzpyYWou
a2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFNhdHVyZGF5LCBGZWJydWFyeSAyMCwgMjAxNiAxMTox
MyBBTQ0KPiBUbzogQnlzdHJpY2t5LCBKdXJvIDxqdXJvLmJ5c3RyaWNreUBpbnRlbC5jb20+DQo+
IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8b3Bl
bmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBKdXJvIEJ5c3RyaWNr
eSA8anVyb2J5c3RyaWNreUBob3RtYWlsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBb
UEFUQ0hdIGJ1aWxkc3RhdHMuYmJjbGFzczogRG9uJ3QgYXNzdW1lIC9wcm9jLzxwaWQ+L2lvDQo+
IHByZXNlbnQNCj4gDQo+IEp1cm8NCj4gDQo+IE9uIEZyaSwgRmViIDE5LCAyMDE2IGF0IDU6Mzcg
UE0sIEp1cm8gQnlzdHJpY2t5IDxqdXJvLmJ5c3RyaWNreUBpbnRlbC5jb20+DQo+IHdyb3RlOg0K
PiA+IEl0IGlzIG5vdCBndWFyYW50ZWVkIExpbnV4IGtlcm5lbCB3YXMgY29uZmlndXJlZCB3aXRo
IHByb2Nlc3MgSS9PDQo+ID4gc3RhdGlzdGljcyBlbmFibGVkLiBJZiBwcm9jZXNzIEkvTyBzdGF0
aXN0Y3MgYXJlIG5vdCBwcmVzZW50LCBpc3N1ZSBhDQo+ID4gb25lIHRpbWUgd2FybmluZyBhbmQg
ZG8gbm90IGF0dGVtcHQgdG8gcmVhZCB0aGUgbm9uLWV4aXN0aW5nIHN0YXRzDQo+ID4gY291bnRl
cnMuDQo+ID4NCj4gPiBbWU9DVE8jOTAyNV0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEp1cm8g
QnlzdHJpY2t5IDxqdXJvLmJ5c3RyaWNreUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEv
Y2xhc3Nlcy9idWlsZHN0YXRzLmJiY2xhc3MgfCAyNCArKysrKysrKysrKysrKysrLS0tLS0tLS0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2J1aWxkc3RhdHMuYmJjbGFzcw0KPiA+
IGIvbWV0YS9jbGFzc2VzL2J1aWxkc3RhdHMuYmJjbGFzcyBpbmRleCBlNThkMzdiLi43MmEzZGQ5
IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9idWlsZHN0YXRzLmJiY2xhc3MNCj4gPiAr
KysgYi9tZXRhL2NsYXNzZXMvYnVpbGRzdGF0cy5iYmNsYXNzDQo+ID4gQEAgLTI1LDEzICsyNSwx
NCBAQCBkZWYgZ2V0X3Byb2Nlc3NfY3B1dGltZShwaWQpOg0KPiA+ICAgICAgICAgICdjc3RpbWUn
IDogZmllbGRzWzE2XSwNCj4gPiAgICAgIH0NCj4gPiAgICAgIGlvc3RhdHMgPSB7fQ0KPiA+IC0g
ICAgd2l0aCBvcGVuKCIvcHJvYy8lZC9pbyIgJSBwaWQsICJyIikgYXMgZjoNCj4gPiAtICAgICAg
ICB3aGlsZSBUcnVlOg0KPiA+IC0gICAgICAgICAgICBpID0gZi5yZWFkbGluZSgpLnN0cmlwKCkN
Cj4gPiAtICAgICAgICAgICAgaWYgbm90IGk6DQo+ID4gLSAgICAgICAgICAgICAgICBicmVhaw0K
PiA+IC0gICAgICAgICAgICBpID0gaS5zcGxpdCgiOiAiKQ0KPiA+IC0gICAgICAgICAgICBpb3N0
YXRzW2lbMF1dID0gaVsxXQ0KPiA+ICsgICAgaWYgb3MucGF0aC5pc2ZpbGUoIi9wcm9jLyVkL2lv
IiAlIHBpZCk6DQo+ID4gKyAgICAgICAgd2l0aCBvcGVuKCIvcHJvYy8lZC9pbyIgJSBwaWQsICJy
IikgYXMgZjoNCj4gPiArICAgICAgICAgICAgd2hpbGUgVHJ1ZToNCj4gPiArICAgICAgICAgICAg
ICAgIGkgPSBmLnJlYWRsaW5lKCkuc3RyaXAoKQ0KPiA+ICsgICAgICAgICAgICAgICAgaWYgbm90
IGk6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWsNCj4gPiArICAgICAgICAgICAgICAg
IGkgPSBpLnNwbGl0KCI6ICIpDQo+ID4gKyAgICAgICAgICAgICAgICBpb3N0YXRzW2lbMF1dID0g
aVsxXQ0KPiA+ICAgICAgcmVzb3VyY2VzID0gcmVzb3VyY2UuZ2V0cnVzYWdlKHJlc291cmNlLlJV
U0FHRV9TRUxGKQ0KPiA+ICAgICAgY2hpbGRyZXMgPSByZXNvdXJjZS5nZXRydXNhZ2UocmVzb3Vy
Y2UuUlVTQUdFX0NISUxEUkVOKQ0KPiA+ICAgICAgcmV0dXJuIHN0YXRzLCBpb3N0YXRzLCByZXNv
dXJjZXMsIGNoaWxkcmVzIEBAIC0xMTEsNyArMTEyLDE0IEBADQo+ID4gcHl0aG9uIHJ1bl9idWls
ZHN0YXRzICgpIHsNCj4gPg0KPiA+ICAgICAgaWYgaXNpbnN0YW5jZShlLCBiYi5ldmVudC5CdWls
ZFN0YXJ0ZWQpOg0KPiA+DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+ICMjIyMjIyMNCj4gPiAtICAgICAgICAjIGF0
IGZpcnN0IHBhc3MgbWFrZSB0aGUgYnVpbGRzdGF0cyBoZXJpYXJjaHkgYW5kIHRoZW4NCj4gPiAr
ICAgICAgICAjIElmIHRoZSBrZXJuZWwgd2FzIG5vdCBjb25maWd1cmVkIHRvIHByb3ZpZGUgSS9P
IHN0YXRpc3RpY3MsIGlzc3VlDQo+ID4gKyAgICAgICAgIyBhIG9uZSB0aW1lIHdhcm5pbmcuDQo+
ID4gKw0KPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIw0KPiAjIyMjIyMjDQo+ID4gKyAgICAgICAgaWYgbm90IG9zLnBhdGgu
aXNmaWxlKCIvcHJvYy8lZC9pbyIgJSBvcy5nZXRwaWQoKSk6DQo+ID4gKyAgICAgICAgICAgIGJi
Lndhcm4oIlRoZSBMaW51eCBrZXJuZWwgd2FzIG5vdCBjb25maWd1cmVkIHRvIHByb3ZpZGUNCj4g
PiArIHByb2Nlc3MgSS9PIHN0YXRpc3RpY3MuIChDT05GSUdfVEFTS19JT19BQ0NPVU5USU5HIGlz
IG5vdCBzZXQpIikNCj4gPiArDQo+IA0KPiBJdCB3b3VsZCBiZSBuaWNlciBpZiB3ZSBhbHNvIGNs
YXJpZmllZCBpdHMgbm90IHRoZSBrZXJuZWwgdGhhdCB0aGV5IHdpbGwgYnVpbGQgYnV0IHRoZQ0K
PiBrZXJuZWwgb24gdGhlaXIgYnVpbGQgaG9zdC4gU28gc29tZXRoaW5nIGxpa2UgJ0xpbnV4IGtl
cm5lbCBvbiB5b3VyIGJ1aWxkIGhvc3QgLi4uLiINCj4gDQo+ID4gKw0KPiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPiAj
IyMjIyMjDQo+ID4gKyAgICAgICAgIyBhdCBmaXJzdCBwYXNzIG1ha2UgdGhlIGJ1aWxkc3RhdHMg
aGllcmFyY2h5IGFuZCB0aGVuDQo+ID4gICAgICAgICAgIyBzZXQgdGhlIGJ1aWxkbmFtZQ0KPiA+
DQo+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjDQo+ICMjIyMjIyMNCj4gPiAgICAgICAgICBiYi51dGlscy5ta2RpcmhpZXIo
YnNkaXIpDQo+ID4gLS0NCj4gPiAxLjkuMQ0KPiA+DQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1jb3Jl
IG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5lbWJlZGRlZC1jb3JlDQo=

